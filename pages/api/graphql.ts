import { ApolloServer, gql } from "apollo-server-micro";

const typeDefs = gql`
  type Query {
    ideas(limit: Int!, offset: Int): [Idea]
  }

  type Idea {
    text: String!
  }
`;

const resolvers = {
  Query: {
    ideas: () => {
      return [
        {
          text: "bleh",
        },
      ];
    },
  },
};

const server = new ApolloServer({ typeDefs, resolvers, playground: true });

export const config = {
  api: {
    bodyParser: false,
  },
};

export default server.createHandler({ path: "/api/graphql" });

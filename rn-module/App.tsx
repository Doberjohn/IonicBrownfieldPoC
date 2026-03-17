import { View, Text, StyleSheet, Pressable, Alert } from "react-native";
import ReactNativeBrownfield from "@callstack/react-native-brownfield";

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Hello from React Native</Text>
      <Text style={styles.subtitle}>
        This screen is rendered natively via react-native-brownfield.
      </Text>
      <Text style={styles.subtitle}>
        It lives inside an Ionic + Capacitor app.
      </Text>
      <View style={styles.badge}>
        <Text style={styles.badgeText}>Brownfield PoC</Text>
      </View>
      <Pressable
        style={styles.closeButton}
        onPress={() => ReactNativeBrownfield.postMessage("dismiss")}
      >
        <Text style={styles.closeButtonText}>Close</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#FFFFFF",
    padding: 32,
  },
  title: {
    fontSize: 28,
    fontWeight: "700",
    color: "#1a1a1a",
    marginBottom: 12,
  },
  subtitle: {
    fontSize: 16,
    color: "#666666",
    textAlign: "center",
    lineHeight: 24,
  },
  badge: {
    marginTop: 32,
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderRadius: 20,
    backgroundColor: "#E8F5E9",
  },
  badgeText: {
    fontSize: 14,
    fontWeight: "600",
    color: "#2E7D32",
  },
  closeButton: {
    marginTop: 24,
    paddingHorizontal: 32,
    paddingVertical: 12,
    borderRadius: 8,
    backgroundColor: "#1a1a1a",
  },
  closeButtonText: {
    fontSize: 16,
    fontWeight: "600",
    color: "#FFFFFF",
  },
});

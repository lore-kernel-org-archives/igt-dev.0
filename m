Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1D910E18B
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 10:24:54 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 12:24:32 +0200
Message-Id: <20221031102434.2250160-5-petri.latvala@intel.com>
In-Reply-To: <20221031102434.2250160-1-petri.latvala@intel.com>
References: <20221031102434.2250160-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/7] lib/tests: Add unit tests for socket
 communication packet creation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test that packet fields get dumped and read correctly to the same
fields, and test that invalid packets get rejected.

v2: Flesh out commit message (Kamil)

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/tests/igt_runnercomms_packets.c | 263 ++++++++++++++++++++++++++++
 lib/tests/meson.build               |   1 +
 2 files changed, 264 insertions(+)
 create mode 100644 lib/tests/igt_runnercomms_packets.c

diff --git a/lib/tests/igt_runnercomms_packets.c b/lib/tests/igt_runnercomms_packets.c
new file mode 100644
index 00000000..167ad8e6
--- /dev/null
+++ b/lib/tests/igt_runnercomms_packets.c
@@ -0,0 +1,263 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include "runnercomms.h"
+
+#include "igt_core.h"
+
+static void igt_assert_eqstr(const char *one, const char *two)
+{
+	if (one == NULL && two == NULL)
+		return;
+
+	igt_assert_f(one != NULL && two != NULL, "Strings differ (one is NULL): %s vs %s\n", one, two);
+
+	igt_assert_f(!strcmp(one, two), "Strings differ: '%s' vs '%s'\n", one, two);
+}
+
+
+static const uint8_t num8 = 5;
+static const int32_t num32 = -67;
+static const char *text1 = "Text one";
+static const char *text2 = "Text two";
+static const char *text3 = "Text three";
+static const char *text4 = "Text four";
+
+static struct runnerpacket *create_log(void)
+{
+	return runnerpacket_log(num8, text1);
+}
+
+static void validate_log(struct runnerpacket *packet)
+{
+	runnerpacket_read_helper helper;
+
+	helper = read_runnerpacket(packet);
+
+	igt_assert_eq(packet->type, PACKETTYPE_LOG);
+	igt_assert_eq(helper.type, PACKETTYPE_LOG);
+
+	igt_assert_eq(helper.log.stream, num8);
+	igt_assert_eqstr(helper.log.text, text1);
+}
+
+static struct runnerpacket *create_exec(void)
+{
+	char *argv[] = { strdup(text1), strdup(text2), strdup(text3), strdup(text4), NULL };
+	struct runnerpacket *packet;
+
+	packet = runnerpacket_exec(argv);
+
+	free(argv[0]);
+	free(argv[1]);
+	free(argv[2]);
+	free(argv[3]);
+
+	return packet;
+}
+
+static void validate_exec(struct runnerpacket *packet)
+{
+	runnerpacket_read_helper helper;
+	char cmpstr[256];
+
+	helper = read_runnerpacket(packet);
+
+	igt_assert_eq(packet->type, PACKETTYPE_EXEC);
+	igt_assert_eq(helper.type, PACKETTYPE_EXEC);
+
+	snprintf(cmpstr, sizeof(cmpstr), "%s %s %s %s", text1, text2, text3, text4);
+	igt_assert_eqstr(helper.exec.cmdline, cmpstr);
+}
+
+static struct runnerpacket *create_exit(void)
+{
+	return runnerpacket_exit(num32, text1);
+}
+
+static void validate_exit(struct runnerpacket *packet)
+{
+	runnerpacket_read_helper helper;
+
+	helper = read_runnerpacket(packet);
+
+	igt_assert_eq(packet->type, PACKETTYPE_EXIT);
+	igt_assert_eq(helper.type, PACKETTYPE_EXIT);
+
+	igt_assert_eq(helper.exit.exitcode, num32);
+	igt_assert_eqstr(helper.exit.timeused, text1);
+}
+
+static struct runnerpacket *create_subtest_start(void)
+{
+	return runnerpacket_subtest_start(text1);
+}
+
+static void validate_subtest_start(struct runnerpacket *packet)
+{
+	runnerpacket_read_helper helper;
+
+	helper = read_runnerpacket(packet);
+
+	igt_assert_eq(packet->type, PACKETTYPE_SUBTEST_START);
+	igt_assert_eq(helper.type, PACKETTYPE_SUBTEST_START);
+
+	igt_assert_eqstr(helper.subteststart.name, text1);
+}
+
+static struct runnerpacket *create_subtest_result(void)
+{
+	return runnerpacket_subtest_result(text1, text2, text3, text4);
+}
+
+static void validate_subtest_result(struct runnerpacket *packet)
+{
+	runnerpacket_read_helper helper;
+
+	helper = read_runnerpacket(packet);
+
+	igt_assert_eq(packet->type, PACKETTYPE_SUBTEST_RESULT);
+	igt_assert_eq(helper.type, PACKETTYPE_SUBTEST_RESULT);
+
+	igt_assert_eqstr(helper.subtestresult.name, text1);
+	igt_assert_eqstr(helper.subtestresult.result, text2);
+	igt_assert_eqstr(helper.subtestresult.timeused, text3);
+	igt_assert_eqstr(helper.subtestresult.reason, text4);
+}
+
+static struct runnerpacket *create_dynamic_subtest_start(void)
+{
+	return runnerpacket_dynamic_subtest_start(text1);
+}
+
+static void validate_dynamic_subtest_start(struct runnerpacket *packet)
+{
+	runnerpacket_read_helper helper;
+
+	helper = read_runnerpacket(packet);
+
+	igt_assert_eq(packet->type, PACKETTYPE_DYNAMIC_SUBTEST_START);
+	igt_assert_eq(helper.type, PACKETTYPE_DYNAMIC_SUBTEST_START);
+
+	igt_assert_eqstr(helper.dynamicsubteststart.name, text1);
+}
+
+static struct runnerpacket *create_dynamic_subtest_result(void)
+{
+	return runnerpacket_dynamic_subtest_result(text1, text2, text3, text4);
+}
+
+static void validate_dynamic_subtest_result(struct runnerpacket *packet)
+{
+	runnerpacket_read_helper helper;
+
+	helper = read_runnerpacket(packet);
+
+	igt_assert_eq(packet->type, PACKETTYPE_DYNAMIC_SUBTEST_RESULT);
+	igt_assert_eq(helper.type, PACKETTYPE_DYNAMIC_SUBTEST_RESULT);
+
+	igt_assert_eqstr(helper.dynamicsubtestresult.name, text1);
+	igt_assert_eqstr(helper.dynamicsubtestresult.result, text2);
+	igt_assert_eqstr(helper.dynamicsubtestresult.timeused, text3);
+	igt_assert_eqstr(helper.dynamicsubtestresult.reason, text4);
+}
+
+static struct runnerpacket *create_versionstring(void)
+{
+	return runnerpacket_versionstring(text1);
+}
+
+static void validate_versionstring(struct runnerpacket *packet)
+{
+	runnerpacket_read_helper helper;
+
+	helper = read_runnerpacket(packet);
+
+	igt_assert_eq(packet->type, PACKETTYPE_VERSIONSTRING);
+	igt_assert_eq(helper.type, PACKETTYPE_VERSIONSTRING);
+
+	igt_assert_eqstr(helper.versionstring.text, text1);
+}
+
+static struct runnerpacket *create_result_override(void)
+{
+	return runnerpacket_resultoverride(text1);
+}
+
+static void validate_result_override(struct runnerpacket *packet)
+{
+	runnerpacket_read_helper helper;
+
+	helper = read_runnerpacket(packet);
+
+	igt_assert_eq(packet->type, PACKETTYPE_RESULT_OVERRIDE);
+	igt_assert_eq(helper.type, PACKETTYPE_RESULT_OVERRIDE);
+
+	igt_assert_eqstr(helper.resultoverride.result, text1);
+}
+
+struct {
+	struct runnerpacket * (*create)(void);
+	void (*validate)(struct runnerpacket *packet);
+} basic_creation[] = {
+		      { create_log, validate_log },
+		      { create_exec, validate_exec },
+		      { create_exit, validate_exit },
+		      { create_subtest_start, validate_subtest_start },
+		      { create_subtest_result, validate_subtest_result },
+		      { create_dynamic_subtest_start, validate_dynamic_subtest_start },
+		      { create_dynamic_subtest_result, validate_dynamic_subtest_result },
+		      { create_versionstring, validate_versionstring },
+		      { create_result_override, validate_result_override },
+		      { NULL, NULL }
+};
+
+igt_main
+{
+	igt_subtest("create-and-parse-normal") {
+		for (typeof (*basic_creation) *t = basic_creation; t->create; t++) {
+			struct runnerpacket *packet;
+
+			packet = t->create();
+			igt_assert(packet != NULL);
+			igt_assert(packet->type != PACKETTYPE_INVALID);
+			t->validate(packet);
+		}
+	}
+
+	igt_subtest("packet-too-short") {
+		struct runnerpacket *packet;
+		runnerpacket_read_helper helper;
+
+		packet = runnerpacket_log(1, "Hello");
+		igt_assert(packet != NULL);
+		igt_assert_eq(packet->type, PACKETTYPE_LOG);
+
+		packet->size = 4; /* not even sizeof(*packet) */
+		helper = read_runnerpacket(packet);
+		igt_assert_eq(helper.type, PACKETTYPE_INVALID);
+
+		free(packet);
+	}
+
+	igt_subtest("nul-termination-missing") {
+		/* Parsing should reject the packet when nul-termination is missing */
+		struct runnerpacket *packet;
+		runnerpacket_read_helper helper;
+
+		uint8_t num = 1;
+		const char *text = "This is text";
+		packet = runnerpacket_log(num, text);
+		igt_assert(packet != NULL);
+		igt_assert_eq(packet->type, PACKETTYPE_LOG);
+
+		/* make the packet too short to include the nul-termination in the string */
+		packet->size -= 2;
+		helper = read_runnerpacket(packet);
+		igt_assert_eq(helper.type, PACKETTYPE_INVALID);
+
+		free(packet);
+	}
+}
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index d5666c24..7a52a787 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -14,6 +14,7 @@ lib_tests = [
 	'igt_invalid_subtest_name',
 	'igt_nesting',
 	'igt_no_exit',
+	'igt_runnercomms_packets',
 	'igt_segfault',
 	'igt_simulation',
 	'igt_stats',
-- 
2.30.2

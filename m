Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B79810E152
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 05:23:50 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Tue, 15 Feb 2022 10:53:47 +0530
Message-Id: <20220215052347.21306-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ringfill: Added test
 description for test case.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Added test description to test and subtest.

Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_ringfill.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index ecfa0bea..0d86141b 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -51,6 +51,9 @@
 #define HIBERNATE 0x40
 #define NEWFD 0x80
 
+IGT_TEST_DESCRIPTION(" This test does many tiny batchbuffer operations to catch"
+		"errors while ring is near full.");
+
 static unsigned int ring_size;
 
 static void check_bo(int fd, uint32_t handle)
@@ -371,6 +374,9 @@ igt_main
 		}
 	}
 
+
+	igt_describe("Test runs on all available engines simultaniously and"
+			" checks how the driver handles a full ring.");
 	igt_subtest("basic-all") {
 		const struct intel_execution_engine2 *e;
 		intel_allocator_multiprocess_start();
-- 
2.35.0

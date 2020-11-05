Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3D89D4F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2020 04:29:43 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Thu,  5 Nov 2020 09:58:51 +0530
Message-Id: <20201105042851.19770-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] Added test description for test case.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, sai.gowtham.ch@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added test description to test and basic-all subtest

Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_ringfill.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index c499cb0d..aebbd15a 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -50,6 +50,9 @@
 #define HIBERNATE 0x40
 #define NEWFD 0x80
 
+IGT_TEST_DESCRIPTION("This test does many tiny batchbuffer operations, in the"
+		" hope of catching failure to manage the ring properly near full");
+
 static unsigned int ring_size;
 
 static void check_bo(int fd, uint32_t handle)
@@ -348,6 +351,8 @@ igt_main
 		}
 	}
 
+	igt_describe("This test does a basic pass over on all engines simultaniously"
+			" and checks how the driver handles a full ring.");
 	igt_subtest("basic-all") {
 		const struct intel_execution_engine2 *e;
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

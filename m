Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74DC6E06B
 for <igt-dev@lists.freedesktop.org>; Fri,  7 May 2021 12:51:26 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Fri,  7 May 2021 18:20:39 +0530
Message-Id: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_lease: Add subtest description
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for subtest

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
---
 tests/kms_lease.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 6397ef8f..957af1e0 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1307,6 +1307,7 @@ igt_main
 
 	for (f = funcs; f->name; f++) {
 
+		igt_describe("Tests the valid crtc/connector combinations for given function");
 		igt_subtest_f("%s", f->name) {
 			run_test(&data, f->func);
 		}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

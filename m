Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425326E0CA
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Feb 2021 08:35:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 25 Feb 2021 10:35:53 +0200
Message-Id: <20210225083553.7540-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/kmod: Stop producing results at all for
 kernel selftests on taint
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Instead of producing skips for the rest when one selftest taints the
kernel, stop running them altogether. Having the skips produced yields
no value and just makes future improvements (like correctly tagging
tests that cause taints) harder. In effect, this gets us back to the
old setup when tainting made igt_runner immediately kill the test and
similarly made us not get spurious results for the rest of the
selftests.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_kmod.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 2ae45a1a..55295fa5 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -658,9 +658,16 @@ void igt_kselftests(const char *module_name,
 	igt_kselftest_get_tests(tst.kmod, filter, &tests);
 	igt_subtest_with_dynamic(filter ?: "all") {
 		igt_list_for_each_entry_safe(tl, tn, &tests, link) {
+			unsigned long taints;
+
 			igt_dynamic_f("%s", unfilter(filter, tl->name))
 				igt_kselftest_execute(&tst, tl, options, result);
 			free(tl);
+
+			if (igt_kernel_tainted(&taints)) {
+				igt_info("Kernel tainted, not executing more selftests.\n");
+				break;
+			}
 		}
 	}
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

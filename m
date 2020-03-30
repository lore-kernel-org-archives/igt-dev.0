Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79546E29A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2020 12:48:48 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 30 Mar 2020 15:48:45 +0300
Message-Id: <20200330124845.43086-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] test/perf: respect gen11 restriction in
 disable subslices
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

In particular don't try to enable more than half the subslices.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1543
Fixes: 779d43cda49c ("tests/perf: add global sseu parameter tests")
---
 tests/perf.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/perf.c b/tests/perf.c
index 086fdac4..0f65f247 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -5040,7 +5040,19 @@ test_global_sseu_config(void)
 		igt_drop_root();
 
 		sseu_param = default_sseu;
-		sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
+
+		if (intel_gen(devid) == 11) {
+			/*
+			 * On Gen11 there are restrictions on what
+			 * subslices can be disabled, notably we're
+			 * not able to enable more than half the
+			 * subslice. So disable half subslices only.
+			 */
+			for (int i = 0; __builtin_popcount(default_sseu.subslice_mask) / 2; i++)
+				sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
+		} else {
+			sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
+		}
 
 		stream_fd = __perf_open(drm_fd, &param, false);
 		__perf_close(stream_fd);
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

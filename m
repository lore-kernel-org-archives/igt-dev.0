Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D3F6FBA1
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:11:54 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Fri, 31 Jan 2020 09:11:50 -0800
Message-Id: <20200131171150.8333-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_ctx_sseu: Skip gtt tests
 if mappable aperture unavailable
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

The gtt tests try to verify that a gtt mapped area can be used as an
sseu pointer so it wouldn't make sense to run those when gtt mapping is
not available.

v2:
	- Move require in subtest definition. (Ashutosh)

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Dixit Ashutosh <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_sseu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
index 38dc584b..b5e9658e 100644
--- a/tests/i915/gem_ctx_sseu.c
+++ b/tests/i915/gem_ctx_sseu.c
@@ -528,8 +528,11 @@ igt_main
 		igt_subtest("invalid-sseu")
 			test_invalid_sseu(fd);
 
-		igt_subtest("ggtt-args")
+		igt_subtest("ggtt-args") {
+			gem_require_mappable_ggtt(fd);
+
 			test_ggtt_args(fd);
+		}
 
 		igt_subtest("engines")
 			test_engines(fd);
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

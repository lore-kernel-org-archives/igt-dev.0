Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5020948D7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 13:50:32 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Jul 2022 15:50:24 +0200
Message-Id: <20220712135024.5571-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [PATCH v2 i-g-t] tests/i915_query: fix cache type
 iteration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com, chris.p.wilson@intel.com, nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Iterate over each cache types otherwise this will get
stuck in infinite loop if the value starts with 0 1st bit.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6249
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/i915_query.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index b33ffecff..8befd48bb 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -1348,14 +1348,14 @@ static void query_parse_and_validate_hwconfig_table(int i915)
 			if (!value)
 				igt_info("-\n");
 
-			j = 0;
-			while (value) {
+			for (j = 0; j < __INTEL_HWCONFIG_CACHE_TYPE_LIMIT; j++) {
 				if (value & BIT(j)) {
 					value &= ~BIT(j);
-					igt_assert(j < __INTEL_HWCONFIG_CACHE_TYPE_LIMIT);
 					igt_info("%s%s", hwconfig_cachetypes[j], value ? ", " : "\n");
 				}
 			}
+
+			igt_assert(!value);
 			break;
 
 		default:
-- 
2.35.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

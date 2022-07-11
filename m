Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF41D11A0F4
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jul 2022 12:07:59 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Jul 2022 14:07:50 +0200
Message-Id: <20220711120750.657-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915_query: fix cache type iteration
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
Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/i915_query.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index b33ffecff..ca500d2be 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -1348,8 +1348,7 @@ static void query_parse_and_validate_hwconfig_table(int i915)
 			if (!value)
 				igt_info("-\n");
 
-			j = 0;
-			while (value) {
+			for (j = 0; value; j++) {
 				if (value & BIT(j)) {
 					value &= ~BIT(j);
 					igt_assert(j < __INTEL_HWCONFIG_CACHE_TYPE_LIMIT);
-- 
2.35.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

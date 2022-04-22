Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6FB10F786
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 06:03:47 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Apr 2022 09:02:40 +0300
Message-Id: <20220422060240.3193599-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] kms_psr2_su: Skip page-flip tests if
 FB_DAMAGE_CLIPS not supported
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

Currently we are seeing failures in ICL platforms due to
missing support for IGT_PLANE_FB_DAMAGE_CLIPS. Skip page-flip
tests if IGT_PLANE_FB_DAMAGE_CLIPS is not supported.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4148

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 tests/i915/kms_psr2_su.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 474b1dfd..0ce1f924 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -322,6 +322,13 @@ igt_main
 					 */
 					igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
 				}
+				if (data.op == PAGE_FLIP &&
+				    !igt_plane_has_prop(igt_output_get_plane_type(
+								data.output,
+								DRM_PLANE_TYPE_PRIMARY),
+							IGT_PLANE_FB_DAMAGE_CLIPS)) {
+					igt_skip("FB_DAMAGE_CLIPS not supported\n");
+				}
 				prepare(&data);
 				run(&data);
 				cleanup(&data);
-- 
2.25.1

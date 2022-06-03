Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2315113D6C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 06:45:16 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Jun 2022 12:08:36 +0530
Message-Id: <20220603063836.5420-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: skip test if compatible
 mode is not found
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

skip test if the compatible mode is not found instead of
forcing the first connector mode on to the other connector.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4190
Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_flip.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 5985e012..c5b5741a 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -950,8 +950,7 @@ static void get_compatible_modes(drmModeModeInfo *a, drmModeModeInfo *b,
 			}
 		}
 
-		/* hope for the best! */
-		*a = *b = c1->modes[0];
+		igt_skip("Compatible mode not found.\n");
 	}
 
 	return;
-- 
2.36.0

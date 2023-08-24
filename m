Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E88910E48B
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 05:49:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Aug 2023 11:11:12 +0530
Message-Id: <20230824054123.820518-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
References: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 05/16] tests/kms_plane: Add tiling support for XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove the tiling restrictions in Xe specific tests

V2: - Rebase

Fixes: 2b9637086 (tests/kms_plane: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 721d3b533..d8b5dca9c 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1064,10 +1064,6 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			.modifier = plane->modifiers[i],
 		};
 
-		if (is_xe_device(data->drm_fd) &&
-		    f.modifier != DRM_FORMAT_MOD_LINEAR)
-			continue;
-
 		/* igt doesn't know how to sw generate UBWC: */
 		if (is_msm_device(data->drm_fd) &&
 		    f.modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
-- 
2.40.0

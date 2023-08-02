Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AACF10E54E
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 10:28:28 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Aug 2023 15:50:47 +0530
Message-Id: <20230802102059.3650360-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
References: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 05/17] tests/kms_plane: Add tiling support for
 XE
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

Remove the tiling restrictions in Xe specific tests

Fixes: 2b9637086 (tests/kms_plane: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 67cff61d6..d6cdabd0b 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1003,10 +1003,6 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			.modifier = plane->modifiers[i],
 		};
 
-		if (is_xe_device(data->drm_fd) &&
-		    f.modifier != DRM_FORMAT_MOD_LINEAR)
-			continue;
-
 		if (f.format == ref.format &&
 		    f.modifier == ref.modifier)
 			continue;
-- 
2.40.0

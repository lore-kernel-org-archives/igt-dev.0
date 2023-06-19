Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C059010E1F7
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:47 +0530
Message-Id: <20230619115858.2013195-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
References: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 07/18] tests/kms_plane_lowres: Add tiling support
 for XE
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

Fixes: 129983d07 (tests/kms_plane_lowers: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_lowres.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index db9f5a54c..e8739d91b 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -269,9 +269,6 @@ static void run_test(data_t *data, uint64_t modifier)
 	if(!igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888, modifier))
 		return;
 
-	if (is_xe_device(data->drm_fd) && modifier != DRM_FORMAT_MOD_LINEAR)
-		return;
-
 	for_each_pipe(&data->display, pipe) {
 		for_each_valid_output_on_pipe(&data->display, pipe, output) {
 			data->pipe = pipe;
-- 
2.40.0

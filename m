Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009D56E29A
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 02:31:34 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue, 11 Feb 2020 04:31:04 +0200
Message-Id: <20200211023108.25369-4-imre.deak@intel.com>
In-Reply-To: <20200211023108.25369-1-imre.deak@intel.com>
References: <20200211023108.25369-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 4/8] tests/kms_draw_crc: Skip GTT subtests on
 platforms w/o aperture
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

Subtests drawing through a GTT mapping are not relevant on platforms w/o
a GTT aperture, so skip them.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/kms_draw_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index ea14db9a..6de9feae 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -178,6 +178,8 @@ static void draw_method_subtest(enum igt_draw_method method,
 	igt_crc_t crc;
 
 	igt_skip_on(method == IGT_DRAW_MMAP_WC && !gem_mmap__has_wc(drm_fd));
+	igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
+		    !gem_has_mappable_ggtt(drm_fd));
 
 	igt_require(format_is_supported(formats[format_index], tiling));
 
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

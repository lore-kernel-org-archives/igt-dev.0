Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE35D6E89B
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Sep 2021 15:31:26 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  9 Sep 2021 18:30:47 +0300
Message-Id: <20210909153047.16729-12-ville.syrjala@linux.intel.com>
In-Reply-To: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
References: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 11/11] tests/kms_plane: Use single colors
 during extended test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Sometimes it's nice to checks which colors are actually different.
So let's make the extended test always use single colors.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 760df5d7d334..f1a94b2c54c4 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -721,7 +721,7 @@ restart_round:
 
 static bool use_multiple_colors(data_t *data, uint32_t format)
 {
-	return igt_format_is_yuv_semiplanar(format);
+	return data->extended || igt_format_is_yuv_semiplanar(format);
 }
 
 static bool test_format_plane_colors(data_t *data, enum pipe pipe,
-- 
2.31.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380EB6EA66
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 13:00:14 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 13 Oct 2021 15:59:49 +0300
Message-Id: <20211013125949.19373-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/7] tests/kms_concurrent: Use preferred
 modes's vrefresh
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

i915 will reject custom modes that don't match the laptop
panel's fixed mode refresh rate. Thus we must generate
our override modes with a matching refresh rate.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4284
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_concurrent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 085eaa0a630d..1b8f4b04356b 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -240,7 +240,7 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 			return igt_memdup(mode, sizeof(*mode));
 	}
 
-	return igt_std_1024_mode_get(60);
+	return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
 }
 
 static void
-- 
2.32.0

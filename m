Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2E6CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF9F10EA7C;
	Tue, 12 May 2026 12:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCX+4tkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F9810E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588516; x=1810124516;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0Me6fhwj2PyjerSV4+V/OJzJ/Ddsi9JAbB18IYcn+wI=;
 b=TCX+4tkmyp936fT/exauWFRbBVMUYZ/OM9eXXdZu5edUSrm5brllSHHi
 T+jFTsB06FCMysbvPeuTDimXskixOB3mCAVS8TkY7EzOAhgc+p+DonPRZ
 dT8tsoMEwtkzDiGy4A2/ouGSmePSWeWbLClbGUxp/KABhvYxwrQNtYX3Y
 QKwE0HbBT6JOhC74hAAVIMRkyDTkBmp15gFnL/h+ZScPKaS9oFHVUAi0n
 DeMxwH2mN30oPuCOGkQLLJGhnZFQoGk/mEEiagZ5gvZ0mrP+QtEngfnei
 YE1DsG9RY6BCyb6pI+600FUhhDdbAwYmP4N+uiGjABVj2vchoH24PjbRK Q==;
X-CSE-ConnectionGUID: Af+AnddkTEqCkzPFMXsUoQ==
X-CSE-MsgGUID: 20Qhp7ROT2yNGw5PiztzHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79525669"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79525669"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:21:55 -0700
X-CSE-ConnectionGUID: MmT+eRoQTvuVp3OzkgJgNA==
X-CSE-MsgGUID: sYrZLPpNTz+3e6JSQHVSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235091357"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:21:55 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/25] test/kms: Introduce a few extra format/modifier
 variables
Date: Tue, 12 May 2026 15:21:20 +0300
Message-ID: <20260512122143.11013-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reduce the number of places that directly index
plane->formats[] and plane->modifiers[] by storing the
results in local variables.

The plan is to introduce some abstractions around these
arrays, and thus having fewer places directly access the
arrays will reduce how many lines of code will need to
be touched.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/chamelium/kms_chamelium_frames.c | 41 ++++++++++++++------------
 tests/intel/kms_flip_tiling.c          | 19 +++++++-----
 tests/kms_async_flips.c                |  7 +++--
 tests/kms_plane.c                      | 18 +++++++----
 4 files changed, 50 insertions(+), 35 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index efd9ff1b76e8..1cd3b34b9d65 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -307,10 +307,13 @@ static void randomize_plane_setup(chamelium_data_t *data, igt_plane_t *plane,
 	unsigned int i;
 
 	/* First pass to count the supported formats. */
-	for (i = 0; i < plane->format_mod_count; i++)
-		if (igt_fb_supported_format(plane->formats[i]) &&
-		    (allow_yuv || !igt_format_is_yuv(plane->formats[i])))
+	for (i = 0; i < plane->format_mod_count; i++) {
+		uint32_t f = plane->formats[i];
+
+		if (igt_fb_supported_format(f) &&
+		    (allow_yuv || !igt_format_is_yuv(f)))
 			idx[count++] = i;
+	}
 
 	igt_assert(count > 0);
 
@@ -1039,23 +1042,23 @@ int igt_main()
 			igt_assert(primary);
 
 			for (k = 0; k < primary->format_mod_count; k++) {
-				if (!igt_fb_supported_format(
-					    primary->formats[k]))
+				uint32_t format = primary->formats[k];
+				uint64_t modifier = primary->modifiers[k];
+
+				if (!igt_fb_supported_format(format))
 					continue;
 
-				if (igt_format_is_yuv(primary->formats[k]))
+				if (igt_format_is_yuv(format))
 					continue;
 
-				if (primary->modifiers[k] !=
-				    DRM_FORMAT_MOD_LINEAR)
+				if (modifier != DRM_FORMAT_MOD_LINEAR)
 					continue;
 
 				igt_dynamic_f(
 					"%s",
-					igt_format_str(primary->formats[k]))
+					igt_format_str(format))
 					test_display_one_mode(
-						&data, port,
-						primary->formats[k],
+						&data, port, format,
 						CHAMELIUM_CHECK_CRC, 1);
 			}
 		}
@@ -1078,23 +1081,23 @@ int igt_main()
 			igt_assert(primary);
 
 			for (k = 0; k < primary->format_mod_count; k++) {
-				if (!igt_fb_supported_format(
-					    primary->formats[k]))
+				uint32_t format = primary->formats[k];
+				uint64_t modifier = primary->modifiers[k];
+
+				if (!igt_fb_supported_format(format))
 					continue;
 
-				if (!igt_format_is_yuv(primary->formats[k]))
+				if (!igt_format_is_yuv(format))
 					continue;
 
-				if (primary->modifiers[k] !=
-				    DRM_FORMAT_MOD_LINEAR)
+				if (modifier != DRM_FORMAT_MOD_LINEAR)
 					continue;
 
 				igt_dynamic_f(
 					"%s",
-					igt_format_str(primary->formats[k]))
+					igt_format_str(format))
 					test_display_one_mode(
-						&data, port,
-						primary->formats[k],
+						&data, port, format,
 						CHAMELIUM_CHECK_CHECKERBOARD,
 						1);
 			}
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index b732cd55cce7..14cc68c3b890 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -230,6 +230,8 @@ int igt_main()
 		bool run_in_simulation = igt_run_in_simulation();
 
 		for_each_crtc_with_valid_output(&data.display, crtc, output) {
+			uint32_t format[2];
+			uint64_t modifier[2];
 			igt_plane_t *plane;
 
 			igt_display_reset(&data.display);
@@ -243,21 +245,22 @@ int igt_main()
 			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 			for (int i = 0; i < plane->format_mod_count; i++) {
-				if (plane->formats[i] != data.testformat)
+				format[0] = plane->formats[i];
+				modifier[0] = plane->modifiers[i];
+
+				if (format[0] != data.testformat)
 					continue;
 
 				for (int j = 0; j < plane->format_mod_count; j++) {
-					uint64_t modifier[2] = {
-						plane->modifiers[i],
-						plane->modifiers[j],
-					};
+					format[1] = plane->formats[j];
+					modifier[1] = plane->modifiers[j];
 
-					if (plane->formats[j] != data.testformat)
+					if (format[1] != data.testformat)
 						continue;
 
 					if (run_in_simulation &&
-					    (!is_basic_tiling_modifier(plane->modifiers[i]) ||
-					     !is_basic_tiling_modifier(plane->modifiers[j])))
+					    (!is_basic_tiling_modifier(modifier[0]) ||
+					     !is_basic_tiling_modifier(modifier[1])))
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2c39574a079b..61cebf3ba6fe 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -877,7 +877,9 @@ static void require_linear_modifier(data_t *data)
 	}
 
 	for (int i = 0; i < data->plane->async_format_mod_count; i++) {
-		if (data->plane->async_modifiers[i] == DRM_FORMAT_MOD_LINEAR) {
+		uint64_t modifier = data->plane->async_modifiers[i];
+
+		if (modifier == DRM_FORMAT_MOD_LINEAR) {
 			data->modifier = DRM_FORMAT_MOD_LINEAR;
 			return;
 		}
@@ -1025,8 +1027,9 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 
 		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
 			uint64_t modifier = data->plane->async_modifiers[i];
+			uint32_t format = data->plane->async_formats[i];
 
-			if (data->plane->async_formats[i] != DRM_FORMAT_XRGB8888)
+			if (format != DRM_FORMAT_XRGB8888)
 				continue;
 
 			if (modifier == DRM_FORMAT_MOD_LINEAR)
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 7962c733a671..0e00db014426 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1127,7 +1127,9 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 	bool found = false;
 
 	for (int i = 0; i < plane->format_mod_count; i++) {
-		if (data->mod == plane->modifiers[i]) {
+		uint64_t modifier = plane->modifiers[i];
+
+		if (data->mod == modifier) {
 			found = true;
 			break;
 		}
@@ -1191,9 +1193,11 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 	igt_require(num_unique_crcs(ref_crc[MULTIPLE_CRC_SET], data->num_colors) > 1);
 
 	for (int i = 0; i < plane->format_mod_count; i++) {
+		uint32_t format = plane->formats[i];
+		uint64_t modifier = plane->modifiers[i];
 		struct format_mod f = {
-			.format = plane->formats[i],
-			.modifier = plane->modifiers[i],
+			.format = format,
+			.modifier = modifier,
 		};
 
 		if (data->mod != f.modifier)
@@ -1261,9 +1265,11 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	int i;
 
 	for (i = 0; i < plane->format_mod_count; i++) {
-		if (IS_AMD_FMT_MOD(plane->modifiers[i]) &&
-		    (AMD_FMT_MOD_GET(DCC, plane->modifiers[i]) ||
-		     AMD_FMT_MOD_GET(DCC_RETILE, plane->modifiers[i]))) {
+		uint64_t modifier = plane->modifiers[i];
+
+		if (IS_AMD_FMT_MOD(modifier) &&
+		    (AMD_FMT_MOD_GET(DCC, modifier) ||
+		     AMD_FMT_MOD_GET(DCC_RETILE, modifier))) {
 			igt_debug("Skipping planes with DCC or DCC_RETILE\n");
 			return true;
 		}
-- 
2.52.0


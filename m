Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E603BCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F3210EA85;
	Tue, 12 May 2026 12:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRmktkDp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFC510EA7F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588607; x=1810124607;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RN1IeHLoxSe+1cTOzyTEYFgEMbUtZwez2+NPD5gMGtc=;
 b=gRmktkDp3tBPtbjfaMHzDPxsdw9mrJx4DIpG71vOSTHQpZDlteQkwBJ0
 +0bxAUvlxmaWML2Imej70a66k9WoDyyZEoCWySyM/YglRNPMiS7Dg/uKZ
 /VWhIoM+hQfj/zT0xGoWh0uJTzis6QU8Q9bebui9mHi/ljYCPRqEocxS5
 fshzd1pbAcO/rFmt9Evcq7yfsYTfKyUEOv7cNVGjXgWDHa9lZRl5hlwyb
 ToO6SiXpbRCon9wMSkp6rlyFyTs6LOyC3fG8js5Qh1ppwXHc1njfzTVLn
 +IeCQCXQSx1pL64ePIgUrDSQ+bIMi9eLnHr1zd7zcJf7XNNUUuHdNx2+o Q==;
X-CSE-ConnectionGUID: s81S2qzvT2+hr7P0I26ONw==
X-CSE-MsgGUID: nGMtKh0VQp6xY5Fu8xDpZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78641443"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78641443"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:26 -0700
X-CSE-ConnectionGUID: ZCMZPpHmQuWGI/8CVKsRiw==
X-CSE-MsgGUID: J8dNOnzoTyCZ4lmUTAk8Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="237687914"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:25 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 25/25] tests/chamelium/kms_chamelium_frames: Use
 for_each_format_with_modifier()
Date: Tue, 12 May 2026 15:21:43 +0300
Message-ID: <20260512122143.11013-26-ville.syrjala@linux.intel.com>
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

Replace the open coded copies of for_each_format_with_modifier()
with the real thing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/chamelium/kms_chamelium_frames.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index d1d76f26d6a0..cdce7ee6b1d7 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -1032,9 +1032,9 @@ int igt_main()
 	igt_describe(test_display_one_mode_desc);
 	connector_dynamic_subtest("hdmi-crc-nonplanar-formats", HDMIA)
 	{
-			int k;
 			igt_output_t *output;
 			igt_plane_t *primary;
+			uint32_t format;
 
 			output = chamelium_prepare_output(&data, port,
 							  IGT_CUSTOM_EDID_BASE);
@@ -1042,19 +1042,14 @@ int igt_main()
 				output, DRM_PLANE_TYPE_PRIMARY);
 			igt_assert(primary);
 
-			for (k = 0; k < primary->format_mods.count; k++) {
-				uint32_t format = primary->format_mods.formats[k];
-				uint64_t modifier = primary->format_mods.modifiers[k];
-
+			for_each_format_with_modifier(&primary->format_mods,
+						      format, DRM_FORMAT_MOD_LINEAR) {
 				if (!igt_fb_supported_format(format))
 					continue;
 
 				if (igt_format_is_yuv(format))
 					continue;
 
-				if (modifier != DRM_FORMAT_MOD_LINEAR)
-					continue;
-
 				igt_dynamic_f(
 					"%s",
 					igt_format_str(format))
@@ -1071,9 +1066,9 @@ int igt_main()
 	igt_describe(test_display_one_mode_desc);
 	connector_dynamic_subtest("hdmi-cmp-planar-formats", HDMIA)
 	{
-			int k;
 			igt_output_t *output;
 			igt_plane_t *primary;
+			uint32_t format;
 
 			output = chamelium_prepare_output(&data, port,
 							  IGT_CUSTOM_EDID_BASE);
@@ -1081,19 +1076,14 @@ int igt_main()
 				output, DRM_PLANE_TYPE_PRIMARY);
 			igt_assert(primary);
 
-			for (k = 0; k < primary->format_mods.count; k++) {
-				uint32_t format = primary->format_mods.formats[k];
-				uint64_t modifier = primary->format_mods.modifiers[k];
-
+			for_each_format_with_modifier(&primary->format_mods,
+						      format, DRM_FORMAT_MOD_LINEAR) {
 				if (!igt_fb_supported_format(format))
 					continue;
 
 				if (!igt_format_is_yuv(format))
 					continue;
 
-				if (modifier != DRM_FORMAT_MOD_LINEAR)
-					continue;
-
 				igt_dynamic_f(
 					"%s",
 					igt_format_str(format))
-- 
2.52.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0FECD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABE710EA99;
	Tue, 12 May 2026 12:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNzAISwo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844EC10E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588603; x=1810124603;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VRHWIuNOcS5WJyVg0pP/Gy6Sa3FzqsrIvIr2RROF/p8=;
 b=PNzAISwoySNRRvNblSXdCom9Y3xlk/2gMOUDY9xOohCCewD+rahPGFx9
 sTFKsGtsgQ/tfkBNoHkYiW6oMc5LYmulAV4XpuBjzQDSjxTWOEtTvtCVY
 oxb0qZqLu0QYD7JUcZ8RmWKAJIpWvpc3x/obWmPNXs+815GlLgyzM9WGi
 7TN0F9HCmdskoHTCOsGRGZrvrah9b/SO6LNRCVG6g3BSrrDXyvbVz+jjB
 KUzRZQUZI4LFJtGlvbvjMt8ptOWEA80uRm+5DDHIj1Cokktsct13ovo1r
 qHwIUAlBErVvoOHMoOYvD7JjQ+XOc9bA34FdJZINsT21ia+UdYu/0SAnZ g==;
X-CSE-ConnectionGUID: qb2sAjcZRlmWvai4fWKBAA==
X-CSE-MsgGUID: 6wVyGYygRvKzUQC/XxyjKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950073"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="104950073"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:22 -0700
X-CSE-ConnectionGUID: puL7hI1dRYeAEGJft0Yb3Q==
X-CSE-MsgGUID: eBSJgPAbTjuzLc0Idyc6Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="234691262"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:21 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 24/25] tests/intel/kms_flip_tiling: Use
 for_each_modifier_with_format()
Date: Tue, 12 May 2026 15:21:42 +0300
Message-ID: <20260512122143.11013-25-ville.syrjala@linux.intel.com>
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

Replace the nested open coded copies of for_each_modifier_with_format()
with the real thing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_flip_tiling.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index bccacfa7b229..ff79e1458ef2 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -230,7 +230,6 @@ int igt_main()
 		bool run_in_simulation = igt_run_in_simulation();
 
 		for_each_crtc_with_valid_output(&data.display, crtc, output) {
-			uint32_t format[2];
 			uint64_t modifier[2];
 			igt_plane_t *plane;
 
@@ -244,20 +243,10 @@ int igt_main()
 
 			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-			for (int i = 0; i < plane->format_mods.count; i++) {
-				format[0] = plane->format_mods.formats[i];
-				modifier[0] = plane->format_mods.modifiers[i];
-
-				if (format[0] != data.testformat)
-					continue;
-
-				for (int j = 0; j < plane->format_mods.count; j++) {
-					format[1] = plane->format_mods.formats[j];
-					modifier[1] = plane->format_mods.modifiers[j];
-
-					if (format[1] != data.testformat)
-						continue;
-
+			for_each_modifier_with_format(&plane->format_mods,
+						      data.testformat, modifier[0]) {
+				for_each_modifier_with_format(&plane->format_mods,
+							      data.testformat, modifier[1]) {
 					if (run_in_simulation &&
 					    (!is_basic_tiling_modifier(modifier[0]) ||
 					     !is_basic_tiling_modifier(modifier[1])))
-- 
2.52.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12AEF531F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB8B10E072;
	Tue, 14 Apr 2026 07:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKMMzpuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F7410E590
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150908; x=1807686908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gdU9yuMV38osP7ngXUq7FxgG9IZZw+/+AgqWUpnwR5Q=;
 b=GKMMzpuBE8A9x0FZaxvV2FMOlUq/z/Ptupr/ywK/xT/PnSntGBJtbiAm
 upbdcj9xWb0RV2eT9rW1p4y30acHfwcFamAN+JU5g6bqZ3OrRgBYjOVxW
 qVCi2t/7bMCl/VKIiHvoeeMbuwRthUOVM9WbfRZpO2lSWIPUuFAJU1qCr
 ITiH77EGfax0IPWIAfENlcU2A+gt091b1+Z4kX7HN22pDKdwKmoQUOfA1
 AY/js2rAgCRpyyGfGWc7aEuweRBbq6ZQdOSiGMTnZqqDZeVo3O7fE8g1F
 +EBRYXooQmz4E5fWXZqCebSOrNSxvMDZAJfcXuJIly/HV80XLhLrTFpm0 w==;
X-CSE-ConnectionGUID: pPBNqQSMSfeRX7cXAD0Fbg==
X-CSE-MsgGUID: 6x1RCjspT8iKZXWk9TSI6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102555760"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102555760"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:08 -0700
X-CSE-ConnectionGUID: 1YEB/2hUSqqSh1fgv1Umyw==
X-CSE-MsgGUID: 9BNswtOdTNuvS4xxGkgS3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234047071"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 05/16] lib/kms: rename struct igt_crtc to _igt_crtc
Date: Tue, 14 Apr 2026 10:14:25 +0300
Message-ID: <87d0748fd2221f33ee8f5782864bc39f7f65cf80.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Rename the struct to avoid accidental use. The named struct is only
needed for the typedef declaration.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2e2870854634..e785dce8b105 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -379,7 +379,7 @@ extern const char * const igt_plane_prop_names[];
 extern const char * const igt_colorop_prop_names[];
 
 typedef struct _igt_display igt_display_t;
-typedef struct igt_crtc igt_crtc_t;
+typedef struct _igt_crtc igt_crtc_t;
 typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
 
 #define IGT_NUM_PLANE_COLOR_PIPELINES 4
@@ -470,7 +470,7 @@ typedef struct _igt_plane {
 /*
  * This struct represents a hardware pipe
  */
-struct igt_crtc {
+struct _igt_crtc {
 	igt_display_t *display;
 	/* ID of a hardware pipe */
 	enum pipe pipe;
-- 
2.47.3


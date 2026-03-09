Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4217F3C26E
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690BD10E187;
	Mon,  9 Mar 2026 14:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9efiHdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7863210E187
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066122; x=1804602122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XHN1PO3ukw9KKyxM74hce9AMtDgOVfHd9zWaqkqhjCo=;
 b=j9efiHdh7kcAn7Qj+hAwDwH7jJ/JV1umT/vSJbHsl509gBL1nQ64sk3p
 REQhUE85AY142Plux9G0c2H0O+Vp0+TsI//aCIy1IQWPZxpyIFA4FTff9
 OqGKfIk/foe4XXmTaZnZ4juSr17CMrgjdKmLFIOCzgXjwYe8AYodqSF6Y
 KrBn5QnBEb/1CKwAGaaHr2yhsliUtnfRJruyJokiAGybJqeNU0R3HnId/
 YJQ3BOy1whxgBXz49OA2CfnbLrdUGudyrSgFOm7g1TIWvTrylMmxMCqBw
 Yc6b23K0qyGkoARIjp+c+cV4/S5wqKyXphypeBRcFSmo+/ZRoX4uAImBW A==;
X-CSE-ConnectionGUID: uH9fw9hWQbqMJkI3DYoL0g==
X-CSE-MsgGUID: lJUsNtdGSJ27PDotrmLmYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="61659523"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="61659523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:02 -0700
X-CSE-ConnectionGUID: HaD799ejShGUCDvpzYTArA==
X-CSE-MsgGUID: lyWUu1PoQ927QBkRfVZcaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224211887"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 02/10] tests/kms_colorop: use igt_crtc_name()
Date: Mon,  9 Mar 2026 16:21:36 +0200
Message-ID: <00a9c7454bf549a30b7e5105866e7942020446c9.1773066012.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773066012.git.jani.nikula@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
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

Prefer using igt_crtc_name() instead of %d and crtc->pipe.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_colorop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index d535be4e5287..e5a9cd594fbf 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -160,9 +160,9 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 four
 					    crtc);
 
 			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
-				igt_debug("Using connector %u:%s on pipe %d\n",
+				igt_debug("Using connector %u:%s on pipe %s\n",
 					  output->config.connector->connector_id,
-					  output->name, crtc->pipe);
+					  output->name, igt_crtc_name(crtc));
 				return output;
 			}
 		}
-- 
2.47.3


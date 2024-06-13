Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411A9C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 09:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E85D10E9BF;
	Thu, 13 Jun 2024 09:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXFNdjah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E982510E9BF
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718270761; x=1749806761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lrg3jLUzh0VHw0ySk5YbxddGdKUfldOxneBkDRxNSYg=;
 b=bXFNdjahrnnfUnx3kMQkvg+er1PeY2G/zh6nSitmxXDOQBrgtvt6W5nL
 KRQGh1A0ESK3vimN9To9i3wZxkuQd/GkSCytADFYvnCFnKxBWC3RJuSOB
 x276mWtyCxcr59HPRLbMaNfriU1lL4OcplnPDhEHpUHTPrtC4stgtOJjy
 4bdCFPbrDDyF6iOjfmsXyQjBWFz4QjHgoIr1IYnxYxbKAhMCkyIx12dUy
 AWYIrLm75IqXpDwZSDiu6DDTl1KW3W7A9YVALdstVCYPjgr8A0AygBe9x
 zGB8PeSRCoQ0sflmV/yWsKUdpPy7ZRD9QXmgSzWGuaQ49lOlFYw5Oz4qu Q==;
X-CSE-ConnectionGUID: yqi85EsfSVGgQklSlXLM/Q==
X-CSE-MsgGUID: n2JbBvlpSmSA/AbJFjBSDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18004699"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18004699"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:59 -0700
X-CSE-ConnectionGUID: W6SbgqcVRmizLQ+bCcIy/g==
X-CSE-MsgGUID: rp2kVtLiRPGQQz3qH1KKdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40045505"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:34 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 5/6] tests/kms_psr2_sf: Use stored psr mode instead
 of PSR_MODE_2_SEL_FETCH
Date: Thu, 13 Jun 2024 12:25:13 +0300
Message-Id: <20240613092514.1288801-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613092514.1288801-1-jouni.hogander@intel.com>
References: <20240613092514.1288801-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We are already checking psr mode supported by system and storing it.
Use stored value instead of PSR_MODE_2_SEL_FETCH when enabling psr mode.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_psr2_sf.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 4c3e34aa0..4fd9e0444 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -195,6 +195,10 @@ static bool set_sel_fetch_mode_for_output(data_t *data)
 	} else
 		igt_info("selective fetch not supported on output %s\n", data->output->name);
 
+	if (supported)
+		supported = psr_enable(data->drm_fd, data->debugfs_fd, data->psr_mode,
+				       data->output);
+
 	return supported;
 }
 
@@ -1053,11 +1057,6 @@ igt_main
 			data.fbc_flag = true;
 		}
 
-		/* Test if PSR2 can be enabled */
-		igt_require_f(psr_enable(data.drm_fd,
-					 data.debugfs_fd, PSR_MODE_2_SEL_FETCH, NULL),
-			      "Error enabling PSR2\n");
-
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.primary_format = DRM_FORMAT_XRGB8888;
 
-- 
2.34.1


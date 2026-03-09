Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B8EF3C26E
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4B110E187;
	Mon,  9 Mar 2026 14:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/y6z/xc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9752810E187
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066118; x=1804602118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ormiEQFUaz88B8sR4XrdmTrDy62v7KyF3ztV+tuHgg=;
 b=k/y6z/xcKZMNOSnTt08owV4gWVZH85jk72DnybT7Mi2M8dYBwmQJdrUY
 qH6msp+nYpHSyABEMVN0mdxQ3Qs80pkQVC7CvvuXjNT5m0FU9r+xogiXC
 qhLI/OGJRjCjb7d9SBX20EN+tfyAjoz/zsJ1ITo9QzcRiv0IbBJokSLvI
 Enh8zhYz+DQBrZc8iZIftyjHQ9+S539iKpzQE/CtSqDbAblJPMz8QcTzA
 DaUqUcWi1tRma6kCVSTvmBvX1kMuItSwmpQjpXvGAeXtDfO5dZPxRg3Qi
 gRNL86jL9k9i11c/XeQ7JdrCCsiNxYdUOsPVI85jpgC2cpUKg/UEHbWm4 A==;
X-CSE-ConnectionGUID: xwV8gvYeSpm7M0hFCi4GtA==
X-CSE-MsgGUID: v2hAL2CPTPylaDeUmz+OKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99559722"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="99559722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:21:56 -0700
X-CSE-ConnectionGUID: agBkoR97ROiHiu9a/smHJA==
X-CSE-MsgGUID: uyresDuiRMeeMVRcY/h6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224466015"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:21:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 01/10] tests/kms_writeback: use igt_crtc_name()
Date: Mon,  9 Mar 2026 16:21:35 +0200
Message-ID: <a47506e3ed623bb03ff2b8c59ebdf8ea6f4bc7b0.1773066012.git.jani.nikula@intel.com>
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
 tests/kms_writeback.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index e94e3b7842da..f15abba96765 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -179,9 +179,9 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 				override_mode = output->config.connector->modes[data.mode_index];
 
 			if (check_writeback_config(display, output, override_mode)) {
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


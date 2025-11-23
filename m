Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C320BCFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A2A10E17F;
	Sun, 23 Nov 2025 15:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeQu+ZFX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9978210E182
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910528; x=1795446528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3XWcY1l+KA8rQ8jnEoFo7It2V8YRgZiYm4/oN+Csrdw=;
 b=MeQu+ZFX1+DRZS8kEGld2rLjulkffqVXCPV0kSd+uQ4ftR9813R5I/FM
 J+kPx2jSaQVpmVNvmlllS21Eq0nL58pacRM2F3okHVA825LC9swgILFG/
 eaELynkDkLFlgVmFO3iCdTTkSm+/MsLbed0EoI4AUi3WtD77OOHtq1dJB
 /4RMyhzwa1VkpmIE+TG+g3cZsW/i33W5jv+EszW/uQMQqq4urVKxx741j
 rUodtNXVZXvtz331ihUsV7KEp9OK3jcia1xWJYc0aXjq6rBdut0i1DVtV
 /CdqRyOumrswfTxdUqswa6WM2oWW7R4Gyrs87n4DTikHhSvJDYo2Nmbpx Q==;
X-CSE-ConnectionGUID: 0oOTiCriREGC155EX3JPZw==
X-CSE-MsgGUID: Aq5t7AQOS46jLFsj4MQrgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615209"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615209"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:48 -0800
X-CSE-ConnectionGUID: l7bWZghcSr+cCaMbP8lY+g==
X-CSE-MsgGUID: fTp4qufoRlWvMQbR53rcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903816"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:48 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 21/35] tests/kms_fbc_dirty_rect: use display-aware pipe
 CRC helper
Date: Sun, 23 Nov 2025 20:53:58 +0530
Message-Id: <20251123152412.599801-22-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123152412.599801-1-kunal1.joshi@intel.com>
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index eda3fd91a..b7e352d10 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -408,8 +408,9 @@ static bool prepare_test(data_t *data)
 
 	data->mode = igt_output_get_mode(data->output);
 	igt_output_set_pipe(data->output, data->pipe);
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+					   data->pipe,
+					   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_require_f(intel_fbc_supported_on_chipset(data->drm_fd, data->pipe),
 		      "FBC not supported by the chipset on pipe\n");
-- 
2.25.1


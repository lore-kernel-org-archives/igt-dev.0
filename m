Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8B0CFA46B
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118AF10E17F;
	Sun, 23 Nov 2025 15:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FReaVhVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093CB10E152
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910547; x=1795446547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zy/cccVp2g4xHSg7N7eEDwcpHRtcFKAegszqaBTTUbA=;
 b=FReaVhVK+31su/1AIcdT28ijDAluELU8rrRATSDLmoyLgaam4mepbWYy
 IspI9i6rZ3d4XZkcZ6/pOaXyIvJ63xtJcBeyOQR3V2JKzEpkIu4JmqwRJ
 UqsMHp6h+1D01hbHeUYb9YVSm+K8WTmgai5Pz5ftYQdSQiuq/zlYDoiwx
 Mz7zZwWl7wQ/HrWauJEvVbj+T4K9qFTzcBxpRuANtr8MDgPOwDbR7Ju2R
 Zh9oy9QHRKBAMdGGrWYdwjz8MunljL8y7vqNMhhvGozVzSNMNzJQ2mD9w
 IkML6JgdETvupYY2lKEwN+d6tJeysunU0j0+3VpDkZTSAkSIgbmvS6xBy Q==;
X-CSE-ConnectionGUID: /oX/23i1RyiwDidJqmZjWw==
X-CSE-MsgGUID: vVsRp64ZQpyPer+1MY37jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615246"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:09:07 -0800
X-CSE-ConnectionGUID: IbQ7fcyQQWWqqbcrDypp4g==
X-CSE-MsgGUID: 5U8HJjkKR3mpvFliHNAoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903908"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:09:06 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 34/35] tests/intel/kms_fb_coherency: use display-aware
 pipe CRC helper
Date: Sun, 23 Nov 2025 20:54:11 +0530
Message-Id: <20251123152412.599801-35-kunal1.joshi@intel.com>
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

Update the CRC setup to use igt_pipe_crc_new_for_display() instead of igt_pipe_crc_new(). This makes the fb coherency test use the igt_display-based mapping rather than relying on pipe and CRTC indexes matching.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_fb_coherency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index 573037db1..f9c071970 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -64,7 +64,7 @@ static void prepare_crtc(data_t *data)
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display, data->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
-- 
2.25.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7817D4A605
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 06:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F7210E132;
	Fri, 16 Jan 2026 06:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtbWFyrd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4468910E132
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 06:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768543779; x=1800079779;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P7tMO/OzLLWFb8Kk0ir3lVSrLamxxh32bgrZ+O7wMSs=;
 b=mtbWFyrds+anhvr48GxUpmlhymAn+83EMDX9v4w8wtKARFHNaEUlekTS
 y1raN6qe+BBNYQE+j+ZAbNsj/JqNiYlasXOxVTqXnAQkh81Zd8QabpUlk
 llcjDgii4jOiuIiXat/Obhk8kDDGj8J+mvure+sWD1eeT+XNexm6YOiTR
 M1h4Y/WumkGr8C7L8/N+Ax9UbZEiIZwWfhJiqWWzoGjRdHwy/Avv58vWj
 3OfRFHUqrHbpg2gqjp6serztqX/H8w1FByHjhVnHo2AbDwERtb5D+9CoB
 fDVyVAoNYIcxw6RGD8n8hOmrHdOQ/MIcAqUA8YA5nAjK0BqTdngCsSOpC A==;
X-CSE-ConnectionGUID: AeP0eDHCS0iptpnjYKh8pw==
X-CSE-MsgGUID: ercLKY7WRCGNeYQfX1QbKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87433366"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="87433366"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 22:09:39 -0800
X-CSE-ConnectionGUID: qkH+avQCQs6H6xUmbvtXBw==
X-CSE-MsgGUID: MeBZiCSmQKKJwbSRYw/Baw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="242703934"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 15 Jan 2026 22:09:37 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for cursor
 fb leak
Date: Fri, 16 Jan 2026 11:39:32 +0530
Message-Id: <20260116060932.523060-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add the vblank wait even for i915 as the legacy path uses the
vblank worker to unpin cursor fbs.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_universal_plane.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index aa5927cdf..9ac6d01b7 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -703,16 +703,17 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 			    COMMIT_ATOMIC : COMMIT_LEGACY);
 	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
 
-	/* Since unpinning of cursor fb occurs during vblank in xe, we need
+	/*
+	 * Since unpinning of cursor fb occurs during vblank in xe, i915
+	 * specially in case of legacy commit we need
 	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
 	 * 1 additional vblank because vblank event is scheduled before
 	 * unpinning. Therefore add 2 vblank wait to ensure that all
 	 * cursor-related framebuffers can be removed before counting the
 	 * framebuffer.
 	 */
-	if (is_xe_device(data->drm_fd))
-		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
-					  2);
+	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
+				  2);
 
 	/* We should be back to the same framebuffer count as when we started */
 	count2 = intel_gem_fb_count(data);
-- 
2.34.1


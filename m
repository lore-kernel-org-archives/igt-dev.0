Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ADC3DA60
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4EA10E14D;
	Wed, 17 Jul 2024 14:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4RRUskT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62AE10E102
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224924; x=1752760924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8jNuCq16mg7VPBtbqSCwOd+0AX6xtwIjcOT/uLYaT3c=;
 b=l4RRUskTEK/kMGHaZnlQ42qKf8p4EOO/Dx98YodWhwrm0AeKCFL4nkD4
 aYNrgIM91ZVtdqinVx83IU/avsz//KmyYm7PY9Rtr7Zek1rqNuN90vQj3
 Tb/lxTySrdq+Zg71CIcR7jvhAp1BRTkpfmL5kxsKBc8y0b/Bs6OhRhg4W
 mDx5eDIFt5zPZJtvl8ACRBWN+yrqOXlEZQnE+Af4DbFLeE4JmkCy0NLAB
 J9PEOfhteHyox6ImGaPhc8IBhYRxZYH4MD/h6RQfaD2fw+iyNJ6Wf8vxN
 hSk8FAaJvPNkVjJWZTk+1Nu2L9VVNhe1mImwkhfECrsJFBXdDcaZyVZ/B Q==;
X-CSE-ConnectionGUID: 8JlPh9HiScuY0Qx9u7QvhQ==
X-CSE-MsgGUID: 0Giq6o72Ss+bnOV+E/uPBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29341098"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29341098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:02:03 -0700
X-CSE-ConnectionGUID: pP/bjApTQ5CHQNbKduXMyw==
X-CSE-MsgGUID: p0Mnru0KQv2FKg646ooghQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87867698"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:02:02 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/kms_pm_dc: Update deep-pkgc function
Date: Wed, 17 Jul 2024 19:35:55 +0530
Message-ID: <20240717140556.640124-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717140556.640124-1-ramanaidu.naladala@intel.com>
References: <20240717140556.640124-1-ramanaidu.naladala@intel.com>
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

Increased the C-state polling time from its previous value
to 4 sec.Implement polling for PKG-C10 counters for every
5ms up to 16ms.

v2: Address and correct review comments (Suraj, Jeevan)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 8fb35a2df..c1ca3acc0 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL), duration = 2, vb_delay, delay;
+	time_t start = time(NULL), duration = 4, vb_delay, delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
 	bool flip = true;
@@ -623,10 +623,10 @@ static void test_deep_pkgc_state(data_t *data)
 		data->mode = &output->config.connector->modes[j__];
 		vb_delay = 1 * (MSECS / (data->mode->vrefresh));
 		/*
-		 * At least 5ms vblank time required to program higher
+		 * At least 5ms vblank time for programming higher
 		 * watermark levels
 		 */
-		if (vb_delay > (5 * MSEC))
+		if (vb_delay > (5 * MSECS))
 			break;
 	}
 
@@ -635,23 +635,27 @@ static void test_deep_pkgc_state(data_t *data)
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
+	delay = vb_delay * 0.5;
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
 
+	/* Waiting for the vblank to sync the frame time */
+	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
+	usleep(delay);
+	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+
 	while (time(NULL) - start < duration) {
 		flip = !flip;
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
 
-		cur_val = read_pkgc_counter(data->debugfs_root_fd);
+		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
+			  vb_delay * 2, 5);
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
 		}
-		usleep(delay);
 	}
 
 	cleanup_dc3co_fbs(data);
-- 
2.43.0


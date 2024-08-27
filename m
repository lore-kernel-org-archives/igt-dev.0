Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55998C54734
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 12:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B12710E30F;
	Tue, 27 Aug 2024 12:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEQTS6+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7905710E317
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 12:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724762451; x=1756298451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xcceQz3lPQcQdSQz5Mwni6kfwTZodTUTNmIRU94H0uc=;
 b=mEQTS6+joatmqxkeeWR2vYUsC/YJ8VYIrlAojO0IEs7ExvRjpoePv0eX
 +bLRPO6bTXhlaOvp/V1dSGHOw5QMAdij92lOSMJB/2C7G+X4HwaGyKlEL
 nCJFzb/wXyTL9CLysLjnSoUcocjG4aXKn3gLQWOmPv19AShxp4n5uT0Va
 R31HQZWdjetSJL7oaIdlSRKv+GgXAPng9kkzi1spkMviwPoL40uKo+VCl
 ZTwKIOEv60pG6KHPw1CWBI0ieXWzfg+Sz+Fw59xZOVGUTkjuG35Pl1YPJ
 7xqfmKNfSkqI+kiqSSluI94NwMPDVbZLT4icwrrOo0Pj7vqVvH5ylni9u w==;
X-CSE-ConnectionGUID: Mluc3S/NRWGbiSzmZzI/Vw==
X-CSE-MsgGUID: 85YUFyTyR4+x6+QPxEPGSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="27117257"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="27117257"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 05:40:50 -0700
X-CSE-ConnectionGUID: WOJ1BjamQ/e5dUVozWFTnw==
X-CSE-MsgGUID: 22DQPwAqTpSCgOlhrwGyMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62905877"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:40:49 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 4/4] tests/intel/kms_pm_dc: Add polling for deep-pkgc
Date: Tue, 27 Aug 2024 18:10:18 +0530
Message-ID: <20240827124018.1373304-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
References: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
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

It should be enhance the test_deep_pkgc_state function to include
the following changes:
- Add an interval variable to control the delay between checks.
- Add a wait for vblank to sync the frame time before reading
  the package C-state counter.
- Introduce a half-frame delay to ensure the flip occurs when
  the frame is active.
- Modify the loop to use igt_wait for better handling of the
  package C-state counter read.
- Remove redundant usleep call to streamline the delay handling.

v2: Address and correct review comments (Suraj, Jeevan)
v3: Update commit subject/message.  (Kamil)
v4: Update commit subject/message and added comments. (Suraj)
v5: Update commit subject/message. (Suraj)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index a69876fc7..b378cacbc 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -641,22 +641,25 @@ static void test_deep_pkgc_state(data_t *data)
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
+	/* Wait for the vblank to sync the frame time */
+	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
+	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
+	usleep(delay * 0.5);
 
 	while (time(NULL) - start < duration) {
 		flip = !flip;
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
 
-		cur_val = read_pkgc_counter(data->debugfs_root_fd);
+		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
+						      (delay * 2), (5 * MSEC));
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
 		}
-		usleep(delay);
 	}
 
 	cleanup_dc3co_fbs(data);
-- 
2.43.0


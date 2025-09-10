Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A962CAC58D
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 08:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F7F10E8A6;
	Wed, 10 Sep 2025 08:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VN681dm1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B6310E8A2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757494466; x=1789030466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wBiA/4lIMYw/QkO/n5xwqAuWUy+AIOhurcoYCid+yLI=;
 b=VN681dm1slG+n4qoouvAjEkWjmH0aVG79C0D7MIpnr3xgXyMzzAvPvxg
 gwsBHp//w2qdvqnoHELW5+QSE/HA3MqwbbFrdJEr879v/t1pTF3OHNFrr
 DntVPto3FI0bE3tyIDZACTrSY4VmH0DVBz/dNR1GOUcvzx1HUKpMXDMCP
 jEAJBEyarh7NdOsxlhJXf97l2OgG/WLTFborWPb+CBX/h4yj0Vi32RcMw
 2eH99HG0SDlOWKbq4obiyvqlwbVSDne1hc3tMI3vtsXjs+1aq/43SYzqp
 dhgtyJd3G8jd5FyNo/uX3LQ9dSpFRbMYl7onEoa+MW2CPZAK+bQfRWn6A Q==;
X-CSE-ConnectionGUID: 1qcURv2BSKCyForb8YST4Q==
X-CSE-MsgGUID: UZBd0noiQZ261pr82lb/qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77252087"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="77252087"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:54:17 -0700
X-CSE-ConnectionGUID: 5pCk8xckTgKpstHjcEhUjQ==
X-CSE-MsgGUID: laLq4jIYRcWfd3gwUqoRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="178536675"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:54:15 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/kms_mmap_write_crc: lower rounds in
 simulation
Date: Wed, 10 Sep 2025 14:30:57 +0530
Message-Id: <20250910090059.351698-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910090059.351698-1-swati2.sharma@intel.com>
References: <20250910090059.351698-1-swati2.sharma@intel.com>
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

Reduce iterations from 10 to 5 when running in simulation to
shorten runtime without loss of coverage.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_mmap_write_crc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index ddc5ed63e..01fa998c4 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -55,8 +55,6 @@
 IGT_TEST_DESCRIPTION(
    "Use the display CRC support to validate mmap write to an already uncached future scanout buffer.");
 
-#define ROUNDS 10
-
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
@@ -271,7 +269,7 @@ static data_t data;
 
 igt_main_args("n", NULL, NULL, opt_handler, NULL)
 {
-	int i;
+	int i, rounds;
 	igt_output_t *output;
 	enum pipe pipe;
 
@@ -280,6 +278,8 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
 
+		rounds = igt_run_in_simulation() ? 5 : 10;
+
 		kmstest_set_vt_graphics_mode();
 
 		igt_require_pipe_crc(data.drm_fd);
@@ -305,10 +305,10 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 				data.output = output;
 				data.pipe = pipe;
 
-				igt_info("Using %d rounds for each pipe in the test\n", ROUNDS);
+				igt_info("Using %d rounds for each pipe in the test\n", rounds);
 				prepare_crtc(&data);
 
-				for (i = 0; i < ROUNDS; i++)
+				for (i = 0; i < rounds; i++)
 					test(&data);
 
 				cleanup_crtc(&data);
-- 
2.25.1


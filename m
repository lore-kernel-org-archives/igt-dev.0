Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77C6C197BF
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 12:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944B910EAD1;
	Thu, 27 Feb 2025 12:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuVUKMnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC0010EAD3
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 12:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740658501; x=1772194501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ERA3MVukG+OkC9bheLnjXUdzjsHdogHh5ACQVYHgcjU=;
 b=NuVUKMnuEdQySDpNXMzBRKrRZBDlXZU7J8LZL2HN4UlqbmFWmhGpTSGw
 vNMibRvSJWhqOshONwfoJ42EOlQX00hlX9v0wvg3vNVvP5pxBjxKjsuao
 mBCjKNhcjJRi6kSaLmJ4SchKIRn27NKCgxDMkNbkcifnbM/zgk5zfBzu/
 bHQlNHYrCALSToIoGtP2IaVfR0OBTY3ZhGiBimyOL3L56O7prleyK7zmV
 WadVpOag3tVazayd27sEYAyw1g+t5UDX+IjlFz0iasTCEz8rbFzi3C4YI
 kwYscEfX+OYUIiMiPYefNZ6hfSfJ5OJfjiIvXqsUXffY3Lt0LtK3USxZ0 A==;
X-CSE-ConnectionGUID: Qsj8alWHTKGcTRrmRMv39w==
X-CSE-MsgGUID: EArjR3lbRlSvy/pvyHx8lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59078812"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="59078812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 04:15:00 -0800
X-CSE-ConnectionGUID: 8nLNmXDnSyCzudmHUZLU/w==
X-CSE-MsgGUID: +LrKC86WSpmZEpvpPKbSig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="140231093"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:15:00 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_dp_link_training: fix assert for
 igt_find_all_mst_output_in_topology
Date: Thu, 27 Feb 2025 18:00:39 +0530
Message-Id: <20250227123039.2933330-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227123039.2933330-1-kunal1.joshi@intel.com>
References: <20250227123039.2933330-1-kunal1.joshi@intel.com>
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

fix assert for igt_find_all_mst_output_in_topology
as it changed to int from bool

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 33e690a60..94ae63975 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -95,7 +95,7 @@ static void assert_link_status_good(data_t *data, bool mst)
 	if (mst) {
 		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
 								 &data->display, data->output,
-								 outputs, &count),
+								 outputs, &count) == 0,
 								 "Unable to find MST outputs\n");
 
 		for (i = 0; i < count; i++) {
@@ -194,7 +194,7 @@ static void do_modeset(data_t *data, bool mst)
 		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
 								 &data->display,
 								 data->output, outs,
-								 &out_count),
+								 &out_count) == 0,
 								 "Unable to find MST outputs\n");
 	} else {
 		outs[0] = data->output;
-- 
2.25.1


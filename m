Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1023C25B76
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 08:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAF510E56C;
	Tue, 11 Jun 2024 08:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Obw1/lWR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7FB10E56C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718093079; x=1749629079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4HOBD34iGE9/lXYJKanlVaysX8vzeOwFhxx2RdgAf/4=;
 b=Obw1/lWRreaGpvF4dQuGndD/cgqQsFHHdeuLMYCGWOUTlb+2oD3dIYb7
 JV7kLYrI0VMWrcngyTh1ClZajTrFZsjtlIBxEJ42XMyqBQi5V/xctMZLF
 gHqhyiywU/TzI7sX1GoJfVY09h50ts4lWzmXtdAa9XpGuAumLgKFpg2xY
 Xhna4lUuKSJ8tWkTLHtEkAAP6sgyJ6zar8v46baiCQkTKt4p7oC8N0IQG
 gbqaNKRhunZl/VVsa6IFsLLckbNtw38rdTdsdu6nEp6/3QIREV7sfCHNu
 YKcupOkXBkegc+5lk2hJlmg0Q9h5O5R0sQdOnrHTdOOAMaNsGeQTrgWog g==;
X-CSE-ConnectionGUID: OVfGZT3NQxi0WlTYOfKfmg==
X-CSE-MsgGUID: sBsRXgpnQie/7XjhSdDcZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25907330"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="25907330"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:39 -0700
X-CSE-ConnectionGUID: VLWA/LU/QTq1j3b9jUJbYA==
X-CSE-MsgGUID: tVEfdsgESAGkZiILq1tsxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39336147"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.127])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:37 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v3 4/5] tests/kms_dirtyfb: populate modeinfo before
 feature support check
Date: Tue, 11 Jun 2024 11:04:15 +0300
Message-Id: <20240611080416.56878-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611080416.56878-1-vinod.govindapillai@intel.com>
References: <20240611080416.56878-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
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

Drmmmodeinfo is required to identify if there are any FBC size
restrictions applicable to identify FBC is supported for the
required test. So update drmmodeinfo early for each valid output.

v2: Fix patch description (Jonathan Cavitt)

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_dirtyfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 2a32fab56..c0eacda9b 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -180,8 +180,6 @@ static void prepare(data_t *data)
 {
 	igt_plane_t *primary;
 
-	data->mode = igt_output_get_mode(data->output);
-
 	igt_output_set_pipe(data->output, data->pipe);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
@@ -328,6 +326,8 @@ igt_main
 				for_each_valid_output_on_pipe(&data.display,
 							      data.pipe,
 							      data.output) {
+					data.mode = igt_output_get_mode(data.output);
+
 					if (!check_support(&data))
 						continue;
 
-- 
2.34.1


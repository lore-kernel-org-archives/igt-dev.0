Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75568CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 08:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BC310E841;
	Thu,  6 Nov 2025 08:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uq6IR/PB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D025610E841
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762419028; x=1793955028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E63UPamYxkDzrc26su+vcKBiJVCAhPYzHVheLNwoH7U=;
 b=Uq6IR/PBwNPam+u+krgebG5Dd3NW8xORP0Wz6FQ91QqaBjPG6YoYL2A8
 gv94neYbdK83E+JVcKVdsGky6PqqhPOMsOwna4qcPfFgF7GbZQj2tO5Mz
 Ky0UPeWbUeKxucHUXCpjGeV4EZlnGT1nBjDshrXlXyJ4b4f5wPgcUqAoA
 WHshzK9Mo0G++NeB14K1Y3rxY1Y1GFqjqtSFMwIvr0iUPSTWDfPTUOvj5
 91HJWGeZ3Gn/WrIQtxMEbsLYSlgmcFW7jaVbRkkl1uIgzcuEmyNf4FiGH
 wdvM24qsStX/horU6rjXL51C0hf4zXTfsvXphN9hrb0SPzcwJux/+b3Sm Q==;
X-CSE-ConnectionGUID: 4SFhFeVfTrujvRLNlzQnqw==
X-CSE-MsgGUID: EBLOipAYToWNkqma/sJoCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64646745"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64646745"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 00:50:27 -0800
X-CSE-ConnectionGUID: L+M/uaC3TTuXC1Ahj/swmw==
X-CSE-MsgGUID: qYgxtTqcQ9C0bnh6Uef8zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="186953410"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 00:50:26 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_psr2_sf: Remove unnecessary et_flag set
Date: Thu,  6 Nov 2025 14:20:17 +0530
Message-ID: <20251106085018.1755868-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

PR_MODE_SEL_FETCH does not require the ET flag to be enabled.
Setting this to true was incorrect, so fixing this.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 12c5b4fdc..9d63808de 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -251,7 +251,6 @@ static bool set_sel_fetch_mode_for_output(data_t *data)
 							PR_MODE_SEL_FETCH, data->output)) {
 		supported = true;
 		data->psr_mode = PR_MODE_SEL_FETCH;
-		data->et_flag = true;
 	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
 							PSR_MODE_2_ET, data->output)) {
 		supported = true;
-- 
2.43.0


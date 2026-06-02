Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5EBCD6E60
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 16:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9195F10F2E0;
	Tue,  2 Jun 2026 16:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoFn28hX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDAE10F2D4
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780416173; x=1811952173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GRqGNdgawBWMvUurClJgzhSCaeh4ai3cqr9/tUw5dQw=;
 b=DoFn28hXivhfawExiEQV4cdR0p0G/gsQcaWZEh2D7qbT+KNMuXH5BSqw
 llfR4weLSG/n7j/xEalMtZkp0ulP5DVsDPYGsrf40SRkiM22kF0OO2oWH
 vh3V6KLgmkJN4TTRi0cgeeJwNiWSUFBpLF2XKI3nofo0Dt1/R7emQ3hrk
 87cMf05IGeHN4dWVU0coxFTd/ReRAleRLOn5XN65J25oxBsOGjyBn08G/
 P8iWVzFDERaVlkhip49TulOyUiCYIV2u1Q4YDbQ2q4P93ou73zgobLWPV
 caW2JyzaLlsKkZ0LQTKfEWZIVRXUWQZJleLOwcZzQOnNlwR48vDr4ls2k Q==;
X-CSE-ConnectionGUID: Cvj6M6CvQ0ivfpiX5XQuug==
X-CSE-MsgGUID: RRskTYCYT42H7iRFZtdTog==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80943568"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="80943568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:02:49 -0700
X-CSE-ConnectionGUID: jVfIx9NeTceAcw0T7jQrMQ==
X-CSE-MsgGUID: 21K1kadjSWWJ6NrgNSNqxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="244052577"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:02:48 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, chaitanya.kumar.borah@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel/kms_pipe_stress: fix inverted
 condition skipping plane setup
Date: Tue,  2 Jun 2026 21:54:13 +0530
Message-ID: <20260602162422.3360253-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602162422.3360253-1-sowmiya.s@intel.com>
References: <20260602162422.3360253-1-sowmiya.s@intel.com>
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

The condition after commit_mode() was "if (!ret) return ret;"
which returned immediately on success, skipping the entire plane
and cursor setup loop. Fix to "if (ret)" so the loop runs on
success and returns only on failure.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_pipe_stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 36e3842c6..8724a674c 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -411,7 +411,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
 		ret = commit_mode(data, output,
 				  crtc, mode);
 
-		if (!ret)
+		if (ret)
 			return ret;
 
 		data->last_mode[crtc->pipe] = mode;
-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD26C27C6E
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 14:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189A610EC95;
	Fri,  7 Jun 2024 14:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RROeoTGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5395810EC95
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717772278; x=1749308278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sC7zjLOvW2fxqEvc8O5Wuh/fcUu23tL6nv0L7YDD0vQ=;
 b=RROeoTGg1SI1WdbyqhjmysWScaD8Tg0diATlC6T4/9ZCumgbLZw6dr5V
 sUCEiRF5rpyV1gJ+jdpi+1uFImnQy6SNNMW219cyFxiO75KsgzDVIIjKY
 KtRzPxCeURPscVO+sVRHrlC5DiLYq/GyjARLXIhiy3s3MsdKschdjPkE3
 phOsUU4nJnGeN63geEn/U+UWQn1yUXPjIN2toUAYRyHda8J1tQfNxHBjY
 s9pFjMlfzazGcnmCp3RZ31h/PRRg3kwSlwARLK2RYNVKXjhJgJiSzBX8f
 /48yo8KfR0H45npMWCxh0sko+/GdSSzyMTV7UIK92Ym7GyUhTmiILZFql Q==;
X-CSE-ConnectionGUID: 1barMBeBQv+V9Po+xaCHPA==
X-CSE-MsgGUID: 7YGgdxt1REGBG5lE69UP1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14331624"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14331624"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:57:57 -0700
X-CSE-ConnectionGUID: wfUqSF4OST2f/k3ye1umyw==
X-CSE-MsgGUID: b8KYGa2YQ/mp9VxbJSnRow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38926809"
Received: from unknown (HELO vgovind2-mobl3..) ([10.245.244.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:57:56 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH i-g-t 3/4] tests/kms_dirtyfb: disable psr feature only if psr
 possible
Date: Fri,  7 Jun 2024 17:57:31 +0300
Message-Id: <20240607145732.285557-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607145732.285557-1-vinod.govindapillai@intel.com>
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
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

When kms_dirtyfb tests are executed on cases where PSR is not
possible the tests are getting skipped. This is because igt_skip
is use in psr_set function. So avoid calling the psr_disable if
not necessary.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_dirtyfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 6121599ec..2a32fab56 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -169,7 +169,10 @@ static void check_feature(data_t *data)
 static void disable_features(data_t *data)
 {
 	intel_fbc_disable(data->drm_fd);
-	psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL))
+		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+
 	intel_drrs_disable(data->drm_fd, data->pipe);
 }
 
-- 
2.34.1


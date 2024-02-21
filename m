Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F104CC48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 11:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914C910E584;
	Wed, 21 Feb 2024 11:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3ZFILEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214FD10E584
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 11:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708514977; x=1740050977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bezRsB/WyShfS1mTpHbu/o50f05irKN3rTLbLZzj4PM=;
 b=m3ZFILELyGQ5n6hZKS4scvOW6PS0OkLVjiKqoDX+h7dUhxsmwhuti/Br
 ZBgnhpOJO+crHsKTqSUKCaTXWpvKWZRsQ6G/TCqmFjhvtqYswJu91G/r2
 k5LlNXmLlKDT8YwBNju4ZLpQjGgIhyiUJpKU6ih5ipB/v8xgoe4rm0qKE
 7lrJuNF3uMOQuAVTx2dP/R6lk50+EjupjSJeiPU9+f7xjkaJuNk9Xlhcv
 3o3IkOR4QZhtomTWx4Ve5076/5D7LLvCnmKVZL1a8vs0kUsOo6hDJrATj
 L8bMABvetrNZL1j42sBg2g7i7zCZLYbxCiY2FXe0GZcGfGh8BgdlB0Ms1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2576229"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2576229"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:29:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9748736"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:29:35 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_dirtyfb: Fix DRRS status check
Date: Wed, 21 Feb 2024 16:53:41 +0530
Message-ID: <20240221112341.2329405-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221112341.2329405-1-bhanuprakash.modem@intel.com>
References: <20240221112341.2329405-1-bhanuprakash.modem@intel.com>
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

Fix assertion check for DRRS status.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 26b82e50a..0e315bfb4 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -154,7 +154,7 @@ static void check_feature(data_t *data)
 			     "PSR still disabled\n");
 		break;
 	case FEATURE_DRRS:
-		igt_assert_f(intel_is_drrs_inactive(data->drm_fd, data->pipe),
+		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->pipe),
 			     "DRRS INACTIVE\n");
 		break;
 	case FEATURE_DEFAULT:
-- 
2.43.0


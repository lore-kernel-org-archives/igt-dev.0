Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22433CCFA06
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1B10E3A8;
	Mon,  3 Nov 2025 10:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keLA+4R2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48BE10E3A3
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762164251; x=1793700251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nNKaHZFxJCmZZAfU81TafStUFHeaGayQJk8pCG0iHgA=;
 b=keLA+4R2rVmXPBTWiU27ulntQCTmfbY/w+knGafNta/PPNYMd4LgUTbb
 h9vQXhte+A8Yblw7JS3N8kUDo9H5GRE4gk822U+yW771j7E+aLwWU5g0h
 gwZ49G0sAhSWMIVbABstBu89LnZZLLjLK5VkQYx1Q3g1rJvV32scGSfQT
 2Boc+/LytpHgw9TFreukEIivsKUfDlLTlRWrLIEhAAopFX6CXqTHKm1mX
 Jwf+Uc34i8qfi7RTzpl3h+m42TIkB9Ex9+SLwPwzyFmPtXIjNnEycbJKB
 5WrHdJFNTc201+XzL4HhNuh6rK1Sqhj5idq9NonFHgsPdSZhD1xChgpRi w==;
X-CSE-ConnectionGUID: 93is7KloQ8Gf2NAdRp25Cw==
X-CSE-MsgGUID: mSnG84OrRiK2s56pCFsJ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63440359"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="63440359"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:04:11 -0800
X-CSE-ConnectionGUID: aPSRLemJSS6OBQIL0nMd8Q==
X-CSE-MsgGUID: XBO7erMbS4q+eAFPJTQSTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191936784"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:04:09 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v10 3/3] HAX: Add xe_survivability tests to fast feedback list
Date: Mon,  3 Nov 2025 15:29:22 +0530
Message-ID: <20251103095921.3889090-8-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103095921.3889090-5-sk.anirban@intel.com>
References: <20251103095921.3889090-5-sk.anirban@intel.com>
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

Add xe_survivability to xe-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5f27baafb..d18a44610 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -187,6 +187,8 @@ igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
 igt@xe_survivability@i2c-functionality
 igt@xe_survivability@runtime-survivability
+igt@xe_survivability@i2c-functionality
+igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA589D6392B
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 11:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A531910E706;
	Wed, 20 Nov 2024 11:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/RlD8I4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B7B10E706
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732100436; x=1763636436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wMEBUepqYlu5zLqU4b4teFAjWBJTkl0XDGt8Ip2RAMY=;
 b=H/RlD8I4rCQMbfRvpxajay+7+Nh1zTZP+p2F+XWl31Qh2AObMerbVQh4
 nmHy54rKGm6UtbVp1NpLUEB9xEOsu8GNGTyS1WoEpm99/liiI2RVAVHzA
 22qbXXvXe0andOd4nthTsD2Nkn6xsBnbm6kwVpBgMvHFZVx1rR5S/Q4Ho
 k9fgfIpzqq9K7tVRm1i6/uiU4nS0p/LSJqzOmprybc8kUjrapoQ4kHDJs
 nJZdcy3IoRrrOrEl3/0w0LJYCJ76rGBfATncMc8gDuJKyVtcwAOZ8jbhl
 BculINS63iDixvllUC5PnTUTPcwD4KIHf30eauwiXnA9A6cJjVVtd2E4L A==;
X-CSE-ConnectionGUID: B+Ewq+RHQ+ex/Vrj9ynz0g==
X-CSE-MsgGUID: RHsZpaaDRTKH/Mwkpc7Lwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32081910"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32081910"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:00:36 -0800
X-CSE-ConnectionGUID: xA92WqrVS6ufkupgp57UZQ==
X-CSE-MsgGUID: Pp5ARC5iQ8OioRFIuWuS5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="94334632"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:00:34 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 3/3] intel-ci/xe: Drop PSR + DRRS tests from blocklist
Date: Wed, 20 Nov 2024 16:19:40 +0530
Message-ID: <20241120104940.2147075-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
References: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
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

As we decided to drop all subtests with PSR + DRRS combo,
no need to maintian the blocklist too.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index b76f6061c..e29e745a0 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -75,10 +75,6 @@ igt@kms_pm_lpsp@screens-disabled
 igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
 igt@kms_pm_rpm@.*pc8-residency.*
 ##################################################################
-# KMS: Invalid combo:- PSR + DRRS can't be tested together
-##################################################################
-igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
-##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
 igt@kms_prime@.*
-- 
2.43.0


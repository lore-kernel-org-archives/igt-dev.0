Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76D1D63926
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 11:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35F10E705;
	Wed, 20 Nov 2024 11:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhUJjv1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7360910E705
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732100434; x=1763636434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8tXbUhATVOdD9Nxh0ZwhgxJJAjmCE7KlTQoWVcLI4zc=;
 b=OhUJjv1Vj34uhRMvAJNQSOt/W4wsYfz8sK16Tz/Q8GAvgEMBh7D5cRRZ
 gE3/HSRpnhjrB5Xmk1+1ADGmfAIBnGvXbFkkNrmvHm1HtNnaUmk+zFSIf
 QwsbIYYtEENTkr8goIGCx2B0OhbY0WQY64AxO0PYi55QXllSejuzssxNB
 5KLFhbsaxn9s3KI4wK3H000sW5oioxScbD/NvGDpWZ1KY69pJq51zYYX3
 Ml10FD/EOArcIzDXFNgibN5zUaeo0fNzTG8IfuboyO5ZXaQZUylNFOPWv
 WsIUgnS0HV/IwWWPZmlu/OPF2/U//80Lq1fSPmhVAFEadTdmMSPWY1ROX w==;
X-CSE-ConnectionGUID: r4AFRfxnQSuSFjaEQ/SR+w==
X-CSE-MsgGUID: 4P++AuGdRTaA2NUiRFTK5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32081908"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32081908"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:00:34 -0800
X-CSE-ConnectionGUID: 061/i/f1QBaeBvU9G5slSg==
X-CSE-MsgGUID: HNKjC02MRt69ftRUKS4Gkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="94334622"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:00:33 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 2/3] intel-ci/i915: Drop PSR + DRRS tests from blocklist
Date: Wed, 20 Nov 2024 16:19:39 +0530
Message-ID: <20241120104940.2147075-3-bhanuprakash.modem@intel.com>
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
 tests/intel-ci/blacklist.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 775a4de0d..1236b8280 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -83,11 +83,6 @@ igt@gem_exec_alignment@pi-shared
 ###############################################
 igt@kms_frontbuffer_tracking@.*drrs.*
 ###############################################
-# Invalid combo:- PSR + DRRS can't be tested
-# together
-###############################################
-igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
-###############################################
 # Tends to generate invalid configurations
 # using CCS planes or configurations that
 # exceed HW capabilities resulting in sporadic
-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B9C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 13:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2E910E179;
	Wed, 17 Jul 2024 13:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jK+cXYe0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749D010E172
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224695; x=1752760695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HX3LR42pKss/PGT64zOSY0Ctal+j9duIPcSubRTLy1o=;
 b=jK+cXYe0Z09f3Dg1bCfmm997/JDjFQcd3IYECb2KucqIxYTae6hIC9Bf
 kc5qXOrQq9bUD8Ip0/fSSy01Q9+nHwj4NnrcS6CZ8xLCuAUjlQXFNhpta
 XI6+xuTbXU9OkztS6Rj+Eqdq0IVnEkRZaGBjOjdpNq1to2VNRBuAuCgs5
 m+JzfBkmwLxCIqHOasAU1y0iKKgaIbJMB8iC7VHJfYlFoVpMA2AD4iacf
 1Uy21clv1yhuiqc8CARGDsySQbmhA/bB0hbwmQfUhwyZxxeBk05sYF/Fz
 mfVRtgu207J2E6kctt9GQmD3dLYLBxh7+4TNBMQhyb2qthJBoCoUaOrX8 w==;
X-CSE-ConnectionGUID: xkgqR3UFTDGN9SX+/Vo3zA==
X-CSE-MsgGUID: VoozWciLQkW0tHmPoBiFng==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18917298"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18917298"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:58:15 -0700
X-CSE-ConnectionGUID: yNHnR8f8TPun1yTrinoXjQ==
X-CSE-MsgGUID: n3ASoC2+QiyVysAk1cyH/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54919591"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 06:58:13 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/3] tests/intel/kms_pm_dc: Improvise the deep-pkgc
Date: Wed, 17 Jul 2024 19:32:22 +0530
Message-ID: <20240717140225.640086-1-ramanaidu.naladala@intel.com>
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

Naladala Ramanaidu (3):
  tests/intel/kms_pm_dc:Add basic validation checks to achieve deep-pkgc
  tests/intel/kms_pm_dc: Update deep-pkgc function
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 169 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 275 +----------------------
 tests/intel/kms_pm_dc.c                  |  42 ++--
 3 files changed, 31 insertions(+), 455 deletions(-)

-- 
2.43.0


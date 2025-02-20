Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21006C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 12:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF46E10E163;
	Thu, 20 Feb 2025 12:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5/fwOvY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8B610E163
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740054106; x=1771590106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EOSskACPr2Joyyq722cmm90hYwjUSjCuWRqrnLhS3Xo=;
 b=D5/fwOvYie+T/6HT7rSOE2SxrcUSfbzRdaPfdLFxvdesgLcU6XJ2kmpe
 oxc2I2BB1azHIBaYouyop3lI/3Yg+sp/+m6sg9JBErjCoSACi3kVYItJf
 nP6UmyhP3ZC08MP5MlLWN2IRydhw/YriqLQWbYZJFQ+3vXu2Bp1fpfHHF
 tDrmry+GCAgEsA+zNNrD08DJoekHcwByzZZFt4/+FHfzs8Fr6w7erAhTD
 669rh6NtsxIAoaPZ6W+xX6LHRbUs+wHAn9Boivh6/j/vBb1+xuw/u8a19
 E4HqDMHkj0LaNEnRS2d72X/SG9fbOGNhCWT2HeS8wkjH4wSnNVPyqVFGR Q==;
X-CSE-ConnectionGUID: mxJNwUZSTN2JXq946NHWtQ==
X-CSE-MsgGUID: MTUSp7uKR46+wubTfyZG1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40697030"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40697030"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:21:45 -0800
X-CSE-ConnectionGUID: eoEcI2ITTJyENFdVMvbRgQ==
X-CSE-MsgGUID: 4m4JYi40RCqyIpOUekLVrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120251257"
Received: from slindbla-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:21:43 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v1 0/5] updates tp FBC PSR combo checks
Date: Thu, 20 Feb 2025 14:21:26 +0200
Message-ID: <20250220122131.221907-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
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

The FBC PSR combination depends on platforms capability and 
issues. So have a common function to check this support and
utilize that in all the existing tests which depends on this
combination

Vinod Govindapillai (5):
  lib/i915/fbc: fbc psr combo support check helper function
  tests/intel/kms_psr: update to FBC support check
  tests/intel/kms_frontbuffer_tracking: update to FBC support check
  tests/intel/kms_psr2_sf: update to FBC support check
  lib/i915/fbc: fbc psr combo support update for xe3

 lib/i915/intel_fbc.c                   | 21 +++++++++++++++++++++
 lib/i915/intel_fbc.h                   |  1 +
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/intel/kms_psr.c                  |  5 ++---
 tests/intel/kms_psr2_sf.c              |  5 ++---
 5 files changed, 27 insertions(+), 7 deletions(-)

-- 
2.43.0


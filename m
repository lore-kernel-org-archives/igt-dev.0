Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D378C27C65
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 08:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409FC10E565;
	Tue, 11 Jun 2024 08:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeMeMvLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D50110E565
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718093069; x=1749629069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iuMLWpgL4FbLSF4eX+IOIhAFDtDs7fK8kQ3sFJMWif0=;
 b=ZeMeMvLym9ephh2kBqB4Fk6EaR3u/0GRg4utnjQA2MQOmDwj1i0/PkiL
 xHmzQtjhRc011xHki13KwGxNJ6R2V0Raq8mpyzWPKYTtz9OYmPEbv+gC8
 WrS1TZ0ng73bt42U9myqSHx4Iq4Z2LXC8urr+DQe1v+3xJnMPd6HYHiIh
 aCCE1/U9rkivb9BBiC8UrhWDyI5zUj8SDwi4NJSAVMhdDxFsDypD8wvtA
 HN853/D+lWHem48h1JaboyJhmK87+g+ix66+Ueo/7i5BaLksiOsh97dDq
 W8vRIPwWafO7kmONxkFMr99LA8pLxcc6fUhw/F1USM4yTioMuuFkPHrQP Q==;
X-CSE-ConnectionGUID: aON/IrDoT8e68B92kUB2/g==
X-CSE-MsgGUID: ChuFiHd2RMyWKgmMBcRZFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25907308"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="25907308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:28 -0700
X-CSE-ConnectionGUID: 2Rv3dNiyQseiF/4Jy8sa1A==
X-CSE-MsgGUID: SXR0ttDxSNmEhlJ6bKXGGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39336131"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.127])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:27 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v3 0/5] tests/kms_dirtyfb: few fbc related updates
Date: Tue, 11 Jun 2024 11:04:11 +0300
Message-Id: <20240611080416.56878-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add check if the plane size is within FBC enforced restrictions otherwise
skip the test. Some updates to FBC debug prints to make debugging easier.
And disable PSR feature only if psr is supported by the sink

v2: Add a function to get max plane size supported by FBC
    Fix a build isssue by updating the usage of drrmmode info

v3: Fix to patch description and Rb-ed tag updates

Vinod Govindapillai (5):
  lib/i915/fbc: print current fbc status if cannot be enabled
  lib/i915/fbc: add fbc frame size check helper functions
  tests/kms_dirtyfb: disable psr feature only if psr possible
  tests/kms_dirtyfb: populate modeinfo before feature support check
  tests/kms_dirtyfb: ensure plane size is within fbc supported limit

 lib/i915/intel_fbc.c      | 61 ++++++++++++++++++++++++++++++++++++++-
 lib/i915/intel_fbc.h      |  2 ++
 tests/intel/kms_dirtyfb.c | 16 +++++++---
 3 files changed, 74 insertions(+), 5 deletions(-)

-- 
2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1888C021A4
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 05:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF69D10E1B8;
	Wed, 26 Feb 2025 05:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6m/2bpT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B52B10E1B8
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 05:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740546262; x=1772082262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DJPtvTQmExrSwa9vyk5Q0nggzhLc7jZ/DnnrZUByuvA=;
 b=g6m/2bpTknQ6tGlECYtsVkmCt1S9c22p79/GkqXxzZw+Uk7qZUxm04ER
 qX22/SnGZl7FDsBda1AjsoO6uTWlqEzOxLgAv3siR28zgy1kedjGEfkh1
 qttEe7aD1vmvQGx+AM/J7CucQtAB17BGPcTNchi3gHE9RRy/7M57D55oF
 54xQCtcYlHOXhvv5LsAMwRUeJzSLwS8d1wFYaEC1v+LFfzxn7vPSSsdlV
 YkQJS1n2ax5wG4rB7zQMN70/QvZiK3QUU7dU0Q+qSLsOzP/uqKfOPPaA9
 moaIPwAsjaV8EE5ii2307oJhnJWPtQECOTsJUCyBqhc6w7F9AkN69DSN0 g==;
X-CSE-ConnectionGUID: gUBlGmN/Te+cCqH90x/Jyg==
X-CSE-MsgGUID: /pVZrEiPQgqQZVFeSAtQMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41396967"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="41396967"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 21:04:21 -0800
X-CSE-ConnectionGUID: cNAGitzCRO+XI+AZsMiGew==
X-CSE-MsgGUID: 3aDnykOERhCab+kIVDi48Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="116599472"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 21:04:18 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 juha-pekka.heikkila@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/1] Add FBC Dirty Rectangle tests
Date: Wed, 26 Feb 2025 10:30:32 +0530
Message-Id: <20250226050033.2399357-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

This feature allows FBC to recompress a subsection of a frame.
When the Dirty Rectangle Enable bit is set in the FBC_DIRTY_CTL register,
and there is a sync flip indication, display will read the scanlines
between (and including) the Dirty Rectangle Start Line and End Line,
in FBC_DIRTY_RECTANGLE, from the uncompressed frame buffer.

Utilise the FP_DAMAGE_CLIPS property in the below subtests to validate
the feature.

1.Implement basic tests for Frame Buffer Compression (FBC) with dirty rectangles.
2.Add tests for dirty rectangles outside the visible region.
3.Include tests for dirtyfb functionality.
4.Support different formats in FBC dirty rectangle tests.
5.Ensure proper CRC validation for each test case.

Santhosh Reddy Guddati (1):
  tests/intel/kms_fbc_dirty_rect: Add FBC dirty rectangle tests

 tests/intel/kms_fbc_dirty_rect.c | 568 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 569 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.34.1


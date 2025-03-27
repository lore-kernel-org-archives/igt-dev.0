Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC8FC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 07:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4C210E868;
	Thu, 27 Mar 2025 07:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRI1jGha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34E510E868
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743061598; x=1774597598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IcDITOnNKUkMB80yDHdRwyxtIz90i+xoVjyZmZCVlMg=;
 b=FRI1jGhakvSM6ePm7oJIk7QaHfzWLQfvAEreD5T24Mh3ibMa+piOR9eU
 L2QeKEC6pQRRBrH2YbNTE3PRNnAvlgXfvsq1hTPd8xD3udjUr1hIWmqwD
 GNNuwLQGVU4St41wwCJ1ixXsDQiaymT3o+7Hr1Fv0faS6zia4P3o4+d3W
 ylc5aHgXYB1mtUeNprh+5EmrV7NfRYXrODUYGoEbNLt5Xx6vYPKUN0D+O
 VMsm19EpUFZKCMz9Am+ibcGzFlp7E4wKEethJ4zNAykATaGLL8Wm6vEJD
 nzmxjW53GNgibfIDj+wXSNG9/p9o2NAFM09RJZRGfcDvsD6yCs0MmOceL g==;
X-CSE-ConnectionGUID: BQ3JOLItQjqZDT6HK5IAoQ==
X-CSE-MsgGUID: 6udMkU4aR2+IhmSmUWBnfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="31979898"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="31979898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:46:36 -0700
X-CSE-ConnectionGUID: /NVcndeeRWqE/kVklOymEg==
X-CSE-MsgGUID: iNlohMVBQBmVcvtRZuekPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="162288275"
Received: from carterle-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.8])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:46:34 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jouni.hogander@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v2 0/2] lib/i915/fbc: update fbc support based on psr
 mode
Date: Thu, 27 Mar 2025 09:46:18 +0200
Message-ID: <20250327074621.559200-1-vinod.govindapillai@intel.com>
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

Update the FBC support check library based on the psr mode
Also revert the changes done to fbc multiple plane test. It was wrongly
checking the fbc support associated with psr mode.

Vinod Govindapillai (2):
  Revert "tests/intel/kms_frontbuffer_tracking: update to FBC support
    check"
  lib/i915/fbc: update fbc support based on psr mode

 lib/i915/intel_fbc.c                   | 47 ++++++++++++++++++++------
 lib/i915/intel_fbc.h                   |  4 ++-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/intel/kms_psr.c                  | 10 ++++--
 tests/intel/kms_psr2_sf.c              |  9 +++--
 5 files changed, 53 insertions(+), 19 deletions(-)

-- 
2.43.0


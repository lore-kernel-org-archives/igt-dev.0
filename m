Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A214CC3DA45
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 06:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5184F10EC12;
	Fri, 12 Jul 2024 06:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3vshQHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9A910EC12
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720766764; x=1752302764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zHRhY/ws7lFShiofUnSyNjxN7i0wmTXHVRXA2b2II+I=;
 b=P3vshQHfDqakw+h4qwZxAoEH3EJEnZqfuJJcmtojjtug8ohRdFKBFIq4
 ZfD81h9GOIUOlOxHSexBM+BkpVLjn/uwBXzwgPF2I/ulnuHdruM5rRMQK
 dqTNpnzYStQ9CbJnwftorDqmnwqwSDreBe6ZNoxFiQj/uLwyPLlUlySCs
 98xoNEdgl272mrkZqFK3aZ0UromAPC+FA3Mj/XPTAwCwy0fpZSDdgKzgC
 ikoEfXW71VuYyRGfFFo2zvdtmOFd7TaIyqjnxH/TSUYHouUjCZlYnCzuI
 VZLt7TqKXsm0PbcxQ0EIW99a95B3YMafrbhPeRvCkMBMf+dC8XTGuX76P Q==;
X-CSE-ConnectionGUID: 6vicSJreQ1aFD1B8t27BDg==
X-CSE-MsgGUID: 8DaJJQEKQQqyIm+KGRe91g==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18036264"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18036264"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:46:03 -0700
X-CSE-ConnectionGUID: tQ8/iwteTRaJ/5v8BJglcw==
X-CSE-MsgGUID: nrY7ngBoRnSMnfZI4pW4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48728671"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 23:46:01 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/4] tests/kms_plane_scaling: Improvise the scaling BW
 issues.
Date: Fri, 12 Jul 2024 12:19:59 +0530
Message-ID: <20240712065003.530021-1-ramanaidu.naladala@intel.com>
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

Naladala Ramanaidu (4):
  tests/kms_plane_scaling: Improvise the scaling BW issues.
  tests/kms_plane_scaling: Update the single plane scaling function
    arguments
  tests/kms_plane_scaling: Update the multi plane scaling function
    arguments
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 202 ++++----------
 tests/intel-ci/xe-fast-feedback.testlist | 322 ++++-------------------
 tests/kms_plane_scaling.c                | 264 ++++++++++---------
 3 files changed, 240 insertions(+), 548 deletions(-)

-- 
2.43.0


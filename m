Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C4DEC1EA6
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 11:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C2110E870;
	Thu,  5 Feb 2026 11:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFBbkKfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6419E10E870
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 11:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770291345; x=1801827345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3D9lMErcvV5m01Y3r8rZSLDVNSPh/X1nQf+qomNxnC8=;
 b=KFBbkKfaWjuwLOun4zVd0NX9Gwqm3wLQT+lOCcCa+V5Oq7tRoBBWSafH
 Sr5YTj4coAYU+uUWgoDyGHNpsUZK18Kma4NUA1LqBLnV5pQpxpjUajkzX
 f/vT9Ifd/UqFg6sgd8w4tn4DOzg+b+6+0dGyoYXRLs3ra4qXgFWaAdJSH
 IXL4zNyvBwduABmMvODW54Fyg2ur8gWQbTKGQf7wHDepNsl6xpE82Oe8p
 NEkhWg16nmEr6gwmCmZDSj0SlFP1jTaV2bPRI/LXI8UtFT5pfHipg5Y7m
 1OgT2YgkULuABJp19Kf/HRqnwbOEoBwnVR7KGEN7FR2Zo04irnPlBBlua g==;
X-CSE-ConnectionGUID: aHmXyaUtSZ29JQ9P3ZRmcw==
X-CSE-MsgGUID: DAKqTb6SS0Cv511jpXOrng==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71386086"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71386086"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:35:45 -0800
X-CSE-ConnectionGUID: rh86APy+QhmWXpx0F9IQRQ==
X-CSE-MsgGUID: y5CkSjauRpWrV2ILpmb7LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="248096020"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa001.jf.intel.com with ESMTP; 05 Feb 2026 03:35:44 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/2] tests/kms_plane: Refine clamping and modifier
 skips
Date: Thu,  5 Feb 2026 17:16:17 +0530
Message-Id: <20260205114619.1054849-1-pranay.samala@intel.com>
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

These changes avoid running source clamping tests on cursor planes and
skip modifier subtests that are not supported on the target display
platform.

Pranay Samala (2):
  tests/kms_plane: Skip cursor plane for source clamping
  tests/kms_plane: Skip unsupported modifiers

 tests/kms_plane.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

-- 
2.34.1


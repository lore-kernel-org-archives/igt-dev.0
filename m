Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3FFC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 04:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205E810E0D7;
	Mon, 26 Aug 2024 04:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiD+yuUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DEF10E0D7
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 04:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724648066; x=1756184066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mYiBgnv14uWJbuCbsy6EKgWDzCUmJjMcQF1QDqBz/IY=;
 b=PiD+yuUvZHocWoZcHnMtZLS/hWYDka7H8lGKWkNE/odbBg0BN3CTMpCx
 RASztedacn8P2BHTHXn2A+ho+AuKAZPHMXIdmArzkBXcMpXG8RjnylU6o
 LXx4KPZfx1fNv0LfxbInPSYqTzWOvhx8vNqY8Z7OH5UVzcCHmY7vhLNcd
 tMSw01ohNgyqmszjSiQJeW59V6whNd0rH2ZdTyAMZ9j/CRNf/a3RWlYTg
 VDcRTaGVESXKZOPw6W0D6zrPDQBE4lgyDK0wI3PnpPuXRiqqMLfFbT8rQ
 avsDmMwb4OrfcYAol4A8glT6CFsg49bOfB095Tswsp1snKevDrby7fgkL A==;
X-CSE-ConnectionGUID: 4RhplEiFSS2T2qynAmvW1Q==
X-CSE-MsgGUID: U7zlBnR9QVC9DTHyjN2tAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26815328"
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="26815328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 21:54:18 -0700
X-CSE-ConnectionGUID: WnaPmZjfS5KMYfnPD9Ms0A==
X-CSE-MsgGUID: sgXXxti1S2W/5P78Nna3QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="62363961"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 21:54:16 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/3] tests/kms_plane_scaling: Update scaling
Date: Mon, 26 Aug 2024 10:23:47 +0530
Message-ID: <20240826045351.1340125-1-ramanaidu.naladala@intel.com>
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

It will retry scaling operation on next valid output if current output
is unsupported.

Naladala Ramanaidu (3):
  tests/kms_plane_scaling: Update scaling functions to return error
    codes
  tests/kms_plane_scaling: Update Multi-plane scaling functions
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 212 ++++-----------
 tests/intel-ci/xe-fast-feedback.testlist | 319 ++++-------------------
 tests/kms_plane_scaling.c                | 299 ++++++++++++---------
 3 files changed, 268 insertions(+), 562 deletions(-)

-- 
2.43.0


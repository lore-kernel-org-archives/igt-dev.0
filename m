Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9B3D3001B
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 16:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF7110E1E6;
	Fri, 18 Oct 2024 16:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLMtDX24";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3143D10E1E6
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729268309; x=1760804309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UFqp1v0VT+L0UuYekY+qlGs2dER3JcL4AETICKaToa0=;
 b=TLMtDX24JLXCLWgSbNFCBL1LOWtcRUcmHtyfMez2P/8HsR243yxSLqZs
 vJps9G7vQUtJmY3XXnCWKl67AMr7lhUYZZ7/51Uk2n/qraVp4zE0i0hUA
 tCtz8INrj87STeccDaLHNpHY6urU7YO/zlUYtK9gwn/IBnGdLX7bQQcHF
 O2j0WWZ7os7GMzOQDnKAkvRX05rnwkv5EChQBn3+rPEkhQGGrkMGsOIEh
 mCox+pzObxGn0A1H+67PDvweloOG1YhjS5Y6r4bcPyjQY1OYt+u8FmjSu
 tLK9kVMV9FlDZPOugrbnMg7YC9NndZXxP0gL/R6FNV2iSblYxjBHpa4Hu A==;
X-CSE-ConnectionGUID: xtTVHD97RTqKUsv5nJKpLg==
X-CSE-MsgGUID: +DqrHN17RoqTjZQqcqSRtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28685238"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28685238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:18:29 -0700
X-CSE-ConnectionGUID: KEXwWB2oScGMbvxFkZPtZQ==
X-CSE-MsgGUID: hlUoaoQdRuyIWg+vO+fOMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78571948"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.0])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:18:26 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Karol Krol <karol.krol@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: [PATCH i-g-t 0/2] runner: Allow limits at dumping dmesg
Date: Fri, 18 Oct 2024 18:18:18 +0200
Message-ID: <20241018161820.76014-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
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

There are two patches, first is a check for write error which could
happen at full disk, second is a revised solution to a problem with
dmesg dumping exeeding disk limit in runner.

Previous proposed solution: runner: check disk limit at dumping kmsg
https://patchwork.freedesktop.org/series/114353/

Gitlab issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Karol Krol <karol.krol@intel.com>
Cc: Ewelina Musial <ewelina.musial@intel.com>

Kamil Konieczny (2):
  runner/executor: Check for error at writing dmesg dump
  runner/executor: Limit reading dmesg to chunks

 runner/executor.c | 65 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 10 deletions(-)

-- 
2.47.0


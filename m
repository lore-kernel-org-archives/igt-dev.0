Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD1ECCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 05:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DE710E239;
	Thu,  6 Nov 2025 05:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VawaHJBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870BB10E097
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 05:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762407274; x=1793943274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y0G4PDGjE38i5OqoLyq7TjHUruZ3vjDAN8wqqhsSE60=;
 b=VawaHJBSH0ShbvxiQcePtDbaxyWeKReRYe3qJ/ZNuJxkHeqxSAB8m6pq
 UaivdsWFXPsXTscBqjA0Q25QypLeSgZgXmaKBAqRFos9bljnksqz4CbNk
 uhr+6NOlkvpvXV7IM+hZdYM5XMj/HJpwnYCoLrB9VC3WgHJORqNyymSS2
 Gu1pGYEMXqQfQ/Fd9DEShsGBsvB5yRRIGv3YzBw0t+YqVFig1g2WPrq91
 ZxBMDG5aEnrazanbwtWXq0TOEP01v9yaHRrZdX//IKGIEOAirZziDLwGT
 jzqjNl4r6bptgGrtLE273rM8y3gTEtjycNpaxhDo9Z0sC6tgjrwjZEYXw g==;
X-CSE-ConnectionGUID: nt0TvT8yQcS8j0fCEzr4Jg==
X-CSE-MsgGUID: q0fnpeRpR/S/UF6ILWCrhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75218495"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="75218495"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 21:34:33 -0800
X-CSE-ConnectionGUID: 65KNIAz+T3u/jvR7XAs4lw==
X-CSE-MsgGUID: NWd1JE6eTcmfKpng+wsFaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="192022359"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 21:34:31 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, balasubramani.vivekanandan@intel.com,
 kamil.konieczny@linux.intel.com, shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v1 0/3] Introduce NVL-S and CRI platforms
Date: Thu,  6 Nov 2025 11:04:22 +0530
Message-ID: <20251106053425.1731151-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.51.1
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

This series adds the basic platform enabling patches for NVL-S and CRI.

Balasubramani Vivekanandan (2):
  lib: Add Crescent Island Support
  lib/intel_pat: Define pat indices for xe3p_xpc

Shekhar Chauhan (1):
  lib: Add NVL-S support

 lib/intel_chipset.h     |  4 ++++
 lib/intel_device_info.c | 22 ++++++++++++++++++++++
 lib/intel_pat.c         |  8 ++++++--
 3 files changed, 32 insertions(+), 2 deletions(-)

-- 
2.51.1


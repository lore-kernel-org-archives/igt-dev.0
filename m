Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E9AC87FD2
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 06:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DC110E2F1;
	Fri,  1 Aug 2025 06:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ze7Wi6YL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8226310E2F1
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 06:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754030930; x=1785566930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MA7pnx5Ei9a5y1P+T4YwbtN3bbSDTvJGVElDyfhMyEM=;
 b=Ze7Wi6YLuJ8xgLmAJ8wAiT/ZAADiQwQlTWwbYkz0Q+9xrxuZicpMdlZM
 KtLmkrXi9ytmH4GATbWlZev/tqrfnQwhbHVM4gLLuFt36TSeieezOYWXV
 kkWuuRvRr9dFBBklYztw4TV4O8vvWFf74NIQ1YyQL1ZAdfLTum9TtrsB3
 Ridvfb62OpxtOmQzEytvMIz9uizx8sgIIbDipzSF0w3HXeszeC6XoZXfq
 K9xSTIO8zYJP2ccfuBl1hlGcE5VnTNPAS+WyOCQPnQvAG3wytadnj55xW
 9gCGOwCYAmzP1z6ONq2C7FbALT9Df/pK6CiJJlVRg/Qp1/HONfEoAimUJ g==;
X-CSE-ConnectionGUID: rIC0BirXTeaWI2KC863w/g==
X-CSE-MsgGUID: aMkjQ0OaQBmTgP2mJL50/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60014041"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="60014041"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 23:48:50 -0700
X-CSE-ConnectionGUID: RN826GsIQ92DhT48/7DehA==
X-CSE-MsgGUID: 11PHaVfyRHymxRsWTT651w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="168766692"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 23:48:48 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, mohammed.thasleem@intel.com,
 ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 0/3] Introduce intel_hdcp tool
Date: Fri,  1 Aug 2025 12:16:58 +0530
Message-Id: <20250801064701.911143-1-santhosh.reddy.guddati@intel.com>
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

Add a new HDCP tool for self-testing and easy deployment
to client machines. This tool helps diagnose issues,
determining whether the problem lies in the driver or user space.

Santhosh Reddy Guddati (3):
  tools/intel_hdcp: Support for enabling and disabling HDCP
  tools/intel_hdcp: Add interactive menu mode to tool
  tools/intel_hdcp: Display hdcp status in connector info

 tools/intel_hdcp.c | 284 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 266 insertions(+), 18 deletions(-)

-- 
2.34.1


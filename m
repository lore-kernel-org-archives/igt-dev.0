Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C06BEEB57A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 06:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F114A10E03F;
	Fri,  2 Jan 2026 06:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZsDAFLL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9217410E03F
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jan 2026 06:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767334232; x=1798870232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=33M20Pp6Mwp5ur1nQDy6zAo75bxwryFfDJU3yxufQ+I=;
 b=gZsDAFLLPt8+ZLTS292H1EII7U+GH7lM9iIfE3+plHbQZG0FGKlb0HKV
 s0yUcRLLaX7Brw3nyLl5J4EqaLqWGYvQX9J4Wa+yOSXmjcHsSIIAU34iS
 V3q3gm//bfP4+aiSbNJIThANp3Mr0Y20gVSvlnrestMAVQxJuwKrm+r33
 PcABLlCbynyi073u2RwWVYTcDEXG4awGYHKG0vWxlzz3njrIkGvX9YpVH
 KyKxNMnL7s20fsGOLmQfnGOa0VVjtyyL69u6gf3yrJ04e1MMjhKHvJ/Xj
 /fp/zE963CLKGqbM1G+nVYyFC3yqnBKuqBR8B9ec7kWIvFvbxVRwEj3Qx A==;
X-CSE-ConnectionGUID: N+z7hR6JTHCIOdzhuEtAJA==
X-CSE-MsgGUID: qfpdE67uQmGUUaG/5Co6sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72684653"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="72684653"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 22:10:32 -0800
X-CSE-ConnectionGUID: qzYMH3IVToih9NftSBAkIQ==
X-CSE-MsgGUID: tnQWTg8ERzy8cndNkZGg/Q==
X-ExtLoop1: 1
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 22:10:29 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 0/6] Introduce intel_hdcp tool
Date: Fri,  2 Jan 2026 11:38:29 +0530
Message-Id: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
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

Santhosh Reddy Guddati (6):
  tools/intel_hdcp: Basic init and cleanup for hdcp, constants, enums
  tools/intel_hdcp: Helpers to get/set HDCP and report info
  tools/intel_hdcp: Interactive keypress thread for menu
  tools/intel_hdcp: Add video playback loop with thread
  tools/intel_hdcp: Add interactive control with playback
  tools/intel_hdcp: Implement timer to the video playback

 tools/intel_hdcp.c | 608 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 578 insertions(+), 30 deletions(-)

-- 
2.34.1


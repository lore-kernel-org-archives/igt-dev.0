Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088A4CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 07:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BCC10E222;
	Wed, 24 Sep 2025 07:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GECIUQ4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D42510E222
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758699145; x=1790235145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AHdEOLqPyjehox3rri3u18dbIl35OIxd4rFXSBjXh7k=;
 b=GECIUQ4mliCMZaGaKwsY7w5PUXd69x960CUbeSEwWxbwlMkx3rGadwVX
 8cmgjqiHciYnbpXXTmuedpzu6/EWzPeVeFl/+BqVb9XUMfWjg9HO/ygN2
 qztDNGiDwRx4P4YVna/bF7oPlH97UnJpW/bUmhy6VATymh17+LHd7zGV7
 8F6fU+bwVG2oMegUNfOYEfElF+H7C0uwUHwNsdH7nth6+wJXNJxDCCd7u
 MIA4uvH4QII3zPcdRn9h7hwv1S/pJJL37FtpKeYT1LF0xTDtjqJ6iwCN0
 C0RgE1MSrMfdptF+9rTcF3UJ3ZVKIeH/O8dqRAhxoUWvY6sVG+jFaMOvz Q==;
X-CSE-ConnectionGUID: RdLo28OLS96W3Gl5fmPy5A==
X-CSE-MsgGUID: 3HYEr8vpQQenydB4Fbq+3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86432561"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="86432561"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:25 -0700
X-CSE-ConnectionGUID: yGTCWPUrRDmN/z085Egtug==
X-CSE-MsgGUID: Hcbz6zyJQKesbsBzbihTjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="214092827"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:23 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 0/6] Introduce intel_hdcp tool
Date: Wed, 24 Sep 2025 12:59:34 +0530
Message-Id: <20250924072940.413695-1-santhosh.reddy.guddati@intel.com>
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
  tools/intel_hdcp: Draw menu on screen based on hdcp status
  tools/intel_hdcp: Helpers to get/set HDCP and report info
  tools/intel_hdcp: Interactive keypress thread for menu
  tools/intel_hdcp: Add video playback loop with thread
  tools/intel_hdcp: Add interactive control with playback

 tools/intel_hdcp.c | 525 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 495 insertions(+), 30 deletions(-)

-- 
2.34.1


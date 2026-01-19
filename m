Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AC8CCF2EF
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C94F10E42E;
	Mon, 19 Jan 2026 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRTlGwy+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4748F10E42E
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826102; x=1800362102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oWTOztAk6sclYzDNc2bV9JltE+HJQhn1StJxL6JCYWA=;
 b=MRTlGwy+xYHb8QObhl9VEWqJo9qUnlJWbB3NJ+I3eblB+RdN5OpVFHIe
 0Rw0ays0T+mkqbHlIbcTSftkNIo5IVVN1T7R9gcVa1xC8kVVOH4U++BoI
 VoC+NrmpT6qgycGnhAov8rQ4J5r3avPeBUgO0utvFgBaFbDx0FxsxLGpq
 EZ6dwiJCsOpI5qHj7zkspglEs6ljJFn+kyVPWtw7cPhebKcIwYSdELbYf
 vUKjGyuQ7du8hfWp3zT1H4Smo/xQmlG2HeMdyQJ5wS5TxboKsplyXQKHW
 JLSHN26BvvAyok3X/1UYz6/6Terd1OwOOfBu/2chYzmGFisN7J5UikgcO w==;
X-CSE-ConnectionGUID: AHAzIBxBTYyPPD6T1JtcKA==
X-CSE-MsgGUID: D4+wv4v8R5a6r/ASKl5eFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69769771"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69769771"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:35:02 -0800
X-CSE-ConnectionGUID: X4wjnH9KSeGnWq+BsfVJPQ==
X-CSE-MsgGUID: v0Uy2Q3IQOergOS3F1Btdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="206211389"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:34:59 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 00/10] Introduce intel_hdcp tool
Date: Mon, 19 Jan 2026 18:01:32 +0530
Message-Id: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
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

Santhosh Reddy Guddati (10):
  tools/intel_hdcp: Basic init and cleanup for hdcp, constants, enums
  tools/intel_hdcp: Rename variable c to connector
  tools/intel_hdcp: Add helper to set HDCP properties
  tools/intel_hdcp: Add helper to get HDCP status
  tools/intel_hdcp: Add helper to get HDCP content type
  tools/intel_hdcp: Display HDCP details for connectors.
  tools/intel_hdcp: Interactive keypress thread for menu
  tools/intel_hdcp: Add video playback loop with thread
  tools/intel_hdcp: Add interactive control with playback
  tools/intel_hdcp: Implement timer to the video playback

 tools/intel_hdcp.c | 687 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 657 insertions(+), 30 deletions(-)

-- 
2.34.1


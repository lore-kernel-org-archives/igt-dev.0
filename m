Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC1FCE7CE1
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 07:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106CA10E578;
	Tue,  1 Oct 2024 07:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCKjMyVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C70A10E578
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 07:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727768147; x=1759304147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QnT0+rY71UHybeDqcnDWooKugXLDaMQs0tVXYAhlNhI=;
 b=kCKjMyVJlAnfWHMVhml2QY7AbI1pdfyT6kN3P7P72Rgaj2M0WM9RvPDl
 BD0VEEOhGMvJ5jN4JUmC7f6sBde8gNb6qtusXjxcgVumfiz4PWxvBM7tA
 gY7dNOe6ECjgJV6TLJyyTw1OSaefYaS1dRPubTKVDYxNeTuNeTmum+6VY
 Qa02cPH5UdKerCu1vZjlRtBFRuPGcljx7x+xrLK+ZqvlIf+2oLBUFq+JP
 zwd647k6NFfSqiKdfbuj68w1a+DVVAj+MVhnBCDejEOWRiFc6BwRB7JrV
 +Dx4GsG1OTxlB/pvkbTAOUWttRbEmrIMv/w1w23c4lGY+PH++YNognXTk Q==;
X-CSE-ConnectionGUID: klhg0lSdTta7FndXLsPgug==
X-CSE-MsgGUID: UU5pWnPkQpe5mayGY/zsoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26839794"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26839794"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 00:35:46 -0700
X-CSE-ConnectionGUID: EEmBtZY5RImP8BaRm0J/sA==
X-CSE-MsgGUID: 9k7AFcRXTimefbbs2WfSmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="96924441"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:35:46 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/1] tests/intel/kms_joiner: switch modeset from uj
 to bj and vice-versa
Date: Tue,  1 Oct 2024 13:04:47 +0530
Message-Id: <20241001073448.2252300-1-santhosh.reddy.guddati@intel.com>
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

Add a subtest to validate switching from ultra joiner to big joiner
and vice-versa.

Santhosh Reddy Guddati (1):
  tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa

 tests/intel/kms_joiner.c | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

-- 
2.34.1


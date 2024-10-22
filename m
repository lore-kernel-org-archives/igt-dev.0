Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7E2D17157
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 02:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17B810E2E1;
	Tue, 22 Oct 2024 02:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpbGjLjO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35F510E2E1
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 02:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729564340; x=1761100340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QxYb8+CPVrf4RZckM9IKzSKpeJxXKztuVO6twQ65A08=;
 b=RpbGjLjOz0fpyJepDTBbBMkP/LG+sYr1TT9Kqq4PePuyTDmTRUYQHMZ8
 1wexxO5nz2Onp9g9p5lO5gZ6yJphvG3TbNmolLzFDUVXwC7ajO1LGMbeN
 Ji3NF9TkzJ5bBekBEJuDX2VX91IDX8lu9BLHvLIBy5Djo8eYbwTAuq152
 mBKMtykFQt1nZQTp8kUCd4oSsFMN0r8AwHSrRPXFQ65CWNsI/IBN23k1X
 mxitSuzlGC1fZ5+xRhDWJoyLnd8Z99j3PsIe31mdSmdwIrNz05t+KIP5F
 UrbOURzoaDQRlA2zjhkIacDCA0zYrJKL+49BTuybcQRgkT8CsxWdsimV8 Q==;
X-CSE-ConnectionGUID: +LD/pEO0TbOq6eBLQoiKOA==
X-CSE-MsgGUID: C9sWonj4QvWs/V9yvpRSUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28961624"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="28961624"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 19:32:20 -0700
X-CSE-ConnectionGUID: E+IqrZ80T4Sjct1Z8H5LzQ==
X-CSE-MsgGUID: dRT3xkCYRWuYxZzDmLXeZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="80075591"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 19:32:18 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 0/1] tests/intel/kms_joiner: switch modeset from uj
 to bj and vice-versa
Date: Tue, 22 Oct 2024 07:59:52 +0530
Message-Id: <20241022022953.1422653-1-santhosh.reddy.guddati@intel.com>
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
  tests/intel/kms_joiner: switch modeset between uj and bj

 tests/intel/kms_joiner.c | 94 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

-- 
2.34.1


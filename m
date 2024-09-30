Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03412CF6497
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 12:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6FE10E419;
	Mon, 30 Sep 2024 12:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDu+7KU+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0010E40C
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727697905; x=1759233905;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=umuimWHjZtPYGFfpOQUOu7+U8L7DaBkugMK3pRa28Uc=;
 b=MDu+7KU+iD93w0Ht3zZe/Z1xkTqMzZ2HscbRqajdP6LLv5Oy7LE/wRFf
 qabnaa+xivTwCSwxLHSqpqW/eSEq958YbL2c1qb59oLHr0qZe6vdraSJa
 cXctBSCJ8FBTFOuCWfB0kjqOhvtqpP8S77xhjwcIrFf6r6iYxvkYvk7ey
 jpGitlrgx+CktSn3q81PQxD/VITHSxwtGmD1pr/e+UW8gzD2wiXHje8tM
 PfOwMixTKP1DxWXZrM4OVpkoB1QOFhQLijvXEMoUdiwGEa1ueBkIeDhOj
 EX0Bwb5ZHktwlq+Q4VTI1O0E53ZlC/VojGW/iug9pIvE62znLYCsgzjGv Q==;
X-CSE-ConnectionGUID: vG4V6fGdRX2nZc5FFWoPfA==
X-CSE-MsgGUID: GvT+8fjDQ7G1kw+H0TaKtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44300121"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="44300121"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 05:05:04 -0700
X-CSE-ConnectionGUID: HZmoWst0RxKfm0POHzSuQA==
X-CSE-MsgGUID: i0w83clbT06C77BWMVtzGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="110757997"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 05:05:02 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 0/1] tests/kms_async_flips: Async flips suspend
 resume test
Date: Mon, 30 Sep 2024 17:34:09 +0530
Message-Id: <20240930120410.1023320-1-santhosh.reddy.guddati@intel.com>
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

This patch introduces a new subtest to validate async flips during
suspend and resume cycle.

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: Async flips suspend resume test

 tests/kms_async_flips.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.34.1


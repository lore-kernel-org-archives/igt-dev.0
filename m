Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1493AC2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 11:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2A710E3FC;
	Mon, 24 Jun 2024 11:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9MeEl09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6E610E3FC
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719229220; x=1750765220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HmBlesRykdlITtoaYM+bao2H01UQJZ5AjyJ5mRzM0G8=;
 b=P9MeEl09EsP2kxTbBQTl5oRSV00Q5hJrRDL5FYwYU4wxnSlGoi2Ohjtn
 lscSa4lYzE0sb3piLm2zLuLtWUfiuekgpr67oigVjCDQ5AirKtMZoqJ/S
 dAU5FGzBRC7EHMlIFsRzw0Ir5mLpUK2GASzzIfbow7VYO/+fz6K6P8FHr
 9dydIgPgQKRATrlyqk89lvv8RYCGkhR37TrfzKC7B3bFnI5HD5yoT2Cdi
 pUM4AOCgYRrCHjfWvyDdHAhJNoFBW5GSsE3K12DerglqCzEjG9ZhHeekd
 AHhSZ7qkMP8F5iBVawGdURzqs+igqS9mcVvq7urLh7db0pX390eP/1KHl A==;
X-CSE-ConnectionGUID: nJMukXyGQuKvx3vFuvWLDw==
X-CSE-MsgGUID: RrnIhOKqRHC+aSdOUpXBnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="41609137"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="41609137"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 04:40:19 -0700
X-CSE-ConnectionGUID: gjTr21jrRuqbFzb2/srtiw==
X-CSE-MsgGUID: 655/13P/Q/uDrzE/PMulkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43157286"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 04:40:18 -0700
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 0/1] lib/gpu_cmds: Fix hardcoded buffer size
Date: Mon, 24 Jun 2024 13:39:48 +0200
Message-Id: <20240624113949.6846-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch enables buffers larger than one page to be successfully
submitted, allowing for large shader execution.
Based on the find by Dominik Grzegorzek.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Dominik Karol Piatkowski (1):
  lib/gpu_cmds: Fix hardcoded buffer size

 lib/gpu_cmds.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.34.1


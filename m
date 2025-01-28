Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A91C0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 13:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689B410E28E;
	Tue, 28 Jan 2025 13:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cG/FflyT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FE610E28E
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 13:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738070999; x=1769606999;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=un76B5f1CfYxDY4w8aFL9pjtta5gsJr7AfxUCPdMc1w=;
 b=cG/FflyTH+nsbJeFmOT2uav2vboLRRZ8esEZmukDfy5D6QXAAHAsqE9p
 SvUTLy4MBguBLETC9azjpeYcY/yIti4phOaUXqVfVI8ZAF9F5UBsHAmTC
 /7L7M/jnwYvzRzrRbl2drh7rdBNfDnNAdVBpd8mmMUJTh5TPvVXoLdVS/
 sO3kzPn/MHXwfT6uAaVc6cY9vZtOkq08Gv3HWf2efOuLbUWRHx5z0XJLE
 B+jhrUw4uZ0IDInzdtBuplcIF2hyBCndU5+g2snYL5eo672Ao1BtxoMTX
 tPpA+Qg8zsIMvLx3zOk4jKUSzMXjoZJ7on6KDi5N2QFUFJhm8DkArEefv A==;
X-CSE-ConnectionGUID: 8o9Z2mJbQiOAH7vn1DEN+w==
X-CSE-MsgGUID: 1wqtFzlsTyWYPZ4mMO3TmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42487521"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="42487521"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 05:29:59 -0800
X-CSE-ConnectionGUID: HpyS6YQ7Qke++rI9/pXbZg==
X-CSE-MsgGUID: hSa+2vxdQ7GojZE4HtFSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="108544771"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.99])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 05:29:58 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_eudebug: Add discovery-race-sigint
 test
Date: Tue, 28 Jan 2025 14:29:29 +0100
Message-Id: <20250128132930.4778-1-dominik.karol.piatkowski@intel.com>
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

Add a test that extends discovery-race test by interrupting the client
and checking if anything breaks.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/intel/xe_eudebug: Add discovery-race-sigint test

 tests/intel/xe_eudebug.c | 89 ++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 36 deletions(-)

-- 
2.34.1


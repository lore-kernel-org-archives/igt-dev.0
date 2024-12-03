Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDF7E6C5F8
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 03:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB73B10E8D7;
	Tue,  3 Dec 2024 03:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1HhlmNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC1F10E8D7
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 03:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733197651; x=1764733651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+7r595NhyLiZVQSz+2Z+4KmlkZeyIoTI/hEQH3PSYVc=;
 b=i1HhlmNVw9Rq5uNe3RrvRkbJaqtXEtNJ4RsiNMlo/3Dbosuu7kDoTN5p
 oD8evkQeysOiDCjCQma1yNqGle/Y1J2p7e4Un/M7zcfhjD9X1TF+dldgd
 81E38QBzIrntrsg6fcTAQ4ZOh27WKdqAeCHUqy5g7mJ6rfHftytQ2QnZ1
 rtEMAO8Rx/bYWuE1sr9aBMUhepd9g/fwsP+B6D2csoXFgXZ5vWemI1Y6c
 6viiznodcnu95W6JqIcG/j9zS4zZkJMNaXlvWJUoK3gBUxB26bb+zdOs5
 ss4OtBVQqSAFkz0MqB6o/RFZBSMQUyl4Z1DKI+jOyBHGut8Hw6efzI3Pn A==;
X-CSE-ConnectionGUID: reTqklqtQH+BK0mCFLIb0Q==
X-CSE-MsgGUID: uxVsa/bpQcew5y389gUjmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44062099"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="44062099"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 19:47:30 -0800
X-CSE-ConnectionGUID: ye1p7wH4R/27CBzImQi4ZQ==
X-CSE-MsgGUID: CUN5Ba7cQG2zGHkXGlbo2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93217159"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 19:47:28 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 0/1] tests/intel/kms_joiner: switch modeset from uj
 to bj and vice-versa
Date: Tue,  3 Dec 2024 09:12:16 +0530
Message-Id: <20241203034218.53066-1-santhosh.reddy.guddati@intel.com>
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
  tests/intel/kms_joiner: switch modeset between ultra and big joiner

 tests/intel/kms_joiner.c | 115 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

-- 
2.34.1


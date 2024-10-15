Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04708D216BF
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 14:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA58310E597;
	Tue, 15 Oct 2024 14:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgLjLptd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774710E597
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729004075; x=1760540075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SwMYOSt3QCdiKTTCAJ8oquWC+BYrKQeF9BTO2y3NIdc=;
 b=ZgLjLptdnlDxfIjSmrmPz5hyb5PDD6zLG7DZXpIy65h5x61tMSAu3p7M
 gdnB3W/YEqFG3mr0vVRQnFmJTSVDBoeEBHLGv2C9hIHPn9RxuT4JgWto0
 y6C+XpvxUAAkNZle386jdKeJ8cD8I8etyK9d4gFXzEps/UdUMBfzXPA7z
 Ov7N+TEvkrL5GkqWsuS467do/Are43qc6iA8aXeBsMexTxOzNn6+0LIH3
 iTz2xvWMqfmO+T9QosGcqBluXrfffDVHug9RV1jNgZcGWnMkmofPsi5CB
 NlhmXRxOtkhnIhs3zqeNrYpm2ANNHk2AFz0y9Uhjwcuo1Kd/DYIqEeSiW A==;
X-CSE-ConnectionGUID: TWrnjp/NREGiEt7PbVQjFg==
X-CSE-MsgGUID: QGMXcJRpTwOz+RG0DymeKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45877857"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="45877857"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:54:35 -0700
X-CSE-ConnectionGUID: QKNse9arTZiTXQ+Ib7G/AQ==
X-CSE-MsgGUID: x52HaK/ZQb2nA4GU2YdxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="101247010"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 07:54:33 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/1] Async flip with atomic commit
Date: Tue, 15 Oct 2024 20:22:39 +0530
Message-Id: <20241015145240.141244-1-santhosh.reddy.guddati@intel.com>
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

This patch introduces new subtests to validate async flips with atomic
path

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: subtests to validate async flips on atomic path

 tests/kms_async_flips.c | 170 ++++++++++++++++++++++++++++++++++------
 1 file changed, 144 insertions(+), 26 deletions(-)

-- 
2.34.1


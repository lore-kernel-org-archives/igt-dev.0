Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A6DE7718B
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 05:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F221110E2D3;
	Thu,  2 Jan 2025 05:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ma1ZTxs4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DD410E2D3
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 05:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735796734; x=1767332734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YKnUm3KrEI6g965Wlh3Tzu0NKV4/NhZPqXagg84B2vE=;
 b=Ma1ZTxs4ROMjvXMjlE7ZjMimfFca9FkrFw1AjO9j1etEMgJ8il3WjbKR
 OEKIxFiM+OtP2HIHmEuETmlSEbJwye+X/kGYsPO8t0k86TWgTvYDY3R3h
 PxwHWl/gTjXtr9QWU/8a1v+b3Fyrqh+EQ/ui13iGHNtBku7HlBsHtth+g
 HQMaLc3X9Ux+qSr+Lp8Gjas8yyoz9yuQmNB0C7fTXNb2uDFjfV3KtjXYE
 x2fOSZTglOgCvuRDxfMOgULm6l9hA8u1eh+nyIbcQSln9tj7sGUhJ3R2q
 qEpJW/Bfvm5fXCNJgf9wZHZtKoyfnnN9sDnxTI2+ajbTVl17AcOPzbIXa g==;
X-CSE-ConnectionGUID: 7baw/q1vT76nzwdQOEHtAQ==
X-CSE-MsgGUID: aFC0qYnpR2umhjvWau5g0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35335274"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="35335274"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 21:45:33 -0800
X-CSE-ConnectionGUID: Q9xlegI2RmOW6UWfKP5qDg==
X-CSE-MsgGUID: Tnu8OO0DTbGDDKYbJNEl8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105457674"
Received: from unknown (HELO
 dg2setup4-CoffeeLake-Client-Platform.iind.intel.com) ([10.145.169.180])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 21:45:31 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 0/2] tests/intel/kms_joiner: switch modeset from uj
 to bj and vice-versa
Date: Thu,  2 Jan 2025 11:14:55 +0530
Message-ID: <20250102054457.58520-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
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

Santhosh Reddy Guddati (2):
  tests/intel/kms_joiner: switch modeset between uj and bj
  lib/igt_kms.c: Enforce strict check for bigjoiner_possible

 lib/igt_kms.c            |  6 ++-
 tests/intel/kms_joiner.c | 97 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 2 deletions(-)

-- 
2.43.0


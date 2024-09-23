Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE612CF9C6E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 04:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A44B10E377;
	Mon, 23 Sep 2024 04:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VnILY5po";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0670910E377
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 04:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727067079; x=1758603079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WlKIIkj3CLSX2L1PTEfAQcvOisML0MP1BW6S4guxSb0=;
 b=VnILY5poI0JOk598ZUfi3TZ97K2LqfgoXIpfePEDNthtY3WouqvI3181
 vSdOcM240ZI8D0gbfPENwfHgk3jB3CYVPsb0gfAyfPXl6D8g3ussUt1JM
 xCcxxPTAgjjPI0JCjTnWZ4e02/JzOZoBF/2XnRtUDGsIh5Bm93yCQTFsX
 SLwwlDTPc2F5+eW6umrsTlJpSxZsfNsbFZmYItYFKUtdtPwmtuVgG/FvH
 JOcN9R3VsqRxokkWuElKDPqcdAV1qOtdbZa0Umb9kQPak8DbqiE5MOqh5
 Hrwmy376hUUPkUkimgHjJ4zdH0Deqc6a7wtEHuN8HMlhFkQBc8qM5NNNX A==;
X-CSE-ConnectionGUID: 3l75qv8zR0m1aatCSfGRDA==
X-CSE-MsgGUID: 7cQEQVkIRTumfTI+OK/ESg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25475171"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25475171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 21:51:18 -0700
X-CSE-ConnectionGUID: 7svCL1KpQ2SEx64YNO0oDw==
X-CSE-MsgGUID: 05b7yMapSDWlY5dF96mKIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71223757"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 21:51:17 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/2] Async flip with atomic path
Date: Mon, 23 Sep 2024 10:20:50 +0530
Message-Id: <20240923045052.678647-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
References: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
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

This introduces new subtests to validate async flips with atomic path

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: subtests to validate async flips on atomic path
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist | 183 ++------------------------
 tests/kms_async_flips.c               | 143 +++++++++++++++++---
 2 files changed, 136 insertions(+), 190 deletions(-)

-- 
2.34.1


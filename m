Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DA6C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 12:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05FC10E53E;
	Tue,  9 Jul 2024 12:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAbIbonP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECCB10E53E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720529951; x=1752065951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TVc8ZHdz0PDPXfE6SoHCsfsgGBLE3uVyFAG3g9C8jfU=;
 b=UAbIbonPi7HFhqYNzSN1at/2UYffIsKuAjmn47n8MnbOVbzuGFGKaZy6
 7Vy5p3WuZxyDenJl+RPYZoaSm4qKqBYljt8Ah+ArY3EoOQK03fGd5kl0q
 snKtfHiobRRCYKcLDzCL4qXGGB7+O+8BiIt24UCjIz9uf4ogR5roaDK8o
 BjBePtx7CMc6P10WAxRD5IZUE+I0hrz22Y5UEnss4N2jqjxcm/PVy7wB/
 quh0S1h+XoSQDEB62FyNpDTVKMPeQNeOLAkyv30vgADGNUIhcD5KFSwlw
 10oFHmQzBxYl1Gm6Yw6c6c/eziFY96UemvIBXlvdc8GmZxCieZWzGIMlk g==;
X-CSE-ConnectionGUID: D/dUIpWJTnu684UznYdKYA==
X-CSE-MsgGUID: Ni7EfoZjTc2QNrZh4FxuXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17411362"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17411362"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:59:11 -0700
X-CSE-ConnectionGUID: LLwomsz9TJaZP15v662k7A==
X-CSE-MsgGUID: Tfqxqq7NSIiUT0UdAdAAaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="53031347"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:59:09 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_plane_scaling: Improvise the scaling BW
 issues.
Date: Tue,  9 Jul 2024 18:33:19 +0530
Message-ID: <20240709130321.455906-1-ramanaidu.naladala@intel.com>
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

***  ***

Naladala Ramanaidu (2):
  tests/kms_plane_scaling: Improvise the scaling BW issues.
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 215 ++++-----------
 tests/intel-ci/xe-fast-feedback.testlist | 320 ++++-------------------
 tests/kms_plane_scaling.c                | 181 +++++++------
 3 files changed, 204 insertions(+), 512 deletions(-)

-- 
2.43.0


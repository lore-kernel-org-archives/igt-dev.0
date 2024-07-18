Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CFAC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 11:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B0A10E0B0;
	Thu, 18 Jul 2024 11:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oez+vE3j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64BA10E0B0
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721300684; x=1752836684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZSd6OJmzg/VoopZ66TJNwoNhRbKEigenVCbQHeQ8dDo=;
 b=Oez+vE3jOWvnicTjs1E27f9NUdcWDx5mXIZTzyNaabcDoG9HWGDKssLj
 4TR7JvCqZDmhexpYr6xeSY/rASV+Je8bbCane+CrkxNF3CGBu8XI6zwES
 NX1qMMcaR1XSqH6Yl8OeTQ8sVs9xk2wpG5cXXeOCUp5gzC5qRle7vG+9x
 tD6UEdzbsZZNoRLVSHzLaDuEE0ue9SHwQw2u2CJpVTTx/0brzXTSsqG+G
 JT5tRrS2ynFYwzXHYRF/+u0fGSdRKcBefGHh1wlTqmi+Drf0qmIxJk5lh
 s7/cY/ogFsjN8F8AQHd5vzpYY8G1TAkNoV2mYT+X2rJ2jR0ztPEZmgZM0 g==;
X-CSE-ConnectionGUID: duNWbl9TR4ey7oDDXjC5yw==
X-CSE-MsgGUID: 7JOeLccBT/2RKg5clMnWTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18476555"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="18476555"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 04:04:43 -0700
X-CSE-ConnectionGUID: y5RGXWxYRoCkbt1jOuH2Mg==
X-CSE-MsgGUID: yzO2R+kFSXOx2Y4A2xAZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50811509"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:04:41 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 0/5] tests/kms_plane_scaling: Improvise the
Date: Thu, 18 Jul 2024 16:38:46 +0530
Message-ID: <20240718110851.665102-1-ramanaidu.naladala@intel.com>
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

Find display mode fitting within bandwidth constraints for scaling
operations.

Naladala Ramanaidu (5):
  tests/kms_plane_scaling: Update the single plane scaling function
    arguments
  tests/kms_plane_scaling: Update the multi plane scaling function
    arguments
  tests/kms_plane_scaling: Find display mode fitting in BW
  tests/kms_plane_scaling: Find display mode fitting in BW for rotations
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 201 ++++----------
 tests/intel-ci/xe-fast-feedback.testlist | 317 ++++-------------------
 tests/kms_plane_scaling.c                | 283 +++++++++++---------
 3 files changed, 260 insertions(+), 541 deletions(-)

-- 
2.43.0


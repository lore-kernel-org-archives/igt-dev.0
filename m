Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E406CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 09:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72EA10E856;
	Thu,  6 Nov 2025 09:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQKFk2FQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5328610E856
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762420945; x=1793956945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qwxZ07Ws7D8RC1+TcF87pWpp2aUiUyPaN/Md0b/SrkY=;
 b=YQKFk2FQPWNs1RptVpL9XnDde1Fq1AIVpXUEBcFsCKaEPhS8mNavVklz
 D6cmsif3HA1rTwyEgE7ZOCXry+8ExnbtX7vmKTgxJJJoDiwMOc8mVu2l1
 iyVH/Y29lu+iUnxb/Ueqopn0ulshi7cbZsRdzrDqHFGHDUpop5q2JPL7C
 F/p11K6y8O7ouAbGg6SnfOiHyKh2p3P7kL+gTiQabJTxvXMcBVcRJMN2V
 8ZrveizrUhfCWVIUT6raUOmRhR6ZH6gWbaVsXlqaSfb/fbDQ7pxJJlVK4
 Dt88DuWN0UYsStFRvJVA/1yadyKWMKultig0w3muQ/DhrZ78pgbZlbQH4 A==;
X-CSE-ConnectionGUID: HDi4DszDR6GQeK3vfVgMwQ==
X-CSE-MsgGUID: 2K3m0x4lRIOwyUg8JFc9KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75236906"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75236906"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:22:25 -0800
X-CSE-ConnectionGUID: wQMwRBZ0Qoui51OJ1lry1w==
X-CSE-MsgGUID: 0z7JOz/wSVe64MysCiaRZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187553259"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 01:22:23 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Limit debug logging in CI for scaling tests
Date: Thu,  6 Nov 2025 14:52:01 +0530
Message-ID: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
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

This change conditionally enables DRM debug logging only when multiple
outputs are connected. It helps reduce log size and prevents CI runners
from exceeding disk usage limits, which previously caused test
termination.

Naladala Ramanaidu (2):
  tests/kms_plane_scaling: Reduce debug log level in CI for scaling
    tests
  HAX patch do not merge

 tests/intel-ci/i915.fast-feedback.testlist | 220 ++++----------
 tests/intel-ci/xe-fast-feedback.testlist   | 325 ++++-----------------
 tests/kms_plane_scaling.c                  |   5 +
 3 files changed, 103 insertions(+), 447 deletions(-)

-- 
2.43.0


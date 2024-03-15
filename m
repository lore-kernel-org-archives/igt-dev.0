Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D64C54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 13:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B0E10E14E;
	Fri, 15 Mar 2024 13:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lh84K0Tz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD1410E14E
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 13:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710508750; x=1742044750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HNstrgduiARVtRLmJNI4tXd3G1fAucY+eae88FcsvWI=;
 b=lh84K0TzNA0XR9ZUElpycb6CLMiC2uGfU+T0B0Xkjqi9LOyD3B6pfRHz
 szPGfL9Z5l3HTeHiwLk1fF9giZmu0ab5v+RnOqLRGNy5BRTvAeSPktKX9
 AK/UWENBb9Hw2BwIDghhFef+yL6y1NHhFTRFewJZBV8bncqhUnRRfjjlb
 SUKV6Uvj2FjXjt/etIIED9CrLfQQKqkx/57f5ZGNBMeUU65h5aWz16ppr
 y6AoaQBAic3z3JfPl92a2FsBr8qrrcl/Qn3Ue5Ro1ulL1SPsTsMMdEbw0
 ptVsTcA+f1ssevj/aj4L3+G5Ai6KTQDM5g2gfU9+SwsCO85IFDHl58u5q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16023267"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="16023267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 06:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="43572064"
Received: from unknown (HELO localhost) ([10.245.246.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 06:19:07 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH i-g-t v1 0/3] more musl libc fixes for PATH_MAX
Date: Fri, 15 Mar 2024 14:18:58 +0100
Message-ID: <20240315131901.28144-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

On musl build the PATH_MAX define is missing, fixed this with
including limits.h
Also moved up and sorted system includes in xe_debugfs.c

Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Kamil Konieczny (3):
  lib/igt_sriov_device: fix musl libc build
  lib/igt_kmod: fix musl builds
  tests/intel/xe_debugfs: fix musl build

 lib/igt_kmod.c           |  1 +
 lib/igt_sriov_device.c   |  1 +
 tests/intel/xe_debugfs.c | 11 ++++++-----
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.42.0


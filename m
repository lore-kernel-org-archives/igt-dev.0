Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E538C83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 11:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8B510E5AB;
	Tue, 15 Jul 2025 11:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELEh/79Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8FD10E5AB
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752579442; x=1784115442;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cR76WZQgiJVlWkJdDZFxXeDMSgQlnemtd4AKKFjtRBo=;
 b=ELEh/79ZnxEU+N9Ix9wbOD2zJlKcmB+pXNedhM2BKUxbpqNt2rB0Q3oc
 qWc3w7pGEFmsXQ5EX+0vBcRbKf2LPFXgqy3wpmcg7nT1OkZygXZzuqRYS
 6zMvHkJPBPi4b70E7xc0uEpE2NeaRM2B2G22i9LB8rTWCLnVYgogOQhJu
 SS41YKdGBRQgJH6ceA83+KcfzVSxvesfqc7ZjniH/B7PEWQn97VpCCFRW
 2U/PHAMfPqPefChF12fMzS3UmNP5hyFDUjf2k5z8cijg1lZVu+i0kQyLg
 Ua1zFTE/wkDGSUSZVmCMaZwctEJSE5k4OBBHIPOGGJKKPjFK1NnYul0iI Q==;
X-CSE-ConnectionGUID: LMO+fSSsQt+NxH0wqI6pIQ==
X-CSE-MsgGUID: TbbnwxRDQK+/N6qHfpboUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54948537"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54948537"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 04:37:22 -0700
X-CSE-ConnectionGUID: zsx5duBsSN+Sji72qTMqMA==
X-CSE-MsgGUID: wBgG9OkCSsGJDrhpfw8v/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="161758074"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP; 15 Jul 2025 04:37:21 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t 0/2] Skip PSR when disabled
Date: Tue, 15 Jul 2025 13:38:20 +0200
Message-ID: <20250715113822.831686-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

This series again is next rerun of v1. Tag points to the kernel change
which does not have any tag and spare prefixes has been removed from the
subject for Patchwork to pick the change, since previously it hasn't
been picked.

Test-with: 20250714160931.821383-2-michal.grzelak@intel.com

Best regards,
Michał

Michał Grzelak (2):
  lib/igt_psr: Skip the test when PSR is disabled
  tests/intel/kms_frontbuffer_tracking: pass non-NULL output pointer

 lib/igt_psr.c                          | 4 +++-
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.45.2


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1027E77180
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 09:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B51610EAC3;
	Wed, 11 Dec 2024 09:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtfBvraE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A1C10EAC3
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733907682; x=1765443682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q6RNvt1jH4EuEMq8egwSoAgvnflnzzr9vnzY7hMEP5M=;
 b=CtfBvraEgxN9WUyocz1QxbpFbEyF/2SFZayL54D+4eeZMv1dz1vhQL/v
 9OQHfmdv5UgLy/RVnSgIJW8d2R86/X7Vr0VhQzpmNyZPCzianY24zk5Z1
 KBvC2vfCAVggxAgPjmVoTU8FZ6sUDITcOtkJ6x4xd/yuBIc6g8cqTtIBd
 edn3JP/4DTj2KUoBe3urbt/QShESGm65lsFOO3c0dwnp9ZdNvPVjYAS8Y
 lMnhUjEJECjb6XS83T+A275nVhfLjVRvgtKJl5Gi+PZGurKLRli4Khdxz
 ON0bJZK5EXQxl7yENlMl0axomK3JGtVaiIOwRcPWwMggMF1xJDZKL5K6B g==;
X-CSE-ConnectionGUID: ehBwUxE2TRWBuFH+flFEsA==
X-CSE-MsgGUID: +mSo/s7FR2C/G+cnQENzgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45663687"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="45663687"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:01:21 -0800
X-CSE-ConnectionGUID: v9cAFzJ1SYSEOE60/q7PWA==
X-CSE-MsgGUID: bxB9MAd6TVCXxSC5d5hAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="95556401"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa007.fm.intel.com with ESMTP; 11 Dec 2024 01:01:13 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v7 0/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Wed, 11 Dec 2024 14:28:46 +0530
Message-Id: <20241211085848.617278-1-pravalika.gurram@intel.com>
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

Move the spinner related functions to lib.
check the ctx_timestamp register post gt reset for each engine.

Pravalika Gurram (2):
  lib/xe/xe_spin: move the spinner related functions to lib
  tests/xe_spin_batch: Add spin-timestamp-check

 lib/xe/xe_spin.c            | 207 ++++++++++++++++++++++++++----------
 lib/xe/xe_spin.h            |  52 +++++----
 tests/intel/xe_drm_fdinfo.c | 195 ++++++---------------------------
 tests/intel/xe_spin_batch.c | 121 +++++++++++++++++++++
 tests/intel/xe_vm.c         |  17 +--
 5 files changed, 347 insertions(+), 245 deletions(-)

-- 
2.34.1


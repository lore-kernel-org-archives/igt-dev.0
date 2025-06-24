Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B45C77B7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 11:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6373110E56F;
	Tue, 24 Jun 2025 11:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTKBCWNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD7E10E56F
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 11:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750764143; x=1782300143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=edZYbg7Zk+n6LQs5GgPdvT96siU6R+LlMM5By7fEjmM=;
 b=RTKBCWNt4lWdwHp4PZZYVjglAYe4ZR9J6etdi1SppzvB0bWV4sZidOnK
 rpLrdaKc/2SEKWqZMlNb5540K6F7+hMNiZTsRuGCnuk4fWYjXyITLXtqb
 0aYBoWqzPqPoFJuC2yienXWAQmd2AyLOIpXfRk484xAF4xs5Qs51XU1IC
 IkGPV4BZVjd9agKyR9PBAMULS2ZE/wlJRF4lsVkehC/XVRHdQ/HnaQOed
 adYcyZycGkiCZrc+/3dIRykUhXiVgUDWb2HimVBQ/RxpLKbv43YJPhU9v
 U86rGixQ5CMnnZ+Vg/Z3F3Gi67N2O63Fzb1tJKJBnsMy0+G2j1sJZXBWb g==;
X-CSE-ConnectionGUID: hazW+FpoRyWgUoJZnFUm3A==
X-CSE-MsgGUID: +TLwLcn/RfOZmVDY5WIJPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52721228"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52721228"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:22:22 -0700
X-CSE-ConnectionGUID: v6OXZAZtSzuI0luCrFOJCQ==
X-CSE-MsgGUID: E1j2PTkKRPeBycHufHGqpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="151315042"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:22:21 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v1 0/2] intel-ci: Block VirtIO-GPU from running on Intel
 CI
Date: Tue, 24 Jun 2025 13:22:13 +0200
Message-ID: <20250624112215.67441-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

There is a new test drm_virtgpu for testing virtual GPU,
so block it from running on Intel CI.

These should be merged together with a new test
https://patchwork.freedesktop.org/series/149544/

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Kamil Konieczny (2):
  intel-ci: Block virtgpu tests for i915
  intel-ci/xe.blocklist: Block virtgpu test

 tests/intel-ci/blacklist.txt    | 4 ++++
 tests/intel-ci/xe.blocklist.txt | 1 +
 2 files changed, 5 insertions(+)

-- 
2.49.0


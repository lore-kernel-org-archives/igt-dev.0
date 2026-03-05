Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B65EEF326
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 08:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1D610EB94;
	Thu,  5 Mar 2026 08:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPlwyFWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407CF10EB93
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772700108; x=1804236108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M0ifH4angORpp8AldJAsGaatPlvRrZhx0aWjwffFwvE=;
 b=EPlwyFWQwoAz29Gm9VJBfS4ktLJ1OifwebZkVpWoZG3HLlciq3OSE6Me
 /HHWTNV4a4udHGNnhE5cEI6I223IVKe2nmK7+5VTRTjD9LeUGI5N6CjE7
 Xegr2U4Scp1sZqBLQ1kJt+THsX7JM3Lp0Ka7euALtxyOdnCpwHaA+6yYy
 wKolGNJ/IP7ldAtwbs0lhRNucGERI+UmNHepq8R1zDTDwG46xxP6iKPmT
 h91n6KkA0WefBIFlPgx+9P7oW59DGnxgmd60AH9pzI7ZMuZtiBg42LV7F
 gCcn/R3yZjCyuRXfp+LAFNRmuV5VUOJH53t2aCz/I/ioHa5Xp34+K5Otu Q==;
X-CSE-ConnectionGUID: tlx6hRGdTxmUbiYi6+hHAg==
X-CSE-MsgGUID: 2xFGRRLGR5mrzqGYXTvNkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77624266"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="77624266"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:48 -0800
X-CSE-ConnectionGUID: G7xNZGBTQB6Aa2di+NH8bA==
X-CSE-MsgGUID: zPvPhAU3TTucgPDV6fJpaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="214673593"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:45 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, ryszard.knop@intel.com,
 karol.krol@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v5 0/6] intel-ci: Split chamelium-only testlist for i915 and xe
Date: Thu,  5 Mar 2026 14:09:00 +0530
Message-ID: <20260305083906.3098168-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

v2:
- Move suspend resume tests to the end of the testlist (Kunal)
- Comment out random-plane test (Kunal)

v3:
-Use move-fix-add approach (Kamil)
-Remove symlinks first before renaming (Kamil)

v4:
-Restructure move-fix-add approach (Kamil)
-Rename run-type labels(Swati)

v5:
-Update commit message (Kamil and Swati)

Mohammed Bilal (6):
  intel-ci: Remove chamelium testlist symlinks
  intel-ci: Rename chamelium-only testlist to i915 specific
  intel-ci: Remove i915 *-random chamelium tests
  intel-ci: Move i915 suspend/resume tests to end
  intel-ci: Copy i915 chamelium testlist for xe
  intel-ci: Remove xe *-vga chamelium tests

 tests/intel-ci/chamelium-only.testlist      | 77 --------------------
 tests/intel-ci/i915.chamelium-only.testlist | 81 ++++++++++++++++++++-
 tests/intel-ci/meson.build                  |  3 +-
 tests/intel-ci/xe.chamelium-only.testlist   | 72 +++++++++++++++++-
 tests/intel/kms_test_config.json            |  9 ++-
 5 files changed, 158 insertions(+), 84 deletions(-)
 delete mode 100644 tests/intel-ci/chamelium-only.testlist
 mode change 120000 => 100644 tests/intel-ci/i915.chamelium-only.testlist
 mode change 120000 => 100644 tests/intel-ci/xe.chamelium-only.testlist

-- 
2.48.1


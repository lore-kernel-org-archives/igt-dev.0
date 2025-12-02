Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAEBD12668
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 18:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9765E10E185;
	Tue,  2 Dec 2025 18:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="curOPzUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFE510E185
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 18:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764698943; x=1796234943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nteXz7Jwr8TbmjY9KKHN1rr9RXWyDngTuR55RqOudS8=;
 b=curOPzUhV6vifsM+Xr3XuwmtB4GmrhbYqasN4KkrTDeZKAG75AXoDWVK
 Xzkumz9RC8O1KWFKUJY5yImsXHpED9fpD3DC1LgsUf44mq3FISviVQqEG
 GrUn+Jj3/JtQq3sCCfmAvzhyklM0yDrcp2LQpju+fo7LC+J53CX9zwh8S
 BYnQ7oUNnPrW5X9OKkMYyafQpkwgwbFPGfJ7eYidvL+wGlItEUvpNJdvc
 amo5k718z2bWQ2k23Ha+0LFdgvrP699HlhbSHzQejf1A7KunCXz8JKzlr
 GguPgIVuxvuc6l/4Qqxud0Ve7hSpplKT4Qrlr4rg3e/eLCvON55mORJKY A==;
X-CSE-ConnectionGUID: JWeIfCbcSn6yCdFmmy+Dig==
X-CSE-MsgGUID: lenTbFiLQLWLjCEzkLTY+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66570800"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66570800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:09:02 -0800
X-CSE-ConnectionGUID: yrjPE1C3S0ODWXMNHbtMWA==
X-CSE-MsgGUID: Qizc9AoYRJCjzg7P9cF5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198914790"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:08:59 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t v1 0/3] intel-ci: unify Xe and i915 block/test/lists
Date: Tue,  2 Dec 2025 19:08:48 +0100
Message-ID: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Unify name for xe block/testlists into xe.rest-of-name
Rename also i915.chamelium-only.testlist into main one without
prefix and create two symlinks for it.

Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Kamil Konieczny (3):
  intel-ci: unify Xe lists naming
  intel-ci: Add symlinks for Xe lists
  intel-ci: unify chamelium testlist

 tests/intel-ci/chamelium-only.testlist        |  70 ++++-
 tests/intel-ci/i915.chamelium-only.testlist   |  70 +----
 tests/intel-ci/meson.build                    |   9 +-
 .../xe-fast-feedback-chamelium-only.testlist  |  16 +-
 tests/intel-ci/xe-fast-feedback.testlist      | 278 +-----------------
 tests/intel-ci/xe-sriov-vf.blocklist.txt      |  60 +---
 tests/intel-ci/xe-sriov-vm.blocklist.txt      |  61 +---
 tests/intel-ci/xe.chamelium-only.testlist     |   1 +
 .../xe.fast-feedback-chamelium-only.testlist  |  15 +
 tests/intel-ci/xe.fast-feedback.testlist      | 277 +++++++++++++++++
 tests/intel-ci/xe.sriov-vf.blocklist.txt      |  59 ++++
 tests/intel-ci/xe.sriov-vm.blocklist.txt      |  60 ++++
 tests/intel/kms_test_config.json              |   6 +-
 tests/intel/xe_test_config.json               |   6 +-
 14 files changed, 496 insertions(+), 492 deletions(-)
 mode change 120000 => 100644 tests/intel-ci/chamelium-only.testlist
 mode change 100644 => 120000 tests/intel-ci/i915.chamelium-only.testlist
 mode change 100644 => 120000 tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
 mode change 100644 => 120000 tests/intel-ci/xe-fast-feedback.testlist
 mode change 100644 => 120000 tests/intel-ci/xe-sriov-vf.blocklist.txt
 mode change 100644 => 120000 tests/intel-ci/xe-sriov-vm.blocklist.txt
 create mode 120000 tests/intel-ci/xe.chamelium-only.testlist
 create mode 100644 tests/intel-ci/xe.fast-feedback-chamelium-only.testlist
 create mode 100644 tests/intel-ci/xe.fast-feedback.testlist
 create mode 100644 tests/intel-ci/xe.sriov-vf.blocklist.txt
 create mode 100644 tests/intel-ci/xe.sriov-vm.blocklist.txt

-- 
2.52.0


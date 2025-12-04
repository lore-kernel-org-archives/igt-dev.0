Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDACD2A545
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F1110E220;
	Thu,  4 Dec 2025 21:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFCvqoes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6514810E220
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764884199; x=1796420199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ymddMMpydcv8JS7lAe+hkAkMi0Q3/w+r0y8hLx47qZU=;
 b=DFCvqoeslC4rwlW8GHdosLcWChz5FIiDnuV87XN55d2gjpo1oMOFYKXG
 gzOy14xzC9JKUFjfJOmsHYotHxCAFywW0Mao+Oi8fazidLQNh/sDEhHj8
 NfFMFV+nfj+VIfLPmhEWX13bB+6E/Iv5vz02Jp4uTkwyeR6up6T3KbGNM
 JHTACoAg0Gn0wcEu4WyZzQ3cbMSB5NzAJ2FrRJ0OCZdcJZJFZlctvAB1b
 VUBcDZBrGHIh1dfdvHTuSXSBf4OS2TsDr1gb/SWRGlZ+AlO36ZiiaOA96
 TLOzKp+DR4oZMRlmAEgzlKMW8Bxy1Sa47pb06pJzJXGNogc8j5fIzNq75 Q==;
X-CSE-ConnectionGUID: uuRE8zasS7+rWM3mqc71lg==
X-CSE-MsgGUID: 6ItbOElESVK+Cz2pze1Akw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="92396815"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="92396815"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:36:39 -0800
X-CSE-ConnectionGUID: 4VnJ5X3iRlOQ9cgKbJ6VAg==
X-CSE-MsgGUID: CE+/FQUeSSKs8O6TTpDo0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195128310"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.32])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:36:36 -0800
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
Subject: [PATCH i-g-t v2 0/3] intel-ci: unify Xe and i915 block/test/lists
Date: Thu,  4 Dec 2025 22:36:29 +0100
Message-ID: <20251204213632.155894-1-kamil.konieczny@linux.intel.com>
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

v2: add new symlinks to meson.bbuild in patch 2 (Ryszard)

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
 14 files changed, 498 insertions(+), 490 deletions(-)
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


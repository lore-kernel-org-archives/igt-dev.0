Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A5BC8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 09:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E6C10E330;
	Mon,  7 Jul 2025 09:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnTMAkpq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458BE10E337
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751881306; x=1783417306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b8eof4zSGtcMNrh1CtcfGhT0HymhBsQAAPVb4mfw3as=;
 b=AnTMAkpqHmemVkGDkxxMIhPt2uDzLYlkC7+8fJN04Eqz6h7JkEW0NA1A
 RXqOYb/k12Km+fnuXZalA9oxj4blc0UpCvx8lzxU/zjxEPqD+c9oJyepZ
 oHSiIyDg3+OIpvVrjh2tlJYFElL406IC+dHSw3sVJUY3M3rk4JVEaqbg5
 HkOz2DN007SfMkoZzqrEeiketf7Sqi21/5JkqmZXoVINl84LlprhUAoWm
 bglAnDmMO4t09XpGDvstL3Q22UCQ0iqPn42dgxK1c3Cwb6yJ9Qf5MC+Ez
 HmUrWgaelNsQmfNp/MFxkqZXzkVlrhnt1eGjqeSuPKDv7mOkjALGDK96A w==;
X-CSE-ConnectionGUID: 1b4sU0cBQrCrqVkYQt+lgg==
X-CSE-MsgGUID: R2RuQkqOREea19FX8nkFkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65550822"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65550822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:41:46 -0700
X-CSE-ConnectionGUID: eoCYlh9jSee2RzebsnlsDw==
X-CSE-MsgGUID: vwNKm3KsTWaG5yQgDwu/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="155297625"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:41:44 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v2 0/5] intel-ci: Rename i915 blocklist and testlists
Date: Mon,  7 Jul 2025 11:41:13 +0200
Message-ID: <20250707094118.84046-1-kamil.konieczny@linux.intel.com>
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

Lets make our block/test/lists similar to Xe and rename them,
adding 'i915-' prefix to fast-feedback, and 'i915.' to rest.

v2: added symlinks for old files (Ryszard)
  added change for blocklist verification in gitlab pipeline (Kamil)

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Kamil Konieczny (5):
  intel-ci: rename i915 blocklists
  gitlab-ci: Update Intel blocklists
  intel-ci: Add symlinks for old i915 blocklists
  intel-ci: rename i915 testlists
  intel-ci: Add symlinks for old i915 testlists

 .gitlab-ci.yml                                |   2 +-
 tests/intel-ci/README                         |  18 +-
 tests/intel-ci/blacklist-pre-merge.txt        | 113 +-----------
 tests/intel-ci/blacklist.txt                  | 172 +-----------------
 tests/intel-ci/chamelium-only.testlist        |  69 +------
 .../fast-feedback-chamelium-only.testlist     |  16 +-
 tests/intel-ci/fast-feedback.testlist         | 172 +-----------------
 ...i915-fast-feedback-chamelium-only.testlist |  15 ++
 tests/intel-ci/i915-fast-feedback.testlist    | 171 +++++++++++++++++
 tests/intel-ci/i915.blocklist-pre-merge.txt   | 113 ++++++++++++
 tests/intel-ci/i915.blocklist.txt             | 171 +++++++++++++++++
 tests/intel-ci/i915.chamelium-only.testlist   |  68 +++++++
 tests/intel-ci/meson.build                    |  10 +-
 tests/intel/i915_test_config.json             |   4 +-
 tests/intel/kms_test_config.json              |   8 +-
 15 files changed, 564 insertions(+), 558 deletions(-)
 mode change 100644 => 120000 tests/intel-ci/blacklist-pre-merge.txt
 mode change 100644 => 120000 tests/intel-ci/blacklist.txt
 mode change 100644 => 120000 tests/intel-ci/chamelium-only.testlist
 mode change 100644 => 120000 tests/intel-ci/fast-feedback-chamelium-only.testlist
 mode change 100644 => 120000 tests/intel-ci/fast-feedback.testlist
 create mode 100644 tests/intel-ci/i915-fast-feedback-chamelium-only.testlist
 create mode 100644 tests/intel-ci/i915-fast-feedback.testlist
 create mode 100644 tests/intel-ci/i915.blocklist-pre-merge.txt
 create mode 100644 tests/intel-ci/i915.blocklist.txt
 create mode 100644 tests/intel-ci/i915.chamelium-only.testlist

-- 
2.49.0


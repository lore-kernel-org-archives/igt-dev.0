Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0764BC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 16:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A3A10E4CD;
	Mon, 14 Jul 2025 16:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaN++5Gt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421F710E4F8
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752508812; x=1784044812;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xJCJM4hrR7iGWfGzz/3xQoR0WteXnbt9H4BKTh+t+Rs=;
 b=RaN++5GtjUxT8FLwflK8aMoxMba9fr0XOnAyecQsRIuIa/16qHnQLYwP
 rBpYxwXC2SYIZDsemNj8HVw76eLzywBAgUnM3BzQ/M/+vB9VT3uN8SED5
 3WBUn2JFh+UWKbj5jrHHqRrWo4J5UhafjDyBqgEqrAAs2FmQj+cjUgmu/
 +k/g4BDNh57RjcHAcTa8Ah0aJqlSTZsjs/SKJw7opMd/IyN1D5AH13W/K
 UZYQBds3DqEdB3SkBbHqx2qWB/t9diicjooo+YEURU3zEW0Jr2dJZ6muz
 I4draiK851PvAjrHx5E1S2YrJuQ3xgLbKpDk1IyZ1HCn6fG3u6f6ciVHJ g==;
X-CSE-ConnectionGUID: Etmr0N/fQEKdd6D20/xqSQ==
X-CSE-MsgGUID: hAxCYGr1SIaYIXd1Ggov2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65405996"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65405996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:00:11 -0700
X-CSE-ConnectionGUID: KCeTgVIdQhqguFv1cIbSGg==
X-CSE-MsgGUID: +YXxXwFETZCMoIgzUjUEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="187954940"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:00:08 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v5 0/5] intel-ci: Rename i915 blocklist and testlists
Date: Mon, 14 Jul 2025 17:59:49 +0200
Message-ID: <20250714155954.110858-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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
adding 'i915.' prefix to i915 fast-feedback testlists and blocklists.
  After adding symlink targets to meson.build, instalation will
actually copy all linked up files.

v2: added symlinks for old files (Ryszard)
  added change for blocklist verification in gitlab pipeline (Kamil)
v3: dropped xe from .gitlab-ci.yml (Kamil)
v4: use 'i915.' prefix everywhere for i915 testlist (Swati)
v5: added symlinks to meson (Michal)
  added suggested-by to first patch (Kamil)

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Kamil Konieczny (5):
  intel-ci: rename i915 blocklists
  gitlab-ci: Update Intel i915 blocklists
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
 tests/intel-ci/i915.blocklist-pre-merge.txt   | 113 ++++++++++++
 tests/intel-ci/i915.blocklist.txt             | 171 +++++++++++++++++
 tests/intel-ci/i915.chamelium-only.testlist   |  68 +++++++
 ...i915.fast-feedback-chamelium-only.testlist |  15 ++
 tests/intel-ci/i915.fast-feedback.testlist    | 171 +++++++++++++++++
 tests/intel-ci/meson.build                    |   5 +
 tests/intel/i915_test_config.json             |   4 +-
 tests/intel/kms_test_config.json              |   8 +-
 15 files changed, 564 insertions(+), 553 deletions(-)
 mode change 100644 => 120000 tests/intel-ci/blacklist-pre-merge.txt
 mode change 100644 => 120000 tests/intel-ci/blacklist.txt
 mode change 100644 => 120000 tests/intel-ci/chamelium-only.testlist
 mode change 100644 => 120000 tests/intel-ci/fast-feedback-chamelium-only.testlist
 mode change 100644 => 120000 tests/intel-ci/fast-feedback.testlist
 create mode 100644 tests/intel-ci/i915.blocklist-pre-merge.txt
 create mode 100644 tests/intel-ci/i915.blocklist.txt
 create mode 100644 tests/intel-ci/i915.chamelium-only.testlist
 create mode 100644 tests/intel-ci/i915.fast-feedback-chamelium-only.testlist
 create mode 100644 tests/intel-ci/i915.fast-feedback.testlist

-- 
2.50.1


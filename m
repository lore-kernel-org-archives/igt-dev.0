Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A050C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 15:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0F310E6AF;
	Tue,  8 Jul 2025 15:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DT9KoleD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0587310E6A2
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751988496; x=1783524496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=27J3nzFcTEphLK2HexMINhlA4YGqAdKdzXpb9t1fSEk=;
 b=DT9KoleDAo2917wJnZ3dEkbQhOeM3INDhQ3qaA5pZJMKrxdIwMkNd/AQ
 UoDO6hEMrVV3IxtQzcVvf3TQS1LTXr+XQZRE8tTfX1JUW3/tkMWVoBom0
 eWrIqVihYPlgg5WIv+DouUge3wHpdJ+fWBryuuJlM9Wuo3FBwvKrGQMyW
 VYyo+C/SP6+U9GicOVdvIaLM+CDlVLJpNqNmHBfz3OxLRk4/jhT/Hffik
 X5CbV8Jtoqoy2+fCNviry+HJvDlaoEm1fC06cZ+TKqlBcJAWYpPGpyZVJ
 nG5HC7dt+RQoL4s0f5ObPSIXd4meLAUVRTheln8RPnEZ5mFuZKc8ln179 Q==;
X-CSE-ConnectionGUID: yMWxQdN6TGa6JJv68HELkw==
X-CSE-MsgGUID: tbgUSJpATxORARPOe+0A3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53947130"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="53947130"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:16 -0700
X-CSE-ConnectionGUID: L3T4OekwQcCA82s7jfq1sg==
X-CSE-MsgGUID: A8poVk9ORbytxsZ9m1xnyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="154937609"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:13 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v4 0/5] intel-ci: Rename i915 blocklist and testlists
Date: Tue,  8 Jul 2025 17:28:03 +0200
Message-ID: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
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
adding 'i915.' prefix to i915 fast-feedback testlists and blocklists.

v2: added symlinks for old files (Ryszard)
  added change for blocklist verification in gitlab pipeline (Kamil)
v3: dropped xe from .gitlab-ci.yml (Kamil)
v4: use 'i915.' prefix everywhere for i915 testlist (Swati)

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
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
 tests/intel-ci/meson.build                    |  10 +-
 tests/intel/i915_test_config.json             |   4 +-
 tests/intel/kms_test_config.json              |   8 +-
 15 files changed, 564 insertions(+), 558 deletions(-)
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
2.49.0


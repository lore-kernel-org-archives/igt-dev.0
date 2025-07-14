Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A7BC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 16:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F2410E347;
	Mon, 14 Jul 2025 16:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBAdr/Ra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9691210E347
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 16:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752510281; x=1784046281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OYfFdyw++svvplO5KkPbzG5Nb34OETWTqn0IUIemXrA=;
 b=TBAdr/RaMvaYWsg+wqi3DZIk4ta8KiUeIBSoGVG3Y46pIW9gV18qIYSB
 x/oMlSchPk2nHIARQgmG702ulEZGw0wXUm5iWsKL4EOyr0QODuU4If0mk
 2ZqwK8Ut7leqmtGB2JUdliig3aajxgzwc48Ry5D5XRJfXhBjjO+4IsUVf
 Hw5wjusDhV2tLKeyM3kMHAJr9VFOsCa8kxvhF36Pg7ggEYXXg4E/t1AHX
 I90XPL+6cqvZDb8JfhLWicX3Ur+VKgWEX3+E+QXfzv9UTTnLV492FgESh
 u25Of4O39OIFtahSoOHcBxBjaVDrPuChJk+3ZHRSM4//SFJh33CdV4VYo A==;
X-CSE-ConnectionGUID: gL71ZRjyRs6A9/MfcImlFQ==
X-CSE-MsgGUID: vjYflqlQSjW/XDZDUFMh9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65409361"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65409361"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:24:41 -0700
X-CSE-ConnectionGUID: Szs6itmxSp2RgHs0T2YKOA==
X-CSE-MsgGUID: dpugBDzXR7KxoGZFmfQ5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="162528838"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:24:39 -0700
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
Subject: [PATCH i-g-t v6 0/5] intel-ci: Rename i915 blocklist and testlists
Date: Mon, 14 Jul 2025 18:24:30 +0200
Message-ID: <20250714162435.112599-1-kamil.konieczny@linux.intel.com>
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
v6: added follow_symlinks meson install option to last patch,
  added suggested-by to 4rd patch (Kamil)

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
 tests/intel-ci/meson.build                    |   7 +-
 tests/intel/i915_test_config.json             |   4 +-
 tests/intel/kms_test_config.json              |   8 +-
 15 files changed, 565 insertions(+), 554 deletions(-)
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


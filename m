Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87D4C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 16:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828A110E32E;
	Mon,  7 Jul 2025 16:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9NNXZ7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349310E32E
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751905429; x=1783441429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lMQIJr3zw+pe3UkHSjm6APncivP5tmjUaSxddUyktRs=;
 b=i9NNXZ7VAh0h/YiRbJdeFpYMhVwIvGxZGLi+ZGd4p2Ie1l6Mntj/QNSq
 qIu8zZxeZ1X+6uo/Ev7IgKOPI0F5uVTYp3R7++UarhWxZXoEQf/DQZoIQ
 yAh/yljzC+zVpoKsf7EWPh1tk82i6moBX8fQ0BT2DRERhmTVKWWknf9bX
 ECsqSxKlWSnlIuVZ04odOhXsJUdiEp+gY6pw86VOZGl3x5BBunDz1Azpu
 4OgURUs3DSYde/m+aTDtsrNY+V3W8f9kXmVXQ3qkdeh2m4Srh0Zid6E9Y
 ziTZ4YKc7MSsulq++wueZkhNzzTeujbdkk5gkloEiVYq3akR697mIJQmg A==;
X-CSE-ConnectionGUID: aFth7qIrRG27i0B/s8nIyQ==
X-CSE-MsgGUID: djs3/jpHSc6Y+sZe0vEj6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76680628"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="76680628"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:23:49 -0700
X-CSE-ConnectionGUID: Hj9c3sL3TGqOmxpy43SJ5Q==
X-CSE-MsgGUID: PH04uOM7RO65fqp8VpViNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="178916050"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.98])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:23:47 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3 0/5] intel-ci: Rename i915 blocklist and testlists
Date: Mon,  7 Jul 2025 18:23:35 +0200
Message-ID: <20250707162340.258267-1-kamil.konieczny@linux.intel.com>
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
v3: dropped xe from .gitlab-ci.yml (Kamil)

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


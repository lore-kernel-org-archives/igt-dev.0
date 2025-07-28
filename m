Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB85C83F26
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 17:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C6210E555;
	Mon, 28 Jul 2025 17:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhqLs1Wx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4F210E555
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753723921; x=1785259921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HrN1h56VxmBGyd2El5nncVvXL6RTvdUUdudVAfko4Cw=;
 b=FhqLs1Wx8hMpDA3uxoiH0xul/PtmdHmnlMuNAWcUCMErxBv5glfRpxBa
 KC54nK01TyJ2GSwHVTXhJ83INqpr/UIsabiI9IMKFWuiVE1EOn3IQFw1z
 frBTvUuK2ZDeGCm2o7baZcvEoFBp0hz567/vK6BpHtNOFEs1X/HKpSthM
 OQB4+afERfS6dIm/w5wJrOF+qpaUmZA3K67+0LUHF2qEe39mkgc3m8tKQ
 XW6ONabN+OuDGPdQrJ5P57xmS1vn8anSoo9aZBiTxobFg6LQxVZBSFW/R
 e92L2DTv7Sl9OeY2UAOPyLXLwH6+sFw/DLaK8sbv6ljx9nZL8ipRESZVY g==;
X-CSE-ConnectionGUID: i+ss1L2+T72RZFLBFOfCAA==
X-CSE-MsgGUID: aCfVaMqET3yI4FucqYu7ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66684035"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66684035"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:32:01 -0700
X-CSE-ConnectionGUID: 4WcS5dU/QzKJGrd0AKZDEg==
X-CSE-MsgGUID: enLHTR5/S46A2WVPRc95fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161731584"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.236])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:31:58 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v1 0/4] Rename verify script and update pipeline
Date: Mon, 28 Jul 2025 19:31:48 +0200
Message-ID: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
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

Rename script used for verification of blocklist and create
a temporary symlink with old name. Plan is to remove symlink
after few weeks, before next igt release.

While at it update also gitlab-ci pipeline.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Kamil Konieczny (4):
  scripts/run-tests: Update help
  gitlab-ci: Rename blocklist verify script
  scripts: Update documentation for blocklist verification
  scripts: Add symlink to verify

 .gitlab-ci.yml              |  4 +--
 scripts/run-tests.sh        |  2 +-
 scripts/verify-blacklist.sh | 61 +------------------------------------
 scripts/verify-blocklist.sh | 61 +++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 63 deletions(-)
 mode change 100755 => 120000 scripts/verify-blacklist.sh
 create mode 100755 scripts/verify-blocklist.sh

-- 
2.50.1


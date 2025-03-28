Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B050C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 16:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EFD10E106;
	Fri, 28 Mar 2025 16:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvYyjO4F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA5710E106
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743179657; x=1774715657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v24xehx7TzeyBc+JdyLAROh06AJjjYlPlAs7C5IsZiw=;
 b=QvYyjO4FKF5vG5rQ7RQK/UenGzwopxbE4vvFL4OB9cFQ2PMKFZ2jkBiQ
 qIFc4qPu9YisY6A2MSd0HeCGvrcxDGiMsSHG6/7Eim6zuT9Cthz0w+gcV
 ebsduDwzNCDncV5IexUhQlwq33hcZhedMcGGps2gbGnbGRSb1pgF39QPo
 4+zJmeFvW3fp+4ICGflePI5Wri6rk4TNijWQa6OV2LTanqZ4c39j0j908
 ZLytHNJM3Yh8ipsWuDyyjnByfz4PywLdWQWb+DqXKAM98IUMigF5wvs6l
 xb+6bAsaTJ2alC4RByjjWPZEx9R4ELEGxt0/xwf2jTL91qqsJfp5mRWv+ Q==;
X-CSE-ConnectionGUID: s3PoJNNCRgCxXbrTeVFgzQ==
X-CSE-MsgGUID: iKTldre9QmyWRPv00I/64g==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44676523"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44676523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:34:16 -0700
X-CSE-ConnectionGUID: u5WOfBlsTuyxYbEwvWF0nw==
X-CSE-MsgGUID: 0Ht/I21HSQSZNoWhiN8WqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130699193"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.53])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:34:15 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v1 0/1] runner: Use BOOTTIME for time checks
Date: Fri, 28 Mar 2025 17:33:41 +0100
Message-ID: <20250328163342.119140-1-kamil.konieczny@linux.intel.com>
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

Instead of using igt_gettime() function, use local runner function
with CLOCK_BOOTTIME, which counts in also suspend time.

You could look into this here:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0/shard-bmg-7/igt_runner14.txt

search for 2x-flip-vs-suspend and see difference:

[77.376851] [020/123] (932s left) kms_flip (2x-flip-vs-suspend)

[305.147183] Subtest 2x-flip-vs-suspend: SUCCESS (40.168s)
[314.469660] [021/123] (891s left) kms_addfb_basic (bad-pitch-999)

This shows test runs for around 932 - 891 = 40 seconds, while wall
time shows it took around 305 - 77 = 228 seconds, so it should had
less then 704s left.

Separate issue seen from this log is 9s difference until
next test run.

Link for igt_runner14.txt is available here:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0/shard-bmg-7/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode0.html

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Karol Krol <karol.krol@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>

Kamil Konieczny (1):
  runner/executor: Use bootime for time checks

 runner/executor.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.49.0


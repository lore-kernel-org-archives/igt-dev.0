Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552B606A329
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GLD8Hp+h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0108410E83C;
	Wed,  4 Nov 2026 07:30:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755A710E222
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 07:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793777341; x=1825313341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AfK8rAfTOuHSClRqUcLIqbBQudN4R+PFxRL87elqGaA=;
 b=GLD8Hp+h5tDQ7GKvObjI3YrcCNOqck13owNL26SPrk0s80hoXz1CGIBe
 kAacai0q5M5Xf++sxnuaI0lziYU0BPoUuo4KocKohyInGmoR6Z5SDZN24
 GbBqXXNhwFgEA+PYxGst2JeQ5nuxB/cLs4YZBwbIMmZ6n4eaSuHF9jiGP
 CPFdaCCDGAKzv3Z5+bOddAO/Ca5WsNJH3xFFjkDkrosg4Z8GRyKgzG6TI
 nLlqAjQUI+mJ1X69Rph98nUx8Ca++mkGz3WAX6FBc3ESMGaHAV4QmgR5s
 5oPUB588Pp8squ0t7JaFm/JiMrrLTIzARt+erK9N+hYaIPS48dHqWRIEd A==;
X-CSE-ConnectionGUID: oTDE5ArBQ66aCqho1HWeGw==
X-CSE-MsgGUID: wzz00xptTHOiByW1K9Ar9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2400906"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2400906"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 23:29:00 -0800
X-CSE-ConnectionGUID: wGmI6/YDQ2SufKiwj5bhUQ==
X-CSE-MsgGUID: dHBuagZaSUKImH+49q+mdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8422294"
Received: from dut1105bmgfrd.igk.intel.com ([10.211.177.74])
 by fmviesa011.fm.intel.com with ESMTP; 03 Nov 2026 23:28:59 -0800
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: karthik.poosa@intel.com, ramadevi.gandi@intel.com, badal.nilawar@intel.com,
 peter.senna@intel.com,
 "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>
Subject: [PATCH v1 0/2] Add xe_device_sysfs coverage in core_sysfs
Date: Wed,  4 Nov 2026 07:28:48 +0000
Message-ID: <20261104072850.18413-1-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>

This series adds core_sysfs coverage for xe_device_sysfs
attributes.

The first patch adds the following subtests:
- auto-link-downgrade-capable-show
- auto-link-downgrade-status-show
- lb-fan-control-version-show
- lb-voltage-regulator-version-show
- vram-d3cold-threshold-show
- vram-d3cold-threshold-store

The second patch updates platform blocklists for systems
where the corresponding sysfs attributes are not exposed
and the tests generate expected skips.

Patil, Shivtej Eknath (2):
  tests/core_sysfs: add coverage for xe_device_sysfs entries
  tests/intel-ci: blocklist unsupported core_sysfs sysfs tests on iGPU

 tests/core_sysfs.c                       | 115 +++++++++++++++++++++++
 tests/intel-ci/xe.lnl.core.blocklist.txt |   7 ++
 tests/intel-ci/xe.nvl.core.blocklist.txt |   7 ++
 tests/intel-ci/xe.ptl.core.blocklist.txt |   7 ++
 4 files changed, 136 insertions(+)

-- 
2.34.1


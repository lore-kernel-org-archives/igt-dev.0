Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3AAFED2EB
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 08:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80A110EA24;
	Thu, 12 Mar 2026 08:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5ds4yhp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2089510EA16
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773304655; x=1804840655;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X/cKb086R+kUOrW/a36PUyqVLcAnsZ6hdKcoVY9LcEk=;
 b=a5ds4yhppfA+2nqWbyn9Q6rglTKwj8rF+dMbL4QSJfGljkiG5hvZc8/h
 9WHCtMEAw7VpFmJQgNHGRKj20npcHnZXWJsvVquQeiQi8WjsPWULqL/Q8
 39TbrlBs/OhWQXDxfA1vFPeS9jyFEtovS1JJ+DK+wP6kk88Mx+Z0JpO7p
 JWNuawm+Y54YxqWDXUDyPtfJT7/HRSFAokL98BI17OVusJ5r/Uvk9tDvl
 bi0jVPbHkCGzs8Zd/V+MO4RYZp7gz6Iq9P8+0JOF4VBaWBv8WXs0zDRxO
 9CrPKrXp2APUgsMVMrvRTnVV7ZbsO7vijCEv1e4UCIWYu+6yzI0J9oOhc Q==;
X-CSE-ConnectionGUID: oI8Ge61dTP22++yLpXwojQ==
X-CSE-MsgGUID: m4/6eTJWSP+yjP0mhyv1CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85089910"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85089910"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:37:33 -0700
X-CSE-ConnectionGUID: OBk+S6PaTDOOpPtZkDynRA==
X-CSE-MsgGUID: /JkVvLd3RD6SkZc1TfcXJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225450878"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2026 01:37:32 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v3 0/2] Unify Batch Buffer Alignment and Introduce
 Aligned Buffer Mapping
Date: Thu, 12 Mar 2026 08:37:29 +0000
Message-Id: <20260312083731.644793-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch series refactors the SVM userptr copy test and batch buffer
setup in test suite to use a new aligned buffer mapping API.

The first patch introduces an interface for mapping buffer objects with
platform-required alignment, improving cross-platform compatibility and
simplifying batch buffer setup.

The second patch updates the SVM userptr copy test to leverage this API,
unifying batch buffer alignment logic and eliminating platform-specific
address assignment and conditional code paths.

ver2:
- Incorporated review comments (Kamil, Thomas Hellstrom)
ver3:
- Corrected Return format as per kerneldoc

Nishit Sharma (2):
  lib/xe: Introduce aligned buffer mapping
  tests/intel/xe_svm_usrptr_madvise: Unify batch buffer alignment

 lib/xe/xe_ioctl.c                   | 42 +++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h                   |  1 +
 tests/intel/xe_svm_usrptr_madvise.c | 11 ++++----
 3 files changed, 49 insertions(+), 5 deletions(-)

-- 
2.34.1


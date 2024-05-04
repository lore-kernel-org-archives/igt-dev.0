Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D79C4345F
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 13:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C32112C09;
	Sat,  4 May 2024 13:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nreCMp04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EEA112C08
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 13:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714827851; x=1746363851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HHeTbu+1fQSPlludSxVAfW/rjN1UPsDxUbnqXBBnBzg=;
 b=nreCMp04w7aMa+6+o40wblDEs0CXwQpu5x3uzQzTrFfBIqvOfy46VaIX
 Ea6L+rg0YefpMLEh0BYrjooQJBi6rlldsUU3MrQMzKV4Y0DnENWNWeTTe
 gWPe9s/y09p8V/1h+P0Wy8i1vQcmgVSc3WEptDhY5fYIcW/gr98VwBynW
 8OBbpeflq+XZaxQkS81WvXkGg0bjf8kzf+tcu0JyAe2/UoO59XWl6PVkd
 GGaezY8OAO1bWeCAArlT/VUyrzEXiu2uOTxTRtQ/4C4go8Wr8mQN1OXNs
 CZDVoghxRz9o2RsYub6/wbeGfe2KE5AErrieKon9npVXA0zRG/RTZGY9w Q==;
X-CSE-ConnectionGUID: dJ1sxIN/RN2sPgRkcsGkTg==
X-CSE-MsgGUID: NQppL5hRSBSsaoAjeYRZ5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10506811"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10506811"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 06:04:10 -0700
X-CSE-ConnectionGUID: dtbM6d3hTJaakec/WbLbUw==
X-CSE-MsgGUID: orH8A4YBSfqHOMRIF1G4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="27769773"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa009.jf.intel.com with ESMTP; 04 May 2024 06:04:08 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com,
	badal.nilawar@intel.com
Subject: [PATCH i-g-t v3 0/3] Add mocs tests
Date: Sat,  4 May 2024 18:34:55 +0530
Message-Id: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add below mocs tests:
1. Test to read and dump mocs debugfs entry
2. Test to check mocs values retained over suspend/resume.
3. Test to check mocs values retained over S2/S3/S4 suspend
   resume states.

Below patch add mocs debugfs in kernel:
https://patchwork.freedesktop.org/series/131425/

v2: Address review comments. Add S2/S3 tests. (Matt Roper)

v3: Address review comments. (Badal Nilawar)

Janga Rahul Kumar (3):
  tests/intel/xe_debugfs: Extend gt test to check mocs entry
  tests/intel/xe_pm: Add mocs runtime suspend resume test
  tests/intel/xe_pm: Add mocs S2-idle/S3/S4 suspend resume test

 tests/intel/xe_debugfs.c |  5 ++++
 tests/intel/xe_pm.c      | 52 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

-- 
2.25.1


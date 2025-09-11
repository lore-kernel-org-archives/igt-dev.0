Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05822CA1016
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 06:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C4110E0BE;
	Thu, 11 Sep 2025 06:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mK2V03jE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C37010E0BE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 06:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757571464; x=1789107464;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8/lcFiY9MUFmD5y2mObJkEXkIv1kLwGEd0fZbrbyj38=;
 b=mK2V03jEqrdhLYJ4MWU4FdbFJxtY4F8ruBXRzSQA6TNHhhkFSVlzz5hs
 nX9TomgAZdGr/HjpP0vE3zPICIXmPASSyRC9/g5BCv6V2sNNMOqteGjrc
 vZVXrXE2ohF2VV0smTgKZBJC245fK18MpT+B175losJVijZtmNKtFywg2
 YbDMmxUIvMOPyxhXjZCEHW19zeJXr8Sn/euLW+onRnhvh8OfN7IKQf2HQ
 58aBiV/XXsN1KjZBnyiTMx9rHmH2+ZgJKitZpucoIqyXnzDMChuvAT1P+
 Mi0t1Yg/zLuEhKbOw+Nm/tD5/L5Hx6vepdpl++BdWYrMiDcpyfrxPgmcZ w==;
X-CSE-ConnectionGUID: AKSzIF8lQhmdHVi4kV+2MQ==
X-CSE-MsgGUID: VjLEV33ISBuioUktstFBMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70148973"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="70148973"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:17:44 -0700
X-CSE-ConnectionGUID: ZqBy/DzrSVy+yQk/0qG7qw==
X-CSE-MsgGUID: kCIpX3+PR0WydCzm7EhLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="177644390"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:17:43 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v6 i-g-t 1/1] tests/intel/xe_evict_ccs: Adjust object size for
 non-resizable BAR
Date: Thu, 11 Sep 2025 06:17:29 +0000
Message-Id: <20250911061730.1855974-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
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

Some BIOS configurations do not support or enable resizable BAR,
resulting in a maximum BAR size of 256MB. This patch adjusts the
maximum object size used in test conditions based on the available
VRAM.

v2: Adjusted the subject name

v3: Inco-operated review comments [kamil]

v4: Fixed typo.

v5: Fixed review comment for igt warnings and commit subject. [kamil]
    Fixed the condition for user provided max size value. [kamil]
v6: Modified to adjust params only incase vram_mb <= 256MB. [kamil]

Sobin Thomas (1):
  tests/intel/xe_evict_ccs: Adjust object size for non-resizable BAR

 tests/intel/xe_evict_ccs.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

-- 
2.34.1


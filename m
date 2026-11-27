Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489BD606A321
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E7vMIoce
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9D01129D6;
	Fri, 27 Nov 2026 10:25:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6859B1129DB
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 10:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795775093; x=1827311093;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hVd7Sx8+fKD/wgcBUiMYcaL/0Vo80QjmaF5PgBTOsGs=;
 b=E7vMIoceEPsjiFRT+mTf1k9CF1ju6bkxh3BcAcoS8bwHrtWJAdDVFAtS
 oR5awDI9oaNQyadqqXY1SLPNjw6nQYFnGr0bTPPJSLFGshMS7/kcz5q+p
 uCY9iKF5EwvhSWuERsfU++c4epnC8CrQf7WzlePLjchd0V2zN/QsL+wjv
 y7f42l/HJdSSWPiJN4+N5azbi/rcJWBZGG7nNrHUpRdyXPfLATBRllgGE
 Wnj2mLglZd7hbBiwKnMPYmVoDq5j3XKNPNM9ZAv6fd6aOMTAIWJazXlvi
 MRodcII41nIaeFU/rd6LFyMXz/ArY6jVwE4Ds5dI0x0JD6wH8mHDYkiSC w==;
X-CSE-ConnectionGUID: 6DiDE0zgSROqvfBlix2ePQ==
X-CSE-MsgGUID: +5siHrWfRTGU/Ln7stQL5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4587269"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4587269"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:24:53 -0800
X-CSE-ConnectionGUID: lC2A84roTnqz+Mim5SPAIA==
X-CSE-MsgGUID: 64Q9LLJAQ+GtB72tig5+vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12884202"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:24:51 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com, sk.anirban@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 0/2] Avoid leaking configfs device groups
Date: Fri, 27 Nov 2026 15:54:39 +0530
Message-ID: <20261127102438.2249575-4-soham.purkait@intel.com>
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

Reuse pre-existing groups without removing them, and clean up
test-created groups and fds in the configfs and survivability tests.

Soham Purkait (2):
  tests/intel/xe_configfs: Avoid leaking configfs device groups
  tests/intel/xe_survivability: Avoid leaking configfs device groups

 lib/igt_configfs.c             |  6 ++-
 tests/intel/xe_configfs.c      | 87 ++++++++++++++++++----------------
 tests/intel/xe_survivability.c | 37 ++++++++++-----
 3 files changed, 76 insertions(+), 54 deletions(-)

-- 
2.43.0


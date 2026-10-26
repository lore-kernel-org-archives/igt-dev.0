Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61934606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bsTTqO6/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1568D10E03B;
	Mon, 26 Oct 2026 14:18:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF65110E03B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 14:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793024267; x=1824560267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OsZ+FC19oW1uXqEjZbHGzeltU7CcmhzEvjAOn8XMwQE=;
 b=bsTTqO6/o1s7fylAz6Q2W7VBkaV1jtBsQQblwCy14Lxwi+awEFN8VMY+
 auL16c+RtV1+vbms8F7geDEQ0JH4Nlex/riyKS+ycBgG5kjIgYCvnq8Dg
 qNM4Mm/4/09MwvLv8XasSGNa0bIKQ5KYe+s87j2MJmPh4PYdGhqHiwydf
 4jIRzGDAjpHEXQr6yjfPIv0jG7bG0mHlZblsHuhpqXOcplyVaFLJ3iXQN
 kz9kecXkIyWo96veFbDNnnXcYBDb/g+Xe6yqKdiFKcFK9TtNHnvtn3nTs
 m/MZYWa4bZvPxvCpk/jEkVrsuAenjFWU5t+c1+sgBc5X2dSOTfVo9nZ5p A==;
X-CSE-ConnectionGUID: RAzE2nTRTb+F3yVH0FHdNg==
X-CSE-MsgGUID: 3fk1ClnmQPSYvlHHiRs4jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1720574"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1720574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:17:47 -0700
X-CSE-ConnectionGUID: BekkgHDGTa2U495xsVpvRA==
X-CSE-MsgGUID: mG3tIp1wS5q31BibZGaILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4226376"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.96])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:17:46 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v2 0/2] Runner: report test command line
Date: Mon, 26 Oct 2026 15:17:00 +0100
Message-ID: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add reporting of command line used for execution of test.

TODO: add this also to results.json but this could be non-trivial
as written in notes here:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/42

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>

Kamil Konieczny (2):
  runner/executor: Build test command line before fork
  runner/executor: Report command used for test exec

 runner/executor.c | 118 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 92 insertions(+), 26 deletions(-)

-- 
2.55.0


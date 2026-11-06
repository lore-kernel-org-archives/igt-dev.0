Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11125606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P/c9miex
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24B310E32D;
	Fri,  6 Nov 2026 18:10:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220EA10E1B1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 18:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793988542; x=1825524542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K0k0KeFN9bROnPq4ZtdvNuI3EQPnSk3n3XxZ+cdKUS4=;
 b=P/c9miexgbhgGPp0ABUSxUnFETcZSCrCHfk9s8YL2aqZ+JNPT4Rpj4nR
 HjjuyOL0cTU/1trtyO863i5NybIGYrh3tYakJEgyn/14nBIMHx0dUsjJH
 ldqI1pz2o5b8IM8eKzhh3djJ+2LfgLx1EV/CVoY5KsQITXo4S99IYEzrp
 lIn7TUOAf4E9y8r2s18C4jeKPoSAFKbBgVDgj3OI2YNAnnfPg30SYE/rh
 QjNUartNlAlmD1GWCAyt9JAiV57nmjbL+cuJeDhdBQFAIi4Pn9U0xbnyH
 beRfy9A1Kf6tfYndhF363pmbzHf6SAFcCEKF1GTK5a8EWGQhz7ZGbFHbn g==;
X-CSE-ConnectionGUID: H6Kx8YHhTwufaB/JeNu0Bw==
X-CSE-MsgGUID: d4mQL7hSQaC2jvJfNi+i4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2723903"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2723903"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:02 -0800
X-CSE-ConnectionGUID: VA+1HziTQG23O2lvPzrl6w==
X-CSE-MsgGUID: n9IYMrQkQFC/kggxAERcxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7362601"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:00 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v9 0/9] tests: limiting suspend tests
Date: Fri,  6 Nov 2026 19:08:40 +0100
Message-ID: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Next version of [1].

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20261013161013.1364753-1-michal.grzelak@linux.intel.com/

---
Changelog:
v8->v9
- fix extra long opts string for kms_ccs (JP)

v7->v8
- use pipe mask (Jani)
- add 2 new patches

Michał Grzelak (9):
  tests/kms_async_flips: split outer test loop into two
  tests/kms_async_flips: set mask for available hardware pipes
  tests/kms_async_flips: limit #pipes tested during suspend
  tests/kms_vblank: limit #outputs tested during suspend
  tests/intel/kms_ccs: split outer test loop into two
  tests/intel/kms_ccs: limit #outputs tested during suspend
  tests/intel/kms_ccs: set mask for available hardware pipes
  tests/intel/kms_ccs: limit #pipes tested during suspend
  tests/kms_hdr: run on 3 outputs when testing suspend

 tests/intel/kms_ccs.c   | 115 ++++++++++++++++++++++++++++++----------
 tests/kms_async_flips.c | 100 +++++++++++++++++++++++-----------
 tests/kms_hdr.c         |  30 ++++++++++-
 tests/kms_vblank.c      |  21 +++++++-
 4 files changed, 203 insertions(+), 63 deletions(-)

-- 
2.45.2


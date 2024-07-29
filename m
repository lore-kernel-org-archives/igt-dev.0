Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BF3C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF4110E42A;
	Mon, 29 Jul 2024 16:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgHGmPek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE4010E428
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269010; x=1753805010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BuN0i8mYdRel0GEqvJurpa/0vQLt75dNrBsq8ficmg0=;
 b=cgHGmPekQ96SlcrCh5SHeXyeHCrb3212R8YnKv10pF4GHOk05C9UMG+e
 +MFNURPsydPoV+wueGdHeGqVnnfFavQqr2ujOdWr7gkXVqEthmMYtjh53
 JA3pt3sxJ610mIDhB/5dL9CYesy/ze/tEBOB5NoW4a50B/yXuSU9apAio
 3IlyFzprmMacs+ZtpaKQbRkzvvP5AVDjJD0B6gkTs0tsxq2ouxlddln2s
 YBJ/G8Ki8KFNfu+Qf5zv6hq5tyGucB+40YbJvPyi4TVp5ADk85iEUqMWI
 69UbgCS8lXxn/EknYoDwF5vJRSNZ6G8PxHEeou8wBKmGQ/5iuIipkNneJ g==;
X-CSE-ConnectionGUID: i6IydKjmTrekxcSEbNGBfg==
X-CSE-MsgGUID: HOyiSD0/R2aRqpBhBGXl/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427083"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208,223";a="31427083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:30 -0700
X-CSE-ConnectionGUID: KbUW9tDsToCucas9CSF9cA==
X-CSE-MsgGUID: DZbCrDxoTV6gdFGOrtO4+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208,223";a="53737800"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:26 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 21/66] tests/xe_eudebug: Add support for dynamic debugger
 sysfs toggle
Date: Mon, 29 Jul 2024 18:01:14 +0200
Message-Id: <20240729160159.37036-22-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From now on the debugger is disabled by default so it is required
to enable the debugger before using it. This change addresses that
fact by calling necessary library functions within test fixtures.

Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index f5240e838..adf5e79ac 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1137,10 +1137,12 @@ static void test_metadata_attach(int fd, unsigned int flags, int num_clients)
 
 igt_main
 {
+	bool was_enabled;
 	int fd;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		was_enabled = xe_eudebug_enable(fd, true);
 	}
 
 	igt_subtest("basic-connect")
@@ -1191,6 +1193,8 @@ igt_main
 	igt_subtest("discovery-empty-clients")
 		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
 
-	igt_fixture
+	igt_fixture {
+		xe_eudebug_enable(fd, was_enabled);
 		drm_close_driver(fd);
+	}
 }
-- 
2.34.1


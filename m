Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEC8C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A22810E50D;
	Tue, 30 Jul 2024 11:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2nrCMeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A9110E515
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340065; x=1753876065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u/E2yj9MTgXbrKpaxp0Fju60abU91qOAeMZQL6yOj7Q=;
 b=M2nrCMeJ9DlecTgADi16EwJUNP+wu4JlQMui77Yluv7oR8i2VUQikbOk
 glEThayYXemI6157CX2KgC3x7M1j8mOhDkgnWoQu3QK45UcEW3X/RfEjg
 GTKWwB7ph2IokQ09EGFIE+FtIuSkcVghY/wPZbIcHT/CdZM22OAp+Wrs3
 4YmRRoZm39SdYCBhAQCiZWx2SP0CBjCz9hCAaxVByVk42W4FjJilBLz2Q
 8xhVpGeDgq8ymhZEgzrPPqjb4dYv7W73P50RBDsRBcT1OyXya0kk8Dy/c
 Nomgsc6E7cEKtapMcDoo1gWUoD9wpOvtfPOqYRCVvCQ9JtvggNLYzIPlQ A==;
X-CSE-ConnectionGUID: BXWwyPt6S5ugl+cNKsb7PA==
X-CSE-MsgGUID: 5U3b0hFpSwqfsnDycsiySQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937291"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208,223";a="23937291"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:44 -0700
X-CSE-ConnectionGUID: dbB+G2sYR0OEZBFwsm1B6w==
X-CSE-MsgGUID: kAkvnI59QZ+nMjsKZww4JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208,223";a="54216731"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:41 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 21/66] tests/xe_eudebug: Add support for dynamic
 debugger sysfs toggle
Date: Tue, 30 Jul 2024 13:44:38 +0200
Message-Id: <20240730114523.334156-22-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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
index 577985ba7..de8edb485 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1138,10 +1138,12 @@ static void test_metadata_attach(int fd, unsigned int flags, int num_clients)
 
 igt_main
 {
+	bool was_enabled;
 	int fd;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		was_enabled = xe_eudebug_enable(fd, true);
 	}
 
 	igt_subtest("basic-connect")
@@ -1192,6 +1194,8 @@ igt_main
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


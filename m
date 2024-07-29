Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCF4C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BDC10E420;
	Mon, 29 Jul 2024 16:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fy1oKE19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216B510E42E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268984; x=1753804984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IvipXbvprYB62w/QHXxMMBixswdugJUvBYSs434fRr0=;
 b=fy1oKE19PbMWOtTuJduG2G80a70I4wxDsNBJQ3A52y0QQG0Q3yUf71Mi
 /TF1+zGsjKllRvN2P7OjOKRLFKmP6bzGs6xRhlrV5JxfIP0PRCuPAnym2
 JwXuBIsLhCm6m5oUyZoENulFtV5HuDbZjIW6DxOYDeiB5jQmP1PWjKFhy
 zzKHF2X3oowN2u+N9MwBusCK+HpIYE4hxv8mIumPkDM0qaXRL7bqS9Urs
 a6AL4wOrOnjYmSEkW9FfXK0Q9B53KW9EqoeTAARiydEEQheMg4lpiAoS8
 wMI2ngq23El37F5HEGUAwi16f/p2b/vXD51Z5qC775kFGEM/BERfnBW9y g==;
X-CSE-ConnectionGUID: ZnkZjgTET6iSVVyYqOBJ0g==
X-CSE-MsgGUID: xBzEG34UQnC7E2ZBt26YGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426905"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426905"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:04 -0700
X-CSE-ConnectionGUID: xXb3wXE8QlqRsE1bUn2cSw==
X-CSE-MsgGUID: JEvIhQzYQXSm7hVCeNOmIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737519"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:00 -0700
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
Subject: [PATCH 13/66] tests/xe_eudebug: Add vm events sanity check
Date: Mon, 29 Jul 2024 18:01:06 +0200
Message-Id: <20240729160159.37036-14-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Add basic test validating eudebug vm events.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 6bbad795c..5a11e7347 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -8,11 +8,27 @@
 #include "igt.h"
 #include "xe/xe_eudebug.h"
 
+#define CREATE_VMS	(1 << 0)
 static void run_basic_client(struct xe_eudebug_client *c)
 {
-	int fd;
+	int fd, i;
 
 	fd = xe_eudebug_client_open_driver(c);
+
+	if (c->flags & CREATE_VMS) {
+		const uint32_t flags[] = {
+			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
+			DRM_XE_VM_CREATE_FLAG_LR_MODE,
+		};
+		uint32_t vms[ARRAY_SIZE(flags)];
+
+		for (i = 0; i < ARRAY_SIZE(flags); i++)
+			vms[i] = xe_eudebug_client_vm_create(c, fd, flags[i], 0);
+
+		for (i--; i >= 0; i--)
+			xe_eudebug_client_vm_destroy(c, fd, vms[i]);
+	}
+
 	xe_eudebug_client_close_driver(c, fd);
 }
 
@@ -251,7 +267,10 @@ igt_main
 		test_basic_sessions(fd, 0, 1);
 
 	igt_subtest("multiple-sessions")
-		test_basic_sessions(fd, 0, 4);
+		test_basic_sessions(fd, CREATE_VMS, 4);
+
+	igt_subtest("basic-vms")
+		test_basic_sessions(fd, CREATE_VMS, 1);
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.34.1


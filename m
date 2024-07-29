Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D01C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE1D10E434;
	Mon, 29 Jul 2024 16:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5udiVdl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFE510E434
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269123; x=1753805123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Gt8kZRr2T3O9XeoWR5NC7zg0LnrAgMitaaDhiIN6G4=;
 b=W5udiVdlWmuhFTvb6ksnWkc9Vvy6ydA31BH53AKIN5q9Bh/1UOywMi78
 f001/mgwsNdM8pPKwQm5Jv0nVSj15r84tDy1jqjXO8B6iqw8D+d9vIBj0
 qmxGC2TFSreK3giSuvAAYJXxt4D1+ckhO4YnzM30ZMBc/tM+FKfQa4Jlw
 zYPH5kFKsE0qxpNxbnJdsZTup5ERn1SOVaw/t2+NbiQ4slzEbxL1QXFGt
 5xVHqltvo5zriEyqxunRmcS+17ICvvk0FkhkHzrHN+Y8R4Efnfdp3j290
 BMVa7u5+sSz8qdpqPT/CMr6MapfwYE51c2XLe7khdIX1kKgrMrde6mOoB A==;
X-CSE-ConnectionGUID: 7L1GL5N8RPOV//twNhgBfg==
X-CSE-MsgGUID: 2jQi/e87QkCSjIe4FC2Q/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427689"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208,223";a="31427689"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:12 -0700
X-CSE-ConnectionGUID: x3GS5cVJRGWxY5x4qpnjVQ==
X-CSE-MsgGUID: F535C7juRw+LElbA0/bidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208,223";a="53739702"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:09 -0700
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
Subject: [PATCH 54/66] tests/xe_eudebug_online: Add support for dynamic
 debugger sysfs toggle
Date: Mon, 29 Jul 2024 18:01:47 +0200
Message-Id: <20240729160159.37036-55-christoph.manszewski@intel.com>
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
 tests/intel/xe_eudebug_online.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 5bb165fef..12edd0eb5 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1023,12 +1023,14 @@ static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
+	bool was_enabled;
 	int fd;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		intel_allocator_multiprocess_start();
 		igt_srandom();
+		was_enabled = xe_eudebug_enable(fd, true);
 	}
 
 	test_gt_render_or_compute("basic-breakpoint", fd, hwe)
@@ -1050,6 +1052,8 @@ igt_main
 		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
 
 	igt_fixture {
+		xe_eudebug_enable(fd, was_enabled);
+
 		intel_allocator_multiprocess_stop();
 		drm_close_driver(fd);
 	}
-- 
2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED00C3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F7310E50D;
	Tue, 30 Jul 2024 11:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eU3W1ohL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D2310E517
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340164; x=1753876164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Gt8kZRr2T3O9XeoWR5NC7zg0LnrAgMitaaDhiIN6G4=;
 b=eU3W1ohLIM/rUc/JtojuJOxND7L89t1gjsnRcIEmP7KmzkH0uTF9yXU7
 txnLO/i1+lTXFI/NyE+hBcIed9ybF+VZ3hhKY+JEHu9W3nmCduvAlrkeJ
 WpSB0rF3qj5+r9MF8cy2CAFb0G/fgDPzYL2ayzgAthmLR5a0PwpQ9cNNo
 FTX7ZWE23LHBf8lhBpMAPJ7bSUchlspU3L97KotRv3sXZoqfw86NlU6IM
 4GRKZZlIIB7NxgJ7qsauWvEkoDtsFjaY9PaVvmQD271qYs7qD3VhnlIbN
 K9E+TkRDNdaugjdrsa688h29FtP5PBpnfC2tRCH17VqcY97o/d/Onf4kB Q==;
X-CSE-ConnectionGUID: foDw2cwoRmW4t4VuK/Gh7g==
X-CSE-MsgGUID: 9Ct7COFhR8qrtC5+Cahp4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20286736"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208,223";a="20286736"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:24 -0700
X-CSE-ConnectionGUID: XoUGGs1PRraNTx4vR7tsLg==
X-CSE-MsgGUID: 5L0in1+vSFavYkKXEB+ndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208,223";a="54217530"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:21 -0700
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
Subject: [PATCH i-g-t v2 54/66] tests/xe_eudebug_online: Add support for
 dynamic debugger sysfs toggle
Date: Tue, 30 Jul 2024 13:45:11 +0200
Message-Id: <20240730114523.334156-55-christoph.manszewski@intel.com>
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


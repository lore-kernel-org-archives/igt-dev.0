Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65271C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2686910E42A;
	Mon, 29 Jul 2024 16:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPVrJHr6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7E610E42A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268991; x=1753804991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JkqJEC5KziVcxvgHVPMHS//na8p6xH1hakwLUXDJebs=;
 b=WPVrJHr6ptnYxcI7H0dBq5C3XhBMFr6v7ZSNgt2w0d6sBWdlsYK26m3V
 MpQmm4W8XfPBKnxIowgb6h3frMEUGp7k/VvR8iuDDxrczUC5qBN0MQtaS
 S4mHEoj8/KPOCOHyfz2+ekOJZQoqpymvHq5X5HjSKILs85VEWkmcCh4At
 ttFHc2blMqbTeds0Q//cfmOOtWCUTKiAMGLKutEI2mqkfjXbrlxoeKgrF
 jKFsOprZMOlxecMnn1Q4OwZLA3IMyZ+uyCkJuDcdBlxcHCzSzCj2EqJFQ
 /FiXs5Sf2p9lgiPsNjRZfVUqWdQW67wExDCfM29YnoKYQRDJJ7AbetvJG g==;
X-CSE-ConnectionGUID: gPqFvHqIT66v8Oda+gqYyA==
X-CSE-MsgGUID: 8MNtfp5URLiE2+i91U4WhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426933"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426933"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:10 -0700
X-CSE-ConnectionGUID: 0Jf8SSkfTq+CF4MesBfVQw==
X-CSE-MsgGUID: W8Ttt3ViQ7SVBUxt9mvkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737592"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:07 -0700
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
Subject: [PATCH 15/66] tests/xe_eudebug: Add TEST/SUBTEST documentation
Date: Mon, 29 Jul 2024 18:01:08 +0200
Message-Id: <20240729160159.37036-16-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Document xe_eudebug IGT test basing on its internal logic.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 147836bd1..cf8f01684 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2,6 +2,16 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+
+/**
+ * TEST: Test EU Debugger functionality
+ * Category: Core
+ * Mega feature: EUdebug
+ * Sub-category: EUdebug tests
+ * Functionality: eu debugger framework
+ * Test category: functionality test
+ */
+
 #include <poll.h>
 #include <sys/ioctl.h>
 
@@ -86,6 +96,12 @@ static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *
 	return ret;
 }
 
+/**
+ * SUBTEST: basic-connect
+ * Description:
+ *	Exercise XE_EUDEBG_CONNECT ioctl with passing
+ *	valid and invalid params.
+ */
 static void test_connect(int fd)
 {
 	struct drm_xe_eudebug_connect param = {};
@@ -138,6 +154,11 @@ static void test_connect(int fd)
 	close(debugfd);
 }
 
+/**
+ * SUBTEST: basic-close
+ * Description:
+ *	Test whether eudebug can be reattached after closure.
+ */
 static void test_close(int fd)
 {
 	struct drm_xe_eudebug_connect param = { 0,  };
@@ -224,6 +245,20 @@ static void test_read_event(int fd)
 	free(event);
 }
 
+/**
+ * SUBTEST: basic-client
+ * Description:
+ *	Attach the debugger to process which opens and closes xe drm client.
+ *
+ * SUBTEST: multiple-sessions
+ * Description:
+ *	Simultaneously attach many debuggers to many processes.
+ *	Each process opens and closes xe drm client.
+ *
+ * SUBTEST: basic-vms
+ * Description:
+ *	Attach the debugger to process which creates and destroys a few vms.
+ */
 static void test_basic_sessions(int fd, unsigned int flags, int count)
 {
 	struct xe_eudebug_session **s;
@@ -279,6 +314,16 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 	}
 }
 
+/**
+ * SUBTEST: discovery-%s
+ * Description: Race discovery against %arg[1] and the debugger dettach.
+ *
+ * arg[1]:
+ *
+ * @race:		resources creation
+ * @empty:		resources destruction
+ * @empty-clients:	client closure
+ */
 static void *discovery_race_thread(void *data)
 {
 	struct {
-- 
2.34.1


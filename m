Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4039C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD09210E420;
	Mon, 29 Jul 2024 16:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoHkfcVb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392BB10E42F
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269046; x=1753805046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nTQyvEq1Vc6BjZGD/m/KHAW6zEqEfMAZhXHo7MbB3wk=;
 b=JoHkfcVb3OfwRKHORXgOokeIWnka2xEZZyVjSIEe5bJDr03WOenOGfhc
 NLhgV9ffW/jehJxjTyFj7UNIkIcCftxKGC3DtHkLS+OYaJp5jWPMECZBz
 7pE4VUCSRoNMsA7BWdKngTFQQLuIlQWKz78BIOeZYAiIhHQzGHJOKXjCg
 0El1BM/1KiVyWanNOHVqMSwEPkZC6LnzsNX8+PSM46KKPUNP6qpIExHbu
 5xwH6eaMu7BjzvQZtX2zJnQzpoKQxKnzEfR1z3Gpj7ouIjECuCoCAlWVw
 mLJ3J5/ojc1fGpXTPRNd1xflQcmY937Dp4vqeCo+ynYUyqiBIKe8vOVF4 Q==;
X-CSE-ConnectionGUID: tii5VmpfQY6XXPR/e1zO+w==
X-CSE-MsgGUID: TJrcvuHgStOvJglMyiPnrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427194"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427194"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:06 -0700
X-CSE-ConnectionGUID: HfKc+TATQt2Mc7h4L5BTDw==
X-CSE-MsgGUID: bSa0q2THSYODtcPG69ww/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738423"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:02 -0700
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
Subject: [PATCH 33/66] tests/xe_eudebug: Add multigpu scenarios
Date: Mon, 29 Jul 2024 18:01:26 +0200
Message-Id: <20240729160159.37036-34-christoph.manszewski@intel.com>
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Add multigpu-basic-client and multigpu-basic-client-many tests,
extending basic-client and multiple-session tests.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 62 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 4bcca4fc6..1f4bb49af 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -875,6 +875,15 @@ static void test_read_event(int fd)
  *	Attach the debugger to a process that performs bind, bind array, rebind,
  *	partial unbind, unbind and unbind all operations.
  *
+ * SUBTEST: multigpu-basic-client
+ * Description:
+ *	Attach the debugger to process which opens and closes xe drm client on all Xe devices.
+ *
+ * SUBTEST: multigpu-basic-client-many
+ * Description:
+ *	Simultaneously attach many debuggers to many processes on all Xe devices.
+ *	Each process opens and closes xe drm client and creates few resources.
+ *
  * arg[1]:
  *
  * @vms: vms
@@ -1971,7 +1980,8 @@ static void test_basic_ufence(int fd, unsigned int flags)
 igt_main
 {
 	bool was_enabled;
-	int fd;
+	bool *multigpu_was_enabled;
+	int fd, gpu_count;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -2063,4 +2073,54 @@ igt_main
 		xe_eudebug_enable(fd, was_enabled);
 		drm_close_driver(fd);
 	}
+
+	igt_subtest_group {
+		igt_fixture {
+			gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
+			igt_require(gpu_count >= 2);
+
+			multigpu_was_enabled = malloc(gpu_count * sizeof(bool));
+			igt_assert(multigpu_was_enabled);
+			for (int i = 0; i < gpu_count; i++) {
+				fd = drm_open_filtered_card(i);
+				multigpu_was_enabled[i] = xe_eudebug_enable(fd, true);
+				close(fd);
+			}
+		}
+
+		igt_subtest("multigpu-basic-client") {
+			igt_multi_fork(child, gpu_count) {
+				fd = drm_open_filtered_card(child);
+				igt_assert_f(fd > 0, "cannot open gpu-%d, errno=%d\n",
+					     child, errno);
+				igt_assert(is_xe_device(fd));
+
+				test_basic_sessions(fd, 0, 1, true);
+				close(fd);
+			}
+			igt_waitchildren();
+		}
+
+		igt_subtest("multigpu-basic-client-many") {
+			igt_multi_fork(child, gpu_count) {
+				fd = drm_open_filtered_card(child);
+				igt_assert_f(fd > 0, "cannot open gpu-%d, errno=%d\n",
+					     child, errno);
+				igt_assert(is_xe_device(fd));
+
+				test_basic_sessions(fd, 0, 4, true);
+				close(fd);
+			}
+			igt_waitchildren();
+		}
+
+		igt_fixture {
+			for (int i = 0; i < gpu_count; i++) {
+				fd = drm_open_filtered_card(i);
+				xe_eudebug_enable(fd, multigpu_was_enabled[i]);
+				close(fd);
+			}
+			free(multigpu_was_enabled);
+		}
+	}
 }
-- 
2.34.1


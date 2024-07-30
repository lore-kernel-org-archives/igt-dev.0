Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9ADC3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA3E10E515;
	Tue, 30 Jul 2024 11:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T04NfhJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF76E10E515
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340041; x=1753876041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jVy45hFe/R9p4YiDJJCTrmXmHmJP9dHocmvcAC+Tn4M=;
 b=T04NfhJ6bv9od9lipllqYILnGRoTqTV7XP8OSr2VAaxElCrSqlKTW4xU
 2+o0201iQrCQXyC6fp8sWNDksyEQHx/1V+0jBBYCZMk3Uy5pz1pO0/DMX
 3+BoWLYllpdjEgISwvSTSdeMbBtLi+JA8MVrjNM2m9vShsNNsU1vRaTmQ
 RkOiA1kupgjTawVQ9HF6wo+xZVvTkdtL7X6RHtdF7YKXPK5EnJ1qMXAGv
 8KVoYT4RjGq6hApSt9hZKsjv2xoWVjJUOthoEL/x+lqzABSnrgx+tX1ig
 T7VIpUsmrn9PtU4y4pnuNp8IX8who2KFTnDcNGyREWo87DXYt1sJgHNHN w==;
X-CSE-ConnectionGUID: ucAu9SrvSqe6Jyi38Ab29w==
X-CSE-MsgGUID: oiuep85FQ1uiC+4yaeamSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937214"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937214"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:21 -0700
X-CSE-ConnectionGUID: C1fOmk04TIae53UsHxLA7g==
X-CSE-MsgGUID: Km3HBiRNTdKQoL9QXDPOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216602"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:18 -0700
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
Subject: [PATCH i-g-t v2 13/66] tests/xe_eudebug: Exercise read_event ioctl
Date: Tue, 30 Jul 2024 13:44:30 +0200
Message-Id: <20240730114523.334156-14-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Introduce synchronous test, which validates eu debugger read_event
ioctl.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 109 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 7ca0138a2..0cef652e2 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -12,6 +12,9 @@
  * Test category: functionality test
  */
 
+#include <poll.h>
+#include <sys/ioctl.h>
+
 #include "igt.h"
 #include "xe/xe_eudebug.h"
 
@@ -23,6 +26,45 @@ static void run_basic_client(struct xe_eudebug_client *c)
 	xe_eudebug_client_close_driver(c, fd);
 }
 
+static int read_event(int debugfd, struct drm_xe_eudebug_event *event)
+{
+	int ret;
+
+	ret = igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_READ_EVENT, event);
+	if (ret < 0)
+		return -errno;
+
+	return ret;
+}
+
+static int __read_event(int debugfd, struct drm_xe_eudebug_event *event)
+{
+	int ret;
+
+	ret = ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_READ_EVENT, event);
+	if (ret < 0)
+		return -errno;
+
+	return ret;
+}
+
+static int poll_event(int fd, int timeout_ms)
+{
+	int ret;
+
+	struct pollfd p = {
+		.fd = fd,
+		.events = POLLIN,
+		.revents = 0,
+	};
+
+	ret = poll(&p, 1, timeout_ms);
+	if (ret == -1)
+		return -errno;
+
+	return ret == 1 && (p.revents & POLLIN);
+}
+
 static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *param)
 {
 	int ret = 0;
@@ -124,6 +166,69 @@ static void test_close(int fd)
 	close(debug_fd1);
 }
 
+/**
+ * SUBTEST: basic-read-event
+ * Description:
+ *	Synchronously exercise eu debugger event polling and reading.
+ */
+#define MAX_EVENT_SIZE (32 * 1024)
+static void test_read_event(int fd)
+{
+	struct drm_xe_eudebug_event *event;
+	struct xe_eudebug_debugger *d;
+	struct xe_eudebug_client *c;
+
+	event = malloc(MAX_EVENT_SIZE);
+	igt_assert(event);
+	memset(event, 0, sizeof(*event));
+
+	c = xe_eudebug_client_create(fd, run_basic_client, 0, NULL);
+	d = xe_eudebug_debugger_create(fd, 0, NULL);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+	igt_assert_eq(poll_event(d->fd, 500), 0);
+
+	event->len = 1;
+	event->type = DRM_XE_EUDEBUG_EVENT_NONE;
+	igt_assert_eq(read_event(d->fd, event), -EINVAL);
+
+	event->len = MAX_EVENT_SIZE;
+	event->type = DRM_XE_EUDEBUG_EVENT_NONE;
+	igt_assert_eq(read_event(d->fd, event), -EINVAL);
+
+	xe_eudebug_client_start(c);
+
+	igt_assert_eq(poll_event(d->fd, 500), 1);
+	event->type = DRM_XE_EUDEBUG_EVENT_READ;
+	igt_assert_eq(read_event(d->fd, event), 0);
+
+	igt_assert_eq(poll_event(d->fd, 500), 1);
+	event->len = MAX_EVENT_SIZE;
+	event->flags = 0;
+	event->type = DRM_XE_EUDEBUG_EVENT_READ;
+	igt_assert_eq(read_event(d->fd, event), 0);
+
+	fcntl(d->fd, F_SETFL, fcntl(d->fd, F_GETFL) | O_NONBLOCK);
+	igt_assert(fcntl(d->fd, F_GETFL) & O_NONBLOCK);
+
+	igt_assert_eq(poll_event(d->fd, 500), 0);
+	event->len = MAX_EVENT_SIZE;
+	event->flags = 0;
+	event->type = DRM_XE_EUDEBUG_EVENT_READ;
+	igt_assert_eq(__read_event(d->fd, event), -EAGAIN);
+
+	xe_eudebug_client_wait_done(c);
+	xe_eudebug_client_stop(c);
+
+	igt_assert_eq(poll_event(d->fd, 500), 0);
+	igt_assert_eq(__read_event(d->fd, event), -EAGAIN);
+
+	xe_eudebug_debugger_destroy(d);
+	xe_eudebug_client_destroy(c);
+
+	free(event);
+}
+
 /**
  * SUBTEST: basic-client
  * Description:
@@ -134,7 +239,6 @@ static void test_close(int fd)
  *	Simultaneously attach many debuggers to many processes.
  *	Each process opens and closes xe drm client.
  */
-
 static void test_basic_sessions(int fd, unsigned int flags, int count)
 {
 	struct xe_eudebug_session **s;
@@ -171,6 +275,9 @@ igt_main
 	igt_subtest("basic-close")
 		test_close(fd);
 
+	igt_subtest("basic-read-event")
+		test_read_event(fd);
+
 	igt_subtest("basic-client")
 		test_basic_sessions(fd, 0, 1);
 
-- 
2.34.1


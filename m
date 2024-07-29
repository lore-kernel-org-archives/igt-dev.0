Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC4CC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5D10E432;
	Mon, 29 Jul 2024 16:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+vVIO2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A5310E431
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268981; x=1753804981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oKhxCfVo7h8E0acg3LRUfi6HWNsfH8yxxzhehgaU1qc=;
 b=l+vVIO2NmvTJAFIAH8hlhmb5gBW8e09glveD4i1NH61p7hEwtOD3QrEK
 B+vr4w+kOPe7Nmk+DRlLzttj98rHjOqHVSprcUBGc0A1170STy0A1SZBE
 D8hgdVhbTHnM+e4l9D5s5K7+9JkX4pLO7G7o70Ui/RWgKj7ccwn3mbYWD
 lSj5jGzYst9MxHgB3fl1s0h1WiTr8HAfQ1cggMIyzUOWV2H8SN4oisJRZ
 dvbZ+uGeT4aIHplazlETc9E4hvmn9QD6xdlvkP+wLPxLRqgo9iW7nKuwR
 we34oc5RToOOnaGsuONhbqI5ATyMBfqlUXPkExlvtqX3BOgEcovml6M04 w==;
X-CSE-ConnectionGUID: lx7WVlbTTom0Fg6NFzoREg==
X-CSE-MsgGUID: bzcgugFIRMqznHyaR1F7kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426893"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426893"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:01 -0700
X-CSE-ConnectionGUID: kEYB9x5zTkmnUHZYkLb9+g==
X-CSE-MsgGUID: gP19lJ5qRm6kI3Uove4uqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737483"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:57 -0700
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
Subject: [PATCH 12/66] tests/xe_eudebug: Exercise read_event ioctl
Date: Mon, 29 Jul 2024 18:01:05 +0200
Message-Id: <20240729160159.37036-13-christoph.manszewski@intel.com>
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

Introduce synchronous test, which validates eu debugger read_event
ioctl.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 107 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index d0dc38436..6bbad795c 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2,6 +2,8 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include <poll.h>
+#include <sys/ioctl.h>
 
 #include "igt.h"
 #include "xe/xe_eudebug.h"
@@ -14,6 +16,45 @@ static void run_basic_client(struct xe_eudebug_client *c)
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
@@ -104,6 +145,69 @@ static void test_close(int fd)
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
 static void test_basic_sessions(int fd, unsigned int flags, int count)
 {
 	struct xe_eudebug_session **s;
@@ -140,6 +244,9 @@ igt_main
 	igt_subtest("basic-close")
 		test_close(fd);
 
+	igt_subtest("basic-read-event")
+		test_read_event(fd);
+
 	igt_subtest("basic-client")
 		test_basic_sessions(fd, 0, 1);
 
-- 
2.34.1


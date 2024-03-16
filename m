Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB655C54E68
	for <igt-dev@archiver.kernel.org>; Sat, 16 Mar 2024 22:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0070910E052;
	Sat, 16 Mar 2024 22:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LpYZeGtU";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8746B10E052
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Mar 2024 22:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710626564;
 bh=zUs0NZC4HqYN/QAg3I/KwbgbEXOE3gIS4bBC/A+BT9g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LpYZeGtUymoixEYWnNhiiwVuEgPu8aV3arnyDUATK7gODufxHmuT/vVE3jWJu3V8R
 dFzFPqDpn0/wLCZn88z/DQvePvam+JDzkEBL7vmgPEw9DsUV/7Lif665yNW1Y5ko0o
 3KYVBO8o4ADfKL+UCNAvr21n+OyoBVkBuT/tASaRPN3Fc+xsjHvt72f0DdX6yEYDLX
 NwMPclyjo2sj3FjGQN4yStDj9chiASiekYfI5n45eJI4D/DOBcZrasBIK22rXAwwAt
 pfSCIdtODthMBG9oNbNggLm3OccoI8UZfiP5oFsrblFrCUEon6fwK2JkRa7ie5EOx+
 ++U990oMEpMYA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BF0723782009;
 Sat, 16 Mar 2024 22:02:43 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tvrtko.ursulin@intel.com, daniel@ffwll.ch, boris.brezillon@collabora.com,
 igt-dev@lists.freedesktop.org
Cc: adrian.larumbe@collabora.com
Subject: [PATCH 2/2] tools/gputop: toggle sysfs profiling knob if available
 for device
Date: Sat, 16 Mar 2024 22:00:38 +0000
Message-ID: <20240316220229.249119-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240316220229.249119-1-adrian.larumbe@collabora.com>
References: <20240316220229.249119-1-adrian.larumbe@collabora.com>
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

For every DRM device that enables its job accounting HW from user space,
toggle it right before obtaining per-client fdinfo numbers.

Make sure profiling status is returned to its original state before
exiting, by handling the SIGINT signal just like in intel_gpu_top.

Also dynamically link gputop against igt lib instead of separate per-file
static libraries to avoid dependence cascade because of using igt_sysfs
functions.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 tools/gputop.c    | 30 +++++++++++++++++++++++++++++-
 tools/meson.build |  2 +-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 71e28f43ee4c..d6885be6aa16 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -27,7 +27,9 @@
 #include <stdbool.h>
 
 #include "igt_drm_clients.h"
+#include "igt_device_scan.h"
 #include "igt_drm_fdinfo.h"
+#include "igt_profiling.h"
 #include "drmtest.h"
 
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
@@ -243,9 +245,17 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
 
 }
 
+static bool stop_top;
+
+static void sigint_handler(int  sig)
+{
+	stop_top = true;
+}
+
 int main(int argc, char **argv)
 {
 	unsigned int period_us = 2e6;
+	struct igt_profiled_device *profiled_devices = NULL;
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
 
@@ -253,9 +263,22 @@ int main(int argc, char **argv)
 	if (!clients)
 		exit(1);
 
+	igt_devices_scan(false);
+
+	profiled_devices = igt_devices_profiled();
+	if (profiled_devices != NULL)
+		igt_devices_toggle_profiling(profiled_devices, true);
+
+	if (signal(SIGINT, sigint_handler) == SIG_ERR) {
+		fprintf(stderr, "Failed to install signal handler!\n");
+		igt_devices_toggle_profiling(profiled_devices, false);
+		free(profiled_devices);
+		profiled_devices = NULL;
+	}
+
 	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 
-	for (;;) {
+	while (!stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
 		int i, engine_w = 0, lines = 0;
 		struct winsize ws;
@@ -293,5 +316,10 @@ int main(int argc, char **argv)
 		usleep(period_us);
 	}
 
+	if (profiled_devices != NULL) {
+		igt_devices_toggle_profiling(profiled_devices, false);
+		free(profiled_devices);
+	}
+
 	return 0;
 }
diff --git a/tools/meson.build b/tools/meson.build
index ac79d8b5840c..a126d6cad7ba 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -68,7 +68,7 @@ endif
 executable('gputop', 'gputop.c',
            install : true,
            install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
+           dependencies : [lib_igt, lib_igt_drm_clients, math])
 
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-- 
2.43.0


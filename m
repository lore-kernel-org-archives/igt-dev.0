Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDB0CD128D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7183710F334;
	Tue,  2 Apr 2024 22:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="q7KFpGUT";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EB510EB8D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712096920;
 bh=LyrJoe96ZYNrYrnnm5E9ZlBtP1W5axkjI5AT3DKjyxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q7KFpGUTlZTzoa0BZBdjXDPssOwk3tiFgdRGpkFoVblmvaAzwCK31oHPva6gewPfm
 Q5QfRMOqMALkflY1bn2/hTU3Ze0si7ieonWCq/+Op3GEhtiMf6NDj2VbRMh1yIP0i1
 Wr0YovCEvyZtUZMA2QRUEb065fhQgZVj21rPyT93AWhWPrRFV4+5FCDLQLhleLnL93
 JZhbzCukZMBS+XfWrA4PPU/RpF3I0FLMje9slfQweTqBy4oZKgbb4MUKrlRZc7AhFR
 2YnCjEGBxIR2UrvMOiQOgF2qHtjcszbr/YN2JPWBtK/EBLuDlhBPcjQuSRJjiMb9Wi
 X43yi1UWCsYPg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2CDFD37820CD;
 Tue,  2 Apr 2024 22:28:40 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tursulin@ursulin.net, daniel@ffwll.ch, boris.brezillon@collabora.com,
 kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org, healych@amazon.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH v2 2/2] tools/gputop: toggle sysfs profiling knob if available
 for device
Date: Tue,  2 Apr 2024 23:27:45 +0100
Message-ID: <20240402222813.277470-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402222813.277470-1-adrian.larumbe@collabora.com>
References: <20240402222813.277470-1-adrian.larumbe@collabora.com>
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

Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 tools/gputop.c    | 30 +++++++++++++++++++++++++++++-
 tools/meson.build |  2 +-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 71e28f43ee4c..5b390cbdb3e7 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -26,8 +26,10 @@
 #include <sys/sysmacros.h>
 #include <stdbool.h>
 
+#include "igt_device_scan.h"
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
+#include "igt_profiling.h"
 #include "drmtest.h"
 
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
@@ -243,9 +245,17 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
 
 }
 
+static volatile bool stop_top;
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
2.44.0


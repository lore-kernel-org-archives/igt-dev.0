Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2D7C3DA70
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 13:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C6810E898;
	Thu, 18 Jul 2024 13:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Lc1sgkOu";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36B110E890
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721311098;
 bh=FNlKRURY5bG2fglb4/qBAypcIMh4PVSy8C6FsOFwo6M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lc1sgkOu+a7T9CqaO6Yk6IA2LmlHp01bL58B8rH7nWimuGf8kNwdbBTlD9t7+eFZl
 kVT7LdLa38wjlxnTiwkxHhnCP/sY7PxoTmm4n6oSR1dj3cmSnDDltdzvhSUxW6TlbJ
 j/ESfb3NFmgWPmpprUJIxxhAQTyDfqzNn0UN0AsCX7008X2yF2+MMmEjbnK3cqlwxH
 Yjyml5sAI2uZKSlnTU2shh42J82XMW/p5eoj8saJrUBaTzERFOesLejUcvv1eHQNUS
 ACMWXbBCdRU5jMyLni7/jgXQhHhq5Qkho8IV+HcRIhOF99hXmGoF97kCT72yw0tTe3
 9317h2ymgEjtw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 29A5137821D8;
 Thu, 18 Jul 2024 13:58:18 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tursulin@ursulin.net, robdclark@chromium.org,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org
Cc: healych@amazon.com, adrian.larumbe@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH v6 2/2] tools/gputop: toggle sysfs profiling knob if available
 for device
Date: Thu, 18 Jul 2024 14:58:10 +0100
Message-ID: <20240718135811.3619050-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240718135811.3619050-1-adrian.larumbe@collabora.com>
References: <20240718135811.3619050-1-adrian.larumbe@collabora.com>
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

Also add the static IGT profiling library to gputop's list of build
dependencies.

Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/gputop.c    | 32 +++++++++++++++++++++++++++++++-
 tools/meson.build |  2 +-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 6c7cf6927464..8842eebbd8e5 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -29,6 +29,7 @@
 #include "igt_core.h"
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
+#include "igt_profiling.h"
 #include "drmtest.h"
 
 enum utilization_type {
@@ -391,10 +392,19 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	return 1;
 }
 
+static volatile bool stop_top;
+
+static void sigint_handler(int sig)
+{
+	(void) sig;
+	stop_top = true;
+}
+
 int main(int argc, char **argv)
 {
 	struct gputop_args args;
 	unsigned int period_us;
+	struct igt_profiled_device *profiled_devices = NULL;
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
 	int ret;
@@ -413,9 +423,21 @@ int main(int argc, char **argv)
 	if (!clients)
 		exit(1);
 
+	profiled_devices = igt_devices_profiled();
+	if (profiled_devices != NULL) {
+		igt_devices_configure_profiling(profiled_devices, true);
+
+		if (signal(SIGINT, sigint_handler) == SIG_ERR) {
+			fprintf(stderr, "Failed to install signal handler!\n");
+			igt_devices_configure_profiling(profiled_devices, false);
+			igt_devices_free_profiling(profiled_devices);
+			profiled_devices = NULL;
+		}
+	}
+
 	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 
-	while (n != 0) {
+	while ((n != 0) && !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
 		int i, engine_w = 0, lines = 0;
 
@@ -443,9 +465,17 @@ int main(int argc, char **argv)
 		usleep(period_us);
 		if (n > 0)
 			n--;
+
+		if (profiled_devices != NULL)
+			igt_devices_update_original_profiling_state(profiled_devices);
 	}
 
 	igt_drm_clients_free(clients);
 
+	if (profiled_devices != NULL) {
+		igt_devices_configure_profiling(profiled_devices, false);
+		igt_devices_free_profiling(profiled_devices);
+	}
+
 	return 0;
 }
diff --git a/tools/meson.build b/tools/meson.build
index c02c020d0b31..df26c4b95e3f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -69,7 +69,7 @@ endif
 executable('gputop', 'gputop.c',
            install : true,
            install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
+           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
 
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-- 
2.45.1


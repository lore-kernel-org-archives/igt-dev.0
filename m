Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FDEE9A059
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 18:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B3110E32F;
	Thu, 19 Feb 2026 18:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AZ2xHwgj";
	dkim-atps=neutral
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDFE10E32F
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 18:52:36 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-45effa36240so759573b6e.1
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 10:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771527156; x=1772131956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p9wEEl4XWg+ZO4K8SAnoSR1HmM2K3AxrqI5eZ8C2fSE=;
 b=AZ2xHwgjgOsbljpJkGoDpZaThYOFQ+Akgk2uVJhZPgVcKjCSjPKm6i0mqOfZaNH5IB
 UjFQXf193xLKPvn7wsPRYRkEWd59QeiRxiXrevbWcJJehOPNKYmCt95mYFaBlmDhTNq1
 5xnTZZ905FwbTVjchqLyp89xvMg8S47yn7f0Cz00jYsWU/xaLrRKHadyc6LXi2tmqoRp
 1Wua872V076tpGjQfkangc+5z36lwkxL25rcNc9ZbYBIOKDiWddI7uhLYce7ykc5PuKP
 OSosjSgAaxt7hiskKgUhzj1WG5WS3S+KgKAcDbo4FTPj9Ers+NquNKuCkHAlSGmKEnd6
 iUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771527156; x=1772131956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9wEEl4XWg+ZO4K8SAnoSR1HmM2K3AxrqI5eZ8C2fSE=;
 b=RMQ9fiLP3CsdRzBfQaFlSeoO1QAd0DBg7Ynuy3rfKP4eIn14Z00F4VsNotEIsKMO3b
 2dF9Tt7wI2AAgwVrIMg46ExRyCcly5ZmSS/EHCiSFR0pFCvMQbfWufrg8Qj2EEarGNNL
 9bqcqfO3LSLYRa5SPqUn0daJ29BrNAeNlzpsUYH5dwvgwfqNp6z0Ig/Bf4+UA48K1iLB
 VnyIelaR2ugTzeoL+AwLKufTfUE2zrktPedXfTABLWb2yK3tz91Bnpmw49UZGW40J2ag
 hk0kvocV2qxNzNgxmmEn9y3qGwcXloI6vpAz3/OL9UraRLRV7UBl1Fs+YuaLWXBbLGzy
 3dMQ==
X-Gm-Message-State: AOJu0YwNB8OFh95Nk844Nj/5pzCAnV3ZUpxL71i9TpyQcCkNmA3eMk1g
 Sf9q7WYNRJBNrHK0hL6WewAeYdWWo7TNa2qj8ZwOdsy5n6fGwuQWzcOMx7YsRQ==
X-Gm-Gg: AZuq6aLYTs7dXIAu1nmWPIn4/MwXkeiFCI/POOaI0S4TJ8E3BB5LGdA9dNNF1ofmiHo
 djqcO0MaNXBWfgiYrtNgNK0zev6Y/DPmHdFCTI8whTKR+HPA8HHF7jY1NQTskECxF++LkEUonhZ
 5iTDBZOtAu/N49vLZbk32XijDhD8PeLmdMk2Pe4/r3SWoaPJ1HU3Lo/ooh9bwD6+dntZbgJbKFO
 ubNClcwmPKOR6808xBnKrad5tkq839myHPVDdpQ46WWuH6ZQXeTcYL+zz0CmAs7ndNjkNW7IFSo
 aL8zXuCGY70F9GaHrwMxWqgt6G7GIyHdSVoIVR7FsiFl3xjVb3euqwWEKiLCRBXwa/gMIj/+PiE
 qbAk6XOOya9DJoWaCLUUz24+71CHawieHcMb18ozzSlJ+kKctGEluaq3gRofJcgDZ62a1bJVC8S
 ItMcfZkT+choBT1goB0iSVsoW2rQbEMj7hi33hWHrjvBcwj8PZ
X-Received: by 2002:a05:6808:bcb:b0:463:b4bd:52ba with SMTP id
 5614622812f47-46410b31cc3mr3721543b6e.13.1771527155862; 
 Thu, 19 Feb 2026 10:52:35 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4638e05aa10sm14775447b6e.5.2026.02.19.10.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 10:52:35 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Gemini CLI <gemini-cli@google.com>
Subject: [PATCH] lib: implement systemic timeout scaling via
 IGT_TIMEOUT_MULTIPLIER
Date: Thu, 19 Feb 2026 11:52:27 -0700
Message-ID: <20260219185227.1278271-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
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

IGT contains numerous hardcoded timing assertions and poll timeouts
(e.g., 150ms in kms_sysfs_edid_timing and 1s in prime_busy) that
appear to be tuned for bare-metal execution.

Specifically, DRM-CI testing of DRM_USE_DYNAMIC_DEBUG=y patchset
triggers spurious timeouts, because toggling the static-keys under
numerous drm_*dbg() callsites takes far longer than just changing the
single word under /sys/module/drm/parameters/debug.

So this patch introduces a "Time Dilator" system to globally scale the
suite's sensitivity, making it adjustable to varying environments.  It
adds a global igt_timeout_multiplier, automatically initialized from
the IGT_TIMEOUT_MULTIPLIER environment variable via a library
constructor in lib/igt_poll.c.

The system scales timing in two directions:

1. Clock Dilation: igt_nsec_elapsed() is patched to divide actual
   elapsed time by the multiplier. This makes internal test logic
   perceive time as moving slower, allowing existing assertions to
   pass even when wall-clock duration is longer.

2. Wait Scaling: Standard poll() and ppoll() calls are intercepted via
   variadic macros and redirected to wrappers that multiply the
   requested timeout duration.

I considered 2 different "dilations" for these, to allow separate
tailoring of the 2 timeout flavors, but had no strong basis to do so,
and it felt like "too many knobs".  That said, it might be appropriate
to dilate *only* for drm.debug (/sys/module/drm/parameters/debug)
adjustments.

This should allow at least IGT tests to be adjusted for environmental
variations and kernel configurations, without requiring manual source
modifications for every hardcoded constant.

Assisted-by: Gemini CLI <gemini-cli@google.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/igt_core.c  |  7 +++++--
 lib/igt_core.h  |  8 ++++++++
 lib/igt_poll.c  | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/meson.build |  6 ++++--
 4 files changed, 67 insertions(+), 4 deletions(-)
 create mode 100644 lib/igt_poll.c

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ee670a41..8a1a07ff6 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -748,6 +748,7 @@ error:
 uint64_t igt_nsec_elapsed(struct timespec *start)
 {
 	struct timespec now;
+	uint64_t elapsed;
 
 	igt_gettime(&now);
 	if ((start->tv_sec | start->tv_nsec) == 0) {
@@ -755,8 +756,10 @@ uint64_t igt_nsec_elapsed(struct timespec *start)
 		return 0;
 	}
 
-	return ((now.tv_nsec - start->tv_nsec) +
-		(uint64_t)NSEC_PER_SEC*(now.tv_sec - start->tv_sec));
+	elapsed = ((now.tv_nsec - start->tv_nsec) +
+		   (uint64_t)NSEC_PER_SEC*(now.tv_sec - start->tv_sec));
+
+	return elapsed / igt_timeout_multiplier;
 }
 
 void __igt_assert_in_outer_scope(void)
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 6845f853c..4538375ff 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -44,6 +44,7 @@
 #include <stdarg.h>
 #include <getopt.h>
 #include <unistd.h>
+#include <poll.h>
 
 #ifdef __FreeBSD__
 #include "igt_freebsd.h"
@@ -53,6 +54,13 @@
 #define IGT_LOG_DOMAIN (NULL)
 #endif
 
+extern double igt_timeout_multiplier;
+int igt_poll(struct pollfd *fds, nfds_t nfds, int timeout);
+int igt_ppoll(struct pollfd *fds, nfds_t nfds,
+              const struct timespec *tmo_p, const sigset_t *sigmask);
+#define poll(...) igt_poll(__VA_ARGS__)
+#define ppoll(...) igt_ppoll(__VA_ARGS__)
+
 
 #ifndef STATIC_ANALYSIS_BUILD
 #if defined(__clang_analyzer__) || defined(__COVERITY__) || defined(__KLOCWORK__)
diff --git a/lib/igt_poll.c b/lib/igt_poll.c
new file mode 100644
index 000000000..d94fc902d
--- /dev/null
+++ b/lib/igt_poll.c
@@ -0,0 +1,50 @@
+#include <poll.h>
+#include <time.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include "igt_core.h"
+
+#undef poll
+#undef ppoll
+
+double igt_timeout_multiplier = 1.0;
+
+static void igt_timeout_multiplier_init(void) __attribute__((constructor));
+static void igt_timeout_multiplier_init(void)
+{
+	const char *env = getenv("IGT_TIMEOUT_MULTIPLIER");
+	if (env) {
+		igt_timeout_multiplier = atof(env);
+		if (igt_timeout_multiplier <= 0.0)
+			igt_timeout_multiplier = 1.0;
+	}
+}
+
+int igt_poll(struct pollfd *fds, nfds_t nfds, int timeout)
+{
+	int old_timeout = timeout;
+
+	if (timeout > 0)
+		timeout = (int)(timeout * igt_timeout_multiplier);
+
+	if (igt_timeout_multiplier != 1.0 && old_timeout > 0)
+		igt_debug("igt_poll: scaling timeout %dms -> %dms\n", old_timeout, timeout);
+
+	return poll(fds, nfds, timeout);
+}
+
+int igt_ppoll(struct pollfd *fds, nfds_t nfds,
+	      const struct timespec *tmo_p, const sigset_t *sigmask)
+{
+	struct timespec scaled_tmo;
+
+	if (tmo_p) {
+		uint64_t nsec = (uint64_t)tmo_p->tv_sec * NSEC_PER_SEC + tmo_p->tv_nsec;
+		nsec *= igt_timeout_multiplier;
+		scaled_tmo.tv_sec = nsec / NSEC_PER_SEC;
+		scaled_tmo.tv_nsec = nsec % NSEC_PER_SEC;
+		tmo_p = &scaled_tmo;
+	}
+
+	return ppoll(fds, nfds, tmo_p, sigmask);
+}
diff --git a/lib/meson.build b/lib/meson.build
index ea721ecf7..fb7e83543 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -97,6 +97,7 @@ lib_sources = [
 	'igt_core.c',
 	'igt_dir.c',
 	'igt_draw.c',
+	'igt_poll.c',
 	'igt_list.c',
 	'igt_map.c',
 	'igt_panel.c',
@@ -328,7 +329,7 @@ lib_igt_chipset = declare_dependency(link_with : lin_igt_chipset_build,
                                      include_directories : inc)
 
 lib_igt_perf_build = static_library('igt_perf',
-	['igt_perf.c'],
+	['igt_perf.c', 'igt_poll.c'],
 	include_directories : inc)
 
 lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
@@ -347,6 +348,7 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
 	'igt_tools_stub.c',
 	'intel_device_info.c',
 	'intel_cmds_info.c',
+	'igt_poll.c',
 	],
 	dependencies : scan_dep,
 	include_directories : inc)
@@ -362,7 +364,7 @@ lib_igt_drm_clients = declare_dependency(link_with : lib_igt_drm_clients_build,
 				         include_directories : inc)
 
 lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
-	['igt_drm_fdinfo.c'],
+	['igt_drm_fdinfo.c', 'igt_poll.c'],
 	include_directories : inc)
 
 lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
-- 
2.53.0


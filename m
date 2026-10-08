Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75EACA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 06:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D75210FC5E;
	Thu,  8 Oct 2026 06:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDD8xo5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1E910FC40
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791440104; x=1822976104;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=qthJ7MLdO5HKTUaaabPlwjIiMOKYy6BKXczp+Gq5N/Y=;
 b=IDD8xo5u3imFkS2DCnNdC3NfNMxR7KIcqLTuJfpjANLPe4jOS+wQlcLm
 Xmd3QdsuRvrUa6abXe0m8eE3GzOOmA9emwos42K5NtdIpWfH4qRjyTdVR
 I3ckVQi/7LWIc10ezjTolH+ZWfHr+3uVJTO9tOVT6IUPu8UEZJQq++oE5
 qJT3iFCkQpchjbUJsYwZAZ2GkCXnsYlLxeet0/h4hg8ee5gcd63Gatj4Q
 hJRvNV9iZEonv1ED7rdqn/VTbrSAvyFPqTvi6tbvWA9SreQnfnDq+lyEd
 mDVyCCE1I0xF4htHlxiDNGQSXTpjUkRwnz0PDzupzOc+x1KfnoWwEcWlK Q==;
X-CSE-ConnectionGUID: GsyB+4+IRbCHpqW+XUtbRg==
X-CSE-MsgGUID: CAaZs9SqRpSQk2UazIAK+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="210491"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="210491"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 23:14:18 -0700
X-CSE-ConnectionGUID: Z3AX1unmQwWVxXa2qCJ+bQ==
X-CSE-MsgGUID: 4p/RmSJKRkuPcU8UpVG7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="386464"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2026 23:14:18 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 08 Oct 2026 11:42:52 +0530
Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Add igt_get_free_pipes_mask()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-joiner-v2-1-693aed4be6a1@intel.com>
References: <20261008-joiner-v2-0-693aed4be6a1@intel.com>
In-Reply-To: <20261008-joiner-v2-0-693aed4be6a1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

The joiner tests derive the set of usable pipes from the pipe count
alone, which assumes every pipe is free. A pipe already driven by
another client is then handed to a modeset, making the commit fail.

Add igt_get_free_pipes_mask(), which gets the current CRTC usage via
drmModeGetCrtcList() and translates it into a bitmask of hardware
pipes.

drmModeGetCrtcList() is a recent libdrm addition, so probe for it in
meson and fall back to plain CRTC enumeration when it is missing.

v2: Move the function out of Intel folder as this is not Intel specific
(Jani N)

Assisted-by: LLM
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 lib/igt_kms.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 meson.build   |  7 ++++++
 3 files changed, 77 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af0f7c4e5f6fd4905b1a856f8b443492026d6b26..a0a6a6335f7548e6883f479ff67816d2793587f3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7581,6 +7581,75 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	return true;
 }
 
+/**
+ * igt_get_free_pipes_mask:
+ * @display: The display structure containing pipe information.
+ *
+ * Get the CRTCs that are currently usable and translate that into a
+ * bitmask of hardware pipes. A CRTC is reported free only when it is neither
+ * enabled through KMS nor active in hardware, so pipes claimed by another
+ * client (fbcon, a compositor, joiner) are never handed out to a modeset.
+ *
+ * The returned mask reflects the state at call time, so query it right before
+ * a modeset and after releasing the pipes a previous commit was using.
+ *
+ * Returns: bitmask of hardware pipes whose CRTC is free to be assigned. When
+ * libdrm lacks drmModeGetCrtcList() every pipe of @display is reported free.
+ */
+#ifdef HAVE_DRMMODEGETCRTCLIST
+uint32_t igt_get_free_pipes_mask(igt_display_t *display)
+{
+	uint32_t free_mask = 0;
+	drmModeCrtcListPtr list;
+	int i;
+
+	list = drmModeGetCrtcList(display->drm_fd);
+	igt_assert_f(list, "drmModeGetCrtcList() failed\n");
+
+	for (i = 0; i < list->count; i++) {
+		drmModeCrtcInfoPtr info = &list->crtcs[i];
+		igt_crtc_t *crtc = igt_crtc_for_crtc_id(display, info->crtc_id);
+
+		/* A CRTC the display never enumerated is not ours to use. */
+		if (!crtc)
+			continue;
+
+		if (info->in_use) {
+			igt_debug("CRTC %s in use: %ux%u, fb %u\n",
+				  igt_crtc_name(crtc), info->width,
+				  info->height, info->buffer_id);
+			continue;
+		}
+
+		if (info->driver_active) {
+			igt_debug("CRTC %s active in hardware, not enabled via KMS\n",
+				  igt_crtc_name(crtc));
+			continue;
+		}
+
+		free_mask |= BIT(crtc->hardware_pipe);
+	}
+
+	igt_info("%d of %d CRTCs free, free pipe mask 0x%x\n",
+		 list->count_available, list->count, free_mask);
+
+	drmModeFreeCrtcList(list);
+
+	return free_mask;
+}
+#else
+uint32_t igt_get_free_pipes_mask(igt_display_t *display)
+{
+	uint32_t free_mask = 0;
+	igt_crtc_t *crtc;
+
+	for_each_crtc(display, crtc)
+		free_mask |= BIT(crtc->hardware_pipe);
+
+	igt_debug("libdrm has no drmModeGetCrtcList(), assuming pipe mask 0x%x free\n",
+		  free_mask);
+#endif
+
 /**
  * igt_parse_mode_string:
  * @mode_string: modeline string
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9b8779a62ca3763720609a506e1652595858487a..9cd397b2ddc343aca9397ea35a3e25c1fd0acab9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1365,6 +1365,7 @@ drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output);
 bool is_joiner_mode(int drm_fd, igt_output_t *output);
 bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
+uint32_t igt_get_free_pipes_mask(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
diff --git a/meson.build b/meson.build
index d7bbfd9698e5616ab777ac58128192ba1e0bec23..f41588c9d73361dbfd405de5ea8f764c6768a9c9 100644
--- a/meson.build
+++ b/meson.build
@@ -129,6 +129,13 @@ endif
 
 build_info += 'With libdrm: ' + ','.join(libdrm_info)
 
+# drmModeGetCrtcList() is a recent libdrm addition; keep building against
+# older libdrm by falling back to plain resource enumeration.
+if cc.has_function('drmModeGetCrtcList', dependencies : libdrm,
+		   prefix : '#include <xf86drmMode.h>')
+	config.set('HAVE_DRMMODEGETCRTCLIST', 1)
+endif
+
 pciaccess = dependency('pciaccess', version : '>=0.10')
 libkmod = dependency('libkmod')
 # igt_procps.c reads /proc directly; libprocps and libproc2 are not needed.

-- 
2.25.1


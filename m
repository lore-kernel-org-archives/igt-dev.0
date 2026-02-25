Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33CDFD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E0D10E76F;
	Wed, 25 Feb 2026 12:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nlm2WaYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C456F10E772
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023908; x=1803559908;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6MP6Zl6sy4LaUpbIn9FES4Osm0BRW1Xl8Fdceb+EC3E=;
 b=Nlm2WaYpg8CbuaxRrj6BfnSIxdWTAkFoz8q8yBdTpkPGx3UmSQbql+Ao
 tjYAGxPKhyQmaFU/N5aYH170V/UvOJK6gjipV8FbhPOGWiXUQAqEpllNH
 tbAfpVurcCEDC7a3eDgok3Pw/m4hN2XlPa3ynXcICxvdSb4EAoNTaeTSc
 0DLK/Qyxw6uaeBQVKMWtWwtw9ag8vFm5K7WxrRKBg7+Q0vDgdFEej12yK
 D+DPvji5/inofbzQetcSXO9/gp3o2o163x8CXMffTtnB+6qUBlWr9M08V
 KSYq9+rtKgn2S5OmohdKJzwpl1AOzuwSHn9i1IylRnMUfNh9FAGmIRDGw g==;
X-CSE-ConnectionGUID: 7ceIp6PQStu499TkOi+Xhw==
X-CSE-MsgGUID: +19hl4QtQSiKhSccOChgkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83772233"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83772233"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:48 -0800
X-CSE-ConnectionGUID: Y/PxYC6QSy+I8k4pQy2/Uw==
X-CSE-MsgGUID: DaG80gxqRTiqNSWHpZJUxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213350052"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/19] lib/kms: Pass igt_crtc_t* to
 igt_max_bpc_constraint()
Date: Wed, 25 Feb 2026 14:50:59 +0200
Message-ID: <20260225125108.31119-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Pass the igt_crtc_t* instead of the pipe to
igt_max_bpc_constraint(). All callers already have
the crtc around.

 #include "scripts/iterators.cocci"

@@
typedef igt_crtc_t;
identifier DISPLAY, PIPE;
@@
igt_max_bpc_constraint(igt_display_t *DISPLAY,
-	enum pipe PIPE,
+	igt_crtc_t *crtc,
	...)
{
<...
- PIPE
+ crtc->pipe
...>
}

@@
expression DISPLAY, PIPE;
@@
igt_max_bpc_constraint(DISPLAY,
-	PIPE,
+	igt_crtc_for_pipe(DISPLAY, PIPE),
	...)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c      | 4 ++--
 lib/igt_kms.h      | 4 ++--
 tests/kms_color.c  | 2 +-
 tests/kms_dither.c | 4 +++-
 tests/kms_hdr.c    | 4 ++--
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2170e775b3a5..8855ba845ed2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6699,7 +6699,7 @@ bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
  *
  * Returns: True if suitable mode found to use requested bpc, else False.
  */
-bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
+bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
 			    igt_output_t *output, int bpc)
 {
 	drmModeConnector *connector = output->config.connector;
@@ -6717,7 +6717,7 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 					    display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY))
 			continue;
 
-		if (!igt_check_output_bpc_equal(display->drm_fd, pipe,
+		if (!igt_check_output_bpc_equal(display->drm_fd, crtc->pipe,
 						output->name, bpc))
 			continue;
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2d1f14330617..9dc933d537ef 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1262,8 +1262,8 @@ int sort_drm_modes_by_res_asc(const void *a, const void *b);
 void igt_sort_connector_modes(drmModeConnector *connector,
 		int (*comparator)(const void *, const void*));
 
-bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
-		igt_output_t *output, int bpc);
+bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
+			    igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
 int igt_get_max_cdclk(int fd);
 int igt_get_current_cdclk(int fd);
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 0008a15a05b4..a26225c1e99a 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -897,7 +897,7 @@ run_deep_color_tests_for_pipe(data_t *data, igt_crtc_t *crtc)
 				    crtc);
 
 		if (is_intel_device(data->drm_fd) &&
-		    !igt_max_bpc_constraint(&data->display, crtc->pipe, output, 10)) {
+		    !igt_max_bpc_constraint(&data->display, crtc, output, 10)) {
 			igt_info("Output %s: Doesn't support 10-bpc.\n",
 				 igt_output_name(output));
 			continue;
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 347580e60f4e..fc6f794f5ea1 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -140,7 +140,9 @@ static void test_dithering(data_t *data, igt_crtc_t *crtc,
 	if (ret)
 		goto cleanup;
 
-	constraint = igt_max_bpc_constraint(display, crtc->pipe, output,
+	constraint = igt_max_bpc_constraint(display,
+					    crtc,
+					    output,
 					    output_bpc);
 	if (!constraint)
 		goto cleanup;
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f677c6629430..d9d8a17adaf8 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -338,7 +338,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 				     crtc);
 
 			if (is_intel_device(data->fd) &&
-			    !igt_max_bpc_constraint(display, crtc->pipe, output, 10)) {
+			    !igt_max_bpc_constraint(display, crtc, output, 10)) {
 				igt_info("%s: No suitable mode found to use 10 bpc.\n",
 					 igt_output_name(output));
 
@@ -762,7 +762,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 			}
 
 			if (is_intel_device(data->fd) &&
-			    !igt_max_bpc_constraint(display, crtc->pipe, output, 10)) {
+			    !igt_max_bpc_constraint(display, crtc, output, 10)) {
 				igt_info("%s: No suitable mode found to use 10 bpc.\n",
 					 igt_output_name(output));
 
-- 
2.52.0


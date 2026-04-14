Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A324F531F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E15D10E072;
	Tue, 14 Apr 2026 07:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPIm+apc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D2610E072
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150959; x=1807686959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FcGL1/pD5tldg2pVWJIzv+pOjFCwjPhoEHmyfFi4BYo=;
 b=GPIm+apcsxWUpJG+U56Eqtk3HxUhA6cNz0mCN/fZwsWrG04di82MVBov
 c+af56Vb+tj2nOkDVyeAQi2fOnzciHpQT9fZYmD01L2m2D+WUmKAq+pn9
 GF7g37mUVMqr/Nah30VEDtlWPsboBqaO5QA8SZcLeO0/jSBLZBKqr/6/a
 3AX1fViui6Ls/bU5vlaoHX6CPF4vKgNEn8ZPpE42kCdRQhuUtlKuMAzhG
 osvz1IvYke2VY1CNvLXlnSWO24WEJQDT7zqARjrrY9LAOnVW9BsMtkoUb
 0DwyxtPeguki34r9QtkXihDqS9hI1cWvQoPVntlJnkimCf1nB2sQQwYHd w==;
X-CSE-ConnectionGUID: kyzCh7loSdGvd3UUqHxt4g==
X-CSE-MsgGUID: KVl42e6GQSiJ3CqTJLZmoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64633937"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="64633937"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:58 -0700
X-CSE-ConnectionGUID: 2fOJRSXNRP262dsP4rakjQ==
X-CSE-MsgGUID: Ci6ly9guRXuvglQl2Sjvew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229889149"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 16/16] tests/kms_writeback: use for_each_output()
Date: Tue, 14 Apr 2026 10:14:36 +0300
Message-ID: <c12b4e1e50f5fbf1c1bfe93b34e598a8f27aa53d.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Use for_each_output() instead of manually iterating display->outputs[i].

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_writeback.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 4a5f369ba6d8..7c30e8ee3591 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -143,7 +143,7 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 
 static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 {
-	int i;
+	igt_output_t *output;
 	igt_crtc_t *crtc;
 
 	drmModeModeInfo override_mode = {
@@ -163,9 +163,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 		.name = {"640x480-60"},
 	};
 
-	for (i = 0; i < display->n_outputs; i++) {
-		igt_output_t *output = &display->outputs[i];
-
+	for_each_output(display, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 			continue;
 
@@ -464,9 +462,9 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 
 static igt_output_t *list_writeback_modes(igt_display_t *display)
 {
-	for (int i = 0; i < display->n_outputs; i++) {
-		igt_output_t *output = &display->outputs[i];
+	igt_output_t *output;
 
+	for_each_output(display, output) {
 		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK) {
 			drmModeModeInfo *mode;
 			int j = 0;
-- 
2.47.3


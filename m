Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467F1EA8128
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98D310E5B6;
	Tue, 10 Feb 2026 15:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Svb+At+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEA510E5B8
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737069; x=1802273069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3UlnY8g/Yr0h1epoExUhIYGN3kNeS6Iz3Q70A1JF3Y=;
 b=Svb+At+HYav+A5+o1Fk/T0qk24FAkMr0yi0190hUY95eO8hRnwdfagr/
 67kbbkV6DNTsaeyJFRxy8XaLqWPK8723Udq0VZ3Ha8EDVgaIhUdR5PdnU
 cI2BPa4EZku34WDj3CjsyzDfXCww6PoSBgjtbhL8SSSLKeyHpi3huHeUq
 lVCLL366Kk/OSWsXLQwuDtOR4kZcE/Q1nFup6oRevoWqw7X6ePEL9LhP8
 YvMjsCGy9tFJ8ka6h4b5nyriVoDlRjZi8SV+87h+zp4p/yV7h528KhnKL
 Iqg+NTNq3ykYu6FRERukWD41yAw5awH5na03LBEZkoElh8GI8GAdTPLD4 g==;
X-CSE-ConnectionGUID: B2IHAfMfQ8elpzBA0PskPQ==
X-CSE-MsgGUID: lzK+wPzOSeG/wdAZyCkMAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75491815"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75491815"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:29 -0800
X-CSE-ConnectionGUID: DOE/RA7SQU+W5BScLWto3Q==
X-CSE-MsgGUID: 9KZ9kWKJS8qKxUSEaBwlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211434520"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 03/11] lib/kms: rename struct kmstest_connector_config
 pipe member to crtc_index
Date: Tue, 10 Feb 2026 17:23:44 +0200
Message-ID: <de863bd185e70dd911ed1498bf9a20f6cc658c3e.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
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

struct kmstest_connector_config pipe member is actually a
crtc_index. Rename accordingly. While at it, also rename
valid_crtc_idx_mask to valid_crtc_index_mask for consistency.

There are still discrepancies with the pipe vs crtc_index usage, but
this is just the non-functional rename.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c       | 20 ++++++++++----------
 lib/igt_kms.h       |  8 ++++----
 tests/kms_flip.c    | 10 +++++-----
 tests/testdisplay.c |  2 +-
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b6b8fb7cd938..0e0f4a99bb99 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2089,7 +2089,7 @@ _kmstest_connector_config_crtc_mask(int drm_fd,
 {
 	int i;
 
-	config->valid_crtc_idx_mask = 0;
+	config->valid_crtc_index_mask = 0;
 
 	/* Now get a compatible encoder */
 	for (i = 0; i < connector->count_encoders; i++) {
@@ -2104,7 +2104,7 @@ _kmstest_connector_config_crtc_mask(int drm_fd,
 			continue;
 		}
 
-		config->valid_crtc_idx_mask |= encoder->possible_crtcs;
+		config->valid_crtc_index_mask |= encoder->possible_crtcs;
 		drmModeFreeEncoder(encoder);
 	}
 }
@@ -2158,7 +2158,7 @@ static bool _kmstest_connector_config(int drm_fd, uint32_t connector_id,
 	drmModeConnector *connector;
 	drmModePropertyBlobPtr path_blob;
 
-	config->pipe = PIPE_NONE;
+	config->crtc_index = -1;
 
 	resources = drmModeGetResources(drm_fd);
 	if (!resources) {
@@ -2203,15 +2203,15 @@ static bool _kmstest_connector_config(int drm_fd, uint32_t connector_id,
 
 	config->connector = connector;
 
-	crtc_idx_mask &= config->valid_crtc_idx_mask;
+	crtc_idx_mask &= config->valid_crtc_index_mask;
 	if (!crtc_idx_mask)
 		/* Keep config->connector */
 		goto err2;
 
-	config->pipe = ffs(crtc_idx_mask) - 1;
+	config->crtc_index = ffs(crtc_idx_mask) - 1;
 
-	config->encoder = _kmstest_connector_config_find_encoder(drm_fd, connector, config->pipe);
-	config->crtc = drmModeGetCrtc(drm_fd, resources->crtcs[config->pipe]);
+	config->encoder = _kmstest_connector_config_find_encoder(drm_fd, connector, config->crtc_index);
+	config->crtc = drmModeGetCrtc(drm_fd, resources->crtcs[config->crtc_index]);
 
 	if (connector->connection != DRM_MODE_CONNECTED)
 		goto err2;
@@ -3640,7 +3640,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 	 */
 	for (i = 0; i <= igt_display_n_crtcs(display); i++) {
 		for_each_connected_output(display, output) {
-			uint32_t pipe_mask = output->config.valid_crtc_idx_mask & full_pipe_mask;
+			uint32_t pipe_mask = output->config.valid_crtc_index_mask & full_pipe_mask;
 			bool found = false;
 
 			if (output_is_internal_panel(output)) {
@@ -4828,9 +4828,9 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 		if (!output->config.connector || !output->changed)
 			continue;
 
-		LOG(display, "%s: preparing atomic, pipe: %s\n",
+		LOG(display, "%s: preparing atomic, CRTC: %s\n",
 		    igt_output_name(output),
-		    kmstest_pipe_name(output->config.pipe));
+		    kmstest_pipe_name(output->config.crtc_index));
 
 		igt_atomic_prepare_connector_commit(output, req);
 	}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4ff10d9149a2..d9b9c5c6351e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -208,8 +208,8 @@ struct kmstest_connector_config {
 	drmModeEncoder *encoder;
 	drmModeModeInfo default_mode;
 
-	int pipe;
-	unsigned valid_crtc_idx_mask;
+	int crtc_index;
+	unsigned int valid_crtc_index_mask;
 	char *connector_path;
 };
 
@@ -676,7 +676,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output)
 {
 	return igt_output_is_connected(output) &&
-		output->config.valid_crtc_idx_mask & (1 << (pipe));
+		output->config.valid_crtc_index_mask & (1 << (pipe));
 }
 
 /**
@@ -689,7 +689,7 @@ static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output
 static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *output)
 {
 	return igt_output_is_connected(output) &&
-		output->config.valid_crtc_idx_mask & (1 << crtc->pipe);
+		output->config.valid_crtc_index_mask & (1 << crtc->pipe);
 }
 
 #define for_each_if(condition) if (!(condition)) {} else
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index a74e69c6f042..eb878ee15b11 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1104,11 +1104,11 @@ static void connector_find_preferred_mode(uint32_t connector_id, int crtc_idx,
 		return;
 	}
 
-	o->pipe = config.pipe;
+	o->pipe = config.crtc_index;
 	o->kconnector[0] = config.connector;
 	o->kencoder[0] = config.encoder;
 	o->_crtc[0] = config.crtc->crtc_id;
-	o->_pipe[0] = config.pipe;
+	o->_pipe[0] = config.crtc_index;
 	o->kmode[0] = config.default_mode;
 	o->mode_valid = 1;
 
@@ -1178,20 +1178,20 @@ static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
 	o->mode_valid = get_compatible_modes(&mode[0], &mode[1],
 					     config[0].connector, config[1].connector);
 
-	o->pipe = config[0].pipe;
+	o->pipe = config[0].crtc_index;
 	o->fb_width = mode[0].hdisplay;
 	o->fb_height = mode[0].vdisplay;
 
 	o->kconnector[0] = config[0].connector;
 	o->kencoder[0] = config[0].encoder;
 	o->_crtc[0] = config[0].crtc->crtc_id;
-	o->_pipe[0] = config[0].pipe;
+	o->_pipe[0] = config[0].crtc_index;
 	o->kmode[0] = mode[0];
 
 	o->kconnector[1] = config[1].connector;
 	o->kencoder[1] = config[1].encoder;
 	o->_crtc[1] = config[1].crtc->crtc_id;
-	o->_pipe[1] = config[1].pipe;
+	o->_pipe[1] = config[1].crtc_index;
 	o->kmode[1] = mode[1];
 
 	drmModeFreeCrtc(config[0].crtc);
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index be88d8fb8343..aa9f397a5bba 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -229,7 +229,7 @@ static void connector_find_preferred_mode(uint32_t connector_id,
 	c->connector = config.connector;
 	c->encoder = config.encoder;
 	c->crtc = config.crtc->crtc_id;
-	c->pipe = config.pipe;
+	c->pipe = config.crtc_index;
 
 	if (mode_num != -1) {
 		igt_assert(mode_num < config.connector->count_modes);
-- 
2.47.3


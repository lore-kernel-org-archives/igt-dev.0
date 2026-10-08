Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879CFCA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 06:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B4D10FC7B;
	Thu,  8 Oct 2026 06:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fi5dFB4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF9310FC40
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 06:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791440129; x=1822976129;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=WLzSbP/oFGANsorwaYWxf7xRZPucJLw5Q8m3u/YpiNA=;
 b=fi5dFB4soYH30uQxckMyYR9WDs+XcuHpyyFWaOoC6C4FNWp0x4eGAmnC
 3TiIoGHEIW29VT5Qof1hBAnqUVVnkakpg2uEX5jRPi6UCNmyD6oU36QyF
 m7Od6Q9WWwgfomdtwgbZJG9ApEg5gxcXhwi/YT3FuTo9N2iYu1S3NkudP
 ArLGGWrv9Mq3TZRZbLWtrvLnmpzUOWQKY5aIj8enJolr7JewvvB5ckWSl
 bcx0wMCHhMgI1zOuYWgGkh4avz7JQr4XIJrRta0KZlTpAidIe0Bje7pvY
 JOeebZUzMNN6xVZNBVvoCExMsBafQo+lznGIaP9co0+MExFarS8P5IWC2 A==;
X-CSE-ConnectionGUID: oyWHlADWRvCGQjCHAxJxkw==
X-CSE-MsgGUID: dyICb3TtQziSdh0OZwWqyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="210493"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="210493"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 23:14:20 -0700
X-CSE-ConnectionGUID: FNJ9H5OeSXqgZ/81mKZnuw==
X-CSE-MsgGUID: UIvglC3OQViHpD3iMI7lCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="386477"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2026 23:14:19 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 08 Oct 2026 11:42:53 +0530
Subject: [PATCH i-g-t v2 2/2] tests/intel/kms_joiner: Use the CRTCs
 reported free before a modeset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-joiner-v2-2-693aed4be6a1@intel.com>
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

Every joiner modeset here picks pipes out of BIT(n_pipes) - 1, i.e. it
assumes all pipes are free, and the ultra joiner and last-pipe paths
pick a pipe without checking it at all. When another client owns a
pipe the commit fails for an unrelated reason and the subtest reports
a bogus failure.

Query the free pipes with igt_get_free_pipes_mask() right before each
modeset sequence and use only those CRTCs that are available.
igt_display_reset doesnt land to KMD without committing, so
the pipes were never actually released before sampling; add the
missing commit.

Assisted-by: LLM
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/intel/kms_joiner.c | 75 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 70 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index fce24f2bd08767351c1b323cc0a7f03c6d2fa0ec..c0e358a319734b8876deffe74e0416474b7e64e5 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -131,6 +131,21 @@ static void enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
 	}
 }
 
+/*
+ * A joiner modeset needs @count consecutive free pipes starting at @pipe.
+ * @free_pipe_mask is the snapshot taken from drmModeGetCrtcList().
+ */
+static bool pipes_are_free(uint32_t free_pipe_mask, enum hardware_pipe pipe, int count)
+{
+	uint32_t needed_mask = 0;
+	int i;
+
+	for (i = 0; i < count; i++)
+		needed_mask |= BIT(pipe + i);
+
+	return (free_pipe_mask & needed_mask) == needed_mask;
+}
+
 static enum hardware_pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
 {
 	if ((data->master_pipes & available_pipe_mask) == 0)
@@ -223,7 +238,8 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 	drmModeModeInfo uj_mode;
 	int status;
 	bool ultrajoiner_found;
-	enum hardware_pipe pipe;
+	/* set_joiner_mode() always drives pipe A */
+	enum hardware_pipe pipe = PIPE_A;
 	bool force_joiner_supported;
 
 	drmModeConnector *connector = output->config.connector;
@@ -246,6 +262,14 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 	}
 
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+		/* Release the pipes a previous output was using if any */
+		igt_display_reset(&data->display);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		igt_require_f(pipes_are_free(igt_get_free_pipes_mask(&data->display),
+					     pipe, 4),
+			      "No 4 free consecutive pipes starting at %s\n",
+			      kmstest_pipe_name(pipe));
+
 		set_joiner_mode(data, output, &uj_mode);
 		/* Switch to big joiner mode */
 		if (bigjoiner_mode_found(data->drm_fd, output->config.connector,
@@ -279,7 +303,7 @@ static void test_single_joiner(data_t *data, int output_count, bool force_joiner
 {
 	int i;
 	enum hardware_pipe pipe, master_pipe;
-	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
+	uint32_t available_pipe_mask;
 	igt_output_t *output;
 	igt_plane_t *primary;
 	igt_output_t **outputs;
@@ -290,6 +314,9 @@ static void test_single_joiner(data_t *data, int output_count, bool force_joiner
 	igt_display_reset(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	available_pipe_mask = igt_get_free_pipes_mask(&data->display);
+	igt_require_f(available_pipe_mask, "No free CRTC available\n");
+
 	for (i = 0; i < output_count; i++) {
 		output = outputs[i];
 		for (pipe = 0; pipe < data->n_pipes - 1; pipe++) {
@@ -320,13 +347,15 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 	igt_fb_t fb[output_count];
 	drmModeModeInfo *mode;
 
-	available_pipe_mask = BIT(data->n_pipes) - 1;
 	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 	cleanup = 0;
 
 	igt_display_reset(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	available_pipe_mask = igt_get_free_pipes_mask(&data->display);
+	igt_require_f(available_pipe_mask, "No free CRTC available\n");
+
 	for (i = 0; i < output_count; i++) {
 		output = outputs[i];
 		for (pipe = 0; pipe < data->n_pipes; pipe++) {
@@ -366,12 +395,14 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	igt_fb_t fb[INVALID_TEST_OUTPUT];
 	drmModeModeInfo mode;
 
-	available_pipe_mask = BIT(data->n_pipes) - 1;
 	outputs = force_joiner ? data->non_big_joiner_output :
 		  mixed ? data->mixed_output : data->big_joiner_output;
 	igt_display_reset(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	available_pipe_mask = igt_get_free_pipes_mask(&data->display);
+	igt_require_f(available_pipe_mask, "No free CRTC available\n");
+
 	for (i = 0; i < data->n_pipes - 1; i++) {
 		attempt_mask = BIT(data->pipe_seq[i]);
 		master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
@@ -447,6 +478,12 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		output = outputs[i];
 
+		if (!pipes_are_free(igt_get_free_pipes_mask(display), pipe, 1)) {
+			igt_info("Pipe %s is not free, skipping output %s\n",
+				 kmstest_pipe_name(pipe), output->name);
+			continue;
+		}
+
 		if (!force_joiner) {
 			igt_require_f(bigjoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode),
 						  "No big joiner mode found on output %s\n", output->name);
@@ -478,7 +515,8 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display, bool force_joiner)
 {
 	igt_display_t *display = &data->display;
-	int i, j, k, ret, count;
+	int i, j, k, ret, count, needed_pipes;
+	uint32_t free_pipe_mask;
 	igt_output_t *output, *non_ultra_joiner_output;
 	igt_plane_t *primary;
 	igt_output_t **outputs;
@@ -496,6 +534,16 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 	igt_display_reset(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	/*
+	 * A successful ultra joiner modeset occupies four consecutive pipes,
+	 * so all four have to be free.
+	 * The invalid_pipe is a -ve test & expects the commit to be rejected,
+	 * so dont skip the test if 4 pipes are not available, allow it to fail.
+	 */
+	needed_pipes = invalid_pipe ? 1 : 4;
+	free_pipe_mask = igt_get_free_pipes_mask(&data->display);
+	igt_require_f(free_pipe_mask, "No free CRTC available\n");
+
 	for (i = 0; i < count; i++) {
 		output = outputs[i];
 
@@ -519,6 +567,14 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 				continue;
 
 			pipe = data->pipe_seq[j];
+
+			if (!pipes_are_free(free_pipe_mask, pipe, needed_pipes)) {
+				igt_info("No %d free consecutive pipes from %s, skipping output %s\n",
+					 needed_pipes, kmstest_pipe_name(pipe),
+					 output->name);
+				continue;
+			}
+
 			crtc = igt_crtc_for_pipe(display, pipe);
 			igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
@@ -579,6 +635,7 @@ static void test_basic_max_non_joiner(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	int count;
+	uint32_t free_pipe_mask;
 	enum hardware_pipe pipe;
 	igt_output_t **outputs, *output;
 	igt_fb_t fb;
@@ -588,6 +645,10 @@ static void test_basic_max_non_joiner(data_t *data)
 	count = data->non_joiner_output_count;
 	outputs = data->non_joiner_output;
 	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* A non-joiner modeset needs a single free pipe. */
+	free_pipe_mask = igt_get_free_pipes_mask(&data->display);
 
 	for (int i = 0; i < count; i++) {
 		output = outputs[i];
@@ -596,6 +657,10 @@ static void test_basic_max_non_joiner(data_t *data)
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 				igt_crtc_t *crtc;
 
+				igt_require_f(pipes_are_free(free_pipe_mask, pipe, 1),
+					      "Pipe %s is not free\n",
+					      kmstest_pipe_name(pipe));
+
 				crtc = igt_crtc_for_pipe(display, pipe);
 				igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 

-- 
2.25.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421B5D0C5EB
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 08:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF0410EA34;
	Fri, 25 Oct 2024 08:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAyRwbQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB98010EA34
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729846299; x=1761382299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ee1+53WihJKuxoJj2Obd2u0wVEHp570SoB9rqWSZRSU=;
 b=LAyRwbQj2Qfu4Sn4zgzJH+Wy0lgs23p22DLP7RR/I3M6Q2gfruax3gUJ
 QGSZs922Lh65jyLZpqVs3uAyrThMPzbCPz+mb3ZPa/qNlFDBo4QAZx5ek
 Qic1tmXDCR6Nnu4vlLZ2Fk03DDTXtJX9TIoDBWYqBFfncnPAwLTt+wb9l
 PwHW382ulZunJHTDj8aef1AR/BT0iMRMjnsuB71Ojvnuxp0muRIo2g+VY
 oZvsUicQmSjm/QNNRjIRv4z8XWzatvzRuE1AS96iLSTb1b2jrDIZ9Nw1/
 tZ3kasPHlT/jnqER9oCwG8U7JkPFjQhWyY2Mpu8OweGUxxCSpk+DznxpI w==;
X-CSE-ConnectionGUID: FQ6TIsW7RsGfX/aZQqQ3tQ==
X-CSE-MsgGUID: mtdTRYUNTHuiYQC3KxujrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28962062"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="28962062"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 01:51:32 -0700
X-CSE-ConnectionGUID: O7m7dVW3T9KK4IJU+szN6g==
X-CSE-MsgGUID: 2PBAGFY6RgOIMLswpQwApA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="84815279"
Received: from sorvi2.fi.intel.com ([10.237.72.194])
 by fmviesa003.fm.intel.com with ESMTP; 25 Oct 2024 01:51:31 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_scaling: Require at least 30 Hz refresh
 rate
Date: Fri, 25 Oct 2024 11:42:51 +0300
Message-ID: <20241025084251.14116-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

With HDMI dummies we may end up testing a mode that doesn't really
resemble real life scenario like 4k mode with 17Hz refresh rate, which
can lead issues when executing a test. Therefore, the patch proposes
for intel-max-src-size to be tested with with real life refresh rate
such as 30 Hz or higher.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_plane_scaling.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index a55720ed9..c8c9aee31 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -215,6 +215,7 @@ typedef struct {
 struct invalid_paramtests {
 	const char *testname;
 	uint32_t planesize[2];
+	uint32_t vrefresh;
 	struct {
 		enum igt_atomic_plane_properties prop;
 		uint32_t value;
@@ -225,6 +226,7 @@ static const struct invalid_paramtests intel_paramtests[] = {
 	{
 		.testname = "intel-max-src-size",
 		.planesize = {3840, 2160},
+		.vrefresh = 30,
 	},
 };
 
@@ -1220,13 +1222,14 @@ static void invalid_parameter_tests(data_t *d)
 	}
 }
 
-static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint32_t planesize[])
+static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const struct invalid_paramtests *test)
 {
 	drmModeModeInfo *mode = NULL;
 
 	for (int i = 0; i < output->config.connector->count_modes; i++) {
-		if (output->config.connector->modes[i].hdisplay == planesize[0] &&
-		    output->config.connector->modes[i].vdisplay == planesize[1] ) {
+		if (output->config.connector->modes[i].hdisplay == test->planesize[0] &&
+		    output->config.connector->modes[i].vdisplay == test->planesize[1] &&
+		    output->config.connector->modes[i].vrefresh >= test->vrefresh) {
 			if (mode &&
 			    mode->vrefresh < output->config.connector->modes[i].vrefresh)
 				continue;
@@ -1568,7 +1571,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						 * Need to find mode with lowest vrefresh else
 						 * we can exceed cdclk limits.
 						 */
-						mode = find_mode(&data, output, intel_paramtests[index].planesize);
+						mode = find_mode(&data, output, &intel_paramtests[index]);
 						if (mode) {
 							igt_dynamic_f("pipe-%s-%s",
 								       kmstest_pipe_name(pipe), igt_output_name(output))
-- 
2.43.0


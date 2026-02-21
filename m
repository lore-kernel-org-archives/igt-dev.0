Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607F7C5DF70
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1413D10E86C;
	Sat, 21 Feb 2026 03:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K48vVizi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F56010E875
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644026; x=1803180026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OpygdYumqwcld8rInahiolV6OJZECIlEnqCB2sVW3jU=;
 b=K48vVizi0ONYA3bdF0fQA1ZLDHqzxNGkz4tJePiiED7X3LQnx6ebPR+i
 TbuxUNlbHkYL+BvtOGvoDHCe85UcnyJ4r/zV4T250g0lQrs3Ip/7Wc3f+
 uoT88IEEDkzRhmX/im8C5BHvOf5VsM3L+f7jXr74tE0HuRB3R4A/hEC2Y
 KPjPE/P5IuYn1cQtM6t63BvXmthB626OaK8Xgi1a7c4UmPRRvEQ81+J3+
 i0FD7dKR2GNLgyR0OUB9JNIPu1fDfGFtR6t3GzV/2UKZqxGDK/gtrg5W2
 nkcjJexWMWqAESxCcZyBCJGaT51WeqppNBv2jXVoGrLAYIOV1lJtcaaap Q==;
X-CSE-ConnectionGUID: ffxMJn+mQMmW7oWCd4FK2Q==
X-CSE-MsgGUID: 0HygIrJbTxOhilacq/cmpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="75345755"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="75345755"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:26 -0800
X-CSE-ConnectionGUID: hHGDxxuKS1ednhrokhp5HA==
X-CSE-MsgGUID: pElBXEhLRmyRC8uIpugveA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252720234"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:24 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: George Zhang <george.zhang@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t v2 05/23] tests/amdgpu/amd_abm: Don't use uninitialized
 'pipe'
Date: Sat, 21 Feb 2026 05:19:44 +0200
Message-ID: <20260221032003.30936-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
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

The for_each_valid_output_on_pipe() loops in amd_abm use an
uninitialized 'pipe' variable. Not entirely sure what the intention
was with the change to for_each_valid_output_on_pipe(), but eg.
set_abm_level() gets called from those loops and it operates on
data->pipe_id instead of whatever stack garbage pipe the loop
happens to use. So let's assume the intention was to use the same
fixed pipe for everything and just pass data->pipe_id to
for_each_valid_output_on_pipe().

 #include "scripts/iterators.cocci"

@@
iterator name for_each_valid_output_on_pipe;
expression DISPLAY, OUTPUT;
identifier PIPE;
type T;
@@
- T PIPE;
<+... when != PIPE = ...
  for_each_valid_output_on_pipe(DISPLAY,
-	PIPE,
+	data->pipe_id,
	OUTPUT)
	{...}
...+>

Cc: George Zhang <george.zhang@amd.com>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Fixes: 1235576931b5 ("tests/amdgpu/amd_abm: Fixed tests to only run on one output per pipe")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_abm.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 110dd89e3ac2..159f6c7c69e9 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -170,10 +170,9 @@ static void test_fini(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
 
 	/* Disable ABM before exit test */
-	for_each_valid_output_on_pipe(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 		set_abm_level(data, output, 0);
@@ -328,9 +327,8 @@ static void backlight_dpms_cycle(data_t *data)
 	int max_brightness;
 	int pwm_1, pwm_2;
 	igt_output_t *output;
-	enum pipe pipe;
 
-	for_each_valid_output_on_pipe(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
@@ -359,10 +357,9 @@ static void backlight_monotonic_basic(data_t *data)
 	int prev_pwm, pwm;
 	int brightness_step;
 	int brightness;
-	enum pipe pipe;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 		ret = backlight_read_max_brightness(&max_brightness);
@@ -393,10 +390,9 @@ static void backlight_monotonic_abm(data_t *data)
 	int prev_pwm, pwm;
 	int brightness_step;
 	int brightness;
-	enum pipe pipe;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 		ret = backlight_read_max_brightness(&max_brightness);
@@ -426,10 +422,9 @@ static void abm_enabled(data_t *data)
 	int ret, i;
 	int max_brightness;
 	int pwm, prev_pwm, pwm_without_abm;
-	enum pipe pipe;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
@@ -460,10 +455,9 @@ static void abm_gradual(data_t *data)
 	int convergence_delay = 10;
 	int prev_pwm, pwm, curr;
 	int max_brightness;
-	enum pipe pipe;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-- 
2.52.0


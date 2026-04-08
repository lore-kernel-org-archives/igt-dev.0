Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0739D10F9972
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 20:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B13610E260;
	Wed,  8 Apr 2026 20:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayeBDbRm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E0210E260
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 20:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775679694; x=1807215694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zi2HQy/Fy22DehJvoBQ8q9Rpsznx4p577QS+beLP4U8=;
 b=ayeBDbRmf6AAMNl954iyxb/KNEiRJGXJmoqo8CPS1fRZp36DTxleaCug
 XHHzOdVrY1FPQbiaoVzUkGlviviy7wqd408DEnTt3IiZmWORbqkLtm9OF
 paBV/npKvbeGJnTrEgZqIH1sMWcq4RloLj/g5Yk9eWQI2TfdnaJPpFiPs
 N7K8jAwhjS1bdG4ZvOftHu0ux4L11elmiwY697+KzfUFw29CJ3gEPXh+b
 DHlV/IGboxha+pA0f2v4cr1en/Qi2t7swU7wIO7vDP9sdlk0/8VXQ1Xkq
 6Drmyj8GLDzS+nrbVX35inwPXACBRK1eNcPJ0U8kRWGvOImNm0XTerjQ9 Q==;
X-CSE-ConnectionGUID: oYAZFI2rQn+4KnBbO1uVlA==
X-CSE-MsgGUID: eA5PgmL7QuKnEpHyZZ2fgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75713390"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="75713390"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:34 -0700
X-CSE-ConnectionGUID: SoIyZIkTQCy09pwnVVctmA==
X-CSE-MsgGUID: U5JrERtSTnaQEEB73FaYKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="223810520"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 3/7] tests/intel/kms_flip_scaled_crc: use
 for_each_connector_mode()
Date: Wed,  8 Apr 2026 23:21:09 +0300
Message-ID: <7c82e4cae3069983ae5678208310339c65289568.1775679624.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775679624.git.jani.nikula@intel.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
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

We have a helper for looping the output modes. Use it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 18e7b4b5a44a..944dfeede84d 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -836,15 +836,15 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 static drmModeModeInfoPtr find_mode(data_t *data, igt_output_t *output)
 {
 	drmModeModeInfoPtr modetoset = NULL;
+	drmModeModeInfo *mode;
 
-	for (int i = 0; i < output->config.connector->count_modes; i++) {
-		if (output->config.connector->modes[i].hdisplay == data->attemptmodewidth &&
-		    output->config.connector->modes[i].vdisplay == data->attemptmodeheight) {
-			if (modetoset &&
-			    modetoset->vrefresh < output->config.connector->modes[i].vrefresh)
+	for_each_connector_mode(output, mode) {
+		if (mode->hdisplay == data->attemptmodewidth &&
+		    mode->vdisplay == data->attemptmodeheight) {
+			if (modetoset && modetoset->vrefresh < mode->vrefresh)
 				continue;
 
-			data->mode = output->config.connector->modes[i];
+			data->mode = *mode;
 			modetoset = &data->mode;
 		}
 	}
-- 
2.47.3


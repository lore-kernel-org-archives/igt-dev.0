Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543A110F9968
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 20:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC01310E6D9;
	Wed,  8 Apr 2026 20:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUAtqIz7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C731110E2AE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775679700; x=1807215700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P/TWVL10z4n/x6Swzldz10oX+C0lw1jl0cE+DxRTAgs=;
 b=WUAtqIz70NPT8D6hcm74chED5ll2grT63cpgQgaofU8Z0ynH9pYyJE2N
 uwYAOGke6k0BKb92k+7gK86G7us+R8KHSh3uXTCzfWHV0uvPp7OC9StSh
 VTA7nJhYVkeMkIbUclT2479fDmBTihtPg186pQVOCs8bswRCenUFFTTV4
 njlHaPJ3g4HKzil0gKeV6HiFj7uuWNbFi2viLfg++r0DjKZlB0paEAQBK
 YeqGLrhyXeEJMUvgrm/Vzh6aLQNlP0f0dWfBKJJnhYT1mpRouwKQ14U9N
 eMnD5oA9HCkCAPkFDbKmePhdDNx2V6x4k937RLYxRadd2agfjhn67a5rv A==;
X-CSE-ConnectionGUID: NmV5sLEXS6uwKMym9N0aaQ==
X-CSE-MsgGUID: Eu07/3BiTDCOVDxXSOCUlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="64220911"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="64220911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:39 -0700
X-CSE-ConnectionGUID: Wx2BXB9ATuSIvGpKLoDuYQ==
X-CSE-MsgGUID: FoD+UkdDQRe6VRW7X9gpDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="251711091"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 4/7] tests/intel/kms_pm_rpm: use
 for_each_connector_mode()
Date: Wed,  8 Apr 2026 23:21:10 +0300
Message-ID: <fa6053941144b807ce8b5ec9fa392c5df8126414.1775679624.git.jani.nikula@intel.com>
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

We have	a helper for looping the output	modes. Use it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_pm_rpm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 5f24fd49b13a..60d0b27929a2 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1595,11 +1595,9 @@ static void pm_test_caching(void)
 static bool is_preferred_mode_present(igt_output_t *output,
 				      igt_display_t *display)
 {
-	drmModeModeInfo *mode = NULL;
-
-	for (int i = 0; i < output->config.connector->count_modes; i++) {
-		mode = &output->config.connector->modes[i];
+	drmModeModeInfo *mode;
 
+	for_each_connector_mode(output, mode) {
 		for (int j = 0; j < ARRAY_SIZE(prefers_mode); j++) {
 			if (mode->hdisplay == prefers_mode[j].w &&
 				mode->vdisplay == prefers_mode[j].h &&
-- 
2.47.3


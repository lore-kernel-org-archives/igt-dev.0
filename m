Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297D606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KL3FAbi4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A687010E3F0;
	Fri,  6 Nov 2026 18:13:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC3D10E204
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793988560; x=1825524560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HsuB1JYQAotY4zDeuCaNPPLUvaJZYaum4H0om8JVeF0=;
 b=KL3FAbi4+fWt/wnjmOlIm2NXgXAfZcFkcMAWZA1cGwlnlUc1agdG+5BU
 CnQDJvjMj+7dIkewgGSaweIWP2CoT82YjmOsoDC4PcwyQaSFPZ4lVpa1D
 aRVfbGkA33K1fBMtQPBiYfkyS3LWHjxnPYgoGA7Mfd1DT47JPXLCXLifP
 Ng2IrNfXZXVDJ96iTxBwkee2UHRKpsPPTzLWEo6wFT6bJu+/IBIftT0Gl
 nGoiXcqSZ8oIKt4CZxR4KLvHzZ6XkHS40LZYpluszO5PJ+XTC3CPKJ8g6
 8fwD+TzobFlFJNQdsDr3bcv7Hlexdo+/jd0MERlpChPVrj3inBmfnX2+V A==;
X-CSE-ConnectionGUID: dY4KZeJmTzmQpbxiTdvzXg==
X-CSE-MsgGUID: mfeHaLwPQVa9bqD0zpkfDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2723935"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2723935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:19 -0800
X-CSE-ConnectionGUID: X0tc3w3bTkiIkhOrqg/FeQ==
X-CSE-MsgGUID: MwR7ojehSiOaER6BT3oK3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7362640"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:18 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v9 8/9] tests/intel/kms_ccs: limit #pipes tested during
 suspend
Date: Fri,  6 Nov 2026 19:08:48 +0100
Message-ID: <20261106180849.156578-9-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
References: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Limit execution of suspend tests to first and last active pipe unless
using `extended` flag. This reduces default execution time of the test.
In turn this can lower chances of hitting CI timeout.

Alternatively test could be run on first and last CRTC; but due to pipe
reordering, this would result in using arbitrary pipes. Thus set first
and last pipe as the only available in suspend resume case.

v8->v9
- fix extra long opts string (JP)

v7->v8
- use pipe mask (Jani)

v6->v7
- use first and last hardware pipe instead of CRTCs (J-P, Jani)

v5->v6
- describe how pipe reordering affects the test (Jani)

v3->v4
- set `first' and `last' indices outside of crtc loop (Thasleem)

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/intel/kms_ccs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 734dafd110..887b9ba7bd 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -192,6 +192,7 @@ typedef struct {
 	bool available_pipes[IGT_MAX_PIPES];
 	bool do_hibernate;
 	bool all_outputs;
+	bool all_crtcs;
 	struct {
 		struct igt_fb fb;
 		int width, height;
@@ -1098,7 +1099,9 @@ static bool set_available_hw_pipes(data_t *data)
 
 	for_each_crtc(&data->display, crtc) {
 		hw_pipe = crtc->hardware_pipe;
-		data->available_pipes[hw_pipe] = true;
+
+		if (data->all_crtcs)
+			data->available_pipes[hw_pipe] = true;
 
 		if (last_pipe < hw_pipe)
 			last_pipe = hw_pipe;
@@ -1110,6 +1113,9 @@ static bool set_available_hw_pipes(data_t *data)
 	if (first_pipe == IGT_MAX_PIPES || last_pipe == PIPE_NONE)
 		return false;
 
+	data->available_pipes[first_pipe] = true;
+	data->available_pipes[last_pipe] = true;
+
 	return true;
 }
 
@@ -1260,6 +1266,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 	case 'n':
 		data->all_outputs = true;
 		break;
+	case 'e':
+		data->all_crtcs = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1274,9 +1283,10 @@ static const char *help_str =
 "  -s <seed>\tSeed for random number generator\n"
 "  -r\t\tOn suspend test do full hibernate with reboot\n"
 "  -n\t\tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
+"  -e\t\tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
 ;
 
-int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
+int igt_main_args("cs:rne", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.45.2


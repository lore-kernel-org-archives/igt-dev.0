Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306C7CC6B19
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 16:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0F610E51D;
	Tue, 13 Oct 2026 16:14:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7148410E8E7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791907871; x=1823443871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MbSG6IW383DI9eMmJZA+/JDUfaHPPi+4wB6CQ1+KxeA=;
 b=iefJVctaWvCsw0wey5Ol/LjblsuV+wMbVx8bmYauUFDTJ/jnUmQjfHaF
 ddcp7v0a/GiLGMvf5MQCKnqSJ+vne5YEPMb7IV+s2h94Yb8bVTgVUeBzd
 LqPNif/rrzj4uEmbRknvjB2GgnMkxFm6R0VFJ7zsBtlKsv7ZlCT59DsIL
 spAAo/WrDomSGIT14ZWfu90G0wtZa+fIJTM3ZRqBWKh/m7aGWs+La8l+p
 5CvmVMkJdA6EAJbAShQSRy7C8HeNfKSmFFHf27sqVUc4CJDjatPNDTDx4
 sroXpQc/zh8X4oGQoWZdk6ctpj7VmVP3jxuTfJvqdByYO6NF6o2bmmN/B A==;
X-CSE-ConnectionGUID: P7vdPu/rTKGpuT4fNRoD5Q==
X-CSE-MsgGUID: bFBHxxqURLiFXkjf/2fPEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="656350"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="656350"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:11:11 -0700
X-CSE-ConnectionGUID: FRRbh0m3T1CXxGgejByB6g==
X-CSE-MsgGUID: 3b9LVHruT0qjWIoooJvk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1096353"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:11:08 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v8 8/9] tests/intel/kms_ccs: limit #pipes tested during
 suspend
Date: Tue, 13 Oct 2026 18:10:12 +0200
Message-ID: <20261013161013.1364753-9-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
References: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
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
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Limit execution of suspend tests to first and last active pipe unless
using `extended` flag. This reduces default execution time of the test.
In turn this can lower chances of hitting CI timeout.

Alternatively test could be run on first and last CRTC; but due to pipe
reordering, this would result in using arbitrary pipes. Thus set first
and last pipe as the only available in suspend resume case.

v7->v8
- use pipe mask (Jani)

v6->v7
- use first and last hardware pipe instead of CRTCs (J-P, Jani)

v5->v6
- describe how pipe reordering affects the test (Jani)

v3->v4
- set `first' and `last' indices outside of crtc loop (Thasleem)

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/intel/kms_ccs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 734dafd110..3af091fd87 100644
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
+int igt_main_args("csrne:", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.45.2


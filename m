Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C617606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQd9IzB1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FE610E627;
	Tue, 17 Nov 2026 15:16:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2295510E601
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794928440; x=1826464440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jgg+yef6PQ/ZfFTDEcHFz+o6de2F5Tw6F3hV5ASk61k=;
 b=lQd9IzB16kUrtOFftITTMkIs4ZhOdrOaVWNMvm1tXVvNmp5qFYMCgm/7
 pmXjACR3EYUjeHuw/c2nTljjijtFVlxZITnc6dd3afXkcwrWbfvDXK+k0
 8s7YosgVoUP8kZ2QLlv30A1nT4JcHqJw6jTB5DqF1nfr3SUwdQWpVvBnO
 Ywaxj40vOCOEvtPKPPJYuOP/LqU2CyFnE0hk1vI4FYYFy43cSiQQ/oWwm
 7yEqMQiie1P2VEkjTvqdoYsJP+oNi4EWk+axAAcR6r4nLgwl1LQx255K4
 z6DV3adVbaqA5Fz6kg/klYcKzhjPvmOcSssi3uWlxJCzySVR8pqIM4d38 g==;
X-CSE-ConnectionGUID: b4Q9SqcZTYCj+jBRnJ/VAA==
X-CSE-MsgGUID: y+uzEBxKSDOw7pa7udfVpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3568810"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3568810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:14:00 -0800
X-CSE-ConnectionGUID: loX4FzIKQv6cRUIREL2zdQ==
X-CSE-MsgGUID: tFqMIH+2RcieIqOdO0ow6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9724594"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:13:58 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v10 7/9] tests/intel/kms_ccs: set mask for available
 hardware pipes
Date: Tue, 17 Nov 2026 16:13:24 +0100
Message-ID: <20261117151326.2074274-8-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261117151326.2074274-1-michal.grzelak@linux.intel.com>
References: <20261117151326.2074274-1-michal.grzelak@linux.intel.com>
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

Mapping from hardware pipe into CRTC is needed when testing suspend
since we need to run test on at least first and last pipe. Currently
there is a direct mapping between CRTC and hardware pipe but this will
break after introduction of pipe reordering.

Compute array of all available hardware pipes. While doing it also
compute first and last pipe. Skip whole test when there is no available
pipe.

Skip testing CRTCs that map to unavailable pipes. Currently this is a
no-op but this will change after limiting suspend tests to first and
last pipe.

v7->v8
- add patch

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/intel/kms_ccs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 8526f1ccfd..734dafd110 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -189,6 +189,7 @@ typedef struct {
 	bool user_seed;
 	enum igt_commit_style commit;
 	int fb_list_length;
+	bool available_pipes[IGT_MAX_PIPES];
 	bool do_hibernate;
 	bool all_outputs;
 	struct {
@@ -1088,6 +1089,30 @@ static int test_ccs(data_t *data)
 	return valid_tests;
 }
 
+static bool set_available_hw_pipes(data_t *data)
+{
+	enum hardware_pipe first_pipe = IGT_MAX_PIPES;
+	enum hardware_pipe last_pipe = PIPE_NONE;
+	enum hardware_pipe hw_pipe;
+	igt_crtc_t *crtc;
+
+	for_each_crtc(&data->display, crtc) {
+		hw_pipe = crtc->hardware_pipe;
+		data->available_pipes[hw_pipe] = true;
+
+		if (last_pipe < hw_pipe)
+			last_pipe = hw_pipe;
+
+		if (first_pipe > hw_pipe)
+			first_pipe = hw_pipe;
+	}
+
+	if (first_pipe == IGT_MAX_PIPES || last_pipe == PIPE_NONE)
+		return false;
+
+	return true;
+}
+
 static bool skip_plane(data_t *data, igt_plane_t *plane)
 {
 	int index = plane->index;
@@ -1176,6 +1201,9 @@ static void test_output(data_t *data, const int testnum)
 					if (!intel_pipe_output_combo_valid(&data->display))
 						continue;
 
+					if (!data->available_pipes[crtc->hardware_pipe])
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
 						int valid_tests = 0;
 
@@ -1269,6 +1297,9 @@ int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
 		data.fb_list_length = 0;
 	}
 
+	igt_fixture()
+		igt_require_f(set_available_hw_pipes(&data), "no pipe available\n");
+
 	for (int c = 0; c < ARRAY_SIZE(tests); c++)
 		test_output(&data, c);
 
-- 
2.45.2


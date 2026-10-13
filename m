Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8809BCC6B0E
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 16:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3067610F8DC;
	Tue, 13 Oct 2026 16:18:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400B610E8BA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791907870; x=1823443870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JdGFpWdSm6JXXBJ9Sotc//fvURtBg+G22YM0NJlWB8s=;
 b=A8Jq1bHpPXIgjWkha2l4WzEztHPcQeITH8Uf5O6+v4zMbkkxz9kL5SzJ
 L/WyaN+WnwCcZeCMbnLF0ElkTrkLwDd8adfHdJA68TsEfU5ugSnYMhb1R
 Si4EYI94kMhuPgY3/4UEV1ZRoP7k7jzOXJgSK7eoGeNSVCE5Kz+DSbuHe
 VIo3kd0QrOhjarr5qW89MZATrGWnpXeo+IF6FT9qp+EcLbhSul2BltniI
 VF57vn91hoFK8atxZK63rsZBeYDhCKBKP20tig3bUaMh8lqeet+RVnlR2
 k3w3hm9Kji86pp/h2aaYUqdy8Fuaqovyu6qru/kgXmt7J/nnXBwKcHPhL Q==;
X-CSE-ConnectionGUID: uoV6p5mCRWSuLoMQ5l8nVQ==
X-CSE-MsgGUID: OTGkD7YNRyumNLorqokOKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="656341"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="656341"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:11:09 -0700
X-CSE-ConnectionGUID: ScQyCHA+SwuQHLdjF4UALQ==
X-CSE-MsgGUID: BO0tXnNtQk+QYJIuhkCucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1096343"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:11:06 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v8 7/9] tests/intel/kms_ccs: set mask for available
 hardware pipes
Date: Tue, 13 Oct 2026 18:10:11 +0200
Message-ID: <20261013161013.1364753-8-michal.grzelak@linux.intel.com>
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


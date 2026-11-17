Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE62606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M6Yztdbf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FAB10E628;
	Tue, 17 Nov 2026 15:18:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9734910E622
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794928430; x=1826464430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bl2+apnz2d1a3IjPeOzaVN9c9jBrd6lqhuAP/itv6Zo=;
 b=M6YztdbfJByfEK4EBf8o7dhsPZdvAITWcD5B2pEFN5nbr8Rfse9kDC2D
 nHqNZvCk60AsdK7B+Wxno/oIJzXR6rLgpdvu5/egvU597MBOsrQYnVQUJ
 eIlRTo6rDLyntvajm5uBqNMZXpGYgawUXgQ7inm8VY5ygvUXnftzKZpls
 Li0NuTZU8y8J3JDDe66FN6KES6y9yoJhT6H21jrstpFfSpYdgib+m059B
 maTx8ZKRLLhYS056n/INbqYJvQJKdtQe3W2B30jRfsEgatO4+SQ4HorDx
 p/mgCekP8ZZQPbLuW0R6y1b2J8e7T4jdhg1gndlhsFNNE5crTfj2mcG03 w==;
X-CSE-ConnectionGUID: SHtHzib4RR2EekHRmFv6PQ==
X-CSE-MsgGUID: QnPm6vdrRWyB/rYR3lJGEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3568784"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3568784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:13:50 -0800
X-CSE-ConnectionGUID: yC99eu+GROa51pz2ECwUVg==
X-CSE-MsgGUID: eD4VQi6XQ/+UUBjTN4bArg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9724559"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:13:49 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v10 2/9] tests/kms_async_flips: set mask for available
 hardware pipes
Date: Tue, 17 Nov 2026 16:13:19 +0100
Message-ID: <20261117151326.2074274-3-michal.grzelak@linux.intel.com>
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
compute first and last pipe. Recompute the array on each test since
testing first and last pipe will only be needed in suspend-resume
scenario.

Skip testing CRTCs that map to unavailable pipes. Currently this is a
no-op but this will change after limiting suspend tests to first and
last pipe.

v9->v10
- clear array of available pipes before each recomputation (J-P)

v7->v8
- add patch

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/kms_async_flips.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 8884efd8ba..ed52f1ac64 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -140,6 +140,7 @@ typedef struct {
 	bool flip_pending;
 	igt_crtc_t *crtc;
 	bool alternate_sync_async;
+	bool available_pipes[IGT_MAX_PIPES];
 	bool suspend_resume;
 	bool hang;
 	bool dpms;
@@ -288,10 +289,39 @@ static void require_overlay_flip_support(data_t *data)
 		      "Async flip for overlay planes not supported\n");
 }
 
+static bool set_available_hw_pipes(data_t *data)
+{
+	enum hardware_pipe first_pipe = IGT_MAX_PIPES;
+	enum hardware_pipe last_pipe = PIPE_NONE;
+	enum hardware_pipe hw_pipe;
+	igt_crtc_t *crtc;
+
+	for (hw_pipe = 0; hw_pipe < IGT_MAX_PIPES; hw_pipe++)
+		data->available_pipes[hw_pipe] = false;
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
+	        return false;
+
+	return true;
+}
+
 static void test_init(data_t *data)
 {
 	drmModeModeInfo *mode;
 
+	set_available_hw_pipes(data);
+
 	igt_display_reset(&data->display);
 	igt_display_commit(&data->display);
 
@@ -892,6 +922,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 
 			test_init(data);
 
+			if (!data->available_pipes[crtc->hardware_pipe])
+				continue;
+
 			if (data->linear_modifier)
 				data->modifier = DRM_FORMAT_MOD_LINEAR;
 			else
-- 
2.45.2


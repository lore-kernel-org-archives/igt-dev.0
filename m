Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21A7CC6B0E
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 16:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8F910E51D;
	Tue, 13 Oct 2026 16:15:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8EA10E8E7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791907858; x=1823443858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N8IPWo/7b8JV74vPbALNCwLCYirZWJHlsE3aP8FIBbM=;
 b=gK78pM7EYsNIEhgopNzsyKN8KJ56Ze0speKEBBLBoHK9a2i3nZ2yvThu
 t7vZiWpxMKFemi1hmOHYxg7zt7KxoEnhCuRG9jsG9EX0puvl5Is7YTDeF
 x6zkSm/XjIBL2TcCE894FDmWkGSXu/JCBK8QX3eXmYtwwPHPhSCxy1RIn
 HSeF2xWNRx5JZ7astvFNWDlHwSS6lY+IImsNlPLeFHBlGug6F9RcXzQ/i
 2osc6mVzT72ZGT/V9pnDmYQJhNlNyRV1jwTixp3W3Ri95/K1iGlTd9ubG
 XydDZdOY2Yb0JizlwbQ3DOKDIm5U9I1+LNHOirTgJX0rHkjdhJUsE+hEI w==;
X-CSE-ConnectionGUID: kVWFjhpETbSmK05ZQeYfkQ==
X-CSE-MsgGUID: qDrS0McRTcOYlJ3+tn38Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="656306"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="656306"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:10:58 -0700
X-CSE-ConnectionGUID: lTSCR+T4SkyaoHhMfGEYKA==
X-CSE-MsgGUID: yPlRoLc+RgecuHLs1vpYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1096306"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:10:54 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v8 2/9] tests/kms_async_flips: set mask for available
 hardware pipes
Date: Tue, 13 Oct 2026 18:10:06 +0200
Message-ID: <20261013161013.1364753-3-michal.grzelak@linux.intel.com>
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
compute first and last pipe. Recompute the array on each test since
testing first and last pipe will only be needed in suspend-resume
scenario.

Skip testing CRTCs that map to unavailable pipes. Currently this is a
no-op but this will change after limiting suspend tests to first and
last pipe.

v7->v8
- add patch

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/kms_async_flips.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 8884efd8ba..a548c73cd9 100644
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
@@ -288,10 +289,36 @@ static void require_overlay_flip_support(data_t *data)
 		      "Async flip for overlay planes not supported\n");
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
 
@@ -892,6 +919,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 
 			test_init(data);
 
+			if (!data->available_pipes[crtc->hardware_pipe])
+				continue;
+
 			if (data->linear_modifier)
 				data->modifier = DRM_FORMAT_MOD_LINEAR;
 			else
-- 
2.45.2


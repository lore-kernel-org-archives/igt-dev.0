Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03DAFF6E92
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 22:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFF410E434;
	Tue, 17 Mar 2026 22:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMwQC2+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F48C10E434
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 22:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773787155; x=1805323155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3XB979jQFmH2spdwgrhT14CsGWZ18TTBG3hegbk//tY=;
 b=CMwQC2+n65AVAvw72tk8i4RCsOfLPsgp9drAzRgRztn2PJbiK03qBlJ1
 ePT/XroYHnZAPyjtMFXVpiMuN20HnG4CkF4f9zYEUMpg5YXYYT59ue1wP
 iCYkhwrdAO9i32yGokAVJcQKvNVR9ZuoOPnM/zYtwdNeEcRDu6kovywwP
 JR65g+USbL+U4bpPUR6jovv2K/2FyAfK6QTEl3SkoHxZrV47m/1jmxAyw
 o611MQgDZ1ZNCucC/x+NGtC5HQm/4NAb9iTcjudXNYq2VV6WHrf8zh9Cq
 v/eyTEpKtf13Pe7TB0RYzckNX55Qj2faRWej5r2Vm7mFx8DXid9ZLmty9 w==;
X-CSE-ConnectionGUID: +Mv1qEVtRLCvb/sT/OMDvw==
X-CSE-MsgGUID: VA9a2FQKSrWgLe3My1aMzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100296595"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="100296595"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 15:39:14 -0700
X-CSE-ConnectionGUID: VcCIbEnMSgK2CvSKZZESVw==
X-CSE-MsgGUID: HaErclUrTAyDm9PzZxcPiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="218495815"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 15:39:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Extend enable-disable to read after
 disabling stream
Date: Tue, 17 Mar 2026 15:39:10 -0700
Message-ID: <20260317223910.3539034-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Extend enable-disable subtest to validate the new feature of reading after
disabling OA stream.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 387f29535e..6a602a014c 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2774,6 +2774,31 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
 	get_stream_status(stream_fd);
 	igt_assert_eq(ret, sizeof(buf));
 
+	/*
+	 * Wait again for number of reports specified in
+	 * DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS
+	 */
+	pollfd.fd = stream_fd;
+	pollfd.events = POLLIN;
+	poll(&pollfd, 1, -1);
+	igt_assert(pollfd.revents & POLLIN);
+
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+	/* Ensure num_reports can be read even with disabled stream */
+	while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 && errno == EINTR)
+		;
+	get_stream_status(stream_fd);
+	igt_assert_eq(ret, sizeof(buf));
+
+	/* In non-blocking mode read till we see a -EAGAIN, signifying all available data is read */
+	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
+	while ((ret = read(stream_fd, buf, sizeof(buf))) > 0 ||
+	       (ret == -1 && (errno == EINTR || errno == EIO)))
+		;
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, EAGAIN);
+
 	__perf_close(stream_fd);
 }
 
-- 
2.48.1


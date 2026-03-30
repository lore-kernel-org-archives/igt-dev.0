Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092671061B1F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 20:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDC510E7BB;
	Mon, 30 Mar 2026 20:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JyAUYRG6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E6F10E7BE
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774901656; x=1806437656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PS++JMwd7nRIYCg3ksEWyUf06ulduPpRHUpGUv9+jhI=;
 b=JyAUYRG6bqNLMFF/DWqDAbhtdPN2sDrkX8jVe0U7s7Lj9PlqEhMsr9Cc
 C+OcdgNZYSK+asNZ7s210duxoF10G/XECvqUP1rhRIkGP1kOP4NMVlk7h
 6fTDx3/t/qbECRugKgNEvNcl7SQU8bmLnBIWUjUVMngmIcwP7dOhLZiEq
 x0TD3CF2Td9N0q+QVjbpc4bdon23pyluFQSCaffLCPJ5bJp0SAKc11P+5
 4v6bPiQJogc6a3x1Q6CoFhZ9kb1GxpsDh5AnpcD5yAXvjGiloTiIrB3VI
 XQj8qc9ap6R8mVLAu+EIapoxopOYNyXWPj1xkvQM/UgB8G3fckqo44zI3 w==;
X-CSE-ConnectionGUID: 9paQ50hMQJSQWcqtkbzIjw==
X-CSE-MsgGUID: bzRdQVHZTe6dbg/ZOl4DWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86980771"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="86980771"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:14:16 -0700
X-CSE-ConnectionGUID: NbppxUkDTriRknw/F990sQ==
X-CSE-MsgGUID: BMMqmqzPTmeKyL1dH+UPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="222842803"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:14:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_oa: Extend enable-disable to read
 after disabling stream
Date: Mon, 30 Mar 2026 13:14:08 -0700
Message-ID: <20260330201408.28421-1-ashutosh.dixit@intel.com>
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

v2: s/igt_assert_eq(ret, sizeof(buf));/igt_assert_lt(0, ret);/

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 387f29535e..f0944c74b5 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2774,6 +2774,32 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
 	get_stream_status(stream_fd);
 	igt_assert_eq(ret, sizeof(buf));
 
+	/* Wait again for more reports */
+	pollfd.fd = stream_fd;
+	pollfd.events = POLLIN;
+	poll(&pollfd, 1, -1);
+	igt_assert(pollfd.revents & POLLIN);
+
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+	/*
+	 * Ensure some reports can be read even with disabled stream. These
+	 * can be less than WAIT_NUM_REPORTS, if pollin was left set in the
+	 * kernel after the previous read (since read buffer is small)
+	 */
+	while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 && errno == EINTR)
+		;
+	get_stream_status(stream_fd);
+	igt_assert_lt(0, ret);
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


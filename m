Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF792C44515
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 21:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B05E10F60B;
	Fri, 17 Jul 2026 21:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tocq8w+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A3210F606
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784322035; x=1815858035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=risF4LgRGAflYSw0/1n1RilbqobOehUF4uQ9iwLh6DQ=;
 b=Tocq8w+sI1rHChlThLI4Ya/Afkf1GzhiPQTDSevOmfvm5F6Vz/ouZt9Z
 08rzbrAOaC0My/3VubL9ij+6/kRQBdD2fHt+gKdV2lXcZu4GHeUPcVhmn
 5QiVRiB7clDTNT6pO4+XsprjCFE/x9+w9TJoS+CgJ16dw0WXh+DlgTSk9
 jkFS8+MaoIoe3gPob4OyJH0LEi1lbHLQ/1fIedzxtJPlxYsqpxLU71XoM
 GVNufv2OxzfMrN/PPA5AukoeK7j4wBqDu3eX8NZQJcVH7oiadzHf6wthn
 61j88Vz0XGKxxCa+MKn8zWim/fSBHkbSndMXFFOtBxqZaF05cXaiSjda8 A==;
X-CSE-ConnectionGUID: j1ljNQhxSZuYPMSUoMp4ug==
X-CSE-MsgGUID: xO0fJrVMTG+SOHOZZxVc4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84774461"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="84774461"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:34 -0700
X-CSE-ConnectionGUID: uG+/f9CzQL+Y2jUCtv7xmw==
X-CSE-MsgGUID: RPrwelTkQAOki7rRxvrFDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="261854708"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 3/4] tests/intel/xe_oa: Enable capture just prior to reading
 OA data
Date: Fri, 17 Jul 2026 14:00:31 -0700
Message-ID: <20260717210027.2008255-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
References: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
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

When running the test in a loop, sometimes the buffer overflow error was
seen with smaller buffer sizes. To make the non-zero-reason test more
robust, enable capture just before reading the data and surround the read with
the load helper calls.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 98f00d377a86..4f652b187bae 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2678,6 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
 		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size ?: buffer_fill_size
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -2705,16 +2706,16 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 	igt_assert(buf);
 
 	igt_debug("Ready to read about %u bytes\n", buf_size);
-
-	load_helper_init();
-	load_helper_run(HIGH);
-
 	if (!oa_buffer_size)
 		param.num_properties = param.num_properties - 1;
 
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
         set_fd_flags(stream_fd, O_CLOEXEC);
 
+	load_helper_init();
+	load_helper_run(HIGH);
+
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 	while (total_len < buf_size &&
 	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
 		(len == -1 && (errno == EINTR || errno == EIO)))) {
-- 
2.51.0


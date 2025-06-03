Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E084FC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C27D10E211;
	Tue,  3 Jun 2025 16:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GuJAIhT0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE8E10E211
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748967308; x=1780503308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C4vcV3r06ohpQLwf+4EPzxstatyJrrs1Kv2sHQTnNm0=;
 b=GuJAIhT0gsDX9pzBWpmRVYmJor5uzNFOKXV1+XUIQgxKsgrkevgW6FDZ
 CsQago3M6GwzNCHNe30AtP4H0xareBl6hp63n95cPVfX4hS8ggc+aBoLm
 9jeyHMDoL3W5+JdJAT9UN88glDXoVLuVkiolBvfN1Ms9vYllLzVUVMXJg
 Bk4ErqWJN2qKcmvopp+AlYsLv/My/aaYDA2CD2MboSjk0VMtOJwbopffp
 IgEb0Uyz8tOQsU9nrPnX4QdL9+qTUwSREeRspXdQlGFrQ4UJ8a1Hp6uRE
 cOaXJ1a2S1cWfziLctELrH3iiLOZs6G+QkK3TlwQsMUPmPNTqZ2+XX2R6 A==;
X-CSE-ConnectionGUID: uEQzMenMSQ6wP7iviIHzug==
X-CSE-MsgGUID: axV8bqzATPCvjW+PgXdfsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68569866"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68569866"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:15:08 -0700
X-CSE-ConnectionGUID: 6HcvFVAKTnSJ1tSDlgdp4Q==
X-CSE-MsgGUID: 51gymQwsQyO+xjES99/ULg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="144937702"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:15:06 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test if feature is not
 supported
Date: Tue,  3 Jun 2025 16:07:18 +0000
Message-Id: <20250603160718.1744538-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a helper to check for feature support. If feature isn't supported
skip the test.

Cc: Harish Chegondi <harish.chegondi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel/xe_eu_stall.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 411c30871..f3d7c1974 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -267,6 +267,31 @@ static void xe_eu_stall_ioctl_err(int fd, enum drm_xe_observation_op op, void *a
 	errno = 0;
 }
 
+static bool is_eu_stall_supported(int drm_fd)
+{
+	int stream_fd;
+	uint64_t properties[] = {
+		DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
+		DRM_XE_EU_STALL_PROP_SAMPLE_RATE, DEFAULT_SAMPLE_RATE,
+		DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
+	};
+
+	struct xe_eu_stall_open_prop props = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	stream_fd = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
+
+	if(stream_fd == -1 && errno == ENODEV) {
+		close(stream_fd);
+		return false;
+	}
+
+	close(stream_fd);
+	return true;
+}
+
 static uint64_t read_u64_file(const char *path)
 {
 	FILE *f;
@@ -654,6 +679,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		igt_require_fd(drm_fd);
 		devid = intel_get_drm_devid(drm_fd);
 		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
+		igt_require_f(is_eu_stall_supported(drm_fd), "EU stall sampling not supported\n");
 		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
 		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
 		if (output_file) {
-- 
2.34.1


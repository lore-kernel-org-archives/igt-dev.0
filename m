Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EF8EA3F2B
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 08:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ADE10E4FD;
	Tue, 10 Feb 2026 08:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COrOp4lZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2227E10E4FD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770713695; x=1802249695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JDV9EcA7GGg1zr7VHi9YZci6IW9BJMn3eRwjzGe7Eu0=;
 b=COrOp4lZlNYdeGjD69Xi4aW6f6t8waDjwaYf17ZGucq4uW20FxEF5LdN
 X5SrnvZN+L3hSjofusEBUhe4rsOgmpm8604aUXPqnwSQAbpeY8QUsnQXY
 v+YjKi9+5fb/ja3OZgvwBgX9zAkISk3zR1tWMI25XMfUeWAp13dVYqRka
 0y2ZVbMs7REkil38lvqLP1kzM7LpMf15UtsDzFJImYvwPu/cCSe3dYTqu
 JUz46W91CPH7IlYJbCoqeltZ5paqPsTU5DavmXs2vLNTTUg1GTT+vijcP
 01tDsODtbS3t/nuimFMXmE/pMdNQAVgnXnRXngm+FWgDYKPQ09xHWMDXP A==;
X-CSE-ConnectionGUID: MOJEDtpsSEav8G2MW+2ncw==
X-CSE-MsgGUID: Mb0jCfuPTSSgwRpAsBkyUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71937586"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71937586"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 00:54:50 -0800
X-CSE-ConnectionGUID: lJakRZXYRGmJnUKhZZlmxw==
X-CSE-MsgGUID: GSM17/m0TmWK3AG7lpQUpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211894064"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 00:54:48 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t] tests/kms_atomic: Read the error msg on atomic_ioctl
 failure
Date: Tue, 10 Feb 2026 14:23:33 +0530
Message-Id: <20260210085333.3250279-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250822065535.213451-1-arun.r.murthy@intel.com>
References: <20250822065535.213451-1-arun.r.murthy@intel.com>
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

On atomic_ioctl failure compare the failure flag with the expected
invalid reason and pass if same else fail the test.

The corresponding KMD changes are pushed for review @
https://patchwork.freedesktop.org/series/152276/

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/kms_atomic.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index fa321cc3c..a609a9f14 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1041,13 +1041,17 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 static void atomic_invalid_params(data_t *data, igt_output_t *output)
 {
 	struct drm_mode_atomic ioc;
+	struct drm_mode_atomic_err_code *err_code;
 	uint32_t obj_raw[16]; /* array of objects (sized by count_objs) */
 	uint32_t num_props_raw[16]; /* array of num props per obj (ditto) */
 	uint32_t props_raw[256]; /* array of props (sum of count_props) */
 	uint64_t values_raw[256]; /* array of values for properties (ditto) */
 	int i;
 
+	err_code = malloc(sizeof(struct drm_mode_atomic_err_code));
+	memset(err_code, 0, sizeof(struct drm_mode_atomic_err_code));
 	memset(&ioc, 0, sizeof(ioc));
+	ioc.reserved = (uintptr_t)err_code;
 
 	/* An empty request should do nothing. */
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
@@ -1076,14 +1080,18 @@ static void atomic_invalid_params(data_t *data, igt_output_t *output)
 	/* Nonsense flags. */
 	ioc.flags = 0xdeadbeef;
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	if (igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ERROR_REPORTING))
+		igt_assert_eq(err_code->failure_code, DRM_MODE_ATOMIC_INVALID_API_USAGE);
 
 	ioc.flags = 0;
 	/* Safety check that flags is reset properly. */
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Reserved/MBZ. */
-	ioc.reserved = 1;
-	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	if (!igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ERROR_REPORTING)) {
+		ioc.reserved = 1;
+		do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	}
 	ioc.reserved = 0;
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-- 
2.25.1


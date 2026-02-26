Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8800CFD4618
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 04:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E777510E0FF;
	Thu, 26 Feb 2026 04:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irn/7t/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A0410E0FF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 04:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772080110; x=1803616110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g71JmLgeLEP0qyJ1DoMHNEJBVXcLhuFnxVEMwO5/47c=;
 b=irn/7t/Y9GTsMSTR5t/4Jd5V6iZ48yFliDw2K/apbkYh2F5l+rzFgCw7
 g117f3tFvS65M2yG/mCMwFnld9wiOaBt8XnPeMMtxLN68XgkRKLEKWgH0
 wN2WIvXjqKuyV6KYzrE+rNV2xIL2FZ67DIe2yXftpS+FKidZB6T6ukmcI
 JrttXJe2rWZdjZ+k/ztfPVwrCipxhXyqnacdrGG4W1dASiPWw/seZRCOd
 JUfuIxdtX0rMJl8e7YQ6WuKmiLH6zWWpqQIR2ZFBtN8Z68QQn857g33Qw
 J7nSPXtUg4cCT1Oh6ZpFCV9Keo6t9OsIUV0FRbeUvH23tDM+aNCnPW82H w==;
X-CSE-ConnectionGUID: FCsAmVgnSom7bTqkWHpHFg==
X-CSE-MsgGUID: rbLsdMCRR0GuZ2guOKgCcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73202899"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73202899"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:30 -0800
X-CSE-ConnectionGUID: lYjTLDgYToq/hIXwIaqhaA==
X-CSE-MsgGUID: gIwDKmj4TrGZVieLaC+y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="221071163"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 20:28:28 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_rotation_crc: Add skip reason for invalid
 plane rotation
Date: Thu, 26 Feb 2026 09:52:58 +0530
Message-Id: <20260226042258.1824678-1-santhosh.reddy.guddati@intel.com>
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

The rotation tests skips with unrelated error no, when unsupported
rotation planes are  attempted. Fix this by adding the proper logging as
required.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_rotation_crc.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index cd0873b3b..286e90130 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -560,27 +560,39 @@ static bool test_format(data_t *data,
 	return true;
 }
 
-static bool plane_rotation_requirements(data_t *data, igt_plane_t *plane)
+static void plane_rotation_requirements(data_t *data, igt_plane_t *plane)
 {
-	if (!igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
-		return false;
+	if (!igt_plane_has_prop(plane, IGT_PLANE_ROTATION)) {
+		igt_skip("Skipping plane %s, no rotation property\n",
+			 kmstest_plane_type_name(plane->type));
+	}
 
-	if (!igt_plane_has_rotation(plane, data->rotation))
-		return false;
+	if (!igt_plane_has_rotation(plane, data->rotation)) {
+		igt_skip("Skipping plane %s: requested rotation %s is unsupported\n",
+			 kmstest_plane_type_name(plane->type),
+			 igt_plane_rotation_name(data->rotation)
+			 );
+	}
 
 	/* CHV can't rotate and reflect simultaneously */
 	if (!(!is_intel_device(data->gfx_fd) || !IS_CHERRYVIEW(data->devid) ||
-	    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X)))
-		return false;
+	    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X))) {
+		igt_skip("Skipping plane %s CHV does not support rotate-180 + reflect-x (%s)\n",
+			 kmstest_plane_type_name(plane->type),
+			 igt_plane_rotation_name(data->rotation));
+	}
 
 	/* Intel display version 20 onwards cannot do reflect-x with tile4 */
 	if (!(!is_intel_device(data->gfx_fd) ||
 	    intel_display_ver(data->devid) < 20 ||
 	    !(data->override_modifier == I915_FORMAT_MOD_4_TILED &&
-	    data->rotation & IGT_REFLECT_X)))
-		return false;
-
-	return true;
+	    data->rotation & IGT_REFLECT_X))) {
+		igt_skip("Skipping plane %s display version %d does not support reflect-x (%s) with modifier 0x%llx\n",
+			 kmstest_plane_type_name(plane->type),
+			 intel_display_ver(data->devid),
+			 igt_plane_rotation_name(data->rotation),
+			 (unsigned long long)data->override_modifier);
+	}
 }
 
 static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
@@ -651,7 +663,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		igt_output_set_crtc(output, crtc);
 
 		plane = igt_output_get_plane_type(output, plane_type);
-		igt_require(plane_rotation_requirements(data, plane));
+		plane_rotation_requirements(data, plane);
 
 		prepare_crtc(data, output,
 			     crtc,
-- 
2.34.1


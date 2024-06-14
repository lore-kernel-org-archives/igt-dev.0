Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3723C27C75
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 11:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE4710ED08;
	Fri, 14 Jun 2024 11:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FErFgQUw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2714710E24C
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718364811; x=1749900811;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vfbV6TZFsbCndUSpwfWBksEEXhB8uhvcs8QkifKxKdE=;
 b=FErFgQUwCuxGvArHw/InNonBgYOO9tu+iQDoDXWcDySfU91J6tQG1g73
 M0GYhPi+C1YUfvH5MarxFyQ4xXLTrmhJy2HBJ5W3QP8Ehc8CDZmjh1HDh
 9cbbCALRYsgs2lU9pKwtOoz9iJ3YCJBjYog/IdfiykuqYbu8eXexOaGy8
 vArjis5Mr3nw3g3ua4q+nm3ZbL3304JpmxO1xrGU0EFo/Bw6+RMfD6QFb
 11DW8ESBvQyh2TCKByBa3btT5Dg0KLnRUaMFd4c3/Q0thOyhX7MFzLhtc
 AqKStcHrU7muyhbRdMOGsYEP+XGLjzYJaSzxyBeiMyJJ8aZYoy1nLfWeB g==;
X-CSE-ConnectionGUID: Gd5Bo0y2Sxm0O3vpv6FbrA==
X-CSE-MsgGUID: ru85U31cQ8u21xKS9wqjSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15080228"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15080228"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 04:33:30 -0700
X-CSE-ConnectionGUID: B3vs/jJwQlyjROlA9XX5pA==
X-CSE-MsgGUID: AoqWYf2BRFisyu6e+FyGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="44845960"
Received: from mholzerl-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.251.214.25])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 04:33:29 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/i915_pm_rpm: warn and skip test if reading
 connector fails
Date: Fri, 14 Jun 2024 14:33:20 +0300
Message-Id: <20240614113320.197121-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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

Fail test requirements if we can't set the initial data.  This is
usually caused by not being able to retrieve a connector due to
possible race-conditions.  In this case, we have issued a warning to
cause the test to fail and not just skip.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Jani Saarinen <jani.saarinen@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/intel/i915_pm_rpm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index e0f395fa8a84..31758b1a5e35 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -506,7 +506,7 @@ static drmModePropertyBlobPtr get_connector_edid(drmModeConnectorPtr connector,
 	return blob;
 }
 
-static void init_mode_set_data(struct mode_set_data *data)
+static bool init_mode_set_data(struct mode_set_data *data)
 {
 	data->res = drmModeGetResources(drm_fd);
 	if (data->res) {
@@ -518,7 +518,7 @@ static void init_mode_set_data(struct mode_set_data *data)
 			if (!data->connectors[i]) {
 				igt_warn("Could not read connector %u\n",
 					 data->res->connectors[i]);
-				continue;
+				return false;
 			}
 
 			data->edids[i] = get_connector_edid(data->connectors[i], i);
@@ -529,6 +529,8 @@ static void init_mode_set_data(struct mode_set_data *data)
 	}
 
 	init_modeset_cached_params(&ms_data);
+
+	return true;
 }
 
 static void fini_mode_set_data(struct mode_set_data *data)
@@ -598,8 +600,15 @@ static bool setup_environment(bool display_enabled)
 
 	ms_data.devid = intel_get_drm_devid(drm_fd);
 
-	if (display_enabled)
-		init_mode_set_data(&ms_data);
+	/*
+	 * Fail test requirements if we can't set the initial data.
+	 * This is usually caused by not being able to retrieve a
+	 * connector due to possible race-conditions.  In this case,
+	 * we should have issued a warning to cause the test to fail
+	 * and not just skip.
+	 */
+	if (display_enabled && !init_mode_set_data(&ms_data))
+		return false;
 
 	igt_pm_enable_sata_link_power_management();
 
-- 
2.39.2


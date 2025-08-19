Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066EDCA0EEB
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 20:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B380110E672;
	Tue, 19 Aug 2025 20:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzjIsw+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AEB10E211
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755636069; x=1787172069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GAUuQkAvDnMvTzXZhGKXupEQqT8SAQ1OU/aNP+3sIZ4=;
 b=FzjIsw+/kSGbn465hELjoJOYQhVLT8T8Nk4Wjdizls7wlGTNb3U3T5Ub
 O9Hs5mapCyX8LU+RA8+V3NnXgbPNp+2i4sHUqCX4ZCgdE0U2CXDPctmbh
 Ef54PQa1pEXz+pSLbXI5gymPvB9W/CPjj8hFAe+R7D3N6wVM1nrmqKVjp
 1b4PMRs9JbmwYyndOGg7eEFzScqEyLWsLSmBqn2r3oceE/ppRatzlBaty
 lM4MpjllB/OIjo1Umpp2I78Ld0eNHudI4+0fSMBjyJLZHS/NV2gulx17R
 io8wCK33KWGDKKl4e+WbmBq+keBwZqM6eqgKG8PQNlN+bvF9waYk6dpj6 g==;
X-CSE-ConnectionGUID: KAdLjOX7SfGfeleKgWveeA==
X-CSE-MsgGUID: Wxtvsg06Q1OB1Yath1Fs8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57846806"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57846806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:08 -0700
X-CSE-ConnectionGUID: FA8dGrykQ/mMNl7PDy5CVA==
X-CSE-MsgGUID: TD+L20OjTgCyZT0CjfeulA==
X-ExtLoop1: 1
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_configfs: Reset all custom settings
 on exit
Date: Tue, 19 Aug 2025 13:40:43 -0700
Message-ID: <20250819-configfs-unbind-v1-4-8359e66e3241@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
References: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

When exit, make sure there's not device configfs settings, otherwise it
could impact tests running after this.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 8b2b8e3c4..a298c212a 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -26,7 +26,17 @@ static char bus_addr[NAME_MAX];
 
 static void restore(int sig)
 {
+	int configfs_fd;
+
 	igt_kmod_unbind("xe", bus_addr);
+
+	/* Drop all custom configfs settings from subtests */
+	configfs_fd = igt_configfs_open("xe");
+	if (configfs_fd >= 0)
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	close(configfs_fd);
+
+	/* Bind again a clean driver with no custom settings */
 	igt_kmod_bind("xe", bus_addr);
 }
 
@@ -164,7 +174,6 @@ igt_main
 		test_engines_allowed(configfs_device_fd);
 
 	igt_fixture {
-		igt_fs_remove_dir(configfs_fd, bus_addr);
 		close(configfs_device_fd);
 		close(configfs_fd);
 	}

-- 
2.50.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24550C3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 22:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857D10E6E0;
	Wed, 28 May 2025 22:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlTOeHtq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0F710E175
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 22:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469910; x=1780005910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U8sON3adDU12optCpA35MTmz8EVSqNR9AdT3O40wABo=;
 b=AlTOeHtqgNP2W+2NcOF9+A3ieBDgLfby50nFr2kSBuuDQLXNKiiU+FTA
 DOM+6ZgY8YvU14YHwng2vcwEEBEdEWBUl/UyJPP9Ex/G74O0vapAoQE6Q
 3m4ANeicfbDuWL6U1MM4HdDxVGVNknfxDgG9TwxV0r9/ZDrZVUUdVccfs
 ecdEByOYW8FgwGohyzLJJJuN6UGb2w/Vf4D2oqYPuJHGuKkYEravJI9+L
 GFsu14uqCRVuaO4TamooN3AJv2ecc2ks+oDN565ws9V3f8JNFF6uIXICT
 mre4G0mqyM0k8i5jkx+9fdZr4YHL10ccap0kHfHPaOqFDnm6utUnQiy2R A==;
X-CSE-ConnectionGUID: TZ8aAYjZSammOhExl5tNmQ==
X-CSE-MsgGUID: z5nuZsQpRqi6D8a6Yn+Jrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50670362"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50670362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:05:10 -0700
X-CSE-ConnectionGUID: yX5/A6cyTtidAv/4ZsihgA==
X-CSE-MsgGUID: NBP80sSOT9qtQmhht05XTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="147251897"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:05:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_configfs: Use openat to simplify
 check
Date: Wed, 28 May 2025 15:04:34 -0700
Message-ID: <20250528-engines-allowed-v1-1-d42708b3317e@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528-engines-allowed-v1-0-d42708b3317e@intel.com>
References: <20250528-engines-allowed-v1-0-d42708b3317e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-d9694
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

No need to create the path again. Just make sure there's such attribute
relative to the fd passed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index e5701b7d1..074cd04d9 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -43,16 +43,13 @@ static void set_survivability_mode(int configfs_device_fd, bool value)
  */
 static void test_survivability_mode(int configfs_device_fd)
 {
-	char path[PATH_MAX];
 	int fd;
 
 	/* Enable survivability mode */
 	set_survivability_mode(configfs_device_fd, true);
 
 	/* check presence of survivability mode sysfs */
-	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
-
-	fd = open(path, O_RDONLY);
+	fd = openat(configfs_device_fd, "survivability_mode", O_RDONLY);
 	igt_assert_f(fd >= 0, "Survivability mode not set\n");
 	close(fd);
 }

-- 
2.49.0


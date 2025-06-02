Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5E8C5B555
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 16:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175A110E569;
	Mon,  2 Jun 2025 16:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFrlVmyA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB5F10E568
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748881511; x=1780417511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U8sON3adDU12optCpA35MTmz8EVSqNR9AdT3O40wABo=;
 b=aFrlVmyAMYEdP9pUn0F64Aeou+GogdIz7j/R9kIZhJt9CgyJC5vldUAd
 fSw3dg0isuFV+T+F0eHIYibC+c12VMnpgE/dv4lAmqgR5f9mL4vHEwYub
 hhcIL9H6pzAmi9CasWJaMY8vmvO1SrPF9IwQspXl8W3t6tN7nLpI6C4UA
 ASJg8ixlTBumNwFVYL6mQtT//gp9rxl+x5598mrF+A3uI195KUWFCIP8C
 tykKMDyyULrrrVx6BILnVKrthW76CndQVkW20kgv4xcTBBV5clFbaQ4c1
 MGoEcGG2jaqmCYoiSiO3KccORZSRCgRdeE0CBTChbwkMGU9jFT2Ww0ubA Q==;
X-CSE-ConnectionGUID: F74MkFvyTFqfQG8Wb9qQjQ==
X-CSE-MsgGUID: 6r4ut684QM23M/vpDipZeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51042170"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="51042170"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:25:11 -0700
X-CSE-ConnectionGUID: DVyo9o93TeuBrHZJwg72Dw==
X-CSE-MsgGUID: BBtafioATPSqxVo8dunGYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="145527377"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:25:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_configfs: Use openat to simplify
 check
Date: Mon,  2 Jun 2025 09:24:44 -0700
Message-ID: <20250602-engines-allowed-v2-1-52bffe717766@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
References: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
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


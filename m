Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297A6CA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 20:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D949D10E67A;
	Tue, 19 Aug 2025 20:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQSr6aWN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3565810E672
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755636069; x=1787172069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YtjGw1aoVonbCJxb0KKfLzxBo9CDIfgF2xTekXgH+e4=;
 b=HQSr6aWNfmQg8W0KbJLfFOdNiDbMz8UuieJWKNFmRU37eIOAg5PL4I4u
 /5+O7gBsoX9jPA9hWGioNiFtQPx2PQK6b0HJ5qq+xaO5QZdAe9USv7iuE
 eY2GMA+2VnxglFkMS2+P1KSA1DGKYdulmp0UmQUkOoXsBhlF0LLy0xeIt
 FtOQLR75eD/4RXCshId8ITg8cOd8TGfOWQBegNO9jq4fbzuwECBly81mD
 EKaJbliRrOfhPl0qWvQfCGA1evIlL81ZDUdIFm+O6MFgf1R/E3+Dzbpgf
 HGbTLISy9+vG/VRb8VJn8bNf8ylug7QUqPE6/uxMCfzk46TBAUQv7cPh3 w==;
X-CSE-ConnectionGUID: RzBAUWwxQheM52O06y01XA==
X-CSE-MsgGUID: l12hQhMORAeQWGrsMym1gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57846803"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57846803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:08 -0700
X-CSE-ConnectionGUID: +t9Ru6jGRj+b3TgVEO7Yfw==
X-CSE-MsgGUID: 4EqzTYoORBWTCC+cSz3XiA==
X-ExtLoop1: 1
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/xe_configfs: Do not execute with open fd
Date: Tue, 19 Aug 2025 13:40:40 -0700
Message-ID: <20250819-configfs-unbind-v1-1-8359e66e3241@intel.com>
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

The survivability_mode test does an unbind/set-configfs/bind sequence.
If and fd is open, that will still refer to the old instance of the
driver and is a dangling fd. Close it right when it's not needed anymore
as in future other tests will also unbind/bind.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 5c65cd01d..f01b13e13 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -101,15 +101,19 @@ static void test_engines_allowed(int configfs_device_fd)
 	}
 }
 
-static int create_device_configfs_group(int configfs_fd, int fd)
+static void set_bus_addr(int fd)
 {
-	int configfs_device_fd;
 	struct pci_device *pci_dev;
-	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
 
 	pci_dev = igt_device_get_pci_device(fd);
 	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
 		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+}
+
+static int create_device_configfs_group(int configfs_fd)
+{
+	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
+	int configfs_device_fd;
 
 	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
 	igt_assert(configfs_device_fd);
@@ -120,17 +124,22 @@ static int create_device_configfs_group(int configfs_fd, int fd)
 igt_main
 {
 	int fd, configfs_fd, configfs_device_fd;
+	uint32_t devid;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		devid = intel_get_drm_devid(fd);
+		set_bus_addr(fd);
+		close(fd);
+
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
-		configfs_device_fd = create_device_configfs_group(configfs_fd, fd);
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 	}
 
 	igt_describe("Validate survivability mode");
 	igt_subtest("survivability-mode") {
-		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
+		igt_require(IS_BATTLEMAGE(devid));
 		igt_install_exit_handler(restore);
 		test_survivability_mode(configfs_device_fd);
 	}
@@ -151,6 +160,5 @@ igt_main
 		igt_fs_remove_dir(configfs_fd, bus_addr);
 		close(configfs_device_fd);
 		close(configfs_fd);
-		close(fd);
 	}
 }

-- 
2.50.1


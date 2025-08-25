Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBC5CA0FED
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 16:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7964310E4F5;
	Mon, 25 Aug 2025 16:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQG5rFHs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9342110E4FB
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756137605; x=1787673605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=61+3SDnzXIxbBu0fE5SuAujp8GAObcY89YlK3ld38mA=;
 b=LQG5rFHsekq2cj78hSe7UjZKRYRgeaThlgQegBUCKbW34xKtuCQPa0cc
 Had25fYN16lSDuseFH2laG/aaLrMw0QOUnFmO7lKeWDohLZrUyFdhLJL5
 fvG6E2Pyf3pVLM+w6WXwCbphXFJWMoqX/2wPjgjzl1j/uRUUntADal6Cf
 zdlCS5PjIwaJcM0HMsa6Xt4WPl5QLhJA4P3aG4vYE+bNWX1mldeqUr2Zk
 OfSXtLrVlWiG4rA40jTG/yrFeFk/KVVYWUIO8/Td4fGat5HW3Nw9YfVYB
 agY6gtn8MgoGWGdOlTEmIFnQtC1a2w+cQowjJlpTqfoBFSMAkTfA74m0W Q==;
X-CSE-ConnectionGUID: B0cKWVuxT2CD6Er5+MLQQw==
X-CSE-MsgGUID: ZjF87mWtR0iUaIY8QrF9vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68948330"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68948330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:04 -0700
X-CSE-ConnectionGUID: 03w7VkXQSZyUfQHO3GLStA==
X-CSE-MsgGUID: t0eRoG9wQ5O+bLP8z7/EyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168578240"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t v2 1/4] tests/intel/xe_configfs: Do not execute with
 open fd
Date: Mon, 25 Aug 2025 08:59:43 -0700
Message-ID: <20250825-configfs-unbind-v2-1-62e7508d3ed7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
References: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
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

While moving this code around, also make sure to use drm_close_driver()
so the fd is dropped from the cache.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
- Use drm_close_driver()  (Kamil)
---
 tests/intel/xe_configfs.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 5c65cd01d..57f770b0b 100644
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
+		drm_close_driver(fd);
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


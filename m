Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67E606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nKFnaTNV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236B61129D6;
	Fri, 27 Nov 2026 10:26:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86FA1129E1
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 10:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795775099; x=1827311099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nxTjXnLzHU57+5dfroer5eu2LwT/HyPd53jB01VrBd8=;
 b=nKFnaTNVzss/WUprRMgDQT6xb5MZ2TweIBSFWzINJAOfgB7aohbVegtU
 l88u31Lsz8dG8A6TSq/AKMpjgp1tw1SBhKS9bT74RyZESbxB4MnbpOJIS
 jyQJFLkpln4oXSoTeI/dgCBGtJUFtZHGqKRxFXkhyK0CJtJvxWz4nZBsM
 /k3CvsDj6x8sJVAA6GFGKGi+01aS/cDQATnSamws14Cq459xc6e6NVLCI
 HY584hnnynFrz4Uttf9ha55KCpq11mwuVC2dMc8VenNBqFm3ZcjXKngwk
 +g+UkEVZE68mKoT8tRZMNGU3RYvZBWN+zmoOEhKQylTENoWYvYUKHFL4M Q==;
X-CSE-ConnectionGUID: bJIyRcSVTcasdVwCKcp8sQ==
X-CSE-MsgGUID: sccdQdxgRLu0SV5GzP/iqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4587276"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4587276"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:24:59 -0800
X-CSE-ConnectionGUID: e+yLf8VpTCq/uupbLOefsA==
X-CSE-MsgGUID: LMETfqOPSG6XxZWJMBxCXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12884216"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:24:55 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com, sk.anirban@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_survivability: Avoid leaking
 configfs device groups
Date: Fri, 27 Nov 2026 15:54:41 +0530
Message-ID: <20261127102438.2249575-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127102438.2249575-4-soham.purkait@intel.com>
References: <20261127102438.2249575-4-soham.purkait@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reuse pre-existing groups without removing them, and clean up
test-created groups and fds in the survivability tests.

v1:
 - Split the patch. (Anirban)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_survivability.c | 37 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 6d5423be7..476802851 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -40,7 +40,8 @@
 
 static char bus_addr[NAME_MAX];
 static char *snd_driver;
-
+static int configfs_fd = -1;
+static int active_configfs_device_fd = -1;
 static bool configfs_group_preexisting;
 
 static void ignore_wedged_in_dmesg(void)
@@ -157,17 +158,28 @@ static int find_i2c_adapter(struct pci_device *pci_xe)
 	return i2c_adapter;
 }
 
+static void close_configfs_group(void)
+{
+	if (active_configfs_device_fd < 0)
+		return;
+
+	igt_configfs_close_device_group(configfs_fd, bus_addr, active_configfs_device_fd,
+					configfs_group_preexisting);
+	active_configfs_device_fd = -1;
+	configfs_group_preexisting = false;
+}
+
 static void restore(int sig)
 {
-	int configfs_fd;
 
 	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
-	configfs_fd = igt_configfs_open("xe");
-	if (configfs_fd >= 0 && !configfs_group_preexisting)
-		igt_fs_remove_dir(configfs_fd, bus_addr);
-	close(configfs_fd);
+	close_configfs_group();
+	if (configfs_fd >= 0) {
+		close(configfs_fd);
+		configfs_fd = -1;
+	}
 
 	igt_kmod_bind("xe", bus_addr);
 
@@ -215,7 +227,7 @@ static void test_spinner_after_recovery(int fd)
 
 int igt_main()
 {
-	int fd, configfs_fd, configfs_device_fd;
+	int fd;
 	struct pci_device *pci_xe;
 	bool vf_device;
 
@@ -228,14 +240,15 @@ int igt_main()
 		igt_device_get_pci_slot_name(fd, bus_addr);
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		active_configfs_device_fd =
+			igt_configfs_create_device_group(configfs_fd, bus_addr,
+							 &configfs_group_preexisting);
 		igt_install_exit_handler(restore);
 	}
 
 	igt_describe("Validate i2c adapter functionality in survivability mode");
 	igt_subtest("i2c-functionality") {
-		test_i2c_functionality(configfs_device_fd, pci_xe);
+		test_i2c_functionality(active_configfs_device_fd, pci_xe);
 		drm_close_driver(fd);
 		fd = drm_open_driver(DRIVER_XE);
 	}
@@ -266,9 +279,9 @@ int igt_main()
 	}
 
 	igt_fixture() {
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 		close(configfs_fd);
+		configfs_fd = -1;
 		drm_close_driver(fd);
 	}
 }
-- 
2.43.0


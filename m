Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12C7D6553E
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 18:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BC610E993;
	Tue, 26 Nov 2024 18:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDkhe5ys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1743010E992
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732644668; x=1764180668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AOPhiai56DJRQv6+1nnG0/p6Cl7+z/eJenAT7ypw6hU=;
 b=jDkhe5ys1pARqfN6irxq7T1uWg3zKWikNbxVlLRVOJdMvbe0KHVMapsU
 uzeHwHbKN62/VUeyE7S/Y/iQI+YP/pQAaeszk4lIY5sBjyvbSolCgRDKG
 EFpwiXXj7hMcGNtI28XGkBr2ShH8C8OQ0idr8NBqOWJdv5k6ydub90AzF
 mS6twNDF5sOuQXNzO4kKQMDzk9YyUCnXKl9U2vZJvNj/SGdsf2+wU5K4o
 E4pNb3/Ea3W8GTI+kOqf38onEvGs9KBFZpbrjhYxjeG/ZCNjCq8EOv2iL
 hklTUE6SSXugWetqZQ0c2qEpvox+TmSYOv1kf8h3zDmBbP9MZUy6+OMH4 Q==;
X-CSE-ConnectionGUID: hVPSD+GtS5Cjr4C4KXJdlA==
X-CSE-MsgGUID: bgurQGPFSK+Q9B1dZZPAlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32952200"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32952200"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:11:08 -0800
X-CSE-ConnectionGUID: bESYHWBiRRa0HOGeJNGU7A==
X-CSE-MsgGUID: 0Ui4Ys/kQtiVtl4FrE1lZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91583249"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:11:07 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 4/4] lib/igt_sysfs: improve xe sysfs checks
Date: Tue, 26 Nov 2024 19:10:23 +0100
Message-Id: <20241126181024.1398259-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
References: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
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

Improve check for Xe sysfs failed open. While at this, make sure
it will not be closed just before unbind and also use drmtest
close function, as it will properly call xe_device_put().

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_sysfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index e903a9857..850ca21b4 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1447,7 +1447,7 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 	int sysfs;
 
 	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
-	igt_assert(sysfs);
+	igt_assert_f(sysfs != -1, "Sysfs open failed, errno=%d\n", errno);
 	__drm_invalidate_opened_fds();
 
 	switch(action) {
@@ -1470,7 +1470,8 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 		 * We need to close the client for a proper release, before
 		 * binding back again.
 		 */
-		close(xe_device);
+		igt_assert_neq(xe_device, sysfs);
+		drm_close_driver(xe_device);
 
 		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
 		close(sysfs);
-- 
2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A84C47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 20:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A88810E8AA;
	Tue, 23 Jan 2024 20:15:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C2C10E8AA
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706040956; x=1737576956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZJ+9biZKbRmmgXcyxc5V/5bYAIw5lQKXJO9y1QoynHg=;
 b=OHK4zuxH3jCa3YwDUzY3vTyYihpWvdw5BkzwCmm3TTfQfj/3wo17J7u8
 iADBK4A9ebwVrCcQW2OsipsOWNzQAPFn9v16iaIWUOL1HgmT2kr2aDduq
 RIsA1K0FeqViUQpL53Mr9NT0cLtWhofOTexLZms+DRvf5o9yQy4xFJKw8
 49ab58yI+WksSB/gY+zi2P2Dj8Z2uNg5ILk+xRFXMb/6CrEpOWH3JEhw6
 dOTKsUJVfI32TOTqX/Xsa2vm+1Qug7S1IFS8rzqcyGhL9AsX4is2AHXon
 ORov7QFmfCf5luHZ5IHG8kIRF7OYUF7Rfd6w9uwXe7aNCS0iDTNr0bfuX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8755418"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8755418"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:15:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1662989"
Received: from unknown (HELO localhost) ([10.246.3.60])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:15:52 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v1 2/8] lib/drmtest: Introduced drm_open_driver_another
Date: Tue, 23 Jan 2024 21:15:29 +0100
Message-ID: <20240123201535.108793-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
References: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Introduced drm_open_driver_another as a wrapper for
__drm_open_driver_another with successful open assert.

v2: rebased (Kamil)

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 19 +++++++++++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 52b5a2020..73d9159af 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -563,6 +563,25 @@ int __drm_open_driver_another(int idx, int chipset)
 	return fd;
 }
 
+/*
+ * drm_open_driver_another
+ * @idx: index of the device you are opening
+ * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
+ *
+ * A wrapper for __drm_open_driver with successful open assert.
+ *
+ * Returns:
+ * An open DRM fd
+ */
+int drm_open_driver_another(int idx, int chipset)
+{
+	int fd = __drm_open_driver_another(idx, chipset);
+
+	igt_assert_fd(fd);
+
+	return fd;
+}
+
 /**
  * __drm_open_driver:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 6bc819734..856208c48 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -101,6 +101,7 @@ void __set_forced_driver(const char *name);
 
 int __drm_open_device(const char *name, unsigned int chipset);
 void drm_load_module(unsigned int chipset);
+int drm_open_driver_another(int idx, int chipset);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
-- 
2.42.0


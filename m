Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580DCC47DDB
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jan 2024 17:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AF710FC91;
	Fri, 26 Jan 2024 17:32:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2349C10E28E
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706290327; x=1737826327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZJ+9biZKbRmmgXcyxc5V/5bYAIw5lQKXJO9y1QoynHg=;
 b=iLUs0oFfXwmvWOT5rF5cO9yoC93ChH4PD5S52e1VW510dhH5BbIQjNPH
 vS/U/IllavGKLDOSSgUKkbZ0I1B7GnzB14AhV+BLcu5pzJQ53PcOA4lLY
 gJQUIHGO3rRbDgd4RJIXYH3+9w6eOdYRAf6usfqpItsdcSymntdgdaKTS
 guAI3ePbATvCrpv9ByPmaxzXWtOkbvFlSE4PWTi/gtBxTA1iXg+DKNthQ
 7hY2NRn8k51QH28jdpSi1tllb9FN2jSu0Uy7U8BfrZO4EqRrXJZIez6iB
 lh4BIUIThOKpcCQxdc2uSfREQQeeXqh0OkoNztuJRC5Fk5egRCwjHIMku A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="433681563"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="433681563"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821199748"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821199748"
Received: from unknown (HELO localhost) ([10.246.28.205])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:32:01 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 2/8] lib/drmtest: Introduced drm_open_driver_another
Date: Fri, 26 Jan 2024 18:31:42 +0100
Message-ID: <20240126173148.63246-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240126173148.63246-1-kamil.konieczny@linux.intel.com>
References: <20240126173148.63246-1-kamil.konieczny@linux.intel.com>
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


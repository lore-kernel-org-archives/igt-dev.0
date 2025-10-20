Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB3BCCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 16:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7073F10E47E;
	Mon, 20 Oct 2025 16:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXwDlYGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4DD10E47E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760977136; x=1792513136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G6QEhF49b3snZ/ssWi6b/d7q2A5vYSguePU/KT0768Y=;
 b=bXwDlYGkd27ONuosh8DKr45LHHHtcB3GW/wm3HMlScDovUGtgEJyrBBz
 pqRUwUELQHkFH/p/nce3oAK+Zq8Py+0NQbA6COBGx0J1wEsG/gmE/2Gp3
 DKBwwX8hsFNuFpTRYcltoCYtoU0y3hh4pyWD/AYiH7KW1J4uZf5q7B4N6
 iC/oixmIa1x7x+bvpEHNyam/BbwcKYfglKiTyVAlYKHkAxvlvn2krJQvT
 WuBCZkTyPNP/RtgNVxnj/rH56BAJmibJhU4eiGvJMUNILp+hA77HobD9J
 9Js/fadUQ5mZ32UWBgsYz8CK7NzfhUkYkEzmJQxN8U3zuTw4zoqCKwIsB w==;
X-CSE-ConnectionGUID: AWArhbbqRV+ZMvOoUpmBiw==
X-CSE-MsgGUID: NxchikM+TCiw43a6WSKiXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62127084"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62127084"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:18:56 -0700
X-CSE-ConnectionGUID: 3jHmhVyEQFGWMPHT9M+SmQ==
X-CSE-MsgGUID: PxnUGDHhQG693zSdQRGt+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182511084"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:18:55 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/3] lib/drmtest: Add raw card|render opening
Date: Mon, 20 Oct 2025 18:18:44 +0200
Message-ID: <20251020161846.156952-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251020161846.156952-1-kamil.konieczny@linux.intel.com>
References: <20251020161846.156952-1-kamil.konieczny@linux.intel.com>
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

Add two functions for opening dri card or render, without any
driver loading nor caching. This is using starting index from
zero and will return -EINVAL when index is out of bounds.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/drmtest.h |  2 ++
 2 files changed, 76 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index a1fb0b5ba..ede9f07fd 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -313,6 +313,80 @@ static void log_opened_device_path(const char *device_path)
 	igt_info("Opened device: %s\n", item->path);
 }
 
+/**
+ * __drm_open_raw:
+ * @name: DRM node name
+ *
+ * Open a drm legacy device node with given @name.
+ *
+ * Returns: DRM file descriptor or -1 on error
+ */
+static int __drm_open_raw(const char *name)
+{
+	char dev_name[32] = "";
+	int fd;
+
+	fd = open(name, O_RDWR);
+	if (fd == -1)
+		return -1;
+
+	if (__get_drm_device_name(fd, dev_name, sizeof(dev_name) - 1) == -1)
+		goto err;
+
+	log_opened_device_path(name);
+	return fd;
+
+err:
+	close(fd);
+	return -1;
+}
+
+/**
+ * __drm_open_dri_render:
+ * @idx: idx for a render, starting from 0
+ *
+ * Open a drm legacy device render node with given @idx, starting from 0.
+ *
+ * This ignores all IGT environment var settings, for example IGT_FORCE_DRIVER.
+ *
+ * Returns: on success DRM file descriptor.
+ * On failure -1 for non existing render or -EINVAL for @idx out of bounds.
+ */
+int __drm_open_dri_render(const int idx)
+{
+	char dri_name[64];
+
+	if (idx < 0 || idx > 127)
+		return -EINVAL;
+
+	snprintf(dri_name, sizeof(dri_name), "/dev/dri/renderD%d", 128 + idx);
+
+	return __drm_open_raw(dri_name);
+}
+
+/**
+ * __drm_open_dri_card:
+ * @id: idx for a card
+ *
+ * Open a drm legacy device render node with given @idx.
+ *
+ * This ignores all IGT environment var settings, for example IGT_FORCE_DRIVER.
+ *
+ * Returns: on success DRM file descriptor
+ * On failure -1 for non existing render or -EINVAL for @idx out of bounds
+ */
+int __drm_open_dri_card(const int idx)
+{
+	char dri_name[64];
+
+	if (idx < 0 || idx > 127)
+		return -EINVAL;
+
+	snprintf(dri_name, sizeof(dri_name), "/dev/dri/card%d", idx);
+
+	return __drm_open_raw(dri_name);
+}
+
 /**
  * __drm_open_device:
  * @name: DRM node name
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 8416aa491..d0ba93b01 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -116,6 +116,8 @@ unsigned int drm_get_chipset(int fd);
  */
 #define IS_ALIGNED(v, a)	(((v) & ((typeof(v))(a) - 1)) == 0)
 
+int __drm_open_dri_card(const int idx);
+int __drm_open_dri_render(const int idx);
 int __drm_open_device(const char *name, unsigned int chipset);
 void drm_load_module(unsigned int chipset);
 int drm_open_driver_another(int idx, int chipset);
-- 
2.51.1


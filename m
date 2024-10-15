Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0F2D1814B
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 14:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDA210E598;
	Tue, 15 Oct 2024 14:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtjRuI6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A48C10E06C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729001976; x=1760537976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N471uIFM7Wx0csF5kvXKxSHo9nXIdY87IatBTj1WFwo=;
 b=VtjRuI6zfTkij9kdIwlT3T4huMOES4f1ACTwMLgWgepnw78rEXVkCenA
 +fZy9izMd3zVBeVfKWrd/xXevXchGrSkNhQMNRSSDb+oTV0l/kGr6xk85
 7hg6pO6seG1hvyfiP3TuU0NTXQFDe8BXH9m4c3xybbQckJOPgiiDfG99L
 jUqPfCzwB5w1V4jL9Mb9t8F/a0ljxAeJhYJvNQBkjWAGFcBRYoc4C4mMr
 PFHfwn2SrK4z2qcR+pE0W1hzqeRY2i6wy2ZoBbmjfR0PsGvH2dKLKAP3x
 C6tH4bfomUaZfsfTFxeuSg1jkejOAU6f9wQXEl6cwv5w3M4jl9cYe5+KQ A==;
X-CSE-ConnectionGUID: ONN31ws1T9Kvea0wNJUI1A==
X-CSE-MsgGUID: tARqjnU0QgSHZnn6rv0XAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45872735"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="45872735"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:19:35 -0700
X-CSE-ConnectionGUID: hTwVZR8cSvWIiEDmkSUExg==
X-CSE-MsgGUID: W05Mm7lURo2WSn6KATiAIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="108642486"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2024 07:19:33 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com, katarzyna.piecielska@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe/xe_query: xe_find_engine_by_class helper
Date: Tue, 15 Oct 2024 19:48:25 +0530
Message-Id: <20241015141826.4186247-2-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015141826.4186247-1-pravalika.gurram@intel.com>
References: <20241015141826.4186247-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Oct 2024 14:49:27 +0000
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

Added "xe_find_engine_by_class" helper function
to query with the required engine class
and get the engine info.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 lib/xe/xe_query.c | 22 ++++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 8694fa3f9..ddb9d4065 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -731,6 +731,28 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
 	return false;
 }
 
+/**
+ * xe_find_engine_by_class
+ * @fd: xe device fd
+ * @engine_class: engine class
+ *
+ * Returns engine info of xe device @fd and @engine_class otherwise NULL.
+ */
+struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	igt_assert(engine_class >= 0 && engine_class < xe_dev->engines->num_engines);
+	for (int i = 0; i < xe_dev->engines->num_engines; i++)
+		if (xe_dev->engines->engines[i].instance.engine_class == engine_class)
+			return &xe_dev->engines->engines[i];
+
+	return NULL;
+
+}
 /**
  * xe_has_media_gt:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index fd1155f7f..cabb8078c 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -108,6 +108,7 @@ uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
+struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
 bool xe_is_media_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
-- 
2.34.1


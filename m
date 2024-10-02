Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60136CF31B6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 11:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F9710E169;
	Wed,  2 Oct 2024 11:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HESECH/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212F10E169
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727868575; x=1759404575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wuRwOzXFXgrqgIzi5eq3uE3Ra+IA02dEi2J7L+KAvAw=;
 b=HESECH/exNDaSsSsuMbUVpxKEo1SzBKFQfBNozySxQH/bhLyGnbrGnWA
 EKkk/RB2ME9fhpGD0Kw4kQmPigX+dfNmKkSJhF7Vq/zzQpubzry78cWWA
 bwinUX+GIkD1B1FQzKoT4pDrP7r6CtIMeBa5VPiXWsDYI8qnS98av+iQA
 wXXmp2R7C8g9ME0BmhZFJvZNe1JbCPPfbMyyI5ztRnYcGpmTez3Xmq8Or
 9JrCm2oZh1LSnbJUfQkj9UuvBbeBMfDocgtcK5CjxZKsRMSZcXAOLhIox
 +Z5mtnPZF2c1zb2yTvQr/mA7uC2z1bWUJosspoByyUoP6LuqUBodtAcVS A==;
X-CSE-ConnectionGUID: tKboTZjrQy+WrGwZb4tT+A==
X-CSE-MsgGUID: /Gu6jz3aTOe4bDBgzaNE3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27160604"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27160604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:29:35 -0700
X-CSE-ConnectionGUID: zNx08ZN4SumVHp/BaMWs0A==
X-CSE-MsgGUID: rZoOm57QQSSARft+uICLjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="104764498"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:29:32 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class property
 helpers
Date: Wed,  2 Oct 2024 13:29:13 +0200
Message-Id: <20241002112914.5556-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
References: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
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

Introduce the following engine_class helpers:
 - xe_sysfs_engine_class_get_property
   Convenience wrapper to get value of given property for given engine
   class on given gt.
 - xe_sysfs_engine_class_set_property
   Convenience wrapper to set given property for given engine class on
   given gt to given value.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/igt_sysfs.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  5 +++
 2 files changed, 90 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index aec0bb53d..8fe6d7ede 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1360,3 +1360,88 @@ int xe_sysfs_get_num_tiles(int xe_device)
 
 	return num_tiles;
 }
+
+/**
+ * xe_sysfs_engine_class_get_property
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @class: engine class
+ * @property: property of engine class to retrieve
+ * @value: pointer for storing read value
+ *
+ * Convenience wrapper to get value of given property for given engine class on given gt.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
+					uint32_t *value)
+{
+	int engines_fd;
+
+	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
+
+	if (engines_fd == -1) {
+		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
+
+		return false;
+	}
+
+	if (!__igt_sysfs_get_u32(engines_fd, property, value)) {
+		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
+			  xe_engine_class_to_str(class), gt);
+		close(engines_fd);
+
+		return false;
+	}
+
+	close(engines_fd);
+
+	return true;
+}
+
+/**
+ * xe_sysfs_engine_class_set_property
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @class: engine class
+ * @property: property of engine class to be modified
+ * @new_value: value to be set
+ * @old_value: pointer for storing old value, can be NULL
+ *
+ * Convenience wrapper to set given property for given engine class on given gt to given value.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
+					uint32_t new_value, uint32_t *old_value)
+{
+	int engines_fd;
+
+	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
+
+	if (engines_fd == -1) {
+		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
+
+		return false;
+	}
+
+	if (old_value && !__igt_sysfs_get_u32(engines_fd, property, old_value)) {
+		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
+			  xe_engine_class_to_str(class), gt);
+		close(engines_fd);
+
+		return false;
+	}
+
+	if (!__igt_sysfs_set_u32(engines_fd, property, new_value)) {
+		igt_debug("Failed to write %s property of %s on gt%d.\n", property,
+			  xe_engine_class_to_str(class), gt);
+		close(engines_fd);
+
+		return false;
+	}
+
+	close(engines_fd);
+
+	return true;
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 2a1e3b1bf..3cede07f9 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -175,4 +175,9 @@ int xe_sysfs_get_num_tiles(int xe_device);
 char *xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen);
 int xe_sysfs_engine_open(int xe_device, int gt, int class);
 
+bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
+					uint32_t *value);
+bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
+					uint32_t new_value, uint32_t *old_value);
+
 #endif /* __IGT_SYSFS_H__ */
-- 
2.34.1


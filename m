Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDA8CEDD85
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 11:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4B010E163;
	Wed,  9 Oct 2024 11:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXLlegoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAA410E163
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728473433; x=1760009433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ud1l8AaamyM15HoW3y5B7YPoCLxswULsThl683GxOE=;
 b=XXLlegoSwEn56kBRQ4zVhFMn38RQJW317G4nr44HjBQwBWstMKNYJLhP
 w4d0JKZuQEd9T9NgQyl/Puuzp8utbUiV06Lg8YPHPBTA7O/roSnJiWsT5
 h1crwhwNdIwZEQL46MigKgTPkrG9dBlv9mg+fqoTw1TNsA50QIcWucvxB
 pK3OrTq3C0RC7pRldryES2hJLE/qyFpGp2tdWD/Pf4mDmKBCHh3V3ZSKV
 8/6OvKBY9+wAvflvAJZxDHPl0Ff0YbnvPp25ny9VPLT4H/sVNigElOcbV
 DHD8Ybai/6c6GguW1N7hcMrdWElEfeByQ2k+z5opzTRB29Aeg9zO5kqPr Q==;
X-CSE-ConnectionGUID: 4q+8Sra6Tf2rlqW0bFD9Pg==
X-CSE-MsgGUID: 8QJxXl4JToGjoAlP6g+Lww==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45286183"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="45286183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:33 -0700
X-CSE-ConnectionGUID: FtesljCqTHmO428rEWvprw==
X-CSE-MsgGUID: +ChMh4V6T0KP/8E4Fn9iJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="113699865"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.16.246])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:29 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 1/6] lib/igt_sriov_device: add helper for opening SR-IOV
 device sysfs
Date: Wed,  9 Oct 2024 13:30:13 +0200
Message-Id: <20241009113018.741371-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
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

Helper allows to open sysfs directory corresponding to SR-IOV device.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 lib/igt_sriov_device.c | 32 ++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 7c3814bf2..d20c74823 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -5,6 +5,7 @@
 
 #include <dirent.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <limits.h>
 #include <pciaccess.h>
 
@@ -381,3 +382,34 @@ void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num)
 {
 	igt_assert(__igt_sriov_bind_vf_drm_driver(pf, vf_num, false));
 }
+
+/**
+ * igt_sriov_device_sysfs_open:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based to identify single VF) or 0 for PF
+ *
+ * Open the sysfs directory corresponding to SR-IOV device.
+ *
+ * Returns:
+ * The SR-IOV device sysfs directory fd, -1 on failure.
+ */
+int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num)
+{
+	char path[PATH_MAX];
+	int sysfs, fd;
+
+	sysfs = igt_sysfs_open(pf);
+	if (sysfs < 0)
+		return -1;
+
+	if (!vf_num)
+		snprintf(path, sizeof(path), "device");
+	else
+		/* vf_num is 1-based, but virtfn is 0-based */
+		snprintf(path, sizeof(path), "device/virtfn%u", vf_num - 1);
+
+	fd = openat(sysfs, path, O_DIRECTORY | O_RDONLY);
+	close(sysfs);
+
+	return fd;
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 20ffc515f..dc95a4c78 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -30,6 +30,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
 bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
 void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num);
 void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
+int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
 
 /**
  * for_each_sriov_vf - Helper for running code on each VF
-- 
2.31.1


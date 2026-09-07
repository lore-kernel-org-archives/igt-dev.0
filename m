Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FF9C79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 14:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACBC8905A;
	Mon,  7 Sep 2026 14:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XALmT6ef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC45C10E851
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 14:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788790154; x=1820326154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+MzMGeVtq07pqV8HygNkpsUqK/nbk2jxTpGQicdmzXo=;
 b=XALmT6efop27Jwm7HF0qiHI3yWQIlJWV7ygNRKOTTBdayGLt22GtG3CI
 YkP7qjawI0uOQp3ycESn4GX/y/Dp56ywth7o4NMgfMSzmUgPg3j3cohka
 EIaaL6kBcSKsLuEnKl3qMHHFRshbEad3z7+zD6U/1gA4VTJu2Ttqr40RA
 L+rs08OB5krogBKcKH5oaveyZguJJT2saQQ11Ol5ZfJ03z8xqNAnWST1V
 /oIjIg6dvNsz6Z2QsMlEritj/8xzx6oq0A62xzeISvlOQRAWlvnODRlwG
 W2Q6a9OmeS/GyEJZ7Ud8GxQrgh1gYW8flICdd93znKbeYFDZO5HuQycAu g==;
X-CSE-ConnectionGUID: 6/qht7ZvSeeyRGCXeKUc6w==
X-CSE-MsgGUID: yAWQFDFbRKqC2obQ+9ms+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100355098"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100355098"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:09:14 -0700
X-CSE-ConnectionGUID: 8xoxDLPISjCLJ7IYKi5IeQ==
X-CSE-MsgGUID: QtaVkXtOTDK1gS8HrW5RfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274522316"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 07:09:12 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 3/7] lib/igt_pm: Factor out power attribute path
 construction
Date: Mon,  7 Sep 2026 19:52:55 +0530
Message-ID: <20260907142259.750528-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907142259.750528-1-pranay.samala@intel.com>
References: <20260907142259.750528-1-pranay.samala@intel.com>
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

igt_pm_get_power_attr_fd() and igt_pm_get_power_attr_fd_rdonly() build the
same sysfs path with the same snprintf(). The only difference is the open()
flags.

Move the shared part into __igt_pm_get_power_attr_fd(), which takes the
flags and returns -1 instead of asserting.

Nothing changes for existing callers. Both wrappers still assert, so they
behave exactly as before.

The point of the change is the -1. Not every power attribute exists on
every device, so later callers need to ask whether one is present and get
an answer back rather than failing the test. Without this they would each
have to repeat the snprintf().

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pm.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index ddc1de01c..6536405df 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1033,15 +1033,26 @@ static void __igt_pm_pci_card_exit_handler(int sig)
 	igt_pm_restore_pci_card_runtime_pm();
 }
 
-static int igt_pm_get_power_attr_fd(struct pci_device *pci_dev, const char *attr)
+/*
+ * Open a power attribute of @pci_dev with @flags, returning -1 if it does not
+ * exist. Not all attributes are present on all devices, so callers that want to
+ * probe for one need an error rather than an assertion.
+ */
+static int __igt_pm_get_power_attr_fd(struct pci_device *pci_dev,
+				      const char *attr, int flags)
 {
 	char name[PATH_MAX];
-	int fd;
 
 	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/%s",
 		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, attr);
 
-	fd = open(name, O_RDWR);
+	return open(name, flags);
+}
+
+static int igt_pm_get_power_attr_fd(struct pci_device *pci_dev, const char *attr)
+{
+	int fd = __igt_pm_get_power_attr_fd(pci_dev, attr, O_RDWR);
+
 	igt_assert_f(fd >= 0, "Can't open %s\n", attr);
 
 	return fd;
@@ -1049,13 +1060,8 @@ static int igt_pm_get_power_attr_fd(struct pci_device *pci_dev, const char *attr
 
 static int igt_pm_get_power_attr_fd_rdonly(struct pci_device *pci_dev, const char *attr)
 {
-	char name[PATH_MAX];
-	int fd;
+	int fd = __igt_pm_get_power_attr_fd(pci_dev, attr, O_RDONLY);
 
-	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/%s",
-		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, attr);
-
-	fd = open(name, O_RDONLY);
 	igt_assert_f(fd >= 0, "Can't open %s\n", attr);
 
 	return fd;
-- 
2.53.0


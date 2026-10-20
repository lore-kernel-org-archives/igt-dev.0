Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AE7606A321
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=So1Se5k5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F6310E5AA;
	Tue, 20 Oct 2026 14:18:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E18310F32A
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792505527; x=1824041527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPtpf1DRVzZyoePm7poYZ8GRBkPINC7x2S6AGq7vYZQ=;
 b=So1Se5k5pzrSdq7c51ub/rv2zu0GfmTrUmEa18EjA5MHomEGRagKQ0z6
 4tL94PXwMuoKOopF3NJFBYJL6yd7IEu26w1mOC5r0k7a9iDnRWc7n6zmu
 quX2ktjdCrCK+EhHd3XAJl1ESlsPmas5/TFczHGasWb25Dki5QXgu7eY9
 U/+muAvhxK/T65KOcFzFq5JVhoPzi1Qf+9DDKtAUj5SX1LcBlUwmW7/SB
 q+cXZjcuWf4t5MnizgIiRg9xYF6pIchaFnPThtct4y62QFQfDFvX92f93
 LU2Mh9WruMrj/J/h+wUbSjErf91l0CliwjR7sxwIOAws///OxCGunSj8Y A==;
X-CSE-ConnectionGUID: 9rtjvuhpQLulq52D8/Jktg==
X-CSE-MsgGUID: fhRKgW2HQG6PNsx3G1dhKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1309557"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1309557"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:06 -0700
X-CSE-ConnectionGUID: y05++/aNQ8uYzH7Dp8mErw==
X-CSE-MsgGUID: HIJqE4UnQ1qOntx/5ifQLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2775734"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:05 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 3/7] lib/igt_pm: Factor out power attribute path
 construction
Date: Tue, 20 Oct 2026 19:41:47 +0530
Message-ID: <20261020141151.753331-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020141151.753331-1-pranay.samala@intel.com>
References: <20261020141151.753331-1-pranay.samala@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_pm.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 688bcd7d2..ccb2f17c4 100644
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


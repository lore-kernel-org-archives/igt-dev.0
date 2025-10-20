Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AA8CCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 17:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BC510E4A5;
	Mon, 20 Oct 2025 17:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMWicyN2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5EF10E4A5
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760982099; x=1792518099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uoIfjYrdqxbeEyUlx5gM2bxmki2/nUWkYxWLABHcfc8=;
 b=LMWicyN2rAA+gJA8VK1/6svx/vl+M8zuwTm5oNnPrXQMWzTgKyk280f9
 k9YkviuqIaLex+m7oF6JA/38E3g2ZhYszuSNlhU6CbRQVNPj0bF9kjH+p
 m8oTc9+aSTnoTsX5GNlYE4nnw17S2vQ6KY/oW5oBeNdHbJy9nxPwnV6m/
 caYjcjaDn3QKupCCGXESFUoSFd17bkfDyQ+X8uS6lUV4zPionsijlaUAP
 nUCD7rFqJc5xzHHKpaY49mgD3P6D+U6v4uqiPUI9DpI1dfpGsLCg7xlSk
 USPy9p8i/ag/uKg2/EVn5aCKeUVAkDwkEHz/S8Qu/853+F54TZz2QXIx7 Q==;
X-CSE-ConnectionGUID: oMc1hFxHTfuPGu8u8XTZ2Q==
X-CSE-MsgGUID: IpH2jQMfRR2ceYH8GiGlNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74445786"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="74445786"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 10:41:39 -0700
X-CSE-ConnectionGUID: bq8LBhqaTRerD/RpMbjRNw==
X-CSE-MsgGUID: 06hw3czzS6KKPfE/EcrKuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183227684"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 10:41:37 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 1/1] lib/drmtest: Fix device opening with DRIVER_ANY
Date: Mon, 20 Oct 2025 19:41:27 +0200
Message-ID: <20251020174127.170084-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251020174127.170084-1-kamil.konieczny@linux.intel.com>
References: <20251020174127.170084-1-kamil.konieczny@linux.intel.com>
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

When using IGT_FORCE_DRIVER with DRIVER_ANY, honor user choice
when forced driver is excluded in DRIVER_ANY or it is not
listed in known modules. With this following tests should
work:

sudo IGT_FORCE_DRIVER=vgem ./core_getversion --r basic

or on Virtual Machine with VKMS driver:

sudo IGT_FORCE_DRIVER=vkms ./kms_plane

v2: improve also function documentation (Zbigniew)

Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: José Expósito <jose.exposito89@gmail.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Tested-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/drmtest.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index a1fb0b5ba..590c4671a 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -324,6 +324,8 @@ static void log_opened_device_path(const char *device_path)
  * A special case is the use of the IGT_FORCE_DRIVER environment variable. In
  * such case, even if opened device is compatible with given @chipset flag, the
  * function returns error if forced driver is not compatible with @chipset.
+ * In case of DRIVER_ANY in @chipset, it is treated as compatible with forced
+ * name, even when driver was excluded by ANY or is not listed in known drivers.
  *
  * Returns: DRM file descriptor or -1 on error
  */
@@ -341,19 +343,30 @@ int __drm_open_device(const char *name, unsigned int chipset)
 	if (__get_drm_device_name(fd, dev_name, sizeof(dev_name) - 1) == -1)
 		goto err;
 
+	/*
+	 * When using forced driver with DRIVER_ANY honor any driver name,
+	 * also those excluded from DRIVER_ANY or those that are not listed
+	 * in known modules.
+	 */
 	forced = forced_driver();
-	if (forced && chipset == DRIVER_ANY && strcmp(forced, dev_name)) {
-		igt_debug("Expected driver \"%s\" but got \"%s\"\n",
+	if (forced && chipset == DRIVER_ANY) {
+		if (strcmp(forced, dev_name)) {
+			igt_debug("Expected driver \"%s\" but got \"%s\"\n",
 				  forced, dev_name);
-		goto err;
+			goto err;
+		} else {
+			goto opened;
+		}
 	}
 
 	modulename_to_chipset(dev_name, &chip);
 
-	if ((chipset & chip) == chip) {
-		log_opened_device_path(name);
-		return fd;
-	}
+	if ((chipset & chip) != chip)
+		goto err;
+
+opened:
+	log_opened_device_path(name);
+	return fd;
 
 err:
 	close(fd);
-- 
2.51.1


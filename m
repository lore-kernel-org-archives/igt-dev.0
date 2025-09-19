Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7C1CAC5A8
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 04:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3155610E933;
	Fri, 19 Sep 2025 04:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4IE8451";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59ED10E932
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758257441; x=1789793441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MTiNUOneNvCecT5Pd69SKPtFU3R5FDMEjqCft8VeBZ0=;
 b=C4IE8451rxb6itugAm9aRRQm+4q4EKnp+3kODDM3toTrC2W3FXMLCAeQ
 vDEx9WCMtIdCFmlHsCT7tp3hRZLzTLRV0PfBhVehnxDEZLtYJStFIJ7g+
 UFd/BvT2LGOwNvNt2riKsyRaXPbKTCrabABto5sdJ4CW+PhYGwzeJMO4W
 T4L368BI8gJ+IiR0DpyS+ygfPxt19xJdlI+E177GxSBX29wMKSfXLszxc
 LIodH43idgrtxfNToTUhSi2ky96s7Z0P9yuJgffErv20aZX752jtyCwVZ
 hvIPKLY5HQT0oYgUWgt4BAZCgEbE4NA02TqwmPxpu9UYbqEAErecRvY19 w==;
X-CSE-ConnectionGUID: cG2J06vzSbu0lcMgO1FO7Q==
X-CSE-MsgGUID: GOd3BMijRw2y/z+DGQmX0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60531893"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="60531893"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 21:50:40 -0700
X-CSE-ConnectionGUID: rXS2V707Tyidc0l1U3uMiQ==
X-CSE-MsgGUID: Lk54k9C9Qs6JZH7/mey51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="179745521"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 21:50:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_configfs: Save pci_device
Date: Thu, 18 Sep 2025 21:50:20 -0700
Message-ID: <20250918-configfs-ctx-restore-v2-1-5df035e27e42@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250918-configfs-ctx-restore-v2-0-5df035e27e42@intel.com>
References: <20250918-configfs-ctx-restore-v2-0-5df035e27e42@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Just like the address, some new users will be interested in having the
pci_device cached. Stash it for using later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 27426b52a..794c76132 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -24,6 +24,7 @@
  */
 
 static char bus_addr[NAME_MAX];
+static struct pci_device *pci_dev;
 
 static void restore(int sig)
 {
@@ -125,8 +126,6 @@ static void test_engines_allowed(int configfs_device_fd)
 
 static void set_bus_addr(int fd)
 {
-	struct pci_device *pci_dev;
-
 	pci_dev = igt_device_get_pci_device(fd);
 	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
 		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);

-- 
2.50.1


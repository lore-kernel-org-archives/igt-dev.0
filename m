Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD0FCD98F0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 20:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9C110F10B;
	Wed, 17 Jun 2026 20:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3m9KSBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BAF10F105
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 20:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781727986; x=1813263986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BMpVTeqAgUXgtoliTrHUOzoMtwcfKwbSY8F8mwCTwDY=;
 b=e3m9KSBke88XN1c5zWDdMSErrDNrXtBPcpJDtBNNiaemtS5hhjUSOBw3
 dT7HEd2i/GIdNc8ccw4up7GEK7DWSeJ3bCoC9PfmL1tsZN62rWyyazmD6
 2uq4r2Ce2lLTiLB8SO4Jr8ynguCPvVAU9zC7A72kwL8HylSjk8Kc5IgkW
 nul6Td7D6N0TkPKa/C1kUMBipVcToVz4F7QrLnvd6s6FXa0V02fwtXfPc
 xh3YGwFaNCxNbDth8ZIpowaEL8wf53BRB0v0c99kkmgdEUHGKIZj2NCfW
 d1IVhOsSstOWoBbRoXj8xji+L4Vg5eEWxZtGgPk2+oX0ryGxTUGvZS8Em w==;
X-CSE-ConnectionGUID: wL6u9nltTu6FD4CvyjLB5A==
X-CSE-MsgGUID: FlThbi3nQruWq0CN39BW4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82654590"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="82654590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 13:26:25 -0700
X-CSE-ConnectionGUID: 8G+RrFlER8uIfP3I1M8xEA==
X-CSE-MsgGUID: 3LghMq1XQ+6t00EnYaqraA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="253141063"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.127])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 13:26:15 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v1 2/2] tools/intel_reg: Create default accelerator
 access
Date: Wed, 17 Jun 2026 22:25:58 +0200
Message-ID: <20260617202600.251889-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617202600.251889-1-kamil.konieczny@linux.intel.com>
References: <20260617202600.251889-1-kamil.konieczny@linux.intel.com>
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

Among computing devices there are GPU and accelerators and the
intel_reg tool worked only with former ones. Create new way for
finding a compute device and when no Intel GPU is found, then
search for Intel accelerator. Also, inform user about which type
of device will be accessed.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_reg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 49afe91c0..b4f8cd0fd 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -1382,6 +1382,18 @@ int main(int argc, char *argv[])
 				return EXIT_FAILURE;
 		} else {
 			config.pci_dev = intel_get_pci_device();
+			if (config.pci_dev) {
+				fprintf(stderr, "Found Intel GPU PCI device 0x%x\n", config.pci_dev->device_id);
+			} else {
+				config.pci_dev = intel_get_pci_accelerator_device();
+				if (config.pci_dev)
+					fprintf(stderr, "Found Intel accelerator PCI device 0x%x\n", config.pci_dev->device_id);
+			}
+
+			if (!config.pci_dev) {
+				fprintf(stderr, "Cannot find Intel GPU nor accelerator device\n");
+				return EXIT_FAILURE;
+			}
 		}
 
 		config.devid = config.pci_dev->device_id;
-- 
2.54.0


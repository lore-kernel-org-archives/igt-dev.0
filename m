Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F08C83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 11:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE58B10E0F3;
	Fri,  4 Jul 2025 11:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNFZVFD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE2810E0F3
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751628850; x=1783164850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XqThM+C6CHa1svPLKYDUhslvBoe0Z/51Sh+vYowApPk=;
 b=cNFZVFD7kI+6ABNAoIlcqx5J2ln3Gbt0x06L2ERuIGTiCBEYh6AxDL2s
 DaLF/2h6+9n+3KXl9+sgr2aCj4tY92UtPlD/TTcoN8wJ/0W3BxukMaFkk
 IFzVl7N3OjziVKEtpYDHm/txkTbzLnbvyHQ1ODvUydHRZDiauVYfQro1E
 5ip3dSQ6m27l/a0EpiQHZ+cTFQKNq33bPjoJlJT6BJ2cY5hlPetF9Em1a
 jfF4w8TcoCjcWvX50Mi8bhFFxviPjCPPU3qw8LVyQCJWAe21u+R9Z1x8f
 anwpBQjbSkY7e9LfJztuKwaHWdiztP5jn11BjKuLzefqS3+PWzsQZzhQX w==;
X-CSE-ConnectionGUID: 9EI0PURJQBuASbHYbo1kNg==
X-CSE-MsgGUID: rXmBTLq1QUi9kg6VOrnCjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54082826"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="54082826"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 04:34:10 -0700
X-CSE-ConnectionGUID: nf/+RAShQQSI+R5iwWxqUw==
X-CSE-MsgGUID: PTEWCmqMRHG3dVOGaxyyiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="191792637"
Received: from unknown (HELO rvodapal-mobl.iind.intel.com) ([10.190.239.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 04:34:07 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Subject: [PATCH] lib/pciids: Add one more PCI ID to BMG
Date: Fri,  4 Jul 2025 17:03:56 +0530
Message-Id: <20250704113356.100859-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.34.1
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

Align with kernel commit f7814ac1cc23 ("drm/xe/bmg: Add one additional PCI ID")

It Adds one more pci id to BMG.

Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 lib/pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/pciids.h b/lib/pciids.h
index 129c3172a..666265b5f 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -846,6 +846,7 @@
 /* BMG */
 #define INTEL_BMG_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
-- 
2.34.1


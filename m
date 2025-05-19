Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B45C3ABDD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CAD10E284;
	Mon, 19 May 2025 15:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNISFo3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E7F10E284
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747670013; x=1779206013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kuOo+Pk1M0C4GIIbXx0JKNRCHGlQajoBSxEmL/EyL80=;
 b=PNISFo3fh+flRauhGL2OB9GzfZE1jFANVQVfdTAaz7wh4R1quhuOOQdt
 uGZJNgFqGy1QiODVzs/OCxagQ5mMomN9EZIdJboGbqQrClRwCqddIKbAI
 4lZ1OZFfSXPJDR7KnevL2I8eKjRAsNIw10awVoFEQq8rZ55PuN2aFQu9F
 BiPnG+LQnxfGwRy2twoX5AKVAf3Rg8elU1wQIA12JxfmuQerKTYGjCMMj
 g2aE1z17K7dTsE+AewR96qAPd4ndetmsQImRXlvVaWlKLaghQR1KmBk7Z
 7FiEnv1GhjfdiKy3mN/c6r7tzH7zWchvsfQoGNqN5b7gJ6XC2GpswRh1R Q==;
X-CSE-ConnectionGUID: R181Z8JtT8qoViFnUBTvSg==
X-CSE-MsgGUID: d0I56UsUTpK6JGSN+CIkQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60967652"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="60967652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:53:33 -0700
X-CSE-ConnectionGUID: s30MEywQQOKfEPpzdGE7Ag==
X-CSE-MsgGUID: AylhJ9p5Q5y8wsdM6LYo0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="176517261"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:53:31 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] lib/pciids: Add one BMG pci id
Date: Mon, 19 May 2025 17:53:23 +0200
Message-ID: <20250519155323.154398-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Align with kernel commit cca9734ebe55 ("drm/xe/bmg: Add one additional PCI ID")

It adds 0xE211 BattleMage PCI id.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Link: https://lore.kernel.org/all/20250325224709.4073080-2-matthew.d.roper@intel.com/
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/pciids.h b/lib/pciids.h
index 4736ea525..d212848d0 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -850,6 +850,7 @@
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
 	MACRO__(0xE210, ## __VA_ARGS__), \
+	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
 	MACRO__(0xE215, ## __VA_ARGS__), \
 	MACRO__(0xE216, ## __VA_ARGS__)
-- 
2.49.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68D1CD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 08:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF3210E6F4;
	Wed,  4 Sep 2024 08:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azkxNrQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1F110E6F4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725439659; x=1756975659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CECAIfEgc4Vub5DF+L4m9gQztQiwGqcpFDbJG9JsiVc=;
 b=azkxNrQXHbIzPMP9c5cyU5IbhwI5B+/mIh2XLxhjcDvFTJLuGWqY+anz
 E6r75W+/ZwKS7a58Ro4vyTcwdVk8TuVER3wzKCwmgzGatyYil7MdUq1Fj
 GgzgZX/Up1rl3Dol6y00J6oS0qHm8FIz7FHudQN4iMTyyqgoFCpVX0TRN
 SdclPLbW3EstPcJspxWgod7EDGrmkwOxmpW7SQah3t4AdZs5QUOscTPYy
 D7PUti8WY22nRaaq47P1m0j4lyWT94KhkZ26+bqfuNnsyjcGamMip5utD
 Xo+9fwJvxnDGMe72PvB/0FPOPyU14RbVQJnijOcJuGOo7Ly85OcVELdv5 g==;
X-CSE-ConnectionGUID: ncPRID2ETIKCzUatz16AOA==
X-CSE-MsgGUID: iLYZgr9fQOCjUdIfkzsWTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35472522"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="35472522"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:47:39 -0700
X-CSE-ConnectionGUID: RG7HUoPcSyOoP7ReQ04EZw==
X-CSE-MsgGUID: MYOCb+SbRqiW3skNS74jqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="95999821"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.123])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:47:37 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 K V P Satyanarayana <satyanarayana.k.v.p@intel.com>,
 C V Narasimha <narasimha.c.v@intel.com>
Subject: [PATCH i-g-t 3/3] lib/xe/xe_mmio: Remove redundant PCI system cleanup
Date: Wed,  4 Sep 2024 10:47:01 +0200
Message-Id: <20240904084701.186664-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240904084701.186664-1-marcin.bernatowicz@linux.intel.com>
References: <20240904084701.186664-1-marcin.bernatowicz@linux.intel.com>
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

Remove igt_pci_system_cleanup from xe_mmio_access_fini as it cleans up
all libpciaccess state and invalidates all handles, not just single
xe_mmio. It should be used at the end of libpciaccess usage.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
Cc: C V Narasimha <narasimha.c.v@intel.com>
---
 lib/xe/xe_mmio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 3e42b2e1c..0817c12f6 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -55,7 +55,6 @@ void xe_mmio_access_fini(struct xe_mmio *mmio)
 {
 	mmio->intel_mmio.pci_device_id = 0;
 	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
-	igt_pci_system_cleanup();
 }
 
 /**
-- 
2.31.1


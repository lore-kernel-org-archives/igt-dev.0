Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ECCCD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 08:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D6310E6F1;
	Wed,  4 Sep 2024 08:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRNhHdNn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6CF10E6F4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725439653; x=1756975653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5MNMO/ASh8hPnINdFfKahYlmFJyQtLZ8JtUypE88XdA=;
 b=JRNhHdNndmsPVWN3H9/BcPqd6FphSzjMU3OykEZ1ZWI5uuJXqbgClPCM
 OhEW9t/OwP4fpd3Ch4+lr2bA+2HgC67QDmKh+qp0m5CVPOGBmiibCab4r
 qQ9flhlOo8YQ2F+UyK+gfLfJsux4d2CdqjWpou33+TbGWheT5jokH1M+q
 xljd/RMjm2oZ9RDqzZzbLwwemgkkMH4EzGhvpGyM+GtTrCtqHEgpKEHXG
 IRk0W5uAP1es/b1va3ZjwTMYmMk01XThg7ImzDKGoLylAYjHaJhNRzNeu
 qRMpWvbnXn6OI2N8ZAjLHu6x698dauy8dgWlG3XbLzq48oVQufJA7NRZK w==;
X-CSE-ConnectionGUID: C/auv50AQ/uGnfDyUIv7jQ==
X-CSE-MsgGUID: WhPIjy0cRbCYnu5hXFw2CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35472513"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="35472513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:47:33 -0700
X-CSE-ConnectionGUID: QGbRkMA1RwiOmslkJbHOeA==
X-CSE-MsgGUID: RyVk9zAQSPeCQWKkdkj9eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="95999792"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.123])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:47:31 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 K V P Satyanarayana <satyanarayana.k.v.p@intel.com>,
 C V Narasimha <narasimha.c.v@intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe/xe_mmio: Fix assertion logic in
 xe_mmio_vf_access_init
Date: Wed,  4 Sep 2024 10:47:00 +0200
Message-Id: <20240904084701.186664-3-marcin.bernatowicz@linux.intel.com>
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

Ensure igt_mmio is not null before proceeding.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
Cc: C V Narasimha <narasimha.c.v@intel.com>
---
 lib/xe/xe_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 57526d7cb..3e42b2e1c 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -25,7 +25,7 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
 
 	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
 
-	igt_assert(!mmio->intel_mmio.igt_mmio);
+	igt_assert(mmio->intel_mmio.igt_mmio);
 
 	mmio->fd = pf_fd;
 	mmio->intel_mmio.safe = false;
-- 
2.31.1


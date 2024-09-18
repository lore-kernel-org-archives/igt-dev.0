Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4B0CDD543
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 16:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF3110E5F8;
	Wed, 18 Sep 2024 16:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DwgByb0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D424A10E290
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677392; x=1758213392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AOr2dNIcF2P8Fbn2EUVMLvwbCT0TQc+I+cJgHnoA0gU=;
 b=DwgByb0VTWip+pEsXbTkwrQyKI48k6/AX+Krs5p8WoF8h2Q7lumgBKAS
 axSt+Y4y8f/Zm0Lk3KCHKnq+H8w6fMwQ3dsboEiyBiLPpcw5hoPXONnUB
 nuY7BRJorWZ0aLRiUYvyl7KIJtKAi/SzwqUOtVP6iu09ZH/7YmJzOw/gs
 MLxpqrz0twORMPd6TikGbSAEM/65DD+aCHik/ZoGbkfSVqlzskc7yKdMf
 +gsNkXLIN0QMyS90B/8W1aHx6E0XMnPIeVmWf/pMSa+v5WAVh8w5617g5
 6LdsPv0KmfxrzgeWhGdCtgHPvGGCyjpeaH5R39oKPrcfVKCFW4ISUXmDZ g==;
X-CSE-ConnectionGUID: EOdqRXeTQs++7Mm9+1fOhg==
X-CSE-MsgGUID: OLIDbr7YQ7SSHwXm9sIy1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29496279"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29496279"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:32 -0700
X-CSE-ConnectionGUID: 7uMzH1bxTI6zCyZI1Dz9+A==
X-CSE-MsgGUID: A17ZuCBdRmaN8vcSuF/fYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69235587"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 6/6] tools/intel_reg: Add forcewake support to xe
Date: Wed, 18 Sep 2024 09:36:29 -0700
Message-ID: <20240918163629.1186314-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918163629.1186314-1-lucas.demarchi@intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
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

Now that the igt lib is prepared, start passing the open driver fd so
the correct forcewake is taken.

Before:
$ sudo ./build/tools/intel_reg read 0x2358
                                    (0x00002358): 0xffffffff

After:
$ sudo ./build/tools/intel_reg read 0x2358
Opened device: /dev/dri/card0
                                    (0x00002358): 0x91e59eeb

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel_reg.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 906ae9b84..b650c3697 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -802,7 +802,18 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
 
 static int register_access_init(struct config *config)
 {
-	return intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
+	int drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+	int ret;
+
+	if (drm_fd < 0) {
+		fprintf(stderr, "could not open i915 or xe device\n");
+		return EXIT_FAILURE;
+	}
+
+	ret = intel_register_access_init(&config->mmio_data, config->pci_dev, 0, drm_fd);
+	close(drm_fd);
+
+	return ret;
 }
 
 /* XXX: add support for register ranges, maybe REGISTER..REGISTER */
-- 
2.46.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FD2C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAB310E1CF;
	Thu, 10 Apr 2025 22:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arJUfi3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB1E10E1CF
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325335; x=1775861335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m1AWOjAXwMS10y1RoyBOea6j6UDZQ+E/zF9PqzBKnk0=;
 b=arJUfi3fmeezBRGwSsgX8hoOFO1+hGpSvrmMozdNm4TilQWEVxv4/2y6
 j2f8hJDWJc+VTONcGG0RARhSmlMEGIThWZTeVbGiYTGwFe2JhSNg3T8wA
 vuL6ThW+dRAAOVBD/uquzmGv54pZq+SQ+OYmpJeElY3RLnpfhVIeCTFoE
 zIynu0DdfVauNJvaUHAfDeaBHz2ufeYUIJig8Iis5BAy3iRtxdCTUzcgb
 cxMhWK1MaarqFQj9m6ubnKgZZpEFyx+3ULfN5jrjfnEMV6v/woWQfDsJi
 ECuK6iNnvNjs4/Wov6o5WOJwDdgQviTLkpdKtXp9NhMdi4U7hhukLDw/W g==;
X-CSE-ConnectionGUID: vnJ7ZxJ4S6KSsEChWtRg+Q==
X-CSE-MsgGUID: nl9ElyyTRGmXsEMXoWo8OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757004"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757004"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:54 -0700
X-CSE-ConnectionGUID: Tamo2OBLQ2aWzQryh+Sp6Q==
X-CSE-MsgGUID: gH89EyEeSBCGr93+6mGNXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998309"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 02/10] lib/igt_kmod: Fix comment about unbound devices
Date: Thu, 10 Apr 2025 15:48:31 -0700
Message-ID: <20250410-lib-kmod-v1-2-84b1ad0b8075@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-9a9c7
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

If the module is loaded, the directory should exist, without any device
link. Example:

	# cat /sys/module/xe/refcnt
	0
	# ls -l /sys/module/xe/drivers/pci\:xe/
	total 0
	--w------- 1 root root 4096 Apr 10 22:12 bind
	lrwxrwxrwx 1 root root    0 Apr 10 22:12 module -> ../../../../module/xe
	--w------- 1 root root 4096 Apr 10 22:12 new_id
	--w------- 1 root root 4096 Apr 10 22:12 remove_id
	--w------- 1 root root 4096 Apr 10 22:12 uevent
	--w------- 1 root root 4096 Apr 10 22:12 unbind

The case in which the directory doesn't exist is when the module is not
loaded.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 4e1a3d42d..ecc74e0fe 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -667,7 +667,7 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 
 	dir = opendir(path);
 
-	/* Module may be loaded, but without any device bound */
+	/* Module not loaded, nothing to unbind */
 	if (!dir)
 		return 0;
 

-- 
2.49.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4D3C369A8
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7518F10E1A1;
	Thu, 10 Apr 2025 22:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0qL28mU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB2A10E1A1
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325335; x=1775861335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FWZhRSwk+yLngH7MdkZDmyy9EokWtoW5BD9Eh4R4eO4=;
 b=D0qL28mUzlrksi6GuyP19tTbJPmJYPYDr1AaSqZp6BmGumy9Nxd0xRyB
 d7XoEr0vTQDeZctaBf0Zsj5EJFObFwR9vZESXr/CGXPn+GwUsGDekU+2/
 cugBAZB6TSJmbMlHTwou/ZsLBPTyQ8PTBlz6D9IvQFFprirF5IJbaJVW9
 eYHU8rm9hx5zlgtiiGvJrzUH8GYSmK/jxGsA4fiiteIi+itHpZmU8b1kP
 8/HmhvslC3UC2t1bDCpVI9jl4cpEYBiZeVzQkflE4qSHS9pWnfL/I+0W3
 lzx/0RXhVtU/jx+9ccZOd1fU1gvsi/nixcYwl++sjFj24odO2R01+9xH/ w==;
X-CSE-ConnectionGUID: xu8sYhIoQaqCdBmIYukD4A==
X-CSE-MsgGUID: kSudvr+yQEmJIAEKrjSwmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757003"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:54 -0700
X-CSE-ConnectionGUID: y4E4OoZBRF+N+/9LvQbd0w==
X-CSE-MsgGUID: pEwFLMQuTBazDGC7ZqzrLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998306"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 01/10] lib/igt_kmod: Fix leaking dir
Date: Thu, 10 Apr 2025 15:48:30 -0700
Message-ID: <20250410-lib-kmod-v1-1-84b1ad0b8075@intel.com>
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

Close the dir before returning to avoid leaking the object.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 2cf2e7894..4e1a3d42d 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -690,6 +690,8 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 		close(devfd);
 	}
 
+	closedir(dir);
+
 	return 0;
 }
 

-- 
2.49.0


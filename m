Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1B1CCF9E7
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 18:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A0B10E850;
	Wed, 25 Sep 2024 18:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZk17Do4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E7710E850
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727288273; x=1758824273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayLnQOwLNoZrrgxegB/vf8xf0eElbRwPjmAo5rcb2Kk=;
 b=LZk17Do4h9G3fYEPiDsRXD+/IRcqMsCoVnjSYPqaXwLlBta1uD/9QG8p
 pP6/Iw6bOXK71VaQZlrLIw8GxhxmgyYophe4gynzpuBBkLD5sX6PIA+Mx
 EjSaEVXMn/P9O0kpU7b2W5zmrmdwnYFirSe8XPhhZtfKzW+a1sKxegDhr
 q6CH43k9wdq8cB8KztWcG6NCxhUWss4MSoW4eRe5KIJMfPCyqQYY4eIP2
 XxLqAN/zf9fhihTbsLgbvY8WQ8gcWoqkBfVNoJdko2HPRgzUr6D4+VLgZ
 uauOcyF3cUdDpr3gX8VGsRhG9PvmtOKPCncooFCOJZlx1G16tXiPfKGRB Q==;
X-CSE-ConnectionGUID: +JZuXAseSEeJvGEbaft5Hw==
X-CSE-MsgGUID: 5aO58Re6TAuNxQrcroR4xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37032369"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="37032369"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 11:17:53 -0700
X-CSE-ConnectionGUID: ONfsriJsTwunFC7jgWebSA==
X-CSE-MsgGUID: hSmemXDzRI2Wmr305XWYJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="72324327"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 11:17:52 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 5/7] lib/igt_kms: Handle EINVAL error as well
Date: Wed, 25 Sep 2024 23:59:42 +0530
Message-Id: <20240925182944.1603015-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925182944.1603015-1-kunal1.joshi@intel.com>
References: <20240925182944.1603015-1-kunal1.joshi@intel.com>
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

Previously, only -ENOSPC was handled, but -EINVAL
can also occur under certain conditions when the
mode can't be set.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Suggested-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ca5fc92cd..c96008577 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4927,7 +4927,7 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 
 		if (!ret)
 			return true;
-		else if (ret != -ENOSPC)
+		else if (ret != -ENOSPC && ret != -EINVAL)
 			return false;
 	}
 
-- 
2.43.0


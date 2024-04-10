Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050E7CD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB8D10FBCC;
	Wed, 10 Apr 2024 06:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/wZf8lT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6E51131BF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730822; x=1744266822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IjdSZF9DVI9uelEf+T420RZKcsiRlZT+O/pWgcC3aI8=;
 b=j/wZf8lTwLSbiTNRom7wxV/a4XJflRWA1hNbydcwcH77K4tdMgsRfeHA
 c3qoKL0Od9diayZbGRC9ppAdmgLiB6wZ1Qk2g+Ks1sug7bgtq4ODhFxQ2
 sgfxzBmKftv5Elp7tD16pNidqUGoMMDRS9ZmGdJo+HUofaGZzg6TupOi5
 F7+37UfOgCAL9K3Bd/ExSBcvhHxYH0qH2cAnBpSIDcWlcI32SfTvIzorv
 u1NAEsLkQ4m/HREoCBHKOod0i+AqkspsR2oi3STXEaeQWdaLkPhBtAVDB
 Rh2gYTaLKDNeNdSvb/iCMrdLTYNXq5qLvlU/1Qze9l5hzzz7jnt3i56Ul Q==;
X-CSE-ConnectionGUID: yuiWlR6qQD6GQhK/uKHIgQ==
X-CSE-MsgGUID: fvqNMwYJRp2Vu3MQL7f18A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948151"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948151"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:41 -0700
X-CSE-ConnectionGUID: mu5gpS86TB+i/wUP1HhIMA==
X-CSE-MsgGUID: JsRjKjZQRGKDTxJ3t/JUvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138141"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:40 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 2/9] lib/igt_kms: add forced_connectors_debugfs array
Date: Wed, 10 Apr 2024 12:14:19 +0530
Message-Id: <20240410064426.1968399-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410064426.1968399-1-kunal1.joshi@intel.com>
References: <20240410064426.1968399-1-kunal1.joshi@intel.com>
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

add forced_connectors_debugfs for tracking connector
having a force debugfs set

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e3b6c607e..cc934a514 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -98,6 +98,7 @@ struct forced_connector {
 	int dir;
 };
 static struct forced_connector forced_connectors[MAX_CONNECTORS + 1];
+static struct forced_connector forced_connectors_debugfs[MAX_CONNECTORS + 1];
 
 /**
  * igt_kms_get_base_edid:
-- 
2.34.1


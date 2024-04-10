Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD9FCD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5B11131C3;
	Wed, 10 Apr 2024 06:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kr9agMh2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B791131C2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730831; x=1744266831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FpWAgs44Q2EB2IZE4nVd+m3CGsDFIYULeqCUCw545Dc=;
 b=kr9agMh2hmuJS1ZiljLt60FvhEIbLjEh9EPmWpOcR2qy+Jf32+vg0zpl
 Tb1XynbkYkW6U9KUgtTGsEnEJLG9eGJ4xRXrDlcRVddpwoNfsfIPMR3Lw
 mL1WZzau+WAWL8B/59Jark8a1oG9MQzm4dwLVrpJcoRtQ+WuMbdv7fY7i
 3ryax7MaMUqdGNa8fTOuvBY6y/FMJmr/QOUD3LytcKsV41olKhzxrrLPy
 IHKQA3a2C+OTd6DqN0hvc5+WE3+F/bW0DirkgyBBJ3rbO+3e/fVtfO8cj
 CKYaFs7Q81Ht98TMj0DIbT/3VVxCf3pF5gb8gpK2lUV5gnqGtrIojMWNw g==;
X-CSE-ConnectionGUID: M6WBIyXBRCCHkCRhDtRCQA==
X-CSE-MsgGUID: bEiuW40KRKqbF0gdlpVLAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948180"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948180"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:51 -0700
X-CSE-ConnectionGUID: xtbenx9GT16jmUyWSzl1kA==
X-CSE-MsgGUID: owXak0f2SfmfTV3szEtD+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138198"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:49 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 6/9] lib/igt_kms: add exit handler function to clear
 force debugfs state
Date: Wed, 10 Apr 2024 12:14:23 +0530
Message-Id: <20240410064426.1968399-7-kunal1.joshi@intel.com>
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

add exit handler which will be initialized on
kmstest_force_connector_debugfs

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 18605531b..80070d935 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1454,6 +1454,11 @@ static void reset_connectors_at_exit(int sig)
 	igt_reset_connectors();
 }
 
+static void reset_connectors_debugfs_at_exit(int sig)
+{
+	igt_reset_connectors_debugfs();
+}
+
 static char *kmstest_connector_dirname(int idx,
 				       uint32_t connector_type,
 				       uint32_t connector_type_id,
-- 
2.34.1


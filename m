Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15DACCF9E7
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 18:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D8410E84E;
	Wed, 25 Sep 2024 18:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8SBkxXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3FF10E84C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727288271; x=1758824271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=536OsTTARrmRz3diiSm4cXFKRnCy/PTG4wSC6vFtrtE=;
 b=g8SBkxXjnmZ7FWnvOR25vPi/A/yndUXlq7IXvsWG8rkuuh9SzO5RAcfr
 Qt3PRj7BFV7Et9QdYcEwe9ZtPhu69zEX5i5ytqYQfvCM97dqGNRAiLn4E
 Jinv/iWvKe6uvdKb61bcTqHq8L4L5p9dzpcC2C0v6/Y/YkkPbRJ7lYTLK
 yF8JeHhcwypQlxMEY99MFD0LShPxp+ujQcSSEvD6sZzWxbOZeyGAtd5pL
 nQ5rdST+2r6JJ3D3bXHB0Q2AQUkkh1cz/i4ZaxrSckde/Dn+TeJrxzVDT
 8pVMx428Nd0tjed9Svh4H4ZXtU5CV8onBZVvSVduDiT4M59I7DM2iN75p Q==;
X-CSE-ConnectionGUID: 6F9PM4BvTK+syFDGTqkxXg==
X-CSE-MsgGUID: x4vjMAyhQZmAnDLGYqYadQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37032365"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="37032365"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 11:17:51 -0700
X-CSE-ConnectionGUID: 3b5XYj54QMKwgQ0JDcBFQQ==
X-CSE-MsgGUID: V1XsIQiETR6m1Zw7nNYBNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="72324322"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 11:17:50 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 4/7] lib/igt_kms: fix helper igt_get_dp_mst_connector_id
Date: Wed, 25 Sep 2024 23:59:41 +0530
Message-Id: <20240925182944.1603015-5-kunal1.joshi@intel.com>
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

Use strdup() to create a copy of connector_path
before passing it to strtok(). This ensures the
original string remains unmodified, avoiding potential
bugs where the original path might be reused or
relied upon in other parts of the code.

v2: free the memory allocated by strdup (Imre)

Fixes: 0123456789ab ("lib/igt_kms: add helper for dp-mst connector id")
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d8a6f54c..ca5fc92cd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6630,11 +6630,12 @@ static int parse_path_connector(char *connector_path)
 {
 	int connector_id;
 	char *encoder;
+	char *connector_path_copy = strdup(connector_path);
 
-	encoder = strtok(connector_path, ":");
+	encoder = strtok(connector_path_copy, ":");
 	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");
-
 	connector_id = atoi(strtok(NULL, "-"));
+	free(connector_path_copy);
 
 	return connector_id;
 }
@@ -6648,13 +6649,11 @@ static int parse_path_connector(char *connector_path)
 int igt_get_dp_mst_connector_id(igt_output_t *output)
 {
 	int connector_id;
-	char *connector_path;
 
 	if (!igt_check_output_is_dp_mst(output))
 		return -EINVAL;
 
-	connector_path = output->config.connector_path;
-	connector_id = parse_path_connector(connector_path);
+	connector_id = parse_path_connector(output->config.connector_path);
 
 	return connector_id;
 }
-- 
2.43.0


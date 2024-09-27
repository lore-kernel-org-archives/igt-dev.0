Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240DDCDD1B2
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 13:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805AD10EC59;
	Fri, 27 Sep 2024 13:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrApYJ+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D518710EC59
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445031; x=1758981031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5c3Ta8wdKZ6litmMuZW3Nv9MWqQl8fZ3mIL2WSAYvRo=;
 b=HrApYJ+XniCkjhueY+GAFYNN28ATu4LUyL+VZnGLH6veTrC9yWR17tLN
 +Emc741VerHaxocllBcnbpxyw1YhAqCOGQF5gASGLRSxPVsuTmB7hgcOU
 +Ml4qY1+rAlbJjo/Ep2WWLLbaJVMcQIJkGBDURy2RpE/obwHOqOpR4mtK
 uqZJo/QFDE3x7S3NCbmrYFWuSOReGisfHABgX5887z4bTQl+eukU6mJmn
 +as5V/oS4/bD2fC1limmodc/og7/SMghRzbmV8zlwrKfHq2rYyDHoewbw
 BGf8Y4shxWC2lkzuXmvF2gOuzrxarsdOBuFaYzto8qEUgOrtCIxvrbiH/ w==;
X-CSE-ConnectionGUID: TeBhZH9ASv+1VtTqViaIUQ==
X-CSE-MsgGUID: udMo78BrSSKQBoUrdCtbTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49116006"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="49116006"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:50:29 -0700
X-CSE-ConnectionGUID: flCSx7tKQdydgK1Juht/QA==
X-CSE-MsgGUID: piumwRsBRoK5wMGgD2V9QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72850029"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:50:28 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 4/6] lib/igt_kms: fix helper igt_get_dp_mst_connector_id
Date: Fri, 27 Sep 2024 19:32:20 +0530
Message-Id: <20240927140222.1688565-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927140222.1688565-1-kunal1.joshi@intel.com>
References: <20240927140222.1688565-1-kunal1.joshi@intel.com>
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
index 18744055d..9e15d25e6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6633,11 +6633,12 @@ static int parse_path_connector(char *connector_path)
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
@@ -6651,13 +6652,11 @@ static int parse_path_connector(char *connector_path)
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
2.40.1


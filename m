Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F16CF9C69
	for <igt-dev@archiver.kernel.org>; Sun, 22 Sep 2024 21:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D12310E359;
	Sun, 22 Sep 2024 21:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LELyGRLq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CEA10E359
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Sep 2024 21:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727039638; x=1758575638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ErWN7bctm0JpEXn9exHbyKATmuEG0X0FMe9MEuubRk4=;
 b=LELyGRLqN4k1x73S7hHW55CP42F9484Tqi2g3xaM4bogxUpqp1GdnRPl
 IMcJEbnxst3ObCc5/ayFI+x66JgsOcstFZlDAOYgLnQIY66QQRKTQDJ96
 IP4JmX4MTabmFic+7AR2y+Y6K6dTJsCWYsDI1965mYy/+0NL5ke24YOnU
 0OGSv7OGZPojXfo9rPBrScUzQ7wuueZRzng6Tqsvuf1PmUYDKow4BW9/g
 Oqvh6bFUArVDyzZ5LhPgWZN400fcf/l8rWo5+GzmkS/sYJubOpNr8k0CF
 L1zTa0/S3owPL3f0REFrUK6HOMD7i2MHyd+Lip4H9Af+UTTwLGqkwKwGD A==;
X-CSE-ConnectionGUID: C4xU0amlQIeNhwcevAo6ZQ==
X-CSE-MsgGUID: a0PfVq1sRB6azBzGv6ZXPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36641013"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="36641013"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 14:13:58 -0700
X-CSE-ConnectionGUID: gYopcyxhTc6jkSEyg8b+1A==
X-CSE-MsgGUID: nTntsgL4Tl2sKDsA8QP8Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71188113"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 14:13:56 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 5/7] lib/igt_kms.c: refactor parse_path_connector
Date: Mon, 23 Sep 2024 02:55:47 +0530
Message-Id: <20240922212549.1361889-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240922212549.1361889-1-kunal1.joshi@intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
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

Use strdup() to make a copy of connector_path
before passing it to strtok(), so the original
string remains unmodified

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 96da33a48..3d2a88b76 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6670,10 +6670,10 @@ static int parse_path_connector(char *connector_path)
 {
 	int connector_id;
 	char *encoder;
+	char *connector_path_copy = strdup(connector_path);
 
-	encoder = strtok(connector_path, ":");
+	encoder = strtok(connector_path_copy, ":");
 	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");
-
 	connector_id = atoi(strtok(NULL, "-"));
 
 	return connector_id;
@@ -6688,13 +6688,11 @@ static int parse_path_connector(char *connector_path)
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


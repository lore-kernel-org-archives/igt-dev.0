Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE0CC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 06:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3764810E727;
	Thu, 22 Aug 2024 06:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzH+v5au";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6975D10E726
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 06:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724307263; x=1755843263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aqavaC+RPirIv34a3aOO9cnfE9UIcTmnKUqG6KTb9JA=;
 b=bzH+v5auYmT3xnsP1h4QEKL3StVdk/mRSy/9Fd84khSdL0qPXy4IQW+S
 tyr7FGAdMeSRvXi6kitOxmdr5fuCkEUqmNqgRRpqq97st4f3VJdVSJ+8W
 BOC+RkDq/V+t7ZjGra7U++bigSQDzbYoQ7lxPQ5DuggHXjf0yv6292NAA
 rBPzuXsGaBg3eS/cG630bCqQAbleJuSEY3Q+AH24YuQ6paxRUQsHzOqIm
 wWj0GZv8vhCbJsJkX3xSS6nnTR/vMuI90+jeIeD/b5jLnXBVcYp9JfffC
 CcmYNrggu2twBvc+Z675oOo3WQKXS3GOW6zmLv0i54lV0XpvfXWgWjeJU g==;
X-CSE-ConnectionGUID: Huo1rDqIR62iEUZVaKU8QQ==
X-CSE-MsgGUID: NEC4BrqtTTOrgYW23GKEhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22225623"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22225623"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 23:14:22 -0700
X-CSE-ConnectionGUID: DqnqnxrgQ6KePIY80CfpYA==
X-CSE-MsgGUID: fRO+SEpgRSeRNDCLaq1yBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61329176"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2024 23:14:20 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 2/5] tests/kms_content_protection: Move try commit call
Date: Thu, 22 Aug 2024 11:41:47 +0530
Message-ID: <20240822061150.4127413-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240822061150.4127413-1-suraj.kandpal@intel.com>
References: <20240822061150.4127413-1-suraj.kandpal@intel.com>
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

Currently we are calling try commit twice once in if condition and
again right after that. The correct sequence should be we call try
commit again only if the first one fails.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_content_protection.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6bd744351..db6dc17b1 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -679,10 +679,10 @@ test_content_protection_mst(int content_type)
 
 		for (count = 0; count < valid_outputs; count++)
 			prepare_modeset_on_mst_output(hdcp_mst_output[count]);
-	}
 
-	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-	igt_require_f(ret == 0, "Commit failure during MST modeset\n");
+		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
+	}
 
 	for (count = 0; count < valid_outputs; count++) {
 		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
-- 
2.43.2


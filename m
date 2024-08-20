Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B72C5321E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 08:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6920210E514;
	Tue, 20 Aug 2024 08:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdyV+A97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A7F10E504
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724141708; x=1755677708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sz9vNQdJ7NQ4MLGulSu3AZljZst/kxPdQx7aYUGvDCU=;
 b=gdyV+A97N6rk7ctf3QAsiu/XDdgE7AFpgNz+rqFCY3rRcpNXWPsnbr9a
 1Kea8es0jgGy/VD8WwAsjU4sraSnRB/NcxdZ/ZsKGfPJnMow5ERyOOdV1
 YyKx+GhoaktnxzZMzHzhkNsKD+WMRfJeTFYnTay3LqAzEduM/LQcoBLTW
 W+HXNWY5Cz5Et6+W+5llPicCc9FgibTRnF4YYhOvsHkeHcNsRyUZ0FaOm
 P7TtQ0MDppnVFfvIKIERvayhfo5NThSv4Nd4swtRjeQNydMyUlrffUpz2
 EhztQdINij4GFm1oLmxTalwzBTPhSBwdQ3R+aMr5/VdtBMqMBqjKA4azm g==;
X-CSE-ConnectionGUID: xLAC1l+WRAqYRiSiFNViQg==
X-CSE-MsgGUID: vucrGtHaQj69S/nHlX42Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="44948236"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="44948236"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:15:04 -0700
X-CSE-ConnectionGUID: 7C6rTs9/RouKXqZpCMvCBQ==
X-CSE-MsgGUID: jIrf4b6PQiyOC+iccKqpQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="91418379"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2024 01:15:02 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 2/5] tests/kms_content_protection: Move try commit call
Date: Tue, 20 Aug 2024 13:42:29 +0530
Message-ID: <20240820081233.4092203-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240820081233.4092203-1-suraj.kandpal@intel.com>
References: <20240820081233.4092203-1-suraj.kandpal@intel.com>
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


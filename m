Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E00C54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 12:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C2110E477;
	Tue, 27 May 2025 12:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfHvEOw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5CC10E4BF
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 12:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347410; x=1779883410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TW2zxwOd3YmhNzqivca3tw010naY0k+cXjujZ+01sUQ=;
 b=SfHvEOw9zXebb74N9CmWpH81XH3OXiji/UAX5amxBv9C+v1UPTvdJnLN
 cUlsQJmqORBVZQznQW1d0zDG2B0UAUJOSUFsfRx0MQStKTaCfxNAWuENH
 rqZ4FEj7JH+UPUhjJJJaGCuX2mn3MLQl0NfXrfJ/7McNW1yYaUQ4Ob2EY
 r9iwohwL18ExHpu7z5DQuqICI5zicVX500pyrB1qZz6LXac/m7Xgz1Klb
 pcamL2uBu1nBwPmOsuiTmrhb1GlIq7QFzQdHmqiOtEtonDLarRAsyNzZQ
 ePDxvudM20XoBfBllWoelE1LitmyFznWZgkjlJIE+nFWU+nM36JePfa6O A==;
X-CSE-ConnectionGUID: Jg7ZjX9/SsKST1fxv/8PZA==
X-CSE-MsgGUID: HF7WIQhJSL6cB0OFIMktfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61687793"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="61687793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:29 -0700
X-CSE-ConnectionGUID: YgONW0bDRpKwXBYRIEywjQ==
X-CSE-MsgGUID: J9kPBXaCQ8qqQfkl5SQp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147558004"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:28 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH i-g-t v4 3/9] lib/igt_nouveau: fixup print formatting for
 files in lib
Date: Tue, 27 May 2025 12:04:15 +0000
Message-Id: <20250527120421.79026-4-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527120421.79026-1-jan.sokolowski@intel.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print formatting warnings.

Fix formatting by using proper formatters, eg. PRIx64.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/igt_nouveau.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
index fdf6020a3..62a53c8b1 100644
--- a/lib/igt_nouveau.c
+++ b/lib/igt_nouveau.c
@@ -96,7 +96,7 @@ uint64_t igt_nouveau_get_block_height(uint64_t modifier)
 		gob_height = 4;
 		break;
 	default:
-		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %lx\n",
+		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %" PRIx64 "\n",
 			      modifier);
 		break;
 	}
-- 
2.34.1


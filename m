Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADE8CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120A910E317;
	Mon, 15 Jun 2026 09:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFUWUQQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8479310E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515909; x=1813051909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mNeisA0tcRMf5uZ1MP4QD7zEsTBLv54EHDgR2bsNvn4=;
 b=aFUWUQQWAuNWhxkwGZHEWniD/3oqMY3DEuqfN0bvgRrHyBykCGk475mV
 KUh6x/SRMeqT1pMYS5YAAZXk9FhYW+FCqoLtTfgHWeWJu4AhOBWGSV/IO
 rgMYfjX4rRzJQQIhbzUecJAb29w74+7DBz/7Xbo/nkGt6EHvonh0t4rCr
 LSV/tT+LIR9aviddAcxXM5imBR8bGwoD16v4f3XSABN4+QQGOUxyYwN8D
 sM0HaM7vLytGoz4sorrNMsgxcpWbwSJg/lerV214U6hOTqjyRXPqm7QIg
 lAB2MEy8dDTvycTQTOiIN9L6j/R4HSfNZDeZfpDIv291/1yg0b6DdBqjR Q==;
X-CSE-ConnectionGUID: dO+dag5NRVOyMpmI6bq80w==
X-CSE-MsgGUID: jbw14IDkRuCDbfbKQJedjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82235889"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82235889"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:31:49 -0700
X-CSE-ConnectionGUID: u+LnY8EFQAKpX5ve2Dce6Q==
X-CSE-MsgGUID: tuDxoyoKQzqCUAmx5jxEaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247465285"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 02:31:49 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 05/10] tools/vbt_decode: return 0 from get_device_id()
Date: Mon, 15 Jun 2026 11:31:32 +0200
Message-ID: <20260615093137.681050-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615093137.681050-1-michal.grzelak@intel.com>
References: <20260615093137.681050-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

This function returns -1 on errors and the caller checks for 0. This
leads to -1 being used as the device id. Return 0 instead of -1.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index ab0ad5ada6..0956d34dc2 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3702,13 +3702,13 @@ get_device_id(unsigned char *bios, int size)
     int offset = (bios[0x19] << 8) + bios[0x18];
 
     if (offset + 7 >= size)
-	return -1;
+	return 0;
 
     if (bios[offset] != 'P' ||
 	bios[offset+1] != 'C' ||
 	bios[offset+2] != 'I' ||
 	bios[offset+3] != 'R')
-	return -1;
+	return 0;
 
     device = (bios[offset+7] << 8) + bios[offset+6];
 
-- 
2.45.2


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F6CCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 08:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AB310E5C2;
	Tue, 28 Oct 2025 08:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WY5WS5U8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A667310E5C1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761641040; x=1793177040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+DtHIar7uVrbnH0iRdJQOR4iqeIvF/dn7t7eY4e8mzo=;
 b=WY5WS5U8YMTkbrspObCIzjnLAw1RROlRj1a/E3m096RF652HTwQHL4/b
 tCFF98xpDTrH4SYXH9oiql035G98WiqgjzShWzxGkRideTbbIMMU6dgb9
 Cw3nmJoJ68NmtV3n/RiiArFBOHX6dnnLvAn2mrVu04zlUbytPszFWP76D
 LxpNhi//gx8+JM7WLqsE52Qm1xrKykB32lS+2JoaK8R1DCkoY4Yi3XoaH
 Gjxf8C3v7JgUgdEZ7JGpcI/mqMLhvrazOqEt4EPP/UkaX6hHM+SH6K8wj
 3827s44HZ3EWkJs4yoscvag6iZpYTmzwsNrhInNpLsVoSypEN0tQxZryt g==;
X-CSE-ConnectionGUID: dYP/SGjHSyKn4Q1Px0GHTA==
X-CSE-MsgGUID: MhMYSXrjTsqqwo9hbPrKbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74854367"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74854367"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:44:00 -0700
X-CSE-ConnectionGUID: qS5V1c9JRJGBMGKkRQD5Vg==
X-CSE-MsgGUID: os3Iz11gRmutr0qlxqibmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184914695"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 01:43:58 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com
Subject: [PATCH v1 2/4] tests/kms_vrr: Avoid direct assignments to data->flag
Date: Tue, 28 Oct 2025 14:13:52 +0530
Message-ID: <20251028084354.2682743-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
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

Avoid direct assignment of flags to data->flag to avoid
overriding of previously set flags.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 8347a3e00..d677a0a07 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -881,7 +881,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 	prepare_test(data, output, pipe);
-	data->flag = flags;
+	data->flag |= flags;
 
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
-- 
2.48.1


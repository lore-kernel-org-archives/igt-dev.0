Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECD8F3C241
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 12:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1320410E4DE;
	Mon,  9 Mar 2026 12:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJitXt+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D82610E4DE
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 12:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773060027; x=1804596027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Yj3zcZnkfywV1bpyhucJTk0Rdh1DUwoEGOgxGA4bEk=;
 b=IJitXt+/j86z40pUb+xWonqSVI8583sbBb3MgsIRnIPCOlkotAzcCbIY
 JAnZZucHb5MQGuCdNF8S7TUjqDpUQxzjGg2pfvEL8eQ6CXEZBaSle3LQu
 cjs/XlzCWOmRVyEhTxwcC8E1oaB7HQ6ZyfdY1tgqffkAy1kkMCO+kGg2d
 NztFTiT0x3Wd58ywGfr5FLqAv3Fh9jQIzg/cskn7AFcehratkwWnl1P1J
 xyHWaTrv8RPH4lpt4Vbf1Ucvk6zAYpbDiyZsDb8+e1QZLySrzw/+fe9/W
 XZgvTCsxBA3jpAQ0N8jl1nexFDtxGuEMMZQywdQdlmO1G7CWF+F7FVEQN A==;
X-CSE-ConnectionGUID: pZqEgwxaRzGihyqK8MUxIA==
X-CSE-MsgGUID: 90vf/Y9FTsyR24wSJbONKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73958084"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73958084"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:40:26 -0700
X-CSE-ConnectionGUID: VUhhIEPsR12OQx+SW2Sqcw==
X-CSE-MsgGUID: 6MnCR8jsSMaR+geoZzSXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218952861"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:40:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 1/3] igt/kms: add some braces for clarity in
 __igt_pipe_populate_outputs()
Date: Mon,  9 Mar 2026 14:40:12 +0200
Message-ID: <b53e88d825683f3bd506f047221d303f55cd7c78.1773059939.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773059939.git.jani.nikula@intel.com>
References: <cover.1773059939.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Some of the else branch braces have been omitted. Add them for increased
clarity.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3a23d62267e9..9326226499a1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3619,8 +3619,9 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 
 				if (i)
 					continue;
-			} else if (__builtin_popcount(pipe_mask) != i)
+			} else if (__builtin_popcount(pipe_mask) != i) {
 				continue;
+			}
 
 			for (j = 0; j < igt_display_n_crtcs(display); j++) {
 				bool pipe_assigned = assigned_pipes & (1 << j);
@@ -3634,12 +3635,14 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 					assigned_pipes |= 1 << j;
 					chosen_outputs[j] = output;
 				} else if (!chosen_outputs[j] ||
-					   /*
-					    * Overwrite internal panel if not assigned,
-					    * external outputs are faster to do modesets
-					    */
-					   output_is_internal_panel(chosen_outputs[j]))
+					   output_is_internal_panel(chosen_outputs[j])) {
+					/*
+					 * Overwrite internal panel if not
+					 * assigned, external outputs are faster
+					 * to do modesets
+					 */
 					chosen_outputs[j] = output;
+				}
 			}
 
 			if (!found)
-- 
2.47.3


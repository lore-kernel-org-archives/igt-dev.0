Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F43EF9014
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 13:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8964910E1D6;
	Thu,  5 Mar 2026 13:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HmZufd8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E59310E1D6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772718057; x=1804254057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D2H5hSvd1CQa9by4Wx+6TBhjoldwCBFEmolYs3h1jek=;
 b=HmZufd8ug2VdVYJW0QkmW5hlkREdYJKtA1C77SV/NCpu3R1rCBzyMKo1
 Tn8pNZ41VBBCLQchHvjmU92YQNf/AwIYbaehTl+L3MM7xU+qNYeheD3ws
 nUSm7ol0mjlsoosD3d5ebRDjOPMNrXw1aNcumanSEyY9+zasH4+yZaUWX
 DrEFR5ud6JYJDUGK5k7J5GxrKyFYHmoEtMh6ZQb5KsTmZwTYSOw29n89u
 QIWANj2B37l0M7ufTxnnfFEIn37+R3omHx1S2CY7A3Pc9o44Fvqk83SyT
 u9sp+eZOcGRO42RpXwK/68GptPxTM/tt8D9y3AtxMCxSp0n/5vzaGPiSN g==;
X-CSE-ConnectionGUID: 08fZib9bRaGCPGwc3QQjDA==
X-CSE-MsgGUID: XxXeIl6ZQCKqTTLxlyf2EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76404987"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="76404987"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:40:56 -0800
X-CSE-ConnectionGUID: YOc6BkMuShmnuIDcu0WeiQ==
X-CSE-MsgGUID: uGWmBHVXRNGlOiPDHWhH8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218641239"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:40:55 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>
Subject: [PATCH i-g-t 3/5] tests/nouveau_crc: Use igt_first_crtc() instead of
 igt_crtc_for_pipe()
Date: Thu,  5 Mar 2026 15:40:36 +0200
Message-ID: <20260305134038.6995-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The specific CRTC used for the ctx-flip-threshold-reset-after-capture
subtest supposedly doesn't matter, so find one using the more hardware
agnostic igt_first_crtc() rather than igt_crtc_for_pipe().

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/nouveau_crc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 59fa8a2daeb8..b71aac45bb79 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -401,8 +401,8 @@ int igt_main()
 	igt_describe("Make sure that the CRC notifier context flip threshold "
 		     "is reset to its default value after a single capture.");
 	igt_subtest("ctx-flip-threshold-reset-after-capture") {
-		data.crtc = igt_crtc_for_pipe(&data.display, PIPE_A);
-		igt_require(data.crtc->valid);
+		data.crtc = igt_first_crtc(&data.display);
+		igt_require(data.crtc);
 
 		run_test(&data, test_ctx_flip_threshold_reset_after_capture);
 	}
-- 
2.52.0


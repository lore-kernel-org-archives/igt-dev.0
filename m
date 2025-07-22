Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EA4C83F25
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 07:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1996810E30A;
	Tue, 22 Jul 2025 07:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kB4/kGkR";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB88710E30A
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JqxHBTpqUhh8jt+XaBD3AXbnn5NReeLSJrNJv3HwK+A=; b=kB4/kGkRsv3mp8CRcSZXdFGfmb
 wFxs48KG806SA1HS47rAQE5dqk8QtALTjPL97/6AabfQCc3cl+FcqLyunm4fXd5i5HS5uLl7UqYgt
 iIK7Ei6GM91CssSF52D3mbn/O0S0vFUxvPmKZgYAiDoRqeSqpf/z5l3cLHVpnnn3v80gV5pXCjT16
 mCczX0yQLv01C75RwnOE74Vp5/WY5xIm+byM9jXGsneDB5ltk8ZgCSmw7k1qhEHUYuUcEpwbslKyd
 PBbvnXtyX20EmFOMaoFbrYAaB0kf9Rgy4A37gV8A6DdWcwjHXDaH2pQy6RIzJDHL+i93ag8e57bQB
 qk01GeFw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ue7ag-0022kJ-Oi; Tue, 22 Jul 2025 09:39:10 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>,
 Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t] lib/intel/veboxcopy: Respect buffer MOCS index
Date: Tue, 22 Jul 2025 08:39:06 +0100
Message-ID: <20250722073906.99759-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Set the MOCS indices in surface state from the source and
destination buffers. So far it was done only for the input
buffer and only for 4Tile formats. Always setting it alings
with how rendercopy does it and it fixes the AuxCCS tests on
ADL when target is of the MC flavour.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
---
Lets see what the CI will think of this change.

Curiously the AuxCCS tests where target is RC, so rendercopy
which does set the MOCS correctly is used, are still flaky so
that sounds like a different problem.
---
 lib/veboxcopy_gen12.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index 4e3aefaf1f44..2193433a1c00 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -258,6 +258,8 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
 
 	if (HAS_4TILE(ibb->devid))
 		tc->tc1_2.input_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
+	else
+		tc->tc1_2.input_mocs_idx = src->mocs_index;
 
 	tc->tc1_2.input_tiled_resource_mode = src->tiling == I915_TILING_Yf;
 
@@ -278,6 +280,8 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
 			dst->compression == I915_COMPRESSION_RENDER;
 	}
 
+	tc->tc3_4.output_mocs_idx = dst->mocs_index;
+
 	if (HAS_4TILE(ibb->devid))
 		tc->tc3_4.output_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
 
-- 
2.48.0


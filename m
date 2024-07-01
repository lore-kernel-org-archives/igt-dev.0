Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22624C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 08:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD71110E355;
	Mon,  1 Jul 2024 08:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="sGFs+Onn";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899F610E355
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719823164;
 bh=AASctONl9XpUSbN+qzdsw97UU2sbpRFPCC56G0xsuok=;
 h=From:To:Subject:Date:From;
 b=sGFs+Onnro/G0+1AlCCB24G1sFHm9ebdrI4XDHHiRk/63DVWKlh728gFZB1vzWs1C
 RRsU5BKm5wwTMpGDBb86KkLAm+qExGEYZ8Z0A2Cyw+mo/X3ip+1Zc5ytdV4N9Kjgwo
 O85XVUeEH0MaIWbzrhfGXWCT4TRhg4AzOWJxGtfx9ndgZ5qqDEkkSBKB/nJNBGEs15
 eH7RGNrVoQwfgXpE2cfLrQp57aLXpAMwxx/ZPAGq9jqpNlmCzve8DEgIPzKtUcQmyy
 onTDU/r9M2Q/9u9PT8qZN8kUnhpQNE0m7c0IOARX/0fnhSjJAvaabEmh9sOt5dswfv
 d2EdSPocma2hA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9DC643782109
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 08:39:23 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v1] docs/chamelium: update broken links
Date: Mon,  1 Jul 2024 14:07:56 +0530
Message-Id: <20240701083756.417697-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
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

The previous links to the chamelium documentation
and setup instructions were no longer working.
Update with new valid links.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 docs/chamelium.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/chamelium.txt b/docs/chamelium.txt
index f82c8b0c3..35a7a75ac 100644
--- a/docs/chamelium.txt
+++ b/docs/chamelium.txt
@@ -47,13 +47,14 @@ Chamelium V2 Documentation
 --------------------------
 
 Documentation about the Chamelium is made available by Google through the
-ChromiumOS projet wiki: https://www.chromium.org/chromium-os/testing/chamelium
+ChromiumOS projet wiki:
+https://www.chromium.org/chromium-os/developer-library/guides/hardware-schematics/chamelium/
 
 Setting up Chamelium V2
 -----------------------
 
 Instructions from the ChromiumOS wiki detail how to setup the Chamelium:
-https://www.chromium.org/chromium-os/testing/chamelium#TOC-Setting-up-Chamelium
+https://www.chromium.org/chromium-os/developer-library/guides/hardware-schematics/chamelium/#setting-up-chamelium
 
 The should be followed up until the "Setup your Linux host, DUT and the FPGA"
 section. At this point, IGT has to be configured to connect to the Chamelium.
-- 
2.40.1


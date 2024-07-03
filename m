Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18A3C30658
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 01:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9363A10E012;
	Wed,  3 Jul 2024 01:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DE88h9Yr";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9345510E518
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 01:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719971788;
 bh=facNx/IxLHim5Y/t4wDRDCy+xbtIE7yEn6FuujSxbjs=;
 h=From:To:Cc:Subject:Date:From;
 b=DE88h9YrojrMBcxY132kqEBhchg9sOQxRA9QtUOo7vsORJy+lAo88bih3Lv+ljHyf
 8Bc3rbma9AQxeqzggzg7O4R7uxGJjPTKcdu8uzXYS47QhC99NcKf9hdsZl7SW5JbPW
 R1Qw178mlKrRCsCE9pXOl0Ri4Zby5KMpyuh0YZ9+sqVgQtFYxE8IOZ1/NwNNEMrdPm
 CgTYz3TbsMPnmR/n5clQSpadeY5279t+AuUVN/DyE7ohXNkOccMdVpGeM+F5XKlxko
 w5vFKqMKi00RdDlY4KXSggjczmck5z89PvYUqykEtelCxWZc9oNP89fHi+zjFy9N3H
 ZRKsHoPvDVsBg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9C6B637811EB;
 Wed,  3 Jul 2024 01:56:26 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: robdclark@gmail.com, robdclark@chromium.org, helen.koike@collabora.com,
 daniels@collabora.com, kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v2] docs/chamelium: update broken links
Date: Wed,  3 Jul 2024 07:25:14 +0530
Message-Id: <20240703015514.688088-1-vignesh.raman@collabora.com>
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

Cc: Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Helen Koike <helen.koike@collabora.com>
Cc: Daniel Stone <daniels@collabora.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 docs/chamelium.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/chamelium.txt b/docs/chamelium.txt
index f82c8b0c3..64f851c28 100644
--- a/docs/chamelium.txt
+++ b/docs/chamelium.txt
@@ -47,15 +47,16 @@ Chamelium V2 Documentation
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
 
-The should be followed up until the "Setup your Linux host, DUT and the FPGA"
+It should be followed up until the "Setup your Linux host, DUT and the FPGA"
 section. At this point, IGT has to be configured to connect to the Chamelium.
 
 It may be necessary to give the Chamelium a static IP address, depending on
-- 
2.40.1


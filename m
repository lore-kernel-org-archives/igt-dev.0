Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8A1C54E67
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 16:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4635C112332;
	Fri, 15 Mar 2024 16:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PwCwCNhs";
	dkim-atps=neutral
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3245711232F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 16:08:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFC9C1BF204;
 Fri, 15 Mar 2024 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710518927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o0TcJE8hq+5adEOd/DGrFvU2ITZ2M1QNdhMJQ+rkKQo=;
 b=PwCwCNhsK6E1xnkhAaqlTnUV19p6xrnw925K0C5xlXl6rddLagljoWtbRZnTPNnmpbdRq+
 SS0WKZ70Y0ZNwayRw+EE7L1zbdLAiLlv3h4InQUKRNI8vGC/P/hGOZUTqLGOH1WY75MNcV
 HdMUeQ0V/OMSIyPMWCJ59sdVFAe7eYsdj1qBkB4Tvwg+iNXqsHRdt25WcijCNmql1EW1gk
 FpAkeCsVjL6ARiDH63Nx2JRHl7fkUews0IkCWn6VXXjqeIlXxvMwiR6gLoeiC6O3yglaze
 DWeqp/QZwfK/nvQoSHGN5y5d6r4Cx63YrrIQWTGX3DzZp+O+sFtWea8wIzjEdQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 15 Mar 2024 17:08:37 +0100
Subject: [PATCH i-g-t] CONTRIBUTING: Add coding style guidelines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIRy9GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDY0NT3cSUlPjk/JTMvPT44pLKnFTdJHNTUxNTk5RUS1MLJaC2gqLUtMw
 KsJHRsbW1AL/Me6BiAAAA
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com, 
 arthurgrillo@riseup.net, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, kamil.konieczny@linux.intel.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=M5WWKXfgO0NCoJGABlpFln6sTcqkx9GotT/6i9Eej98=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl9HKOSTYlFlzqpYYziMsSVV6yDYqBINWwrjb/XEdT
 5uggcmyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfRyjgAKCRAgrS7GWxAs4h+sD/
 0QbwBqJYZs5LHbhLK2ZaRgJyGDcUkPkbp8Mtp286jn7LaGFCJ7e+355htXqtwGf2QUQ906nUz3QiqY
 4J3ogK/vhjUblZEiZiZ5AkyCEhmJvzXiyRmYeNkU6hAHx1eEp5iljfeNAQ0SWojEGstth13gPUAhLF
 uuNq3jRxbfuEYuX0i5g9L3nB83go3p/yZ3J2YTL5F+AZbrBOuaRQdfb1VkzMXgncrBhehpxPK1pkZD
 poloQszBx13ahDfSxYTwQN1ZtNIamBDrBRznPrwTh6vOv2chBi6UC2SpVHNfh1EXCIA/gAHFq/zlxZ
 +wyHL812AJRmW/fpLasaayjw32Bx/9YVIzFodnJ3TYxdJpEIP4QzVzoqomCix14Es7cf45t+eMFAW5
 nfyc05xJGeRl5tEgBz/q4qvDvGHygFqAbfk6G0ocl0y7HSgwJXR/t9IoF3YqE5/mHmhyiUNcpa/GaX
 UqGOSNAzbs+RWIHmqFUz9qtlIcokspobZYl+0ezJtREpl6IsSaRXNliNp+nTYUxFYlQulBP/moESMz
 TPNv+cgddRbuvFpadwg93k5JyL9GU4QtmWc5P2NPFf4IgYB1hTu1jRz+TBFleLTPkr98at00xxkIs1
 2asuOK6b4FoxksRBmU+KfK1umJcBB34B14Qt5IYl0mMQQ3nEWGERuc7KbJJQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

As explained in [1], the submitted patches should follow the same style as
the Linux kernel and must be checked against checkpatch.pl, so add this
recommendation in the CONTRIBUTING.md file.

[1]: https://lore.kernel.org/all/20240314170643.77vzqqoie2otyu4w@kamilkon-desk.igk.intel.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com
Cc: thomas.petazzoni@bootlin.com
Cc: jeremie.dautheribes@bootlin.com
Cc: arthurgrillo@riseup.net
Cc: seanpaul@google.com
Cc: marcheu@google.com
Cc: nicolejadeyee@google.com
Cc: kamil.konieczny@linux.intel.com
---
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com
Cc: thomas.petazzoni@bootlin.com
Cc: jeremie.dautheribes@bootlin.com
Cc: arthurgrillo@riseup.net
Cc: seanpaul@google.com
Cc: marcheu@google.com
Cc: nicolejadeyee@google.com
Cc: kamil.konieczny@linux.intel.com

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 CONTRIBUTING.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 2ab8a48f6ae9..ec8debb4091e 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -78,6 +78,8 @@ Sending Patches
 - Changes to the testcases are automatically tested. Take the results into
   account before merging.
 
+- The coding rules are the same as for the Linux kernel. To check for common
+  style problems, you need to use the kernel's checkpatch.pl script.
 
 Commit Rights
 -------------

---
base-commit: ed47dd9fb6b5be6c88513c2816f0f7cfdd0e02f6
change-id: 20240315-add_coding_style-b755454de958

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>


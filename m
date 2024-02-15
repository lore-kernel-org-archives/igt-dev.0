Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6E4C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 19:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA2710E22C;
	Thu, 15 Feb 2024 19:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="tZKFhbTI";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D1E10E22C
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 19:21:15 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TbQ0B5nBYzDqQw;
 Thu, 15 Feb 2024 19:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708024875; bh=w3zSHadg1dS/yKRcYT60ydqkQ30AOeadLWci8M4hl9g=;
 h=From:Subject:Date:To:Cc:From;
 b=tZKFhbTI0jaBcnGVJ+3S5DEhGGmeTclxJEVzz+SLZ5Ed8sqFJeQTBkUDPmg+m71il
 rlgyq0C6t184OVcJNDmILRBeFmjhMi1v0EarX7hbegZcOF9ElxQX/6B87uHnhx403u
 sV21s+TwXBXPUbnYU0iYdsaLeuFUmenzZe/wawX0=
X-Riseup-User-ID: 2C826A7CA33DB34015738D363809C55474413E8A9131973D5A92276D02C1A1A0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TbQ0712NCzFskl;
 Thu, 15 Feb 2024 19:21:10 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH i-g-t 0/2] Fix needing to call igt_display_require() twice
 to enable writeback output
Date: Thu, 15 Feb 2024 16:21:03 -0300
Message-Id: <20240215-duplicate-calls-v1-0-512afbe1bda7@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACBkzmUC/x3MTQqAIBBA4avErBP8SYiuEi0GnWpATLQikO6et
 PwW71UolJkKTF2FTDcXPmKD6jtwO8aNBPtm0FIPUisr/JUCOzxJOAyhCCRjnMbRWvLQqpRp5ec
 /zsv7ftoNHJFhAAAA
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, 
 Arthur Grillo <arthurgrillo@riseup.net>
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

After discussing with Pekka Paalanen about needing to call
igt_display_require() twice[1], I found the issue.

As stated on the docs[2]. To enable DRM_CLIENT_CAP_WRITEBACK_CONNECTORS,
we first need to set DRM_CLIENT_CAP_ATOMIC.

Patch #1 solves the bug and #2 uses the fix where the duplicate call is
done. I couldn't run kms_writeback (VKMS already fails on this test and
my GPU doesn't have writeback outputs), so please test it.

[1]; https://lore.kernel.org/dri-devel/20240212104330.7de30010@eldfell/
[2]: https://docs.kernel.org/gpu/drm-uapi.html?highlight=writeback#c.DRM_CLIENT_CAP_WRITEBACK_CONNECTORS

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: igt-dev@lists.freedesktop.org

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
Arthur Grillo (2):
      lib/igt_kms: Enable DRM_CLIENT_CAP_ATOMIC before enabling DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
      igt: Remove duplicate igt_display_require() calls

 benchmarks/kms_fb_stress.c | 2 --
 lib/igt_kms.c              | 5 +++--
 tests/kms_writeback.c      | 1 -
 3 files changed, 3 insertions(+), 5 deletions(-)
---
base-commit: 9ee96f431b2baf552e95c9d839cdfbcdae2c8b41
change-id: 20240215-duplicate-calls-ae33c2a855ed

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>


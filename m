Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4454D44C41
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C8D10E74B;
	Thu, 15 Jan 2026 12:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eg9RjND7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1892010E74B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768481861; x=1800017861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FZs93X5DCF0kXv9RYiviSPEZvGsfTRCQ4qY8FCxdrjs=;
 b=Eg9RjND7k9Ni4GGTXOT8JPVAdgdm+/3txWftc6IqTMQTnWyEI1Gf4Aib
 3YyfThE3jDRBxkclXFntTI0xoqcJ4Qz5XJZrvf2lvoY9g8xYLQBuMZ3Lp
 JXJXT7BzJyOOOkfiaZfgC99J3QUWQxa8RTPnvz6Tod9cF3KrIQunZlsbC
 +tBYzJSqrdWTbO7C6R0qCv2ld0QlpUyttCQWqxIvZRpLhOuH7YjNAmf4j
 l+oCG85eQRzsyg15i4z/D3bGheOFZp++3qncBL4C08pBrQ2PbFuJ1QaPx
 koVbRFAh1/6c+hsugs5IXbG4SBmLO+Yj1SW8+D7So1XGEoUoxav4vEnd5 Q==;
X-CSE-ConnectionGUID: Kbi5ZlckQvOV137C77Wn2A==
X-CSE-MsgGUID: O3CmhMxaTj6he/42EaRCwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73628816"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="73628816"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 04:57:40 -0800
X-CSE-ConnectionGUID: MzA1vroxSqykKPhH/iPbAA==
X-CSE-MsgGUID: sHNg46F1RoWZoTTbJgCWRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204093182"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.21])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:57:38 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Mateusz Grabski <mateusz.grabski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>,
 Piotr Kira <piotr.kira@intel.com>
Subject: [PATCH i-g-t v2 0/2] RFC: cut successful dmesg logs
Date: Thu, 15 Jan 2026 13:57:28 +0100
Message-ID: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Lets reduce dmesg logs in a success case. This should work fine
for cases when CI will collect dmesg outside of igt run, or with
this v2 proposed change to compress them (so the dmesg will not
be lost).

This is applied only when there are no warnings in dmesg and
when its size exceeds 256KB.

I am not sure if this should be one option or two, or if it
should also compress dmesg with warnings. For example: few lines
from begin, snapshot from first warning, few last lines.

v2: add compression of dmesg in a separate JSON object dmsg.gz
  and then add reduced dmesg

Here is a run on trybot: https://patchwork.freedesktop.org/series/160100/
RFC: add compressed dmesg and reduce it

For example one timeout from it:
https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_1000/shard-snb6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

scroll down to see:
<7> [244.520290] i915 0000:00:02.0: [drm:drm_client_dev_restore] fbdev: ret=0
...dmesg reduced from 1626729 to 262024
...saved in dmsg.gz in json

Here is one from pass with reduction:
https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_1000/shard-rkl-5/igt@kms_plane_multiple@tiling-x.html

Log from runner show which ones were changed:
https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_1000/shard-rkl-5/igt_runner20.txt

and from there it could be seen how good (or bad) was compression
with base64 encode:

results: parsing output: 28/ for test: kms_plane_multiple
igt_resultgen: Compresed dmsg.gz with size reduced from 435655 to 53273.


Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Mateusz Grabski <mateusz.grabski@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>
Cc: Piotr Kira <piotr.kira@intel.com>

Juha-Pekka Heikkila (1):
  RFC: runner/resultgen: add compressed dmesg before reduction

Kamil Konieczny (3):
  runner/settings: Add new option --reduce-dmesg
  runner: implement dmesg reduction for successful case
  HAX: runner/resultgen: set reduction for dmesg bigger than 256KB

 runner/resultgen.c | 163 +++++++++++++++++++++++++++++++++++++++++----
 runner/settings.c  |  36 ++++++++++
 runner/settings.h  |   1 +
 3 files changed, 188 insertions(+), 12 deletions(-)

-- 
2.52.0


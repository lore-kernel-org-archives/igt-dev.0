Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F50C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 18:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981A910F55E;
	Thu,  2 Jul 2026 18:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5SEwlEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2FD10F55E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783016799; x=1814552799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L0/pij3RGdWf9KdBVupopfHP67RoRkT9NC5LMhUxLLk=;
 b=N5SEwlEzW3gMbbKwCSOLIqIIFUxgYGjQkSYYA6EmAK7AiBNHGtsR7YWu
 8v5wHt6W1XDMyUo4bsrnn/vAiMsS2sJwiuoELaT8AHOCeN2H4eUyZVwwB
 nxIPITXQXmGxR+8ot8UkUDS1ZjAfpZi1wMnp+Xtr8piUEPNoiDOdfXNvg
 vueBJHtILhUSaOgDOGfTUKyVoFp3gbKUHGZHUZiDYZo0pd3x8Y8j02dog
 Dw2D1bnaPEUR+4fYtEFHUa/oA1jlckEy6hNg8xOccReUy7rKjXGYiOUsj
 DynFx08ptUMLgC46uFVm9pAelO6lLK5uC345Y9/FkGqiG7JIwlRDtsOE4 w==;
X-CSE-ConnectionGUID: 7BP6LZlrQKGtdk4PRGSIJQ==
X-CSE-MsgGUID: gWvEhOAbQwiRbGXrBDw6fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95154699"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="95154699"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 11:26:38 -0700
X-CSE-ConnectionGUID: PXkoQhekReiDngH30uFIAA==
X-CSE-MsgGUID: aTxIUBBmQ2aRmnfPY7ukdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="253577091"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 02 Jul 2026 11:26:38 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 0/7] Vswing / Pre-emphasis Override decoding
Date: Thu,  2 Jul 2026 20:26:12 +0200
Message-ID: <20260702182619.3973788-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
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

Next version of [1]. v9 of kernel part is at [2].

[1] https://lore.kernel.org/igt-dev/20260616111202.1254067-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/intel-gfx/20260626234246.2446451-1-michal.grzelak@intel.com/

BR,
Michał

---
Changelog:
v4->v5
- show all Combo's columns
- change shown format of Combo's tables

v3->v4
- rebase onto master

v2->v3
- show whole invalid DEVICE env var (Jani)
- return 16 rows on MTL instead of 10
- use Cx0 for Snps

v1->v2
- check platform basing on devid not VBT signature (Jani)

Michał Grzelak (7):
  tools/vbt_decode: fix tables' offset reading
  tools/vbt_decode: rename VBT#57 related vars
  tools/vbt_decode: validate DEVICE env var
  tools/vbt_decode: parse & dump VS/PE-O tables for LT
  tools/vbt_decode: parse & dump VS/PE-O tables for Snps
  tools/vbt_decode: parse & dump VS/PE-O tables for Combo
  tools/vbt_decode: change VBT#57 Combo's layout

 lib/intel_chipset.h      |   2 +
 tools/intel_vbt_decode.c | 179 +++++++++++++++++++++++++++++++++++----
 2 files changed, 166 insertions(+), 15 deletions(-)

-- 
2.45.2


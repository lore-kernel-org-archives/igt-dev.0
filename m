Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BCCFCE07F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 13:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C571710E92D;
	Thu, 26 Feb 2026 13:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JrzvtFVn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5439110E92D
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772112882; x=1803648882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hvQ8dy1m5nkw/fk+QQj1huz8bQM7J3jJqLbFxPGRONo=;
 b=JrzvtFVn+ggZf3wlyN3aNY+jRcqWjW3VLLCpcVyYd1a1M0Y0II33eC/H
 bsdbrBR5PKP2HxcmDIH7B77dY4xN73EsueWO+21Tin5rRZVE0rJCwmV+A
 GimhhCivPsvC0CZXVtawC4ZftzEoomlKJWBEAritkEjeqTc0Q6HN9Z0h1
 YSW+4ZJWx5W17QttIcrbNPYkqZElNQSG2j5CFgkqqhMrfMth+Vk5Sjr3d
 BnYi4XicTGCJsQwT+g2MxxiuT7tjnNOp/lClfJqsYhjEv2uEJucu4aTjK
 uOtfmaQKb76pOZ9DNdzejnMAjJohIaZsmhJ+xi8+UrD1KYLkz/UX8ryv6 A==;
X-CSE-ConnectionGUID: HZotq/hzQHS1psLdAj205A==
X-CSE-MsgGUID: g1CT8V5LS7m4xVEH1hvrKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95789621"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="95789621"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 05:34:39 -0800
X-CSE-ConnectionGUID: 0OI04szoRGi67wgTM3r2cg==
X-CSE-MsgGUID: 1jA5LptASU26lXSf56RWOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="247096211"
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 05:34:35 -0800
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Jan Sokolowski <jan.sokolowski@gmail.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 0/1] Bash autocompletion feature for igt
Date: Thu, 26 Feb 2026 14:39:15 +0100
Message-ID: <20260226133916.33621-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.43.0
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

This is a RFC for a feature that I've found to be useful not only
for me, but according to the rest of my team, to be of use to other
igt developers and users, that is, bash autocompletion feature.

This patch currently only has an incomplete support for igt tests,
and supports following suggestions: --*, --run-subtest *, --device *.

Signed-off-by: Jan Sokolowski <jan.sokolowski@gmail.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Jan Sokolowski (1):
  scripts/bash-autocomplete: Create autocompletion for tests

 meson.sh                                      |  6 ++
 .../install_completions.sh                    | 88 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100755 scripts/bash_autocompletion/install_completions.sh

-- 
2.43.0


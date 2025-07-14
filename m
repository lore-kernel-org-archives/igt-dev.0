Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BFDC83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 12:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFA810E477;
	Mon, 14 Jul 2025 12:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4J95CaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526DE10E48B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752494399; x=1784030399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LzrZXmm7aGrfKxvwdUKBTAbejlJDvtzO+8TTwNtaLBQ=;
 b=J4J95CaMPrjYApx3tHriRQzmVcgYN7WQ64qN/xk/h74q1+mZuQM28Xra
 gAvPj1/uV/o7ndvhWMaED2mvVA4dueCXtpjmNefLenHs6FHfJKw5maQFI
 0/NdPGthTGMUC/kGN7BeIKx+LAfkSg3j2mqu067U77brQbfrXOzUDXuPW
 jOJjGDEVGZb+htKk98xNzVrwqrWuCinqUiovqqaKRxL1JwDS+FFFh17+c
 6tR7JkVV+d1Tp2M4fPOYfMrMWiWOK7PehLx/c4OvASTXF6CJjraJllPaE
 Kpmw3Xk3/EqGUo+aPezHAtXxfYRt60Iv20U8OCg51jBFPsXbtsTWh/TWs g==;
X-CSE-ConnectionGUID: rI6h+ZM+RP2+UGuTV3wpeg==
X-CSE-MsgGUID: 0+DEXo/xR6CFnAvHoqVrow==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77220226"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="77220226"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 04:59:58 -0700
X-CSE-ConnectionGUID: tWuAt6/tTCqrnpInl9PPUQ==
X-CSE-MsgGUID: kG8oyZVqRCqJRX4Uts8QyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156333440"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 04:59:56 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Jan Sokolowski <jan.sokolowski@gmail.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v1 0/2] RFC: Bash autocompletion feature for igt
Date: Mon, 14 Jul 2025 12:01:28 +0000
Message-Id: <20250714120130.464545-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

This RFC currently only has an incomplete support for igt tests,
and supports following suggestions: --*, --run-subtest *, --device *.

Before I'll continue with the work, I'd like to ask what are your
opinions on this feature? Which tools other than tests could benefit
from having autocompletion added? 

Signed-off-by: Jan Sokolowski <jan.sokolowski@gmail.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Jan Sokolowski (2):
  RFC /scripts/bash-autocomplete: Create bash autocompletion scripts for
    tests
  meson: Add bash autocompletion install step

 meson_options.txt                             |  5 ++
 .../install_completions.sh                    | 47 +++++++++++++++++++
 .../uninstall_completions.sh                  | 10 ++++
 scripts/meson.build                           |  4 ++
 4 files changed, 66 insertions(+)
 create mode 100755 scripts/bash_autocompletion/install_completions.sh
 create mode 100755 scripts/bash_autocompletion/uninstall_completions.sh

-- 
2.34.1


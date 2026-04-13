Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7932F531CB
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 20:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35710E52D;
	Mon, 13 Apr 2026 20:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpM4TxZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C2A10E52D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776111458; x=1807647458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h1YvIvukKhW8DHP15e3YlWPIi64sCR7d+NVuKk2arTo=;
 b=WpM4TxZe4tWwTSbNyEFt9LiA8sQbgFuSNZuqvD7y29/8xedyChPBHoYv
 ACfF7ZlzNP8DTlL0qmcy6REKgccxEM0OGh08U5Wlk/tqUN4sw/enb2RX4
 zKHOKCE5L20rgwqRiY1pHBlEFWv2zOagowOvgqbohIn1dm9RGJUpicbpE
 Gx7iXs/Eb4391inpUXQmdbgaxrchBDLN9pivV5fBvIzRf/htFin6Ucj9C
 JWdr8LzQWzFQy3iGGR75iJrZbO8L3rkAjrtOVZfQqkYermAJ6C4cyVJv2
 oPON6dfr0H8yKW0yOau5AIpyglOlGsJaNzjpPI6e+4C8gwRFTXRjlmsLl g==;
X-CSE-ConnectionGUID: gz5McnivQkSKjgXVR1pQgQ==
X-CSE-MsgGUID: WaZkD+2MRYqYXV9lP13swA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80918897"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80918897"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:17:37 -0700
X-CSE-ConnectionGUID: yFuINViTQ6WO6/ttvwAkvg==
X-CSE-MsgGUID: TIhx8r2uSBS4kL1XbQ/GHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="226721244"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:17:35 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3 0/5] RFC: Add attachments support
Date: Mon, 13 Apr 2026 22:17:23 +0200
Message-ID: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
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

This series introduces support for hook/test written attachments.
It is somehow limited and stiff but allows to write anything test/hook
wants in attachments directory. File names which occured in attachments
directory are added to results.json.

Series targets our need to include guc logs for failed tests especially
in the point of time when it occurs.

v2: - added clearing of attachments dir in overwrite mode
    - guc-log hook script is now installed to igt datadir/hooks dir
    - added hook-exec-allowlist to selectively execute hook scripts
v3: - drop hook-exec-allowlist in runner, now scripts are filtering
      allowlist on their own
    - add support for attachments in recursive directories

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>

Zbigniew Kempczyński (5):
  runner: Rename dirfd to avoid clash with dirfd()
  runner: Create attachments directory to use by hooks
  scripts/hooks: Example guc log copy script and allowlist
  runner/resultgen: Add json array create/get helper
  runner/resultgen: Insert attachments list into results.json

 lib/igt_hook.c                    |  4 ++
 runner/executor.c                 | 87 +++++++++++++++++++++++++++----
 runner/executor.h                 |  2 +
 runner/resultgen.c                | 77 +++++++++++++++++++++++++++
 scripts/hooks/guc_copy.allowlist  |  2 +
 scripts/hooks/guc_copy_on_fail.sh | 47 +++++++++++++++++
 scripts/meson.build               |  3 ++
 7 files changed, 213 insertions(+), 9 deletions(-)
 create mode 100644 scripts/hooks/guc_copy.allowlist
 create mode 100755 scripts/hooks/guc_copy_on_fail.sh

-- 
2.43.0


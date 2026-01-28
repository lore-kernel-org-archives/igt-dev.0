Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEACD3F094
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 16:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8197A89612;
	Wed, 28 Jan 2026 16:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFM3WkQb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F88C89612
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769618551; x=1801154551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ellVUR0Wi8q24R02dmCT2+Su5Ktqjjtrcd+H/p571W8=;
 b=iFM3WkQbFieR4qAib0uh6VM+c60H1QsttA5fiE9tqjHx98lNtH2gAq6B
 bx/Y6yA/PP25N+jJe2vTt4HynYU89hVP2G0MKvUPMEP4uGMxbxvNal67o
 6mPJOKBZOnLKyJaoAQ2oEET60OT78bYTyeX9Cgyd1aXJqecKW+DPe/ghu
 PWTZbhI+/jS7+wiKUUBVhiSVUcAlxVOQ+Tn49moPZfh71qFh7rktxfYH/
 W4UIQ81Bham/2YkXhuFe1HJR3H+8pQ1uEs94vFFQ50FsPIeuh7c1uTgIj
 4PVDNuLk7zUfPBWla3HT7e/EerkNyHIE+0Dt5ou1lhbSzOblaGtzUWt/3 w==;
X-CSE-ConnectionGUID: K0408M6KTV65F6zrPB3Oqg==
X-CSE-MsgGUID: 1/Pt632qT+6xTRQYR9uRJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96298693"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="96298693"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:42:30 -0800
X-CSE-ConnectionGUID: K+I51qn8SF++OeAPnE/Vdw==
X-CSE-MsgGUID: LSO/SMVGRPCrZR4KIn0O/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208334292"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.49])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:42:28 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/2] Fix uninitialized variable
Date: Wed, 28 Jan 2026 17:42:25 +0100
Message-ID: <20260128164224.932886-4-zbigniew.kempczynski@intel.com>
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

Fix uninitialized variable warning in xe_exec_system_allocator test
+ try if there're any other places where tests start to explode.

Zbigniew Kempczyński (2):
  tests/xe_exec_system_allocator: Don't leave bo_flags uninitialized
  meson.build: FOR-CI-ONLY: Change to debug

 meson.build                            | 2 +-
 tests/intel/xe_exec_system_allocator.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4E8C43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 08:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C533410EBBF;
	Tue, 30 Jun 2026 08:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRTUGKmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B285010EBBF
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782809584; x=1814345584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sO7giabSxdKdTfXFmoWGdpjBRXGSelvRIX63gpWlQRk=;
 b=TRTUGKmIzgeP5c+fzB2DvdXU9jmW2KuLhRKWiHYSAIyB1FzyOmQrZWbs
 ic60JnDjkooZ2nkQSCiraQElYztxeMcPg2KdPQvO3QSfkk8t65isTSE9W
 fsmjXskZBdY+SMlh4QHOOc4oj2HGRCSr7r5BXvttdH23xpC4ZkVmmNiyH
 m9Uu2rAzp+cXcVoS7necuxAn4OPaNGaJTX6dgpSAFoQ3yJmmIBGERSJ8T
 BsgDey91uQPCrPjXkpqhesxj4QYVqb1LKzvdxb5u5Q6ESpxDQ8xkIqbIR
 DBt778itp7ht8leT/1KgouixmslVXDxAmo0UXYU5ZiDTXhwN0kk80+5Um A==;
X-CSE-ConnectionGUID: eFua/1uMSta94bDX+kMjGw==
X-CSE-MsgGUID: BS0SPc4nQ/O2PtZ1Kl76Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106309999"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="106309999"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 01:53:04 -0700
X-CSE-ConnectionGUID: MbVhOUelTIivo+UWCi0Hcw==
X-CSE-MsgGUID: qCIQC3QiTXyAa0cwOoJaCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="248841028"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.245.134])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 01:53:02 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 0/5] Remove EUdebug tests
Date: Tue, 30 Jun 2026 10:52:46 +0200
Message-Id: <20260630085251.32120-1-dominik.karol.piatkowski@intel.com>
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

Remove EUdebug tests due to lack of upstream kernel with EUdebug
feature to be supported by them.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

v2: Rebase on upstream
v3: Remove xe_eudebug_sriov test and EUdebug section from tests/meson

Dominik Karol Piątkowski (5):
  tests/xe_eudebug: Remove xe_eudebug test
  tests/xe_exec_sip_eudebug: Remove xe_exec_sip_eudebug test
  tests/xe_eudebug_online: Remove xe_eudebug_online test
  tests/xe_eudebug_sriov: Remove xe_eudebug_sriov test
  tests/meson: Remove Xe EUdebug

 lib/meson.build                               |    2 +-
 tests/intel/xe_eudebug.c                      | 2986 -----------------
 tests/intel/xe_eudebug_online.c               | 2819 ----------------
 .../xe_eudebug_online.c.gen.iga64_codes.c     |   86 -
 tests/intel/xe_eudebug_sriov.c                |  154 -
 tests/intel/xe_exec_sip_eudebug.c             |  367 --
 tests/meson.build                             |   12 -
 7 files changed, 1 insertion(+), 6425 deletions(-)
 delete mode 100644 tests/intel/xe_eudebug.c
 delete mode 100644 tests/intel/xe_eudebug_online.c
 delete mode 100644 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
 delete mode 100644 tests/intel/xe_eudebug_sriov.c
 delete mode 100644 tests/intel/xe_exec_sip_eudebug.c

-- 
2.34.1


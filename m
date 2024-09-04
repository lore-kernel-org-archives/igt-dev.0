Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224F8CA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 08:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C350010E6E3;
	Wed,  4 Sep 2024 08:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJWpeKjk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C104410E6E3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725439637; x=1756975637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z71g99+SRfo+UkFmhb7eBopXlQWJfjLRYUy3/poOhuQ=;
 b=XJWpeKjkMl6BumdvPqf/iR1hYKc6zAQmrKLldocUhO8+1d+lw+DPywA/
 0bOGC6+1KKza6M2NZLNxBZENd8n6cqdUMQVI4b+5NR5Keb3y4DOVebd4m
 2QLCKJd6kjiTIBh4ZvFwT+Cbb0l6F9+7Y5bMTm9GtlEEy7RCtNbx6uo5G
 yBczTLp0RT3NF4+RS6YLtaynGl/jbAgnnymQYHWiQLswM+nisanUSJ4f0
 Ppp+EJvA38tgRGSYOg3TcbZdeMzbirw5bPxOjPmiqUAAxF0fE1RkDlzM7
 K5JrtbeaqydqQVKegFwpI5090xcHDoF9pJ9Hd4VKgldi6JDed+1FPOVNo w==;
X-CSE-ConnectionGUID: 0fJZV/zKRXK6IE5fjCzEmA==
X-CSE-MsgGUID: fJ5AS7UFTOKY1YQ+Sv+jrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35447010"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="35447010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:47:16 -0700
X-CSE-ConnectionGUID: 1mV98ZFTT6aDJx8Psbibog==
X-CSE-MsgGUID: DzothB/3QK+st9Ss0gQb/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="69994033"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.123])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:47:15 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/3] Introduce VF MMIO register tests and xe_mmio fixes
Date: Wed,  4 Sep 2024 10:46:58 +0200
Message-Id: <20240904084701.186664-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This series introduces tests for MMIO registers on Virtual Functions (VFs)
and includes two fixes for the xe_mmio library. The tests ensure that VFs
only access their allowed registers. The fixes improve assertion logic
and cleanup in xe_mmio.

Marcin Bernatowicz (2):
  lib/xe/xe_mmio: Fix assertion logic in xe_mmio_vf_access_init
  lib/xe/xe_mmio: Remove redundant PCI system cleanup

Piotr Piórkowski (1):
  tests/intel/xe_sriov_mmio_regs: Add tests to verify registers on VFs

 lib/xe/xe_mmio.c                 |   3 +-
 tests/intel/xe_sriov_mmio_regs.c | 310 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 3 files changed, 312 insertions(+), 2 deletions(-)
 create mode 100644 tests/intel/xe_sriov_mmio_regs.c

-- 
2.31.1


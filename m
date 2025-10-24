Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4947CCCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 12:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22FE10E1FF;
	Fri, 24 Oct 2025 12:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eiKij38R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C430110E1FF
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761308330; x=1792844330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9GZMM55njXqP11i/yUsA7GlloVQJwgLh2aasmSWWlHM=;
 b=eiKij38RwEAKTjtpNXZLIJ2gPJjZpwE5HCs6xFaomtpIgB2KEEF/8S/P
 51A1bzFgkBapAgUz4ccbJCFSK4umW3UqFPFCMglzLVuvTrSiScDvp2b2S
 /KmRCHQapsoM061TKiNdfQGSY8ltjEtoudPKG1egKIoR3e5A9GAS4HT55
 aaRHNovv+XNhgEPQXeVfLrMW7l0uw5l6Z+0R42y8fxMj/Mlr8/cBCgmCs
 I5D8uYHWYYJkJgK2JrkPbrm1mjxrsQkZB4KgTR3BBxXYO3yXGcbM8VSMY
 TJU9yNmLO/30tRvAWYGZwlyPHSYKf9smUqov2tF45ArU83dVLt57blXpd w==;
X-CSE-ConnectionGUID: rY6bvhBASiWy7Vd6bsan1A==
X-CSE-MsgGUID: 3NUuAYeIQ7au7rzfYLMibQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74161698"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="74161698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 05:18:49 -0700
X-CSE-ConnectionGUID: ZMvd1aIsSUmaGHHa9hLjcw==
X-CSE-MsgGUID: Sy673rLlSYysPDE8mSC0iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="188713424"
Received: from dalessan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.94])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 05:18:47 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: [PATCH i-g-t v1 0/2] Sync PCI ids with kernel: split BMG to BMG-G21
 and add NVL-S
Date: Fri, 24 Oct 2025 14:15:15 +0200
Message-ID: <20251024121517.73013-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

This syncs Intel GPU PCI ids with drm-next kernel commits

edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>

Kamil Konieczny (2):
  lib/pciids: Split out BMG-G21
  lib/pciids: Add NovaLake NVL-S PCI ids

 lib/pciids.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

-- 
2.51.1


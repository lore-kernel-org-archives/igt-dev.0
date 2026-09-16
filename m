Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A1C982C9
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 15:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D68110E3DA;
	Wed, 16 Sep 2026 15:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DHxv2V1A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9543810E3DA
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789573678; x=1821109678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nVcHQkwvvLhw2R8cBiNiEQh+/urR6TAJDMXuz4NWD9A=;
 b=DHxv2V1A9PsGtVSrcw+fmYtQkf+/v6xAMyDIlauOno1KOQtFEQUMsjV0
 ky49ELyC1AhBvf/enJrdoEqH84UMtkj6CmOweGX18SnvuyLSPsS+vIhAr
 WgWiDg07IZYGVSQ0eGv/i6PwNs11RGRvoV/Ganu7m0E9SRWtb97laElCO
 r10HA/ha0azAv1OkX4GGm8Rt612wfs26v+TWJvBpCoQ2WO8AWhix9xjFk
 ti+Vdj0N2rTWsPMry2YUe49Bv/7WN6xB6BvkOJYz3zCLG/GxMWw/pdp/e
 L33Ol9oh4ThCB4E6dLgV2HcyhTVWNStKI4ZeNvY6UMSxcWZXGcNkMANUu Q==;
X-CSE-ConnectionGUID: bersLxzKQh6VqVc36jBPPg==
X-CSE-MsgGUID: xIeH12wASZmZneJeoMrudw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100549546"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100549546"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:47:53 -0700
X-CSE-ConnectionGUID: +pAfC+EjSOqtVAyLXu9Bpg==
X-CSE-MsgGUID: EMdROgR5ROiflc3OqaRuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277505375"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:47:52 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v2 0/2] runner: create results incrementally
Date: Wed, 16 Sep 2026 17:47:38 +0200
Message-ID: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

      Create results incementally during run, e.g. after each test end
its execution create results.json up to last one executed.

One caveat is that it will still not hold last one at which
sudden reboot happens, for example after a kernel panic.

In such cases there is still a need for calling igt_results to
collect all data.

v2: rename option to --save-results-after-each-test (Ryszard)
  renamed function to better describe it saves only partial
  results (Ryszard)
  using results.old, not .bak (Kamil)
  bailing out from saving when endtime cannot be saved (Kamil)
  reorder patches, first should be introducing new option, then
  using it (Kamil)

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Kamil Konieczny (2):
  runner: Add new option --save-results-after-each-test
  runner: Create results after each tests end

 runner/executor.c  | 68 +++++++++++++++++++++++++++++++++++++++++++---
 runner/resultgen.c |  6 +++-
 runner/settings.c  |  9 ++++++
 runner/settings.h  |  1 +
 4 files changed, 79 insertions(+), 5 deletions(-)

-- 
2.55.0


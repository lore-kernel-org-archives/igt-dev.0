Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4708BC83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 19:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37A410E953;
	Thu, 10 Jul 2025 19:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpctb1tg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF1910E950
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752174041; x=1783710041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eN63gB2Mmb/GneVE4VDl13KodVDz0eu18iQzEMSYd9s=;
 b=mpctb1tgxPpl8iog/7eTP8sp+f8VhkWP8Kj+JW63VrrLr2LWGr+4otnz
 m3I+tOCMM6ZF1vNhccwtUh86TAjWMfHu/5M72xyh2+gB53RHxRu3U1Nm8
 am8xaZIeU0Ia8/3g/K2RArSepSRHAWRwf4sG2vlpzokqzRa3jxmMNmCX1
 xn4vS4n3XkiFfWpjfbsQCeABfjI7qvYZqmPQks+syCQDKeWXGQ6ejgcc4
 Yb5NOPvtVcDNZlLoXgO8fRz8TKRSZC9dFnc1rUe/UuN5XzEN+q4/jClfr
 tjoeo6XJfWpiF0DSLleDltCbM6Og9Qic6v0gsmEUzNHPgxyDNK6gZuuD+ A==;
X-CSE-ConnectionGUID: QWMhp6TKRjmIuGz2YOLStQ==
X-CSE-MsgGUID: Zpzm8yWeRNONCnLW3/Hpow==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53685872"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53685872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:41 -0700
X-CSE-ConnectionGUID: rSL0YedZR22iaHVYiG9gTA==
X-CSE-MsgGUID: QPldvxSMRgSoRxBbWRyI9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="179865002"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.100])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:40 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zlice555@gmail.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/3] Fix igt v2.1 compilation on Void Linux with musl
 C libs
Date: Thu, 10 Jul 2025 21:00:13 +0200
Message-ID: <20250710190017.167735-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
References: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
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

This fixes a compilation on Void Linux as reported
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/179

Cc: zlice <zlice555@gmail.com>

Kamil Konieczny (3):
  lib/igt_vc4: Fix musl libc compilation
  lib/xe/xe_sriov_debugfs: fix musl libs compilation
  lib/svga/vm_basic_types: fix musl libs compilation

 lib/igt_vc4.h             |  8 +++++++-
 lib/svga/vm_basic_types.h | 10 +++++++++-
 lib/xe/xe_sriov_debugfs.c |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.50.1


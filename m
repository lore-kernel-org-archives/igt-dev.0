Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD94CAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 05:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF68610E040;
	Fri,  3 Oct 2025 05:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPqieRR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC64B10E040
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 05:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759469133; x=1791005133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JHK1Wnkybxnl0GzSqGoeYl1sp84AlxPbmzWC1lQsZTw=;
 b=PPqieRR7sbrIMVwiN7d8lB72tvXxGsFWpAGCDC3pMFqLwcPFsaImmnSW
 R87qNhQQ+Y5WksYvy+rbldJ8Wghlmw84nGnwqKt51PmZqAhZgfSmk99AW
 z1TaT+dQTAc7IG0zJKiuLA1ErKueZmwyIEjBzxJQOH8i83Qf1YuSU7Q/K
 fLPPcje0Dxd3tcG6dOi/yM7zfbvhGehrjyek98hPz4I7GuLqQRftEb6xt
 q4+Dm6CHzBm2ZevfG45/cZVql3/AbvVDBcjdGJXV6dac2/UrpaLjuuaRu
 dVXiGp223IeOdJ2SZgGaiHBV6EUjgHrVsVbfcrRrhaaRmcqzst3J/Eqz5 Q==;
X-CSE-ConnectionGUID: b2UjLJEURy6oJ4ndE8/XIg==
X-CSE-MsgGUID: bvBv6OqNQCq7A3mcbBVFlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="87209599"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="87209599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 22:25:33 -0700
X-CSE-ConnectionGUID: PaWk3DCDQ5CzTQbQWfrFfw==
X-CSE-MsgGUID: 8xwdFSKyRXayWoNASOGTOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="178844282"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 22:25:33 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v9 0/3] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Fri,  3 Oct 2025 05:25:16 +0000
Message-ID: <20251003052524.56030-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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


Patch 1 introduces a preemption capability check.
Patch 2 Adds kernel validation logic and kernel lookup.
Patch 3 removes redundant loop count logic for WMTP. Since WMTP uses a loop/SIP kernel 
        and does not require a separate long kernel, the loop count assignment for 
        WMTP is unnecessary and has been removed.
---
**Patch Summary:**

- **[PATCH 1/2]** tests/intel/xe_compute_preempt: Compute preemption check
  Adds preemption capability detection and kernel validation logic.


- **[PATCH 2/3]** igt/lib/intel_compute.c: Add kernel lookup and
 validation for compute IP versions

- **[PATCH 3/3]** igt/lib/intel_compute.c: Update loop count for WMTP
  Removes unnecessary loop count assignment for WMTP, which uses loop/SIP kernels

Sobin Thomas (3):
  tests/intel/xe_compute_preempt: Compute preemption check
  lib/intel/intel_compute: Add kernel lookup and validation for compute
    IP versions
  lib/intel_compute: Adjust long kernel usage for WMTP

 lib/intel_compute.c              | 160 ++++++++++++++++++++++++-------
 lib/intel_compute.h              |  12 +++
 tests/intel/xe_compute_preempt.c |   6 ++
 3 files changed, 146 insertions(+), 32 deletions(-)

-- 
2.51.0


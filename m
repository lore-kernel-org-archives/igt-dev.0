Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB49CAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 11:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ACD10E8DE;
	Thu, 25 Sep 2025 11:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4xcMXYZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491C710E8DE
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758800237; x=1790336237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IzoQmjl3V9o+j7Uo6keStlD65UlLZKAOPHBUyj7/arY=;
 b=d4xcMXYZQ3tN4gT/CAMg1aECpo49dhgKASS0ckHd9f5lYSmW8k2hi395
 EHOfPuLWNoc5eSB37FTthA9mqtPAmKBINmOZj5nmfDP01sbpVyaDric01
 s2Q9SSwm13T1S25MC8todQe/T/3x8Sbk/ltnfHFupHSKoYiFsxduRZP9Z
 gp8b2ehwfXHlUHym48RCWfDue94MzrSALGqsTQhrVb+gKyEu+v2P3bPrG
 hwtx97FgG+BoB8fGbQXJ8XACow12xzvXqiJDcht+fnr27wVkuDzCVpOWj
 8/TLAX6LKUQw4hzDnvjK2DNfkeampx8UinEKeQljHDq6HkwonOh0/hYbm g==;
X-CSE-ConnectionGUID: V3r2bWN4S+muji8eUwGQ5Q==
X-CSE-MsgGUID: cku2/xpbS9ylSKbYyv4IvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61167965"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61167965"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 04:37:17 -0700
X-CSE-ConnectionGUID: 0kWrtyOrTJq375OJKyxN8Q==
X-CSE-MsgGUID: CxsEf2GaSMu4p1s/zSCQDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="208055072"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 04:37:16 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v8 0/2] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Thu, 25 Sep 2025 11:36:57 +0000
Message-ID: <20250925113705.414943-1-sobin.thomas@intel.com>
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

Patch 1 introduces a preemption capability check and kernel validation logic
to ensure tests are skipped gracefully on unsupported platforms. It refactors
kernel lookup and validation into reusable functions.

Patch 2 removes redundant loop count logic for WMTP. Since WMTP uses a
loop/SIP kernel and does not require a separate long kernel, the
loop count assignment for WMTP is unnecessary and has been removed.

---

**Patch Summary:**

- **[PATCH 1/2]** tests/intel/xe_compute_preempt: Compute preemption check  
  Adds preemption capability detection and kernel validation logic.


- **[PATCH 2/2]** igt/lib/intel_compute.c: Update loop count for WMTP  
  Removes unnecessary loop count assignment for WMTP, which uses loop/SIP kernels

Sobin Thomas (2):
  tests/intel/xe_compute_preempt: Compute preemption check
  lib/intel_compute: Adjust long kernel usage for WMTP

 lib/intel_compute.c              | 140 +++++++++++++++++++++++++------
 lib/intel_compute.h              |   7 ++
 tests/intel/xe_compute_preempt.c |   6 ++
 3 files changed, 127 insertions(+), 26 deletions(-)

-- 
2.51.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBD8CD37BE
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 13:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A05E10E184;
	Mon, 11 May 2026 13:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZ8ZJc+f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF28110E77F
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778507891; x=1810043891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7/Won+6CDtrL4fQRcTt92A9hfLVo3klrItAR5IqZnXs=;
 b=RZ8ZJc+fSYAfyRglTSztqnLt3Q7s/3E9K0mhAG8Yv0UQBpKlhOrfv6Mf
 v5y5SFHHFJADMrp6Kc/Tfkc8/M3KD+YD8YGgMuhMf5j/6claIq7HAb0qz
 G7ixN4gQ4vwqA+VoA2y5g7h2edpK6+nWgpofEs4oZXsCw4VF2Ps1B7Tbf
 P7gliKz5ihjTkMdDcI2GAu96ZKzUgZYnnZdrRr/MQOMfTsnZ09Cf3Kf0R
 aiMsikeeqZap56R2FKTWi3UN0hD5ChcIjQFoO6763koVmPC7TNK26GSVH
 46g5pooRhrU8KEO9QEjnXCvidfX5AoQdZSxwVUkBHDX3unKhDdKsXwVdk w==;
X-CSE-ConnectionGUID: nRXGefjISU6YEa9Oy8p9mg==
X-CSE-MsgGUID: uLAlp+K2T7a9OyhiEp67YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="81957737"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="81957737"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:58:11 -0700
X-CSE-ConnectionGUID: tnnpKYT+SeOkP9C895gQkQ==
X-CSE-MsgGUID: EXzrZDsQQFGwc27dHccfGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="241817458"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:58:06 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v3 0/4] tests/intel/xe_madvise: Add atomic madvise
 subtests
Date: Mon, 11 May 2026 19:27:33 +0530
Message-ID: <20260511135752.119868-1-varun.gupta@intel.com>
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

Add three subtests to validate DRM_XE_MEM_RANGE_ATTR_ATOMIC madvise on
fault-mode SVM VMAs:

  atomic-device — GPU MI_ATOMIC_INC succeeds via fault handler
  atomic-global — CPU atomic increments + GPU MI_ATOMIC_INC with
                  fault-driven SMEM-to-VRAM migration
  atomic-cpu    — GPU MI_ATOMIC_INC rejected (-EACCES), engine reset

Patch 1 generalizes the test metadata and groups existing purgeable
subtests so the atomic subtests can coexist without being gated on
purgeable support.

v2:
  - Add UNMAP of CPU_ADDR_MIRROR binding before xe_vm_destroy in all
    three atomic tests (Nishit)
  - Add pagefault count print before/after exec in atomic-device and
    atomic-global (Nishit)
  - Add comment explaining single-engine rationale in atomic-cpu (Nishit)
v3:
  - Print pagefault count only when count changed (Nishit)

Varun Gupta (4):
  tests/intel/xe_madvise: Generalize metadata and group purgeable
    subtests
  tests/intel/xe_madvise: Add atomic-device subtest
  tests/intel/xe_madvise: Add atomic-global subtest
  tests/intel/xe_madvise: Add atomic-cpu subtest

 tests/intel/xe_madvise.c | 381 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 338 insertions(+), 43 deletions(-)

-- 
2.43.0


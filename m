Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8389C79FA0
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 07:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7119F10EA25;
	Tue,  8 Sep 2026 07:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUJ/hhNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E91110EA25
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788852585; x=1820388585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iFHzFa+iypEno5OCzlq7tudC9uFYV3XxM08OfaVxPDo=;
 b=nUJ/hhNH0zovnn051u0z0lR6TinMCsEVlW8cmw7dxTBqeMPI0Q5Z+FkA
 5isT4kmJWZc9gVU6vvei5hdUJtHFREWc+d97LdrplojCMeA+aHlwj+8j3
 b3ulX0Wnwe68cog3gj/ThVUE48x0OMxp+myvZSbIZtgJvRMG6avZPzTi9
 UJ2qiR97SgkyZbqs6yUFa+GIR1CFIev/Bdv8k3VYD8fi70Otuob5sFrWA
 JOvesu2h7tbiETjIEJfClgBKqskIW3jt2VOjRWbLSv4DvoFLst50biJEa
 ZtfrkaSqqZmglDKRj2vSVXZUBK/2DAv+0xGdlySMAqVK8TROLTEGcolLU Q==;
X-CSE-ConnectionGUID: rS8z3Lo6S3SWMq/Bmz1I/A==
X-CSE-MsgGUID: nye+vdBWRJ2HlUetVp1ULQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106761203"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106761203"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:29:45 -0700
X-CSE-ConnectionGUID: /adTXf5qRZq5rwGcTV30sQ==
X-CSE-MsgGUID: UYK0WCvRQI6McnamBXDbKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274702043"
Received: from suja-super-server.iind.intel.com ([10.190.238.52])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:29:44 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: [PATCH i-g-t v2 0/2] Derive write-through availability from the PAT
 config
Date: Tue,  8 Sep 2026 13:47:26 +0530
Message-Id: <20260908081728.119942-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Not every platform has a write-through entry in its PAT table. Where
there is none the KMD reports the UC index for XE_CACHE_WT, so a test
which asks for write-through quietly gets uncached instead, re-running
coverage it already has under a misleading name. Spotting that currently
means enumerating IP versions in the test, which needs revisiting for
every new platform.

Patch 1 adds intel_has_pat_wt(), which answers the question from the PAT
config itself: a WT index which aliases UC means there is no distinct
write-through entry. Patch 2 uses it to skip the write-through checks in
xe_pat where there is nothing to exercise, so they report an honest skip
rather than a pass.

Following the library guidance in CONTRIBUTING.md, the helper is a plain
query: no igt_require()/igt_skip() in the library, the tests decide what
to do with the answer.

intel_get_pat_idx_wt() itself is deliberately left alone here. Having it
return XE_PAT_IDX_INVALID rather than the UC index is the stricter fix
and probably the right end state, but it changes behaviour for the
callers in kms_ccs and xe_exec_system_allocator as well, so it seems
better as a follow-up once the helper is in tree.

No functional change intended for platforms which do have a write-through
PAT index.

v2:
- Rename intel_pat_has_wt() to intel_has_pat_wt(), leaving the
  intel_get_pat_idx_* prefix to the getters (Andrzej)

Sujaritha Sundaresan (2):
  lib/intel_pat: add intel_has_pat_wt()
  tests/intel/xe_pat: skip the write-through checks without a WT index

 lib/intel_pat.c      | 22 ++++++++++++++++++++++
 lib/intel_pat.h      |  2 ++
 tests/intel/xe_pat.c | 38 ++++++++++++++++++++++----------------
 3 files changed, 46 insertions(+), 16 deletions(-)

-- 
2.34.1


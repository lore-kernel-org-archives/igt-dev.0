Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2817C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 12:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9535610E655;
	Thu, 25 Jul 2024 12:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIneI6iJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4646F10E655
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721911813; x=1753447813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BFNJ0dG5Zvqx3XttIOl+F2ba94ZJaMjt8qphkyVdOxs=;
 b=dIneI6iJ9UI4IbrTSV0pV5h7ln6tXtPlBulQWziP/lWzknWz1/YDiIEt
 kdpgdouk9nJ0jgDLTmHpq1dIALI8jMu15Qo1OKH+utvv0m62tLCc0OlR/
 salo4qQAhbyA44P3+N16tuq3fUH3OE514M+qdJl1N5Z3TMgkdxqjmUmjt
 Vw8LbQ4JnBF5eFFHPAuN/GcW14v+glRctjWjVxHeOv/ghr1HhtRfujje0
 svIwbOZEocKgmVkyymL2WhVjSg3YtwOiljmBit9V/RS1JYrvCqY4Bx2f8
 bLLzY5y/M8gRVkdNvXc6rv2YWW5TiNq9Abb6eK0nDS75w34qN4GViRKAx Q==;
X-CSE-ConnectionGUID: m8F3bGePTZaHah+r22nBrw==
X-CSE-MsgGUID: Ump0o1ZPS2uPqAsFN2KMDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19522039"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="19522039"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:50:13 -0700
X-CSE-ConnectionGUID: 3lL8J4AwQqGyeV89V/TuGg==
X-CSE-MsgGUID: NfD+pUOaRVWxKR0ROieDiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="53686287"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.225])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:50:10 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Krol <karol.krol@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: [PATCH i-g-t v1 0/4] runner: Allow dynamically ignore dmesg errors or
 warnings
Date: Thu, 25 Jul 2024 14:50:02 +0200
Message-ID: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Allow igt tests to dynamically inform igt_runner about expected
kernel warn or error and allow to ignore it and generate correct
results.

For example, xe_wedged forces wedged state and after checks test
succeeds but runner interprets kernel error message and treat
that as a fail. In dmesg there was:

<6> [259.656065] [IGT] xe_wedged: executing
<6> [259.659888] [IGT] xe_wedged: starting subtest wedged-at-any-timeout
<3> [259.661285] xe 0000:03:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:03:00.0 as wedged.
IOCTLs and executions are blocked. Only a rebind may clear the failure
Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
<5> [259.661375] xe 0000:03:00.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=2, flags=0x0 in xe_wedged [1825]

In output on stdout there was:

[381.820788] Starting subtest: wedged-at-any-timeout
[385.137763] Subtest wedged-at-any-timeout: SUCCESS (3.317s)

but in results.json the test is marked as a fail with dmesg-warn:

"igt@xe_wedged@wedged-at-any-timeout":{
"out":"Starting subtest: wedged-at-any-timeout\nSubtest wedged-at-any-timeout: SUCCESS (3.317s)\n",
"err":"Starting subtest: wedged-at-any-timeout\nSubtest wedged-at-any-timeout: SUCCESS (3.317s)\n",
"igt-version":"IGT-Version: 1.28-g9fa156438 (x86_64) (Linux: 6.10.0-rc7-xe x86_64)\n",
"result":"dmesg-warn",

To overcome this test could emit a message, in this case:

add ignored dmesg regex: CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged

Such regex will be cleared after resultsgen proceeds to a next
(dynamic) subtest, so if that happens outside such scenarios
it would be treated in old way.

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Karol Krol <karol.krol@intel.com>
Cc: Ewelina Musial <ewelina.musial@intel.com>

Kamil Konieczny (4):
  runner/resultgen: Added dynamically ignored dmesg messages
  lib/igt_core: Added message to runner about ignoring kernel warns
  tests/intel/xe_wedged: Inform runner about expected error
  HAX/DO_NOT_MERGE: xe-fast-feedback: test xe_wedged

 lib/igt_core.c                           | 14 +++++
 lib/igt_core.h                           |  2 +
 runner/output_strings.h                  |  8 +++
 runner/resultgen.c                       | 75 +++++++++++++++++++++---
 tests/intel-ci/xe-fast-feedback.testlist |  4 ++
 tests/intel/xe_wedged.c                  | 10 ++++
 6 files changed, 105 insertions(+), 8 deletions(-)

-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04C2C3DA64
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 14:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863E310E39B;
	Tue,  6 Aug 2024 14:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ae+FMkst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A179210E3A0
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 14:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722955421; x=1754491421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W0JolEYji8IguKPB+R4Xl4YfOmMD9DmJKixwCOcFKX0=;
 b=Ae+FMkstMrY4ucLPc9FbgEatxByIPAUcHEd6IVSQPj/EUlP9qKFRpcO9
 9z3sT0XzovMyFqY/Ax6impBzUBYH7IVDFBjeVrN+Ds9ljsn8nngF+fdtL
 GhJAMYI6pX2OOvoKziMq/mo4GqQKF9soBJGFkglPc3smRG1yA18bezaSW
 T1bX5AETs19thfbEPODLboXvk4cEgFI+XkrXe8LnmSrDG8GuKzBaUEpFr
 JRKM8wcIYWhFSegFuvYM6QitqGgm9pXhzV2ymTCkk6vCxZaf7tgiJPDmn
 JLddec6pI0Xvg2/M9Vvg0wNEQbWxMu5ZTYcq+byUNPlKtIq/MB9/w0SRX g==;
X-CSE-ConnectionGUID: HDcs3MWTR66Pull35J/mDQ==
X-CSE-MsgGUID: o9tR+uefQVC89XxplyX2zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24766608"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="24766608"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:43:41 -0700
X-CSE-ConnectionGUID: iuTIVujESEq8ejc8wFlROQ==
X-CSE-MsgGUID: iPpBG7l4SPeUMD5+35oD2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56606661"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:43:38 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Krol <karol.krol@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: [PATCH i-g-t v2 0/4] runner: Allow dynamically ignore dmesg errors or
 warnings
Date: Tue,  6 Aug 2024 16:43:28 +0200
Message-ID: <20240806144332.80609-1-kamil.konieczny@linux.intel.com>
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

v2: addressed review comments: removed strdup(), added check for regex
  creation in igt_core (Zbigniew)
  free regex before creating new (Kamil)

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

 lib/igt_core.c                           | 19 ++++++++
 lib/igt_core.h                           |  2 +
 runner/output_strings.h                  |  8 ++++
 runner/resultgen.c                       | 60 ++++++++++++++++++++----
 tests/intel-ci/xe-fast-feedback.testlist |  4 ++
 tests/intel/xe_wedged.c                  | 10 ++++
 6 files changed, 95 insertions(+), 8 deletions(-)

-- 
2.43.0


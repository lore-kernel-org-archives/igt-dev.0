Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E655DCD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 15:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943DC10E40B;
	Wed, 20 May 2026 15:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7NHCDyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B25F10F0E1
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779292193; x=1810828193;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MfFkpR4kXozyXALvhqMcFgz+vRBcSo3M0eYS6rPPiq0=;
 b=f7NHCDyXFvrmy+fXI2bU3tn/v3C5TJIr9R3w5Hoyp2MmH53Jn41D4g1d
 iYnyKeaG4bOgt7e5ahYPNJXj3mjsTSD/iDpxjLl7vgcJJ3qF5AKLAClrj
 2tc5LbZ5df/d4DbpTFo308L1IVuydOoue9qziUCUmIyJ2oN0dd4Bhs6e2
 kYPWdQtYa0z/aaOJwqW0354oCCgrf8LAd0tBnIzg5xgGlH0qfehcRInLX
 z8WrlNapYqRZ+kmeMY0iCvlxHdsfTdSAsipTWxgNv/KPBqbKDfhBTYx23
 q3EC2wjmvg+vWJaEt/emhChegZdxQ7UDd5C8s/xBGjb0PRGJa5C/arBx3 w==;
X-CSE-ConnectionGUID: WWRhQxiLSjCtKcJ1iP70SQ==
X-CSE-MsgGUID: KH4h5GbuTTaOzbBrDQvlCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80162350"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80162350"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:49:52 -0700
X-CSE-ConnectionGUID: Bx5EHuj1RfO4g0zlWQz/Pw==
X-CSE-MsgGUID: /DD6AaNGSgqPIEK6+bzAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="245232653"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.126])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:49:51 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v1 0/4] RFC: Create smaller dmesg reports for a test
Date: Wed, 20 May 2026 17:49:42 +0200
Message-ID: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

  Inform igt_runner about some lines in dmesg which could be
safely skipped during creating a results.json.

  With this, runner will also lift dmesg size limit for current
test and will postpone size fitting to last phase of a run when
it will generate json report.

TODO: This is draft which implements only lines skipping, without
any reporting what was done. Also, implementation for a fail path
when applied regex will not lower resulting demsg is left for
future.

Cc: Sobin Thomas <sobin.thomas@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Kamil Konieczny (4):
  runner/executor: Create temporary unlimited dmesg save
  lib/igt_core: Create message for runner with unlimiting dmesg size
  tests/intel/xe_exec_system_allocator: Lower dmesg size collected
  runner/resultgen: Create smaller dmesg report by dropping lines
    matched with skip regex

 lib/igt_core.c                         | 31 +++++++++++++++++++
 lib/igt_core.h                         |  1 +
 runner/executor.c                      | 43 ++++++++++++++++----------
 runner/output_strings.h                |  8 +++++
 runner/resultgen.c                     | 17 ++++++++--
 tests/intel/xe_exec_system_allocator.c |  1 +
 6 files changed, 83 insertions(+), 18 deletions(-)

-- 
2.54.0


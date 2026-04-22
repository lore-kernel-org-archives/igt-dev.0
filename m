Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7FDFA1FE8
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 19:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED7B10E242;
	Wed, 22 Apr 2026 19:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Swj7eGxn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E624E10E242
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 19:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776885576; x=1808421576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7XPKm73mO+ZBDSqrOpW/P/vbv3jpjdVAzPUP/J6RzP8=;
 b=Swj7eGxn6E1ETiTY6HwOroKkGRDAqXrRjUD/8gVola1XxJU0b4jp5A5w
 RiopJm520wTS33vhTEX937k/C6crwnZUXVf+oQ68NWchVXYrsMV8Jd8rx
 JtXQenIRe5inOy8DotoeH8te6H+y2MsCNIjfdRsAOSDcZbJLWqkZnZp1k
 QHXCiTiuARlCKab6zHiKqVuEULKN10BPMNLwPQrRSWveYXFrodnKtOSeU
 Cod56x46C+fS+i718B7leSzx/MsMGcAE0gphEmGtWqQughvXQ6wKaCG1U
 AHMtciT2xcYlKc/zCQ5k00biYaPi61OH6/g5s2oMr5CXxf1TehjvMptLa w==;
X-CSE-ConnectionGUID: 3aYt5BxrTh6uPXidzK0rcQ==
X-CSE-MsgGUID: dQiHiAZuSnOY8euCSOvm0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76879916"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="76879916"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 12:19:35 -0700
X-CSE-ConnectionGUID: yePITkoYS2+rJE1jJZubxg==
X-CSE-MsgGUID: jgxtRHX2QCS1xJWjt/IOuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="229773049"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.47])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 12:19:34 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 0/2] Extend gpgpu fill support to XE3P
Date: Wed, 22 Apr 2026 21:19:23 +0200
Message-ID: <20260422191922.274036-4-zbigniew.kempczynski@intel.com>
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

Add pipeline + shader for XE3P and extend test with 4x4 position.

Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Zbigniew Kempczyński (2):
  lib/gpgpu_fill: Add support for xe3p gpgpu fill
  tests/xe_gpgpu_fill: Add subtest with 4x4 position for XE3P

 lib/gpgpu_fill.c                     | 117 +++++++++++++++++++++++++++
 lib/gpgpu_fill.c.gen.iga64_codes.c   |  47 ++++++++++-
 lib/gpgpu_fill.h                     |   8 ++
 lib/gpgpu_shader.c                   |   6 +-
 lib/gpgpu_shader.c.gen.iga64_codes.c |   6 +-
 lib/gpu_cmds.c                       |  93 +++++++++++++++++----
 lib/gpu_cmds.h                       |  14 ++++
 lib/intel_batchbuffer.c              |   4 +-
 tests/intel/xe_gpgpu_fill.c          |  11 +++
 9 files changed, 285 insertions(+), 21 deletions(-)

-- 
2.43.0


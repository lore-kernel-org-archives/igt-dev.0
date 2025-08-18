Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D843CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 07:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB9010E3D7;
	Mon, 18 Aug 2025 07:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZwiL5YE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11F510E3D7
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 07:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755502281; x=1787038281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MbQy9HevOCVpIUiXMoGD5Xi4ZeikpLPvSVEJXGm67Ls=;
 b=gZwiL5YEWXTsaDqgNBhSdsDav7hD3Nhi7usrOENm4PhXt/+23FoYxL4/
 fs2scvLkZUczKzSUa3LW5HIuXtzhirju8PKLHKBKl4Rku9CPr8BcOpPxm
 y58c5vGBCxN9li6xAsSumH2xXvQy7z9XZrjV9l5BXR8H/sclfSDqnI69V
 mPcjXbkeoukK0MyiCAMhiB9pULJDas7G9ljgEh6O0i8EJe3UkQ8hxVuBy
 BXadfWdZfvcXOlMOvE9wupVA5dPeRREwhGaFGnk6nJKTv/bvsoLPupv/0
 jd0eYGMdrak2m6v7fcMuFIFcnoG/BaIXmbvGO//gf1HDtISZPbqKEgKr9 w==;
X-CSE-ConnectionGUID: 5dvJ/QUPSI2CEvQKH2ygpQ==
X-CSE-MsgGUID: FlMFM8hOR02wCvU/xFG1vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57794277"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57794277"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:31:21 -0700
X-CSE-ConnectionGUID: HukmGHuYQJGs1eVaZt9mMw==
X-CSE-MsgGUID: KfdMCKWiTh+0PD5m6r4sZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166737588"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:31:19 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/4] Shaders migration to separate headers
Date: Mon, 18 Aug 2025 09:31:15 +0200
Message-ID: <20250818073114.1014041-6-zbigniew.kempczynski@intel.com>
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

This is cleanup series, no functional change. We want to add
some loop kernels to other platforms and keeping all shaders
in single file is cumbersome.

v2: fix incidentally removed line (Kamil)

Zbigniew Kempczyński (4):
  lib/intel_compute_krn_sip: separate sip from the shaders
  lib/intel_compute: migrate compute square kernels
  lib/intel_compute: migrate compute loop count kernels
  lib/intel_compute: migrate compute loop kernels

 lib/intel_compute_krn_loop.h       |   83 +
 lib/intel_compute_krn_loop_count.h |   93 +
 lib/intel_compute_krn_sip.h        | 5051 +++++++++++++++++++++
 lib/intel_compute_krn_square.h     |  291 ++
 lib/intel_compute_square_kernels.c | 6671 +---------------------------
 5 files changed, 5524 insertions(+), 6665 deletions(-)
 create mode 100644 lib/intel_compute_krn_loop.h
 create mode 100644 lib/intel_compute_krn_loop_count.h
 create mode 100644 lib/intel_compute_krn_sip.h
 create mode 100644 lib/intel_compute_krn_square.h

-- 
2.43.0


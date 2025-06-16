Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A79C71159
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 21:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCEF10E45D;
	Mon, 16 Jun 2025 21:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4ZMXNEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D9610E445
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750108154; x=1781644154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1dnP9N2rm5NpZsYAeyKwbzNcaC8CDSVoAGlEglkSFFI=;
 b=g4ZMXNEQ6ZAiLu4iPsKZtiY+LrBP0y5aglnTtrE37imdq/M7m5u3VCvv
 2JBxAphB9seZnP37nlDNX18UvmtNYTbboWnLPitiKuIX4lpvt5omcvRFb
 9PVTNzltTFIK5XtC7QxNKdITGFOEmnttZ164tufF1qBK2IPBHnBhpOaDA
 DKg21XSefCX2C8f6Ojy4/e3Ny4hmAAIulj1j8hl+F77tWJou33RaOkaRQ
 mFthPG/E04glZ9YtdMQ5dRdY3cjS3R7TqTbMFq/Bo/T/wnTyacBkqSVuL
 3xi0m11wyj/OsDTJSrouwkSUmfsAGLcckHE7UmJzsh76z02Sd1RpSS5Ul g==;
X-CSE-ConnectionGUID: zCwNbvSqQ+WkR9jkaz2DAA==
X-CSE-MsgGUID: aY8QGm7fRjKLMaB9iiVSlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52351455"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52351455"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:09:13 -0700
X-CSE-ConnectionGUID: bZim5ZaPQVOo4r8VWgEXXQ==
X-CSE-MsgGUID: s6+u1bOQQ8+byqFiXpWRTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153344527"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:09:11 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 0/5] Update image assets
Date: Tue, 17 Jun 2025 02:38:35 +0530
Message-ID: <20250616210840.3335978-1-ramanaidu.naladala@intel.com>
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

Update image assets and improve file handling.

Naladala Ramanaidu (5):
  data: Move PNG images to new data directory
  runner/settings: Constify absolute_path parameter
  lib/igt_core: Enhance __igt_fopen_data to support additional
    directories
  runner/settings: Add function to set IGT_DATA_PATH environment
    variable
  HAX patch do not merge

 {tests => data}/1080p-left.png           | Bin
 {tests => data}/1080p-right.png          | Bin
 data/meson.build                         |  11 +
 {tests => data}/pass.png                 | Bin
 lib/igt_core.c                           |  36 ++-
 lib/igt_core.h                           |   6 +-
 lib/meson.build                          |   1 +
 meson.build                              |   2 +
 runner/settings.c                        |  38 +++-
 runner/settings.h                        |   3 +-
 tests/intel-ci/fast-feedback.testlist    | 168 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 274 +----------------------
 tests/meson.build                        |   7 -
 13 files changed, 82 insertions(+), 464 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)

-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCB2E7716A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 06:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CDF10E1F7;
	Tue, 17 Dec 2024 06:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfuarOLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED4710E1F7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 06:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734417183; x=1765953183;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uf9Kt0etLMENMsc8iiMKVJ8kkcPo0cNkXUzXavNXa6A=;
 b=LfuarOLmi63XbgRmsWE1RNCCKTE0PNeOKaawW/d+M93KEhI+ph9MKd7Z
 w5aLyM9l0PibF2RlWlVa9W71v+hurv/hbgX9kw8OfuB8WkXIBqEBj7m82
 iOkgPT6wnnGvNT+xx7RByuyvo4FBoco1YjvPl6GvXL+gtmk5bgndSNZ8n
 HwihVeCGrH45zNcPNNFovXbhxWCMJJImSg9NC3sndPs9jCDoVilmZ7jIX
 osS6jk4tapOOx2uO0QyQdcVhSsSQKmBTeFmBizC3YD/3EPZarNwRuC2QS
 wwTkQks81bb+MbNKJC6k7cfYb9RE3RsOkvp1/h+0YZ5cRCcoJnfpNLGLw A==;
X-CSE-ConnectionGUID: b9kdcngzRXy4QXSI+Fs41w==
X-CSE-MsgGUID: N63Bcb3cTjWz1roP9dHBYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="35052819"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="35052819"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 22:33:03 -0800
X-CSE-ConnectionGUID: 13GrgK0iTxaqn3kpH7Ag9A==
X-CSE-MsgGUID: au/99aAdRm6hI9ifgPGDqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102041144"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2024 22:33:01 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v11 0/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Tue, 17 Dec 2024 12:00:27 +0530
Message-Id: <20241217063029.663697-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Move the spinner related functions to lib.
check the ctx_timestamp register post gt reset for each engine.

Pravalika Gurram (2):
  lib/xe/xe_spin: move the spinner related functions to lib
  tests/xe_spin_batch: Add spin-timestamp-check

 lib/xe/xe_spin.c            | 203 ++++++++++++++++++++++++++----------
 lib/xe/xe_spin.h            |  52 +++++----
 tests/intel/xe_drm_fdinfo.c | 195 ++++++----------------------------
 tests/intel/xe_spin_batch.c | 118 +++++++++++++++++++++
 tests/intel/xe_vm.c         |  17 +--
 5 files changed, 340 insertions(+), 245 deletions(-)

-- 
2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB1FCCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 14:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F4010E5E7;
	Tue, 30 Sep 2025 14:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7D7Czvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7EE10E5EB
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 14:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759242709; x=1790778709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TiLkJ5AzduA/8VKK9RDVGg200eEjmW5WP2OpKBPcqqM=;
 b=g7D7CzvhzIxLHUAxirYxinwu17rJF9os6X2TW+ovviCzdERZWKeetzq6
 uNYb8ySYDRm8st4IjDSTNr/UuXYw1oG5HarpqB0c88uccOBMJ5dBqASOe
 sPsExk5mqvNhbcSuwhvNRIUM7uX9Bc8XxSDu9eFN7jtjQMkR7ezLYZeYF
 FwRsAzfjGMA6mLDV+r3EfyhDw6rMoAQmRYUAcPgFYkv1nSSilMVcNPiML
 NjTEeu942kmQK2pkSmnZqhjkUvF9b+n0RJ0Jjo3Rc8DyFsCCRS1bIulVN
 +fFVlx1g+ss+W0vMDlHSUvaBhoz//Arf7+y23dAHN6G+2C4E/e2CAvt/E w==;
X-CSE-ConnectionGUID: 1rtvWxRmRIC4AqL8UcG6rw==
X-CSE-MsgGUID: PSfCGf/yQb6A/4jI1bB1/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65139968"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="65139968"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:31:37 -0700
X-CSE-ConnectionGUID: 25cK7mFVRv+EvjvvYMjOdw==
X-CSE-MsgGUID: 3TANMz1HSaGlpX2DMTxhng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178570151"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:31:35 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/2] Use blitter instead of cpu fill for uc-comp surface
Date: Tue, 30 Sep 2025 16:31:31 +0200
Message-ID: <20250930143130.186193-4-zbigniew.kempczynski@intel.com>
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

Don't fill uc-comp surface with cpu as it is out-of-spec and may lead
to improper decompression from such surface to another in render-copy
op.

Zbigniew Kempczyński (2):
  lib/xe_util: Add xe fast-copy helper
  tests/xe_pat: Use blitter to copy to uc-comp surface

 lib/xe/xe_util.c     | 80 ++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h     |  5 +++
 tests/intel/xe_pat.c | 35 ++++++++++++++++---
 3 files changed, 115 insertions(+), 5 deletions(-)

-- 
2.43.0


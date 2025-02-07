Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FB2C0219C
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 11:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7650910EAED;
	Fri,  7 Feb 2025 11:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2AQ3x2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE0010EAFA
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738928972; x=1770464972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ajTTShqdP5ouB9mZ+LzHO2k8zN4KyG3QL9S6QihQ2A4=;
 b=R2AQ3x2lzZHfNmMUREVkBlqFFPNtr07umAg05XrYZ4iC/NH2QPY7eogN
 rVyNg93ELG3gCybljaTRvmsllkWmajXxUbNHPwZxLgWcOXQOqiXTC1B6O
 J3/nyTej7kOF2IHWBFRFz53dnkf7AWEsC/coyEzUKFR1dIQRONfsjlYPf
 lKRXAD0GSTdhTk/oPcZ8SNkqPeSxl7nQw+fsNpKZFr3soqNNYI3fWPCgU
 V/6xZoDxyCNFzlvTdcbvCV0b/sZPYHEGPSSGNQquc696oTZHzAiMuDCsX
 foMeIeiBnMG41VCr8ouOysu8Y2CbvO7cbmoep0a3rhTk0EanHi0b2M2V2 g==;
X-CSE-ConnectionGUID: 72CQ7EctQnGsDiydYuTHww==
X-CSE-MsgGUID: bEZ/gJm0T5Gbz4R7ooKzGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39683415"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39683415"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:31 -0800
X-CSE-ConnectionGUID: Xvy+wak5TX28zm/tRdcUJg==
X-CSE-MsgGUID: VtsKz+VSQjynE0YZGFG0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="116506741"
Received: from unknown (HELO mkuoppal-desk.fi.intel.com) ([10.237.72.193])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:21 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 0/4] eudebug: drop support for exec queue placements
Date: Fri,  7 Feb 2025 13:49:31 +0200
Message-ID: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
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

Exec queue placements are not utilized so drop them as unused.

Further, adapt to the exec queue property numbering changed
due to eudebug-dev being out-of-tree and rebased on top of
PXP property.

Mika Kuoppala (4):
  Revert "tests/xe_eudebug: Validate exec queue placements"
  Revert "lib/xe_eudebug: Add support for exec queue placements events"
  Revert "drm-uapi-experimental/xe_drm_eudebug: Sync after exec_queue
    placement event addition"
  lib/eudebug: Adjust to upstream uapi rebase

 .../drm-uapi-experimental/xe_drm_eudebug.h    |  33 ++---
 lib/xe/xe_eudebug.c                           |  89 +-----------
 tests/intel/xe_eudebug.c                      | 129 +-----------------
 3 files changed, 15 insertions(+), 236 deletions(-)

-- 
2.43.0


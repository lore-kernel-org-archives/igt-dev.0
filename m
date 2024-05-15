Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F634C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 12:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBD210E213;
	Wed, 15 May 2024 12:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2DFhTtH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E86010E213
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775597; x=1747311597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1vGwz6/J5hry54BdHnVfy31vi5u3jlvhzFShu/qcwJw=;
 b=b2DFhTtHjMh9irgVq1ISz8xmeMzskpyxettJFGegixKgStlXx6FoZncg
 W31kIeu21yQAsQHb+XVOXtnpuq7SocgeEez+Foq/axjDkaoNRiGEFMJKK
 g/uZjEfsAoVtDg1GNwwovC6q8MQJH34EXQeGkxs+vPwRRadrdpGUZdOO/
 aYCoAxM+kuIvwtVnZm75TOOkOaS18Uq5Da1WLZp3TBkPuTMMU3Nnf5vbn
 6d8PJXnAC4GTKUnOtIFTzhPjmEKDL0go86zzqy+i4dkUtEGJ+3UXsQDNU
 VP0NRV1L9uRxTLdMulvBKE2XUHlv/n/9XNGgGSgZUYGOu+hiXsAG7p+tC w==;
X-CSE-ConnectionGUID: bqXAoTK1R76zk2u16VRwQg==
X-CSE-MsgGUID: pOpW37SeQYO05j2bzLqung==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="12036124"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="12036124"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:19:57 -0700
X-CSE-ConnectionGUID: dVzT5Et5Qqq00xr1ZryBeQ==
X-CSE-MsgGUID: +G6K1w2RT4Sd21PClU9Qrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31039671"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:19:57 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v6 0/9] Add render-copy compression on Xe+
Date: Wed, 15 May 2024 14:19:40 +0200
Message-Id: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
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

Fills the gap of testing render-copy compression with different
tilings.

v2: Extend cmds-info to collect supported tilings/compression for
    render copy

v3: Predefine simple tilings first, then complex (Karolina)
    Drop static test array in xe_intel_bb to be another
    helper function user (Karolina)

v4: Separate compression format between xe/xe2

v5: Add missing pat index in intel-buf when compression is enabled
    (Matt)

v6: Fix tilings for gen12 (Juha-Pekka)
    Restore struct naming convention in rendercopy (Juha-Pekka)

Zbigniew Kempczyński (9):
  lib/intel_bufops: Store devid on buffer ops creation
  lib/intel_bufops: Restrict tilings on non-flatccs platforms
  lib/intel_bufops: Start supporting compression on Xe2+
  lib/rendercopy_gen9: Separate xe and xe2 compression format
  lib/intel_cmds_info: Define tiling macros
  lib/intel_cmds_info: Introduce render tilings
  lib/intel_blt: Add render tilings and compression support helper
  tests/xe_render_copy: Add subtest which exercises compression
  tests/xe_intel_bb: Use supported tilings instead hardcoded ones

 lib/gen9_render.h            |  31 +++++---
 lib/intel_blt.c              |  29 +++++++
 lib/intel_blt.h              |   1 +
 lib/intel_bufops.c           |  70 ++++++++++++-----
 lib/intel_bufops.h           |   1 +
 lib/intel_cmds_info.c        | 141 ++++++++++++++++++-----------------
 lib/intel_cmds_info.h        |   6 ++
 lib/rendercopy_gen9.c        |  24 ++++--
 tests/intel/xe_intel_bb.c    |  25 +++----
 tests/intel/xe_render_copy.c |  91 ++++++++++++++++++++--
 10 files changed, 295 insertions(+), 124 deletions(-)

-- 
2.34.1


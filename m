Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BD0CFA468
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 08:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390CB10E2BA;
	Fri, 21 Nov 2025 08:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgSi6b1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA10410E2BA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763713075; x=1795249075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sLHEMVPR3tmmDhVVVpxXQH3PBC/fg4WGaB8dLeLJPC4=;
 b=IgSi6b1Dmel7ZnV+YFQciPZFCvTJdy3C47WpBcmj32MnUxZLnbYDev7H
 B5GNKlvAGEf4pRjZqfmevAJchzdkBTQ05gtnXKQUbBmgzr7F3bvgoafOm
 Z97+HrqRw0rgB62q1RzmecR0apBbhYtLaIGgwP8Y4o90RNbsEjO50I3e1
 GV/rVKN2tekX0oZUGLTuLzBbELr832+jqpyLf6yXqkVvm1u4PD9sphPN/
 Jvyfayg8RoAGbuOEXQJFMt+k9ALjEBlE4smAHIaf8Nn0Dcj6KsoUtTrB9
 eiPgXdLhMX52xy9uInY8DuMjRZCFFKgmLIlQhssMUeebF5rpnThLs/Zpw w==;
X-CSE-ConnectionGUID: z5xxQ16PTi69K82x6pBWKg==
X-CSE-MsgGUID: jbq9B0bbQdezgyQHMgg1Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65838362"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65838362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:17:54 -0800
X-CSE-ConnectionGUID: 7Tkd06ubTeafCjfA+HgwfQ==
X-CSE-MsgGUID: hBpPfDnBRUWOLi1eCn/Kkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="196768006"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:17:51 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/3] Handle sharpness filter availability on scaler[1]
Date: Fri, 21 Nov 2025 13:54:51 +0530
Message-Id: <20251121082454.1085001-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series refines scaler detection to correctly handle hardware where
only scaler[1] supports the sharpness filter, and updates related logic
accordingly.

Swati Sharma (3):
  lib/kms: Refactor get_num_scalers() using read_pipe_info()
  lib/kms: Add helper to detect presence of scaler blocks
  tests/kms_sharpness_filter: Skip pipes without sharpness-capable
    scaler[1]

 lib/igt_kms.c                | 69 ++++++++++++++++++++++++++----------
 lib/igt_kms.h                |  1 +
 tests/kms_sharpness_filter.c |  6 ++++
 3 files changed, 58 insertions(+), 18 deletions(-)

-- 
2.25.1


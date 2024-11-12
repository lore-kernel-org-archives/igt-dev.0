Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A49ED42BA4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 16:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E32B10E08B;
	Tue, 12 Nov 2024 16:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ms9w8LdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F06910E08B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731428407; x=1762964407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iaWXWOD3aCXkCnaj7AQHf0Xu57qgpUUFQnqH31Kn1gM=;
 b=Ms9w8LdU2ll5nE/+OoDt1Ex21BoX87RBuoK0tPs7Acz/U4lIu4QlqL4z
 lni8OmMhEScI279wziCDplvqQJZysnW+At5WlI/6OmNVOdADlm0//b3EH
 7K69zi2T3U608g/ZxBDdsd8KAS39sJvZ08areMy9X0BYpQgpg9t76CG/8
 7Phw7az9OIFBl9I8eptiGMWl+nGsCrEz+CEso1NonxCUfl/lLsNkjcfMB
 2u+jKx/75nAVBRpay9IFOUgoNewdVWPfNGlF3dn7QVGJSELm6ttgkP7Ue
 sPQbW1TS1aS/xP0iZriCEnm1AiSUFnJeW4yg72/LKLxeU9Laq0jB5GeY9 g==;
X-CSE-ConnectionGUID: 3yRsjPfQQ7Kd2uwPeQpxRA==
X-CSE-MsgGUID: 0JYe6sLyS2yDL5BDWRFvVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30677728"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="30677728"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:20:07 -0800
X-CSE-ConnectionGUID: PEX7TpcxQ2qE0fgkra3Z2g==
X-CSE-MsgGUID: PRNf7OC5SdCTy2DzZqubmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="125036652"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:20:05 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] lib/igt_kms: Add 6k resolution support for a single
 CRTC
Date: Tue, 12 Nov 2024 22:04:33 +0530
Message-Id: <20241112163435.1351560-1-jeevan.b@intel.com>
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

increase big_joiner limitation to 6k from 5k for display version
greater than 30.

Apart from lib following tests are modified:
tests/intel/kms_pm_lpsp.c
tests/kms_flip.c
tests/kms_setmode.c

v2: added bspec no. and split the patch.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  lib/igt_kms: Add 6k resolution support for a single CRTC
  Fix bigjoiner compatibility checks for connector modes

 lib/igt_kms.c             | 22 ++++++++++++++--------
 lib/igt_kms.h             |  5 +++--
 tests/intel/kms_pm_lpsp.c |  4 ++--
 tests/kms_display_modes.c |  6 ++++++
 tests/kms_flip.c          |  4 ++--
 tests/kms_setmode.c       |  4 ++--
 6 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.25.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36393D70E1A
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 04:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF2A10ED8E;
	Fri, 29 Nov 2024 04:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuhGOvSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7819B10ED8E
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 04:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732853565; x=1764389565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Zrkx9yXcj9lTAtsn/iMzgvB+Fb+ABhakoB40OBvcYk=;
 b=MuhGOvSE+gPObzLzV610UAyKCNdN0yngcq4epcsK75kIQ2ssnCPxDwuL
 YycT6HbsfvgyaLrUnZu76g3tA309Q43BfLZfk77ZQziZhZTxhhizt75Aj
 2p8OnG07N9wPFEc73O+ZzyqIvDs3pd2yCMfQh1Vt0bvJKBmqz6aflw+Cp
 JMU1SGrFsVUhq+pZ9wN2t1AHgDqanyTD2RPpdpfbYmSrL6TwTUH9Dy88c
 0s0y/uMjolY38TW3Co6SM/Qokoz6jRkKN/XDhN/vPUA7REzcfr5Ou35dY
 qZ8S2A8Q7v2lMzqNUusj8PHX1NTTJk6xFkEUI3VEO+FVhk1ObMHdsJ1S7 w==;
X-CSE-ConnectionGUID: 3wQov86jTu+VxDI8ThLwbw==
X-CSE-MsgGUID: 62Xr5P8DTiaB/W05bg4I5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43704016"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="43704016"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:12:45 -0800
X-CSE-ConnectionGUID: DHulopJeTnW4HjNwr3BKxA==
X-CSE-MsgGUID: +Fmynb8VRJ6+kh4AeW+pRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="92848960"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:12:43 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/4] Skip test if joiner display is connected
Date: Fri, 29 Nov 2024 09:57:42 +0530
Message-Id: <20241129042746.701796-1-jeevan.b@intel.com>
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

Skip tests on joiner outputs to prevent failures caused by high-resolution
displays. This ensures the test suite runs smoothly without unnecessary issues.

Add 6k resolution support for a single CRTC and update calls.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (3):
  lib/igt_kms: Add is_joiner_mode function
  tests/kms_display_modes: Skip test if joiner display is connected
  lib/igt_kms: Add 6k resolution support for a single CRTC

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: Skip async flips on joiner output

 lib/igt_kms.c             | 55 +++++++++++++++++++++++++++++++++------
 lib/igt_kms.h             |  6 +++--
 tests/intel/kms_pm_lpsp.c |  4 +--
 tests/kms_async_flips.c   | 18 +++++++++++--
 tests/kms_display_modes.c |  3 +++
 tests/kms_flip.c          |  4 +--
 tests/kms_setmode.c       |  4 +--
 7 files changed, 76 insertions(+), 18 deletions(-)

-- 
2.25.1


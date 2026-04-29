Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C28FF887E
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 17:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CDB10E2E5;
	Wed, 29 Apr 2026 17:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2XmvFgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BEF10E2E5
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 17:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777484649; x=1809020649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6WGPzUnaNB2uMQ6H9FfGSvEDupl46AqY5Zf6oFjAmVQ=;
 b=S2XmvFgrxFGyjoam827TU2UvPQbUzJrl/L+72DY0vWM+K/QKfJouHFqF
 RbfqOleC/JAMRZzAEs4XsjvkENrRT8ou3noEuluIydgtNMXbMjLe9mYCZ
 Pxec4eeV5YG7i62VoCE7akIdaNzwml0PhIkoAsl7eYpqOudBhQ2gTTQJR
 18CGmmRtd9obEWRvz4s37gMvhyEDJZZbExy5HxkskSze8Mlp7O8eFelcz
 WIClypipSfPRRjZtUhx1EBTGhDqfzfjYO0qF4FGbV/82drqSCX0T+h+dg
 SCCyCFTRv166QyriGo50HJxKmPgIQvkEy3CVZ4jhkI7OozucH5pRFDRWQ g==;
X-CSE-ConnectionGUID: +fvZyZWgTZGuJaqUns++wQ==
X-CSE-MsgGUID: xQ5Kogx0RrK/bojMJaCPpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65950861"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="65950861"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:44:08 -0700
X-CSE-ConnectionGUID: xl18GoD6Qz6VJUChQZC5YQ==
X-CSE-MsgGUID: c2ZZVExVS+uKf4H/sUVp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233309019"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 10:44:07 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v5 0/4] Enable HDR in IGT Frontbuffer Feature Tests
Date: Wed, 29 Apr 2026 23:22:01 +0530
Message-Id: <20260429175205.2327206-1-swati2.sharma@intel.com>
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

Patches add HDR support to the kms_frontbuffer_tracking tests.
This update integrates HDR into the feature test matrix, ensuring HDR
scenarios are exercised in RTE, suspend, and other feature-based
subtests.

Swati Sharma (4):
  lib/igt_hdr: Move HDR helpers from kms_hdr into shared library
  lib/igt_hdr: Add helpers to enable and disable HDR on an output
  tests/intel/kms_frontbuffer_tracking: Add HDR feature support
  tests/intel/kms_frontbuffer_tracking: Enable HDR in feature tests

 lib/igt_hdr.c                          | 240 ++++++++
 lib/igt_hdr.h                          |  31 ++
 lib/meson.build                        |   1 +
 tests/intel/kms_frontbuffer_tracking.c | 743 ++++++++++++++++++++++++-
 tests/kms_hdr.c                        | 268 ++-------
 5 files changed, 1046 insertions(+), 237 deletions(-)
 create mode 100644 lib/igt_hdr.c
 create mode 100644 lib/igt_hdr.h

-- 
2.25.1


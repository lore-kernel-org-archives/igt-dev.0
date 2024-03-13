Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6F7C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 10:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBFC10F735;
	Wed, 13 Mar 2024 10:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrXpFcS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E08610F2BD
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710326728; x=1741862728;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=geZ1APTXix3xMmezoSJMH/EOMkhhNuoMX7UYKbnFHXY=;
 b=YrXpFcS3kJoEG0AFxCbVnwYH09yL5IJDj85NMfcSv6Cd/ruWLkj6Pi4v
 j85Nki15rWEHVXNUiYfaghYHFkqaX5PPPEmY1jvcJ8jHAZx9Qqbi/r33+
 WIZJGF/KiIJ/Wwr1mRkFikSMrmZmJCnldqGcNOJorShJIjSqo0LKcEb8M
 hSc6AOXkl5r1sIdEnchcoy0cX54lsTFfZ+xjn+iJIXseES/l7aiVU/O6s
 8uxMTYTy1oxTCBbkJVIEAgEbOp078Np5QpxGZKGBNigABI5BDqxBkuIz2
 rNu0fkJAdKsikaVPywMZVeVE9ioc35ie7ccT4KEoBS3Ozg+WXhvxL8GWS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27558482"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="27558482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="12300785"
Received: from unknown (HELO localhost) ([10.245.244.223])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:45:27 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/2] Add common functions for i915 and xe
Date: Wed, 13 Mar 2024 11:45:18 +0100
Message-Id: <20240313104520.148338-1-zbigniew.kempczynski@intel.com>
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

Introduce common code for i915 and xe - check if region is smem/vram
and if it supports compression.

Zbigniew Kempczyński (2):
  lib/intel_common: Add placeholder for common i915 and xe functions
  tests/xe_ccs: Simplify subtest skip condition

 lib/intel_common.c   | 102 +++++++++++++++++++++++++++++++++++++++++++
 lib/intel_common.h   |  25 +++++++++++
 lib/meson.build      |   1 +
 tests/intel/xe_ccs.c |   4 +-
 4 files changed, 130 insertions(+), 2 deletions(-)
 create mode 100644 lib/intel_common.c
 create mode 100644 lib/intel_common.h

-- 
2.34.1


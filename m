Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079CDC5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 11:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781510E10C;
	Wed,  4 Jun 2025 11:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPzjEcdX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084FB10E10C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749037837; x=1780573837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2TwG4kZwnQzuWDvnODNGey/+y+ibLjtOF5xjGPVl9s8=;
 b=XPzjEcdXWQY/UlfpSMOKyRtZeImOs0HPlTkyd4HSvo1jfc6NR0lL7fp9
 aPVktVlRCTLHaQqFSwQsCetA54jK4rGRQkTI4ve0r4E2uwLtK+J/9ZcUp
 6duDbS9tZh5g8vjLJtu2Djqk5bXEzhZl4h5VEE/kFEoBsdngir7p0cxP7
 wHh7eOJYJf8OA0LW9DDbF87iGH13PfAr2DDZWQn8etB/3XIdtuQOu900x
 SEwzgBXnWz7Xl096dKjWM7jIOlQUwA25E8TQpPimNQk61gtzjXOI6ReOS
 eF/KtkGqAPv3B5Gz0zLhmR9BhdKBE7+9U4nYpyE1eBt3nVf3wJihcOEFT w==;
X-CSE-ConnectionGUID: 8Ht42oHoRWaE2pCOv0dvTg==
X-CSE-MsgGUID: owT91NIFQiGYNYSJtW//cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="73645593"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="73645593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:50:36 -0700
X-CSE-ConnectionGUID: n6dD48KpTrqnNTBcG6L6Zg==
X-CSE-MsgGUID: 5+gcknMnTeyZAF5+zCyt4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150444488"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.78])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:50:36 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] Control compute-preempt bo allocation
Date: Wed,  4 Jun 2025 13:50:25 +0200
Message-ID: <20250604115024.117036-4-zbigniew.kempczynski@intel.com>
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

Compute-preempt on BMG reveals some bugs related to oversized
bo allocation. This happens because memory limits for objects
allocated in vram are taken from system memory - what is wrong
obviously. However it should work as well even if this exceeds
vram size and causes eviction.

First patch in the series makes all platform starts to use
system memory allocation for compute objects. Second patch
extends testing on discrete to use vram objects.

Cc: Francois Dugast <francois.dugast@intel.com>

Zbigniew Kempczyński (2):
  lib/intel_compute: add alloc preference for objects used in compute
  tests/xe_compute_preempt: add compute preempt on vram bos

 lib/intel_compute.c              | 91 ++++++++++++++++++++++----------
 lib/intel_compute.h              | 15 ++++--
 tests/intel/gem_compute.c        |  3 +-
 tests/intel/xe_compute.c         |  5 +-
 tests/intel/xe_compute_preempt.c | 88 ++++++++++++++++++++++++++----
 5 files changed, 157 insertions(+), 45 deletions(-)

-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FA6108B8E7
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8467E10EAC7;
	Fri, 20 Mar 2026 10:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzDuf6zi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F051010EAC7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774001163; x=1805537163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GHlWelyFVU4IwiUeuTbtjBkGQGG8MYnBCWIWky/g0IE=;
 b=gzDuf6ziu5L6sLdHdV4mCnjf9oZGvWl5LT/nYbGU2xIWweh4PaU+JgmB
 l7iukPeoZ1rql4XXdCeMKMCHHexJoLQAJ1K1LKC7zfRSByOTYudArczNZ
 K/YdPUPvfkaWTHnqjXAL5+dvElEUZWgktusCexfiFPjxvrBk6PVDkpneI
 X5BI80FbB98gcEqlvJwD+8TLFyvc/eLpPNtKE0C27UzQDjAhZkZi9Qypm
 Lal/HIVKaEgr8ABR6sc8H7RIX8qyTEvmQHU+217clolq/afYhWH3APaFL
 GLvlUGJSsOh6sIl2seyjRU0b9lTo/d1+5OVu4t8xF3uzuHLQxyy0KL75Y w==;
X-CSE-ConnectionGUID: CP+/xijoRKa0XHdwqtz9TA==
X-CSE-MsgGUID: i6/OEhnYQ4WHz8D3uQJ8Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92657850"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92657850"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:06:02 -0700
X-CSE-ConnectionGUID: Or0LawRQQBqS4qVgeQYfmQ==
X-CSE-MsgGUID: Yz+ItbGSRW6DTOTFCaKuFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="218613963"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:06:02 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v6 i-g-t 0/2] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Fri, 20 Mar 2026 10:05:50 +0000
Message-ID: <20260320100554.2427448-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

Current tests focus on VM creation with basic mode selection and do not
support overcommit scenarios.

This change adds tests to verify overcommit behavior across different VM
modes.

Non-fault mode tests:
 - vram-lr-defer: DEFER_BACKING rejects overcommit at bind time
 - vram-lr-external-nodefer: Long-running mode with external BO and
                             no defer backing
 - vram-no-lr: Non-LR mode

Fault mode tests:
 - vram-lr-fault: Fault handling allows graceful overcommit via page
   faults
 - vram-lr-fault-no-overcommit: Verifies NO_VM_OVERCOMMIT blocks same-VM
   BO eviction during VM_BIND while still allowing eviction during
   pagefault OOM

These tests validate that VMs handle memory pressure appropriately based
on their configuration—rejecting at bind, failing at exec, or handling
it gracefully via page faults.

Currently this is tested for overcommit behaviour for VRAM only.

Sobin Thomas (2):
  drm-uapi/xe: sync with kernel header
  tests/intel/xe_vm: Add support for overcommit tests

 include/drm-uapi/xe_drm.h |  22 +--
 tests/intel/xe_vm.c       | 395 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 405 insertions(+), 12 deletions(-)

-- 
2.52.0


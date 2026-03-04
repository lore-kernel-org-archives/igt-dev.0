Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D79AEF8FED
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 14:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A06F10EA05;
	Wed,  4 Mar 2026 14:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+8uCzIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411AF10EA05
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 14:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772634989; x=1804170989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wmVHyCotL6arBznAzJ4w8+nzNRvOc3TfrxJWyRwG/54=;
 b=T+8uCzInMVd4nNOanryBQqcyT71SC8w/aL0zGAeQfSwWsvd0opdQIXt7
 mPF2K1L1JH/YPz1vvO1hcJpdmyvZAsEkiIS6x71oFSSLo4PVR476gT+Fj
 XUWRmtt02d+3au4+RCj+xojqH7/qKZFWGoUvgqS8vn0/DDvrOqwQAW7Fi
 Lf2xM1UZVQrpk/ZJee27XWhlfu7POEuodW2apG7ZvmmddctMDS63JFKSC
 +KKytr9WaXaae0vET1XQ34gHobWr6XCBJqBxcfIjotP5gjowJRjfyWtXu
 4zFsuytgGZeIlES4LKDH9+uA2CsjjL9VyHfuSdPeWZpktXEHuMwi6/czf Q==;
X-CSE-ConnectionGUID: HqkIpXtFSLiWQl+HCRRAVg==
X-CSE-MsgGUID: gI77C8mfQiOaJxC/a8X8Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73743485"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73743485"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:36:28 -0800
X-CSE-ConnectionGUID: wRrILYP+TeefngMiAHDlsA==
X-CSE-MsgGUID: b4t4+sQ3RW6FI7LRO9XWXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="217517483"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:36:28 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/2] tests/intel/xe_eudebug_online: Fix sporadic failures due
 to unhandled fsync errors
Date: Wed,  4 Mar 2026 15:36:17 +0100
Message-Id: <20260304143619.3854871-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fix sporadic failures in xe_eudebug_online pagefault tests caused by
fsync() on the debugger VM fd silently failing when the GPU cache flush
hardware is temporarily busy.

v2: Use IGT specific VM_SYNC_TIMEOUT_NS constant instead of
    DRM_XE_EUDEBUG_VM_SYNC_MAX_TIMEOUT_NSECS.

Jan Maslak (2):
  tests/intel/xe_eudebug_online: Set timeout for debugger VM fd sync
  tests/intel/xe_eudebug_online: Assert fsync return on debugger VM fd

 tests/intel/xe_eudebug_online.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.34.1


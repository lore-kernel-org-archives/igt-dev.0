Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAEDC54E71
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 19:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB00810E0C1;
	Tue, 20 May 2025 19:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nESEyJq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06D310E0C1
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747769431; x=1779305431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KBpbLD6SHWxwHEEhhYBVPTb4YyRI7WE1qipSJ7+0cR4=;
 b=nESEyJq5Vhvu5IcsjrJTKIyXNueoIvRG23cd1jsPmlg7WwdDIKI7vdxJ
 MzcroAb4lv8E3c1YTtYhekflRNq3eei50M4850hwBUkIXwabn6pDJsd4r
 s2UzQ7EHPwTSZgbIXKQ+n7lTvb72XVDPXv2nGXZbO849xIXZSlAjO3h1b
 mIolMOfsBi4ptT3spVi0QizfROMu8FquHj+lmJwbTLmT3/IJ8a9Ds7uS4
 LB9EKePmhcYkkqSP+AXCvoyxzb5V4RooadV/OJ3YF5CN/G2MvAY6633lx
 OgslbR3OcfBvTA4MrjbywaN4MNdE1MIbMkxPKjFH5RRir4d71+SIhVXU/ w==;
X-CSE-ConnectionGUID: odNS+HvLSiC+JQp8LqMSSw==
X-CSE-MsgGUID: LicjO1PLQoGmER7yhEkWbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53386090"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="53386090"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:30:30 -0700
X-CSE-ConnectionGUID: zkYohALJQKixBTwrY+9mNA==
X-CSE-MsgGUID: HYlKEK20QxKWJfuChBSnBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140840244"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:30:26 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, himanshu.girotra@intel.com,
 aditya.chauhan@intel.com, pravalika.gurram@intel.com,
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [RFC v2 i-g-t 0/5] Replace intel_sysfs_debugfs
Date: Tue, 20 May 2025 21:29:44 +0200
Message-ID: <20250520192951.411614-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514175140.115033-1-peter.senna@linux.intel.com>
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
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

DO NOT MERGE!

intel_sysfs_debugfs was created with the intention of unifying i915 and
xe tests to close testing gaps between the two. This series goes a few
steps further making the sysfs and the debugfs tests gpu agnostic. This
series also creates xe_debugfs that preserves the tests that
are exclusive to xe.

This series:
 - deletes tests/intel_sysfs_debugfs
 - moves shared function to lib/igt_dir_explorer
 - creates gpu agnostic tests
   - core_debugfs
   - core_debugfs_display_on_off
   - core_sysfs
 - creates the xe-specific test
   - xe_debugfs (complementary to core_debugfs*)

*** This RFC does not update test lists and does not update blacklists ***

Cc: marcin.bernatowicz@intel.com
Cc: himanshu.girotra@intel.com
Cc: aditya.chauhan@intel.com
Cc: pravalika.gurram@intel.com
Cc: sai.gowtham.ch@intel.com
Cc: ramadevi.gandi@intel.com
Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com

Peter Senna Tschudin (5):
  Remove tests/intel/intel_sysfs_debugfs
  lib/igt_dir: Directory processing and flexible file handling
  Add tests: core_debugfs and core_debugfs_display_on_off
  tests/core_sysfs: Add GPU-agnostic sysfs testing
  tests/intel/xe_debugfs: Add Xe-specific debugfs testing

 lib/igt_dir.c                       | 260 +++++++++++++++++
 lib/igt_dir.h                       |  61 ++++
 lib/meson.build                     |   1 +
 tests/core_debugfs.c                |  54 ++++
 tests/core_debugfs_display_on_off.c | 171 +++++++++++
 tests/core_sysfs.c                  |  58 ++++
 tests/intel/intel_sysfs_debugfs.c   | 430 ----------------------------
 tests/intel/xe_debugfs.c            | 212 ++++++++++++++
 tests/meson.build                   |   5 +-
 9 files changed, 821 insertions(+), 431 deletions(-)
 create mode 100644 lib/igt_dir.c
 create mode 100644 lib/igt_dir.h
 create mode 100644 tests/core_debugfs.c
 create mode 100644 tests/core_debugfs_display_on_off.c
 create mode 100644 tests/core_sysfs.c
 delete mode 100644 tests/intel/intel_sysfs_debugfs.c
 create mode 100644 tests/intel/xe_debugfs.c

-- 
2.43.0


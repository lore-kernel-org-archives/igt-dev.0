Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF779C3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 17:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7849610E6C7;
	Wed, 14 May 2025 17:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvz5ABsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217D310E6C7
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 17:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747245133; x=1778781133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/GQOfmH3sALvfZ6l+jGeuUVXsH2iZXqnJKN/Qk5P/Cw=;
 b=bvz5ABslApbf5eHHm7hqKXSN6pJlVZxFeus55z82OAfYMtwoxUIPGgeV
 3qkJT9YVXJwsxD2L6XdZaeff+6yTpvjuquN1l1gYvCYyMzXhPd/54zbqR
 b/QGlaCUoK2pf75GhBCw91jBe/7afHakwWDxx5x3O+uaRVjDLloWKkUsa
 Zwwp60+AUVAh+L15d5WxvIU6sVXfzGw24b26Kgr8dbngxosCNcIJ+9MDE
 aevg4M3Ct98UgRB4yRSE2XtwsIVhYrV2CwZsoe8pcoKtBNvh0DojtmhAm
 c0FBQY/LNxGl06HYUA7/HhJV6p1CWj7VtJ1mi225prWmb3wo+Ilnnt7KE Q==;
X-CSE-ConnectionGUID: Xf4ejiUKS8CZw7MftJEF9Q==
X-CSE-MsgGUID: f5d16irDSlOFVU6jon0gJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49025950"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49025950"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:52:13 -0700
X-CSE-ConnectionGUID: PHP972OYQmiz1rA+6+hC4Q==
X-CSE-MsgGUID: VC0Rmjk0TDSIe32v3DWVQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142998403"
Received: from amiron-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.81.154])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:52:09 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, himanshu.girotra@intel.com,
 aditya.chauhan@intel.com, pravalika.gurram@intel.com,
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com
Subject: [RFC i-g-t 0/5] Replace intel_sysfs_debugfs
Date: Wed, 14 May 2025 19:51:32 +0200
Message-ID: <20250514175140.115033-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

DO NOT MERGE!

intel_sysfs_debugfs was created with the intention of unifying i915 and
xe tests to close testing gaps between the two. This series goes a few
steps further making the sysfs and the debugfs tests gpu agnostic. This
series also creates xe_debugfs that preserves the tests that
are exlcusive to xe.

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

Peter Senna Tschudin (5):
  Remove tests/intel/intel_sysfs_debugfs
  lib/igt_dir_explorer: Add function to recursively read all files in a directory
  Add tests: core_debugfs and core_debugfs_display_on_off
  tests/core_sysfs: Add GPU-agnostic sysfs testing
  tests/intel/xe_debugfs: Add Xe-specific debugfs testing

 lib/igt_dir_explorer.c              |  72 +++++
 lib/igt_dir_explorer.h              |  10 +
 lib/meson.build                     |   1 +
 tests/core_debugfs.c                |  47 +++
 tests/core_debugfs_display_on_off.c | 165 +++++++++++
 tests/core_sysfs.c                  |  52 ++++
 tests/intel/intel_sysfs_debugfs.c   | 430 ----------------------------
 tests/intel/xe_debugfs.c            | 212 ++++++++++++++
 tests/meson.build                   |   5 +-
 9 files changed, 563 insertions(+), 431 deletions(-)
 create mode 100644 lib/igt_dir_explorer.c
 create mode 100644 lib/igt_dir_explorer.h
 create mode 100644 tests/core_debugfs.c
 create mode 100644 tests/core_debugfs_display_on_off.c
 create mode 100644 tests/core_sysfs.c
 delete mode 100644 tests/intel/intel_sysfs_debugfs.c
 create mode 100644 tests/intel/xe_debugfs.c

-- 
2.43.0


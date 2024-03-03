Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EBCC54E49
	for <igt-dev@archiver.kernel.org>; Sun,  3 Mar 2024 17:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7F110F038;
	Sun,  3 Mar 2024 17:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SV9AbpnC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF9410F038
 for <igt-dev@lists.freedesktop.org>; Sun,  3 Mar 2024 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709485906; x=1741021906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wZBEfVTP5agktiC1JUtwtl+h5XdJ7FGavOKyJXV7cn0=;
 b=SV9AbpnCjJ62E8/I/opHXec0Z93Gn5aY94RGKHr6vvtBWqyh1tY9XdUl
 E91GjGbzPBnRP7vySAwcLhzfedi1ZOZ8edQ/beOpfEnuA/B60C5lq61uw
 mOeodeVi6tnd5sUvCbIq1RDf19IPkR0OcnroGf5mtR1KsbGx4aIBAfA4/
 ukPLI4qV/G/+unYaC6WvayN96mGKPf6FOGOoo2O8ju6zUC86f/0JXN7rf
 jKFN7tLIOhPd43VOoQ2JKICplxkf+rbk6VW3VwVjJnBNyGgRhqdKjsGBL
 ho8XfOLfi/qQvhU+U4Xm2Y/Z/FWhX2OxFPKB4+0lRjdLFs6owD6SANR8b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3833266"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="3833266"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2024 09:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; d="scan'208";a="13303448"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 09:11:42 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/4] revamp big joiner test
Date: Sun,  3 Mar 2024 22:52:12 +0530
Message-Id: <20240303172216.254535-1-kunal1.joshi@intel.com>
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

big joiner outputs are statically assigned to pipe,
assign dynamically also add support for forcing
joiner, support for forcing joiner was introduced with
below kmd patch

drm/i915: Add bigjoiner force enable option to debugfs

Kunal Joshi (4):
  lib/igt_kms: move bigjoiner_mode_found to lib
  lib/igt_kms: add helpers to enable/disable force joiner
  tests/intel/kms_big_joiner: revamp kms_big_joiner
  tests/intel-ci/fast-feedback: HAX PATCH DO NOT MERGE

 lib/igt_kms.c                         |  73 ++++
 lib/igt_kms.h                         |   4 +
 tests/intel-ci/fast-feedback.testlist |   5 +
 tests/intel/kms_big_joiner.c          | 504 ++++++++++++++------------
 4 files changed, 351 insertions(+), 235 deletions(-)

-- 
2.25.1


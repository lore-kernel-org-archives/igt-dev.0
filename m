Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AC6C54E41
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 07:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D82810E0AE;
	Thu, 29 Feb 2024 06:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5kPLJgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C8410E0F0
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 06:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709189998; x=1740725998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=O3UoDvdM165bmxMMKwEv80Wf9IBOIbl6vVEsBYesjRk=;
 b=W5kPLJgKysXj3fbRXn3avDdM7y5vHL/RjfDmfFD1VA63tIAb09+2qzhy
 ID1cGEJzdM9RuH+Tq3UPmk4IcOoYB7w/EIv2zroO6dFXpw5/f8pFyQ0Bv
 vLNpvoFSXX7oqlGhyNMOfcM0UQVVj1Y0FjMUjfCgb5C3QjB/gPHCTnqJk
 LHgb77g86Pm0pDn6cyE27LxWEK9rf/7wNZn65dVff7AZNj3fa8GxSgwPx
 zptZKRQ85sK3eAJtkwIS8kzWZw0SvXlhvCBWJJL8HY8HFZQXyN2Dv5gzA
 fM2wnvRJNyBsGJtBDnUrW1eKgIPAPtp5SpP/Hi0CKKeguqqnXVpWXy2j0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3755978"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3755978"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7640487"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:57 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5AD25580E4B;
 Wed, 28 Feb 2024 22:59:57 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rfaOY-00000002GEg-3Zn0; Thu, 29 Feb 2024 07:59:54 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 0/4] uniquelly identify a feature at documentation
Date: Thu, 29 Feb 2024 07:56:15 +0100
Message-ID: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Right now, some documentation groups use the same name on different
categories:

	WARNING: feature MultiGPU has multiple parents: Hardware building block and Software building block
	WARNING: feature sysman has multiple parents: Infrastructure and Software building block
	WARNING: feature compute has multiple parents: Hardware building block and Software building block

The same happens for evict feature, which has different sub-categories:

	WARNING: feature evict has multiple parents: VMA and Flat-CCS

As we want tests to be properly accounted for and having an unique name for
each bucket, address such namespace clashes.

Mauro Carvalho Chehab (4):
  tests/intel/xe_query: use Hardware building block for MultiGPU
  tests: use Infrastructure category for all sysman tests
  tests/intel/xe_noexec_ping_pong: change category to hardware building
    block
  tests/intel/xe_evict_ccs: use a different name for evict on Flat-CCS

 tests/device_reset.c              |  7 ++++---
 tests/intel/xe_evict_ccs.c        |  2 +-
 tests/intel/xe_noexec_ping_pong.c |  2 +-
 tests/intel/xe_query.c            | 11 +++++++++++
 tests/intel/xe_sysfs_scheduler.c  |  2 +-
 5 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.43.2


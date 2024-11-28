Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC26D69107
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 13:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C9A10E13B;
	Thu, 28 Nov 2024 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPDXcRJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6435010E13B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 13:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732799117; x=1764335117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1OmiProfbfL/MeMmE4lkZ+wVi9UStvAcnyxHHe8MjII=;
 b=nPDXcRJNmXp+Tv+h/5mVTG6yvd5MKTP69AjX8ABlwSmDCaPaKebQm69M
 640p54oqruSH/YaSLulp+NHqxzVaeCw3rUfsjpiZSzOZFy7x2KHxeXIf3
 a4NijXC/PeucZnA7B7e1Zw/TydX1jFZDy6SFUB/uPipihIjh4120gmTOV
 MeGHpt13mFg4NpCVg39dsCrq7ocHt/ztgUpS+4Jard8SuZ07FDalztJ+I
 T/x1gse8PnXS8lhyRfoQsrpF4VAqUkHEnC9+s0NrcNDj+c0s73tHZSB0k
 5wqB1qyhcIuDX4L2FEH2zBrv6WA9p5bjetCEm+XpOIjTyu59mmMsfgE1m g==;
X-CSE-ConnectionGUID: nImIh4F7Rcu8kZBYWDANGA==
X-CSE-MsgGUID: DYybiKJfReq58c6F6RiRXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33183265"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33183265"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:05:17 -0800
X-CSE-ConnectionGUID: F/Gzwhm7SP+7yIxTlkcU2A==
X-CSE-MsgGUID: ZJGr0V+YRe6f3hVCey55hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="129736102"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:05:14 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/3] tests/xe_eudebug_online: update thread count handling in
 query_attention_bitmask_size()
Date: Thu, 28 Nov 2024 13:05:00 +0000
Message-Id: <20241128130503.241328-1-jan.maslak@intel.com>
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

This patch series adds a helper function to lib/xe/xe_query for looking up 
the values of hwconfig attributes and updates the thread count handling in
the query_attention_bitmask_size().

v2: Added hwconfig to xe_device, so that its value will only be queried
    once, cached and later used by the helper function.
    Added proper commit messages.
    Fixed stylistic issues in the code.
v3: xe_hwconfig_lookup_value() returns a pointer to cached data rather
    than copying it to a new buffer that the caller would later need
    to free.
    Added assert for length returned by xe_hwconfig_lookup_value()
    in the test.
    Reworded xe_hwconfig_lookup_value() description to clarify that it
    returns the length of the value in uint32_t elements.

Jan Maslak (3):
  lib/xe_query: add hwconfig to xe_device
  lib/xe_query: add xe_hwconfig_lookup_value() helper
  tests/xe_eudebug_online: update thread count handling in
    query_attention_bitmask_size()

 lib/xe/xe_query.c               | 67 +++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h               |  8 ++++
 tests/intel/xe_eudebug_online.c | 12 +++++-
 3 files changed, 85 insertions(+), 2 deletions(-)

-- 
2.34.1


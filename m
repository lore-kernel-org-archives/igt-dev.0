Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD11C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 03:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7F010E0D8;
	Thu,  6 Mar 2025 03:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRJ+SEg7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE9710E084
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 03:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741232657; x=1772768657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QYrifbneTkEvWcLVwHy/LSX71tM9LfGF27+mqPNuBFA=;
 b=YRJ+SEg7opyuU4qVXfNgauTZC9NanixGEtUPmKIR66sJesFBMLY4UqPZ
 hb9/1HHjhO0YSPq6o6nJLGQlLMkCVZma6E5jK70Pj2Slo0iERYqwVV+IY
 YXKx8xQsdTLJF2wN/iVLoJLR28FjOLVtDMug3TYpyxBnwzNN2GJsSaoI0
 S+hDYJ6e3M7XccssYjXnYM/Ol7d134JhJRzqeChUJspC4rvTwL4yR/4Dl
 KLNl9tLf85ZNMN/h4rm5GTQvRcafo934MewmLw/8kYwNLdjzYRXKfXHvE
 wuCn75+7dv8WwlkechYczVlLB8z83MTHso1oIP57GDR8Wt5Sth77Qu9fl A==;
X-CSE-ConnectionGUID: ag8dV8+iTQapAp6hkKzzUg==
X-CSE-MsgGUID: cYDdhv1ZT5CXP0uSrXqlWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64673556"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="64673556"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:16 -0800
X-CSE-ConnectionGUID: 74mNeCE+S6GlpZC/b/R23A==
X-CSE-MsgGUID: UdiTPZJpS9y2P+j+Q5UBKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119403294"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:13 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, ramanaidu.naladala@intel.com, jouni.hogander@intel.com,
 kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/3] Skip PSR and Joiner combinations
Date: Thu,  6 Mar 2025 09:09:49 +0530
Message-Id: <20250306033953.2519156-1-santhosh.reddy.guddati@intel.com>
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

As PSR and joiner are not supported together , update psr and psr2 
tests to skip on joiner outputs

Santhosh Reddy Guddati (3):
  tests/intel/kms_psr: Skip PSR test on joiner outputs
  tests/intel/kms_psr2_sf: Skip PSR2 sf test on joiner
  tests/intel/kms_psr2_su: Skip PSR2 su test on joiner

 tests/intel/kms_psr.c     | 35 ++++++++++++++++++
 tests/intel/kms_psr2_sf.c | 78 +++++++++++++++++++++++++++++++++++++++
 tests/intel/kms_psr2_su.c |  5 +++
 3 files changed, 118 insertions(+)

-- 
2.34.1


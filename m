Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D8C54E90
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 11:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16AE10F866;
	Wed, 21 May 2025 11:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1153RlE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFBC112DFA
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 11:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747825371; x=1779361371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KCu67Lwk2f1tYfFg8Kbpmi0w1ApdqFg2tpX7saqWeEY=;
 b=J1153RlE3gQOeqZzA2DiAFA/pwLIRPENbaCsVoStt+PiXKTeEAcpWDZO
 8QtUhqkQI4EnHy+KshhIPcJYPtl+sqKZYmAQUz1s97JLNBVB9RmoYMmeo
 Z0jYVSUD9xu+kw49XBqeJiiXTcXB6AKFFKxr4HqmQTLbeZr8gfkE2jmH/
 Onz+148q6h2VRmufYC14sklciDCFIWjevtn7Nb5e8cAQhiVDENFX+nxpv
 Ouwts7VP9It7IeYyafxjoCjyWC25fXHmXyM3NgUUx9bWUgs3kgh8qRNVV
 D9qX6bQMK6UBbx2YxSD6qScsxKmPMcDqbz9gamUmAnuzgxbl0J4/wpOP3 w==;
X-CSE-ConnectionGUID: h8KhKxFBR1aSn/vPqCEwTg==
X-CSE-MsgGUID: cIl9dw+CTxKoVT/5vHdSQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52424785"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="52424785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:02:51 -0700
X-CSE-ConnectionGUID: Ke5n+2ekRVmKKxbalMeL2w==
X-CSE-MsgGUID: Cw94Qp7ASLCghABk3XYKYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="141082038"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:02:31 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v10 0/5] Support for IN_FORMATS_ASYNC plane property
Date: Wed, 21 May 2025 16:23:03 +0530
Message-Id: <20250521105308.4179637-1-santhosh.reddy.guddati@intel.com>
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

Use IN_FORMATS_ASYNC property to get list of async modifiers
and improve async flips test to add coverage for the supported modifiers
and formats.

Santhosh Reddy Guddati (5):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers
  tests/kms_async_flips: Add test for all async format modifiers
  tests/kms_async_flips: Remove allow_fail flag from async flip tests
  tests/kms_async_flips: Skip Async Flips with Linear Modifier

 lib/igt_kms.c           |  73 ++++++++++++--------
 lib/igt_kms.h           |   7 +-
 tests/kms_async_flips.c | 147 +++++++++++++++++++++++++++++++++++-----
 3 files changed, 180 insertions(+), 47 deletions(-)

-- 
2.34.1


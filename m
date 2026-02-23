Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B07E98E0F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 09:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9549C10E2C7;
	Mon, 23 Feb 2026 09:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NX0Bn+mw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDB410E2C7
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771838644; x=1803374644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qvqNjMp1ThEqE2AmbG8JeYGCNhw09DeY8P1v7DSJm+4=;
 b=NX0Bn+mwImwsQxiUZAGd66+tWvL3mMHxZI5/SYe0TOfy+5jMypgAOg8J
 E41L/NJv2CM3pBs8LJjsNq4MYpHAEak43NXihkwe+3KPY+Ev70355fkQw
 6PWznyF5nKwawta0WsDCijZnFW9PPyfMLZZfA3Bcg0flwQpaviFroMbeV
 IfK3jyLH4gSytRrDE8sDvyB94Soi7KkXSn5oRx2qW6h8WBL+eSp+CX0rE
 4J+IhgKFeAys/M+XHm1i1wPmYZHyLsD6qWD54CQ3A1zsQ6QHro/atM/13
 uzw2z+1Jr2/x5EPRxbBcnEhnoXwLNPUCazKSJ7emiemTMfUAZwpPBMqwY A==;
X-CSE-ConnectionGUID: e0OTh3juQbCLoaHAuxb+OA==
X-CSE-MsgGUID: 7imgGNFvR5C/c8kgbS5VQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="75437923"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="75437923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:24:04 -0800
X-CSE-ConnectionGUID: O2xV1N6RTZ+7Sn/R0GkYEQ==
X-CSE-MsgGUID: 6mL74IvQQkiPXFjgeX0zgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="243687763"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2026 01:24:02 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 0/2] Add helper to select non-joiner mode
Date: Mon, 23 Feb 2026 15:04:41 +0530
Message-Id: <20260223093443.1797078-1-pranay.samala@intel.com>
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

The kms_sharpness_filter test currently fails on outputs that default to
joiner modes. This series adds a helper function to find suitable mode 
that doesn't require Bigjoiner/Ultrajoiner, and uses it in the test to 
switch to non-joiner mode instead, allowing the test to run successfully 
and avoid false failures.

Pranay Samala (2):
  lib/igt_kms: Add helper to get non-joiner mode
  tests/intel/kms_sharpness_filter: Detect and bypass joiner modes

 lib/igt_kms.c                      | 31 ++++++++++++++++++++++++++++++
 lib/igt_kms.h                      |  1 +
 tests/intel/kms_sharpness_filter.c | 11 ++++++++++-
 3 files changed, 42 insertions(+), 1 deletion(-)

-- 
2.34.1


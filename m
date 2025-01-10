Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49B8E7719D
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 04:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786E610EF93;
	Fri, 10 Jan 2025 04:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMIXz2p1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9456D10E4D7
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 04:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736483320; x=1768019320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vGUWOWyMBqSppcmRjHZ5P1UAVJ+npvXCvyXeHIADWus=;
 b=eMIXz2p1DhTb0PngZBgb++jWe5CV8axks9cN5eMqVLkwATysFjbPp+PO
 JZvtXAmz5esP5Qb/AR3BdModgzwRC+OK41gU5FWt8eyutHfs+Ru+EB3Zk
 V2BZyONh8fUT5r35SBNLx7IonAIKkO5rLb85lqDFQgwRnrYeX3OdBNBLm
 kthwgqwBxLQR4chOSTiYDkNGflS4FH2ruplUW750Zjwji6EMifJHn7kqM
 I0wndKVWyNVfwYcfOfYAk4PZVzx03BTGHn8LvT7nq3hSvmNQDWH1aandw
 Ba6xq4dGzyFW0dt5NC1hqWg0X/DcDXT6WSzlKIgf17CKcKcxF5RxCKSJ0 w==;
X-CSE-ConnectionGUID: +FdDpgylT6qR7d3t+TiWbg==
X-CSE-MsgGUID: S7R0aljeT5im1q9TMuSFbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36655318"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36655318"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 20:28:39 -0800
X-CSE-ConnectionGUID: c7xtd6+DTf+jtEJEmvHBLg==
X-CSE-MsgGUID: +Vu2PfQPRVWKcxwPoDC6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103504515"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 20:28:33 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v8 0/2] tests/intel/kms_joiner: switch modeset from uj
 to bj and vice-versa
Date: Fri, 10 Jan 2025 09:57:50 +0530
Message-Id: <20250110042752.32846-1-santhosh.reddy.guddati@intel.com>
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

Add a subtest to validate switching from ultra joiner to big joiner
and vice-versa.

Santhosh Reddy Guddati (2):
  tests/intel/kms_joiner: switch modeset between uj and bj
  lib/igt_kms.c: Enforce strict check for bigjoiner_possible

 lib/igt_kms.c            |  3 +-
 tests/intel/kms_joiner.c | 97 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 1 deletion(-)

-- 
2.34.1


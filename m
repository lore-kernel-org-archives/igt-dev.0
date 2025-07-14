Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D66AC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 17:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E4210E08E;
	Mon, 14 Jul 2025 17:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIjZmby1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E6C10E08E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752515202; x=1784051202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Mc2fJfkuATbgSqFgvnWswRqoETM1uIZ7dXYuOxTp6k=;
 b=hIjZmby1xJsL+zxuZvmmoTyUBRzeeHz3kKhjsz+RSU7t4rhp6bV1EdcQ
 6+F20GQnBLJZHhDwAXKXdxkczJah1o0gLlwdEKJ1XtGuMegFn3fJFgesO
 qw9+A0iAh9NE8U9pf7YdzZPPSFzzLveDNTT/+eTih6X0pz2PzNlVOEybF
 dGry5AZvMBmj9OYXXYatxAytXyVoh+x63vn3YwNWP51DfM10ZekirHafp
 UCxpKguRt1ltiDpZg8hypYTpM69IemYATep1DlZujNqENWs/8v+e0jJid
 1s9aRUblUNo7u8ore/S0g79FI5H6LcA1ekWqutwcdnabZjBWzW9Rd0x5k g==;
X-CSE-ConnectionGUID: dzraPVwBQeivvoyqi2hCvw==
X-CSE-MsgGUID: QeMsBbvMSNmv0GX9Q3Rzwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65289922"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65289922"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:46:40 -0700
X-CSE-ConnectionGUID: wvQNQjH9T8ixKXhhqvLIDw==
X-CSE-MsgGUID: shf25qLYRdiRPTx/T4PEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156803057"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:46:37 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 0/2] Introduce intel_hdcp tool
Date: Mon, 14 Jul 2025 23:12:43 +0530
Message-Id: <20250714174245.1628709-1-santhosh.reddy.guddati@intel.com>
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

Add a new HDCP tool for self-testing and easy deployment
to client machines. This tool helps diagnose issues,
determining whether the problem lies in the driver or user space.

Santhosh Reddy Guddati (2):
  tools/intel_hdcp: Support for enabling and disabling HDCP
  tools/intel_hdcp: Add interactive menu mode to tool

 tools/intel_hdcp.c | 227 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 212 insertions(+), 15 deletions(-)

-- 
2.34.1


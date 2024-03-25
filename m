Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0477C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 09:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6920C10E6D7;
	Mon, 25 Mar 2024 09:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E92k5ia1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CE610E6CE
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711358406; x=1742894406;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z32oPplMyTrq21HXCEIRt5bMae4tXRvQVX6mkeRRAPQ=;
 b=E92k5ia1Eu+oqfT6aGwhJsRlEDFhqKRRv0orooOXNE9hZWCuct68shGi
 xUeoMaZhMW1EsohiZqjfX66FjwNfFbc7EF0eoNMSPdvklDShXVNIFRv6m
 T9uKsIe3AE0ab9CjQf9XA/TpTGjzVyjgLIfEu17ZVy2tAhSycQr1PzODD
 W5YUgUJau+P5vmPQnXYI/USVC3cAJKZrTg5Y3oH+vHvzfG6eeuzHPSnqM
 s9cI65Ie3XesCsh6AKAuTfZ2PZ30fm+pzpdh0qBQh1G2f5rCyStma4ArK
 f/3dw1ZjiEUqyWxDM4ZmL56VA5rFovjCNDKDdzSsOwnYm+9WEoUNEpNOi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="31786252"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="31786252"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="20294282"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by orviesa005.jf.intel.com with ESMTP; 25 Mar 2024 02:20:04 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, krishnaiah.bommu@intel.com,
 janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] Added invalid-va tests
Date: Mon, 25 Mar 2024 14:48:08 +0530
Message-Id: <20240325091810.2942038-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added 2 subtests related to invalid-va
1. invalid va
2. invalid va with scratch and without pagefault.

Priyanka Dandamudi (2):
  tests/intel/xe_exec_fault_mode: Test to check the access of invalid va
  tests/intel/xe_exec_fault_mode: Extend invalid va test

 tests/intel/xe_exec_fault_mode.c | 59 +++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 13 deletions(-)

-- 
2.25.1


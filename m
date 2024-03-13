Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A85C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 09:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5DB10F127;
	Wed, 13 Mar 2024 09:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+aTBspX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E6210F10D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710322458; x=1741858458;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sVSs9wtWiyjjETFOq5uQKnp5gKKQVsoX6psHfLOzTDU=;
 b=a+aTBspXX1d+nfW26SqPbFOfCgQb61V0Gt877i4w9ylH33EK50yDqWpJ
 Vtq5hbor+WPATH13xjKXiXhb6RZQI720PV7Mop4JSeW4zNJLf+IFcXznT
 V4Y1ij7W8OKV6Al6cHU+14M/f9lXlXB71dvOW8C04o/YtWVHo19XHv23G
 vU+A7aR673TMknjA2ppeKbrJaXz79cinsbJQD6xXyEA4JibPFyqlofrs1
 CmU3cWyOnhYxXwS1zG92w56Id2mrn6erB2w5GumY6DG+hfd5JpxBwHEiY
 cuwNXjx372cfP9l+updcbWM4BqAsxqX72FD3i4269hS5vFmng76D5N1sS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16523099"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16523099"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 02:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11751469"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmviesa007.fm.intel.com with ESMTP; 13 Mar 2024 02:34:16 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, krishnaiah.bommu@intel.com,
 janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org
Subject: [i-g-t 0/2] Added invalid-va tests
Date: Wed, 13 Mar 2024 15:02:47 +0530
Message-Id: <20240313093249.2257541-1-priyanka.dandamudi@intel.com>
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

 tests/intel/xe_exec_fault_mode.c | 60 +++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 13 deletions(-)

-- 
2.25.1


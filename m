Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9FCD78797
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 23:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AED10E91D;
	Fri, 19 Dec 2025 23:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMz6/PzB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7F010E91D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 23:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766187980; x=1797723980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LIgIHlmrC4Bnrl0K6bZv/T4BhNzFCz7epnUA8GZb84o=;
 b=NMz6/PzBIGMZvvjCfJk6SrJTFIJC7PIkXHcr2WGT/r20Fj+scb2uNFGr
 cX6V9A/yeNpCoQxrhuAsL/c8APOjWR0DYGI8BsQ84XAW0Di98pdru2nm7
 CYdrsD9fhvPJpOxwT+mn5JzzkkoqCwSkuCDneEQnBAnLpkJ9ElWIeP831
 OPZegPhyhYTAA9NCu4GTAOrwl4JNJWTJG3ejXGp7iJqGep5xX0wVN8rEc
 Rz+QlE7JBvbTD6Pla5WIIXpiXJte+D9CFqlgD4wh3/kMqGTMWxj1zS7x1
 /fuIq0s+Qe10TPacAIDTs92Ev0GfXUtRG3RfOcblV+AO1LJtfqmQa9bPw w==;
X-CSE-ConnectionGUID: cHUk7yE8RGWFO7bh2wu6fg==
X-CSE-MsgGUID: 7MAlRjh6QXmVpo3AwOyPNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67146939"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="67146939"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 15:46:20 -0800
X-CSE-ConnectionGUID: 3EEtNvGhT+u0ox5qbcgudg==
X-CSE-MsgGUID: 4t1rvpIpSyyIXDcplisd6g==
X-ExtLoop1: 1
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa003.fm.intel.com with ESMTP; 19 Dec 2025 15:46:19 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, zbigniew.kempczynski@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v8 0/2] tests/intel/xe_pat: add helper funtion to read PAT
 table
Date: Fri, 19 Dec 2025 23:46:12 +0000
Message-ID: <20251219234615.90213-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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


Xin Wang (2):
  lib/intel_pat: add pat_sw_config debugfs parser
  tests/intel/xe_pat: validate PAT table using debugfs

 lib/intel_pat.c      | 96 ++++++++++++++++++++++++++++++++++++++++----
 lib/intel_pat.h      | 20 +++++++++
 tests/intel/xe_pat.c | 48 +++++++++++++++++++++-
 3 files changed, 154 insertions(+), 10 deletions(-)

-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A33CE835E
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 15:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0579910E53A;
	Mon, 30 Sep 2024 15:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8pISniV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B4710E53A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727710738; x=1759246738;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l6JktOl2PXde+HIWHnJC+LM9bwK82f3Lc+URGv6+OZo=;
 b=M8pISniVtLBk8hcg+rVhbLZ+E5epv5rqCL5YlQrf6qou0x0qHvSKLdVo
 niOBixwhT4zcXB+ATwUqdAjYSr23hh1FiglONenENb8CLh1d8IixelCVh
 vsn//ww9gb1gG0Nw6QZ1/2wfswWpKVzn5xEFSCmKKqhO5S8P7AMW7xJpC
 i+vtXrpvTmwAsfQDNvb20MauLeek79TE797g5+bxan/tVeE/o0NwjokJZ
 7mxjVyI4ntzsfCnPPxnn+Orw2bw4DK7SXy7xuSuIqExltpJzHOpNxS1v4
 xEOsDSahADafAcuEhhLMfyPWfUlmIKrLNuuY9UyN+YiR1XogFPQ7g5DjJ Q==;
X-CSE-ConnectionGUID: NPDNjraRS0yKJxW4cqfKJA==
X-CSE-MsgGUID: fHizXvLHSDS/+gm88YIYiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52224355"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="52224355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 08:38:57 -0700
X-CSE-ConnectionGUID: JmAfVvJQT3GixKHMDFD3oA==
X-CSE-MsgGUID: KcYty8UGRmKIo95xHFt09w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="104145507"
Received: from priyanka.iind.intel.com ([10.145.169.174])
 by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2024 08:38:56 -0700
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 apoorva.singh@intel.com, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/2] Test to validate access counter
Date: Mon, 30 Sep 2024 21:07:48 +0530
Message-Id: <20240930153750.1141461-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Tests to validate Access counter feature.
It works after addition of related uapi's into xe_drm.h

Priyanka Dandamudi (2):
  lib/xe/xe_trace: Added code related to trace
  tests/intel/xe_access_counter: Access counter tests

 lib/meson.build                 |   1 +
 lib/xe/xe_trace.c               |  61 ++++++++++
 lib/xe/xe_trace.h               |  12 ++
 tests/intel/xe_access_counter.c | 209 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 5 files changed, 284 insertions(+)
 create mode 100644 lib/xe/xe_trace.c
 create mode 100644 lib/xe/xe_trace.h
 create mode 100644 tests/intel/xe_access_counter.c

-- 
2.34.1


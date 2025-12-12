Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D424D49208
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 11:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A8410E247;
	Fri, 12 Dec 2025 11:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQc6ztCd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B29810E247
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 11:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765540347; x=1797076347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qiKbEcSuReM3unpfmwMgAc05L8qI54UW8GNFc9fyhyA=;
 b=IQc6ztCdJ7qk+hFUNCT5+w0B2ZYcUbjt4kmxfLPAhPobj1HpRIOnw6Br
 CQTcbVzEe0ioqVxOUzoSZALBkP2WvwC6gvCWW7+Tp6WxvFaXVAcv0QRqC
 LzYN/AFnaBgshWyBcx5aWS91bIoIjwUToMWN1n5HuH1JpeJjg4dNl7C/P
 5rNnzjxnMAwFRWn7zpK9sIV4CoiTLRMXF3y3iMOYfyvqgOM6+BMZgqkm/
 7XcywBW5a/PXI6tWdU/SrdN++eYnOGWtYkUsZOeR2gK+L61+0Yf+Ndo2H
 gL0vZFHfPa0QLYlJqm6p3QqBo6YoOHlwqGLLV7zkbAG1wve9/3NNAjuwQ Q==;
X-CSE-ConnectionGUID: CF1/0Y2DRsmwt4v9VtkM5g==
X-CSE-MsgGUID: ROo6VrGMSRum1qFW70wLng==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67615557"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67615557"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:52:26 -0800
X-CSE-ConnectionGUID: roYVkBuqTNmaJZH6JsQC5g==
X-CSE-MsgGUID: scf1glnST/GHCYe+zR1tlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="234473111"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:52:25 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t, v2 0/3] Enhance SVM compute tests
Date: Fri, 12 Dec 2025 12:51:08 +0100
Message-ID: <20251212115208.179655-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add new tests used for SVM performance profiling.

v2:
- Add first patch to differentiate array_size and loop_count
- Drop aligned_size as it is unused later, the test is always called with a size
- Remove the drm_xe_engine_class_instance argument as it was unused (Zbigniew Kempczyński)

Francois Dugast (3):
  lib/intel_compute: Differentiate array_size and loop_count
  tests/intel/xe_exec_system_allocator: Cleanup compute test
  tests/intel/xe_exec_system_allocator: Add new SVM compute tests

 lib/intel_compute.c                    | 26 ++++++----
 lib/intel_compute.h                    |  2 +
 tests/intel/xe_exec_system_allocator.c | 66 +++++++++++++++++++-------
 3 files changed, 68 insertions(+), 26 deletions(-)

-- 
2.43.0


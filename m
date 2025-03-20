Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AB7C36000
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 11:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E481610E601;
	Thu, 20 Mar 2025 11:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4yuOws9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7ED8981D
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 11:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742470432; x=1774006432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yDaYzI72NZJN9IvN2VcxS1/Nz70N2089G5TuKfmyVps=;
 b=Q4yuOws9H+q/g0VbA73/t1xOw4XoiN48cs37DUa/VXEDUNfusMNnasbs
 pgX9nit6NDgq9jky19PdffkRM8ySx4zXbYk9azoqBARqBWfHRGA6Ibp/T
 XE8jJD/kbAYFwO4gNUzszqCa2/YhBP9RkYM7dg4lK0tUnYE0bD9b7/b9P
 7nid5Em0HDWP/zHnnD8rNJRp+pN4oYySk+LrSphL3oIHhtnlfAoUlXIxc
 t71ulO9NpFiOJahPRVGGrBG+VfNaXC3iA3knkjt8lnafSh6W61CFI13rf
 2HAsANbgB5s4ePlsV9K3y9+rwOf3qnQQhnKQ76Ni1r7gq5B5Fgh73NhG9 w==;
X-CSE-ConnectionGUID: xO85X5f7TEuRQRQT/Av3OA==
X-CSE-MsgGUID: 6gzHwY2lRDyaE7RD6/gFmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43828685"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="43828685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:33:50 -0700
X-CSE-ConnectionGUID: 6v1vaAduQjyK9SU6KS+hZA==
X-CSE-MsgGUID: Fdzue32XS1SWM+47dVMChQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="122788849"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:33:47 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 kamil.konieczny@intel.com, jani.nikula@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/1] tools/intel_hdcp: Introduce intel_hdcp tool
Date: Thu, 20 Mar 2025 16:58:34 +0530
Message-Id: <20250320112835.2652365-1-santhosh.reddy.guddati@intel.com>
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

The current changes include tool skeleton and get hdcp info
on the connected outputs.

Santhosh Reddy Guddati (1):
  tools/intel_hdcp: Introduce intel_hdcp tool

 tools/intel_hdcp.c | 153 +++++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build  |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 tools/intel_hdcp.c

-- 
2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D46C48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 13:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792D010E28D;
	Wed, 21 Feb 2024 13:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BcPipkUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AF410E28D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708523448; x=1740059448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wX+wIPPx0gIKFBQCTOUBr26RLJBqaz7sTc10/R+DMAI=;
 b=BcPipkUoErIYUn4DLV+tuN1NEmvmFijC3EozbsC00+jnN+pleMubEVIj
 0zq5ikTUC/B1/NDtTxH0AQ0jq2qiyGgOAWHr4K99PEkHAHMRBiFAamNui
 AlVdCp5wLdTcI7hC3u711lZ2K8n4CRf9uVAgG9LtWmumKVN1sNVoQ4PqT
 qBzmHXm49zzmlmin8Pn+XfUV9tnW+8Sjz3rowYIfC8ri8sRF0mLEDulLB
 i7cLNfeD2I06PvkwCqYNfuiqo7CbnUMWDdD8K991O2Pt800vwuTxXKjPP
 w125BXChqJPF6nAXbRj80DkmglttJX6GJERArMXtCf9Y9wsOW/HQathOp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5637218"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5637218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 05:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5081230"
Received: from tnienhux-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.221.55])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 05:50:47 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v4 0/2] Add tests to query firmware version
Date: Wed, 21 Feb 2024 13:50:31 +0000
Message-Id: <20240221135033.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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

This tests the kernel series https://patchwork.freedesktop.org/series/129640/.

v2: Address comments on HuC test
v3 and v4: Refactor tests

Francois Dugast (2):
  drm-uapi/xe: Add test to query GuC firmware submission version
  drm-uapi/xe: Add test to query HuC firmware version

 include/drm-uapi/xe_drm.h |  32 +++++++++
 tests/intel/xe_query.c    | 142 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)

-- 
2.34.1


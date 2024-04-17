Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F54C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1B910F675;
	Wed, 17 Apr 2024 14:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HF6KCNXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACA310F675
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713365467; x=1744901467;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/VfCv6FLLatK1Ys0A19p64oY2Sk3Q8kbZxfwwOZ7kZU=;
 b=HF6KCNXSfSPDOHzIRk1xPQb2mLPQLV5oZ9ldnonSwRJIx+v71fbXtTiL
 ZowOsLRQSb2KBqaBZ5b9x8dIgKWmc7rax3qUo00T4C5f29fXDrZxxa7EV
 zSfQevuCUU1OoiVo09WQtFeGZ7ZfcLaOePuZdkTHY//R4dhoPfsTdCjvy
 WktqFDjo9F6QCUghxBzndAXNT9ret9drbYzIsUEIOa48WjdHjWKYXuhyh
 x9W3IR/YQOW+TNUWop0+c3SNPQ0nK8WJlfT7Yh66A1TFPFUFn+SnayCcU
 po9Wp7FIvotwtW5AHxrhn1J2p2O4iCQJY7Yqq8s4Qzhw4VQp6gY+W6h22 A==;
X-CSE-ConnectionGUID: q9ERboyqSRmbGf3+CJrNOw==
X-CSE-MsgGUID: d/n74EcJRpyuh+9sK0VP5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8726346"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8726346"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:51:06 -0700
X-CSE-ConnectionGUID: 3KcQ4qk6Sj2DNoXXc2blSg==
X-CSE-MsgGUID: yhP85r9ITxuffm1h/4puEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22729696"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO cc1cf3aaf32c.intel.com)
 ([10.252.44.146])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:51:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v1 0/4] L3 bank mask
Date: Wed, 17 Apr 2024 14:50:45 +0000
Message-Id: <20240417145049.7-1-francois.dugast@intel.com>
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

Align the XeKMD header with the current version and add the L3 bank mask
topology query proposed in this KMD series:
https://patchwork.freedesktop.org/series/132075/

This series first includes some patches to align the XeKMD header which
have already been reviewed but not yet applied, from this other series:
https://patchwork.freedesktop.org/series/131816

Francois Dugast (4):
  drm-uapi/xe: Align header with drm-xe-next
  drm-uapi/xe: Define topology types as indexes rather than masks
  drm-uapi/xe: Expose the L3 bank mask
  lib/xe/xe_query: Add L3 bank mask test

 include/drm-uapi/xe_drm.h | 27 +++-------------
 tests/intel/xe_query.c    | 66 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 22 deletions(-)

-- 
2.34.1


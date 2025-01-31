Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ACAC0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 20:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CF210E19C;
	Fri, 31 Jan 2025 20:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZG/1ETro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23CF10E19C
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 20:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738355383; x=1769891383;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EpUphCBTEcS0Otwixd15nkOXQiM26wyLkDnf+9bUQW4=;
 b=ZG/1ETrovaSAeJ8mOeDC1Vio3NC3Qx7paafiSDOyp1BnL45cxnvgFtmh
 I1J4TnjRfCEV6XKDWHHLwgcjHF5p8hPDATNd5nL7pe3MaohdR8KRBXVYk
 aQAuOembibFH35U1z7wQoEYNlNdMXmWaLf+Z0GL+KuGIjZh8D/M7PGJE8
 Wd13hyE4XOxetF5Ng0llOH329U+BNICN35NE7VyXB5BmBmcRmb+q4Eu+n
 h2T+DlZlbX54eTJHyn1wMtZoH1bZ+dWrlM2Yd7cru9XTDQb/oRSetaz+Q
 IRAHSeX3/9Tf3q2FHnz6zQQ3svZSwKWPJxcBZkMvin9kyDu4+tFYkPBtP Q==;
X-CSE-ConnectionGUID: Lct2eQIkSrqvAsLS9Vra3A==
X-CSE-MsgGUID: REcViPEATumuah6X7j9ODg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="56361409"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="56361409"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 12:29:43 -0800
X-CSE-ConnectionGUID: 9BUhkU/6T421lD0yp2awVw==
X-CSE-MsgGUID: DtlgpvZHRS+bgNt8tga3pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="109659434"
Received: from dut2949atsm.iind.intel.com ([10.49.63.13])
 by orviesa006.jf.intel.com with ESMTP; 31 Jan 2025 12:29:42 -0800
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH 0/2] Extend intel_error_decode tool to work with xe
Date: Fri, 31 Jan 2025 20:29:38 +0000
Message-Id: <20250131202940.1124460-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

This Series has changes of lib support of error dumps decode for xe,
intel_error_decode_xe has wrappers which reads the xe dumps and prints
details of the error dumps, just like we had for i915.

These libs had being  extended in existing intel_error_decode tool, to
make them work for decoding of xe dumps.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (2):
  lib/xe/intel_error_decode_xe: error decode support for xe driver
  tools/intel_error_decode: Enable support for xe driver in the tool

 lib/meson.build                    |   1 +
 lib/xe/intel_error_decode_xe.c     | 287 +++++++++++++++++++++++++++++
 lib/xe/intel_error_decode_xe_lib.h |  26 +++
 tools/intel_error_decode.c         | 156 +++++++++++-----
 4 files changed, 421 insertions(+), 49 deletions(-)
 create mode 100644 lib/xe/intel_error_decode_xe.c
 create mode 100644 lib/xe/intel_error_decode_xe_lib.h

-- 
2.34.1


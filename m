Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFA9FD4F06
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 16:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0069710E1E5;
	Tue, 10 Mar 2026 16:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIkEqu0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801C510E1E5
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773161477; x=1804697477;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/BjMNWquHZTQXu1GBLgkS9UUQcg6Tbifaussd16alNg=;
 b=LIkEqu0KQGid/GFIzZLdme+4xnuMa5rZXvg3Db8JBPwcHxFiWyhZqaTa
 bauHMn0MxLPla7v9zZyDFc/wu1A1iawQAFyHSNl4hGmuSlJr4RrBBrv8q
 B0P+6OUCfWnsGJ3wDQ2KKBY1FUitwXERDVoYvp3ce9SAyXL5wS4lkEt8Q
 i0LfhdEXIlP6x1lO/ovvirye6REXJaGefCrC7hrkEZkjiuFfrtpwPoujI
 IY6K2ZCSojpMitGY9SEqCPDEVT6jGjBwKhXmsXy7YkexCCtjPwlDlUotj
 oLffcMt5upyXxcdkfna2BD5VQ6nCWy7BGm9g7s4n6jgu13Of3Oby2vBxl A==;
X-CSE-ConnectionGUID: 5qI8domaSZ6U9QEETP1WOA==
X-CSE-MsgGUID: Zp42PHq9Qduycf3dtQECdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74405633"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74405633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 09:51:16 -0700
X-CSE-ConnectionGUID: od7HJT8lSpWoFdHZ45KpHQ==
X-CSE-MsgGUID: 1J43Qj88QL2g2pnmCKwS8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224635732"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa004.jf.intel.com with ESMTP; 10 Mar 2026 09:51:14 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, aditya.chauhan@intel.com,
 shekhar.chauhan@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] lib: Add NVL-P (Novalake-P) support
Date: Tue, 10 Mar 2026 22:21:11 +0530
Message-ID: <20260310165113.8994-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

This series adds NVL-P (Novalake-P) platform support to IGT.

Patch 1 syncs pciids.h with upstream kernel up to
commit be07d8f707e4 ("drm/xe/nvlp: Add NVL-P platform definition"),
following the established pattern of keeping pciids.h as a direct
copy of include/drm/intel/pciids.h from the kernel.

Patch 2 adds the device descriptor and platform detection macros
for NVL-P.

This series supersedes the earlier single patch:
https://patchwork.freedesktop.org/series/162939/

Himanshu Girotra (2):
  lib/pciids: sync with kernel commit be07d8f707e4
  lib: Add NVL-P support

 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 14 ++++++++++++++
 lib/pciids.h            | 19 +++++++++++++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)

-- 
2.50.1


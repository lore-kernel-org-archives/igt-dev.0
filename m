Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B348FC0218F
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 02:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5FB10E08D;
	Mon,  3 Feb 2025 02:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7ttW5Li";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2520A10E08D
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 02:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738550949; x=1770086949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k0MRKbg9IExYDDAShxbiGzCIfy3cHerjyP3vqIZexno=;
 b=Z7ttW5LiqdhkiUNX+4QlWOcPoUB/eK1rjVi9KOD7EwgOFzo6zFCTqW3A
 WTcr3Wc7Ihin9JyArIUjcWnSy8lHCj9deTPTMK6AGX6/0+dh9SNXBgqnJ
 N5GqV9CyOvUIGiU+k+2TaNfLlCHegXZ/C99rf/mwFNMlU2G4ovLw7sTXC
 U/i0LKQqWCeaYBspVQXlDJw9hCqr21bd8FhHokJxDSmgzDSPeomS7cHW/
 bSXPFp9fFolOTbkXsEER+s9WnFJpoA66+scmSVnpD3wcL727Aj2JPFkrQ
 n3gqc86K3q9bSPAGM5w6e9viZISRarRNc9CZbMoAeT8Avr+P1H/oCcYKj A==;
X-CSE-ConnectionGUID: w9aZ2M99Qq+wc+ObbX3AHg==
X-CSE-MsgGUID: YbEkXFdSRJaO7y1pFPcJrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39064375"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="39064375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 18:49:09 -0800
X-CSE-ConnectionGUID: FDA96MNSTYaq4G1/cf/MBg==
X-CSE-MsgGUID: CeBtBKYmQpyhAIkI3zb9JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114185205"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 18:49:05 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 0/1] RFC tests/intel/kms_frontbuffer_tracking:
 Introduce plane-fbc-dr test
Date: Mon,  3 Feb 2025 08:16:51 +0530
Message-Id: <20250203024652.441405-1-santhosh.reddy.guddati@intel.com>
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

Use the FP_DAMAGE_CLIPS property of the plane for non psr modes
and fill the damaged rectangles on the plane with framebuffer
coordinates and verify that fbc dirty ctl is enabled

Santhosh Reddy Guddati (1):
  tests/intel/kms_dirty_fbc: Add kms_dirty_fbc test for DIRTYFB ioctl
    with fbc

 tests/intel/kms_fbc_dirty_rect.c | 324 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 325 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.34.1


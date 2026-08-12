Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19CAC5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 07:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C3D10EDCF;
	Wed, 12 Aug 2026 07:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0enuUtY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1C110EDCF
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786521544; x=1818057544;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3QqqpTp8tBdiJT1vpUXWr9SQrw6pb+zfWDN/CR9NcUY=;
 b=g0enuUtYfSSdxZr91jk4E7M+PpeeYivlv8A9ougFiF/knbplgtP/M7u3
 dm0xYN0GIlAXNqcX/1llkafQaSIa/2CG1TbdlrdjfwahSrFaQEke96Ntf
 zrgFYUOAbkzcKae1m80yDTfyEJlsZZwxMffOxKrFiTjXWR9QMTJwuAc07
 3gLJn1iLt8BzjODxv/RVc0EBEIkGimFR5bRebC0kNtUFp1Qc2xZZoZmhn
 9H5/5LF6MnWMDl7aoExCvCm3vev25RPd9MQzfBKmyFFR8qs+BDc+14oDJ
 To8Y1vpZD7Zfwkz5AaM6I0QJI+qmuqxlcgLzsSW004e5Nzxr4zO8wBjF5 w==;
X-CSE-ConnectionGUID: kcC42Z3lS6qBq2j4ml1/HA==
X-CSE-MsgGUID: /rQFx5VyQ3aVgO2GXbrsSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97730390"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="97730390"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 00:59:03 -0700
X-CSE-ConnectionGUID: NPtfFM7lSje1dkQGI4zFEA==
X-CSE-MsgGUID: DR1joPonSkeZRHRTVRGFgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="267067113"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:59:02 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 0/2] Add CMRR subtests
Date: Wed, 12 Aug 2026 13:29:13 +0530
Message-ID: <20260812075916.1212493-1-ramanaidu.naladala@intel.com>
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

Add a subtests to validate CMRR with video mode and fixed mode.

Naladala Ramanaidu (2):
  lib/igt_vrr:Add VRR helper library for display refresh rate testing
  tests/kms_vrr: add CMRR fixed and video mode subtests

 lib/igt_vrr.c   | 154 ++++++++++++++++++++++++++++++++++++
 lib/igt_vrr.h   |  44 +++++++++++
 lib/meson.build |   1 +
 tests/kms_vrr.c | 205 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 404 insertions(+)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

-- 
2.43.0


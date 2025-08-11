Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02842C87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 12:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D9A10E468;
	Mon, 11 Aug 2025 12:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZV2JKLar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFA810E462
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754916634; x=1786452634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Kc0o2g/krWmoxYiUreunTaNbYWFz55FgbqswPavjl0=;
 b=ZV2JKLar3U8qM67vsJr+PjL7bnGhDb32LDCQkaeQD3RCYDPz3GOkfuGM
 JGle9Jgi24HJy6+7m0v3SJpxH03bJ8yp9dZR3F7mlFHGDUfHw5OFaaD1R
 k8rKt46JVMjGsEEfPHDMcACzZF0Ja67tE/EXFNgBjQuMVX3PuPyzUSmzU
 Pm4kY/ho7hSYZjglel0TiBeoSJPJExmPuznvfkolg9+QKpPIs6XWbs+u+
 YNHjMFD0l3tIzcqJjVT7jE5zFUiVNIrYzymWqJ2RYL1QkBciKBeiEn5bz
 H48GvDJ1aiGLfqFCBK+irOxiWUfs4XOkt0+yO6paioZSbtPMtX61jW46h A==;
X-CSE-ConnectionGUID: TPzVaZSfQs6HoewHZZU/rA==
X-CSE-MsgGUID: Dn9EoLEdRk+6nYBpD4Zh6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57089039"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57089039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:34 -0700
X-CSE-ConnectionGUID: rzw7OLxETp2pPeinXHzhdQ==
X-CSE-MsgGUID: qWhRJ5gxSFaLElfdSbMe4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166709164"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 0/4] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel
Date: Mon, 11 Aug 2025 15:50:22 +0300
Message-ID: <cover.1754916577.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Sync intel_vbt_defs.h from kernel commit by commit.

Jani Nikula (4):
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    bc3ca4d94369
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    70c33a2710cd
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    dac2ec8d3ba2
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    96b451d53ae9

 tools/intel_bios.h       |  8 -------
 tools/intel_vbt_decode.c | 12 +++++-----
 tools/intel_vbt_defs.h   | 51 +++++++++++++++++++++++++++++++++-------
 3 files changed, 48 insertions(+), 23 deletions(-)

-- 
2.47.2


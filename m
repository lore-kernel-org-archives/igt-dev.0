Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B01ACD4F5B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 08:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2BF10E079;
	Thu,  5 Sep 2024 08:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9qZwccq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8B10E079
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 08:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725526426; x=1757062426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+wtbC40IieAPbXDJYUWvOkipxSlsdGokCvDGy/jCo98=;
 b=L9qZwccqbZ6l6duYBH+VyXfQHO5pwtC7KuA5Mm5VJYt9WvTHqCanOM6Q
 cS2MIENLz7tlWEWjZHIW41co0o1q30CIokQMgxGTMpgL+iokQJ3nnCvcJ
 /2jtKIUxa6cfR2i7AkplpyoexftM4tysD5xr+kllNblVWelL8LjgfwnaE
 M3Rk1BNHbf2DTpHTrH1QaTTzZS356pdquXxoGSGtfP9Srz633ItJRPTnu
 iBKOZJI7HA0PMfthOS1P1uyVsDr8BJA5ASdZHMesqghU6A14gviiVb4FG
 LMbTIzyjR1/4bqQRDyF+HmqFh0piHp8oXfvM4SFlAyoRBRuHDD+PasU1V Q==;
X-CSE-ConnectionGUID: x1BL6iChTRCUV6XIPKm9Fw==
X-CSE-MsgGUID: sFbhBkEnRUaRQQ8xREJ6GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24031630"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24031630"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 01:53:46 -0700
X-CSE-ConnectionGUID: ZLia4s9hQGm3YlmEa0jm8A==
X-CSE-MsgGUID: VtggQccuSBCNc8x7lMZHyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="70474398"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:53:44 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/1] tests/intel/kms_psr: DP2.1 PR IGT Fixes
Date: Thu,  5 Sep 2024 14:23:14 +0530
Message-ID: <20240905085315.1566848-1-ramanaidu.naladala@intel.com>
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

This patch set contains fixes for DP2.1 Panel Replay issues we have
found while debugging the code. These issues are related to DP2.1
monitor always being MST. Also wrong usage of SRD_STATUS and
PSR2_STATUS registers are fixed.

Naladala Ramanaidu (1):
  lib/igt_psr: Remove SRD status change check for DP2.1 Panel Replay

 lib/igt_psr.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.43.0


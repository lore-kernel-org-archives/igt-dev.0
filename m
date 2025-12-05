Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA620D2E035
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 08:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E865510EA2D;
	Fri,  5 Dec 2025 08:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDqwKas7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378A810E232
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 07:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764920052; x=1796456052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w7sDghfmpceZBmn4JadlP/soC+WciBYErq0FMI5WCk4=;
 b=PDqwKas7KdrsK851ir5612ask7PpzWtjp48HqhJ3/Wk9C5y4Cr+3zf3x
 /Xay7JLUY2ofYdEFu1DgxD1Q4LIPQsACwscDxDMYv8va0nIMHPQy9Sz+4
 sGuw4cQrL+v4MYCsxLPJF3NBLBQzwnIsHZTO1p44jrqyPcx+fypPnxc8n
 93IX/YU6fzeRtIZZF59m4hz7AdG1IjoCj+UxRVzmORQCI1OenMe/l5WXO
 c/8voKqiomApLZgGjvKcWK2YJLCcirx5GXYU4hk+oFmsxyXL1KhDeAYha
 w7SGtUbDvn2ZX+CMwiVHchZ5+PvKgflJOIkFKk2sD3+SXxCT22CWMmnQU w==;
X-CSE-ConnectionGUID: Nl3SEyA4S2GkVHUFMDWTTQ==
X-CSE-MsgGUID: i7AatcnOTBGp6QdjOOJtHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="67115885"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="67115885"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 23:34:11 -0800
X-CSE-ConnectionGUID: /GF2Q6VrRiKSB+DqzHY71w==
X-CSE-MsgGUID: f+CjVSofREGP08iRer90Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199664787"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 23:34:09 -0800
From: Moahmmed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com,
 Moahmmed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t 0/2] RFC: Fix chamelium port allocation during
 igt_fixture
Date: Fri,  5 Dec 2025 13:02:47 +0530
Message-ID: <20251205073249.653927-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 Dec 2025 08:03:06 +0000
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

selecting appropriate connector and solving the igt_fixture issue.

Mohammed Bilal (2):
  RFC: chamelium/kms_chamelium_hpd: add helper function to select
    connector port
  RFC: chamelium/kms_chamelium_hpd: use helper function for connector
    lookup in DP/HDMI/VGA tests

 tests/chamelium/kms_chamelium_hpd.c | 426 ++++++++++++++++++++--------
 1 file changed, 303 insertions(+), 123 deletions(-)

-- 
2.48.1


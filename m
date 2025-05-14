Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E26C3ABDD
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 09:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CE510E2F8;
	Wed, 14 May 2025 09:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAlNYgUf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8E710E2F8
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747213890; x=1778749890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zz69knkcklnp+IpY+BQ1Q1hKqZxUc9hh0FteiPByuOU=;
 b=QAlNYgUfhhBUvCUTwIsgOY5GKszttnH+0vD+lUgrWaDgDnqWTZ4/4P3I
 fbmWB934Dx20eCdAmy/lHpWWdJSn4tQ+xlmEZ6YQkMBU2XD1TD83STQZ0
 Qwa6Pxu1VkYKUAkYmSatc9r24urSqXvQwOssagj2muWRKTX28uqhJjAlH
 sNsWUmWmjYFFpj9DL64NtT06muedNjAswSrNhIFaLH404injhKQUWp5jw
 psHGUi69/T3Zbw5H4Q0QWTL+o/u3i7rx890eoUTtIW1WuJQJwwWISYZOy
 MN8cIT3KHtwZ2wYasiJLrXSzB/frhYkqBA+0fX1bDfCseGGkeu1fwb5Ei g==;
X-CSE-ConnectionGUID: Mt9SL5w0Rj+dzO4IrLK20w==
X-CSE-MsgGUID: F1Vg4Ju7R+OcUO/K29XvVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49032566"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="49032566"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:11:29 -0700
X-CSE-ConnectionGUID: 9WflNclWQQuBErNJ0qaAdw==
X-CSE-MsgGUID: Z6Uku+eJSpOilSY+/TH+lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="175114063"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:11:27 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/2] Introduce intel_hdcp tool
Date: Wed, 14 May 2025 14:32:28 +0530
Message-Id: <20250514090230.3281649-1-santhosh.reddy.guddati@intel.com>
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

Santhosh Reddy Guddati (2):
  tools/intel_hdcp: Introduce intel_hdcp tool
  tools/intel_hdcp: Support for enabling and disabling HDCP

 tools/intel_hdcp.c | 235 +++++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build  |   1 +
 2 files changed, 236 insertions(+)
 create mode 100644 tools/intel_hdcp.c

-- 
2.34.1


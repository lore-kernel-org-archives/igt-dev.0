Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15281C5AE59
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 12:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7DF10E367;
	Mon, 26 May 2025 12:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQA8m/kW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6ED10E31A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748263135; x=1779799135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XIfTqX2qbW7+2X6uVuH7pKSwba4DTAMhSfnji1fePkI=;
 b=JQA8m/kWh/7hr3b87grgYCRYv/i6/NqPJxj5LeYTRNliEy+Veo/kzfnE
 Wozf5Rl6hTSSfjtSu+1mYYXE0JcQcbK4qNcO9G9dJEDFULGAQdEldIg2T
 OoDGwFRpAjAoy9szSd8kuSfONRX0PScfcecNm+c1KESJTlGC7xruszmvw
 uszY/zHJ9FVWsCKIqG/9TiIagbTxU2eaFceDDpWji1OCnDWuL1cE8YuZV
 nGofeQPUNF4OtbabVXE8e4Oy8SdGKqM+KLytMR2SiU/RkpQ+JDcD9aY6W
 WOrdNFjqEzHwoM/lt34XjwEE69BI5JqBQZPiHG073FMGkhwtkkTnuT8mQ Q==;
X-CSE-ConnectionGUID: NhqGyeqoRuaHlOhxz83EFQ==
X-CSE-MsgGUID: OnMpDKfoS3+v8kTCIJijbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67786953"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="67786953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:38:52 -0700
X-CSE-ConnectionGUID: w69u2BQHQlGYKyWc0a9VDg==
X-CSE-MsgGUID: u+kL9XteQ5yLVvNc3m7UKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142307030"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:38:50 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/1] whitelist for HDCP panels
Date: Mon, 26 May 2025 18:08:20 +0530
Message-Id: <20250526123822.16068-1-santhosh.reddy.guddati@intel.com>
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

Add whitelist functionality for monitor EDID checks.
Introduce a whitelist mechanism to handle specific monitors
that are known to face issues with certain features, such as HDCP.

This change is intended to skip test on those panels which are
blacklisted.

Santhosh Reddy Guddati (1):
  lib/igt_panel: Skip hdcp tests on unsupported panels

 lib/igt_edid.c  | 27 ++++++++++++++++++++++
 lib/igt_edid.h  |  1 +
 lib/igt_panel.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_panel.h | 15 ++++++++++++
 lib/meson.build |  1 +
 5 files changed, 105 insertions(+)
 create mode 100644 lib/igt_panel.c
 create mode 100644 lib/igt_panel.h

-- 
2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60661075264
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 06:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7058910E8A7;
	Thu, 19 Mar 2026 06:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ev67OIpX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEC310E8A7
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 06:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773902609; x=1805438609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6YrIPC9mJEEhtCqi8qhy+2Zj9dkL2GWmfQt1g/8afZo=;
 b=ev67OIpXfEgAKAe+Eu8IDSGrzj8LSklXzK05WUBVNgvHaeixv5SOXeXR
 VOCffXkT5hHziuM17wfILG4IncWjGFS6MSsNm/unSK/C9h/JVEwaw/I9/
 nJ3NUBkSyMeT4UL8uuA1mgBV+qfesRCMv7yTu9ilp6O+CaPulpswrZAU9
 Y/5xnmOJyUbKwrLxHkLuWEV/JM8OpwLWch3LlnPllUtgLEdTcuSte2Ste
 mWGV9z1Ga1o10l7/Lz7yk3S5iF1SdgpRlTGnwFV7YOw8Vao3FH7MQlSrh
 vhdjyGbbkxKAF4PIQdLwqQWx4GuQWOho05nrwuGTBI/fcXakFxCzpSq1b w==;
X-CSE-ConnectionGUID: rAtGk7uHS7m211UA+JGD4g==
X-CSE-MsgGUID: RPGezHTIQouhgIimYU9/Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74854255"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="74854255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:43:29 -0700
X-CSE-ConnectionGUID: rwFyej2vRQWp/dJBoZNb6A==
X-CSE-MsgGUID: l2SdiXKCQKC/48tmDAHOwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="222851068"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:43:27 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, karthik.b.s@intel.com,
 mohammed.thasleem@intel.com, sowmiya.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 0/2] Get HDCP capable outputs before modeset
Date: Thu, 19 Mar 2026 12:11:13 +0530
Message-Id: <20260319064115.72836-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Filter out the HDCP capable outputs from the connected outputs before
doing a modeset. This will make the test to execute on HDCP
supported panels and avoid commit failures and invalid skips on
HDCP supported panels.

A connector needs a valid CRTC to reliably read its debugfs consistently.
To avoid unwanted modesets before checking HDCP capability checks, collect
all HDCP‑capable outputs separately.

Santhosh Reddy Guddati (2):
  tests/kms_content_protection: Get HDCP capable outputs before modeset
  tests/kms_content_protection: Handle EDID lookup failures

 tests/kms_content_protection.c | 65 ++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 15 deletions(-)

-- 
2.34.1


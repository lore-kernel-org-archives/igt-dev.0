Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9104ACD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 06:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383D610F3FE;
	Fri, 15 May 2026 06:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dV2J/E5J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C0610F3FE
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 06:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778827281; x=1810363281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V3/vmo8cTsmNCSinMsOuhZk9tHhLj8y1Gda6Q4kdZBM=;
 b=dV2J/E5JRFZmcZAAyLQ5ZC18EBm9kOKu9YvQrfqAB3064iu2hbQ4ZlEI
 tCNbBpKiO60B8IRLaw2sdL7ICQTtQ0fNb61vVxkl1mdT8sr3a+Grv3/p9
 CFqsTpUbadXEfKbOnEp+tqsYfHG/2MsiFtLvtnW2ZjCLqtVPFTb6KS4HT
 oiNZxoxGLybufyGaCRzDpcnxh9Vq/EHlzHdNnoRdp+m3Jw7lBmaFhhPr3
 T5gnw1PcrYSsiC3pkbfQ/ZJKobPmp4nBZryE3Etx3AbpCQDyAHMYAU4md
 XqrqBtFtqpEqEIIlgr6HsihYaamvTi/ZJOpfSvk//EzeF4eA11nvu52N9 g==;
X-CSE-ConnectionGUID: TkClerZzQzKtGjI9N50JoA==
X-CSE-MsgGUID: iVKNDXiARfGoj+ab1im24g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91162584"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="91162584"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:41:21 -0700
X-CSE-ConnectionGUID: vBN1XdRhRg+9LvTIZPJaZQ==
X-CSE-MsgGUID: vdBgWh7XTp+mAEPJ7Wz9DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="262134778"
Received: from shawnle1-i9-build-machine.itwn.intel.com ([10.225.64.200])
 by fmviesa002.fm.intel.com with ESMTP; 14 May 2026 23:41:20 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Subject: [i-g-t,v6, 0/2] *** SUBJECT HERE ***
Date: Fri, 15 May 2026 06:32:49 +0000
Message-Id: <20260515063251.2239524-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <shawn.c.lee@intel.com>
References: <shawn.c.lee@intel.com>
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

*** BLURB HERE ***

Lee Shawn C (2):
  Revert "tests/kms_vrr: Start virtual RR test above midpoint to avoid
    mode fallback"
  tests/kms_vrr: add support for full range refresh rate testing

 tests/kms_vrr.c | 135 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 95 insertions(+), 40 deletions(-)

-- 
2.34.1


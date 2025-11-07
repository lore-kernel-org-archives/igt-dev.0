Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE0ECCF9F8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 11:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B5110EA9B;
	Fri,  7 Nov 2025 11:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBWiBtb/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF6110EA9B
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762516257; x=1794052257;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YgDqK7Q9H2wNcyCZZNM8S6C/8PfnHWN+ogw1WXbVzZE=;
 b=GBWiBtb/CnQ+7UnhESymaLQOSdeXKKc+5cgHCDBgtlgEAmxd9XMqAmnX
 1yHd++6TF7sAm8httLhiJszAZVDq549CufLxPmmGlaGx6K8aG42gW56K2
 WNvFZI9QYvGGL4LNKDbChV9/hEhRsIOH4AMaujzN7PaafJxcUGunIOaCm
 X4oJQKqdEIQ9gIi3kTqo2ohvgUxGusOLajh55tWKZ3NwasN6VNT3c1AKD
 /BjWbhiegZH7QPUCNRGiiH93InUVWgpSPTE0WBk2aJK0tlf6Ye/OUkf37
 ewxVqE0adIivEbhTg/UmtY/TpoAW45b6BX+7JM7PYaUHhHiAw2HefTy/8 g==;
X-CSE-ConnectionGUID: EP5t83l+SZyxg/6jUU/h6w==
X-CSE-MsgGUID: TIMZAKw+QuKbVAG/JMV/Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63872446"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="63872446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:50:57 -0800
X-CSE-ConnectionGUID: y+DXz3O9S92CYDkfZJC8fg==
X-CSE-MsgGUID: CpVgK50OTOuRQPewNhn2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="188181848"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:50:54 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, balasubramani.vivekanandan@intel.com,
 kamil.konieczny@linux.intel.com, shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v3 0/3] Introduce NVL-S and CRI platforms
Date: Fri,  7 Nov 2025 17:20:37 +0530
Message-ID: <20251107115040.1756713-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.51.1
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

This series adds the basic platform enabling patches for NVL-S and CRI.

v2: Fix indentation/spacing for PantherLake and Novalake in
lib/intel_chipset.h

v3: Add oam and is_crescentisland flag for CRI.

Balasubramani Vivekanandan (2):
  lib: Add Crescent Island Support
  lib/intel_pat: Define pat indices for xe3p_xpc

Shekhar Chauhan (1):
  lib: Add NVL-S support

 lib/intel_chipset.h     |  6 +++++-
 lib/intel_device_info.c | 24 ++++++++++++++++++++++++
 lib/intel_pat.c         |  8 ++++++--
 3 files changed, 35 insertions(+), 3 deletions(-)

-- 
2.51.1


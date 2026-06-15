Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D4DCD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 11:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD7510E38F;
	Mon, 15 Jun 2026 11:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsjMu0qJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B6D10E38F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781522960; x=1813058960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e/WXd6HsvH38HZyYx0Y25Ijd6dLRdIeAHf2qsmAkKa0=;
 b=bsjMu0qJJQDwi9SSa/Gk8mupJdJqX4VG2gPiILHrM0Z+t24FWOUZGE27
 dK1Lq2BTXvgvou99VKyuEJApn4KVgKMTQRiDIXI3Vp7dS4IZe60x+dBym
 LZpLHVChTjluwkVLylgkdG2NG8XXpaWwRo1+e+H4Tvd47t5jTRdEj8fDN
 csTgpKrtpTEwcUuIpMl1swES1y1L0vN3dPleMxfQ1O13ozqvJC2ywr6Fn
 h4zlKVWj3ksp8acHIIuxBQqZrY2lrbk5B3nv6Y6egipNQ+bi2oYUp7kkJ
 zg7QxoSBfGqt448pAWYJJZN1V9Q55TihKDBDgCjM1nLnbI929ZxLN2LJ/ A==;
X-CSE-ConnectionGUID: 99kofay4RAG7zTOZuRM6jA==
X-CSE-MsgGUID: O+MqvpaxSV2exvWYUcv0FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92578630"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="92578630"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:29:20 -0700
X-CSE-ConnectionGUID: 1rAeMSyGRE6EZ/ztVezU/g==
X-CSE-MsgGUID: G7wDIL4MT5a5+jFvrmKa3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247532909"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:29:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t v2 0/4] intel_vbt_decode: fall back to guessing PCI ID
 from VBT signature
Date: Mon, 15 Jun 2026 14:29:10 +0300
Message-ID: <cover.1781522896.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

v2 of [1]

[1] https://lore.kernel.org/r/cover.1781261899.git.jani.nikula@intel.com


Jani Nikula (3):
  tools/intel_vbt_decode: store codename from VBT signature to context
  lib/intel_device_info: add a helper to guess the PCI ID for a codename
  tools/intel_vbt_decode: fall back to guessing PCI ID from VBT
    signature

Michał Grzelak (1):
  tools/vbt_decode: return 0 from get_device_id()

 lib/intel_chipset.h      |  1 +
 lib/intel_device_info.c  | 75 ++++++++++++++++++++++++++++++++++++++++
 tools/intel_vbt_decode.c | 35 +++++++++++++------
 3 files changed, 100 insertions(+), 11 deletions(-)

-- 
2.47.3


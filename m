Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842ADC2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 09:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D23989D60;
	Mon, 24 Jun 2024 09:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vqm+RKVn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279DF10E3CF
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719220981; x=1750756981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eTSiLJN1+4XgE0YOM+0dmQl9mZq+gpQLe2exgcaxR8I=;
 b=Vqm+RKVnGDA+euSlAlRVSWbkTxU8norOGsO4H4vmoXzRjccMRCUk/wdC
 UknJVFDaE2SAPfGPv5rk0+7UWTUu5D3zKynUPa0JXr6nw+0EVr38eZGK8
 t2otBEN+1/mxRg4GZ1EjVdS9L0xzcjGDX8RehnkeS72zyRcyXTzxrj4rD
 3vHobBcCDENgtxpPm8ZCjWYmWUqUOoue6LtTfm8Ps1WpBTLpfv4ZchFXm
 0Sr9okOz61NhqDbbh4oPd066l9ro8oq/ejEN9ApNrR5dAK6HQAF6+6vbT
 Be778cqoHPhzSdkbpZDBch9wGkFL7dvX8gqLrlfy1ibVWooCbjQ8d6hKp g==;
X-CSE-ConnectionGUID: jslaSUG9SRGhd83+ke0VpQ==
X-CSE-MsgGUID: WzptYHI0T1C9dO+XP0H1nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="19954223"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="19954223"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:23:01 -0700
X-CSE-ConnectionGUID: OgA5veEQTFyTTTn3u42TlA==
X-CSE-MsgGUID: poZ+8n+UQNCvPuBRJRg0ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43922786"
Received: from melanie-nuc10i7fnh.iind.intel.com ([10.223.167.49])
 by orviesa007.jf.intel.com with ESMTP; 24 Jun 2024 02:22:59 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 ville.syrjala@intel.com, Melanie Lobo <melanie.lobo@intel.com>
Subject: [PATCH 0/2] Support for RGB16161616_64B compressed formats
Date: Mon, 24 Jun 2024 20:18:16 +0530
Message-Id: <20240624144818.216349-1-melanie.lobo@intel.com>
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

Support XRGB16161616_64B and ARGB16161616_64B compressed formats

Melanie Lobo (2):
  lib/intel_aux_pgtable: Library to add support for RGB16161616_64B
    format
  tests/intel/kms_flip_scaled_crc: Add support for RGB16161616_64B
    compressed formats

 lib/intel_aux_pgtable.c           |  5 ++++
 tests/intel/kms_flip_scaled_crc.c | 39 +++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.34.1


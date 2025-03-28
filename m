Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CE9C36011
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 14:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF0A10EA29;
	Fri, 28 Mar 2025 14:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+5qzkZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4847310EA29
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743171215; x=1774707215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f77mt37oirrCryZjlQuaJm4v71mQvHmyuNPO4iULK08=;
 b=i+5qzkZM0gCmSFDAsNFoRuHfMMnpY14MImJ7JI5fsyAgOGHGZseQwlJt
 UQuk45ztIYD+qYoWcO3kryT8SLEmIoxPGyfCLydRQYXm21O+niW0iquS1
 QCWVhhFW+iNoY4FSBau2N1B94FnD4xfWiS4tzT4d5im+Nioen/LVhLqkz
 2WzzJbxzQKyP/GsyrTc7jAViZSDZ6gMwcJ4n9AYd8znIGXVfnmY/gh7LB
 eF14UJgS/WFkkb5ptLXfugAqH+i1ReGAuNt09soS2CJLBp5YkuhzJkaxQ
 CxLSr2DsjPBGCyz3M2lO5sYfPGDIQBhOrawBw0EvVlCl94IBIPNWaa0yO g==;
X-CSE-ConnectionGUID: 0ZtozuQNTSKv4k3BPihGNA==
X-CSE-MsgGUID: Afu3v48rSjSEJkKgHm6Zmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="67005048"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="67005048"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 07:13:31 -0700
X-CSE-ConnectionGUID: zW386MbuSuWKmrTxX1PmIg==
X-CSE-MsgGUID: FSrnsSBtQnajiSXANiNJug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="156388531"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 07:13:28 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v4 0/2] Add support for Xe in runtime-pm
Date: Fri, 28 Mar 2025 19:39:58 +0530
Message-Id: <20250328141000.1847594-1-soham.purkait@intel.com>
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

   Add support for runtime power management
for Xe driver.

Soham Purkait (2):
  lib/igt_device_scan: Add driver field to igt_device_card struct
  tools/intel_pm_rpm: Add support for xe in runtime pm

 lib/igt_device_scan.c |  4 ++++
 lib/igt_device_scan.h |  1 +
 tools/intel_pm_rpm.c  | 31 +++++++++++++++++++------------
 3 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.34.1


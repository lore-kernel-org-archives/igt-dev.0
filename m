Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8B4C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 19:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49FC10E88D;
	Wed, 29 Jan 2025 19:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJNcRE06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05AB10E88D
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 19:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180580; x=1769716580;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aQLeRyzr5haw4nF2b4der3ZqD8JjsHi0PI/FY7AloxM=;
 b=IJNcRE06JbBzyAyTXYQqzALWA9l59eP2I9B8SBG7l7PMJxph4V1xfDE3
 OT8nd6uZLZSdt3lHr8BE3FKiHkkH/PE/8krFfZ7Ack/RHkRoMmOWZcm99
 SdTjZLpSBIOkdPhxME/NT+izPcWR368vzcaC32zHxdRgMXxLYvENH1KVN
 POSidpJpzI/mR9z0/Qscp5+zaTSCIOqA1D1d3VkPPqAvD4ITHD+xctswZ
 JYzG1XIO4IuVoDKz6sNVwMLFsMhWXOh8i//K/geFsriObNKrQINDIlnDo
 2vsb4Lg7bq4Wa3M5YtQK672lHgNs37v3E40MG4rgRioDDYZz46L6pNl8J g==;
X-CSE-ConnectionGUID: 9SqsU8xOQZOh02uTAGOsag==
X-CSE-MsgGUID: WYJLjaEgSlypWq4gqPxBBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49304377"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="49304377"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:56:20 -0800
X-CSE-ConnectionGUID: 2q1wLeYHTQCoBw5MZ/XqCQ==
X-CSE-MsgGUID: I0Jki17sRmeIYoDutoLnpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114265273"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 11:56:18 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/1] RFC tests/kms_vrr:Add adaptive-dc subtest
Date: Thu, 30 Jan 2025 01:41:48 +0530
Message-Id: <20250129201149.3666688-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.25.1
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

Adaptive dc balance test automate. 

Naladala Ramanaidu (1):
  tests/kms_vrr: Add adaptive-dc subtest for VRR

 tests/kms_vrr.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

-- 
2.25.1


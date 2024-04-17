Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A618C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 10:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E425310F595;
	Wed, 17 Apr 2024 10:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqBcir9O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB3010F595
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 10:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713350005; x=1744886005;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=2fJZ35p56rwSfWwuKLagxYD4atqoulgrmSYqHg4kY6E=;
 b=aqBcir9OJhWupZIB5vm7JRO5z/ZJIrvT2BP2qsIeRKo9znj5b8BiMCac
 5dmnCTPOO4Uw/625IasJt5I1uYwfNJIlrdt3izMPDPTEcGTVwzohkglTw
 6+MxRyxSE7pKvlWjnQsp7/Ai7ItwkAMR8F+hh1BjneqavWW3Fz1z+EdR9
 fq75iDllbFZ1kp56AhYWg5/CSyNwGmX3ZzIEaMlZjxcRJuTDzNuE6Gjqm
 H/xi77i/3SiZBX84ddF0v2ei4J0DYv345pvztOq6vHGfEuD6QELfWYbYO
 C4wKumTjdWhj2TBCSD5QDT2CF65vYq11VKU1asNWdaONANigQ8AVyVZ8W w==;
X-CSE-ConnectionGUID: pkowwdfXR0uhbgDZ6NDV+A==
X-CSE-MsgGUID: Mo8O9/QSQ8GyYG5ObzOroA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9383393"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="9383393"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 03:33:25 -0700
X-CSE-ConnectionGUID: u0angclbSB26QS5iwcmU5w==
X-CSE-MsgGUID: WiOvjWhLS4Go8x8A3c96aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="27257327"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa003.jf.intel.com with ESMTP; 17 Apr 2024 03:33:23 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 kamil.konieczny@linux.intel.com, Melanie Lobo <melanie.lobo@intel.com>
Subject: [PATCH 0/2] Adding FP16 XRGB16161616_64B tests in MTL
Date: Wed, 17 Apr 2024 16:15:42 +0530
Message-Id: <20240417104544.12963-1-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231010134540.28485-1-melanie.lobo@intel.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
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

This series adds tests for XRGB16161616_64B compressed format.

Melanie Lobo (2):
  lib/intel_aux_pgtable: Library to add support for FP16
    XRGB16161616_64B format
  tests/intel/kms_flip_scaled_crc: Add tests for FP16 XRGB16161616_64B
    compressed format

 lib/intel_aux_pgtable.c           |  5 +++++
 tests/intel/kms_flip_scaled_crc.c | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.17.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09784C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 07:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9946A10FB0F;
	Tue, 23 Apr 2024 07:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKoscc1s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B2110FB0F
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713855895; x=1745391895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yhi60QR5BbMEPzyj5BqY3NItuwfrKdYnssuxQMDBoYY=;
 b=NKoscc1sA+VeUXN3E8aTp2uIhLY8CSB9iIplo1lcMdBc0sMxGmVv6ESV
 7+oNWCt5hfiDnxV/d3X3kta7whmBo1EyKzw+OYi49GO/dut2gtVrfeNAU
 Yoo9imfi4Vw+oruPGQbKnRze51si3fX/w0h5Yk6O0j034DgDJ3j1aH0yL
 8QQgqQWvd3CxB17aRToDR58h5dtOfslQzC/ZrGsRWhH/JVmpDGi2MeaSb
 KLXPLvESDAGK1lYxhu7gXel+dofXq1wSvhUswb0GP1p2fpuEqev+/X++J
 qGbaocJoWHlnFqljkn6uy3VosFxjAIDEccTQzU1mcSFLtnPF3RbIB6S8N w==;
X-CSE-ConnectionGUID: asKJmsYPTj2LUWoYq7Bttg==
X-CSE-MsgGUID: iiQkF1GFRlqjaDvGuY7pgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13258640"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13258640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:04:55 -0700
X-CSE-ConnectionGUID: sj64Way2TA62gpNTpwH/SA==
X-CSE-MsgGUID: fro1K0UTSZGWyZtJkpFDgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24882235"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:04:54 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/2] Use xe2 render-copy on newer hardware
Date: Tue, 23 Apr 2024 09:04:47 +0200
Message-Id: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

This patch series fixes horizontal stride in shader and makes
intel_batchbuffer ready to use xe2 render-copy on newer hardware.

Zbigniew Kempczyński (2):
  lib/rendercopy: Fix horizontal stride
  lib/intel_batchbuffer: Be ready to use xe2 render-copy on newer
    hardware

 lib/i915/shaders/ps/gen20_render_copy.asm | 8 ++++----
 lib/intel_batchbuffer.c                   | 2 +-
 lib/rendercopy_gen9.c                     | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.34.1


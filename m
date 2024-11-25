Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487FED58D4B
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 13:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D448310E3C5;
	Mon, 25 Nov 2024 13:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgchBTyG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB4410E3C5
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 13:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732543024; x=1764079024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Gkm3Aa75E6qXEQswzzRHtC/2aFUSIFgLERrGzZR8O4=;
 b=CgchBTyGKhX6wsxvtAjzprVM85Jh91FWe5kzarh/7tkNNZbgGG/BvW7c
 s8ou9Rl1IB423630q2aq1VGX8u3+/U6bKUDsaum0xUzyHLCD/5Dx6mXfm
 hjBK9tdFRKc5Vb9cpbG+TMzogyQgXJ9MBhwOUpYJDrP7+8TzOTkUaE5gB
 8ewVFi4vB2qYDSWaFE453zpFXMUbzlsUfqR8SBee0uJUn26ToI1JSX4pI
 jjUPOd0BMBVhwWhOWehFUITysQaUy45xL1b/9BfVyqH2ZyQFwFlFXPlP5
 o6PQ+PrACEfZQr2/L7uC7pkEG1y2RGVnp+L4hupOwQGo/5M3UwkO6Qi9J Q==;
X-CSE-ConnectionGUID: k2KafSpfTrWA7wibLCHYJw==
X-CSE-MsgGUID: I5300WPzRdGsK86L/3W0QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="44043504"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="44043504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 05:57:04 -0800
X-CSE-ConnectionGUID: 0nGC5M9KQrW90GJhuPXSAw==
X-CSE-MsgGUID: C2iCV+NgR7uOyBHiaFkx3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="96335581"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.228])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 05:57:02 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_exec_store: Introduce long-shader
 tests
Date: Mon, 25 Nov 2024 14:56:44 +0100
Message-Id: <20241125135645.6776-1-dominik.karol.piatkowski@intel.com>
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

Introduce 4 tests:
- long-shader-bb-sram-target-sram
- long-shader-bb-sram-target-vram
- long-shader-bb-vram-target-sram
- long-shader-bb-vram-target-vram

These tests are core version of xe_eudebug_online@writes-caching* tests.

Each test writes incrementing values to 2-page-long target surface using
long shader. The bb is searched for full shader, expecting it to exist.
The target surface is checked against written values. Each test places
bb and surface in different configuration of memory regions in order to
validate memory coherency.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/intel/xe_exec_store: Introduce long-shader tests

 tests/intel/xe_exec_store.c | 130 ++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

-- 
2.34.1


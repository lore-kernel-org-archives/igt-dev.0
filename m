Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB715F30927
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 09:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB6210EBDA;
	Thu,  5 Mar 2026 09:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJW3VD1a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A758110EBDA
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 09:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703187; x=1804239187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YrRjNjFvTXBEsmT5zSR1xfraV9M9IzgwU3Q/YAiqZ7w=;
 b=ZJW3VD1aAw2Gr85DDe5zgw2yPoC135DFhpeXaHr4D5xC1bVaIzH27bBN
 663SjUnIasAkUXfIDb/LbXaFT1+uwSAN/y6IiE48Yvfly/TzDhrgxeeVl
 IvI7SVCowo3iaScHkSGDrDAhBf1BN0xsqHyiuNKE3p28+gsvdtp51sytt
 cVIrks/74TaKubjuRJ25Y3dSWSDOwnc/gPic16YChZmBSbo/EgVfDcQjW
 w0U8rZuxCX7GDd1Um5CJ0hW+mvsvJrpZ+EJT0F0zOuPNyxEXsHcrt+Wvo
 G167PvlMxrbb0lWnBIqTEC0HxmvEQTT2L+iZQs5F8TW1b62vBmcqCMFcG A==;
X-CSE-ConnectionGUID: cSOewjpqQAOqzoMIHH8dOA==
X-CSE-MsgGUID: A4oCiOGyT9CmZBPWQVCAHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73854052"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73854052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:33:06 -0800
X-CSE-ConnectionGUID: beOpbWHlQy63/hY93C6xHg==
X-CSE-MsgGUID: 5mREZI92SWGQePJOlgpNPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="222775316"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:33:05 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 0/2] tests/chamelium/audio: Fix resource leaks in audio
 tests
Date: Thu,  5 Mar 2026 15:00:23 +0530
Message-ID: <20260305093025.3107101-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

This series fixes resource leaks in Chamelium audio tests.

It resolves a handle leak in the audio test loop when the audio
configuration check fails and the loop continues without cleanup.

It also ensures proper cleanup when assertion failures occur after
resources are acquired by routing error paths through a common
cleanup sequence.

Mohammed Bilal (2):
  tests/chamelium/audio: Fix ALSA handle leak on skipped audio config
  tests/chamelium/audio: Fix resource leaks on assertion failure

 tests/chamelium/kms_chamelium_audio.c | 46 ++++++++++++++++++---------
 1 file changed, 31 insertions(+), 15 deletions(-)

-- 
2.48.1


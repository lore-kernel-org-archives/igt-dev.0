Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7CCC27C7B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 07:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7661810E2CD;
	Mon, 17 Jun 2024 07:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXihVB07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC8910E2CD
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718610725; x=1750146725;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=XmrYuP3BPXw6z37WX4HTsau/DZq2BkTaIhY0xxto2UA=;
 b=BXihVB07D1hhKcukOFVfbeB1WHaI8ZUrQE5jAhQTM1Kc73ap6ij0iHtO
 r9bjdxyN7TRspDBJ630UQm+O0bH2JySWd+fOiLQRRTjR1+Wvb+RiHV08+
 tq8qSJ5cBr2GBOxg5AFnyg197lImM7W2+6mptAkV40TCqXbyeA2sH9AsY
 hBJkWunSw3bWExNHVc308qxVQEOOMJ9Ri3p86tyxU+TF3RSXixQSf/9Gu
 L5BOpgYsir6zgB7xLriSo/ZJwItH25o9Iq8ZYVnWnNQ7gYgIves8Bt89a
 FAXzMwPlrlGFpcQcL7OiCyFxQeqm4nEGlO3Adv+k0by05NagHsA9CR+si A==;
X-CSE-ConnectionGUID: s81QnGg4SBar+RmXhIgBig==
X-CSE-MsgGUID: 61aaPKI9SjC1SmfOjDCpsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="37950936"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="37950936"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 00:52:04 -0700
X-CSE-ConnectionGUID: x1qgr5xmSRO0XZTffjg6Jw==
X-CSE-MsgGUID: PLLyhOzkSXOsWthGeGMFmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41249535"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 00:52:03 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/2] lib/intel_chipset: add Battlemage support
Date: Mon, 17 Jun 2024 09:51:43 +0200
Message-Id: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDrb2YC/x3MywqDMBBA0V+RWTdgfNTQXykl5DGaWTSGTBUh+
 O/GLs/i3gKMmZDh1RTIuBPTGivkowEXTFxQkK+Gru2G9iknYb+LdoES409TnFcxDtKPk1O9Vwp
 qljLOdPyX70+1NYzCZhNduEdbYjjPC8NcQ8t4AAAA
To: igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=XmrYuP3BPXw6z37WX4HTsau/DZq2BkTaIhY0xxto2UA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmb+shl+PPwF6MkfebUdvzyEm0cQ8/NC5b447n4qEQ
 1Il0GAWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZm/rIQAKCRAjYrKT3hD91xbgC/
 4l5KzsIshdxj/ktPIc8skfRlBgp364uAsU5bUMkm6kHzoudbwzdQvnckPrUm2XyZ6m2Gstu9v0UiNA
 OwLmSsaV/8J5xmo90tonvVSPn4+8GeLuguBmrB+kmrHvaWh9l7nI2RXKIKcGEF5lZcx1BzQN0iyF8Y
 la+5cofqeXMppmbPX0anMnqGt03NXDOyFOlJKwQ4COsCSYRUJaH+998lwSMqaT7bj095vBvxtWavER
 hNG+8tBNzjYMEm4XaSc8Tdz8YwWjYWXYNq1wT2X5Xcz8DlxkoIwzefElTTbJ73TYT409hitCh5NSEo
 8fywCpaU87au2SBPZntY7yBnlGD2nibq0BKYigGDLTaJ3JW6pN/4kuY77pOcEJkYEmcZrHGqhJzzjc
 s1kdp76leGgP542D+vyRc+4r/Qh/zo/gFAg/GciFpAqmBj/KhnbOkT5dTObZgdDevGkFwvXqbXL6/w
 O2amqj3CbVWucBwXT9RcTU6KGy4vHw2Ogs86yI/Bhp27g=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

This patchset adds support for Battlemage platform to intel_chipset code.
It allows to detect Battlemage cards using pci:vendor=intel,device=battlemage
igt filter.

To: igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (2):
      lib: sync xe_pciids.h with kernel
      lib/intel_chipset: add Battlemage support

 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 12 ++++++++++++
 lib/xe_pciids.h         |  7 +++++++
 3 files changed, 21 insertions(+)
---
base-commit: 9dca15da37f2a385b04427eb39cd460224d09c25
change-id: 20240617-bmg_chipset_info-541d57c83d88

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B59CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 10:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BD410E0BC;
	Tue, 28 Oct 2025 10:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDdcWZtv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5077010E0BC
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 10:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761648161; x=1793184161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=72lHYvWSC4bBo3fe4M5WuQ9CKskQIgLCWLAsicnEDgg=;
 b=YDdcWZtvLaqtk6Y9HWuHbQ7EllOpS2N1XTGvzeQEZMhuUuy7YNieNxlo
 I0mRcTnoHpCJGVq7RJyansbTyw968YammcQ0eZcNJiFlATTKyVyWRvfUT
 LIgJV2tw4rIUIiyWDc0dLGcIbNr3ZWDpTQXOnn6JG62Yc81EwTeD3oXUS
 RZUSjREufNmITxuvhoF+EtUVLhpgJsSh5n/AUfQMr6yDG77CJevD6e/MB
 HOaiThNE0AX3/D4PXFukf/nOh9lQCH/rcyEKRRmDOgED/K/frYX/m0bRb
 vY0lYjTMVS6J8KDCi78+p/wZUdI0PCPiCfxIeNDF4RWLVeGXYJXQer9wH Q==;
X-CSE-ConnectionGUID: lxfYkE9bQme1C/GF+880+g==
X-CSE-MsgGUID: KE1eTpqpQ3uA/u1RlaEszQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74418824"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74418824"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:42:41 -0700
X-CSE-ConnectionGUID: f0Z1R0xYSnWmhCeqK4hrPQ==
X-CSE-MsgGUID: ET7+hHaqT2i38h4aWDwEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184547216"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.157])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:42:39 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: [PATCH i-g-t v2 0/1] Sync PCI ids with kernel: split BMG to BMG-G21
 and add NVL-S
Date: Tue, 28 Oct 2025 11:42:33 +0100
Message-ID: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
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

This syncs Intel GPU PCI ids with drm-next kernel commits

edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")

with NVL-S being the last one.

v2: squashed into one commit (Lucas)

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>

Kamil Konieczny (1):
  lib/pciids: Add NVL-S and split out BMG-G21

 lib/pciids.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

-- 
2.51.1


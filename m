Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B02C27C5F
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3929710EC6E;
	Fri,  7 Jun 2024 13:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEBLmdP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C487710EC6E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768682; x=1749304682;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iiXvYaSv5EFxaVrCv+VF/qnvo7bTXHhgDbtz2hUeX30=;
 b=jEBLmdP1lyLkEZ9rBMvbXJhdkuLtOe6wVWmVJ3zZ8GIfAMfgEBER/OFE
 nKDzKp2Z4MgjiLtM/EDxv44D2Ik50kOa6fghlhDbEj4R3tiNwB/6mCm0Y
 M9LICm+HV9r64qA/j69xAFhJLeVZw7zmh0wC6WPD0g2Q1OwwV5h0kaVRM
 m9Vc5Cjh0SOWBWAYkbGCneG4NqKs7Zh20M35I4+XhPmFHSghvTbhqc2dA
 g3TLD1mlnvTi3Y60+hQ2bxie7WqbniLeIJaG3ZlE32Uapf6dX53nFQvyj
 EbTn1KZFKK21h6kO2oIES8ZhD3MjnYrFwS/SgHpVLm+4Vi5PtNqJ8K4Tm g==;
X-CSE-ConnectionGUID: YDsYLXceSJSAk+ZdUXJRDg==
X-CSE-MsgGUID: Gzr1CGr2RRC9ch+xSPLZeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116764"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116764"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:01 -0700
X-CSE-ConnectionGUID: AxS6O8ivT8OLx+VQS3pdDw==
X-CSE-MsgGUID: Fx9jNUp/RiiOvmUNjkBOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323709"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:57:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:57:58 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/27] tools/intel_vbt_decode: Decode almost everything
Date: Fri,  7 Jun 2024 16:57:31 +0300
Message-ID: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Decode most of the known blocks, and at least name all the
ones we know of but don't decode.

Also fix an issue with the MIPI config block decoding.

Note that I still have a few VBTs with completely unknown blocks:
- VLV with blocks 60,61,62,63,64
- ADL with block 212
So far no idea what those might contain.

Ville Syrjälä (27):
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    80c414772d93
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    3e8daf14c47d
  tools/intel_vbt_decode: Dump MIPI config for the correct panel
  tools/intel_vbt_decode: Decode block 3 (Display Toggle Option)
  tools/intel_vbt_decode: Decode block 4 (Mode Support List)
  tools/intel_vbt_decode: Decode block 5 (Generic Mode Table)
  tools/intel_vbt_decode: Decode blocks 6,7,8 (register tables)
  tools/intel_vbt_decode: Decode block 10 (Mode Removal Table)
  tools/intel_vbt_decode: Decode block 12 (Driver Persistent Algorithm)
  tools/intel_vbt_decode: Decode block 15 (Dot Clock Override Table) and
    block 9 (ALM only)
  tools/intel_vbt_decode: Decode blocks 16,29,31 (Toggle List)
  tools/intel_vbt_decode: Decode blocks 19,30,32 (Display Configuration
    Removal Table)
  tools/intel_vbt_decode: Decode block 18 (Driver Rotation)
  tools/intel_vbt_decode: Decode block 20 (OEM Customizable Modes)
  tools/intel_vbt_decode: Decode block 21 (EFP List)
  tools/intel_vbt_decode: Decode block 24 (SDVO LVDS PnP ID)
  tools/intel_vbt_decode: Decode block 25 (SDVO LVDS PPS)
  tools/intel_vbt_decode: Decode block 26 (TV Options)
  tools/intel_vbt_decode: Decode block 28 (EFP DTD)
  tools/intel_vbt_decode: Decode block 45 (eDP BFI)
  tools/intel_vbt_decode: Decode block 46 (Chromaticity For Narrow Gamut
    Panel)
  tools/intel_vbt_decode: Decode block 51 (Fixed Set Mode Table)
  tools/intel_vbt_decode: Decode block 55 (RGB Palette Table)
  tools/intel_vbt_decode: Decode block 57 (Vswing PreEmphasis Table)
  tools/intel_vbt_decode: Decode block 58 (Generic DTD Block)
  tools/intel_vbt_decode: Decode block 253 (PRD Table)
  tools/intel_vbt_decode: Name a few more VBT blocks

 tools/intel_vbt_decode.c | 1180 +++++++++++++++++++++++++++++++++++++-
 tools/intel_vbt_defs.h   |   39 +-
 2 files changed, 1179 insertions(+), 40 deletions(-)

-- 
2.44.2


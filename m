Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDBBC25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1399D10E221;
	Fri, 31 May 2024 14:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOYa5Gvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E2A10E0D3
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165497; x=1748701497;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PwR44APdgSdhjeyzkKUeotM66JKefaAlWIfR6prLv2U=;
 b=SOYa5GvhZN+47e4yWb6UQeBwO71vsC69SAF/pjeEi2YEpqCR5v0PUBSg
 yih386Ts9H/oYHfiuR/xZ2crzdcoQIA6NVJrIdpoB2Ff91Ols4LkwgpTm
 okNIOEWUjiJ6GjwCuvM9MMhv4XH0yM4UUb3WJmxfz3s5i9N8x1ExHnaBc
 humtUtvzjHqy1Bd4p5d75Ni7bV/nR01DuD9jgjZ5RIBgYuAoTJ+NMQhjc
 Is8i1tCLuteKCplv4yVv0AmOZLXoziU3gJ5OV8fG1xiPhj5QSKmRyw33n
 E/hGSHz33Xq4ae2kyJ4044KUDzrSOrWxRfD5oJ4ok33Lg7ejT3fY8yvuR w==;
X-CSE-ConnectionGUID: ldfbz9XdTbmyz6Ry298wUQ==
X-CSE-MsgGUID: wpFWD8QYTQW1Yb5qeVbRRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113645"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113645"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:23:57 -0700
X-CSE-ConnectionGUID: ibhd+sG9SF+aIT0ZzCaavA==
X-CSE-MsgGUID: UY29qHoqSCygGi1VnlX6kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160793"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:23:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:23:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/20] tools/intel_vbt_decode: Refactoring and prep work
 for decoding more blocks
Date: Fri, 31 May 2024 17:23:34 +0300
Message-ID: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
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

A bunch of refactoring/cleanups/etc. to intel_vbt_decode. I have
a followup also lined up that implementes decoding of nearly all
known blocks, but figured I'll get all the other stuff out of the
way first.

Ville Syrjälä (20):
  tools/intel_vbt_decode: Finish the s/lvds/lfp/ rename
  tools/intel_vbt_decode: s/dump_sdvo_panel_dtd()/dump_sdvo_lvds_dtd()/
  lib: Define DIV_ROUND_CLOSEST()
  tools/intel_vbt_decode: Fix some tabs
  tools/intel_vbt_decode: Add missing newline
  tools/intel_vbt_decode: Indent ALS dump
  tools/intel_vbt_decode: Use "(LFP<n>)" to indicate LFP panel type
  tools/intel_vbt_decode: Decode the "not HDMI" bit right way up
  tools/intel_vbt_decode: Extract dump_pnp_id()
  tools/intel_vbt_decode: Reuse print_detail_timing_data()
  tools/intel_vbt_decode: Dump the new eDP DSC disable bit
  tools/intel_vbt_decode: Allow dumpers to delcate min version for the
    block
  tools/intel_vbt_decode: Use .min_bdb_version to filter out PSR block
    on pre-165 VBTs
  tools/intel_vbt_decode: Sort dumper table
  tools/intel_vbt_decode: Use struct bdb_sdvo_lvds_dtd
  tools/intel_vbt_decode: Track the SDVO panel type
  tools/intel_vbt_decode: Use find_raw_section() to determine block
    presence
  tools/intel_vbt_decode: Make device handle names more compact
  tools/intel_vbt_decode: Declare min/max version for child dev handles
  tools/intel_vbt_decode: Decode device handle as a bitmask

 lib/igt_aux.h            |   1 +
 tools/intel_vbt_decode.c | 395 ++++++++++++++++++++++-----------------
 2 files changed, 224 insertions(+), 172 deletions(-)

-- 
2.44.1


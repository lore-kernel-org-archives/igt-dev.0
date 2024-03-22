Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239F8C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856EF112762;
	Fri, 22 Mar 2024 20:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cpx4Hk91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29AF11275E
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140089; x=1742676089;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hsWX2DM8BD/wZfUICv4MCCdUJyGJ2Xx7HJDj+qb9seM=;
 b=Cpx4Hk91l2B3LXqLRzQ7Do9EIR0SWcX5AjovQ0KV1NeGkBX6DyqCB9jZ
 YIAhnFDCzqd6BSeiqKDB5wSYdT/ZUVuym4egLPT11SNHf9b9zX9SspRbw
 OIJo6Xv2XaHPTm8JtbTr/lbFiKeAShsm0LUhwPBFbRlo7a4pNXGGPXXZg
 B6Esp7BeZE2+IwVhYBcm0es1jI7L3ULFupVJA8tKYQcR3wX5DGn6YUfzS
 7PoNns+PaZ6IMj5g8XbOSc8zE3+MGF91wypkQ8fZ9xoY3y805W3kcLwUj
 YGvBFs7xdH8J89Qpk4c90wupO3+8on7QDKhL36Pf0mRw8lyHoIZc5y637 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329353"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329353"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783609"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783609"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:25 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/13] tools/intel_vbt_decode: Various improvement
Date: Fri, 22 Mar 2024 22:41:12 +0200
Message-ID: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

A pile of improvements to the VBT decoder.

Ville Syrjälä (13):
  tools/intel_vbt_decode: update vbt defs from kernel
  tools/intel_vbt_decode: Extract default_algorithm()
  tools/intel_vbt_decode: Allow blocks to be named without full decoding
  tools/intel_vbt_decode: Print the block min size
  tools/intel_vbt_decode: Dump AIM offsets
  tools/intel_vbt_decode: Decode the backlight i2c stuff
  tools/intel_vbt_decode: Decode the obsolote DPST supported field
  tools/intel_vbt_decode: Check version before decoding
    lace_aggressiveness_profile
  tools/intel_vbt_decode: Add version checks for backlight decoding
  tools/intel_vbt_decode: Dump out the backlight entry size
  tools/intel_vbt_decode: Dump MIPI sequences in the order they appear
    in VBT
  tools/intel_vbt_decode: Decode all the driver feature bits
  tools/intel_vbt_decode: Decode the EFP index

 tools/intel_vbt_decode.c | 125 +++++++++++++++++++++++++++------------
 tools/intel_vbt_defs.h   |  36 +++++------
 2 files changed, 106 insertions(+), 55 deletions(-)

-- 
2.43.2


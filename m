Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A0ECAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDA010E48C;
	Mon, 29 Sep 2025 19:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKKFrYl9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0581910E48C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173691; x=1790709691;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gZ3nQofEXYjPOFWxaspTXlt8KmR+6XEs0CRji6i54J4=;
 b=oKKFrYl9Y2d/JsWEM/kBqOduDR2QaCS2wl4gBhr1JVoK1rCgFWCavyRx
 PPGR7i5H2nqUjhUh7jxzR3SYqu8kuTp95k0QmQuN72L3cM+lVJOQmm/BG
 kHFesV87Vi2msN4mLSuLqGXsCezOtnirY7XyPFHhLjR/aqdeOdGYI4eIB
 1MKZ7F39/CC+wcEUJFhMyLLSEtEi3ORvuKgOTl2DRYpeYyD7bRE7b8520
 yGG0xjwu/fjvpuJHgzBeXBREQep6BDkixncpc1YQhLm3DVFn/+EcpEAJF
 Z+As3/RiG8OkCtMS2JH4h5hAQO0WWJ7wfQSte/X1Srg0rUg2oSn/49Wig w==;
X-CSE-ConnectionGUID: G9rLq8QsQNyfS2RpHyAnvw==
X-CSE-MsgGUID: OtAlIrNDR9mjDsFGa8j0RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61589832"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61589832"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:31 -0700
X-CSE-ConnectionGUID: EMgzdd/MQdOeedgBbGn3HQ==
X-CSE-MsgGUID: 0+tfUmwnQ76yB4pnVXJuQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178250093"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:29 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/6] tools/intel_vbt_decode: Improve decoding to strings
Date: Mon, 29 Sep 2025 22:21:20 +0300
Message-ID: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Make it easier/safer to decode VBT values into a string representation.

Also decode a couple of new (or rather old) things.

Ville Syrjälä (6):
  tools/intel_vbt_decode: Introduce to_str()
  tools/intel_vbt_decode: Use to_str() more
  tools/intel_vbt_decode: Convert eDP deocding to use to_str()
  tools/intel_vbt_decode: Use panel_bits()
  tools/intel_vbt_decode: Decode display refclk mode
  tools/intel_vbt_decode: Decode the backlight control method type

 tools/intel_vbt_decode.c | 264 ++++++++++++++++++---------------------
 1 file changed, 123 insertions(+), 141 deletions(-)

-- 
2.49.1


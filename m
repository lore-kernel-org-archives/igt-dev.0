Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD8BD5AE6B
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 07:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7527010E1E5;
	Thu,  7 Nov 2024 07:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNSvNOes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C4710E1E5
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730964659; x=1762500659;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=XUARay7sJihP+PIt6H2QI8GwLFEuzDEOmWX2mVqbnME=;
 b=YNSvNOesWGh4hNlt/8ksIHoSTgPXi0XExqjyYXEXeiQUriguResetNEQ
 fHdcDbLKhKUB0IxA8mF4bZUWm47lz1kGoP/79xN6zYbtdECWDhmUrROgq
 kFKVqtdqZRGXIc/wRq8yhFApguMYLxXPrqMLxWbTuYuj61Wv03rstvMWa
 ekpRPmeIrUA83EFstKafmlAuzdiNzK/M/IRv1ThySrhAvCSBd/M8mWWEX
 o88ohYiG1CVRC9XHCFPNoweqQMgx9n8Fb2EHXRgZI9nXGl3ikKN+dv5Lp
 MoQzeQtOuVS1ElxVKcUnIZflCJpsHdLNL+oAFRc0D2Yd/v3Dg+SSemu7o Q==;
X-CSE-ConnectionGUID: GM7LfJbhQ7OzzKabeSkuUw==
X-CSE-MsgGUID: abSnboLgSOWyLXPjV2NybQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30561136"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30561136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:30:59 -0800
X-CSE-ConnectionGUID: 6JqPX/vTTtandikFHDuT0A==
X-CSE-MsgGUID: RqzC7LCwRpmwJP2AJGOyOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="84587177"
Received: from ogreene-mobl1.amr.corp.intel.com (HELO [10.213.195.176])
 ([10.213.195.176])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:30:58 -0800
Message-ID: <086fcdbf-88c9-4f59-b861-ebe134652d2e@linux.intel.com>
Date: Thu, 7 Nov 2024 08:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] igt-runner fact checking
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <0ef870a2-13ff-4984-bd2b-99be32626043@linux.intel.com>
Content-Language: en-US
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

I made changes to the code that broke my own unit testing. The test code is broken, and there is no side effect in the actual code. Happy to learn how unit testing is used by our CI. I will wait for comments and will fix the test for V4.

The magic command takes about 20 seconds to run locally:
 $ meson test -C build

From GitLab.Pipeline:
10/441 lib igt_facts                           FAIL     0.43 s (exit status 98)



[...]

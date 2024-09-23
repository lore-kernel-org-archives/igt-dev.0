Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6FECF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 09:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D41910E3C3;
	Mon, 23 Sep 2024 09:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRuooh9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D49D10E3C3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727083826; x=1758619826;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EIXPXEp/kEdMXoLG+wpRVo7iW8C/4CJMyHBxvnl4gps=;
 b=eRuooh9IThJ7oerGlx39W9f7rwN55oJXQVL05dWZPczB/ad91AQJxVD2
 iXSyzS5WGpd9udICljaUAiyMN1wirRzY5M8/7F326jiDYpk7BFXmW9j5L
 10jcsQyG6tjxOde/KhXQQkK875rFiFw2se2/6mHv73jyZ7FnVLygF4EhG
 w9R4LHmt56ywP2Bw7zhtCvb4deOiifFecmP81RUGFmr+skKGDgUTTwRdG
 BhrV+QTj9IH+G5rhcy/osdliCfaqWsOuHJib81X/u2lW1ib7tTEA2ml1n
 HZuy2WvCYPwB0GTqNk9gfymV4FzU2tnH9GGkSbk/uW45WmCVlFs85X1FW w==;
X-CSE-ConnectionGUID: zNDPCAQRQaSQnxVcSYTiYA==
X-CSE-MsgGUID: a9TUei+xQkKppg1UQoYmRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="28917998"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="28917998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 02:30:25 -0700
X-CSE-ConnectionGUID: TuoGpMWOQ1KHjKAGZCa8xA==
X-CSE-MsgGUID: mfdlJ/DMSdasybnyvikg7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="101860201"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 02:30:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Piecielska,
 Katarzyna" <katarzyna.piecielska@intel.com>,
 igt-dev@lists.freedesktop.org, imre.deak@linux.intel.com
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
In-Reply-To: <99543131-86f3-474b-a9c5-6e28eae5c6ba@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
 <172468301865.6014.9946879676247551400@gjsousa-mobl2>
 <82a8af36-642a-4747-b085-924c02e6308e@intel.com>
 <CY5PR11MB62119DD080EF001546D7D41C95942@CY5PR11MB6211.namprd11.prod.outlook.com>
 <172476290898.3066.9682588878616653824@gjsousa-mobl2>
 <CY5PR11MB6211B873C18594896BD21FA295942@CY5PR11MB6211.namprd11.prod.outlook.com>
 <44e18951-3b9d-4aff-a590-efd39e0a7a70@intel.com>
 <0368307c-3c7c-4167-a122-8f27a7bc36e3@intel.com>
 <87y13yi5vb.fsf@intel.com>
 <99543131-86f3-474b-a9c5-6e28eae5c6ba@intel.com>
Date: Mon, 23 Sep 2024 12:30:19 +0300
Message-ID: <87a5fy7m50.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 13 Sep 2024, "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com> wrote:
> So in this case neither disable_display, nor enable_display will work to 
> have a truly display free test run ?

xe.enable_display is called xe.probe_display since commit 1eda95cba9df
("drm/xe: Rename enable_display module param") to reduce the confusion
between the two params.

xe.probe_display=0 will give you a "truly display free test run", but
you just can't properly test suspend/resume like that. If the hardware
has display IP, it just won't magically go to sleep if you don't touch
it.

Looks like the premise of the test is flawed.


BR,
Jani.

-- 
Jani Nikula, Intel

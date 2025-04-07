Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3469EC369A1
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 19:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896A310E3FB;
	Mon,  7 Apr 2025 19:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWZlk6Q8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128BA10E548
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744052508; x=1775588508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eOzWn0cQkjsXR+NxdXj5vXEethBqXiJKj5l9YO3AJEw=;
 b=hWZlk6Q8yRhOMOqdtTwOqJqMD768u8X//OtJNgtt1HKpZsKmWX85wLlB
 u5Zus8JBfrIvr9MSPKIMxeyt6NST7weI126jzuYBhI49Dhn38wshmA8KD
 TnUXkjx/czTfWuTXUPgbB88yffcAn7akKfWsblzZHOTpsTl2UCx3WUSyE
 m8JzzkTNh854NlMBhMI4mPLigerBrEHAwnM45eRLSJjTDSjfzsMh2QNl4
 Tf/Lr4Rd3XjqCS2B0dtL2QR+xkWn02ztKoEnE1C2yNGPG880JMyw5+Pre
 7rJ054LgW4KheP11yl+0QaPPq3fKA0PNRtGW2VDJe6kixVD6x9vbFPMba Q==;
X-CSE-ConnectionGUID: hsgW9oTbQIeRGWzxDdANgA==
X-CSE-MsgGUID: hryGkfmUT/qWQ3Oede02Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45548894"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="45548894"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 12:01:47 -0700
X-CSE-ConnectionGUID: mgiq5aAIQkaFHWGj+FxPWQ==
X-CSE-MsgGUID: znX1Cke/SFqcVDcK4xlgfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="132175134"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 12:01:45 -0700
Date: Mon, 7 Apr 2025 21:01:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t v2 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Message-ID: <20250407190143.sude4kvlag3kmtrp@zkempczy-mobl2>
References: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
 <20250404123140.260143-5-zbigniew.kempczynski@intel.com>
 <CH3PR11MB843489EE72E7408D26B634D38DAA2@CH3PR11MB8434.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB843489EE72E7408D26B634D38DAA2@CH3PR11MB8434.namprd11.prod.outlook.com>
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

On Mon, Apr 07, 2025 at 10:49:38AM +0200, Dandamudi, Priyanka wrote:

<cut>

> > +				 * Get half of ram / 2, then divide by
> > +				 * CONTEXT_MB * 2 (long and short) job
> > +				 */
> > +				child_count = ram_mb / 2 / CONTEXT_MB / 2;
> Here it should be CONTEXT_MB* 2 or CONTEXT_MB/2 ??
> -- Priyanka

child_count = ram_mb / 2 / CONTEXT_MB / 2;

or

child_count = ram_mb / 2 / (CONTEXT_MB * 2);

are equal.

--
Zbigniew


> > +
> > +				igt_debug("RAM: %zd, child count: %d\n",
> > +					  ram_mb, child_count);
> > 
> >  				test_compute_preempt(xe, hwe, false);
> >  				igt_fork(child, child_count)
> > --
> > 2.34.1
> 

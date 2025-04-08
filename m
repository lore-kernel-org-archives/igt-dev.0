Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E90FC3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 12:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA0E10E67F;
	Tue,  8 Apr 2025 12:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cprEvBcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E47D10E684
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 12:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744114327; x=1775650327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Uu/IaUXQCy988XuIoaCaWa0vLwA/BCVxQ+TVXcyh+9A=;
 b=cprEvBcbZQirZ5ELepwh2pVTnGVjzMqKlBgi4K2ydv9A2ddp3NkCim0d
 kcZbk05Xh7GZvBt2+x7pQ40je9sMGzbwQujeCbYsItoKnoiZksASO07Nl
 +0ewLWQ8tKiFDGnpqtphyF+3WiuSk4kAgHnNC6ihtuDRMowD9oKtwK/3c
 3hRk2buyhUf6kkTDDkkIOJHgeA47Dj3WhoYZse3eaupmS4uQTl/+FsQSU
 M/vsXTBA5/xU9ko0Hu6Zz19bQgMxBFj/20/1wid9GjRlpOe60UBxEThva
 VcE8Pyq8jwSQpJSdcja2CXbZTfbObTY/GVZJVgLW4+7X8MTyAadzoevoN A==;
X-CSE-ConnectionGUID: or7uIQMUShqaqUZ6aqMwHA==
X-CSE-MsgGUID: CKglkTwzRUmyzWBBPyUg5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44683931"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="44683931"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 05:12:07 -0700
X-CSE-ConnectionGUID: iT4RGdeQRreMIfxMHShurw==
X-CSE-MsgGUID: POE+WG3mSu6DLYNWTepQYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128117679"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:12:05 -0700
Date: Tue, 8 Apr 2025 14:12:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t v2 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Message-ID: <20250408121203.dun3oj7w6dlqk6s4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
References: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
 <20250404123140.260143-5-zbigniew.kempczynski@intel.com>
 <CH3PR11MB843489EE72E7408D26B634D38DAA2@CH3PR11MB8434.namprd11.prod.outlook.com>
 <20250407190143.sude4kvlag3kmtrp@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407190143.sude4kvlag3kmtrp@zkempczy-mobl2>
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

Hi Zbigniew,
On 2025-04-07 at 21:01:43 +0200, Zbigniew Kempczyński wrote:
> On Mon, Apr 07, 2025 at 10:49:38AM +0200, Dandamudi, Priyanka wrote:
> 
> <cut>
> 
> > > +				 * Get half of ram / 2, then divide by
> > > +				 * CONTEXT_MB * 2 (long and short) job
> > > +				 */
> > > +				child_count = ram_mb / 2 / CONTEXT_MB / 2;
> > Here it should be CONTEXT_MB* 2 or CONTEXT_MB/2 ??
> > -- Priyanka
> 
> child_count = ram_mb / 2 / CONTEXT_MB / 2;
> 
> or
> 
> child_count = ram_mb / 2 / (CONTEXT_MB * 2);
> 
> are equal.

Also:

child_count = ram_mb / (CONTEXT_MB * 4);

Regards,
Kamil

> 
> --
> Zbigniew
> 
> 
> > > +
> > > +				igt_debug("RAM: %zd, child count: %d\n",
> > > +					  ram_mb, child_count);
> > > 
> > >  				test_compute_preempt(xe, hwe, false);
> > >  				igt_fork(child, child_count)
> > > --
> > > 2.34.1
> > 

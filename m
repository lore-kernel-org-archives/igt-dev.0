Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9006ECAC5AE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 12:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FD910EA48;
	Fri, 26 Sep 2025 12:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZStkecV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068A710EA48
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758890182; x=1790426182;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RkyoJI+8r+SlhbGRVo+35rE/FaMn8D3Wr+7pk9E6cpI=;
 b=nZStkecV5eSIg6uRknGRrVZUKj7CN+JSdBToisEYitZQxirqL1ljaE1h
 7ASr9ZC5QPS2IIE4d+niWpaE8NYXxloQOPJ+f7n0BkiQ68N2a7ius1vpW
 y/k4Y7vswsGzBK9DvMc354KxAEx84ZvkaGPtscQQSfgCbFKvQN1bY/v7I
 v42bmkc8ZWZiLWDbzevIVzN1150TJgJGvs6qkuvevq4q194/zVMQkF/oz
 h/RsyFPP+49ft3lN8XdS+CIiBGvu34WtTd65hOn2sse9whxVefvFQLJaA
 6GS/u0R+CDl1Rkn7At0Ba7g5T4+sE8sztcw+tsV73bcTT5VuTKexxP3fJ A==;
X-CSE-ConnectionGUID: L6L2wuzkRcGUEjjBVc15Fw==
X-CSE-MsgGUID: YNWJfjfLS7mcUY6570JQiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60259101"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="60259101"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 05:36:22 -0700
X-CSE-ConnectionGUID: 56cmVUGdQVirwuGwoDsNsA==
X-CSE-MsgGUID: S2bWrP2kSHqokEgdYt9iug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176729431"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 05:36:18 -0700
Date: Fri, 26 Sep 2025 14:36:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tools/lsgpu: iterate over all matching devices
Message-ID: <20250926123615.uxmedzzcniue4cld@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
References: <20250925091847.134577-2-zbigniew.kempczynski@intel.com>
 <20250925124148.lohnirhf3gruqg35@kamilkon-DESK.igk.intel.com>
 <bdphxfrzcflpqqpqv4yf2aotkubjrwesdcsvdvlflve4gzm3yf@wkxmqqfvwl57>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdphxfrzcflpqqpqv4yf2aotkubjrwesdcsvdvlflve4gzm3yf@wkxmqqfvwl57>
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
On 2025-09-25 at 17:38:52 +0200, Zbigniew Kempczyński wrote:
> On Thu, Sep 25, 2025 at 02:41:48PM +0200, Kamil Konieczny wrote:
> > Hi Zbigniew,
> > On 2025-09-25 at 11:18:48 +0200, Zbigniew Kempczyński wrote:
> > > At the moment only 'device:' filter allows to collect all matching
> > > cards in the igt_devs.filtered view. Before this filter was introduced
> > > we were mostly using 'pci:' which doesn't allow to put 'card=all'
> > > and filter out all matching devices. Another limitation was in lsgpu,
> > 
> > I am not sure but 'filter out' seams a little off, what about s/out//
> > or s/filter out/fill in/
> > 
> > > which allows to display only single matching device.
> > > 
> > > Add loop around all matching cards and try to open them in lsgpu.
> > > This allows testing filters which supports 'card=all' argument.
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > I got strange results with 'Cannot open' prints, is this intended?
> 
> Yes. For 'device' filter we get everything what is matching in
> the udev. 'drm' nodes there exists there standalone (check lsgpu -p).
> 
> What you want to achieve is likely:
> 
> lsgpu -d 'device:subsystem=pci,card=all'
> 
> > 
> > -------------------------------------------
> > Device detail:
> > subsystem   : drm
> > drm card    : 
> > drm render  : /dev/dri/renderD128
> > Cannot open card device, empty name
> > Device /dev/dri/renderD128 successfully opened
> > -------------------------------------------
> > Device detail:
> > subsystem   : drm
> > drm card    : /dev/dri/card1
> > drm render  : 
> > Device /dev/dri/card1 successfully opened
> > Cannot open render device, empty name
> > -------------------------------------------
> > 
> > imho this should be combined:
> > -------------------------------------------
> > Device detail:
> > subsystem   : drm
> > drm card    : /dev/dri/card1
> > drm render  : /dev/dri/renderD128
> > -------------------------------------------
> > 
> > btw do we need info about un/successfull open?
> 
> Likely yes, you can run lsgpu without being root.
> 

ok, so it looks good,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> --
> Zbigniew
> 
> > 
> > Regards,
> > Kamil
> > 
> > > ---
> > >  tools/lsgpu.c | 24 ++++++++++++++----------
> > >  1 file changed, 14 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> > > index 6cfbf31420..935371dea5 100644
> > > --- a/tools/lsgpu.c
> > > +++ b/tools/lsgpu.c
> > > @@ -369,28 +369,32 @@ int main(int argc, char *argv[])
> > >  	igt_devices_scan_all_attrs();
> > >  
> > >  	if (igt_device != NULL) {
> > > -		struct igt_device_card card;
> > > +		struct igt_device_card *cards;
> > > +		int matched;
> > >  
> > >  		printf("=== Device filter ===\n");
> > >  		printf("%s\n\n", igt_device);
> > >  
> > >  		printf("=== Testing device open ===\n");
> > >  
> > > -		if (!igt_device_card_match(igt_device, &card)) {
> > > +		matched = igt_device_card_match_all(igt_device, &cards);
> > > +		if (!matched) {
> > >  			printf("No device found for the filter\n\n");
> > >  			ret = -1;
> > >  			goto out;
> > >  		}
> > >  
> > > -		printf("Device detail:\n");
> > > -		print_card(&card);
> > > -		test_device_open(&card);
> > > -		if (fmt.type == IGT_PRINT_DETAIL) {
> > > -			printf("\n");
> > > -			igt_devices_print(&fmt);
> > > +		for (int i = 0; i < matched; i++) {
> > > +			printf("Device detail:\n");
> > > +			print_card(&cards[i]);
> > > +			test_device_open(&cards[i]);
> > > +			if (fmt.type == IGT_PRINT_DETAIL) {
> > > +				printf("\n");
> > > +				igt_devices_print(&fmt);
> > > +			}
> > > +			printf("-------------------------------------------\n");
> > >  		}
> > > -		printf("-------------------------------------------\n");
> > > -
> > > +		free(cards);
> > >  	} else {
> > >  		igt_devices_print(&fmt);
> > >  	}
> > > -- 
> > > 2.43.0
> > > 

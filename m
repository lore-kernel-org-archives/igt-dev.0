Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8215CCD1A5
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 09:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6727A10EA05;
	Fri, 24 Oct 2025 09:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwOBpgby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAC810EA05
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761299290; x=1792835290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OB6V0FMUAySQlGVwtaBb0w66Nq5B/VWrKgoTDURFdyY=;
 b=YwOBpgbyny795AH1SDn+q1g4coymIW7avYyYanLJOcixcU8bgfUdKsA0
 PDMmMkZLWN3Q9OyKrvNsZqi426GjVwJilyOyBuUDzR5zJ1Ht4kE+/3Pls
 7cHkTjbxhPEBdbFNBtU0qSKqjnrMDM0yOenm9G4P9qrwM8pZrnqGKt5Z9
 1Gs+GiE6WtxjpWjS2Asr4ZBDfamtTaya40EN0F5NxR45B0H1NSkc8Z4iV
 Q9S/FQTYnJNPDcGYCXfo8/InXg5Oee4c2MDp8KxJbMD3QaTK2EVTwFe0z
 I/70WGaJ+d42YK/3SHMpsV1wMVVMsByylkc3F5/+TK+ev3vPwNZZMwMjY Q==;
X-CSE-ConnectionGUID: OydMvrgNQOODnCkDMfaiKg==
X-CSE-MsgGUID: Dlu3O5I8R/O7ZZ4tfv9jPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62689299"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="62689299"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 02:48:10 -0700
X-CSE-ConnectionGUID: ItDrLuaCRD6F7GoLKOLJ2A==
X-CSE-MsgGUID: TGyovnxqT8Sgfvvwc8vhMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="208035992"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 02:48:08 -0700
Date: Fri, 24 Oct 2025 11:47:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, juhapekka.heikkila@gmail.com
Subject: Re: [PATCH i-g-t] lib/drmtest: Remove VKMS from Exclusion list
Message-ID: <20251024094751.574dvuqomefncboc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, juhapekka.heikkila@gmail.com
References: <20251008160209.463702-1-markyacoub@google.com>
 <20251009164600.btzj5kiscl5ftdl7@kamilkon-DESK.igk.intel.com>
 <CAC0gqY7ZeCZPP8WHPq8uS-sOZVGpi8Fnzn-uDsWdt4jW72B8RA@mail.gmail.com>
 <20251015181649.ca7psctqj2vj2dt2@kamilkon-DESK.igk.intel.com>
 <d67971d5-8bc5-4a4d-becf-59696631f21d@bootlin.com>
 <aPDQOgFtR0aMo4_C@fedora>
 <CAC0gqY5tYG_3S5P+Xjq2k0=a_4Ktux3sCuQn9ef1Yn7ZPfYqdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC0gqY5tYG_3S5P+Xjq2k0=a_4Ktux3sCuQn9ef1Yn7ZPfYqdg@mail.gmail.com>
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

Hi everyone,
On 2025-10-16 at 10:51:07 -0400, Mark Yacoub wrote:
> On Thu, Oct 16, 2025 at 7:00 AM José Expósito <jose.exposito89@gmail.com> wrote:
> >
> > Hi everyone,
> >
> > Thanks for CCing me Louis.
> >
> > On Thu, Oct 16, 2025 at 10:40:32AM +0200, Louis Chauvet wrote:
> > >
> > >
> > > Le 15/10/2025 à 20:16, Kamil Konieczny a écrit :
> > > > Hi Mark,
> > > > On 2025-10-09 at 12:53:24 -0400, Mark Yacoub wrote:
> > > > > Hi Kamil,
> > > > >
> > > > > Thanks for your feedback. I'd like to elaborate on my use case to provide
> > > > > more context about the problem I'm trying to solve.
> > > > >
> > > > > I am building IGT for Android, and the same build system is deployed on
> > > > > both physical hardware and virtual machines. On the hardware, the
> > > > > appropriate hardware driver is correctly detected, so there are no issues
> > > > > there. However, on the VM, VKMS is running, but it's currently excluded
> > > > > from `DRIVER_ANY`, which prevents the tests from running against it. I need
> > > > > the tests to execute on VKMS in this scenario.
> > > > >
> > > > > Using `IGT_FORCE_DRIVER` would require me to fork the build processes for
> > > > > hardware and VM, which I would prefer to avoid. My goal is to maintain a
> > > >
> > > > You do not need to fork it nor recompile, this is env var for
> > > > CI run with tests, it uses the same igt binaries only makes them
> > > > using a forced driver when opening card. Now it do not work as
> > > > no user before needed to force it into vgem or VKMS.
> > > >
> > > > In theory you could define it like: export IGT_FORCE_DRIVER=vkms
> > > > and then all kms tests and core_ ones should honor it.
> > >
> > > +CC: José
> > >
[cut]

This was merged recently: https://patchwork.freedesktop.org/series/156071/
Fix drm_open_driver() with IGT_FORCE_DRIVER and DRIVER_ANY

and it should solve your problem. Thanks to José for testing.

Regards,
Kamil

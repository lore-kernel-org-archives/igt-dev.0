Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51950FF885D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 12:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022CC10EB2B;
	Tue, 28 Apr 2026 12:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sby0LfqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459BC10EB2B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777379916; x=1808915916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WnbfPittR9L+O4A/nLKaK38Sy+GLZW1gXkPlyEUngtU=;
 b=Sby0LfqQM0YjuGYBOolmVY2yIjL6GAV5BqrPIViin7K1XkdpH7v4vnmi
 CAXNl1xBtYBDPaXZ7EU4NtMlQGPPU9ItMOiZsuG+e5IBd33rxs/3ZEzj7
 x3bu82dRMPh9Z9+HiWxbe+vRpH33dSoePcKhYYjbVDvQbLpererfr4/vv
 TxmoVU0yqtf37uia+w0bsBuH6ffqRJ7f0+ti6fUtXTuqdW3QBq9ZY0nvU
 iZT80onyvhWquPtcqXexd5jY8QO/2FqZNcDygaovmAYhqE1/gDVusGQfQ
 oOc0AnycSK7cWYhrRsinrGGBUhFnDoGxnv/pQatN3OHal0+RosaGsuyon w==;
X-CSE-ConnectionGUID: 9gaPf42ES/eY+c8P0C5vtQ==
X-CSE-MsgGUID: ZKDJzFSlQKKQvNf4YjZXTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="100943442"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="100943442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:38:28 -0700
X-CSE-ConnectionGUID: 913nhaoCShe1aSFW6necCg==
X-CSE-MsgGUID: 2Eq7wTduStm1zWkNk0Y0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238287723"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 05:38:27 -0700
Date: Tue, 28 Apr 2026 14:38:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: Create proper error report when
 open driver fails
Message-ID: <20260428123810.mgcfw66koqidg3ol@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20260421145950.55091-1-kamil.konieczny@linux.intel.com>
 <9ad9cc9138328823892f7319c1e3bb2c2b879e0c@intel.com>
 <fnos4wekls4mbxfuiy6wczqz63rkk6j5ldjxuzkthojsiifqx7@3frsnsuq64oa>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fnos4wekls4mbxfuiy6wczqz63rkk6j5ldjxuzkthojsiifqx7@3frsnsuq64oa>
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
On 2026-04-22 at 18:41:09 +0200, Zbigniew Kempczyński wrote:
> On Wed, Apr 22, 2026 at 10:44:14AM +0300, Jani Nikula wrote:
> > On Tue, 21 Apr 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > > When first try for opening driver fails then opening function is
> > > searching for next available device. When that also fails
> > > reporting is printing last errno which could mislead developer:
> > >
> > > $ build/tests/kms_dp_aux_dev
> > > IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
> > > Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:754:
> > > Test requirement: !(fd<0)
> > > No known gpu found for chipset flags 0x4294965755 (any)
> > > Last errno: 2, No such file or directory
> > > SKIP (0.006s)
> > >
> > > ls /dev/dri
> > > by-path  card1  renderD128
> > >
> > > The real problem here is lack of permissions as there was a card
> > > but program could not open it. Break looking for a card as soon
> > > as an error is different from ENOENT. It will create a proper
> > > error report which will print:
> > >
> > > Last errno: 13, Permission denied
> > 
> > Isn't it also a problem that errno is really only valid right after a
> > failed libc call, and unspecified later?
> 
> Yes, you're right.
> 
> But in this particular case I think errno has no chance to be changed,
> I mean in sequence:
> 
> fd = drm_open_driver()
>   -> __drm_open_driver()
>     -> __drm_open_driver_another()
>        -> __open_driver()
>           -> __search_and_open()

There is one more nested call, and open() happens in
__drm_open_device(). That function could fail for other reasons,
like using IGT_FORCE_DRIVER and a driver being different from
what was requested. I will roll out another version with actual
errno from open().

Regards,
Kamil

> igt_assert_fd(fd)
> 
> we call __igt_fail_assert() immediately after library call, and this
> function fetches errno immediately so consecutive libc calls won't
> affect captured value (and error string looks valid).
> 
> >
> > All asserts lead to __igt_fail_assert(), which logs the last errno, but
> > anything could've happened before then. Most crucially, the errno
> > could've happened and been handled a while back, but the subsequent libc
> > calls won't clear the previous errno on success. So errno at assert
> > might have nothing to do with the assert itself.
> 
> All igt code is prone to some false error messages if there's a code
> between failed call and assert. To be honest I didn't realize until
> you've mentioned that assert code might produce false error message. In
> some tests I do assert after releasing resources so in case of failure
> assert might be misleading.
> 
> --
> Zbigniew
> 
> > 
> > BR,
> > Jani.
> > 
> > >
> > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >  lib/drmtest.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > > index 4a788ea7a..66982f653 100644
> > > --- a/lib/drmtest.c
> > > +++ b/lib/drmtest.c
> > > @@ -443,6 +443,11 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
> > >  		fd = __drm_open_device(name, chipset);
> > >  		if (fd != -1)
> > >  			return fd;
> > > +
> > > +		if (errno == ENOENT)
> > > +			continue;
> > > +
> > > +		break;
> > >  	}
> > >  
> > >  	return -1;
> > 
> > -- 
> > Jani Nikula, Intel

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99D2FF885D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 09:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997E810EA74;
	Tue, 28 Apr 2026 09:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RETPUKcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77B110EA74
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 09:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777367090; x=1808903090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wOSiFolX8OYdK139+ilXOxD2G0f4wY2wLo2MeF1UbBQ=;
 b=RETPUKcHXFmygDGeS7IbC2fro1MlpYJm2tx6oMFbv2ExQrdj1lwdN7lK
 EjdkQQtoZJkhBDHWBNAKGZDQplOMXi8PBUE8y9KKfNTDReCloX2nHNi/6
 bciuKvmasPqH860ryIJaa7XgYFoCxhbknVWnN585gpT/g2vHsstQdeucI
 rGxR7cu7eJaEAmc3dibqF7TNawummfYoes7LgojcxkPuCVErc23PaiN6P
 Es5mdtGim1188QzMdC+NmV3MhiLazBTscv+6ymxk8e18NwnQQCDvsmQ+r
 ufZea13bW1IT9UWHZ//KrWKmZk1K97dwSsMO2z4DzEEuhyFJDUViUxHcs Q==;
X-CSE-ConnectionGUID: ykLfL5AHQPOS1ecK/oFGzQ==
X-CSE-MsgGUID: U6i+Avq0RnK04LZVO0FoXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="100927592"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="100927592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 02:04:50 -0700
X-CSE-ConnectionGUID: R79dV9TATC+J/NVMelDL4w==
X-CSE-MsgGUID: jl9NDgNFSNCobCAdJ0Rw+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="264289494"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 02:04:48 -0700
Date: Tue, 28 Apr 2026 11:04:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: Create proper error report when
 open driver fails
Message-ID: <20260428090445.lvlo2k5rql5c3ku5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20260421145950.55091-1-kamil.konieczny@linux.intel.com>
 <9ad9cc9138328823892f7319c1e3bb2c2b879e0c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ad9cc9138328823892f7319c1e3bb2c2b879e0c@intel.com>
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

Hi Jani,
On 2026-04-22 at 10:44:14 +0300, Jani Nikula wrote:
> On Tue, 21 Apr 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > When first try for opening driver fails then opening function is
> > searching for next available device. When that also fails
> > reporting is printing last errno which could mislead developer:
> >
> > $ build/tests/kms_dp_aux_dev
> > IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
> > Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:754:
> > Test requirement: !(fd<0)
> > No known gpu found for chipset flags 0x4294965755 (any)
> > Last errno: 2, No such file or directory
> > SKIP (0.006s)
> >
> > ls /dev/dri
> > by-path  card1  renderD128
> >
> > The real problem here is lack of permissions as there was a card
> > but program could not open it. Break looking for a card as soon
> > as an error is different from ENOENT. It will create a proper
> > error report which will print:
> >
> > Last errno: 13, Permission denied
> 
> Isn't it also a problem that errno is really only valid right after a
> failed libc call, and unspecified later?

Good point, I will print it with igt_debug just after failed open.

Regards,
Kamil

> 
> All asserts lead to __igt_fail_assert(), which logs the last errno, but
> anything could've happened before then. Most crucially, the errno
> could've happened and been handled a while back, but the subsequent libc
> calls won't clear the previous errno on success. So errno at assert
> might have nothing to do with the assert itself.
> 
> BR,
> Jani.
> 
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/drmtest.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 4a788ea7a..66982f653 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -443,6 +443,11 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
> >  		fd = __drm_open_device(name, chipset);
> >  		if (fd != -1)
> >  			return fd;
> > +
> > +		if (errno == ENOENT)
> > +			continue;
> > +
> > +		break;
> >  	}
> >  
> >  	return -1;
> 
> -- 
> Jani Nikula, Intel

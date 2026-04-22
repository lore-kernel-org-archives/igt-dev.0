Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BF4FA1FD6
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 16:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BD110EA54;
	Wed, 22 Apr 2026 16:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjV0CnQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1B910EA54
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 16:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776876074; x=1808412074;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Uq6nUyNs9qfuWxXOgwvE2IySlqOtkqyQ2dum/reT/gQ=;
 b=OjV0CnQnIGhQ2/BYpEmf97xveJBcfrcHO/ziFXO8Cjk0i64TvZTWa2v1
 lrM5dgxGJ5FZJirO0DnRYpSck4VKsXCFFbEgO0WdanqyQdIzfoM2A5IhN
 UACKKN+tkAHCXsfWxL0KT8AEjQsnQgBE+VpX9eEDxSk0BRTX4RHPSLIwW
 Q1MRPyNYc6cSpi+I+HluYFewMLSQQk76SLuerU+EoX2I4PWLtA8c545zu
 rOpCT5DB45UNqKG0aPJdwlK8/nv5RhAyCoUwwttOYn+7+lA1IG9HgUFIN
 5V2EGYGt0ch7ErixFX0FsWJ1PbStNj6i0geqpN/FlHe8acv4LvWLtjNd2 g==;
X-CSE-ConnectionGUID: TWZNn1ueSSuYwmTvNXvbZg==
X-CSE-MsgGUID: bDwz5DKIQPKk17k8oBwmNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="65369590"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="65369590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:41:13 -0700
X-CSE-ConnectionGUID: YLYxIDM+SzGbUeACZs4fvA==
X-CSE-MsgGUID: AQWvx78ARwC7+YQ+Gl0FMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="237382334"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.47])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:41:12 -0700
Date: Wed, 22 Apr 2026 18:41:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: Create proper error report when
 open driver fails
Message-ID: <fnos4wekls4mbxfuiy6wczqz63rkk6j5ldjxuzkthojsiifqx7@3frsnsuq64oa>
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

On Wed, Apr 22, 2026 at 10:44:14AM +0300, Jani Nikula wrote:
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

Yes, you're right.

But in this particular case I think errno has no chance to be changed,
I mean in sequence:

fd = drm_open_driver()
  -> __drm_open_driver()
    -> __drm_open_driver_another()
       -> __open_driver()
          -> __search_and_open()
igt_assert_fd(fd)

we call __igt_fail_assert() immediately after library call, and this
function fetches errno immediately so consecutive libc calls won't
affect captured value (and error string looks valid).

>
> All asserts lead to __igt_fail_assert(), which logs the last errno, but
> anything could've happened before then. Most crucially, the errno
> could've happened and been handled a while back, but the subsequent libc
> calls won't clear the previous errno on success. So errno at assert
> might have nothing to do with the assert itself.

All igt code is prone to some false error messages if there's a code
between failed call and assert. To be honest I didn't realize until
you've mentioned that assert code might produce false error message. In
some tests I do assert after releasing resources so in case of failure
assert might be misleading.

--
Zbigniew

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

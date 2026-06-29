Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6232FC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 16:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0054C10E997;
	Mon, 29 Jun 2026 16:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAUYPpz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C40510E98F
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782750772; x=1814286772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1NTKPXfBghXmJsxqk02dj5wy7sUM3XH9ybdXbNWeW+4=;
 b=VAUYPpz/UoRgZ4XbSmB2M920x+38OnECqHC4lp7GiK8IICzR/Fr5JhII
 jF2LMYKYzCHrzI1iPHeogdUfdGjm/tw2d8nGPX9V/mqbEOOxsUFpX2yiO
 uW6TBe5qT18zXl/I0hXKhP5gLIAA62NUgOO8qCcT3TgN9btGp1m31bYXb
 fp3KyacCmBB1mDLAW+J0GyLbzZ84mtt44a5xqbblAzeXLh5LIzwAH+eb9
 RsxNmmyrvXTrGjyth97NP+P0Z2rn3zP6yr3wcVFysLVWyh/bQbmsGSOm9
 p3j5qpTothyamPseTsH8ne2/kZZxEudW+5YALh0ttYheVySwYwWBaSB79 A==;
X-CSE-ConnectionGUID: Psi/8D+ISqy48+aN6TNNQQ==
X-CSE-MsgGUID: k33RwMXgRmmotivMWVvawA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83477274"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="83477274"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 09:32:51 -0700
X-CSE-ConnectionGUID: OxRMj3CBSoy2nK00ekv1yg==
X-CSE-MsgGUID: 9JlDx4fkRLep+ojJ8QaOog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="245648450"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 09:32:49 -0700
Date: Mon, 29 Jun 2026 18:32:47 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_hook: Fix realloc size to avoid memory
 overwriting
Message-ID: <2oskxsgbneasu3zcty4lrikgmbcqg6bdhefkqcorqmpa336mw6@p2gn3cjtkxrd>
References: <20260629115408.158220-2-zbigniew.kempczynski@intel.com>
 <877bnhtua6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877bnhtua6.fsf@intel.com>
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

On Mon, Jun 29, 2026 at 09:17:53AM -0300, Gustavo Sousa wrote:
> Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> writes:
> 
> > Doubling test name size might be not enough for realloc if target name
> > length is larger than test/subtest name size.
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > ---
> >  lib/igt_hook.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> > index b8f25b6c7a..a44b852da1 100644
> > --- a/lib/igt_hook.c
> > +++ b/lib/igt_hook.c
> > @@ -300,7 +300,7 @@ static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_hook, struct
> >  	if (len + 1 > *size_ptr) {
> >  		size_t fullname_size;
> >  
> > -		*size_ptr *= 2;
> > +		*size_ptr += len + 1;
> 
> Oops. My bad. Thanks for finding this!
> 
> Do we need to use "+=" instead of "=" above, though?
> 
> Also, perhaps we could use roundup_power_of_two(len + 1) to reduce the
> number of follow-up reallocs?

Sorry, I haven't explained why I used "+=" instead of "=". That was
first what comes to my mind to fix the issue and try to decrease number
of reallocs more than with simple '='. For smaller sizes I'm not sure if
size of power of two is better than any other value. Glibc adds some
overhead to malloc so I think any strategy we pick which increases
buffer underneath is acceptable to me.

--
Zbigniew


> 
> --
> Gustavo Sousa
> 
> >  		*name_ptr = realloc(*name_ptr, *size_ptr);
> >  
> >  		fullname_size = igt_hook_calc_test_fullname_size(igt_hook);
> > -- 
> > 2.54.0

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39692C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 15:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D853C10E1C4;
	Fri,  1 Mar 2024 15:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHOn19/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BA410E1C4
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709306128; x=1740842128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ujy0FNY7/b7F4+wJNW3TQI9gHQ1qFGIEcc4He8Y85o=;
 b=UHOn19/mEwrcXsQqBV4cmB4IFSe1RzAtA13Q3/gx3VsrimWa8c52Y5Z/
 lnLVZqgx74SHaZxS8HNRKjjX18Oa6cUZvdzVpl5fI7JqD9A01xvuDULhN
 lqbJByYguibMPRruJfPPkL3gDVj5chC4cIUVrSGztL5o+Wq4HApFzuUzm
 s9423UIQYoADQuzq/N09P9hhPRuSFwhl67bO9/d5mu+DFyBD7dDfnbKb/
 mBgtbkiZckzK9wIjwCSmX8fSr6iGGJ6TN/xsaK85SOcsa9m0qosXD72XA
 rcrH0FO6IuRDn1Aa9+A6W3zZ5COdvDmxwRK4WQNXrwv2/u2aK8XLMyRIK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3735777"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3735777"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="12904240"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.5.115])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:15:26 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 2/4] lib/igt_sysfs: stop leaking fd on write
 failures
Date: Fri, 01 Mar 2024 16:15:22 +0100
Message-ID: <2635837.9Mp67QZiUf@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <rwu332noevjxmaapc5if63biksu7ftr6bvhcwwt64kof47uz4n@yvmyy34i3un7>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
 <2538584.Sgy9Pd6rRy@jkrzyszt-mobl2.ger.corp.intel.com>
 <rwu332noevjxmaapc5if63biksu7ftr6bvhcwwt64kof47uz4n@yvmyy34i3un7>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Thursday, 29 February 2024 18:33:46 CET Lucas De Marchi wrote:
> On Thu, Feb 29, 2024 at 12:06:24PM +0100, Janusz Krzysztofik wrote:
> >Hi Lucas,
> >
> >On Wednesday, 28 February 2024 23:31:32 CET Lucas De Marchi wrote:
> >> Make sure to close the fd before returning.
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  lib/igt_sysfs.c | 21 ++++++++++++++-------
> >>  1 file changed, 14 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> >> index 2b0225138..2997925e5 100644
> >> --- a/lib/igt_sysfs.c
> >> +++ b/lib/igt_sysfs.c
> >> @@ -515,29 +515,36 @@ int igt_sysfs_vprintf(int dir, const char *attr, 
const char *fmt, va_list ap)
> >>  	va_copy(tmp, ap);
> >>  	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
> >>  	va_end(tmp);
> >> -	if (igt_debug_on(ret < 0))
> >> -		return -EINVAL;
> >> +	if (igt_debug_on(ret < 0)) {
> >> +		ret = -EINVAL;
> >> +		goto end;
> >> +	}
> >>
> >>  	if (ret > sizeof(stack)) {
> >>  		unsigned int len = ret + 1;
> >>
> >>  		buf = malloc(len);
> >> -		if (igt_debug_on(!buf))
> >> -			return -ENOMEM;
> >> +		if (igt_debug_on(!buf)) {
> >> +			ret = -ENOMEM;
> >> +			goto end;
> >> +		}
> >>
> >>  		ret = vsnprintf(buf, ret, fmt, ap);
> >>  		if (igt_debug_on(ret > len)) {
> >> -			free(buf);
> >> -			return -EINVAL;
> >> +			ret = -EINVAL;
> >> +			goto free_buf;
> >>  		}
> >>  	}
> >>
> >>  	ret = igt_writen(fd, buf, ret);
> >>
> >> -	close(fd);
> >
> >How about moving the code that opens the fd from the top of the body of 
this
> >function to just in front of the call to igt_writen(), and keeping this
> >close() here?  That way we wouldn't need the end: section of the error 
unwind
> >path, nor those two jumps to it.
> 
> The caveat would be trying to print the string before knowing if the
> file can really be written to. 

Why the caveat?

Do you agree that opening a file is more expensive then allocating a buffer 
and printing to it?  Do you agree that, from the POV of code efficiency, we 
might want to start from less expensive steps?

> I think unwind with goto is pretty common
> idiom in kernel and igt, so I think it's acceptable too. 

No doubts.

> If I move the
> open(), then I may have to free(buf) in 3 possible cases (fail on
> vsnprintf, fail on open, normal case).

Since you based your justification on counting the cases, why haven't you also 
compared the numbers of paths leading to close(fd) for completeness of the 
picture?

> 
> The other option (that I prefer, but is not common in igt) would be to use
> __attribute__((cleanup(closep))) which would automatically close the
> file on any function return. For dealing with heap-allocated + stack in
> kmod I use a scratchbuf struct to keep track of when it's needed to free
> the buf.  But I'm not sure its worth bringing those to igt for this one
> user. 

Definitely not, I believe, if only for one user.

> Nor moving the open() is looking good if you also consider
> free'ing buf. 

With close(fd) silently not considered as a factor that matters as much as 
free(buf), what looks good to you may be only your half of the picture.

> So, let's keep it as is in this patch?

OK, if you prefer.

Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Thanks,
Janusz

> 
> Lucas De Marchi
> 
> >
> >Thanks,
> >Janusz
> >
> >
> >> +free_buf:
> >>  	if (buf != stack)
> >>  		free(buf);
> >>
> >> +end:
> >> +	close(fd);
> >> +
> >>  	return ret;
> >>  }
> >>
> >>
> >
> >
> >
> >
> 





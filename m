Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8672C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 15:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693C610EE2B;
	Fri,  1 Mar 2024 15:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mi7N/AV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563B710EE2B
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709306216; x=1740842216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YaO4i8+NON+mWCClaSnjB3iYzS3K1D0eIDeahMobrpg=;
 b=mi7N/AV0UgStkHPmrxXFGss1DQyA4ao9U19suQjwn4zVdyE2VsUulEOd
 5x308Y68RJwVm1rMcWX7HdE0ailsgV68+rLRY8UU9macC1PSHj7UJgfnY
 QKol09KbmUSTSPG/q71bIXCnfZ2bGonHYOgWPfKeAJZf4xxxLQtF3yLBK
 6ncWPbi933Ravo6JZouwvO5BDh6Leji5iBjvhXk5ppbyecS3eNIK9ZMuV
 WuQiL+KsjlvdEb1Y7Cb6UnqFQnellkvHs45WOlvS9G0iXsKEMI/lduV0q
 /gBO1y+ehJSgmvUqY/ZkAl/Y0Hc8X9lLzFcHWmN28HSF++wB5hYbW9t4Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="14992729"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="14992729"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:16:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="39231450"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.5.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:16:53 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 3/4] lib/igt_sysfs: Fix off-by-one in buffer size
Date: Fri, 01 Mar 2024 16:16:51 +0100
Message-ID: <10760528.aFP6jjVeTY@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <oxofhejmm73jbch4js4uhoobmjiqa36bxbcptzt6wqscmxaxmi@t4trup4np5ci>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
 <3709752.RUnXabflUD@jkrzyszt-mobl2.ger.corp.intel.com>
 <oxofhejmm73jbch4js4uhoobmjiqa36bxbcptzt6wqscmxaxmi@t4trup4np5ci>
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

On Thursday, 29 February 2024 18:01:29 CET Lucas De Marchi wrote:
> On Thu, Feb 29, 2024 at 12:07:01PM +0100, Janusz Krzysztofik wrote:
> >Hi Lucas,
> >
> >On Wednesday, 28 February 2024 23:31:33 CET Lucas De Marchi wrote:
> >> vsnprintf() should receive the buffer size as argument, here called `len`,
> >> including the trailing '\0'. There was truncation if the return is "size
> >> or more". In this second call to vsnprintf() the value should be exactly
> >> the same as in the first call, otherwise something really unexpected
> >> happened.
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  lib/igt_sysfs.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> >> index 2997925e5..a1ff5655d 100644
> >> --- a/lib/igt_sysfs.c
> >> +++ b/lib/igt_sysfs.c
> >> @@ -529,8 +529,8 @@ int igt_sysfs_vprintf(int dir, const char *attr, const
> >char *fmt, va_list ap)
> >>  			goto end;
> >>  		}
> >>
> >> -		ret = vsnprintf(buf, ret, fmt, ap);
> >> -		if (igt_debug_on(ret > len)) {
> >> +		ret = vsnprintf(buf, len, fmt, ap);
> >
> >Oh, so I missed that we didn't use the len variable, initialized with a
> >calculated value of required buffer length, when allocating that buffer --
> >good catch.  OTOH, since we then pass the buffer to a function that doesn't
> >care for a terminating null char, a buffer of ret length, with no room for
> >that terminating null char, should be sufficient.  But anyway, let's request
> >that extra byte so the code is less confusing.
> >
> >> +		if (igt_debug_on(ret != len - 1)) {
> >
> >OK, let's also take care of strict consistency of the result with that from
> >the initial vsnprintf().
> >
> >But then, the len variable is really needed only for that comparison with the
> >new result  The required size of the buffer doesn't need to be calculated from
> >ret as ret + 1 in advance, only just when passing it as an argument to
> >malloc().  Under such circumstances, wouldn't that be more clear if we changed
> >semantics of len to always carry an initially detected length of the data to
> >be printed, not the required buffer length, and then compare it directly with
> >the new result, without recalculating that initial value back from the buffer
> >length?
> 
> this patch only fixes the bug. Path 4 is already reworking this to make
> it prettier, which afaiu includes this reasoning, with len always being
> the length of the string, not mixed with buffer size.

So if there were no follow up patches in the series then you would agree to 
make this patch prettier, but in this case your choice is to leave it not 
quite pretty, right?

Up to you.

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
> >>  			ret = -EINVAL;
> >>  			goto free_buf;
> >>  		}
> >>
> >
> >
> >
> >
> 





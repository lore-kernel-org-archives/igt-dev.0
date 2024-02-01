Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A970EC4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 19:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D0A10E91A;
	Thu,  1 Feb 2024 19:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkDGSaPn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8E410E9DA
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 19:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706817486; x=1738353486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=m+aMyQet8tuSyYiGCxhPAdkHrJ3RCejm8LUO7dMvxB0=;
 b=kkDGSaPnq0yVRH4aljQKu6u3awyVgdhH15AgYMK1b8Cdz8UB0JsZQycv
 shkRhuMMnXSgGXtICQU2ETUQ2Yg7YEmurDErNXE2wCGpmlL4DG8L2r/vE
 JYDAqHksiywsgBP4wdiMFrf5+kwc5IuKc0GNq1jHOO8z35XafFGh+O4dZ
 5Npmhk+JjzLNF7rh1aYsXgRQSZLnIXQwpw/OexK45o9ZNM/BN58YKL/tD
 rT4ffvG+9yjHlBTy/fwfrUx1dXJE+4OXx9Fv97yLIZV7WJMhasz6GKr/7
 INhSCaL+Di0orlq8BiHeQIacpAYkhIjvl5ypbWJcrOyIyMrwKmSnH3Gch A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="435147020"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="435147020"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="879199170"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="879199170"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:58:04 -0800
Date: Thu, 1 Feb 2024 20:58:01 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Drobnik <karolina.drobnik@intel.com>
Subject: Re: [PATCH i-g-t v4 5/5] tests/xe_exercise_blt: Exercise small to
 large fast-copy blits
Message-ID: <20240201195801.xoola567x5hicd7j@zkempczy-mobl2>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-6-zbigniew.kempczynski@intel.com>
 <2d5ffbb7-b431-4af6-8ef7-d09aaa45c92b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d5ffbb7-b431-4af6-8ef7-d09aaa45c92b@intel.com>
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

On Thu, Feb 01, 2024 at 03:23:54PM +0100, Karolina Stolarek wrote:
> Ah, forgot to tell you that checkpatch was slightly uhappy with two blank
> lines after inc-dimension subtest...
> 
> On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
> (...)
> > +	igt_describe("Check fast-copy with increment width/height");
> > +	igt_subtest_with_dynamic("fast-copy-inc-dimension") {
> > +		param.width = 1;
> > +		param.height = 1;
> > +		param.width_increment = 15;
> > +		param.width_steps = 512;
> > +
> > +		fast_copy_test(xe, set, FAST_COPY);
> > +	}
> > +
> > +
>  ^-- here!
> 
> Sorry for the email noise.

No problem at all, thanks for spotting this. I'll resubmit on v5.

--
Zbigniew

> 
> All the best,
> Karolina
> 
> >   	igt_describe("Check multiple fast-copy in one batch");
> >   	igt_subtest_with_dynamic("fast-copy-emit") {
> >   		fast_copy_test(xe, set, FAST_COPY_EMIT);

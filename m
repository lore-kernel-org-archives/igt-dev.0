Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF0AFF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 17:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA48F10E3EC;
	Mon,  4 May 2026 17:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijQUiKqZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAAF10E3EC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777914213; x=1809450213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fgt9eZSmbJ0bE9H9r6c1IpIznArbjbAS9zrhbGUq91Q=;
 b=ijQUiKqZlnMg4S3TRhKcLZZpJCKNfpFco8iWE60Z0CzJR71x8AGg5YeA
 Y3ploayP0GcdJwKrici9xy+KJDwLoaDh8NokG3lLiNAx9EkyHAhFUssU5
 Dwr0bGk5MTYtUH7p7yVRsX0rOERv9Tciaa0RuQuxfTaI6oR3ff3rEmb9r
 ff19e57jpf8fgnLksyyGw/8HSDjhDEEJ8pE+jSPr8RmCMmZUP6q4rROSA
 rztLuBVsdeBYSO0JQnabL/R7WM/S2nDy4F+QGHNwHzN63oIc1B9LnvhcP
 Vbn9sz3nhJlbOswvlibjhUU5Jscz5hQ9kIwgYJJy8wpwlcgt959U6LUEd A==;
X-CSE-ConnectionGUID: q+NADs8kTZiIUJFhYKZdkw==
X-CSE-MsgGUID: 16pwunqvQkOrmQjdQ5D0VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78677074"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78677074"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 10:03:32 -0700
X-CSE-ConnectionGUID: LTU53IdpSMeX4kYhWRbJKw==
X-CSE-MsgGUID: QKVKfti7SJeQjCWP+AXjdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="265911369"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 10:03:30 -0700
Date: Mon, 4 May 2026 19:03:27 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_exec_system_allocator: Don't use NaN in
 an input buffer
Message-ID: <wst2lagw6o7nhkqbdgz736ehz5dwbfvhzld23aelxarvli6p63@lidk4ey5ocqf>
References: <20260504152820.3825451-2-zbigniew.kempczynski@intel.com>
 <afi8khq4u8hbAXrl@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afi8khq4u8hbAXrl@gsse-cloud1.jf.intel.com>
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

On Mon, May 04, 2026 at 08:34:42AM -0700, Matthew Brost wrote:
> On Mon, May 04, 2026 at 05:28:21PM +0200, Zbigniew Kempczyński wrote:
> > Setting input buffer memory to random byte (in this particular case
> > 0xff) and then use it as a float causes doing compute square on NaN
> > numbers. It's nothing wrong about this but comparing NaN in between
> > returns false according to IEEE-754 rules. Buffer compare function
> > does assertion if output is not equal to expected output so we hit
> > this randomly in 'eu-fault*' tests.
> > 
> > Replace memset to loop which sets all input floats to real numbers
> > thus avoiding NaN arithmetic and comparison.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 5580099f78..0f1d6ee9c7 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2339,7 +2339,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> >  		igt_assert(compute_input);
> >  		env.input_addr = to_user_pointer(compute_input);
> >  
> > -		memset(compute_input, rand() % 255 + 1, size);
> > +		for (int j = 0; j < env.array_size; j++)
> > +			compute_input[j] = rand() / (float)RAND_MAX;
> 
> This logic can still get 0xff or 0x0...

And this logic is fine as 0xff and 0x0 are valid floats, but were
thinking in 32-bit granularity, not 8-bit.

--
Zbigniew

> 
> If you want to avoid 0xff or 0x0 I think this logic would work:
> 
> memset(compute_input, rand() % 254 + 1, size);

> 
> >  
> >  		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
> >  
> > -- 
> > 2.43.0
> > 

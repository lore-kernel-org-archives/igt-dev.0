Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F9ACD3436
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 10:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61B610ED3C;
	Wed,  6 May 2026 10:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DL4rEj2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997A910ED3C
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 10:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778063942; x=1809599942;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Hgh5e5MiSTbqHLIKgFE/2k3hDTF+R3wRpn0EtaXZFJ4=;
 b=DL4rEj2YK9iOurnhhth6xmrm4JFJTrq4QuxNSgjybxNCvQBUgki86gMm
 YuDMLB6ydOVDm0lV4wsBo4YXbW3OxpfSbuGLIB4/qQVWwmqs6nzz/M4wi
 Yopu2USuBokYWNdfKr3JHfgUkzEr8hbPUbDiwfUDZrB+SLeA69ngbWQ2C
 nG1NwOo/8GpOAcjEMkuC39njrkKs6s+DGr+JOMJnmKp0cNSlshPCPHJka
 /I1vZxGmm+4L2DT5CusgcEV/w3+0NQOjOZbFw0z6HEwh13qpKqGHGFleS
 ksi9qZHhR39Nsg3MBYVQscNbHvRLVyUvlhrlAtLZIH+8dxgNet/frsWEB w==;
X-CSE-ConnectionGUID: T12lACE0Qge4jse8/gi0Iw==
X-CSE-MsgGUID: cbNdm8jjQ8am+VAEmGYZxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="81556332"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="81556332"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 03:39:01 -0700
X-CSE-ConnectionGUID: AueDFtnlS6idttXcg3exSQ==
X-CSE-MsgGUID: NLPpbNvNSjyFkFBKzoVD7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="231724601"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 03:38:46 -0700
Date: Wed, 6 May 2026 12:38:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/xe_exec_system_allocator: Don't use NaN in
 an input buffer
Message-ID: <g2qgr3ml5glsmdwzxd75qcquiv4ea4igmgz6gc5hvcliqi7ask@667uhbsqymnc>
References: <20260504152820.3825451-2-zbigniew.kempczynski@intel.com>
 <afi8khq4u8hbAXrl@gsse-cloud1.jf.intel.com>
 <wst2lagw6o7nhkqbdgz736ehz5dwbfvhzld23aelxarvli6p63@lidk4ey5ocqf>
 <afsMTGPrWpqAEqKm@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afsMTGPrWpqAEqKm@fdugast-desk>
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

On Wed, May 06, 2026 at 11:39:35AM +0200, Francois Dugast wrote:
> On Mon, May 04, 2026 at 07:03:27PM +0200, Zbigniew Kempczyński wrote:
> > On Mon, May 04, 2026 at 08:34:42AM -0700, Matthew Brost wrote:
> > > On Mon, May 04, 2026 at 05:28:21PM +0200, Zbigniew Kempczyński wrote:
> > > > Setting input buffer memory to random byte (in this particular case
> > > > 0xff) and then use it as a float causes doing compute square on NaN
> > > > numbers. It's nothing wrong about this but comparing NaN in between
> > > > returns false according to IEEE-754 rules. Buffer compare function
> > > > does assertion if output is not equal to expected output so we hit
> > > > this randomly in 'eu-fault*' tests.
> > > > 
> > > > Replace memset to loop which sets all input floats to real numbers
> > > > thus avoiding NaN arithmetic and comparison.
> > > > 
> > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > ---
> > > >  tests/intel/xe_exec_system_allocator.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > > > index 5580099f78..0f1d6ee9c7 100644
> > > > --- a/tests/intel/xe_exec_system_allocator.c
> > > > +++ b/tests/intel/xe_exec_system_allocator.c
> > > > @@ -2339,7 +2339,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> > > >  		igt_assert(compute_input);
> > > >  		env.input_addr = to_user_pointer(compute_input);
> > > >  
> > > > -		memset(compute_input, rand() % 255 + 1, size);
> > > > +		for (int j = 0; j < env.array_size; j++)
> > > > +			compute_input[j] = rand() / (float)RAND_MAX;
> > > 
> > > This logic can still get 0xff or 0x0...
> > 
> > And this logic is fine as 0xff and 0x0 are valid floats, but were
> > thinking in 32-bit granularity, not 8-bit.
> 
> For consistency we could do the same in test_compute_square_userenv().

There floats are valid (casted from integers) so I left them intact.

--
Zbigniew

> 
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > If you want to avoid 0xff or 0x0 I think this logic would work:
> > > 
> > > memset(compute_input, rand() % 254 + 1, size);
> > 
> > > 
> > > >  
> > > >  		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
> > > >  
> > > > -- 
> > > > 2.43.0
> > > > 

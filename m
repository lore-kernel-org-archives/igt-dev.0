Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425AAC27C44
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 15:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ACD11209C;
	Wed, 29 May 2024 15:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="es5tK+J0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02210E260
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716995725; x=1748531725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eqOYPFyNRxBT4G5bmA9gKPOPsvkvWjik2TR59ruo0pY=;
 b=es5tK+J0qGhodOKfEFX4YNOAGUcYObGfBUXRi52jEyB156eFY/5F/7wp
 IEV39N4xOKdkh43BWeMdtEz1mDhKenuZnkiI6nH4h/3eHeIqAJBdhyfvg
 XIf3EvkzJQYniu/H2OJye7Jrhig0NrDqT2JNE4LfYWtzkK/B9c/mgOH0F
 yXtSntmXRE0O0jPHJAjAgdP5gXGLH/PFu7RO1qCxhVyYT+UWEgli7/pN6
 ca3qNQRQbYZ0Rn0/9AH5eGbg8yYpayZfrU/awbOuWp5MG4GplR1viAk+t
 dWz3WLkWgHyaUSHdLAwLLIE4FxPRFirPQ1emKJVwubFR+q5E9TRjJXRzh g==;
X-CSE-ConnectionGUID: Z5fxa4COTZ6YCPB8TscdIg==
X-CSE-MsgGUID: 5CJolwcSQu6l1qXBXo42Bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30908760"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="30908760"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 08:15:24 -0700
X-CSE-ConnectionGUID: Va8Jrxa7Q8KbyxCFvqrvdg==
X-CSE-MsgGUID: Z6LNgeKfSfu62a3VwP8Uqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35942403"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 08:15:24 -0700
Date: Wed, 29 May 2024 17:15:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t 2/5] tests/fbdev: Add testplan documentation
Message-ID: <20240529151521.afff3h7hwteig6p2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
 <20240528054223.2945356-3-bhanuprakash.modem@intel.com>
 <20240528153918.sndsnr4k3vn2r526@kamilkon-DESK.igk.intel.com>
 <b0ed31c3-c492-41d5-a88d-4f47c611991c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0ed31c3-c492-41d5-a88d-4f47c611991c@intel.com>
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

Hi Bhanuprakash,
On 2024-05-29 at 17:04:07 +0530, Modem, Bhanuprakash wrote:
> Hi Kamil,
> 
> On 28-05-2024 09:09 pm, Kamil Konieczny wrote:
> > Hi Bhanuprakash,
> > On 2024-05-28 at 11:12:20 +0530, Bhanuprakash Modem wrote:
> > > Add testplan documentation to fbdev tests.
> > > 
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > ---
> > >   tests/fbdev.c | 39 +++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 39 insertions(+)
> > > 
> > > diff --git a/tests/fbdev.c b/tests/fbdev.c
> > > index 794882a6a..f329e6ac6 100644
> > > --- a/tests/fbdev.c
> > > +++ b/tests/fbdev.c
> > > @@ -21,6 +21,15 @@
> > >    * IN THE SOFTWARE.
> > >    */
> > > +/**
> > > + * TEST: fbdev
> > > + * Category: Display
> > > + * Description: Sanity test for framebuffer device.
> > > + * Driver requirement: i915, xe
> > 
> > I am not sure we need it? I mean it can run on all gpus,
> > not only Intel?
> 
> "Driver requirement" is Intel thing to differentiate between i915 & xe
> specific tests (As few kms tests contains both i915 & xe specific subtests
> in same test file).
> 

Ok.

> > 
> > > + * Functionality: fbdev
> > > + * Mega feature: General Display Features
> > > + * Test category: functionality test
> > 
> > Please sort these fields after other tests, see recent Kasia
> > patchseries or look into other kms tests.
> 
> These fields are already sorted alphabetically. We are using the same style
> for entire KMS tests.
> 

Ok.

> > 
> > Could you also fix this test? After merging locally your
> > patchset I got errors from 'meson test -C build':
> 
> This issue is not seen in my local/CI:
> https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59210298
> 
> Ok:                 423
> Expected Fail:      4
> Fail:               0
> Unexpected Pass:    0
> Skipped:            0
> Timeout:            0
> 

Hmm, something strange happens on my system, now I see timouts.

> > 
> > It turns out test uses in igt_main:
> > 
> > igt_subtest_group {
> >      mode_tests(fd);
> > }
> > 
> > and then defines subtests in functions. That is causing test failing.
> 
> I guess, that kind of implementation is legal in IGT.
> 
> - Bhanu
> 

Yes, sorry for wrong alarm.

Patch itself looks ok so:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> > 
> > Regards,
> > Kamil
> > 
> > 
> > > + */
> > >   #include "config.h"
> > >   #include "igt.h"
> > > @@ -39,6 +48,36 @@
> > >   #include "igt.h"
> > > +/**
> > > + * SUBTEST: eof
> > > + * Description: Check framebuffer access near EOF
> > > + *
> > > + * SUBTEST: info
> > > + * Description: Check if screeninfo is valid
> > > + *
> > > + * SUBTEST: nullptr
> > > + * Description: Check framebuffer access with NULL
> > > + *
> > > + * SUBTEST: pan
> > > + * Description: Check panning / page flipping
> > > + *
> > > + * SUBTEST: read
> > > + * Description: Check read operations on framebuffer memory
> > > + *
> > > + * SUBTEST: write
> > > + * Description: Check write operations on framebuffer memory
> > > + */
> > > +
> > > +/**
> > > + * SUBTEST: unaligned-%s
> > > + * Description: Check %arg[1] operations on unaligned locations in framebuffer memory
> > > + *
> > > + * arg[1]:
> > > + *
> > > + * @read:	read
> > > + * @write:	write
> > > + */
> > > +
> > >   #define PANSTEP(panstep_) \
> > >   	((panstep_) ? (panstep_) : 1)
> > > -- 
> > > 2.43.2
> > > 

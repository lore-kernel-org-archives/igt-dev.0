Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B33DC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 06:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DACD10E247;
	Fri,  1 Mar 2024 06:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+jtUKyv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADF110E247
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709276111; x=1740812111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LH1r+L9sWx9e+8y5EhblLtIIe2sCZhmjHKG1oyMnCYs=;
 b=h+jtUKyvn4NspjSSUDR1ltCUmdQym/3H5H3CLhCp4Q6Kbi6sXgOIATdZ
 lH/18dYLyGsj7HC7VY+jjUIGWYZS1ZMg1WXUzVAgvogbBm5BiiAWVKD2F
 hHqj2Bl0HUR13b34I0kPAaqg/Cw5M/ADIkI0ubJc8ZVWJbTQx3Wc7oG4A
 K7Cp0Uo/Bu09N8656y/zzn0VtXGKiNp6jclFShOlQ0R8G41SQe1m0x1Ev
 rbyK+TurJiJ0KIjVPzo/hV1rOo3OLo/jcJa897htsD6mm37KiqtLUx5bj
 fFS9wKToc/amuydBnnnVogwZCetA21azVgdPE27ShQr+H2YcV8CNVqOiv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3686993"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3686993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 22:55:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8346972"
Received: from nelron-mobl.ger.corp.intel.com (HELO localhost) ([10.245.96.29])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 22:55:09 -0800
Date: Fri, 1 Mar 2024 07:55:05 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] lib/rendercopy: Fix Xe2 pixel shader
Message-ID: <20240301065505.slhzzigrsmotccg5@zkempczy-mobl2>
References: <20240226114511.51753-1-zbigniew.kempczynski@intel.com>
 <367b3870-47cb-4d02-b836-06d0ed662868@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <367b3870-47cb-4d02-b836-06d0ed662868@gmail.com>
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

On Thu, Feb 29, 2024 at 07:06:43PM +0200, Juha-Pekka Heikkila wrote:
> I was all evening reading the spec and comparing code but I didn't also find
> place which would point this change in spec. I suspect it relate to that
> simd mode change when compare to those older shaders. I agree with the
> change as the code works but I'll still try to figure out where this is
> coming from.

Lionel suggested in offline discussion that there's alternative
- switching from barycentric to pixel positions (subspans are passed
in r1 or r0.10-13(Xe2)). Finally faster was for me to dump and
examine r6 content. Comparing to Xe and previous platforms something
changed how VUE is unpacked to r6.

Right now I'm preparing series with xe_render_copy which exercises
copying using different positions so detecting shader is not fully
correct should be easier.

Thank you for the review.

--
Zbigniew

> 
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> On 26.2.2024 13.45, Zbigniew Kempczyński wrote:
> > On Xe2 start and coefficient for barycentric positions are passed
> > in different location of grf register (r6). I wasn't able to find
> > this information explicitly in the documentation so I've dumped
> > all registers involved in the operation and deduce r6 values
> > meaning. This means I may be wrong but tests which are previously
> > failing on render-copy now are working fine.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> > ---
> >   lib/i915/shaders/ps/gen20_render_copy.asm | 4 ++--
> >   lib/rendercopy_gen9.c                     | 4 ++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/lib/i915/shaders/ps/gen20_render_copy.asm b/lib/i915/shaders/ps/gen20_render_copy.asm
> > index 330417966d..48057f441e 100644
> > --- a/lib/i915/shaders/ps/gen20_render_copy.asm
> > +++ b/lib/i915/shaders/ps/gen20_render_copy.asm
> > @@ -1,7 +1,7 @@
> >   L0:
> > -(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f      r1.0<1;1>:f       r6.0<0>:f
> > +(W)     mad (16|M0)              acc0.0<1>:f   r6.0<0;0>:f      r1.0<1;1>:f       r6.6<0>:f
> >   (W)     mad (16|M0)              r113.0<1>:f   acc0.0<1;1>:f    r1.0<1;1>:f       r6.1<0>:f
> > -(W)     mad (16|M0)              acc0.0<1>:f   r6.7<0;0>:f      r1.0<1;1>:f       r6.4<0>:f
> > +(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f      r1.0<1;1>:f       r6.4<0>:f
> >   (W)     mad (16|M0)              r114.0<1>:f   acc0.0<1;1>:f    r2.0<1;1>:f       r6.5<0>:f
> >   (W)     send.smpl (16|M0)        r12      r113  null:0  0x0            0x04420001           {F@1,$0} // wr:2+0, rd:4; simd16 sample:u+v+r+ai+mlod using sampler index 0
> >   (W)     send.rc (16|M0)          null     r12   null:0  0x0            0x08031400           {EOT,$0} // wr:4+0, rd:0; full-precision render target write SIMD16; last render target to surface 0
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index a4220d78da..dd5f1dd448 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -138,9 +138,9 @@ static const uint32_t gen12p71_render_copy[][4] = {
> >   };
> >   static const uint32_t xe2_render_copy[][4] = {
> > -	{ 0x8010005b, 0x200002a0, 0x020a0634, 0x06040105 },
> > +	{ 0x8010005b, 0x200002a0, 0x020a0604, 0x06640105 },
> >   	{ 0x8010005b, 0x710402a8, 0x020a2001, 0x06140105 },
> > -	{ 0x8010005b, 0x200002a0, 0x020a0674, 0x06440105 },
> > +	{ 0x8010005b, 0x200002a0, 0x020a0634, 0x06440105 },
> >   	{ 0x8010005b, 0x720402a8, 0x020a2001, 0x06540205 },
> >   	{ 0x80122031, 0x0c240000, 0x20027114, 0x00800000 },
> >   	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
> 

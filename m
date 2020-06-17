Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDF26E12A
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2020 07:24:36 +0000 (UTC)
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
Date: Wed, 17 Jun 2020 07:24:31 +0000
Message-ID: <E92BA18FDE0A5B43B7B3DA7FCA031286058E6450@BGSMSX107.gar.corp.intel.com>
References: <20200615051848.24654-1-pankaj.laxminarayan.bharadiya@intel.com>
 <159221779728.2981.5003242667494244561@build.alporthouse.com>
In-Reply-To: <159221779728.2981.5003242667494244561@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] lib/rendercopy: Specify the correct vertex
 buffer offset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Wilson, Chris P" <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: 15 June 2020 16:13
> To: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>; igt-dev@lists.freedesktop.org;
> Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Subject: Re: [igt-dev] [i-g-t] lib/rendercopy: Specify the correct vertex buffer
> offset
> 
> Quoting Pankaj Bharadiya (2020-06-15 06:18:48)
> > We must specify the correct vertex buffer offset as "End Offset
> > Enable" bit is not enabled in 3DPRIMITIVE instruction.
> >
> > This fixes below fatal error:
> >
> >  [FATAL]:
> >  ***** **** *** ** * FATAL * ** *** **** *****  StateArbiter>Surface
> > State Pointers in the binding table must be 64 byte aligned.
> >  Be sure that the binding table is set up correctly. Address found:
> > 6b6b6b6b
> >  ***** **** *** ** END FATAL ** *** **** *****
> 
> That is nothing to do with vertex offset. That says as it read the binding table, it
> dereferenced the scratch page.

With this patch, the fatal error disappeared (for kms_big_fb, kms_cursor_crc tests)
on the newer platform so I thought it could be a possible fix.

As I understood from the spec, we should provide the correct vertex buffer offset to 
3DPRIMITIVE instruction, but this affecting gem_render_linear_blits,
gem_render_tiled_blits and  kms_frontbuffer_tracking tests.

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/index.html? 

Any suggestion on how to debug this issue further? I tried dumping content of
batchbuffer but could not find the 6b6b6b6b address in dump.

Thanks,
Pankaj

> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

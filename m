Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582E76EC6F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2020 14:37:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id o2so6154541wmh.2
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2020 07:37:40 -0700 (PDT)
Date: Fri, 10 Jul 2020 11:37:31 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <20200710143654.l2zwv2hd243qqypp@smtp.gmail.com>
References: <20200706155059.ulofxodc2gee2fz7@smtp.gmail.com>
 <20200707150750.62zmal6s45njyxet@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707150750.62zmal6s45njyxet@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: remove extra parameters
 from igt_put_cairo_ctx
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>, kernel-usp@googlegroups.com, igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

On 07/07, Arkadiusz Hiler wrote:
> On Mon, Jul 06, 2020 at 12:50:59PM -0300, Melissa Wen wrote:
> > The function igt_put_cairo_ctx currently requires three parameters, but only
> > one of them is used in it. This patch removes the useless parameters, making
> > the code more readable and cohesive. It also applies the change to all
> > occurrences of the function in the code.
> > 
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> 
> Thanks for the patch, it's merged now :-)
> 
> For similar refactors you may find coccinelle[0] handy.
> 
> There's some examples in lib/igt.cocci + a few people use that tool to
> do the changes and posted the cocci patch as a part of the commit message.
> e.g.: 7ff35cc1d0b3 ("lib/igt_buf: Extend igt_buf to include two color surfaces")
> 
> [0]: http://coccinelle.lip6.fr/
> 
Hi Arek,

Thanks for reviewing. I'll try Coccinelle next time.

I sent two other patchsets (one for documentation and another with minor
fixes in the kms_cursor_crc test) that stuck. They succeeded at
CI.BAT and failed at CI.IGT; however, the failures look like a false
positive.

https://patchwork.freedesktop.org/series/78814/
https://patchwork.freedesktop.org/series/78813/

Do you mind taking a look and giving me some feedback?

Thanks in advance,

Melissa
> -- 
> Cheers,
> Arek
> 
> -- 
> You received this message because you are subscribed to the Google Groups "Kernel USP" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-usp+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kernel-usp/20200707150750.62zmal6s45njyxet%40ahiler-desk1.fi.intel.com.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

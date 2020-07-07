Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945FB89F3B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2020 15:07:55 +0000 (UTC)
Date: Tue, 7 Jul 2020 18:07:50 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200707150750.62zmal6s45njyxet@ahiler-desk1.fi.intel.com>
References: <20200706155059.ulofxodc2gee2fz7@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706155059.ulofxodc2gee2fz7@smtp.gmail.com>
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
To: Melissa Wen <melissa.srw@gmail.com>
Cc: Petri Latvala <petri.latvala@intel.com>, kernel-usp@googlegroups.com, igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 06, 2020 at 12:50:59PM -0300, Melissa Wen wrote:
> The function igt_put_cairo_ctx currently requires three parameters, but only
> one of them is used in it. This patch removes the useless parameters, making
> the code more readable and cohesive. It also applies the change to all
> occurrences of the function in the code.
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Thanks for the patch, it's merged now :-)

For similar refactors you may find coccinelle[0] handy.

There's some examples in lib/igt.cocci + a few people use that tool to
do the changes and posted the cocci patch as a part of the commit message.
e.g.: 7ff35cc1d0b3 ("lib/igt_buf: Extend igt_buf to include two color surfaces")

[0]: http://coccinelle.lip6.fr/

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815A36E92F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 15:59:27 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id f84so9002446ybg.0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 08:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163902.366168-13-jason@jlekstrand.net>
 <87czsl2v2q.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87czsl2v2q.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 10:59:15 -0500
Message-ID: <CAOFGe97tBGJqpY4D1AVuxwjqpTxvTYERi70kYKnUNx0UxTZr6w@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 62/77] tests/i915/gem_workarounds:
 Convert to intel_ctx_t
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 7:28 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Mon, 14 Jun 2021 09:38:47 -0700, Jason Ekstrand wrote:
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>
> Just to make sure, this would have worked with the previous code too
> (i.e. without this patch), correct, using .ctx_id for igt_spin_new? What
> then is the reason for this patch, is it that intel_ctx_0 is preferred?

A context is required for SPIN_POLL_RUN.  We could, in theory, make
NULL work by just subbing in intel_ctx_0() but it's nicer to be
explicit when we can, IMO.

--Jason

> Anyway the patch is fine so:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

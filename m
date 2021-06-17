Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD16C6E92F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 15:56:52 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id e10so8925316ybb.7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 08:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210614163704.365989-4-jason@jlekstrand.net>
 <20210616165724.480899-1-jason@jlekstrand.net>
 <87fsxh2y4l.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87fsxh2y4l.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 10:56:40 -0500
Message-ID: <CAOFGe94v7D3bkAgmDiC=qooEkVVLTeWFRvr+MkOCxxB7iWLz7A@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_shrink: Convert to
 intel_ctx_t (v3)
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

On Wed, Jun 16, 2021 at 6:22 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Wed, 16 Jun 2021 09:57:24 -0700, Jason Ekstrand wrote:
> >
> > @@ -185,13 +188,16 @@ static void execbufX(int fd, uint64_t alloc)
> >
> >               execbuf.buffers_ptr = to_user_pointer(&obj[j]);
> >               execbuf.buffer_count = i + 1;
> > -             execbuf.flags = engines[j % nengine];
> > +             execbuf.flags = engines.engines[i % engines.nengines].flags;
>
> Should this be [j % engines.nengines]?

Yup.  Good catch.

> Apart from this, this is:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks!
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

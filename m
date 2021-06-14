Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8D089DD5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 14:55:08 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id b9so15834851ybg.10
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 07:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210609173632.248880-1-jason@jlekstrand.net>
 <20210609173632.248880-24-jason@jlekstrand.net>
 <87sg1nn93y.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87sg1nn93y.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 09:54:56 -0500
Message-ID: <CAOFGe96cySD5Bn2ZNKnvB2Hta-tDv6A-KdSFns9-rc0QXzfcJA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 23/93] tests/i915/gem_exec_reloc:
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

On Fri, Jun 11, 2021 at 9:08 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Wed, 09 Jun 2021 10:36:06 -0700, Jason Ekstrand wrote:
> >
> > @@ -1481,6 +1498,11 @@ igt_main
> >               igt_require_gem(fd);
> >               /* Check if relocations supported by platform */
> >               igt_require(gem_has_relocations(fd));
> > +
> > +             if (gem_has_contexts(fd))
> > +                     ctx = intel_ctx_create_all_physical(fd);
> > +             else
> > +                     ctx = intel_ctx_0(fd);
>
> This if/else is not needed, intel_ctx_create_all_physical() already does
> this.

Yup.  This must have been converted before I made
intel_ctx_create_all_physical() do that.  Fixed locally.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

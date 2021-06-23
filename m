Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04AA6E0A2
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jun 2021 05:29:20 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id bm25so2327614qkb.0
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 22:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163902.366168-18-jason@jlekstrand.net>
 <87k0mu5wly.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87k0mu5wly.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 23 Jun 2021 00:29:09 -0500
Message-ID: <CAOFGe94KDZYEgaatQA0NR7J1s7rgW5YKnFE-7-eCokeaUYTRYQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 67/77] tests/i915/gem_mmap_gtt: Convert
 to intel_ctx_t
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

On Tue, Jun 15, 2021 at 10:14 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Mon, 14 Jun 2021 09:38:52 -0700, Jason Ekstrand wrote:
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>
> There is also a change to tests/i915/i915_query.c included here but I guess
> that is ok.
>
> It is the changes to gem_mmap_gtt which started me wondering why they were
> made and whether intel_ctx_t is always needed for the spinner/dummyload. So
> yes these are fine.

I've split it into two patches and put your R-B on both.  I hope that's ok.

> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks!
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

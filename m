Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345806EA5D
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jun 2021 17:43:35 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id i4so6365081ybe.2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jun 2021 10:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210617191256.577244-1-jason@jlekstrand.net>
 <20210617191516.577394-29-jason@jlekstrand.net>
 <87eecp8n8o.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87eecp8n8o.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 30 Jun 2021 12:43:22 -0500
Message-ID: <CAOFGe975Mzdt=soMwiYe6aRnO70pc65=QNaywhLzD+T=8EeO6Q@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 78/79] tests/i915/gem_exec_balancer: Fix
 invalid-balancer for the set-once rule
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

On Fri, Jun 25, 2021 at 7:48 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Thu, 17 Jun 2021 12:15:15 -0700, Jason Ekstrand wrote:
> >
> > Upstream i915 is going to start only allowing CONTEXT_PARAM_ENGINES to
> > be set once on any given context.  This means we need to create a new
> > context for every setparam in the test.
>
> Will the previous code actually not work since we have not done any
> submission (I thought the context was mutable till the first submission)?

At Daniel's request, I changed it so you can set engines at most once.
It allows us to simplify the kernel code a bit.

> In any case the patch is fine, so this:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

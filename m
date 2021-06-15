Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121EC89DC9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 18:10:18 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id g38so21810461ybi.12
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 11:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163704.365989-3-jason@jlekstrand.net>
 <87zgvr3n5f.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87zgvr3n5f.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 15 Jun 2021 13:10:06 -0500
Message-ID: <CAOFGe97MAZDOExTYqe8dZCM9YbOBhXS1XB3tbaROg5iA4Ci-3w@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 02/77] tests/i915/gem_exec_fence:
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

On Mon, Jun 14, 2021 at 8:57 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Mon, 14 Jun 2021 09:36:17 -0700, Jason Ekstrand wrote:
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  tests/i915/gem_exec_fence.c | 241 +++++++++++++++++++++---------------
> >  1 file changed, 139 insertions(+), 102 deletions(-)
>
> Hard to verify that nothing is broken since it seems this test is
> blacklisted in CI but I couldn't find anything missing. Therefore:

Just so you know, I did attempt to run every test I touched on the
Skull Canyon NUC I've got sitting here in my home office, even the
ones that aren't in CI.  That doesn't give 100% confidence that I
didn't break anything, of course, but it should give some.

--Jason

> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

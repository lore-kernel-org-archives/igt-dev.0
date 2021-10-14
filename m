Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A956EC1F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 07:27:05 +0000 (UTC)
Date: Thu, 14 Oct 2021 09:27:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211014072700.GC3617@zkempczy-mobl2>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
 <20211008065432.15482-4-zbigniew.kempczynski@intel.com>
 <877degi6rv.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877degi6rv.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/7] tests/gem_exec_alignment: Add
 prerequisite alignment condition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 09:12:36PM -0700, Dixit, Ashutosh wrote:
> On Thu, 07 Oct 2021 23:54:28 -0700, Zbigniew Kempczyński wrote:
> >
> > Skip the test if the kernel doesn't support passing object alignment.
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  tests/i915/gem_exec_alignment.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
> > index c4611bd1e..f40b391c9 100644
> > --- a/tests/i915/gem_exec_alignment.c
> > +++ b/tests/i915/gem_exec_alignment.c
> > @@ -530,6 +530,7 @@ igt_main
> >	igt_fixture {
> >		fd = drm_open_driver(DRIVER_INTEL);
> >		igt_require_gem(fd);
> > +		igt_require(gem_allows_passing_alignment(fd));
> 
> How about renaming this function something like gem_allows_obj_alignment?
> Otherwise this is:

Yes, I like this name - it is much better than mine. I'll fix and resend.

--
Zbigniew

> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

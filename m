Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D510E243
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 12:16:02 +0000 (UTC)
Date: Mon, 25 Sep 2023 14:15:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230925121556.pyc2uunjbtm5hu27@kamilkon-desk.igk.intel.com>
References: <20230921224422.55121-1-robdclark@gmail.com>
 <20230922123457.woa7xvcb52xsozoz@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230922123457.woa7xvcb52xsozoz@kamilkon-desk.igk.intel.com>
Subject: Re: [igt-dev] [PATCH] core_getversion: Test for desired device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-09-22 at 14:35:01 +0200, Kamil Konieczny wrote:
> Hi Rob,
> 
> On 2023-09-21 at 15:44:22 -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > We discovered in drm/ci that if the drm device fails to probe, all the
> > tests come back as "Skip", and the job is considered successful.  So fix
> -------------------------- ^^^^^ ---------------------------------^
> No comma before "and", s/, and/ and/, also use only one space separator
> after end of statement,  s/.  So/. So/. As a side note, it is better to
> avoid starting with "So", better:
> 
> Fixed getversion test ...
> 
> > the getversion test to fail if there is no drm device, or if the drm
> ------------------------------------------------------ ^
> s/, or/ or/
> 
> > device does not match the expected device.
> 
> Please write also that you used new enviroment var IGT_REQUIRED_DRIVERS
> for that purpose.
> 
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  tests/core_getversion.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> > index 32cb976e4923..e5416993d7a3 100644
> > --- a/tests/core_getversion.c
> > +++ b/tests/core_getversion.c
> > @@ -48,14 +48,18 @@ igt_simple_main
> >  {
> >  	int fd;
> >  	drmVersionPtr v;
> > +	const char *name = getenv("IGT_REQUIRED_DRIVERS");
> >  
> > -	fd = drm_open_driver(DRIVER_ANY);
> > +	fd = __drm_open_driver(DRIVER_ANY);
> > +	igt_assert_fd(fd);
> >  	v = drmGetVersion(fd);
> >  	igt_assert_neq(strlen(v->name), 0);
> >  	igt_assert_neq(strlen(v->date), 0);
> >  	igt_assert_neq(strlen(v->desc), 0);
> >  	if (is_i915_device(fd))
> >  		igt_assert_lte(1, v->version_major);
> > +	if (name)
> > +		igt_assert_eq(strcmp(name, v->name), 0);
> ------------------ ^
> Better for debug would be:
> 		igt_assert_f(!strcmp(name, v->name), "Expected driver: %s but got: %s\n", name, v->name);
-------------------- ^

This should be:
 		igt_assert_f(strcmp(name, v->name), "Expected driver: %s but got: %s\n", name, v->name);

Regards,
Kamil

> 
> Regards,
> Kamil
> 
> >  
> >  	drmFree(v);
> >  	drm_close_driver(fd);
> > -- 
> > 2.41.0
> > 

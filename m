Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4E510E5D8
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 07:42:19 +0000 (UTC)
Date: Thu, 28 Sep 2023 09:41:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230928074149.42435c6p3324anah@kamilkon-desk.igk.intel.com>
References: <20230926184748.199187-1-robdclark@gmail.com>
 <20230926184748.199187-3-robdclark@gmail.com>
 <b4fcc0fd-9129-c13b-3801-253ecb3677b4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b4fcc0fd-9129-c13b-3801-253ecb3677b4@collabora.com>
Subject: Re: [igt-dev] [PATCH v3 3/3] core_getversion: Test for desired
 device
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

Hi Helen,
On 2023-09-27 at 19:24:35 -0300, Helen Koike wrote:
> 
> 
> On 26/09/2023 15:47, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > We discovered in drm/ci that if the drm device fails to probe, all the
> > tests come back as "Skip" and the job is considered successful. Fix
> > the getversion test to fail if there is no drm device or if the drm
> > device does not match the expected device as specified by the optional
> > IGT_REQUIRED_DRIVER environment variable.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Acked-by: Helen Koike <helen.koike@collabora.com>
> > ---
> >   tests/core_getversion.c | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> > index 32cb976e4923..b298a6890ef9 100644
> > --- a/tests/core_getversion.c
> > +++ b/tests/core_getversion.c
> > @@ -48,14 +48,25 @@ igt_simple_main
> >   {
> >   	int fd;
> >   	drmVersionPtr v;
> > +	const char *name = getenv("IGT_REQUIRED_DRIVER");
---------------------------------------^^^^^^^^

Maybe better name would be IGT_EXPECTED_DRIVER? Or if this is
enviroment var for only this one test, maybe

IGT_CORE_GETVERSION_EXPECTED

> 
> Btw, In drm/ci we are using IGT_FORCE_DRIVER
> 
> https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/ci/igt_runner.sh#n6
> 
> You could use the same name here so we don't need to patch drm/ci (but
> patching there is not a issue as well, so feel free to ignore this comment
> and just chose the best name).
> 
> Regards,
> Helen

If used IGT_FORCE_DRIVER in CI or tests we may as well drop
line:
		chipset = drm_find_chipset(name);

and just use DRIVER_ANY:

    fd = drm_open_driver(DRIVER_ANY);

as in all kms tests.

Regards,
Kamil

> 
> > +	int chipset = DRIVER_ANY;
> > -	fd = drm_open_driver(DRIVER_ANY);
> > +	if (name)
> > +		chipset = drm_find_chipset(name);
> > +
> > +	fd = __drm_open_driver(chipset);
> > +	igt_assert_fd(fd);
> >   	v = drmGetVersion(fd);
> >   	igt_assert_neq(strlen(v->name), 0);
> >   	igt_assert_neq(strlen(v->date), 0);
> >   	igt_assert_neq(strlen(v->desc), 0);
> >   	if (is_i915_device(fd))
> >   		igt_assert_lte(1, v->version_major);
> > +	if (name) {
> > +		igt_assert_f(!strcmp(name, v->name),
> > +			     "Expected driver \"%s\" but got \"%s\"\n",
> > +			     name, v->name);
> > +	}
> >   	drmFree(v);
> >   	drm_close_driver(fd);

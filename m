Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF0610E393
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 17:44:23 +0000 (UTC)
Date: Tue, 6 Jun 2023 19:44:15 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <ZH9wb0wNTcCHWDb7@ashyti-mobl2.lan>
References: <20230606095123.476130-1-andi.shyti@linux.intel.com>
 <20230606095123.476130-2-andi.shyti@linux.intel.com>
 <ZH8forcqQ96JDrK8@ashyti-mobl2.lan>
 <20230606160955.4k3u2tbk3iypijgt@kamilkon-desk1>
 <ZH9vhh+LkFY7SQgP@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH9vhh+LkFY7SQgP@ashyti-mobl2.lan>
Subject: Re: [igt-dev] [PATCH v2 1/1] test/gem_create: limit set_pat to
 GEN12+ platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

> > > >  tests/i915/gem_create.c | 8 +++++++-
> > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> > > > index e9e8216d2b..a3428e5890 100644
> > > > --- a/tests/i915/gem_create.c
> > > > +++ b/tests/i915/gem_create.c
> > > > @@ -657,6 +657,7 @@ static void create_ext_set_pat(int fd)
> > > >  		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> > > >  		.pat_index = 65,
> > > >  	};
> > > > +	uint32_t devid = intel_get_drm_devid(fd);
> > > >  	struct drm_i915_gem_caching arg;
> > > >  	uint64_t size;
> > > >  	uint32_t handle;
> > > > @@ -670,8 +671,13 @@ static void create_ext_set_pat(int fd)
> > > >  	 * With a valid PAT index specified, returning -EINVAL here
> > > >  	 * indicates set_pat extension is not supported
> > > >  	 */
> > > > -	if (ret == -EINVAL)
> > > > +	if (!IS_METEORLAKE(devid)) {
> > 
> > Put here
> > 		if (ret == -EINVAL)
> > 			igt_skip("EXT_SET_PAT unsupported\n");
> > 
> > > > +		igt_assert(ret == -ENODEV);
> > -------------------------^ ------- ^
> > On unsupported or older driver this returns -22 (-EINVAL),
> > I tested on Skylake gen9 iGPU. Btw better use:
> 
> It's not merged yet. Once the patch will be merged then we will
> have -ENODEV.

In the kernel this will be:

+	/* Limiting the extension only to Meteor Lake */
+	if (!IS_METEORLAKE(i915))
+		return -ENODEV;

But it's not merged yet.

Andi

> -EINVAL comes from future old kernels that don't have this api
> merged.
> 
> Anyway, makes sense to check for -EINVAL first.
> 
> Thanks for the review, will send v3 soon.
> 
> Andi

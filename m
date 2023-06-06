Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A6810E391
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 17:40:43 +0000 (UTC)
Date: Tue, 6 Jun 2023 19:40:22 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 IGT dev <igt-dev@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Fei Yang <fei.yang@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Message-ID: <ZH9vhh+LkFY7SQgP@ashyti-mobl2.lan>
References: <20230606095123.476130-1-andi.shyti@linux.intel.com>
 <20230606095123.476130-2-andi.shyti@linux.intel.com>
 <ZH8forcqQ96JDrK8@ashyti-mobl2.lan>
 <20230606160955.4k3u2tbk3iypijgt@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606160955.4k3u2tbk3iypijgt@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH v2 1/1] test/gem_create: limit set_pat to
 GEN12+ platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

On Tue, Jun 06, 2023 at 06:09:55PM +0200, Kamil Konieczny wrote:
> Hi Andi,
> 
> On 2023-06-06 at 13:59:30 +0200, Andi Shyti wrote:
> > Hi Kamil,
> > 
> > On Tue, Jun 06, 2023 at 11:51:23AM +0200, Andi Shyti wrote:
> > > From: Fei Yang <fei.yang@intel.com>
> > > 
> > > For platforms prior to GEN12 the set_pat extension should
> ----------------- ^ ------ ^
> imho this also should be:
> s/prior to GEN12/other than MTL/
> 
> as you enabled test only for MTL now.
> 
> > > return -ENODEV.
> > > 
> > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > 
> > I forgot:
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com> 
> > 
> > and also the title is wrong. May I kindly ask you to update it
> > to:
> > 
> >    "test/gem_create: limit set_pat to Meteor Lake platforms"
> > 
> > Otherwise, if you prefer, I can resend it.
> > 
> > Andi
> > 
> > > ---
> > >  tests/i915/gem_create.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> > > index e9e8216d2b..a3428e5890 100644
> > > --- a/tests/i915/gem_create.c
> > > +++ b/tests/i915/gem_create.c
> > > @@ -657,6 +657,7 @@ static void create_ext_set_pat(int fd)
> > >  		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> > >  		.pat_index = 65,
> > >  	};
> > > +	uint32_t devid = intel_get_drm_devid(fd);
> > >  	struct drm_i915_gem_caching arg;
> > >  	uint64_t size;
> > >  	uint32_t handle;
> > > @@ -670,8 +671,13 @@ static void create_ext_set_pat(int fd)
> > >  	 * With a valid PAT index specified, returning -EINVAL here
> > >  	 * indicates set_pat extension is not supported
> > >  	 */
> > > -	if (ret == -EINVAL)
> > > +	if (!IS_METEORLAKE(devid)) {
> 
> Put here
> 		if (ret == -EINVAL)
> 			igt_skip("EXT_SET_PAT unsupported\n");
> 
> > > +		igt_assert(ret == -ENODEV);
> -------------------------^ ------- ^
> On unsupported or older driver this returns -22 (-EINVAL),
> I tested on Skylake gen9 iGPU. Btw better use:

It's not merged yet. Once the patch will be merged then we will
have -ENODEV.

-EINVAL comes from future old kernels that don't have this api
merged.

Anyway, makes sense to check for -EINVAL first.

Thanks for the review, will send v3 soon.

Andi

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C3810E2C3
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 13:33:30 +0000 (UTC)
Date: Fri, 8 Dec 2023 14:33:20 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Pallavi Mishra <pallavi.mishra@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_create: sanity check all MBZ
 fields
Message-ID: <ZXMbIDIsYGiB2PoL@fdugast-desk.home>
References: <20231130171850.461941-1-matthew.auld@intel.com>
 <20231201145815.b74e75efkyvsrdst@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231201145815.b74e75efkyvsrdst@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
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

Hi Matt,

On Fri, Dec 01, 2023 at 03:58:15PM +0100, Kamil Konieczny wrote:
> Hi Matthew,
> On 2023-11-30 at 17:18:49 +0000, Matthew Auld wrote:
> > Explicitly check that all MBZ (must-be-zero) fields are currently
> > rejected, including the currently unused extensions.
> > 
> > v2: (Kamil)
> >   - Various improvements
> > 
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Please wait with merge or talk to Francios as he prepared xe-uapi change.
> 
> Regards,
> Kamil

Thanks for doing this, this is great and we should do this for all
structs. The test must be updated now that the pad is __u16 pad[3]
but after this is done, no reason to hold the merge from my side.

Francois

> 
> > ---
> >  tests/intel/xe_create.c | 59 +++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 54 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> > index bb55a15e1..986b078dd 100644
> > --- a/tests/intel/xe_create.c
> > +++ b/tests/intel/xe_create.c
> > @@ -18,6 +18,18 @@
> >  
> >  #define PAGE_SIZE 0x1000
> >  
> > +static int __ioctl_create(int fd, struct drm_xe_gem_create *create)
> > +{
> > +	int ret = 0;
> > +
> > +	if (igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, create)) {
> > +		ret = -errno;
> > +		errno = 0;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> >  		       uint32_t *handlep)
> >  {
> > @@ -27,14 +39,11 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> >  		.flags = flags,
> >  		.cpu_caching = __xe_default_cpu_caching_from_flags(fd, flags),
> >  	};
> > -	int ret = 0;
> > +	int ret;
> >  
> >  	igt_assert(handlep);
> >  
> > -	if (igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create)) {
> > -		ret = -errno;
> > -		errno = 0;
> > -	}
> > +	ret = __ioctl_create(fd, &create);
> >  	*handlep = create.handle;
> >  
> >  	return ret;
> > @@ -88,6 +97,43 @@ static void create_invalid_size(int fd)
> >  	xe_vm_destroy(fd, vm);
> >  }
> >  
> > +/**
> > + * SUBTEST: create-invalid-mbz
> > + * Functionality: ioctl
> > + * Test category: negative test
> > + * Description: Verifies xe bo create returns expected error code on all MBZ fields.
> > + */
> > +static void create_invalid_mbz(int fd)
> > +{
> > +	struct drm_xe_gem_create create = {
> > +		.size = PAGE_SIZE,
> > +		.flags = system_memory(fd),
> > +		.cpu_caching = DRM_XE_GEM_CPU_CACHING_WB,
> > +	};
> > +	int i;
> > +
> > +	/* Make sure the baseline passes */
> > +	igt_assert_eq(__ioctl_create(fd, &create), 0);
> > +	gem_close(fd, create.handle);
> > +	create.handle = 0;
> > +
> > +	/* No supported extensions yet */
> > +	create.extensions = -1;
> > +	igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
> > +	create.extensions = 0;
> > +
> > +	/* Make sure KMD rejects non-zero padding/reserved fields */
> > +	create.pad = -1;
> > +	igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
> > +	create.pad = 0;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(create.reserved); i++) {
> > +		create.reserved[i] = -1;
> > +		igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
> > +		create.reserved[i] = 0;
> > +	}
> > +}
> > +
> >  enum exec_queue_destroy {
> >  	NOLEAK,
> >  	LEAK
> > @@ -222,6 +268,9 @@ igt_main
> >  	igt_fixture
> >  		xe = drm_open_driver(DRIVER_XE);
> >  
> > +	igt_subtest("create-invalid-mbz")
> > +		create_invalid_mbz(xe);
> > +
> >  	igt_subtest("create-invalid-size") {
> >  		create_invalid_size(xe);
> >  	}
> > -- 
> > 2.43.0
> > 

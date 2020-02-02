Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1E86E0FE
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Feb 2020 18:24:55 +0000 (UTC)
Date: Sun, 2 Feb 2020 23:54:59 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20200202182459.GA30003@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
 <20200131173109.12527-4-ramalingam.c@intel.com>
 <8736bu6cv5.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8736bu6cv5.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/9] tests/prime_mmap_coherency: use
 device coherent mapping instead of mmap_gtt
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
Cc: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-01-31 at 22:27:42 -0800, Dixit, Ashutosh wrote:
> On Fri, 31 Jan 2020 09:31:03 -0800, Ramalingam C wrote:
> >
> > Since on new discrete GPUs we dont have the mappable aperture, if that
> > is acceptable for the test purpose, we should use GEM_MMAP_OFFSET.
> > Hence using gem_mmap_device_coherent() which wraps the mmap options in
> > the order of gem_mmap_offset / gem_mmap / mmap_gtt
> >
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >  tests/prime_mmap_coherency.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
> > index 39538767c68f..32d78ee1a771 100644
> > --- a/tests/prime_mmap_coherency.c
> > +++ b/tests/prime_mmap_coherency.c
> > @@ -69,7 +69,7 @@ static int test_read_flush(void)
> >
> >	/* STEP #3: write 0x11 into BO 1. */
> >	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
> > -	ptr_gtt = gem_mmap__gtt(fd, bo_2->handle, width * height, PROT_READ | PROT_WRITE);
> > +	ptr_gtt = gem_mmap__device_coherent(fd, bo_2->handle, 0, width * height, PROT_READ | PROT_WRITE);
> >	gem_set_domain(fd, bo_2->handle,
> >		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> >	memset(ptr_gtt, 0xc5, width * height);
> 
> I think the patch is ok but did you check if the test passes/fails on
> devices with/without a mappable aperture? I sort of expect it to always
> fail, at least with WC, but not sure if it ever passes with the GTT mapping
> (since we haven't done a clflush).
Subtest read fails at gem_mmap__gtt but with device_coherent mapping
the test is passing.

-Ram
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

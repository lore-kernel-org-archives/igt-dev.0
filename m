Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4B86E0FF
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Feb 2020 18:28:09 +0000 (UTC)
Date: Sun, 2 Feb 2020 23:58:12 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20200202182812.GB30003@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
 <20200131173109.12527-5-ramalingam.c@intel.com>
 <871rre6bhi.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871rre6bhi.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/9] tests/prime_mmap: use device
 coherent mapping instead of mmap_gtt
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

On 2020-01-31 at 22:57:29 -0800, Dixit, Ashutosh wrote:
> On Fri, 31 Jan 2020 09:31:04 -0800, Ramalingam C wrote:
> >
> > Since on new discrete GPUs we dont have the mappable aperture, if that
> > is acceptable for the test purpose, we should use GEM_MMAP_OFFSET.
> > Hence using gem_mmap_device_coherent() which wraps the mmap options in
> > the order of gem_mmap_offset / gem_mmap / mmap_gtt
> >
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >  tests/prime_mmap.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
> > index fc985784407b..1433424109c8 100644
> > --- a/tests/prime_mmap.c
> > +++ b/tests/prime_mmap.c
> > @@ -85,8 +85,8 @@ test_correct(void)
> >	dma_buf_fd = prime_handle_to_fd(fd, handle);
> >	igt_assert(errno == 0);
> >
> > -	/* Check correctness vs GEM_MMAP_GTT */
> > -	ptr1 = gem_mmap__gtt(fd, handle, BO_SIZE, PROT_READ);
> > +	/* Check correctness vs GEM_MMAP */
> > +	ptr1 = gem_mmap__device_coherent(fd, handle, 0, BO_SIZE, PROT_READ);
> 
> Once again, does this test pass with gtt mapping but fail with wc mapping?
> I thought gtt mapping also bypasses the cache like wc? What about prime
> mmap's? Can someone please confirm? Otherwise I will try to look.
Ashutosh,

At this test subtest test-correct is failing at gem_mmap__gtt, but
passes when we use device coherent mapping.

-Ram
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

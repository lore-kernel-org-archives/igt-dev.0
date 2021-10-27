Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056789973
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Oct 2021 12:43:14 +0000 (UTC)
Date: Wed, 27 Oct 2021 14:43:10 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211027124240.GA4524@zkempczy-mobl2>
References: <20211026082919.14135-1-zbigniew.kempczynski@intel.com>
 <8735onmsv8.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735onmsv8.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_sync: Use softpin path for
 no-reloc gens
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 26, 2021 at 01:30:19PM -0700, Dixit, Ashutosh wrote:
> On Tue, 26 Oct 2021 01:29:19 -0700, Zbigniew Kempczyński wrote:
> >
> > Test uses pre-warming batch which establishes offsets in the kernel
> > so adding pinned flag + zeroing relocation is enough to run with
> > softpinning on no-reloc gens.
> 
> LGTM, but don't we need something similar in switch_ring() too or it needs
> something different?

Yes, I based on CI reporting but I see most of tests are blacklisted 
due to (likely) long runtime. I'm fixing all of them and resubmit.

Thanks for review, I'm going to ask one more time when I'll complete rewrite.

--
Zbigniew

> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  tests/i915/gem_sync.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> > index 6cb00c406..2e9ed9ed8 100644
> > --- a/tests/i915/gem_sync.c
> > +++ b/tests/i915/gem_sync.c
> > @@ -501,6 +501,7 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >  {
> >	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
> >	struct intel_engine_data ied;
> > +	bool has_relocs = gem_has_relocations(fd);
> >
> >	ied = list_store_engines(fd, ctx, ring);
> >	igt_require(ied.nengines);
> > @@ -532,10 +533,11 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >		gem_execbuf(fd, &execbuf);
> >
> >		object[0].flags |= EXEC_OBJECT_WRITE;
> > +		object[0].flags |= has_relocs ? 0 : EXEC_OBJECT_PINNED;
> >		object[1].handle = gem_create(fd, 20*1024);
> >
> >		object[1].relocs_ptr = to_user_pointer(reloc);
> > -		object[1].relocation_count = 1024;
> > +		object[1].relocation_count = has_relocs ? 1024 : 0;
> >
> >		batch = gem_mmap__cpu(fd, object[1].handle, 0, 20*1024,
> >				      PROT_WRITE | PROT_READ);
> > @@ -789,6 +791,7 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
> >	int order[64];
> >	uint32_t *batch, *b;
> >	int done;
> > +	bool has_relocs = gem_has_relocations(fd);
> >
> >	memset(&execbuf, 0, sizeof(execbuf));
> >	execbuf.buffers_ptr = to_user_pointer(object);
> > @@ -805,9 +808,10 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
> >	execbuf.buffer_count = 1;
> >	gem_execbuf(fd, &execbuf);
> >	object[0].flags |= EXEC_OBJECT_WRITE;
> > +	object[0].flags |= has_relocs ? 0 : EXEC_OBJECT_PINNED;
> >
> >	object[1].relocs_ptr = to_user_pointer(reloc);
> > -	object[1].relocation_count = 1024;
> > +	object[1].relocation_count = has_relocs ? 1024 : 0;
> >	execbuf.buffer_count = 2;
> >
> >	memset(reloc, 0, sizeof(reloc));
> > @@ -990,6 +994,7 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
> >  {
> >	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
> >	struct intel_engine_data ied;
> > +	bool has_relocs = gem_has_relocations(fd);
> >
> >	ied = list_store_engines(fd, ctx, ALL_ENGINES);
> >	igt_require(ied.nengines);
> > @@ -1019,10 +1024,11 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
> >		gem_execbuf(fd, &execbuf);
> >
> >		object[0].flags |= EXEC_OBJECT_WRITE;
> > +		object[0].flags |= has_relocs ? 0 : EXEC_OBJECT_PINNED;
> >		object[1].handle = gem_create(fd, 1024*16 + 4096);
> >
> >		object[1].relocs_ptr = to_user_pointer(reloc);
> > -		object[1].relocation_count = 1024;
> > +		object[1].relocation_count = has_relocs ? 1024 : 0;
> >
> >		batch = gem_mmap__cpu(fd, object[1].handle, 0, 16*1024 + 4096,
> >				      PROT_WRITE | PROT_READ);
> > --
> > 2.26.0
> >

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DA010E086
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 18:04:05 +0000 (UTC)
Date: Fri, 14 Jul 2023 14:03:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLGODdr6A1ssS3l6@intel.com>
References: <20230710145856.1864141-1-matthew.brost@intel.com>
 <ZLAV5GSTyauZAK1x@intel.com> <ZLGNUZUMjZ4kGXNh@DUT025-TGLU>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLGNUZUMjZ4kGXNh@DUT025-TGLU>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/5] xe/xe_exec_basic: A sections to test NULL
 (sparse) bindings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 06:00:49PM +0000, Matthew Brost wrote:
> On Thu, Jul 13, 2023 at 11:19:00AM -0400, Rodrigo Vivi wrote:
> > On Mon, Jul 10, 2023 at 07:58:52AM -0700, Matthew Brost wrote:
> > > Update xe_exec_basic which create a NULL binding for store data address,
> > > this store should just be dropped.
> > > 
> > > Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  tests/xe/xe_exec_basic.c | 33 ++++++++++++++++++++++++++++-----
> > >  1 file changed, 28 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
> > > index af581c327..5624d31aa 100644
> > > --- a/tests/xe/xe_exec_basic.c
> > > +++ b/tests/xe/xe_exec_basic.c
> > > @@ -28,6 +28,7 @@
> > >  #define BIND_ENGINE	(0x1 << 4)
> > >  #define DEFER_ALLOC	(0x1 << 5)
> > >  #define DEFER_BIND	(0x1 << 6)
> > > +#define SPARSE		(0x1 << 7)
> > >  
> > >  /**
> > >   * SUBTEST: once-%s
> > > @@ -70,6 +71,10 @@
> > >   * @bindengine-userptr-rebind:		bind engine userptr rebind
> > >   * @bindengine-userptr-invalidate:	bind engine userptr invalidate
> > >   * @bindengine-userptr-invalidate-race:	bind engine userptr invalidate racy
> > > + * @null:				null
> > > + * @null-defer-mmap:			null defer mmap
> > > + * @null-defer-bind:			null defer bind
> > > + * @null-rebind:			null rebind
> > >   */
> > >  
> > >  static void
> > > @@ -86,6 +91,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> > >  		.syncs = to_user_pointer(sync),
> > >  	};
> > >  	uint64_t addr[MAX_N_ENGINES];
> > > +	uint64_t sparse_addr[MAX_N_ENGINES];
> > >  	uint32_t vm[MAX_N_ENGINES];
> > >  	uint32_t engines[MAX_N_ENGINES];
> > >  	uint32_t bind_engines[MAX_N_ENGINES];
> > > @@ -110,8 +116,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> > >  			xe_get_default_alignment(fd));
> > >  
> > >  	addr[0] = 0x1a0000;
> > > -	for (i = 1; i < MAX_N_ENGINES; ++i)
> > > +	sparse_addr[0] = 0x301a0000;
> > 
> > Why 0x301a0000?
> > (Although I also never understood where the 0x1a0000 also came from to start with...)
> > 
> 
> Random address, just different.
> 
> > > +	for (i = 1; i < MAX_N_ENGINES; ++i) {
> > >  		addr[i] = addr[i - 1] + (0x1ull << 32);
> > > +		sparse_addr[i] = sparse_addr[i - 1] + (0x1ull << 32);
> > > +	}
> > >  
> > >  	if (flags & USERPTR) {
> > >  #define	MAP_ADDRESS	0x00007fadeadbe000
> > > @@ -160,6 +169,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> > >  			xe_vm_bind_userptr_async(fd, vm[i], bind_engines[i],
> > >  						 to_user_pointer(data), addr[i],
> > >  						 bo_size, sync, 1);
> > > +		if (flags & SPARSE)
> > > +			__xe_vm_bind_assert(fd, vm[i], bind_engines[i],
> > > +					    0, 0, sparse_addr[i], bo_size,
> > > +					    XE_VM_BIND_OP_MAP |
> > > +					    XE_VM_BIND_FLAG_ASYNC |
> > > +					    XE_VM_BIND_FLAG_NULL, sync,
> > > +					    1, 0, 0);
> > >  	}
> > >  
> > >  	if (flags & DEFER_BIND)
> > > @@ -171,7 +187,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> > >  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > >  		uint64_t batch_addr = __addr + batch_offset;
> > >  		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > > -		uint64_t sdi_addr = __addr + sdi_offset;
> > > +		uint64_t sdi_addr = (flags & SPARSE ? sparse_addr[i % n_vm] :
> > > +				     __addr)+ sdi_offset;
> > >  		int e = i % n_engines;
> > >  
> > >  		b = 0;
> > > @@ -258,9 +275,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> > >  					INT64_MAX, 0, NULL));
> > >  	}
> > >  
> > > -	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
> > > -	     i < n_execs; i++)
> > > -		igt_assert_eq(data[i].data, 0xc0ffee);
> > > +	if (!(flags & SPARSE)) {
> > > +		for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
> > > +		     i < n_execs; i++)
> > > +			igt_assert_eq(data[i].data, 0xc0ffee);
> > > +	}
> > 
> > As far as I could see, the basic exec also happens here, and this null bind
> > for sparse is an extra one, so why not check the correctness of that basic anyway?
> > 
> > oh, and if we check the basic we also need to add 'basic-' in the subtest
> > names below...
> > 
> 
> This is checking the DW write in the non-sparse sections, in the sparse
> sections the DW write to NULL binding (writes dropped, read zero).
> 
> > >  
> > >  	for (i = 0; i < n_engines; i++) {
> > >  		syncobj_destroy(fd, syncobjs[i]);
> > > @@ -293,6 +312,10 @@ igt_main
> > >  		{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },
> > >  		{ "userptr", USERPTR },
> > >  		{ "rebind", REBIND },
> > > +		{ "null", SPARSE },
> > 
> > and talking about the naming... is the XE_VM_BIND_FLAG_NULL only used for sparse?
> > Is any bind for sparse required to use the NULL?
> 
> NULL binding == writes dropped, read zero
> 
> Sparse is VK term and yes they use NULL bindings.
> 
> > It looks to me that we have a strange mapping name here and we
> > should stick to either
> > { "sparse", SPARSE },
> > { "null", NULL },
> > 
> > but maybe it is just me missing something here...
> >
> 
> Yea weird naming, used SPARSE rather than NULL for the define as NULL is
> reserved.

it all makes sense now... thanks for the answers

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Matt
>  
> > > +		{ "null-defer-mmap", SPARSE | DEFER_ALLOC },
> > > +		{ "null-defer-bind", SPARSE | DEFER_ALLOC | DEFER_BIND },
> > > +		{ "null-rebind", SPARSE | REBIND },
> > >  		{ "userptr-rebind", USERPTR | REBIND },
> > >  		{ "userptr-invalidate", USERPTR | INVALIDATE },
> > >  		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
> > > -- 
> > > 2.34.1
> > > 

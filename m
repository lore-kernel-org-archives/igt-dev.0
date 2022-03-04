Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6F310F8DA
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Mar 2022 08:43:49 +0000 (UTC)
Date: Fri, 4 Mar 2022 09:43:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <YiHRQc/0tUMU6eXa@zkempczy-mobl2>
References: <20220302121253.25299-1-zbigniew.kempczynski@intel.com>
 <20220302121253.25299-2-zbigniew.kempczynski@intel.com>
 <YiEXwi8s+fzl3BOI@kamilkon-DESK1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YiEXwi8s+fzl3BOI@kamilkon-DESK1>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/intel_batchbuffer: Use safe
 alignment for intel-bb
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

On Thu, Mar 03, 2022 at 08:32:18PM +0100, Kamil Konieczny wrote:
> Dnia 2022-03-02 at 13:12:51 +0100, Zbigniew Kempczyński napisał(a):
> > Discrete cards can have different memory alignment requirements
> > when objects used in execbuffer comes from different memory regions.
> > Lets use safe alignment which should be fine regardless objects
> > location.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/intel_batchbuffer.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index ddb8d8c1fd..e50ab9055e 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -1370,7 +1370,7 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
> >  	ibb->enforce_relocs = do_relocs;
> >  	ibb->handle = gem_create(i915, size);
> >  	ibb->size = size;
> > -	ibb->alignment = 4096;
> > +	ibb->alignment = gem_detect_safe_alignment(i915);
> >  	ibb->ctx = ctx;
> >  	ibb->vm_id = 0;
> >  	ibb->batch = calloc(1, size);
> > @@ -1927,7 +1927,7 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
> >  		   || ALIGN(offset, alignment) == offset);
> >  
> >  	object = __add_to_cache(ibb, handle);
> > -	alignment = alignment ?: 4096;
> > +	alignment = max_t(uint64_t, alignment, gem_detect_safe_alignment(ibb->i915));
> 
> Maybe there should be check if alignment is power of 2 ?
> For example both offset and alignment can be -1 or 2^32 + 1
> we do not catch error then.

You're right. We're not validating alignment correctness on the input.
I'm going add this and resend.

--
Zbigniew
>  
> >  	__add_to_objects(ibb, object);
> >  
> >  	/*
> > -- 
> > 2.32.0
> > 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> --
> Kamil

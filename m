Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <5f0cb1c5-f925-8928-c450-a19d1547af8d@intel.com>
References: <20201208170205.2039137-1-chris@chris-wilson.co.uk>
 <5f0cb1c5-f925-8928-c450-a19d1547af8d@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 14 Dec 2020 16:43:42 +0000
Message-ID: <160796422254.13039.11905877707215718456@build.alporthouse.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/gem_vm_create: Race vm-destroy
 against object free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Matthew Auld (2020-12-14 15:52:06)
> On 08/12/2020 17:02, Chris Wilson wrote:
> > Matthew postulated that we should be able to hit a race in
> > __i915_vm_close() between the RCU object free and vma unbind viz
> > 
> >    GEM_BUG_ON(!list_empty(&vm->bound_list));
> > 
> > due to the effect of leaving the vma on the list if we are unable to
> > obtain the kref to the object. Let's try and find that race.
> 
> Hmm, what's the idea behind the bound_list stuff in __i915_vm_close(), 
> from the looks of it vm->open is always > 0 anyway for the lifetime of 
> the vm(?), so not sure if it's even possible to hit that path, at least 
> for direct userspace interactions.

From userspace, the intent was to track vm->open. i.e. we could not
close the whole vm as it was being used by execbuf. With the individual
vma holding a reference to the vm to prevent it being freed while still
active on the GPU.

> I guess I was half expecting the 
> vm_destroy ioctl or similar, to also call i915_vm_close() at some point, 
> to match vm_create, and not just drop the vm ref.

Right, each user vm_id is only a reference to a vm, and the user may
have multiple vm_id to the same vm. So there's an ambiguity that
prevents us from immediately closing the vm on destroy, and so just
manage references instead.

> So looks like 
> __i915_vm_close() is only potentially interesting for kernel internal users?

Hmm. There's a call to i915_vm_close from context_close (and on
changing the context vm). And there definitely can be vma still bound at
that point, and those vma still linked into the obj->vma_list. So I
think the pruning is still relevant for GEM contexts.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

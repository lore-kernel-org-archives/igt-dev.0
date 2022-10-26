Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4489910E5FF
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Oct 2022 17:00:33 +0000 (UTC)
Date: Wed, 26 Oct 2022 19:00:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y1lnrwIfl+vTZh9O@kamilkon-desk1>
References: <20221017090111.18429-1-matthew.auld@intel.com>
 <Y0/8pa8r6XY2PlF0@kamilkon-desk1>
 <6244b0f0-5c0c-a6d7-0fef-2e90262c8b1a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6244b0f0-5c0c-a6d7-0fef-2e90262c8b1a@intel.com>
Subject: Re: [igt-dev] [CI 1/2] tests/i915/query: sanity check reported GTT
 alignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-10-19 at 15:03:08 +0100, Matthew Auld wrote:
> Hi,
> 
> On 19/10/2022 14:33, Kamil Konieczny wrote:
> > Hi Matthew,
> > 
> > On 2022-10-17 at 10:01:10 +0100, Matthew Auld wrote:
> > > Ensure the kernel is reporting "normal" values here, based on our
> > > current expectations.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> > - ^
> > imho you should remove this when sending patch.
> 
> Hmm, what should be removed here? Do you mean the r-b tag?
> 
> > Please also use
> > [PATCH i-g-t] or [PATCH i-g-t vN] in Subject: line (with
> > N=version > 1) instead of [CI 1/2]. It would also help if you
> > could send series bigger than one patch with cover letter
> > (well, now it can stay as is).
> 
> The patch should be unchanged, I'm just re-sending with [CI] and
> --suppress-cc=all since I just want to get some CI results before merging
> (i.e not requesting review from the mailing list), now that the
> corresponding kernel patches are merged. The patch has already been
> reviewed.
> 
> > 
> > > ---
> > >   tests/i915/i915_query.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
> > > index 4e43c7cd..bff073d2 100644
> > > --- a/tests/i915/i915_query.c
> > > +++ b/tests/i915/i915_query.c
> > > @@ -638,6 +638,8 @@ static void upload(int fd, struct igt_list_head *handles, uint32_t num_handles)
> > >   	free(exec);
> > >   }
> > > +/** XXX: remove once we sync the uapi header */
> > > +#define gtt_alignment rsvd0
> > >   static void test_query_regions_sanity_check(int fd)
> > >   {
> > >   	struct drm_i915_query_memory_regions *regions;
> > > @@ -664,6 +666,11 @@ static void test_query_regions_sanity_check(int fd)
> > >   		struct drm_i915_gem_memory_class_instance r1 = info.region;
> > >   		int j;
> > > +		if (info.gtt_alignment) {
> > > +			igt_assert_lte_u64(4096, info.gtt_alignment);
> > > +			igt_assert(is_power_of_two(info.gtt_alignment));
> > > +		}
> > > +
> > >   		if (r1.memory_class == I915_MEMORY_CLASS_SYSTEM) {
> > >   			igt_assert_eq(r1.memory_instance, 0);
> > >   			found_system = true;
> > > @@ -674,6 +681,9 @@ static void test_query_regions_sanity_check(int fd)
> > >   			igt_assert(info.unallocated_cpu_visible_size == 0 ||
> > >   				   info.unallocated_cpu_visible_size ==
> > >   				   info.unallocated_size);
> > > +
> > > +			igt_assert(info.gtt_alignment == 0 ||
> > > +				   info.gtt_alignment == 4096);
> > -------------------------------------------------------- ^
> > Why not copy your check from above ? This is restricting to only
> > 4KB or 0 and can break for bigger values.
> 
> We want it to break for bigger values. This check is for system memory, and
> likely means we have a silly bug since we should not expect anything other
> than 4K (or zero if the kernel doesn't support the field).

This should be PAGE_SIZE instead of 4096, also you can consider
checking for HUGE_PAGE_SIZE but that depends on userspace and
kernel options:

grep -i hugepagesize /proc/meminfo

Hugepagesize:       2048 kB

So imho at least change 4096 into PAGE_SIZE (in few places where
it is used).

Regards,
Kamil

> 
> > 
> > Regards,
> > Kamil
> > 
> > >   		} else {
> > >   			igt_assert(info.probed_cpu_visible_size <= info.probed_size);
> > >   			igt_assert(info.unallocated_size <= info.probed_size);
> > > -- 
> > > 2.37.3
> > > 

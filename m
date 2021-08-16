Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2189789AA2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 05:43:02 +0000 (UTC)
Date: Mon, 16 Aug 2021 07:42:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210816054256.GB6051@zkempczy-mobl2>
References: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
 <20210813074703.18778-5-zbigniew.kempczynski@intel.com>
 <87y295gf8v.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y295gf8v.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/9] tests/gem_exec_big: Skip relocation
 part
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
Cc: igt-dev@lists.freedesktop.org, Andrzej Turko <andrzej.turko@linux.intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 13, 2021 at 03:18:56PM -0700, Dixit, Ashutosh wrote:
> On Fri, 13 Aug 2021 00:46:58 -0700, Zbigniew Kempczyński wrote:
> >
> > When running on platforms without relocation support, verification
> > of their correctness should be skipped.  What remains is exercising
> > submission of large batches.
> 
> Not sure if there's much point to this file in the absence of relocations
> since all it would do is bind the batch buffer in the gtt but the first
> instruction is already MI_BATCH_BUFFER_END. So the patch could possibly
> just be:
> 
> 		igt_require(gem_has_relocations(i915));
> 
> as was in the earlier version of the patch.

But we want to run this test, at least to try big batchbuffer. We skip
playing with relocations but still imo test is valuable for no-reloc gens.

--
Zbigniew

> 
> > @@ -70,7 +71,7 @@ static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, c
> >	gem_reloc[0].presumed_offset = 0;
> >
> >	gem_exec[0].handle = handle;
> > -	gem_exec[0].relocation_count = 1;
> > +	gem_exec[0].relocation_count = has_relocs ? 1 : 0;
> >	gem_exec[0].relocs_ptr = to_user_pointer(gem_reloc);
> >	gem_exec[0].alignment = 0;
> >	gem_exec[0].offset = 0;
> > @@ -100,6 +101,9 @@ static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, c
> >	igt_warn_on(gem_reloc[0].presumed_offset == -1);
> >	gem_set_domain(fd, gem_exec[0].handle, I915_GEM_DOMAIN_WC, 0);
> >
> > +	if (!has_relocs)
> > +		return;
> > +
> 
> I would move this 2 lines above, right after gem_execbuf(), so that there's
> no confusion about verifying presumed_offset etc. in the absence of
> relocations.
> 
> Otherwise this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I missed your comment and I've already merged this test. You're absolutely
right and this should be after return. I'm going to move this in next series.

--
Zbigniew

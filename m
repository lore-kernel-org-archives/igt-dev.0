Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F786E237
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Aug 2021 03:37:53 +0000 (UTC)
Date: Thu, 12 Aug 2021 05:37:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210812033718.GB3261@zkempczy-mobl2>
References: <20210811202811.2162-1-andrzej.turko@linux.intel.com>
 <20210811202811.2162-2-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210811202811.2162-2-andrzej.turko@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_exec_big: Add a path
 without relocations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 11, 2021 at 10:28:10PM +0200, Andrzej Turko wrote:
> When running on platforms without relocation support,
> verification of their correctness should be skipped.
> What remains is exercising submission of large batches.
> 
> Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_exec_big.c | 40 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
> index 1f8c720b6..a10b7dc6a 100644
> --- a/tests/i915/gem_exec_big.c
> +++ b/tests/i915/gem_exec_big.c
> @@ -55,6 +55,35 @@ IGT_TEST_DESCRIPTION("Run a large nop batch to stress test the error capture"
>  #define FORCE_PREAD_PWRITE 0
>  
>  static int use_64bit_relocs;
> +static bool do_relocs;
> +
> +static void exec_noreloc(int fd, uint64_t handle, unsigned flags)
> +{
> +	struct drm_i915_gem_execbuffer2 execbuf;
> +	struct drm_i915_gem_exec_object2 gem_exec[1];
> +
> +	gem_exec[0].handle = handle;
> +	gem_exec[0].relocation_count = 0;
> +	gem_exec[0].alignment = 0;
> +	gem_exec[0].offset = 0;
> +	gem_exec[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +	gem_exec[0].rsvd1 = 0;
> +	gem_exec[0].rsvd2 = 0;
> +
> +	execbuf.buffers_ptr = to_user_pointer(gem_exec);
> +	execbuf.buffer_count = 1;
> +	execbuf.batch_start_offset = 0;
> +	execbuf.batch_len = 8;
> +	execbuf.cliprects_ptr = 0;
> +	execbuf.num_cliprects = 0;
> +	execbuf.DR1 = 0;
> +	execbuf.DR4 = 0;
> +	execbuf.flags = flags;
> +	i915_execbuffer2_set_context_id(execbuf, 0);
> +	execbuf.rsvd2 = 0;
> +
> +	gem_execbuf(fd, &execbuf);
> +}

That makes code duplication I don't really like. Maybe there's less conditional code
which looks worse but we have no ~20 lines of code which differs with single relocation_count 
value.

--
Zbigniew

>  
>  static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, char *ptr)
>  {
> @@ -62,6 +91,11 @@ static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, c
>  	struct drm_i915_gem_exec_object2 gem_exec[1];
>  	struct drm_i915_gem_relocation_entry gem_reloc[1];
>  
> +	if (!do_relocs) {
> +		exec_noreloc(fd, handle, flags);
> +		return;
> +	}
> +
>  	gem_reloc[0].offset = reloc_ofs;
>  	gem_reloc[0].delta = 0;
>  	gem_reloc[0].target_handle = handle;
> @@ -137,6 +171,11 @@ static void execN(int fd, uint32_t handle, uint64_t batch_size, unsigned flags,
>  	struct drm_i915_gem_relocation_entry *gem_reloc;
>  	uint64_t n, nreloc = batch_size >> 12;
>  
> +	if (!do_relocs) {
> +		exec_noreloc(fd, handle, flags);
> +		return;
> +	}
> +
>  	gem_reloc = calloc(nreloc, sizeof(*gem_reloc));
>  	igt_assert(gem_reloc);
>  
> @@ -305,6 +344,7 @@ igt_main
>  		igt_require_gem(i915);
>  
>  		use_64bit_relocs = intel_gen(intel_get_drm_devid(i915)) >= 8;
> +		do_relocs = gem_has_relocations(i915);
>  	}
>  
>  	igt_subtest("single")
> -- 
> 2.25.1
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200124164131.39591-1-matthew.auld@intel.com>
 <157988441300.2524.9356450040552570684@skylake-alporthouse-com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <83b0451b-3252-1efb-840d-ad5a51151534@intel.com>
Date: Fri, 24 Jan 2020 16:54:42 +0000
MIME-Version: 1.0
In-Reply-To: <157988441300.2524.9356450040552570684@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] i915/tests/gem_exec_big: prefer PROT_WRITE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 24/01/2020 16:46, Chris Wilson wrote:
> Quoting Matthew Auld (2020-01-24 16:41:31)
>> Technically mmap__cpu and mmap__wc just ignore the prot value, so it
>> doesn't really matter, but the intention is to have write access to the
>> ptr, so make that clear. Also if the underlying mmap__wc were to at some
>> point use mmap_offset where the prot is not ignored then we won't have
>> any surprises.
> 
> The ptr here was just meant for cheaply reading back from the buffer to
> verify the relocation took place. E.g.,
> 
> -static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, char *ptr)
> +static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, const char *ptr)
>   {
>          struct drm_i915_gem_execbuffer2 execbuf;
>          struct drm_i915_gem_exec_object2 gem_exec[1];
> @@ -126,7 +126,7 @@ static void xchg_reloc(void *array, unsigned i, unsigned j)
>          *b = tmp;
>   }
> 
> -static void execN(int fd, uint32_t handle, uint64_t batch_size, unsigned flags, char *ptr)
> +static void execN(int fd, uint32_t handle, uint64_t batch_size, unsigned flags, const char *ptr)
>   {
> 
> What am I missing?

*(uint64_t *)(ptr + gem_reloc[n].offset) = gem_reloc[n].presumed_offset;

?

> -Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

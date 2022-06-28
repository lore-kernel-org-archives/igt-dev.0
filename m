Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <1eb06a00-9a46-0452-6a8d-45104dfcde96@intel.com>
Date: Tue, 28 Jun 2022 16:59:41 +0300
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220627161004.70153-1-matthew.auld@intel.com>
 <edb8ed97-fee9-1e86-9339-979fd97b3f95@intel.com>
 <5db0e882-3691-882f-23a4-86238b55401b@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <5db0e882-3691-882f-23a4-86238b55401b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/i915/gem_eio: fix uaf
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 6/28/22 3:47 PM, Matthew Auld wrote:
> On 28/06/2022 11:24, Gwan-gyeong Mun wrote:
>> Looks good to me.
>>
>> Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>
>> However, the use after free build issue did not occur only with the "$ 
>> meson build && ninja -C build" build command guided by the igt 
>> README.md. How did you check it?
> 
> Hmm, I assume it's just a difference in compiler version or so. I have: 
> gcc (GCC) 12.1.1 20220507 (Red Hat 12.1.1-1).
> 
Thanks for sharing your compiling environment info.
My gcc says its version is 11.1.0.
I'll try with the version you mentioned.

$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-pc-linux-gnu/11.1.0/lto-wrapper
Target: x86_64-pc-linux-gnu
Configured with: /build/gcc/src/gcc/configure --prefix=/usr 
--libdir=/usr/lib --libexecdir=/usr/lib --mandir=/usr/share/man 
--infodir=/usr/share/info --with-bugurl=https://bugs.archlinux.org/ 
--enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++,d --with-isl 
--with-linker-hash-style=gnu --with-system-zlib --enable-__cxa_atexit 
--enable-cet=auto --enable-checking=release --enable-clocale=gnu 
--enable-default-pie --enable-default-ssp --enable-gnu-indirect-function 
--enable-gnu-unique-object --enable-install-libiberty 
--enable-linker-build-id --enable-lto --enable-multilib --enable-plugin 
--enable-shared --enable-threads=posix --disable-libssp 
--disable-libstdcxx-pch --disable-libunwind-exceptions --disable-werror 
gdc_include_dir=/usr/include/dlang/gdc
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 11.1.0 (GCC)


Thanks,
G.G.

>>
>> Br,
>>
>> G.G.
>>
>>
>> On 6/27/22 7:10 PM, Matthew Auld wrote:
>>> ../tests/i915/gem_eio.c:277:20: warning: pointer ‘ctx’ used after 
>>> ‘free’ [-Wuse-after-free]
>>>    277 |         igt_assert(igt_sysfs_printf(ctx->debugfs, 
>>> "i915_drop_caches",
>>> ../lib/igt_core.h:667:20: note: in definition of macro ‘igt_assert’
>>>    667 |         do { if (!(expr)) \
>>>        |                    ^~~~
>>> ../tests/i915/gem_eio.c:274:9: note: call to ‘free’ here
>>>    274 |         free(ctx);
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>> ---
>>>   tests/i915/gem_eio.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
>>> index 913a21f9..6cbae6eb 100644
>>> --- a/tests/i915/gem_eio.c
>>> +++ b/tests/i915/gem_eio.c
>>> @@ -270,11 +270,11 @@ static void hang_handler(union sigval arg)
>>>             igt_nsec_elapsed(&ctx->delay) / 1000.0);
>>>       igt_assert_eq(timer_delete(ctx->timer), 0);
>>> -    free(ctx);
>>>       /* flush any excess work before we start timing our reset */
>>>       igt_assert(igt_sysfs_printf(ctx->debugfs, "i915_drop_caches",
>>>                       "%d", DROP_RCU));
>>> +    free(ctx);
>>>       igt_nsec_elapsed(ts);
>>>       igt_assert(igt_sysfs_printf(dir, "i915_wedged", "%llu", -1ull));
>>>

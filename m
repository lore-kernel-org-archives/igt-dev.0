Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC05D10E00D
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 19:44:41 +0000 (UTC)
Message-ID: <18f80dc6-de04-4cf8-acb4-2bbd3756c411@kuhls.net>
Date: Tue, 31 Oct 2023 20:44:36 +0100
MIME-Version: 1.0
Content-Language: de-DE
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
 <20231030195809.3527410-4-bernd@kuhls.net>
 <20231031184547.pcf345ct6ljlczlz@kamilkon-desk.igk.intel.com>
From: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20231031184547.pcf345ct6ljlczlz@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH v3 4/7] lib/igt_halffloat.c: Fix musl/uclibc
 build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Stefano Ragni <st3r4g@protonmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

Am 31.10.23 um 19:45 schrieb Kamil Konieczny:
> Hi Bernd,
> On 2023-10-30 at 20:58:06 +0100, Bernd Kuhls wrote:
>> From: Stefano Ragni <st3r4g@protonmail.com>
>>
>> Original patch was added to void-linux:
>> https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7
>>
>> Fixes build error:
>> ../lib/igt_halffloat.c:205:6: error: ‘ifunc’ is not supported on this target
>>    205 | void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)
>>
>> ../lib/igt_halffloat.c:216:6: error: ‘ifunc’ is not supported on this target
>>    216 | void igt_half_to_float(const uint16_t *h, float *f, unsigned int num)
> 
> Hmm, now I am reading this a second time and have question:
> for what architecture are you compiling this?

I used various versions of gcc, and only gcc, originally tested on 
x86_64 with musl libc but the error appeared with uclibc toolchains as 
well and on all the other hardware archs buildroot supports:

https://git.buildroot.net/buildroot/tree/support/config-fragments/autobuild

> It would be better to check in build.meson for GCC support
> and add checks in meson for:

I will have a look into it but this will take some time due to lack of 
experience with the meson build system on my part.

> #if defined(__x86_64__) && !defined(__clang__) && defined(__GCC_HAVE_IFUNC_ATTRIBUTE)
> 
> or is it both gcc and glibc? Do you have other archs for which this
> is supported?

See above, the patch fixed the build on all hardware archs buildroot 
supports with gcc being the only compiler used, no clang/llvm etc.

Regards, Bernd

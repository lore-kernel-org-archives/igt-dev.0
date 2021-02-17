Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635566E429
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Feb 2021 11:43:49 +0000 (UTC)
References: <20210216202557.878778-1-martin.peres@mupuf.org>
 <YCzH1S+9epMh4bKr@platvala-desk.ger.corp.intel.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <a5f1752e-e75a-b0ed-e876-48da7a15d9a9@mupuf.org>
Date: Wed, 17 Feb 2021 13:43:31 +0200
MIME-Version: 1.0
In-Reply-To: <YCzH1S+9epMh4bKr@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] amdgpu/basic: move
 amdgpu_query_info_test to its own file
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
List-ID: <igt-dev@lists.freedesktop.org>

On 17/02/2021 09:37, Petri Latvala wrote:
> On Tue, Feb 16, 2021 at 10:25:56PM +0200, Martin Peres wrote:
>> This will soon be followed by more amd_query_info tests, and the basic
>> file is already big-enough.
>>
>> v2:
>>   - add test and subtest descriptions (Arek)
>>   - add the new file to autotools (Petri)
>>
>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>> Signed-off-by: Martin Peres <martin.peres@mupuf.org>
>> ---
>>   tests/Makefile.sources   |  1 +
>>   tests/amdgpu/amd_basic.c | 17 ---------
>>   tests/amdgpu/amd_info.c  | 74 ++++++++++++++++++++++++++++++++++++++++
>>   tests/amdgpu/meson.build |  1 +
>>   4 files changed, 76 insertions(+), 17 deletions(-)
>>   create mode 100644 tests/amdgpu/amd_info.c
> 
> Fails to link with autotools:
> 
> https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/7354371
> 
> /usr/bin/ld: amdgpu/amd_info.o: in function `query_firmware_version_test':
> /builds/gfx-ci/igt-ci-tags/tests/amdgpu/amd_info.c:39: undefined reference to `amdgpu_query_gpu_info'
> /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/tests/amdgpu/amd_info.c:42: undefined reference to `amdgpu_query_firmware_version'
> /usr/bin/ld: amdgpu/amd_info.o: in function `query_timestamp_test':
> /builds/gfx-ci/igt-ci-tags/tests/amdgpu/amd_info.c:58: undefined reference to `amdgpu_query_gpu_info'
> /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/tests/amdgpu/amd_info.c:72: undefined reference to `amdgpu_query_info'
> /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/tests/amdgpu/amd_info.c:77: undefined reference to `amdgpu_query_info'
> /usr/bin/ld: amdgpu/amd_info.o: in function `__real_main118':
> /builds/gfx-ci/igt-ci-tags/tests/amdgpu/amd_info.c:150: undefined reference to `amdgpu_device_deinitialize'
> /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/tests/amdgpu/amd_info.c:128: undefined reference to `amdgpu_device_initialize'
> collect2: error: ld returned 1 exit status
> make[3]: *** [Makefile:3204: amdgpu/amd_info] Error 1
> make[3]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
> make[2]: *** [Makefile:5190: all-recursive] Error 1
> make[2]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
> make[1]: *** [Makefile:515: all-recursive] Error 1
> make[1]: Leaving directory '/builds/gfx-ci/igt-ci-tags'
> make: *** [Makefile:447: all] Error 2
> 
> 

RRRrrr, I tried to make this work without being to compile it, as 
autoconf 2.71 broke backwards compatibility, and simple fixes would not 
make it work.

However, Petri suggested I fork the project in gitlab, and let the 
pipelines to prove it works at least on Debian. I am glad to report this 
is now done, and we are ready for v4...

Let's hope it will work. Thanks for the feedback!

Martin
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

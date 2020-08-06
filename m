Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7525789B65
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 12:22:15 +0000 (UTC)
References: <20200806114314.549732-1-lionel.g.landwerlin@intel.com>
 <20200806120101.GB28220@platvala-desk.ger.corp.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <297bbfb5-baf1-88dc-cac6-f984ddf63585@intel.com>
Date: Thu, 6 Aug 2020 15:22:07 +0300
MIME-Version: 1.0
In-Reply-To: <20200806120101.GB28220@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915_perf: drop dependency on libigt
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 06/08/2020 15:01, Petri Latvala wrote:
> On Thu, Aug 06, 2020 at 02:43:14PM +0300, Lionel Landwerlin wrote:
>> There is no need for it, we just depend on libigt_chipset.
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> ---
>>   lib/meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 341696e5..bccebba2 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -257,7 +257,7 @@ endforeach
>>   lib_igt_i915_perf_build = shared_library(
>>     'i915_perf',
>>     i915_perf_files,
>> -  dependencies: [lib_igt, lib_igt_chipset],
>> +  dependencies: lib_igt_chipset,
>>     include_directories : inc,
>>     install: true,
>>     soversion: '0')
>
>
> Well that was easy then.
>
> Did you try gpuvis with that?
>
>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Yeah, although you just made me realize we have 3 tools that also depend 
on lib_igt which we probably want to fix too.

Those are uses by the gpuvis scripts to record data.


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

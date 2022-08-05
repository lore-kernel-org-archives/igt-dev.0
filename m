Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6EEB18E8
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Aug 2022 09:01:54 +0000 (UTC)
Message-ID: <5b9837b0-c384-9b8a-b1b0-9c4e99c9a087@intel.com>
Date: Fri, 5 Aug 2022 11:01:55 +0200
Content-Language: en-US
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: <igt-dev@lists.freedesktop.org>
References: <20220804132617.2179474-1-karolina.drobnik@intel.com>
 <165962242963.14888.7271101412241618178@emeril.freedesktop.org>
 <23794b49-c388-9b58-c930-6cf7f979b428@intel.com>
In-Reply-To: <23794b49-c388-9b58-c930-6cf7f979b428@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frps=3A_Don=27t_use_gem=5Fwrite_in_batch=5Fcreate?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

I'm sorry, I forgot to include you in my reply to the BAT failure.

I think this failure is unrelated to my patch, but could you 
double-check and re-run this series?

Thanks a lot,
Karolina

On 05.08.2022 09:14, Karolina Drobnik wrote:
> On 04.08.2022 16:13, Patchwork wrote:
>> *Patch Details*
>> *Series:*    i915/i915_pm_rps: Don't use gem_write in batch_create
>> *URL:*    https://patchwork.freedesktop.org/series/106977/ 
>> <https://patchwork.freedesktop.org/series/106977/>
>> *State:*    failure
>> *Details:* 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/index.html 
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/index.html>
>>
>>
>>   CI Bug Log - changes from CI_DRM_11966 -> IGTPW_7606
>>
>>
>>     Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with IGTPW_7606 absolutely need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in IGTPW_7606, please notify your bug team to allow them
>> to document this new failure mode, which will reduce false positives 
>> in CI.
>>
>> External URL: 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/index.html
>>
>>
>>     Participating hosts (41 -> 41)
>>
>> Additional (3): bat-rpls-1 bat-jsl-3 bat-dg2-8
>> Missing (3): fi-kbl-soraka fi-rkl-11600 bat-dg1-5
>>
>>
>>     Possible new issues
>>
>> Here are the unknown changes that may have been introduced in IGTPW_7606:
>>
>>
>>       IGT changes
>>
>>
>>         Possible regressions
>>
>>   * igt@gem_render_tiled_blits@basic:
>>       o fi-apl-guc: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/fi-apl-guc/igt@gem_render_tiled_blits@basic.html> 
>>
>>         -> INCOMPLETE
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/fi-apl-guc/igt@gem_render_tiled_blits@basic.html> 
>>
> 
> Failure not related to the changes in my patch
> 
> Many thanks,
> Karolina

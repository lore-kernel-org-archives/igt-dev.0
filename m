Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB3110E10E
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 17:40:03 +0000 (UTC)
Date: Wed, 22 Mar 2023 10:39:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZBs9ZvPO9HL2mp8A@orsosgc001.jf.intel.com>
References: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
 <20230322000523.3310187-29-umesh.nerlige.ramappa@intel.com>
 <87wn38u4zq.wl-ashutosh.dixit@intel.com>
 <87v8isu2z2.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87v8isu2z2.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 28/31] lib/i915/perf: Add support for
 MPEC format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 10:10:09AM -0700, Dixit, Ashutosh wrote:
>On Wed, 22 Mar 2023 09:26:33 -0700, Dixit, Ashutosh wrote:
>>
>> On Tue, 21 Mar 2023 17:05:20 -0700, Umesh Nerlige Ramappa wrote:
>> >
>> > Add support in perf library for MPEC formats.
>>
>> We have only added I915_OAM_FORMAT_MPEC8u32_B8_C8. Don't we also need to
>> add I915_OAM_FORMAT_MPEC8u64_B8_C8 here?
>
>Or maybe just say here "Add support in perf library for
>I915_OAM_FORMAT_MPEC8u32_B8_C8" so it's clear what we are doing.
>

The MTL OAM XML has definition for this format only, so adding just 
that.

Thanks,
Umesh
>>
>> Otherwise, this is:
>>
>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

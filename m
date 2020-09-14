Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD0D6E296
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2020 07:24:09 +0000 (UTC)
References: <20200910101532.167045-1-lionel.g.landwerlin@intel.com>
 <20200910104157.GD7444@platvala-desk.ger.corp.intel.com>
 <dd56c954-654c-5d1b-661f-7c4a13247c3e@intel.com>
 <20200910105832.GE7444@platvala-desk.ger.corp.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <d6994f4e-7ddc-0aa2-37c2-a6ebb9f5ac36@intel.com>
Date: Mon, 14 Sep 2020 10:24:05 +0300
MIME-Version: 1.0
In-Reply-To: <20200910105832.GE7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/perf: rework perf counters
 equations
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

On 10/09/2020 13:58, Petri Latvala wrote:
> On Thu, Sep 10, 2020 at 01:54:00PM +0300, Lionel Landwerlin wrote:
>> On 10/09/2020 13:41, Petri Latvala wrote:
>>> On Thu, Sep 10, 2020 at 01:15:32PM +0300, Lionel Landwerlin wrote:
>>>> Working with an offset means we can have the PERFCNT snapshots stored
>>>> at an offset in the existing accumulator rather than having a specific
>>>> accumulator just for them.
>>>>
>>>> This isn't really useful for IGT because it only looks at the OA
>>>> buffer where those registers aren't stored, but it is useful for perf
>>>> queries in Mesa.
>>>>
>>>> This bumps the version of the i915_perf library to reflect the API
>>>> change (see perf.h).
>>> For older versions of Mesa that cannot use this version, what's the
>>> method of getting a compatible i915-perf? Is it "checkout this older
>>> git commit"?
>>>
>>>
>> Mesa doesn't use the igt library (so far it's only used by the tools &
>> gpuvis), only pulling in the xml files at given point.
> Ah, right.
>
> I'm making an assumption that you tested both gpuvis and Mesa with
> this change so
>
> Acked-by: Petri Latvala <petri.latvala@intel.com>

I did, but forgot to bump the SO version just to make sure apps recompile ;)


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

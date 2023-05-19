Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434C310E068
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 15:56:09 +0000 (UTC)
Date: Fri, 19 May 2023 08:55:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZGecAJDXDhxlhR49@orsosgc001.jf.intel.com>
References: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
 <168445518199.26991.6517756659835619140@emeril.freedesktop.org>
 <ZGcas8WVVmM+78bE@orsosgc001.jf.intel.com>
 <87353sww8p.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87353sww8p.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUE1VOiBt?=
 =?utf-8?q?ulti-tile_support_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 19, 2023 at 01:39:34AM -0700, Dixit, Ashutosh wrote:
>On Thu, 18 May 2023 23:44:03 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>>
>> One of the SKIPs below is not expected,
>>
>> On Fri, May 19, 2023 at 12:13:01AM +0000, Patchwork wrote:
>> >   Patch Details
>> >
>> >   Series:  PMU: multi-tile support (rev4)
>> >   URL:     [1]https://patchwork.freedesktop.org/series/117406/
>> >   State:   failure
>> >   Details: [2]https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/index.html
>> >
>> >         CI Bug Log - changes from CI_DRM_13160_full -> IGTPW_8990_full
>> >
>> > Summary
>> >
>> >   FAILURE
>> >
>> >   Serious unknown changes coming with IGTPW_8990_full absolutely need to be
>> >   verified manually.
>> >
>> >   If you think the reported changes have nothing to do with the changes
>> >   introduced in IGTPW_8990_full, please notify your bug team to allow them
>> >   to document this new failure mode, which will reduce false positives in
>> >   CI.
>> >
>> >   External URL:
>> >   https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/index.html
>> >
>> > Participating hosts (7 -> 7)
>> >
>> >   No changes in participating hosts
>> >
>> > Possible new issues
>> >
>> >   Here are the unknown changes that may have been introduced in
>> >   IGTPW_8990_full:
>> >
>> >  IGT changes
>> >
>> >    Possible regressions
>> >
>> >     * igt@gem_ctx_isolation@preservation-s3@vcs0:
>> >
>> >          * shard-apl: [3]PASS -> [4]ABORT
>> >
>> >     * {igt@perf_pmu@frequency@gt0} (NEW):
>> >
>> >          * {shard-rkl}: NOTRUN -> [5]SKIP +1 similar issue
>>
>
>Yup, because gem_list_engines() had a bug. I have sent a patch:
>
>https://patchwork.freedesktop.org/series/118001/
>
>Failure can be seen here (for reviewers for the above patch):
>
>https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/shard-rkl-1/igt@perf_pmu@frequency@gt0.html
>
>> With this IGT series - https://patchwork.freedesktop.org/series/117406/, we
>> do not have igt@perf_pmu@frequency test anymore. It is replaced by
>> igt@perf_pmu@frequency@gt0 for all single tile platforms. For non-MTL
>> platforms, gem_engine_to_gt_map() should just return 0.
>>
>> >
>> >     * {igt@perf_pmu@rc6-all-gts} (NEW):
>> >
>> >          * {shard-dg1}: NOTRUN -> [6]SKIP +1 similar issue
>> >
>> >          * {shard-tglu}: NOTRUN -> [7]SKIP +2 similar issues
>>
>> These are expected to skip.
>
>Also, Umesh not sure if we need to run premerge CI on your latest rev:
>
>https://patchwork.freedesktop.org/series/117913/
>
>It seems to have got stuck and maybe you need to say 'test again'.

Yes, it's stuck. I reposted the IGT (with your patch above) and Kernel 
series for a CI rerun. Hopefully this should do it.

Thanks,
Umesh
>
>Thanks.
>--
>Ashutosh

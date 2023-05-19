Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0216D10E5CF
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 06:44:10 +0000 (UTC)
Date: Thu, 18 May 2023 23:44:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>, <ashutosh.dixit@intel.com>
Message-ID: <ZGcas8WVVmM+78bE@orsosgc001.jf.intel.com>
References: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
 <168445518199.26991.6517756659835619140@emeril.freedesktop.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <168445518199.26991.6517756659835619140@emeril.freedesktop.org>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh,

One of the SKIPs below is not expected,

On Fri, May 19, 2023 at 12:13:01AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  PMU: multi-tile support (rev4)
>   URL:     [1]https://patchwork.freedesktop.org/series/117406/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/index.html
>
>         CI Bug Log - changes from CI_DRM_13160_full -> IGTPW_8990_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with IGTPW_8990_full absolutely need to be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8990_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>   External URL:
>   https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/index.html
>
>Participating hosts (7 -> 7)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   IGTPW_8990_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@gem_ctx_isolation@preservation-s3@vcs0:
>
>          * shard-apl: [3]PASS -> [4]ABORT
>
>     * {igt@perf_pmu@frequency@gt0} (NEW):
>
>          * {shard-rkl}: NOTRUN -> [5]SKIP +1 similar issue

With this IGT series - https://patchwork.freedesktop.org/series/117406/, 
we do not have igt@perf_pmu@frequency test anymore. It is replaced by 
igt@perf_pmu@frequency@gt0 for all single tile platforms. For non-MTL 
platforms, gem_engine_to_gt_map() should just return 0.

>
>     * {igt@perf_pmu@rc6-all-gts} (NEW):
>
>          * {shard-dg1}: NOTRUN -> [6]SKIP +1 similar issue
>
>          * {shard-tglu}: NOTRUN -> [7]SKIP +2 similar issues

These are expected to skip.

Umesh
>
>New tests

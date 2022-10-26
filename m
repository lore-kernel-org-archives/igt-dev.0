Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6E210E3FC
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Oct 2022 21:27:21 +0000 (UTC)
Date: Wed, 26 Oct 2022 14:27:13 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <Y1mmMVQmRTCQai0T@unerlige-ril>
References: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
 <166678303735.25381.17629886299115710864@emeril.freedesktop.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <166678303735.25381.17629886299115710864@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU2Vjb25k?=
 =?utf-8?q?_part_of_DG2_OA_tests?=
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

On Wed, Oct 26, 2022 at 11:17:17AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  Second part of DG2 OA tests
>   URL:     [1]https://patchwork.freedesktop.org/series/110141/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8001/index.html
>
>         CI Bug Log - changes from CI_DRM_12294_full -> IGTPW_8001_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with IGTPW_8001_full absolutely need to be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8001_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>   External URL:
>   https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8001/index.html
>
>Participating hosts (11 -> 8)
>
>   Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   IGTPW_8001_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@perf@global-sseu-config:
>
>          * shard-tglb: [3]PASS -> [4]SKIP
>
>    Suppressed
>
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
>
>     * igt@perf@global-sseu-config:
>
>          * {shard-rkl}: NOTRUN -> [5]SKIP
>
>          * {shard-dg1}: [6]PASS -> [7]SKIP

sseu-config related tests are now limited to gen11 only, so they are 
expected to skip on other platforms.

Umesh
>
>Known issues
>

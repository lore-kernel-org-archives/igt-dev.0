Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59EF6E8A8
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jul 2021 19:03:33 +0000 (UTC)
Date: Thu, 15 Jul 2021 12:03:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20210715190326.mjjm6b3xru3exuoi@ldmartin-desk2>
References: <20210711061211.2879015-1-lucas.demarchi@intel.com>
 <162601612378.15486.10785961106891989011@emeril.freedesktop.org>
 <87k0ls4ng3.wl-ashutosh.dixit@intel.com>
 <20210714235124.qe2y5wnsn2o6vd7a@ldmartin-desk2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714235124.qe2y5wnsn2o6vd7a@ldmartin-desk2>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogIGZhaWx1cmUgZm9yIFN0YXJ0?=
 =?utf-8?q?_cleanup_of_local_macros/structs_=28rev2=29?=
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 04:51:24PM -0700, Lucas De Marchi wrote:
>On Wed, Jul 14, 2021 at 02:04:12PM -0700, Ashutosh Dixit wrote:
>>On Sun, 11 Jul 2021 08:08:43 -0700, Patchwork wrote:
>>>
>>>Patch Details
>>>
>>> Series:  Start cleanup of local macros/structs (rev2)
>>> URL:  https://patchwork.freedesktop.org/series/92390/
>>> State:  failure
>>> Details:  https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6013/index.html
>>>
>>>CI Bug Log - changes from CI_DRM_10330_full -> IGTPW_6013_full
>>>
>>>Summary
>>>
>>>FAILURE
>>>
>>>Serious unknown changes coming with IGTPW_6013_full absolutely need to be
>>>verified manually.
>>>
>>>If you think the reported changes have nothing to do with the changes
>>>introduced in IGTPW_6013_full, please notify your bug team to allow them
>>>to document this new failure mode, which will reduce false positives in CI.
>>>
>>>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6013/index.html
>>>
>>>Possible new issues
>>>
>>>Here are the unknown changes that may have been introduced in IGTPW_6013_full:
>>>
>>>IGT changes
>>>
>>>Possible regressions
>>>
>>>* igt@i915_pm_rpm@cursor-dpms:
>>>
>>> * shard-iclb: PASS -> FAIL
>>
>>I am assuming this failure is unrelated, i.e. it cannot be caused by this
>>series, correct?
>
>I think it can't, but I didn't have time to review if I did something
>wrong, causing that. I will check soon and if I don't see anything I
>will merge it.
>
>I hit the re-test button to try again.

tests passed. Applied.

Lucas De Marchi

>
>thanks
>Lucas De Marchi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

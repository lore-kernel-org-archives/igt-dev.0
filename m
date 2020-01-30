Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA696F8B5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 00:03:37 +0000 (UTC)
References: <20200129222456.1503424-1-chris@chris-wilson.co.uk>
 <158034094513.5462.8180511184268816239@emeril.freedesktop.org>
 <0b8ec791-96cd-db8b-d81e-e458e58ca767@intel.com>
 <158034225189.14720.7645748499533857319@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <2f8a0f92-c04a-7525-7e5d-28169f3ce256@intel.com>
Date: Wed, 29 Jan 2020 16:03:36 -0800
MIME-Version: 1.0
In-Reply-To: <158034225189.14720.7645748499533857319@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Freloc=3A_Add_SIGINT_injection?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 29/01/20 15:57, Chris Wilson wrote:
> Quoting Antonio Argenziano (2020-01-29 23:55:05)
>>
>>
>> On 29/01/20 15:35, Patchwork wrote:
>>> == Series Details ==
>>>
>>> Series: i915/gem_exec_reloc: Add SIGINT injection
>>> URL   : https://patchwork.freedesktop.org/series/72745/
>>> State : failure
>>>
>>> == Summary ==
>>>
>>> CI Bug Log - changes from IGT_5405 -> IGTPW_4036
>>> ====================================================
>>>
>>> Summary
>>> -------
>>>
>>>     **FAILURE**
>>>
>>>     Serious unknown changes coming with IGTPW_4036 absolutely need to be
>>>     verified manually.
>>>     
>>>     If you think the reported changes have nothing to do with the changes
>>>     introduced in IGTPW_4036, please notify your bug team to allow them
>>>     to document this new failure mode, which will reduce false positives in CI.
>>>
>>>     External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/index.html
>>>
>>> Possible new issues
>>> -------------------
>>>
>>>     Here are the unknown changes that may have been introduced in IGTPW_4036:
>>>
>>> ### IGT changes ###
>>>
>>> #### Possible regressions ####
>>>
>>>     * igt@runner@aborted:
>>>       - fi-bsw-nick:        NOTRUN -> [FAIL][1]
>>>      [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/fi-bsw-nick/igt@runner@aborted.html
>>
>> I doubt this was caused by this patch, can I merge?
> 
> After you fix the lockdep. I've all 3 ready to push, just waiting to
> give the kernel pw a chance (because somewhere in the queue is the fix
> for the above).

Fair.

Antonio

> -Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

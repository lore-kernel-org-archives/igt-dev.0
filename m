Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34D910E79A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jan 2022 23:15:42 +0000 (UTC)
Message-ID: <a1bda840-9b9a-462c-4b76-1a8d630dd128@intel.com>
Date: Thu, 13 Jan 2022 15:15:27 -0800
Content-Language: en-GB
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
 <164211260964.19001.14947415571214721339@emeril.freedesktop.org>
 <20220113225354.GA27056@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220113225354.GA27056@jons-linux-dev-box>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRml4ZXMg?=
 =?utf-8?q?for_i915=5Fhangman_and_gem=5Fexec=5Fcapture_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 1/13/2022 14:53, Matthew Brost wrote:
> On Thu, Jan 13, 2022 at 10:23:29PM +0000, Patchwork wrote:
>> Patch Details
>>
>> Series:  Fixes for i915_hangman and gem_exec_capture (rev6)
>> URL:     https://patchwork.freedesktop.org/series/97981/
>> State:   failure
>> Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6553/index.html
>>
>> CI Bug Log - changes from CI_DRM_11080 -> IGTPW_6553
>>
>> Summary
>>
>> FAILURE
>>
>> Serious unknown changes coming with IGTPW_6553 absolutely need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in IGTPW_6553, please notify your bug team to allow them
>> to document this new failure mode, which will reduce false positives in CI.
>>
>> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6553/index.html
>>
>> Participating hosts (41 -> 41)
>>
>> Additional (1): fi-kbl-soraka
>> Missing (1): fi-bsw-cyan
>>
>> Possible new issues
>>
>> Here are the unknown changes that may have been introduced in IGTPW_6553:
>>
>> IGT changes
>>
>> Possible regressions
>>
>>    • igt@i915_hangman@error-state-basic:
>>        □ bat-dg1-6: PASS -> SKIP
> It looks like it is skipped because of the requirement:
> Test requirement not met in function __igt_unique____real_main495, file ../tests/i915/i915_hangman.c:517:
> Test requirement: gem_mmap__has_wc(device)
>
> Which was added in this patch:
> https://patchwork.freedesktop.org/patch/469465/?series=97981&rev=6
>
>   static void do_tests(const char *name, const char *prefix,
> @@ -433,6 +490,8 @@  igt_main
>   		igt_assert(sysfs != -1);
>   
>   		igt_require(has_error_state(sysfs));
> +
> +		gem_require_mmap_wc(device);
>   	}
>   
>   	igt_describe("Basic error capture");
>
> Do discrete device not support mmap_wc?
>
> Matt
It seemed to be working on a DG2 with an internal kernel. But for 
upstream, it looks like we need to use _device_coherent instead of _wc 
for the require and the actual mmap calls. About to post an updated patch...

John.

>
>> Known issues
>>
>> Here are the changes found in IGTPW_6553 that come from known issues:
>>
>> IGT changes
>>
>> Issues hit
>>
>>    • igt@amdgpu/amd_cs_nop@sync-fork-compute0:
>>
>>        □ fi-snb-2600: NOTRUN -> SKIP (fdo#109271) +17 similar issues
>>    • igt@gem_exec_fence@basic-busy@bcs0:
>>
>>        □ fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271) +8 similar issues
>>    • igt@gem_huc_copy@huc-copy:
>>
>>        □ fi-skl-6600u: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>>
>>        □ fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>>
>>    • igt@gem_lmem_swapping@basic:
>>
>>        □ fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 similar
>>          issues
>>    • igt@gem_lmem_swapping@verify-random:
>>
>>        □ fi-skl-6600u: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 similar issues
>>    • igt@i915_pm_rps@basic-api:
>>
>>        □ bat-dg1-6: PASS -> FAIL (i915#4032)
>>    • igt@i915_selftest@live:
>>
>>        □ fi-skl-6600u: NOTRUN -> INCOMPLETE (i915#4794)
>>    • igt@i915_selftest@live@gt_pm:
>>
>>        □ fi-kbl-soraka: NOTRUN -> DMESG-FAIL (i915#1886 / i915#2291)
>>    • igt@i915_selftest@live@requests:
>>
>>        □ fi-blb-e6850: PASS -> DMESG-FAIL (i915#4528)
>>    • igt@kms_chamelium@common-hpd-after-suspend:
>>
>>        □ fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar
>>          issues
>>    • igt@kms_chamelium@vga-edid-read:
>>
>>        □ fi-skl-6600u: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar
>>          issues
>>    • igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>>
>>        □ fi-skl-6600u: NOTRUN -> SKIP (fdo#109271) +3 similar issues
>>    • igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>>
>>        □ fi-skl-6600u: NOTRUN -> SKIP (fdo#109271 / i915#533)
>>
>>        □ fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / i915#533)
>>
>>    • igt@runner@aborted:
>>
>>        □ fi-blb-e6850: NOTRUN -> FAIL (fdo#109271 / i915#2403 / i915#4312)
>>
>> Possible fixes
>>
>>    • igt@gem_exec_suspend@basic-s3@smem:
>>
>>        □ fi-skl-6600u: INCOMPLETE (i915#4547) -> PASS
>>    • igt@i915_selftest@live@execlists:
>>
>>        □ {bat-jsl-1}: DMESG-FAIL -> PASS
>>    • igt@i915_selftest@live@hangcheck:
>>
>>        □ fi-snb-2600: INCOMPLETE (i915#3921) -> PASS
>>
>> {name}: This element is suppressed. This means it is ignored when computing
>> the status of the difference (SUCCESS, WARNING, or FAILURE).
>>
>> Build changes
>>
>>    • CI: CI-20190529 -> None
>>    • IGT: IGT_6326 -> IGTPW_6553
>>
>> CI-20190529: 20190529
>> CI_DRM_11080: 8f2355c95e279e57a962843e5d7ba38885b3cfb7 @ git://
>> anongit.freedesktop.org/gfx-ci/linux
>> IGTPW_6553: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6553/index.html
>> IGT_6326: ec75f64fcbcf4aac58fbf1bf629e8f59b19db4ce @ https://
>> gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>
>> == Testlist changes ==
>>
>> +igt@i915_hangman@detector
>> +igt@i915_hangman@engine-engine-error
>> +igt@i915_hangman@engine-engine-hang
>> +igt@i915_hangman@engine-error-state-capture
>> +igt@i915_hangman@gt-engine-error
>> +igt@i915_hangman@gt-engine-hang
>> +igt@i915_hangman@gt-error-state-capture
>> -igt@i915_hangman@engine-error
>> -igt@i915_hangman@engine-hang
>> -igt@i915_hangman@error-state-capture
>>
>> SECURITY NOTE: file ~/.netrc must not be accessible by others

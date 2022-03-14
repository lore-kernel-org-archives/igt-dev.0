Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1478510E4FD
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Mar 2022 17:02:16 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id a14so13673403qtx.12
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Mar 2022 10:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220311070309.3281660-1-mastanx.katragadda@intel.com>
 <164722515776.20568.18350303924654466398@emeril.freedesktop.org>
In-Reply-To: <164722515776.20568.18350303924654466398@emeril.freedesktop.org>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 14 Mar 2022 17:01:48 +0000
Message-ID: <CAM0jSHNsB7RVbhb3V_rRc1VSazH8s8nrJv4R7LTD7ZOkVD1sOw@mail.gmail.com>
To: igt-dev@lists.freedesktop.org, lakshminarayana.vudum@intel.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaWd0L2dl?=
	=?utf-8?q?m=5Fmmap=5Foffset=3A_Adding_subtest_oob=5Fread_=28rev4?=
	=?utf-8?q?=29?=
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

On Mon, 14 Mar 2022 at 02:32, Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:igt/gem_mmap_offset: Adding subtest oob_read (rev4)
> URL:https://patchwork.freedesktop.org/series/101187/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6785/index.html
>
> CI Bug Log - changes from CI_DRM_11355 -> IGTPW_6785
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with IGTPW_6785 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6785, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6785/index.html
>
> Participating hosts (43 -> 38)
>
> Missing (5): shard-tglu fi-bsw-cyan shard-rkl shard-dg1 fi-bdw-samus
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_6785:
>
> IGT changes
>
> Possible regressions
>
> igt@i915_selftest@live@gt_heartbeat:
>
> fi-bxt-dsi: PASS -> DMESG-FAIL

Unrelated failure it seems.


>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
> igt@i915_selftest@live@coherency:
>
> {bat-rpls-2}: NOTRUN -> INCOMPLETE
>
> igt@kms_busy@basic@flip:
>
> {bat-adlp-6}: PASS -> DMESG-WARN +1 similar issue
>
> igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
>
> {bat-dg2-9}: NOTRUN -> DMESG-WARN
>
> Known issues
>
> Here are the changes found in IGTPW_6785 that come from known issues:
>
> IGT changes
>
> Issues hit
>
> igt@amdgpu/amd_prime@amd-to-i915:
>
> fi-ivb-3770: NOTRUN -> SKIP (fdo#109271) +17 similar issues
>
> igt@i915_selftest@live@execlists:
>
> fi-kbl-soraka: PASS -> INCOMPLETE (i915#5294 / i915#794)
>
> Possible fixes
>
> igt@i915_selftest@live@hangcheck:
>
> fi-ivb-3770: INCOMPLETE (i915#3303) -> PASS
>
> igt@i915_selftest@live@requests:
>
> {bat-rpls-2}: INCOMPLETE (i915#4391) -> PASS
>
> igt@i915_selftest@live@sanitycheck:
>
> {bat-rpls-2}: DMESG-WARN (i915#4391) -> PASS +1 similar issue
>
> igt@kms_busy@basic@flip:
>
> {bat-dg2-9}: DMESG-WARN (i915#5291) -> PASS
>
> igt@kms_flip@basic-flip-vs-modeset@a-edp1:
>
> {bat-adlp-6}: DMESG-WARN -> PASS
>
> Warnings
>
> igt@runner@aborted:
>
> fi-bsw-n3050: FAIL (fdo#109271 / i915#1436 / i915#3428 / i915#4312) -> FAIL (fdo#109271 / i915#1436 / i915#2722 / i915#3428 / i915#4312)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
> Build changes
>
> CI: CI-20190529 -> None
> IGT: IGT_6378 -> IGTPW_6785
>
> CI-20190529: 20190529
> CI_DRM_11355: 16e4683c0a29f572cbc04ff619f6fdb703d8024e @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_6785: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6785/index.html
> IGT_6378: 9c79047f49acdb6450368ee13fd8b6d28f3fb8e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
> == Testlist changes ==
>
> +igt@gem_mmap_offset@oob-read

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE02610E379
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Feb 2022 07:29:26 +0000 (UTC)
Date: Tue, 1 Feb 2022 08:29:22 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YfjhUtEt7G/bTZ6r@zkempczy-mobl2>
References: <20220131164804.26165-1-zbigniew.kempczynski@intel.com>
 <164365157812.8647.3353202405050166647@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164365157812.8647.3353202405050166647@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9h?=
 =?utf-8?q?pi=5Fintel=5Fbb=3A_Correct_size_for_munmap?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 05:52:58PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  i915/api_intel_bb: Correct size for munmap                     
>    URL:     https://patchwork.freedesktop.org/series/99536/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6589/index.html 
> 
>               CI Bug Log - changes from CI_DRM_11164 -> IGTPW_6589
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6589 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6589, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6589/index.html
> 
> Participating hosts (46 -> 42)
> 
>    Missing (4): fi-bsw-cyan bat-rpls-1 fi-icl-u2 fi-bdw-samus
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_6589:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@core_hotunplug@unbind-rebind:
>           * fi-blb-e6850: PASS -> FAIL

Unrelated to the patch. May I ask for continue run?

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6589 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_huc_copy@huc-copy:
> 
>           * fi-skl-6600u: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * fi-skl-6600u: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 similar
>             issues
>      * igt@kms_chamelium@vga-edid-read:
> 
>           * fi-skl-6600u: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar
>             issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * fi-skl-6600u: NOTRUN -> SKIP (fdo#109271) +2 similar issues
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * fi-skl-6600u: NOTRUN -> SKIP (fdo#109271 / i915#533)
>      * igt@kms_psr@primary_page_flip:
> 
>           * fi-skl-6600u: NOTRUN -> FAIL (i915#4547)
>      * igt@runner@aborted:
> 
>           * fi-skl-6600u: NOTRUN -> FAIL (i915#4312)
> 
>           * fi-bdw-5557u: NOTRUN -> FAIL (i915#2426 / i915#4312)
> 
>     Possible fixes
> 
>      * igt@kms_frontbuffer_tracking@basic:
> 
>           * fi-cfl-8109u: DMESG-FAIL (i915#295) -> PASS
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
> 
>           * fi-cfl-8109u: DMESG-WARN (i915#295) -> PASS +10 similar issues
> 
>     Warnings
> 
>      * igt@i915_selftest@live@hangcheck:
> 
>           * bat-dg1-5: DMESG-FAIL (i915#4494 / i915#4957) -> DMESG-FAIL
>             (i915#4957)
> 
>           * bat-dg1-6: DMESG-FAIL (i915#4494 / i915#4957) -> DMESG-FAIL
>             (i915#4957)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6337 -> IGTPW_6589
> 
>    CI-20190529: 20190529
>    CI_DRM_11164: b0839553cd93d73bf43e0949203b24044113b5e7 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_6589: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6589/index.html
>    IGT_6337: 7c9c034619ef9dbfbfe041fbf3973a1cf1ac7a22 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

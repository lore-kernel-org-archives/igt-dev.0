Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B076E293
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 18:14:14 +0000 (UTC)
References: <20200714203344.1692-1-robert.m.fosha@intel.com>
 <159477691129.3436.796289656751211764@emeril.freedesktop.org>
From: "Argenziano, Antonio" <antonio.argenziano@intel.com>
Message-ID: <ab57a068-cd10-03ec-76bf-b3a37b1019f1@intel.com>
Date: Wed, 15 Jul 2020 11:14:13 -0700
MIME-Version: 1.0
In-Reply-To: <159477691129.3436.796289656751211764@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test_=28rev8=29?=
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
To: igt-dev@lists.freedesktop.org, Patchwork <patchwork@emeril.freedesktop.org>, "Robert M. Fosha" <robert.m.fosha@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 7/14/2020 6:35 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/i915/gem_huc_copy: Enable a HuC copy test (rev8)
> *URL:* 	https://patchwork.freedesktop.org/series/71194/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/index.html
>
>
>   CI Bug Log - changes from CI_DRM_8747_full -> IGTPW_4763_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_4763_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_4763_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/index.html
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_4763_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     {igt@gem_huc_copy@huc-copy} (NEW):
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-iclb2/igt@gem_huc_copy@huc-copy.html>
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-128x128-offscreen:
>
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-128x128-offscreen.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-128x128-offscreen.html>
>

expected behavior for the huc test. Unrelated issue for the KMS test. 
Merged.


Antonio


>  *
>
>
>         Warnings
>
>   * igt@kms_content_protection@uevent:
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-kbl4/igt@kms_content_protection@uevent.html>
>         (i915#2105
>         <https://gitlab.freedesktop.org/drm/intel/issues/2105>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-kbl1/igt@kms_content_protection@uevent.html>
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_8747_full and 
> IGTPW_4763_full:
>
>
>       New IGT tests (1)
>
>   * igt@gem_huc_copy@huc-copy:
>       o Statuses : 1 pass(s) 6 skip(s)
>       o Exec time: [0.0, 0.00] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_4763_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-hsw7/igt@gem_eio@unwedge-stress.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-hsw7/igt@gem_eio@unwedge-stress.html>
>         (i915#2164 <https://gitlab.freedesktop.org/drm/intel/issues/2164>)
>  *
>
>     igt@gem_exec_whisper@basic-forked-all:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-glk3/igt@gem_exec_whisper@basic-forked-all.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-glk2/igt@gem_exec_whisper@basic-forked-all.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>         i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>         +3 similar issues
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-tglb7/igt@i915_module_load@reload-with-fault-injection.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-tglb1/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#402
>         <https://gitlab.freedesktop.org/drm/intel/issues/402>) +2
>         similar issues
>  *
>
>     igt@i915_pm_dc@dc5-psr:
>
>      o
>
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-iclb2/igt@i915_pm_dc@dc5-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-iclb8/igt@i915_pm_dc@dc5-psr.html>
>         (i915#1899 <https://gitlab.freedesktop.org/drm/intel/issues/1899>)
>
>      o
>
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-tglb1/igt@i915_pm_dc@dc5-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-tglb6/igt@i915_pm_dc@dc5-psr.html>
>         (i915#1899 <https://gitlab.freedesktop.org/drm/intel/issues/1899>)
>
>  *
>
>     igt@i915_selftest@mock@requests:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-tglb7/igt@i915_selftest@mock@requests.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-tglb1/igt@i915_selftest@mock@requests.html>
>         (i915#2110 <https://gitlab.freedesktop.org/drm/intel/issues/2110>)
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-0:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>         i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-180:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-apl4/igt@kms_big_fb@linear-64bpp-rotate-180.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-apl6/igt@kms_big_fb@linear-64bpp-rotate-180.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +1
>         similar issue
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) +6
>         similar issues
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
>
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html>
>         (i915#2055 <https://gitlab.freedesktop.org/drm/intel/issues/2055>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +1
>         similar issue
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (i915#49 <https://gitlab.freedesktop.org/drm/intel/issues/49>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-stridechange:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-glk4/igt@kms_frontbuffer_tracking@fbc-stridechange.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-glk8/igt@kms_frontbuffer_tracking@fbc-stridechange.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +2
>         similar issues
>  *
>
>     igt@kms_psr@no_drrs:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-iclb4/igt@kms_psr@no_drrs.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-iclb1/igt@kms_psr@no_drrs.html>
>         (i915#173 <https://gitlab.freedesktop.org/drm/intel/issues/173>)
>  *
>
>     igt@kms_psr@psr2_cursor_plane_onoff:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
>  *
>
>     igt@perf@blocking-parameterized:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-iclb2/igt@perf@blocking-parameterized.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-iclb6/igt@perf@blocking-parameterized.html>
>         (i915#1542 <https://gitlab.freedesktop.org/drm/intel/issues/1542>)
>  *
>
>     igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled:
>
>      o
>
>         shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-snb6/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-snb1/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled.html>
>         (i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958> /
>         i915#2119 <https://gitlab.freedesktop.org/drm/intel/issues/2119>)
>
>      o
>
>         shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-hsw1/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-hsw7/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled.html>
>         (i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958> /
>         i915#2119 <https://gitlab.freedesktop.org/drm/intel/issues/2119>)
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_exec_balancer@bonded-early:
>
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-kbl1/igt@gem_exec_balancer@bonded-early.html>
>         (i915#2079
>         <https://gitlab.freedesktop.org/drm/intel/issues/2079>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-kbl1/igt@gem_exec_balancer@bonded-early.html>
>  *
>
>     igt@gem_exec_whisper@basic-queues-priority:
>
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-glk9/igt@gem_exec_whisper@basic-queues-priority.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>         i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-glk8/igt@gem_exec_whisper@basic-queues-priority.html>
>  *
>
>     igt@gem_mmap_gtt@cpuset-basic-small-copy:
>
>       o shard-iclb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-iclb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-iclb5/igt@gem_mmap_gtt@cpuset-basic-small-copy.html>
>  *
>
>     igt@gem_softpin@noreloc-interruptible:
>
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-snb4/igt@gem_softpin@noreloc-interruptible.html>
>         (i915#82 <https://gitlab.freedesktop.org/drm/intel/issues/82>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-snb5/igt@gem_softpin@noreloc-interruptible.html>
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-apl7/igt@gen9_exec_parse@allowed-all.html>
>         (i915#1436
>         <https://gitlab.freedesktop.org/drm/intel/issues/1436> /
>         i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#716
>         <https://gitlab.freedesktop.org/drm/intel/issues/716>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-apl6/igt@gen9_exec_parse@allowed-all.html>
>  *
>
>     igt@i915_selftest@mock@requests:
>
>       o shard-iclb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-iclb3/igt@i915_selftest@mock@requests.html>
>         (i915#2110
>         <https://gitlab.freedesktop.org/drm/intel/issues/2110>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-iclb2/igt@i915_selftest@mock@requests.html>
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-suspend:
>
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>
>         (i915#165
>         <https://gitlab.freedesktop.org/drm/intel/issues/165>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-suspend:
>
>       o shard-kbl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>         (i915#155
>         <https://gitlab.freedesktop.org/drm/intel/issues/155>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>  *
>
>     igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
>
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-glk3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-glk8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html>
>         +1 similar issue
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-dp1:
>
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         +1 similar issue
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html>
>         +1 similar issue
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
>
>       o shard-tglb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
>         (CI#80
>         <https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80> /
>         i915#1798
>         <https://gitlab.freedesktop.org/drm/intel/issues/1798> /
>         i915#456
>         <https://gitlab.freedesktop.org/drm/intel/issues/456>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
>  *
>
>     igt@kms_plane@plane-position-covered-pipe-b-planes:
>
>      o
>
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html>
>         (i915#247
>         <https://gitlab.freedesktop.org/drm/intel/issues/247>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html>
>
>      o
>
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-apl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#247
>         <https://gitlab.freedesktop.org/drm/intel/issues/247>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-apl3/igt@kms_plane@plane-position-covered-pipe-b-planes.html>
>
>  *
>
>     igt@kms_psr@psr2_sprite_mmap_gtt:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>         +2 similar issues
>  *
>
>     igt@kms_vblank@pipe-a-query-busy-hang:
>
>      o
>
>         shard-hsw: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-hsw1/igt@kms_vblank@pipe-a-query-busy-hang.html>
>         (i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958> /
>         i915#2119
>         <https://gitlab.freedesktop.org/drm/intel/issues/2119>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-hsw1/igt@kms_vblank@pipe-a-query-busy-hang.html>
>
>      o
>
>         shard-snb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-snb4/igt@kms_vblank@pipe-a-query-busy-hang.html>
>         (i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958> /
>         i915#2119
>         <https://gitlab.freedesktop.org/drm/intel/issues/2119>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-snb6/igt@kms_vblank@pipe-a-query-busy-hang.html>
>
>  *
>
>     igt@kms_vblank@pipe-c-query-forked-busy-hang:
>
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-apl6/igt@kms_vblank@pipe-c-query-forked-busy-hang.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-apl8/igt@kms_vblank@pipe-c-query-forked-busy-hang.html>
>  *
>
>     igt@testdisplay:
>
>       o shard-kbl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-kbl6/igt@testdisplay.html>
>         (i915#1692
>         <https://gitlab.freedesktop.org/drm/intel/issues/1692> /
>         i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958> /
>         i915#2119
>         <https://gitlab.freedesktop.org/drm/intel/issues/2119>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-kbl2/igt@testdisplay.html>
>
>
>         Warnings
>
>  *
>
>     igt@gen9_exec_parse@bb-start-far:
>
>       o shard-hsw: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-hsw1/igt@gen9_exec_parse@bb-start-far.html>
>         (i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-hsw6/igt@gen9_exec_parse@bb-start-far.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>  *
>
>     igt@i915_pm_dc@dc3co-vpb-simulation:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#588 <https://gitlab.freedesktop.org/drm/intel/issues/588>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>
>      o
>
>         shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html>
>         (i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958> /
>         i915#2119
>         <https://gitlab.freedesktop.org/drm/intel/issues/2119>) +1
>         similar issue
>
>      o
>
>         shard-hsw: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-hsw2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-hsw7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html>
>         (i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958> /
>         i915#2119
>         <https://gitlab.freedesktop.org/drm/intel/issues/2119>) +1
>         similar issue
>
>  *
>
>     igt@kms_plane_cursor@pipe-d-overlay-size-128:
>
>      o
>
>         shard-hsw: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-hsw1/igt@kms_plane_cursor@pipe-d-overlay-size-128.html>
>         (i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958> /
>         i915#2119
>         <https://gitlab.freedesktop.org/drm/intel/issues/2119>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-hsw1/igt@kms_plane_cursor@pipe-d-overlay-size-128.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +2
>         similar issues
>
>      o
>
>         shard-snb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-snb4/igt@kms_plane_cursor@pipe-d-overlay-size-128.html>
>         (i915#1958
>         <https://gitlab.freedesktop.org/drm/intel/issues/1958> /
>         i915#2119
>         <https://gitlab.freedesktop.org/drm/intel/issues/2119>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-snb2/igt@kms_plane_cursor@pipe-d-overlay-size-128.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +3
>         similar issues
>
>  *
>
>     igt@runner@aborted:
>
>      o
>
>         shard-apl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-apl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-apl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-apl7/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1610
>         <https://gitlab.freedesktop.org/drm/intel/issues/1610> /
>         i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#2110
>         <https://gitlab.freedesktop.org/drm/intel/issues/2110> /
>         i915#637 <https://gitlab.freedesktop.org/drm/intel/issues/637>
>         / i915#716
>         <https://gitlab.freedesktop.org/drm/intel/issues/716>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-apl6/igt@runner@aborted.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#2110 <https://gitlab.freedesktop.org/drm/intel/issues/2110>)
>
>      o
>
>         shard-tglb: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-tglb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8747/shard-tglb7/igt@runner@aborted.html>)
>         (i915#1602
>         <https://gitlab.freedesktop.org/drm/intel/issues/1602> /
>         i915#2110
>         <https://gitlab.freedesktop.org/drm/intel/issues/2110>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/shard-tglb1/igt@runner@aborted.html>
>         (i915#2110 <https://gitlab.freedesktop.org/drm/intel/issues/2110>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Participating hosts (9 -> 8)
>
> Missing (1): pig-skl-6260u
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5735 -> IGTPW_4763
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_8747: f778a4bc7c6d0314c8a007e792313f5cbd549566 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_4763: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4763/index.html
> IGT_5735: 21f8204e54c122e4a0f8ca4b59e4b2db8d1ba687 @ 
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667476E188
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 10:45:37 +0000 (UTC)
References: <20201007060949.3858-1-karthik.b.s@intel.com>
 <160206336185.15195.9060202027318987654@emeril.freedesktop.org>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <d8d9c1fe-a8f3-6e60-ebf7-833c295ad010@intel.com>
Date: Tue, 17 Nov 2020 16:15:31 +0530
MIME-Version: 1.0
In-Reply-To: <160206336185.15195.9060202027318987654@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Fjoiner=3A_Add_test_to_validate_big_joiner_=28rev4?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1989839103=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1989839103==
Content-Type: multipart/alternative;
 boundary="------------181F30942655EF8B1888F877"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------181F30942655EF8B1888F877
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lakshmi,

This looks like a false negative.
As the patch is now rb'ed, could you please trigger a rerun?
So that I can get this merged once the CI is green.

Thanks,
Karthik.B.S

On 10/7/2020 3:06 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_big_joiner: Add test to validate big joiner (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/78769/ 
> <https://patchwork.freedesktop.org/series/78769/>
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html>
>
>
>   CI Bug Log - changes from CI_DRM_9106_full -> IGTPW_5041_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_5041_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5041_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_5041_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@gem_blits@basic:
>
>      o
>
>         shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw4/igt@gem_blits@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw4/igt@gem_blits@basic.html>
>         +3 similar issues
>
>      o
>
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb7/igt@gem_blits@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@gem_blits@basic.html>
>         +1 similar issue
>
>      o
>
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@gem_blits@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl1/igt@gem_blits@basic.html>
>         +2 similar issues
>
>  *
>
>     igt@gem_ctx_engines@invalid-engines:
>
>      o
>
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb2/igt@gem_ctx_engines@invalid-engines.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb3/igt@gem_ctx_engines@invalid-engines.html>
>         +2 similar issues
>
>      o
>
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk6/igt@gem_ctx_engines@invalid-engines.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk9/igt@gem_ctx_engines@invalid-engines.html>
>         +2 similar issues
>
>      o
>
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@gem_ctx_engines@invalid-engines.html>
>
>  *
>
>     igt@gem_ctx_param@root-set-no-zeromap-enabled:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-snb6/igt@gem_ctx_param@root-set-no-zeromap-enabled.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-snb6/igt@gem_ctx_param@root-set-no-zeromap-enabled.html>
>         +2 similar issues
>  *
>
>     {igt@kms_big_joiner@basic} (NEW):
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@kms_big_joiner@basic.html>
>         +1 similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb8/igt@kms_big_joiner@basic.html>
>         +1 similar issue
>
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * {igt@kms_async_flips@alternate-sync-async-flip}:
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html>
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_9106_full and 
> IGTPW_5041_full:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@kms_big_joiner@basic:
>
>       o Statuses : 7 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_big_joiner@invalid-modeset:
>
>       o Statuses : 7 skip(s)
>       o Exec time: [0.0] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_5041_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@gem_ctx_engines@invalid-engines:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl4/igt@gem_ctx_engines@invalid-engines.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl4/igt@gem_ctx_engines@invalid-engines.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635>) +2
>         similar issues
>  *
>
>     igt@gem_exec_whisper@basic-contexts-forked-all:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>         i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>         +1 similar issue
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb8/igt@gem_huc_copy@huc-copy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb6/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html>
>         (i915#54 <https://gitlab.freedesktop.org/drm/intel/issues/54>)
>         +1 similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:
>
>      o
>
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html>
>         (i915#54 <https://gitlab.freedesktop.org/drm/intel/issues/54>)
>
>      o
>
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#54 <https://gitlab.freedesktop.org/drm/intel/issues/54>)
>         +1 similar issue
>
>  *
>
>     igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-snb2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-snb2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html>
>         (i915#2370 <https://gitlab.freedesktop.org/drm/intel/issues/2370>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk9/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk9/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html>
>         (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +3
>         similar issues
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) +5
>         similar issues
>  *
>
>     igt@kms_psr2_su@frontbuffer:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb5/igt@kms_psr2_su@frontbuffer.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb1/igt@kms_psr2_su@frontbuffer.html>
>         (i915#1911 <https://gitlab.freedesktop.org/drm/intel/issues/1911>)
>  *
>
>     igt@kms_psr@psr2_cursor_render:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb2/igt@kms_psr@psr2_cursor_render.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb4/igt@kms_psr@psr2_cursor_render.html>
>         (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>  *
>
>     igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html>
>         (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_exec_reloc@basic-many-active@rcs0:
>
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>  *
>
>     igt@gem_exec_whisper@basic-queues-forked:
>
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>         i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk8/igt@gem_exec_whisper@basic-queues-forked.html>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-fence:
>
>       o shard-hsw: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html>
>         (i915#1519
>         <https://gitlab.freedesktop.org/drm/intel/issues/1519>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html>
>  *
>
>     {igt@kms_async_flips@async-flip-with-page-flip-events}:
>
>      o
>
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#2521
>         <https://gitlab.freedesktop.org/drm/intel/issues/2521>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>
>      o
>
>         shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         (i915#2521
>         <https://gitlab.freedesktop.org/drm/intel/issues/2521>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-180:
>
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html>
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
>
>      o
>
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html>
>         (i915#54 <https://gitlab.freedesktop.org/drm/intel/issues/54>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html>
>
>      o
>
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#54 <https://gitlab.freedesktop.org/drm/intel/issues/54>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html>
>
>      o
>
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html>
>         (i915#54 <https://gitlab.freedesktop.org/drm/intel/issues/54>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html>
>
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>
>       o shard-hsw: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         (i915#96 <https://gitlab.freedesktop.org/drm/intel/issues/96>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>  *
>
>     igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:
>
>       o shard-hsw: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html>
>         +1 similar issue
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>         +4 similar issues
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
>
>       o shard-hsw: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html>
>         (i915#2055
>         <https://gitlab.freedesktop.org/drm/intel/issues/2055>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>
>      o
>
>         shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         +2 similar issues
>
>      o
>
>         shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-iclb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html>
>         (i915#433
>         <https://gitlab.freedesktop.org/drm/intel/issues/433>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html>
>  *
>
>     igt@kms_psr@psr2_primary_page_flip:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html>
>         +2 similar issues
>  *
>
>     igt@kms_universal_plane@universal-plane-pipe-c-functional:
>
>      o
>
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk5/igt@kms_universal_plane@universal-plane-pipe-c-functional.html>
>         (i915#331
>         <https://gitlab.freedesktop.org/drm/intel/issues/331>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html>
>
>      o
>
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html>
>         (i915#331
>         <https://gitlab.freedesktop.org/drm/intel/issues/331>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html>
>
>      o
>
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#331
>         <https://gitlab.freedesktop.org/drm/intel/issues/331>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html>
>
>  *
>
>     igt@sysfs_heartbeat_interval@mixed@vcs0:
>
>       o shard-kbl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs0.html>
>         (i915#1731
>         <https://gitlab.freedesktop.org/drm/intel/issues/1731>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@sysfs_heartbeat_interval@mixed@vcs0.html>
>
>
>         Warnings
>
>  *
>
>     igt@gem_exec_reloc@basic-many-active@vcs1:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@gem_exec_reloc@basic-many-active@vcs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@gem_exec_reloc@basic-many-active@vcs1.html>
>         (i915#2389
>         <https://gitlab.freedesktop.org/drm/intel/issues/2389>) +2
>         similar issues
>  *
>
>     igt@i915_pm_dc@dc3co-vpb-simulation:
>
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#2411
>         <https://gitlab.freedesktop.org/drm/intel/issues/2411>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#1904 <https://gitlab.freedesktop.org/drm/intel/issues/1904>)
>  *
>
>     igt@i915_suspend@forcewake:
>
>       o shard-tglb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb6/igt@i915_suspend@forcewake.html>
>         (i915#1436
>         <https://gitlab.freedesktop.org/drm/intel/issues/1436> /
>         i915#1602
>         <https://gitlab.freedesktop.org/drm/intel/issues/1602> /
>         i915#1887
>         <https://gitlab.freedesktop.org/drm/intel/issues/1887> /
>         i915#2411
>         <https://gitlab.freedesktop.org/drm/intel/issues/2411> /
>         i915#456
>         <https://gitlab.freedesktop.org/drm/intel/issues/456>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@i915_suspend@forcewake.html>
>         (i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_content_protection@atomic-dpms.html>
>         (fdo#110321
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110321> /
>         fdo#110336
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110336> /
>         i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl7/igt@kms_content_protection@atomic-dpms.html>
>         (i915#1319
>         <https://gitlab.freedesktop.org/drm/intel/issues/1319> /
>         i915#1635 <https://gitlab.freedesktop.org/drm/intel/issues/1635>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-apl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_content_protection@legacy.html>
>         (i915#1319
>         <https://gitlab.freedesktop.org/drm/intel/issues/1319> /
>         i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl6/igt@kms_content_protection@legacy.html>
>         (fdo#110321
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110321> /
>         fdo#110336
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110336> /
>         i915#1635 <https://gitlab.freedesktop.org/drm/intel/issues/1635>)
>  *
>
>     igt@kms_dp_dsc@basic-dsc-enable-edp:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html>
>         (fdo#109349
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109349>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html>
>         (i915#1226 <https://gitlab.freedesktop.org/drm/intel/issues/1226>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Participating hosts (11 -> 8)
>
> Missing (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5802 -> IGTPW_5041
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_9106: 7d08cf1b378a1481fcbe16ac801d5408651a25c0 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_5041: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html
> IGT_5802: 0e4fbc60ca5ad6585e642d2ddf8313f3c738426e @ 
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>


--------------181F30942655EF8B1888F877
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Lakshmi,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">This looks like a false negative.</div>
    <div class="moz-cite-prefix">As the patch is now rb'ed, could you
      please trigger a rerun?</div>
    <div class="moz-cite-prefix">So that I can get this merged once the
      CI is green.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Thanks,</div>
    <div class="moz-cite-prefix">Karthik.B.S</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 10/7/2020 3:06 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:160206336185.15195.9060202027318987654@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">
   td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_big_joiner: Add test to validate big joiner
              (rev4)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/78769/"
                moz-do-not-send="true">https://patchwork.freedesktop.org/series/78769/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html"
                moz-do-not-send="true">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_9106_full -&gt;
        IGTPW_5041_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_5041_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_5041_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html</a></p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_5041_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@gem_blits@basic:</p>
          <ul>
            <li>
              <p>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw4/igt@gem_blits@basic.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw4/igt@gem_blits@basic.html"
                  moz-do-not-send="true">FAIL</a> +3 similar issues</p>
            </li>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb7/igt@gem_blits@basic.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@gem_blits@basic.html"
                  moz-do-not-send="true">FAIL</a> +1 similar issue</p>
            </li>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@gem_blits@basic.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl1/igt@gem_blits@basic.html"
                  moz-do-not-send="true">FAIL</a> +2 similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_engines@invalid-engines:</p>
          <ul>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb2/igt@gem_ctx_engines@invalid-engines.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb3/igt@gem_ctx_engines@invalid-engines.html"
                  moz-do-not-send="true">FAIL</a> +2 similar issues</p>
            </li>
            <li>
              <p>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk6/igt@gem_ctx_engines@invalid-engines.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk9/igt@gem_ctx_engines@invalid-engines.html"
                  moz-do-not-send="true">FAIL</a> +2 similar issues</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@gem_ctx_engines@invalid-engines.html"
                  moz-do-not-send="true">FAIL</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_param@root-set-no-zeromap-enabled:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-snb6/igt@gem_ctx_param@root-set-no-zeromap-enabled.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-snb6/igt@gem_ctx_param@root-set-no-zeromap-enabled.html"
                moz-do-not-send="true">FAIL</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_big_joiner@basic} (NEW):</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@kms_big_joiner@basic.html"
                  moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb8/igt@kms_big_joiner@basic.html"
                  moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>{igt@kms_async_flips@alternate-sync-async-flip}:
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_9106_full and
        IGTPW_5041_full:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@kms_big_joiner@basic:</p>
          <ul>
            <li>Statuses : 7 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@invalid-modeset:</p>
          <ul>
            <li>Statuses : 7 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_5041_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@gem_ctx_engines@invalid-engines:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl4/igt@gem_ctx_engines@invalid-engines.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl4/igt@gem_ctx_engines@invalid-engines.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/118"
                moz-do-not-send="true">i915#118</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/95"
                moz-do-not-send="true">i915#95</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb8/igt@gem_huc_copy@huc-copy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb6/igt@gem_huc_copy@huc-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2190"
                moz-do-not-send="true">i915#2190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/54"
                moz-do-not-send="true">i915#54</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:</p>
          <ul>
            <li>
              <p>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/54"
                  moz-do-not-send="true">i915#54</a>)</p>
            </li>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/54"
                  moz-do-not-send="true">i915#54</a>) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-snb2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-snb2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2370"
                moz-do-not-send="true">i915#2370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/79"
                moz-do-not-send="true">i915#79</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk9/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk9/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb5/igt@kms_psr2_su@frontbuffer.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb1/igt@kms_psr2_su@frontbuffer.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1911"
                moz-do-not-send="true">i915#1911</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_render:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb2/igt@kms_psr@psr2_cursor_render.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb4/igt@kms_psr@psr2_cursor_render.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                moz-do-not-send="true">fdo#109441</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-queues-forked:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/118"
                moz-do-not-send="true">i915#118</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/95"
                moz-do-not-send="true">i915#95</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk8/igt@gem_exec_whisper@basic-queues-forked.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-fence:</p>
          <ul>
            <li>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1519"
                moz-do-not-send="true">i915#1519</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
          <ul>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2521"
                  moz-do-not-send="true">i915#2521</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2521"
                  moz-do-not-send="true">i915#2521</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-256x85-random:</p>
          <ul>
            <li>
              <p>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/54"
                  moz-do-not-send="true">i915#54</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/54"
                  moz-do-not-send="true">i915#54</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/54"
                  moz-do-not-send="true">i915#54</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/96"
                moz-do-not-send="true">i915#96</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:</p>
          <ul>
            <li>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
          <ul>
            <li>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2055"
                moz-do-not-send="true">i915#2055</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                  moz-do-not-send="true">DMESG-WARN</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                  moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                  moz-do-not-send="true">PASS</a> +2 similar issues</p>
            </li>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                  moz-do-not-send="true">DMESG-WARN</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                  moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/433"
                moz-do-not-send="true">i915#433</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_page_flip:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                moz-do-not-send="true">fdo#109441</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-pipe-c-functional:</p>
          <ul>
            <li>
              <p>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk5/igt@kms_universal_plane@universal-plane-pipe-c-functional.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/331"
                  moz-do-not-send="true">i915#331</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/331"
                  moz-do-not-send="true">i915#331</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/331"
                  moz-do-not-send="true">i915#331</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_heartbeat_interval@mixed@vcs0:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs0.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1731"
                moz-do-not-send="true">i915#1731</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@sysfs_heartbeat_interval@mixed@vcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@gem_exec_reloc@basic-many-active@vcs1.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@gem_exec_reloc@basic-many-active@vcs1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2389"
                moz-do-not-send="true">i915#2389</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2411"
                moz-do-not-send="true">i915#2411</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1904"
                moz-do-not-send="true">i915#1904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@forcewake:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb6/igt@i915_suspend@forcewake.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1436"
                moz-do-not-send="true">i915#1436</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1602"
                moz-do-not-send="true">i915#1602</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1887"
                moz-do-not-send="true">i915#1887</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2411"
                moz-do-not-send="true">i915#2411</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/456"
                moz-do-not-send="true">i915#456</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@i915_suspend@forcewake.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2411"
                moz-do-not-send="true">i915#2411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_content_protection@atomic-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=110321"
                moz-do-not-send="true">fdo#110321</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=110336"
                moz-do-not-send="true">fdo#110336</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl7/igt@kms_content_protection@atomic-dpms.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1319"
                moz-do-not-send="true">i915#1319</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_content_protection@legacy.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1319"
                moz-do-not-send="true">i915#1319</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl6/igt@kms_content_protection@legacy.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=110321"
                moz-do-not-send="true">fdo#110321</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=110336"
                moz-do-not-send="true">fdo#110336</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109349"
                moz-do-not-send="true">fdo#109349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1226"
                moz-do-not-send="true">i915#1226</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Participating hosts (11 -&gt; 8)</h2>
      <p>Missing (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_5802 -&gt; IGTPW_5041</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_9106: 7d08cf1b378a1481fcbe16ac801d5408651a25c0 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_5041:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html</a><br>
        IGT_5802: 0e4fbc60ca5ad6585e642d2ddf8313f3c738426e @
        git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------181F30942655EF8B1888F877--

--===============1989839103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1989839103==--

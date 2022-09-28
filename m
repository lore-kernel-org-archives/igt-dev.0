Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE63910E8EF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 19:25:40 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id 13so29202658ejn.3
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 12:25:40 -0700 (PDT)
Message-ID: <ccd02e9a-479c-c24f-1a42-863a227b47f1@gmail.com>
Date: Wed, 28 Sep 2022 22:25:31 +0300
MIME-Version: 1.0
Content-Language: en-US
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
 <166436423136.594.3765855369157814551@emeril.freedesktop.org>
 <3cdda6d5-0d80-8a4f-6625-7736b99f60e1@gmail.com>
 <DM4PR11MB6213122A5BCD8BE530D8BC52EC549@DM4PR11MB6213.namprd11.prod.outlook.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <DM4PR11MB6213122A5BCD8BE530D8BC52EC549@DM4PR11MB6213.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbWlzYyBm?=
 =?utf-8?q?ixes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks for the help Lakshmi. Much appreciated.

/Juha-Pekka

On 28.9.2022 20.21, Vudum, Lakshminarayana wrote:
> Filed a couple of new issues and re-reported.
> https://gitlab.freedesktop.org/drm/intel/-/issues/6971
> igt@prime_nv_test@i915_blt_fill_nv_read|igt@nouveau_crc@pipe-b-source-outp-inactive - skip - Cannot execute /opt/igt/libexec/igt-gpu-tools.*, watchdogs from exit handler!, SKIP
> 
> https://gitlab.freedesktop.org/drm/intel/-/issues/6970
> igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-2 - fail - Failed assertion: write(pipe_crc->ctl_fd, src, strlen(src)) == strlen(src)
> 
> Thanks,
> Lakshmi.
> 
> -----Original Message-----
> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Sent: Wednesday, September 28, 2022 4:47 AM
> To: igt-dev@lists.freedesktop.org; Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> Subject: Re: ✗ Fi.CI.IGT: failure for misc fixes
> 
> Hi Lakshmi,
> 
> These listed failures don't seem to relate to my changes in any way.
> 
> /Juha-Pekka
> 
> On 28.9.2022 14.23, Patchwork wrote:
>> *Patch Details*
>> *Series:*	misc fixes
>> *URL:*	https://patchwork.freedesktop.org/series/109144/
>> <https://patchwork.freedesktop.org/series/109144/>
>> *State:*	failure
>> *Details:*
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/index.html
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/index.html>
>>
>>
>>    CI Bug Log - changes from CI_DRM_12192_full -> IGTPW_7852_full
>>
>>
>>      Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with IGTPW_7852_full absolutely need to
>> be verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in IGTPW_7852_full, please notify your bug team to allow
>> them to document this new failure mode, which will reduce false positives in CI.
>>
>> External URL:
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/index.html
>>
>>
>>      Participating hosts (11 -> 6)
>>
>> Missing (5): pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u
>> shard-rkl
>>
>>
>>      Possible new issues
>>
>> Here are the unknown changes that may have been introduced in
>> IGTPW_7852_full:
>>
>>
>>        IGT changes
>>
>>
>>          Possible regressions
>>
>>    *
>>
>>      igt@api_intel_allocator@fork-simple-stress:
>>
>>        o shard-tglb: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-tglb2/igt@api_intel_allocator@fork-simple-stress.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb8/igt@api_intel_allocator@fork-simple-stress.html>
>>    *
>>
>>      igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-2:
>>
>>        o shard-glk: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-glk7/igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk5/igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-2.html>
>>    *
>>
>>      igt@nouveau_crc@pipe-b-source-outp-inactive:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-inactive.html> +48 similar issues
>>    *
>>
>>      igt@prime_nv_test@i915_blt_fill_nv_read:
>>
>>        o shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb6/igt@p
>> rime_nv_test@i915_blt_fill_nv_read.html> +49 similar issues
>>
>>
>>      Known issues
>>
>> Here are the changes found in IGTPW_7852_full that come from known issues:
>>
>>
>>        IGT changes
>>
>>
>>          Issues hit
>>
>>    *
>>
>>      igt@gem_ccs@block-copy-compressed:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb2/igt@gem_ccs@block-copy-compressed.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>)
>>    *
>>
>>      igt@gem_ctx_persistence@engines-hang@rcs0:
>>
>>        o shard-apl: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl8/igt@gem_ctx_persistence@engines-hang@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl2/igt@gem_ctx_persistence@engines-hang@rcs0.html> (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>>    *
>>
>>      igt@gem_exec_balancer@parallel-bb-first:
>>
>>        o shard-iclb: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html> (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>) +1 similar issue
>>    *
>>
>>      igt@gem_exec_capture@capture-recoverable:
>>
>>        o
>>
>>          shard-tglb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb1/igt@g
>> em_exec_capture@capture-recoverable.html> (i915#6344
>> <https://gitlab.freedesktop.org/drm/intel/issues/6344>)
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb6/igt@g
>> em_exec_capture@capture-recoverable.html> (i915#6344
>> <https://gitlab.freedesktop.org/drm/intel/issues/6344>)
>>
>>    *
>>
>>      igt@gem_exec_fair@basic-none-share@rcs0:
>>
>>        o shard-glk: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>>    *
>>
>>      igt@gem_lmem_swapping@heavy-verify-random-ccs:
>>
>>        o
>>
>>          shard-apl: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl7/igt@ge
>> m_lmem_swapping@heavy-verify-random-ccs.html> (fdo#109271
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613
>> <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1 similar
>> issue
>>
>>        o
>>
>>          shard-tglb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb2/igt@g
>> em_lmem_swapping@heavy-verify-random-ccs.html> (i915#4613
>> <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>>
>>        o
>>
>>          shard-glk: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk2/igt@ge
>> m_lmem_swapping@heavy-verify-random-ccs.html> (fdo#109271
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613
>> <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb7/igt@g
>> em_lmem_swapping@heavy-verify-random-ccs.html> (i915#4613
>> <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>>
>>    *
>>
>>      igt@gem_mmap_gtt@fault-concurrent-x:
>>
>>        o shard-snb: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-x.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-snb7/igt@gem_mmap_gtt@fault-concurrent-x.html> (i915#5161 <https://gitlab.freedesktop.org/drm/intel/issues/5161>)
>>    *
>>
>>      igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb8/igt@g
>> em_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>>
>>        o
>>
>>          shard-tglb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb8/igt@g
>> em_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1
>> similar issue
>>
>>    *
>>
>>      igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
>>
>>        o shard-iclb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb8/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html> (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>) +1 similar issue
>>    *
>>
>>      igt@gem_userptr_blits@input-checking:
>>
>>        o shard-apl: NOTRUN -> DMESG-WARN
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl1/igt@gem_userptr_blits@input-checking.html> (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>>    *
>>
>>      igt@gen7_exec_parse@basic-allowed:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb2/igt@gen7_exec_parse@basic-allowed.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>>    *
>>
>>      igt@gen9_exec_parse@allowed-all:
>>
>>        o shard-glk: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-glk6/igt@gen9_exec_parse@allowed-all.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk6/igt@gen9_exec_parse@allowed-all.html> (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566> / i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>>    *
>>
>>      igt@i915_pm_dc@dc6-psr:
>>
>>        o shard-iclb: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb6/igt@i915_pm_dc@dc6-psr.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb4/igt@i915_pm_dc@dc6-psr.html> (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> / i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>>    *
>>
>>      igt@i915_pm_dc@dc9-dpms:
>>
>>        o
>>
>>          shard-apl: PASS
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl8/igt@
>> i915_pm_dc@dc9-dpms.html> -> SKIP
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl6/igt@i9
>> 15_pm_dc@dc9-dpms.html> (fdo#109271
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>        o
>>
>>          shard-tglb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb8/igt@i
>> 915_pm_dc@dc9-dpms.html> (i915#4281
>> <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
>>
>>    *
>>
>>      igt@i915_selftest@live@gt_heartbeat:
>>
>>        o shard-apl: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl8/igt@i915_selftest@live@gt_heartbeat.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>>    *
>>
>>      igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1 similar issue
>>    *
>>
>>      igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb1/igt@k
>> ms_big_fb@x-tiled-8bpp-rotate-270.html> (fdo#110725
>> <https://bugs.freedesktop.org/show_bug.cgi?id=110725> / fdo#111614
>> <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>>
>>        o
>>
>>          shard-tglb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb8/igt@k
>> ms_big_fb@x-tiled-8bpp-rotate-270.html> (fdo#111614
>> <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>>
>>    *
>>
>>      igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb4/igt@k
>> ms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html> (fdo#109278
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +3 similar
>> issues
>>
>>        o
>>
>>          shard-tglb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb8/igt@k
>> ms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html> (i915#6095
>> <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>>
>>    *
>>
>>      igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>>
>>        o shard-apl: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +181 similar issues
>>    *
>>
>>      igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +1 similar issue
>>    *
>>
>>      igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>>
>>        o
>>
>>          shard-glk: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk9/igt@km
>> s_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>> i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb2/igt@k
>> ms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>> (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>> i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>>
>>    *
>>
>>      igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>>    *
>>
>>      igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +2 similar issues
>>    *
>>
>>      igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
>>
>>        o shard-apl: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl7/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +5 similar issues
>>    *
>>
>>      igt@kms_chamelium@vga-frame-dump:
>>
>>        o shard-apl: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl6/igt@kms_chamelium@vga-frame-dump.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +9 similar issues
>>    *
>>
>>      igt@kms_chamelium@vga-hpd:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb8/igt@kms_chamelium@vga-hpd.html> (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +4 similar issues
>>    *
>>
>>      igt@kms_chamelium@vga-hpd-without-ddc:
>>
>>        o
>>
>>          shard-snb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-snb2/igt@km
>> s_chamelium@vga-hpd-without-ddc.html> (fdo#109271
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / fdo#111827
>> <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2 similar
>> issues
>>
>>        o
>>
>>          shard-glk: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk2/igt@km
>> s_chamelium@vga-hpd-without-ddc.html> (fdo#109271
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / fdo#111827
>> <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3 similar
>> issues
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb7/igt@k
>> ms_chamelium@vga-hpd-without-ddc.html> (fdo#109284
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109284> / fdo#111827
>> <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2 similar
>> issues
>>
>>    *
>>
>>      igt@kms_content_protection@atomic:
>>
>>        o shard-apl: NOTRUN -> TIMEOUT
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl3/igt@kms_content_protection@atomic.html> (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
>>    *
>>
>>      igt@kms_cursor_crc@cursor-offscreen-512x170:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb3/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279> / i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>>    *
>>
>>      igt@kms_cursor_crc@cursor-onscreen-512x512:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb1/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>>    *
>>
>>      igt@kms_cursor_legacy@cursor-vs-flip@varying-size:
>>
>>        o shard-iclb: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.html> (i915#5072 <https://gitlab.freedesktop.org/drm/intel/issues/5072>) +1 similar issue
>>    *
>>
>>      igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>>
>>        o shard-glk: NOTRUN -> FAIL
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>>    *
>>
>>      igt@kms_cursor_legacy@short-busy-flip-before-cursor:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb2/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>>    *
>>
>>      igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>>
>>        o shard-iclb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>>    *
>>
>>      igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
>>
>>        o shard-glk: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html> (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>>    *
>>
>>      igt@kms_flip@2x-flip-vs-panning-vs-hang:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +1 similar issue
>>    *
>>
>>      igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
>>
>>        o shard-apl: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html> (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>>    *
>>
>>      igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>>
>>        o shard-iclb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2 similar issues
>>    *
>>
>>      igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>>
>>        o shard-iclb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +1 similar issue
>>    *
>>
>>      igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
>>
>>        o shard-iclb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html> (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +4 similar issues
>>    *
>>
>>      igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html> (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> / fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +11 similar issues
>>    *
>>
>>      igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html> (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>>    *
>>
>>      igt@kms_hdmi_inject@inject-audio:
>>
>>        o shard-tglb: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html> (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>)
>>    *
>>
>>      igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>>
>>        o
>>
>>          shard-glk: NOTRUN -> FAIL
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk1/igt@km
>> s_plane_alpha_blend@pipe-b-alpha-transparent-fb.html> (i915#265
>> <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>>
>>        o
>>
>>          shard-apl: NOTRUN -> FAIL
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl6/igt@km
>> s_plane_alpha_blend@pipe-b-alpha-transparent-fb.html> (i915#265
>> <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>>
>>    *
>>
>>      igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-1:
>>
>>        o shard-glk: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-glk7/igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk5/igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-1.html> (i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
>>    *
>>
>>      igt@kms_prime@d3hot:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb5/igt@kms_prime@d3hot.html> (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>>    *
>>
>>      igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>>
>>        o shard-apl: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>    *
>>
>>      igt@kms_psr2_su@page_flip-nv12:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb8/igt@kms_psr2_su@page_flip-nv12.html> (i915#1911 <https://gitlab.freedesktop.org/drm/intel/issues/1911>)
>>    *
>>
>>      igt@kms_psr@psr2_sprite_blt:
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb1/igt@k
>> ms_psr@psr2_sprite_blt.html> (fdo#109441
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>>
>>        o
>>
>>          shard-tglb: NOTRUN -> FAIL
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb2/igt@k
>> ms_psr@psr2_sprite_blt.html> (i915#132
>> <https://gitlab.freedesktop.org/drm/intel/issues/132> / i915#3467
>> <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>>
>>    *
>>
>>      igt@kms_psr@psr2_sprite_mmap_gtt:
>>
>>        o shard-iclb: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html> (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1 similar issue
>>    *
>>
>>      igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>>
>>        o shard-iclb: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>>    *
>>
>>      igt@kms_setmode@basic@pipe-a-vga-1:
>>
>>        o shard-snb: NOTRUN -> FAIL
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html> (i915#5465 <https://gitlab.freedesktop.org/drm/intel/issues/5465>) +1 similar issue
>>    *
>>
>>      igt@kms_setmode@invalid-clone-single-crtc:
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb3/igt@k
>> ms_setmode@invalid-clone-single-crtc.html> (i915#3555
>> <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2 similar
>> issues
>>
>>        o
>>
>>          shard-tglb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb3/igt@k
>> ms_setmode@invalid-clone-single-crtc.html> (i915#3555
>> <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1 similar
>> issue
>>
>>    *
>>
>>      igt@nouveau_crc@pipe-d-ctx-flip-detection:
>>
>>        o shard-glk: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk9/igt@nouveau_crc@pipe-d-ctx-flip-detection.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +66 similar issues
>>    *
>>
>>      igt@perf_pmu@rc6-suspend:
>>
>>        o shard-apl: PASS
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl2/igt@perf_pmu@rc6-suspend.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl2/igt@perf_pmu@rc6-suspend.html> (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>>    *
>>
>>      igt@prime_nv_pcopy@test3_5:
>>
>>        o shard-snb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-snb4/igt@prime_nv_pcopy@test3_5.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +85 similar issues
>>    *
>>
>>      igt@sysfs_clients@busy:
>>
>>        o shard-tglb: NOTRUN -> SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb1/igt@sysfs_clients@busy.html> (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +2 similar issues
>>    *
>>
>>      igt@sysfs_clients@split-25:
>>
>>        o
>>
>>          shard-iclb: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb8/igt@s
>> ysfs_clients@split-25.html> (i915#2994
>> <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1 similar
>> issue
>>
>>        o
>>
>>          shard-apl: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl1/igt@sy
>> sfs_clients@split-25.html> (fdo#109271
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#2994
>> <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1 similar
>> issue
>>
>>        o
>>
>>          shard-glk: NOTRUN -> SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk1/igt@sy
>> sfs_clients@split-25.html> (fdo#109271
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#2994
>> <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>>
>>
>>          Possible fixes
>>
>>    *
>>
>>      igt@gem_exec_balancer@parallel-keep-in-fence:
>>
>>        o shard-iclb: SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html> (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>>    *
>>
>>      igt@gem_exec_fair@basic-flow@rcs0:
>>
>>        o shard-tglb: FAIL
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html>
>>    *
>>
>>      igt@gem_exec_fair@basic-pace-solo@rcs0:
>>
>>        o shard-apl: FAIL
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>>    *
>>
>>      igt@gem_exec_fair@basic-pace@vecs0:
>>
>>        o
>>
>>          shard-iclb: FAIL
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb2/igt
>> @gem_exec_fair@basic-pace@vecs0.html> (i915#2842
>> <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb7/igt@g
>> em_exec_fair@basic-pace@vecs0.html>
>>
>>        o
>>
>>          shard-glk: FAIL
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-glk3/igt@
>> gem_exec_fair@basic-pace@vecs0.html> (i915#2842
>> <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk2/igt@ge
>> m_exec_fair@basic-pace@vecs0.html>
>>
>>    *
>>
>>      igt@gen9_exec_parse@allowed-single:
>>
>>        o shard-apl: DMESG-WARN
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl1/igt@gen9_exec_parse@allowed-single.html> (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566> / i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl1/igt@gen9_exec_parse@allowed-single.html>
>>    *
>>
>>      igt@i915_suspend@debugfs-reader:
>>
>>        o shard-apl: DMESG-WARN
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl2/igt@i915_suspend@debugfs-reader.html> (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl6/igt@i915_suspend@debugfs-reader.html> +3 similar issues
>>    *
>>
>>      igt@kms_cursor_legacy@forked-bo@pipe-b:
>>
>>        o shard-glk: DMESG-WARN
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-glk3/igt@kms_cursor_legacy@forked-bo@pipe-b.html> (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-glk3/igt@kms_cursor_legacy@forked-bo@pipe-b.html>
>>    *
>>
>>      igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
>>
>>        o shard-iclb: SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html> +2 similar issues
>>    *
>>
>>      igt@kms_psr@psr2_no_drrs:
>>
>>        o shard-iclb: SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb1/igt@kms_psr@psr2_no_drrs.html> (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb2/igt@kms_psr@psr2_no_drrs.html> +1 similar issue
>>    *
>>
>>      igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>>
>>        o shard-iclb: SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb1/igt
>> @kms_psr_stress_test@flip-primary-invalidate-overlay.html> (i915#5519
>> <https://gitlab.freedesktop.org/drm/intel/issues/5519>) -> PASS
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb5/igt@k
>> ms_psr_stress_test@flip-primary-invalidate-overlay.html>
>>
>>
>>          Warnings
>>
>>    *
>>
>>      igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>>
>>        o shard-iclb: FAIL
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html> (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>) -> WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html> (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>>    *
>>
>>      igt@kms_content_protection@mei_interface:
>>
>>        o
>>
>>          shard-tglb: SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-tglb3/igt
>> @kms_content_protection@mei_interface.html> (fdo#109300
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109300>) -> SKIP
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-tglb3/igt@k
>> ms_content_protection@mei_interface.html> (i915#1063
>> <https://gitlab.freedesktop.org/drm/intel/issues/1063>)
>>
>>        o
>>
>>          shard-iclb: SKIP
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb7/igt
>> @kms_content_protection@mei_interface.html> (fdo#109300
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109300>) -> SKIP
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb3/igt@k
>> ms_content_protection@mei_interface.html> (fdo#109300
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109300> / fdo#111066
>> <https://bugs.freedesktop.org/show_bug.cgi?id=111066>)
>>
>>    *
>>
>>      igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>>
>>        o shard-iclb: SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html> (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>>    *
>>
>>      igt@kms_psr2_sf@cursor-plane-update-sf:
>>
>>        o shard-iclb: SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html> (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html> (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>>    *
>>
>>      igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>>
>>        o shard-iclb: SKIP
>>          <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html> (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html> (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>    *
>>
>>      igt@runner@aborted:
>>
>>        o shard-apl: (FAIL
>>          
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl6/igt@
>> runner@aborted.html>, FAIL
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl7/igt@
>> runner@aborted.html>, FAIL
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl8/igt@
>> runner@aborted.html>, FAIL
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl1/igt@
>> runner@aborted.html>, FAIL
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl1/igt@
>> runner@aborted.html>, FAIL
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12192/shard-apl2/igt@
>> runner@aborted.html>) (fdo#109271
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#180
>> <https://gitlab.freedesktop.org/drm/intel/issues/180> / i915#3002
>> <https://gitlab.freedesktop.org/drm/intel/issues/3002> / i915#4312
>> <https://gitlab.freedesktop.org/drm/intel/issues/4312>) -> (FAIL
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl2/igt@ru
>> nner@aborted.html>, FAIL
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl2/igt@ru
>> nner@aborted.html>, FAIL
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/shard-apl1/igt@ru
>> nner@aborted.html>) (i915#3002
>> <https://gitlab.freedesktop.org/drm/intel/issues/3002> / i915#4312
>> <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>>
>>
>>      Build changes
>>
>>    * CI: CI-20190529 -> None
>>    * IGT: IGT_6666 -> IGTPW_7852
>>    * Piglit: piglit_4509 -> None
>>
>> CI-20190529: 20190529
>> CI_DRM_12192: 83f5b1665fc067c78ed2d46c585d8c49e57e6b06 @
>> git://anongit.freedesktop.org/gfx-ci/linux
>> IGTPW_7852:
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7852/index.html
>> IGT_6666: 1e3ecbaa3c56f4c52c62047707eb4942d3a39c44 @
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>> git://anongit.freedesktop.org/piglit
>>
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A7B10E48D
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Dec 2021 18:57:01 +0000 (UTC)
Message-ID: <41209b2c-1252-4e80-5dc0-23acfcc686c5@quicinc.com>
Date: Wed, 15 Dec 2021 10:56:55 -0800
MIME-Version: 1.0
Content-Language: en-US
References: <1639010440-16085-1-git-send-email-quic_abhinavk@quicinc.com>
 <163912440025.3444.1398985498639336179@emeril.freedesktop.org>
 <5d3fde91-298a-2201-15b0-9590b615f41d@quicinc.com>
 <9d74f53b-e22b-5a5d-4671-a7aa347b0492@quicinc.com>
 <a666ccd615a44d1c8845d3636dbeddcb@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a666ccd615a44d1c8845d3636dbeddcb@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_fix_the_plane=5Fsize_array_for_yuv_formats_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi

Thank you so much for the help.

Abhinav

On 12/14/2021 10:09 PM, Vudum, Lakshminarayana wrote:
> Re-reported.
> 
> Regression is related to https://gitlab.freedesktop.org/drm/intel/-/issues/4753.
> 
> Lakshmi.
> 
> -----Original Message-----
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Sent: Tuesday, December 14, 2021 5:06 PM
> To: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> Cc: Mark Yacoub <markyacoub@chromium.org>; Latvala, Petri <petri.latvala@intel.com>; igt-dev@lists.freedesktop.org
> Subject: Re: ✗ Fi.CI.IGT: failure for lib/igt_fb: fix the plane_size array for yuv formats (rev3)
> 
> Hi Lakshmi
> 
> Gentle reminder. I am unable to see how my change can cause this failure?
> Can you please re-run this?
> 
> Thanks
> 
> Abhinav
> 
> On 12/13/2021 10:15 AM, Abhinav Kumar wrote:
>> Hi Lakshmi
>>
>> Can you please help to check and re-run this?
>>
>> It seems like the error is unrelated to the change:
>>
>>
>>
>> Starting subtest: atomic-pipe-A-tiling-none
>> (kms_plane_multiple:5337) igt_debugfs-CRITICAL: Test assertion failure
>> function igt_assert_crc_equal, file ../lib/igt_debugfs.c:491:
>> (kms_plane_multiple:5337) igt_debugfs-CRITICAL: Failed assertion:
>> !mismatch || igt_skip_crc_compare
>> Subtest atomic-pipe-A-tiling-none failed.
>>
>> Thanks
>>
>> Abhinav
>>
>> On 12/10/2021 12:20 AM, Patchwork wrote:
>>> == Series Details ==
>>>
>>> Series: lib/igt_fb: fix the plane_size array for yuv formats (rev3)
>>> URL   : https://patchwork.freedesktop.org/series/97386/
>>> State : failure
>>>
>>> == Summary ==
>>>
>>> CI Bug Log - changes from CI_DRM_10984_full -> IGTPW_6483_full
>>> ====================================================
>>>
>>> Summary
>>> -------
>>>
>>>     **FAILURE**
>>>
>>>     Serious unknown changes coming with IGTPW_6483_full absolutely
>>> need to be
>>>     verified manually.
>>>     If you think the reported changes have nothing to do with the
>>> changes
>>>     introduced in IGTPW_6483_full, please notify your bug team to
>>> allow them
>>>     to document this new failure mode, which will reduce false
>>> positives in CI.
>>>
>>>     External URL:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/index.html
>>>
>>> Participating hosts (10 -> 7)
>>> ------------------------------
>>>
>>>     Missing    (3): pig-skl-6260u pig-glk-j5005 shard-rkl
>>>
>>> Possible new issues
>>> -------------------
>>>
>>>     Here are the unknown changes that may have been introduced in
>>> IGTPW_6483_full:
>>>
>>> ### IGT changes ###
>>>
>>> #### Possible regressions ####
>>>
>>>     * igt@kms_plane_multiple@atomic-pipe-a-tiling-none:
>>>       - shard-glk:          [PASS][1] -> [FAIL][2]
>>>      [1]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk6/igt@
>>> kms_plane_multiple@atomic-pipe-a-tiling-none.html
>>>
>>>      [2]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk4/igt@km
>>> s_plane_multiple@atomic-pipe-a-tiling-none.html
>>>
>>>
>>> Known issues
>>> ------------
>>>
>>>     Here are the changes found in IGTPW_6483_full that come from known
>>> issues:
>>>
>>> ### IGT changes ###
>>>
>>> #### Issues hit ####
>>>
>>>     * igt@gem_create@create-massive:
>>>       - shard-apl:          NOTRUN -> [DMESG-WARN][3] ([i915#3002])
>>>      [3]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl1/igt@ge
>>> m_create@create-massive.html
>>>
>>>
>>>     * igt@gem_ctx_isolation@preservation-s3@rcs0:
>>>       - shard-apl:          [PASS][4] -> [DMESG-WARN][5] ([i915#180])
>>> +5 similar issues
>>>      [4]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-apl2/igt@
>>> gem_ctx_isolation@preservation-s3@rcs0.html
>>>
>>>      [5]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl8/igt@ge
>>> m_ctx_isolation@preservation-s3@rcs0.html
>>>
>>>
>>>     * igt@gem_ctx_persistence@hang:
>>>       - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] /
>>> [i915#1099])
>>>      [6]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-snb2/igt@ge
>>> m_ctx_persistence@hang.html
>>>
>>>
>>>     * igt@gem_eio@unwedge-stress:
>>>       - shard-iclb:         [PASS][7] -> [TIMEOUT][8] ([i915#2481] /
>>> [i915#3070])
>>>      [7]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-iclb7/igt
>>> @gem_eio@unwedge-stress.html
>>>
>>>      [8]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb2/igt@g
>>> em_eio@unwedge-stress.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-deadline:
>>>       - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2846])
>>>      [9]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk2/igt@
>>> gem_exec_fair@basic-deadline.html
>>>
>>>      [10]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk8/igt@ge
>>> m_exec_fair@basic-deadline.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-none-share@rcs0:
>>>       - shard-apl:          [PASS][11] -> [SKIP][12] ([fdo#109271])
>>>      [11]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-apl7/igt@
>>> gem_exec_fair@basic-none-share@rcs0.html
>>>
>>>      [12]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl2/igt@ge
>>> m_exec_fair@basic-none-share@rcs0.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-none-solo@rcs0:
>>>       - shard-kbl:          NOTRUN -> [FAIL][13] ([i915#2842])
>>>      [13]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl4/igt@ge
>>> m_exec_fair@basic-none-solo@rcs0.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-none@vcs0:
>>>       - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#2842]) +2
>>> similar issues
>>>      [14]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-kbl2/igt@
>>> gem_exec_fair@basic-none@vcs0.html
>>>
>>>      [15]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl1/igt@ge
>>> m_exec_fair@basic-none@vcs0.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-pace@rcs0:
>>>       - shard-tglb:         [PASS][16] -> [FAIL][17] ([i915#2842])
>>>      [16]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-tglb6/igt
>>> @gem_exec_fair@basic-pace@rcs0.html
>>>
>>>      [17]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb5/igt@g
>>> em_exec_fair@basic-pace@rcs0.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-pace@vcs1:
>>>       - shard-iclb:         NOTRUN -> [FAIL][18] ([i915#2842]) +4
>>> similar issues
>>>      [18]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb1/igt@g
>>> em_exec_fair@basic-pace@vcs1.html
>>>
>>>
>>>     * igt@gem_exec_whisper@basic-queues-all:
>>>       - shard-glk:          [PASS][19] -> [DMESG-WARN][20]
>>> ([i915#118])
>>>      [19]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk6/igt@
>>> gem_exec_whisper@basic-queues-all.html
>>>
>>>      [20]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk1/igt@ge
>>> m_exec_whisper@basic-queues-all.html
>>>
>>>
>>>     * igt@gem_lmem_swapping@parallel-multi:
>>>       - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271] /
>>> [i915#4613]) +1 similar issue
>>>      [21]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl3/igt@ge
>>> m_lmem_swapping@parallel-multi.html
>>>
>>>
>>>     * igt@gem_lmem_swapping@verify:
>>>       - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] /
>>> [i915#4613]) +1 similar issue
>>>      [22]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl1/igt@ge
>>> m_lmem_swapping@verify.html
>>>
>>>
>>>     * igt@gem_mmap_gtt@coherency:
>>>       - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#111656])
>>>      [23]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb2/igt@g
>>> em_mmap_gtt@coherency.html
>>>
>>>
>>>     * igt@gem_pxp@fail-invalid-protected-context:
>>>       - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#4270])
>>>      [24]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb8/igt@g
>>> em_pxp@fail-invalid-protected-context.html
>>>
>>>       - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#4270])
>>>      [25]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb5/igt@g
>>> em_pxp@fail-invalid-protected-context.html
>>>
>>>
>>>     * igt@gem_render_copy@y-tiled-to-vebox-linear:
>>>       - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#768]) +1
>>> similar issue
>>>      [26]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb8/igt@g
>>> em_render_copy@y-tiled-to-vebox-linear.html
>>>
>>>
>>>     * igt@gem_softpin@evict-snoop:
>>>       - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109312])
>>>      [27]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb8/igt@g
>>> em_softpin@evict-snoop.html
>>>
>>>       - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109312])
>>>      [28]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb6/igt@g
>>> em_softpin@evict-snoop.html
>>>
>>>
>>>     * igt@gem_userptr_blits@input-checking:
>>>       - shard-kbl:          NOTRUN -> [DMESG-WARN][29] ([i915#3002])
>>>      [29]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl6/igt@ge
>>> m_userptr_blits@input-checking.html
>>>
>>>
>>>     * igt@gem_userptr_blits@readonly-unsync:
>>>       - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#3297])
>>>      [30]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb6/igt@g
>>> em_userptr_blits@readonly-unsync.html
>>>
>>>       - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#3297])
>>>      [31]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb7/igt@g
>>> em_userptr_blits@readonly-unsync.html
>>>
>>>
>>>     * igt@gem_userptr_blits@vma-merge:
>>>       - shard-kbl:          NOTRUN -> [FAIL][32] ([i915#3318])
>>>      [32]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl4/igt@ge
>>> m_userptr_blits@vma-merge.html
>>>
>>>
>>>     * igt@gen9_exec_parse@allowed-all:
>>>       - shard-glk:          [PASS][33] -> [DMESG-WARN][34]
>>> ([i915#1436] / [i915#716])
>>>      [33]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk1/igt@
>>> gen9_exec_parse@allowed-all.html
>>>
>>>      [34]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk3/igt@ge
>>> n9_exec_parse@allowed-all.html
>>>
>>>
>>>     * igt@gen9_exec_parse@unaligned-access:
>>>       - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#2856])
>>>      [35]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb5/igt@g
>>> en9_exec_parse@unaligned-access.html
>>>
>>>       - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#2856])
>>>      [36]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb8/igt@g
>>> en9_exec_parse@unaligned-access.html
>>>
>>>
>>>     * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>>>       - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109506] /
>>> [i915#2411])
>>>      [37]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb7/igt@i
>>> 915_pm_rpm@gem-execbuf-stress-pc8.html
>>>
>>>
>>>     * igt@i915_suspend@fence-restore-untiled:
>>>       - shard-kbl:          [PASS][38] -> [INCOMPLETE][39]
>>> ([i915#4277])
>>>      [38]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-kbl1/igt@
>>> i915_suspend@fence-restore-untiled.html
>>>
>>>      [39]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl2/igt@i9
>>> 15_suspend@fence-restore-untiled.html
>>>
>>>
>>>     * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>>>       - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#1769])
>>>      [40]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb8/igt@k
>>> ms_atomic_transition@plane-all-modeset-transition-fencing.html
>>>
>>>       - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#1769])
>>>      [41]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb6/igt@k
>>> ms_atomic_transition@plane-all-modeset-transition-fencing.html
>>>
>>>
>>>     * igt@kms_big_fb@linear-32bpp-rotate-270:
>>>       - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110725] /
>>> [fdo#111614])
>>>      [42]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb3/igt@k
>>> ms_big_fb@linear-32bpp-rotate-270.html
>>>
>>>       - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111614])
>>>      [43]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb1/igt@k
>>> ms_big_fb@linear-32bpp-rotate-270.html
>>>
>>>
>>>     * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>>>       - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] /
>>> [i915#3777]) +3 similar issues
>>>      [44]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl6/igt@km
>>> s_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>>>
>>>
>>>     * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>>>       - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615])
>>>      [45]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb8/igt@k
>>> ms_big_fb@yf-tiled-16bpp-rotate-270.html
>>>
>>>
>>>     * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>>>       - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] /
>>> [i915#3886]) +8 similar issues
>>>      [46]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl8/igt@km
>>> s_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
>>>
>>>       - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] /
>>> [i915#3886]) +2 similar issues
>>>      [47]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk9/igt@km
>>> s_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
>>>
>>>       - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689] /
>>> [i915#3886]) +1 similar issue
>>>      [48]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb8/igt@k
>>> ms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
>>>
>>>
>>>     * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>>>       - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] /
>>> [i915#3886]) +8 similar issues
>>>      [49]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl7/igt@km
>>> s_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
>>>
>>>
>>>     * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
>>>       - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689]) +2
>>> similar issues
>>>      [50]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb6/igt@k
>>> ms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html
>>>
>>>
>>>     * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
>>>       - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111615] /
>>> [i915#3689]) +5 similar issues
>>>      [51]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb6/igt@k
>>> ms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html
>>>
>>>
>>>     * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>>>       - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] /
>>> [i915#3886]) +4 similar issues
>>>      [52]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb2/igt@k
>>> ms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
>>>
>>>
>>>     * igt@kms_cdclk@mode-transition:
>>>       - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271]) +133
>>> similar issues
>>>      [53]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl8/igt@km
>>> s_cdclk@mode-transition.html
>>>
>>>
>>>     * igt@kms_chamelium@hdmi-edid-change-during-suspend:
>>>       - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] /
>>> [fdo#111827]) +9 similar issues
>>>      [54]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl8/igt@km
>>> s_chamelium@hdmi-edid-change-during-suspend.html
>>>
>>>
>>>     * igt@kms_chamelium@hdmi-hpd-storm:
>>>       - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] /
>>> [fdo#111827]) +15 similar issues
>>>      [55]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl2/igt@km
>>> s_chamelium@hdmi-hpd-storm.html
>>>
>>>
>>>     * igt@kms_chamelium@vga-edid-read:
>>>       - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109284] /
>>> [fdo#111827]) +8 similar issues
>>>      [56]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb7/igt@k
>>> ms_chamelium@vga-edid-read.html
>>>
>>>
>>>     * igt@kms_color_chamelium@pipe-a-ctm-0-75:
>>>       - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109284] /
>>> [fdo#111827]) +7 similar issues
>>>      [57]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb6/igt@k
>>> ms_color_chamelium@pipe-a-ctm-0-75.html
>>>
>>>       - shard-snb:          NOTRUN -> [SKIP][58] ([fdo#109271] /
>>> [fdo#111827]) +3 similar issues
>>>      [58]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-snb7/igt@km
>>> s_color_chamelium@pipe-a-ctm-0-75.html
>>>
>>>
>>>     * igt@kms_color_chamelium@pipe-c-ctm-0-75:
>>>       - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] /
>>> [fdo#111827]) +3 similar issues
>>>      [59]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk1/igt@km
>>> s_color_chamelium@pipe-c-ctm-0-75.html
>>>
>>>
>>>     * igt@kms_content_protection@lic:
>>>       - shard-apl:          NOTRUN -> [TIMEOUT][60] ([i915#1319])
>>>      [60]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl6/igt@km
>>> s_content_protection@lic.html
>>>
>>>
>>>     * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
>>>       - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] /
>>> [fdo#109279])
>>>      [61]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb5/igt@k
>>> ms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
>>>
>>>
>>>     * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
>>>       - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3359]) +5
>>> similar issues
>>>      [62]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb7/igt@k
>>> ms_cursor_crc@pipe-c-cursor-max-size-offscreen.html
>>>
>>>
>>>     * igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement:
>>>       - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278]) +20
>>> similar issues
>>>      [63]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb6/igt@k
>>> ms_cursor_crc@pipe-d-cursor-256x85-rapid-movement.html
>>>
>>>
>>>     * igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:
>>>       - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109279] /
>>> [i915#3359])
>>>      [64]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb8/igt@k
>>> ms_cursor_crc@pipe-d-cursor-512x170-sliding.html
>>>
>>>
>>>     * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>>>       - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#4103])
>>>      [65]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb2/igt@k
>>> ms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>>>
>>>
>>>     * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>>>       - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274] /
>>> [fdo#109278]) +1 similar issue
>>>      [66]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb6/igt@k
>>> ms_cursor_legacy@cursora-vs-flipb-varying-size.html
>>>
>>>
>>>     * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:
>>>       - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#1888] /
>>> [i915#3451])
>>>      [67]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk2/igt@
>>> kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html
>>>
>>>      [68]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk2/igt@km
>>> s_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html
>>>
>>>
>>>     * igt@kms_dsc@basic-dsc-enable:
>>>       - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#3840])
>>>      [69]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb1/igt@k
>>> ms_dsc@basic-dsc-enable.html
>>>
>>>
>>>     * igt@kms_flip@2x-nonexisting-fb:
>>>       - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274]) +6
>>> similar issues
>>>      [70]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb2/igt@k
>>> ms_flip@2x-nonexisting-fb.html
>>>
>>>
>>>     * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
>>>       - shard-glk:          [PASS][71] -> [FAIL][72] ([i915#2122])
>>>      [71]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk7/igt@
>>> kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
>>>
>>>      [72]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk5/igt@km
>>> s_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
>>>
>>>
>>>     * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>>>       - shard-kbl:          [PASS][73] -> [DMESG-WARN][74]
>>> ([i915#180])
>>> +6 similar issues
>>>      [73]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-kbl3/igt@
>>> kms_flip@flip-vs-suspend-interruptible@a-dp1.html
>>>
>>>      [74]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl1/igt@km
>>> s_flip@flip-vs-suspend-interruptible@a-dp1.html
>>>
>>>
>>>     * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>>>       - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109280]) +13
>>> similar issues
>>>      [75]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb3/igt@k
>>> ms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
>>>
>>>
>>>     * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>>>       - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271]) +185
>>> similar issues
>>>      [76]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl3/igt@km
>>> s_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
>>>
>>>
>>>     * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
>>>       - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111825]) +17
>>> similar issues
>>>      [77]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb6/igt@k
>>> ms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html
>>>
>>>       - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271]) +31
>>> similar issues
>>>      [78]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk9/igt@km
>>> s_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html
>>>
>>>
>>>     * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
>>>       - shard-apl:          NOTRUN -> [FAIL][79] ([fdo#108145] /
>>> [i915#265])
>>>      [79]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl6/igt@km
>>> s_plane_alpha_blend@pipe-a-alpha-7efc.html
>>>
>>>
>>>     * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>>>       - shard-kbl:          NOTRUN -> [FAIL][80] ([fdo#108145] /
>>> [i915#265])
>>>      [80]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl4/igt@km
>>> s_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
>>>
>>>
>>>     * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
>>>       - shard-glk:          [PASS][81] -> [FAIL][82] ([fdo#108145] /
>>> [i915#265])
>>>      [81]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk3/igt@
>>> kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
>>>
>>>      [82]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk4/igt@km
>>> s_plane_alpha_blend@pipe-a-constant-alpha-mid.html
>>>
>>>
>>>     * igt@kms_plane_lowres@pipe-a-tiling-y:
>>>       - shard-glk:          [PASS][83] -> [DMESG-WARN][84] ([i915#118]
>>> / [i915#1888])
>>>      [83]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk1/igt@
>>> kms_plane_lowres@pipe-a-tiling-y.html
>>>
>>>      [84]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk1/igt@km
>>> s_plane_lowres@pipe-a-tiling-y.html
>>>
>>>
>>>     * igt@kms_plane_lowres@pipe-c-tiling-none:
>>>       - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#3536])
>>>      [85]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb7/igt@k
>>> ms_plane_lowres@pipe-c-tiling-none.html
>>>
>>>       - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#3536])
>>>      [86]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb2/igt@k
>>> ms_plane_lowres@pipe-c-tiling-none.html
>>>
>>>
>>>     * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
>>>       - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#111615] /
>>> [fdo#112054])
>>>      [87]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb3/igt@k
>>> ms_plane_multiple@atomic-pipe-b-tiling-yf.html
>>>
>>>
>>>     *
>>> igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
>>>
>>>       - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] /
>>> [i915#2733])
>>>      [88]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl7/igt@km
>>> s_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clip
>>> ping-clamping.html
>>>
>>>
>>>     * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
>>>       - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2920])
>>>      [89]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb1/igt@k
>>> ms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html
>>>
>>>
>>>     * igt@kms_psr2_su@page_flip-xrgb8888:
>>>       - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#1911])
>>>      [90]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb5/igt@k
>>> ms_psr2_su@page_flip-xrgb8888.html
>>>
>>>       - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] /
>>> [i915#658]) +4 similar issues
>>>      [91]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl7/igt@km
>>> s_psr2_su@page_flip-xrgb8888.html
>>>
>>>       - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] /
>>> [i915#658]) +3 similar issues
>>>      [92]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl6/igt@km
>>> s_psr2_su@page_flip-xrgb8888.html
>>>
>>>       - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] /
>>> [i915#658])
>>>      [93]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk8/igt@km
>>> s_psr2_su@page_flip-xrgb8888.html
>>>
>>>       - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#658])
>>>      [94]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb5/igt@k
>>> ms_psr2_su@page_flip-xrgb8888.html
>>>
>>>
>>>     * igt@kms_psr@psr2_cursor_render:
>>>       - shard-iclb:         [PASS][95] -> [SKIP][96] ([fdo#109441]) +1
>>> similar issue
>>>      [95]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-iclb2/igt
>>> @kms_psr@psr2_cursor_render.html
>>>
>>>      [96]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb6/igt@k
>>> ms_psr@psr2_cursor_render.html
>>>
>>>
>>>     * igt@kms_psr@psr2_sprite_blt:
>>>       - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109441])
>>>      [97]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb3/igt@k
>>> ms_psr@psr2_sprite_blt.html
>>>
>>>
>>>     * igt@kms_vblank@pipe-d-wait-idle:
>>>       - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] /
>>> [i915#533]) +2 similar issues
>>>      [98]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl4/igt@km
>>> s_vblank@pipe-d-wait-idle.html
>>>
>>>       - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] /
>>> [i915#533]) +1 similar issue
>>>      [99]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl7/igt@km
>>> s_vblank@pipe-d-wait-idle.html
>>>
>>>       - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] /
>>> [i915#533]) +1 similar issue
>>>      [100]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk7/igt@km
>>> s_vblank@pipe-d-wait-idle.html
>>>
>>>
>>>     * igt@kms_writeback@writeback-invalid-parameters:
>>>       - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] /
>>> [i915#2437])
>>>      [101]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl6/igt@km
>>> s_writeback@writeback-invalid-parameters.html
>>>
>>>
>>>     * igt@nouveau_crc@pipe-c-ctx-flip-detection:
>>>       - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#2530])
>>>      [102]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb8/igt@n
>>> ouveau_crc@pipe-c-ctx-flip-detection.html
>>>
>>>
>>>     * igt@perf@gen12-oa-tlb-invalidate:
>>>       - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109289]) +1
>>> similar issue
>>>      [103]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb7/igt@p
>>> erf@gen12-oa-tlb-invalidate.html
>>>
>>>
>>>     * igt@prime_vgem@fence-write-hang:
>>>       - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109295])
>>>      [104]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb6/igt@p
>>> rime_vgem@fence-write-hang.html
>>>
>>>
>>>     * igt@sysfs_clients@create:
>>>       - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271] /
>>> [i915#2994]) +2 similar issues
>>>      [105]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl2/igt@sy
>>> sfs_clients@create.html
>>>
>>>
>>>     * igt@sysfs_clients@sema-50:
>>>       - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#2994])
>>>      [106]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb7/igt@s
>>> ysfs_clients@sema-50.html
>>>
>>>       - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] /
>>> [i915#2994]) +3 similar issues
>>>      [107]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl1/igt@sy
>>> sfs_clients@sema-50.html
>>>
>>>       - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271] /
>>> [i915#2994])
>>>      [108]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk4/igt@sy
>>> sfs_clients@sema-50.html
>>>
>>>       - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#2994])
>>>      [109]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb2/igt@s
>>> ysfs_clients@sema-50.html
>>>
>>>
>>>     * igt@sysfs_heartbeat_interval@precise@rcs0:
>>>       - shard-snb:          NOTRUN -> [SKIP][110] ([fdo#109271]) +75
>>> similar issues
>>>      [110]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-snb5/igt@sy
>>> sfs_heartbeat_interval@precise@rcs0.html
>>>
>>>
>>> #### Possible fixes ####
>>>
>>>     * igt@gem_eio@in-flight-contexts-10ms:
>>>       - shard-tglb:         [TIMEOUT][111] ([i915#3063]) ->
>>> [PASS][112]
>>>      [111]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-tglb2/igt
>>> @gem_eio@in-flight-contexts-10ms.html
>>>
>>>      [112]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb1/igt@g
>>> em_eio@in-flight-contexts-10ms.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-none@rcs0:
>>>       - shard-glk:          [FAIL][113] ([i915#2842]) -> [PASS][114]
>>> +1 similar issue
>>>      [113]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk3/igt@
>>> gem_exec_fair@basic-none@rcs0.html
>>>
>>>      [114]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk5/igt@ge
>>> m_exec_fair@basic-none@rcs0.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-pace-solo@rcs0:
>>>       - shard-iclb:         [FAIL][115] ([i915#2842]) -> [PASS][116]
>>> +1 similar issue
>>>      [115]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-iclb3/igt
>>> @gem_exec_fair@basic-pace-solo@rcs0.html
>>>
>>>      [116]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb7/igt@g
>>> em_exec_fair@basic-pace-solo@rcs0.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-pace@vcs0:
>>>       - shard-kbl:          [FAIL][117] ([i915#2842]) -> [PASS][118]
>>> +1 similar issue
>>>      [117]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-kbl4/igt@
>>> gem_exec_fair@basic-pace@vcs0.html
>>>
>>>      [118]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl3/igt@ge
>>> m_exec_fair@basic-pace@vcs0.html
>>>
>>>
>>>     * igt@gem_exec_fair@basic-pace@vecs0:
>>>       - shard-kbl:          [SKIP][119] ([fdo#109271]) -> [PASS][120]
>>>      [119]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-kbl4/igt@
>>> gem_exec_fair@basic-pace@vecs0.html
>>>
>>>      [120]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl3/igt@ge
>>> m_exec_fair@basic-pace@vecs0.html
>>>
>>>
>>>     * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>>>       - shard-kbl:          [DMESG-WARN][121] ([i915#180]) ->
>>> [PASS][122] +7 similar issues
>>>      [121]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-kbl1/igt@
>>> kms_cursor_crc@pipe-a-cursor-suspend.html
>>>
>>>      [122]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl7/igt@km
>>> s_cursor_crc@pipe-a-cursor-suspend.html
>>>
>>>
>>>     * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>>>       - shard-iclb:         [FAIL][123] ([i915#2346]) -> [PASS][124]
>>>      [123]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-iclb7/igt
>>> @kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>>>
>>>      [124]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb4/igt@k
>>> ms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>>>
>>>
>>>     * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>>>       - shard-apl:          [DMESG-WARN][125] ([i915#180]) ->
>>> [PASS][126] +3 similar issues
>>>      [125]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-apl8/igt@
>>> kms_flip@flip-vs-suspend-interruptible@c-dp1.html
>>>
>>>      [126]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-apl1/igt@km
>>> s_flip@flip-vs-suspend-interruptible@c-dp1.html
>>>
>>>
>>>     * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
>>>       - shard-iclb:         [SKIP][127] ([i915#3701]) -> [PASS][128]
>>>      [127]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-iclb2/igt
>>> @kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
>>>
>>>      [128]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb3/igt@k
>>> ms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
>>>
>>>
>>>     * igt@kms_hdmi_inject@inject-audio:
>>>       - shard-tglb:         [SKIP][129] ([i915#433]) -> [PASS][130]
>>>      [129]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-tglb8/igt
>>> @kms_hdmi_inject@inject-audio.html
>>>
>>>      [130]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-tglb5/igt@k
>>> ms_hdmi_inject@inject-audio.html
>>>
>>>
>>>     * igt@kms_psr@psr2_primary_blt:
>>>       - shard-iclb:         [SKIP][131] ([fdo#109441]) -> [PASS][132]
>>> +1 similar issue
>>>      [131]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-iclb8/igt
>>> @kms_psr@psr2_primary_blt.html
>>>
>>>      [132]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb2/igt@k
>>> ms_psr@psr2_primary_blt.html
>>>
>>>
>>>     * igt@kms_setmode@basic:
>>>       - shard-glk:          [FAIL][133] ([i915#31]) -> [PASS][134]
>>>      [133]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-glk9/igt@
>>> kms_setmode@basic.html
>>>
>>>      [134]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-glk7/igt@km
>>> s_setmode@basic.html
>>>
>>>
>>>     * igt@kms_vblank@pipe-a-ts-continuation-suspend:
>>>       - shard-kbl:          [DMESG-WARN][135] ([i915#180] /
>>> [i915#295])
>>> -> [PASS][136]
>>>      [135]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-kbl1/igt@
>>> kms_vblank@pipe-a-ts-continuation-suspend.html
>>>
>>>      [136]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-kbl7/igt@km
>>> s_vblank@pipe-a-ts-continuation-suspend.html
>>>
>>>
>>> #### Warnings ####
>>>
>>>     * igt@gem_exec_fair@basic-throttle@rcs0:
>>>       - shard-iclb:         [FAIL][137] ([i915#2842]) -> [FAIL][138]
>>> ([i915#2849])
>>>      [137]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10984/shard-iclb6/igt
>>> @gem_exec_fair@basic-throttle@rcs0.html
>>>
>>>      [138]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/shard-iclb7/igt@g
>>> em_exec_fair@basic-throttle@rcs0.html
>>>
>>>
>>> == Logs ==
>>>
>>> For more details see:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6483/index.html
>>>

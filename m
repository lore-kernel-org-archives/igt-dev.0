Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 05 Feb 2020 12:36:40 -0000
Message-ID: <158090620076.17321.10822811129827226526@emeril.freedesktop.org>
References: <20200205115915.1823074-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200205115915.1823074-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fexec=3A_Update_the_list_of_engines_on_the_actual_con?=
 =?utf-8?q?text?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_exec: Update the list of engines on the actual context
URL   : https://patchwork.freedesktop.org/series/73022/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7869 -> IGTPW_4099
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/index.html

Known issues
------------

  Here are the changes found in IGTPW_4099 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][1] -> [INCOMPLETE][2] ([i915#694] / [i915#816])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][3] -> [DMESG-FAIL][4] ([i915#563])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [PASS][5] -> [DMESG-FAIL][6] ([fdo#108569])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-icl-y/igt@i915_selftest@live_execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-j1900:       [PASS][7] -> [DMESG-FAIL][8] ([i915#1052])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html

  * igt@prime_self_import@basic-llseek-size:
    - fi-tgl-y:           [PASS][9] -> [DMESG-WARN][10] ([CI#94] / [i915#402]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][11] ([i915#45]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@fds:
    - fi-icl-u3:          [INCOMPLETE][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-icl-u3/igt@gem_exec_parallel@fds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-icl-u3/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][15] ([CI#94]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [DMESG-WARN][17] ([CI#94] / [i915#402]) -> [PASS][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_module_load@reload:
    - fi-skl-6770hq:      [DMESG-WARN][19] ([i915#92]) -> [PASS][20] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-skl-6770hq/igt@i915_module_load@reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-skl-6770hq/igt@i915_module_load@reload.html

  * igt@i915_selftest@live_blt:
    - fi-bsw-nick:        [INCOMPLETE][21] ([i915#392]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-bsw-nick/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [DMESG-FAIL][23] ([i915#725]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][25] ([i915#553]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-kbl-7500u:       [FAIL][27] ([fdo#109635] / [i915#217]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][29] ([fdo#111096] / [i915#323]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [SKIP][31] ([fdo#109271]) -> [PASS][32] +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - fi-skl-6770hq:      [DMESG-WARN][33] ([i915#106] / [i915#188]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#188]: https://gitlab.freedesktop.org/drm/intel/issues/188
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#392]: https://gitlab.freedesktop.org/drm/intel/issues/392
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (49 -> 47)
------------------------------

  Additional (3): fi-kbl-7560u fi-gdg-551 fi-snb-2520m 
  Missing    (5): fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5419 -> IGTPW_4099

  CI-20190529: 20190529
  CI_DRM_7869: db0579be255412f38a450c3c577f8d10f1195034 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4099: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/index.html
  IGT_5419: 44913a91e77434b03001bb9ea53216cd03c476e6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

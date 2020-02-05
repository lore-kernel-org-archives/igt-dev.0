Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 05 Feb 2020 15:02:25 -0000
Message-ID: <158091494511.17321.6364105313919821065@emeril.freedesktop.org>
References: <20200205135532.15757-1-ramalingam.c@intel.com>
In-Reply-To: <20200205135532.15757-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?dumb=5Fbuffer=3A_page=5Fsize_for_create=5Fclear?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/dumb_buffer: page_size for create_clear
URL   : https://patchwork.freedesktop.org/series/73030/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7869 -> IGTPW_4102
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/index.html

Known issues
------------

  Here are the changes found in IGTPW_4102 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][3] -> [DMESG-FAIL][4] ([i915#725])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][5] -> [FAIL][6] ([i915#217])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([CI#94] / [i915#402]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][9] ([i915#45]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@fds:
    - fi-icl-u3:          [INCOMPLETE][11] -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-icl-u3/igt@gem_exec_parallel@fds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-icl-u3/igt@gem_exec_parallel@fds.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [DMESG-WARN][13] ([CI#94] / [i915#402]) -> [PASS][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-kbl-7500u:       [FAIL][15] ([fdo#109635] / [i915#217]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][17] ([fdo#111096] / [i915#323]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [SKIP][19] ([fdo#109271]) -> [PASS][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - fi-skl-6770hq:      [DMESG-WARN][21] ([i915#106] / [i915#188]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-skl-6770hq:      [SKIP][23] ([fdo#109271]) -> [INCOMPLETE][24] ([i915#151])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-skl-6770hq/igt@i915_pm_rpm@basic-pci-d3-state.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-skl-6770hq/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][25] ([i915#553]) -> [DMESG-FAIL][26] ([i915#563])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@runner@aborted:
    - fi-byt-n2820:       [FAIL][27] ([i915#816]) -> [FAIL][28] ([i915#999])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/fi-byt-n2820/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/fi-byt-n2820/igt@runner@aborted.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#188]: https://gitlab.freedesktop.org/drm/intel/issues/188
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#999]: https://gitlab.freedesktop.org/drm/intel/issues/999


Participating hosts (49 -> 44)
------------------------------

  Additional (1): fi-snb-2520m 
  Missing    (6): fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bsw-nick fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5419 -> IGTPW_4102

  CI-20190529: 20190529
  CI_DRM_7869: db0579be255412f38a450c3c577f8d10f1195034 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4102: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/index.html
  IGT_5419: 44913a91e77434b03001bb9ea53216cd03c476e6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

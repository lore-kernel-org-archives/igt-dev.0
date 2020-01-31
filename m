Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 15:11:47 -0000
Message-ID: <158048350709.13121.16349153689677873435@emeril.freedesktop.org>
References: <20200131092603.24223-1-mika.kahola@intel.com>
In-Reply-To: <20200131092603.24223-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IENS?=
 =?utf-8?q?C_mismatch_=28rev4=29?=
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Fix CRC mismatch (rev4)
URL   : https://patchwork.freedesktop.org/series/72625/
State : success

== Summary ==

CI Bug Log - changes from IGT_5408 -> IGTPW_4056
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/index.html

Known issues
------------

  Here are the changes found in IGTPW_4056 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-pnv-d510:        [PASS][1] -> [INCOMPLETE][2] ([i915#299])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-pnv-d510/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-pnv-d510/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_flink_basic@bad-open:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-tgl-y/igt@gem_flink_basic@bad-open.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-tgl-y/igt@gem_flink_basic@bad-open.html

  * igt@i915_selftest@live_gtt:
    - fi-bdw-5557u:       [PASS][5] -> [TIMEOUT][6] ([fdo#112271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-bdw-5557u/igt@i915_selftest@live_gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-bdw-5557u/igt@i915_selftest@live_gtt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][7] -> [FAIL][8] ([fdo#111096] / [i915#323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][9] ([fdo#112271] / [i915#1084] / [i915#816]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_store@basic-all:
    - fi-apl-guc:         [TIMEOUT][11] ([fdo#112271]) -> [PASS][12] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-apl-guc/igt@gem_exec_store@basic-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-apl-guc/igt@gem_exec_store@basic-all.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-apl-guc:         [SKIP][13] ([fdo#109271]) -> [PASS][14] +47 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-apl-guc/igt@gem_tiled_fence_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-apl-guc/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][15] ([i915#553] / [i915#725]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-tgl-y:           [DMESG-WARN][17] ([CI#94] / [i915#402]) -> [PASS][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [FAIL][19] ([i915#976]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [FAIL][21] ([fdo#109635] / [i915#217]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Warnings ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [FAIL][23] ([i915#694]) -> [TIMEOUT][24] ([fdo#112271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (47 -> 45)
------------------------------

  Additional (5): fi-kbl-soraka fi-bsw-n3050 fi-hsw-peppy fi-elk-e7500 fi-bsw-kefka 
  Missing    (7): fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bsw-nick 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5408 -> IGTPW_4056

  CI-20190529: 20190529
  CI_DRM_7850: ae66f2257648ce52c51298506977baa32873c9d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4056: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/index.html
  IGT_5408: 8980bcd421744fb63d38270e1fcc9c7432d70d00 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4056/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

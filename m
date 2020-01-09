Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jan 2020 19:47:02 -0000
Message-ID: <157859922277.4564.6264013536652524995@emeril.freedesktop.org>
References: <20200109183338.17164-1-bob.j.paauwe@intel.com>
In-Reply-To: <20200109183338.17164-1-bob.j.paauwe@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2Nv?=
 =?utf-8?q?lor=5Fencoding=3A_Fix_up_support_for_XYUV_format=2E_=28rev2=29?=
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
To: Bob Paauwe <bob.j.paauwe@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/color_encoding: Fix up support for XYUV format. (rev2)
URL   : https://patchwork.freedesktop.org/series/70516/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7713 -> IGTPW_3911
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3911:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_parallel@basic:
    - {fi-ehl-1}:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-ehl-1/igt@gem_exec_parallel@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_3911 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][2] -> [DMESG-FAIL][3] ([i915#725])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-kbl-soraka:      [PASS][4] -> [DMESG-FAIL][5] ([i915#656])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-kbl-soraka/igt@i915_selftest@live_execlists.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-kbl-soraka/igt@i915_selftest@live_execlists.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][6] -> [FAIL][7] ([i915#217])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][8] ([i915#816]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_ctx_switch@rcs0:
    - {fi-ehl-1}:         [INCOMPLETE][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-ehl-1/igt@gem_ctx_switch@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-ehl-1/igt@gem_ctx_switch@rcs0.html

  * igt@gem_sync@basic-store-all:
    - fi-tgl-y:           [INCOMPLETE][12] ([i915#472]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-tgl-y/igt@gem_sync@basic-store-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-tgl-y/igt@gem_sync@basic-store-all.html

  * igt@i915_selftest@live_workarounds:
    - fi-skl-6600u:       [DMESG-FAIL][14] -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-skl-6600u/igt@i915_selftest@live_workarounds.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-skl-6600u/igt@i915_selftest@live_workarounds.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-skl-lmem:        [INCOMPLETE][16] ([i915#69]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-skl-lmem/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-skl-lmem/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][18] ([i915#725]) -> [DMESG-FAIL][19] ([i915#770])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [FAIL][20] ([fdo#103375]) -> [FAIL][21] ([i915#217])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (52 -> 47)
------------------------------

  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3911

  CI-20190529: 20190529
  CI_DRM_7713: f80e30343f272fc966b28277a929e7f7469653bd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3911: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

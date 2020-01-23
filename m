Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 13:14:42 -0000
Message-ID: <157978528204.1145.4624396354278991459@emeril.freedesktop.org>
References: <20200123120134.2682-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200123120134.2682-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fisolation=3A_Use_static_iterator?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_isolation: Use static iterator
URL   : https://patchwork.freedesktop.org/series/72461/
State : success

== Summary ==

CI Bug Log - changes from IGT_5379 -> IGTPW_3977
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_3977 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3977, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3977:

### IGT changes ###

#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [FAIL][1] ([i915#694]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_3977 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-bsw-n3050:       [PASS][3] -> [INCOMPLETE][4] ([i915#392])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-bsw-n3050/igt@gem_exec_suspend@basic-s0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-bsw-n3050/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-kbl-7500u:       [PASS][5] -> [DMESG-WARN][6] ([fdo#107139])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-kbl-7500u/igt@gem_exec_suspend@basic-s4-devices.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-kbl-7500u/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][7] -> [DMESG-FAIL][8] ([i915#553] / [i915#725])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [PASS][9] -> [INCOMPLETE][10] ([i915#424])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][11] ([i915#725]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][13] ([i915#553] / [i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-skl-lmem:        [INCOMPLETE][15] ([i915#424]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-skl-lmem/igt@i915_selftest@live_gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-skl-lmem/igt@i915_selftest@live_gem_contexts.html
    - fi-hsw-peppy:       [DMESG-FAIL][17] ([i915#722]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [FAIL][19] ([i915#217]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [FAIL][21] ([fdo#109635]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][23] ([fdo#111096] / [i915#323]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@amdgpu/amd_cs_nop@fork-gfx0:
    - fi-tgl-y:           [SKIP][25] ([fdo#109315]) -> [SKIP][26] ([CI#94] / [fdo#109315]) +17 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-tgl-y/igt@amdgpu/amd_cs_nop@fork-gfx0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-tgl-y/igt@amdgpu/amd_cs_nop@fork-gfx0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [FAIL][27] ([fdo#103375]) -> [FAIL][28] ([CI#94] / [fdo#103375])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_busy@basic-flip-pipe-b:
    - fi-tgl-y:           [SKIP][29] ([fdo#112015]) -> [SKIP][30] ([CI#94] / [fdo#112015]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-tgl-y/igt@kms_busy@basic-flip-pipe-b.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-tgl-y/igt@kms_busy@basic-flip-pipe-b.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-tgl-y:           [SKIP][31] ([fdo#111827]) -> [SKIP][32] ([CI#94] / [fdo#111827]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-tgl-y/igt@kms_chamelium@vga-edid-read.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-tgl-y/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-y:           [SKIP][33] ([fdo#109285]) -> [SKIP][34] ([CI#94] / [fdo#109285])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/fi-tgl-y/igt@kms_force_connector_basic@force-load-detect.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/fi-tgl-y/igt@kms_force_connector_basic@force-load-detect.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#107139]: https://bugs.freedesktop.org/show_bug.cgi?id=107139
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#392]: https://gitlab.freedesktop.org/drm/intel/issues/392
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (50 -> 44)
------------------------------

  Additional (3): fi-bsw-kefka fi-tgl-u fi-bsw-nick 
  Missing    (9): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-skl-6700k2 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5379 -> IGTPW_3977

  CI-20190529: 20190529
  CI_DRM_7801: 6e1cfbab49286533a902e0c265249b80e5cf71da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/index.html
  IGT_5379: b8d03fef6f135c27b3f45f820e62d40aac956471 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@gem_ctx_isolation@-clean
-igt@gem_ctx_isolation@-dirty-create
-igt@gem_ctx_isolation@-dirty-switch
-igt@gem_ctx_isolation@-none
-igt@gem_ctx_isolation@-nonpriv
-igt@gem_ctx_isolation@-nonpriv-switch
-igt@gem_ctx_isolation@-reset
-igt@gem_ctx_isolation@-s3
-igt@gem_ctx_isolation@-s4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

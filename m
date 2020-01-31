Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 20:52:58 -0000
Message-ID: <158050397830.13120.8475544330836354373@emeril.freedesktop.org>
References: <20200131201554.12832-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200131201554.12832-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_lib/igt=5Fkms=3A_Return_the_fi?=
 =?utf-8?q?rst_overlay_not_the_last_one?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] lib/igt_kms: Return the first overlay not the last one
URL   : https://patchwork.freedesktop.org/series/72844/
State : success

== Summary ==

CI Bug Log - changes from IGT_5410 -> IGTPW_4067
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4067:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live_gt_heartbeat:
    - {fi-ehl-1}:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-ehl-1/igt@i915_selftest@live_gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-ehl-1/igt@i915_selftest@live_gt_heartbeat.html

  
Known issues
------------

  Here are the changes found in IGTPW_4067 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][3] -> [TIMEOUT][4] ([fdo#112271] / [i915#1084])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [PASS][5] -> [TIMEOUT][6] ([fdo#112271] / [i915#1084])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][7] -> [DMESG-FAIL][8] ([i915#725])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gtt:
    - fi-kbl-7500u:       [PASS][9] -> [TIMEOUT][10] ([fdo#112271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-kbl-7500u/igt@i915_selftest@live_gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-kbl-7500u/igt@i915_selftest@live_gtt.html
    - fi-skl-lmem:        [PASS][11] -> [TIMEOUT][12] ([fdo#111732] / [fdo#112271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-skl-lmem/igt@i915_selftest@live_gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-skl-lmem/igt@i915_selftest@live_gtt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][13] -> [FAIL][14] ([fdo#111096] / [i915#323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [FAIL][15] ([i915#694]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][17] ([i915#178]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-u2:          [INCOMPLETE][19] ([fdo#108569]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-icl-u2/igt@i915_selftest@live_hangcheck.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-icl-u2/igt@i915_selftest@live_hangcheck.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][21] ([i915#725]) -> [DMESG-FAIL][22] ([i915#563])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/fi-ivb-3770/igt@i915_selftest@live_blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (50 -> 46)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5410 -> IGTPW_4067

  CI-20190529: 20190529
  CI_DRM_7853: 1df04205c16923e525efe9c26d6e98612d38c9b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4067: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/index.html
  IGT_5410: 9d3872ede14307ef4adb0866f8474f5c41e6b1c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_legacy_colorkey@dst-colorkey-c8
+igt@kms_legacy_colorkey@dst-colorkey-rgb565
+igt@kms_legacy_colorkey@dst-colorkey-xbgr2101010
+igt@kms_legacy_colorkey@dst-colorkey-xrgb8888
+igt@kms_legacy_colorkey@dst-colorkey-yuyv
+igt@kms_legacy_colorkey@src-colorkey-c8
+igt@kms_legacy_colorkey@src-colorkey-rgb565
+igt@kms_legacy_colorkey@src-colorkey-xbgr2101010
+igt@kms_legacy_colorkey@src-colorkey-xrgb8888
+igt@kms_legacy_colorkey@src-colorkey-yuyv
+igt@kms_legacy_colorkey_basic@invalid-plane-id
+igt@kms_legacy_colorkey_basic@pipe-a-dst-colorkey
+igt@kms_legacy_colorkey_basic@pipe-a-invalid-flags
+igt@kms_legacy_colorkey_basic@pipe-a-no-colorkey
+igt@kms_legacy_colorkey_basic@pipe-a-src-colorkey
+igt@kms_legacy_colorkey_basic@pipe-b-dst-colorkey
+igt@kms_legacy_colorkey_basic@pipe-b-invalid-flags
+igt@kms_legacy_colorkey_basic@pipe-b-no-colorkey
+igt@kms_legacy_colorkey_basic@pipe-b-src-colorkey
+igt@kms_legacy_colorkey_basic@pipe-c-dst-colorkey
+igt@kms_legacy_colorkey_basic@pipe-c-invalid-flags
+igt@kms_legacy_colorkey_basic@pipe-c-no-colorkey
+igt@kms_legacy_colorkey_basic@pipe-c-src-colorkey
+igt@kms_legacy_colorkey_basic@pipe-d-dst-colorkey
+igt@kms_legacy_colorkey_basic@pipe-d-invalid-flags
+igt@kms_legacy_colorkey_basic@pipe-d-no-colorkey
+igt@kms_legacy_colorkey_basic@pipe-d-src-colorkey
+igt@kms_legacy_colorkey_basic@pipe-e-dst-colorkey
+igt@kms_legacy_colorkey_basic@pipe-e-invalid-flags
+igt@kms_legacy_colorkey_basic@pipe-e-no-colorkey
+igt@kms_legacy_colorkey_basic@pipe-e-src-colorkey
+igt@kms_legacy_colorkey_basic@pipe-f-dst-colorkey
+igt@kms_legacy_colorkey_basic@pipe-f-invalid-flags
+igt@kms_legacy_colorkey_basic@pipe-f-no-colorkey
+igt@kms_legacy_colorkey_basic@pipe-f-src-colorkey
-igt@kms_legacy_colorkey

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

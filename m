Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 28 Feb 2020 11:55:57 -0000
Message-ID: <158289095770.7476.378251541945293073@emeril.freedesktop.org>
References: <20200228111338.1669251-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200228111338.1669251-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_add_a_stress_test_opening/closing_the_stream_=28rev2=29?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: add a stress test opening/closing the stream (rev2)
URL   : https://patchwork.freedesktop.org/series/74002/
State : success

== Summary ==

CI Bug Log - changes from IGT_5475 -> IGTPW_4239
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/index.html

Known issues
------------

  Here are the changes found in IGTPW_4239 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-dsi:         [PASS][1] -> [INCOMPLETE][2] ([fdo#108569])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-icl-dsi/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/fi-icl-dsi/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([fdo#111096] / [i915#323])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-skl-6770hq:      [DMESG-WARN][5] ([i915#92]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-skl-6770hq/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/fi-skl-6770hq/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [SKIP][7] ([fdo#109271]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][9] ([i915#877]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/fi-cml-s/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_lrc:
    - {fi-tgl-u}:         [DMESG-FAIL][11] ([i915#1233]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-tgl-u/igt@i915_selftest@live@gt_lrc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/fi-tgl-u/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [SKIP][13] ([fdo#109271]) -> [PASS][14] +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-skl-6770hq:      [DMESG-WARN][15] ([i915#106]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [DMESG-WARN][17] ([i915#92]) -> [FAIL][18] ([i915#178])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (52 -> 45)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5475 -> IGTPW_4239

  CI-20190529: 20190529
  CI_DRM_8026: 6ce18c241dde9ee20b19ff42f8198552a57ab259 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4239: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/index.html
  IGT_5475: ca52e3cb94072f8a6c59f6379f569f79e71a088b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf@stress-open-close

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

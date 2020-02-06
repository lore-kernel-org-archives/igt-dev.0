Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Feb 2020 07:08:35 -0000
Message-ID: <158097291524.14482.9134275342413897305@emeril.freedesktop.org>
References: <20200206061915.26057-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200206061915.26057-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Ffence=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fe?=
 =?utf-8?q?ngine_to_utilize_all_available_engines=2E_=28rev2=29?=
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
To: saigowth <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_fence:Added __for_each_physical_engine to utilize all available engines. (rev2)
URL   : https://patchwork.freedesktop.org/series/72916/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7874 -> IGTPW_4105
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4105:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_fence@basic-await@bcs0} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-cml-u2/igt@gem_exec_fence@basic-await@bcs0.html

  * {igt@gem_exec_fence@basic-wait@bcs0} (NEW):
    - fi-cml-s:           NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-cml-s/igt@gem_exec_fence@basic-wait@bcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7874 and IGTPW_4105:

### New IGT tests (24) ###

  * igt@gem_exec_fence@basic-await:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-await@bcs0:
    - Statuses : 13 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@gem_exec_fence@basic-await@rcs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.06, 0.20] s

  * igt@gem_exec_fence@basic-await@vcs0:
    - Statuses : 33 pass(s)
    - Exec time: [0.06, 0.20] s

  * igt@gem_exec_fence@basic-await@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@gem_exec_fence@basic-await@vecs0:
    - Statuses : 29 pass(s)
    - Exec time: [0.06, 0.19] s

  * igt@gem_exec_fence@basic-busy:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-busy@bcs0:
    - Statuses : 13 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_exec_fence@basic-busy@rcs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_fence@basic-busy@vcs0:
    - Statuses : 33 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-busy@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-busy@vecs0:
    - Statuses : 29 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_exec_fence@basic-wait:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-wait@bcs0:
    - Statuses : 13 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_exec_fence@basic-wait@rcs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_exec_fence@basic-wait@vcs0:
    - Statuses : 33 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_exec_fence@basic-wait@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-wait@vecs0:
    - Statuses : 29 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@nb-await:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@nb-await@bcs0:
    - Statuses : 13 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@gem_exec_fence@nb-await@rcs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@gem_exec_fence@nb-await@vcs0:
    - Statuses : 33 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@gem_exec_fence@nb-await@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [0.06] s

  * igt@gem_exec_fence@nb-await@vecs0:
    - Statuses : 29 pass(s)
    - Exec time: [0.05, 0.07] s

  

Known issues
------------

  Here are the changes found in IGTPW_4105 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-4770r:       [PASS][3] -> [TIMEOUT][4] ([fdo#112271] / [i915#1084])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/fi-hsw-4770r/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-hsw-4770r/igt@gem_close_race@basic-threads.html
    - fi-byt-j1900:       [PASS][5] -> [INCOMPLETE][6] ([i915#45])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [PASS][7] -> [FAIL][8] ([i915#178])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [PASS][9] -> [DMESG-FAIL][10] ([fdo#108569])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/fi-icl-y/igt@i915_selftest@live_execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-icl-y/igt@i915_selftest@live_execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-n2820:       [DMESG-FAIL][11] ([i915#722]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [FAIL][13] ([fdo#109635] / [i915#217]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][15] ([fdo#111096] / [i915#323]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [TIMEOUT][17] ([fdo#112271] / [i915#1084]) -> [TIMEOUT][18] ([fdo#112271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [FAIL][19] ([i915#694]) -> [TIMEOUT][20] ([fdo#112271] / [i915#1084])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722


Participating hosts (51 -> 41)
------------------------------

  Missing    (10): fi-bsw-n3050 fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-kbl-x1275 fi-bsw-kefka fi-kbl-7560u fi-tgl-y fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5420 -> IGTPW_4105

  CI-20190529: 20190529
  CI_DRM_7874: 3f234d1ab91ec2321312150116c1285bcb0a260b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4105: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/index.html
  IGT_5420: 497e13d2b4c1053bcd01bd15739fef55e7694a03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_fence@await-hang
+igt@gem_exec_fence@basic-await
+igt@gem_exec_fence@basic-busy
+igt@gem_exec_fence@basic-wait
+igt@gem_exec_fence@busy-hang
+igt@gem_exec_fence@keep-in-fence
+igt@gem_exec_fence@nb-await
+igt@gem_exec_fence@nb-await-hang
+igt@gem_exec_fence@parallel
+igt@gem_exec_fence@wait-hang
-igt@gem_exec_fence@await-blt
-igt@gem_exec_fence@await-bsd
-igt@gem_exec_fence@await-bsd1
-igt@gem_exec_fence@await-bsd2
-igt@gem_exec_fence@await-hang-blt
-igt@gem_exec_fence@await-hang-bsd
-igt@gem_exec_fence@await-hang-bsd1
-igt@gem_exec_fence@await-hang-bsd2
-igt@gem_exec_fence@await-hang-default
-igt@gem_exec_fence@await-hang-render
-igt@gem_exec_fence@await-hang-vebox
-igt@gem_exec_fence@await-render
-igt@gem_exec_fence@await-vebox
-igt@gem_exec_fence@basic-await-default
-igt@gem_exec_fence@basic-busy-default
-igt@gem_exec_fence@basic-wait-default
-igt@gem_exec_fence@busy-blt
-igt@gem_exec_fence@busy-bsd
-igt@gem_exec_fence@busy-bsd1
-igt@gem_exec_fence@busy-bsd2
-igt@gem_exec_fence@busy-hang-blt
-igt@gem_exec_fence@busy-hang-bsd
-igt@gem_exec_fence@busy-hang-bsd1
-igt@gem_exec_fence@busy-hang-bsd2
-igt@gem_exec_fence@busy-hang-default
-igt@gem_exec_fence@busy-hang-render
-igt@gem_exec_fence@busy-hang-vebox
-igt@gem_exec_fence@busy-render
-igt@gem_exec_fence@busy-vebox
-igt@gem_exec_fence@keep-in-fence-blt
-igt@gem_exec_fence@keep-in-fence-bsd
-igt@gem_exec_fence@keep-in-fence-bsd1
-igt@gem_exec_fence@keep-in-fence-bsd2
-igt@gem_exec_fence@keep-in-fence-default
-igt@gem_exec_fence@keep-in-fence-render
-igt@gem_exec_fence@keep-in-fence-vebox
-igt@gem_exec_fence@nb-await-blt
-igt@gem_exec_fence@nb-await-bsd
-igt@gem_exec_fence@nb-await-bsd1
-igt@gem_exec_fence@nb-await-bsd2
-igt@gem_exec_fence@nb-await-default
-igt@gem_exec_fence@nb-await-hang-blt
-igt@gem_exec_fence@nb-await-hang-bsd
-igt@gem_exec_fence@nb-await-hang-bsd1
-igt@gem_exec_fence@nb-await-hang-bsd2
-igt@gem_exec_fence@nb-await-hang-default
-igt@gem_exec_fence@nb-await-hang-render
-igt@gem_exec_fence@nb-await-hang-vebox
-igt@gem_exec_fence@nb-await-render
-igt@gem_exec_fence@nb-await-vebox
-igt@gem_exec_fence@parallel-blt
-igt@gem_exec_fence@parallel-bsd1
-igt@gem_exec_fence@parallel-bsd2
-igt@gem_exec_fence@parallel-render
-igt@gem_exec_fence@parallel-vebox
-igt@gem_exec_fence@wait-blt
-igt@gem_exec_fence@wait-bsd
-igt@gem_exec_fence@wait-bsd1
-igt@gem_exec_fence@wait-bsd2
-igt@gem_exec_fence@wait-hang-blt
-igt@gem_exec_fence@wait-hang-bsd
-igt@gem_exec_fence@wait-hang-bsd1
-igt@gem_exec_fence@wait-hang-bsd2
-igt@gem_exec_fence@wait-hang-default
-igt@gem_exec_fence@wait-hang-render
-igt@gem_exec_fence@wait-hang-vebox
-igt@gem_exec_fence@wait-render
-igt@gem_exec_fence@wait-vebox

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

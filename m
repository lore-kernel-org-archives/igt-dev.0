Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jan 2020 20:36:17 -0000
Message-ID: <157972537708.22395.6488840808776937074@emeril.freedesktop.org>
References: <20200122174151.15059-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200122174151.15059-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_engine?=
 =?utf-8?q?s_=28rev3=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_nop:Adjusted test to utilize all available engines (rev3)
URL   : https://patchwork.freedesktop.org/series/72334/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7797 -> IGTPW_3971
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3971 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3971, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3971:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-tgl-y:           NOTRUN -> [SKIP][2] +29 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/fi-tgl-y/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in IGTPW_3971 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][3] -> [INCOMPLETE][4] ([i915#45])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-cml-s:           [PASS][5] -> [INCOMPLETE][6] ([i915#283])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [PASS][7] -> [INCOMPLETE][8] ([i915#505])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-skl-guc:         [PASS][9] -> [DMESG-FAIL][10] ([fdo#112406])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-skl-guc/igt@i915_selftest@live_gt_heartbeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/fi-skl-guc/igt@i915_selftest@live_gt_heartbeat.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [INCOMPLETE][11] ([i915#45]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][13] ([i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [DMESG-WARN][15] ([i915#44]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
  [fdo#112406]: https://bugs.freedesktop.org/show_bug.cgi?id=112406
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (51 -> 45)
------------------------------

  Additional (2): fi-kbl-soraka fi-tgl-y 
  Missing    (8): fi-cml-u2 fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3971

  CI-20190529: 20190529
  CI_DRM_7797: c6751dc645f51c3058592c615770ecefd9899672 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3971: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_nop@poll
+igt@gem_exec_nop@preempt
+igt@gem_exec_nop@signal
+igt@gem_exec_nop@single
-igt@gem_exec_nop@blt
-igt@gem_exec_nop@bsd
-igt@gem_exec_nop@bsd1
-igt@gem_exec_nop@bsd2
-igt@gem_exec_nop@default
-igt@gem_exec_nop@poll-blt
-igt@gem_exec_nop@poll-bsd
-igt@gem_exec_nop@poll-bsd1
-igt@gem_exec_nop@poll-bsd2
-igt@gem_exec_nop@poll-default
-igt@gem_exec_nop@poll-render
-igt@gem_exec_nop@poll-vebox
-igt@gem_exec_nop@preempt-blt
-igt@gem_exec_nop@preempt-bsd
-igt@gem_exec_nop@preempt-bsd1
-igt@gem_exec_nop@preempt-bsd2
-igt@gem_exec_nop@preempt-default
-igt@gem_exec_nop@preempt-render
-igt@gem_exec_nop@preempt-vebox
-igt@gem_exec_nop@render
-igt@gem_exec_nop@signal-blt
-igt@gem_exec_nop@signal-bsd
-igt@gem_exec_nop@signal-bsd1
-igt@gem_exec_nop@signal-bsd2
-igt@gem_exec_nop@signal-default
-igt@gem_exec_nop@signal-render
-igt@gem_exec_nop@signal-vebox
-igt@gem_exec_nop@vebox

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3971/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

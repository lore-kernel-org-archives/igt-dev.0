Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Jul 2020 07:51:36 -0000
Message-ID: <159367629697.5654.17114350216372394597@emeril.freedesktop.org>
References: <20200702054243.9949-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200702054243.9949-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev12=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add api_intel_bb test (rev12)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8691 -> IGTPW_4727
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8691 and IGTPW_4727:

### New IGT tests (11) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@full-batch:
    - Statuses : 36 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@intel-bb-blit-none:
    - Statuses : 33 pass(s) 3 skip(s)
    - Exec time: [0.0, 15.80] s

  * igt@api_intel_bb@intel-bb-blit-x:
    - Statuses : 33 pass(s) 3 skip(s)
    - Exec time: [0.0, 15.45] s

  * igt@api_intel_bb@intel-bb-blit-y:
    - Statuses : 33 pass(s) 3 skip(s)
    - Exec time: [0.0, 15.09] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 33 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_4727 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-n3050:       [PASS][3] -> [DMESG-WARN][4] ([i915#1982]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][5] ([i915#1888]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-icl-u2:          [DMESG-WARN][7] ([i915#1982]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [DMESG-WARN][9] ([i915#62] / [i915#92]) -> [DMESG-WARN][10] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][11] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][12] ([i915#62] / [i915#92])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (42 -> 37)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5719 -> IGTPW_4727

  CI-20190529: 20190529
  CI_DRM_8691: 65f4b41f875158ce36b3571700c0f39e8321332a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4727: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/index.html
  IGT_5719: 54731f017df8660f29cc8f5db0b570239729e808 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_bb@blit-noreloc-keep-cache
+igt@api_intel_bb@blit-noreloc-purge-cache
+igt@api_intel_bb@blit-reloc-keep-cache
+igt@api_intel_bb@blit-reloc-purge-cache
+igt@api_intel_bb@full-batch
+igt@api_intel_bb@intel-bb-blit-none
+igt@api_intel_bb@intel-bb-blit-x
+igt@api_intel_bb@intel-bb-blit-y
+igt@api_intel_bb@offset-control
+igt@api_intel_bb@simple-bb
+igt@api_intel_bb@simple-bb-ctx

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

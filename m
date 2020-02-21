Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Feb 2020 15:38:33 -0000
Message-ID: <158229951347.7918.13374306761283076040@emeril.freedesktop.org>
References: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frpm=3A_Only_check_for_suspend_failures_after_each_de?=
 =?utf-8?q?bugfs_entry_=28rev2=29?=
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

Series: i915/i915_pm_rpm: Only check for suspend failures after each debugfs entry (rev2)
URL   : https://patchwork.freedesktop.org/series/73729/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7982 -> IGTPW_4211
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/index.html

New tests
---------

  New tests have been introduced between CI_DRM_7982 and IGTPW_4211:

### New IGT tests (1) ###

  * igt@i915_pm_rpm@module-reload:
    - Statuses : 3 dmesg-warn(s) 29 pass(s) 8 skip(s)
    - Exec time: [0.0, 48.78] s

  

Known issues
------------

  Here are the changes found in IGTPW_4211 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap_gtt@basic:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-tgl-y/igt@gem_mmap_gtt@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/fi-tgl-y/igt@gem_mmap_gtt@basic.html

  * igt@i915_pm_rpm@module-reload (NEW):
    - fi-skl-6770hq:      [PASS][3] -> [DMESG-WARN][4] ([i915#92]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [PASS][5] -> [DMESG-FAIL][6] ([i915#877])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [PASS][7] -> [SKIP][8] ([fdo#109271]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-skl-6770hq:      [PASS][9] -> [DMESG-WARN][10] ([i915#106])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       [INCOMPLETE][11] ([i915#146] / [i915#69]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live_sanitycheck:
    - fi-icl-u3:          [DMESG-WARN][13] ([i915#585]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - fi-tgl-y:           [DMESG-WARN][15] ([CI#94] / [i915#402]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-icl-u3:          [SKIP][17] ([fdo#109315]) -> [SKIP][18] ([fdo#109315] / [i915#585])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (51 -> 46)
------------------------------

  Additional (2): fi-hsw-peppy fi-snb-2520m 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5457 -> IGTPW_4211

  CI-20190529: 20190529
  CI_DRM_7982: f02659605b48dcabb562bbb96db2996b334e57fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4211: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/index.html
  IGT_5457: 3e686098d928aa928f668e00fa01e92234e173ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

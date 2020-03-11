Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Mar 2020 15:46:27 -0000
Message-ID: <158394158754.13949.10397652549112634503@emeril.freedesktop.org>
References: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/5=5D_lib/i915=3A_Create_a_context_w?=
 =?utf-8?q?rapping_one_specific_engine?=
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

Series: series starting with [i-g-t,1/5] lib/i915: Create a context wrapping one specific engine
URL   : https://patchwork.freedesktop.org/series/74575/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8120 -> IGTPW_4291
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4291 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4291, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4291/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4291:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-cfl-8700k:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8120/fi-cfl-8700k/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4291/fi-cfl-8700k/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_4291 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@contexts:
    - fi-tgl-y:           [PASS][3] -> [INCOMPLETE][4] ([CI#94] / [i915#470] / [i915#529])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8120/fi-tgl-y/igt@gem_exec_parallel@contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4291/fi-tgl-y/igt@gem_exec_parallel@contexts.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-skl-lmem:        [INCOMPLETE][5] ([i915#424]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8120/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4291/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][7] ([i915#541]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8120/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4291/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (49 -> 43)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5505 -> IGTPW_4291

  CI-20190529: 20190529
  CI_DRM_8120: ce66c439df71f01b018803664c4a50fc61255788 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4291: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4291/index.html
  IGT_5505: 8973d811f3fdfb4ace4aabab2095ce0309881648 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@sysfs_heartbeat_interval@idempotent
+igt@sysfs_heartbeat_interval@invalid
+igt@sysfs_heartbeat_interval@long
+igt@sysfs_heartbeat_interval@mixed
+igt@sysfs_heartbeat_interval@nopreempt
+igt@sysfs_heartbeat_interval@off
+igt@sysfs_heartbeat_interval@precise
+igt@sysfs_preempt_timeout@idempotent
+igt@sysfs_preempt_timeout@invalid
+igt@sysfs_preempt_timeout@off
+igt@sysfs_preempt_timeout@timeout
+igt@sysfs_timeslice_duration@duration
+igt@sysfs_timeslice_duration@idempotent
+igt@sysfs_timeslice_duration@invalid
+igt@sysfs_timeslice_duration@off
+igt@sysfs_timeslice_duration@timeout

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4291/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

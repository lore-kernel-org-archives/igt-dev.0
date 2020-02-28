Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 28 Feb 2020 11:52:44 -0000
Message-ID: <158289076411.7474.18047683065064853653@emeril.freedesktop.org>
References: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/5=5D_i915=3A_Start_putting_the_mmio?=
 =?utf-8?q?=5Fbase_to_wider_use?=
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

Series: series starting with [i-g-t,1/5] i915: Start putting the mmio_base to wider use
URL   : https://patchwork.freedesktop.org/series/74073/
State : success

== Summary ==

CI Bug Log - changes from IGT_5475 -> IGTPW_4238
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4238:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {fi-tgl-u}:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/fi-tgl-u/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4238 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][2] -> [DMESG-WARN][3] ([i915#44])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [DMESG-WARN][4] ([i915#92]) -> [PASS][5] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-guc:         [SKIP][6] ([fdo#109271]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][8] ([i915#877]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/fi-cml-s/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [SKIP][10] ([fdo#109271]) -> [PASS][11] +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-skl-6770hq:      [DMESG-WARN][12] ([i915#106]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (52 -> 44)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-cfl-guc fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5475 -> IGTPW_4238

  CI-20190529: 20190529
  CI_DRM_8026: 6ce18c241dde9ee20b19ff42f8198552a57ab259 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4238: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/index.html
  IGT_5475: ca52e3cb94072f8a6c59f6379f569f79e71a088b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

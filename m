Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 19:36:28 -0000
Message-ID: <158352338899.3082.11813950336703926417@emeril.freedesktop.org>
References: <20200306173311.436741-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200306173311.436741-1-emil.l.velikov@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdC9j?=
 =?utf-8?q?ore=5Fsetmaster=3A_new_test_for_drop/set_master_semantics?=
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/core_setmaster: new test for drop/set master semantics
URL   : https://patchwork.freedesktop.org/series/74400/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5498 -> IGTPW_4275
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4275 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4275, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4275:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-snb-2520m:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/fi-snb-2520m/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/fi-snb-2520m/igt@i915_selftest@live@gt_lrc.html

  * igt@runner@aborted:
    - fi-snb-2520m:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/fi-snb-2520m/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_selftest@live@ring_submission}:
    - fi-snb-2520m:       [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/fi-snb-2520m/igt@i915_selftest@live@ring_submission.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/fi-snb-2520m/igt@i915_selftest@live@ring_submission.html

  
Known issues
------------

  Here are the changes found in IGTPW_4275 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cml-s:           [PASS][6] -> [DMESG-FAIL][7] ([i915#541])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/fi-cml-s/igt@i915_selftest@live@gt_heartbeat.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/fi-cml-s/igt@i915_selftest@live@gt_heartbeat.html

  * igt@prime_vgem@basic-read:
    - fi-tgl-y:           [PASS][8] -> [DMESG-WARN][9] ([CI#94] / [i915#402]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/fi-tgl-y/igt@prime_vgem@basic-read.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/fi-tgl-y/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][10] ([CI#94]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_addfb_basic@addfb25-x-tiled:
    - fi-tgl-y:           [DMESG-WARN][12] ([CI#94] / [i915#402]) -> [PASS][13] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/fi-tgl-y/igt@kms_addfb_basic@addfb25-x-tiled.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/fi-tgl-y/igt@kms_addfb_basic@addfb25-x-tiled.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (51 -> 45)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5498 -> IGTPW_4275

  CI-20190529: 20190529
  CI_DRM_8085: f731492964aa6510672f43292d4b2216b73eddeb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4275: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/index.html
  IGT_5498: 1bb7a25a09fe3e653d310e8bdfbdde4a1934b326 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@core_setmaster@master-drop-set-root
+igt@core_setmaster@master-drop-set-shared-fd
+igt@core_setmaster@master-drop-set-user

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4275/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Apr 2020 12:05:59 -0000
Message-ID: <158634755980.19347.7071656404836672743@emeril.freedesktop.org>
References: <20200408102408.1959598-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200408102408.1959598-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Iga21zX2Zs?=
 =?utf-8?q?ip=3A_Reduce_hang_tests_to_minimum_duration?=
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

Series: kms_flip: Reduce hang tests to minimum duration
URL   : https://patchwork.freedesktop.org/series/75665/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8274 -> IGTPW_4430
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/index.html

Known issues
------------

  Here are the changes found in IGTPW_4430 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-skl-6770hq:      [PASS][1] -> [DMESG-WARN][2] ([i915#203]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/fi-skl-6770hq/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/fi-skl-6770hq/igt@i915_module_load@reload.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [PASS][3] -> [DMESG-WARN][4] ([IGT#4])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [PASS][5] -> [SKIP][6] ([fdo#109271]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-skl-6770hq:      [PASS][7] -> [DMESG-WARN][8] ([i915#106])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-hsw-4770:        [SKIP][9] ([fdo#109271]) -> [PASS][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#203]: https://gitlab.freedesktop.org/drm/intel/issues/203


Participating hosts (51 -> 47)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5580 -> IGTPW_4430

  CI-20190529: 20190529
  CI_DRM_8274: 860acd37e552def563b63ac3f77ad002b58fada0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/index.html
  IGT_5580: fb488389a7a263b649361ec9c29e8b3b69851122 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

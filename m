Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 28 Feb 2020 10:03:37 -0000
Message-ID: <158288421742.7475.6478406632359487076@emeril.freedesktop.org>
References: <20200228084636.30045-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200228084636.30045-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Enhance_invalid_mapping_exercise_=28re?=
 =?utf-8?b?djQp?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Enhance invalid mapping exercise (rev4)
URL   : https://patchwork.freedesktop.org/series/72411/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8025 -> IGTPW_4236
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4236:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {fi-tgl-u}:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/fi-tgl-u/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4236 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [PASS][2] -> [FAIL][3] ([i915#217] / [i915#976])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][4] ([i915#178]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (49 -> 44)
------------------------------

  Additional (2): fi-byt-n2820 fi-tgl-dsi 
  Missing    (7): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-cfl-guc fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5474 -> IGTPW_4236

  CI-20190529: 20190529
  CI_DRM_8025: 576ef251e04072e92ed85a5fc4c5e3600b4f8d62 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4236: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/index.html
  IGT_5474: 1be610f852de155cd915e7cda65cb2737adf04d4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_userptr_blits@invalid-mmap-offset-sync
+igt@gem_userptr_blits@invalid-mmap-offset-unsync
-igt@gem_userptr_blits@invalid-gtt-mapping

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

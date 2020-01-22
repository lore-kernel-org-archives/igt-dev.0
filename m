Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jan 2020 18:19:37 -0000
Message-ID: <157971717728.22394.17549364890090273875@emeril.freedesktop.org>
References: <20200122162651.1111-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200122162651.1111-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Enhance_invalid_mapping_exercise?=
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

Series: tests/gem_userptr_blits: Enhance invalid mapping exercise
URL   : https://patchwork.freedesktop.org/series/72411/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7794 -> IGTPW_3969
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_3969 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3969, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3969:

### IGT changes ###

#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       [TIMEOUT][1] ([fdo#112271]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_3969 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-guc:         [PASS][3] -> [DMESG-WARN][4] ([i915#889])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/fi-cfl-guc/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/fi-cfl-guc/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-lmem:        [PASS][5] -> [DMESG-WARN][6] ([i915#889])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][7] -> [DMESG-FAIL][8] ([i915#725])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-u3:          [PASS][9] -> [INCOMPLETE][10] ([fdo#108569] / [i915#140])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/fi-icl-u3/igt@i915_selftest@live_hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/fi-icl-u3/igt@i915_selftest@live_hangcheck.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [INCOMPLETE][11] ([i915#45]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [DMESG-FAIL][13] ([i915#889]) -> [PASS][14] +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_late_gt_pm:
    - fi-skl-6600u:       [DMESG-WARN][15] ([i915#889]) -> [PASS][16] +23 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html

  
#### Warnings ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [DMESG-WARN][17] ([IGT#4] / [i915#263]) -> [FAIL][18] ([i915#217])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (53 -> 47)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3969

  CI-20190529: 20190529
  CI_DRM_7794: 00c5afbc7dc1d8e5cecea7a4369320d6ba99a5b8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_userptr_blits@invalid-uc-mapping
+igt@gem_userptr_blits@invalid-wb-mapping
+igt@gem_userptr_blits@invalid-wc-mapping

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

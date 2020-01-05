Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 05 Jan 2020 01:40:14 -0000
Message-ID: <157818841408.14739.15493864773955143553@emeril.freedesktop.org>
References: <20200104153746.2175482-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200104153746.2175482-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Find_the_associated_perf-type_for_a_particular_device_?=
 =?utf-8?b?KHJldjMp?=
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

Series: i915/perf: Find the associated perf-type for a particular device (rev3)
URL   : https://patchwork.freedesktop.org/series/71609/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7678 -> IGTPW_3900
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/index.html

Known issues
------------

  Here are the changes found in IGTPW_3900 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       [PASS][1] -> [DMESG-WARN][2] ([i915#889]) +23 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_execlists:
    - fi-kbl-guc:         [PASS][3] -> [INCOMPLETE][4] ([fdo#112175] / [fdo#112259])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-kbl-guc/igt@i915_selftest@live_execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-kbl-guc/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [PASS][5] -> [DMESG-FAIL][6] ([i915#889]) +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [PASS][7] -> [FAIL][8] ([fdo#109635])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-icl-u2:          [PASS][9] -> [DMESG-WARN][10] ([i915#263])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][11] ([i915#816]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [DMESG-WARN][13] ([i915#289]) -> [PASS][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-icl-u2/igt@i915_module_load@reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-icl-u2/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [DMESG-WARN][15] ([i915#889]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-u3:          [DMESG-FAIL][17] ([i915#419]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-icl-u3/igt@i915_selftest@live_hangcheck.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-icl-u3/igt@i915_selftest@live_hangcheck.html

  
#### Warnings ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [DMESG-WARN][19] ([IGT#4] / [i915#263]) -> [FAIL][20] ([i915#323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#112175]: https://bugs.freedesktop.org/show_bug.cgi?id=112175
  [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#419]: https://gitlab.freedesktop.org/drm/intel/issues/419
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (51 -> 37)
------------------------------

  Missing    (14): fi-kbl-soraka fi-hsw-4770r fi-ilk-m540 fi-bdw-5557u fi-hsw-4200u fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-gdg-551 fi-skl-lmem fi-byt-clapper fi-bdw-samus fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5357 -> IGTPW_3900

  CI-20190529: 20190529
  CI_DRM_7678: e554efffc6ca410bae6c5b3f310dea22f597487c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3900: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/index.html
  IGT_5357: a555a4b98f90dab655d24bb3d07e9291a8b8dac8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

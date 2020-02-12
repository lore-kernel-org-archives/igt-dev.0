Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 12 Feb 2020 09:42:46 -0000
Message-ID: <158150056600.24265.6481759404118423052@emeril.freedesktop.org>
References: <20200212091401.26642-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200212091401.26642-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Falignment=2Ec=3A_Update_to_be_completable_in_a_rat?=
 =?utf-8?q?ional_time=2E?=
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_exec_alignment.c: Update to be completable in a rational time.
URL   : https://patchwork.freedesktop.org/series/73325/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7917 -> IGTPW_4132
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/index.html

Known issues
------------

  Here are the changes found in IGTPW_4132 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][1] ([i915#45]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [SKIP][3] ([fdo#109271]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-apl-guc:         [INCOMPLETE][5] ([fdo#103927]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/fi-apl-guc/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/fi-apl-guc/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-skl-lmem:        [INCOMPLETE][7] ([CI#80] / [i915#424]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/fi-skl-lmem/igt@i915_selftest@live_gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/fi-skl-lmem/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-bdw-5557u:       [TIMEOUT][9] ([fdo#112271]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/fi-bdw-5557u/igt@i915_selftest@live_gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/fi-bdw-5557u/igt@i915_selftest@live_gtt.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-byt-n2820:       [FAIL][11] ([i915#816]) -> [FAIL][12] ([i915#999])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/fi-byt-n2820/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/fi-byt-n2820/igt@runner@aborted.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#999]: https://gitlab.freedesktop.org/drm/intel/issues/999


Participating hosts (49 -> 37)
------------------------------

  Additional (2): fi-ilk-650 fi-elk-e7500 
  Missing    (14): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u fi-hsw-peppy fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-kbl-7500u fi-ctg-p8600 fi-ivb-3770 fi-cfl-8109u fi-blb-e6850 fi-byt-clapper fi-skl-6600u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5435 -> IGTPW_4132

  CI-20190529: 20190529
  CI_DRM_7917: 57a1e61c216bb9ef9dcd9dca1681266510a837f6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4132: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/index.html
  IGT_5435: 2b6d4476dde53c363b8808ed9f0dd5547ac78641 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

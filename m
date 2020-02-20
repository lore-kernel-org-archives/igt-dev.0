Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 06:23:38 -0000
Message-ID: <158217981855.17407.3710582846464330833@emeril.freedesktop.org>
References: <20200220051432.21898-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200220051432.21898-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Frequest=5Fretire=3A_Removal_of_test?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_request_retire: Removal of test
URL   : https://patchwork.freedesktop.org/series/73689/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7970 -> IGTPW_4190
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/index.html

Known issues
------------

  Here are the changes found in IGTPW_4190 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][3] -> [INCOMPLETE][4] ([i915#45])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_execlists:
    - {fi-tgl-dsi}:       [INCOMPLETE][5] ([i915#529] / [i915#647]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/fi-tgl-dsi/igt@i915_selftest@live_execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/fi-tgl-dsi/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gtt:
    - fi-kbl-7500u:       [TIMEOUT][7] ([fdo#112271]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/fi-kbl-7500u/igt@i915_selftest@live_gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/fi-kbl-7500u/igt@i915_selftest@live_gtt.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-byt-n2820:       [FAIL][9] ([i915#999]) -> [FAIL][10] ([i915#816])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/fi-byt-n2820/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/fi-byt-n2820/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#647]: https://gitlab.freedesktop.org/drm/intel/issues/647
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#999]: https://gitlab.freedesktop.org/drm/intel/issues/999


Participating hosts (48 -> 41)
------------------------------

  Additional (4): fi-gdg-551 fi-bsw-nick fi-skl-6600u fi-snb-2600 
  Missing    (11): fi-ilk-m540 fi-hsw-4200u fi-hsw-peppy fi-skl-guc fi-glk-dsi fi-byt-squawks fi-bsw-cyan fi-icl-u3 fi-skl-lmem fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5452 -> IGTPW_4190

  CI-20190529: 20190529
  CI_DRM_7970: 6b8b833350142345f4b1a6af9486db7d316a7ff1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4190: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/index.html
  IGT_5452: c05dc6cd816feb1cc518ce777ab3fd6c81893113 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@gem_request_retire@retire-vma-not-inactive

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

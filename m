Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 14:19:03 -0000
Message-ID: <158194914349.16572.15346914454954132410@emeril.freedesktop.org>
References: <20200207134527.17205-1-ramalingam.c@intel.com>
In-Reply-To: <20200207134527.17205-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_tests/intel=5Fdp=5Fcompli?=
 =?utf-8?q?ance=3A_use_device_coherent_mapping_instead_of_mmap=5Fgtt_=28re?=
 =?utf-8?b?djIp?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/intel_dp_compliance: use device coherent mapping instead of mmap_gtt (rev2)
URL   : https://patchwork.freedesktop.org/series/73148/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7954 -> IGTPW_4163
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4163/index.html

Known issues
------------

  Here are the changes found in IGTPW_4163 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [TIMEOUT][1] ([fdo#112271] / [i915#1084]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7954/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4163/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084


Participating hosts (50 -> 44)
------------------------------

  Additional (1): fi-ehl-1 
  Missing    (7): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bsw-kefka fi-kbl-7560u fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5444 -> IGTPW_4163

  CI-20190529: 20190529
  CI_DRM_7954: d7c1791394faaa869d3442705413dac8c0ecd677 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4163: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4163/index.html
  IGT_5444: c46bae259d427f53fcfcd5f05de0181a9e82d6fe @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@i915_pm_rpm@gem-mmap-type
-igt@i915_pm_rpm@gem-mmap-cpu
-igt@i915_pm_rpm@gem-mmap-gtt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4163/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

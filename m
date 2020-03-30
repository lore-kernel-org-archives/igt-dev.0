Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Mar 2020 08:52:40 -0000
Message-ID: <158555836000.13825.12203464421287534408@emeril.freedesktop.org>
References: <20200330081707.3084-1-mika.kahola@intel.com>
In-Reply-To: <20200330081707.3084-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Move_bandwidth_calculation_to_igt=5Ffixture?=
 =?utf-8?q?_=28rev3=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_concurrent: Move bandwidth calculation to igt_fixture (rev3)
URL   : https://patchwork.freedesktop.org/series/75174/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8212 -> IGTPW_4370
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/index.html

Known issues
------------

  Here are the changes found in IGTPW_4370 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [PASS][1] -> [DMESG-FAIL][2] ([fdo#108569])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/fi-icl-y/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/fi-icl-y/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_timelines:
    - {fi-tgl-u}:         [DMESG-FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/fi-tgl-u/igt@i915_selftest@live@gt_timelines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/fi-tgl-u/igt@i915_selftest@live@gt_timelines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569


Participating hosts (45 -> 37)
------------------------------

  Additional (5): fi-cml-u2 fi-cml-s fi-skl-6770hq fi-cfl-8700k fi-cfl-8109u 
  Missing    (13): fi-bdw-samus fi-hsw-peppy fi-bdw-gvtdvm fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-elk-e7500 fi-skl-lmem fi-kbl-7560u fi-byt-n2820 fi-byt-clapper fi-skl-6600u fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5544 -> IGTPW_4370

  CI-20190529: 20190529
  CI_DRM_8212: 68b152390f915c189e2dd0b29eec557d5d8be9a8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4370: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/index.html
  IGT_5544: 477c562fc9932939083d732b77dd7b083c6bc0a1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

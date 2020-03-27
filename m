Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Mar 2020 14:33:49 -0000
Message-ID: <158531962956.17237.177540965599698535@emeril.freedesktop.org>
References: <20200327140844.11430-1-mika.kahola@intel.com>
In-Reply-To: <20200327140844.11430-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Move_bandwidth_calculation_to_igt=5Ffixture?=
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

Series: tests/kms_concurrent: Move bandwidth calculation to igt_fixture
URL   : https://patchwork.freedesktop.org/series/75174/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8202 -> IGTPW_4367
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/index.html

Known issues
------------

  Here are the changes found in IGTPW_4367 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [DMESG-FAIL][1] ([i915#1314]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  
  [i915#1314]: https://gitlab.freedesktop.org/drm/intel/issues/1314


Participating hosts (47 -> 41)
------------------------------

  Additional (1): fi-skl-lmem 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5542 -> IGTPW_4367

  CI-20190529: 20190529
  CI_DRM_8202: 3d926ba12446374635f2fc299233742ffc1ba69a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4367: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/index.html
  IGT_5542: 633ae927e4924006040f075841ef8d98751ce3b4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

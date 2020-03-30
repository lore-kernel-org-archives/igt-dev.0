Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Mar 2020 13:29:05 -0000
Message-ID: <158557494546.13826.13662269248004909354@emeril.freedesktop.org>
References: <20200330124834.43038-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200330124834.43038-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_dramatically_loosen_expectations_on_oa-exponents?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: dramatically loosen expectations on oa-exponents
URL   : https://patchwork.freedesktop.org/series/75238/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8213 -> IGTPW_4373
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4373/index.html

Known issues
------------

  Here are the changes found in IGTPW_4373 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] ([i915#69])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/fi-skl-6600u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4373/fi-skl-6600u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69


Participating hosts (47 -> 40)
------------------------------

  Additional (3): fi-kbl-7560u fi-tgl-y fi-bsw-n3050 
  Missing    (10): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-icl-u2 fi-bsw-cyan fi-ctg-p8600 fi-gdg-551 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5544 -> IGTPW_4373

  CI-20190529: 20190529
  CI_DRM_8213: 3cebf14c87d0d4508d4cc9c49db14061af752c37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4373: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4373/index.html
  IGT_5544: 477c562fc9932939083d732b77dd7b083c6bc0a1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4373/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

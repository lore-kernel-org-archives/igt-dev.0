Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 08:46:02 -0000
Message-ID: <158987796292.31238.2998516101735547408@emeril.freedesktop.org>
References: <20200519081134.24589-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200519081134.24589-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgTWFrZSBn?=
 =?utf-8?q?pgpu_fill_tests_libdrm_independent_=28rev4=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Make gpgpu fill tests libdrm independent (rev4)
URL   : https://patchwork.freedesktop.org/series/77175/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8500 -> IGTPW_4582
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4582 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4582, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4582:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_gpgpu_fill:
    - fi-icl-y:           NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-icl-y/igt@gem_gpgpu_fill.html
    - fi-icl-u2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-icl-u2/igt@gem_gpgpu_fill.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-skl-6700k2/igt@gem_gpgpu_fill.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-cfl-8700k/igt@gem_gpgpu_fill.html
    - fi-apl-guc:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-apl-guc/igt@gem_gpgpu_fill.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-glk-dsi/igt@gem_gpgpu_fill.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-skl-6600u/igt@gem_gpgpu_fill.html
    - fi-tgl-y:           NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-tgl-y/igt@gem_gpgpu_fill.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-bdw-5557u/igt@gem_gpgpu_fill.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-kbl-guc/igt@gem_gpgpu_fill.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-kbl-x1275/igt@gem_gpgpu_fill.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-kbl-7500u/igt@gem_gpgpu_fill.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-skl-lmem/igt@gem_gpgpu_fill.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-cfl-8109u/igt@gem_gpgpu_fill.html
    - fi-kbl-r:           NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-kbl-r/igt@gem_gpgpu_fill.html
    - fi-icl-guc:         NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-icl-guc/igt@gem_gpgpu_fill.html
    - fi-byt-n2820:       NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-byt-n2820/igt@gem_gpgpu_fill.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-kbl-8809g/igt@gem_gpgpu_fill.html
    - fi-cml-u2:          NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-cml-u2/igt@gem_gpgpu_fill.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-bxt-dsi/igt@gem_gpgpu_fill.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-cfl-guc/igt@gem_gpgpu_fill.html
    - fi-whl-u:           NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-whl-u/igt@gem_gpgpu_fill.html
    - fi-skl-guc:         NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-skl-guc/igt@gem_gpgpu_fill.html
    - fi-cml-s:           NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-cml-s/igt@gem_gpgpu_fill.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_gpgpu_fill:
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-tgl-dsi/igt@gem_gpgpu_fill.html
    - {fi-ehl-1}:         NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-ehl-1/igt@gem_gpgpu_fill.html
    - {fi-tgl-u}:         NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/fi-tgl-u/igt@gem_gpgpu_fill.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (50 -> 42)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-hsw-4770 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4582

  CI-20190529: 20190529
  CI_DRM_8500: c39d7055bc4dc2f29dc1e8b0c35cfa11805f1df1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4582: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4582/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

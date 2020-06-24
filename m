Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Jun 2020 09:51:37 -0000
Message-ID: <159299229713.19238.14094006007695036745@emeril.freedesktop.org>
References: <20200624082545.14362-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200624082545.14362-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev4=29?=
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

Series: Add api_intel_bb test (rev4)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8660 -> IGTPW_4699
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4699:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@blit-noreloc-keep-cache} (NEW):
    - fi-pnv-d510:        NOTRUN -> [FAIL][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-pnv-d510/igt@api_intel_bb@blit-noreloc-keep-cache.html

  * {igt@api_intel_bb@blit-reloc-keep-cache} (NEW):
    - fi-gdg-551:         NOTRUN -> [FAIL][2] +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-gdg-551/igt@api_intel_bb@blit-reloc-keep-cache.html

  * {igt@api_intel_bb@blit-reloc-purge-cache} (NEW):
    - fi-elk-e7500:       NOTRUN -> [FAIL][3] +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-elk-e7500/igt@api_intel_bb@blit-reloc-purge-cache.html

  * {igt@api_intel_bb@intel-bb-blit} (NEW):
    - fi-blb-e6850:       NOTRUN -> [FAIL][4] +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-blb-e6850/igt@api_intel_bb@intel-bb-blit.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][5] +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-bwr-2160/igt@api_intel_bb@intel-bb-blit.html

  * {igt@api_intel_bb@intentionally-fail} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-cfl-8109u/igt@api_intel_bb@intentionally-fail.html
    - fi-byt-n2820:       NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-byt-n2820/igt@api_intel_bb@intentionally-fail.html
    - fi-icl-u2:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-icl-u2/igt@api_intel_bb@intentionally-fail.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-cfl-8700k/igt@api_intel_bb@intentionally-fail.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-bsw-kefka/igt@api_intel_bb@intentionally-fail.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-kbl-8809g/igt@api_intel_bb@intentionally-fail.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-snb-2520m/igt@api_intel_bb@intentionally-fail.html
    - fi-apl-guc:         NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-apl-guc/igt@api_intel_bb@intentionally-fail.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-glk-dsi/igt@api_intel_bb@intentionally-fail.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-tgl-dsi/igt@api_intel_bb@intentionally-fail.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-skl-6600u/igt@api_intel_bb@intentionally-fail.html
    - fi-skl-guc:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-skl-guc/igt@api_intel_bb@intentionally-fail.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-cfl-guc/igt@api_intel_bb@intentionally-fail.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-kbl-x1275/igt@api_intel_bb@intentionally-fail.html
    - fi-ilk-650:         NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-ilk-650/igt@api_intel_bb@intentionally-fail.html
    - fi-icl-y:           NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-icl-y/igt@api_intel_bb@intentionally-fail.html
    - fi-byt-j1900:       NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-byt-j1900/igt@api_intel_bb@intentionally-fail.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-bsw-n3050/igt@api_intel_bb@intentionally-fail.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-ivb-3770/igt@api_intel_bb@intentionally-fail.html
    - fi-tgl-u2:          NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-tgl-u2/igt@api_intel_bb@intentionally-fail.html
    - fi-cml-u2:          NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-cml-u2/igt@api_intel_bb@intentionally-fail.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-bxt-dsi/igt@api_intel_bb@intentionally-fail.html
    - {fi-kbl-7560u}:     NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-kbl-7560u/igt@api_intel_bb@intentionally-fail.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-hsw-4770/igt@api_intel_bb@intentionally-fail.html
    - fi-whl-u:           NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-whl-u/igt@api_intel_bb@intentionally-fail.html
    - fi-snb-2600:        NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-snb-2600/igt@api_intel_bb@intentionally-fail.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-kbl-soraka/igt@api_intel_bb@intentionally-fail.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-kbl-guc/igt@api_intel_bb@intentionally-fail.html
    - {fi-ehl-1}:         NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-ehl-1/igt@api_intel_bb@intentionally-fail.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/fi-bsw-nick/igt@api_intel_bb@intentionally-fail.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8660 and IGTPW_4699:

### New IGT tests (11) ###

  * igt@api_intel_bb:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 5 fail(s) 30 pass(s)
    - Exec time: [0.00, 0.25] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 5 fail(s) 30 pass(s)
    - Exec time: [0.00, 0.09] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 5 fail(s) 30 pass(s)
    - Exec time: [0.00, 0.08] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 5 fail(s) 30 pass(s)
    - Exec time: [0.00, 0.10] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 5 fail(s) 30 pass(s)
    - Exec time: [0.06, 11.77] s

  * igt@api_intel_bb@intentionally-fail:
    - Statuses : 35 fail(s)
    - Exec time: [0.01, 0.95] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 35 pass(s)
    - Exec time: [0.00, 0.04] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 35 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 32 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@i915_pm_sseu:
    - Statuses :
    - Exec time: [None] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (44 -> 37)
------------------------------

  Missing    (7): fi-ilk-m540 fi-cml-s fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4699

  CI-20190529: 20190529
  CI_DRM_8660: 46d717372cd0a64380f01c9def59738f5705bd43 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4699: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_bb@blit-noreloc-keep-cache
+igt@api_intel_bb@blit-noreloc-purge-cache
+igt@api_intel_bb@blit-reloc-keep-cache
+igt@api_intel_bb@blit-reloc-purge-cache
+igt@api_intel_bb@intel-bb-blit
+igt@api_intel_bb@intentionally-fail
+igt@api_intel_bb@offset-control
+igt@api_intel_bb@simple-bb
+igt@api_intel_bb@simple-bb-ctx

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 23 Jun 2020 15:41:33 -0000
Message-ID: <159292689316.4208.12999472562565266247@emeril.freedesktop.org>
References: <20200623142142.26229-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200623142142.26229-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev3=29?=
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

Series: Add api_intel_bb test (rev3)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8658 -> IGTPW_4696
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4696:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@intel-bb-blit} (NEW):
    - fi-blb-e6850:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/fi-blb-e6850/igt@api_intel_bb@intel-bb-blit.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/fi-pnv-d510/igt@api_intel_bb@intel-bb-blit.html
    - fi-gdg-551:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/fi-gdg-551/igt@api_intel_bb@intel-bb-blit.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8658 and IGTPW_4696:

### New IGT tests (10) ###

  * igt@api_intel_bb:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 3 fail(s) 33 pass(s)
    - Exec time: [0.07, 0.75] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.04] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 33 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@i915_pm_sseu:
    - Statuses :
    - Exec time: [None] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (44 -> 38)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4696

  CI-20190529: 20190529
  CI_DRM_8658: c86979e2fe3c106d95b5fcf2075709afa40f0f95 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4696: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_bb@blit-noreloc-keep-cache
+igt@api_intel_bb@blit-noreloc-purge-cache
+igt@api_intel_bb@blit-reloc-keep-cache
+igt@api_intel_bb@blit-reloc-purge-cache
+igt@api_intel_bb@intel-bb-blit
+igt@api_intel_bb@offset-control
+igt@api_intel_bb@simple-bb
+igt@api_intel_bb@simple-bb-ctx

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

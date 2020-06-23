Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 23 Jun 2020 10:03:21 -0000
Message-ID: <159290660180.27517.1625389331843323801@emeril.freedesktop.org>
References: <20200623090249.12162-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200623090249.12162-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgKkFkZCBh?=
 =?utf-8?q?pi=5Fintel=5Fbb_test?=
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

Series: *Add api_intel_bb test
URL   : https://patchwork.freedesktop.org/series/78730/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8655 -> IGTPW_4691
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4691 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4691, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4691:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@blit-reloc-keep-cache} (NEW):
    - fi-gdg-551:         NOTRUN -> [FAIL][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/fi-gdg-551/igt@api_intel_bb@blit-reloc-keep-cache.html
    - fi-ilk-650:         NOTRUN -> [FAIL][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/fi-ilk-650/igt@api_intel_bb@blit-reloc-keep-cache.html

  * {igt@api_intel_bb@blit-reloc-purge-cache} (NEW):
    - fi-elk-e7500:       NOTRUN -> [FAIL][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/fi-elk-e7500/igt@api_intel_bb@blit-reloc-purge-cache.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/fi-bwr-2160/igt@api_intel_bb@blit-reloc-purge-cache.html

  * {igt@api_intel_bb@intel-bb-blit} (NEW):
    - fi-blb-e6850:       NOTRUN -> [FAIL][5] +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/fi-blb-e6850/igt@api_intel_bb@intel-bb-blit.html

  * {igt@api_intel_bb@simple-bb} (NEW):
    - fi-pnv-d510:        NOTRUN -> [FAIL][6] +5 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/fi-pnv-d510/igt@api_intel_bb@simple-bb.html

  * igt@runner@aborted:
    - fi-cml-s:           NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/fi-cml-s/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8655 and IGTPW_4691:

### New IGT tests (9) ###

  * igt@api_intel_bb:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 6 fail(s) 28 pass(s)
    - Exec time: [0.00, 0.20] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 6 fail(s) 28 pass(s)
    - Exec time: [0.00, 0.05] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 6 fail(s) 28 pass(s)
    - Exec time: [0.00, 0.04] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 6 fail(s) 28 pass(s)
    - Exec time: [0.00, 0.06] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 3 fail(s) 31 pass(s)
    - Exec time: [0.06, 0.60] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 34 pass(s)
    - Exec time: [0.00, 0.05] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 3 fail(s) 31 pass(s)
    - Exec time: [0.00, 0.05] s

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
  * IGT: IGT_5716 -> IGTPW_4691

  CI-20190529: 20190529
  CI_DRM_8655: 25d43cec6c2200a9ebe8a8b0923b27b164a6f424 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4691: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/index.html
  IGT_5716: 71a22c37ae6541f9d991d81f15cbade1da402b75 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_bb@blit-noreloc-keep-cache
+igt@api_intel_bb@blit-noreloc-purge-cache
+igt@api_intel_bb@blit-reloc-keep-cache
+igt@api_intel_bb@blit-reloc-purge-cache
+igt@api_intel_bb@intel-bb-blit
+igt@api_intel_bb@offset-control
+igt@api_intel_bb@simple-bb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4691/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

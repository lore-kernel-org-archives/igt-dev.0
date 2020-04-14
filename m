Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Apr 2020 14:42:58 -0000
Message-ID: <158687537836.30379.9981666807830035611@emeril.freedesktop.org>
References: <20200414101109.28762-1-karthik.b.s@intel.com>
In-Reply-To: <20200414101109.28762-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=3A_Add_test_to_validate_asynchronous_flips_=28rev2?=
 =?utf-8?q?=29?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_async: Add test to validate asynchronous flips (rev2)
URL   : https://patchwork.freedesktop.org/series/75453/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8295 -> IGTPW_4457
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/index.html

Known issues
------------

  Here are the changes found in IGTPW_4457 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [PASS][1] -> [DMESG-WARN][2] ([IGT#4])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][3] -> [FAIL][4] ([i915#262])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       [INCOMPLETE][5] ([i915#69]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69


Participating hosts (49 -> 44)
------------------------------

  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4457

  CI-20190529: 20190529
  CI_DRM_8295: 4cb6dbe0a641129fd07ad1fbfcd6e7b4f03ec5c1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4457: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_async@async-flip-without-page-flip-events
+igt@kms_async@async-flip-with-page-flip-events

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

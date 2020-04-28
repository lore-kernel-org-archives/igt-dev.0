Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Apr 2020 11:25:10 -0000
Message-ID: <158807311086.17772.7747130926938166411@emeril.freedesktop.org>
References: <20200428100832.7612-1-karthik.b.s@intel.com>
In-Reply-To: <20200428100832.7612-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fmultipipe=5Fmodeset=3A_Add_test_to_validate_max_pipe_conf?=
 =?utf-8?q?iguration_=28rev3=29?=
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

Series: tests/kms_multipipe_modeset: Add test to validate max pipe configuration (rev3)
URL   : https://patchwork.freedesktop.org/series/75876/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8379 -> IGTPW_4512
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/index.html

Known issues
------------

  Here are the changes found in IGTPW_4512 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_contexts:
    - fi-bwr-2160:        [INCOMPLETE][1] ([i915#1726] / [i915#489]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/fi-bwr-2160/igt@i915_selftest@live@gt_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/fi-bwr-2160/igt@i915_selftest@live@gt_contexts.html

  
  [i915#1726]: https://gitlab.freedesktop.org/drm/intel/issues/1726
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (48 -> 44)
------------------------------

  Additional (1): fi-cml-u2 
  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5614 -> IGTPW_4512

  CI-20190529: 20190529
  CI_DRM_8379: d33b3d1c05caaceef0a9cc7e5fa9e5f18fdd2e95 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4512: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/index.html
  IGT_5614: d095827add11d4e8158b87683971ee659749d9a4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_multipipe_modeset@basic-max-pipe-crc-check

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

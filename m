Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 17:00:02 -0000
Message-ID: <158990760229.31239.17257556207937658359@emeril.freedesktop.org>
References: <20200519141252.2032914-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200519141252.2032914-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915=3A_Add_test_to_assert_tha?=
 =?utf-8?q?t_the_PCI-ID_is_known?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] i915: Add test to assert that the PCI-ID is known
URL   : https://patchwork.freedesktop.org/series/77421/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8505 -> IGTPW_4590
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/index.html

Known issues
------------

  Here are the changes found in IGTPW_4590 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-bwr-2160:        [INCOMPLETE][1] ([i915#489]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/fi-bwr-2160/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/fi-bwr-2160/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][3] ([i915#227]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [i915#227]: https://gitlab.freedesktop.org/drm/intel/issues/227
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (49 -> 42)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-hsw-4770 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5660 -> IGTPW_4590

  CI-20190529: 20190529
  CI_DRM_8505: dd6f7db19af1ccb376719c8759afe6be9107315c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4590: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/index.html
  IGT_5660: bf43e3e45a17c16094fb3a47b363ccf1c95c28b9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@i915_pciid

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

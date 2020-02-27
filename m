Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 27 Feb 2020 14:37:14 -0000
Message-ID: <158281423479.29657.6158408214898610225@emeril.freedesktop.org>
References: <20200227101724.1620389-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200227101724.1620389-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_add_a_stress_test_opening/closing_the_stream?=
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

Series: tests/perf: add a stress test opening/closing the stream
URL   : https://patchwork.freedesktop.org/series/74002/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8017 -> IGTPW_4233
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/index.html

Known issues
------------

  Here are the changes found in IGTPW_4233 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][1] ([fdo#111407]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407


Participating hosts (49 -> 42)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-cfl-guc fi-kbl-8809g fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5473 -> IGTPW_4233

  CI-20190529: 20190529
  CI_DRM_8017: 97e8d028e02f730e59a759f6636fd3d629a73f69 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4233: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/index.html
  IGT_5473: d22b3507ff2678a05d69d47c0ddf6f0e72ee7ffd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf@stress-open-close

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

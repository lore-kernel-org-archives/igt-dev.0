Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 31 Mar 2020 12:43:56 -0000
Message-ID: <158565863671.5566.6993402190107304338@emeril.freedesktop.org>
References: <20200331111911.122768-1-michal@hardline.pl>
In-Reply-To: <20200331111911.122768-1-michal@hardline.pl>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdummyload=3A_Use_timerfd_rather_than_SIGEV=5FTHREAD?=
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
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal@hardline.pl>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_dummyload: Use timerfd rather than SIGEV_THREAD
URL   : https://patchwork.freedesktop.org/series/75309/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5548 -> IGTPW_4380
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4380 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4380, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4380/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4380:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/fi-icl-y/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4380/fi-icl-y/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_4380 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-kbl-7500u:       [INCOMPLETE][3] ([CI#80] / [i915#656]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/fi-kbl-7500u/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4380/fi-kbl-7500u/igt@i915_selftest@live@execlists.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (47 -> 43)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (5): fi-hsw-4200u fi-skl-6770hq fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5548 -> IGTPW_4380

  CI-20190529: 20190529
  CI_DRM_8222: 6970d295e51e3b03d7ee3f781522398402d3a35d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4380: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4380/index.html
  IGT_5548: d9e70dc1b35633b7d5c81cbfa165e331189eb260 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4380/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

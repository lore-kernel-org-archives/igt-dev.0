Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 11 May 2020 11:28:58 -0000
Message-ID: <158919653805.13117.824409364314923115@emeril.freedesktop.org>
References: <20200511082141.65494-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200511082141.65494-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fringfill=3A_Do_a_basic_pass_over_all_engines_simultaneousl?=
 =?utf-8?q?y_=28rev3=29?=
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

Series: i915/gem_ringfill: Do a basic pass over all engines simultaneously (rev3)
URL   : https://patchwork.freedesktop.org/series/77142/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8462 -> IGTPW_4555
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8462 and IGTPW_4555:

### New IGT tests (1) ###

  * igt@gem_ringfill@basic-all:
    - Statuses : 38 pass(s)
    - Exec time: [0.0, 1.41] s

  

Known issues
------------

  Here are the changes found in IGTPW_4555 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-edid-read:
    - fi-icl-u2:          [PASS][1] -> [FAIL][2] ([i915#976])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html

  
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (47 -> 41)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5644 -> IGTPW_4555

  CI-20190529: 20190529
  CI_DRM_8462: f15508df0c2c0ab81c181457603f83ccc4ddf866 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4555: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/index.html
  IGT_5644: 16f067ae42a6a93b8f0c5835210e2575a883001b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ringfill@basic-all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

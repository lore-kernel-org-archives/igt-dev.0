Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 11 May 2020 08:54:56 -0000
Message-ID: <158918729696.13119.7964018816422663315@emeril.freedesktop.org>
References: <20200511082141.65494-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200511082141.65494-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fringfill=3A_Do_a_basic_pass_over_all_engines_simultaneousl?=
 =?utf-8?q?y?=
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

Series: i915/gem_ringfill: Do a basic pass over all engines simultaneously
URL   : https://patchwork.freedesktop.org/series/77142/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8461 -> IGTPW_4554
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4554:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ringfill@basic-all} (NEW):
    - fi-snb-2600:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/fi-snb-2600/igt@gem_ringfill@basic-all.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/fi-snb-2520m/igt@gem_ringfill@basic-all.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8461 and IGTPW_4554:

### New IGT tests (1) ###

  * igt@gem_ringfill@basic-all:
    - Statuses : 2 fail(s) 35 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.52] s

  

Known issues
------------

  Here are the changes found in IGTPW_4554 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-y:           [INCOMPLETE][3] ([i915#1580]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/fi-icl-y/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/fi-icl-y/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1580]: https://gitlab.freedesktop.org/drm/intel/issues/1580


Participating hosts (48 -> 42)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5644 -> IGTPW_4554

  CI-20190529: 20190529
  CI_DRM_8461: c0be14b9502e54c9ece4f4fc25872d665c6a6553 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4554: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/index.html
  IGT_5644: 16f067ae42a6a93b8f0c5835210e2575a883001b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ringfill@basic-all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 29 Jun 2020 09:43:17 -0000
Message-ID: <159342379713.746.7926840013409501680@emeril.freedesktop.org>
References: <20200629092107.10664-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200629092107.10664-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_dependency_from_gem=5F=5Bcaching/hang=5D?=
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Remove libdrm dependency from gem_[caching/hang]
URL   : https://patchwork.freedesktop.org/series/78886/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8671 -> IGTPW_4708
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4708 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4708, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4708:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_caching@read-writes:
    - fi-pnv-d510:        NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-pnv-d510/igt@gem_caching@read-writes.html
    - fi-ilk-650:         NOTRUN -> [FAIL][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-ilk-650/igt@gem_caching@read-writes.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-elk-e7500/igt@gem_caching@read-writes.html

  * igt@gem_caching@reads:
    - fi-blb-e6850:       NOTRUN -> [FAIL][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-blb-e6850/igt@gem_caching@reads.html
    - fi-gdg-551:         NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-gdg-551/igt@gem_caching@reads.html

  * {igt@gem_hang} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-cml-u2/igt@gem_hang.html
    - {fi-ehl-1}:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-ehl-1/igt@gem_hang.html
    - fi-icl-u2:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-icl-u2/igt@gem_hang.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-tgl-dsi/igt@gem_hang.html
    - fi-cml-s:           NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-cml-s/igt@gem_hang.html
    - fi-tgl-y:           NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-tgl-y/igt@gem_hang.html
    - fi-icl-y:           NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-icl-y/igt@gem_hang.html
    - fi-tgl-u2:          NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/fi-tgl-u2/igt@gem_hang.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8671 and IGTPW_4708:

### New IGT tests (2) ###

  * igt@gem_caching:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_hang:
    - Statuses : 37 skip(s)
    - Exec time: [0.01, 0.08] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (46 -> 39)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4708

  CI-20190529: 20190529
  CI_DRM_8671: d5765fff817aa868cbbb86ff3d3ef58d7e27251d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4708: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4708/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

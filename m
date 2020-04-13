Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 13 Apr 2020 03:32:08 -0000
Message-ID: <158674872890.9317.1066959469986945826@emeril.freedesktop.org>
References: <20200413020509.678-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200413020509.678-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaWd0L2dl?=
 =?utf-8?q?m=5Fshrink=3A_Fix_reversed_logic_when_mmap_fails?=
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/gem_shrink: Fix reversed logic when mmap fails
URL   : https://patchwork.freedesktop.org/series/75853/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8293 -> IGTPW_4451
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/index.html

Known issues
------------

  Here are the changes found in IGTPW_4451 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bwr-2160:        [PASS][1] -> [FAIL][2] ([i915#34])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4451

  CI-20190529: 20190529
  CI_DRM_8293: a5f88c99deb8e117d62a1514a1efecfddb9ed52b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4451: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

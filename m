Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 16:47:08 -0000
Message-ID: <158195802899.16571.10897014690554881928@emeril.freedesktop.org>
References: <20200217145042.829-1-petri.latvala@intel.com>
In-Reply-To: <20200217145042.829-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_runner=3A_Refactor_timeouting?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] runner: Refactor timeouting
URL   : https://patchwork.freedesktop.org/series/73539/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7955 -> IGTPW_4166
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4166 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4166, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4166:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-7500u:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/fi-kbl-7500u/igt@gem_exec_suspend@basic-s0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s0:
    - {fi-kbl-7560u}:     NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/fi-kbl-7560u/igt@gem_exec_suspend@basic-s0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4166 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][3] -> [INCOMPLETE][4] ([i915#694] / [i915#816])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937


Participating hosts (51 -> 46)
------------------------------

  Additional (2): fi-kbl-7560u fi-kbl-7500u 
  Missing    (7): fi-hsw-4770r fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5445 -> IGTPW_4166

  CI-20190529: 20190529
  CI_DRM_7955: 429740c5a92b11e3b649edb3ed4fd66237bd323e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4166: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/index.html
  IGT_5445: 21e523814d692978d6d04ba85eadd67fcbd88b7e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

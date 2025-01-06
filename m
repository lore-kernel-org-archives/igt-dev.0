Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7242E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 14:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E08910E695;
	Mon,  6 Jan 2025 14:58:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D2F10E695;
 Mon,  6 Jan 2025 14:58:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2C1/8=5D_tests/intel/xe=5Fdrm=5Ffdinfo=3A_Do_not_end_cork_no?=
 =?utf-8?q?t_started_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 06 Jan 2025 14:58:43 -0000
Message-ID: <173617552348.205352.331153249197386291@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
In-Reply-To: <20250104071548.737612-1-lucas.demarchi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/8] tests/intel/xe_drm_fdinfo: Do not end cork not started (rev2)
URL   : https://patchwork.freedesktop.org/series/143108/
State : success

== Summary ==

CI Bug Log - changes from IGT_8174 -> IGTPW_12393
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): bat-atsm-1 fi-snb-2520m fi-bsw-nick 

Known issues
------------

  Here are the changes found in IGTPW_12393 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - fi-kbl-x1275:       NOTRUN -> [FAIL][1] ([i915#13462])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-kbl-x1275/igt@runner@aborted.html
    - bat-adlp-11:        NOTRUN -> [FAIL][2] ([i915#13462])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-adlp-11/igt@runner@aborted.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][3] ([i915#13462])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-hsw-4770/igt@runner@aborted.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][4] ([i915#13462])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-cfl-8109u/igt@runner@aborted.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][5] ([i915#13462])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-kbl-8809g/igt@runner@aborted.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][6] ([i915#13462])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-ivb-3770/igt@runner@aborted.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][7] ([i915#13462])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-mtlp-8/igt@runner@aborted.html
    - bat-dg1-6:          NOTRUN -> [FAIL][8] ([i915#13462])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-dg1-6/igt@runner@aborted.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][9] ([i915#13462])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-elk-e7500/igt@runner@aborted.html
    - bat-dg2-8:          NOTRUN -> [FAIL][10] ([i915#13462])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-dg2-8/igt@runner@aborted.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][11] ([i915#13462])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-kbl-guc/igt@runner@aborted.html
    - bat-adls-6:         NOTRUN -> [FAIL][12] ([i915#13462])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-adls-6/igt@runner@aborted.html
    - fi-ilk-650:         NOTRUN -> [FAIL][13] ([i915#13462])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-ilk-650/igt@runner@aborted.html
    - bat-jsl-1:          NOTRUN -> [FAIL][14] ([i915#13462])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-jsl-1/igt@runner@aborted.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][15] ([i915#13462])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-tgl-1115g4/igt@runner@aborted.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][16] ([i915#13462])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-blb-e6850/igt@runner@aborted.html
    - bat-mtlp-6:         NOTRUN -> [FAIL][17] ([i915#13462])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-mtlp-6/igt@runner@aborted.html
    - bat-arlh-3:         NOTRUN -> [FAIL][18] ([i915#13462])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-arlh-3/igt@runner@aborted.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][19] ([i915#13462])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-pnv-d510/igt@runner@aborted.html
    - bat-dg1-7:          NOTRUN -> [FAIL][20] ([i915#13462])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-dg1-7/igt@runner@aborted.html
    - bat-adlp-9:         NOTRUN -> [FAIL][21] ([i915#13462])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-adlp-9/igt@runner@aborted.html
    - bat-twl-2:          NOTRUN -> [FAIL][22] ([i915#13462])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-twl-2/igt@runner@aborted.html
    - bat-dg2-11:         NOTRUN -> [FAIL][23] ([i915#13462])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-dg2-11/igt@runner@aborted.html
    - bat-rpls-4:         NOTRUN -> [FAIL][24] ([i915#13462])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-rpls-4/igt@runner@aborted.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][25] ([i915#13462])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-kbl-7567u/igt@runner@aborted.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][26] ([i915#13462])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-cfl-8700k/igt@runner@aborted.html
    - bat-dg2-14:         NOTRUN -> [FAIL][27] ([i915#13462])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-dg2-14/igt@runner@aborted.html
    - bat-kbl-2:          NOTRUN -> [FAIL][28] ([i915#13462])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-kbl-2/igt@runner@aborted.html
    - bat-arls-5:         NOTRUN -> [FAIL][29] ([i915#13462])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-arls-5/igt@runner@aborted.html
    - bat-rplp-1:         NOTRUN -> [FAIL][30] ([i915#13462])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-rplp-1/igt@runner@aborted.html
    - bat-arlh-2:         NOTRUN -> [FAIL][31] ([i915#13462])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-arlh-2/igt@runner@aborted.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][32] ([i915#13462])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-rkl-11600/igt@runner@aborted.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][33] ([i915#13462])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/fi-cfl-guc/igt@runner@aborted.html
    - bat-dg2-13:         NOTRUN -> [FAIL][34] ([i915#13462])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-dg2-13/igt@runner@aborted.html
    - bat-jsl-3:          NOTRUN -> [FAIL][35] ([i915#13462])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/bat-jsl-3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#13462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13462


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8174 -> IGTPW_12393
  * Linux: CI_DRM_15892 -> CI_DRM_15908

  CI-20190529: 20190529
  CI_DRM_15892: 08bd590935a5258ffd79355c59adffd72fb2c642 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15908: f06efdfad9d0e9f5cb74404ac98e1a5b3b246567 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12393: 5ff4f2c7478a332586c48137da1a34f34ba5337d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12393/index.html

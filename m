Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488A8CD11C2
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 00:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847CD10E444;
	Thu, 11 Apr 2024 00:17:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB7510EB2E;
 Thu, 11 Apr 2024 00:17:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0268774598628458487=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_lib/kms=3A_Introduce_struct_igt=5Fforced=5Fconnector?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Apr 2024 00:17:34 -0000
Message-ID: <171279465437.1338935.15524478024071895934@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
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

--===============0268774598628458487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/kms: Introduce struct igt_forced_connector
URL   : https://patchwork.freedesktop.org/series/132284/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7805 -> IGTPW_11001
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11001 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11001, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/index.html

Participating hosts (33 -> 36)
------------------------------

  Additional (6): fi-kbl-7567u bat-arls-2 fi-bsw-n3050 fi-cfl-8109u bat-dg2-11 bat-mtlp-8 
  Missing    (3): bat-mtlp-9 fi-snb-2520m bat-arls-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11001:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adls-6:         [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html
    - bat-adlm-1:         [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html
    - fi-ilk-650:         [PASS][5] -> [FAIL][6] +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-ilk-650/igt@kms_force_connector_basic@force-connector-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-ilk-650/igt@kms_force_connector_basic@force-connector-state.html
    - bat-jsl-1:          [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html
    - fi-tgl-1115g4:      [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html
    - bat-arls-1:         [PASS][11] -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-arls-1/igt@kms_force_connector_basic@force-connector-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-1/igt@kms_force_connector_basic@force-connector-state.html
    - fi-blb-e6850:       [PASS][13] -> [FAIL][14] +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-blb-e6850/igt@kms_force_connector_basic@force-connector-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-blb-e6850/igt@kms_force_connector_basic@force-connector-state.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][15] +3 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-n3050/igt@kms_force_connector_basic@force-connector-state.html
    - bat-adlp-6:         [PASS][16] -> [FAIL][17] +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html
    - bat-mtlp-6:         [PASS][18] -> [FAIL][19] +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-mtlp-6/igt@kms_force_connector_basic@force-connector-state.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-6/igt@kms_force_connector_basic@force-connector-state.html
    - fi-pnv-d510:        [PASS][20] -> [FAIL][21] +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-pnv-d510/igt@kms_force_connector_basic@force-connector-state.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-pnv-d510/igt@kms_force_connector_basic@force-connector-state.html
    - fi-glk-j4005:       [PASS][22] -> [FAIL][23] +2 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-glk-j4005/igt@kms_force_connector_basic@force-connector-state.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-glk-j4005/igt@kms_force_connector_basic@force-connector-state.html
    - bat-adlp-9:         [PASS][24] -> [FAIL][25] +2 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-9/igt@kms_force_connector_basic@force-connector-state.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-9/igt@kms_force_connector_basic@force-connector-state.html
    - fi-cfl-8700k:       [PASS][26] -> [FAIL][27] +2 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html
    - bat-dg2-14:         [PASS][28] -> [FAIL][29] +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-14/igt@kms_force_connector_basic@force-connector-state.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-14/igt@kms_force_connector_basic@force-connector-state.html
    - fi-bsw-nick:        [PASS][30] -> [FAIL][31] +2 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-bsw-nick/igt@kms_force_connector_basic@force-connector-state.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-nick/igt@kms_force_connector_basic@force-connector-state.html
    - bat-kbl-2:          [PASS][32] -> [FAIL][33] +2 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-kbl-2/igt@kms_force_connector_basic@force-connector-state.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-kbl-2/igt@kms_force_connector_basic@force-connector-state.html
    - bat-rplp-1:         [PASS][34] -> [FAIL][35] +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html
    - fi-rkl-11600:       [PASS][36] -> [FAIL][37] +2 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
    - bat-dg2-9:          [PASS][38] -> [FAIL][39] +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-9/igt@kms_force_connector_basic@force-connector-state.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-9/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-mtlp-8:         NOTRUN -> [FAIL][40] +3 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html
    - bat-dg2-8:          [PASS][41] -> [FAIL][42] +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html
    - fi-kbl-guc:         [PASS][43] -> [FAIL][44] +2 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-guc/igt@kms_force_connector_basic@force-edid.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-guc/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-7567u:       NOTRUN -> [FAIL][45] +3 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-jsl-3:          [PASS][46] -> [FAIL][47] +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-3/igt@kms_force_connector_basic@prune-stale-modes.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-3/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-11:         NOTRUN -> [FAIL][48] +3 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
    - fi-kbl-x1275:       [PASS][49] -> [FAIL][50] +2 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][51] +3 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-adln-1:         [PASS][52] -> [FAIL][53] +2 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adln-1/igt@kms_force_connector_basic@prune-stale-modes.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adln-1/igt@kms_force_connector_basic@prune-stale-modes.html
    - fi-ivb-3770:        [PASS][54] -> [FAIL][55] +3 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-ivb-3770/igt@kms_force_connector_basic@prune-stale-modes.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-ivb-3770/igt@kms_force_connector_basic@prune-stale-modes.html
    - fi-cfl-guc:         [PASS][56] -> [FAIL][57] +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-guc/igt@kms_force_connector_basic@prune-stale-modes.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-guc/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-glk-j4005:       [PASS][58] -> [CRASH][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-glk-j4005/igt@kms_hdmi_inject@inject-audio.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-glk-j4005/igt@kms_hdmi_inject@inject-audio.html
    - bat-adlp-9:         [PASS][60] -> [CRASH][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-9/igt@kms_hdmi_inject@inject-audio.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-9/igt@kms_hdmi_inject@inject-audio.html
    - fi-cfl-8700k:       [PASS][62] -> [CRASH][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-8700k/igt@kms_hdmi_inject@inject-audio.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8700k/igt@kms_hdmi_inject@inject-audio.html
    - bat-dg2-14:         [PASS][64] -> [CRASH][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-14/igt@kms_hdmi_inject@inject-audio.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-14/igt@kms_hdmi_inject@inject-audio.html
    - fi-bsw-nick:        [PASS][66] -> [CRASH][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-bsw-nick/igt@kms_hdmi_inject@inject-audio.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-nick/igt@kms_hdmi_inject@inject-audio.html
    - bat-kbl-2:          [PASS][68] -> [CRASH][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html
    - bat-adlp-6:         [PASS][70] -> [CRASH][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-6/igt@kms_hdmi_inject@inject-audio.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-6/igt@kms_hdmi_inject@inject-audio.html
    - bat-rplp-1:         [PASS][72] -> [CRASH][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html
    - fi-rkl-11600:       [PASS][74] -> [CRASH][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-rkl-11600/igt@kms_hdmi_inject@inject-audio.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-rkl-11600/igt@kms_hdmi_inject@inject-audio.html
    - bat-jsl-3:          [PASS][76] -> [CRASH][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-3/igt@kms_hdmi_inject@inject-audio.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-3/igt@kms_hdmi_inject@inject-audio.html
    - bat-dg2-9:          [PASS][78] -> [CRASH][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-9/igt@kms_hdmi_inject@inject-audio.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-9/igt@kms_hdmi_inject@inject-audio.html
    - bat-dg2-11:         NOTRUN -> [CRASH][80]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_hdmi_inject@inject-audio.html
    - fi-cfl-8109u:       NOTRUN -> [CRASH][81]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@kms_hdmi_inject@inject-audio.html
    - fi-kbl-7567u:       NOTRUN -> [CRASH][82]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html
    - bat-adln-1:         [PASS][83] -> [CRASH][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adln-1/igt@kms_hdmi_inject@inject-audio.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adln-1/igt@kms_hdmi_inject@inject-audio.html
    - bat-mtlp-8:         NOTRUN -> [CRASH][85]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_hdmi_inject@inject-audio.html
    - bat-dg2-8:          [PASS][86] -> [CRASH][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-8/igt@kms_hdmi_inject@inject-audio.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-8/igt@kms_hdmi_inject@inject-audio.html
    - fi-kbl-guc:         [PASS][88] -> [CRASH][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
    - bat-adls-6:         [PASS][90] -> [CRASH][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adls-6/igt@kms_hdmi_inject@inject-audio.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adls-6/igt@kms_hdmi_inject@inject-audio.html
    - bat-adlm-1:         [PASS][92] -> [CRASH][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlm-1/igt@kms_hdmi_inject@inject-audio.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlm-1/igt@kms_hdmi_inject@inject-audio.html
    - fi-ilk-650:         [PASS][94] -> [CRASH][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-ilk-650/igt@kms_hdmi_inject@inject-audio.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-ilk-650/igt@kms_hdmi_inject@inject-audio.html
    - bat-jsl-1:          [PASS][96] -> [CRASH][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-1/igt@kms_hdmi_inject@inject-audio.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-1/igt@kms_hdmi_inject@inject-audio.html
    - fi-tgl-1115g4:      [PASS][98] -> [CRASH][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
    - bat-arls-1:         [PASS][100] -> [CRASH][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-arls-1/igt@kms_hdmi_inject@inject-audio.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-1/igt@kms_hdmi_inject@inject-audio.html
    - fi-bsw-n3050:       NOTRUN -> [CRASH][102]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-n3050/igt@kms_hdmi_inject@inject-audio.html
    - fi-cfl-guc:         [PASS][103] -> [CRASH][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-guc/igt@kms_hdmi_inject@inject-audio.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-guc/igt@kms_hdmi_inject@inject-audio.html
    - bat-mtlp-6:         [PASS][105] -> [CRASH][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-mtlp-6/igt@kms_hdmi_inject@inject-audio.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-6/igt@kms_hdmi_inject@inject-audio.html

  
#### Warnings ####

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adln-1:         [SKIP][107] -> [FAIL][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adln-1/igt@kms_force_connector_basic@force-load-detect.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adln-1/igt@kms_force_connector_basic@force-load-detect.html
    - fi-cfl-8700k:       [SKIP][109] -> [FAIL][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-14:         [SKIP][111] -> [FAIL][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
    - fi-bsw-nick:        [SKIP][113] -> [FAIL][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-bsw-nick/igt@kms_force_connector_basic@force-load-detect.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-nick/igt@kms_force_connector_basic@force-load-detect.html
    - bat-kbl-2:          [SKIP][115] -> [FAIL][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-kbl-2/igt@kms_force_connector_basic@force-load-detect.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-kbl-2/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlm-1:         [SKIP][117] -> [FAIL][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html
    - bat-rplp-1:         [SKIP][119] -> [FAIL][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-rplp-1/igt@kms_force_connector_basic@force-load-detect.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-rplp-1/igt@kms_force_connector_basic@force-load-detect.html
    - fi-rkl-11600:       [SKIP][121] -> [FAIL][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
    - fi-tgl-1115g4:      [SKIP][123] -> [FAIL][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html
    - fi-cfl-guc:         [SKIP][125] -> [FAIL][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-guc/igt@kms_force_connector_basic@force-load-detect.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-guc/igt@kms_force_connector_basic@force-load-detect.html
    - bat-mtlp-6:         [SKIP][127] ([i915#9792]) -> [FAIL][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-3:          [SKIP][129] -> [FAIL][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-9:          [SKIP][131] -> [FAIL][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
    - fi-kbl-x1275:       [SKIP][133] -> [FAIL][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-x1275/igt@kms_force_connector_basic@force-load-detect.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-x1275/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-8:          [SKIP][135] -> [FAIL][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html
    - fi-kbl-guc:         [SKIP][137] -> [FAIL][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-guc/igt@kms_force_connector_basic@force-load-detect.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-guc/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adls-6:         [SKIP][139] -> [FAIL][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          [SKIP][141] -> [FAIL][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html
    - bat-arls-1:         [SKIP][143] ([i915#10207]) -> [FAIL][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-arls-1/igt@kms_force_connector_basic@force-load-detect.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-1/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-6:         [SKIP][145] -> [FAIL][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
    - fi-glk-j4005:       [SKIP][147] -> [FAIL][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-glk-j4005/igt@kms_force_connector_basic@force-load-detect.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-glk-j4005/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-9:         [SKIP][149] -> [FAIL][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-9:          [SKIP][151] ([i915#5274]) -> [FAIL][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-8:          [SKIP][153] ([i915#5274]) -> [FAIL][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-mtlp-6:         [SKIP][155] ([i915#5274] / [i915#9792]) -> [FAIL][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-14:         [SKIP][157] ([i915#5274]) -> [FAIL][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html

  
Known issues
------------

  Here are the changes found in IGTPW_11001 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-mtlp-8:         NOTRUN -> [SKIP][159] ([i915#9318])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
    - bat-arls-2:         NOTRUN -> [SKIP][160] ([i915#9318])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-2/igt@debugfs_test@basic-hwmon.html

  * igt@gem_ctx_create@basic-files:
    - bat-arls-2:         NOTRUN -> [ABORT][161] ([i915#10687])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-2/igt@gem_ctx_create@basic-files.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][162] ([i915#2190])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][163] ([i915#2190])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][164] ([i915#4613]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][165] +18 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][166] ([i915#4613]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][167] ([i915#4613]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][168] ([i915#4083])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@gem_mmap@basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][169] ([i915#4083])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][170] ([i915#4077]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][171] ([i915#4079]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][172] ([i915#4077]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][173] ([i915#4079]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-11:         NOTRUN -> [SKIP][174] ([i915#6621])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][175] ([i915#6621])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][176] ([i915#4212]) +7 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][177] ([i915#5190])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-11:         NOTRUN -> [SKIP][178] ([i915#5190])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][179] ([i915#4212]) +8 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-11:         NOTRUN -> [SKIP][180] ([i915#4215] / [i915#5190])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-dg2-11:         NOTRUN -> [SKIP][181] ([i915#4103] / [i915#4213]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][182] ([i915#4213]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][183] ([i915#3555] / [i915#3840])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_dsc@dsc-basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][184] +10 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][185] ([i915#3555] / [i915#3840] / [i915#9159])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-11:         NOTRUN -> [SKIP][186] ([i915#5354])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][187] +10 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][188] ([i915#4077] / [i915#9688])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-11:         NOTRUN -> [SKIP][189] ([i915#1072] / [i915#9732]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-11:         NOTRUN -> [SKIP][190] ([i915#3555])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][191] ([i915#3555] / [i915#8809])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-11:         NOTRUN -> [SKIP][192] ([i915#3708])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-11:         NOTRUN -> [SKIP][193] ([i915#3708] / [i915#4077]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][194] ([i915#3708] / [i915#4077]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][195] ([i915#3708]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - bat-dg2-11:         NOTRUN -> [SKIP][196] ([i915#3291] / [i915#3708]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-8:         NOTRUN -> [SKIP][197] ([i915#10216] / [i915#3708])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@prime_vgem@basic-write.html

  
  [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#10687]: https://gitlab.freedesktop.org/drm/intel/issues/10687
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7805 -> IGTPW_11001

  CI-20190529: 20190529
  CI_DRM_14561: 72c79c9b20ced92d5c10230bb50fca29c9f387f9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11001: 11001
  IGT_7805: 7805

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/index.html

--===============0268774598628458487==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] lib/kms: Introduce struct igt_forced_connector</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132284/">https://patchwork.freedesktop.org/series/132284/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7805 -&gt; IGTPW_11001</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11001 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11001, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/index.html</p>
<h2>Participating hosts (33 -&gt; 36)</h2>
<p>Additional (6): fi-kbl-7567u bat-arls-2 fi-bsw-n3050 fi-cfl-8109u bat-dg2-11 bat-mtlp-8 <br />
  Missing    (3): bat-mtlp-9 fi-snb-2520m bat-arls-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11001:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-ilk-650/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-ilk-650/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +3 other tests fail</li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-arls-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-1/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-blb-e6850/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-blb-e6850/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +3 other tests fail</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-n3050/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-mtlp-6/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-6/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +1 other test fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-pnv-d510/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-pnv-d510/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +3 other tests fail</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-glk-j4005/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-glk-j4005/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-9/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-9/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-14/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-14/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +1 other test fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-bsw-nick/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-nick/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-kbl-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-kbl-2/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-9/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-9/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html">FAIL</a> +1 other test fail</li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-guc/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-guc/igt@kms_force_connector_basic@force-edid.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-3/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-3/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> +3 other tests fail</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> +2 other tests fail</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> +3 other tests fail</li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adln-1/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adln-1/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> +2 other tests fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-ivb-3770/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-ivb-3770/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> +3 other tests fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-guc/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-guc/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-glk-j4005/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-glk-j4005/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-9/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-8700k/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8700k/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-14/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-14/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-bsw-nick/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-nick/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-6/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-rkl-11600/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-rkl-11600/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-3/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-9/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adln-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adln-1/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-8/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adls-6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adls-6/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlm-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlm-1/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-ilk-650/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-ilk-650/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-1/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-arls-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-1/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-n3050/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-guc/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-mtlp-6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-6/igt@kms_hdmi_inject@inject-audio.html">CRASH</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adln-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adln-1/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-bsw-nick/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-nick/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-kbl-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-kbl-2/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-rplp-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-rplp-1/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-cfl-guc/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-guc/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-x1275/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-x1275/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-kbl-guc/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-guc/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-arls-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10207">i915#10207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-1/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/fi-glk-j4005/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-glk-j4005/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7805/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11001 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@basic-files:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-arls-2/igt@gem_ctx_create@basic-files.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10687">i915#10687</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +8 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html">SKIP</a> +10 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9159">i915#9159</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-dg2-11/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11001/bat-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7805 -&gt; IGTPW_11001</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14561: 72c79c9b20ced92d5c10230bb50fca29c9f387f9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11001: 11001<br />
  IGT_7805: 7805</p>

</body>
</html>

--===============0268774598628458487==--

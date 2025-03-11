Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09763C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 13:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BF610E1FD;
	Tue, 11 Mar 2025 13:45:38 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC0B10E1FD;
 Tue, 11 Mar 2025 13:45:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4981481836711352331=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_runner/kmemleak=3A_Remov?=
 =?utf-8?q?e_unnecessary_lseek=28=29_calls?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Mar 2025 13:45:36 -0000
Message-ID: <174170073662.18798.15227116741701124889@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310200220.233045-1-peter.senna@linux.intel.com>
In-Reply-To: <20250310200220.233045-1-peter.senna@linux.intel.com>
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

--===============4981481836711352331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner/kmemleak: Remove unnecessary lseek() calls
URL   : https://patchwork.freedesktop.org/series/146105/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_16260_full -> IGTPW_12739_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12739_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12739_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/index.html

Participating hosts (11 -> 12)
------------------------------

  Additional (2): shard-snb-0 shard-dg2-set2 
  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12739_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@load:
    - shard-tglu-1:       ([PASS][1], [PASS][2], [PASS][3]) -> [SKIP][4]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-1/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-1/igt@i915_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-1/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-1/igt@i915_module_load@load.html
    - shard-dg1:          ([PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29]) -> ([SKIP][30], [SKIP][31], [SKIP][32], [SKIP][33], [SKIP][34], [SKIP][35], [SKIP][36], [SKIP][37], [SKIP][38], [SKIP][39], [SKIP][40], [SKIP][41], [SKIP][42], [SKIP][43], [SKIP][44], [SKIP][45], [SKIP][46], [SKIP][47], [SKIP][48], [SKIP][49], [SKIP][50], [SKIP][51], [SKIP][52], [SKIP][53])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-12/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-12/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-15/igt@i915_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-12/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-19/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-15/igt@i915_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-13/igt@i915_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-19/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-13/igt@i915_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-19/igt@i915_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-17/igt@i915_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-15/igt@i915_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-18/igt@i915_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-17/igt@i915_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-18/igt@i915_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-17/igt@i915_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-18/igt@i915_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-18/igt@i915_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-18/igt@i915_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-18/igt@i915_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-16/igt@i915_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/igt@i915_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/igt@i915_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/igt@i915_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/igt@i915_module_load@load.html
    - shard-tglu:         ([PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75]) -> ([SKIP][76], [SKIP][77], [SKIP][78], [SKIP][79], [SKIP][80], [SKIP][81], [SKIP][82], [SKIP][83], [SKIP][84], [SKIP][85], [SKIP][86], [SKIP][87], [SKIP][88], [SKIP][89], [SKIP][90], [SKIP][91], [SKIP][92], [SKIP][93], [SKIP][94], [SKIP][95], [SKIP][96], [SKIP][97], [SKIP][98], [SKIP][99])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-5/igt@i915_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-10/igt@i915_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-6/igt@i915_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-10/igt@i915_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-9/igt@i915_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-9/igt@i915_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-5/igt@i915_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-6/igt@i915_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-2/igt@i915_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-4/igt@i915_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-6/igt@i915_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-9/igt@i915_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-2/igt@i915_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-2/igt@i915_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-8/igt@i915_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-7/igt@i915_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-4/igt@i915_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-3/igt@i915_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-8/igt@i915_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-3/igt@i915_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-7/igt@i915_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-3/igt@i915_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8/igt@i915_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8/igt@i915_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-7/igt@i915_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-7/igt@i915_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-6/igt@i915_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-6/igt@i915_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-6/igt@i915_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-4/igt@i915_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-4/igt@i915_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-4/igt@i915_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-3/igt@i915_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-3/igt@i915_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-3/igt@i915_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-2/igt@i915_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-2/igt@i915_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-2/igt@i915_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-10/igt@i915_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8/igt@i915_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-9/igt@i915_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8/igt@i915_module_load@load.html
    - shard-mtlp:         ([PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124]) -> ([SKIP][125], [SKIP][126], [SKIP][127], [SKIP][128], [SKIP][129], [SKIP][130], [SKIP][131], [SKIP][132], [SKIP][133], [SKIP][134], [SKIP][135], [SKIP][136], [SKIP][137], [SKIP][138], [SKIP][139], [SKIP][140], [SKIP][141], [SKIP][142], [SKIP][143], [SKIP][144], [SKIP][145], [SKIP][146], [SKIP][147], [SKIP][148], [SKIP][149])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-1/igt@i915_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-6/igt@i915_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-8/igt@i915_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-4/igt@i915_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-8/igt@i915_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-3/igt@i915_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-4/igt@i915_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-1/igt@i915_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-8/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-6/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-6/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-5/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-2/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-4/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-1/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-5/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-3/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-3/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-2/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-2/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-5/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-8/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-7/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-4/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
    - shard-dg2-9:        ([PASS][150], [PASS][151]) -> ([SKIP][152], [SKIP][153], [SKIP][154])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-9/igt@i915_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-9/igt@i915_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-9/igt@i915_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-9/igt@i915_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-9/igt@i915_module_load@load.html
    - shard-dg2:          ([PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177]) -> ([SKIP][178], [SKIP][179], [SKIP][180], [SKIP][181], [SKIP][182], [SKIP][183], [SKIP][184], [SKIP][185], [SKIP][186], [SKIP][187], [SKIP][188], [SKIP][189], [SKIP][190], [SKIP][191], [SKIP][192], [SKIP][193], [SKIP][194], [SKIP][195], [SKIP][196], [SKIP][197], [SKIP][198], [SKIP][199])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-11/igt@i915_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-7/igt@i915_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-11/igt@i915_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-11/igt@i915_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-7/igt@i915_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-10/igt@i915_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-10/igt@i915_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-1/igt@i915_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-1/igt@i915_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-6/igt@i915_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-8/igt@i915_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-6/igt@i915_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-2/igt@i915_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-8/igt@i915_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-5/igt@i915_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-2/igt@i915_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-2/igt@i915_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-3/igt@i915_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-5/igt@i915_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-5/igt@i915_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-3/igt@i915_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-4/igt@i915_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-4/igt@i915_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-8/igt@i915_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-7/igt@i915_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-7/igt@i915_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-7/igt@i915_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-6/igt@i915_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-6/igt@i915_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-6/igt@i915_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-5/igt@i915_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-5/igt@i915_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-5/igt@i915_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-4/igt@i915_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-4/igt@i915_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-4/igt@i915_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-3/igt@i915_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-3/igt@i915_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-3/igt@i915_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-2/igt@i915_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-1/igt@i915_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-11/igt@i915_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-10/igt@i915_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-10/igt@i915_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-10/igt@i915_module_load@load.html
    - shard-rkl:          ([PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221]) -> ([SKIP][222], [SKIP][223], [SKIP][224], [SKIP][225], [SKIP][226], [SKIP][227], [SKIP][228], [SKIP][229], [SKIP][230], [SKIP][231], [SKIP][232], [SKIP][233], [SKIP][234], [SKIP][235], [SKIP][236], [SKIP][237], [SKIP][238], [SKIP][239], [SKIP][240], [SKIP][241], [SKIP][242], [SKIP][243], [SKIP][244])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-5/igt@i915_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-3/igt@i915_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-5/igt@i915_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-5/igt@i915_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-6/igt@i915_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-6/igt@i915_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-3/igt@i915_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-7/igt@i915_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-4/igt@i915_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-3/igt@i915_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-7/igt@i915_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/igt@i915_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/igt@i915_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-7/igt@i915_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/igt@i915_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-4/igt@i915_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-4/igt@i915_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/igt@i915_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-6/igt@i915_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-6/igt@i915_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-6/igt@i915_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/igt@i915_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/igt@i915_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/igt@i915_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/igt@i915_module_load@load.html

  
Known issues
------------

  Here are the changes found in IGTPW_12739_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - shard-snb:          ([PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269]) -> ([SKIP][270], [SKIP][271], [SKIP][272], [SKIP][273], [SKIP][274], [SKIP][275], [SKIP][276], [SKIP][277], [SKIP][278], [SKIP][279], [SKIP][280], [SKIP][281], [SKIP][282], [SKIP][283], [SKIP][284], [SKIP][285], [SKIP][286], [SKIP][287], [SKIP][288], [SKIP][289], [SKIP][290], [SKIP][291])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb2/igt@i915_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i915_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i915_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb2/igt@i915_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i915_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb2/igt@i915_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb2/igt@i915_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb4/igt@i915_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i915_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb4/igt@i915_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb2/igt@i915_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i915_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb4/igt@i915_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb6/igt@i915_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb6/igt@i915_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb4/igt@i915_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb6/igt@i915_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb4/igt@i915_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb6/igt@i915_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb5/igt@i915_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb6/igt@i915_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb5/igt@i915_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb5/igt@i915_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb5/igt@i915_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb5/igt@i915_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html
    - shard-glk:          ([PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313]) -> ([SKIP][314], [SKIP][315], [SKIP][316], [SKIP][317], [SKIP][318], [SKIP][319], [SKIP][320], [SKIP][321], [SKIP][322], [SKIP][323], [SKIP][324], [SKIP][325], [SKIP][326], [SKIP][327], [SKIP][328], [SKIP][329], [SKIP][330], [SKIP][331], [SKIP][332], [SKIP][333], [SKIP][334], [SKIP][335], [SKIP][336])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk3/igt@i915_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk3/igt@i915_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk5/igt@i915_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk7/igt@i915_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk2/igt@i915_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk9/igt@i915_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk2/igt@i915_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk5/igt@i915_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk7/igt@i915_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk2/igt@i915_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk7/igt@i915_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk1/igt@i915_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk8/igt@i915_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk9/igt@i915_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk5/igt@i915_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk1/igt@i915_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk1/igt@i915_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk5/igt@i915_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk6/igt@i915_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk9/igt@i915_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk8/igt@i915_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk6/igt@i915_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk9/igt@i915_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk9/igt@i915_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk9/igt@i915_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk9/igt@i915_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk8/igt@i915_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk6/igt@i915_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk6/igt@i915_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk6/igt@i915_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk6/igt@i915_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk5/igt@i915_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk4/igt@i915_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk4/igt@i915_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk4/igt@i915_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk4/igt@i915_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk3/igt@i915_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk3/igt@i915_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk3/igt@i915_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk3/igt@i915_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk1/igt@i915_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk1/igt@i915_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk1/igt@i915_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk1/igt@i915_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk1/igt@i915_module_load@load.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8270 -> IGTPW_12739
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_16260: 9afa34d65af6f42d982c4c154121b4762e70a70a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12739: 12739
  IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/index.html

--===============4981481836711352331==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>runner/kmemleak: Remove unnecessary lseek() =
calls</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146105/">https://patchwork.freedesktop.org/series/146105/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12739/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12739/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16260_full -&gt; IGTPW_12739_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12739_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_12739_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/index=
.html</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (2): shard-snb-0 shard-dg2-set2 <br />
  Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1273=
9_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>shard-tglu-1:       (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-tglu-1/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-1/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-tglu-1/igt@i915_module_load@load.html">=
PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2739/shard-tglu-1/igt@i915_module_load@load.html">SKIP</a></li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-12/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-dg1-12/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-12/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-19/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-dg1-15/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-dg1-13/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-17/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-18/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-18/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-dg1-17/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-18/igt@i915_module_l=
oad@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-=
19/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_127=
39/shard-dg1-19/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-18/igt@i915_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_12739/shard-dg1-18/igt@i915_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-18/ig=
t@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load@load.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/sh=
ard-dg1-17/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load=
@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12739/shard-dg1-17/igt@i915_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-16/igt@i=
915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard=
-dg1-15/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@lo=
ad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_12739/shard-dg1-15/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-=
13/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_127=
39/shard-dg1-12/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/igt@i915_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_12739/shard-dg1-12/igt@i915_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/ig=
t@i915_module_load@load.html">SKIP</a>)</li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-tglu-5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-10/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_16260/shard-tglu-6/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260=
/shard-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-9/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_16260/shard-tglu-9/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-5/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_16260/shard-tglu-6/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1626=
0/shard-tglu-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-4/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_16260/shard-tglu-6/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-9/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_16260/shard-tglu-2/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1626=
0/shard-tglu-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-8/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_16260/shard-tglu-7/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-4/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_16260/shard-tglu-3/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1626=
0/shard-tglu-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-3/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_16260/shard-tglu-7/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-3/=
igt@i915_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8/igt@i915_module_load@loa=
d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_12739/shard-tglu-8/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-7/igt@i915_mo=
dule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_12739/shard-tglu-7/igt@i915_module_load@load.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-=
6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-6/igt@i915_module_load@load.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1273=
9/shard-tglu-6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt=
@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/sha=
rd-tglu-4/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-4/igt@i915_module_load@=
load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_12739/shard-tglu-4/igt@i915_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-3/igt@i915=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_12739/shard-tglu-3/igt@i915_module_load@load.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tg=
lu-3/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-2/igt@i915_module_load@load.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2739/shard-tglu-2/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-2/igt@i915_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12739/shard-tglu-10/igt@i915_module_load@load.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8=
/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_12739/shard-tglu-9/igt@i915_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739=
/shard-tglu-8/igt@i915_module_load@load.html">SKIP</a>)</li>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-mtlp-1/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-6/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-mtlp-8/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-mtlp-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-8/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-mtlp-3/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-4/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-mtlp-1/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-mtlp-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-6/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-mtlp-6/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-5/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-mtlp-2/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-mtlp-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-1/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-5/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-3/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-mtlp-3/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-2/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_16260/shard-mtlp-2/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-mtlp-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_l=
oad@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp=
-1/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_127=
39/shard-mtlp-1/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-8/igt@i915_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_12739/shard-mtlp-7/igt@i915_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/ig=
t@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/sh=
ard-mtlp-6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load=
@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i=
915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard=
-mtlp-5/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@lo=
ad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_12739/shard-mtlp-5/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-4/igt@i915_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp=
-3/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_127=
39/shard-mtlp-3/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/ig=
t@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html">S=
KIP</a>)</li>
<li>shard-dg2-9:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-dg2-9/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-9/igt@=
i915_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-9/igt@i915_module_load@load.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1273=
9/shard-dg2-9/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-9/igt@i915_module_lo=
ad@load.html">SKIP</a>)</li>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-7/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_16260/shard-dg2-11/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/s=
hard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-7/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_16260/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-10/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_16260/shard-dg2-1/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/sha=
rd-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-6/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_16260/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-6/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_16260/shard-dg2-2/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg=
2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-5/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
6260/shard-dg2-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-2/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_16260/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-5/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_16260/shard-dg2-5/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-4/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_16260/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-8/=
igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_12739/shard-dg2-7/igt@i915_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/s=
hard-dg2-7/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-7/igt@i915_module_load@=
load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_12739/shard-dg2-6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-6/igt@i915_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12739/shard-dg2-6/igt@i915_module_load@load.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-5=
/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_12739/shard-dg2-5/igt@i915_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/=
shard-dg2-5/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-4/igt@i915_module_load=
@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12739/shard-dg2-4/igt@i915_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-4/igt@i915_=
module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_12739/shard-dg2-3/igt@i915_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-=
3/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-3/igt@i915_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739=
/shard-dg2-2/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-1/igt@i915_module_loa=
d@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12739/shard-dg2-11/igt@i915_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-10/igt@i=
915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12739/shard-dg2-10/igt@i915_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard=
-dg2-10/igt@i915_module_load@load.html">SKIP</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-3/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_16260/shard-rkl-5/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/sha=
rd-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-6/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_16260/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-3/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_16260/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rk=
l-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-3/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
6260/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_16260/shard-rkl-7/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/=
shard-rkl-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-4/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_16260/shard-rkl-4/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shar=
d-rkl-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@lo=
ad.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i=
915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-=
rkl-1/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2739/shard-rkl-3/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@=
i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard=
-rkl-5/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12739/shard-rkl-6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-6/igt@i915_modul=
e_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_12739/shard-rkl-6/igt@i915_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt=
@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@load.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shar=
d-rkl-7/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@loa=
d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_12739/shard-rkl-8/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/igt@i915_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12739/shard-rkl-8/igt@i915_module_load@load.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/ig=
t@i915_module_load@load.html">SKIP</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12739_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>shard-snb:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-snb2/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-=
snb2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
6260/shard-snb2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb2/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_16260/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_16260/shard-snb4/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard=
-snb2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb7/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
16260/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb6/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_16260/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb4/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_16260/shard-snb6/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shar=
d-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb6/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_16260/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb6/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_16260/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-snb5/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_16260/shard-snb5/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/sha=
rd-snb5/igt@i915_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_lo=
ad@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i91=
5_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb=
6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/=
shard-snb6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@l=
oad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_12739/shard-snb6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb6/igt@i915_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12739/shard-snb6/igt@i915_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@=
i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-=
snb2/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_127=
39/shard-snb2/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_loa=
d@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12739/shard-snb2/igt@i915_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-snb2/i=
gt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_12739/shard-snb2/igt@i915_module_load@load.html">SK=
IP</a>)</li>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16260/shard-glk3/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk3/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_16260/shard-glk5/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-=
glk7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk2/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
6260/shard-glk9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk2/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_16260/shard-glk5/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk7/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_16260/shard-glk2/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard=
-glk7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk1/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
16260/shard-glk8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk9/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_16260/shard-glk5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk1/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_16260/shard-glk1/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shar=
d-glk5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk6/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_16260/shard-glk9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-glk8/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_16260/shard-glk6/igt@i915_module_load@load.html">PASS</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-gl=
k9/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12739/shard-glk9/igt@i915_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739=
/shard-glk9/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk9/igt@i915_module_load@=
load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_12739/shard-glk8/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk6/igt@i915_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_12739/shard-glk6/igt@i915_module_load@load.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk6/igt=
@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12739/shard-glk6/igt@i915_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard=
-glk5/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk4/igt@i915_module_load@load.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
739/shard-glk4/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk4/igt@i915_module_lo=
ad@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_12739/shard-glk4/igt@i915_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk3/igt@i91=
5_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_12739/shard-glk3/igt@i915_module_load@load.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk=
3/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_12739/shard-glk3/igt@i915_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/=
shard-glk1/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk1/igt@i915_module_load@l=
oad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_12739/shard-glk1/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-glk1/igt@i915_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12739/shard-glk1/igt@i915_module_load@load.html">SKIP</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8270 -&gt; IGTPW_12739</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16260: 9afa34d65af6f42d982c4c154121b4762e70a70a @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_12739: 12739<br />
  IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============4981481836711352331==--

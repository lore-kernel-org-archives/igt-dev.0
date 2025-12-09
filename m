Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C010CD3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 07:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2B7890B6;
	Tue,  9 Dec 2025 07:05:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2259890B6;
 Tue,  9 Dec 2025 07:05:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1885275719755153420=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/igt=5Fpm=3A_Move_DC_St?=
 =?utf-8?q?ate_Counter_Functions_to_common_library?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Dec 2025 07:05:18 -0000
Message-ID: <176526391871.68390.6227828860433978913@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251208083951.2279254-1-jeevan.b@intel.com>
In-Reply-To: <20251208083951.2279254-1-jeevan.b@intel.com>
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

--===============1885275719755153420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=3D=3D Series Details =3D=3D

Series: lib/igt_pm: Move DC State Counter Functions to common library
URL   : https://patchwork.freedesktop.org/series/158629/
State : failure

=3D=3D Summary =3D=3D

CI Bug Log - changes from XEIGT_8659_FULL -> XEIGTPW_14170_FULL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14170_FULL absolutely need to=
 be
  verified manually.
 =20
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14170_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in C=
I.

 =20

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp=20

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_141=
70_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/ig=
t@device_reset@unbind-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-436=
/igt@device_reset@unbind-reset-rebind.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:
    - shard-bmg:          [PASS][3] -> ([INCOMPLETE][4], [PASS][5]) +2 othe=
r tests ( 1 incomplete, 1 pass )
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@=
kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3/i=
gt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/i=
gt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][6] -> ([PASS][7], [DMESG-WARN][8])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-1/igt@=
kms_color@ctm-signed@pipe-c-hdmi-a-3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5/i=
gt@kms_color@ctm-signed@pipe-c-hdmi-a-3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/i=
gt@kms_color@ctm-signed@pipe-c-hdmi-a-3.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@=
kms_pipe_crc_basic@suspend-read-crc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6/=
igt@kms_pipe_crc_basic@suspend-read-crc.html

 =20
#### Warnings ####

  * igt@kms_pm_rpm@package-g7:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#6813]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-463/i=
gt@kms_pm_rpm@package-g7.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
4/igt@kms_pm_rpm@package-g7.html

 =20
Known issues
------------

  Here are the changes found in XEIGTPW_14170_FULL that come from known iss=
ues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-=
1:
    - shard-lnl:          [PASS][13] -> ([FAIL][14], [FAIL][15]) ([Intel XE=
#5993])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-5/igt=
@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3/=
igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.ht=
ml
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5/=
igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.ht=
ml

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp=
-1-linear-rgb565:
    - shard-lnl:          NOTRUN -> ([FAIL][16], [FAIL][17]) ([Intel XE#667=
6]) +36 other tests ( 2 fail )
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1/=
igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-l=
inear-rgb565.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/=
igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-l=
inear-rgb565.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#664])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4/=
igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2327])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4/=
igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4/=
igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][21], [SKIP][22]) ([Intel XE#232=
7]) +1 other test ( 2 skip )
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4/=
igt@kms_big_fb@linear-8bpp-rotate-270.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1/=
igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
2/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> ([SKIP][24], [SKIP][25]) ([Intel XE#140=
7]) +1 other test ( 2 skip )
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3/=
igt@kms_big_fb@linear-8bpp-rotate-270.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4/=
igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#316=
])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-46=
3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-46=
4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +3 other t=
ests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8/=
igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#112=
4]) +2 other tests ( 2 skip )
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1/=
igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/=
igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#232=
8])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6/=
igt@kms_big_fb@y-tiled-addfb.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/=
igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#610])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][34], [SKIP][35]) ([Intel XE#112=
4]) +3 other tests ( 2 skip )
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#112=
4]) +3 other tests ( 2 skip )
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6/=
igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/=
igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1124]) +1 other t=
est skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][39] -> ([SKIP][40], [PASS][41]) ([Intel XE=
#367])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt=
@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6/=
igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5/=
igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#2191])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-46=
3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#367=
]) +1 other test ( 2 skip )
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/=
igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5/=
igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +3 other t=
ests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4/=
igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#288=
7]) +2 other tests ( 2 skip )
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4/=
igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/=
igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455] / [Intel XE#=
787]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-46=
3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#787=
]) +27 other tests ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][51], [SKIP][52]) ([Intel XE#288=
7]) +5 other tests ( 2 skip )
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3/=
igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1/=
igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][53], [SKIP][54]) ([Intel XE#343=
2])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-=
6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#787]) +20 other t=
ests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.=
html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#290=
7])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-lnl:          NOTRUN -> ([SKIP][58], [SKIP][59]) ([Intel XE#266=
9]) +3 other tests ( 2 skip )
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/=
igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1/=
igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#1727] /=
 [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1727] /=
 [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][64] -> ([PASS][65], [INCOMPLETE][66]) ([In=
tel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel=
 XE#4345])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-433/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> ([PASS][67], [INCOMPLETE][68]) ([Intel =
XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][69], [PASS][70]) ([Intel =
XE#6168])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][71], [DMESG-WARN][72]) ([Intel =
XE#1727] / [Intel XE#3113])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][73] -> ([PASS][74], [INCOMPLETE][75]) ([In=
tel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-433/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#265=
2] / [Intel XE#787]) +8 other tests ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1/=
igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5/=
igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][78], [SKIP][79]) ([Intel XE#455=
] / [Intel XE#787]) +7 other tests ( 2 skip )
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
2/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2325])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8/=
igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#373]) +1 other te=
st skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2252]) +2 other t=
ests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4/=
igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][83], [SKIP][84]) ([Intel XE#373=
]) +4 other tests ( 2 skip )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
4/igt@kms_chamelium_hpd@hdmi-hpd.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
3/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#225=
2]) +2 other tests ( 2 skip )
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1/=
igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5/=
igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][87], [SKIP][88]) ([Intel XE#373=
]) +3 other tests ( 2 skip )
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1/=
igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/=
igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-signed@pipe-d-dp-2:
    - shard-bmg:          [PASS][89] -> ([PASS][90], [INCOMPLETE][91]) ([In=
tel XE#5545]) +1 other test ( 1 incomplete, 1 pass )
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-1/igt=
@kms_color@ctm-signed@pipe-d-dp-2.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5/=
igt@kms_color@ctm-signed@pipe-d-dp-2.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/=
igt@kms_color@ctm-signed@pipe-d-dp-2.html

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#6704])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
5/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive.html

  * igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:
    - shard-lnl:          NOTRUN -> ([SKIP][93], [SKIP][94]) ([Intel XE#670=
4]) +3 other tests ( 2 skip )
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/=
igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1/=
igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf.html

  * igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#6704]) +2 other t=
ests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1/=
igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf.html

  * igt@kms_colorop@plane-xr30-xr30-bypass:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#6704])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2/=
igt@kms_colorop@plane-xr30-xr30-bypass.html

  * igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][97], [SKIP][98]) ([Intel XE#670=
4]) +4 other tests ( 2 skip )
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-46=
3/igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-43=
6/igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf.html

  * igt@kms_colorop@plane-xr30-xr30-pq_eotf:
    - shard-bmg:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#67=
04]) +3 other tests ( 2 skip )
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3/=
igt@kms_colorop@plane-xr30-xr30-pq_eotf.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_colorop@plane-xr30-xr30-pq_eotf.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#2=
321])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#3=
08])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1424])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2320])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([Intel XE#1=
424]) +1 other test ( 2 skip )
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][109], [SKIP][110]) ([Intel XE#2=
321])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> ([SKIP][111], [SKIP][112]) ([Intel XE#2=
320]) +3 other tests ( 2 skip )
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> ([SKIP][113], [SKIP][114]) ([Intel XE#3=
09]) +1 other test ( 2 skip )
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][115], [SKIP][116]) ([Intel XE#3=
23])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.h=
tml
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.h=
tml

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][117], [SKIP][118]) ([Intel XE#1=
508])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][119] -> ([PASS][120], [FAIL][121]) ([Intel=
 XE#4367])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-3/ig=
t@kms_dp_linktrain_fallback@dp-fallback.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][122], [SKIP][123]) ([Intel XE#2=
244])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_dsc@dsc-basic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#4422])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> ([SKIP][125], [SKIP][126]) ([Intel XE#4=
422])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][127], [SKIP][128]) ([Intel XE#4=
156])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_fbcon_fbt@fbc-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-lnl:          NOTRUN -> ([FAIL][129], [PASS][130]) ([i915#4767])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_fbcon_fbt@fbc-suspend.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][131], [SKIP][132]) ([Intel XE#7=
76])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_fbcon_fbt@psr-suspend.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#1=
137])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@kms_feature_discovery@dp-mst.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2374])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][136], [SKIP][137]) ([Intel XE#1=
135])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@kms_feature_discovery@psr2.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> ([SKIP][138], [SKIP][139]) ([Intel XE#1=
421]) +1 other test ( 2 skip )
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_flip@2x-plain-flip-ts-check.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> ([PASS][140], [DMESG-WARN][141]) ([Inte=
l XE#5208])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.ht=
ml
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.ht=
ml

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible=
@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][142], [DMESG-WARN][143]) ([Inte=
l XE#6766])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@cd=
-dp2-hdmi-a3.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@cd=
-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][144] -> ([PASS][145], [FAIL][146]) ([Intel=
 XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-8/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][147] -> ([FAIL][148], [PASS][149]) ([Intel=
 XE#301]) +1 other test ( 1 fail, 1 pass )
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-5/ig=
t@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][150] -> ([INCOMPLETE][151], [PASS][152]) (=
[Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-3/ig=
t@kms_flip@flip-vs-suspend-interruptible.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@kms_flip@flip-vs-suspend-interruptible.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> ([FAIL][153], [FAIL][154]) ([Intel XE#4=
683]) +1 other test ( 2 fail )
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@=
pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#2=
293]) +2 other tests ( 2 skip )
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pip=
e-a-valid-mode.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pip=
e-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-=
a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#455]) +1 other t=
est skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#1401] / [Intel X=
E#1745])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pi=
pe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1401])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-=
a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][160], [SKIP][161]) ([Intel XE#2=
293] / [Intel XE#2380]) +2 other tests ( 2 skip )
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][162], [SKIP][163]) ([Intel XE#1=
401] / [Intel XE#1745]) +1 other test ( 2 skip )
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pip=
e-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][164], [SKIP][165]) ([Intel XE#1=
401]) +1 other test ( 2 skip )
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a=
-default-mode.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a=
-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#651])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> ([SKIP][167], [SKIP][168]) ([Intel XE#6=
51]) +3 other tests ( 2 skip )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> ([SKIP][169], [SKIP][170]) ([Intel XE#2=
311]) +5 other tests ( 2 skip )
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][171], [SKIP][172]) ([Intel XE#6=
51]) +7 other tests ( 2 skip )
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#4141]) +3 other =
tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> ([SKIP][174], [SKIP][175]) ([Intel XE#4=
141]) +5 other tests ( 2 skip )
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#2311]) +6 other =
tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2313]) +9 other =
tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#653]) +3 other t=
ests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.h=
tml

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][179], [SKIP][180]) ([Intel XE#2=
313]) +9 other tests ( 2 skip )
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][181], [SKIP][182]) ([Intel XE#6=
312]) +1 other test ( 2 skip )
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#6312])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][184], [SKIP][185]) ([Intel XE#6=
53]) +14 other tests ( 2 skip )
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][186], [SKIP][187]) ([Intel XE#6=
56]) +6 other tests ( 2 skip )
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#656])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@bpc-switch:
    - shard-bmg:          [PASS][189] -> ([PASS][190], [ABORT][191]) ([Inte=
l XE#6740]) +1 other test ( 1 abort, 1 pass )
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/ig=
t@kms_hdr@bpc-switch.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@kms_hdr@bpc-switch.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([ABORT][192], [ABORT][193]) ([Intel XE=
#6740])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#1503])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2=
/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#6590])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#2925])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> ([SKIP][197], [SKIP][198]) ([Intel XE#4=
090] / [Intel XE#6590])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> ([SKIP][199], [SKIP][200]) ([Intel XE#5=
825]) +4 other tests ( 2 skip )
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> ([SKIP][201], [SKIP][202]) ([Intel XE#5=
825]) +5 other tests ( 2 skip )
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][203] -> [FAIL][204] ([Intel XE#718])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-2/ig=
t@kms_pm_dc@dc6-psr.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2=
/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][205] -> ([PASS][206], [FAIL][207]) ([Intel=
 XE#5099])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/ig=
t@kms_pm_rpm@i2c.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@kms_pm_rpm@i2c.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#1439] / [Intel X=
E#3141] / [Intel XE#836])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> ([SKIP][209], [SKIP][210]) ([Intel XE#1=
439] / [Intel XE#3141])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#1406] / [Intel X=
E#1489])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][212], [SKIP][213]) ([Intel XE#1=
406] / [Intel XE#2893] / [Intel XE#4608]) +1 other test ( 2 skip )
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@p=
ipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][214], [SKIP][215]) ([Intel XE#1=
406] / [Intel XE#4608]) +3 other tests ( 2 skip )
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe=
-b-edp-1.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe=
-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#1=
406] / [Intel XE#1489]) +1 other test ( 2 skip )
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][218], [SKIP][219]) ([Intel XE#1=
406] / [Intel XE#1489]) +3 other tests ( 2 skip )
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][220] ([Intel XE#1406] / [Intel X=
E#1489]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#1406] / [Intel X=
E#2387])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][222], [SKIP][223]) ([Intel XE#1=
122] / [Intel XE#1406])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@kms_psr2_su@page_flip-p010.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-lnl:          NOTRUN -> ([SKIP][224], [SKIP][225]) ([Intel XE#1=
406]) +1 other test ( 2 skip )
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_psr@fbc-pr-sprite-render.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][226], [SKIP][227]) ([Intel XE#1=
406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests ( 2 skip )
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@kms_psr@fbc-psr2-primary-render.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][228], [SKIP][229]) ([Intel XE#1=
406] / [Intel XE#4609])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#1=
406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests ( 2 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_psr@pr-cursor-plane-onoff.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][232] ([Intel XE#1406] / [Intel X=
E#2234] / [Intel XE#2850]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@kms_psr@psr-primary-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][233], [SKIP][234]) ([Intel XE#1=
406] / [Intel XE#2939])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][235] ([Intel XE#3414] / [Intel X=
E#3904]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([Intel XE#3=
414] / [Intel XE#3904])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_rotation_crc@primary-rotation-90.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#6503]) +1 other =
test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][239], [SKIP][240]) ([Intel XE#4=
55]) +3 other tests ( 2 skip )
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@kms_sharpness_filter@filter-toggle.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#3=
62])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@kms_tiled_display@basic-test-pattern.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][243] -> ([FAIL][244], [FAIL][245]) ([Intel=
 XE#4459]) +1 other test ( 2 fail )
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-2/ig=
t@kms_vrr@cmrr@pipe-a-edp-1.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][246] ([Intel XE#1091] / [Intel X=
E#2849])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-page-copy-17:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#5=
300])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_copy_basic@mem-page-copy-17.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_copy_basic@mem-page-copy-17.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#2=
504])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@xe_create@multigpu-create-massive-size.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-lnl:          NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#4=
837])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@xe_eudebug@basic-exec-queues.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][253], [SKIP][254]) ([Intel XE#4=
837]) +1 other test ( 2 skip )
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_eudebug@basic-vm-access-faultable.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][255] ([Intel XE#4837])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-bmg:          NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#4=
837]) +2 other tests ( 2 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@xe_eudebug@sysfs-toggle.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#4=
837] / [Intel XE#6665])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
    - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#4837] / [Intel X=
E#6665])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2=
/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][261] ([Intel XE#4837] / [Intel X=
E#6665]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#4=
837] / [Intel XE#6665]) +1 other test ( 2 skip )
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step:
    - shard-lnl:          NOTRUN -> ([SKIP][264], [SKIP][265]) ([Intel XE#4=
837] / [Intel XE#6665]) +1 other test ( 2 skip )
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@xe_eudebug_online@single-step.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][266], [SKIP][267]) ([Intel XE#4=
518])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_eudebug_sriov@deny-sriov.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-large:
    - shard-lnl:          NOTRUN -> ([SKIP][268], [SKIP][269]) ([Intel XE#6=
88])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@xe_evict@evict-large.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@xe_evict@evict-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][270] -> ([PASS][271], [INCOMPLETE][272]) (=
[Intel XE#6321])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/ig=
t@xe_evict@evict-mixed-many-threads-small.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@xe_evict@evict-mixed-many-threads-small.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][273] ([Intel XE#688]) +1 other t=
est skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2=
/igt@xe_evict@evict-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][274] ([Intel XE#1392])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userpt=
r-invalidate-race:
    - shard-bmg:          NOTRUN -> ([SKIP][275], [SKIP][276]) ([Intel XE#2=
322]) +1 other test ( 2 skip )
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-i=
nvalidate-race.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-i=
nvalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][277] ([Intel XE#2322]) +3 other =
tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-lnl:          NOTRUN -> ([SKIP][278], [SKIP][279]) ([Intel XE#1=
392])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@xe_exec_basic@multigpu-once-null.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][280], [SKIP][281]) ([Intel XE#2=
88]) +6 other tests ( 2 skip )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][282] ([Intel XE#288]) +2 other t=
ests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_exec_fault_mode@once-rebind.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> ([SKIP][283], [SKIP][284]) ([Intel XE#5=
007]) +1 other test ( 2 skip )
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][285] ([Intel XE#4943])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@xe_exec_system_allocator@many-large-mmap-free-huge.html

  * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][286] ([Intel XE#4943]) +5 other =
tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:
    - shard-lnl:          NOTRUN -> [WARN][287] ([Intel XE#5786])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2=
/igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][288], [SKIP][289]) ([Intel XE#4=
915]) +132 other tests ( 2 skip )
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared.ht=
ml
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared.ht=
ml

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-pre=
fetch:
    - shard-bmg:          [PASS][290] -> ([PASS][291], [WARN][292]) ([Intel=
 XE#5786])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/ig=
t@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.=
html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefet=
ch.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefet=
ch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-bmg:          NOTRUN -> ([SKIP][293], [SKIP][294]) ([Intel XE#4=
943]) +10 other tests ( 2 skip )
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefe=
tch:
    - shard-bmg:          [PASS][295] -> ([PASS][296], [INCOMPLETE][297]) (=
[Intel XE#5545] / [Intel XE#6480])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/ig=
t@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch.ht=
ml
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch=
.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch=
.html

  * igt@xe_exec_system_allocator@twice-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> ([SKIP][298], [SKIP][299]) ([Intel XE#4=
943]) +5 other tests ( 2 skip )
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html

  * igt@xe_exec_system_allocator@twice-large-new-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][300] ([Intel XE#4915]) +38 other=
 tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_exec_system_allocator@twice-large-new-nomemset.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][301] ([Intel XE#6281])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][302] ([Intel XE#2229])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][303], [PASS][304], [PASS][305], [PASS][30=
6], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS]=
[312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PA=
SS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], =
[PASS][324], [PASS][325], [PASS][326], [PASS][327]) -> ([PASS][328], [PASS]=
[329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PA=
SS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], =
[PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346=
], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][=
352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PAS=
S][358], [PASS][359], [PASS][360], [SKIP][361], [PASS][362], [PASS][363], [=
PASS][364], [PASS][365], [PASS][366], [PASS][367], [SKIP][368], [PASS][369]=
, [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][3=
75], [PASS][376], [PASS][377]) ([Intel XE#378])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-463/=
igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/=
igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/=
igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-463/=
igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-433/=
igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-433/=
igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/=
igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/=
igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/=
igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/=
igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/=
igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-463/=
igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/=
igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/=
igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/=
igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/=
igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/=
igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/=
igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/=
igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/=
igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/=
igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/=
igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-433/=
igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/=
igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/=
igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_module_load@load.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     NOTRUN -> [SKIP][378] ([Intel XE#3573]) +1 other =
test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][379], [SKIP][380]) ([Intel XE#3=
573]) +1 other test ( 2 skip )
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_oa@whitelisted-registers-userspace-config.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][381], [SKIP][382]) ([Intel XE#6=
566])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> ([SKIP][383], [SKIP][384]) ([Intel XE#5=
694])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@xe_pm@d3cold-i2c.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][385], [SKIP][386]) ([Intel XE#5=
84])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@xe_pm@s3-basic.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [PASS][387] -> [ABORT][388] ([Intel XE#1727] / [I=
ntel XE#4760])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/=
igt@xe_pm@s4-multiple-execs.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][389], [SKIP][390]) ([Intel XE#5=
79])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_pm@vram-d3cold-threshold.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@idle-residency:
    - shard-dg2-set2:     [PASS][391] -> ([FAIL][392], [FAIL][393]) ([Intel=
 XE#6362]) +1 other test ( 2 fail )
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-433/=
igt@xe_pm_residency@idle-residency.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_pm_residency@idle-residency.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@xe_pm_residency@idle-residency.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][394] -> ([FAIL][395], [FAIL][396]) ([Intel=
 XE#6251]) +2 other tests ( 2 fail )
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-1/ig=
t@xe_pmu@engine-activity-accuracy-90.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@xe_pmu@engine-activity-accuracy-90.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compu=
te0:
    - shard-lnl:          [PASS][397] -> ([PASS][398], [FAIL][399]) ([Intel=
 XE#6251])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-1/ig=
t@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.ht=
ml
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0=
.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0=
.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][400], [PASS][401]) ([Intel XE#4=
819]) +1 other test ( 1 fail, 1 pass )
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_pmu@gt-frequency.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> ([SKIP][402], [SKIP][403]) ([Intel XE#4=
733]) +1 other test ( 2 skip )
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][404], [SKIP][405]) ([Intel XE#4=
733]) +1 other test ( 2 skip )
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][406] ([Intel XE#4733])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][407] ([Intel XE#944]) +1 other t=
est skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][408], [SKIP][409]) ([Intel XE#4=
130])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> ([SKIP][410], [SKIP][411]) ([Intel XE#4=
130])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> ([SKIP][412], [SKIP][413]) ([Intel XE#3=
342])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8=
/igt@xe_sriov_flr@flr-each-isolation.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4=
/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [PASS][414] -> ([FAIL][415], [FAIL][416]) ([Intel=
 XE#5937])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/ig=
t@xe_sriov_flr@flr-vf1-clear.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@xe_sriov_flr@flr-vf1-clear.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [PASS][417] -> [FAIL][418] ([Intel XE#6569])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/ig=
t@xe_sriov_flr@flr-vfs-parallel.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-8=
/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][419], [SKIP][420]) ([Intel XE#6=
318])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
34/igt@xe_sriov_vram@vf-access-beyond.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
64/igt@xe_sriov_vram@vf-access-beyond.html
    - shard-lnl:          NOTRUN -> ([SKIP][421], [SKIP][422]) ([Intel XE#6=
376])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1=
/igt@xe_sriov_vram@vf-access-beyond.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@xe_sriov_vram@vf-access-beyond.html

 =20
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][423] ([Intel XE#5354]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/ig=
t@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][425] ([Intel XE#6715]) -> ([PASS][426], [P=
ASS][427])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-3/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][428] ([Intel XE#2049] / [Intel XE#25=
97]) -> ([PASS][429], [PASS][430]) +1 other test ( 2 pass )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/=
igt@kms_flip@flip-vs-suspend-interruptible.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@kms_flip@flip-vs-suspend-interruptible.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [FAIL][431] ([Intel XE#5338] / [Intel XE#5408] / =
[Intel XE#6266]) -> ([PASS][432], [PASS][433]) +1 other test ( 2 pass )
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-1/ig=
t@kms_flip@wf_vblank-ts-check.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2=
/igt@kms_flip@wf_vblank-ts-check.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [ABORT][434] ([Intel XE#6740]) -> [PASS][435] +1 =
other test pass
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-3/ig=
t@kms_hdr@bpc-switch-dpms.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][436] ([Intel XE#718]) -> ([PASS][437], [PA=
SS][438])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-2/ig=
t@kms_pm_dc@dc5-dpms.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_pm_dc@dc5-dpms.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][439] ([Intel XE#718]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-5/ig=
t@kms_pm_dc@dc5-psr.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2=
/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][441] ([Intel XE#2142]) -> [PASS][442] +1 o=
ther test pass
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-1/ig=
t@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2=
/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-dg2-set2:     [FAIL][443] ([Intel XE#6407]) -> ([PASS][444], [P=
ASS][445])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/=
igt@xe_gt_freq@freq_fixed_idle.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
33/igt@xe_gt_freq@freq_fixed_idle.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
35/igt@xe_gt_freq@freq_fixed_idle.html

 =20
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][446] ([Intel XE#6676]) -> ([FAIL][447], [F=
AIL][448]) ([Intel XE#5993] / [Intel XE#6676])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-5/ig=
t@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3=
/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][449] ([Intel XE#5299]) -> ([FAIL][450], [P=
ASS][451]) ([Intel XE#5299])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4=
/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][452] ([Intel XE#4354]) -> ([FAIL][453], [S=
KIP][454]) ([Intel XE#4354] / [Intel XE#6793])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/ig=
t@kms_dp_link_training@uhbr-sst.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_dp_link_training@uhbr-sst.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [ABORT][455] ([Intel XE#6740]) -> ([ABORT][456], =
[PASS][457]) ([Intel XE#6740]) +1 other test ( 1 abort, 1 pass )
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/ig=
t@kms_hdr@bpc-switch-suspend.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5=
/igt@kms_hdr@bpc-switch-suspend.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6=
/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#455]) -> ([SKIP][459], [PA=
SS][460]) ([Intel XE#455])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/=
igt@kms_hdr@invalid-hdr.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
32/igt@kms_hdr@invalid-hdr.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
63/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [SKIP][461] ([Intel XE#1503]) -> ([ABORT][462], [=
ABORT][463]) ([Intel XE#6740])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/ig=
t@kms_hdr@invalid-hdr.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_hdr@invalid-hdr.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_hdr@invalid-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][464] ([Intel XE#2509]) -> ([SKIP][465], [S=
KIP][466]) ([Intel XE#2426])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3=
/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1=
/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

 =20
  {name}: This element is suppressed. This means it is ignored when computi=
ng
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4367
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5825
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
  [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766
  [Intel XE#6793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6793
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * IGT: IGT_8659 -> IGTPW_14170
  * Linux: xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732 -> xe-4207-ae94=
7e88cadd48481a08b630fc9bbb9ddcbe1340

  IGTPW_14170: 14170
  IGT_8659: 8659
  xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732: 20a0f6f7ed00cc169a15fe7=
fca330da8b2806732
  xe-4207-ae947e88cadd48481a08b630fc9bbb9ddcbe1340: ae947e88cadd48481a08b63=
0fc9bbb9ddcbe1340

=3D=3D Logs =3D=3D

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170=
/index.html

--===============1885275719755153420==
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
<tr><td><b>Series:</b></td><td>lib/igt_pm: Move DC State Counter Functions =
to common library</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158629/">https://patchwork.freedesktop.org/series/158629/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14170/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8659_FULL -&gt; XEIGTPW_14170_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14170_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_14170_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
170_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-434/igt@device_reset@unbind-reset-rebind.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/sh=
ard-dg2-436/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-fenci=
ng@pipe-a-dp-2.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_atomic_transition@plane-all-=
transition-fencing@pipe-a-dp-2.html">INCOMPLETE</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@kms_atomic_trans=
ition@plane-all-transition-fencing@pipe-a-dp-2.html">PASS</a>) +2 other tes=
ts ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-1/igt@kms_color@ctm-signed@pipe-c-hdmi-a-3.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170=
/shard-bmg-5/igt@kms_color@ctm-signed@pipe-c-hdmi-a-3.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt=
@kms_color@ctm-signed@pipe-c-hdmi-a-3.html">DMESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/s=
hard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">FAIL</a> +1 other =
test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_rpm@package-g7:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-463/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1417=
0/shard-dg2-434/igt@kms_pm_rpm@package-g7.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14170_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3/igt@kms_async_flips@async-flip=
-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_async_=
flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel=
 XE#5993</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-=
1-linear-rgb565:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_async_flips@basic-modeset-w=
ith-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@=
kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linea=
r-rgb565.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6676">Intel XE#6676</a>) +36 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@kms_async_flips@test-cursor.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-2=
70.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14170/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel=
 XE#2327</a>) +1 other test ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-2=
70.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14170/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel=
 XE#1407</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14170/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate=
-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14170/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/=
shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-=
stride-32bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@kms_big_fb@y-tile=
d-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-=
3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-=
3840x2160p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_bw@connected-linear-tiling=
-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays=
-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14170/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-g=
en12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled=
-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14170/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-r=
c-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_ccs@crc-primary=
-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-18=
0-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-1=
80-y-tiled-gen12-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basi=
c-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2907">Intel XE#2907</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled=
-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14170/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2669">Intel XE#2669</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14170/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#=
4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14170/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170=
/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPL=
ETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14170/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Inte=
l XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-b-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14170/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@kms_ccs@random-ccs-data-=
4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#=
2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled=
-lnl-ccs@pipe-c-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14170/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/787">Intel XE#787</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
25">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-resol=
ution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/225=
2">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
170/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</=
a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-fast=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14170/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#=
2252</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-with=
-enabled-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14170/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-1/igt@kms_color@ctm-signed@pipe-d-dp-2.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/sha=
rd-bmg-5/igt@kms_color@ctm-signed@pipe-d-dp-2.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@kms_col=
or@ctm-signed@pipe-d-dp-2.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test=
 ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@kms_colorop@plane-xr24-xr24-ct=
m_3x4_overdrive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6704">Intel XE#6704</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_colorop@plane-xr30-xr30-bt2=
020_inv_oetf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14170/shard-lnl-1/igt@kms_colorop@plane-xr30-xr30-bt2020_inv_o=
etf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6704">Intel XE#6704</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_colorop@plane-xr30-xr30-bt20=
20_inv_oetf-bt2020_oetf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6704">Intel XE#6704</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-bypass:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-2/igt@kms_colorop@plane-xr30-xr30-bypa=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6704">Intel XE#6704</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_colorop@plane-xr30-xr30-p=
q_125_inv_eotf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14170/shard-dg2-436/igt@kms_colorop@plane-xr30-xr30-pq_125_i=
nv_eotf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6704">Intel XE#6704</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_eotf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_colorop@plane-xr30-xr30-pq_=
eotf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14170/shard-bmg-1/igt@kms_colorop@plane-xr30-xr30-pq_eotf.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704">I=
ntel XE#6704</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen=
-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14170/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-6=
4x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x=
21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-mov=
ement-128x42.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14170/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128=
x42.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1424">Intel XE#1424</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-5=
12x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14170/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
1">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-6=
4x21.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14170/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-fl=
ipb-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/309">Intel XE#309</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-464/igt@kms_cursor_le=
gacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#32=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14170/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#15=
08</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1417=
0/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6/i=
gt@kms_dp_linktrain_fallback@dp-fallback.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4367">Intel XE#4367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_dsc@dsc-basic.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-l=
nl-1/igt@kms_dsc@dsc-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-out-visible-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170=
/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</l=
i>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170=
/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767">i915#4767</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170=
/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14170/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#11=
37</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
170/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14170/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#=
1421</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-=
vs-dpms-off-vs-modeset-interruptible.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@kms_flip@2x-sing=
le-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel =
XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@=
cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-=
vs-dpms-off-vs-modeset-interruptible@cd-dp2-hdmi-a3.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@k=
ms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@cd-dp2-h=
dmi-a3.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6766">Intel XE#6766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@c-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@c-edp1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test ( 1 fail=
, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_141=
70/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5=
/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 =
other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_141=
70/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard=
-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"=
>Intel XE#2597</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-=
xtile-to-64bpp-xtile-upscaling.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_flip_scaled_crc@fl=
ip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 ot=
her test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-=
yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt=
@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-=
valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2293">Intel XE#2293</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-16bpp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_flip_scaled_cr=
c@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">In=
tel XE#2380</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_flip_scaled_crc@=
flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-defa=
ult-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1401">Intel XE#1401</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-=
1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1=
p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_frontbuffer_track=
ing@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2=
p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2=
p-pri-indfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-464/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +=
7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-ti=
ling-linear.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14170/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linea=
r.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4141">Intel XE#4141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcps=
r-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr=
-rgb101010-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb101010-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-=
1p-offscreen-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1=
p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@kms_frontbuffer_t=
racking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +=
14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p=
-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_frontbuffer_track=
ing@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@k=
ms_hdr@bpc-switch.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_hdr@bpc-switch.html">ABORT</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Inte=
l XE#6740</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi=
-a-3.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14170/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html">ABORT=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740"=
>Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-2/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">=
Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6590">Intel XE#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra=
-joiner-big-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-jo=
iner-big-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-75@pipe-a.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_plane_scaling@planes-downs=
cale-factor-0-75@pipe-a.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5825">Intel XE#5825</a>) +4 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-3/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-75@pipe-b.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@kms_plane_scaling@planes-downs=
cale-factor-0-75@pipe-b.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5825">Intel XE#5825</a>) +5 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-2/igt@k=
ms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@kms_p=
m_rpm@i2c.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14170/shard-bmg-6/igt@kms_pm_rpm@i2c.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099">Intel XE#5099</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-str=
ess-no-wait.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14170/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wai=
t.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_psr2_sf@fbc-ps=
r2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">In=
tel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4608">Intel XE#4608</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-pla=
ne-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_p=
sr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-ov=
erlay-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-ove=
rlay-plane-update-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
 +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
170/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-render.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
170/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-rend=
er.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14170/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel=
 XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render@=
edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14170/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@kms_psr@pr-cursor-plane-onoff.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4170/shard-bmg-5/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"=
>Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_psr@psr-primary-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@kms_rotation_crc@primary-rotati=
on-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14170/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"=
>Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@kms_sharpness_filter@filter-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@kms_sharpness_filter@filter-t=
oggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14170/shard-dg2-463/igt@kms_sharpness_filter@filter-toggle.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@kms_tiled_display@basic-test-pa=
ttern.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14170/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-=
3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-e=
dp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459">Intel XE#4459</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@sriov_basic@enable-vfs-autopro=
be-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-17:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@xe_copy_basic@mem-page-copy-1=
7.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14170/shard-dg2-463/igt@xe_copy_basic@mem-page-copy-17.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300">Intel X=
E#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@xe_create@multigpu-create-massi=
ve-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14170/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@xe_eudebug@basic-exec-queues.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
170/shard-lnl-1/igt@xe_eudebug@basic-exec-queues.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-464/igt@xe_eudebug@basic-vm-access-fa=
ultable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14170/shard-dg2-434/igt@xe_eudebug@basic-vm-access-faultable.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
837">Intel XE#4837</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@xe_eudebug@sysfs-toggle.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/s=
hard-bmg-1/igt@xe_eudebug@sysfs-toggle.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@xe_eudebug_online@breakpoint-=
many-sessions-single-tile.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@xe_eudebug_online@breakpo=
int-many-sessions-single-tile.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-2/igt@xe_eudebug_online@breakpoint-man=
y-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@xe_eudebug_online@breakpoint-man=
y-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-5/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14170/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-si=
gint-debugger.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@xe_eudebug_online@single-step.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4170/shard-lnl-8/igt@xe_eudebug_online@single-step.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665"=
>Intel XE#6665</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4170/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@xe_evict@evict-large.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shar=
d-lnl-1/igt@xe_evict@evict-large.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
170/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg=
-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#63=
21</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-2/igt@xe_evict@evict-threads-small.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-inval=
idate-race.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2322">Intel XE#2322</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-3/igt@xe_exec_basic@multigpu-once-nul=
l.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14170/shard-lnl-5/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel X=
E#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@xe_exec_fault_mode@many-binde=
xecqueue-userptr-invalidate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@xe_exec_fault_mode@many=
-bindexecqueue-userptr-invalidate.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@xe_exec_system_allocator@many-6=
4k-mmap-new-huge-nomemset.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@xe_exec_system_allocator@ma=
ny-64k-mmap-new-huge-nomemset.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +1 other test (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@xe_exec_system_allocator@many-la=
rge-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@xe_exec_system_allocator@many-la=
rge-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-2/igt@xe_exec_system_allocator@many-st=
ride-malloc-prefetch-madvise.html">WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@xe_exec_system_allocator@proc=
ess-many-stride-mmap-prefetch-shared.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@xe_exec_system=
_allocator@process-many-stride-mmap-prefetch-shared.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +132 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-pref=
etch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-=
execqueues-mmap-prefetch.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-execqueues-mmap-prefetch.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@x=
e_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.htm=
l">WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@xe_exec_system_allocator@thread=
s-shared-vm-many-mmap-new-huge.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-mmap-new-huge.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +10 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefet=
ch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-=
stride-malloc-prefetch.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-5/igt@xe_exec_system_allocator=
@threads-shared-vm-many-stride-malloc-prefetch.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-stride-malloc-prefetch.html">INCO=
MPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5545">Intel XE#5545</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6480">Intel XE#6480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@xe_exec_system_allocator@twice-=
large-mmap-free-huge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@xe_exec_system_allocator@twice-l=
arge-mmap-free-huge.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_exec_system_allocator@twice=
-large-new-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@xe_fault_injection@exec-queue-cr=
eate-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_ccs_migra=
te_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8659/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8659/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8659/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-=
dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8659/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8659/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8659/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_865=
9/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8659/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8659/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8659/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14170/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shar=
d-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14170/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14170/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2=
-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
170/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-432/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14170/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shar=
d-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14170/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14170/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2=
-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
170/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-463/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_module_load@load.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14170/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shar=
d-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@xe_module_load@lo=
ad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14170/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14170/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2=
-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
170/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14170/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-435/=
igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@xe_oa@missing-sample-flags.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_oa@whitelisted-registers-u=
serspace-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14170/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspa=
ce-config.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@xe_peer2peer@write@write-gpua=
-vram01-gpub-system-p2p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@xe_pm@d3cold-i2c.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-ln=
l-3/igt@xe_pm@d3cold-i2c.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@xe_pm@s3-basic.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-=
8/igt@xe_pm@s3-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-4=
36/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4170/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-433/igt@xe_pm_residency@idle-residency.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/sha=
rd-dg2-432/igt@xe_pm_residency@idle-residency.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@xe_pm=
_residency@idle-residency.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6362">Intel XE#6362</a>) +1 other test ( 2 f=
ail )</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/s=
hard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@x=
e_pmu@engine-activity-accuracy-90.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +2 other te=
sts ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_comput=
e0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe=
_engine_class_compute0.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3/igt@xe_pmu@engine-activity-a=
ccuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-4/igt@xe_pmu=
@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251"=
>Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/sha=
rd-dg2-433/igt@xe_pmu@gt-frequency.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) +1 other t=
est ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rend=
ercopy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14170/shard-bmg-8/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-464/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update=
-post-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@xe_pxp@pxp-termination-key-updat=
e-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-bmg-8/igt@xe_query@multigpu-query-invalid-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-433/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-432/igt@xe_sriov_auto_pro=
visioning@resources-released-on-vfs-disabling.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@xe_sriov_auto_provisioning@self=
config-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@xe_sriov_auto_prov=
isioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-8/igt@xe_sriov_flr@flr-each-isolation=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14170/shard-lnl-4/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#=
3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg=
-1/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@xe_sriov_flr@flr-vf=
1-clear.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5937">Intel XE#5937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-b=
mg-8/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-dg2-434/igt@xe_sriov_vram@vf-access-beyon=
d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14170/shard-dg2-464/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318">Intel X=
E#6318</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14170/shard-lnl-1/igt@xe_sriov_vram@vf-access-beyond.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14170/shard-lnl-5/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#63=
76</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transiti=
ons-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_cursor_=
legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715=
">Intel XE#6715</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14170/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4170/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_flip@flip-vs-s=
uspend-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14170/shard-dg2-436/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5=
338</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/54=
08">Intel XE#5408</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6266">Intel XE#6266</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-2/igt@kms_flip@wf_vblank-ts-che=
ck.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14170/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html">PASS</a>) +1 oth=
er test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1417=
0/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard=
-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html=
">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-l=
nl-2/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14170/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual=
@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407">Intel XE#=
6407</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14170/shard-dg2-433/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-435/igt=
@xe_gt_freq@freq_fixed_idle.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6676">Intel XE#6676</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-5/igt@kms_async_flips@async-fli=
p-with-page-flip-events-linear.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14170/shard-lnl-3/igt@kms_async_flips@async-=
flip-with-page-flip-events-linear.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676">Intel XE#6676</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5299">Intel XE#5299</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14170/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic-transitions.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-curs=
or-atomic-transitions.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE=
#4354</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14170/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt=
@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6793">Intel XE#6793</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6=
740</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14170/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-6/igt@k=
ms_hdr@bpc-switch-suspend.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test ( 1 a=
bort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/sh=
ard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-dg2-463/igt@kms_hdr@invalid=
-hdr.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/sh=
ard-bmg-3/igt@kms_hdr@invalid-hdr.html">ABORT</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_hdr@invalid-hd=
r.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14170/shard-bmg-3/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14170/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8659 -&gt; IGTPW_14170</li>
<li>Linux: xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732 -&gt; xe-4207-a=
e947e88cadd48481a08b630fc9bbb9ddcbe1340</li>
</ul>
<p>IGTPW_14170: 14170<br />
  IGT_8659: 8659<br />
  xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732: 20a0f6f7ed00cc169a15fe7=
fca330da8b2806732<br />
  xe-4207-ae947e88cadd48481a08b630fc9bbb9ddcbe1340: ae947e88cadd48481a08b63=
0fc9bbb9ddcbe1340</p>

</body>
</html>

--===============1885275719755153420==--

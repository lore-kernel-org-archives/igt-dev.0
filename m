Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0009ECE57B
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 09:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DEF10E342;
	Mon,  9 Sep 2024 09:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=alyssa.is header.i=@alyssa.is header.b="jraGJvd8";
	dkim=permerror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LwQenOPv";
	dkim-atps=neutral
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7640D10E9D1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 09:20:55 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 6A8271380405;
 Fri,  6 Sep 2024 05:20:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Fri, 06 Sep 2024 05:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1725614454; x=1725700854; bh=ciL7pDSOWX
 oJgtzxiLe67mkCE9Jif7ZBw9dB3ZMprOY=; b=jraGJvd8GD4hUjsq/owTKRp7An
 o7Q3Qa8CbZREw8iYCqn86Pq8WrywFaywsPpk7w2cpk9rdsZ3CNqSY6Z1JsQEUbm7
 gX6BVOJXPnreDQq93VCTntKTtfYrHNWIwnfXjDOFRuGiX4RDEdQMCub/4LtuT9ll
 QDfw7odeVEd/pFDPtJ6uL8WR45gvoLiKaqGwKSAopCx9/xddDq4bfCYa5mGn1Gmr
 QMRI0wd5VW9p4Fj+22f8/o0v+EUVPTHOZglUZB3Lto+tHCr0tWrNoeXu6BhmpS4d
 xpNevDp3KR9EPSqnYcKlfayW4QHDiI1+oFcmpScx9bog3yj5FHc9RL8ZIiMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1725614454; x=1725700854; bh=ciL7pDSOWXoJgtzxiLe67mkCE9Ji
 f7ZBw9dB3ZMprOY=; b=LwQenOPv8y6oTh6JCRMJi1ig72BZMxkOzkj3Sy7hGzfs
 qvdwglgUrXUxm8sFMLaXSrQbjmi7l+vxPPZy7CE/Xxc2BtOBaTJsgMd/yhsV3wTE
 jKJUaDFNbnXTvYtsbDuSqfSplHuTetsodjbNxcb+4BDTlV3do1crceSe9mFv8GIw
 RMVzt1PG6wzz9oet9WPMRYBMvhk0JZwBhRLYJCpt2j4gUD6++AmNcDOhM/JndQHp
 +scnb5t8C4cbCJLpasXhoAAoZmJoylSREZ7ymiVmKLb2TB+MXX4TQ40Z8z0xw+O9
 KfhTxG6U83RAmil8nsLdIdhwTQDzATaUWiViGzFOqg==
X-ME-Sender: <xms:dsnaZms0Q1z-wOSoB1kJQzP3n64d0aukBvbrOlvhkEjDkQx6n65shQ>
 <xme:dsnaZrePTw6lai1lFhezOeEchvs2ImNDzffY0Ku1bkORXxrNBlRhD9FhlrPdPJ9cS
 y47EieAfgZyyu0uYw>
X-ME-Received: <xmr:dsnaZhzzErmrUZ3VjtVqE08jkXrv5KMxcBMP29Yhj5RVp4SBvOaJQDVkTDoT5L1cf3ELqKYhX62Kr0708zi-TvQumSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
 gjfhffkfggtgesghdtreertddtjeenucfhrhhomheptehlhihsshgrucftohhsshcuoehh
 ihesrghlhihsshgrrdhisheqnecuggftrfgrthhtvghrnhepledtleelieetteeiuedtff
 dthfeujeevlefhhffghfetgfelleeltdegheevveefnecuffhomhgrihhnpehfrhgvvggu
 vghskhhtohhprdhorhhgpddtuddrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehhihesrghlhihsshgrrdhishdpnhgspghrtghpthht
 ohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepiheludehqdgtihdqihhnfh
 hrrgeslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehighht
 qdguvghvsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:dsnaZhMXMH46Lgo_jBq3mFXEoPETW4tX4jAfNuDxn5Y6z5sPtIEEgA>
 <xmx:dsnaZm-p_OrWhv3zbMONTmel7m80HBAothvxNNXcv49RHRR44oKObA>
 <xmx:dsnaZpV6CAOTvr-FH6If537he3F3MBgcIiRWuqXwiGR1edoc9X5Y9w>
 <xmx:dsnaZvegt5In738AdA85S63bk9Ak0CYr4QbWr8tAVrii7mqgQ8pJhg>
 <xmx:dsnaZoLVo2JPZljxaKWulX9afpCATw8KdGbG_pSIEGEX2U8gyPy29Tt->
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 05:20:53 -0400 (EDT)
Received: by sf.qyliss.net (Postfix, from userid 1000)
 id F1244105C7B39; Fri, 06 Sep 2024 11:20:51 +0200 (CEST)
From: Alyssa Ross <hi@alyssa.is>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= Fi.CI.BAT: failure for
 tests/intel/kms_pm_rpm: use basename from libgen.h
In-Reply-To: <172556176266.951809.4045747526049449062@2413ebb6fbb6>
References: <20240904134948.1337335-1-hi@alyssa.is>
 <172556176266.951809.4045747526049449062@2413ebb6fbb6>
Date: Fri, 06 Sep 2024 11:20:44 +0200
Message-ID: <87plphgmtv.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-Mailman-Approved-At: Mon, 09 Sep 2024 09:13:13 +0000
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello,

I don't think the possible regressions here are likely to be related to
my change, as they appear to be testing the kernel, as they appear to be
differences in kernel behaviour but my patch is a (hopefully)
non-functional change to userspace.

Patchwork <patchwork@emeril.freedesktop.org> writes:

> =3D=3D Series Details =3D=3D
>
> Series: tests/intel/kms_pm_rpm: use basename from libgen.h
> URL   : https://patchwork.freedesktop.org/series/138243/
> State : failure
>
> =3D=3D Summary =3D=3D
>
> CI Bug Log - changes from CI_DRM_15367 -> IGTPW_11701
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_11701 absolutely need to be
>   verified manually.
>=20=20=20
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11701, please notify your bug team (I915-ci-infra@l=
ists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/inde=
x.html
>
> Participating hosts (40 -> 39)
> ------------------------------
>
>   Additional (3): bat-kbl-2 bat-dg2-11 fi-kbl-8809g=20
>   Missing    (4): bat-jsl-1 bat-arls-1 fi-snb-2520m bat-mtlp-6=20
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_117=
01:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@kms_busy@basic:
>     - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/fi-cfl-8109=
u/igt@kms_busy@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/fi-cfl-8109u=
/igt@kms_busy@basic.html
>
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - fi-cfl-8109u:       [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/fi-cfl-8109=
u/igt@kms_flip@basic-flip-vs-dpms.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/fi-cfl-8109u=
/igt@kms_flip@basic-flip-vs-dpms.html
>
>=20=20=20
> #### Suppressed ####
>
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
>
>   * igt@i915_selftest@live@gt_mocs:
>     - {bat-arlh-3}:       NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-arlh-3/i=
gt@i915_selftest@live@gt_mocs.html
>
>=20=20=20
> Known issues
> ------------
>
>   Here are the changes found in IGTPW_11701 that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@fbdev@info:
>     - bat-kbl-2:          NOTRUN -> [SKIP][6] ([i915#1849])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-kbl-2/ig=
t@fbdev@info.html
>
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][7] ([i915#2190])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/fi-kbl-8809g=
/igt@gem_huc_copy@huc-copy.html
>
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-kbl-2:          NOTRUN -> [SKIP][8] +39 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-kbl-2/ig=
t@gem_lmem_swapping@parallel-random-engines.html
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][9] ([i915#4613]) +3 other test=
s skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/fi-kbl-8809g=
/igt@gem_lmem_swapping@parallel-random-engines.html
>
>   * igt@gem_mmap@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][10] ([i915#4083])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@gem_mmap@basic.html
>
>   * igt@gem_render_tiled_blits@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][11] ([i915#4079]) +1 other tes=
t skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@gem_render_tiled_blits@basic.html
>
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][12] ([i915#4077]) +2 other tes=
ts skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@gem_tiled_fence_blits@basic.html
>
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg2-11:         NOTRUN -> [SKIP][13] ([i915#11681] / [i915#6621=
])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@i915_pm_rps@basic-api.html
>
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][14] ([i915#4212]) +7 other tes=
ts skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
>
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][15] ([i915#5190])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][16] ([i915#4215] / [i915#5190])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_addfb_basic@basic-y-tiled-legacy.html
>
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][17] ([i915#4103] / [i915#4213]=
) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>     - fi-cfl-8109u:       [PASS][18] -> [DMESG-WARN][19] ([i915#12145]) +=
1 other test dmesg-warn
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/fi-cfl-810=
9u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/fi-cfl-8109=
u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>
>   * igt@kms_dsc@dsc-basic:
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][20] +30 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/fi-kbl-8809=
g/igt@kms_dsc@dsc-basic.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][21] ([i915#3555] / [i915#3840])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_dsc@dsc-basic.html
>
>   * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
>     - fi-cfl-8109u:       [PASS][22] -> [INCOMPLETE][23] ([i915#12146])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/fi-cfl-810=
9u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/fi-cfl-8109=
u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
>
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-dg2-11:         NOTRUN -> [SKIP][24]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_force_connector_basic@force-load-detect.html
>
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-11:         NOTRUN -> [SKIP][25] ([i915#5274])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_force_connector_basic@prune-stale-modes.html
>
>   * igt@kms_pipe_crc_basic@nonblocking-crc:
>     - bat-arls-5:         [PASS][26] -> [INCOMPLETE][27] ([i915#11320])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/bat-arls-5=
/igt@kms_pipe_crc_basic@nonblocking-crc.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-arls-5/=
igt@kms_pipe_crc_basic@nonblocking-crc.html
>
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-dg2-11:         NOTRUN -> [SKIP][28] ([i915#5354])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_pm_backlight@basic-brightness.html
>
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-dg2-11:         NOTRUN -> [SKIP][29] ([i915#1072] / [i915#9732]=
) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_psr@psr-sprite-plane-onoff.html
>
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-dg2-11:         NOTRUN -> [SKIP][30] ([i915#3555])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@kms_setmode@basic-clone-single-crtc.html
>
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-dg2-11:         NOTRUN -> [SKIP][31] ([i915#3708])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@prime_vgem@basic-fence-flip.html
>
>   * igt@prime_vgem@basic-gtt:
>     - bat-dg2-11:         NOTRUN -> [SKIP][32] ([i915#3708] / [i915#4077]=
) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@prime_vgem@basic-gtt.html
>
>   * igt@prime_vgem@basic-write:
>     - bat-dg2-11:         NOTRUN -> [SKIP][33] ([i915#3291] / [i915#3708]=
) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-dg2-11/=
igt@prime_vgem@basic-write.html
>
>=20=20=20
> #### Possible fixes ####
>
>   * igt@i915_selftest@live:
>     - bat-arls-2:         [DMESG-WARN][34] ([i915#10341]) -> [PASS][35]
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/bat-arls-2=
/igt@i915_selftest@live.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-arls-2/=
igt@i915_selftest@live.html
>
>   * igt@i915_selftest@live@hangcheck:
>     - bat-arls-2:         [DMESG-WARN][36] ([i915#11349]) -> [PASS][37]
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/bat-arls-2=
/igt@i915_selftest@live@hangcheck.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-arls-2/=
igt@i915_selftest@live@hangcheck.html
>
>   * igt@i915_selftest@live@workarounds:
>     - {bat-arlh-3}:       [ABORT][38] ([i915#12061]) -> [PASS][39]
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/bat-arlh-3=
/igt@i915_selftest@live@workarounds.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-arlh-3/=
igt@i915_selftest@live@workarounds.html
>
>=20=20=20
> #### Warnings ####
>
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-apl-1:          [DMESG-WARN][40] ([i915#180]) -> [DMESG-WARN][4=
1] ([i915#180] / [i915#1982])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/bat-apl-1/=
igt@core_hotunplug@unbind-rebind.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/bat-apl-1/i=
gt@core_hotunplug@unbind-rebind.html
>
>   * igt@i915_module_load@reload:
>     - fi-kbl-7567u:       [DMESG-WARN][42] ([i915#180] / [i915#9925]) -> =
[DMESG-WARN][43] ([i915#180] / [i915#1982] / [i915#9925])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15367/fi-kbl-756=
7u/igt@i915_module_load@reload.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11701/fi-kbl-7567=
u/igt@i915_module_load@reload.html
>
>=20=20=20
>   {name}: This element is suppressed. This means it is ignored when compu=
ting
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>   [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
0341
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72
>   [i915#11320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1320
>   [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1349
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1681
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2061
>   [i915#12145]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2145
>   [i915#12146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2146
>   [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/18=
49
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/19=
82
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
90
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/37=
08
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/38=
40
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
77
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
83
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/41=
03
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/42=
12
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/42=
13
>   [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/42=
15
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/46=
13
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/51=
90
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/52=
74
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/53=
54
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/66=
21
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/97=
32
>   [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
25
>
>
> Build changes
> -------------
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8006 -> IGTPW_11701
>
>   CI-20190529: 20190529
>   CI_DRM_15367: 4384ecebb83afae5e51ab90ff1fc9dc1f7c048a8 @ git://anongit.=
freedesktop.org/gfx-ci/linux
>   IGTPW_11701: 11701
>   IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.fre=
edesktop.org/drm/igt-gpu-tools.git
>
> =3D=3D Logs =3D=3D
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1170=
1/index.html

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmbayWwACgkQ+dvtSFmy
ccB2SRAAm0O0KksCNSK5V4rkt+SMxbuyt1T77TN967dUp8P2KeKch2g05lpbh4n7
/SxJ0pP0q5zkZM/w3d1Cf7e4n2cLGapJWXNTdmS13lsxhCQWHv2vIEn8KOCJz4K1
dCaeXbYoyrwoegfn7Y9aQwDUiNl+5DfLpfArFVppjqdrqxx3a5JgqY4KX/4Nl/o/
7/HhUn9SbyJs15YoSw1FNblf+hVYn1kQDU8n0ZM4uijQJFlbWXKFaPIH+ljo7fof
DTvcPBnL6gLr/CbdhVIpv6EEXBZl9bBy3I9SbeTujkNvDCwO2e8BVUIA3a9oB5mZ
65NyMgiu4WsutVJNMlbonrtRwKarQcgalHcDwB0S9rgYX6bHr3kQ8eg6WqYtkPX2
VCSdlHMq2WyH8VbJC15v53GEdu5JjO5/KOVM00I0nqdj6dV38fN0yt9aTZtbsdIb
qShW7edinaU78BVfUoasCft0IXT1sPXkRqk8j5pPZsj9P18vC+8ORosmYWcTpt7U
SWhPfi/Dd7wNlLqc7bJk6i1ZOlzT769bopjpCBQVluDHKIiCJEjRNzbtrN7EghV2
8ZTy+7eMcbyaEz797Ab4i/90yIlhjcJ8VCsR6++vc8MIsgMj0ZglURhF+8AYGdmp
Jdsi0qAHkdu2rpUI9loz/Ui7PSnNkjlvaRjOoRFOe9OLTzFjCI8=
=bT1/
-----END PGP SIGNATURE-----
--=-=-=--

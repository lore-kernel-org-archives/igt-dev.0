Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40D1FED2C7
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 04:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5E710E1D9;
	Thu, 12 Mar 2026 04:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Us0N+D9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F3710E414
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 04:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773289391; x=1804825391;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A9Mmys7TDUijOUxu9SEo9Gm8rcKRumlzfA36bo3LpGQ=;
 b=Us0N+D9lAMVbexOiCG1zAqAd0gD/x8U/sycXdDJMzEqXDV57Q1JWb8/8
 iXaGSvFLRt51cO8/l1sITDFnJoF6pSckCbPj2kqb7smk6+mYFXgsN6wnq
 ziTCvnKn92MqLrNKTKNTJhw7oyOisPp9qhtS18Bl/p/CFqfLVm9CB5ZL1
 k8AxJ6aOracjkwJBqUDJjDGJeuYXzFKUlIRB+Umdfu5IrWVu50fd0sysV
 GLbW0gd68vDDLt02SbMQ5rnt26g4PTV0/QSyYcoCtRMZNgPm/ICgD2NOS
 DDLkw23OmkJL3xhwJMCeeFAmjH7uK5NKh4LyVitlteSzbxxSXsyGEockH Q==;
X-CSE-ConnectionGUID: A10tXxgHRlGc2MNsJoTxdw==
X-CSE-MsgGUID: YTXkGqJQQLeePEvWoccelQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84690490"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="84690490"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 21:23:01 -0700
X-CSE-ConnectionGUID: TDHJUz6AQ+Co3bMMcCMoTA==
X-CSE-MsgGUID: XinFXS7RQR+XDNSREJuNLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="243706999"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 21:22:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 21:22:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 21:22:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 21:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQVcw+lCDtMXami3fsqYERVdo/abpGBpUJxv3veMjSkrHcxOhN5FMMyxvy839A8Ol5JPdvsRSZKTPvFoMjPdQlvRbydEsEBCaY//1oKWeMZK+qZW2gu8ADKdpCvhI2Y8QM//QRl3/IhFI7lBuvUOJxa2MTwYk2Hytgeh4qQp9Uvg6k9oDhH7MUwtADWBzBqDfg8LFJdoJGHWeZPROsl7C8o8ZvmUK2lM+gPWdwPrIsPLkExW66SqSmmTurGPGLr4WiWbGaP5Qg9H7gJ88JpnbWBVqLI4Ab4Z0VHL2zdihmYhSAxMvu9Sc1nLupWKI/kBv47QRRridPF5WlmrePta+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yk4Cb+qtR7aNLG/0sWEgM1PnzahwQv2yM9HIQzSROIM=;
 b=AEFMw0abN764wkjo2qrdynozm+qBYnMOvhpMDa/L+5QgfeaxtF9iOHU6gc1SeKDFMQoEU+foFK0cLIMDAwg2lnboydlD9miXSpmJAFXcvojPD5tq3wOmknIb0Fr+1jcP8TkM0+AmrHT94DxQWEFDnD0aMdD6TzsvkPZAyZeFiziJg234/Nq4O70GSi9aHQrgYiJ5eQK52j3tq3z+o3fcxF/QxEzzHu8YgdlpBGYsenoB4DbVFR5lEiglsblAFPZ2slf0zk1d982JQ7Lscg7h0BIAp0E448tZ4YmxgZmSgW6Jq6hC/ot8SW42+vFhcSTZZXu8yIxARpmF9klNM0ZH3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 04:22:55 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 04:22:54 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Blocklist BMG specific modifiers on
 NVL/PTL
Thread-Topic: [PATCH i-g-t] intel-ci: Blocklist BMG specific modifiers on
 NVL/PTL
Thread-Index: AQHcsVCp7Sk4HHI7GkCX7SPR3GVXWrWqTQ+w
Date: Thu, 12 Mar 2026 04:22:54 +0000
Message-ID: <DM4PR11MB631262B8E0FB799F170C97809044A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260311120300.577179-1-swati2.sharma@intel.com>
In-Reply-To: <20260311120300.577179-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ2PR11MB8321:EE_
x-ms-office365-filtering-correlation-id: b8627e1f-bd7f-4a88-94c8-08de7fef0866
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: PIoU+8CgaZhsugSFRx2RsAplDb6LqF5IGHVBV/xfqH839GoeKTgEO70E6+CHVhiKs9jkDWD2ZQYArJFaDwRaQcFP03Bd5OEcS48hKNEHofveqa3LmSfKdx6z4KHLYb42xosoLc/eOPtblLAyKR0Wl5CYuuW6hTMwNHnQT4nIieLhkKQ03Qkt5zCJhXtP/0PY9OJO9NdA+pwRLJAoqMvIUPy0vnyFof6uDG5Vu3v1PBU6AOflmVCkUv3+6pmhiTrxp9/8GMdeEwbSlZ/jTRUngRiANiprB6jdYTKGVwWNROss9jWvt2jSyVZOGYsn1QepYG6vkOoVejvTF5K+5xYWM7RC6Gvw44WV5p1312+ocwNZyeT3L0f+axDCJpXdu3uziIsAkuSjQwLDHYScmuI3dSMlAlx4jlXXK6RlFA7hX1jVcQfxktoOXI1HoNTIvT1Drp7qsT0fA2E0+urr8tuA3vrQ8xR6gFf7vrfzp/WOQspLpWEMeVz80MwoO/O29WkiHZya43tEe3LxpbDGT+Owz6o+aigvrYB5JNeGeMThn0dSYXnwSiusUP0q7zwfK1EHrBswnb/pongdPB8IdsTkoy4PbXYc2rzyWjxoUNBsPBj3oXEcZqcOOjqSWLnWv6rJmApkE23qVJulzXDKXsMa7W4KWAk/TfQ5sM0IN+H//sX8+D+lxUdi/FGVai517KaHXNtq4UclxYC/46opZjZwJdlwJWbMyPUfASDGtxleW6TPR2l8dTeP341C+ArZkYxXFj5KbjNp5/k65/jXmzjyRQq+2N3AncC9PLknxNjf11Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JNv9qOIHPiNONYPVWApRYSSThe5VmHNwHcjG8aMTp/4gxMvoeLkEDeuaU7dE?=
 =?us-ascii?Q?ysH2lyZAUjcxgoCHJPOvPba3Chx9zJSqdjRSTAJgME3idtBLuZ28g5ARqqqQ?=
 =?us-ascii?Q?+MFjP07/sNdDqw429OQUqhzZcZXxXIeFgngIjHrTvbWF2E5c6E9hRtXXjNSh?=
 =?us-ascii?Q?dTNZr472tuGdkhHw9ccIsYdfIZUdtx75jru3vwFaElY29FI66rHHZ0Mb1wWC?=
 =?us-ascii?Q?RNb0GRGziAk11uXkXWQWXGNh5OmV9smRdeHmOLS07HxNPwYcHfJc8q00JPtH?=
 =?us-ascii?Q?VVkOJ5FtQtz28OjGh6d9yWc6Fh0m1mRdjIqfItPJrc/Ithe9AAbppY2Q/W4p?=
 =?us-ascii?Q?cf8vNw6HRbccrfvy2JmOv12X+h1vt2UXisLpX8UHyLLjIqZIOhjlgj44p7oq?=
 =?us-ascii?Q?OTZMunCCAYihNajbbeO87SEVImCdN2dUv5voCcbW1sD1DWvpTBf6z8hcxGHO?=
 =?us-ascii?Q?irLbegPr5bgIGFR9Jv9jt2cGQ1y8GIBNWgdJzrYF7YZEvYLpvFqjVSQntwz7?=
 =?us-ascii?Q?LAQwkGnz2YRyYy9AMzkNNDICxJmy7noJ8ZTut/CEvqO0M2Sn7fDDyJ5wc+2i?=
 =?us-ascii?Q?yEXr+u4NAleqsq80lX1mFOtjF7DpTBknToDcMyEGyJ0ugVCbLpefpdrQZxLy?=
 =?us-ascii?Q?PwPJuB7kijIZkyNw4x7NQZ43oOOar2Wa6NYLOimb2WqB5XVWFBz9rR6jq/rt?=
 =?us-ascii?Q?dRcVARyo4DpSQ9+mMqlmW3HXBa1l/A1uVaVE7ievdG19uX3D0+FYlelIVIne?=
 =?us-ascii?Q?BDVoEVA+zsfm/QdMcCMqf45INx+MEhzlzEF5LxlDwKq/FMiDsqfKANzS5eE2?=
 =?us-ascii?Q?tSJDPLD2f3guzptau9zeZrVnCAj/ZKo8MhnjgoVBoK107XgqeLTyVq3yKwvy?=
 =?us-ascii?Q?JgZKsltnD9zg2sciBw1RkiClIjikrT6a1jo0anTKi5U1o4oqqCYv8jhh7czV?=
 =?us-ascii?Q?KtfV+bQNwYkqIm8ah0N/nMAf9KnpvPy28EH64yJSk5dYVHf9fBOGMjqoar8e?=
 =?us-ascii?Q?h80VBaNCpKKg2dYWgLwQCPiIoYnfWPrXc1/v+ncG2eb3aLxHmw4igacDooq8?=
 =?us-ascii?Q?kfRymczeNUfLVXaYqyhJQpUxODWCTrT8r0NzMJWt58hh5GtkgSMJ2Pvsumq8?=
 =?us-ascii?Q?GE2xvZLQ2HFQkFlSJr6WCmEh07UQypxBmVIyq40IPhmJzO2HNqYu90HZOZ4h?=
 =?us-ascii?Q?H5RFzQiv08shpC+RvbYJvQHZA2QpAGPg2Oy94A34cEL2nzaeXKYM5wl6fgTu?=
 =?us-ascii?Q?hnNXz0+wujyMpq06L+FcLuayRYNNnb7MYy6NraTemXsSkOGbEaol8VTKiB5a?=
 =?us-ascii?Q?6h+cMxVgvhCoqqcorpvzoWuf8/EwmTn8Mr29bXMO/BiEt2BECx0zRjwtyn/7?=
 =?us-ascii?Q?IUutOyHaKFeZs0181lScQmlZqE7ujQORdXr0PgdFTLMcFJx3mtxlqWZv5Bur?=
 =?us-ascii?Q?yqccZE7AJdlJ92VpJdDJKA4dUFBfoFPofIjcByjLQwVWiyuUIxzIksEFqD14?=
 =?us-ascii?Q?MFIcxPBqh2eX5FUiXHEcGYrMHzaU1NDh/gPzxLjLqql3G+E9Y3fusQrzee5/?=
 =?us-ascii?Q?WkjDl6UI3zt+GPwiu/hxeIEs4LpFR28qU2wTEIQc63pMMiefxx2/dOuB/JY5?=
 =?us-ascii?Q?M884IZ2pb5rFn8myqxj4LcB9YD9ewo3sG4lw0s+CtitvydVFkvk6OyvA5Oqu?=
 =?us-ascii?Q?u/FabTiKAWUPD+9wm+oY72Z3EqksqUkdLKTk0wADvV93U4Ar?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: e7TP+yfk+P4L4YqyYp7QdsVRkxoQpPBIq52JPO8p4gLSp6UUgwse+xVQao8mcMSp5T/08A7Jq5rkSuuHjdIVXbtA8Y6cdYfb1KH5rxdVS4GBZeF7xMFjpUy5c/BAYtDu9mFHnsnikxGrKXo9JVDCDbDqh+xiRY2gMVL8aKinKFxsVbHk95KmhCuOByBdRPiQMaxTfSrD/dXgk0df3+5wPqOQC9EQCE07yuqvhHxo5EI6l8YVyLMAioZfJ7B+FTy4HEbMwPj8MuO++XamxdYdvnL/Go6qu4SYd8FKUzncKcZbMfZAm0zrlkki25Ll3O1Audh6gLmswehymXmM6dRN5w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8627e1f-bd7f-4a88-94c8-08de7fef0866
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 04:22:54.7447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nNhJFAkYijK1AHPes8TYLfdbprXppq9XQjuftNwQGM8eh+kYAbVrOTU6x8orpSzyK5eR61kL6798ua3vvYG4Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
X-OriginatorOrg: intel.com
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Wednesday, March 11, 2026 5:33 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Blocklist BMG specific modifiers on NVL/=
PTL
>=20
> The 4-tiled BMG CCS modifier is not supported on NVL/PTL platforms, makin=
g
> these skips expected. Blocklist to avoid CI noise.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel-ci/xe.nvl.display.blocklist.txt | 3 +--  tests/intel-
> ci/xe.ptl.display.blocklist.txt | 7 ++-----
>  2 files changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-
> ci/xe.nvl.display.blocklist.txt
> index 15ad4345a..814e79928 100644
> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -63,8 +63,7 @@ igt@kms_scaling_modes@scaling-mode-none
>  igt@kms_ccs@.*-dg2-.*
>  igt@kms_ccs@.*-mtl-.*
>  igt@kms_flip_scaled_crc@.*dg2rcccs.*
> -igt@kms_ccs@.*4-tiled-bmg-ccs
> -igt@kms_plane@pixel-format.*(mtl|dg2).*
> +igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
>=20
> #################################################################
> #############
>  # Valid skip: Valid for display ver < 13
> #################################################################
> #############
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-
> ci/xe.ptl.display.blocklist.txt
> index aaf7eb1ef..9b192d67c 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -67,12 +67,12 @@ igt@kms_writeback@.*
> #################################################################
> #############
>  igt@kms_scaling_modes@scaling-mode-none
>=20
> #################################################################
> #############
> -# Valid skip: DG2 & MTL specific
> +# Valid skip: DG2 & MTL & BMG specific
>=20
> #################################################################
> #############
>  igt@kms_ccs@.*-dg2-.*
>  igt@kms_ccs@.*-mtl-.*
>  igt@kms_flip_scaled_crc@.*dg2rcccs.*
> -igt@kms_plane@pixel-format.*(mtl|dg2).*
> +igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
>=20
> #################################################################
> #############
>  # Valid skip: Valid for display ver < 13
> #################################################################
> #############
> @@ -123,9 +123,6 @@ igt@kms_bw@linear-tiling-.*-display.*
>=20
> #################################################################
> #############
>  igt@kms_getfb@getfb2-accept-ccs
>=20
> #################################################################
> #############
> -# BMG modifiers are valid skips for PTL -
> #################################################################
> #############
> -igt@kms_ccs@.*4-tiled-bmg-ccs
>=20
> #################################################################
> #############
>  # Expected fail on current CI config
>=20
> #################################################################
> #############
> --
> 2.25.1


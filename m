Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2E2C021B5
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F8A10E3D5;
	Mon, 24 Feb 2025 13:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jp5lyQZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A54B10E139
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 06:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740378295; x=1771914295;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M4Z6MGWWyHyiRUOSLHxtiE4PHsl5qblcYe3j5bvNROA=;
 b=Jp5lyQZV4qAFL0WjQdMZn1/we8T3dOi9b8+ceKIqJqdKqdYNgdlmmZhX
 +5m71MgZAwQW+z4zshYCkVHhP7KolWyAH3+XgulgjZmJYOGtdVOGVk7+Q
 zL8rpOTYY6T00VtvLXfZlv2TC7V8n2HHxxR1wJ+G/sC4a71HDU6awI9Vp
 cHIFs+CIt8aEnLJYuvqzl2PQoNDYO4T67L0XW11fqmTQ/isFfto6HmwDi
 OcFVz5wyCTwRwxVcToYVpDT1jKKlIKS/r1lMpDdZ4BW2Nk8HcNbe8gSq5
 ssKSkKLPA4WP9fkCfi+gB6VVVKNzxNs1oNXCh7ILaeC3MrcMvGRUCpqqr g==;
X-CSE-ConnectionGUID: o3r5lOO/QgKScaEPPyyntw==
X-CSE-MsgGUID: WYxdamSETQWWqcHuWXx89Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41385221"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41385221"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 22:24:54 -0800
X-CSE-ConnectionGUID: bUa+w+OxTTWMYf22OGwEeA==
X-CSE-MsgGUID: GqKg7CMBTMORMHi62TxxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146851180"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2025 22:24:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 23 Feb 2025 22:24:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 23 Feb 2025 22:24:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 22:24:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w74XrYAroejy/tGYXIoB22nP4bKrfxiMko0hK3lPsjBZnqVoUf1VPUZBf98Gj/7THt9wUQNTIZuZbRIO7yyrT5b7fsrgwBzM+ir8PTzB7Ql1OlNjbIevsWOpbtvEErTJHps6/FqL6g8BfhWeUgP8Jt7HWizPaeVLpHo75QMB2Jnho3VtEhQsGtqdgjotGw84dLsSiFJSkHQqfVT3hTYzN6xM52C4O4f4YRnQKX7jNOTM34XZk8NBahSXDJkyCT2G0SUIYA5STVnaDv0e1kYXaraEDD/JXaGa/wzQlyq9nesY3Yit/YsK+Lfqq8aJgBx2ske+SmVIzn4l7LNhgVAg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxdUyd454r8prv5goUjVITawXfq7KQTKIOph4zCvYYQ=;
 b=H3Yy/6TOBaxiE8jFvSkhfSnDs5q7aNyyLrC/ihnL5Bsbw/4qLB9z3LIqp4b6O/4nWDWZXDIOpuHi4BIj8LlOg+T4b0EDp4cm1uJ5ZTbAPgSZPhHBns3WAEZyJg4duemaa2qsHEXxjpaxf8QMDBPDMOg9TO77n2ohN4iyG72nc3p4MrtHjV1DgdViteRQ+t7WXOthGhXpnW4EuESxAi0tTG7GMuJ/IAyaOzjwF4dDYHgFYeTyCmrLE8Wy1EHf5JyeZ6bpEyVivooSu6BF3B/aPIK/pDcSPaJCuC93Y1j3oMlb9CiSTQkRz22/F49CWnmT5hDipzD9I3tThOpZNLMikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Mon, 24 Feb
 2025 06:24:22 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 06:24:21 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_plane_multiple: Add dual display subtest
Thread-Topic: [PATCH i-g-t] tests/kms_plane_multiple: Add dual display subtest
Thread-Index: AQHbgpU3iKI5Wc8PB0OlCa6IfIispbNWAH8g
Date: Mon, 24 Feb 2025 06:24:21 +0000
Message-ID: <DM4PR11MB6312283D0336DDB9BD79403790C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250219061224.116374-1-karthik.b.s@intel.com>
In-Reply-To: <20250219061224.116374-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB6006:EE_
x-ms-office365-filtering-correlation-id: 74eb7497-cb38-480e-b0e0-08dd549be079
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VXfvMtvcbIn+A9EHwaqb5p1XAD/7uAOBTjjI8k7+7bCdcmIwslrM1vpFPQuB?=
 =?us-ascii?Q?BpdqlLKyN77Eudir1/K2ljlv74FCO331iMTVFUQGtBDDutuVmvakxK+b0pV7?=
 =?us-ascii?Q?grvKv7YbbEh9KyMcGtbhLX3pwomY4snVpnCfTX0UUqmKt3fFQbW1VfgljSgK?=
 =?us-ascii?Q?4jPzEef0VOLAhWOpyfJWqmRTeqnNo1xa7j68JK6e4axfR2+ZVun5dBG2mUuM?=
 =?us-ascii?Q?RJE4qoLXMUUCQmRgyHfaQl6n0cQI56D3/GVcYBe0YD5JrqS7peCGeZehcunv?=
 =?us-ascii?Q?hxpbyaJqVNc0mGq5DiwR+ls9qTFCk2/55PQBuoxQ8Xtfs3WW8T+gZPxftUNx?=
 =?us-ascii?Q?/MOa18vASWzIZ15neimzZKXJNzt0HHtdHCX8WMc8raJf94jaUTj0/zzMrJ3K?=
 =?us-ascii?Q?3Ceuiz9cq9fuHnWytqUdTEMMmggoQCgXyPFt17tyRB1ac6y3gtmw+hj7cqWy?=
 =?us-ascii?Q?DCoOZmYFy0xbWL+48J3nOiHikJPgL07EYnk7Cz+RtBHCdWxA4AklQfLd/5jZ?=
 =?us-ascii?Q?ipD0Z5aSKCFmvuuJoErIzYSEXVmShylLvzgCp/lE1fqyT7r1mltWKBY7YuJk?=
 =?us-ascii?Q?P0u8UbM44CabmQs5DJpmNJkD+KXcdKvWLiy6CZvsCpGidd/ICaFKQYO/GmDI?=
 =?us-ascii?Q?Dy2f7VqU8Ev6icQpdzcoAS8t7EPbVmVpyEiUNR5gTc/2/u5+aFYbdFXXDzmP?=
 =?us-ascii?Q?6u4Gvbgx83i73JrGjn91RDLB60TkRK7ZMAeOvViLIy5KZqjGqD2xcl71jqaV?=
 =?us-ascii?Q?umxGmfgKYu3zmHCYC83G3iuQh21stjhT7HylLDSVRaUdDoDfzygzQNwZZoll?=
 =?us-ascii?Q?BVc4+G1k/ALA7+GQaRIkc/pTeqrf4qztmTM8rWGhDEb22kST0FCSXsuzchsN?=
 =?us-ascii?Q?yL5hEzut/n6wxXIttixwG391xmHfLikDVRcixfwwWAUvzBA+CjwPSnsiFMmq?=
 =?us-ascii?Q?v3uNOz0rP56YXUEo4aWoQRjg8stsXVyY0C6rcNNuUI0RkLY6YL7XQu1RJBz1?=
 =?us-ascii?Q?EO0b7nzgA5Vl3gJK2+iL3fIGKFzscBocrlsHLxwjgK8EfFQ95g694l8XA7dN?=
 =?us-ascii?Q?qYlm+zFztZfQmBlQ4D8sPCT2VDh1JENMJ/xyvV7h59OVGEfohIw3vWiyhOe0?=
 =?us-ascii?Q?TDl8lJXmjOGvWBCUWDyPk5vCvcWWtbK3nNreQG7exaw83hFYqtCeWXTc9qBT?=
 =?us-ascii?Q?ywGxNep1YhBEYfhmY8qjghyaH7ukR23EqvZV0LojqEFAJztS96RAqmWQchuq?=
 =?us-ascii?Q?vJF6xb0Yfyl3yOThGVEyDAGAY0NmPPB8Tkow1PpECt6UjmrLAo9qdQuCil7o?=
 =?us-ascii?Q?CkwmIj0xT1nh/xY5w6irRoV3DhxIzMmlQwF0WhF4hbbiSbdKFd/DA6K0phEQ?=
 =?us-ascii?Q?72lmKdsLIGbNhgMJ8oHdOtvMz/e8NUy3cavMRuvMV7UB3GJle6hWHKDhJFzt?=
 =?us-ascii?Q?MBGjw1nUBjZ8czfPPWI8xXC/T8feRgGK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YV4TcFRI55F37uNheAn+CCi7la2Fkkt/YfcsP6Ig2etxlSbC1UECrd06Qfwe?=
 =?us-ascii?Q?3q+OFT8kDrRpJxUvkBq3YLlXGLtoLamez7J5MWuosXknQYvwhwcCQK/BVbqg?=
 =?us-ascii?Q?YwPVd+viukEVVVXu6Z9ewGJdeNUzFy5tAvwOsMBMEoIS9hs5QNmQHZ3O1vKF?=
 =?us-ascii?Q?i61/5rY6VoSlOl6G23+0pdRL1fuD4xjFJ5UFRffESm5uf4k38IEnmFNFOTPG?=
 =?us-ascii?Q?dnyehOqLmx+W2X2LJ2JS/SSfj5uNKaZXALQFdoCFBCAugvjpP4xGUCZyzcjo?=
 =?us-ascii?Q?SXlQjFAF+l+6hbqE34iFj41gyDCabj55YKv+XCGYhWvrsOOO5KtzO+csgI8F?=
 =?us-ascii?Q?KM1a9+GY+lPxm1KF2u+SjilW+chL+9dMf/w0fAHNZJYvKg3hr/KtXiEDLPiG?=
 =?us-ascii?Q?gp0dgKqBXNmaAMsZngAIYMnYwxXIPkgvBH6MORpnO8U9hSf2EzZ4ft+nXlsB?=
 =?us-ascii?Q?etf2KQAIQgRlG4GsnJw5Z7G9geDNfsc3Jjn940LgpmaLi/pnnADGVfyQsJKV?=
 =?us-ascii?Q?HbA081aEkvwJ1hCld/Y1574f/t7l3JC/G2zL2/XCpSs+TN8NH5MNMboFalS5?=
 =?us-ascii?Q?qkkG8jdl0FBrEoOxAoNae+e0NVQH1hSbRqvCg18bfczb1A+CemLSLVtuDLnf?=
 =?us-ascii?Q?yw9cpSjw0DDlBqVsWgzt4dw2r5HKkXwBqHwEoK7YEQASlUWTmUpR/81VIueZ?=
 =?us-ascii?Q?Z9Ed0j2GIGseqtGHjEcP1vC1INacMwAPyTju2TammdwrIvqgmCLMKtkD7AIR?=
 =?us-ascii?Q?yEdwI8N7wDV7zuT5Sy3WjfxrSsx384u0RTUUTXSqUnWUU7lhB4iIvxqeqiX4?=
 =?us-ascii?Q?K9VdUzLbmY9UaokW0z7HaN0imvY5faEyj/kSpg8s8RbTrydmvc4vl4uIpCjn?=
 =?us-ascii?Q?RUIS+CL6N2nE4/QfDaqRZTuUTezQ/qfsj1fjvjf7EesDMjXxDdetQwdd6YP3?=
 =?us-ascii?Q?xZf0pPh5Opx1ewNv2PNCzxBfP0vHvu+j0EtJLY4oalTy57OscgV3+HzvjEig?=
 =?us-ascii?Q?xk+0ClFpHY1JhHC8XCkFKtUHY2Lpzwr1P5WO9qCRbd0iugoeVHTXU4DUpT2T?=
 =?us-ascii?Q?2s2ST6fKUQgFag95tX1KvUsc4kmVgHYhC/8CUzRHyKfca+jzQTkuXwVO2jGu?=
 =?us-ascii?Q?5rL8Pb62wOoIb8sRGWOgIfHUf9f152jlCQufoLmr0HgAhovrQl5mUuh6Wv/u?=
 =?us-ascii?Q?zI9mzTBwumnee9R3g/dkgEfIwMl7ewaA54DPmMMFjbdEDPDcRNeTra5vsH2c?=
 =?us-ascii?Q?vFysGbm9P/R9YUNdqu/wKu8KbFTIgkhcHCyOmyaNoSObC+x6vdU7Ws1ljUSz?=
 =?us-ascii?Q?i+S9Cqs0r1WCtQdFdfElzSraMN1riYIEKSnTAuKRRi30p3Z5w17cLj2mw/5O?=
 =?us-ascii?Q?zInBiIU6l61L9y4aM1vzl+VnSwCROq6iFFcc9m/6ev/4kVHNeCTY3xasIbiA?=
 =?us-ascii?Q?gOh07RJ/08Ua9+GQOq9qcOiblghk21NJr47KOPNoqPGSp0AZq7Cynsh56gsx?=
 =?us-ascii?Q?V8y6nRD0d4VrXo/zm2v8ReMZx26ULkm5PvBwndNhXHyQXe5deGjj10UlvbcB?=
 =?us-ascii?Q?S/8b9ae9QajTqkzs0Lg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74eb7497-cb38-480e-b0e0-08dd549be079
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 06:24:21.8792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AA1g9NcWGwVvjB8f7/YNQlmoce/cTAI7lAkIBrt54mMJ1RBfSXmcw6zO25+JT4VH2rbDHUheaO4USSzkaQ8fUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
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

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B S
> Sent: Wednesday, February 19, 2025 11:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t] tests/kms_plane_multiple: Add dual display subtest
>=20
> Add 2x subtest to verify MPO use case simulataneously on two display
> configurations.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_plane_multiple.c | 216 ++++++++++++++++++++++++++++---------
>  1 file changed, 167 insertions(+), 49 deletions(-)
>=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c inde=
x
> b7922c357..993162640 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -58,6 +58,10 @@
>   * @x:           x-tiling
>   * @y:           y-tiling
>   * @yf:          yf-tiling
> + *
> + * SUBTEST: 2x
> + * Description: Check that the kernel handles atomic updates of multiple=
 planes
> + *		simultaneously committed on 2 displays.
>   */
>=20
>  IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes."); =
@@
> -76,10 +80,10 @@ typedef struct {  typedef struct {
>  	int drm_fd;
>  	igt_display_t display;
> -	igt_crc_t ref_crc;
> -	igt_pipe_crc_t *pipe_crc;
> -	igt_plane_t **plane;
> -	struct igt_fb *fb;
> +	igt_crc_t ref_crc1, ref_crc2;
> +	igt_pipe_crc_t *pipe_crc1, *pipe_crc2;
> +	igt_plane_t **plane1, **plane2;
> +	struct igt_fb *fb1, *fb2;
>  } data_t;
>=20
>  /* Command line parameters. */
> @@ -98,14 +102,14 @@ struct {
>   */
>  static void test_init(data_t *data, enum pipe pipe, int n_planes)  {
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	data->pipe_crc1 =3D igt_pipe_crc_new(data->drm_fd, pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20
> -	data->plane =3D calloc(n_planes, sizeof(*data->plane));
> -	igt_assert_f(data->plane !=3D NULL, "Failed to allocate memory for
> planes\n");
> +	data->plane1 =3D calloc(n_planes, sizeof(*data->plane1));
> +	igt_assert_f(data->plane1 !=3D NULL, "Failed to allocate memory for
> +planes\n");
>=20
> -	data->fb =3D calloc(n_planes, sizeof(struct igt_fb));
> -	igt_assert_f(data->fb !=3D NULL, "Failed to allocate memory for FBs\n")=
;
> +	data->fb1 =3D calloc(n_planes, sizeof(struct igt_fb));
> +	igt_assert_f(data->fb1 !=3D NULL, "Failed to allocate memory for
> +FBs\n");
>  }
>=20
>  static void test_fini(data_t *data, igt_output_t *output, int n_planes) =
@@ -
> 113,21 +117,21 @@ static void test_fini(data_t *data, igt_output_t *outpu=
t, int
> n_planes)
>  	/* reset the constraint on the pipe */
>  	igt_output_set_pipe(output, PIPE_ANY);
>=20
> -	igt_pipe_crc_free(data->pipe_crc);
> -	data->pipe_crc =3D NULL;
> +	igt_pipe_crc_free(data->pipe_crc1);
> +	data->pipe_crc1 =3D NULL;
>=20
> -	free(data->plane);
> -	data->plane =3D NULL;
> +	free(data->plane1);
> +	data->plane1 =3D NULL;
>=20
> -	free(data->fb);
> -	data->fb =3D NULL;
> +	free(data->fb1);
> +	data->fb1 =3D NULL;
>=20
>  	igt_display_reset(&data->display);
>  }
>=20
>  static void
> -get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
> -	      color_t *color, uint64_t modifier)
> +get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
> igt_pipe_crc_t *pipe_crc,
> +	      color_t *color, igt_plane_t **plane, uint64_t modifier,
> +igt_crc_t *ref_crc)
>  {
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
> @@ -137,7 +141,7 @@ get_reference_crc(data_t *data, igt_output_t *output,
> enum pipe pipe,
>  	igt_output_set_pipe(output, pipe);
>=20
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> -	data->plane[primary->index] =3D primary;
> +	plane[primary->index] =3D primary;
>=20
>  	mode =3D igt_output_get_mode(output);
>=20
> @@ -145,21 +149,21 @@ get_reference_crc(data_t *data, igt_output_t *outpu=
t,
> enum pipe pipe,
>  			    DRM_FORMAT_XRGB8888,
>  			    modifier,
>  			    color->red, color->green, color->blue,
> -			    &data->fb[primary->index]);
> +			    &data->fb1[primary->index]);
>=20
> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
> >index]);
> +	igt_plane_set_fb(plane[primary->index], &data->fb1[primary->index]);
>=20
>  	ret =3D igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>  	igt_skip_on(ret !=3D 0);
>=20
> -	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
> +	igt_pipe_crc_collect_crc(pipe_crc, ref_crc);
>  }
>=20
>  static void
>  create_fb_for_mode_position(data_t *data, igt_output_t *output,
> drmModeModeInfo *mode,
>  			    color_t *color, int *rect_x, int *rect_y,
>  			    int *rect_w, int *rect_h, uint64_t modifier,
> -			    int max_planes)
> +			    int max_planes, igt_fb_t *fb)
>  {
>  	unsigned int fb_id;
>  	cairo_t *cr;
> @@ -171,16 +175,16 @@ create_fb_for_mode_position(data_t *data,
> igt_output_t *output, drmModeModeInfo
>  			      mode->hdisplay, mode->vdisplay,
>  			      DRM_FORMAT_XRGB8888,
>  			      modifier,
> -			      &data->fb[primary->index]);
> +			      &fb[primary->index]);
>  	igt_assert(fb_id);
>=20
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb[primary->index]);
> +	cr =3D igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
>  	igt_paint_color(cr, rect_x[0], rect_y[0],
>  			mode->hdisplay, mode->vdisplay,
>  			color->red, color->green, color->blue);
>=20
>  	for (int i =3D 0; i < max_planes; i++) {
> -		if (data->plane[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +		if (data->plane1[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>  			continue;
>  		igt_paint_color(cr, rect_x[i], rect_y[i],
>  				rect_w[i], rect_h[i], 0.0, 0.0, 0.0); @@ -191,8
> +195,8 @@ create_fb_for_mode_position(data_t *data, igt_output_t *output,
> drmModeModeInfo
>=20
>=20
>  static void
> -prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
> -	       uint64_t modifier, int max_planes, igt_output_t *output)
> +prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plan=
e_t
> **plane,
> +	       uint64_t modifier, int max_planes, igt_output_t *output,
> +igt_fb_t *fb)
>  {
>  	drmModeModeInfo *mode;
>  	igt_pipe_t *pipe;
> @@ -252,15 +256,14 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  		 * Here is made assumption primary plane will have
>  		 * index zero.
>  		 */
> -		igt_plane_t *plane =3D igt_output_get_plane(output, suffle[i]);
>  		uint32_t plane_format;
>  		uint64_t plane_modifier;
>=20
> -		data->plane[i] =3D plane;
> +		plane[i] =3D igt_output_get_plane(output, suffle[i]);
>=20
> -		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +		if (plane[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>  			continue;
> -		else if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> +		else if (plane[i]->type =3D=3D DRM_PLANE_TYPE_CURSOR)
>  			size[i] =3D SIZE_CURSOR;
>  		else
>  			size[i] =3D SIZE_PLANE;
> @@ -268,10 +271,10 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  		x[i] =3D rand() % (mode->hdisplay - size[i]);
>  		y[i] =3D rand() % (mode->vdisplay - size[i]);
>=20
> -		plane_format =3D data->plane[i]->type =3D=3D
> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 :
> DRM_FORMAT_XRGB8888;
> -		plane_modifier =3D data->plane[i]->type =3D=3D
> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : modifier;
> +		plane_format =3D plane[i]->type =3D=3D DRM_PLANE_TYPE_CURSOR ?
> DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
> +		plane_modifier =3D plane[i]->type =3D=3D DRM_PLANE_TYPE_CURSOR
> ?
> +DRM_FORMAT_MOD_LINEAR : modifier;
>=20
line length exceeds 100 for the above 2 please fix if possible.=20

> -		igt_skip_on(!igt_plane_has_format_mod(plane, plane_format,
> +		igt_skip_on(!igt_plane_has_format_mod(plane[i], plane_format,
>  						      plane_modifier));
>=20
>  		igt_create_color_fb(data->drm_fd,
> @@ -279,17 +282,17 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  				    plane_format,
>  				    plane_modifier,
>  				    color->red, color->green, color->blue,
> -				    &data->fb[i]);
> +				    &fb[i]);
>=20
> -		igt_plane_set_position(data->plane[i], x[i], y[i]);
> -		igt_plane_set_fb(data->plane[i], &data->fb[i]);
> +		igt_plane_set_position(plane[i], x[i], y[i]);
> +		igt_plane_set_fb(plane[i], &fb[i]);
>  	}
>=20
>  	/* primary plane */
> -	data->plane[primary->index] =3D primary;
> +	plane[primary->index] =3D primary;
>  	create_fb_for_mode_position(data, output, mode, color, x, y,
> -				    size, size, modifier, max_planes);
> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
> >index]);
> +				    size, size, modifier, max_planes, &fb[primary-
> >index]);
> +	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
>  	free((void*)x);
>  	free((void*)y);
>  	free((void*)size);
> @@ -335,12 +338,13 @@ test_plane_position_with_output(data_t *data, enum
> pipe pipe,
>=20
>  	test_init(data, pipe, n_planes);
>=20
> -	get_reference_crc(data, output, pipe, &blue, modifier);
> +	get_reference_crc(data, output, pipe, data->pipe_crc1, &blue,
> +			  data->plane1, modifier, &data->ref_crc1);
>=20
>  	/* Find out how many planes are allowed simultaneously */
>  	do {
>  		c++;
> -		prepare_planes(data, pipe, &blue, modifier, c, output);
> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
> output,
> +data->fb1);
>  		err =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);
>=20
>  		for_each_plane_on_pipe(&data->display, pipe, plane) @@ -
> 350,7 +354,7 @@ test_plane_position_with_output(data_t *data, enum pipe
> pipe,
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20
>  		for (int x =3D 0; x < c; x++)
> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>  	} while (!err && c < n_planes);
>=20
>  	if (err)
> @@ -364,14 +368,14 @@ test_plane_position_with_output(data_t *data, enum
> pipe pipe,
>  	while (i < iterations || loop_forever) {
>=20
>  		/* randomize planes and set up the holes */
> -		prepare_planes(data, pipe, &blue, modifier, c, output);
> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
> output,
> +data->fb1);
>=20
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -		igt_pipe_crc_start(data->pipe_crc);
> +		igt_pipe_crc_start(data->pipe_crc1);
>=20
> -		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc,
> &crc);
> -		igt_assert_crc_equal(&data->ref_crc, &crc);
> -		igt_pipe_crc_stop(data->pipe_crc);
> +		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc1, &crc);
> +		igt_assert_crc_equal(&data->ref_crc1, &crc);
> +		igt_pipe_crc_stop(data->pipe_crc1);
>=20
>  		for_each_plane_on_pipe(&data->display, pipe, plane)
>  			igt_plane_set_fb(plane, NULL);
> @@ -380,7 +384,7 @@ test_plane_position_with_output(data_t *data, enum
> pipe pipe,
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20
>  		for (int x =3D 0; x < c; x++)
> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>=20
>  		i++;
>  	}
> @@ -403,6 +407,108 @@ test_plane_position(data_t *data, enum pipe pipe,
> igt_output_t *output, uint64_t
>  					n_planes, modifier);
>  }
>=20
> +static void test_init_2_display(data_t *data, enum pipe pipe1, enum
> +pipe pipe2) {
> +	data->pipe_crc1 =3D igt_pipe_crc_new(data->drm_fd, pipe1,
> +					   IGT_PIPE_CRC_SOURCE_AUTO);
> +	data->pipe_crc2 =3D igt_pipe_crc_new(data->drm_fd, pipe2,
> +					   IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +	data->plane1 =3D calloc(2, sizeof(*data->plane1));
> +	igt_assert_f(data->plane1 !=3D NULL, "Failed to allocate memory for
> +planes\n");
> +
> +	data->plane2 =3D calloc(2, sizeof(*data->plane2));
> +	igt_assert_f(data->plane2 !=3D NULL, "Failed to allocate memory for
> +planes\n");
> +
> +	data->fb1 =3D calloc(2, sizeof(struct igt_fb));
> +	igt_assert_f(data->fb1 !=3D NULL, "Failed to allocate memory for
> +FBs\n");
> +
> +	data->fb2 =3D calloc(2, sizeof(struct igt_fb));
> +	igt_assert_f(data->fb2 !=3D NULL, "Failed to allocate memory for
> +FBs\n"); }
> +
> +static void test_fini_2_display(data_t *data) {
> +	igt_pipe_crc_stop(data->pipe_crc1);
> +	igt_pipe_crc_stop(data->pipe_crc2);
> +
> +	igt_display_reset(&data->display);
> +}
> +
> +static void test_plane_position_2_display(data_t *data, enum pipe pipe1,=
 enum
> pipe pipe2,
> +					  igt_output_t *output1, igt_output_t
> *output2) {
> +	color_t blue  =3D { 0.0f, 0.0f, 1.0f };
> +	igt_crc_t crc1, crc2;
> +
> +	test_init_2_display(data, pipe1, pipe2);
> +	get_reference_crc(data, output1, pipe1, data->pipe_crc1, &blue,
> +			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data-
> >ref_crc1);
> +	get_reference_crc(data, output2, pipe2, data->pipe_crc2, &blue,
> +			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data-
> >ref_crc2);
> +
> +	prepare_planes(data, pipe1, &blue, data->plane1,
> DRM_FORMAT_MOD_LINEAR, 2, output1, data->fb1);
> +	prepare_planes(data, pipe2, &blue, data->plane2,
> +DRM_FORMAT_MOD_LINEAR, 2, output2, data->fb2);

Line exceeds here also.=20
Can we target for all formats/modifiers like single display ??=20

> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_pipe_crc_start(data->pipe_crc1);
> +	igt_pipe_crc_start(data->pipe_crc2);
> +
> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1, &crc1);
> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc2,
> +&crc2);
> +
> +	igt_assert_crc_equal(&data->ref_crc1, &crc1);
> +	igt_assert_crc_equal(&data->ref_crc2, &crc2); }
> +
> +#define for_each_connected_output_local(display, output)		\
> +	for (int j__ =3D 0;  assert(igt_can_fail()), j__ < (display)->n_outputs=
; j__++)
> 	\
> +		for_each_if((((output) =3D &(display)->outputs[j__]), \
> +			      igt_output_is_connected((output))))
> +
> +#define for_each_valid_output_on_pipe_local(display, pipe, output) \
> +	for_each_connected_output_local((display), (output)) \
> +		for_each_if(igt_pipe_connector_valid((pipe), (output)))
> +
> +static void run_2_display_test(data_t *data) {
> +	enum pipe pipe1, pipe2;
> +	igt_output_t *output1, *output2;
> +	igt_display_t *display =3D &data->display;
> +
> +	igt_display_reset(display);
> +
> +	for_each_pipe(display, pipe1) {
> +		for_each_valid_output_on_pipe(display, pipe1, output1) {
> +			for_each_pipe(display, pipe2) {
> +				if (pipe1 =3D=3D pipe2)
> +					continue;
> +
> +				for_each_valid_output_on_pipe_local(display,
> pipe2, output2) {
> +					if (output1 =3D=3D output2)
> +						continue;
> +
> +					igt_display_reset(display);
> +
> +					igt_output_set_pipe(output1, pipe1);
> +					igt_output_set_pipe(output2, pipe2);
> +
> +					if
> (!intel_pipe_output_combo_valid(display))
> +						continue;
> +
> +					igt_dynamic_f("pipe-%s-%s-pipe-%s-
> %s",
> +
> kmstest_pipe_name(pipe1), output1->name,
> +
> kmstest_pipe_name(pipe2), output2->name)
> +
> 	test_plane_position_2_display(data, pipe1, pipe2,
> +
> output1, output2);
> +
> +					test_fini_2_display(data);
> +				}
> +			}
> +		}
> +	}
> +}
> +
>  static void run_test(data_t *data, uint64_t modifier)  {
>  	enum pipe pipe;
> @@ -506,6 +612,18 @@ igt_main_args("", long_options, help_str, opt_handle=
r,
> NULL)
>  			run_test(&data, subtests[i].modifier);
>  	}
>=20
> +	igt_subtest_with_dynamic("2x") {
> +		int valid_outputs =3D 0;
> +		igt_output_t *output;
> +
> +		for_each_connected_output(&data.display, output)
> +			valid_outputs++;
> +
> +		igt_require(valid_outputs > 1);
> +
> +		run_2_display_test(&data);
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8F2CFA474
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 06:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB8810E03C;
	Fri, 21 Nov 2025 06:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9FMbeBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C48110E03C
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 06:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763706159; x=1795242159;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LTCBiS2vCkH7LrKbcKBoWOL46DURQ0uI1nIn0Prd3t0=;
 b=S9FMbeBMKQtpI8N+haLgqhEAkyac08xBOYBpjBV9XJ713DSCc6/RGDkZ
 UDMlxAv3mz217GqUSSGX9/3Xt+os0WR5XJ/YGDMHh2NPFdVaA6AHwdSyt
 mGGH+KQh7fOR6gkZeB7WCmWOehRIGmQv4u7PNmgc714ry3A1cfD9T3Ek2
 HO/nqJG2EZb/kvTyjI/OqSj2sfVA1EwGWTFcb3OdDBiDqoBTeZe6Wa7Yt
 8qsxTVSr+/cUqlz3kOo3nESCRxQGj+I57Z1cdkZiMbhUACvZ8Aa36qoa5
 lJFpaAa3QMa8b0mFlHMFm2LhMJfzGMa4j3GLdHyBdD20d7SbV1Yx6X+25 A==;
X-CSE-ConnectionGUID: 4lJduZ9dQoWUiTo7w5OO4Q==
X-CSE-MsgGUID: DRHRW+J9SACkXDnOnmquCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88444219"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="88444219"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:22:38 -0800
X-CSE-ConnectionGUID: XNlvfyMzRo6O4j93IwhN0A==
X-CSE-MsgGUID: TiL+znbOQFqhxTcOnVCtjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191855302"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:22:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:22:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 22:22:36 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:22:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W32FtLm25hZ7H7+6+D6zkhytvdLfsyS0DDRsC6tTVOzhp76cEJp6uz7jqJ8oWQf7lI8xYICFbQY6CB9jaFI7PaFU/lPFFEstR7x2/XlebIk5ofaghCthqLsav0bZeIGjySnZYjoMi0sWJr75PhQUov6s2aBXgFdrT91b9rJJ80mLm+x/2v9zErIFT7XM1uu1vZvPPIMbTFHN2SejzAd0PYRJ7rZ4YhQIg77uBtOFEVksKJL++XuIza3ROCReNNvUnc78yz83Ijd53Ahm8Wd5PLFNDsW/zayM5sUPAK9F2kRPKySFgnK5AqGhGBrbalQPx/R9XNGJ7xys1KyGS/HlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70l5UEi5KEmjtfkkIoLh86Zcsnrik1L43it8aNa54jg=;
 b=Qm/y12v37nQtYgsLv4yugUxxY000TPSSywo1rMH5OjrSfeOkdYzJZZijphC9/YEhJO7sxomqyXzs1F16S8kMH4++wpc7xwYPc8uQfyYCMpHKtwwGnLHc5gSWtErvw8JQZaRRczMTaIEBGXUBJxc0XXAVXiOABB2dcmvlQBFO9Lb4OJMh19egQEw95BRQpo/f1C5+cfUp/G+7/y9ZA286Kj11ZQBgTmSZUmdm8NXFh5pLLHvW2S+3iSEWuU6VNi1WWQbFKyrqshJCBCkqPpM4+XrsauJJgN5Y2txKv/v8x6bOVhymgYoK38bbkUNobyUWNaSUD7qbP6VgpQPdqQ2/5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB4847.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 06:22:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 06:22:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 02/12] lib/igt_fb: Validate supported formats for
 crc calculation
Thread-Topic: [PATCH i-g-t v3 02/12] lib/igt_fb: Validate supported formats
 for crc calculation
Thread-Index: AQHcWqlrlvN74lQRKEiWkw/qvF8FerT8p6MQ
Date: Fri, 21 Nov 2025 06:22:30 +0000
Message-ID: <DM3PPF208195D8D9E072585784510D79E6FE3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-3-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-3-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB4847:EE_
x-ms-office365-filtering-correlation-id: 8a5dccf5-d076-422b-f28d-08de28c65970
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?jBD4uBA7aVoKl+KTHO4lXarVx+C71KJw8EKHOov5GPayz1OyjOt7Con+yLXU?=
 =?us-ascii?Q?5yV06LR38Z0oTIHPl7oyzrp2rwtiJezE30HXpZnjEscKB8sN3ElJ7eDWLOme?=
 =?us-ascii?Q?zgyKjAC6p98mLLqL3X+VY6OAz3Fl/WDYNoQeO4MTp59t7CIvJOt0GlxWseJI?=
 =?us-ascii?Q?xvhSiCgHSR0Fr8mwhOAi9F5FUx/DPyLo5pMeyWVtsDmw35HSOabSH1ernMz7?=
 =?us-ascii?Q?eKuL0znW6dpNWDi2W0cnH1KI8tUor2+0kFFmbsk8B6pHDtzuFr32Wzu4gchT?=
 =?us-ascii?Q?pFZiC7S0zszO7Qsa+wfOYw+W6iXPY/QxW0LZ0zPr2BpDm3761mT69RkA6e/W?=
 =?us-ascii?Q?bwWqleIsqAcQwTMd47WzP56OVGHM5kIFzGqM0vQUX/LwMtdXZo2SzPjFqbTP?=
 =?us-ascii?Q?XzWWdiwca3Np/0zevPrgH65mT/9E2hzGSNwHC05jaWU8zIQO++SCUHlrWGuI?=
 =?us-ascii?Q?3kyuRjB6npKBWD9pNXmSxvheHo6Q63knPKO/ouYRuSbN8ybyYGxLP3q7UPY/?=
 =?us-ascii?Q?5SGoPQUKBO491Tx+47ROU/vf54BdPV86eLH711zdx90jwvz3NnsFZwebqu1l?=
 =?us-ascii?Q?7rRNB+shRD1ee5YxRPJa4OgKcV/gcDBGU5ifCwE9ZxFCqWLbncd0EmiwOSgJ?=
 =?us-ascii?Q?RHiz4QNf9IsH1kqB5+prlm8lcjeojJ79Ll8/w7MtpKLguaj7D1bsIesah1dn?=
 =?us-ascii?Q?hg0t04ZVEtheA84MFf+tXvsA5TpOd7JneKUWIl7UL8WefOw/dPT/qBcX0Hh9?=
 =?us-ascii?Q?VoSS/n3qurJg4xmHl8rbxghqLo0GqbgTGtwJxqf1Phe1+BCd8DA7oqTtWiED?=
 =?us-ascii?Q?TsraguBeJokPJ5NA/vkZBmkoazu1tG/nEgldYWbcGby9USmvUlRbdMURSAMR?=
 =?us-ascii?Q?4ElMngnhDFOxVlw/IVLDR4OcgYSXU1Q+TJz6brFEb/rdrXBrCd9g254JMwaM?=
 =?us-ascii?Q?uTvInkPvLWx51sUeSzZXlM2DlRN4qn62gR+hdZ4jMS7VjQXA5TSY6jf7EYHC?=
 =?us-ascii?Q?irAXv11bygRciLREOKPtKDsSx9i+xvrctMk91h9uhcYaBOrGIQ+vNbmBBebU?=
 =?us-ascii?Q?dXTxk+mI//HPIpBCUfw2cLBgYHAOGjBuzHuF/xumfrEmGeRFT4kH2wsZKpA3?=
 =?us-ascii?Q?/XEkQb64nui4mXnsuDk7UEeBGCDoI0cxoWBf6WLV4rKxXMoQTNP7wz+qYiGP?=
 =?us-ascii?Q?MYYwhDKPa3OzX5SmhY6WKE1dH0g3b/OeSKEbGDoZP5FQKdhwUAZxyLJjN7Pa?=
 =?us-ascii?Q?cZC8moZtqcRvwJwXNoieibveKhOvjMf8pUbTiDCWhnUMm/uqPi060IbtO759?=
 =?us-ascii?Q?nKororJtKu1BP5/9a84kW9gdDkElDIZy6P0Et+WGr4tDaI/UMPMLc8oUmefZ?=
 =?us-ascii?Q?WaqwBpIsH2umq0CTzlOLmsgOA5LcFULrxRH+CuGPvIdVOB8T6kWRX/j0e99P?=
 =?us-ascii?Q?edgjKtJLdNgWuYlPJSpIddABfomOzkkDbCmr4BODG7RKxaxhL9DzH19PTW0c?=
 =?us-ascii?Q?b9D07fb7nlN4nR/aNsM/yv1pzD0bdXqUbIzv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wMuDco7m4qzEiyOtQSwNWmVgXY9e6QlbUqE5tXQLXCUchUiOUMwmm+bDdWl6?=
 =?us-ascii?Q?Eu4RsbB4aj53nfbOj4G4VB1dvvp59RhTEFoLKVybHO7SGtdF7/7gRzlk45Rq?=
 =?us-ascii?Q?nV72EJeKEEWdV2aLWsxx5xahh0aLEvqIr0mO42/Tcdu0M/5ZN+nt/WJTM+0R?=
 =?us-ascii?Q?bxXo7JRRfLChZR8CKorPjzr8lFGQhXh4SQb/yPsUvn7tVLRuwXW+8ujIERGr?=
 =?us-ascii?Q?8cXFt4gsxTeVMu7SZncma6y8hPLv5U09XMkIlvp4LfIY3sV9EGHZzChyOtSh?=
 =?us-ascii?Q?k7dgS9P6CTHO8Pdo44ezQcGGquTwy/XBtxT9oWWtygrucUOUfZU9/PpQ98Tr?=
 =?us-ascii?Q?y6IHAfqCMrnxfb3YI8n3gMMulz53Jelh+pp8ok8KB74kKqn3BGukjMr+ecrh?=
 =?us-ascii?Q?aHokeJQ1yVEIMej+DyXUPLIIb13C/ihQKAqFAWjhceDXAQ23/2j2JaGsWomP?=
 =?us-ascii?Q?OHR3a1vS1I/T7ZDnDSpw4BOesTM1a/MEcAav+gTAmJOAx+NXE1N+UkvGcJSH?=
 =?us-ascii?Q?x5VGAG36Z8MdGZVhQT475Dj1E/tJOGA8s/493a5M17VtOrGIO2LIdY/ppIfW?=
 =?us-ascii?Q?FjS53hjpywSItl5VJTLkWuWyLUhXcSxHMxkPcV/L+y48xsg/XRZajwappVtY?=
 =?us-ascii?Q?db2KWemANZdAELRX9EICWyFr/09N65JomGz+hjZXw9QciCKs2dyi6JkqidAR?=
 =?us-ascii?Q?SUSCajoX8XtPaadehJJYFx5wyRJ5rC0oQEzaHpm/GSIrNV0zJ/08A+k2l/Hs?=
 =?us-ascii?Q?DQXoaXghiKDNWMY0BCy9LBqZTH3y060KHTsx8l6JPfUz0vTDDdsTzPXFXGpv?=
 =?us-ascii?Q?reSYEqGXFEbFDcv1f85Ej1cyIE/lvIBAhJL4BRDtNj4VxETS/SCwRq2NJ/cx?=
 =?us-ascii?Q?5q1L8RIeYdozyOXe/9JmxIejmq4q/5YP5iBvGsHbIO1WYWZ58MW1JiHejI6Q?=
 =?us-ascii?Q?wqURifthKIx/jouL6q9xBo42fvQW3vmu9BmWayAZ/z3hezK3Sl0ZV9h6YZw2?=
 =?us-ascii?Q?+pGVnWIwEyffnHAzXFNcto8VxE88kztpqwzTc/gi2dPQxCQph5IFwMj4FVre?=
 =?us-ascii?Q?g0SlEN0sr7T4yorxXsUkdJrlXM2PLbQUUtXs4eq7S3IzLO+egiWWEAfKyqCf?=
 =?us-ascii?Q?xsiTnAVzhCIinAWYqvbxsmMEhhqvquQjg/orJ9r3ARKnWbHOjDM44MdWKI8U?=
 =?us-ascii?Q?pmMZFJ2gZDmkrl/8ZjzX+hBUhnh9xBpuz228niVDDieQBWPBH1I8ix0o+HTk?=
 =?us-ascii?Q?+nlC31RTO+Isy5ImN04ODEtMIWLZwfne8tc9e8RR7+kdOe3nwUTyhszT9iI4?=
 =?us-ascii?Q?OdszBHm0NMk0hHKPuu322m3kwbxnzMK8N0axtyieeP9p51t8tjAaSvcBkjsN?=
 =?us-ascii?Q?ckV/5aoo2sbdbotVoz98eNsuBpnFXvQoRlxDJSSTNi1TMv6MndUM/5BD2yT5?=
 =?us-ascii?Q?m4Rg8t5pJETmW9yDLTZzGuwg8nhxY6lroAuBlB2OsvgraMDC8zriq+Bi5qdM?=
 =?us-ascii?Q?RJ19F+7sT5S+z3dQ5HJcTEXAewisVIadgWPwh7VQUNHZo39sLA/EIO1bdE3j?=
 =?us-ascii?Q?i1aSvmFVU9ELeygUKXisQiz8BZvkhUVrT0lLTOlY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5dccf5-d076-422b-f28d-08de28c65970
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 06:22:30.2186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O8/NL55al4XedgVIlN7vP8Pt05+y2OOVwFJLZJgj/Ih56EaaEpV63RZPHf8s8JeUIWqM5AA2MAZm4hqHJ9J1hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

> Subject: [PATCH i-g-t v3 02/12] lib/igt_fb: Validate supported formats fo=
r crc
> calculation
>=20
> Add logic to verify that provided formats are supported before proceeding
> with test execution for crc calculation
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_fb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 92883a618..d802235cd 10064=
4
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4961,7 +4961,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc=
_t
> *crc)
>  	if (fb->num_planes !=3D 1)
>  		return -EINVAL;
>=20
> -	if (fb->drm_format !=3D DRM_FORMAT_XRGB8888 && fb->drm_format
> !=3D DRM_FORMAT_XRGB2101010)
> +	if (fb->drm_format !=3D DRM_FORMAT_XRGB8888 && fb->drm_format
> !=3D DRM_FORMAT_XRGB2101010 &&
> +	    fb->drm_format !=3D DRM_FORMAT_XBGR8888 && fb->drm_format
> !=3D
> +DRM_FORMAT_XBGR2101010)
>  		return -EINVAL;
>=20
>  	ptr =3D igt_fb_map_buffer(fb->fd, fb);
> @@ -4988,9 +4989,11 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb,
> igt_crc_t *crc)
>  		for (x =3D 0; x < fb->width; x++) {
>  			uint32_t pixel =3D le32_to_cpu(line[x]);
>=20
> -			if (fb->drm_format =3D=3D DRM_FORMAT_XRGB8888)
> +			if (fb->drm_format =3D=3D DRM_FORMAT_XRGB8888 ||
> +			    fb->drm_format =3D=3D DRM_FORMAT_XBGR8888)
>  				pixel &=3D 0x00ffffff;
> -			else if (fb->drm_format =3D=3D
> DRM_FORMAT_XRGB2101010)
> +			else if (fb->drm_format =3D=3D
> DRM_FORMAT_XRGB2101010 ||
> +				 fb->drm_format =3D=3D
> DRM_FORMAT_XBGR2101010)
>  				pixel &=3D 0x3fffffff;


There is a core problem here with 2101010 specially that this algorithm is =
a hash of the bytes submitted vs bytes returned which
May not always be same even if the image is the expected image since writeb=
ack will have some bytes changed and a little more testing
Is needed before you add this change specially for 2101010 case.

Regards,
Suraj Kandpal

>=20
>  			hash ^=3D pixel;
> --
> 2.43.0


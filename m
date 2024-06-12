Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F86C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 12:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D26610E0A7;
	Wed, 12 Jun 2024 12:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxhOSCuK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16EF10E0A7
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718194534; x=1749730534;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LXQCXAlwmL44ExX8aLLQXcTAn4G67ccckE/AEpZQGs8=;
 b=bxhOSCuKwUOHgUb3QqsXvuC7bZqkG4SVIr48OpGPjiQR3HeaDbjIB/V9
 +vUuc8eHI4PIpm9VqC89xAK6IZOQ4fnoyO98WHhjW+LMIucdsS2rq69Qp
 uR16JCvwnmS5mlGFg+Qm9bjW+u8Hk6a/K2M0WTnUjPi1bGS4EPf6eka1F
 H+VYSsRI6/T8DRExMeNNzYfTqedgFws2WspJ8/euypGD2TdQqKYm9dXJH
 XDhuj5V3oZyXCEjTO/lnljs1rc2NsabL1OOx0nxYsshNVMphMmDtKmNkx
 ZhjASAHvBH144hNNzhv+GK0hSpXy7qmmsHvNlMmlwVzAKvlybnWKH+PUF Q==;
X-CSE-ConnectionGUID: rBdi7SDISDeuXcsJfIkzuQ==
X-CSE-MsgGUID: KRrbFrYVTEW/zzjOVqGyHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="14789118"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="14789118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:15:34 -0700
X-CSE-ConnectionGUID: u/5ZSZWGTKeSzbPXQyB0Bg==
X-CSE-MsgGUID: YVAs1ilTSp2vQdYVWVjqZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39630324"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 05:15:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 05:15:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 05:15:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 05:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap9k9gNhCeuZqMwXZ7vmlc5wXdBxvTwNioghqZmAlbQW6rdVhPJMR5udBbH7YdoRJ8DwpsR+glpedrcxozldUYQfITKpL/Hp9fgi3MKv2WghGUCyE0TEJaBtb++kfumdX7eRijmnWRxF2ohpPHJC3w5VzhxnnFjH7dX3GuZOjWY7FLSO63UEyy526c4hTNvDOJxw8VUc5ZmL+fGqZuVAqBEsMvRhknz04+911AoFmFR++zJKeWAbc/nTUGwqnYpTXpjwTls+dwUz5vWf2BraPgMN5agNXSuC9yYZ1VuLdAxDD0+HrOpToakpzHaqyrBB0Rxop7HRXUMop+ybD2D7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujzjfcw5Gi4GU95SrG7AM7yAjFExaShsKFgUjfMcXVU=;
 b=UltulV0UhHpurmsRSqjy0aOv64Eo3WAy7pye+GxleJqoCzsSy+ScWPr0a59VxpvOD6iM+4ig+OFMQHr0r1S9MNEsbt/zmN6U6kNlPWpL3SCTEXAQ6uf4F2/z6y7Zv9ZME1aUXHdwfhySwozgWCWd8C0eFpJj4xvAcP+XqA2KsGK9PkunX7V6bsCVemnZGZmUPSCxbLlj35LXSvAkRMZF2MDmSqcjQaBdth+Lo+XzGRcjPGXBfWLVY0Rd1BzuYNIkHVJWwhmGxXUdNXXOLBAL5P/wXD9DERvOEIFrikjD2z5Ifg1tjFg8FJmven8Q+TigVlLwitFS6g9PehiAdBsdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 12:15:28 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 12:15:28 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 4/5] tests/intel/kms: Use lib helper to check the
 pipe/output combo validity
Thread-Topic: [PATCH i-g-t 4/5] tests/intel/kms: Use lib helper to check the
 pipe/output combo validity
Thread-Index: AQHaiXyfm8Q8upEtL0SPTjyihytQ8rHEcV2g
Date: Wed, 12 Jun 2024 12:15:28 +0000
Message-ID: <DM4PR11MB631270C32D30A7091782E34890C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
 <20240408061221.291523-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20240408061221.291523-5-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB8250:EE_
x-ms-office365-filtering-correlation-id: 061439f8-1afd-42c1-42fc-08dc8ad958c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|376006|1800799016|366008|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?0FjwzzNhrADM4VEgnb7h+zf04S0mWOnFiZZlubkraGhnmoJtte/ZJ7Hr8YrN?=
 =?us-ascii?Q?yQf7yHTjIbxxbFsAoI7RVWr0v6xGLG+OFJOD07i83ypLl8EJXM/xUYHrmGhn?=
 =?us-ascii?Q?i/EU2KJB9lPfsdk2aew/PWblfn1bJRLzq7zJQgvtipj2jpts/ocZxMByBFvy?=
 =?us-ascii?Q?vAezVIEp5CQqRL0NuQCW+GIUcPLG8GLLz8deIelq32ODUpLaMM65Q+tD5MEg?=
 =?us-ascii?Q?iqDBaxBkQ5OO6UBPvYK4j3LJevxXocO5YiabC10iG4A4h1x+hkfi35CTp5MC?=
 =?us-ascii?Q?tDtbsaVKMFCLoqjqcuaZRcVYfCtCUKX+nZzmBCPQx9eW7Bj14ObfaGekeSmV?=
 =?us-ascii?Q?4zDTd/rV7zFYMyuuuG447mtzwaPrcl1Aau6x21kqecoMWPEO1UUSO0SJyLpv?=
 =?us-ascii?Q?25FJPJOJ9o5dny15/NYdwcX8D2aceTcXDwtyTtdqqqKeZTt4cKUtWfwuZk1b?=
 =?us-ascii?Q?9zOdmZMOLb+f7oow4ggT2mG0VNDNfGtVT4mSH01PJcOKcODk0GZGYNSA/u0G?=
 =?us-ascii?Q?1Fmc3WqIKmKqXhWy6HsEOtBJd1ZshB7XWH04HYgwO1l5oNKUArdvK76esaeS?=
 =?us-ascii?Q?KkBKkNNw76VKZ+tajOfIbIJjBxPsLPBmToqOArlJyrnVQuk3M8d3ri7yfeLD?=
 =?us-ascii?Q?xb555Dd/v23euDNdR/2cvpgzYqQY2zm/P7TI8EXEcXSiSVK1jul1Fmz8h1/U?=
 =?us-ascii?Q?dJnz+cjG86lwFCNML/g/arOKBK1ZIUHeNdXsjv7PMFG6Z8Rb14m7CLyru2T8?=
 =?us-ascii?Q?yyw38JAoVLpPCLHh3n6nSi6B6pwkqEuCUYoeaYtqtJGORGp809KvC5g+NUSV?=
 =?us-ascii?Q?+Y3mLMp6U3wI6bVKg3c+vzJzbE2oKAqcQ+aU6RdWY//btm2gz7tqXBPV6RDY?=
 =?us-ascii?Q?QGyrkAKBT+0bp9fhGQMP2yILTJo1U4vb9h9CDUy+/vgZ4ZML1HfDDSnLcdn3?=
 =?us-ascii?Q?4rLfuAZOQ1kAK452cEYt+SLQO/vzj0x7XSChiN3EcT4X98ATF71OHHUt9EGJ?=
 =?us-ascii?Q?OVyR3bLtcN201NCKnYz7O7OnIhuDoRH+2Hm/aH/CveiNK/gCq6PSXaBD7SQg?=
 =?us-ascii?Q?rQkTK1aEpneM8+O9Btjl8lZeq/dQqqI7BgJcRO7Hpon4bqTXuPS9j5sUVHtS?=
 =?us-ascii?Q?miDPGvVXeYy3TCado3pOonfPfDhm2DaZzoE+CXFIpL5hwGt8/iw5Q70P5WCj?=
 =?us-ascii?Q?/hf2Rp5r7cJeENBgI5ULuE1pjFSwsLAVlmu3TV5Cp9wIchzzJaheSY2KVgYi?=
 =?us-ascii?Q?u/Kg2wD3BhMSPz545wdSsZtxPaqQSUQWukGvFyAr9/+NIsaLnESPMsId8R7r?=
 =?us-ascii?Q?NoEzNGGF6tqYY+fg98cWUYhF4aTEoNPhPMd148OB7EQLG3jOe6+4E7YJqynr?=
 =?us-ascii?Q?TXK98rE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(1800799016)(366008)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?026vWeKjhzrtxbPl+D8OQrCb93W66giX0MdTvJzgthMsiupKQmylTz2dKSx3?=
 =?us-ascii?Q?u5hHEeW5y76yH65ssGX4NOvq/IRAtxIXmGCvmCN5KacvYX58ZXvdQIc6eEe5?=
 =?us-ascii?Q?aEyn0NpUjy7C42IpHql7qFSEooG/OcEhr8DxPBhYNbib2oY8Sj335c4AdtLt?=
 =?us-ascii?Q?5shq7otXF/ZW8rI4ynX7MrXathXGA4GZJUhfuWs8RxH4WVdhshUI/xZZIUla?=
 =?us-ascii?Q?mI9bgAC+rVZMCWD6Y22LaiBPBDQos74EiCGAQccr5nKWgxWNqpwehk/E8u1D?=
 =?us-ascii?Q?5pxX4vtMH6KtQqBiO6GGMOIRpTRU4bVZCMA0TR5ubEMy2b/skr8WV4Su93Up?=
 =?us-ascii?Q?uq520e1KTO7OE5xhCB56p5q87qXPtKtQdbW5tQP1i5uU6orY9bBVnEn6Wi29?=
 =?us-ascii?Q?zpGPhMAWs983qbxS4LrdwzYRv/y4Nf/eutbsYAMvZTwxT8GMvt5I+NDgHspL?=
 =?us-ascii?Q?bBErKW90PIbYNoLdY2jiSTsosFczTTBjQwdPaDkAchRnFDiHAusoxNtE45Y1?=
 =?us-ascii?Q?jTMVG1aDoG8MjOzE3H2Kpf3vI6LpzSmz7SW+4c1P3aCEsmYungmlRhOeXI0o?=
 =?us-ascii?Q?qn2uErWNAu1nFYExuSossGm+e4NYxDhOT8SgOsRLmbrGvmYgUjuVB19Ej/aI?=
 =?us-ascii?Q?RDhT8nbuHkE8X0tF0EoFRBXuT++qebHUUyZ6tlW/2wGS6L+86k7zjj4EBf1T?=
 =?us-ascii?Q?w0tjDM+xrL3+ua5D8/yk00iIkel7yWSRcozyo+O4QJZvpWWGOvoH8w5w8OEP?=
 =?us-ascii?Q?bY3gP8dROJDu+5SF04OugvBq0zqhRJRuPQ7EfJdcX9+A4+Ipb7WgDlAmdV87?=
 =?us-ascii?Q?nNQoSs08hNIICT0yoTj2ViGnkAbwy8Pi6px9dZhawYQLBetNhFGbs0ZI3x8X?=
 =?us-ascii?Q?VpuLiGoqCN5VLiALswudSvcVvrMJwJtLZ7h/aUZ+daf1QsqiKUF6/ymiPt4Q?=
 =?us-ascii?Q?IwrSFkHun374YpZm+PiPNJtEOraN7VRcwx/7leTTVeXRgawtrlnOzExdOdyG?=
 =?us-ascii?Q?QHhThENSCxC+7MvsApy2TaG11FuQrC/EpoGnC55asoeOlHG3LgMUih9LVvfb?=
 =?us-ascii?Q?2Mb+dNvHOv4l/REnsAO2IpY7llGA/sW4I4raJXLfyiOLAnqOJywQKmHZNRRP?=
 =?us-ascii?Q?P1Z3fy4Mwkh4Iv2zJ9vzVfva8DyCZ59y2BUJObVcLPrM4RLofE5HeHBtEgD3?=
 =?us-ascii?Q?ZfMebyM+KMT5d2lnNTgs3ZbeqPUu/921ibTQP7X49oJFLBHmiRHJZXMeu/Pf?=
 =?us-ascii?Q?zPl+ev3NvCGOG/5pcsTRCyXZnFLGWav+LA9kpr7lzbDjWBNQg5DOxXzxqu5Y?=
 =?us-ascii?Q?MbK1h+wIoaGIO1/lfe4Kg9HI0CGQvuD3aDO8x49zbGkYD0HCiilYqKptr7F9?=
 =?us-ascii?Q?BRKFgUm852hP7feJVCxuqpFXEZJ8wmpvm9pdTN3EU6LuwhLikCmv95lqYJsM?=
 =?us-ascii?Q?2CN2MUUIcMiaN3pReMMmPpGH5HIRate1KmcHmrQyQrBwYKbOkRYbW3CoBSPD?=
 =?us-ascii?Q?gDycXng8YPiFt+SJNtTZP8SGTwWwR3c3mWNMGGVMyRfQQRIy1w7imXQK3NfG?=
 =?us-ascii?Q?uKy4x6TcHEuCxSzcFq3oYC5KY1A7XqjoT5x1lA1H?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061439f8-1afd-42c1-42fc-08dc8ad958c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 12:15:28.1069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ge6fd4Mm4KWcV4+EDhuOdyw7E3Z7hoLEmo5EGWJn2VdvTnGrnr0cJTNjLPTgFE+CIW8xaxXtWg+9GwE4Vr1Shg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
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

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Monday, April 8, 2024 11:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 4/5] tests/intel/kms: Use lib helper to check the
> pipe/output combo validity
>=20
> Use IGT lib helper intel_pipe_output_combo_valid() to make sure the selec=
ted
> pipe/output/mode combo is valid.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel/kms_pm_backlight.c |  7 ++++---
>  tests/intel/kms_psr.c          | 17 ++++++++++++-----
>  2 files changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backligh=
t.c
> index 2e691dab0..8672afa7a 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -234,10 +234,11 @@ static void test_setup(igt_display_t display,
> igt_output_t *output)
>  	igt_display_reset(&display);
>=20
>  	for_each_pipe(&display, pipe) {
> -		if (!igt_pipe_connector_valid(pipe, output))
> -			continue;
> -
>  		igt_output_set_pipe(output, pipe);
> +		if (!intel_pipe_output_combo_valid(&display)) {
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
> +		}
>  		mode =3D igt_output_get_mode(output);
>=20
>  		igt_create_pattern_fb(display.drm_fd,
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c index
> c90612426..f3caa9ecc 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -728,9 +728,14 @@ static enum pipe get_pipe_for_output(igt_display_t
> *display,
>  	enum pipe pipe;
>=20
>  	for_each_pipe(display, pipe) {
> -		if (igt_pipe_connector_valid(pipe, output)) {
> -			return pipe;
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display)) {
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
>  		}
> +
> +		return pipe;
>  	}
>=20
>  	igt_assert_f(false, "No pipe found for output %s\n", @@ -750,9
> +755,6 @@ static void test_setup(data_t *data)
>  			      "Can't test FBC with PSR\n");
>=20
>  	pipe =3D get_pipe_for_output(&data->display, data->output);
> -	igt_output_set_pipe(data->output, pipe);
> -	igt_require_f(intel_pipe_output_combo_valid(&data->display),
> -		      "output pipe combo not valid\n");
>  	data->crtc_id =3D data->output->config.crtc->crtc_id;
>  	connector =3D data->output->config.connector;
>=20
> @@ -763,6 +765,11 @@ static void test_setup(data_t *data)
>=20
>  		igt_output_override_mode(data->output, data->mode);
>=20
> +		if (!intel_pipe_output_combo_valid(&data->display)) {
> +			igt_info("Skipping mode, not compatible with selected
> pipe/output\n");
> +			continue;
> +		}
> +
>  		psr_enable_if_enabled(data);
>  		setup_test_plane(data, data->test_plane_id);
>  		if (psr_wait_entry_if_enabled(data)) {
> --
> 2.43.2


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FAFD4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6510910E261;
	Mon, 19 Jan 2026 05:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1UHP6K5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27E110E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768800478; x=1800336478;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bfU4K52kDrY60DnXEVIsQXoL2d33KGwb8FWHgNM4CRU=;
 b=N1UHP6K5vs7EhvoAPYyayzRt6RC1WJ9pl07hMafPAyHzLlsqeDsaYHBy
 bh3KKotjmgc5TaB14YDxeRSXy8QrPaocpmrpPwmne43/cun3alyM923aB
 ZwDwEehS3NHI7rORp8mU8BigxTjWHEgJa5Fgt0MfJVvcPnrfl70WRCxWe
 ZUaCWjw0XjfQgXzf8saoMQXCSqtZShc+aUBEzb0BoQnsu1C+9bpwFE6Dt
 2CCaejLSPbtdbEzBdBka3aPYGrJ/POzVTcNLCVSm4SIAjqmJePPze7wYd
 DTXy2HE+JDdYN/XjJa3rCr6g2LtSAZuBZTUFzIbeZ53/IY0cQGJnhvKuM A==;
X-CSE-ConnectionGUID: PKtgCLECSv2IvPLVuRP55g==
X-CSE-MsgGUID: fgbOAFwrSiWoBYv4n71LAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="92678183"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="92678183"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:27:58 -0800
X-CSE-ConnectionGUID: pAICQwvvTcefVIFHk0Xfbw==
X-CSE-MsgGUID: PHJXb+DeScKX8UB14Tc7fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="205674966"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:27:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 21:27:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 21:27:56 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:27:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQ1sdcmp15Vi59ceoxmuL9n8k0SK8N2W9/9pqWVxWcf2lAioNfxU9hxaA99iR63bqQX/6o5QYWlMaEuQNcmLgX8fqZ97dORgZGzxP43/I9MvlGAJjD3tYarmCwIweBIhN9BIdRbj/JiTqBSiR7pWddSNUpVtjl8cmsNQCxcWioSW9if1barNttFwTfhuC+SbeV3nqqMnCVTqoXhnEFapKuFWrPtbVkgoq0l2IHI5VESIFDSZPDPKymE+NL12qn4KBdmeSNEtp+gUV3lPGfjdBzpihseQbwreAJNtfzbg3rycevjYuUgU/SxG3c+NdM6n7NPVDqc9H4jTlge1KWO1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0MDUHh0YH4YXP2e9Y5djK4lh1UFz9+ty9c536ot7Y4=;
 b=e1xK1cyWLvPysyqug4B9C66bmPbeLQFg7I3V+d5BOQ1iRn9GZFuT+3jb41sH6dZDs7ay4sajzukwh336Qztpv68PIlavyxjTjKiUnc8DQX1amD6CLq9QbTStj7B235g29BQnFMNdZ5EYS8FzLN0kuL6DNOMpwnYjmtUZC6a5fABJOMrlywerTsXtkMm2XrS7mgsQGM/QKR6rQPxU+SwymmXUwhCcokGdGSeckjLYJrUwnDcY33W33uYg5IW+B8Wl1WQSy/eoShXXzgNbGRpAps9Ct4TLNpMmxVWSmYp6Y3A1p9M/QqFj6jRWvgaRs0cSd63gxqlkhhaD5Ingdj6zag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB7504.namprd11.prod.outlook.com
 (2603:10b6:a03:4c5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 05:27:48 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:27:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 8/8] tests/kms_writeback: Use helper to fetch
 default FB format
Thread-Topic: [PATCH i-g-t v6 8/8] tests/kms_writeback: Use helper to fetch
 default FB format
Thread-Index: AQHciP7cy595VT35OEuXZvz7LS1y77VY9lQg
Date: Mon, 19 Jan 2026 05:27:48 +0000
Message-ID: <DM3PPF208195D8D649D1FCC2920001093D2E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-9-sowmiya.s@intel.com>
In-Reply-To: <20260119050732.110985-9-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB7504:EE_
x-ms-office365-filtering-correlation-id: a622b6ad-ab02-4281-016b-08de571b7be4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?d2LdIdNnkIb1L7b297pqqxishp0HHv7YtO0oYRkj/gmGf7ezTutAePR/pD31?=
 =?us-ascii?Q?9r0CaMIhGXV08+iOOLGVMd9lALRld9zAzdn+Xg5+eT0cZQLLGKKeltfnChqp?=
 =?us-ascii?Q?qsczlyzxow+mr9idiDM++p/Xzo9AmctvCWkPEqM1+LJO8M8d7BKsA0e0eYqU?=
 =?us-ascii?Q?QKcAMZp2Z7G6kpTZE2TTZA5b34RFWbkgGSVi0f0vBGRT36xKuWkNTmHrcIDM?=
 =?us-ascii?Q?Yw2QzTomMFS7L7VzOxzjte8X60B7oMURZQLcb98KoZ7c2Z8c9KlvBmbYCsqX?=
 =?us-ascii?Q?fagG1FeMqzJzmTt+x1dhUg+F4xYhFF0Uny6rMtSBfLon2XGCNWWcxR1e8NJn?=
 =?us-ascii?Q?j/oA2S/69lPvL92C/Vb5/PCI1MEB5/9u2yTjJCw0cJA7MpYxYqMEcOHGaNYo?=
 =?us-ascii?Q?VAQbS4Pf035oaXDZeFN0KK1jnjKp78GpJDXUyXD0rYX3d2pA6IfNkAFJeEik?=
 =?us-ascii?Q?wl2j1RXQbovxOYL7ut+cYGoeIN2ct6lr/Rx0VD71i91ZWhgE11bGZ3HkIHO2?=
 =?us-ascii?Q?BSR/mKVV3PPrr2Uk+oI9XsQpxZ7jjHvBQDcAyQJKNQPmeFLzYJQ86hNkcoCV?=
 =?us-ascii?Q?EO0ifxuKr0oQ2e6HE0KYFLJ5H/hHDayWv224Ska8fIMsjRsHATqxfOcXn52I?=
 =?us-ascii?Q?fihUHLEkEpJkvLocCmoxOD7kmeaTkJON8uuWSyV4wZa6IqaSuPfD8sUYzZda?=
 =?us-ascii?Q?2FnZB1NlDtTOeiKwhzEqKDzFYWRWDVDWVD67s72lSKX9Ivn8AzsmhLuCeM3L?=
 =?us-ascii?Q?iuYYFx5/fCLumRyNbKdoWK3ojIa1WRni5oSGuMYqt85Auc1Cy5h3Alou5ChF?=
 =?us-ascii?Q?1sKtB32h532XtDQh8sy4ux3554Sx6dDLOXuUnzlBJC9kQL2mWdaZKALVwKMb?=
 =?us-ascii?Q?LQkzvQZBzHwvKUDK143xeyVCbmMZSmClIX2YSASvkTUvzr9hkwKrTkWsBDzz?=
 =?us-ascii?Q?SRicK9umuhhV3FSj71NajqwJvVOdjturuXUGEDYQrQhSCvBTKUJliOG0JHeq?=
 =?us-ascii?Q?7DyPzIDRydCvzR7ZUHuVH+d3r/EdWGGM0Hg0qVkwhsittROm5dMso/DW6pza?=
 =?us-ascii?Q?fipNHHHFkfC7po06FH17Q3VduiT0dfIqEvYWhXqydJvoyr784FzY2fMLSNvO?=
 =?us-ascii?Q?2uOEsTWwtfh86xRDdGqqLqOzj94HBeCanRDtGM6GKWmG/9nnw59RRv2YnXZa?=
 =?us-ascii?Q?eZ21+64KSHVsUDZ2Ntftph7XypHNsCt8uFlTJNMV0WSPcrkobw7BJe65sNY2?=
 =?us-ascii?Q?yhKwZh5EgV+5hGmJLihNyQPd5B0sFrq2EH7jIeLHbR3W/shdV9Z9l2HwUtdn?=
 =?us-ascii?Q?qdeBwU1Hq03GvOw+YquM0mBobUX+KNb3EwnkDXS6yHKZ2WVP0Vq9QtrLE/H9?=
 =?us-ascii?Q?m7OtjFzSCYQMzrXwc+U9Gxa4vy3rWRJu3r+pHDfYYGxPRmlqBZfi5bqfl3wJ?=
 =?us-ascii?Q?WyXCYp68qrbVzr6IUad8t2D4+6pkW8QntJWS+FVJtLaOVqa7L+Eow0UhsnkQ?=
 =?us-ascii?Q?8lEgyqcOT/n1XUEjf750jE1/rRe82zPVIKfZ9ERrBdggmo29B8hQK/bE2dzk?=
 =?us-ascii?Q?ABNGY6xhpsnnMI0BMzqle+8UGnCwkNHL0yzdLaotSUYMb1/Va7oS4Kauedrg?=
 =?us-ascii?Q?wnpQtIsVK6rhqjt59l/gf1g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p0fQsUQaMm2S5v2E2Oa1LPQoA0KzpRXVY827gmEKX7sRfClWhHvZdcjca+2F?=
 =?us-ascii?Q?bdTxKusmdu6rmfCJv3LJIbG+h0F308ngp30SzzJXCvxNnZlPbp421uzM3naZ?=
 =?us-ascii?Q?umcMNUqutkh/E6FQaKkwXTz/FAGkFw2Ia0lLrbh2ODfQPERkHlQSjUT0qNbQ?=
 =?us-ascii?Q?fCQBKUaD1Wko26qEz9oUD5MURsKs6+QB5NYRnep7vOxkT587gCPPnBTHgei8?=
 =?us-ascii?Q?T7mBqt4NgAcGs8K3+jXWiWYNPWIzGp4AobqsaBpoHThFsc1Hq896CQ61RpgO?=
 =?us-ascii?Q?H4AGuTb53Yej8NlQbEFaXKzTh9uQ9aJfuDLotUsZUtM7VKYKXD6MeYYWVDTY?=
 =?us-ascii?Q?V3v3HGjywX06MTd4PxacoL32jbepnO8vTsBavTwBGRXiQZn4CVSAamC2XqDw?=
 =?us-ascii?Q?e//Cv+MCZ+vaGZ4nrWWmqlRSIGX7mYAoduz+gjJhQIySYIivsaSwDw+93Np+?=
 =?us-ascii?Q?5AohzK1YfYMrX1akmDTuFiZx/j8aldbB6LIGzrY8OUmr2Ooqh1V3Lvhay0OY?=
 =?us-ascii?Q?bn1AvVUmpXTOibOZeeJq1azidg55hKzJq53E0OFXSjcZbF4+OkF9DNLdsGNU?=
 =?us-ascii?Q?0xrqLOwbN1Ok13cDNtiOTqPdKKKebdWCnNmM+cNnTFMxWH7Wmntzh2o2QSOQ?=
 =?us-ascii?Q?n0Ps8oNcasCsq+p+IbNumTzdhUejsdjIOrtYouG1mtGE+kGPabPT/srnlSq3?=
 =?us-ascii?Q?KHE9EkpEFwi1/uNuN3zJidWHDGN6xADtVMpW5Et2Eab2TtwHCe7cpFl+Y0sP?=
 =?us-ascii?Q?4UdHUQgvLtrbhKA2Zl953wPQZ0+KRdCshUbRwt0zmKKNkvnUFVVJI1y8HlAd?=
 =?us-ascii?Q?Ou7OADNfGqE4S3rsceUl0mEW7Ek571pt8Ts/VAqIuT8nNAP4xJR8iF0IGuwK?=
 =?us-ascii?Q?i2jrRQeOvq3l0qC/1sGszl7SuFTy8pYuj99sgKh2oC57DLH/qak7q1S3odOd?=
 =?us-ascii?Q?+GsLuZtIpRqem0O67uBi52Wn3Yx83fq2hZuFggIx53omF4yDlCfh306+znFj?=
 =?us-ascii?Q?2jgf6wXtJqHcfR24uora1yfGJcAyEzffnM7OAl3nAY5urwoSN3PtS6eiHAVe?=
 =?us-ascii?Q?VfO+RgBUvDonEU7+q2mHVoJmxSSlD2nEOAXVwAgZMR5WGnAmEdjubOB2wogS?=
 =?us-ascii?Q?ydASKNM2U1N6Ufa+W0eN1zAUtmxu4oq83a+pv8XJZvllqkgc8bci2R3ESHO0?=
 =?us-ascii?Q?T1Mcek/BJDFKsS6tZDBeLVcR0RGAgqU4V64QYd+tBtmQTHFxNgFCwJuUH1GV?=
 =?us-ascii?Q?NrTxMdRXlVDO+/X/GWKIIONius6YS8mC86F2MpeRmQidtOwgtTqRRQJvAeI4?=
 =?us-ascii?Q?qT1VgYJvZdtMKY2SvTdcGCKzd1W95rvkPweSpTDYVophvUli8ot+wX04595r?=
 =?us-ascii?Q?wjKS9s0K9Tms55m8APLc1e4KGnq5ku8Otb3Ue0S72qibrXvjPnQFl46Y8sxB?=
 =?us-ascii?Q?l8LCr1sBS4BWEntvw3STZ+Tv4kyrHlDAaYfUp3jpn9//szNHSavbpMokFeyi?=
 =?us-ascii?Q?8d+C4oP3vLNiTrlfnwmTw9DzFJrB9gzG7kvoF9kg4f9IisD/gY6Un2qb0N6Z?=
 =?us-ascii?Q?7gCZA9CK4wipL0sunLzE6Ef+McmwMH1Y/7jtNKnkTip0DVjHdJScBZ59jT/K?=
 =?us-ascii?Q?AmtEpMekSmCuor2k5eB/GrSMhp9vIUQ0bsSMI2sFJXmwdZiUVhXnvLfkXIRQ?=
 =?us-ascii?Q?NXAM4sDQ7A7Y5DvVE3/scfE2V/wZtJYrsu6qF6tatNOL4XKUDpEDpBtdQZMz?=
 =?us-ascii?Q?zNRQinXr5A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a622b6ad-ab02-4281-016b-08de571b7be4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:27:48.6889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ag6vlw65v7LQnF1a716ognR3AC3lF/bs8oDV26bpnVPlL1jG8bls6kJCGlhVXgRvHFuTIGos2hKNWa3zsrSmAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
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

> Subject: [PATCH i-g-t v6 8/8] tests/kms_writeback: Use helper to fetch de=
fault
> FB format
>=20
> Replace hardcoded RGB default selection with a helper that chooses format=
s
> by requested BPC.

* "Replace remaining hardcoded formats ....."
With that fixed LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 66da5603a..5d41a62d5 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -685,7 +685,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  		igt_skip_on(data.dump_check || data.list_modes);
>  		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay / 2,
>  				      mode.vdisplay / 2,
> -				      DRM_FORMAT_XRGB8888,
> +				      get_default_fb_format(&display, BPC_8),
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &invalid_output_fb);
>  		igt_require(fb_id > 0);
> --
> 2.43.0


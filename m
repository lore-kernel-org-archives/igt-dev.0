Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA5EC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 05:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951D210E1A1;
	Mon, 19 Aug 2024 05:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JALwPTFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2280910E1A1
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 05:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724045015; x=1755581015;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=saikvqGxYSrIczbXuWOuB8rizy4sxrNvU4B83KR2x7U=;
 b=JALwPTFT7xRD2ApVy1bQbND6P+Kx7tFEEtYZnXuE6ne17F05jt24x0Ts
 cnLNujNjcajS7iVSubagXnLeYgv9gZQ9AtPm00Cfk81ZAv8AItKz5ekz1
 hVGtw3e3JuDr2ahazxCsdDE3XNDJ5RiIN/mLZDG6HF/TN20TD12KyWmrF
 SuFKJ/Q1kK2x6tSxt8gmfVTCrPKbGirpbOoVtSy+BTijGDp+9StT5tVbP
 g3vRNiZF3B7wFDh4K8s6ej1QZ4RO9Vfxt9C9z8bMyeX8MQSynsK5HZGhp
 5Y/5PP6mIopuYTwIt9Z9HwUsewE2kUSLOeizj/sgrjcCeILMPqU/fvd4a w==;
X-CSE-ConnectionGUID: lphoxcpZS0qDpj7kh+VQ5A==
X-CSE-MsgGUID: MhROcF5WTPqM0cPV31DeOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44793840"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44793840"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 22:23:34 -0700
X-CSE-ConnectionGUID: znsshnSuQNWUQLvZBh/WNw==
X-CSE-MsgGUID: /HAd6p9JS3ai7HDeIsxNvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="61024990"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Aug 2024 22:23:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:23:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:23:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 18 Aug 2024 22:23:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 18 Aug 2024 22:23:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpLZ/KHLXk114zZD0rPZD8nhQGcpgvmTU3hUxJ2hYRe4yYDuw4Mz6TkytLuiXxzhDNZ1FcBNYa2+QD5QWz4NpTGrrKte9kHzE9G76EHfX4ufiPcSuM2OxE/qLp1mEELzr2jMSHrsTSeNqn7692W6aYyBl1wKdMHCfQODRNfnhnDWJZ8WxeaK4HbyTXJ+HAtfUsnIBU2zJXhRGFVVYANdNEJof/uhErc77RD3E9aqErgxOaC34xP/oFItx27UNtZyqab8bVhqtkFDdhm+UcrYBY+XDx8pYHQjbxVZMyydMK1j8DntRoJpPxZNHpsr2KlUDgZwpasspp1Hkq0t0p1qOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0aBV5xQ3MLP2lrg4bowhOkwZ3ojyoMYnR/hMK3I5Io=;
 b=n5UE1L7BAahNfAZhMU9XHRyI1iVKZaCqte2xae5JnANJI0hOFMNFwCt+cIeOeaGYAdENBPZrOVilY9iwUgtSP/9OmilIsK7X5QXop4n4Zg+1CkvdAcfJSztVkhLgeLow8Cfp62zGQVXmvyyvvYmmFVGnymsJogEAm+OLtWkqQ8kwTALYXlQLndTbBBx+rEkF+tgXxqpTH9KA2g6yxLjund1AyuqsTo+GVCGU4wtySX/sm3m6KJuWvvZxgBqoAq/tNcdhJ4VMMaxclO9AMNc3UP6CYwC+jffxpP9/1cWvLJdHuXfOpTiobFxfK8Lr8/r+5Fpg4SzDbj7e5OEkgjCBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Mon, 19 Aug 2024 05:23:30 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 05:23:30 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t 4/4] tests/kms_content_protection: Set screen
 red/green based on CP Status
Thread-Topic: [PATCH i-g-t 4/4] tests/kms_content_protection: Set screen
 red/green based on CP Status
Thread-Index: AQHa7ThmGF8JtBU6D02ACbwISqvncLIuFPPw
Date: Mon, 19 Aug 2024 05:23:30 +0000
Message-ID: <DM4PR11MB6312F43FDCEB15884441594D908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240813041936.4014668-1-suraj.kandpal@intel.com>
 <20240813041936.4014668-5-suraj.kandpal@intel.com>
In-Reply-To: <20240813041936.4014668-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CO1PR11MB4785:EE_
x-ms-office365-filtering-correlation-id: a922b96d-4497-4def-fd55-08dcc00f0ff6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TUGhSz7I9x5r+IB1HlxIXMsa8x/gZfQ45LmWpWUSYcNqDcRdAGHxU9Ct/T66?=
 =?us-ascii?Q?1YJbHaTjgf8qXy4sarAdeMpqZcALJuz2HsFTCNONJcxuiG7kL0fgb0L1DxAo?=
 =?us-ascii?Q?V8SmY/EKWx/tmYvTloNJ1ChhDkRxSfbSBe6dipk68fq1RqVyb6pUOyt6NjnK?=
 =?us-ascii?Q?2J68GnaxhOle9DqeiOX3UhtE8e5Ht44yZEdOyR0CE3cznfDEi5NMVEZxhGnL?=
 =?us-ascii?Q?qbjvKQPMDFaRCm1vVadTnHgPL1MJdgFTIqc6P/TkKpKrUxz4acrgD+YarAkz?=
 =?us-ascii?Q?n2EJvScupuF962Hp5D1oGhOYyFd5rN2qaM2ZxPbdqSXzd9nlmxCVUJM2xjhX?=
 =?us-ascii?Q?LMYk8etgijPp7Eys4kmr1Z+sMx5VmlcHFCTDPzCoHM34XoGF679aVB0TflTk?=
 =?us-ascii?Q?yTElfv1SjrR/Gi4sHmW/1vDXS9i7DA24k4Jb9PPt71gNVPaqQLwDXqdi5all?=
 =?us-ascii?Q?u/bJ1QZ6HLIx1BMeP8XB29NuRiw7vdQvXUbtDkfjnRE3wJ017Tb6dxVJ6f8M?=
 =?us-ascii?Q?HkhvEGSpUbqj36i3+LylT6Qme6kwcQD1hoDGV1OYjswvIksvP8SxPwtP4wMV?=
 =?us-ascii?Q?J/79gtC07/ti0/wRFdlWAvLZNxHRcypQ/FgEtRGBpjdP8Qlsb5rQpCTiMmfJ?=
 =?us-ascii?Q?Cu324qVxEb8GtslPoq6MTJlCsNAoeAVkqIrxwNvlzriT3u0MkOqn31iHKHGA?=
 =?us-ascii?Q?v4YcrWj7AsxDRdC8jXVxUHiyKbaxMT9wodGCdjfmwcx09V+Iz66SyUPUWkXt?=
 =?us-ascii?Q?h2vlhNtJ39stMWFTcPjiStbIgf/bL7w+lV4wJzTvRlVrLpWeLbMDgS1QxaRB?=
 =?us-ascii?Q?mgNXbIMf3hxrMxjhluoJIP3rNXfwiTjtrEPgo1NoiYroUoAaTMw6N5FcBtiu?=
 =?us-ascii?Q?igI5xFGmy+tW8uSfMEs5GcaEbkBI3HpxZUQPwpoMQKgUiEDMLkof6j+KvfRM?=
 =?us-ascii?Q?FUf1o8EDx5qtXwKyN1LxEA7tKrsJ7UM8zeX/apTB/Gt3OhJnOBwe//A0fdxi?=
 =?us-ascii?Q?9coF+NoZf1N1wMS4TL1z64Zpqr+29cBFyA/y0TZeCb5MnuTAteJ42rH5ZwV4?=
 =?us-ascii?Q?U1jWsLM8qnC/pFbjpUabUQvTz+1OqAvqdOxjrFwR/8p4s035boXl0tn6RHxP?=
 =?us-ascii?Q?Lqt3cpuizHu7aXOGEwsIojCIoLq9x6N2gkQr1xL6LWgXmr7eN/XLCXkZCs6m?=
 =?us-ascii?Q?PCaOY9Veo0Hw2VIIlMN0QVy1Xl3/oQzszio1SmNNNiq3H+iHv48eTxLzzlh7?=
 =?us-ascii?Q?v3Coz8lsTUN6rOCyHIY/VDVY1y/5+BowBGMuyroVKYOf5UzU9gnHDi6cDM2Z?=
 =?us-ascii?Q?zZUJlDDhxA4nj4T9XdNbYrgausoUPPAcLYPtx829YZf6rszxPCHCpoECgNOT?=
 =?us-ascii?Q?WiLoVbFbK6eCDlqFVKwYB9ExnCIqMzR62ABBjdRGK6D/LyjoCA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f/mnZhLjlJuvETBdSTlNyERczLPc+ysWcXmON0UvrLNILnhoJzXjV9UJOCdh?=
 =?us-ascii?Q?knZc1zbaL6Xj9b5giSPHwz4kDPFpYyQp33AbrByl+ZfPZtrINdicEe1St4wT?=
 =?us-ascii?Q?ZBapriguh4auvef4LnrbxCNjRgeZGJEvrt2ab+tQWO6h7Ial5s7l1rAzebCk?=
 =?us-ascii?Q?7I3zjZufmQh1uZBMXAGV+vCmtBUwI0cxwX5jg3FeVqmwbvcpdYkH68nrrUV4?=
 =?us-ascii?Q?3Zo5PbQRtF4TGvT7wTOeQJ11VUhes175K41OGc+/QFyJRL2xaODZMcpqwNgg?=
 =?us-ascii?Q?MJC311H+1M7ZRW/eQOLUsOP0Twy4XHE2lWv/t7AxRinGfkO5xICv8RLM82bv?=
 =?us-ascii?Q?xlt5RIExe4fDNYltDT5VBtjOWn/AZYb4Pwz8DpzrRroT6pJ2XGkMhcuJ5yV2?=
 =?us-ascii?Q?aat828S/oi59+bfA6Ba17ub6r6GTdkNdvdI2DzT5evv/yceiy+ewtQNdT7b4?=
 =?us-ascii?Q?6V5lOIXpzPj6XOnNknMMMuSD9FNsfRn3pacL513AXDruJDakUl+urmXmEVVP?=
 =?us-ascii?Q?xXpbGqMVoSpcxoFcV5u+IarVKCIMQ6VeI+DdB+lulT/83DvkOoKlrzvaDquP?=
 =?us-ascii?Q?Y7BleGhBCekdjum4i4u63QK75xtyI/r7rpt9Vdou2LCqjIfRkB/XGkI/wJGX?=
 =?us-ascii?Q?yX7j/mQq8E+4L2FZ5zTMhIntzLO3JocsbIDtmbhOLHh323L4ZTzv2lq2/WKW?=
 =?us-ascii?Q?imo9bfYj2L5aifygBLFyQB03ygTqlhKUQ/pCC9By4gIe4NU+uiEd1bvYKhSQ?=
 =?us-ascii?Q?8gEx5BtTEnfBCCRjvp4BAp8EKt980vH1/hZ0lh8jJ25rGa7Oqmfpt1yAS6Ml?=
 =?us-ascii?Q?xp3jmCOm3WPblCOnzVJrePAfpU7P7H/SrKge66YKTDR6PB34xoHaJkmZGb4Q?=
 =?us-ascii?Q?9FMMuR05J9mnBxI2uWeypIleDSmuiGCWiJ92yb2zwmbTsOxmXe/ZyppP/m5z?=
 =?us-ascii?Q?kRATaqfFS0FexDgM4A97SwJOivYJJUB2UpZZrDae7lkbMA4Da+goTy7r0Yr/?=
 =?us-ascii?Q?Wys7nh769rkM7XpeAQoInKIlpOfOIMN05R2yQB87cWahOZ3nf+Gg0tQgroyr?=
 =?us-ascii?Q?P7qSYehRrFsLTkWkOi4V+5Ume2+gRHXubvovSotOHIWb3tn6Rbkh5B78vs1w?=
 =?us-ascii?Q?zp5kpCapOayINGJJSWsQOFoIyM62XikfRMSdvOLh0sA2uGXnZNqSQhcPWzxM?=
 =?us-ascii?Q?0uE+RD25QWhDTnyuiN6QXFomgNf1Vqa46I9mlG9RZQSX94joTaVI/0A571Wo?=
 =?us-ascii?Q?0lp3lTI0wujs3GOzxcoK3n+fP95LeeSZUOz0EDVHpYe7Ynrl3/WOZOsXFkjc?=
 =?us-ascii?Q?hHq3obLSKQLYghKrxlxomB9Eb43yGJxyG68LxfySokYIQvlJStpl5HrAJvGi?=
 =?us-ascii?Q?eT6tUffR5/72WG9G/U2N8L7CHeMytlsu1UgOLgWvnxgyGFyTZNqW1ivJVWLl?=
 =?us-ascii?Q?sOhLv8w+JItRLPGYP+rWD2o/HprKQxQG3r4tE9mpB1fz7iHK829q690Gzfra?=
 =?us-ascii?Q?BRv5kZeLUdfaHrFHWILX7Hxo/t7oolsvAyDDXbKpBzAmkZAcmstYc3p/Ckd2?=
 =?us-ascii?Q?h1HhWHxN/uHfzuzx4pU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a922b96d-4497-4def-fd55-08dcc00f0ff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 05:23:30.4620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uwfz6waV4Eg8N/mkky9Qn7mAWDNYF/I1ZKrJlDFuKHSUBApuifn0r9ZAasvCDqR0k65mXpXKAwjxQTWkT93sdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Suraj
> Kandpal
> Sent: Tuesday, August 13, 2024 9:50 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 4/4] tests/kms_content_protection: Set screen red/g=
reen
> based on CP Status
>=20
> Set fb as red when HDCP is disabled and green when HDCP is enabled rather
> than randomly setting the color.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  tests/kms_content_protection.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 82a56167b..ea7f5b984 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -521,12 +521,11 @@ static bool sink_hdcp2_capable(igt_output_t
> *output)
>  	return strstr(buf, "HDCP2.2");
>  }
>=20
> -static void prepare_modeset_on_mst_output(igt_output_t *output)
> +static void prepare_modeset_on_mst_output(igt_output_t *output, bool
> +is_enabled)
>  {
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
>  	int width, height;
> -	enum pipe pipe =3D output->pending_pipe;
>=20
>  	mode =3D igt_output_get_mode(output);
>=20
> @@ -535,8 +534,8 @@ static void
> prepare_modeset_on_mst_output(igt_output_t *output)
>=20
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
> -	igt_fb_set_size(pipe % 2 ? &data.red : &data.green, primary, width,
> height);
> +	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
> +	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width,
> +height);
>  	igt_plane_set_size(primary, width, height);  }
>=20
> @@ -733,7 +732,7 @@ test_content_protection_mst(int content_type)
>  		igt_assert_f(pipe_found, "No valid pipe found for %s\n",
> output->name);
>=20
>  		igt_output_set_pipe(output, pipe);
> -		prepare_modeset_on_mst_output(output);
> +		prepare_modeset_on_mst_output(output, false);
>  		dp_mst_outputs++;
>  		if (output_hdcp_capable(output, content_type))
>  			hdcp_mst_output[valid_outputs++] =3D output; @@ -
> 750,7 +749,7 @@ test_content_protection_mst(int content_type)
>  		igt_require_f(found, "No valid mode combo found for MST
> modeset\n");
>=20
>  		for (count =3D 0; count < valid_outputs; count++)
> -
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count]);
> +
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
>=20
>  		ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
>  		igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
> @@ -760,6 +759,13 @@ test_content_protection_mst(int content_type)
>=20
>  	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs,
> 2, content_type);
>=20
> +	if (ret) {
> +		for (i =3D 0; i < valid_outputs; i++)
> +
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count], true);
> +
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +	}
> +
This is unclear why its added, please describe in commit message.=20
>  	if (data.cp_tests & CP_LIC)
>  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
>=20
> --
> 2.43.2


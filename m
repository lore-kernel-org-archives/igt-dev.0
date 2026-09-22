Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C911C982FF
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 12:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239E610EC7E;
	Tue, 22 Sep 2026 12:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4uHbYa4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1843410EC7E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790078401; x=1821614401;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GyQGc+P5AHfa0JllWZhjl4hTweTJcMeSimb3XRJfEb4=;
 b=J4uHbYa4lr7VTmDHr73Qe/CaqgxKSthv8+gjn1yzcqhDzsnB/GBNoPS9
 5MOAMD/NBnbhNfmYuOPTfyKcOpN081t4Lzkm3QF7RxtAuLnwO/sTjg1PG
 GrBUxW3c7+ntdAMw0HE9A7Rmcih8NJ9SQcsWTHsWv958GbSqDbkyLYL4Q
 aV9Np6N0ZsHKWx4Y/piUaRHGoGHjjLjS/VMfirGlMpi4o8znS7FInrK8A
 cj4CrWcHR/slcLJF6upGZF+pckenJyY95502dqZz9ihUzq10IoyZzZTV0
 sAFfzvnQbSQNCwfeCnfRU0DEEumlB0aE/Jo0T7eX3+Em4CYOGYUU2goYe A==;
X-CSE-ConnectionGUID: TFyf6Z9HR5WX8etpRiVDEA==
X-CSE-MsgGUID: iW2DVfDIRgWD5jaVKY2MHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90542742"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90542742"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:00:00 -0700
X-CSE-ConnectionGUID: vqH2jX3mRxmzSRtLo81rAw==
X-CSE-MsgGUID: 7p1UJRzST+S6LpfnhuwRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="269617126"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:00:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:00:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 05:00:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEKX7ICCrUIPV7SHKvcpbhs6dN40xgRDKHKV0HL751TlgjXIuKFysjd3Dkkqxq3Q1VyHc0SER3hqxTr06u+HPeF+cwxsoD4i/mTKU4v2cDyx7EAhilb5d2nondVM1RjhyxF4vMevEO6YNRUMV7toFbS/08btIpdihB9Uzlzzkw5mq79TEz0NJeDwTvVjAf+YAySx0kwiejKj2jHGT/ufZ/g2FfFtOP/rXDGyvO46Z8r1kN2PDSuqmjNPY18460xdpnXu0cmBOWs/t0BKG8f3PbZJfn7H7uSyI5ro79hIPBJiJUgM26/vVI7KUuWAhKdsKfpMUyQwZc9iHC0BUdHnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Df89592Xdn8e16ZRdE+W1Tc/X59Oy4J4F5Ag5Z26M50=;
 b=xndNKBkBuAHZ51ShYNNtpGltu4jxWI0tUfKOjKDMEDSJFtVqa0GCnwk29BbCyJjvvJyaciq7QZeKs1nBheQcmie3LcNG67Kt8K650oPzUsFXKIlw0nJ97pFd3CcPGPdtWpvOZgWUyd1UOhEy4n5oQ2k7lL1AogPulhi0Y7Vmwr5WQELkaxY8mAcrz0WXjYqhDCZJFa+Oge+bNFKYsqGbbO74Grf05nSJvErmViHaFFCbd2La8NCKefKOKIvGwuahu0fIhKOcmUDhGnwzF1AQyBOMBRUYFJmKqqzfnp/KwQtpVjVC3NK4PdWTclvlLDr175rV9aknm5r5i/F4kQTXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 11:59:57 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 11:59:57 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 05/13] tests/intel/kms_dp_link_training: Drive the
 smallest mode the sink offers
Thread-Topic: [PATCH i-g-t 05/13] tests/intel/kms_dp_link_training: Drive the
 smallest mode the sink offers
Thread-Index: AQHdRZQqr5whRHzpVUGbTwrMZwUL8LbaiHgg
Date: Tue, 22 Sep 2026 11:59:56 +0000
Message-ID: <PH7PR11MB6796766CEC9C2BA3557590FDE5832@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-6-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-6-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|MW3PR11MB4620:EE_
x-ms-office365-filtering-correlation-id: a6136a33-15e9-414c-7247-08df18a1056d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|5023799004|6133799003|3023799007|56012099006|11063799006|22082099003|18002099003|18092099006|4143699003|38070700021;
x-microsoft-antispam-message-info: IaLVONHz0ZUFdIThhtGh2PBoTlR9DlwmJpJ4YkCWJ46V9jdfRTw0BxmxlKlc8/z6k78P94KPSImBVjWhcmfZ95f8dbB3om4juFJkRLp4uxP2snE0+dJ5vGqg5JllA16UZunjyxdO5KWq1cmegcHRkd/+Xd+5+RK0E4dmlTnM5yqlGSoPytf5pVNtQF+kge2WCDADMXmCOl7GQgg7GG/ITWMok6nb/6kk53xONFo37FiG55r94QSDZad76H7IT084x60MGgwoI1b+jIy3wsS8Nx4/CRkBR1HnqtnYD279P7cOb0QT/emUvDfHbdliiC1tO+SUrT8eWkloXgnvsVvX1IobEStwYTrGl6cYKPD/OcQ2SjBTyO1JEqwQIpsBn7JAMkBGv41joKQxPUetoRX3cpMIiKMRxSUMhs2hZmGJfiZhXV4iwAC50srditefgPgxiTT6dxyA5fZdIc7Z6+3J48FOp4AStcsRWZn24S5wNU9xXJyO9Z63P+FiRHMn9CIFBnAlvpLnKXwGC8EN3k0ml1+TftxeDoewHSJvCFdq6TOzGuOox5uUneK8b4CS9k/y+VTalxX13OpltiyRfw1ASA1ZdMIVYZuJCeazMM3CVqeNybk1vgzGVF8h6hTch91+6gLfGqEQKO2kgbXyiYbe1BTZfjByv6/thi8/EH/dYkBtRCegsIU/arfc7U4lR5IObO5jjzYl3cp/8MWDBfnR3jYVp3s4jbb5043eeHKpEFY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(5023799004)(6133799003)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003)(18092099006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BuWJAg2a71kXxSEe6X8Sw1ibIMnl13nS7E1ukunvqbn1gcnlHfe1Ho3leKPX?=
 =?us-ascii?Q?TyM1WbFOUnjeyfMMIIn8RhYE+P8izuQ64Ye2mKQufNw9bVjlPjOS5Me4unZy?=
 =?us-ascii?Q?OzRd1uVe52zHsKLYdzpjZD9k85lCgzzXIIxAHzYn3KjsMsC3nduQXXlwZdyw?=
 =?us-ascii?Q?Ybi4NBRqZ1Ymi80E4SM2W8Gc6KRjE8MOOn6jaBWX/BatgP6m6N3d0ZCOVu1A?=
 =?us-ascii?Q?FgH7fZHa0HUB/mJC5gUZmbaW6eYhkd0dWebSbRUgU1MNashnDxU4fMMt8TlC?=
 =?us-ascii?Q?zRzjl2H39vNBeFIXGY72betRVSmj+r5Z1ulTA6eKIkUETxSSYwP9w7dq1OBd?=
 =?us-ascii?Q?PyWMVoQG5I3sB75oc+7BNs9cDsAe0t/RPvSkpgqTi4qWEEolzmk4ztRHvKYj?=
 =?us-ascii?Q?jyo5/VsBXDv/cWw93lMKcrRVWUSvmCYawN08fFEF1ehGwfYOZTUtcVwCVuwg?=
 =?us-ascii?Q?af0EvJ6nuBob553P6mApDD/F3jHQa5LolCiCyRBa1jUryuemWGzMazE7r6j9?=
 =?us-ascii?Q?KpbGz3SylmF4Dd3SlcMQ81eYYDglYwZR/o8vw4lp9ydatO6mUiFLCeuvJjQh?=
 =?us-ascii?Q?Tiw9/LDUZnTOmNNj/XiZvRGD50y4FBHGp1cU6OCSD89d9ZtND56e+8fB8B42?=
 =?us-ascii?Q?bMDnW3XG7atQgWnSmhD2eM6jO2hMKPk8CDdWFHd4MjI9vTAuKQ2cDEaJz1I3?=
 =?us-ascii?Q?3XmwBMxWfkCjjmRWzC1Z9p4NB45AJw0TyAQPDcAU5BvRprjScFJ4Mkw9J0AD?=
 =?us-ascii?Q?dVap+qvgjSXjoz8EydrRbiqL/6sp+ObBdZbP5o15gX7uzjlvulphcZPR2r61?=
 =?us-ascii?Q?Hu8o7hTZxfCHH89x/YKtVF7urPRgbVUO86B5nuzNQXukxFdT/Ql7kcu0HOq8?=
 =?us-ascii?Q?2xTtL97lCWVUtB3y2k4uYahdS8+9qoNVS/IMnQLKkD0x1rbxaUqkPWkXR2Yt?=
 =?us-ascii?Q?UgL8gYRwUuGio+aFo82M8mkMxnKhSbCjJ8c9HIOBB7Vis+JT7NQFIczzCPyA?=
 =?us-ascii?Q?blDlxDQZ1azzxdqaRBsd89q1sIut2BJ39lj6KwkyJulvsx83zqzpf2wyR0V7?=
 =?us-ascii?Q?lIUxcWOhdk5CwC7H1VgxdsJNrt/yD+lFYxwvj/6veZK3w47zjitvUPKV+Nfl?=
 =?us-ascii?Q?S0p0DCylu2J5WNzKJZSbrpQOasOeAmlUr1W3LOjb0sMQsug9YXQIQI512rO9?=
 =?us-ascii?Q?ThrGF30qDEznBd8t8auagvehTcVjHEMDBLPAaz9bBwHBKZFacHV+ue6sKoEK?=
 =?us-ascii?Q?REOUEOI6xOiNtCljCmIVPtWRFPZ/43d25kxSE67IGBdWkyoY1ufF+GD9xJFD?=
 =?us-ascii?Q?WsqmgfyEiXwiichhyEzNm+N0OlkIkWIekjni5cl+AvBY2euASpGudnWFx07P?=
 =?us-ascii?Q?yGbPxENcm7XQyu64FYfq1Er9QjL5nsrrMNw+kLbPmftGY+C0lXYoWxBYXqWZ?=
 =?us-ascii?Q?q6jyDr3dMqfJWby+j6G4qb7BU671AQNSxiQS/llBTy4DLROL5R8hRfRsZ+7Z?=
 =?us-ascii?Q?ANPcplKblygM0k0iB7E6S+V91kh3jq4DI4q7qJdVuFAyHA80FL4StZuh/Z86?=
 =?us-ascii?Q?GsktToJqd/qw+gy0rIpTzeyCSiXNkRoVQ9/ibpvTaZS3snzUiyharBPah4sH?=
 =?us-ascii?Q?L8xs6uZdggKT1+M7kD5EiOwMM4xTXjfOUi//v16aiWjL0utBw2aNll5/oNwy?=
 =?us-ascii?Q?xXPXlfwCOwFZtYqEc3oudHlL29qFb2ZTMLtKagM6JQvBZFHa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IzwfYJBICCpCzva6c7hznkHCrZbYE4r4M8oCSDZ+Ju5DtUUbDE8NmWMG/pgmnW0+BJjMyRhqaN02bzjCLfjTewN6c6a5s4vvPWd05o+B6/3TiHAQDYX1vFkJ4RF/J4L/1UhicOgmEMMkqbuxKIx6QnPjd48wDmQB2gTbDweBq2fEbeLiKfVkO2K2bFCTxR1Kth7nYqBeafrMLwV54EqGe/dAB8HqLzBOz8H+mCK8qQdXZKYDyUTqRjgt4I1ZT6peePpCKoX/w6h0aPH1oVSHXpA+rOOiZ/JmZMWpfRXLZLOKnbnBgk2NPItgBCuhP6ZU4G+aGlLPE55GHhCr6w+JDQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6136a33-15e9-414c-7247-08df18a1056d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 11:59:56.9150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lR3qt4C11hIVug0TaRfCn3lEaCapDuuOC3l2EcP5uuIZjEN/SdkRHurd0u00WQfd5VyizJcABVW3HblT2j5w0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 05/13] tests/intel/kms_dp_link_training: Drive the
> smallest mode the sink offers
>=20
> The test modesets the output's preferred mode, which on a modern monitor
> needs most of the link. The driver picks the lowest configuration that ca=
rries
> the mode, so a large mode leaves most of the link configurations below th=
e
> threshold where they can be used at all.
>=20
> Override the smallest mode the sink offers instead. That keeps the larges=
t
> number of configurations usable, and it stays out of the compressed regim=
e,
> where the bpp the driver picks rather than the link configuration absorbs=
 the
> difference.
>=20
> The override is cleared by the igt_display_reset() each run starts with, =
so it
> needs no explicit teardown.
>=20
> Prep for training every allowed configuration.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com> =20
> ---
>  tests/intel/kms_dp_link_training.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index b2d686f28..6a174da88 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -183,6 +183,25 @@ static void train_link_config(data_t *data, bool mst=
,
>  	assert_link_recovery_idle(data, config);  }
>=20
> +/*
> + * override_lowest_mode - Drive the mode with the lowest pixel clock,
> +so that
> + * the largest number of link configurations can carry it.
> + */
> +static void override_lowest_mode(data_t *data, igt_output_t *output) {
> +	drmModeConnector *connector =3D output->config.connector;
> +	drmModeModeInfo *mode =3D NULL;
> +	int i;
> +
> +	for (i =3D 0; i < connector->count_modes; i++)
> +		if (!mode || connector->modes[i].clock < mode->clock)
> +			mode =3D &connector->modes[i];
> +
> +	igt_assert_f(mode, "No mode on output %s\n",
> igt_output_name(output));
> +
> +	igt_output_override_mode(output, mode); }
> +
>  /*
>   * setup_planes_fbs - Create solid-color FBs and attach them to the prim=
ary
> plane.
>   */
> @@ -222,6 +241,7 @@ static void do_modeset(data_t *data, bool mst)
>  	int n_pipes =3D 0;
>  	int out_count =3D 0;
>  	igt_crtc_t *crtc;
> +	int i;
>=20
>  	for_each_crtc(&data->display, crtc) {
>  		valid_pipes_mask |=3D BIT(crtc->hardware_pipe); @@ -241,6
> +261,9 @@ static void do_modeset(data_t *data, bool mst)
>=20
>  	igt_assert_f(out_count > 0, "Require at least one output\n");
>=20
> +	for (i =3D 0; i < out_count; i++)
> +		override_lowest_mode(data, outs[i]);
> +
>  	igt_set_all_master_pipes_for_platform(&data->display,
> &master_pipes_mask);
>=20
>  	igt_assert_f(igt_assign_pipes_for_outputs(data->drm_fd,
> --
> 2.25.1


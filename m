Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A7EC5320E
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6A910E02A;
	Tue, 27 Aug 2024 05:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ybc97urb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32EF10E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724736110; x=1756272110;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=83ovyTUR6nnhX493opYtcXEszhoANGJJu1uVl3A2Mu8=;
 b=Ybc97urb9EsT649gDMyw3aUcrQTDL3fQfvcWO6gxMWVmo3qAWN59mUfd
 DG5LiVVm0ymwJXlhpbTc0eorBroZvIpe6DaAQM7PiHAoaL8UTTmN478ZD
 so1zQNhh2qxMlfQ1aArDwjn3xXsVrkGJ0iBag4cGmr3QxkzUOR/EdfFtr
 o2eI7mjfzuw/2UhtNiFjpg+YDgRcfcuQK3iM3wkp+1VMRYuWf/JWLYVnO
 VbBfVOmJFTJCTQdi126LJJdtloO2keVqtwwzjmdBZwNTAccYswpPXYRPL
 0Hz4jnIO6fN+AoQYaMuPMkGCQjY4r2vn483zkzgyuDiI2ypSuo9E2y/cZ g==;
X-CSE-ConnectionGUID: zaF1IZXVTK2o819q0bEMWg==
X-CSE-MsgGUID: XnEL0rZVSXeI7KCfNsIqxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="27073588"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="27073588"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:21:50 -0700
X-CSE-ConnectionGUID: OU1x72sJRVqly0Yx8BUk6A==
X-CSE-MsgGUID: /3YWx5dqSbWukrdd6ZYxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67087096"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 22:21:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:21:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:21:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 22:21:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 22:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKfj0PrOfWuay9pUPj8bTPHzOaC0Ss9C869Fz5XYjqHnW1LsJY+DQCuKP5AYQ5d/uvhuzn2kbVe9T56h8SlB1pX0uSqu850B+oFa9OfhUeeP5OftfrRckC+uzr4hXxMUwiiluIPAsnYuGeqA6UhBOa4f34U1QrnhOGSW7W+2drYEX1TE+GsOt1l9kuXgfL/L4H15Xkcqho3T3zRNvD7ynDOHlZbYGe06BjaIqVGMvyysHPyn207fVcWwL8YL5keTL+Veew+N2DaWu1LZZsbPQD40oY1HeM1zqn7Hp2PwtNC7niO5aGHsM+hGnyxM/GrGe9j9Bm6emkNI5TiyVl3c8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofS427DLsbqJahvRTxy5jhG6o9dsOQ+YdhHqX8Wkrkw=;
 b=oQgQCJW8nixxxEx4wKLEg5e+cNyLh/1GAmnuQkYXuxq04bOKe6l/Eyx2EVp+KyNGwK1SG5QhnKdRPMmR7B20gXljT+bdeFNhfZrazIbIHnprEBuXwUHy4YX9tNpwdsaVKSlWGYuEk2cnnylSsR3xoJR/nqb1pGNcL2Lf9gsAeIKo5++M/RQ6ld/38hJi7J3auFogwMw+82m05DaOFz+s1r1veFb7+Ehoy9IMrgAs8s1m0wFlmW0musUk7kZKST6aE/rzZAM8q9EcFhsEJzL1HfKEoND9sczZ7G9RoYhzBK1Jmjnj4uWrXkhCoSRPjMvIzlQ18x/LA/XiMTkBlxzn9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB8749.namprd11.prod.outlook.com (2603:10b6:610:1c9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.24; Tue, 27 Aug 2024 05:21:41 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 05:21:41 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 0/5] Improve MST HDCP tests
Thread-Topic: [PATCH i-g-t 0/5] Improve MST HDCP tests
Thread-Index: AQHa9FqIQiwgVDyR902gwpQVx+gZGrI6mSpA
Date: Tue, 27 Aug 2024 05:21:41 +0000
Message-ID: <DM4PR11MB63125CDAE36B9012096DC7A590942@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240822061150.4127413-1-suraj.kandpal@intel.com>
In-Reply-To: <20240822061150.4127413-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB8749:EE_
x-ms-office365-filtering-correlation-id: 617d71ef-5ea9-4baf-594a-08dcc6582221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gos7bzPw1YUSENbAoc9pr7s/XvcAd5MAAgK+PQ002z3RgiBddEZXgbX2X7hJ?=
 =?us-ascii?Q?dH+a3dEPkqUdRLXBSbDYWPlmXuTe8h5hxkMl3iBFKQLjAuTxdWRnACGLp1rq?=
 =?us-ascii?Q?Z+eSGfGSOpNYjSiUkxFNG6aDuL3ao28Hz1qQe0UIIP5cqYo8gGPcWRxww5F3?=
 =?us-ascii?Q?iPnuGHuKKsEiwP2BpH9IaCBXUI65u2Mh4vK9jjLt6J+kDbakbo7BQFx3i+wX?=
 =?us-ascii?Q?0E+WLHoaF0FRvjJtbXLDrT36QXINr1fB8KwydtDK6qO3G0k6ix5DgYGoorK4?=
 =?us-ascii?Q?6sDQ3PPeVrXX+3bXrXMig+PzKAKrb5CVwh4i6J2cZcPdkwixDWe4DhRwez+I?=
 =?us-ascii?Q?5MV3PdrMRAZBLtdQ4hl1I2fLrQ0VEYcb8iRa8jjgfc7D04Twr/Dezpf+Znh9?=
 =?us-ascii?Q?AOdhnZbmoYvfQMEvtUX+2TCaQ4X+WSewqrT31RqnBk9GnDzxoO31XO4hFuOU?=
 =?us-ascii?Q?BX+/Cu2wVHc1pduR5/TaYiYfXYCiLIdw+Tk8nlFvqD9Pbcdu7FUQidcgz+9f?=
 =?us-ascii?Q?ZwGU/Wla9biFTC5SjJHQu/+eZ4FXR+QD2x6MkB21wGiF1q4irRqkmW/s7Kon?=
 =?us-ascii?Q?OdNMNvH72EVNYn3xadiXiqB07LyuSKh4oWjOH929s1QRQANPnZaAjxl48rZZ?=
 =?us-ascii?Q?fcjtmLxOk1KmNoGn3jBDvpuYo/stz7ci0AHGVsmnPoXfBzOiZ5ZHNpsp0tJX?=
 =?us-ascii?Q?wwnXm8UDZg2D2XMdvHa0wXaMltf3EiM9/zbrmd27rUnUv9E2bL6sXoXk+lkG?=
 =?us-ascii?Q?aGsEuap1AOc+//JQAUHKKpLaL2fagrvAILwRJyAc2baPnUD4r3ckAMEmXejV?=
 =?us-ascii?Q?/doY1IToDSe+/7/dbaVGVw8qG5IOVCvoTVxGBnxUpEXaa1FEdCjKBnMPZbv3?=
 =?us-ascii?Q?PV0nYHaffA2GD58AggghH4ACCnOUi3CNk3iM0noYwP2/TB+6wWoxVYV+f0yC?=
 =?us-ascii?Q?tb0xCnShgNbcy4/VJO648diyNRAMhwp+V0OapVTDpf5e2E1u/pZzRiU8NhJl?=
 =?us-ascii?Q?11YhNHKfVHzDBs72wiWRBzGKYjuRQND8zzApb9+qaJ7NLVTJwdPaKCHgX9+q?=
 =?us-ascii?Q?LyHho2tD/ao26VJtFSlgOqNvX7visS9Dz5TAMBWcMVJKL3BW3sJoOdfkvS6W?=
 =?us-ascii?Q?fD852S4VAqbcGG5RY6wI9gTgGo6jSiAuEmf/QdYB/sQrAhHMmSygGeBhMdz6?=
 =?us-ascii?Q?+t+rR5CqDT71k86LLK7OJZrFLtYOtG0YA9Pa2Af8TBYiq0wUN6ApRqS2RUJ8?=
 =?us-ascii?Q?CvIDGuKKx1FM68C6vz9aia8ZbYn8aJK2c4+oWjgZ6KXYjfY5dfdTHL4iB0PW?=
 =?us-ascii?Q?mqkrd7Rq8HSO2LzAkTQRV+NHxOHJK900FBubq9WSaMzWZnCwYQnQc2Ba/QE3?=
 =?us-ascii?Q?k34sLIXg2xvwPSb/pv39RBliz1mL6ITbA28ZZuG9JyQf3MoCZQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eNBtIbpEs6idO0BVycgAmY+evbJUx03bQYYXBOYU8DqXHSs/f8ofp8ypsK6c?=
 =?us-ascii?Q?X0KobJgjrKefU7DxI2ftKe9LvaxehGzZQTRxM/c5U7xeH4xBtxf3OpTLm6tc?=
 =?us-ascii?Q?U4g0CDEaGnV5HcyAUmi4b5a82+QDRMed33uw+poM1YkPNCTk2nKDVNnVqQoS?=
 =?us-ascii?Q?Prj918akIjeYSXpyNABLw86jDKkurNxsRoPIyr0GsOF94Gzwla4C/muse9s5?=
 =?us-ascii?Q?TQoyVZJucpC2vFWtHpRmCFarxSJdJ/1kvD+I358zt27ZLr3EjQDYpnLB+hXG?=
 =?us-ascii?Q?zBrwN6wqZlxWt18oHEP2ift+Sp9xMlDQylkbXxooVyznChuDEMWQq2eom5Uo?=
 =?us-ascii?Q?ZshmU2uT37VFAYAUi61WaDN0MZfLDMdn2evwDHqmzfSTmX84su4MhjVwgDsE?=
 =?us-ascii?Q?Z5cB8GzMS5LxdlAYBuxV2qNI1h+dJzX68I/4Sy/g0xcvyIpQHLvtjIvsAYSr?=
 =?us-ascii?Q?2rqgyK4mNlgV8ppD81XmUg8NQbGXK37k0F5+JG5i2zeXXx13AzsMbdaHuCpS?=
 =?us-ascii?Q?zpbZqtccLNkoS6pd4MXKwoweZTRYBfD+Z3gZo7SaAqUEGN6vSpTIsnXUT1L+?=
 =?us-ascii?Q?6t/qAOl2qQySNpOppzV8/8xge4HnWROvZABbfZA72ZBcjwmovtYyR381tAHS?=
 =?us-ascii?Q?ho5FScoB0yOxzQlNlxV24oxDs6GwkvKkf7AidrhuJFBUCskXgcAEHTcCmt+E?=
 =?us-ascii?Q?f5pK77CuiGGaBVi6fM0BbfSqlodAIkp5VxeIcjmMXqlvAHvNzyjOEeL8Rm9X?=
 =?us-ascii?Q?dqnpEsnGysI5D3VeZE0AoXCVCNwcQ01rxFxKfYMOxPInUeRrijxV7Cnip9nG?=
 =?us-ascii?Q?Yh0Qw7qk6fRLQd1fFjrg7PaK/BfIFt8HUR90j7Rjy+FV33goZtBmeJW6JYkf?=
 =?us-ascii?Q?ZwywF1pII7Zs8zS5ozjkE8p88ygxSi8Gp5CFFIv3rnNVW3TEb1Fzi+dEB4WG?=
 =?us-ascii?Q?lJzfDpOGKojuEavwlE5vjtCXSr4qnUbzPX2KJsGv2WFDAjIsnjHsO1KgV46/?=
 =?us-ascii?Q?xn6m6evOjH6Cjz6bznQEfnU0GweqqVipuJfa4vsIsYbH4Mcu65URroBQ02tp?=
 =?us-ascii?Q?ieTP3YHM34RfS2G46FKszEbLOtZ970yUnWgiWr04fucBMriiAShea4nhPnRc?=
 =?us-ascii?Q?rBlFWl3qEeZ/6I/PlZFLBNmZ2lJmZZ6sl+8VaUtn/Eju6MxOB5qBSi6+LpWM?=
 =?us-ascii?Q?eS+QtmD053DIuGdGgMHA8V4Q5k96YBiPHRjFsEOGSekof0K3sa8rkbIWziMC?=
 =?us-ascii?Q?HPt7vmF3YNpZHJ28B1zUG9UxDWdSfFTbEeEhn7/wE0thf35zGKWEmF2IRDq9?=
 =?us-ascii?Q?EeUnPwl+Rz7nAtivkUXPff/rfVySI5J14KMH0XzkVHVlLAfruk7HhYzFBMyI?=
 =?us-ascii?Q?uLht2rwQyzddLM3iolR2K7nYfj5r0nYZdLeuG2CO/0E5eLg8KiycMuauO9gj?=
 =?us-ascii?Q?7j56O7Tz22w6VgBTMrzU7nWW52W4ZTeiS1RdtmMIlLPwiDQuIl40u/nccgFw?=
 =?us-ascii?Q?OscfZG5FSSEdOybQk7BN4J/9uIko2bDNznhqVZsG+PpmTrrgNb/n41UVw4XE?=
 =?us-ascii?Q?fQsKoexoHLT4v3UJsTw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617d71ef-5ea9-4baf-594a-08dcc6582221
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 05:21:41.1659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mwo+yHsXW68tq5LNufU5W6ZkrHVng4vCGZ42KxfvaOlsAve0g/7xHoePNgKetALKskma2DGO7gblmF6wedWbEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8749
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

Can you please re-report the issue or fix the results so that we can merge =
this.

BR- Jeevan B

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Thursday, August 22, 2024 11:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Su=
raj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 0/5] Improve MST HDCP tests
>=20
> Improve HDCP MST test by doing the following -Eliminate unnecessary loops
> and wait times -Add retry logic for mst test cases -Change screen color b=
ased on
> HDCP Encryption Status
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>=20
> Suraj Kandpal (5):
>   tests/kms_content_protection: Move HDCP output checks earlier
>   tests/kms_content_protection: Move try commit call
>   tests/kms_content_protection: Rename igt_commit_style variable
>   tests/kms_content_protection: Add retry logic for mst usecase
>   tests/kms_content_protection: Set screen red/green based on CP Status
>=20
>  tests/kms_content_protection.c | 184 ++++++++++++++++++++++-----------
>  1 file changed, 123 insertions(+), 61 deletions(-)
>=20
> --
> 2.43.2


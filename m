Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A95EFCD6E
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8789A10E4B0;
	Mon,  9 Mar 2026 09:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7L0hXQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49C710E4B0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048188; x=1804584188;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=93E7DzzCeFzPbwnVzPpqC/FlyZf8EuLr60TMEf2yBIo=;
 b=U7L0hXQtJ55prblFhCtvh9JKOnj9WzlXfQD+AfxsHiBSNzXBIOfjyiPv
 soptTQKW2UJ8K93ZoH1XmnGhISRxeeEhuAnBFz68RtWfFNLmMvwCgQGuN
 oVMs/sZGn/llwV5fMgMoqVW9d1ZqHIJ/2TC24Pe78MgyCzxMOiKIcJPIc
 wjr37JuSBTHthL54aA5bRiefNtuKhoNdNuT+W6DMqYiqH1jzvA8m2xjMk
 HIfRlY/RqNdy4FOoS8br5fL3CFKKf47aHSwhzCwY6N81N2q68ibSs/f12
 EeTE8Ymilmlj4aUjKjNqk3WLqboVOhAKw2Po2h7ni9oIwKojAQw+4djr0 A==;
X-CSE-ConnectionGUID: elnq9LX0Q2CItBXaGdT78A==
X-CSE-MsgGUID: JkIjrM83RdiDsSp9VGraOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77918172"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77918172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:23:07 -0700
X-CSE-ConnectionGUID: 4yxJ6aJMR82m9LMe/kPUyg==
X-CSE-MsgGUID: o2k0Pu+vSGu7olNOdUthMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="257619232"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:23:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:23:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:23:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:23:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3Pgq2MucKB5vtHVQMlLqKWjtOtVJJeqyKKOMWEOo+8yIz0TL4AH2t5HB66lRkuUuETFY5VQfvEhkM0v41FW4JlM90skBM4dScovvKsJs8NJ7oed/c0Hp2YF5eziPv9tTdD6Q7+4JG9th8IfLxIcCD37I4/shxeh3xFhJFVJquSBDl3o+Gl92E9xNp/SkEAF6a3vV3R4ohHE6EO72E4+asZcltuHZ0KoedHSUPCryqg5M5lHJL5r4GLawnj7VLR71y53pKLySzQWphOm0WOm9yvNyKxP/3H8pyw/iJODimxXx0Ivx9ila7jNuUUhkBdINu4qUmC9NWAhG0OjwBgKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYzHZg0XTX5IP6oMgFcWAQukxSvurHUERFA87JHIfvk=;
 b=FUt32xrvxNSgFHMiJbUu4SivbLeIzc90Y7dWBF7lkJ65Bichrss1DabSpAfVXtrmH8u2cQADO6mwfuZ4bJqavXtLiXTyp10RYLNor0xqrGgYHjWAZ2lMgwih8Q7UTjJrl5YnF2wgZe3ytKonXwn1QacvVXO+coNUeq0W+3Iox1BnE42q49Wh8LEeH/kKzDhWlpSjqYzwaLTQOuB438JAhb7INjm6xoS6lkkgkFV35EZ3p/5ll8VNAkrhMbgEQvWBQ6sFccbClmg2QZRSaY58mLQcQWl90ZG52xQAiebwidNS74FVfIupAyRoj1wTpiqofKjGhNSt8DTISHUU2qDZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM4PR11MB6309.namprd11.prod.outlook.com (2603:10b6:8:a8::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.10; Mon, 9 Mar 2026 09:23:03 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 09:23:03 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Topic: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Index: AQHcrIMflbF2cmceQkidx9BMuUIVjrWl8Z2w
Date: Mon, 9 Mar 2026 09:23:03 +0000
Message-ID: <DM4PR11MB6312FBDCA175D13650AD0EFC9079A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260305093025.3107101-1-mohammed.bilal@intel.com>
 <20260305093025.3107101-3-mohammed.bilal@intel.com>
In-Reply-To: <20260305093025.3107101-3-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM4PR11MB6309:EE_
x-ms-office365-filtering-correlation-id: 14474445-8d39-48fa-64dd-08de7dbd7737
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: e9PNEAY0MKDOIwf7BjDiM+NulnbCHH7RPxBw4teYa4pZNfGFKN6Ux92d6HVEk485s1NDeoK3iAIaVNhHw2xeyX7ue8zWsh9hgc73TOfoyAnq5fGzYbLWaQxRaFGCuDZS44JWCAMMYBlddpx4J4GJJHtL2egfnAPEltb4mhK2FkSLtERBYxu7EwB6GARypdIn6stHbpPUayA9BdxE22WbV92QlUQqtSb0b4Q6kJKFCwt70lTblnVMDPZbWlHtGRs3wjOAbofWIvInnLZLyWMGdpwE/+VVo5KOrvPhky2yt8E1DTXLO+6Dy0ZTTLRARPbcQC3NjcydV7HtuW9VwVDKmpcP5V4g0MRVPbRVOIZZd6lCuUYQAfMowt0D6F3CYoK5hfGPUq7BL8zMh4hxwQCOb4D4JFG0wyxfOJKlxwnGPBjqwCaAdZM0lSZnhIsaznaUqgIDn4b+oy59t1Fs/V6R2t+8K8OJ05a4wgjVRU31GlOagcFBezQgRR9Q38HCU8Melbj0Dpouz1sheKmFk534dHTfGR+ykTXY204XMR6700Y8miGH5k108hQFtdwYB0sbJC/ttWcgzpzqw4SLrhS4F+TqrMSGxZWeFG1x82A7oiikLdJ4cEOGqoaqF+EyERNm94TDsXHV+shtA0RMYmfb3GqTZu/qM6/txibZoYWD/OZ8e7Y34+JnlIkcvMwqrPCgHIIngtgdHJocedyz1CCJPqQyussQkMlMLcaausj9/3wyCw99NVmKwHcOu4Dn1YSLgs8hFIYvuRngGbMsMoFqlzadcKICGHlNZvvNHT7wdjM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yUGL2hqif4WPXqMCavyUSXdqo8fNTeYd8MdM0MeMLmDYSZ7orA6KFcueCk4p?=
 =?us-ascii?Q?k5N6yUlsAbPdrpIvHrnQZYHoDbRYBHd6NZIMnDCXG7oech+JMv8RbUDuqLTB?=
 =?us-ascii?Q?cHDAyZHzdB2AWFNGpk836MLCa0OskBFydCbg0JsJljlP/8dRers8z9YVCq+8?=
 =?us-ascii?Q?9fk5ehIJFXzaAKrJouw0oaLcy5yowB9tMR3+M695JXWP+mfU9VByLZdrLEY8?=
 =?us-ascii?Q?FC/Wj1pW037FBBWeTK28mEn8ZL3Grv42fQWIrW77n4k9i9jXW/v0XWO5trCf?=
 =?us-ascii?Q?Z+PDilfE35YNdRFiDw2la1gnzK9bOzUJElKTm9KEk0rlw67d49WFEgxEWxco?=
 =?us-ascii?Q?UhEF4g8ZDGHi0eH42YP9T6h90VxLecu6/+8qv+wCpsOVKc/JHCU4zCJ6D19p?=
 =?us-ascii?Q?FNz98PG/7no8TxQU4AWhDdqfX+8pgxbZtFoBwNsrhvcPMAa7Ej+jmqSeSI7L?=
 =?us-ascii?Q?Gk0FBS5If+MKYeB6vOmERI4uvdMe/x+ZG+wiGs2wqBgZi2dyYi+vOIQaa5nE?=
 =?us-ascii?Q?+lt7tkgFPyxvTAW3DSlM3fP9OT/DRQ3PMyVpV/JAPZl1jWT5W+UmkPGvzUh7?=
 =?us-ascii?Q?th0KLatO3ymDOv34FHQi9Nh//Y9j/qdDBsphkKytH4dqWjCVALF+OeE3KYsQ?=
 =?us-ascii?Q?V6v45goSVjUc3QDuyatuAiZZoQoWE/Y4AJXxvoH/hSL4oDOJGVMLfCg5KNcS?=
 =?us-ascii?Q?BWtxRHi7bi0wyW7g+KoxoC5pHUDtmhhxDYpCM8kggtxTu1/y/RMonsKs6A1o?=
 =?us-ascii?Q?0pVLjUgen1T1nS/23zt9MOyEbh4B75YRivyYM23WKvU+Oe04RLa1JOY/6EVj?=
 =?us-ascii?Q?QX8IOwyAT0e5ZVdvBYSXma/PEza7PO3RhcmE2ybeC6LBQeY20KQbgQXrkn4x?=
 =?us-ascii?Q?a8FHSx9+XH99EsKe9/FA2XBkaIcVhcGfFkZHqvG4rxfDfCjHiUMEjH04nJBW?=
 =?us-ascii?Q?b3KXihXhcfxOtiWOKnxrRs+UHURi+HJQdsoDmI0/yg/pCQNb0cMkqKC3fWqf?=
 =?us-ascii?Q?fRnTpo67vQih2zmhLxVYSrJAerC2nyEBoAoNc6gMJFEAJi6o8hOinziGKty3?=
 =?us-ascii?Q?Gq07LVXFSQo4qloWat8hGw9hEdqfUMNUQa5yJuPgb1wMoSBklND1fyG7A1Vo?=
 =?us-ascii?Q?pS71LXZSMndMxhJRgy7b2actlNE8tqpmTBpuQDeV3JmQUuajFc7SLr62oY2s?=
 =?us-ascii?Q?YwlUPjEC/w6vgxwoVljTGFDMbqNuZvLcjEu/ullhqW2fIB3mJS1oNlEPCrq+?=
 =?us-ascii?Q?hWBkxacWkyLwDgGSRq5A+/nFSEOvgQ7tHmQGPm+06bldfXfvqidsTU4QxpJE?=
 =?us-ascii?Q?ryRorbBNqXNCw4orjo4O1bYHA6yBh6eeYa1nl7XW6GVRqKXkp7bnoz/PgeEr?=
 =?us-ascii?Q?4SmLp9GcJXbxfqhVXlfSfYm4Y0ITHH2yPikW/uQcpsyA7Ld7s8OGUyERxEus?=
 =?us-ascii?Q?TC3htyIKnb7HLqLzi8n1wNx/85bGtMmYmucTuAQyfTK82R1H+WvLiG2OI5QG?=
 =?us-ascii?Q?inIRNKYczbdhBkEaCqmRoYo47bFR0vTmGHXe68zkhLwx6rUBQNkkb8uCwsR1?=
 =?us-ascii?Q?uyre6PxSFPxNMsSPihhJ7399h95hjMxGdkpao9ZMxbLG5j/kfXGulQOeOQds?=
 =?us-ascii?Q?pB0Gl2mAeSoCaBuLD/TJoLN5yQh+47phYnnsl5J3ZcaSLT+cisgzrmp8DEHN?=
 =?us-ascii?Q?KDoYdVfHC5Nc41qnokBUF+WdBBGcuRUv5u+6/OcxPMgxG+Oj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: X+kopUW0DUve6741lPj/S89cLTf43RKAQyDVpaSHte5POKG983Y30G77KDgoHkqu00Pk0dtYCt45Sjg+el0RzZS0K7F+ROLgvQAJEwPczzbIcKymQJvYDFim1Aiu6BYaj4kzayEooQ/0PYkc6yMDJzjhE7pmaEaAxpWUFxnYoGiOZ5faCBSqGq8lscu/4TY9C37aLg+M/+HgNMPaNA7eKveA6+f2MSKRpSv5rca574/eng3uNoxLwguS7bGy+e+GwcJPxncKPSwzK+s1RKsvNwNNP4dhSPIT260sjorjZlLgVWWeSRMwVgOxdzcfLb2fDBjENXm7umTC35VRA3NXIQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14474445-8d39-48fa-64dd-08de7dbd7737
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 09:23:03.5341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbBdf89YSdGr7f7Dnqaix4NczRThMhf4SpRU62Iib5pIuyaudv0+pIlB4FZcvTGmAQic4xJYTOEkNbGSiLu+Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6309
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
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: Thursday, March 5, 2026 3:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Brzezinka, Sebastian
> <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> <mohammed.bilal@intel.com>
> Subject: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
> assertion failure
>=20
> Fatal assertions can bypass cleanup paths, causing resources to remain
> unreleased when failures occur during audio tests.
>=20
> Replace fatal assertions with non-fatal checks and route failures through=
 a
> common cleanup path to ensure proper cleanup.
>=20
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 42 ++++++++++++++++++-------
> --
>  1 file changed, 28 insertions(+), 14 deletions(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_audio.c
> b/tests/chamelium/kms_chamelium_audio.c
> index 2967e3c50..201be0ba2 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -389,11 +389,11 @@ static int audio_output_frequencies_callback(void
> *data, void *buffer,  static bool test_audio_frequencies(struct audio_sta=
te
> *state)  {
>  	int freq, step;
> -	int32_t *recv, *buf;
> -	double *channel;
> +	int32_t *recv =3D NULL, *buf =3D NULL;
> +	double *channel =3D NULL;
>  	size_t i, j, streak;
> -	size_t recv_len, buf_len, buf_cap, channel_len;
> -	bool success;
> +	size_t recv_len =3D 0, buf_len, buf_cap, channel_len;
> +	bool success =3D false;
>  	int capture_chan;
>=20
>  	state->signal =3D audio_signal_init(state->playback.channels,
> @@ -426,9 +426,12 @@ static bool test_audio_frequencies(struct
> audio_state *state)
>=20
>  	audio_state_start(state, "frequencies");
>=20
> -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
> -		     "Capture rate (%dHz) doesn't match playback rate
> (%dHz)\n",
> -		     state->capture.rate, state->playback.rate);
> +	if (state->capture.rate !=3D state->playback.rate) {
> +		igt_critical("Capture rate (%dHz) doesn't match playback "
> +			     "rate (%dHz)\n",
> +			     state->capture.rate, state->playback.rate);
> +		goto out;

After goto, the stream will be stopped and the test will continue. The test=
 should fail after cleanup.
We can add a flag and assert after cleanup based on the status.

Thanks=20
Jeevan B=20

> +	}
>=20
>  	/* Needs to be a multiple of 128, because that's the number of
> samples
>  	 * we get per channel each time we receive an audio page from the
> @@ -447,10 +450,6 @@ static bool test_audio_frequencies(struct
> audio_state *state)
>  	buf =3D malloc(sizeof(int32_t) * buf_cap);
>  	buf_len =3D 0;
>=20
> -	recv =3D NULL;
> -	recv_len =3D 0;
> -
> -	success =3D false;
>  	streak =3D 0;
>  	while (!success && state->msec < AUDIO_TIMEOUT) {
>  		audio_state_receive(state, &recv, &recv_len); @@ -460,13
> +459,21 @@ static bool test_audio_frequencies(struct audio_state *state)
>=20
>  		if (buf_len < buf_cap)
>  			continue;
> -		igt_assert(buf_len =3D=3D buf_cap);
> +		if (buf_len > buf_cap) {
> +			igt_critical("Buffer overflow: %zu > %zu\n",
> +				     buf_len, buf_cap);
> +			goto out;
> +		}
>=20
>  		igt_debug("Detecting audio signal, t=3D%d msec\n", state-
> >msec);
>=20
>  		for (j =3D 0; j < state->playback.channels; j++) {
>  			capture_chan =3D state->channel_mapping[j];
> -			igt_assert(capture_chan >=3D 0);
> +			if (capture_chan < 0) {
> +				igt_critical("Invalid channel mapping for "
> +					     "channel %zu\n", j);
> +				goto out;
> +			}
>  			igt_debug("Processing channel %zu (captured as "
>  				  "channel %d)\n",
>  				  j, capture_chan);
> @@ -489,6 +496,7 @@ static bool test_audio_frequencies(struct audio_state
> *state)
>  		success =3D streak =3D=3D MIN_STREAK * state->playback.channels;
>  	}
>=20
> +out:
>  	audio_state_stop(state, success);
>=20
>  	free(recv);
> @@ -587,6 +595,7 @@ static bool test_audio_flatline(struct audio_state
> *state)
>  	recv =3D NULL;
>  	recv_len =3D 0;
>  	amp_success =3D false;
> +	align_success =3D false;
>  	streak =3D 0;
>  	while (!amp_success && state->msec < AUDIO_TIMEOUT) {
>  		audio_state_receive(state, &recv, &recv_len); @@ -595,7
> +604,11 @@ static bool test_audio_flatline(struct audio_state *state)
>=20
>  		for (i =3D 0; i < state->playback.channels; i++) {
>  			capture_chan =3D state->channel_mapping[i];
> -			igt_assert(capture_chan >=3D 0);
> +			if (capture_chan < 0) {
> +				igt_critical("Invalid channel mapping for "
> +					     "channel %zu\n", i);
> +				goto out;
> +			}
>  			igt_debug("Processing channel %zu (captured as "
>  				  "channel %d)\n",
>  				  i, capture_chan);
> @@ -661,6 +674,7 @@ static bool test_audio_flatline(struct audio_state
> *state)
>  		}
>  	}
>=20
> +out:
>  	success =3D amp_success && align_success;
>  	audio_state_stop(state, success);
>=20
> --
> 2.48.1


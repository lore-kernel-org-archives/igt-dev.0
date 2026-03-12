Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14E7FED2CC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 06:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815A710E969;
	Thu, 12 Mar 2026 06:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKm5Tjnx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A7C10E96C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 06:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773296503; x=1804832503;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u8e7JhYmE9BOJOmlVahtzHH75wr/5Zkq9Ym/R68SCvo=;
 b=bKm5TjnxAQj8Xv4vR0vA/DHRuC/TyAbZy2mfJKoa35h5pbWYOkOk6Zkz
 4uATouB+ezT4AvlwMKWGZ8DAech6xwVxyPH2/16foc/vJfboVgRheb1mc
 Ag+Imxee307DEqXplPbj78jbANje71nVxn7NbxhIejI0z1O47oq95uRQ8
 3MW16yLxGb3UVH3t1UrJNc+dMNXoW8gwKvLmsE2vgORsS+n4vlGcDkilX
 ap54ZOqFY50UzilCb3LATVFxKI7WDPTUbDA7enKp+HFAiLOEbLyRgeERo
 7LMRbcuNYckwArpK+aypdAuwJLlskyji/fJH3wgsHC5oY/K90awwGqE1d Q==;
X-CSE-ConnectionGUID: P2E8fELjQR2yh7KpC4700Q==
X-CSE-MsgGUID: ek+EAjqjT/yCIKyHaCr8pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78269909"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="78269909"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 23:21:43 -0700
X-CSE-ConnectionGUID: ASYqQcKdQTWxwCERC7jl7w==
X-CSE-MsgGUID: v6HScPKaTouxxOe0I04Umg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 23:21:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 23:21:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 23:21:41 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 23:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+5zwpFW+fvybupJ4e4rRVZTCW1GGlsWlx6v/b11PTsaXWPJpifCg/dHa1RmpXpla8TU8Qh8hx4HDzHrRBTf8Y44tauhcj3NOe/fCnEsR3goM39GfOd72WnMrM/m2uO127MLkr6sOoDA2mcH/y/mDiXXqgtz0JWi7j4bjt30q3FursWRbxhxfUHT48Sl85G5EH8x1j7X8y20JpuHesaUj6cWUd5h5Erjox1iZxu2PiSgID7wd590KQwIlbuMLz+A1xsm+1dr1gjIHl4UM2zO4qWpeTDYUowRhHTk09gHSMHkmSuuYfQYz/5yd6J9KfwsD/qAAWX8Bf8Dcg38KZicrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtYDVPR9ehOen9bW0FQzURIud7MNl81edkXPogELl4k=;
 b=Z6S1Y0tUDntkhwPh3apj1qUuBVYvwXW7i9JIaMUiyaxky6NSQNMfFqglO2GsBeF4BQ77eCyNbEy2yerPKX4iH7LsSWedBzABfvIL5RZI2usPqDmHZj7iX4FeWzW8S3LB85Nij54kvb2am1ObKdyrl36TkJv98Fo7U+PwQds/0m2MYwnny2R4nfQZMBmpLHa+1TNRZobzOq4qNFUWaGSTME/bk4L/mGWFf5Ako9OlUF5ayrEQjjNrN9LMuzqKgsx+wOjMTQIybipI0vCYv60s3VWJEv6gqDogQnoEuXY8OXFUblR9yOxsYNicWOK13+SeHji43D4nrSDyPdwoA6a34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Thu, 12 Mar
 2026 06:21:39 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 06:21:39 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Brzezinka, Sebastian"
 <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v3 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Topic: [PATCH v3 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Index: AQHcsG95+qPUQBW8mkCQ1zYbQAUpfbWqcADw
Date: Thu, 12 Mar 2026 06:21:39 +0000
Message-ID: <DM4PR11MB63125B8854507226B437EE0C9044A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260310091956.3171295-1-mohammed.bilal@intel.com>
 <20260310091956.3171295-3-mohammed.bilal@intel.com>
In-Reply-To: <20260310091956.3171295-3-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB5005:EE_
x-ms-office365-filtering-correlation-id: 70c19fdf-e664-43d4-47b7-08de7fff9f02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003|7053199007;
x-microsoft-antispam-message-info: TKpE5NTgophIbKZU/ULRlBekNMb3iXCWojDdrNwiJ96Lj9XTBxpUMvFoxM4vpg8ybGx02bixyi2ln2r8V0ahtBUasmKzMuEiSpQIH4YJY73t2OllcOs/ClnnvSAIIrexybuXyCAwwTmRbXYIw3oOyjEiuyj0LSfQ4RtEUoCEYkCrni6IYhnSoG1RQ8U9l187dYyoJjRqLmpjK6wLgdfd2thaHua/1qkA9WcPugi2HdzLZqUWhzUchB+jUnX6QQ0nGA182OGF6hTDVRcpJ+XVMS/0+lk+dgHlztqMBoAlro/LzvvoJolyVH+QT8AnQoZfs25/7pV2t5+DZdtKea/yfzq+3On5Pldi++A8fsx4U+6j7Gl8C1oqRUH4J1ExESbsCCUZgqD5uVljTEECCVWduqfkRYsy7Npw/2JAb3KquTKN87BKqj2JsI6qGi53e2PliOLTaDckCdYd2jovnGwvrSqDQWAB0xx5hRyEHGO5Jo/ctI84hFl/dzKSVpjfWoY9JK8rQp+g8cXY3tbIOQ70BS21MPlLnOrfAJ0dwB5kdLys1+lj0l0XcrRXlAtNFYgONFo58yyjAt6va54xmUSK9U94kwProd7Xs8xSbMg2q9rGA+MWudY16H9BQfJI5wAMYPYw8r5g64DQiv0y6OiLsHErAevMJSkWKPe6O2+M4tjCxM1z8piF+DdIDgQ3ylDhRLNpElI73erlMcbYy0gNXG8n93z+8R1BJfSe8xsV9pXoyn6rwoqrM5iOazEE9MxG6y02EN5En2DdMM1F0VzNMDUkB2v8QBw2AzUMZvLltR0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lg3QBwBXIvBpdHZO+JH0v3EryEKLJ3Owvvtcc3VlP49EM6VptoP0xazTl3Iy?=
 =?us-ascii?Q?llzjJKaTGjs+IH7298GstoQteMemqmW8ZAe+Eu+XVLrzZlDmeWPg7rBLGEfe?=
 =?us-ascii?Q?NYOEA3JjkgnsVmPdbSFmfC74Aze7GBnXsJcTPhDXvqJ6730kn9haUMWZlFiN?=
 =?us-ascii?Q?8q3yzKierEVh6VAMqyhMjaFgCDFlU+cGy6AGkuM3ErzTvkVG0e9qNTy8cqoT?=
 =?us-ascii?Q?4cQgDSYH95L9M+XIo+OePNhyl2jqHpxxMO4ulHfkd1BJP++6BOXun+fM6ggN?=
 =?us-ascii?Q?IKz6+Rzxqs5PT82F+VFGX7jQ9XwH74Dpb+LnoE/Dy3BlDNTMQICk4kl+x5cr?=
 =?us-ascii?Q?5AYF/GaJcot7CnY0GsIfKwb+0xbW4OV6EUxIUeJbRiZ6GqGMWjpmdzZaxXbE?=
 =?us-ascii?Q?jem0utN/YVpD+mYleFQwXGA38zQp/6pN2r23IeXaKanvo6UwN8SMgBbWi6vi?=
 =?us-ascii?Q?ueJ+is5pQpQd4mzGmexkIFYaJVASHXSwrW7f4Sbx3miH7qxOXqSkxU4hFMJZ?=
 =?us-ascii?Q?vMOT8FfQT+P0T9qDs6OyUQLwokF4akUGzhKb1rxtJeuAL9nDhYDSpjCS9gtc?=
 =?us-ascii?Q?Z0gfiLJFI0PqVu50NBgGndThw4FQgky7LCDb9W9D5yQyDjNUcg15ZIewAUrq?=
 =?us-ascii?Q?J7Pwfa0Y1tu4YjrFyFb5Ps+3zEWyw5p2q14nKxgmA1gRvA0ENmzzkKbJY54w?=
 =?us-ascii?Q?gxTJKzgkGpgrNJ9RhmN55S5bJFLob+cghQyd2arGtBbfF+CVNcQoSy8rwx+3?=
 =?us-ascii?Q?dd63OVRn3heZdTZ3QEIebeguhUwugUc7WTzC4q5e715FKnxFWRp+vLAckZ4L?=
 =?us-ascii?Q?Y6Mm6LfsUYQ2nGovQYq75TFlYgnr+/R5Bi1ELm88UJBdcCtppd3EqQ2v5bY1?=
 =?us-ascii?Q?2yeaiktXGO9QsH1rPpxuV1XPPkrP+eJySHlX7j3OWCbsJHzb2PGSC47z/rq+?=
 =?us-ascii?Q?WkufgntmsmE41xixFA44XwdW7FQS8PFAr4uN6Jl2qkkoPLt/N9BLBEUurnX3?=
 =?us-ascii?Q?lz8TNmMA4fh/2wMhBIN0tya4ltCW2OVg83FjBmYrrxrf6+z4F60nAhWTwziy?=
 =?us-ascii?Q?Ad2GfR4VAQwGIQ5DVmXGmq5RMJ8874Obl8BVuRP4qPVwRwFU4QqC9AduUCl+?=
 =?us-ascii?Q?lOxxOfy66QIfjgE5V+FKi9a8p+33EQc3uuvZGvpLVgwzwBIR8WBpeaelaJMQ?=
 =?us-ascii?Q?TCOI/R3ZRx6R2BPPb06q6Ut/9niAA1Au2hC6t0HQeRog10+FYZdHf+4JUwtD?=
 =?us-ascii?Q?IKcxdO4XG+SX1JwgQyY9KG9och2QoTL49fTEMLkIWAp08epmWqHTpGF6pWvA?=
 =?us-ascii?Q?nQKforGs6nbfzqma6Dr/PAeJAB7lsPahvLD3P0C3Csr1h0VU4Y3myoXH99Zh?=
 =?us-ascii?Q?oQyRrpuworbiEnz5nEmitsZXuOR3hQQGEjUvFT19LwrHjBO+14/V9J8Xlsn8?=
 =?us-ascii?Q?ScW+aLnJdSLZh3FZm6bN36jv6+GZw3xqgG8qUIPHmDlv/1oJ5BJXPmbZEZc2?=
 =?us-ascii?Q?cCZOW5UT2FE4bfPH84A1FLiR3Y08zE+LGXE1RkqlH2oT3v+MjyBjy910VIzV?=
 =?us-ascii?Q?IxVxvpxoxiVELt1fCCBuEr3p8yyh+wiEvju6Sp5MJgsIi7/INjyzaQ4pl6/A?=
 =?us-ascii?Q?PzKoYffTnOOgAu2DW4+HWpZahdQbtvkExaemLHwfk7xzTFt8CvWhdD9uFcsr?=
 =?us-ascii?Q?oAY8j1TD6MQqJbhpnE3hzmMLyBP5XZbOkwytyNkAVGa6QxAh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tE4ZLMhsK9fXAa0+zlHYFrO6FAGv9WFLqOWkRH89c3RjvdM0Hd8wQh2W9WRWJ29BM3CyiQUT4XsOcAbRx/UD7m0WZAHbGxSp6b95yixJ7URAIXio9qGa/KBWlgLyrVzKFIFR/PSpvDxisdEzTH13JxT/UARIiUnYb+LVBoG5cEdo2gGvp0vUnbMC/GGQSM5nJHwVsWNMQvLqlkE/sfBGhIN9wZPkK0WFnmKI4COmeuGY5AqBde/Ujt3u7qumM67v/8TzNEQtQWkVj+AsDuJrNgt4FSn4Mmc6n0ZuhvsAeH1ST8eT7QKfny5GtiCNkw7AiH4PRKennnPw0FAbed8jew==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c19fdf-e664-43d4-47b7-08de7fff9f02
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 06:21:39.3709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKsQr6bvZjfEeDCGURdT6g7MrDgaY/7J2XU31z2twupzYNUDW5BcFQBYD0IUHfF2m7o9eLgoOnJeDaO6aYxl4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
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
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: Tuesday, March 10, 2026 2:50 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>;
> Brzezinka, Sebastian <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> <mohammed.bilal@intel.com>
> Subject: [PATCH v3 2/2] tests/chamelium/audio: Fix resource leaks on asse=
rtion
> failure
>=20
> Fatal assertions can bypass cleanup paths, causing resources to remain
> unreleased when failures occur during audio tests.
>=20
> Replace fatal assertions with non-fatal checks and route failures through=
 a
> common cleanup path to ensure proper cleanup.
>=20
> v2:
> -Refactor check condition (Sebastien)
>=20
> v3:
> -Update assert logic (Jeevan)
>=20
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 51 ++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 16 deletions(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_audio.c
> b/tests/chamelium/kms_chamelium_audio.c
> index 2967e3c50..252a36274 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -389,11 +389,11 @@ static int audio_output_frequencies_callback(void
> *data, void *buffer,  static bool test_audio_frequencies(struct audio_sta=
te *state)
> {
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
> @@ -426,9 +426,12 @@ static bool test_audio_frequencies(struct audio_stat=
e
> *state)
>=20
>  	audio_state_start(state, "frequencies");
>=20
> -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
> -		     "Capture rate (%dHz) doesn't match playback rate (%dHz)\n",
> -		     state->capture.rate, state->playback.rate);
> +	if (state->capture.rate !=3D state->playback.rate) {
> +		igt_critical("Capture rate (%dHz) doesn't match playback "
> +			     "rate (%dHz)\n",
> +			     state->capture.rate, state->playback.rate);
> +		goto out;
> +	}
>=20
>  	/* Needs to be a multiple of 128, because that's the number of samples
>  	 * we get per channel each time we receive an audio page from the @@
> -447,10 +450,6 @@ static bool test_audio_frequencies(struct audio_state *=
state)
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
>  		igt_debug("Detecting audio signal, t=3D%d msec\n", state->msec);
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
> @@ -587,6 +595,7 @@ static bool test_audio_flatline(struct audio_state *s=
tate)
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
> @@ -661,6 +674,7 @@ static bool test_audio_flatline(struct audio_state *s=
tate)
>  		}
>  	}
>=20
> +out:
>  	success =3D amp_success && align_success;
>  	audio_state_stop(state, success);
>=20
> @@ -776,13 +790,18 @@ static void test_display_audio(chamelium_data_t
> *data,
>  			audio_state_fini(&state);
>=20
>  			alsa_close_output(alsa);
> +
> +			/* Fail early if any test fails */
> +			igt_assert_f(success,
> +				     "Audio test failed for format %s, "
> +				     "sampling rate %d Hz and %d channels\n",
> +				     snd_pcm_format_name(format),
> +				     sampling_rate, channels);
>  		}
>  	}
>=20
>  	/* Make sure we tested at least one frequency and format. */
>  	igt_assert(run);
> -	/* Make sure all runs were successful. */
> -	igt_assert(success);
>=20
>  	igt_remove_fb(data->drm_fd, &fb);
>=20
> --
> 2.48.1


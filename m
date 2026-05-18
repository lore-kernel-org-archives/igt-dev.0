Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBADCD343F
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 06:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971D010E679;
	Mon, 18 May 2026 06:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Axb2i5cL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D3F10E5B7
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779085185; x=1810621185;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r0IWrFz4dMciTRtrKntLGo3wd2x0znICPHWTFhOlshQ=;
 b=Axb2i5cLiO4oLkSkcCP5ra5MgBLHBqwunSsQa+7cZmytYIFY9USpxyZW
 qy8wmZ5WwXk3b//4sOxogLY/bI29s5CoGegc0v3OUx9Qy6KKvCfaO2+7U
 xtvvtgUr40eCWkZ03hUW3YPiGTqLJglbDXvoV5xu92DeM5a03Mj4TdvEU
 Jy++jyXJonPKd1Hu61NOE1hNTiCO6k3jX6g/lgwahAckEapW1J4G/bXrf
 J8CPurL/Kuod2FzMOveyIwDonvyk5m0JYg56O99CwLoPsCZ0G8+kO0+FD
 aw5+9tn0om87bK1QnhpLnMsIHYDc5mViROhxuCNQot9yM5Zr2Mc9dTGmU g==;
X-CSE-ConnectionGUID: gL1tdBeDRu+eF/ZAHQkwqQ==
X-CSE-MsgGUID: hw7q4k1dRD+FVwmI++gI3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79910566"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79910566"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 23:19:44 -0700
X-CSE-ConnectionGUID: J+RtNMLoTpGFqqHZ3IIoBA==
X-CSE-MsgGUID: eZQNOcxaSoirjpDVel6aJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="238449220"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 23:19:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 23:19:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 23:19:44 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 23:19:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvG4LZStZGMLR+GsHKNhtUPhB0zYxlwKVRX5sXGJjLAnTrkATWkIqq7yKaeohBURjb/ob7bJb3MOvIYiOdZMfLziEcVzE2vZhGo3P4LooPKCB+FRLhUdPjy8xZ2Aq8AptmKxD+UfX8NAWUQ/edRSWGepDaLSajZuqQL7+M5ytkoRXKSpwn5KVHMGLmGj5LhWEOzplT8ixUpPc4Ol0O9B4FeZydUGAvVlqkA9y/jlWQ48AZQ3lc7WklgK18NqAMDOZlXoYp1ekXGMAst4xzGf1gEsN8PlAzmDzBN7hQQssjRJ2zTCj7Skc86NhafHYYnMfkB8Kze8wzkfI7hNoZXtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCVw9FdNC3n7SG62KmwwhouqFcK/S+G6bTJoK5aWaOs=;
 b=bYNdIZjrD8gqb8ayaqDOhTZ6+zS24zzk/uOLt0oed6sqZDkH7X+uuUrNPQvdLj9I4Ln/V/QfQ06jqGUepRkW10fRG2looE2CIkGuDTRjT7HSjDa6se3thK6ZphRahlJUGmjKxv+9pTtHT01CpMUdnuVw97r0n641OkEIcHVra5fBNL5rMB8vv8MsTKAWsJhWEdPlXQTFqJjZ4/s5XSP/CMKoW95S6svz4oPxzt+p7rnBQFON7viAiE2M2CFJDtDwK85yaG0h+Wgo7b2FLTo0zBchIzYt44GNRvW28XmsjoZ6/XY15CUVNeOcNTu+oaBBo+ENK6m6AZ7IDau6l21LkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 06:19:40 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%4]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 06:19:40 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Topic: [PATCH i-g-t v3] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Index: AQHc5DQr2vX1ueXQ5E+6TvTjXJWwfLYTUn+Q
Date: Mon, 18 May 2026 06:19:40 +0000
Message-ID: <MN0PR11MB6034EECE7BEDD559F6B45C1981032@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260515062733.732263-1-jeevan.b@intel.com>
In-Reply-To: <20260515062733.732263-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|SJ0PR11MB4911:EE_
x-ms-office365-filtering-correlation-id: c0a0bd9e-e776-4d10-c8d4-08deb4a571cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|38070700021|3023799003|11063799003;
x-microsoft-antispam-message-info: AbGUJMrPi3mQHuR5ee7DQfMaKbRX3Gut2NEThYLofsj18a8esv3q6GBgBQZjb2i3O0FefE3yT5xiGELuZ5r/L+l4+E3SoalCzEWZKGhB04+R2kVIJkNHUq6QnC2wdnkb0+eTjXgjzqUC71TQWzI58SpFMWlTwPAVQWaG0wrAmaVtupwoaIVA5PqriMoVUtcCKoPdaCqhwhwyUoBrW+eMuI6Oh7b9e5W9Aw6Y9r6OHUR+pWgoEAxxGhi0Wy2pZaAqLvaDvwIkAUdmYlNfr76roWICM1n7cah7jdPtUHTH+qZw4wWNAU5HV3lmc4OvQHjuauJyfE3KD2BMaoqtVIlF4zMe0tCaBj3XjEMVovuiECNGJR15O0b2WhRtsD4fZzDCwcE/nKy5SXwFw7f2fD1XJp5GCwNNhUtG0BfTe6NDKiqFXALnQtFTRLwPwSpp96HZqLQFrjO7fzHVv007eFtcbgBtDebbf7jk9j5Ud20jb6zvE6jxOMRsx5yoRoDE6xFeKW4UyRK8Aj5n91pjKTOnkPC/KTHsVRuMc3wDJhHxvIhZndZnD68IBb/Rw8qv2uKRXu7lezb0Ikalh1wlunFXPrqk38Dt7JLL5EK8rPyz6eJWiRoBrb1xQVceaCmm8HMbPNgtqjLUQmvbzPdzkhR9Eq38ptJQC/Js4AxwIxovKlT77O+dsaHwRVRp4RkGgJMQRs/ZRMJsFu9s3KS37s23OryEXcsLpJQU1MTCdS6++1tn/7VkLUExNgbzh1oNx/Ud
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021)(3023799003)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TxnxAPRydDDelobayiPkJMJfYKRWTSRlq3xX2bu6pMfZJaoHP9LrcfkearwG?=
 =?us-ascii?Q?/UD0pkNMyAMuVjCthkIcWkqDJ2Up1z7xnj34dKOUeFCTmu8KztTz+a6F1iWk?=
 =?us-ascii?Q?0bdQ2iaaaRDTcIfPVe1F05912A/bPrggY3/LbLjGQD7v2vG4pGFckBY0D8GE?=
 =?us-ascii?Q?letjhzKxHsV0VyzPNJvkn81kdhPWkUEMqcCKfZNbqApw0O0ez4pUYP1HS90H?=
 =?us-ascii?Q?hNCZ4sWBVnhwAuvYS3FyErY8eLV+sURIORx8/Dyeej1iYXNz0obiKXb2ekx5?=
 =?us-ascii?Q?Xtm+xnMBfcmJg3eMiw6GcdTrbvswW8nfL+HWdM8FVLqPLSq8DFLlhSORM/F5?=
 =?us-ascii?Q?Ve3kkcMcliF+WyjRh3wM2FVkRwtPMmbV3xf1JmHOMlaoaJawe+V6LfnfqQdZ?=
 =?us-ascii?Q?sN9/AJPSEDROZGgmYR78AowtkS7PjUCzQlPycBvS+7iEPiMGIeyeBr/+bRwf?=
 =?us-ascii?Q?mtjCEMyLQMc91BUsu7/fQLii0eDh2lwrzdG/rtLGfRmACh6VQo6ic+eUk0Ke?=
 =?us-ascii?Q?hqXodb5Ui2jAZnaQWOsKFyZ/NKmu/lCbd1/5EErgKY3lhmIYFt8lWiX+fltr?=
 =?us-ascii?Q?Tvr2DY+Ly6pTZrCePbmG7QIAYOgeofkxRSwj3X63tVNnAVpKNnBDVsa1keRk?=
 =?us-ascii?Q?xffDwpMw+jQ2zLHpqHsxXEumm/jDG5d5wx+/OOqDx2EZ6cbycrEV80wxCYdN?=
 =?us-ascii?Q?pFEFaheJithzsoiELFYOTCcWHuc53kLYTbeXjjmDlRjh0MLJ7y1aJ8AGRg5Y?=
 =?us-ascii?Q?HF0xL/uk1vNws0r49FKtmiSToyZOxPC1R0FHJaS6qfKaeBXCNPpcB/JXckF8?=
 =?us-ascii?Q?q2RQ091eAhnoSzC/xfNllJHuLOx2zY4raw/MCweTci89HAjDK6j4ZSdkqRX6?=
 =?us-ascii?Q?ceq0k1BekI9Vhfs26qAT9prwxBkBnhQE7qYSoI8KqfNPVnWQRLsMga8OetIn?=
 =?us-ascii?Q?ww++KvSGURDZ1csXYGbhJ/09C9zbhU0vq2kajvgYvz+kM0wgxftbh7Z7fcMZ?=
 =?us-ascii?Q?VXTKkwvF8SKrhx7w6Mz7s/jyEgCpmzCEx6vOQ8cf8zP+4T6gKE0lPZOjWGIi?=
 =?us-ascii?Q?QG2ordcpBIMqjmPOkpuxdxzIrDYBc3Vh7F0sTW6lK7/0FfXlAaEocr+cpy97?=
 =?us-ascii?Q?OdbpSExCjv1hpNSzIA1ea6KQhzGYY8Pq4oeYelHfWW6dBgHo36P26FnmpC3h?=
 =?us-ascii?Q?gESJo6i0z69LEOvpiiLWfDcc5s66cpZAZxyMzxQuJ/87Uc+1iAzb9jup2s+9?=
 =?us-ascii?Q?KjFiA79HSgvAK5NgtaraaTeejfcvcD4Y0MbedYO3PinRxy3/C/hX+qbd0dux?=
 =?us-ascii?Q?bly4r/+0PlMwLvPn3iYKbfoN4NhjyWhogEpOOeSWt2tcOwvv2oaX16ShP7gb?=
 =?us-ascii?Q?9Jqsj/7opDkyNtfsbuKz5gT//aNnFfYIlY7AGpIwMT541+C469huNA5uUzI9?=
 =?us-ascii?Q?xpKHii3JhwKyIv5Yl0O61ytHhXq8b4gvUYRFi8vaSPAtIUdJORZIXazOLEZw?=
 =?us-ascii?Q?acNj3oUJ6KR3XWkaMjtH33E3fVAYghnbNx4x70hOKyl8PHWKmdadhxWiyab8?=
 =?us-ascii?Q?WWO1Clssl9fVe67epT1wpHEgkzlt1xHSwwSXZUcdQ90MSooEoafYBo87oKDf?=
 =?us-ascii?Q?2/wcYBlXmKWxVqnDK+WOz0/SD4BtZdfW6qLcEIczuI4Al+QZ5jc9tRTliThZ?=
 =?us-ascii?Q?yCT1Ql+G6N8UBvQXM0BADdmgh4r75wD6FBW4GF3BNGgu1ZW8+ABj5H0pi7cX?=
 =?us-ascii?Q?uFRDLWOJAA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aZRj+l84FsgGO5ICsNrm6Z3e7TKyJMWUNNAaT2wTUIUnE2/FCnKnXSiMb4PFcMNClRZhVqnaRNoRtTpD4XuBVpP4UwoZpABHOxlhSXZiRaulZCHnkl5WYWQ0lJCGVdzcVJGCuOmu90GvELB6LOdyBqfGaKrlR+dwAvnTwMfm4jzL7HlAwrYdPJzLK02R/Nmr/BO9LtB6nbKlFRoMAJX0Eog91ZwtXqu3VPMOLUTef7jdsM4cmtE/K3hL/SNpf49JDJ9P3M7QS05KRnMjYbbDmWyOKHLFIbtstaexcvczzhdsjB66hOqnIcQ+mFVYPOBE4Vy6+vB6YqtCuFO9VKNaqA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a0bd9e-e776-4d10-c8d4-08deb4a571cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 06:19:40.4881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8U9f4pNbexXbNX+D9D5Yglj4rhEsAlVq3EGZw3E2zElH4gKLMqVcAtNhBo0v4J+IQMbbvTlPT3XnDMmJ5eu/slYJ8Lrw130isxiWK2Ea4kE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
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

Hello Jeevan ,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: 15 May 2026 11:58
> To: igt-dev@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Bilal,
> Mohammed <mohammed.bilal@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t v3] tests/chamelium/kms_chamelium_audio: Add
> suspend/resume audio tests
>=20
> Add test to validate audio works before and after suspend/resume on HDMI/=
DP
> connector.
>=20
> v2: Perform a single suspend/resume for all audio combinations.
>     Re-enable chamelium after suspend and separate pre-suspend
>     and post-resume validation paths for clearer failure diagnostics.
> v3: Drop commit and use igt_assert_f with explicit messages to
>     distinguish failure in audio tests.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 149
> ++++++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>=20
> diff --git a/tests/chamelium/kms_chamelium_audio.c
> b/tests/chamelium/kms_chamelium_audio.c
> index df8d27c0c..5714411ae 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -52,6 +52,12 @@
>   * SUBTEST: hdmi-audio-edid
>   * Description: Plug a connector with an EDID suitable for audio, check =
ALSA's
>   *              EDID-Like Data reports the correct audio parameters
> + *
> + * SUBTEST: dp-audio-after-suspend
> + * Description: Verify audio works before and after system
> + suspend/resume
> + *
> + * SUBTEST: hdmi-audio-after-suspend
> + * Description: Verify audio works before and after system
> + suspend/resume
>   */
>=20
>  /* Playback parameters control the audio signal we synthesize and send *=
/ @@ -
> 695,6 +701,65 @@ static bool check_audio_configuration(struct alsa *alsa,
>  	return true;
>  }
>=20
> +static bool run_audio_test_once(chamelium_data_t *data,
> +				struct alsa *alsa,
> +				struct chamelium_port *port,
> +				snd_pcm_format_t format,
> +				int channels,
> +				int sampling_rate)
> +{
> +	struct audio_state state;
> +	bool success;
> +
> +	audio_state_init(&state, data, alsa, port, format, channels,
> +			 sampling_rate);
> +	success =3D test_audio_frequencies(&state);
> +	success &=3D test_audio_flatline(&state);
> +	audio_state_fini(&state);
> +
> +	return success;
> +}
> +
> +static bool run_audio_tests(chamelium_data_t *data,
> +			    struct alsa *alsa,
> +			    struct chamelium_port *port,
> +			    const char *audio_device)
> +{
> +	bool run =3D false;
> +	int ret, i, j;
> +	int channels, sampling_rate;
> +	snd_pcm_format_t format;
> +
> +	for (i =3D 0; i < test_sampling_rates_count; i++) {
> +		for (j =3D 0; j < test_formats_count; j++) {
> +			ret =3D alsa_open_output(alsa, audio_device);
> +			igt_assert_f(ret >=3D 0,
> +				     "Failed to open ALSA output\n");
> +
> +			format =3D test_formats[j];
> +			channels =3D PLAYBACK_CHANNELS;
> +			sampling_rate =3D test_sampling_rates[i];
> +
> +			if (!check_audio_configuration(alsa, format,
> +						       channels,
> +						       sampling_rate)) {
> +				alsa_close_output(alsa);
> +				continue;
> +			}
> +
> +			run =3D true;
> +
> +			igt_assert(run_audio_test_once(data, alsa, port,
> +						       format, channels,
> +						       sampling_rate));

This inner assert defeats the goal of pre/post-suspend diagnostics:
any pre-suspend failure aborts here, so suspend never runs and the
outer "Audio test failed before suspend" message never prints.

Also run_audio_tests() returns run (was anything exercised?), not
"did audio pass?", so the outer igt_assert_f is misleading.

Please aggregate and assert outside:

    success &=3D run_audio_test_once(...);
    ...
    return success;

Thanks,
Mohammed Bilal

> +
> +			alsa_close_output(alsa);
> +		}
> +	}
> +
> +	return run;
> +}
> +
>  static const char test_display_audio_desc[] =3D
>  	"Playback various audio signals with various audio formats/rates, "
>  	"capture them and check they are correct"; @@ -789,6 +854,80 @@
> static void test_display_audio(chamelium_data_t *data,
>  	free(alsa);
>  }
>=20
> +static const char test_display_audio_suspend_resume_desc[] =3D
> +	"Verify audio works before and after system suspend/resume"; static
> +void test_display_audio_suspend_resume(
> +				chamelium_data_t *data,
> +				struct chamelium_port *port,
> +				const char *audio_device,
> +				enum igt_custom_edid_type edid)
> +{
> +	struct alsa *alsa;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +	drmModeConnector *connector;
> +	int fb_id;
> +
> +	igt_require(alsa_has_exclusive_access());
> +
> +	igt_require(chamelium_has_audio_support(data->chamelium,
> +						port));
> +
> +	alsa =3D alsa_init();
> +	igt_assert(alsa);
> +
> +	igt_modeset_disable_all_outputs(&data->display);
> +
> +	chamelium_reset_state(&data->display, data->chamelium,
> +			      port, data->ports,
> +			      data->port_count);
> +
> +	output =3D chamelium_prepare_output(data, port, edid);
> +
> +	connector =3D chamelium_port_get_connector(data->chamelium,
> +						 port, false);
> +
> +	primary =3D igt_output_get_plane_type(output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(primary);
> +
> +	igt_assert(connector->count_modes > 0);
> +
> +	mode =3D &connector->modes[0];
> +
> +	fb_id =3D igt_create_color_pattern_fb(data->drm_fd,
> +					    mode->hdisplay,
> +					    mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888,
> +					    DRM_FORMAT_MOD_LINEAR,
> +					    0, 0, 0, &fb);
> +
> +	igt_assert(fb_id > 0);
> +
> +	chamelium_enable_output(data, port, output,
> +				mode, &fb);
> +
> +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> +		     "Audio test failed before suspend\n");
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +				      SUSPEND_TEST_NONE);
> +
> +	chamelium_enable_output(data, port, output,
> +				mode, &fb);
> +
> +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> +		     "Audio test failed after suspend\n");
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +
> +	drmModeFreeConnector(connector);
> +
> +	free(alsa);
> +}
> +
>  static const char test_display_audio_edid_desc[] =3D
>  	"Plug a connector with an EDID suitable for audio, check ALSA's "
>  	"EDID-Like Data reports the correct audio parameters"; @@ -866,6
> +1005,11 @@ int igt_main()
>  	connector_subtest("dp-audio-edid", DisplayPort, &data,
> test_display_audio_edid,
>  			  IGT_CUSTOM_EDID_DP_AUDIO);
>=20
> +	igt_describe(test_display_audio_suspend_resume_desc);
> +	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
> +			  test_display_audio_suspend_resume,
> +			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
> +
>  	igt_describe("HDMI tests");
>=20
>  	igt_describe(test_display_audio_desc);
> @@ -876,6 +1020,11 @@ int igt_main()
>  	connector_subtest("hdmi-audio-edid", HDMIA, &data,
> test_display_audio_edid,
>  			  IGT_CUSTOM_EDID_HDMI_AUDIO);
>=20
> +	igt_describe(test_display_audio_suspend_resume_desc);
> +	connector_subtest("hdmi-audio-after-suspend", HDMIA, &data,
> +			  test_display_audio_suspend_resume,
> +			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
> +
>  	igt_fixture() {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.43.0


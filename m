Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F09CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 06:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A108510E148;
	Mon, 11 May 2026 06:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0viNQhi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2E410E148
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 06:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778480573; x=1810016573;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GXve17NLG25MQxGjHs5xmQzcf3s0R6I0OEpRAGJTvFQ=;
 b=K0viNQhiGF0WcHaWFAXfl52R4YdUdeVKQ5AG2qDay0jO8VbWS2bH4UcL
 Y9ICOYjuks48TMba0vSQKUvairPdI0mFtWA7DpR0cBR11QzPJIzjxP5dC
 cZjEQLwwpGlxWf81bfHrjX/opXwi3U1IBajuZfr8ZVENN6AaMJLchxugA
 v6jp/WYQn8nixsPTf5dZJ0AtTgwSdYgr87nPCzBj/MOvn95/KQ7LXaOtr
 BRtWoQyE8gd4ll7tXk3qNXjD/vCoT9HCxslDiAJ7mMOGOBii/Ufx8snKq
 XYf8S0g/HrN7C5ukN5IBpOKPteqzf4ADniseOkGnPXuAzAWHAL1VH/OdR g==;
X-CSE-ConnectionGUID: gIsSdquKQYCCEHvVRay3SQ==
X-CSE-MsgGUID: bMO5eMjaQz+l3LOtBaF4zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79382421"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79382421"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 23:22:52 -0700
X-CSE-ConnectionGUID: tAaxJ7OLRjSobdNby9ANNg==
X-CSE-MsgGUID: Gy/+oTSOTZq5/RerZ+htmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242333067"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 23:22:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 23:22:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 10 May 2026 23:22:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 23:22:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkyZIJJ418GkTvIkd/WHgypN5/or6qKEIuwRUc8nSivz7+9LKN8ZYRCv+NcSi3BUdhd6dz+tc5JLg8n7ziFhy9gSzIYxTjfp8CL/xzb23Hc2rtfKQvVmx8SVEYzO+2y+bNCdCJmNGdCSF2xaP20gbwRzDBVbYeHcOtDwx0TYQdMaCtG1z/bki3BTloJvPIlB8f00en48hGUhJAmN6Ma9M0pFoVrvbmhuf79G4OCo/D2D2K66iWRGHGJBnLjS7CgWbgUvp+1gyQPxjSjWDsB1xbNyY3ISML4hX71vJ8oohP/tetn6XILijfj4O46ZSRB0AMQSGKc6XjQeYjsZdcsjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bF8sk6J9zOr9gvhceNqKJePEuDs7RigP7Q21W8zxYs=;
 b=Miv0ohcnRZlIASr5TFC5lLiajSEaIF6gZdf7fAcGoZaB3qFmorbF8nohYoBGroFsM7OcZc9SbijzSJ/5/PXg+13ucRkuIKAGbSnHD2PFFarCO0FyBY+1VlWofvpeIyTyh2280fTCi9zrOmrM4cyp4flgBZcKiZMhqed+++5KsiAd6+CeXsJ/i1Z+5dTCL5JpXKWGMQkrOfepXVwOl0AtnSEP+pfhdZOICgFUzqTvPK+tcPVBeTSMWCISTUW3Dkp1Hbgfa5jx6UGxJBlW1EiS63gfgPJJCyfID+kCAhZ3O87G8FrWAF/JMvHyWAZTs+O5G8SrYPfMEGmJhKDTMKhd+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by PH0PR11MB5901.namprd11.prod.outlook.com (2603:10b6:510:143::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 06:22:48 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 06:22:48 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Topic: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Index: AQHc4P2GbrcGJY17HUq4l6jK8kbkYrYIU1lQ
Date: Mon, 11 May 2026 06:22:48 +0000
Message-ID: <MN0PR11MB60344A9E75BBBC41AD1C709B81382@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260511041844.445925-1-jeevan.b@intel.com>
In-Reply-To: <20260511041844.445925-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|PH0PR11MB5901:EE_
x-ms-office365-filtering-correlation-id: 92c20a57-419f-40fa-ca82-08deaf25b8eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|3023799003|22082099003|18002099003;
x-microsoft-antispam-message-info: oHDCocU2oTgZl041j78IYl04thk8IA81AnDOKXBpTGGVAj2ssblDSEtYazu4H3vWa6ypbVnv/BtqdB+bc+BxCbq41vvGIp+S2zUNcifsbdSsBtAhp0FT9XGp+A/icmec3SJRc/Q5CUNT6JVqO6zkNM8wn9kUfRNoz1fJqNdjpgBr+lzk2SzNJkXa+xaCmJmZ0U0a4fJaskuUYx99l8OhJJ14aiG4/trrRbLV5G+eASybu8C19VPubeRrWjJVKUmrEItWzj9ax0nJJBgnOT2MXbsDMhxBat4fVkw+DKD30t9ZeUY4SAd+Qsq1j8kWqu70O7Iqw4kNgPC1zUU6o87xTLTrWlPJSSYs11GhOBlx1GfuXgwsT4KVnwN/M2BnuSx4BZ0RBoxW8DiJuxOMT5u4Jseg3Ufe0VBL/ewExVy8ylasNOQBnamfKio7tP2WkmOtFGn3nQ6h4nbCxy+IwrnyArYUUMyO6WRH3izknBMESGtCHeoLLMHqLwISVx/OzBJjSzR+zAe+0Xh14EdrS20e3nq8t8jwP8ORxefxG5wZARB8EtwiER/d+AqmDPh0u1kTvZrSYWldLjuZiUPdMSZSMZszw/wS7hyU9WG2WTqN4Nlf9t500mN0PCMmPIanOkEg0WJiOHekp0ZqBgF/l7Za8TNrc9C/HyQ52dABCRk6ZJxqcuzay0CyGB7hIGyzdDl/a7X5CvUiqUgjLq9Or5f9TQWtU+OvLAje3w1zKtf+bMVguFQOCrrmy0lW6GDYLEn8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(3023799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ow1bjKGr9Lw+uGX/mT88dDmy+U6NDXraBPze4kAxQ0puYpAC/ZXDS+yCzAOY?=
 =?us-ascii?Q?MRBwZtyxg7jGwbFu+CADvQMv5l3vLd3vRqqO7cDceD1iViQ6Q3JHvZRu5XGp?=
 =?us-ascii?Q?zms+/aEkRJw7RhrdyjjcfRzdMmxjdfhOmTjGcH5HhrDe0G2u+fN7ql29k5Ou?=
 =?us-ascii?Q?V/M9H9nRu2IcoqRqmBG/BXxx9DzJGP3Z51FjRt1a/YQiEt8/YsyzWKTx/kbx?=
 =?us-ascii?Q?jv8U4ZocJyxNn8X8GASsemRt12WHoIaYgBxRAu+wCO45CQXD0Xs7bxpx83Kb?=
 =?us-ascii?Q?nZ0RHgABnvqPS8gQ8jThG778X1c1xcQVgm9/ooy01woLKGewnPFDN2cW3cZs?=
 =?us-ascii?Q?798mFGY3NyylmI3ggGwXjfl8UTzztms3ts5tnT2DMbBOH9SAM8Z3+uTfYBT8?=
 =?us-ascii?Q?qKeAgw2tfd1i7VEv2FI8bbnVhQrh2V6mZNQya58jTgyvMW4A5IOlCRX4Uohf?=
 =?us-ascii?Q?UxNHH6KrdnOXCyfCls4c+RBCiPbQLCeGMo/tY7c/xac+6u6Eb9RLRRkxlbB2?=
 =?us-ascii?Q?QvZ8NkmCsYb1sfaKIb5GE2iJ5/g8jewLMso6ixbxgKmnzAWKgrTRfjgwlBUc?=
 =?us-ascii?Q?AEGvjwcJuQS8bEAF2yMtxaqASXKmajgQIcQofqkz8aPWYwUCkaHHc/f/I+5Z?=
 =?us-ascii?Q?RFJcaSkrgeKnaqqUntTJMJfCzcQVObyMJU+hJJF7ZxhKkK3i832m5+bTpo+B?=
 =?us-ascii?Q?S4j3BRWhrfbxJcT0hiKq7f8pNw/H0+ieBsTR14bDxN5GdAdoyOX4lQf/PDLR?=
 =?us-ascii?Q?WIba4jI4K1Tt/+2WEdVaPmXD+bnAG3n3KD/euXfwR9EdhsIBG8RLXW3BrJen?=
 =?us-ascii?Q?+QncfJMfENj2QK26ROqOnXInG3RU/hOdCoUkdGhxTE1T1YqOeJryEJKupzA7?=
 =?us-ascii?Q?91x0VnDmllnYwTTJu1JykB4MDjSe1o+1LcNHNxL2MghzDyzyZwhtZXE3uBY6?=
 =?us-ascii?Q?xJHLZ7fUY3jaXr5EQ2SWCcQa4EwD7278OCQq6u+A5+h+Cpc9DSnOHI1iCu8S?=
 =?us-ascii?Q?tBPNOC7qKJpSSd37fn5n8RgRfesJ+0JpGzIlpVjWxhsbi3fxPgDZQdqux6Li?=
 =?us-ascii?Q?9KArOwYFs+EgYHjQy1bYbtzlNoRdE7h81doEhc+hVX9K5IU7rAjifGwZlAEq?=
 =?us-ascii?Q?VJfuxPgEs8PkVJcFQrfNIemGOLK4DFlN8emfQMGCYu74eTWmYm+hPvrGb/vF?=
 =?us-ascii?Q?GLNmR9hU5v03UPO1CFS/v+THRaz9O1tQc7Q+F+tZs2CntUMtzhfCMOgovWuy?=
 =?us-ascii?Q?BEcmLoCkkV05+tSKc/1jmrCMHG8IJIzgJiWexsYDTtEY83u5XzVwfFBqzrMM?=
 =?us-ascii?Q?LZF13oDawYuaElZo/C4QWWbSMO9pDXxiu8xG0PqdPPyW/bzso8lEE/o8hXKq?=
 =?us-ascii?Q?h4ZMhE7/Sqd7G7hr8Z7wtvU6gMAl4NlDTHVzB5o99pvJiNdtWzUzA1LQYyen?=
 =?us-ascii?Q?3E2QTrYogrHa4NlSEJ8GnN8C79WTILQF1QJSwEBIh9reLQgLcL9l4bwvPzby?=
 =?us-ascii?Q?KCtpp3aFfb7j8EgEhIxjNuGMW0SZhaggampnrf2KZkqmpE++s3q2C6JNGA9h?=
 =?us-ascii?Q?pzApWxDPyISfC60I6zFVWMrdCwISCtYyYTtxH6fJKUBzn3dzyL5oXFYS3NLb?=
 =?us-ascii?Q?/jxzUyKCm0NbbYne4H3h0A8yq0JNtvNOW51/7IjlndKyqmdQUVjefNQPUo8g?=
 =?us-ascii?Q?7CejAo+xx2EwXdWnCvUTyi0aqeZdrMxfaQu9VYDOG1w/b+gblG34gw2imJ/p?=
 =?us-ascii?Q?hyb0YjO+TA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: byLhaMIwlAvRwb0UEXYoq4RR1/Hn3ROfqALng88s08pINTOJ/ZAVrsEUXOS9BWy+MXEpCXnSd3CEkubBUgtjTvXQA4BFE0w86FLQpKZWDvDuB67eB5wGRgNc4iNZw2unGRDeT4odS3mEvgceL7cthPtx5NAHWjCIZTSZdYpvXaZkvhK+shXNQrPiW6i0NCmzfQt2mMQqOh2b9YN/GpC3LjoYwdxapKe25KZhVANHtmOgzbLJoQxHk/SOC1P68vI9qTzSN/1ekv4u2HDcxX0Pnmm3bgoP4AC19KotbRZqyQZOOtj/G0IrUhRoLWdJuSSL3S6bdX/ZNxszxzvAGU5mpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c20a57-419f-40fa-ca82-08deaf25b8eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 06:22:48.3872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1vEi7pYRnd60SRBo1uz7Dgl0c0Ki8zYQFHDQtS3kg8ojO9RLCAbqpjw8d1Dz7kep6FVA/ZKcFQ6Vd9cwQBmr+cb7j+JpyLULw15vLqWsA4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5901
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
> Sent: 11 May 2026 09:49
> To: igt-dev@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Bilal,
> Mohammed <mohammed.bilal@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
> suspend/resume audio tests
>=20
> Add test to validate audio works before and after suspend/resume on HDMI/=
DP
> connector.
>=20
> v2: Perform a single suspend/resume for all audio combinations.
>     Re-enable chamelium after suspend and separate pre-suspend
>     and post-resume validation paths for clearer failure diagnostics.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 133
> ++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
>=20
> diff --git a/tests/chamelium/kms_chamelium_audio.c
> b/tests/chamelium/kms_chamelium_audio.c
> index df8d27c0c..2fd8322e0 100644
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
> 695,6 +701,46 @@ static bool check_audio_configuration(struct alsa *alsa,
>  	return true;
>  }
>=20
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

[1] I have a doubt: if igt_assert aborts here on the first failure,=20
are we able to determine whether the abort happened before or after suspend=
?

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
>  	"capture them and check they are correct"; @@ -789,6 +835,83 @@
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
> +	igt_assert(run_audio_tests(data, alsa, port,
> +				   audio_device));
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +				      SUSPEND_TEST_NONE);
> +
> +	chamelium_enable_output(data, port, output,
> +				mode, &fb);
> +
> +	igt_display_commit2(&data->display,
> +			    COMMIT_ATOMIC);

[2] chamelium_enable_output() internally calls igt_display_commit2() alread=
y
Is it necessary to have another commit here ?

Regards,
Mohammed Bilal

> +
> +	igt_assert(run_audio_tests(data, alsa, port,
> +				   audio_device));
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
> +989,11 @@ int igt_main()
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
> @@ -876,6 +1004,11 @@ int igt_main()
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


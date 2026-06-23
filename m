Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46F5CD4F26
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 08:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B9A10E9B6;
	Tue, 23 Jun 2026 08:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErsJcdt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFB510E9B6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 08:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782201730; x=1813737730;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BTSkog6CFFwVcsJRzhWBuyk/q8XboDBSYgMePBGdMjk=;
 b=ErsJcdt0JNFfeT9lr8OsTHYvQOc0ztOIClOPcqJzTQSu3WZsYZbwgx2C
 qDG7CUmN2RJ8rNuGqhvjYY2jA5MMIDTQEavZ5aDgdn+VIUQM7Yk0hIUkR
 OsGkBBbV9iGJyZwSsDioo6Fv+5qNMhd37tj8z6Co3Pc0wrt3uPKjRxNKS
 mtnBAPyBUmJjtHJ+S6ELyBVspji7wQeu6XUe6QPFzJcnE1wWv5JOCEm2a
 C83sHkHP6PzPW5lgPrc2aEF1z97GQoMQs4V5HxNuhr1AoAwN+r3b46HUB
 pr8IR10T6A11cxWrDExxU914UMf6IbQ/Uqx6a6bKSHUy8NN/uaNeUxVbL Q==;
X-CSE-ConnectionGUID: Ca1V9W1ZRFOaISFeurqvJw==
X-CSE-MsgGUID: jpmQ6MvgRJe/esvKuljsSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82706948"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="82706948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 01:02:09 -0700
X-CSE-ConnectionGUID: Ay+4oSRpTS+QmpRXrT1WYQ==
X-CSE-MsgGUID: hvFX459hR+uqtXgBMheeJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="279632744"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 01:02:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 01:02:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 01:02:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 01:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEQTrMfUzm7GHu/mYk1H8zqhi1KEqpSBHr9+5t+3pLpMT1MO1pFmTyZOp9NRpv6d+5yw1inFM87n5xvb4DTiS1eimnyvtcahoVsE7n3+sKFvEaEbr5zc7mgAOlwv/SJwkTv1P2FTkHEQIqpBafoXGGGLPGGznjozFpu5nI29h2Hb483hRuUUwCROC0nuMed02FQulWBetvBNkgvSTFZ62tURWsQ4iQPY3PHkN7v9fLhO47M34ghtjzaD9EwgggD+DWvEclPiIHolKmUZCD3vlTnY8j4pfq5xr6LiI9OZbN9AX7lK3C/RhVzX9MR6MkCAob83zJ6A/Okq8QGakYfu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZobI1HqRYipXXcjoDwPrQ01yJuZv1JTdbVEoXyn0t8=;
 b=iA47dBAqaq8Fq3eipH+5slcg6DUbWfG0EMx+1nm3lhNc07jDX1gyFB2Cfvvw6EcSgYRBFpIiSXnOzF+wqd6CIQLwLgs3SRlikfL8UoTg8MqtjJRLx0T0LUmZIuNxEkA2JqV+YtARAu2jMoBacldNtguJckvn3sVH1jKQ3suwEyDgAh8XLz6TO5f+wyIbPq/boevd1QmwgnaRoMWCPuI8QcvlGw2s2nWnlwxddVBwL23z++PAth8bnfPJWDTSC0UgaLCk1WC+/VKuN8eLdFL8zMdXHgiAaItYabQISQUHNfir7ThrHV+l09vqlQEvuHWBbxQ2Ej0P5v33jzVjvmG2Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA3PR11MB8937.namprd11.prod.outlook.com (2603:10b6:208:57c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Tue, 23 Jun
 2026 08:02:07 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0139.009; Tue, 23 Jun 2026
 08:02:06 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Topic: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Index: AQHc/63ecHe7MRoV5UmgTyKn09W2VLZLyLXA
Date: Tue, 23 Jun 2026 08:02:06 +0000
Message-ID: <PH7PR11MB605343A31D898E6D246E8FE7E7EE2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260619053815.2881138-1-jeevan.b@intel.com>
In-Reply-To: <20260619053815.2881138-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA3PR11MB8937:EE_
x-ms-office365-filtering-correlation-id: 4dca422b-430b-480b-0f14-08ded0fdb83b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003|3023799007|38070700021;
x-microsoft-antispam-message-info: bARoepvfMe4z7WHfA0HlxS16B95h/+xzDHt8O2REuPumt1/KoLhkjVEHjurD8iBGJWtk/lYxvE5Z4g+ShOx1232DUq+7ZoWKCKG/IRc0r2ZENsfWk0KwPS+v4YBUP5oq3vKhT9IOTh/Qq0vd159UEgmS5NqS4Bk0tOo0HvR8iVZ4mBhQLmhnr/P1sd/zQA/A6BkzOPARn6LOMPfhZ0CDFIjvXkTwJEb/RGQOCQKzTIGHcfwLMun82MmFTg6aK4zsb/8KlbEKMXzs4+2z3PzE/gHy731q3OonHb593P+kizg+nBO+0LyvG5+TWANmmbEXTfplNY94MguUdJKl02nmtL411zjCyrbni+RQFGwww3XApROsJfOe98DYwx2oPHSgWEPNFFEHxbKlm7J+k8rgws0XdTTKrQnIFhDopR0gXg0/lEeEDL49cr37YNSOaZj38Z7o7SA5fpVQENKr1wcQuIIQWDad3uXp7v6c5O1l9wIlvOUIO+XOx1FpVavRJJtKLYx/hlGyGD1ji3PDK9vWwCwi3BcTOp3vQ8W/MQfbUifw+MHOFQofSs5IFTo7OWwV0RgvUewz+oeuQPkiRhO2RSLghVlKP68oeDk6YmwcrdU9KPLaedLH+fAZMs6Vmpx8nWINMlEMh5cRudgAgdbeRGVasqA3sXlwP8dfVBCiqo49fi4Sa+Q1WjeneupsTxZ1VF0+ZfUh32vUqaPPwIhr1f3jC+yFduFzRG/x6BNt1x8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nfoaeuW5dkOYwFyFyR+RoEi6d0QoCrLpAbeSRnC+FmSpKYrzi42xGCXkYhT2?=
 =?us-ascii?Q?7m6lbu4pDa0qoDPr6jMOIycoyODXRsscE0DJAYkVYGETTAiiCLz6/rNCqXpy?=
 =?us-ascii?Q?JmgyJAr7f7vg7uVe7H8qIw8Rd9MXyNUigTQp2tIo2Ou5HoYC6EkAPM5CFZtt?=
 =?us-ascii?Q?xZsXGlt7dYVr8hVPQC+Rzjrq2gZytLxqdc1e1DvU0mwldGA7+x/xluMnT12f?=
 =?us-ascii?Q?qbXr3pws7gK50L6UmlquYJHShTF/lsHgM7kpLb7LVH3bjOZURxwcLcpOjzgU?=
 =?us-ascii?Q?rqLLSoaZGVomDcdO62fi/yKv5+MfxFjHjV6rOGnrMSPUqwz9XzXe6SKz0hf0?=
 =?us-ascii?Q?K3OgbUx48tVaWvXAoFrYb+jFWdkG2+jgAUmdTrhOOpRhpH128od/EC0E2VpF?=
 =?us-ascii?Q?yWZqyVgAHSp2G4bMz6Tjll4NYfDzlvYQYY0vfzYWGhXsAyguNzZy+65PdU12?=
 =?us-ascii?Q?aaHfQuppyOS4oyNwCl2H+2ueSo/87rrdp33V6gfYH8xdTSYqLNQ6OmISP5+D?=
 =?us-ascii?Q?LPUACNWtPcXB9SyesIGEXYVGNX1p+IiFeCn5EPliXsarP+ou8w1QBNsNVNNM?=
 =?us-ascii?Q?2OhnmClt0+xUAK6X3odVWgZ1SoAz17yDKGqisc/M4FnbosqjB3AtJhOREDN5?=
 =?us-ascii?Q?8gH0iq/lNWfl0nGQJGtlxZLm/zOWgzWhpJfnwwYWf3P1zDfQQpGafvvrdiW+?=
 =?us-ascii?Q?cF+jDnWWVEubiOaW2x0yYewLvvm366DiEYSPlJg5PXjTptwSdA99ajqjJ6WP?=
 =?us-ascii?Q?KxqkeGh6bBpeuAx8a5svbAkTGs9A2OUZUBhk6SwAbjycwxOuf9oSQOpRZfbp?=
 =?us-ascii?Q?ag6G3CA3pa5z6wwRhfDDPIgikgnWyhVb4UQSzG33WpA4JFuQhFUH0h/ERGqF?=
 =?us-ascii?Q?BVFp4qpfrlwnxQCWsYxUA6gIsLVXE0UgfldZenchgm65dyR/8F7CwKH7YbhS?=
 =?us-ascii?Q?JQuE2rx7zN5ls7eszkiuy0P19k9ftuv8rsmKjWBYY38lKYoIvQ6PPj1a1GJL?=
 =?us-ascii?Q?PfzNh/4iRPNtBQ8mayTj15BV5Ga3lqz8y3ZFAFe880nWCBA5LuYs6GxX/XTJ?=
 =?us-ascii?Q?ulqO6umEv1vRM3NnBP0dJbnH70WBpRSsNOX9cJZ4ijqiJzwJqd5SHkVI4a6r?=
 =?us-ascii?Q?C7/JKbCvlLwyeLhp+F4oP69Ra+zmQnLedJKA+AjNQXL1p6uOOKOLhUs34AfD?=
 =?us-ascii?Q?pyPX15BC/dHtgWH/i6d01MpArHPKKs9EFMN95X/MpYx4ZSUwHlzJVbzljafz?=
 =?us-ascii?Q?f7IF/hz1U/bwDQIOKSDxyGrKOlcWD9If15cIvw+D2WQsQFYaFmRtxEkPTt4G?=
 =?us-ascii?Q?R8GD1xMh30PdFc8dAd4rKt3BWaQcfyWPmLbM66oAS1DobFSlLL+3uIs/cEMk?=
 =?us-ascii?Q?lWidzAp0YO1gh2FgZ7HYh2gE9dFAQT0cu+Aecc5Zdl+8dcsCFxRVTCAKwAF5?=
 =?us-ascii?Q?A12tXKA2h7Qg92ntC7Pfhm0un7zoBLttWkeX6fFbMnSJn8U9TT1Pwc8E23fS?=
 =?us-ascii?Q?oJ9Ot1C+7U/NqBajqbi5/VLPeHfa56K50SKUN+0yQivK5gw9UDduAvB2CAoE?=
 =?us-ascii?Q?Z582ULbgmV2S7oexkYxWeWkr7O4oBylUzlePrLEgXaJj1vnJJyMH3nSyUm/b?=
 =?us-ascii?Q?k7aw9FZAdZRdxbucYhxHnBXsskj9BIvjKnBue1LEkliYmncztDurtmJOw2GO?=
 =?us-ascii?Q?lwsBi+GXFGB6Aona3RbzphJIK23Xri9JlkWOY6VmhAAf4jhSFUd0JJnPO8jX?=
 =?us-ascii?Q?HsLxFAvCfw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vyfj24y5SLjivK0yRxyU7SKWsfsMLaOlko8OF3+cVrxQQWG4L81gPJFtMR8gB/ruzGH48rGzqTBYt1KvFJi5Q0X1/Z3TBNFbRRy9TeBxc9Fj2vLK57R57q+hCatIN6LFeWwirrwJJ9sWIGY/8/+mMcbYAFyPgpd1IRn+s8dkoZS2AMJTot3/AkghVeNxz77JX6xRjotrtwkrUSM7tKSN0JIkOyj05yHhJlyHS7l7mfwt1voRDSeFqAO5hWvK2uWwK4dLaUmGqnjS2Knd8W/wgrA8oykdjhzrcmT5gDR5sp+Y1LH1ws2RjuAiZvAiF2FTeEk7gu+kPoMRTpq/4CSCHA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dca422b-430b-480b-0f14-08ded0fdb83b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 08:02:06.8743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fAeESNqqRiffJESKnx78BxMTSu3A6waDgB2bpXeirewx1zYwBxx6Vac1F/qixQlmHps42aeydnmyFCmWEdIQ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8937
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

Hi Jeevan,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Friday, June 19, 2026 11:08 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
> suspend/resume audio tests
>=20
> Add test to validate audio works before and after suspend/resume on
> HDMI/DP connector.
>=20
> v2: Perform a single suspend/resume for all audio combinations.
>     Re-enable chamelium after suspend and separate pre-suspend
>     and post-resume validation paths for clearer failure diagnostics.
> v3: Drop commit and use igt_assert_f with explicit messages to
>     distinguish failure in audio tests.
> v4: Updated test to avoid false-pass on zero executed configs.
>     Replace post-suspend forced re-enable with connector
>     re-probe/connected checks.
> v5: Remove unused variable and add chamelium_assert_reachable check.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 155
> +++++++++++++++++++++++++-
>  1 file changed, 154 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_audio.c
> b/tests/chamelium/kms_chamelium_audio.c
> index df8d27c0c..144f6a038 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -52,6 +52,12 @@
>   * SUBTEST: hdmi-audio-edid
>   * Description: Plug a connector with an EDID suitable for audio, check
> ALSA's
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
/
> @@ -695,6 +701,66 @@ static bool check_audio_configuration(struct alsa
> *alsa,
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
> +	bool success =3D true;
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
> +			success &=3D run_audio_test_once(data, alsa, port,
> +					      format, channels,
> +					      sampling_rate);
> +
> +			alsa_close_output(alsa);
> +		}
> +	}
> +
> +	return run && success;
> +}
> +
>  static const char test_display_audio_desc[] =3D
>  	"Playback various audio signals with various audio formats/rates, "
>  	"capture them and check they are correct"; @@ -762,8 +828,10 @@
> static void test_display_audio(chamelium_data_t *data,
>  			sampling_rate =3D test_sampling_rates[i];
>=20
>  			if (!check_audio_configuration(alsa, format, channels,
> -						       sampling_rate))
> +					       sampling_rate)) {
> +				alsa_close_output(alsa);
>  				continue;
> +			}
>=20
>  			run =3D true;
>=20
> @@ -789,6 +857,81 @@ static void test_display_audio(chamelium_data_t
> *data,
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

The test's purpose is to verify audio test after suspend/resume. If audio=20
doesn't work before suspending, that could be config/setup issue, not somet=
hing=20
suspend/resume caused.
Consider skipping the test instead of asserting on the pre-suspend audio te=
st.=20
Only failures after resume indicate an actual suspend/resume issue.

Also change the above subtest descriptions to match the actual test intent.

And it seems there are many extra line in this function, please avoid them.

Regards,
Pranay

> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +				      SUSPEND_TEST_NONE);
> +	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
> +
> +	/* Re-probe connector state after resume instead of forcing a re-
> enable. */
> +	drmModeFreeConnector(connector);
> +	connector =3D chamelium_port_get_connector(data->chamelium, port,
> true);
> +	igt_assert_f(connector->connection =3D=3D DRM_MODE_CONNECTED,
> +		     "Connector disconnected after suspend/resume\n");
> +	igt_assert_f(connector->count_modes > 0,
> +		     "No modes available after suspend/resume\n");
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
> +1009,11 @@ int igt_main()
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
> @@ -876,6 +1024,11 @@ int igt_main()
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


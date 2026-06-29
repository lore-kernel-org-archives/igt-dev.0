Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AB8C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 06:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0788110E6CE;
	Mon, 29 Jun 2026 06:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MP21wG/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5AB10E6CE
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 06:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782713291; x=1814249291;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TyIhGUVSnRKQ3vQNQLeFkqnDNlI6MB+WQSMW06Ty4sI=;
 b=MP21wG/4W24166HwaZPXzmcHNzCIZvLlkV66J+eYmh/Cz2DhNcWgAhHF
 EsfuLRGkEoBYE9RHbMeg2V2UvxF9lSuRhHVvmlLM8TMo+VxdeAeJMkQzt
 04qZ3iMOhaZbLQaquBpFYdWkzn8KCLw9S0fXCYMGyKHfPrE//aUI9YWly
 eXNLQC5r9Oe9qf2etn3G1FVlNWW2OyrOcJtLZiaNZHhYx7AlvKdOUHMYu
 h5HDcTKzuEDEK3FAgnjRr2QuOVkzPqmKbFmQedu1wqJUHqa+GL9ehTno+
 tSaV5pIjZLuz4ET0twB4ip3m+nHn5pCn9w9+XUfgNbQumxKLmRRq/3MwK Q==;
X-CSE-ConnectionGUID: 4GPY6nuNQnOBux57d9PzlQ==
X-CSE-MsgGUID: XBC191qUThCwHLUdXTaieg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83267270"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="83267270"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2026 23:08:11 -0700
X-CSE-ConnectionGUID: J4FrrtrOSL2WGs7NpMWdcg==
X-CSE-MsgGUID: EbKofi2USfStgtcQkDSmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="281950124"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2026 23:08:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 28 Jun 2026 23:08:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 28 Jun 2026 23:08:10 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 28 Jun 2026 23:08:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPp34eabavSF/rMJV7TUfMd1SXL1ZcrK6UybTWPtEXliuKKvU0zJWmy/mKTOck2jUbhAavkzHerPcsjnUl2S+GAmHeuG2O8lyDsS7rthH5lHvPUJPtWAG7DpZFA1qfa3e/uTVzuycicJieo5kndjc2Kb2KzzaMfaxVMUOKazAPm8t7CfvOlxTZvcxQBp8T8nQoOeYYqyllBV2UWFU/x8NBhsvf1uNNlW53lQEms+dzsobqLrSe73tZIxP2y2CebRlvNlhs6+3ZO4G2OTJusGFgo5leF8jNpVl554ciuTirZjp/y0xkTEMMnMMnHKf9jzf6fLQlS1bsQnY1YBBqGPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKNtnsRxsaleRPLvdA011GZc5qSLK4qen7pc+lMLhUg=;
 b=EI8jtb/Ni3ZjcGy3RLEBbbv0lJC46FHCdpbyVHY5dzg/l6jol03y9M2LwpT8hzD0wnoDxstLZDnd24HNAw+GWF2ZPh3RxHLHCBUR4+t5Ht6lEoeio1Yn2mKwlPzcflIFNf8L7BoBhKqQTqM9peDKBpHreG5Bx/Z5jC4J8LDxJltU6jMqjva3MmX5LXYMHhHTNLHmUE3s8ml5BfrWcOmTVZlAuHSOY51EdNN24F2kA2hZ5rTpzoTHAbOCp71rRigfA3SatcMlFfki2QTk0v2f6H6ZvF6v2IOT77Q+j6oRYkxik5KH/QuUVzu79gOkSYQ7KF706JCy9SqMlOIXjIszWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:08:07 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 06:08:07 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Topic: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Index: AQHdAuojjdujyygy8U6Znippnq+mL7ZVCgQw
Date: Mon, 29 Jun 2026 06:08:07 +0000
Message-ID: <PH7PR11MB60532DC1785EAC12E93DCD44E7E82@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260623082714.3223393-1-jeevan.b@intel.com>
In-Reply-To: <20260623082714.3223393-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS0PR11MB7880:EE_
x-ms-office365-filtering-correlation-id: bd4744f5-8e1c-4258-fdc0-08ded5a4ca2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|3023799007|22082099003|18002099003|38070700021|56012099006|5023799004|11063799006;
x-microsoft-antispam-message-info: 4OJzSM3gYd4BgLcVO7rqq0tP4401bhlbauzmQ0akAc1izSyNLjIuCWTYWQhRHh+7iuyi5JT1WLaPuXxzQQeXLDvRoYC+Pms6/snA780HEv2bchbaUbtIM4r+6etY1lf3r82LwrDXOC6k/TjjYErnqGw0d78RqzDxBB89tTM2gUSK555c9/TxSxDTaS1wWqYYpkGLtqA+dxbNesNfnOhgQmLnk+RXino/C0IVruIRP+4Z6OQFpKNlv4JMlOTE1da9GWNMDl72QRIGzD+he8STukAIkh+7srQrcAHIbSpqVbwdAno26S1XwUZNZqU5Adzp7ufZVb2V27lWig76Am+Un3bN8giOygtL53pSl1fryHS5zKxI2kpR1VhqjDZOWMPyRgI2kYyKdjQqfqenCh7Hrlc4lXjfJ1i2AX76Rm8NfOD3eJ6nzsT9p0MVi1/0qWcZ4n59CkPVBvAomXKK7G7Os441Omut+WI/B5cl3RQScjkVpcmC4nQ9TmDV1/OSf5qAD6aRpZBUdOz4fmyYRImajOqsylOnT7QESwnTSVsUoFC2+hKSr/5aInHBaJC0fG40MbcWJIamluEks0Qr8qzZzOQExWMFDxk9HvnIMslhg6Cz/ViTdaR0RXmBbgBUkYlrhNp6B6p06FmEqR2/wBDyLPLImqjkFAg4HgbdJJU6uKCMejKDy98d9+ZdYFqYcCwdsTy6SCO8Cl/pGSwvqo6o9Y1PIIuaDrFtKFKJp/xIRWg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(3023799007)(22082099003)(18002099003)(38070700021)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OnWXMMK6I1NN+JNowDO5qUsA7c/E9cRjc1uko6zXrFvoyCyCnyS4Z7dobMjn?=
 =?us-ascii?Q?4l2RZ/Q/ZymoK7n7QIlNIEXMR5uqWXsYpZzHV+3nlvaaa41n2zc/LqBEHRB6?=
 =?us-ascii?Q?zCw6ELsf0zF/Jl8jzqIeByENfPZxlh2d2419P9PRsyqH/acmmANxJQjatbQf?=
 =?us-ascii?Q?rYN+b/bdkfe1sbRsR2g75wwfGx/ts54zhOPeNLIUWT9wHxAzVX2YcOR6LCsq?=
 =?us-ascii?Q?hG+R95B6w+d6g6h4pqlobYBO/+ofZk4PJe0aPajfhyf9leKDHOJ2lF4xJ+oR?=
 =?us-ascii?Q?ctfhmeDDpJaEFNi72H/iw+q0OhCRNzzdPGs/SIfpyJwjJkc6s8wUQJyJ4V7l?=
 =?us-ascii?Q?EWW8kQMq86woA5GB5PsNn/rha/OEucQrxYErU/C/hmnkunfPW0OnYfC89mXy?=
 =?us-ascii?Q?JVPby9VH+19spsB8IZl+XmCmTI0dgrz9RQNkj6W4dXhzw66I6bG3XGPMy/+v?=
 =?us-ascii?Q?mUjnOzq3oFdd8WL+VstJ0xzQB6Z39UZlikuQM/S8Eti0PI1WJr/4RtnKjkfy?=
 =?us-ascii?Q?71ssMG46sjjoJxt5YG5mg1PBBf5QaP5L0cGMPI/7nG3P3GiM7IpnesIfcl3e?=
 =?us-ascii?Q?eHZ39ISBs/2hX1l4z4QivZZ86EXQTIADH1TXdJahJrnpWwMH0GlXdYnajzR0?=
 =?us-ascii?Q?U2iw7uPsfl294kUEif4A5ZxqeDHq1ezmcPQtK0bxkjDpNmyqoMc9w/ZczDij?=
 =?us-ascii?Q?xPhEHNO4mZUGo4R95iVUY4fHP1xnuFpoIsBHiMzNBOImn/tJwzYExYMzwxeZ?=
 =?us-ascii?Q?ILqEpkg4y4AxlWdRZDsXYQAUTkS5LMT4deRY7lztHQSYNb5rwwjDK4Hkvipd?=
 =?us-ascii?Q?iIDntXDVc91sD5EPaVhEe2JjJ/1X6DDVdIJA7alhIu/CwubY2+RVD0pZarkf?=
 =?us-ascii?Q?WpxWJ0bOg//Lc4ZqVejFJdNFQVwFuNPnQcfk+X9Xyh3ktzXZR7tQA3iTkVjv?=
 =?us-ascii?Q?twKtg25ogjbkYqVirUZ9iiWF4pNycaGKeifvyaVQHrKqmf/yTuFfug0pZH/z?=
 =?us-ascii?Q?cg4eq9eUWDROkoyDgRrxgvSs6XG70QS32RF2Vh+/fqykJYk8UJUYMq95mJee?=
 =?us-ascii?Q?FRqBBE0VU8AhOs1IjBp3NehlMuFmNaqavFS/ElyM08sQQCsVPnv83GXJ+evW?=
 =?us-ascii?Q?qvjIpCReF/PtD+48my9WKu/Bdp35V2n2NF7XhPhbj3iQ1ifBHJDYY91mPVxR?=
 =?us-ascii?Q?TUUT0oiC7xt8+k1ChuhyZ6SrnKTlfcwbB5AzzRhRgJujH6SitNDp7iZqcMtY?=
 =?us-ascii?Q?JoUyGKviXifq1HnbBfC4Z91fb2HUCB1yuZZaPlbSdMq7WgQkosf/Ps34kyeI?=
 =?us-ascii?Q?pjV0i3nbUyPDy6dTj/4Kmg6G38l/qSUl6aNG71frrf1CsZDZmpA3F4Omp0Yv?=
 =?us-ascii?Q?22gWEd2/M72PD9LThr3GoiRNhFgmy6KvcHCYBir7wj+aL+fgR+wWH8Ap9GKG?=
 =?us-ascii?Q?AESXtFqJl+aMXVlkWcEQMi/JmOU9Pk8T7+U1s7fZZsEz74NTd7f9ikAUtG19?=
 =?us-ascii?Q?a2lIPiurd7ABJges6WtEcqNwMleU2xa7gDDnkqTgRJrJMF7BTfG2HuJq8Rf6?=
 =?us-ascii?Q?fqUvWxHMnU05Vd8bbPKdMUDhAwfEgCyZ8ai/nABXxTyrw46/+mm9iiodOJ2h?=
 =?us-ascii?Q?9LWR9bypDICy34qZOCa5QqsF2FAnK8XJCFomaWjC6VNPrlbnxr3ySAnoCFiE?=
 =?us-ascii?Q?7jpvQihEEORxeAhJYnwU3+5haRt95gMhwl1oL8xIQH4piRLqOwRN/WJRry1w?=
 =?us-ascii?Q?8XJ/wqtbVA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CGFthvm9b8P17sGwhgZFQ4PJjO20vyDrZKQN8WloFwffddz183L6+F9q3GV7Liil9zTFoHSLVBHSQGNOmTZeGoyJpQl3IWsIHf/5MQJpqTES9957HxHpPA4R6drTDY0egPv9wUuiyLQJU/dzMyGFFS0ylhSkzcXplsjN24hVuLaMdbAeIvmlhLYE9bPsBE464xDw9HW1bKZgHv2yF0yuGKg7uGw80aOTEhhNgQUqd6htogSAonuLuXAjAVvwCyJucbz8g31a5MW1poMNNGVJDCH9s2sfqVVOPxTDrxP1SpcWTo6UmOnIl+swvs2QXkLkv64ARnCXfYAhABN2oO8osA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4744f5-8e1c-4258-fdc0-08ded5a4ca2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 06:08:07.6191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0psUSz87u0fmVviUMKntVVMoCxo0nX88F4Ek0bi7itnOmUEsAOUGW60UFxQ3fib7Lv6eKQqs2T/4Pagi0x7sBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
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
> Sent: Tuesday, June 23, 2026 1:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
> suspend/resume audio tests
>=20
> Add test to validate audio works before and after suspend/resume on
> HDMI/DP connector.

Please update the commit message to reflect the current behavior.
This patch validates audio after suspend/resume.

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
> v6: Skip suspend/resume subtest when pre-suspend audio validation fails,
>     and update suspend subtest descriptions.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 149
> +++++++++++++++++++++++++-
>  1 file changed, 148 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_audio.c
> b/tests/chamelium/kms_chamelium_audio.c
> index df8d27c0c..1539286c9 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -52,6 +52,12 @@
>   * SUBTEST: hdmi-audio-edid
>   * Description: Plug a connector with an EDID suitable for audio, check
> ALSA's
>   *              EDID-Like Data reports the correct audio parameters
> + *
> + * SUBTEST: dp-audio-after-suspend
> + * Description: Verify audio works after system suspend/resume
> + *
> + * SUBTEST: hdmi-audio-after-suspend
> + * Description: Verify audio works after system suspend/resume
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
> @@ -789,6 +857,75 @@ static void test_display_audio(chamelium_data_t
> *data,
>  	free(alsa);
>  }
>=20
> +static const char test_display_audio_suspend_resume_desc[] =3D
> +	"Verify audio works after system suspend/resume"; static void
> +test_display_audio_suspend_resume(
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
> +	chamelium_reset_state(&data->display, data->chamelium,
> +			      port, data->ports,
> +			      data->port_count);
> +	output =3D chamelium_prepare_output(data, port, edid);
> +
> +	connector =3D chamelium_port_get_connector(data->chamelium,
> +						 port, false);
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
> +	igt_assert(fb_id > 0);
> +
> +	chamelium_enable_output(data, port, output,
> +				mode, &fb);
> +
> +	igt_skip_on_f(!run_audio_tests(data, alsa, port, audio_device),
> +		      "Audio test setup failed, skipping suspend/resume audio
> +test\n");
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
> +	drmModeFreeConnector(connector);
> +	free(alsa);

If any of the assert/skip gets triggered, these above cleanups will be bypa=
ssed.
Please do these cleanups in exit fixture.

Apart from these above changes, code LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> +}
> +
>  static const char test_display_audio_edid_desc[] =3D
>  	"Plug a connector with an EDID suitable for audio, check ALSA's "
>  	"EDID-Like Data reports the correct audio parameters"; @@ -866,6
> +1003,11 @@ int igt_main()
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
> @@ -876,6 +1018,11 @@ int igt_main()
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


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A311CD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 05:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B50110E198;
	Thu,  7 May 2026 05:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPo/HfiP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E97210E198
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 05:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778130838; x=1809666838;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9KtYF3OFjUb1V5mgv8N1FsL/5hkySjbx+HN4f+MefTk=;
 b=dPo/HfiPXUdGrqc13OyGrV663jIXbi48fETpATNKPrAJZvBt6+6ahve6
 ZiYtzB0gZGFwYlJgDPqQuQhw6ys6stoZoXZT+A4EEdWSlUG9Ve72Zr6mh
 OjJRfpda06GgVqrBhadIcwVRIIk2KsnaTjAt08WZf+yDwrfKXSxJatWnQ
 JUJpZjOPs2Xec5Gh2BLA4JZl1EdV6e2L6nC2AqqhVSmQQyL8YfecsIMY8
 5DH3RmLFGu8ohjEnJI+XtWIZAZuDdbUZ9+sGCTJvqDz96F4MZIyZSIzwz
 hiCMsXGYzZA8DgL+pcrFkQH7ERDp68HMoqfGsVeMTf9QyvREQ+5S2v3UB Q==;
X-CSE-ConnectionGUID: E2LsbxeoTHq8rBIdbyiybA==
X-CSE-MsgGUID: 9q1ny21VRvasxfIebBpVqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79088938"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="79088938"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 22:13:57 -0700
X-CSE-ConnectionGUID: tN9egFI4R0+u83GhGSIyOA==
X-CSE-MsgGUID: Oj6lAfnuQEC2+3ROGcWn8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="229966238"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 22:13:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 22:13:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 22:13:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 22:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLr5/8Eh8UM2VmmBS8beN/X/9Fu03Igq4CgAmlyFtWlm/e7uwvg9Lt4C7zyz2jMoAS5XxvnoZgqErmQheT/jiQSoYTx53DokRGJDFymX8XxntKXp/fiKphKGuTDpNyidaRHRwsd1Ul1W4dX8fvxjlTJHWzZBAiDRAB95BFIOJjK2yqWy8mLQgLOPV2HwmnlMEnPGRJwhxqjhQiQpxYskUsvq/JUIi5MiWP7e3xbpqcGDjBFHHatCEe9ga9/0Hn5RsR6dZsj31tZ1TnKdT7SgXvN5wT1jWmT/XWVufGaHNjIwp+mmnd7uAu/UfbxAPzKNiXd+LOyDRNNo8QKmXddgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNR3z6KA42jbFXdirciYzUgAaHmTWET5gDkdvvOarMA=;
 b=mVdGRNtJcyhYZvLRMtn+MoXsqLf7ONLfSuByM+DG28isOJj9O8w5xCdLQUmkIltZiKXISzKV7Mx+VhBaGDgyL4oAab+0uoqbH1A9TK7zb7ipkbEQmZ8AnOA250aIcph9exhXgOFUE8iwfHQnStenVx3a7lzLV3Z3RS7/dGwyaI5PVgUJxleaQlUFH1PAzHCEPDBFPPtoJqGaLXMVnaDNAXf267nV5cDbbZCGwN/RRVgZJnnYRKnppcQOLRpBL7rQ2GcvDeZS5MQtSs/Lparge6EcrAL7ylCKPFw0lcPPROLpOOF+m243M0HgD19qgnqG7mz1AQIxe2mQY98nkdaqCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 05:13:46 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%4]) with mapi id 15.20.9891.015; Thu, 7 May 2026
 05:13:46 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Topic: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Index: AQHc3LnPAxEnOKDpPUSRfWjMZU3Yh7YCAypQ
Date: Thu, 7 May 2026 05:13:46 +0000
Message-ID: <MN0PR11MB6034D72B46B85C191CA9F262813C2@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260505180327.172380-1-jeevan.b@intel.com>
In-Reply-To: <20260505180327.172380-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|DS7PR11MB6248:EE_
x-ms-office365-filtering-correlation-id: c15d05f6-5337-4a64-d6f4-08deabf76a64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799003|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: GIkzc2j2agFeT19PanVMt0s1xJWH/6DcFWZXnaRRiLuhqiSD6vkkVbBApFcmMUx1/AJzQAAsZXAUmgmQTO8VYaG3ovnY1BfMh2J4WDg42RNP7yKIUDfkodeYy5j13IfDjq3EGBxo4MlG8Mw0YzPf3nANaDJc9Vy1mKdaB+WBfvLEqp9mHxPS65V05/f01CqvcaKlGv5Lso/1hP30tZFV3vNRtFXdCPc3Cw/oRRlvv7wAhDswcqLSeB08iJmyzMUxCXHHKNvUkpxjC107ahrUHQQoHJolgFT6xtrMQn0YCyrZ60UlKdgUEXZAirqDjrye41EmTzI4kBhngG73gSuVn7+eS5T8+aJntcLluUB6ho14TtdnNn3iNvwWkO4rW73c5TEQB1mdD/W9s3F5a0gzu9Q7SbWxPtWOx3wsCutpvjsvzmF7im0pR0Ugeq4mvPLRnZgaZ7EzLB5FlACg1WiE/Xjj178qkRmxnm/J8dLOcT4E+WhEG2tmfA7mfkPlTUJfRP4NcCq+CVplb/AIL+zOPoRDFXB2AeH2gWUnVp1ATYgI2YBX5uPo+e6WzB6u3qURQKir+UzsgC3uaL6Z6kbJJH1aOxjRk2QOCIODYlGYXSII2O3SkHqpGpvxdSAgNxUM7hpN28BCCF19vWQdvcyRustXzFmWs1ecuUXU7NE5vU1+clR7Jj4QGI+aWfWD464z9H6idN+rLw3agdH8GMI/oIYl6gh9pwJVBhg9fDykOnGKOKFrLS88NRetRskm6EnX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WL9/gED7/71xql/n7ZDFQXzdMln84bhy6xtvSTAhGp0RUFBZJ6WytvOtr8Qd?=
 =?us-ascii?Q?EzwNooUpQQgrBiOHLuHRVKyqA0pxOvSmnnQrQymcZdOoLgDRJrIIPGiqChw8?=
 =?us-ascii?Q?Q0GbOzPySBnOkS7GifoQPvu29L7cVoY5mqCghkAGZqntMa03olvQ0XvLDgqv?=
 =?us-ascii?Q?zvOQjAt9C6yCqO0UbdB4FozfAzwuByAUyXY4e9ydgAzuEmo6XhKPYKmirH9L?=
 =?us-ascii?Q?59U4rDFbw9JSgZ5YCiyFkLmAcBprRvOwvLg/n6G9xlquQ/lpo9uece0ixLIy?=
 =?us-ascii?Q?twW12l/HPOR1oCmlmIP5dNpd+BxKlKw4oFUqDf7mbwzj6tH4/OdFX2he7E3I?=
 =?us-ascii?Q?Ji0iPBFBlbC3LQMAf6GvP+TPMWalt1fxaDvMiFiuDk9lj7ouINr3nq3s2k+e?=
 =?us-ascii?Q?NBoyRjNUzkKG5rex7W1MQa+zz0RKq4MK6Dg3P+aDjVMQ0cw8UAhpY59ADQ4L?=
 =?us-ascii?Q?UkErTdIkuV81j9A+tVwuUNNaqfwcMeqE3sytkUqFfvhTMRXhvAAu381E4nOL?=
 =?us-ascii?Q?8sND6z3m1W7fMSZuGyKRiBxJNm6r1T8PZh+YaHei9x3NtPuE+YS6X2b741/P?=
 =?us-ascii?Q?wguBC/nY5uF8s4nSm8syiNyCmv3bmMeJUTF9+G3VmbyExEFIrldmUZ5sSE6a?=
 =?us-ascii?Q?6VYpxIEvJ6Qoh7HZ3KqX3RZDye9Y34yMJJZ+4ldTu93Y2DFHOD1pDpakUrfT?=
 =?us-ascii?Q?wm15L1t8KEkqkoNPgUF590ywP0BoQHoqHG28376hPT2UOYGJzrWejKxQKevr?=
 =?us-ascii?Q?ehj8DpksQahKeWCipDY9KwYeF9LlGOSWysL10W32mObOYUUItcOclktcPeyu?=
 =?us-ascii?Q?EpIkXz3O2J02FXd5zsTdFUpOr/S3/CdQhlsGfvkxwAQZd1CIfCA7qHPXiV6O?=
 =?us-ascii?Q?mUt053H8cWHSLO06SreNdq9LZcZGjWFVR3tmqqqy/gMqyoOjMFN8YWq389Hs?=
 =?us-ascii?Q?tSP+oJHaaVaOgIhYdLvqsNUQdrWJqiULGB3woxwpbE4cmztKLTmGCS6wRG8C?=
 =?us-ascii?Q?8PR6UnoX+tnjjz53BeDBComAZhjTWhJ7QTJfa62l2J/TenQagH3YJMzoG/7F?=
 =?us-ascii?Q?AUDT11/L6g7Izf1OUEZofTBt+g1D3vDiO+zg3juhEkbkvYEDGe8s9INa7Adb?=
 =?us-ascii?Q?XyUI+YnmS8kWHOMnLun1O9N2EGB3PzXBGtkaXAuPoFffMLb+kWSjFrpd7iOX?=
 =?us-ascii?Q?LX0eMmYxnif2wrEqc5lHnv6f5IKDLSeiVyY4t3yltqdMbdSQqyJlpJWup3K/?=
 =?us-ascii?Q?6c7Rkax4Bepdd3KMTfGWM+V6qT5fbNlEmaQ1zjU6FL9pGHKQN3SDLPd7fs0C?=
 =?us-ascii?Q?7n1jYZXKot+Ao66hyNuVlky48bPZCjd7NUxiMt+AW6998HRRIHJvLuxkiWQh?=
 =?us-ascii?Q?sTnSNcWnos2kuR35SxyDlEEM+hDH3FJ1qWMvdZPE5yCBbd+6lFDVsWU24AZw?=
 =?us-ascii?Q?SpjFX+kT//7SV9PBqCc8wBmYu0YIfbNbbK+CgUkV0GohhFc9UcGFJ06u/kDh?=
 =?us-ascii?Q?ybpL8KqbgWj+Hwopd8qz7t4QJ08BhmOE6bM4uWu8Jbr7GSNHnn0V2aQ6hu6p?=
 =?us-ascii?Q?iBJmzA4Kiiq3FIuI2zUDMWBcI6a/H/ljqdK6vhseJ3FE0MGq8BJV4f88QSCo?=
 =?us-ascii?Q?O+miCewnNscAlUlU5WZfxbwdVYQ8qn5vjHyH6EHpzaAKT+6HUNRkt8/FyO2l?=
 =?us-ascii?Q?oUkn8AxI6UsgYozTCRO8M9y4As7EV7F15f15cVO7439LPwU13JPk9GVfFhJg?=
 =?us-ascii?Q?qOJF+nZBgg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jIigosftX1ZTnbGTnzQ4bhmDAD/gU8pp90HoApeUaY7ZnvO2DE5CfSxdKA7wU0RJiUfpdwLU4kDXrrLQCREH+PEslrRZNwhoESTMWMxioIkocUXIY1UESakxkEKCReX8852ZbHKPNiExEgvlrH+rxPoP+AmQJC6p9mid3OnFZXEB5fzE8gSfARR6sRxLErz+I3Ifer4kWH1Sx3pEl1la/OI/SsVV3C/3hc/DuqkrLYOO9cHUWaoLbsBi0fnGiXM/g4a49EDGvJDeT+eto3NU2zPR9cIsla75t4VSVHy40u+Q9bqVKCfiADXiCDAU8y3t/o0/tcUR3kCU5WTxVeN9dw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15d05f6-5337-4a64-d6f4-08deabf76a64
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 05:13:46.3041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4BYkDfzY8pKxTpDIB8KadvIwmVF2uwJfGM9WZgrIxFKJcCr6PxUlgGr8ERttDCI7uyrsAqh6hO78omyjMdltnwx9ED/4C3FvUeVngUPcu5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
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

Hi Jeevan ,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: 05 May 2026 23:33
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
> suspend/resume audio tests
>=20
> Add test to validate audio works before and after suspend/resume on HDMI/=
DP
> connector.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 121
> ++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>=20
> diff --git a/tests/chamelium/kms_chamelium_audio.c
> b/tests/chamelium/kms_chamelium_audio.c
> index df8d27c0c..ed8c9de7b 100644
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
> 695,6 +701,23 @@ static bool check_audio_configuration(struct alsa *alsa,
>  	return true;
>  }
>=20
> +static bool run_audio_test_once(chamelium_data_t *data, struct alsa *als=
a,
> +				struct chamelium_port *port,
> +				snd_pcm_format_t format,
> +				int channels, int sampling_rate)
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
>  static const char test_display_audio_desc[] =3D
>  	"Playback various audio signals with various audio formats/rates, "
>  	"capture them and check they are correct"; @@ -789,6 +812,94 @@
> static void test_display_audio(chamelium_data_t *data,
>  	free(alsa);
>  }
>=20
> +static const char test_display_audio_suspend_resume_desc[] =3D
> +	"Verify audio works before and after system suspend/resume"; static
> +void test_display_audio_suspend_resume(chamelium_data_t *data,
> +					      struct chamelium_port *port,
> +					      const char *audio_device,
> +					      enum igt_custom_edid_type edid) {
> +	bool run, success;
> +	struct alsa *alsa;
> +	int ret;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +	drmModeConnector *connector;
> +	int fb_id, i, j;
> +	int channels, sampling_rate;
> +	snd_pcm_format_t format;
> +
> +	igt_require(alsa_has_exclusive_access());
> +
> +	igt_require(chamelium_has_audio_support(data->chamelium, port));
> +
> +	alsa =3D alsa_init();
> +	igt_assert(alsa);
> +
> +	igt_modeset_disable_all_outputs(&data->display);
> +	chamelium_reset_state(&data->display, data->chamelium, port,
> +			      data->ports, data->port_count);
> +
> +	output =3D chamelium_prepare_output(data, port, edid);
> +	connector =3D chamelium_port_get_connector(data->chamelium, port,
> false);
> +	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(primary);
> +
> +	igt_assert(connector->count_modes > 0);
> +	mode =3D &connector->modes[0];
> +
> +	fb_id =3D igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay,
> +					    mode->vdisplay,
> DRM_FORMAT_XRGB8888,
> +					    DRM_FORMAT_MOD_LINEAR, 0, 0,
> 0,
> +					    &fb);
> +	igt_assert(fb_id > 0);
> +
> +	chamelium_enable_output(data, port, output, mode, &fb);
> +
> +	run =3D false;
> +	success =3D true;
> +	for (i =3D 0; i < test_sampling_rates_count; i++) {
> +		for (j =3D 0; j < test_formats_count; j++) {
> +			ret =3D alsa_open_output(alsa, audio_device);
> +			igt_assert_f(ret >=3D 0, "Failed to open ALSA output\n");
> +
> +			format =3D test_formats[j];
> +			channels =3D PLAYBACK_CHANNELS;
> +			sampling_rate =3D test_sampling_rates[i];
> +
> +			if (!check_audio_configuration(alsa, format, channels,
> +						       sampling_rate)) {
> +				alsa_close_output(alsa);
> +				continue;
> +			}
> +
> +			run =3D true;
> +
> +			success &=3D run_audio_test_once(data, alsa, port,
> format,
> +						       channels, sampling_rate);
> +
> +
> 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +						      SUSPEND_TEST_NONE);

[1] The suspend/resume is inside both nested loops, so it executes once
per (rate, format) combination. With 5 sampling rates and 4 formats
that is 20 system suspensions per test run. Please correct it .

[2] If the pre-suspend test already fails, the code still proceeds to
suspend the system and runs the post-suspend test. The final
igt_assert(success) cannot tell you whether audio broke before
or after suspend. This completely removes the diagnostic value of the
test.

[3] After a full suspend/resume cycle the kernel performs a full
display power cycle and the modeset state is not guaranteed to be
restored automatically. Chamelium requires an active video signal on
the connector to capture audio. Running the post-suspend audio test
without first verifying and re-committing the display will cause the
Chamelium to silently receive no audio, making the post-resume test
meaningless.

Regards,
Mohammed Bilal

> +
> +			success &=3D run_audio_test_once(data, alsa, port,
> format,
> +						       channels, sampling_rate);
> +
> +			alsa_close_output(alsa);
> +		}
> +	}
> +
> +	igt_assert(run);
> +	igt_assert(success);
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
> +977,11 @@ int igt_main()
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
> @@ -876,6 +992,11 @@ int igt_main()
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


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8DFCD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 08:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E90210E039;
	Wed, 13 May 2026 08:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COwApw2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA85710E039
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778661311; x=1810197311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/tt/w0vph1dzg0Z+c+mAiePhr7fL7slnBx6jxup73GA=;
 b=COwApw2SOdbwdcZNQnQB20tivbmfVlx5eIwJTrq2kKQHgC12t+RRU8bd
 BlYOePV+XrqLUGi9gOeeNfNwfj0yEMWgVEqWLmM4ROA14qp7OU4cCccoR
 F65vY6cv5RkOY4pIf86cDHVP6RWFCSHWJSUdoBAL/s38gg8CZjeKN/tvC
 agcWIWqX/yuM+W3wUfjlAhfHS7psndK3sb4GikrGlmn+bAzZf7EpGjVNs
 XHbILXn/dbNg6MxfNZJtSr3CM4+uciGB4qjWUtkZK6+yM+87cIce/HGvh
 HA3bTULy4y9XIHpbPtT4ZEbpoWOKNYpUgXG+Y/wWLn/crYZv609sGHpQC g==;
X-CSE-ConnectionGUID: PtffpppDTpq2DqD/CJ36hQ==
X-CSE-MsgGUID: SgRzZANSTYmbJt5VSAHiNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79439501"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79439501"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:35:04 -0700
X-CSE-ConnectionGUID: CvwhUL+QT8iwxfYw1qbR4g==
X-CSE-MsgGUID: Oc/HoBwDRJuskb3clJQCjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="234955342"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:35:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:35:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 01:35:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:35:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJVa4bo4OyiEUOnxkXyF1OTHyrYA8Fg+LBOjgk1/NCUwbFx/ULeJm5hoI+efLa94xLRqEiQsWijuegqiB7v26U3A5mTOV4/h8Px48hz3qHAxmAySh0HpAE3gobhIXS6qYQft3I0CwAI8JntSd1kYuKrPlBsC5lw5kWD7Y7+8nOQ+XgssLZzTj2Zi8QGSWbVfa7WilBwx0QlR1vpfFdBBC6dukCE9J5ZqUD9DpS1qMDBdD2ZUNmjaLJh3btGjgIF9657FPLG1k3UirL07BAbUdO1RvTkG1g6EPQ1EnVpi4PaNOwNMz2lNhq2TI/RfSwqnGcInBtNANcnr/RUDe6Vprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MniBYOm5oJqnvZPCUP2UM6TTiDBcb2twqcMBcksX7Oc=;
 b=lqkLgRGnuTMzoycK9gsYVBagffezbbtf7Gk/hwBECfWGZzUislobfsDmL/YKBgrwKkx50s1a5E2VldcMiasvyHlyz3H98FpgZt24DZ7728EQWPxzpo182CEOzHMpc5/CD+E0eQ8bl1pftkl5sJLcTa3ocD2efxe6dPL9byikD/k0aPYULI+IswGDN//rFEy09joDu848arK9PdPZkCQjN28mYr96vs4kMTVhX1Xa4HK8/1tTFbxZdy+hoEPNm7NccL5k4hlxvEmOyBTc5GmvsGfKpjaIyqUmhHYf1nHD2ipTwBIjEB91lskXU0T0qngVeXSRR7ngJd40G3aLywV4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 08:34:54 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%4]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 08:34:54 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_chamelium_color: Free captured frame
 dumps after use
Thread-Topic: [PATCH i-g-t] tests/kms_chamelium_color: Free captured frame
 dumps after use
Thread-Index: AQHc4qFWS3bBjwAEM0i68d22QRO9MbYLnplg
Date: Wed, 13 May 2026 08:34:54 +0000
Message-ID: <MN0PR11MB603472451F724E13B73D88D181062@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260513060104.3235845-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260513060104.3235845-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|SA1PR11MB7112:EE_
x-ms-office365-filtering-correlation-id: c3ee374c-1567-4327-add3-08deb0ca81d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003|11063799003;
x-microsoft-antispam-message-info: bPGbrZeCEyFIz0it2C37OWK0CbARxgsOtRWgrGDe1V+UQIPay6vjxjU7y39LZrOqdqaEIRCcKcJorAXkBHKxZZQyUO97AxZYt5CbzSOs/CUkGzDnHkcBOl7F5gxwwsuLSvdW4xy1abmaGUNt1btmeufFTrj4gqH3qY3Ttr+YBYFZ6qICZ9Z5Jh3fn/X68RNI+roXXI9zJY6kc2HT7ZY8S/Jy5U+4mSMh96VeOC/faobMMfM/Hto4nnaxvwnp9nd3jVFdcyTwx436jOCixL6EIjFHfc5zcnGEEq++AFjc6VWm4BN/mnez2LfgVz9iO3002RHLV4pjloxT+h2sm2Lqnxh3y/6WjgwmlytkAhAeFv2U9SNzuOrUXKLTgZqCQvzropSo7mYSQODwvcWUN+lFdzBB7MRLGshPfHAFpgGk9PUJlYqp0bPIh2VUszqEtviafjTU5gYSi2h/GwaAHr09Xhj5jrUIOXiRnmOcwz3i7UVj26N86lH4OZbjxKnUfxoK2MopVT+cueUOSuiXdvDZC5RjyrpK1qsYcZ+1F9Cxyl5LyrLBq6G9KedR+AZzeYfHsFjgejnDwTv/LTr7t/Vb1t5aP1njdZ49Ra6Z+naeE9UbkdScCDZyBXKEj+hzAJ67qMx6gB5tiZABO2AnVijGuYcbiwoxWRZMZKll8Pmj3urzWO54LfKiP12eYMm1NrXTVvRb1JzNnpsrpqJd9HVLaDihTtEgs08UnBpmM+QB8hNJ1Qku1AYuYtsKlCAJyDeN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jzXSfB4/MIBfEJLWIWYIrogfmDf7jiZKj9cCt9fGJ9aVhGMkcbTx5n++KTZ1?=
 =?us-ascii?Q?4RJoOqBLth20Sy8fG7a61Y3bsZb2G3FaDmL7C4ZU1IPQj2X7Ae4wQGnrVxF6?=
 =?us-ascii?Q?BEkvVBasUFib+A7at1qdvZB7UuNuVEH0yYoi8Qn0JH0wygSv1neUnFHNosM0?=
 =?us-ascii?Q?21oIQUYJt/CvrdYadhphuOiWHWjEkmB09wzsx/5GsLuXv2/uXHxODzfRrnP8?=
 =?us-ascii?Q?1tFHYj48br9OkPT9GPj18yzd2HRRz2rh74sESYC5YJujWhuXkCWOmJLuT1QB?=
 =?us-ascii?Q?yCZIgScPwxBoEu271Oug07WQOvjZQVG68wbucQjIHkCfG9BsR6mWuY+/lGT3?=
 =?us-ascii?Q?+JU4lWXJwENifVuvt3sLCD5qirI3gDKncnPnVftIXCtiQYuy1SyaiNb5mrO7?=
 =?us-ascii?Q?EkduEyC7U1jx7Ih5vNd3rRU2c4muqmN4BqJYh+/kwpX+J8V6pEA4spDYSzZd?=
 =?us-ascii?Q?5uhxNGnkEy+dTDNlHhUe39p00EwxqXX+zxZ3CNt9ROp2zA3eB7Pshby+QRLx?=
 =?us-ascii?Q?93Flw++ELZMAftruCiG0sI01GAA/hCpwcS0WH49MifexufAVgT5zWJi038Yl?=
 =?us-ascii?Q?bi2zBG1l6DDpv9co3HFtAPEbBSXmm+fW+YIAcJ6ByiE9FhTgoR2lb8IAZPMb?=
 =?us-ascii?Q?ws5cehm4tK2HntutHEORbx8USkZnqtkEKx+B4lceO2z6krgVR/KZKcJYvtBd?=
 =?us-ascii?Q?cu7vKz+yu/kM/dK86K7Myv4aV+0xkbCcGzDoCi/NzgGKtfN2hUpxSFZLg6q7?=
 =?us-ascii?Q?cB0JDrWaF26uqV7A4+RE4VaVAhLEti+fD9aktk+t4J+2uaxB7eA5ALIJ/jFw?=
 =?us-ascii?Q?BqAzQAuFyytAab+woH7Fm7c6BTryQObel7RieFxqDFstESTJSGWSuiGnP2of?=
 =?us-ascii?Q?qhIEotXTs5H76e/EuwAvUWsMADcHydLbv0a0oQdfyhJRfXAq6i8FucTK5vO5?=
 =?us-ascii?Q?GWzcncozTHbaqkYMXm+AOuiakOLQ0d+7STHfYglD7FM8bYJkbkzyiSDz7EBl?=
 =?us-ascii?Q?GgmjJL05wUg0Ch6DA0AQntsusXfuGdRM5B54WVXni82iN8FhLwiBJjUBM+mt?=
 =?us-ascii?Q?AFthLPOeT146caHjcOe7Qsi2oJxfsjWnZLWbjWVjlNuMDtM21zBKxbTRKj1m?=
 =?us-ascii?Q?hSCiKKTYlBNSPx56wmswBSmJ0xJlkLOw7BPVC/FKCC8uHqBz728937WHs59n?=
 =?us-ascii?Q?D/zACuDJnDlnAu3qplJRkQBGhWNf/sVazUx5Q9VBEuD1j9qCPF1grLOhqzMT?=
 =?us-ascii?Q?UfwUz5lsgJNkRr8Wx6aCyAZEfaIutWiz8UhoLWx0iqEqiFy+0UZkQU3qY4Vg?=
 =?us-ascii?Q?/+39ShBH5G/Urj+9BlUY3Bvv1QqG9yp89ACxNBS3LJVm7ceJUb7dzSllyZ8n?=
 =?us-ascii?Q?X3fTLD0vDFSj8oQzrWQRgjo0opmlv51RWSEevDGAPRQ3CNJZKwx6kzeRiHhf?=
 =?us-ascii?Q?dLLttUqwOvFxSEpb2marEKoFyzl+xG/aYVipnRuqTcVFU1u6n7w9MJmZ5Ooa?=
 =?us-ascii?Q?71xVPoGSgD+Q/pjhKNAADPaufHw2Y2JO19h/mxxcQCRlTEA287RJ0vSMZKec?=
 =?us-ascii?Q?ggvpGp7LjqQFpuRssXJScdYtTtctOTjq9P7h8O1+7go49OmzQK8aZVNTM7Dw?=
 =?us-ascii?Q?MNv0bDM/667p7lPEiokTJo8cSnclBWfSEiAmRFixvoeOUV3mVSiXmcIvIK4D?=
 =?us-ascii?Q?ts5V5vwG/vS0D42ssptp9ZmZsNm7VcmdlmxC+BcfJU4EO+J77FGcZbE48vjl?=
 =?us-ascii?Q?3fAAPftR6w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FbOwK3vPuxIXA9cu7s4FjNLmDXPNibBgGh7yYbNcOADyDdwgghThXagdPXp12jwK56SpVDbonvv0kgpDOzegirGrVzgl4fCoseK+VcyP/bqyYK0B6SRnmkfuj/tARcRQNybc0ro43iW0I28havvlhrXlpNySJ64eGjGggwPHedkLOKOkOd8wYaKjOEyabmpRnAfCpbo3rODoXuv7jYLze8/kKflnEh/tBJKRJKBDwO8BZx4/1cgUZDKUklLu8XEfqeSzDGpMu6zPd54PvPqwd3nkxaQMDWmsqBFQ4BbCyRSBlBDL/M+6FJ4XWYQtVD9bhFJUv5JNTb6qsq9PFBUEKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ee374c-1567-4327-add3-08deb0ca81d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 08:34:54.1107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uRC+by/PJ/ELj1yHnq15XpU/c2rIM+oO7Khr5Pq2Y5Wvmk6Yo1PQeX4VblV8TrJt7qyZeMAznMaokUnHqRQXS1gY7alHkgGAZHuQtmixyio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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

Hi Chaitanya ,

> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: 13 May 2026 11:31
> To: igt-dev@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Bilal,
> Mohammed <mohammed.bilal@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/kms_chamelium_color: Free captured frame dum=
ps
> after use
>=20
> chamelium_read_captured_frame() allocates a chamelium_frame_dump that
> must be freed by the caller using chamelium_destroy_frame_dump().
>=20
> Add the missing chamelium_destroy_frame_dump() calls.
>=20
> Cc: Mohammed Bilal <mohammed.bilal@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Reviewed-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_color.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tests/chamelium/kms_chamelium_color.c
> b/tests/chamelium/kms_chamelium_color.c
> index d43c3be77..31629ec58 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -137,6 +137,7 @@ static bool test_pipe_degamma(data_t *data,
>  	ret =3D chamelium_frame_match_or_dump(data->chamelium, port,
>  					    frame_fullcolors, &fbref,
>  					    CHAMELIUM_CHECK_ANALOG);
> +	chamelium_destroy_frame_dump(frame_fullcolors);
>=20
>  	disable_degamma(primary->crtc);
>  	igt_plane_set_fb(primary, NULL);
> @@ -226,6 +227,7 @@ static bool test_pipe_gamma(data_t *data,
>  	ret =3D chamelium_frame_match_or_dump(data->chamelium, port,
>  					    frame_fullcolors, &fbref,
>  					    CHAMELIUM_CHECK_ANALOG);
> +	chamelium_destroy_frame_dump(frame_fullcolors);

LGTM.

Regards,
Mohammed Bilal
>=20
>  	disable_gamma(primary->crtc);
>  	igt_plane_set_fb(primary, NULL);
> @@ -320,6 +322,7 @@ static bool test_pipe_ctm(data_t *data,
>  					     frame_hardware,
>  					     &fbref,
>  					     CHAMELIUM_CHECK_ANALOG);
> +	chamelium_destroy_frame_dump(frame_hardware);
>=20
>  	igt_plane_set_fb(primary, NULL);
>  	disable_degamma(primary->crtc);
> @@ -421,6 +424,8 @@ static bool test_pipe_limited_range_ctm(data_t *data,
>  	ret =3D chamelium_frame_match_or_dump_frame_pair(data->chamelium,
> port,
>  						       frame_full, frame_limited,
>=20
> CHAMELIUM_CHECK_ANALOG);
> +	chamelium_destroy_frame_dump(frame_full);
> +	chamelium_destroy_frame_dump(frame_limited);
>=20
>  	free_lut(gamma_linear);
>  	free_lut(degamma_linear);
> --
> 2.25.1



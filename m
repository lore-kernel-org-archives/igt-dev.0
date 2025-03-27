Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A7DC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 05:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEA510E049;
	Thu, 27 Mar 2025 05:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvSzlSwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58C010E049
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 05:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743053289; x=1774589289;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=inGfTS3sY5GDXWl7GTs39cOTb1Uk+4QWhJf4S5JO9Xw=;
 b=jvSzlSwWexy6FWT1ctAML1MUYawXOk35fzcTNtt6Th5KepQ2K4u+Q+qw
 TMDU4nPkfx7f7lXsUWQqv6+TAofzUg5cQV9dhfDvxo+E6685Rz8yylmny
 z8n4esiOmoeUSsmm4eM6j7a+AKD1a3ID0XUBJgkSgx7bp3IrhtSpQO8ry
 EjVEpTYR9gSDp2pbRl8aQXlSNRfk7hJTZqVbUByvJee2wtkbIC4IPLN1U
 pvrsmw937Mpolma7Td3uBxiC5fc4mgEmngh7YZesQmbjFg2ywBEAOLYlE
 HwgzeOo1/+ZdrkQQFDWp2H9eOYTwgS8gvqlMQoCMLzMvXisRSsyQhqWHo w==;
X-CSE-ConnectionGUID: cvJYB62MRYCKEuwPtdClng==
X-CSE-MsgGUID: xw2WM1LMTP6bzu6AuYoArg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48155427"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="48155427"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 22:28:05 -0700
X-CSE-ConnectionGUID: SqDC/JuARuKYm4pdGCVpwQ==
X-CSE-MsgGUID: PEg7kygsSiyq/Oi3kZFLbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="124824914"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2025 22:28:05 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 22:28:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 22:28:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 22:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2UxzaiuygXEYhggDVZ4svl9KX8c8uw8D+uvLCqsnAqmULvrzUYSZk893utebVIouIcOecy3Wntm6tEbulIPRk1jANYt+JNlPqBmuAOeELUDwecbk0L2bsB0/JXhKAMV4I0hkFVzXgYPmCsn0Q9X4J6SviOgK5OsFsuGcO2fd+ykKz0Z86PCaTHpDSRdPU9bC7ngw/Ajw9Xhp5i/1K27L2XsUdEEh7fChni1sNIByXijnwXTRCPX3E+rF16Ov0wGmXsEwM2ckcNUAaGJ1BMU7/1MBd7gHQibKI3XY2AzJ4mZJsOi+tmB3dUMeVstmY4LePtrfgsYJiK87Kkn+6b3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf5JIwR/U+hEkn8VBPJnv8ofiODRmWKrbHl91L2PQJk=;
 b=JU6tr4/XfiMp3xG6SXUDyi+XFdD6vsZ/b2sHAo6dlWnSlVg/rMbJ/BjUibgoM0yvlltUby4d+KODQml2xLcgGWd1kLzoveOvFJe5WnF6AHHfrRg0eKVgB682CdTkEYZ8wWYSvveWlbKTNJxznIjk957foSFYcIhQ17DcbRbFZtKxh/OUiJfOpikkv3YV/HGLoS8Ms484aVMaVGvHH/XHMDOy2iyjA61bmFIXBLJ0sFhRxoA4bde3R+scINGsR/rm3CcxthU6ZVf5a+zg2rR/h/xH/qbuR4f0asiLPcyvRQGPyri2GWMxNGbPRrwMEviZBoqNqPbHKifi+9yvWIFsSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB7830.namprd11.prod.outlook.com (2603:10b6:8:f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 05:27:21 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 05:27:21 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 2/3] tests/chamelium/kms_chamelium_color: Fix
 ctm-limited-range subtest
Thread-Topic: [PATCH i-g-t 2/3] tests/chamelium/kms_chamelium_color: Fix
 ctm-limited-range subtest
Thread-Index: AQHbnJvLg77NRGL6b0+nZDpveYeGprOGd6ew
Date: Thu, 27 Mar 2025 05:27:20 +0000
Message-ID: <SJ1PR11MB6129F103D9C4D5B18B4CD941B9A12@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250324090949.614233-1-swati2.sharma@intel.com>
 <20250324090949.614233-3-swati2.sharma@intel.com>
In-Reply-To: <20250324090949.614233-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS0PR11MB7830:EE_
x-ms-office365-filtering-correlation-id: 0597e839-cce5-4bae-f211-08dd6cf00c46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bCT3YlxbNb2sWbVsdFJyWZh/u1ELzsMIh9czLImZT3Lbvx78Rws+pacr7Aym?=
 =?us-ascii?Q?MUMIV5vHNG+yDRLqk3ycEE3jtoR0pqajk+vgrWR/BGBaGhaTpI9/jc6UVvfn?=
 =?us-ascii?Q?n2a3vtfn8vSwh66O6BfKGvMIT2X+VWOjHJl930THk1cX/dnaDR/ApEboK+ae?=
 =?us-ascii?Q?BB1JzPGFjcWgA57zZ/fyhHQ1sjlqce7BBYxM3cqDnedA8P5ZG1FCk/mPC4oR?=
 =?us-ascii?Q?Nq/3tcTE6Ba9serH/rlWRnsoPNLo4qKFMiS89fsssZVSB1OSDJwCxVJzVZBQ?=
 =?us-ascii?Q?Nf6QeBB62jJrXGqJsZpRqgWcPygb8z1MNDF0zh4WL8h9/JEPJH6Dj/FL9wie?=
 =?us-ascii?Q?beg6NtjOSztc3uCpnBNXkkeJ8gM90SH1GTrLh+RPJlfKc2lJnmDW5d7ddd+p?=
 =?us-ascii?Q?TFZkpThaid1aG2t3hJpxmJuS78N4u93yhV/j74eqAnJF3z42/yPk7jHMSdL9?=
 =?us-ascii?Q?XaFPmXSZhSd/ZRG881NRUL2U9YqZiMopvpOreNaeqVw3X35v8KQ1X6959L8+?=
 =?us-ascii?Q?m/qYYUNMwULzlRszyN77UeR5c7RkZ5f3sQLhbLp2kQTajfC0cYQD7c10+2qR?=
 =?us-ascii?Q?1m8h7RuMoINEqIg0w/LIL4/+3TCcI4c2BVO+Di+JOp1OHTA+iikqj/4D2Q0b?=
 =?us-ascii?Q?lerbc8+C2F6Xb9vVzHz4wEpge4tcOUm6g5FaXqvQYeTCGzEW7FXsX2uyqQ2L?=
 =?us-ascii?Q?7hf/4vkjb1FJewoe5bBMuzndm3WCSK4uitjR7exMWGcnFu0kZqcZi2xMkmGv?=
 =?us-ascii?Q?L4tGbkWHWgNEWU1bTBdLRBcghPBzvo1awhLKgHTkSmfvmXf0AWLgPfs8KBtl?=
 =?us-ascii?Q?kn3OlbHoAW2nSlnJgzU4FCJNFsrYi9LYUCuQIXgX4CNmFbcJAHF2FGTrNh2K?=
 =?us-ascii?Q?KXYTFcvwfEBqBzdimdfkksOkMZ3j7HcMUP6YgpWDUe+lmpQwCbPUJrqqEMpn?=
 =?us-ascii?Q?+11XmCtqJgVn8uNRo8Tj8NG2Clqyv6fV/OXEVpgu6z28R3WQKhiaA/P5TwfY?=
 =?us-ascii?Q?BuNzIBcToxXHIeMYb0b7aOfGvatMrIom8zFn5pSdu0NMEAVBfcrX0XIAw5do?=
 =?us-ascii?Q?RtxhFx5miXJ+XD8qSQSCcD7dHuANsfw5+JFi3IXSepDaC8BxGCSIpW5z7ikm?=
 =?us-ascii?Q?tylRz87qM+Z1+KHKjChZEPdXAKlLwsse2cQAR37kaRQgravW99GSIh9HNoCg?=
 =?us-ascii?Q?0TFhvdgE8e6LfoB7eTO+H9eYL1g4QvMF1Saoos5jOn6ePWZwL73F/6wH+uyb?=
 =?us-ascii?Q?atfk4eweJXIhJMyDKDjwbDsBUnVwA9L/q0pGzaIwjHEOJzURU/nYeliiwHp7?=
 =?us-ascii?Q?6tiXvPj5IJbfQ5xzdkhKQRGmyg+gbehAoyCZkOXTtR06jX5rLwV1vNeplVwr?=
 =?us-ascii?Q?siV1gt3MZyowAKjcuqXZzqDqvoxS7/tfa1wnsm3gw43E5W1mq2ylLCRu0Gce?=
 =?us-ascii?Q?NMAUKAyWFzdD4iCuY0G72XqIQ9BUtOtM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zg67TnERY1eoFcDeEyGynZE/skgYAZgLSOZOUXXAFy5nEBv9nDpbdVyA7QXn?=
 =?us-ascii?Q?dLiWA8W/RYUdUAK81Px8Lh60073IPF2noJGdzrhUb7aWoBhvup0cabaYOpba?=
 =?us-ascii?Q?i9YYPk6sKWJEtU0bSg1HIX5B/xIt4Zm4qIUg0uCck4et76jkiijbnMSP4rk+?=
 =?us-ascii?Q?eAyo6bYmDOdMb4JVLClV4AI2K/uzM8Ao89y7fAQ2oTDNpdP45fOO53w1+Qjd?=
 =?us-ascii?Q?HQgp8aeYHSBtHXGU/r8GbjtB1S/beWLrHnIdci6KxA5XPKybOSpRTDKNQZ39?=
 =?us-ascii?Q?Wsda9JcUPSp6im+Dp5AiUTQqwW25n0TbflYCTeE+w/TSA3g0JxngUEIcJApE?=
 =?us-ascii?Q?i4ioV01P/9ioLtAtzwRr/RUmIs7GaeI7V1elWu6PtxwM9MFVEvY5ZCTPBFNL?=
 =?us-ascii?Q?LgXlXW1wArYihMiWW0nSuMaAbt1SgIaJrhjkRNR0uJyjLKNmvyey5zEDqsOY?=
 =?us-ascii?Q?ZCEkHRR60N9ZsQckzNsdEqNl2LxGlKqwbqawLJyf29uUpDNnQ1NEphrtdFsN?=
 =?us-ascii?Q?8Twrtf5XF2IICC7CjuzqYGllaZzNMdve4yjZJFcLcI551TuUIB450/nawDdi?=
 =?us-ascii?Q?zt3R/qj/CAXcYHtz6ssV+4FLTtig4upu5jq6dAkdmyy0glhSIwE0tLWR7528?=
 =?us-ascii?Q?yklyMCseTZc/j44zKnRw/lGCLfgT+ON5OjCsUqgvnBzlTEeTgVcLP0uZzQ9M?=
 =?us-ascii?Q?tap6dzWN6KOfUn0kyDs1MhBKWG+Alez+av9/eyTegtUEIpa9fLCuYHWd52bk?=
 =?us-ascii?Q?nWu+giTZvOVaG481NHmNJ30qNu/41fpSsRaqYrIWr7nrdIUuBV03QIFy41b7?=
 =?us-ascii?Q?SclPFjlPvjI5kXQ/9aJjupOO6weXeMR+n4IX2+Khs9UmxaKYgSebJrZLtpT/?=
 =?us-ascii?Q?YgxEdL06aeCGChiqnztTYQHLDum7aZGmd2OWu6q8RRurVV2YY3M60Ba8SQ2h?=
 =?us-ascii?Q?z+/SqcKnGWVwSBMQ/bglQPuQMWMcxqEn/F6A7DaY5BMFloclBPPokcTgSHbX?=
 =?us-ascii?Q?JThsHNEfRR/JR8zNY+M/Hk38rIgwM3cJYWud2GdSlylFmdAHjqeIC96ZL6oD?=
 =?us-ascii?Q?pOHcCkvfaXO0wBIQ7ErbBCKQ8GKkBN1UelhOWymKm5pQGweaTt3zg1oMewd1?=
 =?us-ascii?Q?NrNxAvpq9Ftmt1IUUSm5q7QOcCvFhwzptSMyASFfS2bKnFLsIca4oPVhD4tl?=
 =?us-ascii?Q?At2GIwR1JCIq4hBVvBOlyD5fVZg6xDsyeJm50o/G3uvHHuD88p6O2PYnBAj6?=
 =?us-ascii?Q?s26nAzxthWmWumiud5BVpsmav6YN9dabJnZsbeaAPQQxFm4nDtpKmlxUYXzJ?=
 =?us-ascii?Q?luhMKMBvyZzKX1vaOuS28J7R261t+OzxaHL4sNjNk9EmkQlyAGvcg1mCi4a1?=
 =?us-ascii?Q?P1WIzPGQnRks2pFtJVViC+rkTT/niHLOOGCccbtMA8lnQkJtBONw+msKrLLz?=
 =?us-ascii?Q?D9crl7xdz00HTFbLgpuu0VElY9dSrXqb7qf9XzFLdzmrn7N7XcBBe9SCVgS+?=
 =?us-ascii?Q?dXjv0PhwR8B6dKj83UyGahUXxZ13GeoXa999jBczybYeh9N62GJchmMvSON3?=
 =?us-ascii?Q?JaVEra1iynqxbdvQI3CyXBWDFSOdSfEZc/ckevk1X7D/+e/E2N9rH7RmxFWP?=
 =?us-ascii?Q?Yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0597e839-cce5-4bae-f211-08dd6cf00c46
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 05:27:20.9825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8d2bTch+VPC5NblBKCPSrIAMUdNOX/E0YNJ4nlB4SjrrvmnP1oeoikysUCUDSwikHeFdlfl1Avq7IdQ4vkgS1N3txh3ZDNiQXpjptppvUkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7830
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Monday, March 24, 2025 2:40 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 2/3] tests/chamelium/kms_chamelium_color: Fix ctm-
> limited-range subtest
>=20
> Test is fixed, now we take chamelium capture after setting output to full=
 and
> limited range and then compare frame dumps.

We should add some details on the steps we are taking during the test.

>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/chamelium/kms_chamelium_color.c | 50 +++++++++++++++------------
>  1 file changed, 27 insertions(+), 23 deletions(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_color.c
> b/tests/chamelium/kms_chamelium_color.c
> index 68611ec6a..355047ed6 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -352,9 +352,10 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  	gamma_lut_t *degamma_linear, *gamma_linear;
>  	igt_output_t *output =3D data->output;
>  	drmModeModeInfo *mode =3D data->mode;
> -	struct igt_fb fb_modeset, fb, fbref;
> -	struct chamelium_frame_dump *frame_limited;
> -	int fb_id, fb_modeset_id, fbref_id;
> +	struct igt_fb fb_modeset, fb;
> +	struct chamelium_frame_dump *frame_limited, *frame_full;
> +	int fb_id, fb_modeset_id;
> +	igt_crc_t *reference_crc;
>  	bool ret =3D false;
>=20
>  	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
> @@ -380,21 +381,13 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &fb_modeset);

We don't seem to use/commit this frame buffer at all.


>  	igt_assert(fb_modeset_id);
> -
> -	fbref_id =3D igt_create_fb(data->drm_fd,
> -				 mode->hdisplay,
> -				 mode->vdisplay,
> -				 DRM_FORMAT_XRGB8888,
> -				 DRM_FORMAT_MOD_LINEAR,
> -				 &fbref);
> -	igt_assert(fbref_id);
> -
>  	igt_plane_set_fb(primary, &fb_modeset);
>=20
>  	set_degamma(data, primary->pipe, degamma_linear);
>  	set_gamma(data, primary->pipe, gamma_linear);
>  	set_ctm(primary->pipe, ctm);
>=20
> +	/* Set the output into full range. */
>  	igt_output_set_prop_value(output,
>  				  IGT_CONNECTOR_BROADCAST_RGB,
>  				  BROADCAST_RGB_FULL);
> @@ -402,11 +395,28 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
>=20
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame_full =3D
> +		chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	/* Chamelium calculates the CRC for the most recent
> +	 * captured frame; that's why CRC of the reference frame
> +	 * is captured here.
> +	 */
> +	reference_crc =3D chamelium_get_crc_for_area(data->chamelium, port,
> 0, 0, 0, 0);
> +	igt_assert(reference_crc);
> +
>  	/* Set the output into limited range. */
>  	igt_output_set_prop_value(output,
>  				  IGT_CONNECTOR_BROADCAST_RGB,
>  				  BROADCAST_RGB_16_235);
>  	paint_rectangles(data, mode, red_green_blue_full, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit(&data->display);
> +
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame_limited =3D
> +		chamelium_read_captured_frame(data->chamelium, 0);

I hope chamelium takes care that it doesn't retrieve the frame captured usi=
ng the earlier chamelium_capture()

Regards

Chaitanya


>=20
>  	/* And reset.. */
>  	igt_output_set_prop_value(output,
> @@ -414,18 +424,12 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  				  BROADCAST_RGB_FULL);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> -	frame_limited =3D
> -		chamelium_read_captured_frame(data->chamelium, 0);
> -
>=20
> -	/* Verify that the framebuffer reference of the software
> -	 * computed output is equal to the frame dump of the CTM
> -	 * matrix transformation output.
> -	 */
> -	ret =3D chamelium_frame_match_or_dump(data->chamelium, port,
> -					    frame_limited, &fbref,
> -					    CHAMELIUM_CHECK_ANALOG);
> +	/* Verify frame dumps are equal. */
> +	ret =3D chamelium_frame_match_or_dump_frame_pair(data-
> >chamelium, port,
> +						       frame_full, frame_limited,
> +						       reference_crc,
> +
> CHAMELIUM_CHECK_ANALOG);
>=20
>  	free_lut(gamma_linear);
>  	free_lut(degamma_linear);
> --
> 2.25.1


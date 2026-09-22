Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA33AC982FE
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 05:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B0810EB74;
	Tue, 22 Sep 2026 05:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpu15h8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A2110E57A
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 05:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790055824; x=1821591824;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fvqRcMVSp1338s1Eqr1m4nBocA7TpChOpiR4MN+6qhQ=;
 b=hpu15h8MwEHkQNVCcDbvewaLXLX5D790cjn8+N7AWK9o89+ItIQU0azh
 oK8pQCNWFfDeBZO5OpIr671oySB2n2fAyQxr5/u5CvkI8aFzrkQRmfV5i
 OP7wD8z7JwVGb4dG7+CCcr6AJ+V9OcDeW+soGqopJl3BIoY064rk7mfvQ
 M6WEJwITyMJcafPxHh4lBfB5/VDcKxd8ofHC6+WzeW2/pZxRuuIOuvTss
 ty/qGL4TaPE8JXC9vVNSPzYHohkemWKO0PS8IlNIp7OXR3U5e4sbQssHU
 uLzq36Hc+gbNzMDPYcOo0/GbMEgNqCche4IJ90sgBiG5YxCqLWGwlWGQM g==;
X-CSE-ConnectionGUID: uAteHQCmRAKC7raHpEv92A==
X-CSE-MsgGUID: yE3v95gESsefSz4u1DoBjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90492818"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="90492818"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 22:43:44 -0700
X-CSE-ConnectionGUID: rweyMr27R6Wu/hizZHhVsA==
X-CSE-MsgGUID: e7F9TSzcQMiH05b0/NZZrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="4285621"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 22:43:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 22:43:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 22:43:43 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 22:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKIjXeffWAsrvoMEVv+vlNKkNTIohOqDoRAAOdBuJqwsUuN4/kW6EIMKk9Ah/u5Z7br8gVGNEYHz33o9n0J5hpon71XHOhrShAdYlhJdGcuqsGO8THFLkmJDvs3ARGLkbq74wmdm1HxoH1dq+a40R9ybHPmQGrqOBdbG/TVJUFdKReFMroN5ugYky5iCf0YGYtH2vI7miNicixLpLifh5SncFMkXQVxHWcn4nwtbbzYDlAhjaOUdHN0rcwhK7bI/0M/QDlGueOno5P42Pu4NKvsVGF9xE3uMJHTqjxDxFevg843ozBcphBy51AWbD81b98gHthDnrpm0Qr3vJp6rSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGvMP87P/nrIepdXCDwWomnnriGdeOz89aGemb+tkVg=;
 b=PfCpAothVqYSAKqtQZXgho99Lsku4I7zw2+12Lc9Moa9/orSbjA3sw36G9hiA9dh+jb83IrWpOOqLsGiaBoXkZyJy3jR61fiHprFHWgLSYsGC/msS3uPbufNiROF7U1um9x5QZLDzwbzUmFJbm7skEYDJSl5R7CyzHpvDNftQe5Gt/MRCF9OXORHUfz8TRjPdPWKKFpajCKh6cJovPD7BHAlvJvh9Jf4Sb94pGvN93Mq4pV7mTJSWnAi8d1WhQyD6POi2RrqLPd5lDrMQUmmoUjxarhWqisfDNneWCX8NXKyg1TER+GLJKQzzIhpFFWr6qPSmXw1jC8CQiy5VrKtuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SAWPR11MB9733.namprd11.prod.outlook.com (2603:10b6:806:4ca::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Tue, 22 Sep
 2026 05:43:41 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 05:43:40 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Add fixed-matrix chamelium tests
Thread-Topic: [PATCH i-g-t] intel-ci: Add fixed-matrix chamelium tests
Thread-Index: AQHdScRQBV+0Tq3PKku/9MTWppJLX7baFtew
Date: Tue, 22 Sep 2026 05:43:40 +0000
Message-ID: <PH7PR11MB67962DD59C71E6A881DB6F15E5832@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260921123342.1068658-1-swati2.sharma@intel.com>
In-Reply-To: <20260921123342.1068658-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: swati2.sharma@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SAWPR11MB9733:EE_
x-ms-office365-filtering-correlation-id: 98ce1575-283d-4410-e130-08df186c750d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|38070700021|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info: cXQ9dY/b0FS40vSgMCBOlCNjU0NPGq1olFvgIOuvWXsoWYgSM+K+bSSiYIqRPg87ENvtSqy3q++uYiI1aUgrRU/iELfb2CDLJ0kcehyClZuPkpZFyqQB0Xa0nXEV3Ad0S4I+l6W3qOTzS5RH22F0kKxpSRqA8NEfrBNQzRBjwGDp7+SPctbWChDf/+nqFZD4Fgr2o0Uqgnm+mGOvDOrMWiqgPGqJWnhm6lcns75BLPunEPH6K2CinhQGWbX5atSSljB9dVA0Y384M97Gt6pMoLta0eldkg83BzQgZXU+Nb8LdAZutGj+VaYs9nOpZ5SFpEma3ZKvPs9m+YepjSNGajWteZpD5k+GmPnFdvsPm/Vt/Y3RVuahJj3GCHEvdn54y7RypK5E0Ua6b7bxUDPRuyUDJiY6C5mPt8Al1Ywu/2R/Kkv1LO2EzN1lKZH6eXOc3kkqZ6rhnKZ+V81O80tGDTdWOomepYcmOlf2dHfyAo6ATZf4MR80eXNuros+1jdw8j9pzJi9EsoE1QYjBzN/yLp1PCekbeKpBTJgdEQHoY59ipozZnqYLPGhGyO0wbl/fdV8rTeIipWDT5sDgh8PYA6uBcW5hQomH/XBWFeMn5GT2D9QBUYb4MG84Y4sV988u1z33XQAc/5ZusXQ4QO7gOczx+HcH5KfpMDj/VeI7htZur8Tjy8nYLQothLNwqoxX3PTsZw4qm1ooxFoFmBvbwZZ4qV7SGGh2TDtahCn7C8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q0SvAwHjsVO/t0oN4ou6uJUVfXI6228t1IQa8pMq3lEArZxiUX6pwDhRZ3vf?=
 =?us-ascii?Q?bvtDRuAzRACqWrNtjdQOIaX62q2aPAs7d5dGCqvWxzq+Xd3Zn0+fc7CjPpYU?=
 =?us-ascii?Q?qpZ6b6e+WLLmn86qJVoU3QZ3BVVrf8QZ7Mb3dyNSt0yQY1AXBZxfGfwtLPuS?=
 =?us-ascii?Q?ARYny92i+moYYBk3QjAjurr7IvqDXuVVvBqtPZY4UeuTuut1yssX5Wc3BXOK?=
 =?us-ascii?Q?nyI/Z2T6sKAwoGZLzGUgM+jIqQM7WVoAuT5lqvxm4GtTWHULPU0SMraC7Ydb?=
 =?us-ascii?Q?3d6cLc+EJKNzNJGU2pgGu7x4Brh7bA4mZavy1u2JUuKGYqvqprFdpXkiOBPb?=
 =?us-ascii?Q?VlP2YVlKhfWJeXDFqQX4D3kW10wviC9y15fucp/Eqh/TXLaqKDyzyRiDn/zk?=
 =?us-ascii?Q?Y7uCnUKyAMe4b9LOul1vld7Tv1TZ9otZlrE9BD8yfWOX6qh5zxO/C9Iu3bQ+?=
 =?us-ascii?Q?vLMxx0ASfootgjwyke7+YbdAM5QsjlR142qN1nkW8jCWy3B+DOh6PChSq52C?=
 =?us-ascii?Q?MOsImOTRgw0lF1zc4oBzjMCqUHnj5wpvvwqPybOKmeOwhepkcDmjBwcANzsz?=
 =?us-ascii?Q?9tcvbUHvE5JmWly1XLcnCL1RRrK2X0I5iBxvwLfeldv8fYp8qzpZseXCQ3lp?=
 =?us-ascii?Q?6Lu5AqYsOZLXCR5Whl+K0MeYdNVWDjmnxZ1F6+WPKvWjEc4vTqnU/xxfr5+D?=
 =?us-ascii?Q?XhmeSi+u0ef2XHZc+6m+DI67e6OX4zpCaAhXUnDnZvXRriZA8DH/fDTr/0Rt?=
 =?us-ascii?Q?SiPmrMo1LIvZhBuJx91ZyKOeS5dp5JAX5lzXm6UgeOa1Zi04ErlOlFlcwW/a?=
 =?us-ascii?Q?k+ScAfUxG2kdepX2fjSeSoTlJJNPKZp0OZhE0j4WU6e4xZm+Rokv2zvP/G+q?=
 =?us-ascii?Q?BhOMsR5STba+fLKUZlwOdwvkcyuCWphM+TKa8tgI0NLdxk2qIbAeZwHi/O2i?=
 =?us-ascii?Q?xRi6UMCrKJgAZ0V2TDqmtfotxsZ/kYn2JDTM6JBE2or3dO1UamOgr3VDERdQ?=
 =?us-ascii?Q?5/KY6I3ViOKhkhfiFV2tz29w1xK8QQdl6w9IO/ur3kUTI3RSgeTM+IeIAf3s?=
 =?us-ascii?Q?q0315hnNm4cv9ADC9YIsYUSbUIZ3HEwRWE6Mloc0UtzRyirmS2Y4zoCwlR75?=
 =?us-ascii?Q?dcqfcGUX6BG++CCecQ8wrTBn+1WnggTwfulNSdmxC3l9oG+7NMsunXZZBBwV?=
 =?us-ascii?Q?8NAQrEnTH19xO3oMlrucwGq7CZuTZhd3IL1nI+H1PXFFyNilqzkbJ4R00pvf?=
 =?us-ascii?Q?QRANTmjFk6Hd1YEOOWz994n5MtvHzJgrtUE0brFlVBv5NGlNlyG/i04TjYaL?=
 =?us-ascii?Q?DsQq/5PsQRZ3iep84oiCHveRtln/vaFgOuJwrFtKXtuazjrhEEyXba/2QP+A?=
 =?us-ascii?Q?m9ivaKlBrY+SDp66C8CXEDjnR68Kkr1sEStfFjDVzkUDKbraAsAwIQsnJLSz?=
 =?us-ascii?Q?03b8z6O05gwf+zrdfj64PD76mr9UqwU1q9X1NQ/AnpPlk4cLiVvZ0DU7ABkc?=
 =?us-ascii?Q?stOsI2RbWcc37zzALNjFQjGPS1Y1OTfr1/1xTTIpJrb/0v9v2kTse5rqMLBw?=
 =?us-ascii?Q?8LQOivOxJWwHJV5j3/nQ1ExrkTt9htc5YMUwHTHk4hyY4dixWkEbmOHPP3xq?=
 =?us-ascii?Q?hWd1Aqi1wegmCNovfIDtct4wTPYWFPyyAxlBtzJaljpz73rew3MVe3Hhh70T?=
 =?us-ascii?Q?bVO0Kcq9cnVexFHc1qC+2pScsnMAMhyNVU0GMx6XQrHWvv/C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3M0Hyfu3W/uqMUo/GJgB83LXLaRDLTLgJxO24jSR8XVam/gBfjkVsCeMtc1Hi81VEx4+/8AKe9yYCouIXjDvah6wH/5ftRT1OQK9MD4pZ1ol0j+qH96IJsqSCI4cJXiyuBSDE7p9gJT9Wt0332oa3nlwzuIkVO60f0T6/FppdQA+DJEZ5wQmr6p7ytbmpwStmGS5WY0PfRR4zP1tqcv5vr/EZfFjPpRzOW67PeYuEvzAWjT7J2dkw7viN9nSI4rtBLDFaDKjr+KJ6mVDKVctz8hU0gAGDhOQ/CjmHyaFyOv7rY9drcPFd52KfrrX4kjYw+JkjWxtDTPl93VxUtwKNA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ce1575-283d-4410-e130-08df186c750d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 05:43:40.8750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Po5JslR5U7Ll5xhUdC8oVMJLg+G3jkM6GLEl0efVTuZCCxLXnL7XfLckUJhyj2fwwyJ+6kTMRD6p+zrf54FImg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9733
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

Hi @Sharma, Swati2,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: 21 September 2026 18:04
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Add fixed-matrix chamelium tests
>=20
> Extend chamelium-only testlist with fixed-matrix yuv-rgb conversion tests=
 for
> BT2020/BT601/BT709.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel-ci/chamelium-only.testlist | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/cham=
elium-
> only.testlist
> index 898c53134..6b395e8da 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -16,6 +16,18 @@ igt@kms_chamelium_color@degamma
> igt@kms_chamelium_color@gamma
>  igt@kms_chamelium_color_pipeline@plane-ctm3x4
>  igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-
> lim-
> +lut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-
> lut1
> +d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-l
> +ut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-
> lut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-l
> +ut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-
> lut1d
>  igt@kms_chamelium_color_pipeline@plane-lut1d
>  igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
>  igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
> --
> 2.25.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E2B109E54B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 05:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF64110E94A;
	Thu, 26 Mar 2026 05:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqlfxFe+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC45010E253
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 05:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774504195; x=1806040195;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f0Cs0QC2vsMQybYcVZgE/92otsAzINrrjde/NIDlsv4=;
 b=fqlfxFe+hCPhV9xBDEe36ohSXH2SB0GQwf1uUkDGntrDw//RRA189+O9
 Pjyn1pah3YqnLUGdxAkF1Mjv6rRu/BY9TZbQLsp6kBennBi+p7Cc+g5BC
 W1bwOgPoTtBzPcsIw5btua1K2E6/hCKqgUJyyEt7NV1KtzgeR4iUajh6k
 6XukX772pDGyUqssSU25nSw8LWLoO67BOiaXu8rXgxXpIlMCiYHzTbSeC
 5KDh53n3U/bILhl53N+hXopgb86qfmclQyovqzaftDS2seU/MFh4XABAv
 RDJ+1QgpDUGmRLG+snP/ZGcuWn6E8BDGsSCtOTmwnI7U/HDCk9sYqHdHM g==;
X-CSE-ConnectionGUID: bO5eGhcrS3KUup+PtfOsjA==
X-CSE-MsgGUID: dg5MKWRXTUO7tWWw3dqECg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75748337"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75748337"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:49:52 -0700
X-CSE-ConnectionGUID: u/8lkoYOTje+6sq8VVo/lg==
X-CSE-MsgGUID: r1Ifw+bIRsOaS8Rul4YSDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="222005776"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:49:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 22:49:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 22:49:50 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 22:49:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YR7kqqa8o0YrLz4NpnTZ/BJ+mht/tnZoe7HWXufQA0XxpBOKH043HK9eHSAw0L5BekG93CyzYFEm/vraStzexp/1tJstQFK9+X7KAu92RHb9WBcZXMplzCyQPM7wyAZaGwt7u/dZa3wiUXP8HfHXvw0UpyolC4OCN6t9pX61ISho/+jWnn2qEFzQkAXVG1AflAYgMGW81TMeiXnaEkDRiEmfAg1G3B+tu/WaoDB5RrEphFakY8pNTYz1gs53bd/2g5Zhs3EcnbjKwVsFNE5fQL3P2XXXhMuDpkxOlSFp2B/5EgUpyhPjlgipiJVDY+JpiNcpyTdPnzKbB16xY5dtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvuG4X6ZdrtJ1oNubdaj2OZ7J7/Mh0qFpUEHM+Nx4vg=;
 b=UOJSuwQx6h7nMOTmPNrGNABXX6aVV9PMzcLtq8zFpyTjUpgBNRcuKwSotWBSM5JO5MRv5iVXpihyE72H5idFBYgodplekkaMVvQZ8Twp+xuIx5nynG/AMGJ1mYskcskQYSmf3xyetNDt78HeAb9VFrPxPsNl8mx9lkN3CdgjQI/A8Aw5RlOfUyaSUuR9xR7rU8RqzenfTtIxtsyLDMO5NVCxKvAAHD9ZmZ79WKb4gznaAIztwRPdI+t4pNQhSFpAQHJh8byQLhXCa0Hsqao8QSB3Xcv4B2+MG0QzyWGvehB00fl1Q6EHfaiIe0MPTdzwhYoQ4dbgikRlvIQBuDOYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 05:49:41 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 05:49:41 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kishore, Sumit" <sumit.kishore@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Kishore, Sumit" <sumit.kishore@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip test when no
 display is connected
Thread-Topic: [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip test when no
 display is connected
Thread-Index: AQHcvE4N4kiwQfpLXEaNZM7kQIwlUbXATrAA
Date: Thu, 26 Mar 2026 05:49:41 +0000
Message-ID: <PH7PR11MB6796F25475015C05AC2BCEA3E556A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260325115211.316735-1-sumit.kishore@intel.com>
In-Reply-To: <20260325115211.316735-1-sumit.kishore@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA3PR11MB7553:EE_
x-ms-office365-filtering-correlation-id: ce0be09a-22e5-4533-d6d0-08de8afb79a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: c0llTCnofXez1yzSOQo7z0X1LrXlJ0ldUsmFomOZSdinW1BQqE9E9mHrR9CjB2x7HuIPF4rAzv/CeG9YXKjkJod521Aq7hL7LBOIVjDdervZN2elI+kUNvo5gMKvpEouUY2UTCZwY/Xc2wo6abAE4QomlfaMk5qMGiqPjxJDsZQ+4MUWELG4y0TyaDJK/r1k0iX8xHNUspbtYP/fN5zTnZkeHY5jiGI3UOP+VwDB67bWO3t6kiV8xQD7LK+e+9qPmKABZ2VFIa948pHJM1iQwLP7HacvYRA26lMduiJsECDKcQXGgkr2EBmpYZQNeTS9AFdp07jPBPVebfhbvjM5CRtc78lZcO3MsBAczo+Il6zQB+mr29FSrl5tzxenmLevFuJ77rM/6vYMNCiaQ/NGxWssENA0oGnY/wAOF2kAIDLirNTwZnzgXZtBHAdiiEHB3531qkYpXQncRh5hO9p5+5dAc0dX6ST3Oj18oHWRWEvDbW4WlqGokM2+3NgsQpSyRxmQAA7vOx3HCtpXm8Ce7LrNsLNmrZUJa9WpxPS8BvzgNRqhZIHLJLPVm8N6yjl1eXCjtOnZ9OxU648R9c8HmJXor4dLGy1UEqnesA315yT0Uw7wvk+rAjTFQJlv0PJvbzkmXA0aX4lejmGmpVEVKi15HGhdGqsZWPosRjWfQQgS4jjAcficri80+89LCJBHQr8937tCRJHYerGMEJWK/RxO2XCENpgXe/vX7cc5FxeTMaqeFdvYnxAW1ZZeOq3JooQLQXpXmpOKWXsltjt9yQKPBO9hfIsLkghq/bhQt8I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/s/l2AxBScO4RX8GNYoKwqP2rfz8ikHjGKXVnW8wWiMUiT7JDwu8m6ZgQFNI?=
 =?us-ascii?Q?Vb0K2ocmA6XQlS18OJGbOKN563JgxUwH9x+zwoREaw6GpgzHd4PRfEiMHsUf?=
 =?us-ascii?Q?zigwaMLEyPIpUbQJytFTg07sGmkEwTlvvA7vISCftHNqy0Kj0avs6RAuBUTr?=
 =?us-ascii?Q?aYGDGH5sRHognM85sLQ81BJbTwTq58w4WOHLRFmYiZKVj+vr9ZbVd7hTqyQQ?=
 =?us-ascii?Q?iH5yzr/CSCHu9TvVW43kK7q4Qq977so9jTmlNMmcnKywMBQt960x/ZK2qsnH?=
 =?us-ascii?Q?OMZGzGRUd9KuljkrHTPikQvia2AYNEdzFT6qRezqpJvSmKio/7ySACrAzyci?=
 =?us-ascii?Q?Ssv8wzgLGMj7tYz4tKmZCUHbzplHtdROqKIIoiB07kP1hiceSmuokp48opb7?=
 =?us-ascii?Q?E4MYn/a8g28UN8NDrewPd9EuKJOOIoGHTjazBwl/t1pJ4hILqp3UV80Ocbta?=
 =?us-ascii?Q?AR6r5YMVrAd9nQ3no1RZ7DJVVhU1gp6K2LdvxpZB0dMXSxFPHYVNSngpk+MZ?=
 =?us-ascii?Q?mmsdNmVJQ3BYEDT69V8yhme4vPKmm3cvrdTpOdYxkDfDiU7j6Z3NuzDfWVGJ?=
 =?us-ascii?Q?XQNNJH8WvfLKCLdiS+4Fl7mRXImqhWl4sBbwF+bjF11gY2EVxPGkK6qLDG+R?=
 =?us-ascii?Q?Y5cbb9PCfYu5q1dmwHgLNyDXXFCRG2hfKbvxoDJE0CtW9qSbuy5IkHV/5n6O?=
 =?us-ascii?Q?d+y7sR07IZij5IhSe9Ms0xn04vMMq2WGRlpBlQqsn3JclT1VkVKaM7J+NdLU?=
 =?us-ascii?Q?SKQjxVcEnuI7ZcJRAprmOgwkA6soKPpkzs6am2HXFXqQmRZGMypNrYSoj2Yq?=
 =?us-ascii?Q?4KH2t09f1z0UwMdcPTJs0/praMtn6i63HHfzNe885+daW9y659x+r26umJYQ?=
 =?us-ascii?Q?sNiWJ5OcazSKdqb/7tvXX3ymZD+E/4xY8tixW5BSKU7kxa9kUEtmcazDZ6b5?=
 =?us-ascii?Q?Z6h0hqjEBqJQiAfoFcEDGIT3bV0+04jS23HYn8jYo5jMsTNrUBU6nNe7d1tr?=
 =?us-ascii?Q?1mwFjmKN3ZvtVv1wGoJ3tkvzfh7O4cV6B4PX67xyqfJtErR5trSOAttvQOX1?=
 =?us-ascii?Q?W+G5GKZRV7hAUoxxmaF7N6eF8+iNZ2QF+1Vp+ynabvDIfotgG1xcC8mN3sdm?=
 =?us-ascii?Q?abg3DY2iPpqi+Ymib92ODg5soVeeD+rWfcDXB5dR0ECD/hkzyITb2mNCvvJu?=
 =?us-ascii?Q?NJkKbs0kRxUwk2NN+yEAZDAW1JxhuzEVFDh7K9d6kfo2vSjt5FBMNZwOxuQj?=
 =?us-ascii?Q?5hFMlrbaePmEdjR+r+WVJj0IyJtSY7NlUgAC/9q7SkHYY2QpY01lMLD/Jhm+?=
 =?us-ascii?Q?1VL6UbH94sskorjR2+LLSb9SXfR1r+tkkCroH8VGE08HIBnGmxkNVrusO/P5?=
 =?us-ascii?Q?+uNkLwdsvVZsfuGZew42KFk3WC5EAchLJocaBASfnxkJNOg8NBPSlFx+kkrS?=
 =?us-ascii?Q?+J5llA8meIJmKmKQCxk5TOoGN8k3LsAtRIiygvP9I8aoT5qkU2Srb95oeKR+?=
 =?us-ascii?Q?RKsJ765WUQAfdA7fUAhp0TEwUYoq7HHJHQcf3MmmSURiE5HhpABCEMCx6+Po?=
 =?us-ascii?Q?XDET2hbOT54XCtYYe25s1iEDIwTeOgEGPEnuGRBlYPnVlm0kXsI4gW5WPdVH?=
 =?us-ascii?Q?1jGPv8P1SUEmlnrMhvjDqUksHByLtdH1K5tlehUKROZ25au06rNSJqYAuSG7?=
 =?us-ascii?Q?DhUFwJ360OHvX0+Nu0NYB1F0+25jegKWj1+5wk0sUFF7Zk9v?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: taRWx+4vQaT14UWo8s46wYNeAqtaKiIySGqEQgOLsY0hwJ23p24ZiLBtd4LV86jZs5sW9CcrF4JAPmzz0cO9PNppWgCWe8+Icm/XkqAOFwv6wTi9OmNRntYaixjYZTWVMpEiA7LxBvihyEa2auf/eNdbIkOXd+2e9GidiH+jY0TYa7kRg+u1zZQNci0NwE6hY3YzR+v0yo0mR0aCf6uNx9SL11y/tNc2KIHsIB3TOw0iojnaOVWtk2DPLLt2fiprZ+swZntve6yMqacNRItnU7TY4QN9ipwDwopC3s6BgQqdEdBQwzWwI2bHGggiEzqdIOxfaN3bjwmbPcG34kzuYg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0be09a-22e5-4533-d6d0-08de8afb79a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 05:49:41.5172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JegmibjmaszEAfIAea+HfaKv3p2zkLGfqgwdasS3UXjj0ipSEmaoeG5ixRhnwrbd0UwSc/cPEaaA/aUrw8L7UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
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

Hi Sumit,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of sumit
> kishore
> Sent: 25 March 2026 17:22
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Kishore, Sumit <sumit.kishore@intel.com>
> Subject: [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip test when no dis=
play
> is connected
>=20
> Add igt_display_require_output() to skip the test on headless systems wit=
h no
> active display connected.
Please prefix the commit message with the filename being modified

>=20
> v2: Add igt_display_require_output. [Karthik]
> v3: Update subject and description. [Swati]
>=20
> Signed-off-by: sumit kishore <sumit.kishore@intel.com>
Please update the name to start with a capital letter.

Regards,
Sowmiya
> ---
>  tests/kms_plane_alpha_blend.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.=
c
> index 3a67dd8cd..3a2649833 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -764,6 +764,9 @@ int igt_main_args("e", NULL, help_str, opt_handler,
> NULL)
>  		igt_display_require(&data.display, data.gfx_fd);
>  		igt_require(data.display.is_atomic);
>=20
> +		/* Check if at least one active display connected */
> +		igt_display_require_output(&data.display);
> +
>  		/* Get active pipes. */
>  		for_each_crtc(&data.display, crtc)
>  			active_crtcs[last_crtc_index++] =3D crtc->crtc_index;
> --
> 2.43.0


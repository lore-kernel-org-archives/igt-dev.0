Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5F8FF8867
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 06:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57D710E115;
	Wed, 29 Apr 2026 06:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oImAc/TA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7EB10E115
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 06:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777444668; x=1808980668;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I+ft3JDqONrsD5fa+S27wSSL+yKjIbAS91T+SX4px8E=;
 b=oImAc/TAhxn6GQvV/Pt1xWEJMobDl71NKbN4qPs0eHMHS9fKHpJSRTqk
 FS4YDlHG6xXAJ4hOXboGzIT/h7eB4pxLLLG43fYPn/JFCrlTlDS74Y89j
 Zqqbb/IhhWJlc4iyJ+lSWRJ96WmRyQktCxRUP1znmqWqnIZr7LLEH2P1o
 lWR3POR4EOMV6PQUai/tp8Pj7ZIeXrHC61rGGvbM70HpgTikKzHHnGRZK
 mftEIZR+XVVba6qdcRrcEy41jzO/wCVAs9J0I04hYxcNJWyVZXI3BsnD5
 nq0Bj5DpPC9A5pi6Ufkmz/kI3ZUgXZhrPKRS53LHMbKIDTcS7JT2q9yFI w==;
X-CSE-ConnectionGUID: UVEWCKwOScS6CXhsRChnOA==
X-CSE-MsgGUID: ch9nH3pNTPO1bYvSIKGLng==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80939906"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="80939906"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 23:37:47 -0700
X-CSE-ConnectionGUID: OCZppj6jRruYD0xN7pcOBQ==
X-CSE-MsgGUID: O/2ACYB1TDqEYvM9LGKSCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="234458118"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 23:37:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 23:37:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 23:37:46 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 23:37:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjTeDnpYxDHE+pR5bVHxnRpP8woZ84aP+GGiqpiTFy7/PpRNpoBNFy+vJFWqfsZH+EWt3q0aZ6LuIoQXM0Sl/TWVM0ROG++nAjtk3vsJ6EYFWRlsatAFLPxtNhxkJmNrCRXfPetI0Y0+75tGa4cnQ+OuLhWCoUsDVZ/SMtspre7VpFQSCX2N0m01aYDgd0KlvKDgZmVRt0/NNCXvYUzCeLGXNpAKscgTzqQu6OuGacXRWpG/5HhIpI5W6saM10GeXBu05+OtrNSfAQ3x6dVLcfRJ/G+c+O94OH5zOetIPZU0VyiKq551kcvdvFujY9KvIRQWvWsFEAa/TxfqhaQmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8esGkvI+Ezxq61Tfya/Wbj6CCc+D+bRAs3Pr3CedT8=;
 b=XfJ48x90Y6pFDEdyzFMu8QinwCzQ2azw9uIKFSfKzsPR1fjC7Eo6dRWtM92S4tkTucf+8Y6CvCTVK3/pO3chSqpgHkIy1s5a4BqhIYdwKvBETDaW5RQzoSMf/TfHZqYNFkTZfUyFA7Iy8JLEbcbEUsBfRshP/1a/COVAZd9Hu1XgNeFWLkOQIxWs96bZ6Zuza8adrLrfOTZa0jS1XRD07dfcUyN52Q6E+6F0h12ZRZmNrOI5MTnczel6R1SUT3L+mOI59RF9fX6j8CAm4GrZqjhF2Jdbo9RcJ0yBZX6ELMjDVU85am0qVSlRmLSPE3b0fc/7MtUwmAOxChzQqv0HPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB8598.namprd11.prod.outlook.com
 (2603:10b6:510:2fd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:37:37 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 06:37:37 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t,v4 2/5] lib/igt_hdr: Fix EOTF bit flag checking
Thread-Topic: [PATCH i-g-t,v4 2/5] lib/igt_hdr: Fix EOTF bit flag checking
Thread-Index: AQHc11Utl952jHggaE+EWlbgb3shxLX1lITQ
Date: Wed, 29 Apr 2026 06:37:37 +0000
Message-ID: <DM3PPF208195D8DE15FDAC9D32889A14FB3E3342@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260428213040.2293921-1-swati2.sharma@intel.com>
 <20260428213040.2293921-3-swati2.sharma@intel.com>
In-Reply-To: <20260428213040.2293921-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB8598:EE_
x-ms-office365-filtering-correlation-id: 142d7508-e252-42b8-d93a-08dea5b9cde8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: jncKpsU4DHCsQYJxkcQUl4+sYGsFwbo0DJpw7syPy2mCHqhn/4R41v7o8v6mEdUeWRYfCX122/UBc85fgvr5gt5T8ahSMXIk6btmJfqg/eo8npkoRhLUhq4WKx2qxAOUjvCx/IuAnyMatJBodV1fpaYZP9B8da/9N0NQfZgcllv3eDtC6+O55Vfwkpuei+lCF+R/8nURaG+MhSI0QC5uE3R6PGQtTc/q9fRajRueB+72SS5Rvi9KEarLbvjUhVe1WfhBxNaC+YpoHFsuJjHt97yPCgYjuwbkz+/aGwnln2aWHYmRAYF+3DiWDGoevn/Fbx1mgCnP7sFixnMm/HVaKh5BafT8/qurmd1OjHsLTM/W5CWeDUS/KkFWGBFsSmdHVZh41FbbszbXLsFpW9mvUV3i2cMTTz0XACtoUpRoN5siJoIekKlrm2tl/e4Hu8wYstXGjNg4NNRs/8MInOo9438kIDM9QU8Uv7Qp/6owuKCzzyKCTJ3wa0VVBEoP+J4h9c0LaZs7+Z64uY52eElb3rBQuGFdSqheFkIuUHbqw5r59+4qx5HnL0dFiIy9By9cz0T75f518jPITxy9fY4EecMKUqCh1ZlARBCxmj0I5rlpfL/LH0KTF7vrdj4TSKYLGGTS93fjmbG/RJ8lZTypTahwhdRX5QsiCmKeZzhv9rF8t9fqdltzDd+6zKQKStthUBRRFpupvJwLcwxgq25E1NjOs57wTdRYg7j0+/wcMpdmrZsk51GHGZ3n3PPFYkPpGjHjQd1jG2heQq1iIHXgww26lAddNaUzoVevHXwHmEs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?clwl5s/LeU1rzc5dvBAex82C+B3GjIByMn2PRKSjWK2IaWRr8n7I+3piuInl?=
 =?us-ascii?Q?B7i+b9VT1YAd+eZvStZsKHFDk+5HdU40eJhCmS3F9Oq5wSD8SWc9avGyYaGb?=
 =?us-ascii?Q?3lj9WobW/XGlCVZQVxbbiOH2gGzTgQbwSnvSmbIFWKU+aEjOqJs4na/LQ9Ma?=
 =?us-ascii?Q?kOM2Ux5/a0Dcd8K9YjMoVx5qihjtcrX3kKMSVOKbuivjQGL+GIKNTpSush7E?=
 =?us-ascii?Q?wFcly+rmHkntMHNp4CvZ/0v4e03IO5I2MlKQuz4zkO7U26qMeAMdxaj91+Ia?=
 =?us-ascii?Q?GQDc+FrdMBi2zZqyi8fsLZB/P6dHJ38om5pU5gSfgy0zj0vQj3czi/ynWade?=
 =?us-ascii?Q?/WtQ/cVr4nc9M3XEOd4v3FPTGLkVWfKFWzUs4r+bGgeKEgq/gmUNbXRVWgK3?=
 =?us-ascii?Q?esl1YTOfza5fxFWcdREkkKuIjnE/njbkBKs9Pp1+KAY1MqezK/HatgSVMDfI?=
 =?us-ascii?Q?ycHPFucwpLlTdVDSXCklaYYbo09UGepnB4qZL35RuNDSZzMawY4Wu2Z453ff?=
 =?us-ascii?Q?jDE4de+59PBlG9RtdfwD00nYZehHHzuOnH9ieHLEHsTs5KQmZqbCuqp1lD9G?=
 =?us-ascii?Q?vIDwylo2A2KqQZW/bsUJUFPkQVyzqC47rarlaSP4nbUV+SHD4bSX/QcdT7lc?=
 =?us-ascii?Q?SazSNqpxAJWSx8yIYN/Ali3mkkuuokVAsKjfOK6lZl2YVicxHPjg1tWi4ox5?=
 =?us-ascii?Q?QGFZn5rFvW4j++olGhddHLgMeRAOe5HKajyv88LSI/HkPkdVj3H4CzVPmuEr?=
 =?us-ascii?Q?zKB2qv5Iv0psoZgBViFBqXTG8DdPvrPKnn60icLEEeBV2RIMs11/h1UVn6Eh?=
 =?us-ascii?Q?Ra+OeqHqrLemuk1Y+0pfDe//n8GoH1eO81i0So2EXJCc/1FpCXkbqRfFo+dN?=
 =?us-ascii?Q?FtVop7GROHpmAefMXKuRmXapAbMJgDSMXSzR8/Prf81hoQeM9Wzfv/1BjpDi?=
 =?us-ascii?Q?yQFCnY6HB2o7gn20s6oWElD7L0plGbDCmJ1arjrwP2Q0rRrBxAXJdPcm+kN9?=
 =?us-ascii?Q?XuXaBoEuZD4PYkUfTP4/zOr9rTZETaTjW/RssTVPK6pMMeIAVbcZ0GLc/hYy?=
 =?us-ascii?Q?0fWTCRbmIczyTtpm9dADosjep8B3nNsCgR6vJITdJ7fFq8Z5fgVwwThXERqh?=
 =?us-ascii?Q?m+LzRK/zJeyJW517I0b5FdDEhk8UkjJhv64/KiNVWLvr70AVpeCJE3o+goDb?=
 =?us-ascii?Q?ko6poqifaNIvxkUyo2dr8XqCkmZl2Zs69f5YJ0Vd8wlhqh8iZ7fyYTV1c+/e?=
 =?us-ascii?Q?EpqtmiqJTTgv6PAoDinrvQ49g/m+yJmgWYHIUG5JW8ZGm/BnkvUwMtR8EpLp?=
 =?us-ascii?Q?We3IlnG02Zhwn/XwlVB8jOtsOWQvIVNVlJvjwPeM2hKBNTdrxLwluCbOQ9wj?=
 =?us-ascii?Q?ym2l573rDYqZojEipneNEm8s9gEF3z/IOxkldUfyBU8J0HPKmbZQTjg1dkiK?=
 =?us-ascii?Q?/TUMTzFKl3N71749OvakMUUuwAmyxJXyx7n0U5vBi9rtX1x9Irw3jZo42Uoz?=
 =?us-ascii?Q?hRup7QfeWWhDJKxAeVsW5JHu7gMFfAYuOSIctqVwt3a7yPZ8mauOrGQoaQ9f?=
 =?us-ascii?Q?emK+4zUvSyZ5xq0AAoasfFhBWWHq+d9nWuygSbMqXgWcMBPFiSFXE2xRHfW7?=
 =?us-ascii?Q?JGRSTvFAlV1Ya96TOPevB9aDQzWBFH76AKfbPzksYSfYMJzF49obpDdd9As3?=
 =?us-ascii?Q?5yqk8UEdU8mEx3zAHanrxTBlIi1uBHdALjHph8DoDoLfEJb/nNcruyBrCjrB?=
 =?us-ascii?Q?Ps3uXxUXMw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Iwm33UgFMQ0pZV+SzvXdo4OFmNa2Sxdg/Mq3d0+z+QSZnw4X2s3ngI9kp9k3y5OnEzBDQcUjyY8GLo5p1NRsXH/3bc4uhj4S/H50Kc2ezKYQPUxT+PEuBWMrR7AQQJkvg6Sr+oox2jMdbynGq8kdryo99NI+lvIGobkB7xNzkMkduHNZA5iCdU032W+uuy+tUES7uTk9BbWF9qrhS6ai30vTI1md1BDpjEbbeddSueBgjlH1kXc1rTFa7BsHP9++qi7PXvlBdNfypHWDvliDq3vH5/9CZSROdag5L2vJky3BG+x1gR5IewoKFg0DQkmQnrR76mqw2IcUhsmjeoqvbA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142d7508-e252-42b8-d93a-08dea5b9cde8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 06:37:37.5217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Zhx/74uNPkVZfXr5Y4QHsZYUP3hVUeobLEZdvJ7WsoxKmTh/4EWORlFw2D5dYCwpEAvHerQJFz0OSIfQNkhnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8598
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

> Subject: [PATCH i-g-t,v4 2/5] lib/igt_hdr: Fix EOTF bit flag checking
>=20
> From: Alex Hung <alex.hung@amd.com>
>=20
> EOTF values are bit positions, not masks. Use (1 << value) to create prop=
er bit
> masks when checking HDR support in CTA-861 EDID blocks.
>=20

Does this need a fixes tag perhaps ?

> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_hdr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c index f7df2dfde..1baf61ca6 100=
644
> --- a/lib/igt_hdr.c
> +++ b/lib/igt_hdr.c
> @@ -42,8 +42,8 @@ static bool cta_block(const char *edid_ext)
>=20
>  	if ((((edid_ext[0] & 0xe0) >> 5 =3D=3D USE_EXTENDED_TAG) &&
>  	      (edid_ext[1] =3D=3D HDR_STATIC_METADATA_BLOCK)) &&
> -	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
> -	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
> +	     ((edid_ext[2] & (1 << HDMI_EOTF_TRADITIONAL_GAMMA_HDR))
> ||
> +	      (edid_ext[2] & (1 << HDMI_EOTF_SMPTE_ST2084))))

Maybe this can just be=20
((edid_ext[2] & ((1 << HDMI_EOTF_TRADITIONAL_GAMMA_HDR)) | (1 << HDMI_EOTF_=
SMPTE_ST2084)))

With that fixed LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>  			return true;
>=20
>  	return false;
> --
> 2.25.1


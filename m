Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFD6CA6002
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 15:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5045410E4A3;
	Wed,  7 Oct 2026 15:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JldrVQvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E2710E4A3
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791387791; x=1822923791;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=23gOJFLSNlHhgQhYCstoDWQzLySQGADkRWj2LpkKjs4=;
 b=JldrVQvf1wMJ+hmrzjbaXSkUIxhxRGihLPaIb46Wg5ceyu3kqHLTRxE2
 JepP3Hjsm0jtDshRw/iiSZG+ab9v52in/8Ap5hqyznJcejY3M+20Kc0Cc
 BQYdBQmDPgxp7V2s2C2w8j6vJgKSmxAxi5uLZeesELQiHp7rISOIKoaRP
 DR/BicaNtv1nxt9Lwz8U/Wf02KXl2vS5IczhLL/tKo4C9TabBDTg/68rk
 d2zeDhZsZra1FQc2rZb+g1BuxyaZhduZ/nGzpu6reOqk6OXeCkeoooNfw
 NatnpqbWHWkHCv9ab0WGgBOIcDEtu5GeofDMHPbQbdYM586vEsLhGa4ip g==;
X-CSE-ConnectionGUID: cxvxNpl5TOGOcqPXDJtdxA==
X-CSE-MsgGUID: r7UixZtySLa4okTqve85BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="149255"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="149255"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 08:43:11 -0700
X-CSE-ConnectionGUID: OYY+HtolSGe2kspp35IgRA==
X-CSE-MsgGUID: DfdhBsIyQcieTE3ZzkIPxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="74777"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 08:43:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 08:43:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 08:43:10 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 08:43:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH6bruvn0N+mk8rgRywIJIuEvmN4JdQdOlVYxvKnqLZGFbIe1HpTgGxGsUCgAl+4CQKIgptFiujRArbhj0qPEX8JS/GOjmxomlNbWEfwDqohOgR5i1hGM5YuZSXvDtVHIQM3xgj95q+kA5g6NCOyN7EBUgjKCpJZR11fX4UyXLQL/k5nKHj05azsbhUh5G8R1CB+fHQ0cV1LM6qIV4cN1/K78ss8KZe/DPzgJtAzlHg4OgV5O14SZqBeL8T0qq0jUXDTkgAawBIQhir5tmGI4PQjIrCejVJChlftd9KWARXqyPkfq03STahf9hteLeJC2tDRGwiw+S9tyNXRZSMlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTaA5CLWuBEB4LM0fZlnQwRmneuUdaLMd0gZ5AYcwsQ=;
 b=azTfIhpBVCSH3bedXpF1LTC7ZI6/n6X9vAA3N/tljj2XV6f/jn7dhRPCSJ4eoG05xS//6UZ2sVUGOhdG9ooda9yIy4BT6TnNVonIoeUWOYYgCZas/znnMM/9usms0R7zTtSLZ06IfMcpJDrNZmrsHIHLdx8vh1g6KnyCOq0kP5NvtrJtQH1Ejpw8jVvKsmm39KmM4SB1y6oeeTrzzhK+2r50xWOhctCNHOJSHouOTsTQPXt9QtnZwq6HJPSe9VMr3Pszt7lD1v1mDBrcOn5BU5nMhEVbgaUdD8mWNBzjlGUP2TzEyQIsgG/i/VekI2pJ2Ws4v252KqSBcEg4Hfslkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by BL1PR11MB5285.namprd11.prod.outlook.com (2603:10b6:208:309::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 15:43:08 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%4]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 15:43:07 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
 igt_get_free_pipes_mask()
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
 igt_get_free_pipes_mask()
Thread-Index: AQHdVkAd8O5+c6fo9kOMpqQeFbByHrbyFSqAgAAi+tA=
Date: Wed, 7 Oct 2026 15:43:07 +0000
Message-ID: <IA0PR11MB73070C19D34943D60C22E0C3BA942@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20261007-joiner-v1-0-b40826411fa8@intel.com>
 <20261007-joiner-v1-1-b40826411fa8@intel.com>
 <45b38494fa17817bbcbae211010c3161706f364a@intel.com>
In-Reply-To: <45b38494fa17817bbcbae211010c3161706f364a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|BL1PR11MB5285:EE_
x-ms-office365-filtering-correlation-id: 8a20911a-bef6-4b6b-bb0a-08df2489af40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|18002099003|22082099003|10067099003|3023799007|38070700021|11063799006|4143699003|5023799004|56012099006;
x-microsoft-antispam-message-info: hysDFc44tAg83xxPjEyrslvvYPaOBhOn9MvHWx0WItTa5bQ3lnEAZP8eX/DrSBdXr6+9xBEsXhPYLXxXTVH042TDVkP5jP3TkyyyfvHo55sRhnt5HHqbLVs2No880y7WfKJNQNrEW3LtVxAWJIFwTTolEAPSfLIRLAvpY0LEtE7OXd/8BWefYGyWiMbQzff8DCtw982PDzMoEStvreN2ZriVFGEoAnGzCnhsDDws5kjl18JgtXBDYx213fPIsdX6UpRu7VUp/+c+rHkH/MsShpHKus7wUruFJB/CT0iQ0MZghgbz3E2Ga68GtPQmeFXrwi3ATLJ2avPhpKyW6DCYotxti9ybEDl5v3sMElXFroHIkyDRu1FZCK7r3boknBlmFlM/Qs9U3iOlqnxZWFm8zNqWAD/T5OgZG9+KOK1x28hStr250UWNay7tj2UVNCuXYwdiX7S/gOfjISq8EKSHZuvUlV1HMlTIYOXxmhxYC8Jfvfp/TwAMlrqaloD7x9zEkArUte1qN4jtt3J3YvzLelBBXICNHNRQu2e4gFEVng+xuq2teTJ0YvNu/Uqfwa3SjWZukB2UAyZ2dsCxYsjD6DaHICzRz39eZJ//IaMA2RlaJESMplKvA72wCvmfOpcN6PIXAMiQCOVNjZRgRj9EIjk97zCQbrVSW0vRb+9QNfo9WrJ9MYDSGi9btco/YYq/b+eYlx5fHFSk0OUi79PKZCNGledjF/EnECEYc4N0c1s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(38070700021)(11063799006)(4143699003)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rnFlYEEcqACDAbLJB57G7u0FKYcBZaiQc/LMH5tahpQJt5pF11Q2atttpY8m?=
 =?us-ascii?Q?qvII+6DXSIoXUgov9Zm5pUxM6WRFK5pTowZgHNeo2rakO8EVJ23mh0GXeon6?=
 =?us-ascii?Q?hNREMpxiqrPvnwwfC1jbUsBBK8JUZ3Rq3pMJuUYOJ4GFwLGeDpgWRnBDr/+5?=
 =?us-ascii?Q?eRZ24yj/wvowkEItE78cv1XuHCwEpwOaE1eOPjo1/R3HjfMWgbjJoJ/R3cm6?=
 =?us-ascii?Q?Ap8mPshReDtCSv44CPsScDJuyU+4tO1YPzwHsGM3qt9w+ANBWQ/WSWjM30oL?=
 =?us-ascii?Q?cMXrohJwlq/am0AVQAI3HZBEWvsAfP4tm28148u0r+URC1t18Bt6PM7AiNR7?=
 =?us-ascii?Q?bcGjD39beVow535kgv9+73Ua3DmmzfwVvlus7QjiaOcvdzCcoi8hwr5kW8YE?=
 =?us-ascii?Q?hMxQ9pc3wtwjHUTwVspA2v+KGMdHCTitcdC8WX1opHA/agWl/HT6Tr3j0Y5I?=
 =?us-ascii?Q?R/Q0B2q6GDzEpKol/KvdkrkaejhPl4/kp30Oqlg0tg7vSF8IUSMeaX+tW9Dk?=
 =?us-ascii?Q?okWemOMNzn/6+kkQ7ehJUe9qOiZV/pihdCBRyne/Eu5acrQwHi59loPivx0o?=
 =?us-ascii?Q?o8oGs5rBOFoN9uTNP/88oELds0dzLq1JndTuXYsoA9OT3F1sd5jg9nwjJjX5?=
 =?us-ascii?Q?1hcujOcGQA9V1L9l12bTL1MRw6PbJ+afmzTMtDN58S+EdBpPgHTLud0SMgLp?=
 =?us-ascii?Q?0wFPeF6mKUb6Sqwv3Ain6ol7jpH2DKJkmruWVz8M5VrsZXRUE5JFC13nH1gM?=
 =?us-ascii?Q?vp9RUxv2/kner5e2FbnV1RizgJT+7akQfu2pFkOdpYlBoJNywDApK72NUbfu?=
 =?us-ascii?Q?eVuPp/O1PexCXj1Ua8qJUfp2qtFrBTPdKG+hao11ObkZpTs+j8h4Sd4plUmU?=
 =?us-ascii?Q?bMmkWgkjZb+BUEbPtkK73WHMWQLHWS4olM2tPQ3qtI3RCEjNQYwVkzeqiJSw?=
 =?us-ascii?Q?FY9qQeuSBvphR7gFXXzIXd1JloEzNZci7xmLVg3VmBi/ueeubSHctuGzdNg1?=
 =?us-ascii?Q?ttjiOKjaeuwkJCgpsCo4esMWH35seCL/H0/xSsphSIbz3xiqPggV/5YJuNx0?=
 =?us-ascii?Q?ClsrSx9a+Bw5Sv7VbW/Ko20pC2va7dFv6G1wMDNTmaTjSey6hsCYJXCRIN/E?=
 =?us-ascii?Q?ENco1KJPep0C0d9wriCbXk4nvBBSuJQ7pC0zV88enDh60iID4nz9/NlB8tna?=
 =?us-ascii?Q?98fKRgrqCv2dvOGV06IMyu0oI2LIhyFTC3pGEyivE+AC/bUN//hmIuQDKOiF?=
 =?us-ascii?Q?vPmIKV9GMyGNoMFei45Z+u+Q3HOrsycowo4aaFipPToc81L59s4ZhUvmCp6D?=
 =?us-ascii?Q?QAJG7MQ8buX9RgAEYJN5NaUDTD4+YnN80bjVUf0UfvEYL6NIHpfWPUGr1qN8?=
 =?us-ascii?Q?I6uzoIsrIuZLwVlzUOiSIhhMLvyU7W1JBGMZN2QepWwapZ1vlfPPL7l/GWrP?=
 =?us-ascii?Q?iwdP7t3I92tZCe1XC53PYFoT9yOVs+cnu8JXyAcYTTxOdRVOjv7hUpJRrSYh?=
 =?us-ascii?Q?aayX+O+QIBm64VLjDcH3puxuGBMQ6yLvs2LgUbmZ7b/LNDHUzqtPZfhsqIOo?=
 =?us-ascii?Q?bbbpv+TdRVd42Nv0ZIo0EKHf3zHToiTq3I2r9lVLlmb6bSu+oYsrKAfGmWx1?=
 =?us-ascii?Q?dO+JUFTKmAin7ytj6sv1TJM6cAn6m7ACCOlCPXVP4zzPQxoplFBbti1+DJ/7?=
 =?us-ascii?Q?1RaAYZUmQ5DJBB8x1lDfqn1SOVcl0omtw19t78/BU/juo/CdQlQb7mRKMOBA?=
 =?us-ascii?Q?//7F6FRGJQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xWE7DlCEYbpRbDrEedobBD1Rb1YJhcLi6sVU1fAowdlVZIxHNTYlj+tGr1poTlORwKqeq5TEfF8J6GFjAar/2Nb3niFNh7uIriBpkuQF8R5lLqlRBonXy0isMM/04DISe2mUiYpMa67Itv0xTYQM6uA5vr6Z0KkS/pnfQkyM71hdrhl6hX/kaAUZ0vlWEbdv2ZY6BHef6DgiaQuFwacG9WTAguh3VpW0W+2V0kZSD7WXCP0udzAIEnY/XRqwubDRS9Acdjr04UPL41rTytKW8mqMhPXUqyd1YH7757gwX6tKWCeQB+f/RUWqfPHaKrTLK4rPL3y76CU0JIB4FhsuZg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a20911a-bef6-4b6b-bb0a-08df2489af40
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 15:43:07.8970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k6N/boEuFzNuHuNhzbICkbNJHjo0/3qJYZ6qdrQOPNgELshDYOW2NkYgeeu+fGNtxx2ISQFQ0SoGuTmK5J3vbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5285
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Wednesday, October 7, 2026 7:06 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
> igt_get_free_pipes_mask()
>=20
> On Wed, 07 Oct 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > The joiner tests derive the set of usable pipes from the pipe count
> > alone, which assumes every pipe is free. A pipe already driven by
> > another client is then handed to a modeset, making the commit fail.
> >
> > Add igt_get_free_pipes_mask(), which gets the current CRTC usage via
> > drmModeGetCrtcList() and translates it into a bitmask of hardware
> > pipes.
> >
> > drmModeGetCrtcList() is a recent libdrm addition, so probe for it in
> > meson and fall back to plain CRTC enumeration when it is missing.
> >
> > Assisted-by: LLM
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  meson.build                     |  7 +++++
> >  tests/intel/kms_joiner_helper.c | 66
> > +++++++++++++++++++++++++++++++++++++++++
> >  tests/intel/kms_joiner_helper.h |  1 +
> >  3 files changed, 74 insertions(+)
> >
> > diff --git a/meson.build b/meson.build index
> >
> d7bbfd9698e5616ab777ac58128192ba1e0bec23..f41588c9d73361dbfd405de5
> ea8f
> > 764c6768a9c9 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -129,6 +129,13 @@ endif
> >
> >  build_info +=3D 'With libdrm: ' + ','.join(libdrm_info)
> >
> > +# drmModeGetCrtcList() is a recent libdrm addition; keep building
> > +against # older libdrm by falling back to plain resource enumeration.
> > +if cc.has_function('drmModeGetCrtcList', dependencies : libdrm,
> > +		   prefix : '#include <xf86drmMode.h>')
> > +	config.set('HAVE_DRMMODEGETCRTCLIST', 1) endif
> > +
> >  pciaccess =3D dependency('pciaccess', version : '>=3D0.10')  libkmod =
=3D
> > dependency('libkmod')  # igt_procps.c reads /proc directly; libprocps
> > and libproc2 are not needed.
> > diff --git a/tests/intel/kms_joiner_helper.c
> > b/tests/intel/kms_joiner_helper.c index
> >
> 36168030475c2725130e6c8ad924dcfb971a07f6..235e227fe9d82f598d0bd7df
> 57ff
> > 65d73d717ad0 100644
> > --- a/tests/intel/kms_joiner_helper.c
> > +++ b/tests/intel/kms_joiner_helper.c
> > @@ -113,6 +113,72 @@ void
> igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *m=
as
> >  	}
> >  }
> >
> > +/**
> > + * igt_get_free_pipes_mask:
> > + * @display: The display structure containing pipe information.
> > + *
> > + * Get the CRTCs that are currently usable and translate that into a
> > + * bitmask of hardware pipes. A CRTC is reported free only when it is
> > +neither
> > + * enabled through KMS nor active in hardware, so pipes claimed by
> > +another
> > + * client (fbcon, a compositor, joiner) are never handed out to a mode=
set.
> > + *
> > + * The returned mask reflects the state at call time, so query it
> > +right before
> > + * a modeset and after releasing the pipes a previous commit was using=
.
> > + *
> > + * Returns: bitmask of hardware pipes whose CRTC is free to be
> > +assigned. When
> > + * libdrm lacks drmModeGetCrtcList() every pipe of @display is reporte=
d
> free.
> > + */
> > +uint32_t igt_get_free_pipes_mask(igt_display_t *display) {
> > +	uint32_t free_mask =3D 0;
> > +#ifdef HAVE_DRMMODEGETCRTCLIST
>=20
> #ifdefs belong outside of functions, not inside.
>=20
If DrmModeGetCrtcList() is not available in the libdrm, i.e an older libdrm=
 then the legacy method of getting crtc is used, which is handled in the #e=
lse part.

Thanks and Regards,
Arun R Murthy
--------------------
> > +	drmModeCrtcListPtr list;
> > +	int i;
> > +
> > +	list =3D drmModeGetCrtcList(display->drm_fd);
> > +	igt_assert_f(list, "drmModeGetCrtcList() failed\n");
> > +
> > +	for (i =3D 0; i < list->count; i++) {
> > +		drmModeCrtcInfoPtr info =3D &list->crtcs[i];
> > +		igt_crtc_t *crtc =3D igt_crtc_for_crtc_id(display, info->crtc_id);
> > +
> > +		/* A CRTC the display never enumerated is not ours to use. */
> > +		if (!crtc)
> > +			continue;
> > +
> > +		if (info->in_use) {
> > +			igt_debug("CRTC %s in use: %ux%u, fb %u\n",
> > +				  igt_crtc_name(crtc), info->width,
> > +				  info->height, info->buffer_id);
> > +			continue;
> > +		}
> > +
> > +		if (info->driver_active) {
> > +			igt_debug("CRTC %s active in hardware, not enabled
> via KMS\n",
> > +				  igt_crtc_name(crtc));
> > +			continue;
> > +		}
> > +
> > +		free_mask |=3D BIT(crtc->hardware_pipe);
> > +	}
> > +
> > +	igt_info("%d of %d CRTCs free, free pipe mask 0x%x\n",
> > +		 list->count_available, list->count, free_mask);
> > +
> > +	drmModeFreeCrtcList(list);
> > +#else
> > +	igt_crtc_t *crtc;
> > +
> > +	for_each_crtc(display, crtc)
> > +		free_mask |=3D BIT(crtc->hardware_pipe);
> > +
> > +	igt_debug("libdrm has no drmModeGetCrtcList(), assuming pipe mask
> 0x%x free\n",
> > +		  free_mask);
> > +#endif
> > +
> > +	return free_mask;
> > +}
> > +
> >  /*
> >   * @drm_fd: DRM file descriptor
> >   * @outputs: array of pointers to igt_output_t diff --git
> > a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> > index
> >
> a0ab75b2c165084b643ead3f3ffc05cf5364e90b..14083d25c6f09e0577f123130
> 697
> > c34c2b6a15e4 100644
> > --- a/tests/intel/kms_joiner_helper.h
> > +++ b/tests/intel/kms_joiner_helper.h
> > @@ -11,6 +11,7 @@
> >
> >  void igt_set_all_master_pipes_for_platform(igt_display_t *display,
> >  					   uint32_t *master_pipes);
> > +uint32_t igt_get_free_pipes_mask(igt_display_t *display);
> >  bool igt_assign_pipes_for_outputs(int drm_fd,
> >  				  igt_output_t **outputs,
> >  				  int num_outputs,
>=20
> --
> Jani Nikula, Intel

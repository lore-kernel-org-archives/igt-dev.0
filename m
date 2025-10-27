Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854D2CCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 04:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133F410E097;
	Mon, 27 Oct 2025 04:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZC0DZAJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093AA10E097
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 04:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761537726; x=1793073726;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2MXNgFL1oDOy59B1099fQlWtcMossKX6tA2YWv7HFhw=;
 b=PZC0DZAJbLlWJTHSVfAKPICJLRpXltXYHxpaQqprNZoKKWxMrT9+4+ZH
 uiC1tc7xDmb5Pe+JGtzBP6tx0cp3XlokrPbFNghAVmP0QZGnJpLCjwK5V
 /VwXeAHpihqFuFrkJDESh/RlzYwzviXCSFjObbubDyXCpWJATGqHQQTbi
 IZbz9vfPWj1A/sfG68djrpV9gUG1JgqanZiWwT2/MNsz6JYezJ/ibVWPM
 8b/BZyhV3E6H7WWvQak6udqKmuBOQP/B2gnJHqTEOZuldfHOeRzMKOOQf
 VLiZd9CFfk/iwZHRbgrc1//jSCbg2op+ldwKxbn+Rs38LvTadD4Uexgzz Q==;
X-CSE-ConnectionGUID: A8t8oOskTJqe4GN2ABphJA==
X-CSE-MsgGUID: m+H+rqXFRQeRNoZMeU4gUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75056866"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="75056866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:02:06 -0700
X-CSE-ConnectionGUID: 2yyp+gveR3G4L63MDO8K1g==
X-CSE-MsgGUID: UZV+wxH8TDOOgovLJ5OvYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184835588"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:02:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 21:02:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 21:02:04 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 21:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxfYFE/PoYLCs+HDEQ+FVM2aMhw1ai2lJJmHpVymRUIbNi1zmwRpdhPW/E/VMU6cpUx4QT+SKLzIBUalr7EpyJwfVV1oNmExPz/QU4+8Ano3Ns9o/ZdlEiG5ulYySScvk3BGWHTNIysxRMDfGdRl4ErbFitIAt6c9A/vMd/VYFZxMP2ZmQHCQITtMzwSGxZoJPYpcgVThAlvmVUUz6ob9CDliyWUFApj2lkpXCuLzMx6IiEMQA0nOsI6eha9zTbbamBSJOb1FVX1X2VCXipE48nSFxVZIOvrl7jRm05s2b8aEt3kWqFyeyb/JuQC1F785ngouojjin4O4SM4U5v+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYgIVjYbB8eGd/VaL88C23kWMDfajApNKVLw+GvZepU=;
 b=ctUUcC+YIBNFoguFD+VsScrpr3/CN0TU+3g+S4b6SjjrNI0YQf9RMpNUzmeCu9Q/R/dDNre+/AhhIQHbEXG9gKtCD6bU5hGhPxJMRS1hyiBBPZRoVpGiF6ObnHKBA0jq7o2jZ6yWGXPtm5+xqKcMU3ztlkPxPxqPVgLpAgW5HYwKSlv1mLjK1TmVB0oWOvMnZ/0cEoAyzDDxG7M5zdVJYl+UgAX6NlkqdXEewbxdgALsc8fmPaXWPZZ0A8uL4Eu0XtOCxYiupgvqmT7GL6aT7XEP6xWMV11762w3k/wYn7R0033iJWlkE2AAx1ujedXOpqjJb82KG9LxUeNPtEx4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ5PPF4990C6B9D.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::826)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Mon, 27 Oct
 2025 04:02:02 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 04:02:02 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info meassages
 for skipped subtest
Thread-Topic: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info meassages
 for skipped subtest
Thread-Index: AQHcP1ykilf1SUkcrEmmZs19wQxTXbTVbZUw
Date: Mon, 27 Oct 2025 04:02:01 +0000
Message-ID: <DM4PR11MB6312E9297975D96AB1365DFC90FCA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251017121055.2960836-1-sowmiya.s@intel.com>
In-Reply-To: <20251017121055.2960836-1-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ5PPF4990C6B9D:EE_
x-ms-office365-filtering-correlation-id: 56070ec7-6087-48aa-b83b-08de150d9576
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rHGN+sGRpYJQbpfmCcHyVMie/2KZnxwllslsOXW2Ovtd2ubkLRQLaTNWpx/w?=
 =?us-ascii?Q?oTgQcsOoZgeLQz/n5bGMfVFgMz+QLqr6zWmSWw0EciBLGJruyBDZ9+0V7V/k?=
 =?us-ascii?Q?jmLDD4ZtMEY3quzUcgr+FR3Fd/+AcCSm/Z2LTSeRuwrEj8X+VetFd2bdyMc9?=
 =?us-ascii?Q?o65witmvq4iWKcGdRF2g4BNNfVFAC475agVqfRTUnwcAwCsz52NBWXzZnsuz?=
 =?us-ascii?Q?3Dg1z9tIttEKlXbvSFD1rroqYKyKK7XPTQmgMLuRLtCnyF8/SKClQz4ZtKMA?=
 =?us-ascii?Q?k/MZ+FjntlzcXVfDT1JpIcXsyWddSVtkEAPQ2plppS8ic1TPZjfxKA4nCRQF?=
 =?us-ascii?Q?YT2F1StJzvgMFqPPDvFhCJPW438iAmZWU8oZAOLZlbogBQz0LSu+QIn812//?=
 =?us-ascii?Q?kxu31yvVvlvMNxS1wHc/hfDHutbVnwgjvnsLbwo9QzoR2zYDjmOBhMZuNBgH?=
 =?us-ascii?Q?MyXkL1DdzXEMiXdEMWXBODcxYyvrFhytp9sL67o+3/jNctN4lirk6Cv6Nfny?=
 =?us-ascii?Q?HhUA+na4Fp3S7sL6d9F7wE0wTL1JcWs+pFfO22pw0q/u1Hh8jh7ElVLoOwiE?=
 =?us-ascii?Q?lJMyng7oiMm4VItuEa5KJl5vB8tv5J3/27WbJZaQhn0AYfSVIll2UeFdSB6C?=
 =?us-ascii?Q?IQBszOPrMRx1cQ1oxpFHj5Y1LwJHspewunyEBNTeyHWco2bvJDp12x/g+RjR?=
 =?us-ascii?Q?uPkdX0lFLJuc8F71F5kkBtRWstlDJhe72updejSDieMGkElxSsAREiI3UCjQ?=
 =?us-ascii?Q?Qm89L/5Q89N2n81tO8si5ut9ng9mfolfLFOgC8xfM5l2CF9f0WHrLON4J1oo?=
 =?us-ascii?Q?fvl21npxv+QtvU/9foAnikoLpSQDCbb46CFfL0ftgQAHj24JGLsKAQRhS75G?=
 =?us-ascii?Q?QOf8QF3ysbo6ZQn0ROGmaC4AhzC94YNr/m0EV4FdC6XIxIAp7AFlRLhAJ141?=
 =?us-ascii?Q?JCHiaS37QRknEan9nhEC3511p8Girq6kb2Q+ULT17q31ewV3UNJZ1lg+VZdm?=
 =?us-ascii?Q?Z/9QoO+8Lg6Mg6zzWlPX3zAMzREuzTtKoGRBEZyRZtdssxHAPQe9vzjJtg7p?=
 =?us-ascii?Q?Z6b/CKSwFAYUN/a1oRjvZTVgX3zqNWvLUv8Qts1Pgy7tEL9X7KOmfh6RZA+D?=
 =?us-ascii?Q?UHBBjlA7PTSnVOcosu3kTA7LU0vAIbJg/dIlLD/2Lw3wzc8oKZBo4k8KMd/h?=
 =?us-ascii?Q?eZo9fBVZHON19Vw0VT5ZCyIH4e4+AiGvAfZ1COj+fTHY9ym6rTqdw1VLGU+T?=
 =?us-ascii?Q?umNQ9AsyOQRKhLDDDA1KAAiEZrXoeMtL0JticmWJcBB3oq1W0DLmlgjWhZX3?=
 =?us-ascii?Q?oiKvgwsKkHajl6aSVZfIu2EmK6Nn7AekSzfoom1JXM7qnBT89dbHhKfmEcge?=
 =?us-ascii?Q?hjuzVaSgyjyAF5x9ODaAPibVZg/iuLgcBB5xJjpvBWVj4VvkaT0zfDeAzaBI?=
 =?us-ascii?Q?8V3E1SwzvzPD8mFuhn3Nj0aHMAhZJfw1Erz4Xs5BT+LILqcwxuWgVwvIZwnH?=
 =?us-ascii?Q?MWz0tJOTFojAjEWIaoFusb5AD++3V7qEDmCj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pXgS0jQklwchRIsmnr116bVPWTZRK4ELRuZEy+FP2bzncNXOvXLVQHY8hY8v?=
 =?us-ascii?Q?QF9XgnP59p24NPPy1LZFSBy0RQlb1H3uK938SwWRse5YeqB5QcGcwcWWGYcI?=
 =?us-ascii?Q?SW2zVdkfrkzse10tgbVe9wf4dXRiStC0d/Cl5VB/DPLkoom7BBU5B2ljLKWW?=
 =?us-ascii?Q?N3L3jXens8epnOBIo9dLVVipJGFYJFL7DGfEgCseSqb6irdovdIV/0oulpE0?=
 =?us-ascii?Q?nqIK+F/j5gtuHQ8D9qIp490pZrv9aORUNeSVP5ygOnVjmr6IrqTGg4jYANjD?=
 =?us-ascii?Q?EdRj1Fw6kfOQCRJHjJFICAPNOCCEqPuvuyI1JewP6MSik34+mCWIBHVG6IJD?=
 =?us-ascii?Q?aPodXNGVtGPUR256FcnvPq4s7iZ/Z2cfhKRypEIkZbrCKPYB+OJBRgNANaZk?=
 =?us-ascii?Q?LhagBVGwpytUe5VYTAYRCfq82UNxZfq8C2xMQNfa5sJQrrfBvi+wkFh56jEL?=
 =?us-ascii?Q?N6E0RLY3BXtp4Nmj9dJG0Rc72mLKz22xzmY8g3qPEz/eJYL99nPzxm7rRmBg?=
 =?us-ascii?Q?ADvUk6+K9b2TWwsTCrZ7PpaebEYVUg6D6w/4oo4tmpN6jy/U0jKaP8YeQsnx?=
 =?us-ascii?Q?31wDmRjp2AsXB4zlHPsq6KgZ6lawkTG0PZf2ywJIaBS7OU+dQoPLHV2t9ojM?=
 =?us-ascii?Q?LqiQr2BuEdWhf3VpxLj+hFlP6CadDc6T8dD5JIpBMot1mfBqax6QkFwAv3Cg?=
 =?us-ascii?Q?On9c6CnRxfbOBvWvuXK/TMaWxC8FcceYWRRUia+onjB8az06dEeQg+h1qalc?=
 =?us-ascii?Q?V6LKkx4ZCQnh4AZEqrRJPbfqzJms84vsSNOJCgJUalZVc4o/qmIl9Sds8GbF?=
 =?us-ascii?Q?PF/bRoq7sZI/SItmwA+/ax9c3fxOy8HJwcgX8MrDH9i3VQCwxSUxh4q+RlG+?=
 =?us-ascii?Q?0L/RZa+oqmcTVjCzt9UJ3+GYz/u8bww3gogL+yTeTwz+rl7HDt/vp6k260PP?=
 =?us-ascii?Q?fiZiLumLWjaD6OQihO7A3dVYZNMxtFCRvtDROExJ0uXFz4F+IBs8SzQA14/I?=
 =?us-ascii?Q?rz7mqbTCrt0TjyB3aTFNdXOZR/iFELGjfoQBTXDaGW9uxl+5+zRFOC1xUXKH?=
 =?us-ascii?Q?BDstpLz0UF89K2hkLAN1qYCr5u+zmgV+0HsXJnfw0sfZqiI1y4WXg1h9TS60?=
 =?us-ascii?Q?KWAmukHuXMoipGu5MiwbRkmI/W6CnGbTV8mIqEerZBOerSD3wQnZ2DVDwGgD?=
 =?us-ascii?Q?e7Wr7TZDLeZoYdGxnCims5xH/9u8759lLL5sZpzKnowZJFvZKUGXuN9mx0zY?=
 =?us-ascii?Q?aJUqkvX+G4oJ4gdokfFnzDbI+071iGEaTwb1wWTGzx8Y1PpARfMyQkj2r3AF?=
 =?us-ascii?Q?L0B1sU9+PMmgkdUTAumaTBh5Y/GqMnHM1F3vyHpoPc3r6aSQWjfFiyWpjQxh?=
 =?us-ascii?Q?OH8JhwzoZmcgpptSmbPAWkbGsNC0resBK22+1m4/Y0hBS95sUHcPXLPxZp4J?=
 =?us-ascii?Q?4xgrTZpfvSw7+pp2Yz8gL5XWABqOJjppNWZ5aWqX+6FcGeXn3Jgc/j6fg7MK?=
 =?us-ascii?Q?xCTpfZJAF/itI4dVQ6WJ2AbLlJQSjzx6NxlmWHPs1uel6cng88NL8CO/GlT5?=
 =?us-ascii?Q?vRqH67RarU2zPehlsEM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56070ec7-6087-48aa-b83b-08de150d9576
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 04:02:01.9510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7KUUM5IHu+2zy1Aqi8b+iLThxIamwq8kLyJXtJLRYKWk1X61eOWpcpr3Z82++pFQliY6zllUMp/8ia52zmDMoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4990C6B9D
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sowmiy=
a
> S
> Sent: Friday, October 17, 2025 5:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info meassages=
 for
> skipped subtest
>=20
> From: sowmiya <sowmiya.s@intel.com>
>=20
> Add info messages for subtests that are skipped without having proper inf=
o
> messages. This provides clearer insight into the reason for skipping.
>=20
> v2: Add switch case instead of if conditions
>     Also changed the flag name.
>=20
> Signed-off-by: sowmiya <sowmiya.s@intel.com>
> ---
>  tests/kms_atomic_transition.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.=
c
> index a13830965..032abf54b 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1172,6 +1172,7 @@ igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  	};
>  	int i, j, count =3D 0;
>  	int pipe_count =3D 0;
> +	bool info_flag =3D false;
>=20
>  	igt_fixture {
>  		unsigned int debug_mask_if_ci =3D DRM_UT_KMS; @@ -1216,6
> +1217,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		igt_describe(transition_tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
>  			pipe_count =3D 0;
> +			info_flag =3D false;
>=20
>  			for_each_pipe_with_valid_output(&data.display,
> pipe, output) {
>  				/*
> @@ -1224,12 +1226,16 @@ igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  				 * panels with long power cycle delays.
>  				 */
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET) &&
> -				    output_is_internal_panel(output))
> +				    output_is_internal_panel(output)) {
> +					info_flag =3D true;
>  					continue;
> +				}
>=20
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET_FAST) &&
> -				    !output_is_internal_panel(output))
> +				    !output_is_internal_panel(output)) {
> +					info_flag =3D true;
>  					continue;
> +				}
>=20
>  				if (pipe_count =3D=3D 2 * count &&
> !data.extended)
>  					break;
> @@ -1249,6 +1255,18 @@ igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  				test_cleanup(&data, pipe, output,
>  					     transition_tests[i].fencing);
>  			}
> +			if (info_flag && !pipe_count) {
> +				switch (transition_tests[i].type) {
> +				case TRANSITION_MODESET:
> +					igt_info("Invalid test for internal
> panel\n");
> +					break;
> +				case TRANSITION_MODESET_FAST:
> +					igt_info("Invalid test for external
> panel\n");
Suggest to change the skip message for clarity.=20
igt_info("Skipping test: invalid for internal panel\n");
igt_info("Skipping test: invalid for external panel\n");

with this change code looks good to me. =20
> +					break;
> +				default:
> +					break;
> +				}
> +			}
>  		}
>  	}
>=20
> --
> 2.43.0


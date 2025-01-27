Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC496C02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 15:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A513A10E321;
	Mon, 27 Jan 2025 15:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4lGeDQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2563010E321
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737992665; x=1769528665;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o+NJZQznhGUMRQAgBeDlydOr2N4bMKl77eDkJcsur1U=;
 b=V4lGeDQXvdpwDOcuhHAn1qMzHf7Djbg7cAFbBwAOO0TDx7w/0wcSa0T3
 80li5s+sV7L4rky+EVPk1oy22/ediUzgqptmxEzFKBTECIriWO3wqcWCM
 X/iOLYz24EZVnNhdhBQrGJsglbV7ojZ59olITJQ8pmHa5AgVlxphWNmnH
 M3Xq6LbJqhNEAD/8w/XNno683uuoO/VfsOrRcut3IogxaHwcDLggB5UKG
 n0qHuKDEy/88fjXCWq+ifzAY+0m2ScgRqkjYEY5NCWxTryzXwOKpC25L7
 KgEBw1TdtcxnRbLFX/TYUDuqgQVxlZ949ux+0CM0mILxIKTyGhFrxJiLZ g==;
X-CSE-ConnectionGUID: 4G39enJiSa+7M7DdSVR1OA==
X-CSE-MsgGUID: gi+mGB2ZTuuST2rvky+6ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37711870"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="37711870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 07:44:24 -0800
X-CSE-ConnectionGUID: aVLYvGtOT322czWnm7ECew==
X-CSE-MsgGUID: h1gY6XIRRL2TTlQoRPFtBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="109048634"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 07:44:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 07:44:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 07:44:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 07:44:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTDm/xbuyalPD43ofA6gmdMLebc3cIAJzcxSXs9jVVBACqJuQUDWmHVguAhKuHXGrK14HVN4zJ1Yz9TMXtlcBYlB72FffDHbBXotw3KtDyE/+Dc6ZjqL7/C6Mx540Ydoo+F7hENVl2u6ugHccWi+gu2VvTSMD4qQmGcwr80v6DVn3niY0pGb5sXFdAEpsCW8nVD4DPSF1H+I+O90L+tV56x5wQ+B7XLDh7naqkXQjY2BpI8MeM/Zut76+zo3CicTmZ+RvpYLHCCcboO0mHnF7hCmlULel2r3KMTwohWz70DrXpJy4fxOiF2c4uFdwWzf+l2WctsZODJtrHYtySwRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0QjpT4p+w7U6Llz1OznoO8STw205V3Hiy18t6oHyBs=;
 b=seXulNz8TGJ2hZZuM/5tQ7MB/VBXygNJRDhA14TVW1dg/fBJKG2l7qjvvj2PW1QQngxZnSlMF3WKWXtfa1ct1adcUNW2BFna9JTUXQGssYFEmlsAEuR6MJ2TeCQbPOO2lhW+gqFeHGoPX+B2wyaYaktoHVdG0tWCFb6vD1wVNdLqGZ3QUh3yx+ehOFAY1WO6r3VnKTdn6dr5e7cyVwFLbr7Hi1q/TcaUPX53rdhHWILxZgUiGQvZgYn+8litfxWWHXowmblaliLmW21Q/t2UjX1TUME0895YljTnTl7nO00mcX07YB+6hnDHaOqsEkt5Nf1SrnhsaEaIh/+Q6FpK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 15:44:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 15:44:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "stylon.wang@amd.com" <stylon.wang@amd.com>, "Rodrigo.Siqueira@amd.com"
 <Rodrigo.Siqueira@amd.com>, "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "gregory.f.germano@intel.com"
 <gregory.f.germano@intel.com>, "Taylor, Clinton A"
 <clinton.a.taylor@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>, "Yu, Jianshui"
 <jianshui.yu@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/2] runner/executor: Integrate igt_kmemleak scans
Thread-Topic: [PATCH i-g-t 2/2] runner/executor: Integrate igt_kmemleak scans
Thread-Index: AQHba/f2btgKfSZTvU6sD7nAdDL+5LMjCXZQgAd1dICAAEq+UA==
Date: Mon, 27 Jan 2025 15:44:06 +0000
Message-ID: <CH0PR11MB54446193E8F5F28707335134E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250121112944.115491-3-peter.senna@linux.intel.com>
 <CH0PR11MB5444EB782D10812EE5122592E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
 <471519fa-1470-4059-bdff-80092c86d1ac@linux.intel.com>
In-Reply-To: <471519fa-1470-4059-bdff-80092c86d1ac@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA3PR11MB7525:EE_
x-ms-office365-filtering-correlation-id: 0acc26e5-85eb-45e1-6040-08dd3ee96f1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Bx8Kc7it0jMsgunFiENQs/Kj/f92l8oZxBnoeqwTOwbKhDHscOcYZsJskPsF?=
 =?us-ascii?Q?SCMnhWKJiI3mpY2QIyrlabJTJZoY+CE7WGWBfuWF60VkhiiYjZnOmdsjdEcG?=
 =?us-ascii?Q?HkBqpuHH5fX92TA52hmFrsWpr6larY0y3BSrXyIzlzo08pSNsVghMCcW5w9Q?=
 =?us-ascii?Q?p9/nR32KjmTsc81v8T3h4Sov1BFrgTorOs47Nj48PVbPhJ7p812MKqNRlu0a?=
 =?us-ascii?Q?3z9JzYrHcV5zsFdLKtYmDoNvuWAFp3/T6yeG7gIKIbNWNdc9/m8MCIvWUkGU?=
 =?us-ascii?Q?xiWelqcZyNkWRFJU7X6kfMK9tJ2nOyTXDPepJf2lT/NdYgq66x4+Z+IQLlfi?=
 =?us-ascii?Q?OC1qoHYbH9K47eonaLG3b53bpVuFJ/fBrygP74zfK5syndLN91h95wIbunmZ?=
 =?us-ascii?Q?1ohp6BX1EWNnkv+UsYpGkkmaQufMi95dqeWUHcmvRdxxFpOaH4xpuYnqWAKS?=
 =?us-ascii?Q?XSZFRaDVKuTrX7KU74VF31wVi64aDECor3TkUIZH4WcQl6oaaLl/PSM5DnVV?=
 =?us-ascii?Q?yxx5TLWE3V2V0Wr20iKSjZ/WLRau+pCkf6GlRZjZiQm+2MPOUbsxG1LDdU+p?=
 =?us-ascii?Q?TkaEUsufQbI9vOFpxsXcDOerGWrLWAG1lOPDl3EC1dlmJFmW3erdyrfXch3H?=
 =?us-ascii?Q?Rf17LGDB3LShnS0ej0pisBD066QlR++KdKwkKiE9k3x9GqLu5TUocIL4ryw4?=
 =?us-ascii?Q?Ry8mOnP44trTdDcH4uEDTjFpUZcYiwL+aM9EiVUZflfUfmmetjO/j/siHAEF?=
 =?us-ascii?Q?PVGII5ebpjwRSwNlKia6PTGPZACAPpcrj6YlKPHSodDgmZ6f9/Ht92ldY5kx?=
 =?us-ascii?Q?/A3X9QcdosRjS4/IcEqZl0KjH/AK3cc6v3Jx6tU+dJ9aqmThHnay2l4PoKcE?=
 =?us-ascii?Q?I8kcbBWtuFxn60S9dlWkpqQPHprxKlZ5S6XkaGazQHaqeHNpTPa+JHjSvAP0?=
 =?us-ascii?Q?6R/B8ePUWfaCcciS4hc/xjMUopnxyPbohfswUVsFH02nVaKaEWXStBZhqoeB?=
 =?us-ascii?Q?hmtg4AEDRx89ctGWPlTDNas3gHl1wguBslaBDCSRpJ4o0xWZFxdXzxPx/Y/7?=
 =?us-ascii?Q?YbwTHt8zVbXeIU33+CrzCM5wocqkCSeIjypavb8C0+jb77/lsG42815wmS+r?=
 =?us-ascii?Q?vcdUhLzf6SIJVYFj4dyzXTZw1wtVSoXaM/7xqnQnBE59SRJ/+AID9Fd5/wxf?=
 =?us-ascii?Q?BVjLuFjz6syRMD6zam4fn99OMbaWD2uRm8VyUqS8br1Za9pSAQll2T7oj8T2?=
 =?us-ascii?Q?5fVnMftB3nITudv+BS8tefF+n9OtyJ0ZGkRyZVTUMJVnvNma5tpq9D+sLcfl?=
 =?us-ascii?Q?0MJv+QlMqF3sqmRQZOSxUn34LhNY5f6MF1IbVd2HnQVsiXpDN43bAifK1jem?=
 =?us-ascii?Q?sqyJQfLuWWcruc8gdkAnW3KlxQDc0wxnGQUIcouSc1SO/jqv5J1HTF37h1qC?=
 =?us-ascii?Q?nrJMkCcmaXI9cbIfH38mHZwCWrAykSKS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XviOaq+4KGJvt3sZI6YYaBqPRpPqTOxNcLaJBPtHpNAISD+Rcfoh+8cXOO7A?=
 =?us-ascii?Q?09gj2f51brvXSufto6BIAreDxrWz2H4ABMU02VIHtQ2V2GDQlndCd0qOP6bS?=
 =?us-ascii?Q?qj6F/+Fn4sgFRYQ3TlYVkXKZ5hOHLCSTcYq6Aa+AjS1jTxEeVU3/m4ApnCyR?=
 =?us-ascii?Q?dgIGxmeR1qANHV0LMhQVTPl+1ru6TDXJH2oUPSmm2I2U9/i7E2dnXKQdnv3n?=
 =?us-ascii?Q?sEwk3o46lOoDhrSHn0Hjs2r3uLHPeyzy5TcrVAADLJW4IGipDX5KYBOy1yob?=
 =?us-ascii?Q?piVMlCuJIkUE4IWg8aorq4s8VSDWHE7eMnOr59wgVsbuGFSaPEhY8yEcO3du?=
 =?us-ascii?Q?G0/BGu9Hf4qMQrO79yHeqVRV/DP83zkRVLf+Bl8aQWVO7jxYDOgwYFqY9egc?=
 =?us-ascii?Q?4Ta9A8NHPYWp9H9xKd7v8fZOgAiU0NB1i4AFhH2HEkd/aH2w4SWodwzzqOvE?=
 =?us-ascii?Q?y6yghi+209eNjYh3x0RBmuZbYe9aR/AhGz33dos8YM5Wk9lratUqNzGxW1/T?=
 =?us-ascii?Q?G9DzUR3dC7nhwur676/9cv76kZy4+Krt+m8cNBSP7KTkAdQ72KmBNPGyKEyH?=
 =?us-ascii?Q?LaEl95iJ0l/si86z8Rd4pd8Qe5IoWGpjBRawYiqdJxLTwQJpXre5DKvSSTpL?=
 =?us-ascii?Q?w9oIo1i1KpJIRP+TvLm5enQ4jEVVTlL2EGfp4VsDHvw/Xoybxl1fZjUtIjy5?=
 =?us-ascii?Q?3dsBkjKWCLEr/iNlhrEagfVcDZrOpR8IVxh8jvr5MVrEyP2EKv4Qfvia9zYd?=
 =?us-ascii?Q?r/50PZx/WoOF8KzwCaU6dQJIv2fjGggdzrDBFJH+D4jnVL88TVw1zxFXNsxv?=
 =?us-ascii?Q?2EMslrRJ6KwkO9jqrfU6AsTuZk0Z7/rq2/oszfsjyQV5Kg3Wpy4fXwI7O6sI?=
 =?us-ascii?Q?b2oB8AU51ymSweWkh3Cn354dt3OW6nrKK532e+bm4U0LGR/qO5oFkb7f6c0J?=
 =?us-ascii?Q?B+ab+mqnSmtBz0zd2WjEJuL3q3aCR8Zm6bIz/Z2Qagd38JVX3fA8UxpWx+jh?=
 =?us-ascii?Q?MP6pPSAdEeqBsHaYVA++UNyISEWSGB6EL3Kh6Zvr/hagLgJbMDEgyFoGNSk1?=
 =?us-ascii?Q?ak8QZTIvQja0LfRUIVGndPR9TFEbkADbRNyfrPiznlB6j6nMJHwO18aEhOL6?=
 =?us-ascii?Q?7YBjDWZxuUqUbnkYwMw8gLyZay6h3hRQVeq6WdsTYQPYy5TpZTJXqKMogUGj?=
 =?us-ascii?Q?4+l0crLhFTKsih8X/xBctdOEHxmuEOYqS7dC7H7qFKhehpCbunGMJOVNZouD?=
 =?us-ascii?Q?tqZjPXs7tbsIkvDVYKk+WdtqAZcUdUgdtJvOjpt6lITYSE/ekqa9sXkpuXtF?=
 =?us-ascii?Q?CPKRng0ZkjjoOsOqHc/hmpKCAmfwfMOPMTCJ6i1Wda1DAUVe1gDNoMS0N+UW?=
 =?us-ascii?Q?TEfQmrbGSBqj9ZeGT5kGWRDfk42zeAIxTGtJu5WO4UerndAP11/1JMGLZKC1?=
 =?us-ascii?Q?94fInqdosMc9oMv42vsdIXBgdRBTHz25CfdlQbmL7sLlbTPHyNvB/UgIRpM1?=
 =?us-ascii?Q?sGPUwDGmHSOKX8ABrpZ9xPWcq1/W8paT8aKDBfoq6DQH0FxwT5fX3DryKaxk?=
 =?us-ascii?Q?VwHiEN/fgaamQFvT2rZGUdfQ8b3Eq3pSYGPNr3vX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acc26e5-85eb-45e1-6040-08dd3ee96f1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 15:44:06.8642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGE8qlFBFfeveLt1L6IeIChLE31iYvsgwmfjfyOhABnSFswMTklfxeuJpIe1k9rylUEztGjFVsvy68moyihhHuIOUzc+3FgPqep/saAFYAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
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

-----Original Message-----
From: Peter Senna Tschudin <peter.senna@linux.intel.com>=20
Sent: Monday, January 27, 2025 3:06 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-dev@lists.freedesktop=
.org
Cc: stylon.wang@amd.com; Rodrigo.Siqueira@amd.com; Gandi, Ramadevi <ramadev=
i.gandi@intel.com>; Knop, Ryszard <ryszard.knop@intel.com>; Lattannavar, Sa=
meer <sameer.lattannavar@intel.com>; De Marchi, Lucas <lucas.demarchi@intel=
.com>; Saarinen, Jani <jani.saarinen@intel.com>; Piecielska, Katarzyna <kat=
arzyna.piecielska@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;=
 gregory.f.germano@intel.com; Taylor, Clinton A <clinton.a.taylor@intel.com=
>; Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>; Yu, =
Jianshui <jianshui.yu@intel.com>
Subject: Re: [PATCH i-g-t 2/2] runner/executor: Integrate igt_kmemleak scan=
s
> On 22.01.2025 19:18, Cavitt, Jonathan wrote:
>=20
> [...]
>=20

[...]

> >> @@ -718,30 +723,39 @@ igt_main
> >>  	igt_subtest("parse-clears-old-data") {
> >>  		const char *argv[] =3D { "runner",
> >>  				       "-n", "foo",
> >> +				       "--overwrite",
> >=20
> > NIT:
> > What does overwrite do here?  Is its addition related to integrating ig=
t_kmemleak scans?
> >=20
> > If we're adding it in just because it was missing, then that should pro=
bably be done
> > as a separate patch series.
> I needed a larger array, and I could not find a way to increase it's size=
 that would
> not require me to rewrite the entire file other than adding a new option.=
 So overwrite
> was a simple option that does no harm.

Ah... Okay, I think I understand.  I was under the initial impression that =
we were adding
a new tag to some runner setup code, but it looks like this is done as an a=
rgv parsing
test.  In other words, though I initially believed this might have an impac=
t on
functionality, that turned out to not be the case.

It's at least more understandable now why the tag needed to be added.  In a=
n ideal
world, we wouldn't need to add that tag to this test, but I won't force the=
 issue.

>=20
>=20
> >=20
> > Lower down, we add "foo", "test-root-dir", and "result-path" to the arg=
v list, and I have
> > similar comments with respect to those as well.  Same with the igt_asse=
rts on
> > settings->overwrite.
> >=20
> >>  				       "--dry-run",
> >>  				       "--allow-non-root",
> >>  				       "test-root-dir",
> >> -				       "results-path",
> >> +				       "results-path"
> >=20
> > NIT:
> > Removing the comma from the last element of the list is unnecessary, as=
 many
> > of the lists in IGT leave the comma there.
>=20
> I unfortunately missed this from my review. It was removed by accident. L=
et me know
> if you want me to resend with the comma.

I don't think it's necessary unless someone else calls it out.  Or, if you =
get more review
notes, you can just change it for v3.
-Jonathan Cavitt

>=20
> >=20
> > There's definitely a discussion to be had as to whether or not this is =
proper
> > coding style, and if it's not, there's going to be a lot of refactoring=
 work for us
> > in the future.  But irrespective of what that discussion results in, re=
factoring
> > work like this is probably out of scope for this patch series.  Especia=
lly since
> > "overwrite" isn't being appended to the end of the list (and maybe shou=
ldn't
> > be added at all?  See first NIT).
> > -Jonathan Cavitt
> >=20
>=20
> [...]
>=20

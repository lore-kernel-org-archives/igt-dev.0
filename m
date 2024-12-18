Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24FDE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5010E24C;
	Wed, 18 Dec 2024 21:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTo0MKa9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255BD10E24C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734556686; x=1766092686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p4ngUTbmADVWiW1M2N2TDoB0R8YApdL4pLBuyjDMYlw=;
 b=hTo0MKa9JcPWS0MK+Gr9ZfBWTS5RQBfQZPe+ocTEoezw3p1AlCwJG9BW
 TyfZk2tWUECmkk//m2f3ucMdp+gGTuvZ2iM5p5Rbg4tybCAXjXPdgARu7
 v87KYeeIdJ8ip/u+Uxx/qLLACnR1d3bEL2ER7C8PM3NRopQ6zlyUCtzCq
 vEFpxNRekqE2Fi1z2I+D6wYOkMSxqW72z75F/3p4e+Fdi365vAAU1BoRN
 CCDGSpEIdqoW0u81O5RWS6Kr+fNxfwdfgvKr/E+2o5X3xh+wVhAq/qmwt
 alC23xfeptFDb4658L27zkwM8nW8Ba7Z3zOkDwlRVpqnbZauDsU0UiF2T A==;
X-CSE-ConnectionGUID: +lmIv8ZKQoi0OL3VvZn4Tw==
X-CSE-MsgGUID: LYcF0vppQv+dvId5PZf0Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="57529389"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="57529389"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:18:05 -0800
X-CSE-ConnectionGUID: 5gOrny9cSiW+GUpsVT6Esw==
X-CSE-MsgGUID: RuhtJ3qfTAiK53uOthlJiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98462361"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 13:18:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 13:18:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 13:18:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 13:18:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FazvLk5TUYvFIjbkOyJ46HW1hD4ztBltHq4ehxMQHjCmAwrIGWPmdXGw9Fb49DoW1B1Gx/gX7rcUmxSdTMSfSeHvDxH6w+gSAzuVNSgMkdGYCgt1csFGqkSsmw1WVJJD0oM3b8eiF/ot/gUcb06b52V3ZMouHUMoDYJyNYvwvbSkohm6H1TKJ/iTLVmF8ChCjx0uYkbY174j4kssuWVuQKUS3fBTKSx9Nb9KU76RLiisyTK24LjBF57RdOVlXYxF21cbxaCGFwMDXbiB56A6FWEMONsbnDDbs6t2XNIx4goNr7t/pYOM7xffoO8EvASEHs8bIVBpY30plfmEd5Vhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9cnFVcONKFgQ/D+ncrR7ubYf2pS1mZ5ldRZx/CHNrs=;
 b=gRfPN6k6/kNBiqc2OHUwOgCBvzj+Th2TB1x7pJ3eSKK+0IBU42shMUOmBkHvN5+ZkL6h53A8e/xTD/bz4U8aHjw/4rdhLMZ+/28bzZYkp8ZFdidBjm+TVF1+TTfzPONmTVTJH9oc0+zm6GmlrA8V3ZfghjtOHU6K1FNSQbWnMgn/G6ktqvS8TCR3SZy4acvLmJWdGdKVzo/0dcu40wXDQmkhNNMkbOGS5S8hAIJshQtj4yTapF3nrxK6/d2b5nkqDQN5n1/duk9+i7zkdBZto2CVTFqINqGmEkQuTd/PFeLI0x0Wtdt8/dn/GjiDepTo+GoozGBPAezuczWFDZvWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8212.namprd11.prod.outlook.com (2603:10b6:610:164::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 21:17:49 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 21:17:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Pottumuttu, Sai Teja"
 <sai.teja.pottumuttu@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_oa: Remove hardcoded time
 heuristics
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_oa: Remove hardcoded time
 heuristics
Thread-Index: AQHbUSoVSycmXffZfEKUiM5dwvIyRbLsgEJQ
Date: Wed, 18 Dec 2024 21:17:48 +0000
Message-ID: <CH0PR11MB54448EF96A103E4FA33CB6FCE5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218084134.2898703-1-sai.teja.pottumuttu@intel.com>
 <20241218084134.2898703-3-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241218084134.2898703-3-sai.teja.pottumuttu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8212:EE_
x-ms-office365-filtering-correlation-id: c7c2f740-a6ae-4b03-3ce8-08dd1fa96c8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AB6Twk8Kl33bUHZNlAzY1di2ZkgEZMQfgFnABpqq1zbB6UXzc4TkaaLwr4YU?=
 =?us-ascii?Q?0tLyhvloh39Udjzfyj7o93Jb9iBae+CGvQsjRqKHJToE/GAU5kGkI8+Wpi1D?=
 =?us-ascii?Q?8HuK7xbAMbhaHK1pdyU0GPQMBgTbuEE4v8v4tvUFZ5Zccr0rWHYedwQt14eB?=
 =?us-ascii?Q?NY0SU+hYjcpb0ToYRImfr/JqzI7ppxpz51lhRKlfinMaXKib1RlhwZf8q0X7?=
 =?us-ascii?Q?lJh9jgvTEHkKeTl4rgtIUMRBteT5bjT40enAB8fSJgK1jllGD6+i2qDG60qR?=
 =?us-ascii?Q?9hvA9fS8qvzNyd0HgNCJGytJzqC25wIPdf/u3qhwOL1OQxzGjlGLN0EfaVAt?=
 =?us-ascii?Q?sy9LrvJVt46q3NN9xZRK1dTs+Mqpa5ryyDMMjlnKa0ceRyqyjRdVIpFAIHO6?=
 =?us-ascii?Q?2pPiLQDDkrMijedsvH/uZjnLjHDyEixxQXDPUUvqXAJWXaJ+LttGuBu+EoxW?=
 =?us-ascii?Q?mbDssEvbt5sMvU8ePv5Ug29pFYt19Wo5nwsnuEXp6aMni5+mb1cUQQWT7gGI?=
 =?us-ascii?Q?VgYo/68Mx9kueylp/iFY+HtPYKl+QcwoYflE71bzaRgaWsKOlJ2ed6ZvGm+P?=
 =?us-ascii?Q?1wIMe2vvZUmgo5axtP9obqDmIpOOif8+srylDyVwb7Ypf946Lo67c0wjvNj9?=
 =?us-ascii?Q?YkMPnLHaZyupAKelgQ+qBSvOUDn7ijA72xVI/jch5zQOINJdLk4VXWj1T2f7?=
 =?us-ascii?Q?S3lY3X3jYpo5mEtTVYfgHmuuRZJnsfICdcWAYVT9mzUxaB8jjG2+XhlI5gv1?=
 =?us-ascii?Q?yng2oKUKaGkw3q7xLPpVVHnIikwxOF7F0Fp9LUxbzGx4q7F1KXmOLD4aMbg/?=
 =?us-ascii?Q?xJrQdyyYjoENwQrZIrucHJSol1DI94lSNLuwpiQ5O44NcH4Czt5s+N668icL?=
 =?us-ascii?Q?4ID3TL4MY7sLkgvH3B1xnpxlyASueZlCpQ2vz68M+5q7i2XhkHoHtrH4RMEN?=
 =?us-ascii?Q?6FCyArPF7fleR5mdotGxAiaqkxjfaiqY3+EjZI+xIV7+stJJLKXlvh7bF+Jq?=
 =?us-ascii?Q?UAh7odR1j2VPuobVY/979H+yDtopfzCkRoOYElnOXUIxDCE9OPWhcI8jR/f6?=
 =?us-ascii?Q?dUSMQVomAidHUElnCQqgufZKvVaDFJv2NCgKv2uvdeFJBZU2f+U340DgKYjc?=
 =?us-ascii?Q?fyZ7KxyPk4nEteecJfKx+tB7MfcPEeY4EZLTWPXNtZc7g9H7yd+5cDKqme/c?=
 =?us-ascii?Q?fiK6MdCyY5YEMJa5iQ4BIxwV6L6dihNodM2pvTaPgh5S53PPxHxE7kgxEPIi?=
 =?us-ascii?Q?X/K7UI9QEVnlpKxAgzxqGb7N/dHJ0vS9D7AHRovBmNjJyj+Ep2q8k1nHExNp?=
 =?us-ascii?Q?YNRRsZLDM0uaBi8v851wTbNOz8mEes4rBW6+ZXi8lNy6Ay2TCWJeU6kHXs4K?=
 =?us-ascii?Q?4E0pEHUiVEe9X46G/RBOSFXrthU0kdOo5stt6x2CkcyiLTn3fv+cUpDibrMG?=
 =?us-ascii?Q?tYvZgdGyS5HzrsVmfHron5U0LNx9hPwY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ofTXDJD32tPDyWhSDZtm4Cdl1Um4+//nIKhKl+orKhVuF82Nt/Cvl/TC0Hoz?=
 =?us-ascii?Q?r59f7ATwKmg8RSjTasxkbdG9ZBHHh8tviK6pMabIXgIvGtT+FIL4JtNEc8Fp?=
 =?us-ascii?Q?+HKGOs39MRUXf8E7p4WelZeeY4IclVxTZJH4bLVXYnieJel8OpNJ5ejLMPbG?=
 =?us-ascii?Q?hAaPVV8rIRkc+bnGpUfo9BnBScpcaV57/KkhH+dAemuaj3IVB2xyAY9+cXNh?=
 =?us-ascii?Q?Kl+/6ub7lePYMcURZbOgwuS3rMHXkh0xQUGMjcsF8aekunefvQBpQAeEWrjc?=
 =?us-ascii?Q?wjxJD+RdLqpUKE/1NUle1z0GDZCVmVWGyj4bcJ8tLlk4eUOu3jH1omdGHtbI?=
 =?us-ascii?Q?dGmwZbOMT/YWffFr9eWshOkB3n1CQVxt7sVHgt3ehAPsj9jnWT2cfyOpHj6r?=
 =?us-ascii?Q?sCbjm6ZNv0/gfgTh9Zi7k+n7IPAVn/mM+hc6xd7+7aWnrfGoPtm75B7zWGmN?=
 =?us-ascii?Q?cRalDR+28RIobOcA5p+MW5Ojwi4ARijx8oz4/eBfv6AhH+pvxg9YjmK+H04Z?=
 =?us-ascii?Q?mF7wUeASUaH2LY1LxHxqtc2Yup3z2myHhJISr0TKaMkVwZMGv+AwYknaBSTP?=
 =?us-ascii?Q?J9xVN4oAcK7pEVZoDTS7V+lBVT0XOv45DWKoEJn6cyDLkoRk8QAJN9qoC2Mk?=
 =?us-ascii?Q?ecAtzIdzMLmssV9K2UvIr/G7/XSHBXdjw4e7StP7UHrxTCskJoRGPq+/mQoi?=
 =?us-ascii?Q?LjUMo7hfZLFwGo9P4oUbwAPCXoZpq6aB1Y8K7/dNwag4ItHaz/H4ZirBTdUj?=
 =?us-ascii?Q?2KhDJ5FImjV/ckYuR1Fv26YOL5qun+Q6RBXLhYatcveAnLmxoG+G//RzkTgy?=
 =?us-ascii?Q?0UeklgEu8O0Mch9dHcoepjgs6lpZo+HdIqKqgXEgc20dC87s62wCSzMXUEHl?=
 =?us-ascii?Q?Z3wlPBPbdzkTR+HAMn1rCVidQzaUKNF0BXa6lFjUHKI2sRY6rG5404IkQoZH?=
 =?us-ascii?Q?c7o9reudPGnTTWOYrzN0B3gMeqCRtS2gXy3A9ZUc0ZEJBI7rep+j3TSEum/4?=
 =?us-ascii?Q?8hFSOxkWhaovioRhLKHocXmBB71Wg6TUGjWBJAbTU0o1LAY5c9YXeK3KEkTR?=
 =?us-ascii?Q?QMJ9wLosJJEp5MNdfvcMJKJyrF3/Xc2UFxx/HM3bfBLulf4TexXu7Fqz0sav?=
 =?us-ascii?Q?SDtGwaeNPpd19tHp8nC9H4JYtww4MujaD1KkdUr8hHh6zjbrNcfqTDp0H+0W?=
 =?us-ascii?Q?Qq1OzlGJZItH/8R56X8s2bLJs/B4v/ecUrlp7m/wytVDh2B+sP1PU4tLiJaX?=
 =?us-ascii?Q?oJyty8jCtkkqEP6M7h5BUp7fyB0k2iaVt6ebmtU4RQa4zBRFhht5EH46pwpq?=
 =?us-ascii?Q?9pq2xC0hjSeI0CaH806CQ77USc/ud5iU1+J39yo4l55ppQsuSLISc3j3tmMz?=
 =?us-ascii?Q?hPmEeDcXhdTrOZo8NRZc9vyG1sESJuc2RjLNuXLxitq3XbuGcWxMsXDIziMX?=
 =?us-ascii?Q?olFXbZ9p3g6sOj9zV4arAIVUFYNP+vMpx2SSgZK2l7RKeBKvlaH8yGhnsBEp?=
 =?us-ascii?Q?HhUN2P+vJmb2A+G6tGUGvdiWo7ZLvQaldKtK5P6WBID6dlXnFSRJVzs/dn+s?=
 =?us-ascii?Q?GODWuvvsPdTF5vkCOh5qjeT5pgTcB3wKUbXOYnYV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c2f740-a6ae-4b03-3ce8-08dd1fa96c8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 21:17:48.6978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mo5aB2+jvXAnro8S9CrpZXZLEa6hrHkIfm3eFgPKsjkPrBz0bLoaNbiHgrbV2VCxAhNf8N8jqDTXiwtCAVRaqtXf/c79JMayYgzyMMJaAQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8212
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sai Teja=
 Pottumuttu
Sent: Wednesday, December 18, 2024 12:42 AM
To: igt-dev@lists.freedesktop.org
Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Pottumuttu, Sai Teja <sai.t=
eja.pottumuttu@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_oa: Remove hardcoded time heurist=
ics
>=20
> Some tests in xe_oa tests have hardcoded timing heuristics. Refactor it t=
o
> make it more robust and reliable.
>=20
> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> ---
>  tests/intel/xe_oa.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index ad3526406..2cae56b47 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -4367,6 +4367,28 @@ static void map_oa_buffer_forked_access(const stru=
ct drm_xe_engine_class_instanc
>  	munmap(vaddr, size);
>  }
> =20
> +static void wait_for_20_periodic_reports(void *oa_vaddr,
> +					 const struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint32_t period_us =3D oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
> +	struct intel_xe_perf_metric_set *test_set =3D metric_set(hwe);
> +	uint64_t fmt =3D test_set->perf_oa_format;
> +	struct oa_format format =3D get_oa_format(fmt);
> +	uint32_t num_periodic_reports =3D 0;
> +	uint32_t *reports;
> +
> +	while (num_periodic_reports < 20) {
> +		usleep(100 * period_us);
> +		num_periodic_reports =3D 0;
> +		for (reports =3D (uint32_t *)oa_vaddr;
> +		     reports[0] && oa_timestamp(reports, fmt);
> +		     reports +=3D format.size) {
> +			if (oa_report_is_periodic(reports))
> +				num_periodic_reports++;
> +		}
> +	}

It might be worthwhile to have an early escape in case num_periodic_reports
never reaches 20.  Something like:
"""
	struct timespec ts =3D { };

	igt_nsec_elapsed(&ts);
	while (num_periodic_reports < 20 &&
	       igt_nsec_elapsed(&ts) < 30 * NSEC_PER_SEC) {
		...
"""
Though, I guess the test itself will time out and escape if it runs for too=
 long anyways,
and I can't think of any circumstances where we'd hit this exit case.  So I=
 won't block
on it.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +}
> +
>  static void check_reports(void *oa_vaddr, uint32_t oa_size,
>  			  const struct drm_xe_engine_class_instance *hwe)
>  {
> @@ -4396,12 +4418,10 @@ static void check_reports_from_mapped_buffer(cons=
t struct drm_xe_engine_class_in
>  {
>  	void *vaddr;
>  	uint32_t size;
> -	uint32_t period_us =3D oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
> =20
>  	vaddr =3D map_oa_buffer(&size);
> =20
> -	/* wait for approx 100 reports */
> -	usleep(100 * period_us);
> +	wait_for_20_periodic_reports(vaddr, hwe);
>  	check_reports(vaddr, size, hwe);
> =20
>  	munmap(vaddr, size);
> @@ -4426,12 +4446,11 @@ static void closed_fd_and_unmapped_access(const s=
truct drm_xe_engine_class_insta
>  	};
>  	void *vaddr;
>  	uint32_t size;
> -	uint32_t period_us =3D oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
> =20
>  	stream_fd =3D __perf_open(drm_fd, &param, false);
>  	vaddr =3D map_oa_buffer(&size);
> =20
> -	usleep(100 * period_us);
> +	wait_for_20_periodic_reports(vaddr, hwe);
>  	check_reports(vaddr, size, hwe);
> =20
>  	munmap(vaddr, size);
> --=20
> 2.34.1
>=20
>=20

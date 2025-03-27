Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9571C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 08:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E92210E874;
	Thu, 27 Mar 2025 08:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cApCNyec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C577210E874
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743063287; x=1774599287;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9XI6jycdcTZC+8ll7P4G1IbiZJ+tr4dwu18IaOjqpMw=;
 b=cApCNyecJj4DykG3EviFP5k+pSPrYzP845pEdCiAylGbACGz/Fc2Cw4G
 amLp3QHSmyTfy1xhw7RosyzCtKUugZB1nvs9zpK/ykjJnfAH6vJ7OC1iv
 zsu5hH53gqHS+UXFtAndz19/LApofDrzB2JekPqS+fOjDl7FuAeL0uaXt
 QEUWo71ukG+DwBWmHNWBqDIZYkzBq41yi+MVKO0dl9icA9OrxDtgvLOqW
 X+fZ8LHLsZwzlQra2095E9ZiQpXx4TN/an9mgC2M+5FbM2zUfWap7cnrh
 +Z9h6HiVVbGNyWYqiwAge/HcZX8KPk4Vk6EAj8LFMLi53tIEC9RKBcOif g==;
X-CSE-ConnectionGUID: N2Sn1KBHSWikqlPzelpSig==
X-CSE-MsgGUID: n3vp2iRTQ8iCUnODuJoRVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66849668"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="66849668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 01:14:45 -0700
X-CSE-ConnectionGUID: sa0kpI51T927+OSUnmaEkQ==
X-CSE-MsgGUID: KQzxpKCIQs+GZyCDtwgA6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="129912183"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 01:14:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 01:14:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 01:14:44 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 01:14:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YL43Y0534PodNVfr48bK8BA1ICbqxhxsrQERgcYK+SgwW+TjsnK98x0HC/gufmv4YJiPKtmjS9lVLmauYejD9DE7faoRTCumN/1s4ZicDjA0L003v2zXVUtZAvjF7eII8Jtkhz0CBS/UdiKZm8M/smEhafnXwIh4lZKZMXpmina5cVSoeyX6XpMOEW0g4qIN0Iwy4aBd9oXdt9bdQa9hDHQ1Qc19WZfx064MzQB6Bf7tpeCXQJ16NDOaOoQi07pYS8P0VExzKnDE06roQIigmaZkhM5eUR7IK18WFvNf7spWNGAYvyNvxPXcDaeRg3bVvi7iuJgfKF6PFVvi+IdaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDcg+uHPQwiZDX0OSQxrP6MNqw6a/HgGUlFT3w1w1aM=;
 b=dmCMRGurn2bnAzRBfEJBnti64TMGEPnVKN/TRQuIz0ByL7LPUHMslEfCNBWjAVMpbwPz3CcLnN7w1Y+kXirGCrK1ZX2lhyiqzZH/l6PqUMGa8Pz8UgALBin9qJUQjsM562Nj0yCsbHZWNiTVyAXeeudExvbayRLipv84GzRihy+D5SCUIc9b93hecPPT02nXZh3Xmf9sWeF7BgMO4JSD2JMPS+VrT4Ruv04M51dk5yzye9YyMfZ64/EK3G+g3u1BQ9ywudjdaIDVCl9mEvys4vxCMUHIJs2716BdfSFC25yCCQWTBaKcWfJkxgqj5EkOfsBpncThCeGTEduDKU1C8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:14:39 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:14:39 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH 0/1] *** IGT Test code handling error string for
 xe_sysfs_scheduler.c ***
Thread-Topic: [PATCH 0/1] *** IGT Test code handling error string for
 xe_sysfs_scheduler.c ***
Thread-Index: AQHbnntDZNPTbkleEUGBR6vGWscdr7OGkcJw
Date: Thu, 27 Mar 2025 08:14:39 +0000
Message-ID: <DS0PR11MB7264530BD0FC62EB94FED618D9A12@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250326180312.1808192-1-sobin.thomas@intel.com>
In-Reply-To: <20250326180312.1808192-1-sobin.thomas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB7122:EE_
x-ms-office365-filtering-correlation-id: b0557b86-1e9c-4b65-8f60-08dd6d076b6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YYYHXDVmSGj7x0cyG1YHEcZxVczC5uo58tDGr4jRPAAtUFyt2rWn2G3cpj8p?=
 =?us-ascii?Q?nCoalqCkgpOFGZglRSXPv6hJQeAUO0xoBG+2KW/8/gTaYdaiC0LgzsQ7mMEI?=
 =?us-ascii?Q?DqzeRDExPVTtS9fkyJ2luiF9MwWI19AhT7ARAVTtB0cpnuBhIJimrgD22Xj9?=
 =?us-ascii?Q?u6HSbJsNQoDsolSkqVIEMgpyqsiQstkTGpiKIROJsxp1u+ylbT+F4DCcTeTc?=
 =?us-ascii?Q?PM3AKcK0V0iWuD9I2CNTLBjxQwl4ETQFa+C6lDzO6A1aAm/DqCl88MecWBzN?=
 =?us-ascii?Q?pmplRMUcPSY6iScmso/y5FMSv5OZVKnx//dv1FSVDPTkaPq5jcX+9Sp6VuXa?=
 =?us-ascii?Q?DTosMBPVsIsaFqWRGUaQPWFFBC8gGCNg5HiH0voDitKa8kkpzR08emMFlx0O?=
 =?us-ascii?Q?24LevsN7ec5jVGNix2lKjsA4zvLlX9JKgsnxqIKaIx6Fq1v4o/S+1wzbqWQJ?=
 =?us-ascii?Q?8jNieXwuJkaVKjVw9WBfLa0ipAY+8oDcfHKg+6U2GUYfLXMr33XPEtFSKirZ?=
 =?us-ascii?Q?3BkyrhVSBcpJyZNa0g5qUqf2OZw5JoT99Gjkv5UxawWj9k7MXANGgqGt4RE3?=
 =?us-ascii?Q?aZi1YxEexkpEQsUoT5o9F36pVTYKMSNgiuXD7IL1CiVu9M3RpTQI59yHBmT9?=
 =?us-ascii?Q?fxJPUq3AOJUvybXQP/oWzq5tiHxCo0LiWWMRezEybG4uyYadAefp/3vxLgea?=
 =?us-ascii?Q?vgkCVHs6J7Ij+ipNUtZS+3LUklEalZzQMpfWaD8zTPMX8YgqXIZieZF8ITuS?=
 =?us-ascii?Q?GQqHs0O4Yz+o90ziUp7uGZpABt966b9ESA7Ci/ujxMZVosCLxTK+mVBuIL5w?=
 =?us-ascii?Q?tciKOe4Id5+GNdANLHKUw0ZLVczbZOkcs4VrcyZPubgxH2uW+t7rrGLrFGIO?=
 =?us-ascii?Q?o/cf4cPjfzOGCXUYSUCEeiJ9sFvQfA0K1mzyGfk5Xk3ya54LbxUU2x0Ao4VK?=
 =?us-ascii?Q?200uF9jzz/nuTPiEF8Mxllv4XM3F00B/OJBG4jWuGe4J8V2SQB6a24sY1tJb?=
 =?us-ascii?Q?zdibyrp75kCZMX5UlvBKpYEz+BisJpSouXrJhep127/Bs4lwZyzuY8aZY2XB?=
 =?us-ascii?Q?FEW/H+oIK4pm0TMx3h9MUlVgM/+BAV3cNRwtK8kE+Eu6txaGQoDjdFIUo8JX?=
 =?us-ascii?Q?lNxVoHXEzF5nv7UujyVPZmdf9HG6/p4O5LHaJLLOyzpL1YzemTEHXEUnu/qO?=
 =?us-ascii?Q?cU5dDEwyCydStxPYFNYRW6M1jz7et4/1hmMpBbRvRoS7eV/HzR/knPqfhGlP?=
 =?us-ascii?Q?oLJhZ4Au/EFaXutrOFJ5S/+ojCLwxIBTgXzQluneJbInxGK+fTnmPh2A233/?=
 =?us-ascii?Q?DxnH/mMcfHGUj75i/6CHG470RtduZN4gk5CJX2wx2U30FPvxbNPu8WELZMyf?=
 =?us-ascii?Q?gEr6MkMNYrNYcFtmWPXoI+Mk6pYQfPYkXiXvlJZ746RJrh1diGiikqA27sWd?=
 =?us-ascii?Q?F7KGUAUrTvJKIEOMIuPCcPINBPKYtnPT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DcQe5sv3E3a1WKKwEcnTpd0eSYpq0MllEWMMJFQsEfHm4UwkanWNHSnwJ5ne?=
 =?us-ascii?Q?xHGi2SHh9mvsaykCDjbEojqpZuGjoMZRDPaUapCUQvaeOx3RqBaRc0u2dmxT?=
 =?us-ascii?Q?Sx3VcHnlDHZysadZBuobMeffqAd/N7L6zVFzizvUqce0wDdxKRHco0080Wa/?=
 =?us-ascii?Q?Rn8kJME5tRdqwBOkpC7rXyvRXxLG6gBwshssW1Epl/TF79JSdPGIs+YhCwFh?=
 =?us-ascii?Q?kc8ZcLx9WkVLbyHiquylIfFCOnfrU9GzLCNkcCWPfdHf0R6dwFA9JeGz8+xg?=
 =?us-ascii?Q?bDMJvUxb7n3U0oiTH3WX2DFC6gbIKzTOYMW332U6XTFq+PVXilF2NF/ybKXH?=
 =?us-ascii?Q?2Lr5ZfJzjE9dWnBjGvlUYXFWB8Fz+rSQMzmbsxbjmsT0eJw+ecBQurxozcMD?=
 =?us-ascii?Q?Axalg0ek15LyT6kgEcPk9Giz/Z0ALPJMo8yirBYWAOBa4ZaCAXei7XnpqRWF?=
 =?us-ascii?Q?kH1eIMNMH8m75jK9w1rFoHmjetNQ5aTQkbzx5Sb1CLOBbGafn/d93gGU6vZ2?=
 =?us-ascii?Q?OYtPEwLlMKjw4ktzy2GTiZv8J8yKAkC3TV5ozAUVf1jZj/FhR6u31pDJkZIc?=
 =?us-ascii?Q?/tGEIHEOwZBgIcWkhapW4aLl82VfKYv47ogtxqmcekcaTPSCVyxt6/CR5M1f?=
 =?us-ascii?Q?BQFPRL79SdLFDTFOmFl/5g1jjH8IZHRpnQ0x3dMXFxCgRANlJKltbV2egy+L?=
 =?us-ascii?Q?NYa1LHvnQrSkR/zBDXrYBhRnPTSNOU/sRS6AvUEI+qaMAm06gRx6PSsZHBlf?=
 =?us-ascii?Q?qAQT9kMpf8aAGhuHs7ryNF8UoOikwCZhDRdBz/BJG5C2nFPy46gqwWl8LfbU?=
 =?us-ascii?Q?Le2HtcXiHXLnhRTwxLiiGQY7TZCqpeIsMCi+kQkOzkirECR3TBfzK6toHKs9?=
 =?us-ascii?Q?csN3ozzmGtU4lsQz+j51m/BLP5yJrR3dZgJWMv/AKENwliL8lR+HneR4NpsW?=
 =?us-ascii?Q?XAKqpfwnG9aPFHeSw0te+TjkgVdXOo0mBkQvyKYG9Bv6kv7QsdQ/IcctRcaV?=
 =?us-ascii?Q?mMd8eWR10xHiZ/uZIuDkwZl119Q07uE+KPQJhw6zUYa/a5X4cmmt4rl3WYnw?=
 =?us-ascii?Q?rS1kemvCXaPVlghsFe5emxjAtFBgkeUzO/p4FbrrZ+aY3PtTOIQOWCqRNYex?=
 =?us-ascii?Q?BTyqDAdV59yvpvEIepXzeN3Yfm16dcIguvLowD7UK4R5tu/FDwZ+H/qtUufe?=
 =?us-ascii?Q?Xh6oqQ5EX4m67n/LAhyxypqYt1y2deFg7aQG5F00a2XPNsU7SGstH9AjNnKO?=
 =?us-ascii?Q?t4jZGilI9OaY22cFXGfI63F7KSoVsBT/VddOLHOTnRcIT8HZVCQsumTHH6Pn?=
 =?us-ascii?Q?vQEJTh/h11Pu+b/Bn/LCkKcVSKqxOjEIc3WZRSXHMlLQ9u6FPmg06ikgIv9q?=
 =?us-ascii?Q?sgwZ2qM6sWq48Ef82g9Lbp5BQLV0aYsFy0PHw1juyM6rQbK4QLsPSd0t3zCx?=
 =?us-ascii?Q?0ar+L5F3FW0Z5KAG13gkh3ZsIfIGG2UeF3zXikWNyE+xW3ppGuas/TpK2h6O?=
 =?us-ascii?Q?iBWR/AMQsmyfPTWOYsAwtqBiXnGtWr3hDLdi5jwyiwtcqV01IW2qi004EXoY?=
 =?us-ascii?Q?bOCXDsZ4k1nwTrVU3EHWRYXq56SB3rxYHVjeufqusBwV83yEb2qaT7wPTVa5?=
 =?us-ascii?Q?bg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0557b86-1e9c-4b65-8f60-08dd6d076b6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 08:14:39.0586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZFXvOJpbnuXWkvfFPPOzr6VyxtkIw2qbaAaUvNRz9vEGxRWRFsPBmxWBRxGKIQrV0IfOLfwSt/J9Q23b+w2al+BLRiYXIvSZdMyhG5/GXmca577NoPAB++AP6Q3yYLH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
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

Hi Sobin,

> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: Wednesday, March 26, 2025 7:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Konieczny, Kamil <kamil.konieczny@intel.com>; Piatkowski, Dominik Kar=
ol
> <dominik.karol.piatkowski@intel.com>
> Subject: [PATCH 0/1] *** IGT Test code handling error string for
> xe_sysfs_scheduler.c ***

For future submissions, please set format.subjectprefix in your IGT reposit=
ory git config to "PATCH i-g-t", so subjects of your IGT patches always sta=
rt with [PATCH i-g-t x/y].
Triple asterisks are part of placeholder - you can safely remove them.
Also, "IGT Test code" in subject of a patch sent to IGT mailing list is red=
undant.

An example of how the subject can look like:
[PATCH i-g-t 0/1] tests/intel/xe_sysfs_scheduler: Add invalid-string test
And when sending a new version:
[PATCH v2 i-g-t 0/1] tests/intel/xe_sysfs_scheduler: Add invalid-string tes=
t

>=20
> From: "Thomas, Sobin" <sobin.thomas@intel.com>

"From" field shouldn't be here.

>=20
> *** BLURB HERE ***

For future submissions, please replace "*** BLURB HERE***" with a descripti=
on of your series.
Also, add your Signed-off-by tag at the bottom of the description.

Thanks,
Dominik Karol

>=20
> Thomas, Sobin (1):
>   Added tests to handle error string conditions in xe_sysfs_scheduler.c
>=20
>  tests/intel/xe_sysfs_scheduler.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> --
> 2.34.1


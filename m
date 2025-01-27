Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BBEC0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 04:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA9E10E14F;
	Mon, 27 Jan 2025 04:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNZk0vLa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FA310E14F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 04:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737951147; x=1769487147;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3dulQC2rTWw2uS1usDAb+NL7h7y7U3i5WAbvpdGd+dI=;
 b=LNZk0vLaTbVqAC6JsJ4p8tLtamRw5xWcXItB9uHkqV85MGugUGyVTrf9
 IG2nC38nzdsMzZpOfFWQs81RURWRVC/uBnD/WadHR+PqXFoapmgR6g3CD
 HHij1vAzBDnGpGZh+b7UQeDx1xpeiVMM3Q0KzN5BPlYxjDvDHvxIvu3bv
 5mLeMsG2/F2Hl3lIH4Gbc47G0c7ivYzzxgp1MupGrNmN5J1pABYdNMCOd
 thNbsEGu686HddYyMmVELUU5iAJfupkxwm9Ml+argcwpmrsLryLdHxhZL
 kA6xdK7pATnm+Z54jF+7hCduuoxjnt2WPU4e1sGxr/4oVRRm+IB6XknP3 w==;
X-CSE-ConnectionGUID: SbOXCk3iR5iqaKZUt7SjiA==
X-CSE-MsgGUID: LOv6s0icTgW9cI0cpZhjXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38432915"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="38432915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:12:27 -0800
X-CSE-ConnectionGUID: a0Gr4BV2SKauJhSAEOz76w==
X-CSE-MsgGUID: 9J9dNXUOSie34dMsju6WOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108762796"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2025 20:12:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 26 Jan 2025 20:12:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 26 Jan 2025 20:12:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 26 Jan 2025 20:12:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGJhMtR9AMTnW9f2igGh6U5blKX8lCnDDw/H0yx/bQvsTO2L8sAZk0KR7Qf6Y05HQ9Lm5iHMObQZFq2Ve0TMO8dkHDlTIOOrSMPQANtxuu3NTvDsmOxJRNxbbvBW3PEm0KMVGAZzXDIuAJdgT4nIdHW91dHXhkLSt9UAyO8dODDnx14XtR39PxEjCc8MsEcVNHwGyX/TJkTHoX5fdxrdL9orl8yIcdbAnmW3HnHLVUuglr6SvLtgVdFPS+wbe1Dk+E1IzLakZ7WQEjhNTxEFl/n2asIW+hwxjeX3v2+VNHWQcG/tI1YGAqvOvcQoPCp2DAwhmJH6MOIcvvpTVynedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAIHntufC8xvU4yYxhimbN541ck3rkyP2YpJBv2BqQQ=;
 b=IYN1Yd8EyYcjU2DhnKuI0dmysLykhcft2xIzu0WbBuDMlKdgp6mShKWb337unKKXb1Wum73f2xUAxkb/sXuYILmIV/gel5h1HQT7YOLjHnVHlLtGKVKx3WCXJRnnx3KsNOlJYriwcyFKTJ3dDT+bl0vQDuniEU89jj2DUXEKlIbrp7+H/3H32Agy5rOaW0j3xUY0KWJLYR+nhW2hG1YDzHyeMeY/1JYjMuWjbH2iViQy834Eu6IcO9S41nmwGy9JFzn/me9nJUBE/FI8rQJn4Vzoz0nR3Bzjp7JEfurdR8dlUs6R3LPQ9M5br8Wk0vsmYwsLC++qZVPzZC75o1EBXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA1PR11MB5874.namprd11.prod.outlook.com (2603:10b6:806:229::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Mon, 27 Jan
 2025 04:12:24 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 04:12:24 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH i-g-t, v2] lib/intel_compute: Use LR mode for compute when
 using Xe
Thread-Topic: [PATCH i-g-t, v2] lib/intel_compute: Use LR mode for compute
 when using Xe
Thread-Index: AQHbblOfuuO3FB8dkU+lr4NUOxkyBLMqBatg
Date: Mon, 27 Jan 2025 04:12:24 +0000
Message-ID: <CH3PR11MB8434B27FE71DFF6981ED72DC8DEC2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250124113140.2525323-1-francois.dugast@intel.com>
In-Reply-To: <20250124113140.2525323-1-francois.dugast@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA1PR11MB5874:EE_
x-ms-office365-filtering-correlation-id: 22870056-c32f-44e8-201b-08dd3e88cda3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?osXaBcqqBQjXxasgBv7n0d0euMbRwkY05HfKpMP88JtZUqQ1dcSRcMKIFhsp?=
 =?us-ascii?Q?Jehie9zbWQ9QpGE903oEZEnOPmrPYRQg+vycNQ2ji/PymChojAM7dlt+occW?=
 =?us-ascii?Q?HjaM/BpzDDrer6w2dkzEgIVoV0vLVm+SYE++UIRP+5v24nBYyx72UnmoWaDH?=
 =?us-ascii?Q?CLnH9wva7r+CZLfiTekzeJizTyN6EYvdfCy4+i7VnwEsDTVrwN5sE8s91ZMP?=
 =?us-ascii?Q?aJytTr3wohaTCs9BaJodWJP2J24tGtzSU5uYB55xfNw5ZppZomZjwxkrGGo0?=
 =?us-ascii?Q?YskLapp5crYvM2kNL6a+34CuEpubrEw435ylmTKDGYGVEq/smrqX2U0LzKPa?=
 =?us-ascii?Q?rG5DUghyoCCaD6OxFbF6SUXmLt2cMAuftKLDKhpJDu3WXivwiro4qR5EE8gS?=
 =?us-ascii?Q?HV9D/YKyPvZDoxZiG/vJ2pLaDfwFrFqW9urQax6L4VhHZiUbi8MXW71ScmUk?=
 =?us-ascii?Q?2UVjCfRokI0vvuntgCsLb2+gK775HaA/hxcuKUWZiBgt166SVV3OwzuGKGtS?=
 =?us-ascii?Q?hrQqf/qPTIF/aCmBhSkkLXpz7oA08OVkZsNRE0AnifiRIhbMRyVmMZ1zqPA0?=
 =?us-ascii?Q?uxob8oUP5RJDMdwzRh1TG4W6veP8tEhuk2Wds/RPDghLxLM26VRqjIA/4scm?=
 =?us-ascii?Q?rxL8Hz3kCSVJuLUNpiSqWaGJx4nhRH8tAAkZWHzEqext+6O6jTNP8DCFTQVq?=
 =?us-ascii?Q?SwkD7dROzeea++sR45goX2UqfbHXBuMneyT3G3DVFIFl6Bdn7xc6v0fvjXnt?=
 =?us-ascii?Q?p56z6wrdM5jGykJJd2fq77whg0bQ8+mWEN4j/trMmRmWZqpjWAJLqAxccta0?=
 =?us-ascii?Q?6CQaIIJK25NnGdB6HU80R58MS7dUHjT1cIhGFX4OfpGL5huXR4kT5HyICZTZ?=
 =?us-ascii?Q?HYn52ygy/WvfABDdzhflC1g4s6VVvPV+u0FGAe7N5vNKd3BeIqDykbKkIAjT?=
 =?us-ascii?Q?sgmEt9DFhqOupdhruwbx1Z4UCpBEgb2VYMYpOAUe5VAzig7phdUp5x8NsTSd?=
 =?us-ascii?Q?qzo43DC+HrV7Nx7hARaiG5CPlQFmD33URqavbqBVBUxVSTsnz1Pi8xolqU//?=
 =?us-ascii?Q?8/TVlt2E08sAu8gPPg9NZcTilSaiSi9VPpJOQ7mYmKRRWDLCJ+zTKsIO4Ds/?=
 =?us-ascii?Q?GemzWMmIXcwOkrsOZFPK2pufrU6DMt8LdDL7oS3oPjnyylXwu9yfheXXuIOE?=
 =?us-ascii?Q?NyMHZ6pwUN4AVnmhEGeZCkNoG5sO4eQUqhQdukAE833+cfui/VDnf8nfOWeD?=
 =?us-ascii?Q?39Bd8kio2YF87y/QpgnkxG6zm3mn9MNp6wksvCACra9bR3Nn5QHM/0kyXPr/?=
 =?us-ascii?Q?SSnp05qDmHJuaBFk/Japwy4iAx0klYJ7ddnCs/W7Q4iRU3+fWgL46fEx5JmK?=
 =?us-ascii?Q?Bj8cp6qeu4Iv5nA8AZ+ctWcvb+YotQ7QMx2unCgVz4QIrzvRPW2V/9Zd/D3t?=
 =?us-ascii?Q?T08LFH1w3JmSkkN8wwdBRKzmFu25GX9H?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mnaFb8B8cEm0H5vrUbYcuuBeUSW1LPxZSSskkKRZ5mXOy4zgpvSaMZqEEiK4?=
 =?us-ascii?Q?cyAPG+NQZw/k981rJ13IZcixtgDD76B5t53pTwrYY2eOydqop+1gicoJs4/4?=
 =?us-ascii?Q?vB00uX8BR9KQ65pCmw8FjDTfWbR7eXJohc0Yju3HFqA/nIRMwH2NXhkUnxVT?=
 =?us-ascii?Q?ncgb6posoj1ap0BGtAL3O1h4Y/fTw12JLW04UY+k2yudUvXKbc5NBYDUV7dO?=
 =?us-ascii?Q?tFeYpEXlKZHKc3tAEZR7mN6Dh3eZ9WDyL4pNK4SmJWWCO1i/GlDOprb3w7QO?=
 =?us-ascii?Q?7v3acvys7owJDd0NoqAXlbZZQSQQPtFtYt6XjIMU5TSHciv/w+RpQg3cOOEV?=
 =?us-ascii?Q?kWz7Zv6KyfoeGS1jSPkVBFjPEQ8IpeBqcHvtiKQo3aK6zPEmT18usDnOHNyw?=
 =?us-ascii?Q?b1xqDxE+syo8ua5wLxzydxTTQYpyleFZCQih6cEhYu92AWPNal3egCUHS/SO?=
 =?us-ascii?Q?B7opIOVEqEvkjgEAjCWnU228OSGH4jY13MtpZ/JBWGoDVruHJB+sX08YPy1x?=
 =?us-ascii?Q?+KH61j3VHMM1yq0OBaNNhxyUZUr8R1DysJUqWEoEq3eSpvdCUW2oiG/wKNmf?=
 =?us-ascii?Q?xo8Goenr8VmtJmDcXktQqE2jFHBbDI8aGn4FWUdXiG0nfWCQLau/yPffOlxG?=
 =?us-ascii?Q?kswbHaugq3uIPIqN692d+0CeloZskJuSmvoZOqt+LSOzRlqsxGUE9mnmUnHN?=
 =?us-ascii?Q?zU5wqI4EVQ77gScwT8EQ3TWIyeBeBzacjqGDeQVepXPn1PC1F8t3GiCaY6oU?=
 =?us-ascii?Q?w5VSDU9sw3NIbgM5vsYR94zEOR/wvUplUNqBiQbOxfwEJdHIBfVx+8kuafSm?=
 =?us-ascii?Q?NDouTHqSkmFJG8ucfXj2g0uKg17fTViOgyHx3f0iEOshoMQ1VhMpA60T+EsS?=
 =?us-ascii?Q?nfR8TVCIjqwXwXX/8kjp5mnX99hwn/VHzPiPSNq6wcvRVYC/i4yE/yXbr2q4?=
 =?us-ascii?Q?hgiUzH1SrUA/l5K8CQwxS81Xb5fc/s8ojCtV3KjsUK9OQ+7L17sHD5YaUEI1?=
 =?us-ascii?Q?MNOUhKGIVmIuf0AoLM5c2O5M+LAzAqF10JmesmT6HB2M3zbWQG0RnV2wQCig?=
 =?us-ascii?Q?o9n3YW1L+mVOMTP00C2j1eLmkqOsrvt3ukVo9RM+c2vDBoz8/l0nxUtQ5G0l?=
 =?us-ascii?Q?aO0FNe2UelKDJTFTy9MefISaaUl9eN5vCuZX7UiqWcxRdw3I4siqcmHYnApa?=
 =?us-ascii?Q?qXp2a+TC3nzNJWd9f6+67SzTlKS1y1cutNoE1ny5bOE06QBhdXHm/RuV7s7n?=
 =?us-ascii?Q?MGIDarGED4181++pLKl9KP3DOc8pUAzumdTzXKO78Twrb9d1sz5LZTpRoWbG?=
 =?us-ascii?Q?XGzaQzEP0PvmQBCAI6nAOpcjAEp3UfYVkeCNReWnbLnzPDaEEkgbl4Phnexk?=
 =?us-ascii?Q?DTFD2G724g2F5x2wM57ELOexJgWCaR+XD8f7O6PKgbQm4+H+ZrmpAiZfGq6e?=
 =?us-ascii?Q?QSa8a9OyFAggyGkfzv7vaUBXCg6iHcUqZwIeBZI0hxtF3T+OsjKC1w2R1GWU?=
 =?us-ascii?Q?hJ6rHvG1qfsSRNCwfq8bDUHJS1SJbC/z7tUo1ARqc2olck0RY+Cc7Ux8ggG3?=
 =?us-ascii?Q?joAy+QglsSpqsWxpS3lcBbMOQJLsT/k9Z01H4i4n5DJgmguoqbQO53mvHLjX?=
 =?us-ascii?Q?1g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22870056-c32f-44e8-201b-08dd3e88cda3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 04:12:24.2472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUEH+j/+g/lp3yE2YhkbG2OCeQnciLX87ro2WOhHf5xgqMTf1hnh1bFG72H8z7ra27WhPt2cn/uzJxAjCOyYBZ2Oq4P2ly190a4ZcAsuMaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5874
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Franco=
is
> Dugast
> Sent: 24 January 2025 05:02 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>
> Subject: [PATCH i-g-t, v2] lib/intel_compute: Use LR mode for compute whe=
n
> using Xe
>=20
> When Xe is used, create the VM in LR mode as this is what the compute UMD
> does to run compute kernels. This makes those tests more representative o=
f
> real world scenarios. A side effect is that user fences must be used.
>=20
> v2: Minimize changes, stick to xe_vm_bind_userptr_async()
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 98 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 81 insertions(+), 17 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> f1520aad4..a7d5d3e0d 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -27,6 +27,7 @@
>  #define SIZE_BATCH			0x1000
>  #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA,
> 0x1000)
>  #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA,
> 0x1000)
> +#define ADDR_SYNC			0x010000ULL
>  #define ADDR_BATCH			0x100000ULL
>  #define ADDR_INPUT			0x200000ULL
>  #define ADDR_OUTPUT			0x300000ULL
> @@ -43,6 +44,8 @@
>  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
>  #define OFFSET_STATE_SIP			0xFFFF0000
>=20
> +#define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> +
>  /*
>   * TGP  - ThreadGroup Preemption
>   * WMTP - Walker Mid Thread Preemption
> @@ -58,6 +61,10 @@ struct bo_dict_entry {
>  	uint32_t handle;
>  };
>=20
> +struct bo_sync {
> +	uint64_t sync;
> +};
> +
>  struct bo_execenv {
>  	int fd;
>  	enum intel_driver driver;
> @@ -81,7 +88,7 @@ static void bo_execenv_create(int fd, struct bo_execenv
> *execenv,
>  	execenv->driver =3D get_intel_driver(fd);
>=20
>  	if (execenv->driver =3D=3D INTEL_DRIVER_XE) {
> -		execenv->vm =3D xe_vm_create(fd, 0, 0);
> +		execenv->vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>=20
>  		if (eci) {
>  			execenv->exec_queue =3D xe_exec_queue_create(fd,
> execenv->vm, @@ -107,8 +114,8 @@ static void bo_execenv_destroy(struct
> bo_execenv *execenv)
>  	igt_assert(execenv);
>=20
>  	if (execenv->driver =3D=3D INTEL_DRIVER_XE) {
> -		xe_vm_destroy(execenv->fd, execenv->vm);
>  		xe_exec_queue_destroy(execenv->fd, execenv->exec_queue);
> +		xe_vm_destroy(execenv->fd, execenv->vm);
>  	}
>  }
>=20
> @@ -119,18 +126,30 @@ static void bo_execenv_bind(struct bo_execenv
> *execenv,
>=20
>  	if (execenv->driver =3D=3D INTEL_DRIVER_XE) {
>  		uint32_t vm =3D execenv->vm;
> +		uint32_t exec_queue =3D execenv->exec_queue;
>  		uint64_t alignment =3D xe_get_default_alignment(fd);
> -		struct drm_xe_sync sync =3D { 0 };
> -
> -		sync.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ;
> -		sync.flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync.handle =3D syncobj_create(fd, 0);
> +		struct bo_sync *bo_sync;
> +		size_t bo_size =3D sizeof(*bo_sync);
> +		uint32_t bo =3D 0;
> +		struct drm_xe_sync sync =3D {
> +			.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value =3D USER_FENCE_VALUE,
> +		};
> +
> +		bo_size =3D xe_bb_size(fd, bo_size);
> +		bo =3D xe_bo_create(fd, execenv->vm, bo_size,
> vram_if_possible(fd, 0),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		bo_sync =3D xe_bo_map(fd, bo, bo_size);
> +		sync.addr =3D to_user_pointer(&bo_sync->sync);
>=20
>  		for (int i =3D 0; i < entries; i++) {
> +			bo_sync->sync =3D 0;
>  			bo_dict[i].data =3D aligned_alloc(alignment,
> bo_dict[i].size);
>  			xe_vm_bind_userptr_async(fd, vm, 0,
> to_user_pointer(bo_dict[i].data),
>  						 bo_dict[i].addr,
> bo_dict[i].size, &sync, 1);
> -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0,
> NULL);
> +			xe_wait_ufence(fd, &bo_sync->sync,
> USER_FENCE_VALUE, exec_queue,
> +				       NSEC_PER_SEC);
>  			memset(bo_dict[i].data, 0, bo_dict[i].size);
>=20
>  			igt_debug("[i: %2d name: %20s] data: %p, addr:
> %16llx, size: %llx\n", @@ -139,7 +158,8 @@ static void
> bo_execenv_bind(struct bo_execenv *execenv,
>  				  (long long)bo_dict[i].size);
>  		}
>=20
> -		syncobj_destroy(fd, sync.handle);
> +		munmap(bo_sync, bo_size);
> +		gem_close(fd, bo);
>  	} else {
>  		struct drm_i915_gem_execbuffer2 *execbuf =3D &execenv-
> >execbuf;
>  		struct drm_i915_gem_exec_object2 *obj; @@ -177,19
> +197,32 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
>=20
>  	if (execenv->driver =3D=3D INTEL_DRIVER_XE) {
>  		uint32_t vm =3D execenv->vm;
> -		struct drm_xe_sync sync =3D { 0 };
> -
> -		sync.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ;
> -		sync.flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync.handle =3D syncobj_create(fd, 0);
> +		uint32_t exec_queue =3D execenv->exec_queue;
> +		struct bo_sync *bo_sync;
> +		size_t bo_size =3D sizeof(*bo_sync);
> +		uint32_t bo =3D 0;
> +		struct drm_xe_sync sync =3D {
> +			.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value =3D USER_FENCE_VALUE,
> +		};
> +
> +		bo_size =3D xe_bb_size(fd, bo_size);
> +		bo =3D xe_bo_create(fd, execenv->vm, bo_size,
> vram_if_possible(fd, 0),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		bo_sync =3D xe_bo_map(fd, bo, bo_size);
> +		sync.addr =3D to_user_pointer(&bo_sync->sync);
>=20
>  		for (int i =3D 0; i < entries; i++) {
> +			bo_sync->sync =3D 0;
>  			xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr,
> bo_dict[i].size, &sync, 1);
> -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0,
> NULL);
> +			xe_wait_ufence(fd, &bo_sync->sync,
> USER_FENCE_VALUE, exec_queue,
> +				       NSEC_PER_SEC);
>  			free(bo_dict[i].data);
>  		}
>=20
> -		syncobj_destroy(fd, sync.handle);
> +		munmap(bo_sync, bo_size);
> +		gem_close(fd, bo);
>  	} else {
>  		for (int i =3D 0; i < entries; i++) {
>  			gem_close(fd, bo_dict[i].handle);
> @@ -204,7 +237,38 @@ static void bo_execenv_exec(struct bo_execenv
> *execenv, uint64_t start_addr)
>  	int fd =3D execenv->fd;
>=20
>  	if (execenv->driver =3D=3D INTEL_DRIVER_XE) {
> -		xe_exec_wait(fd, execenv->exec_queue, start_addr);
> +		uint32_t exec_queue =3D execenv->exec_queue;
> +		struct bo_sync *bo_sync;
> +		size_t bo_size =3D sizeof(*bo_sync);
> +		uint32_t bo =3D 0;
> +		struct drm_xe_sync sync =3D {
> +			.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value =3D USER_FENCE_VALUE,
> +		};
> +		struct drm_xe_exec exec =3D {
> +			.num_batch_buffer =3D 1,
> +			.num_syncs =3D 1,
> +			.syncs =3D to_user_pointer(&sync),
> +			.exec_queue_id =3D exec_queue,
> +			.address =3D start_addr,
> +		};
> +
> +		bo_size =3D xe_bb_size(fd, bo_size);
> +		bo =3D xe_bo_create(fd, execenv->vm, bo_size,
> vram_if_possible(fd, 0),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		bo_sync =3D xe_bo_map(fd, bo, bo_size);
> +		sync.addr =3D to_user_pointer(&bo_sync->sync);
> +		xe_vm_bind_async(fd, execenv->vm, 0, bo, 0, ADDR_SYNC,
> bo_size, &sync, 1);
> +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE,
> exec_queue,
> +NSEC_PER_SEC);
> +
> +		sync.addr =3D ADDR_SYNC;
> +		bo_sync->sync =3D 0;
> +		xe_exec(fd, &exec);
> +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE,
> exec_queue,
> +NSEC_PER_SEC);
> +
> +		munmap(bo_sync, bo_size);
> +		gem_close(fd, bo);
>  	} else {
>  		struct drm_i915_gem_execbuffer2 *execbuf =3D &execenv-
> >execbuf;
>  		struct drm_i915_gem_exec_object2 *obj =3D execenv->obj;
> --
> 2.43.0

All functions use bo_execenv_exec except xe2lpg_compute_preempt_exec where =
it uses xe_exec_sync and wait independently. So, that also needs to be upda=
ted. Until this it looks good.
Please check if xe_compute_preempt@compute-preempt passes with this change =
or not before merging.
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

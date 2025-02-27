Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBBEC021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 09:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0043B10EA65;
	Thu, 27 Feb 2025 09:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwg2a6h3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5790310EA65
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740646808; x=1772182808;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=evCzdDNE2Oex57xFWKIn7xGplIWBLHOKLGj69/aLZGE=;
 b=hwg2a6h3Jije4XKCxkvrfUnEYGkTKNXk1JXxP09ItWMiEGDjsvOWFIhK
 kzK6Gz9TvjM4p6U3Mcqa4XgiwtMXyfQxzHAOBdSqPnSO/dv0z90X+cmIB
 p2wd6DZ2QNI6qix1JOZP+QK7JaGHDNcW+ECI215pMFleu89TDfXAJSACq
 GC6zwGdH3WSdGMQqG0pThfe9ZU5kdYdGfc4EVkzGz5+eoLPwYR10kRBnf
 aGJnJJ7QvLMoRHcbZLYhafj9ya/Fmvehdeqbwx9rQicYFXUmECljGoa6e
 N81iYYOzX884+nbUpFSE11sThlgvid91zKm54PNLJ7/ddDTursv+7motQ w==;
X-CSE-ConnectionGUID: Ljh/NFdsSxWCgqgRKCFFuQ==
X-CSE-MsgGUID: gDUnnJr7TIqDdtIf7tCsrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45439145"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="45439145"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 01:00:08 -0800
X-CSE-ConnectionGUID: O6JyMz0GQCOwsLHE+licHw==
X-CSE-MsgGUID: uW6teMYrRquDWsiLJCteeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="116755806"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 01:00:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Feb 2025 01:00:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 01:00:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 01:00:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxFYNpiMXkNEa7AmSAhFxRVZk2ORbTx9xPlJfEfXUHvgcTSgfWx7jLmH8HdUIY2NwaV2B6cpqKdawS5J15C8bEafBaVxdD0R0E9Hmw+lwOuybKKcwaoBGFG1o2wKnK61SNbAVki210rahVvRHPTODazj5v/s1/HHQxb70l70RsqNoYmv51NNH2ZPua4z4eHDQNeNgt3I0/ZdMalr86npeNSHBvUbrDHU89xOGDu3S0/gTIDoYoMbEBd6x2iKhj+SzQ7oSK/T1AZc1TZ01P7ZOXT/oVJkkdtgkxidVtFId4lvct0Z3bBcyaWsfUkXowk37hGYpYK9nBoIyDnidMnxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFRwg7aYYnZSx5hZXaLRYj6SzHveeXH0zv3XI/bTJRo=;
 b=hxW2KEiCNn+x8UE3PPEnReRGnwks1v63woIohPg5GAvIMo7HusYO8REhwtTZqHJl6Xmbav9pp/W35hQGD8Tc3jB2V6HYGe2jiz1TNMevy4k/ht19hO9rkKi4w+z5ikkRiyhlumNnDeRiHRRDG2jiOJ1zpfZLTqFyaC0MkcIeVCc3qcT5jveVOnyuGbBtVpS+M3NR0XuUe44KmIT7ine2ogc+fDDCC8UYp1Vkn7NzJQAbVP8nf3PPbE0HKF6dWkPMi4UhXAHcfEM6wqO1fxdSTMgrtVABcCVEuPmFS/5juXMQk//ld7J652MMPes97HXGGdOjSrxvN5WXzMk3lC2pDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 08:59:31 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 08:59:31 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast,
 Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Topic: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Index: AQHbh1ZWc/A4H9SLIU2kRbpVgexz57NaomyAgAACrpCAACztAIAACq/A
Date: Thu, 27 Feb 2025 08:59:31 +0000
Message-ID: <BL1PR11MB5525FC2C5BA57E509AA14B7484CD2@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250225073404.252344-1-pravalika.gurram@intel.com>
 <CH3PR11MB8434BAAA2CE8B88FC97235FB8DCD2@CH3PR11MB8434.namprd11.prod.outlook.com>
 <BL1PR11MB552526A1E5734FC54C7E18C684CD2@BL1PR11MB5525.namprd11.prod.outlook.com>
 <CH3PR11MB8434581BD8A933721B0971898DCD2@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434581BD8A933721B0971898DCD2@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH0PR11MB4901:EE_
x-ms-office365-filtering-correlation-id: 403ff6a4-a860-4801-9650-08dd570d0c69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?QiY5PFdKeKHjneq7NDvyv9jpI9ug9I9g7gIyMGt6L1NcvKuFUBDEM/J3B/E1?=
 =?us-ascii?Q?INtVP3b1bp4gMHp5l6N3RjodUV6iCMTvkIOMwNluMTBesRbCMQZL51NC0yum?=
 =?us-ascii?Q?YvZH4KZkx9vQ6B9ehNtIqG+Tt0rYaKGPnCN79wlmuuH2jS2bD/F+c1X6JVUH?=
 =?us-ascii?Q?m4+hPSsbzNzapc0bYkb7uFGkLmsHYkQKbfn65c5vkciFyCtuZINMITEJbv+o?=
 =?us-ascii?Q?/KY8u0hqPpsr9hHWpaZcFW+0OXsSqK23MtbG882YukI1bdUlcu2Kd6GtYAyi?=
 =?us-ascii?Q?yXkUCJt/6KUeQbQulIfNe5rMmwBOk3fD+dH5pD61YTTVKN+BgmVjLSTPQOdD?=
 =?us-ascii?Q?nM0c0nD26dfUOZCTAPrt7Tr1cwYj4opZXu4p3VIk5MMonASk7IrlrHCXt4XY?=
 =?us-ascii?Q?rLqtHvcbBDuTg8ATU0d6NoEVznvVHaR5EYSrhExYPA8yPk8UGgiHdmOSSCVR?=
 =?us-ascii?Q?GK3TuNCdOHSpzlF04NoiCTXIsJIvoaNJGDmWQP9gz8kRuVIsCBR4buj+zx0n?=
 =?us-ascii?Q?54D3O8TyHFdYf9ZHdP8BenhFM4RKogBFYxCCOUQDy9M3/TaoM55luX50soap?=
 =?us-ascii?Q?UnEXmYUO+oBIfkKPusMeQ7QDQqcXzlFDTz8th8pTN3UVp5aiqqslQ9Q+wDpG?=
 =?us-ascii?Q?lsnm+Ixmacc5Bni4946UggJaqHHPoi5pV7tozCN3HzmNK8FY8BocfZHMGXjg?=
 =?us-ascii?Q?92WGJSgc15m1ypiDvMACEAOXzNADqOQetlrWTChs0vQrCwxL6YRNeMHearaK?=
 =?us-ascii?Q?g9koaQYfl+RH+DFBoa+idBMkjq+O71vLzyu4oNy21Wv82tNb415GbK4NPD3G?=
 =?us-ascii?Q?cojXNlYcX1YSM4s79PpZVY/meJBmcks3DT+tUfguv9waYU3Fe6XWGdnHuuJD?=
 =?us-ascii?Q?HadurO5l6TorvnpjMdgGaA9CrT+DOIe7x6c7Nbrit49qGrhBAh3zKyoI7b86?=
 =?us-ascii?Q?QSoiOI5uNr0Po1FpJEqxKT/FwI4yBOLjC4Fael1MqucuMx8ewlIsA2XkCzbz?=
 =?us-ascii?Q?+JgG1qb5/6PpSOE1EK2aH02MWkMOdL1V+WgLI75vRo1rJma36IeLkoKuYext?=
 =?us-ascii?Q?Ojvn/Ohgb70C9g1bTC+/sVuYY/gOcjZ4FBT0vWUvH4M6MIQdQcAMkg4Y+SzM?=
 =?us-ascii?Q?BfvbbYrrIiqm5Urt00MmYJo9vyW1/ZIFbLkMfc0IO+Q5SzlJohvLQEG676nF?=
 =?us-ascii?Q?fxD0RoC8FJmdYzEgjMKGk12IVU5RQx/9PvS3hBeOP2HRBasCkG2FdXRNa/wz?=
 =?us-ascii?Q?m6DXnK8mXzoP7DRR1eJ1BKU+BavTHRT0TnwZItPsXINrUkQg1cyywMPgEfwJ?=
 =?us-ascii?Q?Fp7406nPx1czW2WR8oTMJBLJU7Lz3wSLDCkk6mZAvviB9hLc0hpDYujxRwQH?=
 =?us-ascii?Q?lFiUT5m47rC9Hm3E4VSJTiB1cJ+1Q45xY46WQ19jCXUdtjon5GRSwoj1XXPE?=
 =?us-ascii?Q?LTqVTKoFyWwDWyGkOVsvF8EsYxFXQRDU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qJbucvPd/E1bpgu2wda3Fg2XMu9B9ht3ZCxNFw7sCE4Ys3yTIuA2xNdIW/Of?=
 =?us-ascii?Q?AUm7tYwuOw2YtDZLTXSzv6hZK408nZe4APSRZ2uEDxFIMmjNCKM/oq5Jz/Dl?=
 =?us-ascii?Q?1T9zn6CI3o4bTl22UiwUt2Ur47YSZ+3LlVCeIWxx4AMHOQgCXA2RVhKEDiGe?=
 =?us-ascii?Q?sjfyRkK5MRVJC1fAUbF7Bir6rr7d/gzkgi3PlBocnuGjNyS/pE4WfanC795Q?=
 =?us-ascii?Q?FXoUuMVCfufwvSTbYzUDpV27BClS8XowFTXgIq4+98ukQEhbCdcc7Bh6Wp6Y?=
 =?us-ascii?Q?KB7/FHzDV9QehtU507ab1HFHA9uvJixHJ0NrS9e1O3ylLqYgemcqLhk51sMs?=
 =?us-ascii?Q?okfkpssvIYaU9Hf0EK5cKxHkIGCMICTYwbw2p0mCUMmeLSMupyc8Pqk25FB1?=
 =?us-ascii?Q?2xz+MH5fynQVxDHj9p1Arz13DtFZgBduC+kRD5u3NTOo+G0zvOr6L8UN87OD?=
 =?us-ascii?Q?xFVEO7ppGaN6BIxb+eAcx0ZEj4pABYrn1nvHBrrCYzrp+HcQ732WUgLmBksi?=
 =?us-ascii?Q?giAjNGWYD9RVoW0jJbUuj6vtaq3wOWFSSsVZrI5MbWRNWwh5GxxRZ6Qzw9uR?=
 =?us-ascii?Q?HRB6/JUnabcCatjUVAFLiyDKUk0euzhDfDoBcqgt9B8FO1hUhXEECzM6A60D?=
 =?us-ascii?Q?LQAE4bP53vszt9v+0qQTISPxrRu23FcQMNwXH/bEwY+o++hZw2Q4RGUz9DVV?=
 =?us-ascii?Q?QXHi8kcbGa8KjpCr5+9V7PbRWDzjR/uASC9xo6e1t1bOb+eLPuML+X84xBKF?=
 =?us-ascii?Q?Nti/t8iep+iskkGG9zYOEtjqcO4fYrq6pXHS5Ady2xj2B5tsAZU5Cm7P7XtC?=
 =?us-ascii?Q?57WSNSWuin4lrYUAs7J7wJmlCBt9k7BdlPgDcF66nF263nvx/iVK7RGbKJPj?=
 =?us-ascii?Q?LTIU8uQXMSuBzCoF5Vuc9bvNMz5n8aDyh/eCxAJaVqHA4pnxN6AHNvngFUu6?=
 =?us-ascii?Q?qMmoeSChWnkXp/PrWZE3tyeLsO1TbRzgB1GhJnsgaeRt2JYgxe73Cgt1o8rc?=
 =?us-ascii?Q?DUgtUQkJVtsneStRZwHJGfZUyvsh8X7DdG8vpPthwpX/iw5Uyo7u5Cr5rhQ7?=
 =?us-ascii?Q?i8MVaq5f0LrPRoIpQxrjHs5s5XzFZU2H4bWbrfR+AnFOlXV0l1cd52H4djN3?=
 =?us-ascii?Q?0fJt4k4MkXQ1pK6vmwPPyllu6dBVL1pLpSTY5Oma7UScERBTLMv4K0VAPyuv?=
 =?us-ascii?Q?0bZoAaBbQpPC27buGeEPMsWtlCjZse3edhybpvZdW0sWLxq8/NIVLeDEkTk8?=
 =?us-ascii?Q?bpFpmXAhuJ8bwh+5aRIEJIrC6XrYmAJD0vQZ6KyCQJ/fbzME3YzHbL4mG2Wp?=
 =?us-ascii?Q?n+Is30xm1fO5yACd8KnA5z6g3lU9dYJWcX8XasHmgX6Hk/V+57v/c/eb72Io?=
 =?us-ascii?Q?STxI330Z2fWeFlRT1enADlozyl8iR2VzX44L0Dh+fJURJKENxpRkorw+GCMe?=
 =?us-ascii?Q?+GyKB5DQhG6j1jdFnypX4z56MMhTcN6w1IUQhZkCATNhR67Ae9huOw65Ui3Z?=
 =?us-ascii?Q?CTakWDep/5LRwagAruKICNMtvuP01sayVxIrajUkXQZxqIZ1W01Ks8u66bwf?=
 =?us-ascii?Q?T/djXtmZIj6ZRF8gMFRIR+SYbMyq7CuarE2pqC3KLZlkuija7qlmXEVf+QQa?=
 =?us-ascii?Q?EA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403ff6a4-a860-4801-9650-08dd570d0c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 08:59:31.0733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NlqO4pCbmJf4AHYEJRsX58lBi0EqaPphi1XX+kL4BC40QlRZcL6xFiEdQV0DAN4MfLBmBeIuUUh7vzz1es/s2fsdhw+hc4V9hSjeIJNYpcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Thursday, February 27, 2025 1:50 PM
> To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
> dev@lists.freedesktop.org; Dugast, Francois <francois.dugast@intel.com>
> Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject errors dur=
ing
> exec queue create IOCTL
>=20
>=20
>=20
> > -----Original Message-----
> > From: Gurram, Pravalika <pravalika.gurram@intel.com>
> > Sent: 27 February 2025 11:14 AM
> > To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; igt-
> > dev@lists.freedesktop.org; Dugast, Francois
> > <francois.dugast@intel.com>
> > Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject errors
> > during exec queue create IOCTL
> >
> >
> >
> > > -----Original Message-----
> > > From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > > Sent: Thursday, February 27, 2025 10:59 AM
> > > To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
> > > dev@lists.freedesktop.org; Dugast, Francois
> > > <francois.dugast@intel.com>
> > > Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
> > > Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject
> > > errors during exec queue create IOCTL
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > > Pravalika Gurram
> > > > Sent: 25 February 2025 01:04 PM
> > > > To: igt-dev@lists.freedesktop.org; Dugast, Francois
> > > > <francois.dugast@intel.com>
> > > > Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
> > > > Subject: [PATCH v3] tests/intel/xe_fault_injection: Inject errors
> > > > during exec queue create IOCTL
> > > >
> > > > Use the fault injection infrastructure to make targeted internal
> > > > KMD functions fail when executing xe_exec_queue_create_ioctl() so
> > > > that more code paths are tested, such as error handling and unwindi=
ng.
> > > > include xe_exec_queue_create_bind only for VM_BIND engine class.
> > > > xe_exec_queue_destroy_ioctl() and
> > > > xe_exec_queue_get_property_ioctl() are not considered as there is
> > > > no unwinding code to test with fault injection.
> > > >
> > > > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > > > ---
> > > >  tests/intel/xe_fault_injection.c | 50
> > > > ++++++++++++++++++++++++++++++++
> > > >  1 file changed, 50 insertions(+)
> > > >
> > > > diff --git a/tests/intel/xe_fault_injection.c
> > > > b/tests/intel/xe_fault_injection.c
> > > > index 7ae941367..f25ad9b27 100644
> > > > --- a/tests/intel/xe_fault_injection.c
> > > > +++ b/tests/intel/xe_fault_injection.c
> > > > @@ -185,6 +185,37 @@ inject_fault_probe(int fd, char pci_slot[],
> > > > const char
> > > > function_name[])
> > > >  	injection_list_do(INJECTION_LIST_REMOVE, function_name);  }
> > > >
> > > > +/**
> > > > + * SUBTEST: exec-queue-create-fail-%s
> > > > + * Description: inject an error in function %arg[1] used in exec
> > > > +queue create IOCTL to make it fail
> > > > + * Functionality: fault
> > > > + *
> > > > + * arg[1]:
> > > > + * @xe_exec_queue_create:                 xe_exec_queue_create
> > > > + * @xe_hw_engine_group_add_exec_queue:
> > > > xe_hw_engine_group_add_exec_queue
> > > > + * @xe_vm_add_compute_exec_queue:
> > > > xe_vm_add_compute_exec_queue
> > > > + * @xe_exec_queue_create_bind:
> xe_exec_queue_create_bind
> > > > + */
> > > > +static void
> > > > +exec_queue_create_fail(int fd, struct
> > > > +drm_xe_engine_class_instance
> > > > *instance,
> > > > +		const char function_name[], unsigned int flags) {
> > > > +	uint32_t exec_queue_id;
> > > > +	uint32_t vm =3D xe_vm_create(fd, flags, 0);
> > > > +	/* sanity check */
> > > > +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> > > > &exec_queue_id), 0);
> > > > +	xe_exec_queue_destroy(fd, exec_queue_id);
> > > > +
> > > > +	ignore_faults_in_dmesg(function_name);
> > > > +	injection_list_do(INJECTION_LIST_ADD, function_name);
> > > > +	set_retval(function_name, INJECT_ERRNO);
> > > > +	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> > > > &exec_queue_id) !=3D 0);
> > > > +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> > > > +
> > > > +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> > > > &exec_queue_id), 0);
> > > > +	xe_exec_queue_destroy(fd, exec_queue_id); }
> > > > +
> > > >  static int
> > > >  simple_vm_create(int fd, unsigned int flags)  { @@ -283,6 +314,7
> > > > @@ vm_bind_fail(int fd, const char function_name[])  igt_main  {
> > > >  	int fd;
> > > > +	struct drm_xe_engine_class_instance *hwe;
> > > >  	char pci_slot[NAME_MAX];
> > > >  	const struct section {
> > > >  		const char *name;
> > > > @@ -318,6 +350,14 @@ igt_main
> > > >  		{ }
> > > >  	};
> > > >
> > > > +	const struct section exec_queue_create_fail_functions[] =3D {
> > > > +		{ "xe_exec_queue_create", 0 },
> > > > +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> > > > +		{ "xe_vm_add_compute_exec_queue",
> > > > DRM_XE_VM_CREATE_FLAG_LR_MODE },
> > > > +		{ "xe_exec_queue_create_bind", 0 },
> > > > +		{ }
> > > > +	};
> > > > +
> > > >  	igt_fixture {
> > > >  		igt_require(fail_function_injection_enabled());
> > > >  		fd =3D drm_open_driver(DRIVER_XE); @@ -333,6 +373,16 @@
> igt_main
> > > >  		igt_subtest_f("vm-bind-fail-%s", s->name)
> > > >  			vm_bind_fail(fd, s->name);
> > > >
> > > > +	for (const struct section *s =3D exec_queue_create_fail_functions=
;
> > > > +s-
> > > > >name; s++)
> > > > +		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> > > > +			xe_for_each_engine(fd, hwe) {
> > > > +				if (hwe->engine_class =3D=3D
> > > > DRM_XE_ENGINE_CLASS_VM_BIND &&
> > > > +						strcmp(s->name,
> > > > "xe_exec_queue_create_bind"))
> > > > +					exec_queue_create_fail(fd, hwe,
> > > > s[3].name, s[3].flags);
> > > > +				else if (strcmp(s->name,
> > > > "xe_exec_queue_create_bind"))
> > > > +					exec_queue_create_fail(fd, hwe, s-
> > > > >name, s->flags);
> > > In either if-else case you are trying to validate only for
> > > xe_exec_queue_create_bind out of all the list, what about the others
> > > {"xe_exec_queue_create", 0 },
> > > +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> > > +		{ "xe_vm_add_compute_exec_queue",
> > > DRM_XE_VM_CREATE_FLAG_LR_MODE },
> > > these are not considered at all. Can you check this once.
> > xe_exec_queue_create_bind is needed only for VM_BIND instance in
> > kernel this is covered in if and else in kernel
> >
> > The remaining functions are needed for other engine instances. Hence
> > excluding the VM_BIND instance for other functions
> But both the if-else condition work for only xe_exec_queue_create_bind,
> others are not covered.
else if (strcmp(s->name, "xe_exec_queue_create_bind"))=20
this else condition for other functions
strcmp will return 0 for " xe_exec_queue_create_bind" so for remaining this=
 case will be true=20
> > > > +
> > > > +
> > > >  	igt_fixture {
> > > >  		xe_sysfs_driver_do(fd, pci_slot,
> > > XE_SYSFS_DRIVER_UNBIND);
> > > >  	}
> > > > --
> > > > 2.34.1


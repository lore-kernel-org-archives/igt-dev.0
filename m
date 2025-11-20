Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C9ECF8553
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 08:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD0910E1B5;
	Thu, 20 Nov 2025 08:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSZXzC7z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C4810E1B5
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763626932; x=1795162932;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qyxY4moQWP2RXs7weql44VuN5XSMZoYLPOHZncpwYdA=;
 b=aSZXzC7z2DsXhw1lGtAX8hcxdEB03fxRYWHDrhJ2xmcOinZvqgcw49UC
 dyKdvppyyHNivgAN4yl5kF80vCQDbMJ664OYaraM+a62LVUrRUnvZpTn+
 QrrMctgRWyBTKxjNgEK95bDo+yCYpCN/9NRzKiNr5kOgm8pVTaBy9T5d1
 GYrwGbnmZgfo8SqiZSJrHtULT9zd4uAyhuXe7AY+CBrLi3BknpMDBD2c4
 53XjdRTOsyKX+3qG96qvsfkCE3muF8pVQFCpGeHcUJ/mH+SolEvsgXJO9
 DMw9bwx9EV336B1qB47HdIn94bLH0jhpipNFOa8lX+sL2f301GU4dRIhz Q==;
X-CSE-ConnectionGUID: UWeJ8lDJTxa8+/hYBF82mg==
X-CSE-MsgGUID: Yrjkr3+ZS3CnvJw9Mgostg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76295872"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="76295872"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 00:22:11 -0800
X-CSE-ConnectionGUID: jWnJBRKNRPu2lFG3RSRPQg==
X-CSE-MsgGUID: Ono0YkaZR1OCH06HvcsAMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="190572343"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 00:22:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 00:22:10 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 00:22:10 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 00:22:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkiAHtwq+ouuuIzUierkFhZxwdXsZBiU2tlqJztWrdEvCZS13Gi4pjQdX3TXDJ3x1wEcPVD8rOnuVdl/oQILZhNvqhisEBvXTvzbAnva7oJeCSH9r/oYzGpt67F1YhWVueALznRAq72yVhlfKuXBE3tBJKZS82pJok+z29LEQmpCx/aW9D/reTnd6Z3oROU5GZTMnJBEYgX0sZ7O2Y8gb3EfLDtrfJbczmRfxgthGJIxerhXDYAuEugLVQc23Z3KLElEdHXV0OPIr3e/tWJe0r7uTRCVhGQKb6iuEQ0AQZYYYVlwWrN89eFDpVJeDDcgRnwJf4cxO0Xi0iOlxW2pUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CRQcr5y93Ydpo8jU4tdBWBcY/66RHUp7owdSvagc10=;
 b=jIFrcwRyfykPQJGCxYD1BkDZ8Gs7AdfhfbQlz6KNv8tTaW1edHc7RF2nFnjfbUmPTuu1dM1DspSDxoChIz/35k83geVtbvDajctw8HcSiGxVXcqYPHI4xUwKoapJmChnwr23OAJmhpBrsTM5pQ8DksmEJlIZNqtXWU0W3g5VD2sWFtKrD0FjLJqXZrbnVceE5ayUWQTn18qgoKMue9DQGM3woZpo0M5KDCXhj8Bnh741nssFxFUkdfCKWrriIC+JmrgHgIa8+z063ZIl38gHotvBeyRlGwXqhBN56I8l7FsVelmZJt0QSa6n7shD6qaUdogj/8AK7hpIgpVvHfpEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:22:02 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:22:01 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t v2 6/9] tests/kms_writeback: Add utility function
 for shared logic
Thread-Topic: [PATCH i-g-t v2 6/9] tests/kms_writeback: Add utility function
 for shared logic
Thread-Index: AQHcVHksoykabW5qZ0OP4DrFjQwmcLT4KnWAgAMY6TA=
Date: Thu, 20 Nov 2025 08:22:01 +0000
Message-ID: <PH7PR11MB6796412D74AB32CCDBC392DAE5D4A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
 <20251113085801.3088957-7-sowmiya.s@intel.com>
 <PH7PR11MB6053FE73A7043A4F3CA0BB4FE7D6A@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6053FE73A7043A4F3CA0BB4FE7D6A@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|CH3PR11MB7865:EE_
x-ms-office365-filtering-correlation-id: 8862b3b2-d792-4e4b-1480-08de280de1a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?90dq2Jr4SuwDiLFt6m4y3JbvUeopqKNg2CNeZmrl9T9V2eehutp7rVYTjoX5?=
 =?us-ascii?Q?X7OhJrE/0GxX2AZyhDZ8pxuFM5p8E90L/ZWM0L0JqjObS3TULv30y0FT54QG?=
 =?us-ascii?Q?jU0W5aseOQJanKaZCLmk64N/IVxl90rFjDLYS38Vh62cGuJw2R153qWeD29i?=
 =?us-ascii?Q?He29+P1VspxY7Orvn4ftgHX6wUtJxQecUxIZmaXxNinUwIPeCjflyNOGZWB4?=
 =?us-ascii?Q?izNoUz+XQ27SRZj62InjjSeDUP32Ab9WRjpcDxoN53j2nn0h2ir8/x9Gs9zc?=
 =?us-ascii?Q?2/Ffq0cR5sdxmahzXsHe2qLeZ9XRfTZxdaUAIhBRppAOY9T3J26fFqYzPA3p?=
 =?us-ascii?Q?OjcehhR7cfXWr72R+0uaBXBtHaY9qXza4XqXR+pkVWVV6aMnprFkK1UGUAE2?=
 =?us-ascii?Q?xOZMQWw16lGFslrI/ib8nTY6c5YxxkwHOvVbD00MfXOrRMrZGlBh8Ojv2qEG?=
 =?us-ascii?Q?1x2jSuG/+sUHRTymVK8MKG+HQHsjvR5tSdXPjIemvQRXWP2K2F+NvO1rqjIC?=
 =?us-ascii?Q?aa787zkParkmkM//qTuG6RjC9fOPyVajgEdHVHS/3jymUWJPllXY6FK9M0Ki?=
 =?us-ascii?Q?uRl2dGRj/RANY29nqZAkoZ++GFxJuJSUuIwjnlT9vyjkj36HsI+Kn79+K+gB?=
 =?us-ascii?Q?mPE3RksnRQmgNC+cspT0jumSwoOPSZZIjxbJyH8FhzKsH3F4DlNi1teVKTe/?=
 =?us-ascii?Q?2B1rES2pSFjnIelidAsFBd6djLAw4CxhSYfSag2ik/EcFMuaFl5OVzF2IF2A?=
 =?us-ascii?Q?ZKw083AuibTlvM1G2QOaf3k5/YAzCqE1AHctq6XUEtRrNkNiR0MaUqEqbOe7?=
 =?us-ascii?Q?qCxYnnZS5WtVkxS4Lu8aFcLa9AuddIMQjT0j00iYfA4RjfJRn7iI2BZ8bHoJ?=
 =?us-ascii?Q?lOnxFKHcQKlK5wvjJT16qP78uIuamjXiYyxYlkclsF5qz+QNy4yLqjn9mR4k?=
 =?us-ascii?Q?oZYqqWA743+cQIJ5lHm349w1NdZAZ7WDK0nQ8At/sAghOtNW8u4hYmPUHwaP?=
 =?us-ascii?Q?l6/IWDDv4XjKChcF6iT9bjttciCIi/63AKIQ0gcxt13wyfsx/d460cteillK?=
 =?us-ascii?Q?kfm8ugL/gzZ28ecsWB6YeGZZkIPQPMZb9Srbxiatq6lKHRLyxyMWi28qZhs7?=
 =?us-ascii?Q?pg5cq8An0g8KEeSHADZ4ivcEPoYCkZC63/sKUdFI7VdhzyrLBlhfqPnR7AAr?=
 =?us-ascii?Q?rwT8MKiv4YmSwUkNASHQYz92l5mbu7QxzmmUYBtdQ9ZQvJAV+us+TcG7pnC1?=
 =?us-ascii?Q?C43wQK/aNi5hsz8BpwCCzkMVgTCwrPDdAdbabukzNNlUC/wThMIe6I5jc6XU?=
 =?us-ascii?Q?i7km0mV2iPGGWlHFX68yDXDzijhYCnljoo24DsDptwJc8G9/IeaJI37Vb83X?=
 =?us-ascii?Q?6l5fQ+1bEAtKm4r4FVK2JyHUpuqwDPM6q28C3eUw4+0iSWnWMlpgVH0RT1Ih?=
 =?us-ascii?Q?29ymh6kd84QNcH/d0R/O8nRKFc9efP3FNlb4NIjRss7xqsvxBgcFRXZLwisj?=
 =?us-ascii?Q?v3RKM+7f448OFYSoH7yqeU89fIzDjE1ZCi+b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ERVV6bP25NvgXum6/FgZE/Wv+5UlfTp1rqq/YLClkMa51QTYmlvQM5HAWoQK?=
 =?us-ascii?Q?V8P48pyNcPraHwChsbqkFl/td9eG1smVIj7Hjn0PliN/WDbcAAsAeBDtvwvX?=
 =?us-ascii?Q?1FEbQXJv3IWid4XSrwjh9B3fprRBAkT0En5mB2wB/eTHnqJpLVATiZdj8AkM?=
 =?us-ascii?Q?01ZrH3H1rTqsD+9l8H8JBlZpqqBwrRQN3o1qZPMkEH1RyD+FiB45HhVBPpRo?=
 =?us-ascii?Q?0Tg2h3JSd4VwZLvAsaoCclAvI5pF2+KJ7FG41jsY8cB1xeAMXv6J2wG1Ibrg?=
 =?us-ascii?Q?UE3N1XgHaQCSZPTy+q3cZhJ2Kk5DnDvkhnr5SG5ceRqxko6jgR8S7BzYZ6Xc?=
 =?us-ascii?Q?rgHTJltYGOf2tpkwLqJkP7mcNzv01GzqyL6tEuphy0Y36eY4PD6JwTouO+Hi?=
 =?us-ascii?Q?5K1XQHv7N1TsRZ3PZ3+unhTvVzcNpKlYd6hC9Sh2ZY777ue2Aa05arTTwhS/?=
 =?us-ascii?Q?kMgS51N/TcONCHfjTWlfhgSPVHKzqQlouIqGHcSVl3M0PWr7J5QXDBI5hOaF?=
 =?us-ascii?Q?oTbM3639AyQbzgVUH/DSOjr5jA7W6azbBJ1Zfse8XNg+9loXp8j1m0RhLdvL?=
 =?us-ascii?Q?Ads/nWxqHRXosE48Yp3ODpUglEnkdv/UEh945VC1l35ZukDqLgVEfjO6PUKa?=
 =?us-ascii?Q?UOMXbIAZ2h7t+OuIvP6ZsazWLpdQOjnviHpo2SlDvQTfn/eyCa9envEKN9g8?=
 =?us-ascii?Q?coh/9jnVUAitZMNfp6nJ7bDQxznZGY7R62f+mIXVnJbbsi3FXGKpYUk8dXQ1?=
 =?us-ascii?Q?6H3hxqQfDs0QDbPqWKmd112LWvRAT3qmz+/gfxIb2T2TeBWOojH0aMUZscwG?=
 =?us-ascii?Q?jSamYSoah7LxX4O9jhzTtI6jVQ/kYbd4YMQU2LuByc80gQwLLUWtUcNN8cm6?=
 =?us-ascii?Q?cnibCSK9TMx14kbDeYwSWFzbK1avyaAmdMCVKnb91Ew/50PORd+nfb9mWSmO?=
 =?us-ascii?Q?DGLCqAUV6K6tlQUVZ2BdMxh3GmyTSTVRYLM9tguPT/YhbusvwZ06Q1fw2iIj?=
 =?us-ascii?Q?aLdTVp5qHaWjpoorg0l6n5dmcnJxcQ2Hdmv1Z2LzZPmee8kvCBrVrKOeYlxV?=
 =?us-ascii?Q?hZqxneV71oMbkfduXZwAnwUltvIGSBRX5rRHJIIbRqlQN/exnITEgadQH3by?=
 =?us-ascii?Q?mKFlgnckFjThn3eAExcsppMJW+3Nb6lJmwr+27jK4eYjuSZ/ceMKbfMIosJg?=
 =?us-ascii?Q?mE6n+w7jD0HxGnKTl47+u4ocRIEmX2a24lamZDYmIii/gyWJc8lWwz/Rr1qW?=
 =?us-ascii?Q?WGB2C4ZA/9/3yKLOuqC9inF2fe8+j+ZhmJCzzKeC2qvSkdthha1ZBBwkFEUt?=
 =?us-ascii?Q?bU+dyxvYGd4LefQ8kMQe2Hmtb4mGrEF6QCAr509ICZ8RrcEcRQbzy4kSpTh0?=
 =?us-ascii?Q?jqlKNOuDra3FfplkBeefxFh7IPeY99zBE8fiylDoXQOJpTHG6yp14qLJPPvt?=
 =?us-ascii?Q?LUhIwIv8r+vJ+w3TqLjeq/hdNazhbTuy/r62IrFfjoAWegRNrqpFaPXMsvXr?=
 =?us-ascii?Q?dunwbFnOGExJKbgxyC0IUtS9ZoxPrW8vLASTQu3vRChaSRNAP4HDUySfWouY?=
 =?us-ascii?Q?LsTjYqjwC/v58G8v/WM1c5CWPun/58gvdZqa9Fd8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8862b3b2-d792-4e4b-1480-08de280de1a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 08:22:01.7906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jbZoz/092QVaxNx5FkNvA1euy2fPk4PyhEu6H1EtiC3rLc4EIT4GweQ4px2yCcKzEbhbjkPyyJJL/if1IO5YoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
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

Hi Pranay,

> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: 18 November 2025 14:30
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: RE: [PATCH i-g-t v2 6/9] tests/kms_writeback: Add utility functi=
on for
> shared logic
>=20
> Hi Sowmiya,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Sowmiya S
> > Sent: Thursday, November 13, 2025 2:28 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> > Subject: [PATCH i-g-t v2 6/9] tests/kms_writeback: Add utility
> > function for shared logic
> >
> > Extracted framebuffer creation logic into a separate function to
> > enable reuse across multiple subtests
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 46fada8b8..d031a9f54 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -508,6 +508,25 @@ static void commit_and_dump_fb(igt_display_t
> > *display, igt_output_t *output, igt
> >  	igt_remove_fb(display->drm_fd, &output_fb);  }
> >
> > +static void create_fbs(igt_display_t *display, igt_fb_t *input_fb,
> > +igt_fb_t
> > *output_fb,
> > +		       uint32_t format, drmModeModeInfo *mode) {
> There is a compilation warning. This function is defined but not used.
> Include the changes where this function is being used.
>=20
This patch depends on patches 8 and 9, as the function defined here is call=
ed in those patches.
> > +	int fb_id;
> > +
> > +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay,
> > +			      mode->vdisplay,
> > +			      format,
> > +			      DRM_FORMAT_MOD_LINEAR,
> > +			      input_fb);
> > +	igt_assert(fb_id >=3D 0);
> > +
> > +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay, mode-
> > >vdisplay,
> > +			      format,
> > +			      DRM_FORMAT_MOD_LINEAR,
> > +			      output_fb);
> > +	igt_assert(fb_id >=3D 0);
> > +}
> > +
> >  static igt_output_t *list_writeback_modes(igt_display_t *display)  {
> >  	for (int i =3D 0; i < display->n_outputs; i++) {
> > --
> > 2.43.0


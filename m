Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049CCC021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 05:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E4510EA47;
	Thu, 27 Feb 2025 05:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mr4Y8JYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC5110EA47
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 05:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740635053; x=1772171053;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vm5+64xNG8bNhEo5A3az/xeN/gM4HNFpMC2qIhbrRFs=;
 b=Mr4Y8JYAbypdVEPFqVaMSjx3tWr+YI/i0Vh+AsGsc9SyOWTU0QVKSay3
 5P/Bh0puK5dOdkJcNSaFsZoZ5p9HjngnSa/4lrAyl+EilbgBV1UC6xEhR
 bJPyxl79mb9YqRVdNDJhsivr+h8k8/X57O3x8Zg8t1d8FIa+CFrgZju7y
 UJ/mqDmWBC0vGPSOoEa5e1uTLEfFThwQo8HcpTb4UHlE+LZ9H2xoQ0VrH
 RV8tWhGu9D5oZXrEpvlfUmA7qSHAWOHgSusMjyGk3zbce6VHMns4Kp1fX
 3iAf8dtgONB1PUznk2Ezp1AMcu4fkMdnPDE4gtMhlHauZ3a4ptc4BMql4 A==;
X-CSE-ConnectionGUID: BXiN98/JRKq6d8s/r1rtRQ==
X-CSE-MsgGUID: stYVhkS+Q2ebGnRf+ch2mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41641016"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41641016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 21:44:10 -0800
X-CSE-ConnectionGUID: i0h5ymkbTwy+BJqcWUit4w==
X-CSE-MsgGUID: 90U4HFS7SM2IAxpPAv2CpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117097601"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 21:44:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 21:44:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 21:44:09 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 21:44:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgbR54HdAhVuQdwGwI0VzCvizOWP8dsxVfsu+IhcWo0ebvuw8KM1zaCSf0kbdpmlh/RiIbmgeUewO0vQCXc9I08CBn90ZGAnXr2w6PyFaAtHlQYSRTgebLPQ6Gw/+ziUtnM+STbYuHGF4weWIrD8DcO9lmHwoFMQ9lULOZZJUlfihj4HFTt4TktUsNTgBGM8+OnT54zcmvI1HeL+C+S2mngi31VMdTHhfnkY8M7rWdC1WxU5NDvNkGM+t8KNvfKuh/+0rIJMBBTnWLkgrZQP1SYc6f6NwLr5E/QHotLGhCi/Ot5K+uqPdMYQXCWBlDXQGES36rANpzFoAVXWy5f3UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=991F/NlPJ34WYiXfq+7cFjcRVKght10r0dXWbZH9BbM=;
 b=aYT2KJ2VMWVNMkBHO2IZlbsMm3Gq9z9djQMlXpnAYWaMr7BjMI2Bw9wVFZOQ88/X1BwCJrLHedBzXBXb5aPSjBD/1uPM6zfxzh1EHjQa6jiJayTe05OlZHbHriPY8i8LPWdJr8sl/Jgq8trhy+Hf0aZ+sgoaaqCEctw9HPLR0b7aNrJZ89aLXuf9hG0+a3zp+CiF/p9RXsWfVluBt85OU6qNM7NXH8HaFMUdbZvoslkIpF2ecSZZVfbKcfLyYLBitct/CZe9NA3fan+WFzTuo47Bt3mIvE3ylFWd1iXr9w0YtcbQ8KSKpsnYYcgNMPm5PAKgAWsXIJW/KAV/m5fnaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SN7PR11MB7138.namprd11.prod.outlook.com (2603:10b6:806:2a1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 05:43:34 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 05:43:33 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast,
 Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Topic: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Index: AQHbh1ZWc/A4H9SLIU2kRbpVgexz57NaomyAgAACrpA=
Date: Thu, 27 Feb 2025 05:43:33 +0000
Message-ID: <BL1PR11MB552526A1E5734FC54C7E18C684CD2@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250225073404.252344-1-pravalika.gurram@intel.com>
 <CH3PR11MB8434BAAA2CE8B88FC97235FB8DCD2@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434BAAA2CE8B88FC97235FB8DCD2@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SN7PR11MB7138:EE_
x-ms-office365-filtering-correlation-id: 58094d94-d434-4bd7-78e6-08dd56f1ac69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FLw+2la8kf/7YUJo447+OhfoF3vUa/htlSxz2RdKrs4dV2h5VlXwZoUwjNPs?=
 =?us-ascii?Q?Kfx7E9kjV0s11UGvO3z1H48bi0R0AOsxK512nyXJP8vH9hfwlDbN8HI9A/1z?=
 =?us-ascii?Q?wyyUPYbXXxqDCS2T/VUJ+aTCCO4xUz43Sb0FtCfuCqb0ZdypvYbGhzPjmn7P?=
 =?us-ascii?Q?+lOE/Fycu55G0u6eRusSONcfyH4UxjR14YvUVhyWUs9EYWDEWvz0OcD87Y6L?=
 =?us-ascii?Q?0uvsVkl0HmQJmZc0jOiFF2HuMflhQw5tIURrEYec5+L/VvCW8dZzjyj8SH+D?=
 =?us-ascii?Q?Xiz6w7jvLdwU7q9RQb8zZYQ8Jk7d2L7gz0pSieqEo33PLA3g2GdI+IwkD4Ph?=
 =?us-ascii?Q?qAgg03tXsh2Lp3HXdklUKQszTJ9zZOFTkjCLBh/fsgFiUXBHVWZLfp507PYc?=
 =?us-ascii?Q?DBDS+lZgP3WmTSmbEx9aL89lole24z2cNfgBaTjuWf8/IPvAfEaW/arGcgC0?=
 =?us-ascii?Q?hxu1Mj6ZSi3XYpZvMq3vHfiFLekopoNRMyNqwaTOiNfrCAhGm9sNWmVXSIzx?=
 =?us-ascii?Q?YMcyy3Bm+nDhy8cj8tnty/loe78N59tccG+eXBjIOb+3F1Q+Mspu7FoYTkLT?=
 =?us-ascii?Q?YK5lSjlkqOLGUTFBn/bCvahcOR1bisrhMYT3OuiYrbM85BE7Tj7HdzPX51vD?=
 =?us-ascii?Q?PE1bhSU1CY3KtdgINZuTQJzDQtldnDKvli6hKYACG2Cx9dzhzuCVjx5lyYoj?=
 =?us-ascii?Q?IRvzPOt4TIalxlFqrMAQlrkYstUJy8dma8ypx6r5Tg+9NY8ieKdmkzLG4Zga?=
 =?us-ascii?Q?y/ZixIO0gG0mQOEpOEfuecnntQRLY8/lI3alflzkbkYR5+hkiX4b0MQ/gYut?=
 =?us-ascii?Q?1XFcvh1H/kTwlNAp6erFByyHkXMpPHbZa6/GMwQ78UqljhjbsgqVLngjnjFG?=
 =?us-ascii?Q?ANchPzo9MUcBCNx/P2xsfEq0JnEExnSSZ5jnnctsFx8prNrJx2LXhAluhbAC?=
 =?us-ascii?Q?XMkYvH3fW5QMXiiw4wudhj2WEhEMTpqL/Hbnn+puIbvJvaYy5QI5Ur19vCEa?=
 =?us-ascii?Q?boyLrDrjwsVCZhHg0Gh8o6t2Z0wOvdXSsN3dQR/Rp6MAa4fY1T7EF1UphJK7?=
 =?us-ascii?Q?CbEsHyaZj1VGPxHVsXTYr/AVteAlEqDkQcDQpc/2m+kAgZ9VoPnUoD3c7gD1?=
 =?us-ascii?Q?d2cBPQQwfwUCnfqYREWl3fDVNaZGpj72rP/Iq0H8ZXzR+ftxDwvNlFdlBrMq?=
 =?us-ascii?Q?lPmrFyJnIrgNd2mzeFreGmJJZXQKa4ycN9zd+eM9kvRi4tb7f4Kw2/XdxKun?=
 =?us-ascii?Q?rlI0rvXUikOmri8ZghGYNucWQxeo005JSc8w9utw892jyYA2U9GuQJ6wuDrl?=
 =?us-ascii?Q?uj3GfdY4MhkKxRlgREjlIw6fbdwVKplO6+eseNr9A5jqB+ybkrOx9oiD2qIA?=
 =?us-ascii?Q?Zkp+tDa+7xJ97Fe6Yb3FCeqgFwXcH8iuxhd0tmVb4k5nUUZQcrVFu75926PT?=
 =?us-ascii?Q?EdZ2OYUDyHy5TPMRsbemPyS+h2Y3JBMu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tJp4Cxl/23TEOdaL+IIWxFZSyL+wDMdAreObVba0u0i9SluKpNl7ddXqRIzu?=
 =?us-ascii?Q?tF22rN/AsgtJI6y2GoO9Xl53K8W3B828eGN4H7Hwaa/KeL/cMNbHt7qLRZye?=
 =?us-ascii?Q?kBeBZf2l9Hj5ed82fCzwRr7LYCkx4zsOxqzLV5nnOkIprvTmMOuvs7oC98cI?=
 =?us-ascii?Q?r21qgT4E6xMhPwxiiajTsn4b3y9PT1TmKPvDY9Rxv84g9dnnsWCy86wFLlTI?=
 =?us-ascii?Q?bLnBtTzuiBaKorZxXOlls5pyUBqkGXFfm3RrVZUT1EUl+MxWG3tAXusdtmLf?=
 =?us-ascii?Q?sPo1bKnZwxJNv+G7PYQVd+xIwvR3vqFX3dGlIsaSdXswILIBQJdyfDdoOomd?=
 =?us-ascii?Q?0warSqD0fK2NU7p19H+74JijJgWLIoZov41t8N4Mlen/z+oBbfnG99nYNBgx?=
 =?us-ascii?Q?LJvz8zBD4e9bkvJ0ft9zJ81Yx4qLEmWn4t09YmD8epKCHoGi9z+1eTk+zFyQ?=
 =?us-ascii?Q?eDsPOpbsCzvhMvLNA2uqjjaKz+j5Twg6ax3745G0MsuWxofTy0dQ2jyuP2bE?=
 =?us-ascii?Q?S27DMHpHWt3T8lmN4bWjh/+TalQPtDM0rsuGbx2JkOT860A8zb2EWGkRVzYi?=
 =?us-ascii?Q?p0rv9ojF+V9EqCJgOxVDcWMV1F8uVjmyG4QFTyHAOBxc1E9o1yvIG+101c/i?=
 =?us-ascii?Q?YBxTl16E2d2letx6tM+8yT7MjHC9zFLWqTRGC9MFR2At6/BVu+2Ykx35PqXn?=
 =?us-ascii?Q?hbOLyFN6r6HQtJwTnK3NOUAaeVkFme69tfsdec2zDNMFivpT40iGubKU8xCz?=
 =?us-ascii?Q?zSxi+7moIKOW/RE5PSKBX8rQaSfGeGSx+oLmfR+R7K3cwBXldYQzZXJlPBoo?=
 =?us-ascii?Q?a3yGt7xcKyLnTXE6C+RULzIIOM7nVu/BEVC5bimSU3rUQl3zr30CRLjcSIqd?=
 =?us-ascii?Q?L7bFwglyjPf3nj7KhedNEwQhKhYJoqaQ75+yZIJfZW33tF4KJgUcC38Q/1z8?=
 =?us-ascii?Q?IUtYCdqkCejcMmKcvqkDkm99paK39AuJGojy/JmHasUF0gvlLCj9Wf0uoUBo?=
 =?us-ascii?Q?IqK/hKToitZqCNzSHDFJr9ZsesQyn/HdxCYLjQsafeL+RX2a4fYFg4H3EPuX?=
 =?us-ascii?Q?b3jjQmTzXivHT0q8UnrBIfQ/OjeL1IIngEZ3VjjpdpTxvZwfjI7vCmBLTBE4?=
 =?us-ascii?Q?xDynhnwJ8Dvf1zTNjQr+aRjwq1+/RX1aDr//a7bXD6WxlKYHvPeqBYtvqe2u?=
 =?us-ascii?Q?QNrhp/3wK5HQ2mdHnfsoy/m+2K1byUtKhyydR5Rkg4+ACnYo10/C0QX5oG4W?=
 =?us-ascii?Q?LtfBoUVuh7L/utF711zZ/bh/rr9VGQvyDudLbe+IqaY1L0wvgfLp4HrYgJ/d?=
 =?us-ascii?Q?wRu/5cfgx8vdaM8JTpxkhZ6o7JHZ4DDyvoYF7Nsk2zC/02UotoYkfNf6NwTB?=
 =?us-ascii?Q?RgATHQHAbO1KsepwtA2uGkXp6S0EOpqMTRv4KIYOoMlSHWWP3wxHC+j8vHvU?=
 =?us-ascii?Q?+EC+jEKTjhQXyZGRzu/1nletxZZrqJHBw1ykf3RaT1/LMHRhvyOoiHaQzrqY?=
 =?us-ascii?Q?ftXQsw1oqYapN+li7iA83gh/vog6y1KyzvcgFylMDp3bOSSFibt74mr53IZ2?=
 =?us-ascii?Q?QyKkaxlMb4VIUeyQ3AK+3QvCfCjVCktRnILwDE+3m3l3BuGWi/hgwo2PEE1V?=
 =?us-ascii?Q?oA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58094d94-d434-4bd7-78e6-08dd56f1ac69
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 05:43:33.2507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VNQo7wzl83MFKduNSBlUMwGsrpXnn3DfrkIuvxlzXmu4ShbrzxdbhglsH7LJ/wLMC+oJqlvaMC5zW0IzGMH3oe5Dui7kM0yLJeHV6VTjbh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7138
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
> Sent: Thursday, February 27, 2025 10:59 AM
> To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
> dev@lists.freedesktop.org; Dugast, Francois <francois.dugast@intel.com>
> Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
> Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject errors dur=
ing
> exec queue create IOCTL
>=20
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Pravalika Gurram
> > Sent: 25 February 2025 01:04 PM
> > To: igt-dev@lists.freedesktop.org; Dugast, Francois
> > <francois.dugast@intel.com>
> > Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
> > Subject: [PATCH v3] tests/intel/xe_fault_injection: Inject errors
> > during exec queue create IOCTL
> >
> > Use the fault injection infrastructure to make targeted internal KMD
> > functions fail when executing xe_exec_queue_create_ioctl() so that
> > more code paths are tested, such as error handling and unwinding.
> > include xe_exec_queue_create_bind only for VM_BIND engine class.
> > xe_exec_queue_destroy_ioctl() and
> > xe_exec_queue_get_property_ioctl() are not considered as there is no
> > unwinding code to test with fault injection.
> >
> > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > ---
> >  tests/intel/xe_fault_injection.c | 50
> > ++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/tests/intel/xe_fault_injection.c
> > b/tests/intel/xe_fault_injection.c
> > index 7ae941367..f25ad9b27 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -185,6 +185,37 @@ inject_fault_probe(int fd, char pci_slot[], const
> > char
> > function_name[])
> >  	injection_list_do(INJECTION_LIST_REMOVE, function_name);  }
> >
> > +/**
> > + * SUBTEST: exec-queue-create-fail-%s
> > + * Description: inject an error in function %arg[1] used in exec
> > +queue create IOCTL to make it fail
> > + * Functionality: fault
> > + *
> > + * arg[1]:
> > + * @xe_exec_queue_create:                 xe_exec_queue_create
> > + * @xe_hw_engine_group_add_exec_queue:
> > xe_hw_engine_group_add_exec_queue
> > + * @xe_vm_add_compute_exec_queue:
> > xe_vm_add_compute_exec_queue
> > + * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
> > + */
> > +static void
> > +exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance
> > *instance,
> > +		const char function_name[], unsigned int flags) {
> > +	uint32_t exec_queue_id;
> > +	uint32_t vm =3D xe_vm_create(fd, flags, 0);
> > +	/* sanity check */
> > +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> > &exec_queue_id), 0);
> > +	xe_exec_queue_destroy(fd, exec_queue_id);
> > +
> > +	ignore_faults_in_dmesg(function_name);
> > +	injection_list_do(INJECTION_LIST_ADD, function_name);
> > +	set_retval(function_name, INJECT_ERRNO);
> > +	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> > &exec_queue_id) !=3D 0);
> > +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> > +
> > +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> > &exec_queue_id), 0);
> > +	xe_exec_queue_destroy(fd, exec_queue_id); }
> > +
> >  static int
> >  simple_vm_create(int fd, unsigned int flags)  { @@ -283,6 +314,7 @@
> > vm_bind_fail(int fd, const char function_name[])  igt_main  {
> >  	int fd;
> > +	struct drm_xe_engine_class_instance *hwe;
> >  	char pci_slot[NAME_MAX];
> >  	const struct section {
> >  		const char *name;
> > @@ -318,6 +350,14 @@ igt_main
> >  		{ }
> >  	};
> >
> > +	const struct section exec_queue_create_fail_functions[] =3D {
> > +		{ "xe_exec_queue_create", 0 },
> > +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> > +		{ "xe_vm_add_compute_exec_queue",
> > DRM_XE_VM_CREATE_FLAG_LR_MODE },
> > +		{ "xe_exec_queue_create_bind", 0 },
> > +		{ }
> > +	};
> > +
> >  	igt_fixture {
> >  		igt_require(fail_function_injection_enabled());
> >  		fd =3D drm_open_driver(DRIVER_XE);
> > @@ -333,6 +373,16 @@ igt_main
> >  		igt_subtest_f("vm-bind-fail-%s", s->name)
> >  			vm_bind_fail(fd, s->name);
> >
> > +	for (const struct section *s =3D exec_queue_create_fail_functions; s-
> > >name; s++)
> > +		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> > +			xe_for_each_engine(fd, hwe) {
> > +				if (hwe->engine_class =3D=3D
> > DRM_XE_ENGINE_CLASS_VM_BIND &&
> > +						strcmp(s->name,
> > "xe_exec_queue_create_bind"))
> > +					exec_queue_create_fail(fd, hwe,
> > s[3].name, s[3].flags);
> > +				else if (strcmp(s->name,
> > "xe_exec_queue_create_bind"))
> > +					exec_queue_create_fail(fd, hwe, s-
> > >name, s->flags);
> In either if-else case you are trying to validate only for
> xe_exec_queue_create_bind out of all the list, what about the others
> {"xe_exec_queue_create", 0 },
> +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> +		{ "xe_vm_add_compute_exec_queue",
> DRM_XE_VM_CREATE_FLAG_LR_MODE },
> these are not considered at all. Can you check this once.
xe_exec_queue_create_bind is needed only for VM_BIND instance in kernel thi=
s is covered in if and else in kernel=20

The remaining functions are needed for other engine instances. Hence exclud=
ing the VM_BIND instance for other functions
> > +
> > +
> >  	igt_fixture {
> >  		xe_sysfs_driver_do(fd, pci_slot,
> XE_SYSFS_DRIVER_UNBIND);
> >  	}
> > --
> > 2.34.1


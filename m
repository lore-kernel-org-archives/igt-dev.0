Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD5BE7718A
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 05:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C5F10E4D3;
	Fri, 20 Dec 2024 05:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9nKEGxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4B310E4D3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 05:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734671084; x=1766207084;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=20JJoe9vNvwId2OMahsw3C1gxxjorP+M/tKXmL4ni/4=;
 b=l9nKEGxuVFJtBjDdAlcT/7OWOHB0l7GGjVmfYC2GMsBfmbFBFyGFKcjF
 f6llm0yUw+nB+3z2JgEXhlKZ32Btql0XLC5EzT4pNpp47nCBdBCsOlKYe
 u2V0PHa2JlW9XiZ0eJzKSLhlWAqprByRCxptrNo327WcNooAeAOcCxZYH
 OiEhy1WsLT/HfLXJGB1zIwqjAwOICWUzWIRVujDFNFbi/v9g8iXJWaw6m
 ZYTSBn/vw0NuuWpEZCVss4vjtcNYvlMo9l8I26gxpXm30kZU2+jD0VCqP
 xf++rwRs9dZ3PN13M3tXV1ajRIpDvO1P0aCbnnRx3JRHv8Yo0N19yseh5 w==;
X-CSE-ConnectionGUID: CSQ2qIwjRxSXGxNwWm8TLA==
X-CSE-MsgGUID: EXFaMTQATnGWT6+ENkxW5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="22807046"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="22807046"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 21:04:44 -0800
X-CSE-ConnectionGUID: 1qPMzJH2SQmfhAfEzMlb5w==
X-CSE-MsgGUID: CnOsRS0LT4Knj6LVzompng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="103285282"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 21:04:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 21:04:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 21:04:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 21:04:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN76cnCYFbJBTlA2QJDyxMHdFiQUdPWVyDn36Zf9DOmzH9JHXpGUbMsCc+tp/15TiTwoHvV7hlHbpMLdyilOjOqFmnFOPQ7w3ON27Ss0Wmc+GF38IbYe7zlzsVmUkIhu5WWyBMvtGDdSlaUConmkJLhy0EuuUgs4c3jVkyfHwyghSJJV7muChY0mjh0CfvHE0dxjuQQBxtdZ6MsmkGan0yQCRjChZOhNnXRT04IP7NOd0WL0qT7W2zKCGUlodp1vsCYiXqasyAOgsLX+OJAMCwxBXpFXHme093dnl6Skc+8jbFcmErGSeKYdDFwmZaFyet4Bzz9SQnc6BfQ5VFu5fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ1Heu2CYTQe0N5RSfU20im5bf359bcTfmJF76u3u9E=;
 b=VZXywLY3fvvWLUccqL+Jw7Z6JDuCTN4taNLYZLsmdxtCVZC4BN0Vh2vB59FYsIV1hXzCkEzwgDTPZstZ43q9OS9+bN4+gAn+OIewUMJT1MUlgXMjUL9Ge6QFW22A6w3ZGBq2pfH/drhKbk5YvS813Zai6k2UI+y3LoKuxTq4tTZdTJORrDwycLeljrwoNZNL8nZZK38zQx7HYL1D0xSb9oQ4d12hl1SUL63w18Kl58kq1MMKfNpVccWlagSQQMlFiUfquZI1EUK6Q7VDp/FJEoA8vtXYwedVnlEbvY0VBaf8Eyh+LDbnvKyAnuKW5GidPDny0MMxk8lhlb/NtNJwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 05:04:37 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 05:04:37 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Sharma, Swati2" <swati2.sharma@intel.com>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Add more logs to
 skips/failure
Thread-Topic: [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Add more logs to
 skips/failure
Thread-Index: AQHbUo920F+mvjS4SEKfWT1RIO6nZ7LuknOAgAAAKlA=
Date: Fri, 20 Dec 2024 05:04:37 +0000
Message-ID: <PH7PR11MB6053C6B35BC98BDEECD0D90AE7072@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241220033042.2394330-1-pranay.samala@intel.com>
 <DM4PR11MB63129FD1CD1FAA4DD713A4FA90072@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63129FD1CD1FAA4DD713A4FA90072@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH3PR11MB7937:EE_
x-ms-office365-filtering-correlation-id: eef2fc22-8d61-41b1-cf41-08dd20b3cd82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RXSkwz9GIc3SF6gvcjxSmc1uDqWhzcCBWOe8Fm6uYFXosenVX3Fl7NLrL+AK?=
 =?us-ascii?Q?wmOowf63lP0lv2VU7PHfXVKfrdRLRcwe68DeBGKvfFULN1PRWr/iUqOxIKYE?=
 =?us-ascii?Q?4fd5Vn5LopPPfY+dXAc3sii21gNd6Np/yMzgvtN1RebE4TLR2XJNPsLiWw1H?=
 =?us-ascii?Q?NRzDWqpPJXKA0mlqbnw+Pok2vTUfD4XijUudWM2dFiV0ZxKHtGKFAcuzVV3E?=
 =?us-ascii?Q?1770nh3JgGR69YHhCKt70ASinJM6FcFmlqUQp+fC5Wamq4ht/94G59g7q0y4?=
 =?us-ascii?Q?bnggiQRUo9D21lec7w9lMNzYl1Xcsnr2tjq9QngisA0CjLUhmWGegUYhi7C7?=
 =?us-ascii?Q?0mGGZDoBGel331ybMMcp6U8iREENj/h5ETFjO4nOY2lOvnt5jmZylPsFJFMo?=
 =?us-ascii?Q?sb50Kc1OEjv0qo1o/QZsvSKXMX2RoYI5L1gOVwFcPEWVdp7Q9E/PHyyIRfOL?=
 =?us-ascii?Q?gb5TAbmcZfzm81IZw7ggtSXVJlt38YPNDnjhkfL0/i2xccXY3Oy7xC2WvNgg?=
 =?us-ascii?Q?CrXzF1rSx64gUz4A/3V+RcrzEEV3PNQZ5Cl7XYqZ6y1w3eDJhi4UYUjCnsxZ?=
 =?us-ascii?Q?FATc8Yt6qiqaYByPqvPRWVNhM4kDvZjOO6ofAeq5v+B3OPLVuCnhVLUCMN72?=
 =?us-ascii?Q?eX2aytuyqSXs4zcgHz2ChT6NgNRwulUDqFqQDvEKuqD2aQYWXzNwISl2OTnY?=
 =?us-ascii?Q?0EDKjujhJcFPc2kus41M6alPdFErAxKpqcfLwdfWDgIVvFm9orMIsbIWIBwl?=
 =?us-ascii?Q?CmhhZi7IV53zOuBVRPyB5FqVFUOovbxxgfWfSqFfu2MRTh8uo1EX12+OdIBo?=
 =?us-ascii?Q?hoWl1lnYJJ7ClVZLXgZfDn1F6TMFQa+gdiCbi/sU2VGzsl60xfP6p9oRh0YA?=
 =?us-ascii?Q?5htZL7KmUGsVzGzWvuQ5Ahf9I4p5+77X7NsBn1e+/V4PKi+sR7n6uwHA2Nis?=
 =?us-ascii?Q?X/8sdOBzA6BRd2Z7sQInzrdHpXAgKDeskRyKpB6V0oy7SuV4JlLwBd3ue0yw?=
 =?us-ascii?Q?13l3Hp0W4lgzW935+3Jem4q5NhqC0rqirOXHuYxvZ3Bx0WQHJzPVhgZYfOPH?=
 =?us-ascii?Q?H/ufIEy0k7o6oKad6Q1mwPyOGAICpO/HOIdv+SHi28+tgjmHjfRhsW51E9GU?=
 =?us-ascii?Q?jUxhXwPmHBmmwwD+5XxbKyI8ZNRjvQuaiefF7sD2d4SL4zu7erL9PI1IVUb5?=
 =?us-ascii?Q?gie3aZ3Mi19A32vIsSKLGRi69jnd3/1jSujUiol0gx2yp68EDM73PZS7OEgM?=
 =?us-ascii?Q?qQyYKmuUUCNfdy5aA13lJmqMvWDkx9/20Yrlmmbcq5jUcWIZNYARmj1UsfAi?=
 =?us-ascii?Q?NA8qaGxovbwfxhcsVQNxC6+8CXFiOLXooBnVfNrFqHRkw3FGN8eAqXAE7P2R?=
 =?us-ascii?Q?0orSb/0Uvt5WOpIVxTwvqFrlxCynKvk+OzuZezobwKCT/QLvPxJHYH6z5DEm?=
 =?us-ascii?Q?o7khlV8H/oVfigdjC87NsUl9kTjyV42q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?umuTCw+XrTQrkZVER+KSBwNz0g0gShnVHfYY2kND0R8OQqQDIO8erIPWDVAV?=
 =?us-ascii?Q?6unAa2Ep/ff3NBhw8vhBYD2hj1MXoQR5kNBf8Y2MgvMlKu0plcY41Llt5rND?=
 =?us-ascii?Q?cre0IZOD7UMW7m+qKqGUJng1xDz61slMA2ELEhmwARnytU5mp/+zJ9q3rriu?=
 =?us-ascii?Q?RjY1VFGArXn9gCxVF36gbT6ME2GBP/GDdn7t+If12jlRf721+RaC9bSLD/Sh?=
 =?us-ascii?Q?w3U5D3PGvu+jbfKkr8GgUZjjQHmHWFzOxMyEW2y8IrzdR9KdTRUDnYypNbCV?=
 =?us-ascii?Q?wPjRaQj1CGa1TnDZ5wXtwnG8V40F7c/4nC7LkL2VddoG+0+TVdmhp9gbT85B?=
 =?us-ascii?Q?nkDXgYc4Clauw7entaD67uW/1/N/QToFiGSByBX+qfh3wYkOx6+yJGXeuxEI?=
 =?us-ascii?Q?3RbH2fshNdE2nQRKhmfi3pKAcgfF9aV5YJ+7s7btoSaJVuHQJADAZLI2qI4U?=
 =?us-ascii?Q?9c3pbd4NwxCcLheE0EhVv5qpJkeaM1ncgub7XyB2XJMm4IVheXXlZhX4Ubti?=
 =?us-ascii?Q?LopTcWedCH57+ZbseYKAFYhFoWYcAEB2ZEq5nTZP9x1OJ09iaINFIWe3QxcO?=
 =?us-ascii?Q?MtmwvtDgI0Ype3OputNlsxJ8X5IaPEeaXUcefGq3T4e9YP4mghduVLiFl5FP?=
 =?us-ascii?Q?a/jswo358ME7o10Q2MQ/uFJ/RNbdaDOpQ0R6Z9ODwHlcNHl9MPShDtvKjeyH?=
 =?us-ascii?Q?SJLHN4YRv+uQqodW/OdGn1VYrNvsKGI7PqkbBlEqPttk0RuhfTcRPbolnSvL?=
 =?us-ascii?Q?3h1nMxJuENTNxTne3PGoxjL8Z4CNZzEfIn/3ishKqfTUA9xcTvvGhhMCi5ic?=
 =?us-ascii?Q?Cc+TgUFAsy7zOEI3ARLHfce/kgJdpTxogsf/Xfs0hRjMQ6r9bRSlIfAWbhcH?=
 =?us-ascii?Q?W57qdr9bWMeOdh2BCPhQueCPFmNuDL7f42LTEs0s7He5+cxjBZEqz8VDNWGV?=
 =?us-ascii?Q?GOzE392TMGiCIXTfV2J2eX7Abx/5dQAn+q5BQ10h5MWv0t2lMDNKRxulLsJF?=
 =?us-ascii?Q?yX2kPzBM/Sp2VuyKTzRtGdiiWSN1GAFJVl7xAa6hgTu/FkjuvLKYwbhoeXjC?=
 =?us-ascii?Q?jx5O5n9a3eOAkpisYnyzUmeMZcbwfuTJyC6zdp4+z8CWwT4fDlu7TQAI42Ge?=
 =?us-ascii?Q?lU/OohbEjmsr5E/gzaUoKzt/vm7D4/+2hTzflscQc07NOnzNw4HwHKeJjQdF?=
 =?us-ascii?Q?v+qh0Ci/5BSuByXRqsgXtoxp/kPfiZUV8jcnVil4qsVTzzXkXy2UstvmVqHb?=
 =?us-ascii?Q?uLYfdQB/EarPLMo5GkyL526FL7Jzcms+9NAzPKt6ey1OYulBty/VIpXnJY1A?=
 =?us-ascii?Q?u+lprmpbwiSz+0FS7laORmgXdFmh4QoPjqSpLVOvZiktLjHa3wB82FAI6xYu?=
 =?us-ascii?Q?pBsF/RQgqVxSUsmhsz9yu6iwhxDwm+0WiGIBwyjmuB6ddVKxfdDne3TaSYc/?=
 =?us-ascii?Q?ppK2nKzHrO8J2P96KKakSZ5ccCVYVHTevaUBgQvMnqHLi1T2z7CLxXG2jKRG?=
 =?us-ascii?Q?h2RazkgXEOP8k5uzTHfbA/CHWF9Yh33L1+lvO4b6lYIRXFkBkRCl5TwFgVoM?=
 =?us-ascii?Q?5kinf4fS5bEUQEhLuLLD7xne4mmdC4ZSkeYfLBkN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef2fc22-8d61-41b1-cf41-08dd20b3cd82
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 05:04:37.5158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZwYFRL7LfuQp1fMv1/OArW7z+7bS16nl1dLERf1MfRumhXAlzNizqdC9PgNhps3v743WuqY/p+3Fk5anvhz6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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

Hi Jeevan,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Friday, December 20, 2024 10:28 AM
> To: Samala, Pranay <pranay.samala@intel.com>; igt-
> dev@lists.freedesktop.org; Sharma, Swati2 <swati2.sharma@intel.com>
> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Add more logs=
 to
> skips/failure
>=20
> > -----Original Message-----
> > From: Samala, Pranay <pranay.samala@intel.com>
> > Sent: Friday, December 20, 2024 9:01 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan
> > <jeevan.b@intel.com>; Lattannavar, Sameer
> > <sameer.lattannavar@intel.com>; Samala, Pranay
> > <pranay.samala@intel.com>
> > Subject: [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Add more logs
> > to skips/failure
> >
> > Having some logs for test failures and skips would make debugging much
> > easier.
> >
> > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> > ---
> >  tests/intel/kms_flip_scaled_crc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/intel/kms_flip_scaled_crc.c
> > b/tests/intel/kms_flip_scaled_crc.c
> > index 7dc07bc83..7c66ce398 100644
> > --- a/tests/intel/kms_flip_scaled_crc.c
> > +++ b/tests/intel/kms_flip_scaled_crc.c
> > @@ -633,7 +633,7 @@ static void test_flip_to_scaled(data_t *data,
> > uint32_t index,
> >  		igt_plane_set_prop_enum(primary,
> > IGT_PLANE_SCALING_FILTER,
> >  					kmstest_scaling_filter_str(flags));
> >  	} else {
> > -		igt_debug("Plane scaling filter prop not supported on gen <
> > 11, running with default\n");
> > +		igt_info("Plane scaling filter prop not supported on gen < 11,
> > +running with default\n");
>=20
>=20
> Is this check really failing the test so that changing the log from warn =
to info
> helps or is this just a note for users to know ??
> @Sharma, Swati2 please comment your thoughts on this.
> From me this change really doesn't add and value. Its ok to have I think.

This test requires gen 9+, but the scaling filter property is supported fro=
m gen 11+
onwards. I felt if tests run on gen 10, this info may help users to underst=
and what=20
is happening.

> >  	}
> >
> >  	igt_skip_on_f(!igt_plane_has_format_mod(primary, data-
> > >small_fb.drm_format, data->small_fb.modifier) ||
> > --
> > 2.34.1


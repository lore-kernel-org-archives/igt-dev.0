Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB54C52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D5410E03D;
	Tue, 27 Aug 2024 05:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fckl/QxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F40710E03D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724736658; x=1756272658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YC+Lj+4srUhIp60PyvpyvUvUCtMlSUPO5ltKWzBtn80=;
 b=fckl/QxZ2BnbvQedDGUB04dRBDFbYn9LR44Qb3AU+Qq5B49P6Kit2+1e
 gm7h5ShbN6CoNsqjQ68DKrzc8LVu7EkQWJ70BwPzbpEJcJhvdw2bg53xR
 iyXw+Dc5/GtH9mGtjXllZrkn1D1b1Uxb8H65MM2U0o+ERuVAKwyYblWpY
 +KbFNiQ6vzj5RGJBtBNmnkzKUtRYM0ebRCGCNp4MJ/i8x6ahabdU5z6vu
 xfw05A62OvuohCrXvJyCS1jPOrIlGy0+ojQwFtMUaG+4nGKt0SwELOh8g
 +Eekwb0gf2/DIwpboLeqxtJ0Z+RX5Tri2j8R2AYVNcNyHF9ODiqScO0hf A==;
X-CSE-ConnectionGUID: o45jWKtoRxW4DS3632ywoA==
X-CSE-MsgGUID: uTpm/47oSMuwNGul/sRlFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33816872"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="33816872"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:30:58 -0700
X-CSE-ConnectionGUID: ZyYue9yJRRCDr7aOFcAYyA==
X-CSE-MsgGUID: gi1IgJPJT5qt2Cq0sq4Bkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62720908"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 22:30:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:30:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:30:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 22:30:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 22:30:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMI7jcXJBJXJkT85bb/DkTaKwb7Hl3LPjtNgvLWlk24aMVN92TN6WpX3S0gLOZ9PO83+pv7sj8bWXTgTTB+2cp2tUk8Au+01ZF6SuD0VJcXypkrXEM6b4viS4moroN6yE56h9rNqMqibBQYL5QkfOp1vILDzdSgwN3qeOxU0oObJvGDRbTF0NbPHIT/zIG8ArktquX8LgQ4jMQn7RQdi8beSNPblgKXxLc6O8hvEqhuMqKaVsF1ei+625P5ocHn2qXhOwmjNEcSs8SJNiwStgo2jaNDkEKHJYNjZ29jQd6DnkkEtetd5AxiHkZJlXkn3AAep2ucMOkzjcUzvLWyWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpTC246kd7IydtTYrYchjKbp3LY1o5S0VlynZMgaack=;
 b=PyekIJfrZnQl5htajoMPQNQj7cWhRcodb0Un3YIpie6A7jxGc3QBTYttY4t/Bn1HKfNlhHVrjZXkf4QfrhhWNAbKDpfXl/BW6nT/7QzsXZlpxWdWVya61e/5cXdQDq/VCsZuOZI1AX9ycQ4b6seEBGlk70EGh8FKCVG4wz0GkfAag2+ADDu8cqJsgGmZwBgzLKwWkHEeu/UOLd/aRl/auwKAL9yFwLUoyuVzLAzAnLjdxQoITHg0bSmeFJ2HESrlkD28EZyBXC3404fNBbk2ZDpMNtSuzwB3co0KsPM0bQ9MJOB361i+h6mMWYCliN1WEoIm1u/BGrNDBFq3ZaM3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 05:30:54 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 05:30:54 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane
 count
Thread-Topic: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane
 count
Thread-Index: AQHa9xj/e5ReIGxxhEO8QqTjNsY+LrI6li2w
Date: Tue, 27 Aug 2024 05:30:54 +0000
Message-ID: <DM4PR11MB6312671D539484A053C482AC90942@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
 <20240825181424.4034541-2-kunal1.joshi@intel.com>
In-Reply-To: <20240825181424.4034541-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB7109:EE_
x-ms-office365-filtering-correlation-id: 3751e260-9d09-4ab6-576a-08dcc6596bfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?bQRoPvxA0cts5+ep1Y3jtIJ2nVyzRGtVHDkQhQKG3wPobFxRPJ28SJdJKkzB?=
 =?us-ascii?Q?m+aVqYHDtK7HwFuZW1H+Yzyn3SGjtZwq9j4Q4TlNI4PPM0JRDMWSOLB+1tiJ?=
 =?us-ascii?Q?vvmVpop7INCcqdrb1KYu0rqVBpYp3GA75x15ubNioGrI+6j/r8RO+oRpC4LM?=
 =?us-ascii?Q?EieXoFdM6aVe3DyVfGgYZx3c0wHYLVWKQ4XiCJ2a0auK53pl9tiO3RdBCqNk?=
 =?us-ascii?Q?t7apaFDu1Z2UzvFHxeZvLQigDj3pecUz2r5RDPVwsjl3HdIFKb/1FvlQXFoF?=
 =?us-ascii?Q?BhinurQT0gJltkpqRDDa5/HvneNkzU6RM75/RQuMpXyqIKTut71F0i9mFwyK?=
 =?us-ascii?Q?MFt3n2zBf96BL7oJpfNCzO5oLmw1nGw7QUFk55ws3ndz3OFTJBkR8472SPz4?=
 =?us-ascii?Q?6hpu3w5YddvVlNCJ9Bha0e6wIXWZj026zW3VVfjgakct//vUKnNVcKz5Mm4u?=
 =?us-ascii?Q?b+D60iNtyQcqjZwS5edUKFepRspX2HmsEf7WADgHAwIUufTjh4j92HeAQ6IS?=
 =?us-ascii?Q?oO1ZaRpRe+Z5Q9YnBpo5qFepSmsA6sR5iKO3CWYr4MLsCWkydPvXF8HtLar3?=
 =?us-ascii?Q?JDzX0RW5ZnZybZ0w3r/ErD62i78hvNVbaY8jwuOUemPeEAL/B67afJjfGils?=
 =?us-ascii?Q?EpgfT/I6WqKkpUs27Qv+/OKe+THDT1dROkIrhM3NpcTnmVcdX23MCaAo2iN+?=
 =?us-ascii?Q?eKmYMCbbjHZgr43uaxMTNU3T6H50Cx7PZEYT8NmKkeYa2VVgFDH6CJS72Ccu?=
 =?us-ascii?Q?X6rr1Ni/S0V4qGzNb3U1pjPQlbGCGF2/sIufWLKz+QJpKin8zuQDcSlIo/dJ?=
 =?us-ascii?Q?NCL/a4UhGb8q90vD+O06Bs6abXUIfa6tbHNUbtETsG5n4rLQzBjN6reaceC5?=
 =?us-ascii?Q?KS9xqsUj14+RxSWa05a8DXW6MN+ZYi8050GnOl0H8Hi4JfL/LyQTqAAJc/cE?=
 =?us-ascii?Q?hp5HegkrWpJhmO5OAFL1ELi2PCBqI/RLx0cPD4o8/zX4e3EiqrV37f25oMPE?=
 =?us-ascii?Q?gnmr4kqBqVJ2CUQB7l5U5sehEyR91FCeCc3A+FqXYNscxtmgZXb1c0iM4KPT?=
 =?us-ascii?Q?WUEW9eeJiaHFEZ3Gza8zIzKIl6qJPo9W6sA53uPFC8q9geUyu9HBHJfYdAnX?=
 =?us-ascii?Q?QBm/s4HIggAV0Vidcy6oZmWGaENF24dia6Ha1sxLAAcQQMVPuSN41xF2n3GK?=
 =?us-ascii?Q?FSn84u9mDO1hU++9aWu+t05hWReB1UPJ+UBbVzmbPROsmTHN25cmDDT3hjtE?=
 =?us-ascii?Q?BcvvMmZ7pkTFCywWF/SE+tStVsyoFiwezTCFbn47md+6Ha1k3z1y8ovh0elg?=
 =?us-ascii?Q?yf2kLmN3IcmADh3+zfcoLtoegt5UFe8ExvsEAYgQUnYlQ4w6r9Kp6nhLSZpO?=
 =?us-ascii?Q?aDLJmLzxDQpvQQRJQaWiS60foOdmHiv5FofL7ItOEjwBlfCfrA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KH3bkN87XN1MGSW28vpaj2c4ln792CNJlVAgbFr8tt6bSoCH2ABaWbuTdyAW?=
 =?us-ascii?Q?DPhH2hlMqEqUjs0lnIE5zmyX9VbGY3qgaPG6BZcLfWc03wZ5F8oR1wIB4+le?=
 =?us-ascii?Q?V9/9fl3lu1gt/thruvtngiYequP8fax99ka8JI0LGflLDMaHrNsyJDX+myoR?=
 =?us-ascii?Q?AhYn3pyqYHW3KYXLOB6nDSIyWE/cpnlHlgIUni+443wbDQSNK695VNL3F97K?=
 =?us-ascii?Q?l3g7lzb0pa5ApgcCIBKgEtgOmwyNw0zZdWsR78D6mnu7N1BwAU+e+JjH/fzO?=
 =?us-ascii?Q?Zj7Zwh/j0X0ote6AI+se1+kIp+ovdIqrjrntdHw6Ca/8SUmPM80L+EpIMeHa?=
 =?us-ascii?Q?6PrBAXvmV/+TC/kqdNQsHhfocsHo7/0fu39+Ifblj/oIur+Qi7pyd0XNe07x?=
 =?us-ascii?Q?+DWKMJgQqQDluXmHicjJiik6A26A79YahoJWUT2UjjH+Cm/vE3jvXWryG5IO?=
 =?us-ascii?Q?dYcVt4tP5WrXOlYtd5jVTRWey4AJVVirD/vLnmSY90FaEUd0ZMXLUxEpWRoe?=
 =?us-ascii?Q?rND98XlxYQgJPk/Mp+jEQD3LZrG/RBH58x6CsUyF81Gg2HdOY94JnkCw+RkW?=
 =?us-ascii?Q?+mRjhb7RYrP8HGEAntdGvszFqbXZpG4aPCT/FATG9WDyLpHaE4PMhtf77Kjm?=
 =?us-ascii?Q?OOX0dv9iiBnsFUy8HimbUTAJdNHKkuYpp0mtcKChZbL94x4yUk5rIFeDutzd?=
 =?us-ascii?Q?8bzjklxxNhElezHt1VppLEttki4GXfPnuTd1VoTsgUfefox5tps5E75mixeK?=
 =?us-ascii?Q?QNHpX5yqu2eIGUU17I4JAPib5vwbR+8nZaS07cgu+Yk/mtfDV6Y5hfKmQYM2?=
 =?us-ascii?Q?OFoy9y+TZqDzq7966N1h/ntjsnuO0XmYd9750NQr5roLHXPRuSRT4dTATjWq?=
 =?us-ascii?Q?OHg76j610YXBghReVg725qcpFVS1IuAYjGosloDGdzKpCWitWtJryQFvxO8g?=
 =?us-ascii?Q?VbchTgwXtCjppvZIahLo5UubUoy0XPE0RK2xjCWUImf4Vg0ihoOdz8L8l+pS?=
 =?us-ascii?Q?iBDrOHVmoJArrqrjJ0VRKDi9qySJQCyr9JC8K0+1cAHBwvQQkAJpjS5j85bD?=
 =?us-ascii?Q?MGzwYGpSmZ8cfNLVeQktmj8l1k9QH+1cmsK/G2N7zpzsMXzDxPxQFKrSRa+o?=
 =?us-ascii?Q?anIroXWM14GVF8PC3knatgALE0Rvg0c3LXcuIVe5jn1wCg4KOSmcgk9sGXVu?=
 =?us-ascii?Q?Mzn9LN0ihD2p3CWjpon6S9Y2cbMz8QIfcqzaSACKXDThs9rYbStrIx5a05pQ?=
 =?us-ascii?Q?gU4ltrSnh5plIyiie7USibABGRJhiq85DB0wbXp9j5TO57+FNgXiO2iSjqA9?=
 =?us-ascii?Q?vFrqxmB9TJkntgasE1mogs8PcKdaK+cThaCKq+iCjV7CEQdhakO48Sr7VvUB?=
 =?us-ascii?Q?JeXFG6bXbMa6tuVx36FkNlZm8+QH7mDfeEKmaiXfNs7PF4auUcavDb5TIWAs?=
 =?us-ascii?Q?l2tAYdbl9chv3aVd6N16X4o9cNaHanO9jn5sTYylNi5t2CWq8uQCMNRR4hzw?=
 =?us-ascii?Q?TV4epZNF/R2E1418aNDCaW842IOTM9S2RbbVkvPRHv0xP5qqMenaDrE6cf6I?=
 =?us-ascii?Q?ThuhxTOSsedYrYYgDok=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3751e260-9d09-4ab6-576a-08dcc6596bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 05:30:54.5158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KCT7g5jWOa9J64As2Rif0VjT+/P/jv/ftYUzoRR4sfbkN5AiDPXPPZGVNCRQqe7Hk6aRP3l86YCbExo5s7GTkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Sunday, August 25, 2024 11:44 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane
> count
>=20
> add enums for link rate, lane count
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  lib/igt_kms.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 25ba50916..999921f9f
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -258,6 +258,29 @@ enum intel_broadcast_rgb_mode {
>  	BROADCAST_RGB_16_235
>  };
>=20
> +enum dp_link_rate {
> +	DP_LINK_RATE_162000 =3D 162000,
> +	DP_LINK_RATE_216000 =3D 216000,
> +	DP_LINK_RATE_243000 =3D 243000,
> +	DP_LINK_RATE_270000 =3D 270000,
> +	DP_LINK_RATE_324000 =3D 324000,
> +	DP_LINK_RATE_432000 =3D 432000,
> +	DP_LINK_RATE_540000 =3D 540000,
> +	DP_LINK_RATE_675000 =3D 675000,
> +	DP_LINK_RATE_810000 =3D 810000,
> +	DP_LINK_RATE_1000000 =3D 1000000,
> +	DP_LINK_RATE_1350000 =3D 1350000,
> +	DP_LINK_RATE_2000000 =3D 2000000
> +};
> +
> +#define DP_MAX_LINK_RATE_COUNT 12
> +
> +enum dp_lane_count {
> +	DP_LANE_COUNT_1 =3D 1,
> +	DP_LANE_COUNT_2 =3D 2,
> +	DP_LANE_COUNT_4 =3D 4
> +};
> +
>  struct edid;
>=20
>  bool kmstest_force_connector(int fd, drmModeConnector *connector,
> --
> 2.43.0


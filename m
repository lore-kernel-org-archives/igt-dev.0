Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C012C9EC88
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D5910E3C8;
	Mon, 12 Jan 2026 13:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0wSM8lE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BBF10E3C8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768223572; x=1799759572;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=njVffGHGZRgzXcnhA99ygVZvvgaZSQqjEgg5+Xodlp8=;
 b=T0wSM8lExaqNmIwy/v4IrKcVjmjsVHI4lkp1WfkK7NJGWUirF1eL1O5s
 18XBcLARP12L2TaJFN1EhTP29O5maMk/U9lPJGJrMbWW6M3y+ZBM5O1vL
 zdkkgvslzXNXqidWnDdbCczmyyoGkmTW/COo/qcEOxpFnYyAHmkzBOIpD
 9mJyaShw69uxc5wu14yCZQB+z4naxXSXFvVu53/1t3l0Jk/svA+plHU0U
 dU+XSEibJBYOIw5Q1ai0WxCeoKNLs3mz0746qZHYL94bZP7+GM/le8Z4U
 ZUc34Qxef7ed3r/IFAQBqBz3bGrcNOp8Dcj9wJ9Tw1r0Y3m+DXDYMIdXs A==;
X-CSE-ConnectionGUID: 5BLyTuvZQH2rLKs2gXKkCg==
X-CSE-MsgGUID: DdLapqW1RxKnvg5XkuwifA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86911410"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="86911410"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:12:51 -0800
X-CSE-ConnectionGUID: d1JdHZ+yTJOHKINVI8B4vw==
X-CSE-MsgGUID: Zzf/WLTdTHWIRflCwzPWvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="209163445"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:12:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 05:12:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 05:12:50 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 05:12:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eT8c2JpoH5S5Kd1Mb+Qy+BrAa5hB36TG8aN29JLtc1AGS8OKWg4u4ayobbhcgDfqaqlcD9Rf0KPHNikAxDWUIVellbzxMgoS5QvFP7KbsQYOIp0H5eo5+WnAA8M8M8TqDxzPxn8cGGGPxNqon9swZAV+8slQ12CtOZJ2XebpwkiD1fQMqwm6K7OxaF18JRjbTsqJJu312GqzPxkZ2LXVYkHuzSYGwS6+sg75d5/fmkxl063pKGJApI9EiOb/8beb4PHd0s4M7e6cgcMMd1VnzY7gm1F2OhP0B2fdoN/amyJUeIt+Q5FNXHwcBju9BNvA/2N4wWF1iP+kQ3J2EQV3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gx5VGVZWULCSc3yCrN7Yql2u1CMXnhKPCjl7ihDSVpE=;
 b=rwhLG6ZpE4aGB3FPXzgX/de2n2YKh+9kT5Mb+87edgws5rZSlm5HiO4oa00W2jdPWd6JJYkA8/W2X5+kj2l6p+H8B4g6gE6zLB+dKeGihcNtPGGrlL/Z6HAtW6lzP+p/0FNnKYg8pCuT2rs1a41zdfo8lSPYoufH98AcZyYvReAmgYL09roE+XxybEeNedGUsevS8HADcfsq33xfo014OGhKShCGURrONtltKeiLPEiNdE0F/IaVUseno6xp1GV6RhwV0wSbu2JQk7N9vJooLuxPXAsPi9bnpRfFyQTbtjdiGeG9oMtCF/8U4RyTnAX4FHoJA8MKiKXaBboG51tP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 13:12:48 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 13:12:48 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manszewski, Christoph" <christoph.manszewski@intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>, "Maslak, Jan" <jan.maslak@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 04/21] tests/intel/xe_eudebug_sriov: Align expected
 return code
Thread-Topic: [PATCH i-g-t 04/21] tests/intel/xe_eudebug_sriov: Align expected
 return code
Thread-Index: AQHcg8OD8QbHBeBu+EOLN2nciAx4I7VOghGw
Date: Mon, 12 Jan 2026 13:12:48 +0000
Message-ID: <DS0PR11MB7264945EE827B1D2DE616321D981A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
 <20260112130008.1649357-5-mika.kuoppala@linux.intel.com>
In-Reply-To: <20260112130008.1649357-5-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB7121:EE_
x-ms-office365-filtering-correlation-id: 4dabda0f-b0a0-4963-7b7f-08de51dc484f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?aKptOQeWr/ATAMOHjrx9hrCf+rz38QlTuWsiO5s4ZIRhSj4n4RwY5UNcmz?=
 =?iso-8859-2?Q?5n9szic7mGFHiWYNv96n6NtEThbYnbd2zQrt3Rqru9NMHCWDD/5SAXK2UM?=
 =?iso-8859-2?Q?EJx/d+MX1yuy1Ac55kQpfMibAw4L2jTIxZs58QBUm273vsKJjE/17+6zCO?=
 =?iso-8859-2?Q?NcilX0Gjn0hNq0ZKZDnaI9QxocyIT27YFRbdOTDS2ytgi0thx3p5krAAXl?=
 =?iso-8859-2?Q?mDIf3W84e+FyAmWH5hc1CvnDY4gjIMj9/zvPNUEvXJ2Fz7dx4vATPbgW6o?=
 =?iso-8859-2?Q?1vNe7MCZ7nLJJHtt8Xym2hy5RKtfC9C1gZbIs0pPHTxV4MSfig54nIdboa?=
 =?iso-8859-2?Q?xwO4zAQHVFbb3SA7xR4RCepE0ctIomWJ4NC4RIepXL8PVBxMMCIWb2cZ6u?=
 =?iso-8859-2?Q?/XWQ/nkXYWwHzPa6awpFTr4IHslK3Bepv/9y9YKPIrDEGhwCt1l1Ex1Rlc?=
 =?iso-8859-2?Q?z6ccUF0Mk+bvAlBGF3kTKq9Twpsr2diQzwEKBH3XdyGnyAg0ShZ2MxQq7C?=
 =?iso-8859-2?Q?MfB/lwgA4iIyk/pEWhcAvHxP4/CsRBQcQss5UCSx8lw4DSFzz36BhSs73y?=
 =?iso-8859-2?Q?z8HzRFL82D4rM/gp3ygD+Gq8hkwunhG/RyA4civxfr1aSI4qXJSzslPCcd?=
 =?iso-8859-2?Q?g+EG1zxtKlb/iWSei0h9g1aw98EC085GU7Et4USlo0dNCpNO4gYaS4fYNo?=
 =?iso-8859-2?Q?pd8vqW52S1gnYo9+G0k9JwsTHgv2z67YywidF+HHz/H/9VODiLysibhwO6?=
 =?iso-8859-2?Q?xUB6OuVq0pvcmdePvkgASfmzz3j/FPm9ukp3dHSw4PA2oz65KZ1ibilvxP?=
 =?iso-8859-2?Q?sHnbg171My4GsZO8FsTszYzX7aDc5OCLOHAgI+tra6vi0JUrDA1BNB1Cf2?=
 =?iso-8859-2?Q?yoqTLtJ1R4tzTUINmt71ewIXyeuyB0gBJY3SiOOJyPd8hN7d2PSmNcYdfS?=
 =?iso-8859-2?Q?62veKd3bSpATt131MFBNYB0VdsaQzgeHxFXhlWIgu0DQ1dh1fGjAACchp4?=
 =?iso-8859-2?Q?YseO4wZWWQpMy5ZENiRXutpEdPG8/z49cheVOH22hMZJLwK67mvbKwCfyQ?=
 =?iso-8859-2?Q?cvyWgf6YY6a9p3DS/PJEzbNxccA4UmQ6HhXPQXwq0ph1vAaG+KqT7rs+5I?=
 =?iso-8859-2?Q?AJI/H30Rhp47a6fxJifslFLqPofaxgNk6a+bBfIX2IIGJe0M73ILbrQT37?=
 =?iso-8859-2?Q?zgWI+OF/I4UWEQ6kCHd7tmEyqXhhbZFxp3ffxl5+VxoPKIlu2yejZZsoo0?=
 =?iso-8859-2?Q?xoePWjmsEjbanhICV0YwW5ZJI745D2aMjIDL606w7wpzThsTBEsjjS9wtH?=
 =?iso-8859-2?Q?eZLVH8Beohahc/PiF7U8+h196Vk5HvcYoyRiAlhwWbO1pO6UDcEKji4KRw?=
 =?iso-8859-2?Q?CENE1bZhOYZgYr+LkgwcsJjOu8eNGa1PPlhUoPmr1nILQh5Sb7DbPgAvgk?=
 =?iso-8859-2?Q?QSJnx4zW1X6LMhB2rhqJXzjJ6VDjFaBCMv/eee33YcjhfIUI3aYXMa57GS?=
 =?iso-8859-2?Q?wT81tPXmvnAEgQQJ2mN1m8SbrmYGS8vOOSNvB1P7HCudg8/MNT8z7b6x6U?=
 =?iso-8859-2?Q?+CwoPHF0waQVrWmWk/mVMUmvk7KN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?RSlQsRnhiLu1NNU8B4TKVTEA5Ag76QhlqE6Vz4bJ4maRYs60wdCyJQALcL?=
 =?iso-8859-2?Q?KzEeHQQ9pRzAIJIMnPdfuiqdnd0RZC8mCA3rhnhRPjsL/MhSymeRb/VPeL?=
 =?iso-8859-2?Q?G4r1I+211o/sK3jCI18nKZNh70PDY7lxQYKmlmLU2X16WSwYANSBmT2Up8?=
 =?iso-8859-2?Q?WcK1rEqGDxhszvY51eSM5qFboBT+pn7igT2MpxWWQFyVm+rtgjRenJbKst?=
 =?iso-8859-2?Q?GwoLCDaPyr8SMk/UPfTOAwIO884gM9yxUe3h5Sf8E8V+gU9kswK4F6oXqy?=
 =?iso-8859-2?Q?q+5waBPjmTjjEw4gxiJoDrwH3vBwVTYczzcDI/278webFSvffnYl6qFrZb?=
 =?iso-8859-2?Q?+EU7uQtfC2176/AFgvFUIygGb7lU55LNf0IXtPiSBs/XIGJEzxDsBF2/dg?=
 =?iso-8859-2?Q?TIiGeCRqR/I2bwUfuVoGDKfDK4l6VMbmv3KqP/MuQyX1y0Dff8QJgOPj6P?=
 =?iso-8859-2?Q?LwUzq7RqiZKSakF1i5TatXcX3BSgo8FwPhTAG9pEmw59H2xaDlKQ9tcnCm?=
 =?iso-8859-2?Q?JZ/QFkqlI5k0QpuVqhIQaHk9tvh1z9lWCpAfEehM0dhaMUnWweT/b38OVF?=
 =?iso-8859-2?Q?aoo3yM9//K3dHA7af/PgBSvwyi83GT+3KveoxVejNMS/SmpYC9RsRPwxy4?=
 =?iso-8859-2?Q?ZpskJVn+E48jHJWaoCJ5DqYSSeCMkOeVAvdTQOMzl0CwcVk2/HPB5wMn7w?=
 =?iso-8859-2?Q?cwPkkgiRDyfMLo0ve4z7T+RV9xevswiTCkhsm2KdNzvBLVetnGybKlGVga?=
 =?iso-8859-2?Q?A6YXJ2P34KgkK2JZOhhkZ4ufdWw59RuOg5q+wqEZKu301TsTeasTk6EX3F?=
 =?iso-8859-2?Q?OSN1pzw1ZRGs7nvBYWst0YtIfxG+VYnT7FFhW8BQ8xFH91lgOzmokOq0+5?=
 =?iso-8859-2?Q?6RvEUzOBOF+QNwsol0O3EaElJz5eQfZUbMpcFvmMs1BYFIVpq8JMeNCbhh?=
 =?iso-8859-2?Q?Y/b0ez4anTe/+fUT/TM65oZHk2nbzGPpPqQS8BvQ4eptGfVIzugdJYKa4M?=
 =?iso-8859-2?Q?1j8g8POmwvUE2g9KIUhtv7a4vBS8S8F9tMv8HWV9BO51uwd+OM/tRzJwhR?=
 =?iso-8859-2?Q?/l4yGL0Z30H3xRf6ZpPSw1IP7wDDKsQrRScmEzz+Jz5YwH4pO+ScBlVOY2?=
 =?iso-8859-2?Q?nFuLqPEjnn2zFUlv/Khi24CBwlIThbDDfeZtCoqXHwLx3ZnpeZy2xAIVp8?=
 =?iso-8859-2?Q?DZtgJ5QM4L4BmhBn8jb9n6nqIUVapDbKAI0g2yw3c6AppfG0UkC5WMAsi4?=
 =?iso-8859-2?Q?3/1gF8MWAA+xhUtJKOPLrthBYqlbJ2FCT2TTawHRkklbygf0cJvbXADSRt?=
 =?iso-8859-2?Q?ibQccFXXfB8l47MHaHpwtXHgdmmJO5H5pCPyMwnD1+nUO2MQcXun3DxPi5?=
 =?iso-8859-2?Q?labZaOPR98fKBlUlpyTBxmCvV//lZNB74N+lNbPl5+aNrVmWI1ggUmPrx2?=
 =?iso-8859-2?Q?lG9sO21as6NT9UA0dJr1hqRvOEWJmINx7+60eXme81fjtThsbNhfBdEvlb?=
 =?iso-8859-2?Q?Nj4Y3h5oN74Wn5pZaca8V3GiQez42gUCedO9ImveOTurK/a2kR4LB5FwEx?=
 =?iso-8859-2?Q?BWqArQ2+jnfHKtv0/J/vpsuVKCh7yMzTPCsxJlZLyQNJhuZoD2dP1EqcoR?=
 =?iso-8859-2?Q?omNSxRSpX0K2TNu/IygmFSursCApNuRTHey7OUMLUdzgtlhOX5SW+MpnKb?=
 =?iso-8859-2?Q?7apNabgrOCppgUnhW7ajStx3bqnPAuE3mF/yjCNPYY1h9dAFAnpmmpbFUw?=
 =?iso-8859-2?Q?DC8a4Tvodv36wcIxwfr13Vtj6hybI98PcGHBJGS+2OKtYUu41ZJe2fQ9qC?=
 =?iso-8859-2?Q?tUVb3Wc8Ow9uhklQkH3tW5RN0joP6eY=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dabda0f-b0a0-4963-7b7f-08de51dc484f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 13:12:48.0934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C5MBzv9Dj6IpCYNl6/p2mshZMS7k6lkNh1yaCtbSkEXA3n0fUfbSiuJlk1itrsAKSuurNyrGkuGeYxZltwr74r7hKzX5KuZqVDXlOKejzVT34Txyt/0TFBfhKDNQ0zW2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Sent: Monday, January 12, 2026 2:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Manszewski, Christoph <christoph.manszewski@intel.com>; Piatkowski,
> Dominik Karol <dominik.karol.piatkowski@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Maslak, Jan <jan.maslak@intel.com>;
> Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Mika Kuoppala
> <mika.kuoppala@linux.intel.com>
> Subject: [PATCH i-g-t 04/21] tests/intel/xe_eudebug_sriov: Align expected
> return code
>=20
> From: Christoph Manszewski <christoph.manszewski@intel.com>
>=20
> Align with kernel commit 387aba39b7be (drm/xe/pf: Allow to lockdown
> the PF using custom guard).
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  tests/intel/xe_eudebug_sriov.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_srio=
v.c
> index 1f150d0efe..8b318d48b0 100644
> --- a/tests/intel/xe_eudebug_sriov.c
> +++ b/tests/intel/xe_eudebug_sriov.c
> @@ -71,7 +71,7 @@ static void test_deny_eudebug(int fd)
>=20
>  	sysfs =3D igt_sysfs_open(fd);
>  	igt_assert_fd(sysfs);
> -	igt_assert_eq(igt_sysfs_printf(sysfs, "device/enable_eudebug", "1"), -
> EPERM);
> +	igt_assert_eq(igt_sysfs_printf(sysfs, "device/enable_eudebug", "1"), -
> EBUSY);
>  	close(sysfs);
>  }
>=20
> --
> 2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8377C83F1A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 13:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE5410E678;
	Tue, 22 Jul 2025 13:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWtga/3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8038610E678
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189430; x=1784725430;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8PcMuHWCr1VcRHiJP6ZYegjr0E2mhqMQAts6//SkMjE=;
 b=VWtga/3WTg2Fb8LLxb4hohEpDY8Z0YZayq3n6Kn2HsJmXGynNDAzq67M
 xURR7jZJGuWMGhrP5eGfuRzBPaVwo5IyN7/hivpeNRjapGP0E5NONIFQx
 cHL5Q0A1b+mlR1Eq2W2U9JLQ/gZQqocclSyFe6bQoJyWSrmjswx880gHj
 ZH7ILoMh60HOIl5fgK7GxIBrQQxwZHFawIp+/JeYr7c7UxbjA779AxFtZ
 y3kxplgytAJx3XjkHMdg3uW85KZ6FaV6SLh7eU2IrD/PaosUrZCdwxS+a
 dG+x1ejZi8WLrg5TL0aYFpmYBqTHvFhXWY6ukVIXompjDMcZYk2VfDuQL Q==;
X-CSE-ConnectionGUID: H5RCOT0RRW2LUs/EjavY5Q==
X-CSE-MsgGUID: EHWNrVgAQyyz3tIMr4OiKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59235085"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="59235085"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:03:49 -0700
X-CSE-ConnectionGUID: 9xWYzfJ3QK6ntBVfs20lBw==
X-CSE-MsgGUID: +jjZXDbKT6eRXSelK3MJdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="159865774"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:03:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 06:03:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 06:03:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.82) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 06:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3aD4v9lQ8aFIivmoQS/uZNxHwcqV6zgOeMEWY+y52HBnl+aHFiTpqeqwDhFUfizPpw43kuCliYqjqO67ld/QXwzsIjGEyZjAa/BJkxIlgg+p286oZVbAZZpeDjZn1m1d8RWBBsm2oqvKOj/D4rvA9L/RPGs4DtoRBgQTJQkkhC3jIZpCIRs4LQKdlxAs4Qnq+zvZZEnwNtyDYcuaX0F3Qog2hQCOPaY4dfbN6oOIGf+7tFrTPWSQzb+f68/wTStP20Xs134/Jl3/Z9wvES8jHhBRXWAwTAVhncCR1H2RGMCN6a/2cvSxpcf5D4AsTOxQIwcnkLIL+4oKTtn0eTJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRXP+Gp4pFmpylHqe4KS+wCvQ67zzZJSd8AfzMY58p0=;
 b=g0xDdZ6IhBkgTMx+ZfWmlzS2r21Yr4Wmk4BmMpw4HywIpwSqJd6E6bBU0nNt2mC5cXHacMeHmzKbIsiQQB6DWxk10AAEbQz5HTQLeGnXdOodmtvj79uncdfLib3sykZ2wceV+S++gBJOAT6+96hA9SUpcNE3j6ksbJ31a3gPQIyi+nAT64ODdRP6GCj3Iu7HQs3hHtc9CE2uBUD9vk1j43M0BREBg7M14vqpJFvva5KuoXoCKL1FBmroSufr22EW6tHfWm6eKQGybdqPq/DsgWq9naUv7i+apiLjU2MjhBqI6pGOT21f7/yp/rSVR5OV983LyOTob8mfHZyz4EyPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 13:03:43 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%7]) with mapi id 15.20.8964.019; Tue, 22 Jul 2025
 13:03:43 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
Thread-Topic: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
Thread-Index: AQHb+Mq28Zub37GLeE6+S007IYOu5bQ8ZRAAgAElK4CAAIJ5AIAABXMAgAAN7dA=
Date: Tue, 22 Jul 2025 13:03:43 +0000
Message-ID: <CY5PR11MB6211F4211D129944C29DEF39955CA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250719163101.3459754-1-raag.jadav@intel.com>
 <aH4YMMLcvuiRS2l9@kuha.fi.intel.com> <aH8OHZquwBBvODfQ@black.fi.intel.com>
 <MN0PR11MB62070599B42A46DCAE1CC69B955CA@MN0PR11MB6207.namprd11.prod.outlook.com>
 <aH-AIouJAiWTVxV0@black.fi.intel.com>
In-Reply-To: <aH-AIouJAiWTVxV0@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH0PR11MB4776:EE_
x-ms-office365-filtering-correlation-id: 27dd857b-6759-4809-7b60-08ddc9202f98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FZirHzUmxQpGF1Qb2bg8XoP8jvcEPdxGq7ePbxLnjwYNEa3Oh5P/FaS8RBlG?=
 =?us-ascii?Q?OAmEDRzN3Yf7ZfoyJq5kcKBG2gIl09CYzpyTvkP7w2w4jyzvXDwxsX+0Gd57?=
 =?us-ascii?Q?7gRDbOO4hH+kIVpUZCHrBgJDlpCT583Z9em8nG7LAue1tnotmC52GrB7rg9g?=
 =?us-ascii?Q?VffaGd4MborxK+ICIyByPBC2xC1IjZ92zh9CF8EO8/0G9L6Fi2aH1uLDFnbD?=
 =?us-ascii?Q?Wa1F4X8bKaexZkGxe9+uFYs7VjU7bH153PZXD6tUtzuAE9rFkKL5IY4LYQkO?=
 =?us-ascii?Q?c92S7mx7zovFEB97e/92euKFHYNCJ/6nSmUpLwJEN950enygfzy9+FpCX070?=
 =?us-ascii?Q?sUlilkXD7rv/MyktC4btWXFZ9B5zJYZBkX00qYNvE0TQ1p88cGMSbDObGOUk?=
 =?us-ascii?Q?mYhq9+/FQItLJkriisGQbUqL8hL+CDtqr4bbz0z6IN7kolCS4SLrprtnnIuM?=
 =?us-ascii?Q?ISucv3JHB1jcNiZM6mMpQ4K/RLfUrRDC6ien464B42OQGq3sOCHgVP29FdlO?=
 =?us-ascii?Q?H+bxR7KAttm/Qo/kPJGr2VgPF7eHD4wRDznKcgh3KaUB+GMwKN9mHmzjxnlr?=
 =?us-ascii?Q?EwzwSuQWKt/6WzP9D/pwAxpzJuEdP6A+uoSSLkZ+pmYvskzAJtEY5SpgdlMF?=
 =?us-ascii?Q?oxMeM/noXqz8dur/wy4drPRJI1bRJWRtihfTFQ+vl/R2kg9wLuL3njpH3sIO?=
 =?us-ascii?Q?XwddDFle+y88UZ0fqKJlzlP5zXoj9cwxhBQBycc4ai0CK2m25X5ftSZKRKn8?=
 =?us-ascii?Q?BUuQ5hVUTTABzzxy8kbE21EgVdNxjVr75tgeL+rMscbQMnkjOhdncDTM42Z+?=
 =?us-ascii?Q?vl6HaqDyHatEBX3RRL23npQ8Nfi0AGOd7zBPQ0PyJHSwefomJ/5p9QxR7Qqw?=
 =?us-ascii?Q?FxiZ9b5Bc4HCy0zzID1RdV0dIzQc1yno+YR1/H1SU16y81keP7tn+UTLg+RO?=
 =?us-ascii?Q?1rZ8zK2om0VwP9bIwHrD9R5QjuU1jSMKdHuNBufTYiqHKk/LWyHC73vt+SEh?=
 =?us-ascii?Q?0X41ixiPUk5Rm10PGDtd4Vpnd/Ex88p4uhM2OZ++W68lQv3GYR5oyl3OTTP3?=
 =?us-ascii?Q?9KcKD74jKlKjrkLJdBpV1GQgIMmYFwXOGJ9Yfq5h2mhtHdT/wmSwcy3NUlb6?=
 =?us-ascii?Q?KVJ23IijBsWaFVymWbaWgG0bQLdhrwdjY0+OTd8WasA5emBfUqqdAb6UXdFm?=
 =?us-ascii?Q?koPZLjEYPEM0BQXPBq+AV7tVpfUw2DEPoN4ziDnoKK4ol9ABAEO6Aut9QPxs?=
 =?us-ascii?Q?c/W23vTtTGbdj2rfLpgY1YyCov1pgKIDzAWjkRCG0ch8ZX/wNznpt7dWbNCG?=
 =?us-ascii?Q?Y39CXz7NQVv0jwAhe698wxGqmUrk44crWs9qPwrKkg594vxbv3vwJQHd4VAM?=
 =?us-ascii?Q?q0vYyzKVNFw/MVNBU1vBRv1Q885bLj7OWJLtDc6U0iM6JrvXCCcAamfrfg5q?=
 =?us-ascii?Q?uWxAO4FUk/M1bi4BTjMnTPoM9uZqYy2nx68HIuyS3Ymsgzb9o3vxgw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aokRkbJdPiXlURFa6FL7TMhChOfH/8w5BLtL4ymf+GdG1IdS+bLWHRgTzoJ8?=
 =?us-ascii?Q?UP2wYFx/yd+eN3/jntgYtcWfSxOS0ImKkxHEmC+EYFTqekiPF9hedP64RDT3?=
 =?us-ascii?Q?gF9DOWc/XnZiokiIV5zi7KN3qt0chzZPYclE/PfoqCg2YSAzLNB4lA75HgUK?=
 =?us-ascii?Q?a/eXVKvyBHsjQATbq6Pg3WZqGt3IOR7njpIFQ5hWmVIqsu8u/Wi53nS2ati5?=
 =?us-ascii?Q?hKGvV7yPo6sRruBwjgVLw29HMAnB8lrCi57+TTitPkhCThLRFeYD1CsWUMpi?=
 =?us-ascii?Q?H7yZCM9bIUnx/CsCN3t6t1T+lNbCMyPbO9MOHT/H4bCKLUrTM0Hrx4lVTF9A?=
 =?us-ascii?Q?cuvnf/QOgUVOEA2Y2dr3VL7+w7D7y3voFCBAfGTQj1hZ8QY8UosKW7eYTfG3?=
 =?us-ascii?Q?9bHLM+9/0RQc1c8fldTNUuZcafT/2UNepQbgrgrh3aCPUSzyE4EgIL1L1Tw4?=
 =?us-ascii?Q?AGllgz1cwY1qQ34aKd2yv/5RZcB5WUhlT2fwPqUoFVpUdYyU6cuNXPtN1wBb?=
 =?us-ascii?Q?fMmpRU2wR3y19f9w4iXhvplG8PvlmHV8ZrJT5vT8NGmVkX7ytLHXgykcfQtG?=
 =?us-ascii?Q?XHlBe6LERQ3wLiT6exukYrN8ykwqPARK+5cUiD7on9byoMiWS+Bhw3h9bv4r?=
 =?us-ascii?Q?VZ51s7IMMkcXATG0oiEXIQ+MLsDch9PiOqAI/m3k2SF2e981mSeQZz3HVk7e?=
 =?us-ascii?Q?hyEDnuY2RlllRd/zOvNsuEGqub5L351v9SVUzx74dk0v9lfgn6hLT783/5Wh?=
 =?us-ascii?Q?NVdsgbpqHIZAXMNJ5o+qGjQDNK3RzmmevTxiaAyFgq8cCg45WyWI2qW/56r3?=
 =?us-ascii?Q?syuSbSlp87xUnx/ALDTz0fSjAzGSaTo+12I0BIs9OZ6XytAawLLYwipt+6bI?=
 =?us-ascii?Q?WcWwoXmIMYOqqBLHwuPR0V7fBBIqsPV1vsiS5tC9X5PSVaKlxNQyNLb5ZZgI?=
 =?us-ascii?Q?ol23cD1h057QzyTkr4zoVnMlqdd3gQtUfMSFqntwSsfjP/IlKVFb8Np4j7JG?=
 =?us-ascii?Q?KXTJNdxz24x+gEzN7S3dn2GEmjpEfvs8Z73F8o+96Jmf0DQwdEzZlnxlSfBH?=
 =?us-ascii?Q?qfdjj6rGVBryk9Hu7DXUYQ/wj/V4k2lblysxQ8f7J76GNtAteiDe6gYk2qW1?=
 =?us-ascii?Q?OyznyQp/bJIKLzuLUiAHTdYPylhUe5GSAihYIrhfN8FqmnjmpgOQiA3F2dBf?=
 =?us-ascii?Q?QQRXY/90gEcnY2hZE+sAmcEqoZ46rYl9W8ft1ZTyk0ruwMQDkmm77evF6N+y?=
 =?us-ascii?Q?TPZgz9GSYG0G9vteplAIoogEGgOKCM+DixEPtWXzU6MXIq1MTHXGoFxiHTu+?=
 =?us-ascii?Q?c35ig/KYA5WBuc9Gn971aZfxEN55uk0xUCkcF80j5xBA33ELgfS35xXwMfKV?=
 =?us-ascii?Q?IQGLoW+jYT2vTY3QnTntVJ1RUADbDpsXI3GUoJujtJe3/nIYG79C5RcTlftM?=
 =?us-ascii?Q?VRdfgIA0ribK7AohUudA4YlrNu03tt5eUtd3Olj+5TBLbG7CvPilI0wWC5wF?=
 =?us-ascii?Q?l+AmA+BXrMF0bJgeBIPoWgdV6KXy3VjqWm6oKktwm0rV/9YI0KY1ZUtaC8ZJ?=
 =?us-ascii?Q?gcVJt7+wH+nWdryZf9b6uPfXxcVZS0RX3KoiDbDO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dd857b-6759-4809-7b60-08ddc9202f98
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 13:03:43.1074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2LWHOnDMbn9zL05LnIK0Qj7vx14gk5s6RqkRNfh8wCrThrRpXvoXXsQDDXN2JySDaI8l4JAntIIVZFTtpmwd3bUo2u4ghl5RK3FP5rB5Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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
> From: Jadav, Raag <raag.jadav@intel.com>
> Sent: Tuesday, July 22, 2025 5:42 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; igt-
> dev@lists.freedesktop.org; Nilawar, Badal <badal.nilawar@intel.com>; Taur=
o,
> Riana <riana.tauro@intel.com>
> Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
>=20
> On Tue, Jul 22, 2025 at 05:27:35PM +0530, Gupta, Anshuman wrote:
> > > From: Jadav, Raag <raag.jadav@intel.com> On Mon, Jul 21, 2025 at
> > > 01:36:32PM +0300, Heikki Krogerus wrote:
> > > > On Sat, Jul 19, 2025 at 10:01:01PM +0530, Raag Jadav wrote:
> > > > > Introduce subtests for i2c adapter which is used to control
> > > > > on-board OEM sensors on selected devices. This will test
> > > > > D3hot/D3cold transition after i2c adapter access for the devices =
that
> support it.
> > > > >
> > > > > v2: Define macros for AMC constants (Lucas)
> > > > >     s/index/adapter (Lucas)
> > > > >
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > >
> > > > Looks good to me. FWIW:
> > > >
> > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > >
> > > Thanks Heikki.
> > >
> > > The BAT failures seems unrelated to the patch. So anything I can do
> > > to move this forward?
> > >
> > > Raag
> > >
> > > > > ---
> > > > >  tests/intel/xe_pm.c | 98
> > > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 98 insertions(+)
> > > > >
> > > > > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> > > > > 16b5fc686..ca935d518 100644
> > > > > --- a/tests/intel/xe_pm.c
> > > > > +++ b/tests/intel/xe_pm.c
> > > > > @@ -11,12 +11,18 @@
> > > > >   * Test category: functionality test
> > > > >   */
> > > > >
> > > > > +#include <dirent.h>
> > > > >  #include <limits.h>
> > > > >  #include <fcntl.h>
> > > > >  #include <string.h>
> > > > > +#include <sys/ioctl.h>
> > > > > +
> > > > > +#include <linux/i2c-dev.h>
> > > > > +#include <linux/i2c.h>
> > > > >
> > > > >  #include "igt.h"
> > > > >  #include "lib/igt_device.h"
> > > > > +#include "lib/igt_kmod.h"
> > > > >  #include "lib/igt_pm.h"
> > > > >  #include "lib/igt_sysfs.h"
> > > > >  #include "lib/igt_syncobj.h"
> > > > > @@ -38,6 +44,10 @@
> > > > >  #define PREFETCH (0x1 << 1)
> > > > >  #define UNBIND_ALL (0x1 << 2)
> > > > >
> > > > > +/* AMC slave details */
> > > > > +#define I2C_AMC_ADDR	0x40
> > > > > +#define I2C_AMC_REG	0x00
> > > > > +
> > > > >  enum mem_op {
> > > > >  	READ,
> > > > >  	WRITE,
> > > > > @@ -779,6 +789,87 @@ static void
> > > > > test_mocs_suspend_resume(device_t
> > > device, enum igt_suspend_state s_s
> > > > >  	}
> > > > >  }
> > > > >
> > > > > +static int find_i2c_adapter(device_t device, int sysfs_fd) {
> > > > > +	int adapter_fd, i2c_adapter =3D -1;
> > > > > +	struct dirent *dirent;
> > > > > +	char adapter[32];
> > > > > +	DIR *dir;
> > > > > +
> > > > > +	/* Make sure the /dev/i2c-* files exist */
> > > > > +	igt_require(igt_kmod_load("i2c-dev", NULL) =3D=3D 0);
> > > > > +
> > > > > +	snprintf(adapter, sizeof(adapter), "%s.%hu",
> "device/i2c_designware",
> > > > > +		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
> > > > > +	adapter_fd =3D openat(sysfs_fd, adapter, O_RDONLY);
> > > > > +	igt_require_fd(adapter_fd);
> > > > > +
> > > > > +	dir =3D fdopendir(adapter_fd);
> > > > > +	igt_assert(dir);
> > > > > +
> > > > > +	/* Find the i2c adapter */
> > > > > +	while ((dirent =3D readdir(dir))) {
> > > > > +		if (strncmp(dirent->d_name, "i2c-", 4) =3D=3D 0) {
> > > > > +			sscanf(dirent->d_name, "i2c-%d",
> &i2c_adapter);
> > > > > +			break;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	closedir(dir);
> > > > > +	close(adapter_fd);
> > > > > +	return i2c_adapter;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * SUBTEST: %s-i2c
> > > > > + * Description:
> > > > > + * 	Validate whether the device is able to suspend after i2c
> adapter
> > > access.
> > > > > + * Functionality: pm-d3
> > > > > + * GPU requirements: D3 feature should be supported
> > > > > + *
> > > > > + * arg[1]:
> > > > > + *
> > > > > + * @d3hot:	d3hot
> > > > > + * @d3cold:	d3cold
> > > > > + */
> > > > > +static bool i2c_test(device_t device, int sysfs_fd) {
> > > > > +	uint8_t addr =3D I2C_AMC_ADDR, reg =3D I2C_AMC_REG, buf;
> > > > > +	int i2c_adapter, i2c_fd;
> > > > > +	char i2c_dev[16];
> > > > > +	struct i2c_msg msgs[] =3D {
> > > > > +		{
> > > > > +			.addr =3D addr,
> > > > > +			.flags =3D 0,
> > > > > +			.len =3D sizeof(reg),
> > > > > +			.buf =3D &reg,
> > > > > +		}, {
> > > > > +			.addr =3D addr,
> > > > > +			.flags =3D I2C_M_RD,
> > > > > +			.len =3D sizeof(buf),
> > > > > +			.buf =3D &buf,
> > > > > +		}
> > > > > +	};
> > > > > +	struct i2c_rdwr_ioctl_data msgset =3D {
> > > > > +		.msgs =3D msgs,
> > > > > +		.nmsgs =3D ARRAY_SIZE(msgs),
> > > > > +	};
> > > > > +
> > > > > +	i2c_adapter =3D find_i2c_adapter(device, sysfs_fd);
> > > > > +	igt_assert_lte(0, i2c_adapter);
> > > > > +
> > > > > +	snprintf(i2c_dev, sizeof(i2c_dev), "/dev/i2c-%hd", i2c_adapter)=
;
> > > > > +	i2c_fd =3D open(i2c_dev, O_RDWR);
> > > > > +	igt_assert_fd(i2c_fd);
> > Can you wait for runtime suspend before triggering the transaction to t=
est
> gfx transition from d3 to d0?
>=20
> Isn't that something setup_d3() already does?
What if i2c_open cause a device ref count in driver?
Thanks,
Anshuman
>=20
> Raag
>=20
> > > > > +
> > > > > +	/* Perform an i2c transaction to trigger adapter wake */
> > > > > +	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
> > > > > +	igt_assert_lte(0, igt_ioctl(i2c_fd, I2C_RDWR, &msgset));
> > > > > +
> > > > > +	close(i2c_fd);
> > > > > +	return true;
> > > > > +}
> > > > > +
> > > > >  igt_main
> > > > >  {
> > > > >  	device_t device;
> > > > > @@ -889,6 +980,13 @@ igt_main
> > > > >  			cleanup_d3(device);
> > > > >  		}
> > > > >
> > > > > +		igt_subtest_f("%s-i2c", d->name) {
> > > > > +			igt_assert(setup_d3(device, d->state));
> > > > > +			igt_assert(i2c_test(device, sysfs_fd));
> > > > > +			igt_assert(in_d3(device, d->state));
> > > > > +			cleanup_d3(device);
> > > > > +		}
> > > > > +
> > > > >  		igt_subtest_f("%s-multiple-execs", d->name) {
> > > > >  			igt_assert(setup_d3(device, d->state));
> > > > >  			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
> > > > > --
> > > > > 2.34.1
> > > >
> > > > --
> > > > heikki

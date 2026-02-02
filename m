Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7EAD172C6
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 04:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543DD10E1DA;
	Mon,  2 Feb 2026 04:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aM3XE6hL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F0F10E1DA
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 04:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770006879; x=1801542879;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q3oo2zgO/4Xz5G0ksDD5Fb5FxI8jx0Z2lJnstlfkzSQ=;
 b=aM3XE6hLkgM6ZL9JCW9/p0JbiukR9phGFqJBuwHsrwTJiVuT7uNPBfnT
 gn1JrJZSanPY1AHiytV2z9wgGJUk3supHcSpDdMiVRxludZCOqgKp3w2k
 7ww+/EXtOFMVRo/ivQ3/TRFgZ6r57DlRgs5OfvzKMm/51J0Su4JIqDllb
 ngaG4HZr5IFsEOe4po6LIRXXq9YjohxxR348Oqd5BsSEzb1aG4vu7pmnl
 WA2ZstSTSUt7b1nhafxY32FkKATJYJRNFuMSei91u166De41bar2un3/T
 /A0nac7JTpMwburDduRn6fxDUevfIODHMiBmeTfGcKpS4ebeLUy1r8BOz A==;
X-CSE-ConnectionGUID: AEbi50BUROyMljQZOYbLFg==
X-CSE-MsgGUID: A+9s8bA9RrutwfFvrGrI7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71061915"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71061915"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 20:34:38 -0800
X-CSE-ConnectionGUID: keXAwkjhSouK+unEc+x6rQ==
X-CSE-MsgGUID: 9xskPkS4RPusgZnqGFJ/cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213509804"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 20:34:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 20:34:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 20:34:37 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.24)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 20:34:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxVU3Sl3tVF15M0m31u7RPt+9qK1+HQ4xf1luJHfQ8bXDt/KA/HFkfF/6D1NHzqhYx9QzBOlFPCYrfw0DLq6q8gCQj0RS8T4aMfsohVvSsNSHqV4rMiF8oNuipNDFdUlb1L0Ff+NipDVXPjnp6un+jrjiP9YVaIX0de4utwBiWR8I/TICIiJ4kHY4HCalJyx7YLK6WteZJNtDEOhMFH3LH+FKf48fKSTQy9VzWaWZjkTPx6gELqVHZLEUT3UEqcCBmUOFdssQlSeieUsUNv8cNTTHmAjQqiHhnCsoHKNwO8pfMqMI/oE0si9m8SUILkwmGSj9mnulBP67hDBBYAFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+o3VhFJEJ2YP6aS3rlCsIc/wQpnHl+UuMDHr+YotCAM=;
 b=HDbGGfsGaVx6yLjJvw1wtsrFQ8l+Vv0h1M6Twq7obh/7YS692DNIPEprUpfY+LiUoUauUfvO1TnbJvLaWY6ESeG3zJg6w5W7c5QLSk4/KvoQh5R6A0lN6EDUcK8WmX0mMttFg5WooJ+3kQTkaLDl2l5GfnUGiMo1GOU4pgZrqtCSXXr7MuIG/VO39F1LUfSL6pDAY5cckp+KsxBglBt5iF2tgfZ6t/XACUztmWurB+yFXHONkry3bsqQSAAH3EgvCihJATrCSgZS7pF0n2Ig4FLjfS+B991zY9vHuoH5plW8BlRS1uFADLhlWciZHb9yp4L8P4WD+8bQQ5IiH41lRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 by PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 04:34:35 +0000
Received: from SJ0PR11MB6814.namprd11.prod.outlook.com
 ([fe80::d539:191c:91b1:6b5c]) by SJ0PR11MB6814.namprd11.prod.outlook.com
 ([fe80::d539:191c:91b1:6b5c%2]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 04:34:34 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Topic: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Index: AQHcj0MzgNJJB/6kHE2kGRyU5XzyvLVlroQAgAks4TA=
Date: Mon, 2 Feb 2026 04:34:34 +0000
Message-ID: <SJ0PR11MB6814588593033D58078E9839E59AA@SJ0PR11MB6814.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-8-sowmiya.s@intel.com>
 <DM3PPF208195D8D473384C8865D18E79369E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D473384C8865D18E79369E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6814:EE_|PH7PR11MB8570:EE_
x-ms-office365-filtering-correlation-id: a70a0de8-a370-444c-f6c0-08de62145e02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3wsLAUoxULCRSunQVmlNbltJj6ijuxGa/1WizRZ0ca/Q85HpBanWKmfYlmiA?=
 =?us-ascii?Q?tV9So3CcOvk/box5KFj3nk1/3VUr41n93FV4uISXazcjo37HyObyFmT0PepR?=
 =?us-ascii?Q?A+WB7ahqsD+fbYrtQRR2ZoNtK8Sai2lXN3Msa3UQZt6nLNofiNHtpzr318ZI?=
 =?us-ascii?Q?psgruOofGod77i59xdpcsFSPBIbVJ+EzMCvtamMyuk87gC2H84qqomrQSupn?=
 =?us-ascii?Q?6EIa+3xoDNECRp+4Aq3ZdSUj957uf1p/lvHMkALyzCK2N0V7TnY2FETPdAP6?=
 =?us-ascii?Q?knO5q1fyXeFEjVEuPHqZdk7C34+Bz1+esQCEOopnYVOV9obx/Pm10BZw8PMR?=
 =?us-ascii?Q?bVUdJ/9NWqvP6Z6vF92TY+Hr6N440N2yp4fRohzvEYjWMIUXlLwy0RThzPuP?=
 =?us-ascii?Q?yrQIaFUpg4+5npcvmpLw4qMSgeyQDy5G3FQEIPY8obO83nay6yzPOW2y0Zqr?=
 =?us-ascii?Q?5rk6T0sXD7m4Efg8lbxf+P5vQQ41DooPQbKExxN/F1DPWjqXClif9w8H8JMY?=
 =?us-ascii?Q?v5TtzW9kQSn8P0v6z8X+LP/Xli5tl2XkWU8HWC4vfBPIVbLf3ZoegaH8zPet?=
 =?us-ascii?Q?28D8aQLimE7sGMpfRyfg6zmfHWsIcgIu8tvLZplYkw3m//RZ/Tft50Uib7Lr?=
 =?us-ascii?Q?DTbsMx7QMG7XDFdXHdanFL9Ye8thPtu/yqdnDHMo7xpbM01AecC0UHqoeHMF?=
 =?us-ascii?Q?9ruhYHhQ8bYvvwmdClSqIFvpE5Z5eb7ncBcUeAAMLf1UXSihSrhrnunOknfO?=
 =?us-ascii?Q?cxA9wfrKwDTK6VwSkhKaHReMo/RBfPSiRprpQXBKxpPHF3+BpolOnVK9K2R9?=
 =?us-ascii?Q?o4qtT4432/69pr3a1BZjZKW4ErrVzgV/Qc6leMgVFqHtBdJVpYMqd74LKAMO?=
 =?us-ascii?Q?TpC0cVYJNvb5DaAiFpR4scJt1+yI6lFbg4FPoG0B9tJRAKYZv+3YVShSY6QW?=
 =?us-ascii?Q?eqEGwxf6LYgvXJtZw6sG+jWfpN6pUknRyQdhd22qsiHx3J/UdP12pauCCBj4?=
 =?us-ascii?Q?Nst+/6CIEMeH17T4KVInwPeSyJbTfaC01TjYH3lErKr/2Eo13H/q6Y98P6au?=
 =?us-ascii?Q?08ANtIJKus8tqCbditIjjZQY7Vt7CFzCynhvSZNhhnS2lw5z6rHk/Uom2Mrv?=
 =?us-ascii?Q?5yrxYReGN2tZ6kRmFjMSkL5/awU1vouQN7wgvD/ejhh4ZWqxbTDAXsxKCBB5?=
 =?us-ascii?Q?hYvGJWZwD6jBW9rgWzBQTv06yTuJOZ2WJq6+zf6e1vbc8YMPyMrL7sWgbNZx?=
 =?us-ascii?Q?cYW3sVV4HfMR3PJX2614o5xL/bFN/oNsoFu+EeGDbSseMesbg+eL+bupcQSa?=
 =?us-ascii?Q?WFWyS6ae5Z+Dgn8pTL7ttaOH5ttdr9dN3Rr03aXOPDy362J+m1R3jdkwHPvq?=
 =?us-ascii?Q?m1mxbGTj8eqhn7DE2DSXBL03nPj2fnJTAz3OzcQM0dAQ5ZxUez9gxc5VYImN?=
 =?us-ascii?Q?wKG2KLG5ipSm/rja8vwC4qoHTl5AZtxSWy7W9L14fh9VpeVlLlsi19EkMe0f?=
 =?us-ascii?Q?qM6KSmzs27QLgrV8wMwD/UdIzf0I10YMrPIBRFNm2n6SOrkd0oqqVP4irwRb?=
 =?us-ascii?Q?dCLRhwiQymjZ2WqSps4Sib/v6dIIP813vSm3n/QIUWTr1w/paQatOCNXXVot?=
 =?us-ascii?Q?caC402sANspe9FRH7y11RzM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6814.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XPqmNCl4oBY/P9KrkHM9SjaHY8J2+yTNk/dJJ8OXfCX/iYhWYL4qb9PbAsh8?=
 =?us-ascii?Q?ivLLByL59jb2SUYyR6b5gbd7rpE3YchESqM4HuFnKL7xWyjgJG35hlafDC/2?=
 =?us-ascii?Q?DhnxPJvxLJ4xbF26N5gy+qKnEklZB4jtKmFLjagw4tn4h/SECxC1aJaD0rz7?=
 =?us-ascii?Q?91pQX+1ESsoAxIFYfSUhsUnMnczgMkhm3E4vctj9NXbB0urTUP2pGyWh5CV6?=
 =?us-ascii?Q?+FzJqOdxyPwyvuSi/qjuMlkkgMwoXP+i+Dwg7l0wQxRyKHs6mronTsv5Mxrn?=
 =?us-ascii?Q?Tz/1B0s2MUwnnFk1zqtH+D1HMWw6OugKEgY1bJOz0kfNlGZtp7jH/14zmDe9?=
 =?us-ascii?Q?W86TlfpTohVAmBdL+DMjMc1B+w1734QrFHPbS8GfYlERg9B+0aG1TG5w4nkp?=
 =?us-ascii?Q?silGs26T5K4GFzqEbxQgEwH+mmHR9ZsHDWtmxaMznv3ClrWF8Po9mSWacnqL?=
 =?us-ascii?Q?eW8antbjJFrM68xLu0xAJ++fgmz3tKpkvLqIUZGRYtXyAjQ0mjyaLfTGRBVm?=
 =?us-ascii?Q?vMCvCoGUWOkC5THh9o7LJFHExb26q5xpFJAzT0rIF8C+XL0CXdb4naJW/DKo?=
 =?us-ascii?Q?bhWArgd/jOZDDufdBr+MH1sTzL//kO5LArUlxudYYdIppiF71j7NXNpx1iTP?=
 =?us-ascii?Q?K5D+w50gUBh7IpmU/EoEDeX4v50up51sFJb+kGKd2cmgt8T2SHpgp+ih49cQ?=
 =?us-ascii?Q?eJrmHJn+wWvjV9cesSFMNKavc28lUPwl3bBdIQxj4wCAc2X/4MPfZ/dd4vzq?=
 =?us-ascii?Q?k35+JiyagNBEE6j1GLR5NVD6YS2xfvYmprMH6K6GbR9smGshIlertHFjxAr5?=
 =?us-ascii?Q?lfC3NOd5QqmGYTV59KotIVwmTXD09QDu34Ja4w/OKUQkrJCwu3U54JVoP6VA?=
 =?us-ascii?Q?yp9vSMluLSa7xYqN4fOt2DRORbB7pWhO2i7raS1hc8Y6V0dy1dTKInLAaO3E?=
 =?us-ascii?Q?xmXACKr1jg+m7632z9uCdPPGS7paAXYi814wxSXNZwWbixpigIWpMx3TiJC2?=
 =?us-ascii?Q?VJ44AcDl8t9Y+2a23q3lrRpDPsbKGDqKFEIXl/tfMDNZaFlmFl7q4e0z3p+C?=
 =?us-ascii?Q?led5dFST/ZIT1ucD7R1N2IE0IlccS1yLEChTfnxFf4ORo46RXdePzS3SR2Y5?=
 =?us-ascii?Q?Oj3HlOol0u7etiYkWBZrszUUSuLKKpstzKXMxDUWG+F1W+dIgKvRpXV4eIKZ?=
 =?us-ascii?Q?DU2djO4/th0D3+F7Ndk1V2eEcaObf4iXAhyVNB+tkJTCWycUrVZAMV9Z/2SV?=
 =?us-ascii?Q?3qlkiim/fMrevdLdEsKI2P1vx+N6vW5995npPVqOwjuSeiL+fCO5dYmvBG7D?=
 =?us-ascii?Q?WbWp73qHuAuH0VZWidAA2KI91vwGa5N4Hz8oMkQ/yKAiTyyvEEg3CXXSqEfU?=
 =?us-ascii?Q?DuIxhT3DSDbAInGJF7CDK3T8VaRIdyzrNOeYQW1udu9/3Og98O3AjzUDmSYg?=
 =?us-ascii?Q?S86eZ6a2cnRGcOU34xe52yRMcBU+0UHP00KBZVIxsMJEo2B1rtarWjvOKFmi?=
 =?us-ascii?Q?csvSBz8oGg4GwB5HYSQSqUCahNI12ipKCuHAODq20AnZxAqxQfIFa9TIBx/1?=
 =?us-ascii?Q?KyA8BrDzqhAGMK8PBcE5nspzuUTHEsBQ2ftqhIEx4el8q5TfHVwijpmV4a1B?=
 =?us-ascii?Q?uGmRsrFXoa2oPmsMnmePfEqs29CzrREWPj6GA0yU1Dptsa7BXFi13nJR+fma?=
 =?us-ascii?Q?bBC3wO1a2MPKIv4GGmrh508+jHNz7RpNb5XPcuc3jb2XWwlL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6814.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70a0de8-a370-444c-f6c0-08de62145e02
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 04:34:34.8953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23TKhFOEXw+2Y2KyGlDoS8jJYiVdKq1TizbXUDlve7c+ph/O3fylOS4ywXpCOiiWh/Wilfsst3apS5qpYECFJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8570
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

Hi Suraj,

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 27 January 2026 13:56
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> invalid_fb parameter
>=20
> > Subject: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> > invalid_fb parameter
> >
> > Remove the invalid_fb/output_fb parameter since it is not used
> > anywhere in the test. Reuse the fixture's input_fb for both 8-bit and
> > 10-bit formats to simplify the setup.
> >
> > v7: Remove invalid_fb in a separate patch as per review (Suraj)
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 58118b8da..8d5bf5294 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -297,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> > *output, igt_fb_t *valid_fb, ig
> >  	}
> >  }
> >
> > -static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb,
> > igt_fb_t
> > *invalid_fb)
> > +static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
> >  {
> >
> >  	int ret;
> > @@ -706,19 +706,11 @@ int igt_main_args("b:c:f:dl", long_options,
> > help_str, opt_handler, NULL)
> >  			    (!strstr(igt_format_str(test_format), "BGR")))
> >  				continue;
> >  			igt_dynamic_f("writeback-fb-id-%s",
> > igt_format_str(test_format)) {
> > -				igt_fb_t output_fb;
> > -
> > -				fb_id =3D igt_create_fb(display.drm_fd,
> > mode.hdisplay, mode.vdisplay,
> > -
> > get_default_fb_format(&display, bpc),
> > -						      igt_fb_mod_to_tiling(0),
> > -						      &output_fb);
> > -
>=20
> Why delete these lines this patch is simply supposed to remove the param
> invalid_fb since no one uses this All these deletions go in the next patc=
h
>=20
> Regards,
> Suraj Kandpal
>=20
While removing invalid_fb, we need to remove the actual parameter output_fb
from the function (ie:)output_fb. So removed it here only.

Regards,
Sowmiya
> >  				igt_skip_on(data.dump_check ||
> > data.list_modes);
> >  				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> >  					      "DRM_FORMAT_%s is not
> > supported\n",
> >  					      igt_format_str(test_format));
> > -				writeback_fb_id(output, &input_fb,
> > &output_fb);
> > -				igt_remove_fb(display.drm_fd, &output_fb);
> > +				writeback_fb_id(output, (bpc =3D=3D 8) ?
> > &input_fb : &input_fb_10bit);
> >  			}
> >  		}
> >  	}
> > --
> > 2.43.0


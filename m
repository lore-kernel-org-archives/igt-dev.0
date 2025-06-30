Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BB6C83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 14:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11E110E464;
	Mon, 30 Jun 2025 14:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4Ho2QEc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EFB10E464
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751293960; x=1782829960;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oYF+pgrqT2kHYr0SMIaXqxyiK/LhPeeHCDh9LgWQEwE=;
 b=I4Ho2QEcSLRga4KmYmDK8anLya6hiuLI/a0MX8rFvRsNOtRBgz77K5V0
 CIak7Dgfvi8YCNeOKFFSVPtMmKB6KUVtxACO3dou6qeKHye/yXsGzeZjg
 NFJN5ACFyuV0r9Y1RALMkeuDl9k9vRfKYq2LTU0N8e6o6o2e4YSRT1bUE
 sE+OsEPgc9jYdY5bM4BOMbQMTxGQRdeDzZYA0ghMqPx9kovEHlWDddOw4
 xn0QTnkK9wLiKPFgyhjDZC0hZvFTEKEgssSUKGlV78q6ZpZfYTNlGP7hY
 pBJ9xTZLjEGydbM3RvI08QDD32PnxiLDyEprzKCL+mj7L47TdEdqsT/su Q==;
X-CSE-ConnectionGUID: njLXG+74QuCr874MW1dxSg==
X-CSE-MsgGUID: xRnuWUpcRw2e00Z5+klGdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53246170"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="53246170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 07:32:40 -0700
X-CSE-ConnectionGUID: ATT3SJYVSUujN7k19C0aag==
X-CSE-MsgGUID: SeAfDZrsShu0hslBTztyzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="154187634"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 07:32:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 07:32:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 07:32:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 07:32:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSI3q0I+Zv1M0QZ64tVvxluocCOo7EAP+kFvU7zOrMf17nTPulfTjM9NOrKF6jwauSACfcwS5wDtLw+WKpIvOA+26u3y47ACGTiHOeAr/TvnKDNmNm1mzrvaWJyl/1INI+6kpCMkEHUF66ZDNRi9Vb3ov7yESDf8Nbh4Q8krX0clAB7+YRkWhwr0BkFBEFhcfNKMbp6s8QHhAARGnJ4KMZ8wTeiBsfzmteNNPPZJLViiBttComdLwHKfuqUgNcvPM4PBJ+sC6FwvWFXmtsEe/vzhvlJ6r4JHPJCpYQY3/EvD2Gp0Z/aYEptYkMJzCwfCqCDke0Ead3VKBFYjzFpBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCaI1EQ7+cjVs2+meaOszHtON6o1/Hnp9dNEMW+JmSw=;
 b=d+OepBVzmDfGOIDs4IDxN1f2tX/5ARmSD7qDsYkKLFEceEk+YCkquqPdMTOd1+UtDECXYt9l2UhLUnkQODbfcWkSRUM+axnEcZDmNtE31MKnYdVndolA4vI/FqH1dv/Axow7J0+WwKYmUO2J4UCm25blSDUebRepelfSzbXxkoaYvAnjz0wbHTqkpiPkL0vrHLOTrZuaJznGuS3yqsAp49iBg+5IU+leChuYILAqPYi1/fIRnULtI8A+Pw6nDs5gZrVqn2oTIbPoECHJCOTI4xMt+IRbV6EUA4nQRzzbczDqAhrep2Mch++S4/ir31cE0JXbt4f+bdNTWGdPTBAN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DM3PPF4D011AE7D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 30 Jun
 2025 14:31:59 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 14:31:59 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "david.e.box@linux.intel.com"
 <david.e.box@linux.intel.com>
Subject: RE: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
Thread-Topic: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
Thread-Index: AQHb56T5+ptjFnBidU6gEj+vu5M6obQXh44AgAQ/l/A=
Date: Mon, 30 Jun 2025 14:31:59 +0000
Message-ID: <IA1PR11MB6418FD2E50273B2DCB945ECFC146A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250627204846.521691-1-michael.j.ruhl@intel.com>
 <aF8OqgWWgPT1PE-I@intel.com>
In-Reply-To: <aF8OqgWWgPT1PE-I@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DM3PPF4D011AE7D:EE_
x-ms-office365-filtering-correlation-id: a2735435-8fea-4c63-0e80-08ddb7e2df5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6aXr1s5y5moQlCH9ooI2q3syZ0Yi57FR6EEfwYotquPKl8SVVAr296lfVE3x?=
 =?us-ascii?Q?L9POWJvsyQpOeXTWbcizbYxnZTWM+zionXfgE/Pkk73SE1SEA2qjmtGmufU4?=
 =?us-ascii?Q?4jYJer0YBKG7bV2hUhR32TPxQpBH6agyOZ6s8OtLo6MCW7yFo7wuJY8d3TRy?=
 =?us-ascii?Q?DsUCKXLi046hC1zMDJoCrrPOAw9h3SBByIsC/mpq8C1CdtpCSkC1hlvvEZjD?=
 =?us-ascii?Q?ZSzerLOCN0fS9wT5qbveXu9OKmBz5hM40b4HEzkWJgi5t6OYwvvJTccYfjjT?=
 =?us-ascii?Q?wBtLAqdoNPd+RXrcbF96B6DWZ+LEdOEXEQ+HhsyDRCzmRTBuOfLSlD4ZOZ/8?=
 =?us-ascii?Q?kxhBaPjkpd/vvwx0OKWkvC9BW3jnMd6mohg59Ze/oUVpx5mffAywecF9zp4Y?=
 =?us-ascii?Q?oM+KLebkjC99XAr40BzV1zla+sYw2xGkWZLXkrS8WJSijsJMVKq7eeWXPCIv?=
 =?us-ascii?Q?esRyjgPh+cdVqJkGiWyuXBPqXaN2KT9LG4taFNLU/0otAkKQ3NvWCRkSTJNJ?=
 =?us-ascii?Q?pr2KrZDsetKTdGU3trMyCezCtJ5A1hAUWHTBoa7S2GmU9wya5X8oRZjYknGq?=
 =?us-ascii?Q?5FsBZ1055N17maAmKuGoRzMzPysjfqXfpVAGBfZF0WSx1KC3zDhONWEML5/m?=
 =?us-ascii?Q?MAgVZr49SXiLVD/ch2V2HNR+PCzjP+ejEEY84Yqio4WW/VSfRquZHJL9jSrI?=
 =?us-ascii?Q?PdwZX7OQ0UdvJlQ6lFADBSiOsx45tjTWp8l1CMwX1puN1IwVNzFm+8Q4iGo1?=
 =?us-ascii?Q?/SngOSHyvaEUNS4YOj3iMRGI7jvBrmnpej+cyZ3NeIBJE9rQgfAHc3I+grEy?=
 =?us-ascii?Q?zVhASg0Y+4uDT2VcYKZbWsT1+SfiI5jhMihp/r5+3JF/Tjg3JFJYhE2bUNjE?=
 =?us-ascii?Q?yOQGGTTahFO2GoFd9aPRaYM9MbtkWNV29PvS8jQ2OdKhCMVWcTnM8JztJ9VK?=
 =?us-ascii?Q?JwSjhwyOQIWQwQeh3d2DvUJI9eUYhwytdFE8XvLkx4X6nkOUpW37OIIr9DJ+?=
 =?us-ascii?Q?Nr1CKVCt5Wqr63O4VysG9+81ztaufaEyCmi9nfs7nbq65y6bWTHvDT3c/7/7?=
 =?us-ascii?Q?MpJG6qQkpjU2/vcXpFB6VG8ZydshFH7pEaKBXaSGRiNU41eidrk03yRwX8DJ?=
 =?us-ascii?Q?g78YXbPQn3f1sCA1YAPfu7Z6mxJRSgs9c3glimcR760ySrPDMvfo9bfibZgv?=
 =?us-ascii?Q?HoShaeyH4bTM3C/wI1eD9bIk6APYXA4hjU+/mzoHcO6uoKroxKeV4DyDF2FT?=
 =?us-ascii?Q?EBan3QW9S9Ksuz085ZyL27EOig7Q4vprx0qbjqa2jOiPjvWvKjUB7KPJPjtt?=
 =?us-ascii?Q?CPyoQvLxFr4s9UHhN9L+6W2nYGRm9tolUJteqWddYXjw5m+4yMiHTIkZmUSr?=
 =?us-ascii?Q?YjRZ/d1v79ktiVl/2VoFwNvNlaJdMD1zl+1NEEWQyhnEeUtKDTOFPdc59X6q?=
 =?us-ascii?Q?+CkKvyi6TNMFJa40ljNAR30o0wSz2gIEOainTPguHoeihML/+igvv6txhvLb?=
 =?us-ascii?Q?/U5a/4AsuD1RxTg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yLDHb8uwY8KQPnaqFMENLRnW7IwoLxDOQBzGSWFc5GWw1y1oUqlMa1coieGl?=
 =?us-ascii?Q?ok86PNqoL6Tg/3lyYbrBp+QpU1oLRinLtYradxmRWn8chDggcN5Z3NSakBud?=
 =?us-ascii?Q?aukgfTvys6/CiTYEgdcbVrx4PeP5ytMvWoW1S66DJ46vK3O1QF3+ZySywKEH?=
 =?us-ascii?Q?vk06TytVcFxQw7UBtDiXwRmRsq6JxrNAEKwlqPoDc44mGcIUBoCUfCBa8yv1?=
 =?us-ascii?Q?YO+MVjbsGU8OF/Tq4aXKz/Af552gRzIGe5rZ2qBugJqXF4khG/VSD3FPrVtB?=
 =?us-ascii?Q?Ha8vm5oEwRXqsagkxC5bBBXvjlLcjZFZ1Z4jwUG9GgLP0dUwymMoVEVejV98?=
 =?us-ascii?Q?ug7R0zeVsneRDSA+H1BM2jJ2V0gXZuS70ThNMnL84GaLk0Oz/sTOQuY+q2Jb?=
 =?us-ascii?Q?64b06/S8okLC13X2h7Aq9jzIW4KLMngjQ2bqONLtS2OeBUZiLgY4QduzNDZv?=
 =?us-ascii?Q?Lizbl6jM1sewOl2E0mOyvru4MB7MrbnPZQqY6ACrlH/57OyY8Qh6jsKlFLqW?=
 =?us-ascii?Q?0PoAQRYR2CEARPLsEX53iZ5BDnZT/EBKNtF+EcsgfTa3oZGNf0JS9kYP0yaN?=
 =?us-ascii?Q?BPgU6THaHMhn1t1av+CUiA9QDI4BDJ5YJ9D81ErHbO2B8PvK9jtd548oecRA?=
 =?us-ascii?Q?dwiLfQdT3Bs2/ixTkLLoeQ3TgU3AfuXVR2ikI5uW+TvHj/F5jfOBLjg3ryDM?=
 =?us-ascii?Q?DfL3Co5Pf0rkMUfpWNkhVlUoVBcuxjhCKQTUo1hAt6yY0LWNO67Ff01uYMOz?=
 =?us-ascii?Q?v8kDeMmAJNeX+30Sxnd5gj5TKg4VMRjto+eAZ1GmBcc9yAKt4QV5IRJt7bMi?=
 =?us-ascii?Q?q5EMr8TcS/O2Xt19lS22YTelLFhlFhc9p3TDxWI2FsfCKkvwYBUG3g9iAj+9?=
 =?us-ascii?Q?io4TYg1Ft/p9+9YxceWVhzSlPr1V+x5aVfB24d9UUujiPdU5LWCmVZI5fYPI?=
 =?us-ascii?Q?fH/OXrAyihWBse1Yu0X9PwxgoNhVzmCmHETmtmgYdbv2sQl5vWgOsRysZfVz?=
 =?us-ascii?Q?NtPUC5Fp7LGzeS9HZ7l19tALCkgfer7kuY+I19Z+pP8dWcJIu+fz87jv2JGs?=
 =?us-ascii?Q?yj9Uh3fPAjJp3OHSlY/O4cHMFQ17JhK6PyjZNL+gL6su/5Igs0/ZOI1R4D4m?=
 =?us-ascii?Q?KaoMIMF+pOO+w1YBVXzS6m597p8X1jpjjedEdh6L/W6owZN4YZPQMCLacLGX?=
 =?us-ascii?Q?gHkYcd//0nTb5HaAyMv2dSiakHZpEL4AzbrkmE3uNoMdzLVOPajpw5k2FFoB?=
 =?us-ascii?Q?H+x3Qg8xcog3B4eSOuD6cFrglXdFrV8UKl2SpgDj6RdEN2A4rvel1m9gg4nG?=
 =?us-ascii?Q?WltjvNkkIrZHbkYAwixv4G6H2WL/grxPRIMxM52CU70e8xFNw8nl4LOMjuhu?=
 =?us-ascii?Q?pLPkxQC2w6mrM8HFwYWJ95eeMpbb8XMKrUgOMi8+EtE90PI7X28e6LAP9WGL?=
 =?us-ascii?Q?1SDGp9Fj0YckOI/bFu5jiEBzAY/L0laEWkaGcgHX4TfjwGPpj+0W8o+WElX7?=
 =?us-ascii?Q?6WRWx0WePXLTJfVnqd4JK8T/5fBj5zQno80CH0SOHsE34KS5Bqluhi5trHii?=
 =?us-ascii?Q?bPtaRBG2PBkwwjlEKsNFUhjayoA0wGtIUAU4fYUH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2735435-8fea-4c63-0e80-08ddb7e2df5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 14:31:59.4046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATFsOJuUqI5BgxQKwwlyrjMENphsX9QWK74wy4PXq6/kax+LBF7xlszSywA5GR/n+su/TZ+EA2brXiErv/e6PaGsXp3+uFTJx2/HAVGGGKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4D011AE7D
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

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Friday, June 27, 2025 5:36 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: igt-dev@lists.freedesktop.org; De Marchi, Lucas
><lucas.demarchi@intel.com>; david.e.box@linux.intel.com
>Subject: Re: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
>
>On Fri, Jun 27, 2025 at 04:48:42PM -0400, Michael J. Ruhl wrote:
>> The BMG devices has the PMT crashlog feature. If the devices present
>> is a BMG, test PMT api.
>>
>> NOTE: the testing order is not flexible and must be done in
>> the currently specified order.
>
>Hmm.... I believe it is safer to create a single testcase then,
>without subtests, or a single subtest with the right order only.

Ok, I will explore that (one test) path.

>BTW, this current flow here is okay to go without rebooting the
>machine and running this entire flow again?

Once the crashlog is triggered, the machine will have to be rebooted (cold =
restart).

There is currently discussions as to how or if this requirement can be chan=
ged, but the current
use case requires the cold reboot.

M

>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  tests/intel/xe_pmt.c | 561
>+++++++++++++++++++++++++++++++++++++++++++
>>  tests/meson.build    |   1 +
>>  2 files changed, 562 insertions(+)
>>  create mode 100644 tests/intel/xe_pmt.c
>>
>> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
>> new file mode 100644
>> index 000000000..21a2e74e7
>> --- /dev/null
>> +++ b/tests/intel/xe_pmt.c
>> @@ -0,0 +1,561 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright (c) 2025 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Verify BMG PMT files operations
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: sysfs
>> + * Description: Verify BMG PMT files are created and are accessable
>> + */
>> +
>> +#include <dirent.h>
>> +#include <limits.h>
>> +#include <string.h>
>> +#include <fcntl.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +#include "linux_scaffold.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>> +/* base directory names */
>> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
>> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
>> +#define CRASHLOG_DIR "crashlog"
>> +#define TELEMETRY_DIR "telem"
>> +#define BMG_CRASHLOG_CNT 2
>> +#define BMG_TELEMETRY_CNT 2
>> +
>> +enum bmg_crashlog_instances {
>> +	bmg_crashlog_punit =3D 0,
>> +	bmg_crashlog_oobmsm,
>> +	bmg_crashlog_max
>> +};
>> +
>> +enum bmg_telemety_instances {
>> +	bmg_telemetry_punit =3D 0,
>> +	bmg_telemetry_oobmsm,
>> +	bmg_telemetry_max
>> +};
>> +
>> +static char dev_path[PATH_MAX];
>> +static char work_path[PATH_MAX * 2];
>> +
>> +/*
>> + * In most case there should be a single instance of crashlog an teleme=
try
>directories.
>> + * If DVSEC entries are separate the structure will be different.
>> + */
>> +static char crashlog_vsec_dir[32];
>> +static char telemetry_vsec_dir[32];
>> +
>> +/* This needs to be specific for each supported device */
>> +static char crashlog_dir[bmg_crashlog_max][32];
>> +static char telemetry_dir[bmg_telemetry_max][32];
>> +
>> +/* telemetry file names */
>> +static const char *telem =3D "telem";
>> +
>> +/* crashlog filenames and descriptors */
>> +static const char *clear =3D "clear";
>> +static const char *consumed =3D "consumed";
>> +static const char *crashlog =3D "crashlog";
>> +static const char *enable =3D "enable";
>> +static const char *error =3D "error";
>> +static const char *dev_guid =3D "guid";
>> +static const char *rearm =3D "rearm";
>> +static const char *trigger =3D "trigger";
>> +
>> +struct crashlog_v2_info {
>> +	int clear_fd;
>> +	int consumed_fd;
>> +	int crashlog_fd;
>> +	int enable_fd;
>> +	int error_fd;
>> +	int guid_fd;
>> +	int rearm_fd;
>> +	int trigger_fd;
>> +	u_int32_t guid;
>> +} bmg_info[bmg_crashlog_max];
>> +
>> +#define DEV_PATH_LEN 80
>> +
>> +/**
>> + * device_sysfs_path:
>> + * @fd: opened device file descriptor
>> + * @path: buffer to store sysfs path to device directory
>> + *
>> + * Returns:
>> + * On successfull path resolution sysfs path to device directory,
>> + * NULL otherwise
>> + */
>> +static char *device_sysfs_path(int fd, char *path)
>> +{
>> +        char sysfs[DEV_PATH_LEN];
>> +
>> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
>> +                return NULL;
>> +
>> +        if (DEV_PATH_LEN <=3D (strlen(sysfs) + strlen("/device")))
>> +                return NULL;
>> +
>> +        strcat(sysfs, "/device");
>> +
>> +        return realpath(sysfs, path);
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_directories
>> + * BMG PMT directory structure:
>> + * device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
>> + * device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
>> + *
>> + * If this is done for a different platform, this could be
>> + * different.
>> + *
>> + */
>> +static void test_pmt_directories(int dev_fd)
>> +{
>> +	struct dirent *ent;
>> +	int index;
>> +	DIR *dir;
>> +
>> +        igt_assert(device_sysfs_path(dev_fd, dev_path));
>> +
>> +	/* verify top level PMT directories */
>> +	dir =3D opendir(dev_path);
>> +	igt_assert_f(dir, "no directories found\n");
>> +
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name,
>sizeof(VSEC_CRASHLOG_DIR) - 1) =3D=3D 0)
>> +			strcpy(crashlog_vsec_dir, ent->d_name);
>> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name,
>sizeof(VSEC_TELEMETRY_DIR) - 1) =3D=3D 0)
>> +			strcpy(telemetry_vsec_dir, ent->d_name);
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n"=
);
>> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry
>directory\n");
>> +
>> +	/* verify crashlog directory structure */
>> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir,
>"intel_pmt");
>> +
>> +	dir =3D opendir(work_path);
>> +	igt_assert_f(dir, "no intel_pmt directories found\n");
>> +
>> +	index =3D 0;
>> +	/* find the crashlog<x> directory instances */
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(CRASHLOG_DIR, ent->d_name,
>sizeof(CRASHLOG_DIR) - 1) =3D=3D 0) {
>> +			if (index < bmg_crashlog_max)
>> +				strcpy(crashlog_dir[index], ent->d_name);
>> +			index++;
>> +		}
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(index =3D=3D bmg_crashlog_max, "too many crashlog entries
>%d\n", index);
>> +	for (int i =3D 0; i < ARRAY_SIZE(crashlog_dir); i++)
>> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d]
>directory\n", i);
>> +
>> +	/* verify telemetry directory structure */
>> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir,
>"intel_pmt");
>> +
>> +	dir =3D opendir(work_path);
>> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
>> +
>> +	index =3D 0;
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(TELEMETRY_DIR, ent->d_name,
>sizeof(TELEMETRY_DIR) - 1) =3D=3D 0) {
>> +			if (index < BMG_TELEMETRY_CNT)
>> +				strcpy(telemetry_dir[index], ent->d_name);
>> +			index++;
>> +		}
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(index =3D=3D bmg_telemetry_max, "too many telemetry entri=
es
>%d\n", index);
>> +	for (int i =3D 0; i < ARRAY_SIZE(telemetry_dir); i++)
>> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d]
>directory\n", i);
>> +
>> +}
>> +
>> +static void find_pmt_file(const char *path, const char *file)
>> +{
>> +	struct dirent *ent;
>> +	bool found;
>> +	DIR *dir;
>> +
>> +	dir =3D opendir(path);
>> +	igt_assert_f(dir, "no intel_pmt directories found\n");
>> +
>> +	found =3D false;
>> +	while ((ent =3D readdir(dir)) !=3D NULL)
>> +		if (strcmp(file, ent->d_name) =3D=3D 0)
>> +			found =3D true;
>> +	closedir(dir);
>> +
>> +	igt_assert_f(found, "missing %s from %s\n", file, path);
>> +}
>> +
>> +static void open_pmt_file(const char *path, const char *file, int *fd, =
int flags)
>> +{
>> +	char file_path[PATH_MAX];
>> +
>> +	sprintf(file_path, "%s/%s", path, file);
>> +
>> +	*fd =3D open(file_path, flags);
>> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
>> +
>> +	/* TODO: match flags to file attributes */
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_telemetry_files
>> + * Description: validate the expected telemetry file(s)
>> + * Test category: functionality test
>> + *
>> + */
>> +static void test_pmt_telemetry_files(int dev_fd)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < BMG_TELEMETRY_CNT; i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>telemetry_vsec_dir,
>> +			"intel_pmt", telemetry_dir[i]);
>> +		find_pmt_file(work_path, telem);
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_crashlog_files
>> + * Description: validate the expected crashlog files
>> + * Test category: functionality test
>> + *
>> + */
>> +static void test_pmt_crashlog_files(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	int ret;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>crashlog_vsec_dir, "intel_pmt",
>> +			crashlog_dir[i]);
>> +
>> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, consumed,
>&bmg_info[i].consumed_fd, O_RDWR);
>> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd,
>O_RDWR);
>> +
>> +		ret =3D pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
>> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
>> +		bmg_info[i].guid =3D strtol(buf, NULL, 16);
>> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device
>%d\n", i);
>> +	}
>> +}
>> +
>> +#define ENABLE_MSG "1\n"
>> +#define DISABLE_MSG "0\n"
>> +
>> +static bool send_msg(int fd, const char *msg, const char *file) {
>> +	size_t len =3D strlen(msg);
>> +	int ret;
>> +
>> +	errno =3D 0;
>> +	ret =3D pwrite(fd, msg, len, 0);
>> +	if (ret !=3D len)
>> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
>> +			 errno);
>> +
>> +	return ret =3D=3D len;
>> +}
>> +
>> +static bool verify_msg(int fd, const char *msg, const char *file) {
>> +	size_t len =3D strlen(msg);
>> +	char buf[32] =3D {};
>> +	int ret;
>> +
>> +	errno =3D 0;
>> +	ret =3D pread(fd, buf, sizeof(buf), 0);
>> +	if (ret !=3D len)
>> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
>errno);
>> +
>> +	return ret =3D=3D len && strcmp(buf, msg) =3D=3D 0;
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_crashlog_enable
>> + * Description: Set enable enable/disable bit and verify usage
>> + * Test category: functionality test
>> + *
>> + */
>> +static void test_pmt_crashlog_enable(int dev_fd)
>> +{
>> +	u_int32_t guid;
>> +	int fd;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		fd =3D bmg_info[i].enable_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* force enable so we are in a known state */
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send
>enable\n", guid);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x:
>verify enable\n", guid);
>> +
>> +		/* disable */
>> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send
>disable\n", guid);
>> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x:
>verify disable\n", guid);
>> +
>> +		/* re-enable so we can do more testing */
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-
>enable\n", guid);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x:
>verify re-enable\n", guid);
>> +	}
>> +
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_crashlog_clear
>> + * Description:
>> + *   Test the clear crashlog bit. After setting the crashlog data buffe=
r should be
>> + *   set to 0xdeadbeef.
>> + *   "0" (DISABLE_MSG) is written to the trigger file to set the clear =
bit.  BMG
>does
>> + *   writing to the clear file, but once the bit is set it cannot be cl=
eared with a
>> + *   reboot.  "0" to trigger is the "standard" usage, so test it.
>> + *
>> + * Test category: functionality test
>> + *
>> + */
>> +static void test_pmt_crashlog_clear(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t guid;
>> +	int crashlog_fd;
>> +	int trigger_fd;
>> +	int clear_fd;
>> +	int *val;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		clear_fd =3D bmg_info[i].clear_fd;
>> +		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> +		trigger_fd =3D bmg_info[i].trigger_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x:
>verify clear\n", guid);
>> +
>> +		/* set the clear bit (0 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: send enable\n", guid);
>> +
>> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x:
>clear set\n", guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>> +
>> +		/* wa punit issue for first crashlog (NOTE: this is fixed)*/
>> +		if (i =3D=3D 0)
>> +			val =3D (int *) &buf[32];
>> +		else
>> +			val =3D (int *)buf;
>> +
>> +		igt_assert_f(*val =3D=3D 0xdeadbeef, "0x%x: invalid clear data value:
>: 0x%x", guid, *val);
>> +	}
>> +
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_crashlog_consumed
>> + * Description:
>> + *   After a crashlog has been "consumed" (read), setting this bit can =
be done.
>> + *   Verify that it is set correctly.
>> + * Test category: functionality test
>> + *
>> + */
>> +static void test_pmt_crashlog_consumed(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int fd;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		fd =3D bmg_info[i].consumed_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* check, set, verify */
>> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x:
>consumed clear\n", guid);
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x:
>set consumed\n", guid);
>> +		/* sleep(1) to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x:
>verify consumed\n", guid);
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_crashlog_error
>> + * Description:
>> + *    The error bit is set when a crashlog fails in HW.  It is read onl=
y so only
>> + *    need to verify that it is "0".
>> + * Test category: functionality test
>> + *
>> + */
>> +static void test_pmt_crashlog_error(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		guid =3D bmg_info[i].guid;
>> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG,
>error), "0x%x: error clear\n", guid);
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_crashlog_rearm
>> + * Description:
>> + *    The rearm bit is set at cold boot.  It cannot be reset unless are=
 real
>crashlog
>> + *    occurs (i.e. setting trigger will not change its value).  Verify =
that it is "1".
>> + * Test category: functionality test
>> + *
>> + */
>> +static void test_pmt_crashlog_rearm(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		guid =3D bmg_info[i].guid;
>> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG,
>rearm), "0x%x: rearm set\n", guid);
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_crashlog_rearm_after_disable
>> + * Description:
>> + *    After a disable/enable sequence REARM will be set for PUNINT inst=
aces
>and
>> + *    clear for OOBMSM instances.
>> + *    Verify that the bits are set as expected
>> + *
>> + * Test category: functionality test
>> + *
>> + */
>> +static void test_pmt_crashlog_rearm_after_disable(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	i =3D bmg_crashlog_punit;
>> +	guid =3D bmg_info[i].guid;
>> +	igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm),
>"0x%x: rearm set\n", guid);
>> +
>> +	i =3D bmg_crashlog_oobmsm;
>> +	guid =3D bmg_info[i].guid;
>> +	igt_assert_f(verify_msg(bmg_info[i].rearm_fd, DISABLE_MSG, rearm),
>"0x%x: rearm set\n", guid);
>> +}
>> +
>> +/**
>> + * SUBTEST: test_pmt_crashlog_trigger
>> + * Description:
>> + *    Set the manual trigger bit and make sure the data is not 0xdeadbe=
ef
>> + * Test category: functionality test
>> + *
>> + */
>> +static void test_pmt_crashlog_trigger(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t *val;
>> +	int crashlog_fd;
>> +	int trigger_fd;
>> +	u_int32_t guid;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> +		trigger_fd =3D bmg_info[i].trigger_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: trigger clear\n",
>> +			     guid);
>> +		/* set the trigger bit (1 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: set trigger\n", guid);
>> +
>> +		/* sleep to let the HW do its thing */
>> +		sleep(1);
>> +
>> +		/* make sure the bit is set */
>> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: trigger not set\n",
>> +			     guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>> +
>> +		val =3D (u_int32_t *)buf;
>> +
>> +		igt_assert_f(*val !=3D 0xdeadbeef, "0x%x: invalid trigger value: :
>0x%x", guid, *val);
>> +	}
>> +}
>> +
>> +igt_main
>> +{
>> +	const struct {
>> +		const char *name;
>> +		void (*func)(int);
>> +	} funcs[] =3D {
>> +		/*
>> +		 * NOTE:
>> +		 *  o These tests are ordered.  Do not use them individualy
>unless you understand
>> +		 *    the underlying HW behavior
>> +		 *  o Testing MUST be done after a cold reset
>> +		 *  o Once crashlog is triggered the device needs a cold reset,
>and some of the
>> +		 *    tests cannot be done.
>> +		 *  Only change this order if you understand this feature.
>> +		 */
>> +		{ "pmt-directories", test_pmt_directories },
>> +		{ "pmt-telemetry-files", test_pmt_telemetry_files },
>> +		{ "pmt-crashlog-files", test_pmt_crashlog_files },
>> +		{ "pmt-crashlog-error", test_pmt_crashlog_error },
>> +		{ "pmt-crashlog-rearm", test_pmt_crashlog_rearm },
>> +		{ "pmt-crashlog-enable", test_pmt_crashlog_enable },
>> +		{ "pmt-crashlog-rearm_after_disable",
>test_pmt_crashlog_rearm_after_disable },
>> +		{ "pmt-crashlog-trigger", test_pmt_crashlog_trigger },
>> +		{ "pmt-crashlog-consumed", test_pmt_crashlog_consumed },
>> +		{ "pmt-crashlog-clear", test_pmt_crashlog_clear },
>> +		{ }
>> +	}, *f;
>> +	uint16_t dev_id;
>> +	int dev_fd;
>> +
>> +	igt_fixture
>> +		dev_fd =3D drm_open_driver(DRIVER_XE);
>> +
>> +	dev_id =3D intel_get_drm_devid(dev_fd);
>> +
>> +	if (IS_BATTLEMAGE(dev_id)) {
>> +		for (f =3D funcs; f->name; f++) {
>> +			igt_subtest_f("%s", f->name)
>> +				f->func(dev_fd);
>> +		}
>> +	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(dev_fd);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 9b87a0d24..4276e6967 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -315,6 +315,7 @@ intel_xe_progs =3D [
>>  	'xe_peer2peer',
>>  	'xe_pm',
>>  	'xe_pm_residency',
>> +	'xe_pmt',
>>  	'xe_pmu',
>>  	'xe_prime_self_import',
>>  	'xe_pxp',
>> --
>> 2.49.0
>>

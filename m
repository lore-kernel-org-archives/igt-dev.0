Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74561C5B549
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 13:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A4E10E2B7;
	Wed,  4 Jun 2025 13:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAGyH2om";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A1410E2B7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749044205; x=1780580205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A6Z9sKWtC6mEjTrwnd6tK4UpldOSQCBAi50CaFiTDQ4=;
 b=bAGyH2omQ+rvnOq86FYAC5Fd1UbBlk+eb34Loy9VfU0fjOWrNo+6/URV
 UttFyPrU8XJ3pGsfHg7BbcWBitRUbmQ8Dx9PJAhkOR2Vl4zXuS37oNPpa
 dKdMrU4cg7Wv32nBxjCpemAUuA2aT7KRVeCMZk0Kt4wqVqQz/DXBInU9c
 bPYeRme4LvXAjD+N2dO5cpsEKlzA3zpX2R6yE79Yp/MtunRnJ9d8VXzWg
 IyiSNkSkaWGEdmnRHJMsFgHkQGNp0B8cVCxYbY0cNQu0TrjvxkoEQI6rT
 QVjCNwtl2QpPWiBTQmbPGa/6mrpwckZ5T0j+FVcpJOyxxcyLrHrxekoaa g==;
X-CSE-ConnectionGUID: iusHcA+JTaWm1YCjQsOb4g==
X-CSE-MsgGUID: ONHfZfFyRyCTVgR9jUV97A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62515960"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="62515960"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 06:36:07 -0700
X-CSE-ConnectionGUID: Vj+2MBPQQja5P+COxGFBLw==
X-CSE-MsgGUID: ZQ1Hq48GRXmkHTS9gPI+gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145089740"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 06:36:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 06:36:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 06:36:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.62)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 06:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dD7oe75OB6kHJ1c/Y8U7eUlp6yYHZ0Ndmfaz41JKtJcDq051F/f4+vYBTlbHJZSM1EjJKuObVFQJnzDnTNyVz+mKLZqzLzOD9sQ+tQMnYs04ExCb6XEbVVEfoIuc6dEjvnATrnCoDIKNioM1Ua26kisz0BX9vCRvAM4Hpklox7h8OZmWzfavPbxFb7DI3iAWk25MvbWEUw5L1QUTCnIoQpWlWtsjzcLhxRtonmnPjM0scuTDWW3KGnjXvCCijIuWiRjcM6lfaf50Bz4YymEBrk8EbBJqdwJimtwwHL4AV8y2HpsQMjC3s7LJokYSWGSEBYtQEwYAQXYyo5PTxZXg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obXBtc66QRWxSOOdRW/lidTVrII7lr2db1pSMJ3RPG8=;
 b=RFmyFQTYQC+ePoX1L6vJq+ZGN24bmFSeTdLdPztp+a9xVazC6Ew0w3aLfj9okUo+AInmYYeZeGf2fLWEHYiEUURDFAGO8t7jBloC9jB+9aNPJiF8QBayHQiFj1gHkaUOYmtznBxKSyILFzJbsFyt32k8cJ2TJUXXIT5oxyUHXxaxzVS9lVcXQleU8PcKrR74U2WCiPUNifDkV3qbetG5j7Ac8faLB+wyabsIRjZhzgVZETxWLnUUc5rZxj4lQgsDR5lIZsWOFP9laGS3QAb/B/T9Payc3DSpdHq0VuK1aTJJinsmaxAes2CmZpEWP0UDFo0wQV4WX13sVFipjqnztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by IA3PR11MB9254.namprd11.prod.outlook.com (2603:10b6:208:573::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Wed, 4 Jun
 2025 13:35:11 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 13:35:10 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Laguna, Lukasz" <lukasz.laguna@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, Adam Miszczak <adam.miszczak@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/intel/xe_eu_stall: Use query IOCTL to
 check for EU stall support
Thread-Topic: [PATCH i-g-t 3/3] tests/intel/xe_eu_stall: Use query IOCTL to
 check for EU stall support
Thread-Index: AQHb1ONRxWrpOyIePUCiz9nCpyk9N7Py/luw
Date: Wed, 4 Jun 2025 13:35:09 +0000
Message-ID: <IA3PR11MB93041C7A86613289D3C2E1E3AC6CA@IA3PR11MB9304.namprd11.prod.outlook.com>
References: <b5b8323fe6840bff949b8607480d57104b908a1f.1748994982.git.harish.chegondi@intel.com>
 <0e894b0ab963e0e5b03b200f919e9318fe02de20.1748994982.git.harish.chegondi@intel.com>
In-Reply-To: <0e894b0ab963e0e5b03b200f919e9318fe02de20.1748994982.git.harish.chegondi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9304:EE_|IA3PR11MB9254:EE_
x-ms-office365-filtering-correlation-id: 9f7f53b8-2f6c-42fb-c88d-08dda36ca063
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wUxkyZYU25tWLqt5Sq9ZeP1b7ILDwFCMCCXzsnwyTrs4RyC6s1OMgt9n0+5X?=
 =?us-ascii?Q?hvmc37vXz4qnMgc+FiVeBcWK3gNhSr+0DjJG7BSH798dd41pRF8CNVdFZvKF?=
 =?us-ascii?Q?o7DleP0Dz48R7eIp1AzctAYvDTPXQnD2RaI2K7O8jH1d+vszdEmfCQHMdJyn?=
 =?us-ascii?Q?XTeiy+cGOnht/YReEPe2f5DGH2xfOoGdgN/cJdi0mzIDNQkxNrRo8Ys3t3td?=
 =?us-ascii?Q?RuacDZLmUsAt8XXXbNIcapiza2UaKbAO3Orom8ciTvPI7sPkjmRY7//uNVIE?=
 =?us-ascii?Q?8HmJUjK8cwDcNH4Hj16KcxDkaOItVm8yIW/L/B4jHIZu7fmLs8uIQXOr1nwP?=
 =?us-ascii?Q?sixdRPTVxFVQn+JQFdVDcngx3/Cg2p7nV4CyCPdujm+sG9h7Mm7kJQhxFvjA?=
 =?us-ascii?Q?5oAZc+Z+nFtXHRUDAeh5gFGV+kBx9xtAeil2bnoBJUNqobM5p5iOGZfNULK2?=
 =?us-ascii?Q?6BkcVc2w6JSDl/+Uw8/fww6jQgXrtCtCF5d3icwXW8EUD+RXQLD2zxdqbtrZ?=
 =?us-ascii?Q?oDY8hFOVSt4SDDLDLJMEkX7EYtGoR5raRe6qU5nxn4LQDh2IUh7NlW8+IbYm?=
 =?us-ascii?Q?J2vXwuckRiBNXCs0Cr6GO06qe+PTCgUBwIxkKti2NGLULedmekJkr1A4fgHV?=
 =?us-ascii?Q?MVAI6FKViolletqUzaDctPoQXmk1vT3cXddxSYFXn8iNqrtBksWmIHdheU25?=
 =?us-ascii?Q?WlBhRdU98cdeTIjVnPwgj+jGdJFXDQG+ac5Iozw1GJGx2JP1BTL+0UJPCnPg?=
 =?us-ascii?Q?ry62gXZEa4ZePRqX+1mYdytT9DemoETOpF23GUgLd/tHJXH3TLFE1TScWUXw?=
 =?us-ascii?Q?petmpubVwAaRgSlc7ewAcHzVD8TrztVTi9YOuGqOPT6+dJ7XglknND0ZomFo?=
 =?us-ascii?Q?Cpo15rpEBYytRHxtweIhc4J2phayymDqxEkzDB8brpQVsuqptbZIEuwJa709?=
 =?us-ascii?Q?8Fpaj0BigfZ95LZy5/TNVkdJY06dVePrnnezEw/trViCNftlVqK5tDmS7gtz?=
 =?us-ascii?Q?GogysTJGaMhpydtezdMB7ojAJVCphsNRe6GOerI5c2g8DikqmjS1bLVTE74G?=
 =?us-ascii?Q?1lJ+E3POHuXWZj0yZPILC1Xv2f+htKXXMmTwOIddDAmYEJfiFmTrfTgbKLsA?=
 =?us-ascii?Q?Y+YlI5YU2zgE8RtBtSeVbna9RPLKR0A0iAAOb59eHL3ltf7a2Sr/XpZdJmgh?=
 =?us-ascii?Q?yZv3kijy0mGhjxeKrA2wJLHVPDFZNLQ3soy80ZXR7Z5en99DFwkSoTackA6q?=
 =?us-ascii?Q?Y13SlWfLP9P7vA9HnexI3SnrgjQ4VH/nrDscUPeGXNAB2CjAtctY9QG8y5Qy?=
 =?us-ascii?Q?zFp+V1kDIepuW6JTlbXSmXGJj7DL9kaPTBFf//5m4rCzsb7cGLjS1VWGUPmX?=
 =?us-ascii?Q?HS/h+Mn7qO1j6R8S3lRnY2cL+8fjTO3b9cZ9SW8fm0S08OcUYaBOZTT7SsI7?=
 =?us-ascii?Q?jzQMF2VDM6E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aK4lnU9UFL5SiQWCfpoFIOLGgrTma3anlxNAianWfKrqAvXiyP08kVUpci72?=
 =?us-ascii?Q?w7c70TEbegQZixYxlgOq7X1w9FM50vWcOjwLWsdWLHjcVxegAKATnPeJHBF0?=
 =?us-ascii?Q?dCvDzLVeP5ihpIOeE7TeO6s8rgSOqHs9JeZlpIfh9kxsZmCMR/9g3YoNgEgC?=
 =?us-ascii?Q?YZ7Jvsn5HfuXtzzmJ4yuHTR9YUVUiSpWS/Hlukp9tu2ud+qbTJ3+gDlFLazu?=
 =?us-ascii?Q?MNQc0IoUdPwMiyRkt2unkPfxYzsZOhG/Ctly+S+WwNGaDa5s5rwqtX2vNAr/?=
 =?us-ascii?Q?LFzkKp1jsNZQBUq1E1hwaLmaXA27pBD2iBZoKHIvjozl8gGNJVGHD1JxyiuT?=
 =?us-ascii?Q?TjMksFPNillaShJ4DZfOcGMQ64JCV5cznjcmEBzYXx1KfhyZR4s4hYTxSCOe?=
 =?us-ascii?Q?NTqloQocSuPFUqaJF0rdn0vPpuGe0pKheBLkBARI42w1pm0MI9Ib4Ouey96T?=
 =?us-ascii?Q?4h9fbX07/DxXWYUOiK1JmecdgBPLg/hqyLGQV9uqG/OAQt44TbZu8N0/qhDd?=
 =?us-ascii?Q?3pXiJyG2xSniMS1ZsYhY+DE9RmwGRxyL4E3pV4xS9oBZDz7FUj0hkOJdY+X9?=
 =?us-ascii?Q?u/npfi4CNyp+lg5cQnoQq/C8w750sYA+h3dBQZyO3G++533J8EefDydZf1w5?=
 =?us-ascii?Q?jHqohHzTMTwj8RMDZ2JA9Dr9w+C9vnlzdksRUEyraHi4ll6NaTgtMFailmHX?=
 =?us-ascii?Q?i63+fmik2/SkhfQwlOwnoTjN9NlD9xA8T3V/yFpNLN7XXbrtd7xM5mBjHAkR?=
 =?us-ascii?Q?HWW3osVQtHMChFmzE9jcR4z+z9dMJk63JRTxXHTn33eUZAzQl7qgYRUWydNs?=
 =?us-ascii?Q?MNJpv0pBi3KGXwBCwTHbA3MnlX/sb0lkkycqTb9bFDC5GqnwflYoP6gg/ekE?=
 =?us-ascii?Q?s3UOJwa98cJJYzVdn2J7ZLcEiTwXdiNgAgtIRtfRg5Vx6qXkt3VKPnNO0wma?=
 =?us-ascii?Q?+tZ2PV0hqnikYgfmAYEnUx4lhikyn63gGnksyCH3dtn38ltGf2/4XL3VQP/f?=
 =?us-ascii?Q?NXFix+HytXFVNafE4B/1o18q8e7H4PaL+4nB2xtGIhHDhSOXkCfB29/GZJmh?=
 =?us-ascii?Q?M/WOOaqy9pvO/YjpKzzir9c9GSVsxFGajaYMcO1+lCQ/J4h3HLg/wAofE29B?=
 =?us-ascii?Q?BZaJi6Z0PmM567EbNLSo2qfKNspcmg/NE+UpiEGbQfWCCnJer9UfCUc3vdbB?=
 =?us-ascii?Q?on7Pw082Jq4hw2GbEOjP+yU+jqw6YulF8MXthIK2+qLobjkZJkm/GV1CyoEI?=
 =?us-ascii?Q?qhL6dIbjw4L2v3EeD6gHKOKNmNCx6pgKb8AYk8AsGtMaRssQ+Gp1Z4b6hVB5?=
 =?us-ascii?Q?H+JaLgriPu4H9TL9B+gDKN73rCcCnGO83J4w3QEGTjUHLl4OsnVpz2shuZwq?=
 =?us-ascii?Q?dyCUROT5NSsR94CF9WYhEvsLy910SBiRRG2Dy/LOMRvNgyBMdzV5HLszmHrT?=
 =?us-ascii?Q?Sp4Hgt2nevzwaDVEDAt2OtXsS7Unx2Zo1iW6gZFAfVMwAXI+2etKEFE+voXd?=
 =?us-ascii?Q?p6Zo8zvWGAM+nztTswAau0iwHr6zFxO5maVIkhhpEjnXU/0SeiYUWetw8GOo?=
 =?us-ascii?Q?1Zb2BmaQqoOScARMd42V0weeOBveQPPakusiMMSF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7f53b8-2f6c-42fb-c88d-08dda36ca063
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 13:35:09.8847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+BKT7ZTRiX9ong5ijOns2joM1rifsydj0z+5OegCMHyplV793gxFaIUrT3dFfrp9A91spoLCinMtvmDVz1R5cyuA8lc8IvAKBdjS3HUFY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9254
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

Hi Harish,
Make sure you can apply the patch as I couldn't directly do it, I had to ap=
ply it manually, then there was a warning about the format specifier in lin=
e containing " igt_info("Sampling Rate: %lu\n", p_rate); ". Otherwise I tes=
ted this patch and it is working, also it is solving the problem on VM that=
 doesn't support EU stall so once the minor problems are resolved I will se=
nd Reviewed-by.

Thanks,
Jakub

-----Original Message-----
From: Chegondi, Harish <harish.chegondi@intel.com>=20
Sent: Wednesday, June 4, 2025 1:58 AM
To: igt-dev@lists.freedesktop.org
Cc: Chegondi, Harish <harish.chegondi@intel.com>; Laguna, Lukasz <lukasz.la=
guna@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>; Adam Miszczak =
<adam.miszczak@linux.intel.com>; Kolakowski, Jakub1 <jakub1.kolakowski@inte=
l.com>; Kamil Konieczny <kamil.konieczny@linux.intel.com>; Marcin Bernatowi=
cz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_eu_stall: Use query IOCTL to chec=
k for EU stall support

Use EU stall query IOCTL to check if EU stall monitoring feature is availab=
le on the platform and if it is supported in the driver.
This would replace the checks in the test with those in the driver.

Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Resolves: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5131
---
 tests/intel/xe_eu_stall.c | 55 +++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c index b3=
a0ee742..4e76018b6 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -74,6 +74,8 @@ static int stream_fd =3D -1;
=20
 static volatile bool child_is_running =3D true;
=20
+static struct drm_xe_query_eu_stall *query_eu_stall_data;
+
 /*
  * EU stall data format for PVC
  */
@@ -506,33 +508,12 @@ static void test_eustall(int drm_fd, uint32_t devid, =
bool blocking_read, int ite
 		.properties_ptr =3D to_user_pointer(properties),
 	};
=20
-	struct drm_xe_query_eu_stall *query_eu_stall_data;
-	struct drm_xe_device_query query =3D {
-		.extensions =3D 0,
-		.query =3D DRM_XE_DEVICE_QUERY_EU_STALL,
-		.size =3D 0,
-		.data =3D 0,
-	};
-
 	igt_info("User buffer size: %u\n", p_user);
 	if (p_args[0])
 		igt_info("Workload: %s\n", p_args[0]);
 	else
 		igt_info("Workload: GPGPU fill\n");
-
-	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
-
-	query_eu_stall_data =3D malloc(query.size);
-	igt_assert(query_eu_stall_data);
-
-	query.data =3D to_user_pointer(query_eu_stall_data);
-	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	igt_assert(query_eu_stall_data->num_sampling_rates > 0);
-	if (p_rate =3D=3D 0)
-		properties[3] =3D query_eu_stall_data->sampling_rates[0];
-	igt_info("Sampling Rate: %lu\n", properties[3]);
+	igt_info("Sampling Rate: %lu\n", p_rate);
=20
 	stream_fd =3D eu_stall_open(drm_fd, &props);
=20
@@ -660,18 +641,42 @@ static struct option long_options[] =3D {
=20
 igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)  =
{
-	int drm_fd;
+	bool blocking_read =3D true;
+	int drm_fd, ret;
 	uint32_t devid;
 	struct stat sb;
-	bool blocking_read =3D true;
+	struct drm_xe_device_query query =3D {
+		.extensions =3D 0,
+		.query =3D DRM_XE_DEVICE_QUERY_EU_STALL,
+		.size =3D 0,
+		.data =3D 0,
+	};
=20
 	igt_fixture {
 		drm_fd =3D drm_open_driver(DRIVER_XE);
 		igt_require_fd(drm_fd);
 		devid =3D intel_get_drm_devid(drm_fd);
-		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >=3D IP_=
VER(20, 0));
+
 		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n")=
;
 		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid=
 file\n");
+
+		ret =3D igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+		igt_skip_on_f((ret =3D=3D -1 && errno =3D=3D ENODEV),
+			      "EU stall monitoring is not available on this platform\n");
+		igt_skip_on_f((ret =3D=3D -1 && errno =3D=3D EINVAL),
+			      "EU stall monitoring is not supported in the driver\n");
+		igt_assert_neq(query.size, 0);
+
+		query_eu_stall_data =3D malloc(query.size);
+		igt_assert(query_eu_stall_data);
+
+		query.data =3D to_user_pointer(query_eu_stall_data);
+		igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query),=20
+0);
+
+		igt_assert(query_eu_stall_data->num_sampling_rates > 0);
+		if (p_rate =3D=3D 0)
+			p_rate =3D query_eu_stall_data->sampling_rates[0];
+
 		if (output_file) {
 			output =3D fopen(output_file, "w");
 			igt_require(output);
--
2.48.1


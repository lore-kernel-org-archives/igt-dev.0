Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DD2E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 07:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB08C10EF1A;
	Fri, 20 Dec 2024 07:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4nQxdAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E70110E100
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 07:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734679837; x=1766215837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CmjmiUaxNH53hFEazeKEgEc8jBzw/PPEayDr5jBWGdA=;
 b=e4nQxdAINN6/up2OiRoRDynxcbQSZT3057AquTV+L+PbAD2QapVD+ASR
 qHRArQU08tLM1s6S/G1ufQrmZ7paeNDqu/6b9djXF5s7R+aFREEXlGnLT
 hsIqGA6sxcaCdem8BDqJD8jeP5s9w61eIO5NhIK+ErVzLUjcmPQnxhniT
 kc7WBqrYGH5ZrA6FepzI3Wyn9AdzkxxU6geAYp3ctHHJyGduIUQMVjJ4S
 rqK9TTOdzGry/hme1K1EBMKBg6Fj08NIJsXLVXD24gmTHwQYWhifJ6VqN
 ooNDPnvdoMrRtxoRTKKJYmC7cap/XxOmpJ6gpUUupy9SWUEt5UZO1HQxY w==;
X-CSE-ConnectionGUID: Rd3TDuqQRMq1ct8uwH6sfw==
X-CSE-MsgGUID: ktRj0ZFRR7uj1nUNNBn0FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="60604296"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="60604296"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 23:30:35 -0800
X-CSE-ConnectionGUID: GPvaiEt9QQ6moYFFgaVkmA==
X-CSE-MsgGUID: UHGvDV8IR1WXldTSQkWHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121719637"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 23:30:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 23:30:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 23:30:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 23:30:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zA9nwRD6hwbgJx9xgcFlOHMbL7nhlDJAMGOK8eqALpYK4akN7JEPExpGkFQS7wsQofIimKi3o0gxmBH1HJ4MWkellWv0maABZhCCHiJELNkNjXCmJ7jzvyUT6vf5CYgiTWxirF/8/a5gcxUndWqbFV2QnLRspxEGkk2Ec7LkFrNnEePqz6gRn2xaf8kS/MrWa63vNU7MWGnjzF3djDiY4qpxshKeVmzFxDBM6WXBJ+ucYOE3kmWWD6CRoHiBhp/qWgxgiZM2ree1rgELcbCED6P+ja3yFzdJQqpdhSS3famMDtUbLwjbq2CRlcRuSwdMM+wBY5WfZfEGH4lcnlnM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0x0gzRgEMJ9x0QJohvCxKDAuW9Rc69aJCRr2FNopa6E=;
 b=ffY+Sb0IkrH7+LjO3PA5RQ4ieZ9PjYm40aHJ2Tib9qya12tjbfPJsbRr5Z4rlr9jD7tH/aWFHhLGI8RENds2FZ7/ieQRH95dY3fwwvCLHKZrWWRrYTmdOPP9A/zs+bJepDp7MNP707Wr2u6wWSsiXI1F3O7SmqgjiFMGpSWXL+CKzbPaFxM0cJTSky1e+fBQKDC24iFtk9kkKr1pWSJ5yYFF2qGXM/LYbwI5mcPf3Y4lpwQ6z+ogGOvTI0jdM5u77Ti9+lgi2gmwBSPjByyT8po/rFXtTvhz5nFgzM+S0MUwgBMBcdoN7IQEqvi9G7WFHLKZ6Wl2d4OYDB6O71kCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CH2PR11MB8813.namprd11.prod.outlook.com (2603:10b6:610:282::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 07:30:28 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 07:30:28 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "mika.kuoppala@linux.intel.com" <mika.kuoppala@linux.intel.com>,
 "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Subject: RE: [PATCH i-g-t] tests/xe_eudebug.c: Enhance memory access testcases
Thread-Topic: [PATCH i-g-t] tests/xe_eudebug.c: Enhance memory access testcases
Thread-Index: AQHbUkatXQNVBREeVU6MuXjZeqSSJLLuvNJA
Date: Fri, 20 Dec 2024 07:30:28 +0000
Message-ID: <DS0PR11MB7264FE11B383EEB1B4F402D2D9072@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241219184826.603072-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20241219184826.603072-1-dominik.grzegorzek@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CH2PR11MB8813:EE_
x-ms-office365-filtering-correlation-id: 3f8ec4e0-3a5c-46e6-c4b4-08dd20c82d63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?QpIyi3ZcIrQgip9T3S7kF+yuX8529/1BkHal0m8JJh+WinUzPAzJMYV2n0?=
 =?iso-8859-2?Q?NXZa0232prMajJyKncb84wMdrTFxqCEw2LBDlDXw9oh0Ce/RzciN4yT7n3?=
 =?iso-8859-2?Q?gDci1QfaiTxvkT+FnsXD44kYKZiemFQU7ZyaYdB/SN2OZvV8PQqvqzoSfG?=
 =?iso-8859-2?Q?c0MI1yGBcWv3tQCQlPYQf33rNFLiKWFjQHe6pMHTwKXm13AQ8HjX8a+lBf?=
 =?iso-8859-2?Q?BkEvIG9V4Z5hbuhObnujaxZUqE82dk7swydwJOr2bp5WsTrfaVRLYZh4pN?=
 =?iso-8859-2?Q?vqo7QbsfrPSzBRvKPvdfrJWXDI/ufIdk9M+W9apj6ncfKYdzRnDrl4LVOf?=
 =?iso-8859-2?Q?1fq+ubYhP41As4+2EBMV369Iu2Qknfu7CGig0k3819XKxIYE3BFy9PBfBK?=
 =?iso-8859-2?Q?H9o3KH/4RnTiCQ/Pl7bIjo0pAYSlmk3OsuGfdJohQrx7qApAOsJ6qD7fED?=
 =?iso-8859-2?Q?2E9bFCOFA0wswbhFCqSKMlWlguQ3tdMa5hxrxrfA/NlsAN4cofBktj9sVD?=
 =?iso-8859-2?Q?ciq1SofEKFL2aJXpXnDP1iP9c72jSEFZbupDo9v8FoTDRQs/jJb3szTMAG?=
 =?iso-8859-2?Q?fyp+QyaqyUL2orNWi4wiWt0teziiuGEhEYxvtZoHXNWxYG5BBjW6fSfcuM?=
 =?iso-8859-2?Q?IRGDBwqI4aPMPCkTYpAHRluBUbNyBRW5pJyrbDYv12u84FboVrtbnNjSf7?=
 =?iso-8859-2?Q?aG6LrQirQIRKQ9WKa5F7Suuh2aKb1W/X+GF/66JeYGB1//ZgPn8mYK2yUY?=
 =?iso-8859-2?Q?k3gtFxowHeNWxpBUgah1nZ93Y7nMoybpAyqZTwCFZg6WIkwu+3tMhzVpwj?=
 =?iso-8859-2?Q?0BYiO1aPtzGDiFfqY/6+fXFEERbXgfFH19ObgCn4sbwU9g5AqiOHQ8yT5W?=
 =?iso-8859-2?Q?IJ7aAAf2K93D+msluldtrlTAzwm3zFkUfQ3EMBRdTPfNNuPo+AoLFsOFh2?=
 =?iso-8859-2?Q?2RoPYF+rgHrzglXzOkCF/wUtZNdmjcsyvw5be3cHsML5632fxsTAqpozg6?=
 =?iso-8859-2?Q?RssXA0KC2a5brS72hpIoY4YT5PhpkaBqLM5B//FdB9EwKWuhXPnQ66Aewq?=
 =?iso-8859-2?Q?KQy561OmwtfY7ppmo9+ReXIBE/EcK/nz7RhKPIxS1dB6nV4WxNTHjGtQGS?=
 =?iso-8859-2?Q?UQ1pX15a30XDJlY5GuL+x8+JxYzEZvpe8FKmRrR69DvLJejsVMBt6XmKGD?=
 =?iso-8859-2?Q?fICmTBU9v4JDt9kAbU+cBkHFO5l1QXt/plZYzTYQ4fHzAXgCWSk/yaotbz?=
 =?iso-8859-2?Q?+gDLxpLmrUc4oxHL0P+NChw5ZIblppbmjDEsxy8NNCSm8dGuShKi0ct6j6?=
 =?iso-8859-2?Q?RRHbuZKhr0RZ4xnNpa4a5ooUhdrhz8BWFsWy+iKUt8ckpiUGV91415zlPk?=
 =?iso-8859-2?Q?rQvLPYN4gBbWJOw3fY0IlxJSsodiX0iObgBfKFehjKe1dnU9HJ8Z/R6+SZ?=
 =?iso-8859-2?Q?fvRBd9rxljltQAZm6WqpQ2RRAA+ghrs8wF4wa+CvAuS5XFwHjamveskLCO?=
 =?iso-8859-2?Q?ifoJ0wxQkGJVekulTVdRKn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?9Iepga8r7wWRY66zSRb2GNvNmyabgBQBDw+B0Cfoawp32WmevOTxIF+JiK?=
 =?iso-8859-2?Q?/VRh7uugAzaDpr+kSd2gvjT2wq80DtQ2jzEVIVSQgrszgrFv3GimTFYsbS?=
 =?iso-8859-2?Q?Y/JHjqybxpcn52KeedPI53pGhZWcHia5iIz/vqRsSly7fXkttNVDjnZdtp?=
 =?iso-8859-2?Q?LHUOizn+wftvqe6s3H7ycHnnTGi1eCT2tdRysYCz+GQHe08CCT1PlUjRut?=
 =?iso-8859-2?Q?STPdPYzstepCj5yBlnmX381XMESeLDv7nRgrf7OsRVv85c1+TVAVXp+X9F?=
 =?iso-8859-2?Q?SkRCOB2sUIdBdO6imG9DqqOfA58RFnXVeN/AHwJ3xF9nl6FhdBWCPq4cIJ?=
 =?iso-8859-2?Q?hLvpTCWomW87uAGZjRTUb1PPkVERUmQEqpOx6IhXiGoV8TYlt851Si7QlE?=
 =?iso-8859-2?Q?ZMl5V3zwPML5u4N+sDNmusVCgRU8Ys+oMSroe2HraYXKWl5unFwUyYKdQu?=
 =?iso-8859-2?Q?tJjvSgDflCnwX5MQH0InmRhtM9RtCepdwjDjtxIUhnthK56VMaYmx3FsM/?=
 =?iso-8859-2?Q?SxFKRzMWUAXsC+5ZG/Eq6ke7avktB1Xo1lnbDSr4e7mgIxZFQwVrS5Zfwg?=
 =?iso-8859-2?Q?1SVK4ReP9ZQTyz233Czo1ihJvvdW7kmWeuSPx2LjsqLy7RF56aB6RsJWCg?=
 =?iso-8859-2?Q?jqaxuxaXw/sbHOrcHQNYUpKABsinaR+8BcepQJsFiZF9b30xYfpFnYQ5yM?=
 =?iso-8859-2?Q?XznHlGE+On8BUukLv1ggbJDi0SbhmHdfKrPw5vUXkKZ8oGy1Gj6CMncJie?=
 =?iso-8859-2?Q?/T5p4rxxQClPi3UNOiLuDCKpQ5zWRijhytg4zckubUpvYeqf6V0mCI2aeY?=
 =?iso-8859-2?Q?899cvHjtslzQhqmdmJWr2RCiGhilRlIJJV60Ki5U440I6RMhxFDRtAEbH2?=
 =?iso-8859-2?Q?CuM84sttenV5SPbweDZetB1B7m3bEk5HaEGTnhbdiFp4UJqbfM85gdKhaG?=
 =?iso-8859-2?Q?zMaZcbWEXXm4kXxGtEum3LRTwsHHERsYk2R7WAGadvkdkthVFFwSg5cwPq?=
 =?iso-8859-2?Q?LFwtwLE9M0jvMuXYxIWOTa3MYTAhRw1X7IAra5KalNXW5DJ4Xa4vS//od/?=
 =?iso-8859-2?Q?iuoKfniD2QRegs7Pgwb31iCC0dNDldGiCkqPwApRBnDuOJdIRwcu+0JUbz?=
 =?iso-8859-2?Q?uIZRYHe1yCegsZzRjaGGpm+Y/qQECpybbKI4Qk8lD2pKM0cL3a5Mtz+Vkt?=
 =?iso-8859-2?Q?ToGvDpzRWoUoJ7M58wDvXVnRJYuGFr5iT3k9+ZQE2TrWn4i8OFtlY/jnPS?=
 =?iso-8859-2?Q?MJu2wUSqe19bQeZd81pJmMDI5G8WFT9nl/7zr51tEBMCVa+SD51AaUy9cQ?=
 =?iso-8859-2?Q?4AT/uBGwU6ezgwu8EEzSNuDH6skAjQqOtlgwova33qfotui86IUyloktRC?=
 =?iso-8859-2?Q?J8nNo9pXoVlkfeVzBJilTgFAw57NlakxDywpnzSyRbOwsWoEyKrpjCjj/0?=
 =?iso-8859-2?Q?uXMKXpYa7Wfk+hbh0rWlxf04c7Gi7oE8x3IFLQ5wvz06u9ZrbuHfUvMiEj?=
 =?iso-8859-2?Q?VsRN2wIHEeXCc+d/TE2ckvBltdRgUEst0UcRd11+OzFu0sZyYEI2GpCWuD?=
 =?iso-8859-2?Q?XIEwktyKplgUaGlg4A6nZesSfKyTmWgCOpdYtVghhGMhRMPHwS3o5NJzHG?=
 =?iso-8859-2?Q?J1BGOiU7ugpOoOfpujwhM4vBUlkVouoTDtVZIcJqYgrRq2G4cc07zm1A?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8ec4e0-3a5c-46e6-c4b4-08dd20c82d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 07:30:28.3037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: swL3sbg9qLyxH+faSRK4jnhaCpp5eXmnt2zG22IU/C9G+gZQ+iZDi7WlDz97aiin/pcLxdMgT+D1rIqIoXgx3l0ETnn69QqBB2afq624oT2u8hnLYkfZp7PFPPtL9Jfo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8813
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

LGTM,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Domini=
k
> Grzegorzek
> Sent: Thursday, December 19, 2024 7:48 PM
> To: igt-dev@lists.freedesktop.org
> Cc: mika.kuoppala@linux.intel.com; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>
> Subject: [PATCH i-g-t] tests/xe_eudebug.c: Enhance memory access testcase=
s
>=20
> UMD tests revealed issues with memory read/write operations when
> accessing data at any nonzero offset within a VMA. Address this by
> verifying access to a buffer object at random unaligned offset.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index d9281f78f..51d02e06c 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -1556,6 +1556,7 @@ static void debugger_test_vma(struct
> xe_eudebug_debugger *d,
>  	struct drm_xe_eudebug_vm_open vo =3D { 0, };
>  	uint64_t *v1, *v2;
>  	uint64_t items =3D va_length / sizeof(uint64_t);
> +	uint64_t offset;
>  	int fd;
>  	int r, i;
>=20
> @@ -1573,14 +1574,24 @@ static void debugger_test_vma(struct
> xe_eudebug_debugger *d,
>  	r =3D pread(fd, v1, va_length, va_start);
>  	igt_assert_eq(r, va_length);
>=20
> +	for (i =3D 0; i < items; i++)
> +		igt_assert_eq(v1[i], va_start + i);
> +
> +	/* random unaligned offset within the vm */
> +	offset =3D 1 + random() % (va_length / 2);
> +	r =3D pread(fd, (char *)v1 + offset, va_length - offset, va_start + off=
set);
> +	igt_assert_eq(r, va_length - offset);
>  	for (i =3D 0; i < items; i++)
>  		igt_assert_eq(v1[i], va_start + i);
>=20
>  	for (i =3D 0; i < items; i++)
>  		v1[i] =3D va_start + i + 1;
>=20
> -	r =3D pwrite(fd, v1, va_length, va_start);
> -	igt_assert_eq(r, va_length);
> +	r =3D pwrite(fd, v1, offset, va_start);
> +	igt_assert_eq(r, offset);
> +
> +	r =3D pwrite(fd, (char *)v1 + offset, va_length - offset, va_start + of=
fset);
> +	igt_assert_eq(r, va_length - offset);
>=20
>  	lseek(fd, va_start, SEEK_SET);
>  	r =3D read(fd, v2, va_length);
> --
> 2.34.1


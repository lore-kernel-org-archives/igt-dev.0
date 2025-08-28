Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B9DCA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 15:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5F510E1E4;
	Thu, 28 Aug 2025 15:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncQh3GgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC0A10EA07
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756393748; x=1787929748;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SYgmhlMvXHxksmiYg8dkA0/j4KJuVRH+fL33OeYUDOQ=;
 b=ncQh3GgYVAGUhodlYdLsPkjKtDI7/EBolx2P7P5kuKrlogcBxqqB5aQ+
 Ecd8uqPmwMvYkPCTVneoqVR2UFW6e8YO5f3Rej/TXncd/v/ZnTWTYUnLy
 qTeDSYaEnYAA9AiPqY1E2fPZ9VkFUDMpRmnaBZo+oBse/8Ot+sj7tRF5l
 kjQR3fgK6KVr7okDuIYV3om8bKttytpLsj57RAj6ZECC/pr/AdmnTWWfq
 wvqtWwqjaANRFJw0tXJZuxp2N4rk2HarMVNoTX6mwYuwVzfQCz1kwwn4l
 AcfRW1YE8y8O/+g1V5DlFZjj6L/A9jKaHCNPnEeCHRqiOQZQWqZrZeV/j g==;
X-CSE-ConnectionGUID: 5ipB3SdSQTmDTwozjP4jNQ==
X-CSE-MsgGUID: u+SOiobFQeeUn0rzbQv+Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61298621"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="61298621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 08:09:00 -0700
X-CSE-ConnectionGUID: pnWeutKqTlWkxwa5NcerMQ==
X-CSE-MsgGUID: HqvpC0B5QaKgEpGaHEa4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="193797672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 08:08:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 08:08:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 08:08:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 08:08:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uh4qZn+uorn4fynbSQY4DoGVuA+j8xlllzLNfMg0cDDphBm02h+ClFhr7ufIyD9+y7EFAYCz0ECV6Ieh/MTk6/7yqvUv3l/v3E9DARSHVif+rpsaIEQSakDbnRLgGkFK20i2OwO0YgWxdUOCwBVhoiPnCqnSj4bYCTqizC6xBNM4hVZl8GQBm/EvJv+RbggiW8GDfYcNxvHPLbXY7rlKif9dGRYUIX8G6gT50ehppVcmhCwPjsr0kIfMf/X8k7yJKGPrRRSlkq9iEk1cKKMgdxol2q6YHxlrCatVJyXOSnm8KTHVA02TVUT25+eFKwtbpeJKaUxQNmous2WJl2jXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2yctxIY0qdVmKpvWgymTbXthrwRw9lQZnxkawd5tg0=;
 b=rdI3dnimtxbc5FaXhuUiBioiOUF6py/4GAknzqKgqkG6zCBfzbpWG2XlzGyuhXKvicripWFwo21nNOasSnmRBzdp+JUemBNyDIKW9Hd39ujoMVtHGPtdsRZZSzO2qEeQYyeko4vkkUTl3FOI+7ufyrnFfcgjtT/a711gHfWPJ5AJleR3raQcWjMbXjQ93CQ1KZcAkPa7p4ihR5psN52JSRrH6JX6l1zj9Y4k2GuhOkfus5Zs5DRfUWV0j4OE3WJoPNFQlea29TYkiKQzjLCNQqhV0MPAt6XUXSTP5YGU67/aJGiPRJOokn3236tXMWchCRLyUCFNdZHYCJtjdFiNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 15:08:42 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 15:08:41 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 5/5] tests/intel/xe_exec_system_allocator: Added
 atomic_batch test in IGT
Thread-Topic: [PATCH i-g-t 5/5] tests/intel/xe_exec_system_allocator: Added
 atomic_batch test in IGT
Thread-Index: AQHcFmVWpfrE2CsuckOtf2KSFX6n6bR4LOqg
Date: Thu, 28 Aug 2025 15:08:41 +0000
Message-ID: <BL1PR11MB552505685B3BB6A6567E1D3B843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
 <20250826084133.897768-6-nishit.sharma@intel.com>
In-Reply-To: <20250826084133.897768-6-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB7967:EE_
x-ms-office365-filtering-correlation-id: 79822df8-c2d2-4f39-b5fd-08dde644c67c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Sf5GLYLKEnEh34xs2Gk99s4NK/hijnnMJQc5yO3XvpzJHOpsiP9tYamf6Smf?=
 =?us-ascii?Q?g5xUYxt4oojbwLB8wCVNZEWjGopOPhSVjst05D9WoCN2UcQkyGILgTvahABM?=
 =?us-ascii?Q?j3g6sD96lG+9d1Fv8ahOqDZnTkWe/8LIw+re9hYfwdsKFKDFJlc5Y0p7Desm?=
 =?us-ascii?Q?DDTOh6stB/BjNl8yiqTNk4XEn7quORIwitswo4v4a9wr8LetVL32EKFjICxk?=
 =?us-ascii?Q?7y2LSXidCvbILe7x2Uaa/H9ZgG7xKLyQGGPq0aBU8V3Gg+ZxnKzCrROyFZXF?=
 =?us-ascii?Q?wrZRiZ/iAJqOmgB32IouNwmFU9sqSKzLEoVfqh5diWwz94/L9sptUoQsdEPR?=
 =?us-ascii?Q?I8IjGllpotPm8nQ9QsUOPd1E69QFTdaaMMZfYp8WU6KmLXDICu7Q6mmaE7aq?=
 =?us-ascii?Q?F+nPdQZsvZBe9q3ctsrlvAFOLo5IsIC0aYPug9c+qtMxZWztzfBB2Dv2xqqu?=
 =?us-ascii?Q?GEWjOWHSqtnyKb/JOboeM1HTCrU0p2SwSuj0MTsvpIDpNzJTqsVLQ1Xm5QBc?=
 =?us-ascii?Q?bw0ccifWOz7/PWiJor/myfA+iuCoyuGk8YMSdXSbErXrM5GeN1icdRv/dB+Y?=
 =?us-ascii?Q?98PY0QnI+c5Aybov8Kh7Pv0T/nLFDUmPUW8aSCrCA7nd5CKzF3tXml6BrncB?=
 =?us-ascii?Q?AZ4nys6j1qqpgNPQ2iTURAWwlDF/dBKLQSoz0D3L7ZKhvNQKcck8XGbLEwa+?=
 =?us-ascii?Q?/fVupeeUo5SqQjFboARVo9gSwoWisaEElKhKZoof5UhJ5HWAhKIv9h77vHxC?=
 =?us-ascii?Q?hNkhZb60sP/9cdYh0Uw+QaHrmr5MMg8qMK6aG8WMbz767XO5H8RbJiOlvVqX?=
 =?us-ascii?Q?1CQ0Dv4W5sletpgUcDsUcu4pO+waiOnYNtY3G9LJBDbabxEmJc7mcQUGmSx6?=
 =?us-ascii?Q?3lz7eG2DduKK2XBp8L+GJZmTwNRtqkSDOcg4tj3c07Wijcs3M3MHWZz0qslr?=
 =?us-ascii?Q?noVPLMYw7XP4fpcDC1rw+NufVD+F16ht+4l5CnpV65oRta0kqfivEzy/3v0R?=
 =?us-ascii?Q?l+aGRDt00J/nijNZzIVSs98wL03dmnx9DgNg+q+FTzmJSEkEcA/OrBINyU0W?=
 =?us-ascii?Q?Gs5Yy6BGWKOn+t8IYqb83fnN0SMi7IHIwQQchEIf10u2RNh+4/mVm4+MnhZL?=
 =?us-ascii?Q?OpFJXenyOgEMUDzwXs/28HJEidx4mHlFDzSa+0QD6BFH8BEStcbTL3xzJYJO?=
 =?us-ascii?Q?6jawInggJTZj2tU4h022QOUUAmA/aE9MQmxrQJlHb3oL/aXlHD4yPeKe+fSO?=
 =?us-ascii?Q?gouez2Hz+bHwoifHI/kLA7i8kmRSjdv15ky9irzGDeSDqG3VDJAuPtfA6iWt?=
 =?us-ascii?Q?+LP32+ppOoCCTQP5f4M5ASnVdvl4BF6mV6o3yBKMM3pZuV+VaqL9toFvHdUX?=
 =?us-ascii?Q?krLCimyWwTkPgo406lIz6kMqSAWpLjNkJxxUGZ1j6Bo832Z+SCZJ8zy2YlN/?=
 =?us-ascii?Q?rJV+I58Ehnkj1yNL9kCbDGOzBkF8IU9Gb5Bq9hCUSQUyh7sUUOysOw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XU7fcdmBDfV3RO/nfA0ZMjmyLBUww2lzK6mZoP2De33MMxDME6OA5WN2xXI/?=
 =?us-ascii?Q?2pE30qVDKFDIqSKFzly/cUw+9PlCgCyRNOuxw61NA3+Yr0im3wnqYTl/qr0M?=
 =?us-ascii?Q?JWq2KSqC5SDcVt2CTXFeckQ3P2KuTie5MZXc8qsK/31qLYKPsirbZakooFsT?=
 =?us-ascii?Q?pn7MY1Fyaawmwd7YtnzOVF/0335Muv1gHtFdX5mpT8oi5g0R3hMH5/TxtBgf?=
 =?us-ascii?Q?8sxFWhM+Yf62UpteVUAp9ZQsAZI39XvK0BhysgL1oKh/JH14Mj6FQBVErHsL?=
 =?us-ascii?Q?sP1x1cIpJHZV9pUC2dabIbGRudSfMTbp1HMi5RmXX4vQz1IcpWLT1UUk0dlK?=
 =?us-ascii?Q?31C3PrHm74JDXB+OnBlBn2iNN6bXmTLypqbpQ+xg+witEvsAZLGzs5CclGhw?=
 =?us-ascii?Q?QLHZy5/xSaQUQOLMkAWJEa9bFaG5Kb5OQJgrFPLKF02xwOT6FgtkbFbk+Lxk?=
 =?us-ascii?Q?3DPrkpNB7NtbXRuaP/8DUv+syzZtQrAQvjjT0/3ydhy6dmvThS2CMtQK+L1o?=
 =?us-ascii?Q?hDWff//Jqo7jl/4js/lgsXoTPbg+iE1CQi4cG3FERAUYtf/UuF0Y5luSex5F?=
 =?us-ascii?Q?STugVPZGEXTBQo/PnZz8UYSk8IJ2JYK7PKJF5DW/0tWNeH15sqfwAVOVV7j/?=
 =?us-ascii?Q?VLve1DI2SUcbpy9Aj7tHspWUv5rHMD8EBu3woCxbsc3ehuSlL+vPbPzGqPOc?=
 =?us-ascii?Q?9TwuV/2jcR+1JPam4eaqMXviyCwTKrZiSi+iO7fP7q12SXF2uwAybGoxDjWe?=
 =?us-ascii?Q?ednzD5TQFVO4lKr/aMjU3PmrnmRmh5Dzi7b/EAxHWOpIBIjPG0gPAIxJ6zfL?=
 =?us-ascii?Q?Ras5Lp9h37XnaJu6sJSTeyyKIa7mdar83U1WzNAwmc0vzU8KjxQDupxaddAp?=
 =?us-ascii?Q?ALuPxDV6HLfSNewIt1qbnb8R+WqaWY90HbMIx0qG8R0GaJ/a0lctBMi8cBqT?=
 =?us-ascii?Q?BL1YQfj+aukGpINe+h6nbb/haEUqDSXHHOdjDPhy0Dh0/zufkfbgwnOic86s?=
 =?us-ascii?Q?2s4P1hnQT18/hqm976P3mJI4JCW6ImWg/iyEqb1LhArNp5EdW7Tz8RteZAUo?=
 =?us-ascii?Q?s00J3s0mrk5KCfMGSUoHYtMZ1YdrIKvr9B68T8uEF59pln9Uu31MGxgUuGqa?=
 =?us-ascii?Q?sV3dHRWnDXjKSho4ZrmVOvsc7HZtZt6zvehgNuWU8JfLIQys/4LPXD7aWUaX?=
 =?us-ascii?Q?LKRlP+vEVBpeQSdyUk7ZYTUJMR6ybiJqDw9q6k7p/W3OzK/QP7ncIKxDzTOm?=
 =?us-ascii?Q?wTCTcaSEXc0RsM86jIrwu48vGxbJa6x1wuqUw361mAMt3YJ6SK5/Ps5K2zVK?=
 =?us-ascii?Q?3dshgNnFVDT2ItGXw2wR4F81wQtAZADqHIytEULpqKMBSyRpYWGdnRiZhlDp?=
 =?us-ascii?Q?Wi2ygVuMTCJPHeWuJd1zJiKXvmXmo1jj+nOMySUPAlC4HpTI3HrhCnLfPDlb?=
 =?us-ascii?Q?pEsSXlYfMRoBAZ3wcbexD4WocykduaAKeYIIRFeTlnMST57M2do0yHeQ0gXr?=
 =?us-ascii?Q?/vahqtED47hz7l651VraTMs4UzCdWMlk/tShqAv95l38w4t1EN3n9KDhKOEv?=
 =?us-ascii?Q?kYcPyCzNkg2YVt78V59WjhfJktIP5FtE2uf3U/TK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79822df8-c2d2-4f39-b5fd-08dde644c67c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 15:08:41.8452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DgHwTDnVP6crJd5r0rwFmJB/THlnrT6wvbuFajeHUBfikRhXcIfmqOC7zLHuz21Jb/sDuZ8q2vdRRh35yuLMnnP3/k3+fp7v906CxjpDKA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nishit.sharma@intel.com
> Sent: Tuesday, August 26, 2025 2:12 PM
> To: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t 5/5] tests/intel/xe_exec_system_allocator: Added
> atomic_batch test in IGT
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
Title cane be "] tests/intel/xe_exec_system_allocator: Add atomic_batch tes=
t in IGT"

> ATOMIC_BATCH flag is introduced when true MI_ATOMIC |
> MI_ATOMIC_INC operation will be called. This will avoid writing another
> function which performs atomic increment operations. ATOMIC_BATCH flag
> is passed as argument in write_dword() if true then value will be written=
 on
> passed address and incremented by ATOMIC_INC operation. For all memory
> operations this flag will be used to verify if ATOMIC operation is workin=
g or
> not.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 482 +++++++++++++++++++++---
> -
>  1 file changed, 412 insertions(+), 70 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index 70ca5fc2e..4569ace8d 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -29,6 +29,14 @@
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>  #define FIVE_SEC		(5LL * NSEC_PER_SEC)
Space here . and runc checkpatch.pl
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +};
>=20
>  struct batch_data {
>  	uint32_t batch[16];
> @@ -37,6 +45,7 @@ struct batch_data {
>  	uint32_t expected_data;
>  };
>=20
> +#define VAL_ATOMIC_EXPECTED  56
>  #define WRITE_VALUE(data__, i__)	({			\
>  	if (!(data__)->expected_data)				\
>  		(data__)->expected_data =3D rand() << 12 | (i__);	\
> @@ -53,10 +62,19 @@ static void __write_dword(uint32_t *batch, uint64_t
> sdi_addr, uint32_t wdata,
>  	batch[(*idx)++] =3D wdata;
>  }
>=20
> -static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wda=
ta,
> -			int *idx)
> +static void write_dword(struct test_exec_data *data, uint64_t sdi_addr,
> uint32_t wdata,
> +			int *idx, bool atomic)
>  {
> -	__write_dword(batch, sdi_addr, wdata, idx);
> +	uint32_t *batch =3D data->batch;
> +
> +	if (atomic) {
> +		data->data =3D 55;
> +		batch[(*idx)++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +		batch[(*idx)++] =3D sdi_addr;
> +		batch[(*idx)++] =3D sdi_addr >> 32;
> +	} else {
> +		__write_dword(batch, sdi_addr, wdata, idx);
> +	}
>  	batch[(*idx)++] =3D MI_BATCH_BUFFER_END;  }
>=20
> @@ -271,7 +289,7 @@ check_all_pages_threads(void *ptr, uint64_t
> alloc_size, uint64_t stride,
>=20
>  static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>  			    uint64_t alloc_size, uint64_t stride,
> -			    struct timespec *tv, uint64_t *submit)
> +			    struct timespec *tv, uint64_t *submit, bool atomic)
>  {
>  	struct drm_xe_sync sync[1] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, @@ -302,7
> +320,8 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void
> *ptr,
>  		uint64_t sdi_addr =3D addr + sdi_offset;
>  		int b =3D 0;
>=20
> -		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i),
> &b);
> +		write_dword((struct test_exec_data *)data, sdi_addr,
> WRITE_VALUE(data, i),
> +			     &b, atomic ? true : false);
>  		igt_assert(b <=3D ARRAY_SIZE(data->batch));
>  	}
>=20
> @@ -407,34 +426,45 @@ static void __aligned_partial_free(struct
> aligned_alloc_type  *aligned_alloc_typ
>=20
>  #define MAX_N_EXEC_QUEUES       16
>=20
> -#define MMAP                    (0x1 << 0)
> -#define NEW                     (0x1 << 1)
> -#define BO_UNMAP                (0x1 << 2)
> -#define FREE                    (0x1 << 3)
> -#define BUSY                    (0x1 << 4)
> -#define BO_MAP                  (0x1 << 5)
> -#define RACE                    (0x1 << 6)
> -#define SKIP_MEMSET             (0x1 << 7)
> -#define FAULT                   (0x1 << 8)
> -#define FILE_BACKED             (0x1 << 9)
> -#define LOCK                    (0x1 << 10)
> -#define MMAP_SHARED             (0x1 << 11)
> -#define HUGE_PAGE               (0x1 << 12)
> -#define SHARED_ALLOC            (0x1 << 13)
> -#define FORK_READ               (0x1 << 14)
> -#define FORK_READ_AFTER         (0x1 << 15)
> -#define MREMAP                  (0x1 << 16)
> -#define DONTUNMAP               (0x1 << 17)
> -#define READ_ONLY_REMAP         (0x1 << 18)
> -#define SYNC_EXEC               (0x1 << 19)
> -#define EVERY_OTHER_CHECK       (0x1 << 20)
> -#define MULTI_FAULT             (0x1 << 21)
> -#define PREFETCH                (0x1 << 22)
> -#define THREADS                 (0x1 << 23)
> -#define PROCESSES               (0x1 << 24)
> -#define PREFETCH_BENCHMARK      (0x1 << 25)
> -#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> -#define PREFERRED_LOC_SMEM      (0x1 << 27)
> +#define MMAP				(0x1 << 0)
> +#define NEW				(0x1 << 1)
> +#define BO_UNMAP			(0x1 << 2)
> +#define FREE				(0x1 << 3)
> +#define BUSY				(0x1 << 4)
> +#define BO_MAP				(0x1 << 5)
> +#define RACE				(0x1 << 6)
> +#define SKIP_MEMSET			(0x1 << 7)
> +#define FAULT				(0x1 << 8)
> +#define FILE_BACKED			(0x1 << 9)
> +#define LOCK				(0x1 << 10)
> +#define MMAP_SHARED			(0x1 << 11)
> +#define HUGE_PAGE			(0x1 << 12)
> +#define SHARED_ALLOC			(0x1 << 13)
> +#define FORK_READ			(0x1 << 14)
> +#define FORK_READ_AFTER			(0x1 << 15)
> +#define MREMAP				(0x1 << 16)
> +#define DONTUNMAP			(0x1 << 17)
> +#define READ_ONLY_REMAP			(0x1 << 18)
> +#define SYNC_EXEC			(0x1 << 19)
> +#define EVERY_OTHER_CHECK		(0x1 << 20)
> +#define MULTI_FAULT			(0x1 << 21)
> +#define PREFETCH			(0x1 << 22)
> +#define THREADS				(0x1 << 23)
> +#define PROCESSES			(0x1 << 24)
> +#define PREFETCH_BENCHMARK		(0x1 << 25)
> +#define PREFETCH_SYS_BENCHMARK		(0x1 << 26)
> +#define PREFERRED_LOC_SMEM		(0x1 << 27)
diff should be seen after this
> +#define ATOMIC_BATCH			(0x1 << 28)
> +#define MIGRATE_ALL_PAGES		(0x1 << 29)
> +#define PREFERRED_LOC_ATOMIC_DEVICE	(0x1 << 30)
> +#define PREFERRED_LOC_ATOMIC_GL		(0x1ull << 31)
> +#define PREFERRED_LOC_ATOMIC_CPU	(0x1ull << 32)
> +#define MADVISE_MULTI_VMA		(0x1ull << 33)
> +#define MADVISE_SPLIT_VMA		(0x1ull << 34)
> +#define MADVISE_ATOMIC_VMA		(0x1ull << 35)
> +#define PREFETCH_SPLIT_VMA		(0x1ull << 36)
> +#define PREFETCH_CHANGE_ATTR		(0x1ull << 37)
> +#define PREFETCH_SAME_ATTR		(0x1ull << 38)
>=20
>  #define N_MULTI_FAULT           4
>=20
> @@ -478,6 +508,47 @@ static void __aligned_partial_free(struct
> aligned_alloc_type  *aligned_alloc_typ
>   * SUBTEST: processes-evict-malloc-mix-bo
>   * Description: multi-process trigger eviction of VRAM allocated via mal=
loc
> and BO create
>   * Test category: stress test
> + *
> + * SUBTEST: madvise-multi-vma
> + * Description: performs multiple madvise operations on multiple
> + virtual memory area using atomic device attributes
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma
> + * Description: perform madvise operations on multiple type VMAs (BO
> + and CPU VMAs)
> + * Test category: perform madvise operations on multiple type VMAs (BO
> + and CPU VMAs)
> + *
> + * SUBTEST: madvise-atomic-vma
> + * Description: perform madvise atomic operations on BO in VRAM/SMEM if
> + atomic ATTR global/device
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma-with-mapping
> + * Description: performs prefetch and page migration
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-vram
> + * Description: performs both atomic and preferred loc madvise
> + operations atomic device attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-gl
> + * Description: performs both atomic and preferred loc madvise
> + operations with atomic global attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-cpu
> + * Description: performs both atomic and preferred loc madvise
> + operations with atomic cpu attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-sram-migrate-pages
> + * Description: performs preferred loc madvise operations and migrating
> + all pages in smem
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-no-range-invalidate-same-attr
> + * Description: performs atomic global madvise operation, prefetch and
> + again madvise operation with same atomic attribute
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-range-invalidate-change-attr
> + * Description: performs atomic global madvise operation, prefetch and
> + again madvise operation with different atomic attribute
> + * Test category: functionality test
> + *
>   */
>=20
>  static void
> @@ -544,7 +615,7 @@ many_allocs(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		allocs[i] =3D alloc;
>=20
>  		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size,
> stride,
> -				&tv, &submit);
> +				&tv, &submit, flags & ATOMIC_BATCH);
>  	}
>=20
>  	if (barrier)
> @@ -692,7 +763,7 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  		.num_syncs =3D 1,
>  		.syncs =3D to_user_pointer(sync),
>  	};
> -	struct {
> +	struct batch_data {
Any reason batch_data is added , no difference between these two declaratio=
ns. If not needed can you please drop
>  		uint32_t batch[16];
>  		uint64_t pad;
>  		uint64_t vm_sync;
> @@ -750,7 +821,8 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  		uint64_t sdi_addr =3D addr + sdi_offset;
>  		int b =3D 0;
>=20
> -		write_dword(data[i].batch, sdi_addr,
> WRITE_VALUE(&data[i], i), &b);
> +		write_dword((struct test_exec_data *)&data[i], sdi_addr,
> WRITE_VALUE(&data[i], i),
> +			     &b, ATOMIC_BATCH ? true : false);
>  		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
>=20
>  		if (!i)
> @@ -773,7 +845,10 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  		xe_wait_ufence(fd, new ?: exec_ufence,
> USER_FENCE_VALUE,
>  			       exec_queue, FIVE_SEC);
>  		if (i || (flags & CPU_FAULT))
> -			igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
> +			igt_assert_eq(data[i].data,
> +				      flags & ATOMIC_BATCH
> +				      ? VAL_ATOMIC_EXPECTED
> +				      : READ_VALUE(&data[i]));
>  		exec_ufence[0] =3D 0;
>=20
>  		if (!i) {
> @@ -1072,16 +1147,6 @@ partial(int fd, struct
> drm_xe_engine_class_instance *eci, unsigned int flags)
>   * Description: Create multiple threads with a faults on different hardw=
are
> engines to same addresses, racing between CPU and GPU access
>   * Test category: stress test
>   */
> -
> -struct test_exec_data {
> -	uint32_t batch[32];
> -	uint64_t pad;
> -	uint64_t vm_sync;
> -	uint64_t exec_sync;
> -	uint32_t data;
> -	uint32_t expected_data;
> -};
> -
>  static void igt_require_hugepages(void)  {
>  	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
> @@ -1090,11 +1155,52 @@ static void igt_require_hugepages(void)
>  		      "No huge pages available!\n");
>  }
>=20
> +static int
> +xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t
> range,
> +			int pat_index)
> +{
> +	int err;
> +
> +	err =3D xe_vm_madvise(fd, vm, addr, range, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
> +	if (err)
> +		return err;
> +	return 0;
> +}
> +

this more simplified way. In failure case we are asserting  can you please =
is this possible?
static int xe_vm_madvise_pat_attr(int fd, uint32_t vm, uint64_t addr, uint6=
4_t range, int pat_index)
{
    return xe_vm_madvise(fd, vm, addr, range, 0,
                         DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
}

> +static int
> +xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t
> range,
> +			  int mem_attr)
> +{
> +	int err;
> +
> +	err =3D xe_vm_madvise(fd, vm, addr, range, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> +			    mem_attr, 0);
> +	if (err)
> +		return err;
> +	return 0;
> +}
> +
> +static int
> +xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr,
> +uint64_t range) {
> +	int err;
> +
> +	err =3D xe_vm_madvise(fd, vm, addr, range, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
> +			    DRM_XE_MIGRATE_ALL_PAGES);
> +	if (err)
> +		return err;
> +	return 0;
> +}
> +
Same here as well
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
>  	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> -	  unsigned int flags)
> +	  unsigned long long flags)
>  {
>  	uint64_t addr;
>  	struct drm_xe_sync sync[1] =3D {
> @@ -1107,9 +1213,10 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		.syncs =3D to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> -	struct test_exec_data *data, *next_data =3D NULL;
> +	struct test_exec_data *data, *next_data =3D NULL, *org_data;
>  	uint32_t bo_flags;
>  	uint32_t bo =3D 0, bind_sync =3D 0;
> +	uint32_t val;
>  	void **pending_free;
>  	u64 *exec_ufence =3D NULL, *bind_ufence =3D NULL;
>  	int i, j, b, file_fd =3D -1, prev_idx, pf_count, err; @@ -1234,6 +1341,=
133
> @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				 strerror(errno), vm, to_user_pointer(data),
> bo_size);
>  	}
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		if (flags & MIGRATE_ALL_PAGES) {
> +			err =3D xe_vm_madvise_migrate_pages(fd, vm,
> to_user_pointer(data), bo_size);
> +			if (err)
> +				igt_warn("failure in page migration err =3D %s,
> vm =3D%u, data=3D%"PRIu64"\n",
> +					 strerror(errno), vm,
> to_user_pointer(data));
> +		} else {
> +			err =3D xe_vm_madvise(fd, vm, to_user_pointer(data),
> bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		}
> +	}
> +	if (flags & PREFERRED_LOC_ATOMIC_DEVICE) {
> +		err =3D xe_vm_madvise_migrate_pages(fd, vm,
> to_user_pointer(data), bo_size);
> +		if (err)
> +			igt_warn("failure in page migration err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data), bo_size,
> +						DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in atomic device attr err =3D %s, vm
> =3D%u data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & PREFERRED_LOC_ATOMIC_GL) {
> +		err =3D xe_vm_madvise_migrate_pages(fd, vm,
> to_user_pointer(data), bo_size);
> +		if (err)
> +			igt_warn("failure in page migration err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data), bo_size,
> +						DRM_XE_ATOMIC_GLOBAL);
> +		if (err)
> +			igt_warn("failure in atomic global attr err =3D %s, vm
> =3D%u data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & PREFERRED_LOC_ATOMIC_CPU) {
> +		err =3D xe_vm_madvise_migrate_pages(fd, vm,
> to_user_pointer(data), bo_size);
> +		if (err)
> +			igt_warn("failure in page migration err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data), bo_size,
> +						DRM_XE_ATOMIC_CPU);
> +		if (err)
> +			igt_warn("failure in atomic cpu attr err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & MADVISE_MULTI_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data) + bo_size/2,
> +						bo_size/2,
> DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in atomic device attr err =3D %s, vm
> =3D%u data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data) + bo_size,
> +						bo_size,
> DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in atomic multi_vma err =3D %s, vm
> =3D%u data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvixe_pat_attr(fd, vm,
> to_user_pointer(data), bo_size, 4);
> +		if (err)
> +			igt_warn("failure in pat attr index 4 err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvixe_pat_attr(fd, vm,
> to_user_pointer(data), bo_size, 3);
> +		if (err)
> +			igt_warn("failure in pat attr index 3 err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvixe_pat_attr(fd, vm,
> to_user_pointer(data) + bo_size/2, bo_size/2,
> +					     8);

PAT index values differ across platforms.
It is better to use the library functions in lib/intel_pat to obtain the co=
rrect PAT index values for each platform.
-- Pravalika

> +		if (err)
> +			igt_warn("failure in pat attr index 8 err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & MADVISE_SPLIT_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo =3D xe_bo_create(fd, vm, bo_size,
> +				  vram_if_possible(fd, eci->gt_id), bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) +
> bo_size/2,
> +				 bo_size/2, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data)
> + bo_size/2,
> +				    bo_size/2, DRM_XE_VM_BIND_OP_MAP,
> +
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				    1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE, 0, FIVE_SEC);
> +		data[0].vm_sync =3D 0;
> +		gem_close(fd, bo);
> +		bo =3D 0;
> +
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data),
> +						bo_size/2,
> DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in split atomic device attr err =3D %s,
> vm =3D%u data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & MADVISE_ATOMIC_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci-
> >gt_id), bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data),
> bo_size, 0,
> +0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data),
> bo_size,
> +				    DRM_XE_VM_BIND_OP_MAP,
> +
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				    1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE, 0, FIVE_SEC);
> +		data[0].vm_sync =3D 0;
> +		gem_close(fd, bo);
> +		bo =3D 0;
> +
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data), bo_size/2,
> +						DRM_XE_ATOMIC_GLOBAL);
> +		if (err)
> +			igt_warn("failure in atomic vma err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo =3D xe_bo_create(fd, vm, bo_size,
> @@ -1307,6 +1541,16 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		bool fault_inject =3D (FAULT & flags) && i =3D=3D n_execs / 2;
>  		bool fault_injected =3D (FAULT & flags) && i > n_execs;
>=20
> +		if (flags & MADVISE_MULTI_VMA) {
> +			addr =3D addr + bo_size;
> +			org_data =3D data;
> +			data =3D from_user_pointer(addr);
> +			batch_offset =3D (char *)&(data[idx].batch) - (char
> *)data;
> +			batch_addr =3D addr + batch_offset;
> +			sdi_offset =3D (char *)&(data[idx].data) - (char *)data;
> +			sdi_addr =3D addr + sdi_offset;
> +		}
> +
>  		if (barrier)
>  			pthread_barrier_wait(barrier);
>=20
> @@ -1316,18 +1560,74 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				__write_dword(data[idx].batch,
>  					      sdi_addr + j * orig_size,
>  					      WRITE_VALUE(&data[idx], idx),
> &b);
> -			write_dword(data[idx].batch, sdi_addr + j *
> orig_size,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr + j * orig_size,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
>  		} else if (!(flags & EVERY_OTHER_CHECK)) {
>  			b =3D 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
> +			if (flags & PREFETCH) {
> +				if (flags & PREFETCH_SPLIT_VMA) {
> +					bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +					xe_vm_prefetch_async(fd, vm, 0, 0,
> addr, bo_size, NULL, 0, 0);
> +
> +					igt_info("num_vmas before madvise
> =3D %d \n", val);
> +
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> +bo_size);
> +
> +					err =3D
> xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
> +					if (err)
> +						igt_warn("failure in prefetch
> split vma err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +					igt_info("num_vmas after madvise=3D
> %d \n", val);
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +				} else if (flags & PREFETCH_SAME_ATTR) {
> +					err =3D
> xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> +
> 	DRM_XE_ATOMIC_GLOBAL);
> +					if (err)
> +						igt_warn("failure in prefetch
> same attr err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +					xe_vm_prefetch_async(fd, vm, 0, 0,
> addr, bo_size, NULL, 0, DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +					err =3D
> xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
> +
> 	DRM_XE_ATOMIC_GLOBAL);
> +					if (err)
> +						igt_warn("failure in prefetch
> atomic attr err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +				} else if (flags & PREFETCH_CHANGE_ATTR) {
> +					err =3D
> xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> +
> 	DRM_XE_ATOMIC_GLOBAL);
> +					if (err)
> +						igt_warn("failure in prefetch
> atomic attr err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> +bo_size);
> +
> +					xe_vm_prefetch_async(fd, vm, 0, 0,
> addr, bo_size, NULL, 0,
> +DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +
> +					err =3D
> xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> +
> 	DRM_XE_ATOMIC_DEVICE);
> +					if (err)
> +						igt_warn("failure in prefetch
> change attr err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +					}
> +				} else {
> +					b =3D 0;
> +					write_dword((struct test_exec_data
> *)&data[idx], sdi_addr,
> +						     WRITE_VALUE(&data[idx],
> idx), &b,
> +						     flags & ATOMIC_BATCH ?
> true : false);
> +						     igt_assert(b <=3D
> ARRAY_SIZE(data[idx].batch));
> +				}
>  		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
>  			b =3D 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
>=20
>  			aligned_alloc_type =3D __aligned_alloc(aligned_size,
> bo_size); @@ -1346,10 +1646,11 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			__aligned_partial_free(&aligned_alloc_type);
>=20
>  			b =3D 0;
> -			write_dword(data[next_idx].batch,
> +			write_dword(&data[next_idx],
>  				    to_user_pointer(next_data) +
>  				    (char *)&data[next_idx].data - (char
> *)data,
> -				    WRITE_VALUE(&data[next_idx], next_idx),
> &b);
> +				    WRITE_VALUE(&data[next_idx], next_idx),
> &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[next_idx].batch));
>  		}
>=20
> @@ -1404,9 +1705,18 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  					       exec_queues[e], &timeout);
>  			igt_assert(err =3D=3D -ETIME || err =3D=3D -EIO);
>  		} else {
> -			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> -				       &data[idx].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[e], FIVE_SEC);
> +			if (flags & PREFERRED_LOC_ATOMIC_CPU) {
> +				int64_t timeout =3D QUARTER_SEC;
> +				err =3D __xe_wait_ufence(fd, exec_ufence ?
> exec_ufence :
> +						       &data[idx].exec_sync,
> +						       USER_FENCE_VALUE,
> +						       exec_queues[e],
> &timeout);
> +				if (err)
> +					goto cleanup;
> +			} else
> +				xe_wait_ufence(fd, exec_ufence ?
> exec_ufence :
> +					       &data[idx].exec_sync,
> USER_FENCE_VALUE,
> +					       exec_queues[e], FIVE_SEC);
>  			if (flags & LOCK && !i)
>  				munlock(data, bo_size);
>=20
> @@ -1456,17 +1766,17 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				if (flags & FORK_READ) {
>  					igt_fork(child, 1)
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>  					if (!(flags & FORK_READ_AFTER))
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>  					igt_waitchildren();
>  					if (flags & FORK_READ_AFTER)
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>  				} else {
>  					igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +						      flags & ATOMIC_BATCH ?
> VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>=20
>  					if (flags &
> PREFETCH_SYS_BENCHMARK) {
>  						struct timespec tv =3D {};
> @@ -1494,13 +1804,13 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  								((void *)data)
> + j * orig_size;
>=20
>=20
> 	igt_assert_eq(__data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +								      flags &
> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>  						}
>  					}
>  				}
>  				if (flags & EVERY_OTHER_CHECK)
>  					igt_assert_eq(data[prev_idx].data,
> -
> READ_VALUE(&data[prev_idx]));
> +						      flags & ATOMIC_BATCH ?
> VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[prev_idx]));
>  			}
>  		}
>=20
> @@ -1521,6 +1831,9 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			gem_close(fd, bo);
>  		}
>=20
> +		if (flags & MADVISE_MULTI_VMA)
> +			data =3D org_data;
> +
>  		if (flags & NEW) {
>  			if (flags & MMAP) {
>  				if (flags & FREE)
> @@ -1610,6 +1923,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				 pf_count, pf_count_after);
>  	}
>=20
> +cleanup:
>  	if (bo) {
>  		sync[0].addr =3D to_user_pointer(bind_ufence);
>  		__xe_vm_bind_assert(fd, vm, 0,
> @@ -1864,7 +2178,7 @@ processes(int fd, int n_exec_queues, int n_execs,
> size_t bo_size,
>=20
>  struct section {
>  	const char *name;
> -	unsigned int flags;
> +	unsigned long long flags;
>  };
>=20
>  igt_main
> @@ -1964,6 +2278,19 @@ igt_main
>  		{ "malloc-mix-bo", MIX_BO_ALLOC },
>  		{ NULL },
>  	};
> +	const struct section msections[] =3D {
> +		{ "preffered-loc-sram-migrate-pages",
> PREFERRED_LOC_SMEM | MIGRATE_ALL_PAGES | ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-vram",
> PREFERRED_LOC_ATOMIC_DEVICE | ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-gl", PREFERRED_LOC_ATOMIC_GL |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-cpu",
> PREFERRED_LOC_ATOMIC_CPU | ATOMIC_BATCH },
> +		{ "multi-vma", MADVISE_MULTI_VMA | ATOMIC_BATCH },
> +		{ "split-vma", MADVISE_SPLIT_VMA | ATOMIC_BATCH },
> +		{ "atomic-vma", MADVISE_ATOMIC_VMA | ATOMIC_BATCH
> },
> +		{ "split-vma-with-mapping", PREFETCH |
> PREFETCH_SPLIT_VMA | ATOMIC_BATCH },
> +		{ "range-invalidate-change-attr", PREFETCH |
> PREFETCH_CHANGE_ATTR | ATOMIC_BATCH },
> +		{ "no-range-invalidate-same-attr", PREFETCH |
> PREFETCH_SAME_ATTR | ATOMIC_BATCH },
> +		{ NULL },
> +	};
>  	int fd;
>  	int num_sections;
>=20
> @@ -1983,15 +2310,22 @@ igt_main
>  	for (const struct section *s =3D sections; s[num_sections].name;
> num_sections++)
>  		;
>=20
> -	for (int i =3D 0; i < num_sections * 2; i++) {
> -		struct section *s =3D &sections[i % num_sections];
> +	for (int i =3D 0; i < num_sections * 3; i++) {
> +		struct section p =3D sections[i % num_sections];
> +		struct section *s =3D &p;
>=20
> -		if (i/num_sections =3D=3D 0) {
> +		if (i/num_sections =3D=3D 1) {
>  			static char modified_name[256];
>  			snprintf(modified_name, sizeof(modified_name),
> "%s-preferred-loc-smem", s->name);
>  			s->name =3D modified_name;
>  			s->flags |=3D PREFERRED_LOC_SMEM;
>  		}
> +		if (i/num_sections =3D=3D 2) {
> +			static char modified_name[256];
> +			snprintf(modified_name, sizeof(modified_name),
> "atomic-batch-%s", s->name);
> +			s->name =3D modified_name;
> +			s->flags |=3D ATOMIC_BATCH;
> +		}
>=20
>  		igt_subtest_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> @@ -2175,6 +2509,14 @@ igt_main
>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>  	}
>=20
> +	for (const struct section *s =3D msections; s->name; s++) {
> +		igt_subtest_f("madvise-%s", s->name) {
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
> +						NULL, s->flags);
> +		}
> +	}
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		drm_close_driver(fd);
> --
> 2.43.0


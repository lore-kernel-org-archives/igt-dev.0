Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D93CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 13:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC26210E818;
	Thu,  8 Oct 2026 13:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WikN/uPm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89AF10E807
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791465456; x=1823001456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VgNcW9kn0bN9Aj1QA1/05JsFILyyj8gBLiyzJUBXALw=;
 b=WikN/uPm4/2PWCvhftOdwN1+VaWfvXUgVTIyMHd2XVlA98Nyf5y5711G
 P2H+ysvE0U7ItQh72nuJ6njXdfpH4/FFhXw2iMbyKybrZSsH+fJHC+raC
 tl8DGPPZdRm4ZNhFXJjGgWuvYy5ZzMauT+lL62BbS0Je4ii+bAB8VtCQt
 Wt1e22ZXecXAXSu/TVYAEvGegZLCDMGqsgk/3dpbxlZgYgt4DLXQsZQBu
 PMPGJgJgtVDz77dr87qy0EBrU/gUJszxf5YCMZD+ITSELTtEDWKUhoiDV
 S4u9jlz+usICCzopleSB3xXT94qBaI7gPUkkzbn5BvlUE/04X2L2PyCmp g==;
X-CSE-ConnectionGUID: pksRQsYJRIO9vrHBHGwbDA==
X-CSE-MsgGUID: Ico5zed9T/Ogxc5oMX1gzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="145637"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="145637"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:17:36 -0700
X-CSE-ConnectionGUID: x0hprfMlRX2CG3M+lnX5qg==
X-CSE-MsgGUID: 1jMMS7LdQJm7+1AY2w1l9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="363623"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:17:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:17:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:17:34 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgWLNj7j2XTunVuqonwqDt70afIfMNy2vKHc2FHTAEHWYJHfNQ+4OTOc/esbhyHQ38bMZXYl4tLZhU6BCW6I5F4Qg4HvySEOPEB2SYz5l6nITqX/CnJdoCdelP+I7z+ZdhVRQ5+aTsP5Ufz0FcvKQDRULbFuOluBj1y3MoQ1dC8KDRL9oKljprrjXndkJfhEsjCoe6VWh+d9EXxSZKEQ6jf2aKostKhkTTwzc4JeOIq8fALDxfWy9F9zgv3tfUOj2fSqk2PvLEFvDDVHm9OIEN59Neh6LWfYWc2N3gacTgaHO+VI1hYE77nWUY+xooQ51vAW7uClXXxPWYee3y/VVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cvVDSzDZFoqPnlrWFGxhISUqC3Nd0cAUj37mHw242c=;
 b=L17Oh9CPBEeLp6w4tupT2Mv1t9j1RK5R2WJlYqKSU5Gxlykfs2x2K9+bAGzPjBLJt32u220tdAFatFPSobpNjRb/0S7tPrX0M+R00DoTQFWc4u+CPrvx+cOKZQPyamrUiuTUJHxm+cb0WqmyTGm/QjeyxY8mZ2XbSO5IxjwPU7D+pItaMh2mKR+dE+fNeHKy8Dt2VE6SEMo4YF5u0ungkRodz1VAi3edsAK/yGqUgB0YTkRUJHSLchF9hN9XWWEmTGGMvWDPa4giSKSpwk1LIgM3Iknzs44JH+ZKaKOSnLNjxlrAHhhLpN3AkIX6KfjXFEDUsvJIKNaYwwxZgl2y5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5415.namprd11.prod.outlook.com (2603:10b6:208:315::14)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 13:17:29 +0000
Received: from BL1PR11MB5415.namprd11.prod.outlook.com
 ([fe80::2bb1:a951:b2a8:e165]) by BL1PR11MB5415.namprd11.prod.outlook.com
 ([fe80::2bb1:a951:b2a8:e165%3]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 13:17:28 +0000
From: "Thomas, Sobin" <sobin.thomas@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v5 3/5] tests/intel: Add array-of-binds random-size
 allocation tests
Thread-Topic: [PATCH i-g-t v5 3/5] tests/intel: Add array-of-binds random-size
 allocation tests
Thread-Index: AQHdSoLSqbG4g9E6N06zETEfiFaylrbujjuAgAUq7MA=
Date: Thu, 8 Oct 2026 13:17:28 +0000
Message-ID: <BL1PR11MB54152A23BAB3270642F0DAAB94932@BL1PR11MB5415.namprd11.prod.outlook.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
 <20260922110438.2402109-4-sobin.thomas@intel.com>
 <CH3PR11MB8434021E4D5CE8CF6236117E8D962@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434021E4D5CE8CF6236117E8D962@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5415:EE_|CH3PR11MB7938:EE_
x-ms-office365-filtering-correlation-id: e7358fc4-6a73-43f4-94ef-08df253e80c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: /YICDmeBQVIliVJrjJKVLABP8P25U5iR0soxGv8Knh1l5+cEEukKpKT5zvYM36gUXskAJN0XDuXiC1oXu6b6OpNQS3oignoU0fHh0VihBztEIQaGqzeh1tZeApp/awsG9GSar+lpMEERQ0RpQUPgnOixDPjAobkGpczybmzGPgSsNUGTl0ylEmFLJxqPHs3LiVdWfhCIBqU3hA0uO2o9I6APLEK+ECETNI37HWLfLoPc+DzfPA9UaRcyc5Pwh7buDLpNx8xj4f5f2RfpAFgMz1bgx5sl5/Ox2CvLjYil7jz6qnBZOIsd26O+Nv/Th/HSqz767c8MSgvpG/m56GN8kUQ4xn5MIpN/TTx6IG9DEfTqFnoVLvO0k+ggP4iBO/DUWy0lBNid3311QELhdfUWrTykXF1u0WP5N0QSBci02Dpuj2GI5k8Y7kHf/yxWkkpm1BgUPclKZNBF0OrLBLiVOnID/BzunYMx4cLadNIY5uxL0DJ4rqSDSCP9RRkd6td8Vw8JkuLvdVHRaa/dWMRPAsBr1Gc3EZamRr+xZK9kdubxebYqsyuVyjmD0+kqpRr+OdKh1EWQ7DvWIesJSItIvR/blMbSdDXgn6Diaj4/oVUD38C5vX73ROWemxRwdmHXyzhXRj8mMdQAeqAzWwjAup4pY5zAG++4S35wMrXGEII7ECWyn4cDsTSdmN0wRvI2t9w6xd3IogdfiksPX1yohLIq3mSETgU0hbvDVGMYFR0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5415.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sAs8jU5lf/rt7Xyc4atVIUiL3I/IUezY3++VYI3KolLMxMDLcrqXdx4xkwxs?=
 =?us-ascii?Q?8sOFZYPuxclHKloB2oTLHSR7m1k/QhqE+E5ydn80ln6s7uVJvrS1Dn/v73G5?=
 =?us-ascii?Q?3DLlBHiy3zeFeT9kXcEMIHYulbfXEkDkyRRBUHTtvDuoJew45RpfSxACDUOq?=
 =?us-ascii?Q?qr7g806SovaoJInVCmPEhy4Km1Zy+w8bGfhl+4d9TZ/XJdVyzoWdOUIS+3w7?=
 =?us-ascii?Q?dOtIeTG1gE3hL0U0l6JQJL0n9f0e5ITFMGbNJrA61Q3Y8i6jXImy/qRWHYwe?=
 =?us-ascii?Q?bvbXBS0XIIDUemRwGzFJo4S9+GfZGpm4v5jysDElImH2FvWTWtCT9+7OPVft?=
 =?us-ascii?Q?fbPfb9JBR/+7NnBSznlI1hl2Y4RBp0PGh1nhEtA88DsIYYlIl0j02++uvG4h?=
 =?us-ascii?Q?VaMa7o+C3J0mFLIbmt9zN0OptC3gjRFQRFjCofG/NS27YrRcrZszKnkXzCbP?=
 =?us-ascii?Q?Xqq3Fn2lk5hdNir8n41ISNNH9WNn0xT61KKoH96+wNyKJ7SNetjpe9YtpnmG?=
 =?us-ascii?Q?b1m6HhtQbSprGf3ZIv2cU9dH0jkOgBCwPS62stK9k1LKdjoG5Vqkxf1/DPmP?=
 =?us-ascii?Q?fY45my2yB+8+UkKeEK2/5UkTNci0oZUXQgImZsot73/O+BKFDFoXkmcrOciJ?=
 =?us-ascii?Q?YMTrhBs6XdnRbxkksn4k9kF6I829ghmuJEQaDwaRcH/ET0c/xu8BGhg8bwM9?=
 =?us-ascii?Q?wfnHO4k58rkm/UOMFs3Zeac4xlWrIVlPvliW/4ekonXy1EWXa8x/gz2431yp?=
 =?us-ascii?Q?5vQj8clASTO5BxnRZ6yACOwbnUqyg9flss8ALNpNJphcEZguRpkiA2+0viJg?=
 =?us-ascii?Q?97z1UctNsKFggA3bzk+CuoP2VPhANWREvbdAthfpZC+pvtUCnQTsYTut9/xc?=
 =?us-ascii?Q?tP24bNCoI6sg79EJ1wyaeXs+wGRFsD4rrSFBPdBGiwZDRn07zKBMvxPcql0v?=
 =?us-ascii?Q?OlgejTAsKJwyh1eWnd0pTPqBX6kxHzH6gO6Xi4KOdBRwJ1nNPMqlu5K6k5DS?=
 =?us-ascii?Q?QQ/rw5XSqS3iDSoNQrAaLV+NGG/Ruz/a7iqOOe//O/pylQwMLMfOK5OPn9mG?=
 =?us-ascii?Q?rgejD1gViBjPi5rE9ZdEjmcgOA9AfkFAasJNEG5VxY1DeRfm7J3E9nO6bvwB?=
 =?us-ascii?Q?GoBQDf73ZkkLiM2yplSE30CWTlos2fpg3ptkfjTFo6htNsN2Bzp9a10eoy26?=
 =?us-ascii?Q?jPTdeqIsb8RDQNC8JXZH5bfJcrWVGsLIQJr0jOsyVStdQioUPVzL6fLudjOv?=
 =?us-ascii?Q?bKy8uijSrc5R6Ngpph1NlFppRBWurYUaeQbfkQ0T5AQZL5IQg/77kdoK/tUv?=
 =?us-ascii?Q?yieQGP+iy0/apsdSA+GPyRF0nOlhvgUEFgYiliir5FVnkLoSsNUZfg9HHnkr?=
 =?us-ascii?Q?Zl4iKnLxButoBcVfNlkBcmYrSILziI3KhMbHUmaT8Gx8WIgUOANgz3grmRlb?=
 =?us-ascii?Q?VnPgi/ywf7bre1cSm+FjZL9EbOT0uzR0xyOgV1X1TuyJX2xBkM+md2GALDR1?=
 =?us-ascii?Q?Vi6/u/g32Zvw3gAjX6ovSOOEzkPWw+hFNhkvFTb21T+yFext76vBrAPMKjAI?=
 =?us-ascii?Q?mQ6kk/WSEIgropIyl47nnpQjUZyqs2j59hDJkcASoI8X85BcIYn5tC6ErX/P?=
 =?us-ascii?Q?dFja+MVrAYrjqovhrDXG1hPYeXlVu/0gW8u9mC186wZ5G6r2Usg48xe/2pn0?=
 =?us-ascii?Q?hkjIvnn1+NRxL5k+bMmRbumi6GnCHEe964ZpYHsLf9G8w77bhl06shRToaZ/?=
 =?us-ascii?Q?YfBQA0Hm4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NbUCDJFEDTEzf2B4SEop6zHvLi5OlP7SwKtE2YUWnsQzmzXQv0zEYr3+K/5RlUw0FDfEt7c7J46NNPjNVpkZygNonLny5WmxO4ZE4tCKegIBz20loCv3ByCsupUY9kjreHcgVqxcGjiHLKQgd0FwbAK/kPT+DdaUt+IauWk659XpVUXiomzWpNF036b9p9v9Ndv5HG7+RvdjxO5/6I+7t2mU7cnB8udqhsiuhUHlR3KKwQNHQHlOyw4Um9EKGqGRacMSeAZo2dmttXz0hwqwE7m+xf9peCx3IX+/78x/VJLhr8g7ZZwI00YpU5mbm47TUy4YvIce6/dL+K4QtUS6Jw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5415.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7358fc4-6a73-43f4-94ef-08df253e80c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 13:17:28.8288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wo12s1ZvY7sVF6UXN0Ka7e1pTSK4GeiJJALjSawdPXHyL6sSNjlxs1gt2cr3dh2/dbsQcshWUiwwp9jmIRIP9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
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

Thanks Priyanka , please find response inline=20

-----Original Message-----
From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>=20
Sent: Monday, October 5, 2026 11:51 AM
To: Thomas, Sobin <sobin.thomas@intel.com>; igt-dev@lists.freedesktop.org; =
Brost, Matthew <matthew.brost@intel.com>
Cc: Sharma, Nishit <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v5 3/5] tests/intel: Add array-of-binds random-si=
ze allocation tests



> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: 22 September 2026 16:35
> To: igt-dev@lists.freedesktop.org; Brost, Matthew=20
> <matthew.brost@intel.com>
> Cc: Sharma, Nishit <nishit.sharma@intel.com>; Dandamudi, Priyanka=20
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t v5 3/5] tests/intel: Add array-of-binds=20
> random-size allocation tests
>=20
> Add new array-binds-rand-sizes-* subtests that allocate batches of=20
> random-sized BOs and bind them using a single array-of-binds operation.
>=20
> The new tests allocate 10 BOs per batch and exercise both aligned and=20
> unaligned bind addresses. This extends existing eviction coverage by=20
> verifying that BOs with varying sizes can be bound, managed and=20
> evicted correctly when submitted as a single bind array rather than indiv=
idual bind operations.
>=20
> Introduce alloc_random_size_bos_array_bind(), which mirrors the=20
> existing random-size allocation flow while grouping multiple BOs into=20
> a single array bind submission. This is particularly useful for=20
> eviction testing where a set of BOs needs to be resident or evicted as a =
unit.
>=20
> The tests are intended to provide additional coverage for=20
> array-of-binds handling under random allocation patterns and VRAM pressur=
e scenarios.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_bo_alloc.c | 177=20
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
>=20
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c=20
> index
> bd5bf5a33..343d07626 100644
> --- a/tests/intel/xe_bo_alloc.c
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -47,7 +47,15 @@
>   * Description: Test 100 random BO allocation sizes in test table,=20
> unaligned bind addresses
>   * Test category: functionality test
>   *
> + * SUBTEST: array-binds-rand-sizes-10
> + * Description: Test 10 batches of 10 random BO allocation sizes each=20
> + bound together as a
> + * single array of binds
> + * Test category: functionality test
>   *
> + * SUBTEST: array-binds-rand-sizes-10-unaligned
> + * Description: Test 10 batches of 10 random BO allocation sizes=20
> + bound together as a single
> + * array of binds, unaligned bind addresses
> + * Test category: functionality test
>   */
>=20
>  #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x)) @@ -74,6 +82,7 @@=20
> static uint64_t *alloc_sizes;  enum test_type {
>  	TYPE_ALL_SIZES,
>  	TYPE_RANDOM_SIZE,
> +	TYPE_ARRAY_BIND
>  };
>=20
>  struct test_case {
> @@ -178,6 +187,28 @@ static void bo_alloc_reserve_va(struct bo_alloc=20
> *b, uint32_t flags, uint64_t va_
>  	igt_assert_eq_u64(b->gpu_va % align, 0);  }
>=20
> +static int __xe_vm_bind_array(int fd, uint32_t vm,
> +			      struct drm_xe_vm_bind_op *bind_ops,
> +			      uint32_t num_bind, struct drm_xe_sync *sync,
> +			      uint32_t num_syncs)
> +{
> +	struct drm_xe_vm_bind bind =3D {
> +		.vm_id =3D vm,
> +		.num_binds =3D num_bind,
> +		.vector_of_binds =3D (uintptr_t)bind_ops,
> +		.num_syncs =3D num_syncs,
> +		.syncs =3D (uintptr_t)sync,
> +		.exec_queue_id =3D 0,
> +	};
> +
> +	igt_assert(num_bind > 0);
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
> +		return -errno;
> +
> +	return 0;
> +}
> +
>  static void alloc_sizes_init(void)
>  {
>  	int i;
> @@ -254,6 +285,7 @@ static void create_bo_arr(int fd, uint32_t vm,=20
> struct bo_alloc *bos,  int n_bos,
>  	}
>  }
>=20
> +
>  /*
>   * BIND step: bind one or more BOs as a single array-of-binds ioctl call
>   * (see __xe_vm_bind_array() above), replacing the previous=20
> open-coded @@ -
> 308,8 +340,72 @@ static int test_bind_individual(int fd, uint32_t vm,=20
> struct bo_alloc *bos, int n
>  	return 0;
>  }
>=20
> +static int test_bind_array(int fd, uint32_t vm,
> +			   struct bo_alloc *bos, int n_bos) {
> +	struct drm_xe_vm_bind_op *bind_ops;
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle =3D syncobj_create(fd, 0),
> +	};
> +	int i, ret;
> +
> +	igt_assert(n_bos > 0);
> +
> +	bind_ops =3D calloc(n_bos, sizeof(*bind_ops));
> +	igt_assert(bind_ops);
> +
> +	for (i =3D 0; i < n_bos; i++) {
> +		igt_assert_f(bos[i].bo,
> +			     "BO[%d] was not created before bind\n", i);
> +
> +		igt_assert_f(bos[i].bo_size,
> +			     "BO[%d] has zero size\n", i);
> +
> +		bind_ops[i] =3D (struct drm_xe_vm_bind_op) {
> +			.obj =3D bos[i].bo,
> +			.obj_offset =3D 0,
> +			.range =3D bos[i].bo_size,
> +			.addr =3D bos[i].gpu_va,
> +			.op =3D DRM_XE_VM_BIND_OP_MAP,
> +			.flags =3D 0,
> +		};
> +
> +		igt_debug("Bind op[%d]: bo=3D%u size=3D%#llx addr=3D%#llx\n",
> +			  i,
> +			  bos[i].bo,
> +			  (unsigned long long)bos[i].bo_size,
> +			  (unsigned long long)bos[i].gpu_va);
> +	}
> +
> +	ret =3D __xe_vm_bind_array(fd, vm, bind_ops, n_bos, &sync, 1);
> +	if (ret) {
> +		if (ret =3D=3D -ENOMEM || ret =3D=3D -ENOSPC) {
> +			syncobj_destroy(fd, sync.handle);
> +			free(bind_ops);
> +			return ret;
> +		}
> +
> +		igt_assert_f(false, "Array VM_BIND failed: ret=3D%d errno=3D%d
> (%s)\n",
> +			     ret, errno, strerror(errno));
> +	}
> +
> +	igt_assert_f(syncobj_wait(fd, &sync.handle, 1,
> +				  INT64_MAX, 0, NULL),
> +		     "Timed out waiting for array VM_BIND\n");
> +
> +	syncobj_destroy(fd, sync.handle);
> +	free(bind_ops);
> +
> +	return 0;
> +}
> +
>  static int test_bind(int fd, uint32_t vm, struct bo_alloc *bos, int=20
> n_bos, uint32_t
> flags)  {
> +	if (flags & ARRAY_BIND)
> +		return test_bind_array(fd, vm, bos, n_bos);
> +	else
>  		return test_bind_individual(fd, vm, bos, n_bos);  }
>=20
> @@ -600,6 +696,76 @@ static void all_sizes_once(int fd, struct=20
> drm_xe_engine_class_instance *hwe)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +/*
> + * Same idea as alloc_rand_size_bos(), but each iteration binds=20
> +N_BOS_PER_BIND BOs
> + * together via a single array-of-binds call instead of one at a time.
> + * Used by the array-binds-* subtests, in particular the eviction=20
> +stress
> + * test where several BOs need to be resident (or evicted) as a unit.
> + */
> +#define N_BOS_PER_BIND	10
> +
> +static void alloc_random_size_bos_array_bind(int fd, struct
> drm_xe_engine_class_instance *hwe,
> +					     int count, uint64_t
> vram_per_process,
> +					     pthread_barrier_t *barrier, uint32_t
> flags,
> +					     unsigned int *seed)
> +{
> +	struct bo_group **leaks =3D NULL;
> +	uint32_t vm, exec_queue;
> +	uint64_t vram_used =3D 0;
> +	int i, max_batches =3D (count =3D=3D -1) ? MAX_ALLOCATIONS : count;
> +	int n_batches =3D 0;
> +
> +	igt_debug("count=3D%d max_batches=3D%d vram_per_process=3D%llu
> flags=3D%x\n",
> +		  count, max_batches, (unsigned long long)vram_per_process,
> flags);
> +
> +	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
> +
> +	leaks =3D malloc(sizeof(*leaks) * max_batches);
> +	igt_assert(leaks);
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	exec_queue =3D  xe_exec_queue_create(fd, vm, hwe, 0);
> +
> +	for (i =3D 0; i < count || vram_used < vram_per_process; ++i) {
> +		uint64_t sizes[N_BOS_PER_BIND];
> +		struct bo_alloc *bos;
> +		int j;
> +
> +		for (j =3D 0; j < N_BOS_PER_BIND; ++j)
> +			sizes[j] =3D alloc_sizes[rand_r(seed) % N_ALLOC_SIZES];
> +
> +		igt_assert_f(i < max_batches, "Failed to reach %llu bytes of
> VRAM pressure "
> +			     " after %d batches (currently reached %llu bytes)\n",
> +			     (unsigned long long)vram_per_process, max_batches,
> +			     (unsigned long long)vram_used);
> +
> +		bos =3D test_alloc_sizes(fd, vm, exec_queue, hwe->gt_id, sizes,
> +				       N_BOS_PER_BIND, flags,
> BO_BIND_BASE_ADDR);
> +		if (bos) {
> +			leaks[i] =3D malloc(sizeof(*leaks[i]));
> +			igt_assert(leaks[i]);
> +
> +			leaks[i]->bos =3D bos;
> +			leaks[i]->n_bos =3D N_BOS_PER_BIND;
> +			n_batches++;
> +
> +			for (j =3D 0; j < N_BOS_PER_BIND; ++j)
> +				vram_used +=3D bos[j].bo_size;
> +		} else {
> +			leaks[i] =3D NULL;
> +		}
> +	}
> +
> +	if (barrier)
> +		pthread_barrier_wait(barrier);
> +
> +	check_leak_multi_group(fd, vm, leaks, n_batches, flags);

It should be i instead of n_batches as if it goes else case in one of the c=
ase then that is not counted.
check_leak_multi_group(fd, vm, leaks, i, flags);
Replaced i with n_batches.
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +	free(leaks);
> +}
> +
>  static void run_gt_dynamic_subtests(int fd, const struct test_case *t)  =
{
>  	struct drm_xe_engine_class_instance *hwe; @@ -644,6 +810,13 @@=20
> static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
>  			case TYPE_RANDOM_SIZE:
>  				alloc_rand_size_bos(fd, hwe, t->count, 0, NULL,
> t->flags);
>  				break;
> +			case TYPE_ARRAY_BIND: {
> +				unsigned int seed =3D hwe->gt_id + 1;
> +
> +				alloc_random_size_bos_array_bind(fd, hwe, t-
> >count, 0, NULL,
> +								 t->flags,
> &seed);
> +				break;
> +			}
>  			default:
>  				break;
>=20
> @@ -673,6 +846,9 @@ static const struct test_case test_matrix[] =3D {
>  	{ "rand-sizes-10", 10, 0, TYPE_RANDOM_SIZE, false },
>  	{ "rand-sizes-100", 100, 0, TYPE_RANDOM_SIZE, false },
>  	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE,=20
> false },
> +	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND, TYPE_ARRAY_BIND, true
> },
> +	{ "array-binds-rand-sizes-10-unaligned", 10,  ARRAY_BIND |=20
> +UNALIGNED,
> TYPE_ARRAY_BIND,
> +	  true },
>  };
>=20
>  int igt_main()
> @@ -690,6 +866,7 @@ int igt_main()
>  		switch (t->type) {
>  		case TYPE_ALL_SIZES:
>  		case TYPE_RANDOM_SIZE:
> +		case TYPE_ARRAY_BIND:
>  			igt_subtest_with_dynamic_f("%s", t->name)
>  				run_gt_dynamic_subtests(fd, t);
>  		}
> --
> 2.52.0


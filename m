Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9A9C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 03:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691E210E6F5;
	Wed, 20 Mar 2024 03:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERN6bKK1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E10410E6F5
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 03:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710905206; x=1742441206;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AToooIvcQVooZI7nIKjtGUa2HQgcPBGZeAWDb1gjTJU=;
 b=ERN6bKK1Rj3zeASQD+BPjRCjCqXjDI283IPENBQDhDmXv2wCRGpnFAH/
 hf3xpceEIDPuXQl6MOHDAdJnUt33P2olRsFaSA318PeQb5DfaeX+O+dbY
 1g99Ql1n4t+j1jggb494wS01uGV1ZWTi21MxgK1CiCnSffaZsNNEqXhXa
 37DFTiqD3vJM7xi5F4NXDIxKUIhqXoDwGS9KivSuI8+9nMZsB1bVMJ5uX
 zqe9lc5FNxxbWsrH25KBaYjCY9D2OPA0UTfDlDreH138+MES5ashkzxTj
 IXQ3AHw2eyJ2Csa2DoJcoyMHB74kQ1guSDnSOZOz7l15vN0Sk9wjQQLpm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16357327"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="16357327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="14098954"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 20:26:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 20:26:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 20:26:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 20:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeSa8AEHRfEcC05JACVuf2G2TaDghtH3ta8LmsTNDH/U3zczZ8s9Edkcj9UHwGaE0YSv5E+HBxBDNCE0sZ3gAB6sbfqLOOBL6siZpGWrjaEdGpXANFUuFxDTdWsgzOttanut+ahJRuKwXWbgPWgZdEHE9WeK0hi8VAh9zuGCwe+wVT+zrcHtWzLjnqP76JFAIo346/FMXJ7sK1T9qbz+LMPeQAkTAR43uFHfuhvFMMxf6dBdO7oXhqjzmLIbw1LlbSKCjZmpMVFuCJUWIYYuI7ZtlCk3Ma0js+G0h7H09GzzIit40lNxI5Fb9V9f0aFl9KC1rmJowYJQkITml9OpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vI2p/ZcF2vCYh6YCG0MeNbBUmowVJIsccuh+d2RmjfI=;
 b=Oi01UgTgbyw2JxwC3F7FANutbkx/ScYwfAMp6dXNBTrou/CofcbG3CyyA17Ge8auilgv6jvsQSJZBSDG7tK9u1hwntObbxescI9GxbkSglTDHiUCyQlENBr61h8H7qN5Ju4TcRY+5l8Jxoe+GOhNLecwoHDMkdhD5kUo6L6xghlhF9SdXo5F04cZWaq5sVBvefzVox2/pMIa8HJ2o9vlxPNMDYVVWsWVowGVlIMEqtSqzj8ucRdAhU2bKBtFg9MaXeeyrCvQJF361sfuULsVx+7LuIkszLThgios1sfiJaGCne7/pkjgRc2QNBpQ93j/CAzxaWGf5yQK4BOdNXTCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 03:26:39 +0000
Received: from IA1PR11MB7856.namprd11.prod.outlook.com
 ([fe80::eb12:aca:7501:3635]) by IA1PR11MB7856.namprd11.prod.outlook.com
 ([fe80::eb12:aca:7501:3635%3]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 03:26:38 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, "Wilson, Chris P" <chris.p.wilson@intel.com>
Subject: RE: [PATCH i-g-t v4 21/25] tests/intel: Add missing documentation
 fields in i915_selftest
Thread-Topic: [PATCH i-g-t v4 21/25] tests/intel: Add missing documentation
 fields in i915_selftest
Thread-Index: AQHadh1taQ3ecJ3QXEqTflSPIvot3bE//mbw
Date: Wed, 20 Mar 2024 03:26:38 +0000
Message-ID: <IA1PR11MB78561BF1BAF4C446EDCCD08198332@IA1PR11MB7856.namprd11.prod.outlook.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-22-katarzyna.piecielska@intel.com>
In-Reply-To: <20240314143455.1436688-22-katarzyna.piecielska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7856:EE_|CH0PR11MB5300:EE_
x-ms-office365-filtering-correlation-id: 73d8c5db-50a7-404c-9cfa-08dc488d8de9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SsfylHVWtTCV0aaMXzbQCSNHg0eITRa/1az9nS8g0HgXiQyTexwuz+lScyTcj/X/bnuogtlNQPk66CJqDQ6R6yN1LBRav/0edq0HIDHNw4yeg32PAUQR67x89ntQJ6vWAQwk5VaBa/rHkBuyGhvdtxZicejfN1n7wo3c5W1FxiSPoujusMc7l80zZ+Cng7atrgZd7TgK6W5B3Utz+g+5D8u6woDgLRGdkdA83+8hqTeOqzjjY+JMXvKQOGQV+4L0Q0ZiSjGoPOBmj4YYAxBwT8qqZ5pO/Fu0rqP5Mojva/jmZesA9AlP+bJwnSY8UljzrjZKG3SDVOfiTSNQvZwbITv9/TbYHNkUKkLaZ+8zeQdqdZHWQB3B0bMULIJW+McgeOHHlOcobZTLxElgMJTqLdRhU5pHOu8mWT7WUDGbhsR6SDS+7NN5dye5Sx2qAcuLm2eyWqjxGqFkywqYrL7QGkfKk3N2x+5o4KJJIA0qMO6YnZVdhUBu83eZc2hMvShkeXry/B3uNbKzxeiuMwSDUSQwgkiKoqNhrBPYzxqcEI1fhFsuUOmnAFmbG6UNGGHUMqZ4vfNV1RxrtRLbY5nKJ8k706VAhumpjAmhORX195HM0Ngy0W8fExUTeWwIx7QnLI/kuaSXq6Sny2SrwubPc6qJEyXIoWU3Rj+W0b6EA/FCXaBxl/BVmDtSg2ZKVbyMpLxaXTvKC8kunInUbnVbu0NPRC6nVSH1241xHF13soA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RgSa6zVRorBonIrL6w7mp6xFhAnlul+nNRd/gA8eJXROdvE1Gq5Hb//B26LF?=
 =?us-ascii?Q?6IXEYtugYh0vlu28ngbXRJi/8oGd2NxdxyyuNz2/EbaMorzPFpytk/tCprI8?=
 =?us-ascii?Q?I7TzIigNdEnGu94vDiVi0cVCEYfLAl93csj4LxCpW3q/6UqnnMVCaHJ8X98J?=
 =?us-ascii?Q?PhntCh10YKq8CtMZ0PFSknBviK9urERslLnCqy/FacICuiMhcO/xMTLb6XJY?=
 =?us-ascii?Q?SrpxV2aiqpdYq3aJR4wHDTiYVF5rxG9k6OIztw6FFJJydS+shoedzJhTeV8j?=
 =?us-ascii?Q?0IjA4a2KZdvnVokWexA23lmttqDfX7QJVNcOiqeowHDmFhhfYSabzGvQBZbm?=
 =?us-ascii?Q?/pU3bHao+OVVlsAxDVF/OHenFPi6aX8Ocv0ZFQN/y1XsZ2ammcVJoj8s9qcU?=
 =?us-ascii?Q?5fIjCz3+Kvod5WQky85A3NGVMToRGU+xHbMjMrw90Ss3jjI7NtWwLTAxN7Z/?=
 =?us-ascii?Q?y2Wt6MZfOTZj+ezdsWaneq6DlL7qXUSwfjxIotNjNzWdG6CS6Yv2oVcgy0h0?=
 =?us-ascii?Q?hN4eEa+hWfA8v9Oj1noZHsNfxxZxcaiwEgMa/dywQu1B75TVP/5E96znUY++?=
 =?us-ascii?Q?cKtAdnDlYpB1/rGDmCl9OdpJrOQT2gKAyz2RQYbgAeLqNRnT0SGl5ZvzsR2f?=
 =?us-ascii?Q?0PhdlsOiYZCIleka5zy/t1W+1FTEgEGcd4LfgNcKYEuxj+xt9UOlg/Ahw/l9?=
 =?us-ascii?Q?TTdVMaOASGNHPRx4C7d194lCeXDU3q+wa/tD/ULLPbh5H59oY/S0YT9QwktN?=
 =?us-ascii?Q?JOkVPNn31FyMFWfEDyGZeZTA7eK2Vb2kegCVA0+nhauJtwki6chTQLIEcYhu?=
 =?us-ascii?Q?f2hphXa3VYOs0jvPb2JkqbBwDlKkaztJy+f5yZVrJJlHb2Al3xizVqLmGtLT?=
 =?us-ascii?Q?KAqL72q1fVbpOW+OBXA00+GOrKLgdU4BIIdpbz7ppAA3ENpt3CqFlsHveZkJ?=
 =?us-ascii?Q?WDL5BHVaynV09mQZDHGWtIPn+lCtW3ETUuYujj0OOPVDL+b0XCqaDxqPJku8?=
 =?us-ascii?Q?br9n9ORxbxyBZM3vsB3CxJedYiWzIKcXwqx/4rLV3EQJnVmVIT//EbN3KWi7?=
 =?us-ascii?Q?qiORHcnbpE0aCXhVCTRisFqXJfSYOI+wtENHqgD/EUhOxrsuQdltVRDCveeX?=
 =?us-ascii?Q?pj7ySYZApoDoAfFD4caiZ510BuDAHlYx4loIJH0vRq8y471vzLIA9nIJhhrU?=
 =?us-ascii?Q?g9akIdOQj/+b3WCEieGhmvPQlp58jbUPWoD8K0OgnUgMPR/+swrUOF1eFqZt?=
 =?us-ascii?Q?GCajusjwIDuxNa9Qkhi6S7MWwI/TSPcooVvEqE8noQ6QC8M+3Ujg2MyEKCs1?=
 =?us-ascii?Q?gJHFDAwqVArUp1f73P3mtGRV7JcRTP6ybRupLL8AGKWGlo3VhLzGzjPdea7V?=
 =?us-ascii?Q?PxbTPOjJsicy3i1gJ5vjvmvLSpcFlUx/dMGZd2idzkWGYByqHGIr9KLUceLZ?=
 =?us-ascii?Q?yQ++kmlvQtAkX9pzd4GCXkrgeg4jdY9xHn41fI4D9hhPKr0m3aIUOwt5+aY0?=
 =?us-ascii?Q?r1UPdF/qJGRf8RAt7ZR/vCQ8RbClbXykQAKyMdiJJe9vV0aSFw+3pPLaW2Gk?=
 =?us-ascii?Q?F2kmka8XJHsJw7bx4mutLqESQNz2rf4YiDhBvFY6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d8c5db-50a7-404c-9cfa-08dc488d8de9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 03:26:38.7706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m58FLTp0OfEao9fYUm2t+uY1QUZZxNW5yB7e1erep2kgYN56n+xK/g32xu2vJ6lyrF4PwfBiNm3kCT8LY4UZgpGfU59mc2PfJ81lHy65JDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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

LGTM
Acked-by: Himanshu Girotra <himanshu.girotra@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Katarzyna Piecielska
> Sent: Thursday, March 14, 2024 8:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Kamil Koniecz=
ny
> <kamil.konieczny@linux.intel.com>; Mauro Carvalho Chehab
> <mauro.chehab@linux.intel.com>; Wilson, Chris P
> <chris.p.wilson@intel.com>
> Subject: [PATCH i-g-t v4 21/25] tests/intel: Add missing documentation fi=
elds
> in i915_selftest
>=20
> Add subcategories, functionalities for all selftests in i915_selftest.
> Change functionality for live@gem - s/command submission/execbuf/.
>=20
> v2: Make Sub-category/Functionality/Feature unique values. (Kamil)
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> ---
>  tests/intel/i915_selftest.c | 391 +++++++++++++++++++-----------------
>  1 file changed, 211 insertions(+), 180 deletions(-)
>=20
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c in=
dex
> 2c5f6bce2..508e9acea 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -29,190 +29,196 @@
>   *
>   * SUBTEST: live
>   * Feature: gem_core
> + * Sub-category: Selftest
> + * Category: Selftest
> + * Functionality: live selftest
>   * Run type: BAT
>   *
>   * SUBTEST: live@active
>   * Category: Selftest
>   * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Synchronization
>   *
>   * SUBTEST: live@blt
>   * Category: Selftest
>   * Description: Blitter validation
>   * Functionality: command streamer
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Test category: i915 / HW
> + * Sub-category: Blitter
>   *
>   * SUBTEST: live@client
>   * Category: Selftest
>   * Description: Internal API over blitter
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: blitter api
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: live@coherency
>   * Category: Selftest
>   * Description: Cache management
> - * Functionality: memory management
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Functionality: cache
> + * Test category: i915 / HW
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@debugger
>   * Category: Selftest
>   * Functionality: device management
> - * Sub-category: debugger
> - * Test category: GEM_Legacy
> + * Test category: debugger
> + * Sub-category: Debugging
>   *
>   * SUBTEST: live@display
>   * Category: Selftest
>   * Functionality: display sanity
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Display
>   *
>   * SUBTEST: live@dmabuf
>   * Category: Selftest
>   * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@evict
>   * Category: Selftest
>   * Functionality: GTT eviction
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@execlists
>   * Category: Selftest
>   * Description: command submission backend
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: execlists
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gem
>   * Category: Selftest
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: execbuf
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gem_contexts
>   * Category: Selftest
>   * Description: User isolation and execution at the context level
> - * Functionality: context management
> - * Sub-category: i915 / HW
> + * Functionality: context
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> + * Test category: i915 / HW
>   *
>   * SUBTEST: live@gem_execbuf
>   * Category: Selftest
>   * Description: command submission support
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: execbuf
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gt_ccs_mode
>   * Category: Selftest
>   * Description: Multi-ccs internal validation
>   * Functionality: multii-ccs
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gt_contexts
>   * Category: Selftest
>   * Description: HW isolation and HW context validation
> - * Functionality: context management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: context
> + * Sub-category: CMD submission
> + * Test category: HW
>   *
>   * SUBTEST: live@gt_engines
>   * Category: Selftest
>   * Description: command submission topology validation
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: command submission topology
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gt_gtt
>   * Category: Selftest
>   * Description: Validation of virtual address management and execution
> - * Functionality: memory management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: gtt
> + * Test category: HW
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@gt_heartbeat
>   * Category: Selftest
>   * Description: Stall detection interface validation
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: heartbeat
> + * Test category: i915
> + * Sub-category: Reset
>   *
>   * SUBTEST: live@gt_lrc
>   * Category: Selftest
>   * Description: HW isolation and HW context validation
> - * Functionality: context management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: context
> + * Sub-category: CMD submission
> + * Test category: HW
>   *
>   * SUBTEST: live@gt_mocs
>   * Category: Selftest
>   * Description: Verification of mocs registers
> - * Functionality: mocs
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Functionality: mocs registers
> + * Test category: i915 / HW
> + * Sub-category: Mocs
>   *
>   * SUBTEST: live@gt_pm
>   * Category: Selftest
>   * Description: Basic i915 driver module selftests
> - * Feature: rps, rc6
> - * Test category: rps, rc6
> + * Functionality: rps, rc6
> + * Sub-category: Power management
>   *
>   * SUBTEST: live@gt_timelines
>   * Category: Selftest
>   * Description: semaphore tracking
>   * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Synchronization
>   *
>   * SUBTEST: live@gt_tlb
>   * Category: Selftest
>   * Test category: Memory Management
> + * Sub-category: Memory management
> + * Functionality: tlb
>   *
>   * SUBTEST: live@gtt
>   * Category: Selftest
>   * Description: Virtual address management interface validation
> - * Functionality: memory management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: virtual address
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@gtt_l4wa
>   * Category: Selftest
>   * Description: Check the L4WA is enabled when it was required
> - * Functionality: workarounds
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: L4WA
> + * Test category: i915
> + * Sub-category: Workarounds
>   *
>   * SUBTEST: live@guc
>   * Category: Selftest
> - * Feature: GuC
> + * Feature: firmware feature
>   * Sub-category: Firmware
>   * Functionality: GUC
>   * Test category: GuC
>   *
>   * SUBTEST: live@guc_doorbells
>   * Category: Selftest
> - * Feature: GuC
> + * Feature: firmware feature
>   * Sub-category: Firmware
>   * Functionality: GUC
>   * Test category: GuC
>   *
>   * SUBTEST: live@guc_hang
>   * Category: Selftest
> - * Feature: GuC
> + * Feature: firmware feature
>   * Sub-category: Firmware
>   * Functionality: GUC
>   * Test category: GuC
>   *
>   * SUBTEST: live@guc_multi_lrc
>   * Category: Selftest
> - * Feature: GuC
> + * Feature: firmware feature
>   * Sub-category: Firmware
>   * Functionality: GUC
>   * Test category: GuC
> @@ -220,313 +226,338 @@
>   * SUBTEST: live@hangcheck
>   * Category: Selftest
>   * Description: reset handling after stall detection
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: hangcheck
> + * Test category: i915
> + * Sub-category: Reset
>   *
>   * SUBTEST: live@hugepages
>   * Category: Selftest
>   * Description: Large page support validation
> - * Functionality: memory management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: large page
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@late_gt_pm
>   * Category: Selftest
>   * Feature: rc6
> - * Functionality: Basic i915 driver module selftests
> - * Test category: rc6
> + * Description: Basic i915 driver module selftests
> + * Functionality: rc6
> + * Sub-category: Power management
>   *
>   * SUBTEST: live@lmem
>   * Category: Selftest
> + * Feature: local_memory
> + * Description: Basic i915 driver module selftests
> + * Functionality: local memory
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@memory_region
>   * Category: Selftest
>   * Description: memory topology validation and migration checks
> - * Functionality: memory management
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Functionality: memory topology
> + * Test category: i915 / HW
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@memory_region_cross_tile
>   * Category: Selftest
> - * Functionality: Multi-tile memory topology validation
> - * Test category: MultiTile
> + * Description: Multi-tile memory topology validation
> + * Functionality: memory topology
> + * Sub-category: MultiTile
>   *
>   * SUBTEST: live@mman
>   * Category: Selftest
>   * Description: memory management validation
> - * Functionality: memory management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: mapping
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@obj_lock
>   * Category: Selftest
>   * Description: Validation of per-object locking patterns
> - * Functionality: per-object lockling
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: per-object locking
> + * Test category: i915
> + * Sub-category: Core
>   *
>   * SUBTEST: live@objects
>   * Category: Selftest
>   * Description: User object allocation and isolation checks
>   * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Core
>   *
>   * SUBTEST: live@perf
>   * Category: Selftest
>   * Feature: i915 perf selftests
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: live@remote_tiles
>   * Category: Selftest
> - * Functionality: Tile meta data validation
> - * Test category: MultiTile
> + * Description: Tile meta data validation
> + * Functionality: meta data
> + * Sub-category: MultiTile
>   *
>   * SUBTEST: live@requests
>   * Category: Selftest
>   * Description: Validation of internal i915 command submission interface
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: command submission interface
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@reset
>   * Category: Selftest
>   * Description: engine/GT resets
> - * Functionality: reset
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: engine/GT reset
> + * Test category: HW
> + * Sub-category: Reset
>   *
>   * SUBTEST: live@sanitycheck
>   * Category: Selftest
>   * Description: Checks the selftest infrastructure itself
> - * Functionality: selftests
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: selftest
> + * Test category: i915
> + * Sub-category: Core
>   *
>   * SUBTEST: live@scheduler
>   * Category: Selftest
> - * Test category: Cmd Submission
> + * Sub-category: CMD Submission
> + * Functionality: scheduler
>   *
>   * SUBTEST: live@semaphores
>   * Category: Selftest
>   * Description: GuC semaphore management
>   * Functionality: semaphore
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Test category: HW
> + * Sub-category: Synchronization
>   *
>   * SUBTEST: live@slpc
>   * Category: Selftest
>   * Feature: slpc / pm_rps
> - * Functionality: Basic i915 driver module selftests
> - * Test category: slpc / pm_rps
> + * Description: Basic i915 driver module selftests
> + * Functionality: slpc
> + * Sub-category: Power management
>   *
>   * SUBTEST: live@uncore
>   * Category: Selftest
>   * Description: Basic i915 driver module selftests
>   * Feature: forcewake
> - * Test category: forcewake
> + * Functionality: forcewake
> + * Sub-category: Power management
>   *
>   * SUBTEST: live@vma
>   * Category: Selftest
>   * Description: Per-object virtual address management
> - * Functionality: memory management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: vma
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@win_blt_copy
>   * Category: Selftest
>   * Description: Validation of migration interface
>   * Functionality: migration interface
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Test category: i915 / HW
> + * Sub-category: Blitter
>   *
>   * SUBTEST: live@workarounds
>   * Category: Selftest
>   * Description: Check workarounds persist or are reapplied after resets =
and
> other power management events
> - * Functionality: workarounds
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: driver workarounds
> + * Test category: HW
> + * Sub-category: Workarounds
>   *
>   * SUBTEST: mock
> + * Category: Selftest
>   * Feature: gem_core
> + * Sub-category: Selftest
> + * Functionality: mock selftest
>   * Run type: FULL
>   *
>   * SUBTEST: mock@buddy
>   * Category: Selftest
>   * Description: Buddy allocation
> - * Functionality: memory management
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
> + * Functionality: buddy allocation
> + * Test category: DRM
> + * Sub-category: Memory management
>   *
>   * SUBTEST: mock@contexts
>   * Category: Selftest
>   * Description: GEM context internal API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: context
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@dmabuf
>   * Category: Selftest
>   * Description: dma-buf (buffer management) API checks
> - * Functionality: API checks
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
> + * Functionality: buffer management
> + * Test category: DRM
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@engine
>   * Category: Selftest
>   * Description: Engine topology API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: engine topology
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@evict
>   * Category: Selftest
>   * Description: GTT eviction API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: gtt eviction
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@fence
>   * Category: Selftest
>   * Description: semaphore API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: semaphore
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@gtt
>   * Category: Selftest
>   * Description: Virtual address management API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: gtt
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@hugepages
>   * Category: Selftest
>   * Description: Hugepage API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: huge page
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@memory_region
>   * Category: Selftest
>   * Description: Memory region API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: memory region
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@objects
>   * Category: Selftest
>   * Description: Buffer object API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: buffer object
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@phys
>   * Category: Selftest
>   * Description: legacy physical object API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: physical object
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@requests
>   * Category: Selftest
>   * Description: Internal command submission API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: requests
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@ring
>   * Category: Selftest
>   * Description: Ringbuffer management API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: ringbuffer
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@sanitycheck
>   * Category: Selftest
>   * Description: Selftest for the selftest
> - * Functionality: selftests
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: selftest
> + * Test category: i915
> + * Sub-category: Core
>   *
>   * SUBTEST: mock@scatterlist
>   * Category: Selftest
>   * Description: Scatterlist API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: scatterlist
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@shmem
>   * Category: Selftest
>   * Description: SHM utils API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: shm
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@syncmap
>   * Category: Selftest
>   * Description: API checks for the contracted radixtree
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: contracted radixtree
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@timelines
>   * Category: Selftest
>   * Description: API checks for semaphore tracking
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: semaphore
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@tlb
>   * Category: Selftest
>   * Test category: Memory Management
> + * Sub-category: Memory management
> + * Functionality: tlb
>   *
>   * SUBTEST: mock@uncore
>   * Category: Selftest
>   * Description: Basic i915 driver module selftests
>   * Feature: forcewake
> - * Test category: forcewake
> + * Functionality: forcewake
> + * Sub-category: Power management
>   *
>   * SUBTEST: mock@vma
>   * Category: Selftest
>   * Description: API checks for virtual address management
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: vma
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: perf
> - * Feature: oa
> + * Category: Selftest
> + * Feature: i915 perf selftests
> + * Functionality: oa
> + * Sub-category: Performance
>   * Run type: FULL
>   *
>   * SUBTEST: perf@blt
>   * Category: Selftest
>   * Feature: i915 perf selftests
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: perf@engine_cs
>   * Category: Selftest
>   * Feature: i915 perf selftests
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: perf@region
>   * Category: Selftest
>   * Feature: i915 perf selftests
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: perf@request
>   * Category: Selftest
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: perf@scheduler
>   * Category: Selftest
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   */
>=20
>  IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
> --
> 2.34.1


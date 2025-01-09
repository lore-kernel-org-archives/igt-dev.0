Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380B6E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 17:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F014D10E00F;
	Thu,  9 Jan 2025 17:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIFC0oeB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC70E10E00F
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736444626; x=1767980626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XuZRtq6bA5yo/H+OH4/GUCPhZQbc5o3j0gCAeVE+0HE=;
 b=JIFC0oeBKDcQmLWXpBtwhyArgr1jbGGc+yPrx6/chAAMsTyN4jKm9ZT2
 SmzgfxgWSz8u0/yvgCytMoBHBCjfwv61iJgzziQi4YX1kly+880G7E295
 WrMKVer2wgo1BSuO48rziTe882AuajO0u9WLzAaExyYd+Y+LYyDAMmzle
 YrkqWU3M7cQ7YfGBy4Uby4XJgHv3qVMYd75KSG1dFbOstk5PqkpORW+LB
 hNRzyHlO/fsf9vS2b9vyx2jUFec8mlUcm81rQPK+ZuYwpELTQgHMN5Z+W
 ZEqg+4M/3OOC2yBL+HUk3qfjH0qQQQ60kkT4UCVrTm1vpjWd4NEpQnKXX A==;
X-CSE-ConnectionGUID: JFbMFk4mQie7amdk72I8mQ==
X-CSE-MsgGUID: LOjzvsNtRaqFjSZ6ylBWNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36884106"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36884106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 09:43:23 -0800
X-CSE-ConnectionGUID: E/9dL+31TeqfaprQjsm9lQ==
X-CSE-MsgGUID: 1yHbBvhCQuqK7xv4ZL/QQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140781915"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 09:43:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 09:43:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 09:43:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 09:43:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+C0d0xg7SfiQNgHLJq1dMO5jIXxeqguOONfesU9TxPt6t6QUStiUmbXPiorPiu5h4QsjtWAH/Ywolpna9T0AMSWluxLW5wIpN065OQN6Ce23YRdsyFOkPtwXFX9PgoKDxVQ2bsa7+yHzhKle0ixyxWZxw34rFQUGZlYu7ay/6VjMcPIwPgBpAVDavs1dqVWwPCGJ7zWDaXG1g2aNKoackDEta6Ty/1oEVUYl0Aw0qCLfL872MzEK/Idb6HkzWzD/euQfQdfKGCr9i381EOagCBEkAJ69J0JRMFMj/cyMjZoosjdwxUfSD7d3BCBHmecqT1suvW5EF1PYo6Ec1aolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCMjGFsQkHsGoMu7XoCPMI0P5CnAlBDa4Tzo5aldmkA=;
 b=N5vL3/p7Rm3c/nomeXhRlw21vtVoSpy0l5u1bwTvRI92KCfDWHhY7q6nJwlrCkYFA914EVXq60alxt2oz9NXo3vkKBuVlh9TpUdIIA1MtG7K2/91kzzMaPCFiF8XoFu/lnhsXjldVgiFmIK2Sm4T8Dx/qEb+Wvup2e7Ai5sMkDxv00uwJOCUsCpOITMRjjdarZia7ff/R3jA9BghtR1yPfLb6Tg6UU7E4C+IsgEBFxzepmkGohgoImIOtT2K/w/fH4bTXCiQyIXVpahfTeNKDNOiap4w0iYafw42Swb4zOa89FuqpjvBV47OyYajSbzpcW9m91p8SypJskmSB84h7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 17:42:37 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8314.013; Thu, 9 Jan 2025
 17:42:37 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v1] tests/xe_debugfs: Improve test_gt subtest
Thread-Topic: [PATCH v1] tests/xe_debugfs: Improve test_gt subtest
Thread-Index: AQHbYoXj/Er7RBQE2Uy7myOs6lS6OLMOq30AgAAJyPA=
Date: Thu, 9 Jan 2025 17:42:37 +0000
Message-ID: <BL1PR11MB55253CE142100726556CFC6C84132@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250109105721.914096-1-pravalika.gurram@intel.com>
 <v6a252t6spq7j4siiftwiasbi7jl3ognhqinhnwknr4e5xqeyi@awzm247ebwi2>
In-Reply-To: <v6a252t6spq7j4siiftwiasbi7jl3ognhqinhnwknr4e5xqeyi@awzm247ebwi2>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA0PR11MB7158:EE_
x-ms-office365-filtering-correlation-id: f0d0b4d5-d527-4b8d-748e-08dd30d501a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?otaTkyH8Jn7YmyRwaGL1t0QzL9LTCv4azJoBGvpXQDdaCnNoRYMJ/x18j7Zr?=
 =?us-ascii?Q?bKgL83WHKlVcS0IVsZ6qYDpXrFlDWLjmXfCATuu1B9TS6RjZHqekj8pKmebl?=
 =?us-ascii?Q?kFmQzxjDeXDPEHT9BkF/SdjQCFZaGW312KfPZ6yeudohvT7TcUHtqrFhgCOf?=
 =?us-ascii?Q?AlyzNxTQCVPOgCypLhF/yEGzkgqVQcny33gkZaQzJWzdCD2wQMkJaq5Its8g?=
 =?us-ascii?Q?QwnkdkPrcnLIfxCH0Jj5Opvt8Lp3VZAla9OsGmIbvizEkrXKkQrhGMP3pt7Q?=
 =?us-ascii?Q?DL0DvCG6x8bnU9zrbl9Ub8MdI2KFlU+eRQo0pK2i6l4euAXpB/ytYWKm0rcr?=
 =?us-ascii?Q?6Aw/NULCp2fVOUXsv1uaFczqTH0FltuR+2nZ4Ajm5US+RT2tEoPVbIGzF9IB?=
 =?us-ascii?Q?BR6d23BdAyNAzGn/Hz63xhnSCbY37QZ4O1N+PEx9J2rRTPdJZKk2dmWVgkfi?=
 =?us-ascii?Q?N7TybzNQUWLs8FkEdbn4Fl1+XJAmvVoMpO1boxax7r+aTr6m0guXdJamMg62?=
 =?us-ascii?Q?siFouSIRV4KdetuzC9l9fWAVGeUVbSVY2eB9gpDmOExafOyaVSbol2OyaADA?=
 =?us-ascii?Q?DvaL310U+0vMEZzlpmK1q4pV0aJbRRBtKgBFKzb58JLWAv07XgOKNMsqLQk/?=
 =?us-ascii?Q?fSHX6Cale1hs2q54GuIFGhGT1r1fxdFDmz+IL3MdzidibhVBgDwzbdDt/cyA?=
 =?us-ascii?Q?c+nJ8wugxon7AwnnuudyI8RIjzHKI672HhyzWNqXumXhAlDo1wBIxXB987ZU?=
 =?us-ascii?Q?eDNJPjnly+IN+g5bMWL0i4XxrcPPYx4ccixuavueqRUHZXdHp7u3UtgFh1AI?=
 =?us-ascii?Q?KYUgaVoZ4zS+yBqvKzYXEYZqqK2O9zkqIUfQe2L6l+etqdcBJGCUJrKHwH1L?=
 =?us-ascii?Q?yaSGBTvzssRE7KeHdCxaW56B+BDuoOXaO+jQJLTx6XkXeD6Se7VnXuCqCquN?=
 =?us-ascii?Q?pKrjoJvUUgchq3IGN+GG4tkMn4mkm3hVTDnyVvPzLvldoIPVX4S1Xbuw8gAG?=
 =?us-ascii?Q?snTaTe+86tVaYEqEI7wL2E7a9W9ugfTXnvgfCgnaq2sSLEMMc3BMAgyLpDyM?=
 =?us-ascii?Q?UaAkIj+snOC8vzKe8yaZAYpfg7UiRJpAoFUMSLgQ5dk1QqEhPdASrkXnkGhE?=
 =?us-ascii?Q?Kwp8S24ZgO3gTTZhFqC/obA7c6jyrPF2QOiQPPizCmTi+6kpM+/5HKMXkgv0?=
 =?us-ascii?Q?lHKS8ChpYY6YqGkFu76HBwS/xF9PHmayPcyDvTdQGZ4MXo877P2KmOioBjTo?=
 =?us-ascii?Q?tR7l/1fJy+GwAj+otkgmI7TdTMObvy8iAyu3c2lQC0gNw0lwsTDaTx/MSwJ6?=
 =?us-ascii?Q?EkLtY21/Gh41aWht7T6LqYiv21q5NmxR9zHZ4hgTriNtPttrDZNnDPTmeFZS?=
 =?us-ascii?Q?Q0kGfzrZDcH8TF12/Zo75Z1eHE1TixKqOpW1iyx1coWhYfhzy0+7JfWh6zuU?=
 =?us-ascii?Q?QhS38EPQWWrvR2Fn77nn/KJypAeYr7ih?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JmQVwXZddp9vZVUYY5F8TE6ObK+pigPtfQ2afq3SDD+E3jxNaLOCBfs8RcwJ?=
 =?us-ascii?Q?UdHZ1BTnn+iRy9j+c8ROWXrFvw1AKY9I9alAB9id6w22l0QtBLde5ubd7o/O?=
 =?us-ascii?Q?pzKG2Wh+ho9JXDi41FXZMti7rrYWMfleGllADaYcCNvVsqznkY/4/n29UZR0?=
 =?us-ascii?Q?iZ8kW8h0pRQMePL0JMbF7kQjukE9LMpV2qKcMFhsn8tYcCFnqTy39Dy9NWey?=
 =?us-ascii?Q?EksU8uYX3qRB4gTYuCUFES0316sjmj8bwQJxjw1iojd2KtPlH3vSwm/MWH9c?=
 =?us-ascii?Q?R5LCJMywAVsrisp7vJSaTeNoUsaQZHhJ4p2qpAt5N64edxQ/da9ojDrmsWxm?=
 =?us-ascii?Q?v/zNm5pPLeqYwM2iv/ADXM9mPWkYZpRmqi6COwrEZ4Sve6nwLWiXUljoJcDG?=
 =?us-ascii?Q?MrkxFoq2wFWPXEHJwFJyxUpes8ub5f3lIc1rmX/emhfrzaFf/qW+YKCH0F2C?=
 =?us-ascii?Q?yX09MfqFAHPjPWMgM0v3qzfR5+TpclTgSduskihWoZ98TM5d1+zxFxAms8MC?=
 =?us-ascii?Q?tha5YHyJJ2119+UVocODwYjoAJSHOD7SdQuhCTbS+/+qepC8C70a/v+qzjLc?=
 =?us-ascii?Q?Mh5GOZxCcM9zm5ZkVrojir00v3LQviCZRUGKFzWBfsNWvp4t4fH9/mulLaHB?=
 =?us-ascii?Q?pv84GnvrLcG6zAtVZw2JsptrgDcVc5w59GYOBQ810ix25PgT6UA9PdUGeubi?=
 =?us-ascii?Q?UGpHawW1kv+bwL5wmsSLKfD9LL0H7pKkzxE/UWVb9gC2lD3chJVAazAkxnDQ?=
 =?us-ascii?Q?UrkA18dfhTOTM4DyzkMyrvrw+0VQnKTJQ7XSXJyzj2qDM/MbZBvtjvscPXJs?=
 =?us-ascii?Q?uYbdF8+d9/WSTDDVPowB/29izQ73AgzJTglz9v6IiN5+m45IHPvI4MBTNEBK?=
 =?us-ascii?Q?m3GEdu2RjD7aBjPGsysMSYGqCQfwiYhjiUcWOkzYBI371XS4ruMR1HyyPcU8?=
 =?us-ascii?Q?arF/raYgeZsrKX80/tIqjX8ECw5fGhKvHg0Cp5h0mXitTATgp/fzkDjEuHzI?=
 =?us-ascii?Q?zZ0lNES3IShK2kZPZJZ3pJAnwQQ3YK87Lm59tcUcrg9J7+BfuuEyIZGVbFFI?=
 =?us-ascii?Q?bsr4n492fiCKjyCxypADbPW2acxSiKXvK03qYV75HWIAWXZNUKs6OLD/1AOY?=
 =?us-ascii?Q?OH7pDY3bZnmHE5WAc7FPLgEzFXX0sGNTfyLsCBKVDRJzzlbIbBo5YO07ZV0e?=
 =?us-ascii?Q?VK7SSLTMXbQq3gW24FLcQswLcc+z7r9gr3WpjPB7gv6VUh2vqtb7ZGVhh4NN?=
 =?us-ascii?Q?ssJEekWQEefsx6I/SbS6lUzHjjIQL7c/HoQmDxgxjf0o8ajHAXFPLTla/nlc?=
 =?us-ascii?Q?sEA6WbcVg8yAFUEMBEvecq8Qj586bhE0eEPmM4fR7kJ+SP3MngBbQTEdrNgc?=
 =?us-ascii?Q?/I6QJEBNGLmRdldIwaUUzH58inZie8mXcAFPajRg8vz9xp9mO6/MB+iXjTrI?=
 =?us-ascii?Q?7KQhYOVZNuDK+p86VU06/LXxPHV7/Lun+qrquwIx4O4k7ktHnp3RlQm5ifkd?=
 =?us-ascii?Q?rAup7qcmY3ak36/bmCcM31mes2a2skzexU67O5CGRE9ZAEeyh0NKskz5/hb6?=
 =?us-ascii?Q?xjc3KBsxf8V9EK9mfzh/SIg/5/MhkaVXrJhDjNOM02szZHUs3ueBW8XYO467?=
 =?us-ascii?Q?IA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d0b4d5-d527-4b8d-748e-08dd30d501a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 17:42:37.0381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 59d9IXAH4zVKx7vmTEq16B/gl7L4i5bdRBNi/Q3CWJipUXvlPkeMak1oRZrbXIYN93tTKmX2RJdt92wAnfIb8T/TRWVU7C1TqMgWqzZrT3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, January 9, 2025 10:33 PM
> To: Gurram, Pravalika <pravalika.gurram@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH v1] tests/xe_debugfs: Improve test_gt subtest
>=20
> On Thu, Jan 09, 2025 at 04:27:21PM +0530, Pravalika Gurram wrote:
> >Read the debugfs entries in the loop to improve the readability.
> >
> >Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> >---
> > tests/intel/xe_debugfs.c | 84 +++++++---------------------------------
> > 1 file changed, 13 insertions(+), 71 deletions(-)
> >
> >diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c index
> >bcbb5036a..3d8c17921 100644
> >--- a/tests/intel/xe_debugfs.c
> >+++ b/tests/intel/xe_debugfs.c
> >@@ -180,77 +180,19 @@ test_gt(int fd, int gt_id)
> > //		"guc_ct_selftest"
> > 	};
> >
> >-	sprintf(name, "gt%d/hw_engines", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/sa_info", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/steering", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/topology", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/pat", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/mocs", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/ggtt", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/register-save-restore", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/workarounds", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/default_lrc_rcs", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/default_lrc_ccs", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/default_lrc_bcs", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/default_lrc_vecs", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/default_lrc_vcs", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/hwconfig", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/uc/guc_info", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/uc/huc_info", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/uc/guc_log", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >+	for (int i =3D 0; i < ARRAY_SIZE(expected_files); i++) {
> >+		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> >+		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >+		if (!strstr(name, "uc")) {
>=20
> strstr will find any substring "uc". You could do a strcmp() instead, but=
 I don't
> understand why we are doing this here.
>=20
> I'd just remove 'uc' from the array and update validate_entries to ignore
> directories.
>=20
> Lucas De Marchi
>=20

Strcmp will not work here because sprintf will save  name =3D "gt0/uc"=20
If we do strcmp(name,"gt0/uc") gt cannot be fixed 0  always correct it can =
change=20
that's why I have added strstr

I did not understand which directories can be ignored you meant say "uc"
we don't need to dump "uc/*" data?

--Pravalika
> >+			igt_debugfs_dump(fd, name);
> >+		} else {
> >+			for (int j =3D 0; j < ARRAY_SIZE(expected_files_uc); j++)
> {
> >+				sprintf(name, "gt%d/uc/%s", gt_id,
> expected_files_uc[j]);
> >+				igt_assert(igt_debugfs_exists(fd, name,
> O_RDONLY));
> >+				igt_debugfs_dump(fd, name);
> >+			}
> >+		}
> >+	}
> >
> > 	sprintf(name, "/gt%d", gt_id);
> > 	validate_entries(fd, name, expected_files,
> >ARRAY_SIZE(expected_files));
> >--
> >2.34.1
> >

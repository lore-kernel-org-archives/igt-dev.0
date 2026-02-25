Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954C0F5545D
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 05:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3710410E6A6;
	Wed, 25 Feb 2026 05:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgovtGsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ED410E6A6
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 05:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771998661; x=1803534661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LlqEEJlcdd3gLnXEqXmpQ8U962M4hllbUkV6z5vbdwI=;
 b=DgovtGsSLHjdB6HOSIbYhxtMUk2+AC/u50wrEBIDxmD7HFRJgmEBZApF
 cFhuREGTAvAoH4GZ05bzoD7qP98qx/yORWdRO807VioHQAWXVPZJpt85L
 GXlDrHzGyaHunAWILiGBr/186xJN35my+rQT/i1NJyz/XggYAcWj0ieob
 8g4gMey87t9RYEDyJRUjB8RRpkLOf+vkLtgVCpMNXICN3QuVCrUQY4KiP
 qvQpO3gxEwhjlAYcuYiWUqSCbF3T0CUW1wfvBCtFhX+5tBdZaziPxO5nN
 i9XyM1bEZOqJ5AT2Rz65DdGkfbREU/5GbtDNoVKd46sbGwhlhj0eAGNRt w==;
X-CSE-ConnectionGUID: o6OYbSzqS/ufsWDMZ/H9eg==
X-CSE-MsgGUID: VxRBWxZ2TXqkjfatGPy+IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72729354"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72729354"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 21:51:01 -0800
X-CSE-ConnectionGUID: 7xCYlC9ORUOqBODijfSfGg==
X-CSE-MsgGUID: imnwjFtHRTycOuE7UvRapA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="214934375"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 21:51:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 21:50:59 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 21:50:59 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 21:50:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIKYt/W4cfpXxdz1mov6Brw4FlRxM+Df9ZTpRnf7q5MPKrIGlD8CyjN/Aii1Xk9DKlG0hyc6d73hm/g3/qh9PNIYN+q2+wH4b5X3d8JZyjq0Oy3zDTmuc5WuLCZU7wh/3LGiuFif3Kgeq/fF9/SNXbDcynokJEnKaOJiQHHLCp7FtXNuSu1Equwe3Zuds3MZkrR+dyKlgwHFEpECCl8BwsqaKRlKGWjCe6gmuvaeRUN+miWqqfEych5K9enuQkaKuaFyyhx3GWuKUSldpO7o64SApYY+bIJqim3OnPW+89ha/8jGVMAnklPGW0qZgmZnw7WHBxHq/GpjH5kdPizE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlqEEJlcdd3gLnXEqXmpQ8U962M4hllbUkV6z5vbdwI=;
 b=UMgmXfEc3EyGK0IuqIjgNxiJLPtSsevsV8NzRmo7EdnS99SRi5wbOWxkyBc1FRF85P2kLAzDxsDq2tl6ofEkwlUsY7TMkYYyfgCD6YnGZ0RKbMdPHuNkJQq1yljTriHxJPF794Ao9IBFXg1fOoC2oQM2MnDVw8MDA2J2jKa/eXxzteLH5B//cRPJLgRI/pB+SL3UwaSaeNCTK1xf1RF9vGcdI9ekIrgaWWXGeTlhCwbm55sGMPHQqGCvWfUs+ZOFpKhED3M5qNY17PB1NG4NHNZ2ftBgffnTvnmO28u7opLwBxC8PP3V7UA2aZSwnAjLN5aDlJ1VlSDQZXQtsoCz1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by IA1PR11MB9495.namprd11.prod.outlook.com (2603:10b6:208:59f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 05:50:53 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 05:50:53 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_vrr: Avoid LOBF debugfs loss by
 checking during active display
Thread-Topic: [PATCH i-g-t v1] tests/kms_vrr: Avoid LOBF debugfs loss by
 checking during active display
Thread-Index: AQHcpNnZv2lbmti8xkGC67h9R6HxZrWS60kQ
Date: Wed, 25 Feb 2026 05:50:53 +0000
Message-ID: <MN0PR11MB603474D3BED5960CF8B74FA88175A@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260223153423.2728601-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260223153423.2728601-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|IA1PR11MB9495:EE_
x-ms-office365-filtering-correlation-id: cf94f861-4d36-4fe3-010a-08de7431d66d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OVl5ZHFUZnhsUkJoN1EwTnYrVDJ4elVZSGxCb1lVcml1emVnd0pCc2VBWDZr?=
 =?utf-8?B?OTFtVWNtTDhldEtwamcwLzEybzJsL1ZzNHFBM29VQ05XVWdoK3FKWGF2T3BM?=
 =?utf-8?B?VmNESHZiMDhrUkFBbUdWVnp6K2FjK3JSNThVYU42Vkg5ZENwZjdaZ2RuVHVR?=
 =?utf-8?B?M3EvQURydkY1QTVWcXp6OHNzT3VyeDVzbTJveUk2ZTJvY21LZzZxeUNwb0VT?=
 =?utf-8?B?ZFZCWjlIdmNrMWdsTnlJb2hvR0Fpcks4UEVDQkRrZ1hoa0s4aUNpNzJuVVRE?=
 =?utf-8?B?YXg3TnYycW85RnNrRVNtMWplTlV6ZjQzUUZzS1dQSFRUa3d3ZWhNSFNHdmE1?=
 =?utf-8?B?Z0w4Nm11T3JneUdWV0c2OGVZRjVFSjdHZGhoMFVwbzNMeXE3TmJ3U0Q3NEtk?=
 =?utf-8?B?Tm5TWFhzREFmdkxEYXg3bVpqY0J4ZDdNLzAwelpOdW5RNkE1aXZhYkFqRUlP?=
 =?utf-8?B?UkhaR0lqcU4xUW1SVnJNY1JHa2xFL3RCRHBYZXBCUU96YzdKdGs0alZWaE5Z?=
 =?utf-8?B?WEo5ZnU0WFE2K2llU3FTdHE3TTFqVGFsK1hkd0VoVmdoeTUrSVpDRUtyU0Qy?=
 =?utf-8?B?cy9WaldZa240SSt4K0R3UnNzeWdQTkxpUTBFeFFUQmZOa0dFOXFmbTNXc25l?=
 =?utf-8?B?U25MUHlkaDB4V1Z4WjBHTlYycVk3eVpiK1hyYzhCb2FOQmNJdWxiOXI3UE9m?=
 =?utf-8?B?WUpNY0VjOGE0UjNHZHJrSWlObVM5US9uVFRodGdUbVFOTmx0dGYvYVJickdm?=
 =?utf-8?B?cWVETkVUZURDMFdlR201ejlYWDRtSVBjM3dBRTJVc2NlUjBqaFJSMlRvc3d1?=
 =?utf-8?B?UmRIQ3RiaW82UFVIeHM5VFF2bUYvYmMxMDEwWmFBZTgwSkU0b3pLMHFxNWh0?=
 =?utf-8?B?eFBMOGo0cTNlUDlyRk9hR0UrNlNOSUVkL0h4RStMY1hqZm1SblJjMFZWRWpD?=
 =?utf-8?B?TWRRQXNFQlZ2M2JDaDF6SDJZRm15emZOZytmY1ZDcEIwT211blY2S3ZhTW9S?=
 =?utf-8?B?N3ZWQUhXWGRVRzh2QytZL2ZIcFNhQ3cyaWIrNDcxYnREMGxQRUtLNUdhaU03?=
 =?utf-8?B?MElUdmFTN2tNeDJzNnQ0UXB5L0pWRFIranJCOGZjb215LzZiRHk5b1J1QWJN?=
 =?utf-8?B?VWFBcW50dEg4anlDMkNPajBBc3pxdFZnVllaNWU4aTk3WHdCWXhnQ0hLUjM5?=
 =?utf-8?B?ZEp2ZktXMGlhZkU4UHUyOTZQQ08zblR3c2lSa1FmbG45VFh3VUhHRWxjazQw?=
 =?utf-8?B?WGgxSVZjMmtBbVFCbDBVWkpSczlDaU5saUJsalloeTExRTUvZWlveFVrZHlQ?=
 =?utf-8?B?MUZueXRpNlVNTmhhNmFRN3FjZmc0cDB1NTVheWNBejN1azJkTkZ6UlRyeTJW?=
 =?utf-8?B?Nm5xa0hvZEphbC8wY2V3cWJ2Z21lMUw5RzcyZnR2ODdtME9JNzhmKzBBM1Mz?=
 =?utf-8?B?QS9scjgzdUI3cDZrMDZNMXoyMXk5SGtMZzRKTG9ROFhoaVhGR2Zubldrc0xr?=
 =?utf-8?B?M2VUWGdkKzNJYUJSb08zb2hqaDR2TE1mSWZ6cDhrSVFNeVo0WG56OWxURjhY?=
 =?utf-8?B?ZWs3aUcyaGd6aGlaeDI3cElkS0VUSGI4V2ZlNitKTzA5NTE5MnlNbW91SzJD?=
 =?utf-8?B?QjRoaGs5ZTliV0YxbjA1SFF4NnlrZmoxam5pOHE5ZnFwMVFWMUdMQVZGNS9L?=
 =?utf-8?B?d2tNeXBvTkIzMWdlbzhKOFQzSDBac242eFhzVXVVbUV1ZUtjSEdoQ3l6a1Nl?=
 =?utf-8?B?aGtDNiswRnVHbUwxKzN1SUN1SVd1Z2Nia08vU05YSmd2VjZBY0IzUWV1MmM5?=
 =?utf-8?B?ZmU2ZUlOOGxUbGViMjZ5NFo3bUk3bCtnQWczS3MycFU3eVhYQjVYTUFNR21N?=
 =?utf-8?B?UDUvVW5LOHRPSXBXVlkxT3Y1amZvWXNzMUNmM21UeFcxTWZ0Z2NFZkFoOEpR?=
 =?utf-8?B?NmxSMFVMQjhGdW13RVY0Ymd5eVkxaDAxY00vcDd1VmIyTkZ0ZFVBTFZlTnVi?=
 =?utf-8?B?UzgzS0FoQ1RRZW5ZbzlMYzlBMjIrL01BWkZROTJBYzVJbjA0eXBoUC9HT05M?=
 =?utf-8?B?bmZ4VkRzbDA1TThDSyt1U1J3YWxJWDdoWHRUcDVBUUo5R0Z2YTdzbHRyZFVQ?=
 =?utf-8?B?bUpkdjBQSGNHK01oUmlZZVcxTkxCOUc2SGZ5N2lESzIxcGRRbEIvTkhDb1pH?=
 =?utf-8?Q?7JjbucXtrjNEe2/f1b471Ws=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUNkNVU4RG5leUpwdzNDSnZpWUhsMFY4RTcxTy9LYkJIUGhBZk5wSmttWlQv?=
 =?utf-8?B?RUdRQjJKcDByb3h1WlpjUEJYMmhXa3BzcitPb1JRZCtVTE5ZNmxEd241SWo3?=
 =?utf-8?B?VHdqY2pUZk9tR1RrY0NFQ2pqTURKNlkyWEgxOEQrMVNaZHZxRGVUYU5oaENP?=
 =?utf-8?B?a0dmUFhsaTBZaWRLQ0MyU2dST0I4eHRmNlJ5QlEwSXAwVmdlTzRkVU55cjBX?=
 =?utf-8?B?RWxzZmNKci9EdWlMY3RZVUVka2dtYXFGZVlzQkU1eDYyR0JMaDFJM1VuVW4z?=
 =?utf-8?B?bTliOGFNU1B6K3lqZHAvc2ZodlM1cW5odUVTNzdSVy9Fa3k0KzQyNTVURUlX?=
 =?utf-8?B?R2RaNE1GcGVLZzRzWHcramFqVDJVRi83aFp1Q1hyNHB0RTlVZVdXU2h2UHZo?=
 =?utf-8?B?UWNlWVRRMEs3bmVQSE8wdlZESGhZV3VHcnZhQmZseTZLOXdkL1ZobDBpcEFr?=
 =?utf-8?B?TWZUUlNUUkpqUmFabHo3YWlJQ3U1T1FwVzBTQ2s4K2VKQXYzeFlVSXpLZ2Jt?=
 =?utf-8?B?ZDJ1Wk11TzlvbVpRVjNZcjdjdTZxdGgyMU5JcnlLL1ppTFhUREM1T1NRLzZk?=
 =?utf-8?B?YmxVbTQxdVg5T3YyUml0eTE2Ynpsd0lCMG9ENUllajlaTDFjOVd0TEFtaThl?=
 =?utf-8?B?cWhvQ2pBTXRFMkcvYXgvZWRSclF4VWdUZk9VYjg4aUpvWkR2ZU5LS2lpOGQz?=
 =?utf-8?B?TnVnaWxDZjUxTXVla3JaR041Q2JWRUtCWFdvQU5DZ3ZqdE9hUm0yeFVDQ2lN?=
 =?utf-8?B?bm9nVnVRZWErWDFiak9sZFRza2pMQ2NIL2xkSFIwRUhacHM3N1lKQzBWUGt5?=
 =?utf-8?B?OTNvZ2pwaUNDRjRxVTJiOHlLck1md1dtYWIrUmF3NCtCYS9HRUtKN08zWVZJ?=
 =?utf-8?B?MTJjY2NRbzhKOWRQYlRUUUVFMERORjJ3V2hBYkZCeUtCeUhBOTNpNjBPYmpD?=
 =?utf-8?B?c09MNXlucUxnbVlNRGJpSzRUZEc3Sm1GbUpIakkrODBSdWNjZXlwWTBaN1NQ?=
 =?utf-8?B?TXZYaFozV0FheUY3V0tjYm1ZOUVmemlncnJZczF4eGs5VXdET1QwOUZWMzUx?=
 =?utf-8?B?bElsUVRiZzN2L0g4eTlPb2h3Tnora1ljS1BMdmZNeVF4cG01cjJsZG5RT1pD?=
 =?utf-8?B?bUI5WWJYNkMvT25HMHU0WU9xTjRsUHo4VkFDRVpuVUZRSW1taS9QbnIwV0N1?=
 =?utf-8?B?WithQXZwZ2FtZm5LbUNkb0JKMXdmRjJ6RTlScnVzNEpOeDIzaWdDcmEvekFB?=
 =?utf-8?B?ajNiamM1ck1sc2pFM1VKL1hOTmRwQkYyd1JnNGZ3ZSsyaS8yaSsrZk56a0ts?=
 =?utf-8?B?d2lCWXQxVEFTTUZveTJ4SnVBYVBZdlBnS0dTSmh2ZUpyTnZ4WGIxRER1dGVB?=
 =?utf-8?B?aml1ZDN4V2J2UUNPRTZqbVlWVXordGFqb0xhdmQ4WU9KZGVFUVo0b2xqK1VO?=
 =?utf-8?B?aHJqWXF5aXUyVURmYXZoK1gvR214UUh5ZDdmSmcvZG10QW1kN044N09jbExY?=
 =?utf-8?B?TDAxOUxQYWlMSlFBdmhRNm1KZlBsWHJOQkFRcy9lYldnc1BzT2hlOXZLanNH?=
 =?utf-8?B?SkJQb0Jpd2pzY0xUQXJWVGVtOENSdXA5S3NDZzBPVm4xNG50T2xYaFVhZG0z?=
 =?utf-8?B?czBETU84TjVZM2dyV3NXd0wrSHI0bWZ6Rk0vb0lLUmYyTmZvaWRIV3NoWi8w?=
 =?utf-8?B?SUFCRi9tdk44UHcrTXdzcXhVdDIyRm5xVnVWMjJNd1VBOFlEWUNIRGcyZm1V?=
 =?utf-8?B?eG1NQ1M0dXZ1amowbHlXZVcyUGhraUs0VERBU1Q0dy9GWXRNZmJLYmhZcGRT?=
 =?utf-8?B?NzVJdFJoWmRtbDl5Nk5zczQ0YjB4Y3JTM2s0L0lvelYvSVpja0NyQUE2OHNM?=
 =?utf-8?B?Y3ZPUmYrV01LRGc4c1BkVkVJN2Z6OUIrc1lQbElrUW9zUUtoakJvR1Q2R2d1?=
 =?utf-8?B?N3Zvd3MwMTBiWjUxYU1NTjNJRHhoZTF6ZHZjVkR0VUcxNlRSTVpGeUdaVWZa?=
 =?utf-8?B?OTVmWC9HRWU4RWZRNTlPTmdpUVlxd3h5RUNIRk1MaW1GT0k2MnJXRWpuSmZw?=
 =?utf-8?B?RXB2Si81K0RwZkVKSlh4eTdFWUpKdGlYaHcrNWFZdWNhK0EybXJCbGgwNDBT?=
 =?utf-8?B?N3RZOTJjN3ZZekcwTks4S1cwNFJOV0gzbGxNVmhXdEp3Y0JObFdhdlExbW04?=
 =?utf-8?B?SjJwREgyQmpyOTlKeE5iWHlRREI1aXQ0emdDUzZFcHh1MGM4TkR6a0svYitT?=
 =?utf-8?B?TTVHREFSUWszVEd2ZUdBVUdUMExtU2FaMFQ4TERIbS85NlZzdXo4UlVMNXJ4?=
 =?utf-8?B?NGRXaG1YVXhjRktaMTZtVTBnVzFZckxiTVJkL25XR2lHZTRWVTBYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf94f861-4d36-4fe3-010a-08de7431d66d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 05:50:53.2846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OEhVgSzcB0oL4QbGzTubNrglmlR8jrPKiI/5Hr+Aoj9Fhw3+Nx/M0LmFjZX1cVnIv3zLTTkKTPSdd2Fnyp8t9JCE5Y30MButqgCPdRY+yAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9495
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE5hbGFkYWxhDQo+
IFJhbWFuYWlkdQ0KPiBTZW50OiAyMyBGZWJydWFyeSAyMDI2IDIxOjA0DQo+IFRvOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRlbC5j
b20+OyBKb3NoaSwgS3VuYWwxIDxrdW5hbDEuam9zaGlAaW50ZWwuY29tPjsNCj4gTWFubmEsIEFu
aW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPjsgTmFsYWRhbGEsIFJhbWFuYWlkdQ0KPiA8
cmFtYW5haWR1Lm5hbGFkYWxhQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYx
XSB0ZXN0cy9rbXNfdnJyOiBBdm9pZCBMT0JGIGRlYnVnZnMgbG9zcyBieSBjaGVja2luZw0KPiBk
dXJpbmcgYWN0aXZlIGRpc3BsYXkNCj4gDQo+IEFkanVzdHMgdGhlIHBsYWNlbWVudCBvZiBMT0JG
4oCRcmVsYXRlZCBjaGVja3Mgc28gdGhleSBydW4gd2hpbGUgdGhlIGRpc3BsYXkNCj4gcGlwZWxp
bmUgaXMgc3RpbGwgYWN0aXZlLiBQcmV2aW91c2x5LCB0aGVzZSBjaGVja3Mgd2VyZSBleGVjdXRl
ZCBhZnRlciB0aGUgZGlzcGxheQ0KPiBoYWQgYWxyZWFkeSBiZWd1biBzaHV0dGluZyBkb3duLCBj
YXVzaW5nIHRoZSBkZWJ1ZyBpbmZvcm1hdGlvbiB0byBiZWNvbWUNCj4gdW5hdmFpbGFibGUgYW5k
IHJlc3VsdGluZyBpbiBmYWxzZSBmYWlsdXJlcy4NCj4gDQo+IE5vdyBjaGVja3MgYXJlIG1vdmVk
IHRvIGEgc3RhZ2Ugd2hlcmUgdGhlIHBhbmVsIGFuZCBsaW5rIHJlbWFpbiBlbmFibGVkLA0KPiBl
bnN1cmluZyBjb25zaXN0ZW50IGFjY2VzcyB0byBMT0JGIHRlbGVtZXRyeS4NCj4gSW5pdGlhbGl6
YXRpb24gYW5kIGNsZWFudXAgb2Ygc3VwcG9ydGluZyByZXNvdXJjZXMgYXJlIGFsc28gc3RyZWFt
bGluZWQgdG8gYXZvaWQNCj4gcmVwZWF0ZWQgc2V0dXAgYW5kIHRlYXJkb3duIGR1cmluZyBleGVj
dXRpb24uDQo+IA0KPiBGaXhlczogNTQ2ODAzNTYwYTdhICgidGVzdHMva21zX3ZycjogZXh0ZW5k
IGxvYmYgdGVzdCBmb3Igc3VwcG9ydGVkDQo+IGNvbm5lY3RvcnMiKQ0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTmFsYWRhbGEgUmFtYW5haWR1IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIHRlc3RzL2ttc192cnIuYyB8IDI2ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Zyci5jIGIvdGVzdHMva21zX3Zyci5jIGluZGV4
IGY1MDBkN2E1OS4uNTY5MDAwZmVlDQo+IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9rbXNfdnJyLmMN
Cj4gKysrIGIvdGVzdHMva21zX3Zyci5jDQo+IEBAIC05MDMsNiArOTAzLDE2IEBAIHRlc3RfbG9i
ZihkYXRhX3QgKmRhdGEsIGlndF9jcnRjX3QgKmNydGMsIGlndF9vdXRwdXRfdA0KPiAqb3V0cHV0
LA0KPiAgCXByZXBhcmVfdGVzdChkYXRhLCBvdXRwdXQsIGNydGMpOw0KPiAgCWRhdGEtPmZsYWcg
fD0gZmxhZ3M7DQo+IA0KPiArCWlmIChmbGFncyAmIFRFU1RfTElOS19PRkYpIHsNCj4gKwkJaWYg
KCFpZ3RfaGFzX2xvYmZfZGVidWdmcyhkYXRhLT5kcm1fZmQsIG91dHB1dCkpDQo+ICsJCQlpZ3Rf
c2tpcCgiaTkxNV9lZHBfbG9iZl9zdGF0dXMgbm90IHByZXNlbnQgZm9yICVzXG4iLA0KPiArCQkJ
CSBpZ3Rfb3V0cHV0X25hbWUob3V0cHV0KSk7DQo+ICsNCj4gKwkJaWYgKHBzcl9zaW5rX3N1cHBv
cnQoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5kZWJ1Z2ZzX2ZkLA0KPiBQU1JfTU9ERV8xLCBOVUxMKSB8
fA0KPiArCQkgICAgcHNyX3Npbmtfc3VwcG9ydChkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNf
ZmQsDQo+IFBSX01PREUsIE5VTEwpKQ0KPiArCQkJcHNyX2Rpc2FibGUoZGF0YS0+ZHJtX2ZkLCBk
YXRhLT5kZWJ1Z2ZzX2ZkLCBOVUxMKTsNCj4gKwl9DQo+ICsNCg0KTEdUTS4NClJldmlld2VkLWJ5
OiBNb2hhbW1lZCBCaWxhbCA8bW9oYW1tZWQuYmlsYWxAaW50ZWwuY29tPiANCg0KPiAgCWlndF9p
bmZvKCJMT0JGIHRlc3QgZXhlY3V0aW9uIG9uICVzLCBQSVBFICVzIHdpdGggVlJSIHJhbmdlOiAo
JXUtJXUpDQo+IEh6XG4iLA0KPiAgCQkgb3V0cHV0LT5uYW1lLCBpZ3RfY3J0Y19uYW1lKGNydGMp
LCBkYXRhLT5yYW5nZS5taW4sDQo+ICAJCSBkYXRhLT5yYW5nZS5tYXgpOw0KPiBAQCAtOTk4LDcg
KzEwMDgsNiBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NsZWFudXAoZGF0YV90ICpkYXRhLCBpZ3RfY3J0
Y190DQo+ICpjcnRjLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gDQo+ICBzdGF0aWMgYm9vbCBv
dXRwdXRfY29uc3RyYWludChkYXRhX3QgKmRhdGEsIGlndF9vdXRwdXRfdCAqb3V0cHV0LCB1aW50
MzJfdA0KPiBmbGFncykgIHsNCj4gLQlkYXRhLT5kZWJ1Z2ZzX2ZkID0gaWd0X2RlYnVnZnNfZGly
KGRhdGEtPmRybV9mZCk7DQo+IA0KPiAgCWlmICgoZmxhZ3MgJiAoVEVTVF9TRUFNTEVTU19WUlIg
fCBURVNUX1NFQU1MRVNTX0RSUlMgfA0KPiBURVNUX0NNUlIpKSAmJg0KPiAgCSAgICBvdXRwdXQt
PmNvbmZpZy5jb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlICE9DQo+IERSTV9NT0RFX0NPTk5FQ1RP
Ul9lRFApIHsgQEAgLTEwMTIsMTggKzEwMjEsNiBAQCBzdGF0aWMgYm9vbA0KPiBvdXRwdXRfY29u
c3RyYWludChkYXRhX3QgKmRhdGEsIGlndF9vdXRwdXRfdCAqb3V0cHV0LCB1aW50MzJfdCBmbGFn
cw0KPiAgCQlyZXR1cm4gZmFsc2U7DQo+ICAJfQ0KPiANCj4gLQlpZiAoZmxhZ3MgJiBURVNUX0xJ
TktfT0ZGKSB7DQo+IC0JCWlmICghaWd0X2hhc19sb2JmX2RlYnVnZnMoZGF0YS0+ZHJtX2ZkLCBv
dXRwdXQpKSB7DQo+IC0JCQlpZ3RfaW5mbygiaTkxNV9lZHBfbG9iZl9zdGF0dXMgbm90IHByZXNl
bnQgZm9yICVzXG4iLA0KPiAtCQkJCSBpZ3Rfb3V0cHV0X25hbWUob3V0cHV0KSk7DQo+IC0JCQly
ZXR1cm4gZmFsc2U7DQo+IC0JCX0NCj4gLQ0KPiAtCQlpZiAocHNyX3Npbmtfc3VwcG9ydChkYXRh
LT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsDQo+IFBTUl9NT0RFXzEsIE5VTEwpIHx8DQo+IC0J
CSAgICBwc3Jfc2lua19zdXBwb3J0KGRhdGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwNCj4g
UFJfTU9ERSwgTlVMTCkpDQo+IC0JCQlwc3JfZGlzYWJsZShkYXRhLT5kcm1fZmQsIGRhdGEtPmRl
YnVnZnNfZmQsIE5VTEwpOw0KPiAtCX0NCj4gLQ0KPiAgCS8qIFJlc2V0IG91dHB1dCAqLw0KPiAg
CWlndF9kaXNwbGF5X3Jlc2V0KCZkYXRhLT5kaXNwbGF5KTsNCj4gDQo+IEBAIC0xMDU3LDcgKzEw
NTQsNiBAQCBzdGF0aWMgYm9vbCBvdXRwdXRfY29uc3RyYWludChkYXRhX3QgKmRhdGEsDQo+IGln
dF9vdXRwdXRfdCAqb3V0cHV0LCB1aW50MzJfdCBmbGFncw0KPiANCj4gIAlkYXRhLT5yYW5nZS5t
aW4gPSBkYXRhLT5zd2l0Y2hfbW9kZXNbTE9XX1JSX01PREVdLnZyZWZyZXNoOw0KPiANCj4gLQlj
bG9zZShkYXRhLT5kZWJ1Z2ZzX2ZkKTsNCj4gIAlyZXR1cm4gdHJ1ZTsNCj4gIH0NCj4gDQo+IEBA
IC0xMTY4LDYgKzExNjQsNyBAQCBpbnQgaWd0X21haW5fYXJncygiZHJzOiIsIGxvbmdfb3B0cywg
aGVscF9zdHIsDQo+IG9wdF9oYW5kbGVyLCAmZGF0YSkgIHsNCj4gIAlpZ3RfZml4dHVyZSgpIHsN
Cj4gIAkJZGF0YS5kcm1fZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9BTlkpOw0K
PiArCQlkYXRhLmRlYnVnZnNfZmQgPSBpZ3RfZGVidWdmc19kaXIoZGF0YS5kcm1fZmQpOw0KPiAN
Cj4gIAkJa21zdGVzdF9zZXRfdnRfZ3JhcGhpY3NfbW9kZSgpOw0KPiANCj4gQEAgLTEyNDMsNiAr
MTI0MCw3IEBAIGludCBpZ3RfbWFpbl9hcmdzKCJkcnM6IiwgbG9uZ19vcHRzLCBoZWxwX3N0ciwN
Cj4gb3B0X2hhbmRsZXIsICZkYXRhKQ0KPiAgCX0NCj4gDQo+ICAJaWd0X2ZpeHR1cmUoKSB7DQo+
ICsJCWNsb3NlKGRhdGEuZGVidWdmc19mZCk7DQo+ICAJCWlndF9kaXNwbGF5X2ZpbmkoJmRhdGEu
ZGlzcGxheSk7DQo+ICAJCWRybV9jbG9zZV9kcml2ZXIoZGF0YS5kcm1fZmQpOw0KPiAgCX0NCj4g
LS0NCj4gMi40My4wDQoNCg==

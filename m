Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B12CD1297
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 06:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607AC10F20A;
	Thu, 30 Apr 2026 06:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3ylmEKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320E810F20A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 06:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777529717; x=1809065717;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RxQAtOnDgOMwHAYr7P+zW3jBFrwRoPmRzCu/eWmM2Os=;
 b=L3ylmEKY4g6wMtQhRg/w1rRIKFXFnnhCpuByevNjMbv8CgNu+ERiSU8G
 jSoEyqEgbqK03vzRLqQUpCOeu0qMQ3m1NfSL3oFWh4dAwjf/llAe+WzqI
 iR1J3oL0pLYPAoaXR9YyaJF0QXpAxkF+9MN1YxDMz5gFmt40CNCpc3mGd
 Zjcet+f/REj+Ue2HTaaTJ6HVgH3JazW7ItATuslCOCVpUn7MLOvtbqnel
 IevcoqNPko79fbgnziWwz0X7BdF/JoaHDboaDIv+CSRB+TGL33rTrfRGx
 z7nuDSmM0gVSkGHmTZPutJdK2NCQYfPkCdOJlfdWa7BpxcZAF6g5qF145 w==;
X-CSE-ConnectionGUID: kZmlfdWWTRqJp5EZ/g9GhA==
X-CSE-MsgGUID: mPnc20g9SdWkdhIBs0GPpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78525150"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78525150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 23:15:16 -0700
X-CSE-ConnectionGUID: 2mBjHX/6StSTCXPjiH8O8w==
X-CSE-MsgGUID: a9MxGTA+TPSClF/rruClPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="239508355"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 23:15:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 23:15:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 23:15:16 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 23:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYyPpizgmtxmgQO5IRfOujQ5h9f/CMHAZBTklnl6+dDJu1V71S+MKVhGlHYxORiKLrrUTX2QKCMfEI1oIOUfGdGNJDTSmhzsQsvm7QvT4RzrgzGeF+g81Z00BP4UWPtlGo+Cotar6qbyFn1Eq/fszieXi4ipaxk9xuiTDmChKCAKEuH02yzb8fVlzRcEhT4eUPRW1mKrjIDfDZIbt/d0ccIXzMajf/QGLxms767tgFZZMiGoXVQnf+VSF9G2k7qM9kpCM1pzjFF2l4HASWLe+IiVzXLZPQ3VfBmdaMPKu9LmiwP02J7B38RGM6AjvNmXZbNQ4ZREL+JRIDpf7Rl0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxQAtOnDgOMwHAYr7P+zW3jBFrwRoPmRzCu/eWmM2Os=;
 b=JsdRnNViebRl3pkhk/WyJi0m8eXZZ6pGTRLE5ugKcGLT4MWgAaaptCYToOez/qF1Jh4DOVGKH55nYyk+NV4/Ln6HU7AgrLfM0M77AMFauARrMrLGpB9FTJZdDhRWbq68nVSDfYsOPipv9tzFSQyBX0VFVNrAukv4BakbvPLuKW92sf/1Oquf7rVnqqL0c2Na7EHdFC1gdCJ4kCn+2A2+F5AhSQyngb9lbrMFrkaVpUczsvV33YZ328DEdRVXgYeHbIvphcaZDw+KKYR5pDcGl1x9skKmXh6p81V0HQJtp7ZJGB1XcZBhx2UudN9ojz+RxNVHGDzBioU2fAuhAHOTkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5863.namprd11.prod.outlook.com (2603:10b6:510:135::11)
 by MW6PR11MB8309.namprd11.prod.outlook.com (2603:10b6:303:24c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Thu, 30 Apr
 2026 06:15:12 +0000
Received: from PH7PR11MB5863.namprd11.prod.outlook.com
 ([fe80::de6b:62df:5aca:9225]) by PH7PR11MB5863.namprd11.prod.outlook.com
 ([fe80::de6b:62df:5aca:9225%5]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 06:15:12 +0000
From: "Balasubramanyam, Smitha" <smitha.balasubramanyam@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests\intel\xe_configfs: Fix ctx_restore BB path for post
 and mid variants
Thread-Topic: [PATCH] tests\intel\xe_configfs: Fix ctx_restore BB path for
 post and mid variants
Thread-Index: AQHc1vyQXe88MpvqZ0aoqDPu80VtLbX0bXkAgAK1tFA=
Date: Thu, 30 Apr 2026 06:15:12 +0000
Message-ID: <PH7PR11MB5863255EF8213313D1DFBC3885352@PH7PR11MB5863.namprd11.prod.outlook.com>
References: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
 <20260428125126.erq2qxcfrfv5x6db@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260428125126.erq2qxcfrfv5x6db@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5863:EE_|MW6PR11MB8309:EE_
x-ms-office365-filtering-correlation-id: 9e2d9e43-6187-4586-325d-08dea67fd69e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info: 6T1waXpmbTPT98Os4WtY859MrfWR2S9HaUNu1Is5q3FE/SEUHn5EFHQMwQgnHAWaWuAyiRuu8XxhJDI6yQ0rh2NN1230BlURI7gfziTgsdOjRgK1vDCQojcsey4LI+UO9TNLUEHcKSfjlXTRngRIS4K0a3/xSrvgWHP8ONI78DKKxymITnC/viULVBnulmjZZo/TApcpxBpTpN9sdDIeZ/P+BiCRV2FXu34edDplThMyvcDR0nlWVmUECj/Lhk67x0zYWWCX7H7QlOErCMmSjvwrGV7yogtj8BcrO0JuOu13T9F2rwJ+lvJ5lTWFIRE33biif37yl5Q6hj4eJnyuUxpABjxPbFdGrPtcgk6s2/eENf8kgGXXlILpvF3lDaY+FvnHy8jNk60X+yAxEL3zQySuIsdeoAcE+Y+j4pGnzSAAIQai6i+OrsoHhL+X7urOhtMw8e7o0NWhFPREkDZI1M0rrINeiBDnwQ54sSdHAkn0wijukB2eRLTYYzhZVpsKKmeg8wyC6300I3tdhTKQNNuA3mOXKY/9uOm0r7mhZkjx6odD/7331Izjk7CImZyJVgoT1uIXtTnunyjkLy7VQbiEoOOkLuxARzU/BlaEhL3a7N++bPXJ8uIUN/XGBqm9uVRCezHnYeMsqFZTR5srCpLBCTzopFLvGfLGQ8UM097gLwAyZqzqmO0tPjJoFskK/ruEO8/hVSxCb+t4qfg3DkHvE/O4pPUDgw5bS3HhayaQfctO9ZcIsVR1djM1PV8RKtUStXcmrqWwwOQW9GWNnfz+iJuv7bxe+lEr93XlcYg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5863.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(38070700021)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUpCbDNpSDFlNE1tRGJqN2N2QXVYRkNBai96MXNYNElSZzFyWFdiUjNLb0dN?=
 =?utf-8?B?Y1NmU0lMeS9jOVhkSktmRHBNaWZhWnpVQWVWTTl4a1ljSEdqdXFRK2xURFhW?=
 =?utf-8?B?V29aTGhCUnpnb0hybStoYzN5c0tNWHVsQkhXQXFvK1B1N213cERjc0JmZWxN?=
 =?utf-8?B?R1NrSTVzdEtBOU5BOTZDYkxWazdtTUJSRmw5Q0pTUGpOdm11WExONjAvMER5?=
 =?utf-8?B?bk5XWVZyTkpjUFQ3bGxEbVhubldDRGF4V0FqSzV0bm5URU55c3BOakdiUGJE?=
 =?utf-8?B?Yk1DZ1crQ0hZR0I0MFlCVzllUG5CdHMvRFpPcHJZeVpjdmtZdElCN0o2dGpU?=
 =?utf-8?B?Uno4ZWc3djRsLzl0aGE1V2thVnc1RUlFZCttWlJjTFViTXBETmhVNGp1aVdC?=
 =?utf-8?B?ckRFNzVhR1VHN3JFR3AzTTB0QU9XalBIRlI4Nm1SeWFJdkpLYmVQZW1MdzNY?=
 =?utf-8?B?OGFNcHRXY1dwU3Rid1dwYjIxcFNPVWZxUmt4aFFJTGtiY3plaUxtM3JCd3lP?=
 =?utf-8?B?enROckV4UUhpSXQxVXpWSGZsbnVXWjVLMjNmSWJGdXY0RU9SUWVtZkVobytX?=
 =?utf-8?B?YUdxeCtTREJXNGhTNWpFSGRUVVdDVENSdEx2QVNES01IQktySHU1dU5XM0xM?=
 =?utf-8?B?R3JBajNDMkFWYWd2ajZkckJvc2Z0WlhoT0ltR25tY09HOGdnenJVV0k1bmpP?=
 =?utf-8?B?YkF6U2JkYjYveldLL1dYRERibU90TGlvOTZ5aDc5TUI2RmpPbUpheE05Zmtu?=
 =?utf-8?B?TlZFYWd2N0RLSXowUlZBdG5BcGFQT0dIYkdldFY4UEpGb21nRkRWRWVJQjM5?=
 =?utf-8?B?d0dicWJ3aXhQMHdhWU05cFBTWlNpWVFPVEpuN1plUU5UOU9OWFdTMDEvd1kw?=
 =?utf-8?B?YTltd0lwT244YlhWd2w5VVV1TW9zbkRiSC92UVdvaTBpTWpMbC9YdDQ2SXJC?=
 =?utf-8?B?YjZYdno1SEMwZWJpcjl5a3VRZmJwSXRmRkFLNXR4ZldkaTNQUWFaQnFwOG5D?=
 =?utf-8?B?NXVDR1Rla2dHSDQ0TWhXb0p3WHZIRi9OTkxkQjVjZk0raHhuQW5DcjQxMThP?=
 =?utf-8?B?QXFIUzJlT3lsVUtDVGE0RkVqQ0JHTlNNNTBvUWJhOGd0UU5adnhBUEJlVkZR?=
 =?utf-8?B?eHp6SVRXdDlLYkEvbUZudmxEd0hnUlEwUWluOWJKMWh5a0pMRmY2VnpUcGd4?=
 =?utf-8?B?VG9sUHdYTFFDWFNqZzhNcnBvS2hzVTB6Wm9RNjVsYjhYZ1ZXOVgxcUVWR2NQ?=
 =?utf-8?B?QXBvV3AvVzBMZFZUK1dka2ZMVGR0NEEyekVDZUYyR3lzU1o0Q3hwc09nUmpt?=
 =?utf-8?B?dzJuYVcyVnVPQ3BLY055TitRVUZYMlhIeVVyTjQwbkJ4clFkZ3ZGMFpydDNH?=
 =?utf-8?B?ejA1RStuekRMajhXUGFNcmlJWU83dFhPdEVqSU9WU0ZyK3dLdWZsdThGK21R?=
 =?utf-8?B?NWlOa2NrRVhhYUNtZzRHY2Q2Yzl6Y2YzUExkNDRQQktaaW82OForR3M1d200?=
 =?utf-8?B?cTlsdWQ2V3dBbG1VUEkwTWZuY0xtU1lmbGprcUhwQTloaGwzdFhWMW9lcW80?=
 =?utf-8?B?eHJqbUh1U2ZTYkRMOXV1SUtITG1kTGNXb1QydEs4V01uY1owcDdxakNzcGVG?=
 =?utf-8?B?QWJtR1doRWN3a0NxR1AybkFXY0p3RWNYMkg3NzBXTzNwejl5SlJSbjlibk5a?=
 =?utf-8?B?Wmx3L1YzSlRvN3FHVHJwaE5wWk5ZTzNtY0JpSk5WdnZpNHhHa3lPRVkrZTF4?=
 =?utf-8?B?Y0xmSVBuR0ViRGJjMWhGV1lBcVZUZzZnVHRPcjN2d2VkWmFnMWIxZUZlRThN?=
 =?utf-8?B?czdJYldiN1I1cW9Ic1E3bjZaRDJEcjFweTB6ZTJpUGNEK0QrWUxKdTA1UEFi?=
 =?utf-8?B?S3RNQjVodFFLUkp5QVk2QSttbW5DTXYrVEN0bS8wUGFSZklYVzkyTHNLd1hM?=
 =?utf-8?B?RXAxY0doaUNIWHgvMyttNzlkWGtraHNTcFlsaStHa1h4SlRRRzVSbzZkRldk?=
 =?utf-8?B?NEFyWXFSdlZvRWhIRmRmZHhHdjQvMWQrc1UyL0dUSjN3MXJzQVpWUW1FSVha?=
 =?utf-8?B?R3NraEhReWpNRVcvU1dXU3ZteVhBM0ZZdE1pMlBQNkZObUc3VVczMTl6Smlj?=
 =?utf-8?B?NXkxMkkwcnMra3pDeS9VSFpMNldEM1U4L0xMckZOR2NiYThEblJNclQrZ203?=
 =?utf-8?B?R2tWNGZjOU8rRjBmNHVPcVFoejY2NFVGc1ZTeFRqQ3FlYmpiMEVBU1JIR25S?=
 =?utf-8?B?TGU4UlNkWWxSemFoVlJLMUJjOEQydVNOSjlMYzhqZ0duTTlSejJzQ0VOL3BQ?=
 =?utf-8?B?Z3pHeVhNYnF4cFNzZTVqUzJMeFB3TzRsMm5BT210MWlkTVRYTUZPWEUrTUU3?=
 =?utf-8?Q?mQWWFpfHsrv8xQ8s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IhfLu5IGQKv1E5A6jnb2Vz0iXbfaANd5zRcjG5rLI7saZ88bWF/NnFT9oQ1RqRUNrPgPjWYQA1bSGy+SqGeFdbx1FQn6dJzZpPbBD7w5YN6B9A8iMMB0cMNUJGNFA78Gy6ADR80KXt7YALWk8NXTDNth57pI0pY/RH0usxMbZgTvlh6G/JrwwI71jkGMqCQJ0abTlUExRb+qok6xKfGbzCampxdfcCXmsvAh+NVjk/JKLQtiKxXY4D8SeKjkXKLpUNeodoA5xY0bLO4G//fN6P6s1ac0fUN1PXuupdDRIPaTMP2hihpk+xpTpnIoePXtMpO9KWO4/eOX3G/4v7UIig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5863.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2d9e43-6187-4586-325d-08dea67fd69e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 06:15:12.4591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A0HkBQvKzsph4sVbvayu0mqVNbhfzvd3usO7hUMTz0m1K6scNrSxv06qcrki9l3FGOeJwGTHRYQSWSwdZPWqd62pxLJXASaszj8vsY7auTd467BhXnfO84MCGRnMbN7z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8309
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

SGkgS2FtaWwsIA0KDQpUaGFua3MgZm9yIHRoZSBuaXQsIEkgaGF2ZSBub3cgc2VudCB0aGUgcGF0
Y2ggd2l0aCB0aGUgc2VwYXJhdG9yIHVwZGF0ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiANCg0K
UmVnYXJkcywNClNtaXRoYQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2Ft
aWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPiANClNlbnQ6IFR1
ZXNkYXksIEFwcmlsIDI4LCAyMDI2IDY6MjEgUE0NClRvOiBCYWxhc3VicmFtYW55YW0sIFNtaXRo
YSA8c21pdGhhLmJhbGFzdWJyYW1hbnlhbUBpbnRlbC5jb20+DQpDYzogaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRlc3RzXGludGVsXHhlX2NvbmZp
Z2ZzOiBGaXggY3R4X3Jlc3RvcmUgQkIgcGF0aCBmb3IgcG9zdCBhbmQgbWlkIHZhcmlhbnRzDQoN
CkhpIFNtaXRoYSwNCk9uIDIwMjYtMDQtMjggYXQgMTY6MjE6MDkgKzA1MzAsIFNtaXRoYSBCYWxh
c3VicmFtYW55YW0gd3JvdGU6DQoNCm9uZSBuaXQgaW4gc3ViamVjdCwgcGxlYXNlIHVzZSAnLycg
YXMgcGF0aCBzZXBhcmF0b3IsIG5vdCAnXCcsDQoNCnNvIGluc3RlYWQgb2Y6DQpbUEFUQ0hdIHRl
c3RzXGludGVsXHhlX2NvbmZpZ2ZzOiBGaXggY3R4X3Jlc3RvcmUgQkIgcGF0aA0KDQppdCBzaG91
bGQgYmUNCltQQVRDSF0gdGVzdHMvaW50ZWwveGVfY29uZmlnZnM6IEZpeCBjdHhfcmVzdG9yZSBC
QiBwYXRoDQoNClBsZWFzZSBzZW5kIHdpdGggY29ycmVjdCBzdWJqZWN0LCB3aXRoIHRoYXQgZml4
ZWQNClJldmlld2VkLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5p
bnRlbC5jb20+DQoNClJlZ2FyZHMsDQpLYW1pbA0KDQo+IEZpeGVkIHRoZSBoYXJkY29kZWQgImN0
eF9yZXN0b3JlX3Bvc3RfYmIiIHdyaXRlIHdpdGggdGhlIGNvbXB1dGVkIGZpbGUgDQo+IG5hbWUg
KCJjdHhfcmVzdG9yZV8lc19iYiIpIGluIHRlc3RfY3R4X3Jlc3RvcmVfaW52YWxpZCBzbyB0aGUg
DQo+IGludmFsaWQtY2FzZSB0ZXN0cyB3b3JrIGZvciBib3RoICJwb3N0IiBhbmQgIm1pZCIgdmFy
aWFudHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTbWl0aGEgQmFsYXN1YnJhbWFueWFtIA0KPiA8
c21pdGhhLmJhbGFzdWJyYW1hbnlhbUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwv
eGVfY29uZmlnZnMuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2NvbmZpZ2Zz
LmMgYi90ZXN0cy9pbnRlbC94ZV9jb25maWdmcy5jIA0KPiBpbmRleCBmMDI0MjM1ZjIuLjM5NzYy
ZTAzMCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfY29uZmlnZnMuYw0KPiArKysgYi90
ZXN0cy9pbnRlbC94ZV9jb25maWdmcy5jDQo+IEBAIC0yMzQsNyArMjM0LDcgQEAgc3RhdGljIHZv
aWQgdGVzdF9jdHhfcmVzdG9yZV9pbnZhbGlkKGludCBjb25maWdmc19kZXZpY2VfZmQsIGNvbnN0
IGNoYXIgKnR5cGUpDQo+ICAJY2hhciBmaWxlWzY0XSA9IHsgfTsNCj4gIA0KPiAgCXNucHJpbnRm
KGZpbGUsIHNpemVvZihmaWxlKSwgImN0eF9yZXN0b3JlXyVzX2JiIiwgdHlwZSk7DQo+IC0JaWd0
X3N5c2ZzX3NldChjb25maWdmc19kZXZpY2VfZmQsICJjdHhfcmVzdG9yZV9wb3N0X2JiIiwgIiIp
Ow0KPiArCWlndF9zeXNmc19zZXQoY29uZmlnZnNfZGV2aWNlX2ZkLCBmaWxlLCAiIik7DQo+ICAN
Cj4gIAkvKg0KPiAgCSAqIFRoZXNlIG9ubHkgdGVzdCBpZiBjb21tYW5kIHBhcnNpbmcgaXMgY29y
cmVjdCwNCj4gLS0NCj4gMi40My4wDQo+IA0K

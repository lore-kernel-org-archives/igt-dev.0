Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EB9CF649E
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 11:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60BA10E2E3;
	Mon, 30 Sep 2024 11:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNG7rWRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9947210E2E3
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 11:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727694055; x=1759230055;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=E6Jixn/DKdQx04utoEp7LCwa02sbT11eiijmlCzNJ60=;
 b=gNG7rWRWjUvQTI8A1YH+S6wRaCfhWFiQZAQp4Sw4Ja8SFgg7ezP8T7Wk
 nzrQHl/E7A2m1OgS9DQpF6aSeXh/wMW4RIKq+fQRj8Lk4asisNNp4InJf
 SsU8+0Ev7IRwAWM0o+EnID8P2WiuxpmA0RvC19DRqAW+ZhCLx7iZMydW3
 NKME2H9KoGfA4MQiqLssOOnu/YLj3nEBGYRLdzYHw0t904FD+93HblRji
 +2wMz1qCJktQCJQWT/XiauEmxIbbbtL1lwCKhZNtiFh3Dqt2syUGcOwyj
 JIT49bLmye0fiKWmRl9b1RuGy07S3W0fzVOsR92a4hgNgOQdl//QlTBft g==;
X-CSE-ConnectionGUID: lzUq0I2WR8qqOIE3Bs79eQ==
X-CSE-MsgGUID: ueOVIpWgRNCuvysEezYLqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44237545"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="44237545"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 04:00:54 -0700
X-CSE-ConnectionGUID: /1SxXCPlT/CHiYXqpPf0Bg==
X-CSE-MsgGUID: wdmRjgp+Q0KDg9RoqR0CyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="72865676"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 04:00:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 04:00:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 04:00:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 04:00:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 04:00:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/ltMPy/xLcD1l4YdBzDKnzF/kUe7nSn2K7JKgiH3TtxNRS8uQmIxNj0b6ULiiXkcokL3qmFTN4tsHG2dY1AHV2wlum0GH83H9tkIIeDVOphVPpo6FlvfeGhA6yMFeG+sUhgsaab/JEA38q2LOoLwoC6BmVQBCvTjCK4AOMElF5kGCwCbz5XouCujeZYY7NFOLMVgHMvRRcvRL0FzPXEcc57iiaSbWuWBh1NljbaFKYk1adzmkz9UaEwLvVmzQop7aLeVM/loYyoIQC4NRMswRWGe8DjO6ebaeH1MHJiLISbZf7XW2lgDlTygIyKGFI75J/EXIL+iLymbiKgnltIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6Jixn/DKdQx04utoEp7LCwa02sbT11eiijmlCzNJ60=;
 b=mm2w2TAd/gGGBGqUNPv+272N+TSD0RvBWnnhuf/Viycy2/CjHdJCd/dvyjK38/yVvBOTf7huPh/pmq02o+tps3rwlAHadf7YA0q2J3o7VGkAFcQCMAWQ3fB9gXDOph23t2qnRFy/FoU+qUnOpP3iUMcsup4shUbJfMcyZpDBszLh4ZiZkzdL/+qitqaysRZX/ckmpFQSD7yR8Opc1KEZpQLFJrl8f95A63p/qziEhzK2rdBfo/pnqr3GClgexI2mIH7pA6ZclZ/jf9Hi4wey5Ofzdx1Al9/XAXXLGtP0t8i0BmXIi+8pv7RP3qL/NpIzrfHjXofHqkXv9ONfIjKhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by CO1PR11MB5188.namprd11.prod.outlook.com (2603:10b6:303:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 11:00:50 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%4]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 11:00:49 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Topic: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Index: AQHbEJWdtUf/oiINe0inMP8l+u4PDLJvp1SAgAAgT4CAAGbwsA==
Date: Mon, 30 Sep 2024 11:00:49 +0000
Message-ID: <BL3PR11MB5747025D5B45A7DD3AB62ABCD0762@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240927043544.1782340-1-sai.gowtham.ch@intel.com>
 <CH3PR11MB8434CF8AEE478D5ABA2C47B08D762@CH3PR11MB8434.namprd11.prod.outlook.com>
 <CH3PR11MB8434A98E8717DEBF332EE9328D762@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434A98E8717DEBF332EE9328D762@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|CO1PR11MB5188:EE_
x-ms-office365-filtering-correlation-id: c5193568-d7d7-4351-8218-08dce13f24d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z2E0WkdWLzF6bG9EMUtwZmpsUWVPekhHV1MzZ3hRVVZCQ1F1aTF2K29OLzdC?=
 =?utf-8?B?SW1JZmU3TCtpc1NCR1hIWWc2Qk1Jb0d2dUlhUW9QbDNJOEpHTVdTNlFkcXNY?=
 =?utf-8?B?cWlueE1mT3h3WitPRTVNUHJjTUtJTDBkSXFZRGtHQ3RVTXgyUXFHNWN2bmty?=
 =?utf-8?B?OG93cGFSYjI2cHEreFJLS1VLYXZTVFBqeTkwRUp4K01EOFNYWGhPTFhGc1U4?=
 =?utf-8?B?TDZhWUhoRDVTckwxRTBXaG5KMmd6ZFE0K0tNMzRyNHhrZ2lxa0dheDUwbnVx?=
 =?utf-8?B?MHdBTHNTcHJkd0ZzMlM4ZVRkQmo4OEk0ODNjMDJnVm5pcDA1L3NlTU1ZUjI3?=
 =?utf-8?B?TmZYU3JBcFBjT1BuUXgxQTJ3bUpOS1dJUm80NHlGemZCRWF0cElXeUdSWTZZ?=
 =?utf-8?B?VWp1SjBkZG0zMGVGVTJTUExmSFlyUlltclFPQndydkFuL1hLM0ZjYzE5cW1r?=
 =?utf-8?B?dW5lVzdUQVZFS09aM0Q4NEUrZzdIdGNWTUNZRnBrRGVxNS8xM3VKQ0loR0dV?=
 =?utf-8?B?Y2F4bzdSTlRJRERrWmQxYWNCQ0dmTTdiaVBpNjB0R0xSWXNpR1h4Nm9BeGN5?=
 =?utf-8?B?dCs4Q2dkZGcwWjlVNVBnZU5jei9mblNIQUlJSlUweS93QmR5cDFSNzBZSE0z?=
 =?utf-8?B?NUJRWEp3b2Nhd1llc2VSYWo2eTFIZ0lFOS9FMTdhdXJiazBxSHR6aUw2YmRk?=
 =?utf-8?B?OTU3TmEvT2ZDcXJOS2hoUnFmRUtCOTBqUG0wQlNuVzVoWHRWWWIxc0ZoMnlF?=
 =?utf-8?B?VmcxbDZKbktRTlc2Y2V3ODJQeW00VjYvUGY2aEhUTnFhMkVMdCs2WnQ3Q1Z3?=
 =?utf-8?B?bWQ2QTV1SXVHenhzUHp2dnl4bGlpenhYQ2psT3JYOC9neHFsSTRLb0g1TWRz?=
 =?utf-8?B?WFoxa0JDUVA2RG8ybG0zemhaU1ZtN2w2TkFKT2RzdHZMaU1xYThtSFh4RXo5?=
 =?utf-8?B?VGVaRTBmdnFoVW5lTy9COGJPd1RQWi82MURSNFV0ZzRldk9pYmh1aHlwRENK?=
 =?utf-8?B?S2V1a1V6TXNMS053Vm1kYXF2dHRmOURIaU1xSU9oK1BBZEo5cVpYdi9hcUFY?=
 =?utf-8?B?aVh3alhjQlBVYlMrczNZWHJDaDdsMEVjWjRpT3JKSjVQUlArWDFiZEJwVEdo?=
 =?utf-8?B?TUlDUVZkcXJyTmdNZmFZSGJHdHpiV1RKSDdtY1hPcE1wMnI0OUk1M2k3RU5m?=
 =?utf-8?B?TjJMSkhVSGpEOHFrMnRBVXEvVGtLZFJNUStZa1Q4anVEa2I2ZHVnSVpaU3l0?=
 =?utf-8?B?cWh2ZE0rM0FNN20yQml4WVNWc0c4eXZrdDJLUUxvSFltUTZ6eFFoSmRjTzVP?=
 =?utf-8?B?d0t1VTYrdUIyNXVDOFhKMTU3V1liUmxsRVROWG8ycUpxcjFvaTdDbE1Bc0sx?=
 =?utf-8?B?bGV5aWJCSW5OdkhyN3E2bmJZOTVzSjhFemhjbHZ1MnB3TG9kNHZYRmZaT1ZH?=
 =?utf-8?B?a0FYNVluQzFXT0E3SU04M0dCM2NWUTU4TUgrVkV5RHYrcWVJcDVCaWtDRlF4?=
 =?utf-8?B?WUwrNnk0RlIwKytkTy9UZ0ZtZG9lcmZlTi9Hamw2QzlYS3JSUWpxdFlHMDNH?=
 =?utf-8?B?SFAvRWdtMG84Nm1XNlZNLzhDSk5vMk1EZXYvc0hXenBUOGk3dDF0VmRjdXRn?=
 =?utf-8?B?RFhTNEREeUZXbmpKbi9sMHFzMGVqeXBHUngvVk5sZnpFNXFFa3VETlBNaS9y?=
 =?utf-8?B?MVJ6Mit2em84dEZRSFZ5YllJL3lKV0pOcTFPSGY4MWtzZ0NqcnhUWmduYUNQ?=
 =?utf-8?B?UXd0Yyt1bG1kSkZqOTNHWHRpcG5wMmVjRUwwZ3VFNWovbmhQRGt1THlaV3Z0?=
 =?utf-8?B?YW5hZFUyanNpNkc3M3NPdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUMwcXRVdEdwQjd0emhxL2p5UWlwUkNIankyUU84ektYUTVSY0NGWTYwTHls?=
 =?utf-8?B?WDFIUVY4VThJZnVlUWJoNm01TitVZWpyMEdzN3BkeURQMzJpWDhvd2d4R0lY?=
 =?utf-8?B?R2ZYUVRqcFBDbzNHZFhQVnNtUm9mb0VSMlhyYnp6eXc4TlRsUFVLL1Q4cTU3?=
 =?utf-8?B?STc5UElSNDU3dWE4bUFmbU9PTVB1L3pCZVJyTzVjd2RiSjFTS1ZZNTNnTzF3?=
 =?utf-8?B?Rzhkb0pDdEV2ell1SHIzNEh4NVd2cmZid1BtU0pkSTJiei90ZTJaTUpENXVD?=
 =?utf-8?B?ZWErZ05CTEp3aHJpcW9sVTQ4MjI2VGdSck9VOVcwdWtRMDdaZU9scWl5bXVu?=
 =?utf-8?B?azVxTFJKemduY2NyUXJrQkJHZ2JNSk1QajM5L1hady8rS3g3V3U0V2lSRkF3?=
 =?utf-8?B?RkhneTlqTURoZDN5eFN2R1NmOHUrY1VGRk9FYzhEZWlyUUtFSmFmNlNwYmpV?=
 =?utf-8?B?RnNNQy9FOHBEYWxqTnk3UDQ5ZEpwclRYakdPYjcvSzVkYmJ2QmFDNEtzelor?=
 =?utf-8?B?MEd1UEVsTVJxMmd3TEhRS3R0WW1LYm55VW5vRkZFQklMSkNKZ2NOcWN2UjNB?=
 =?utf-8?B?eDlTVG5HZ3VCcjgxY1BadmlXNkx3RU5WUS9xWXo1R080WGE2ZE5ud0RGY2Vq?=
 =?utf-8?B?d0xkNDdONVZRVXlzWDFJWjQ3UFA5SXd2KzVGMVJlZytqdVhxSmRLSGtDdVZx?=
 =?utf-8?B?aFhncUppY0V0N1lRbE9RNnExbUphNkUrbEg2UFVQVWNiSXYyYmhrS3kveVJa?=
 =?utf-8?B?VktUZUFha2VxYTZDRkQ1UmRJV0pUWWZCaGk1dmNrN2NrS3ovUENQeWN3Y05o?=
 =?utf-8?B?RVpGeCszbTRJWVhwRVpFSjZQdnBQY3JnTUszNkxxM3BOb2huTlZEeDVCY1cz?=
 =?utf-8?B?TCt5ZHdXMFpDOGs4UUpDdzlzcjVCMmwzRWZZZjJFYVl5aTBZN2dKRnFNdlhX?=
 =?utf-8?B?cFZqdGdGUGtBbkJoNWZUc1V5VUZZTFo3V2lZbmVZWmdTRnc1R0lySkhpUTFZ?=
 =?utf-8?B?Z3JoN2dxU3k5RVp0b2Q3WEJtbEFaMEdXcUpDcnhieXVTM1g2b3BsQ0pUVzFF?=
 =?utf-8?B?UDZCY1dmaUVQdE82OTJjZmM5Wkg2STdsdmI3NkZERDMyblAyQzB4czZjK29G?=
 =?utf-8?B?Zlc1VTMyU1JYeW5Ia1ZOY1hNR29JL2tNeEM2MHF4cWVnN0c1RFV0YStjSXc5?=
 =?utf-8?B?bDE0ajZORlJEZXNNL0JnZUo1Uld3N1Y5YUJWWDVFYk9TVHJabUZ1Z2J2dXA5?=
 =?utf-8?B?aFcrOEZLdjR6dWdLNE1vbHZvRWppUHJaaWhoSFlNYnlZZ3NFWkdIYVI4V3NO?=
 =?utf-8?B?dFRuOU5kMTh1Z2k5KzYxZFVvclBpWWNMcDV6dFc4ZXZOeVprZWMxbjc1WEkz?=
 =?utf-8?B?SkdrRXI0cmZnMjUxdDB4SGtjZjF5SGd0dGFUVlcrVDZPWmRBeC9YZ29nLzZX?=
 =?utf-8?B?bHF2M2paenc3aWNIK0dDRURWdlpac0QwdEVZeHVFOUw5MUt0RzBxRnordXF0?=
 =?utf-8?B?S0dpbXV1WUhqcUlFUjUxc2k5Qzg2U3cra3JXdW9ScVFRRTM2RTNWV0VlN1VO?=
 =?utf-8?B?ejFOVThUSndYUW1DZWR5bTg2eFRGZ1N6TzlDdWZYRW9kRVM5dVhxMURjYkVI?=
 =?utf-8?B?cmg1WlA0TGNoNkh6YnZsMmxRR2lHcDByU0RVL05aSFc0NVM4WFhUbnIvYVBF?=
 =?utf-8?B?SC85SHBWODMxQ0p3WlBuNTNyMjBIbFJicTloeUpudHcwa291R0NyZWhqaWd6?=
 =?utf-8?B?bllHZXBZenJFSlhZR3hja3lWajFxeXhjTkdJblpuTmFQejRsT2ZNa0xjVW1q?=
 =?utf-8?B?Nzd0WlVhYndYZVF3ZzduN2hoeFZYSWUxZU5nT0l5bXNjQTdiSExOeGlaS0xD?=
 =?utf-8?B?OXVZeE5NcFlIUzl6c0NpTjhMVEFBUUcwdUVtbFN4ekQrZC9YNW03VzgwTTU1?=
 =?utf-8?B?M1BJK1Q1S2s1eERBeEpkcGM0aEpxWlArQnJ4azk0UllSdVZ1WW1objRrK25I?=
 =?utf-8?B?d2NLOG5uc09QM0VwaDBSR0ppMEdVYm1qR29SNFVxSXFOY3FXZ1VZTm5VWnRC?=
 =?utf-8?B?bmxUWXJVM0ZGaFJxOGt1RXJTRm9UNFB6d0VTOUo5UnFIOU5RRzRSWUI4OWY1?=
 =?utf-8?Q?p5i+cfQPKsehG7D8HGDbjC+of?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5193568-d7d7-4351-8218-08dce13f24d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 11:00:49.6180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S2PfqB9xfKonaY4OTGelCeeUUctlKplKIP5izsxeWYbW5DFCRVQx+NQU0cgcsQ89he5d6SPs7WTqJyvTmk5eVlPjhq00wYZExErTXRoPlPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5188
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IERhbmRhbXVkaSwgUHJpeWFu
a2EgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+U2VudDogTW9uZGF5LCBTZXB0ZW1i
ZXIgMzAsIDIwMjQgMTA6MjEgQU0NCj5UbzogRGFuZGFtdWRpLCBQcml5YW5rYSA8cHJpeWFua2Eu
ZGFuZGFtdWRpQGludGVsLmNvbT47IENoLCBTYWkgR293dGhhbQ0KPjxzYWkuZ293dGhhbS5jaEBp
bnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGFzLCBOaXJtb3kNCj48
bmlybW95LmRhc0BpbnRlbC5jb20+OyBDaCwgU2FpIEdvd3RoYW0gPHNhaS5nb3d0aGFtLmNoQGlu
dGVsLmNvbT4NCj5TdWJqZWN0OiBSRTogW1BBVENIXSB0ZXN0cy9pbnRlbC94ZV90bGI6IEFkZCB0
ZXN0IHRvIGNoZWNrIFRMQiBpbnZhbGlkYXRpb24NCj4NCj4NCj4NCj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4+IERhbmRhbXVkaSwgUHJpeWFua2ENCj4+IFNl
bnQ6IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAyMDI0IDg6MjYgQU0NCj4+IFRvOiBDaCwgU2FpIEdv
d3RoYW0gPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT47IGlndC0NCj4+IGRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IERhcywgTmlybW95IDxuaXJtb3kuZGFzQGludGVsLmNvbT47IENoLCBTYWkN
Cj4+IEdvd3RoYW0gPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT4NCj4+IFN1YmplY3Q6IFJFOiBb
UEFUQ0hdIHRlc3RzL2ludGVsL3hlX3RsYjogQWRkIHRlc3QgdG8gY2hlY2sgVExCDQo+PiBpbnZh
bGlkYXRpb24NCj4+DQo+PiBMR1RNDQo+PiBSZXZpZXdlZC1ieTogUHJpeWFua2EgRGFuZGFtdWRp
IDxQcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPj4NCj4+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4+ID4gRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+PiA+IHNhaS5nb3d0aGFtLmNoQGludGVsLmNv
bQ0KPj4gPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAyNywgMjAyNCAxMDowNiBBTQ0KPj4gPiBU
bzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERhcywgTmlybW95DQo+PiA+IDxuaXJt
b3kuZGFzQGludGVsLmNvbT47IENoLCBTYWkgR293dGhhbSA8c2FpLmdvd3RoYW0uY2hAaW50ZWwu
Y29tPg0KPj4gPiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2ludGVsL3hlX3RsYjogQWRkIHRlc3Qg
dG8gY2hlY2sgVExCDQo+PiA+IGludmFsaWRhdGlvbg0KPj4gPg0KPj4gPiBGcm9tOiBTYWkgR293
dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPj4gPg0KPj4gPiBUZXN0IHZhbGlk
YXRlcyBUTEIgaW52YWxpZGF0aW9uIGJ5IGJpbmRpbmcgZGlmZmVyZW50IGJ1ZmZlciBvYmplY3Rz
DQo+PiA+IHdpdGggdGhlIHNhbWUgdm1hIGFuZCBzdWJtaXR0aW5nIHdvcmtsb2FkIHNpbXVsdGFu
ZW91c2x5LCBJZGVhbGx5DQo+PiA+IGV4cGVjdGluZyBncHUgdG8gaGFuZGxlIHBhZ2VzIGJ5IGlu
dmFsaWRhdGluZyBhbmQgYXZvZGluZyBwYWdlIGZhdWx0cy4NCj4+ID4NCj4+ID4gQ2M6IE5pcm1v
eSBEYXMgPG5pcm1veS5kYXNAaW50ZWwuY29tPg0KPj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWkgR293
dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPj4gPiAtLS0NCj4+ID4gIHRlc3Rz
L2ludGVsL3hlX3RsYi5jIHwgMTU0DQo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiA+ICB0ZXN0cy9tZXNvbi5idWlsZCAgICB8ICAgMSArDQo+PiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDE1NSBpbnNlcnRpb25zKCspDQo+PiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgdGVzdHMvaW50ZWwveGVfdGxiLmMNCj4+ID4NCj4+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lu
dGVsL3hlX3RsYi5jIGIvdGVzdHMvaW50ZWwveGVfdGxiLmMgbmV3IGZpbGUNCj4+ID4gbW9kZQ0K
Pj4gPiAxMDA2NDQgaW5kZXggMDAwMDAwMDAwLi5lZjQ0YTEwNjkNCj4+ID4gLS0tIC9kZXYvbnVs
bA0KPj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV90bGIuYw0KPj4gPiBAQCAtMCwwICsxLDE1NCBA
QA0KPj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPj4gPiArLyoNCj4+
ID4gKyogQ29weXJpZ2h0IMKpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24NCj4+ID4gKyoNCj4+ID4g
KyogQXV0aG9yczoNCj4+ID4gKyogICAgU2FpIEdvd3RoYW0gQ2ggPHNhaS5nb3d0aGFtLmNoQGlu
dGVsLmNvbT4NCj4+ID4gKyovDQo+PiA+ICsjaW5jbHVkZSAiaWd0LmgiDQo+PiA+ICsjaW5jbHVk
ZSAibGliL2lndF9zeW5jb2JqLmgiDQo+PiA+ICsjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4+
ID4gKyNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5oIg0KPj4gPiArI2luY2x1ZGUgInhlX2RybS5oIg0K
Pj4gPiArI2luY2x1ZGUgImlndF9kZWJ1Z2ZzLmgiDQo+PiA+ICsNCj4+ID4gKy8qKg0KPj4gPiAr
ICogVEVTVDogQ2hlY2sgVHJhbnNsYXRpb24gTG9va2FzaWRlIEJ1ZmZlciBJbnZhbGlkYXRpb24u
DQo+PiA+ICsgKiBDYXRlZ29yeTogU29mdHdhcmUgYnVpbGRpbmcgYmxvY2sNCj4+ID4gKyAqIE1l
Z2EgZmVhdHVyZTogR2VuZXJhbCBDb3JlIGZlYXR1cmVzDQo+PiA+ICsgKiBTdWItY2F0ZWdvcnk6
IENNRCBzdWJtaXNzaW9uDQo+PiA+ICsgKiBGdW5jdGlvbmFsaXR5OiBUTEIgaW52YWxpZGF0ZQ0K
Pj4gPiArICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0ICAqLyBzdHJ1Y3QgZGF0
YSB7DQo+PiA+ICsJdWludDMyX3QgYmF0Y2hbMTZdOw0KPj4gPiArCXVpbnQzMl90IGRhdGE7DQo+
PiA+ICsJdWludDY0X3QgYWRkcjsNCj4+ID4gK307DQo+PiA+ICsNCj4+ID4gK3N0YXRpYyB2b2lk
IHN0b3JlX2R3b3JkX2JhdGNoKHN0cnVjdCBkYXRhICpkYXRhLCB1aW50NjRfdCBhZGRyLCBpbnQN
Cj4+ID4gK3ZhbHVlKSB7DQo+PiA+ICsJaW50IGI7DQo+PiA+ICsJdWludDY0X3QgYmF0Y2hfb2Zm
c2V0ID0gKGNoYXIgKikmKGRhdGEtPmJhdGNoKSAtIChjaGFyICopZGF0YTsNCj4+ID4gKwl1aW50
NjRfdCBiYXRjaF9hZGRyID0gYWRkciArIGJhdGNoX29mZnNldDsNCj4+ID4gKwl1aW50NjRfdCBz
ZGlfb2Zmc2V0ID0gKGNoYXIgKikmKGRhdGEtPmRhdGEpIC0gKGNoYXIgKilkYXRhOw0KPj4gPiAr
CXVpbnQ2NF90IHNkaV9hZGRyID0gYWRkciArIHNkaV9vZmZzZXQ7DQo+PiA+ICsNCj4+ID4gKwli
ID0gMDsNCj4+ID4gKwlkYXRhLT5iYXRjaFtiKytdID0gTUlfU1RPUkVfRFdPUkRfSU1NX0dFTjQ7
DQo+PiA+ICsJZGF0YS0+YmF0Y2hbYisrXSA9IHNkaV9hZGRyOw0KPj4gPiArCWRhdGEtPmJhdGNo
W2IrK10gPSBzZGlfYWRkciA+PiAzMjsNCj4+ID4gKwlkYXRhLT5iYXRjaFtiKytdID0gdmFsdWU7
DQo+PiA+ICsJZGF0YS0+YmF0Y2hbYisrXSA9IE1JX0JBVENIX0JVRkZFUl9FTkQ7DQo+PiA+ICsJ
aWd0X2Fzc2VydChiIDw9IEFSUkFZX1NJWkUoZGF0YS0+YmF0Y2gpKTsNCj4+ID4gKw0KPj4gPiAr
CWRhdGEtPmFkZHIgPSBiYXRjaF9hZGRyOw0KPj4gPiArfQ0KPj4gPiArDQo+PiA+ICsvKioNCj4+
ID4gKyAqIFNVQlRFU1Q6IGJhc2ljLXRsYg0KPj4gPiArICogRGVzY3JpcHRpb246IENoZWNrIFRy
YW5zbGF0aW9uIExvb2thc2lkZSBCdWZmZXIgSW52YWxpZGF0aW9uLg0KPj4gPiArICovDQo+PiA+
ICtzdGF0aWMgdm9pZCB0bGJfaW52YWxpZGF0aW9uKGludCBmZCwgc3RydWN0DQo+PiA+ICtkcm1f
eGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2kpIHsNCj4+ID4gKwlzdHJ1Y3QgZHJtX3hlX3N5
bmMgc3luY1syXSA9IHsNCj4+ID4gKwkJeyAudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfU1lOQ09C
SiwgLmZsYWdzID0NCj4+ID4gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsIH0sDQo+PiA+ICsJCXsg
LnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1NZTkNPQkosIC5mbGFncyA9DQo+PiA+IERSTV9YRV9T
WU5DX0ZMQUdfU0lHTkFMLCB9DQo+PiA+ICsJfTsNCj4+ID4gKwlzdHJ1Y3QgZHJtX3hlX2V4ZWMg
ZXhlYyA9IHsNCj4+ID4gKwkJLm51bV9iYXRjaF9idWZmZXIgPSAxLA0KPj4gPiArCQkubnVtX3N5
bmNzID0gMiwNCj4+ID4gKwkJLnN5bmNzID0gdG9fdXNlcl9wb2ludGVyKCZzeW5jKSwNCj4+ID4g
Kwl9Ow0KPj4gPiArCXN0cnVjdCBkYXRhICpkYXRhMTsNCj4+ID4gKwlzdHJ1Y3QgZGF0YSAqZGF0
YTI7DQo+PiA+ICsJdWludDMyX3Qgdm07DQo+PiA+ICsJdWludDMyX3QgZXhlY19xdWV1ZTsNCj4+
ID4gKwl1aW50MzJfdCBiaW5kX2VuZ2luZTsNCj4+ID4gKwl1aW50MzJfdCBzeW5jb2JqOw0KPj4g
PiArCXNpemVfdCBib19zaXplOw0KPj4gPiArCWludCB2YWx1ZTEgPSAweDEyMzQ1NjsNCj4+ID4g
KwlpbnQgdmFsdWUyID0gMHgxMjM0NjU7DQo+PiA+ICsJdWludDY0X3QgYWRkciA9IDB4MTAwMDAw
Ow0KPj4gPiArCXVpbnQzMl90IGJvMSwgYm8yOw0KPj4gPiArCWNoYXIgdGxiX3ByZVs0MDk2XSwg
dGxiX3Bvc1s0MDk2XTsNCj4+ID4gKwljaGFyIHBhdGhbMjU2XTsNCj4+ID4gKw0KPj4gPiArCXN5
bmNvYmogPSBzeW5jb2JqX2NyZWF0ZShmZCwgMCk7DQo+PiA+ICsJc3luY1swXS5oYW5kbGUgPSBz
eW5jb2JqX2NyZWF0ZShmZCwgMCk7DQo+PiA+ICsJc3luY1sxXS5oYW5kbGUgPSBzeW5jb2JqOw0K
Pj4gPiArDQo+PiA+ICsJdm0gPSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPj4gPiArCWJvX3Np
emUgPSBzaXplb2YoKmRhdGExKTsNCj4+ID4gKwlib19zaXplID0geGVfYmJfc2l6ZShmZCwgYm9f
c2l6ZSk7DQo+PiA+ICsJYm8xID0geGVfYm9fY3JlYXRlKGZkLCB2bSwgYm9fc2l6ZSwNCj4+ID4g
KwkJCQkgICB2cmFtX2lmX3Bvc3NpYmxlKGZkLCBlY2ktPmd0X2lkKSwNCj4+ID4gKw0KPj4gPiBE
Uk1fWEVfR0VNX0NSRUFURV9GTEFHX05FRURTX1ZJU0lCTEVfVlJBTSk7DQo+PiA+ICsJYm8yID0g
eGVfYm9fY3JlYXRlKGZkLCB2bSwgYm9fc2l6ZSwNCj4+ID4gKwkJCQkgICB2cmFtX2lmX3Bvc3Np
YmxlKGZkLCBlY2ktPmd0X2lkKSwNCj4+ID4gKw0KPj4gPiBEUk1fWEVfR0VNX0NSRUFURV9GTEFH
X05FRURTX1ZJU0lCTEVfVlJBTSk7DQo+PiA+ICsNCj4+ID4gKwlzcHJpbnRmKHBhdGgsICIvc3lz
L2tlcm5lbC9kZWJ1Zy9kcmkvMC9ndCVkL3N0YXRzIiwgZWNpLT5ndF9pZCk7DQo+PiA+ICsJaWd0
X2RlYnVnZnNfZHVtcChmZCwgcGF0aCk7DQo+PiA+ICsJaWd0X2RlYnVnZnNfcmVhZChmZCwgcGF0
aCwgdGxiX3ByZSk7DQo+PiA+ICsJaWd0X2luZm8oInRsYiBpbnZhbGlkYXRpb25zIGNvdW50cyBi
ZWZvcmUgc3VibWl0dGluZw0KPj4gPiArd29yYWtsb2Fkc1xuJXNcbiIsIHRsYl9wcmUpOw0KPj4g
PiArDQo+PiA+ICsJZXhlY19xdWV1ZSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgZWNp
LCAwKTsNCj4+ID4gKwliaW5kX2VuZ2luZSA9IHhlX2JpbmRfZXhlY19xdWV1ZV9jcmVhdGUoZmQs
IHZtLCAwKTsNCj4+ID4gKwl4ZV92bV9iaW5kX2FzeW5jKGZkLCB2bSwgYmluZF9lbmdpbmUsIGJv
MSwgMCwgYWRkciwgYm9fc2l6ZSwgc3luYywNCj4+ID4gMSk7DQo+PiA+ICsJZGF0YTEgPSB4ZV9i
b19tYXAoZmQsIGJvMSwgYm9fc2l6ZSk7DQo+PiA+ICsNCj4+ID4gKwlzdG9yZV9kd29yZF9iYXRj
aChkYXRhMSwgYWRkciwgdmFsdWUxKTsNCj4+ID4gKwlleGVjLmV4ZWNfcXVldWVfaWQgPSBleGVj
X3F1ZXVlOw0KPj4gPiArCWV4ZWMuYWRkcmVzcyA9IGRhdGExLT5hZGRyOw0KPj4gPiArCXN5bmNb
MF0uZmxhZ3MgJj0gfkRSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMOw0KPj4gPiArCXN5bmNbMV0uZmxh
Z3MgfD0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUw7DQo+PiA+ICsJeGVfZXhlYyhmZCwgJmV4ZWMp
Ow0KPj4gPiArCWlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3luY29iaiwgMSwgSU5UNjRf
TUFYLCAwLCBOVUxMKSk7DQo+PiA+ICsJeGVfdm1fYmluZF9hc3luYyhmZCwgdm0sIGJpbmRfZW5n
aW5lLCBibzIsIDAsIGFkZHIsIGJvX3NpemUsIHN5bmMsDQo+PiA+IDEpOw0KPj4gPiArCWRhdGEy
ID0geGVfYm9fbWFwKGZkLCBibzIsIGJvX3NpemUpOw0KPj4gPiArDQo+PiA+ICsJc3RvcmVfZHdv
cmRfYmF0Y2goZGF0YTIsIGFkZHIsIHZhbHVlMik7DQo+PiA+ICsJZXhlYy5leGVjX3F1ZXVlX2lk
ID0gZXhlY19xdWV1ZTsNCj4+ID4gKwlleGVjLmFkZHJlc3MgPSBkYXRhMi0+YWRkcjsNCj4+ID4g
KwlzeW5jWzBdLmZsYWdzICY9IH5EUk1fWEVfU1lOQ19GTEFHX1NJR05BTDsNCj4+ID4gKwlzeW5j
WzFdLmZsYWdzIHw9IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMOw0KPj4gPiArCXhlX2V4ZWMoZmQs
ICZleGVjKTsNCj4+ID4gKwlpZ3RfYXNzZXJ0KHN5bmNvYmpfd2FpdChmZCwgJnN5bmNvYmosIDEs
IElOVDY0X01BWCwgMCwgTlVMTCkpOw0KPj4gPiArDQo+PiA+ICsJaWd0X2RlYnVnZnNfZHVtcChm
ZCwgcGF0aCk7DQo+PiA+ICsJaWd0X2RlYnVnZnNfcmVhZChmZCwgcGF0aCwgdGxiX3Bvcyk7DQo+
PiA+ICsJaWd0X2luZm8oInRsYiBpbnZhbGlkYXRpb25zIGNvdW50cyBhZnRlciBzdWJtaXR0aW5n
DQo+PiA+ICt3b3Jha2xvYWRzXG4lc1xuIiwgdGxiX3Bvcyk7DQo+PiA+ICsNCj4+ID4gKwlpZ3Rf
YXNzZXJ0X2VxKGRhdGExLT5kYXRhLCB2YWx1ZTEpOw0KPj4gPiArCWlndF9hc3NlcnRfZXEoZGF0
YTItPmRhdGEsIHZhbHVlMik7DQo+PiA+ICsJaWd0X2Fzc2VydChzdHJjbXAodGxiX3ByZSwgdGxi
X3BvcykgIT0gMCk7DQo+PiA+ICsNCj5UaGlzIGNvbXBhcmVzIGVudGlyZSBzdHJpbmcgZWc6IHRs
Yl9pbnZhbF9jb3VudDoyIHdpdGggdGxiX2ludmFsX2NvdW50OjggV2hpY2ggaXMNCj5pbmNvcnJl
Y3QgYWNjb3JkaW5nIHRvIG15IHVuZGVyc3RhbmRpbmcsIGNhbiB5b3UgY29udmVydCB0aGF0IGlu
dG8gaW50ZWdlciBhbmQNCj5jb21wYXJlIHRoYXQ/DQo+UGxlYXNlIHRha2UgdGhlIHJldmlld2Vk
LWJ5IGFmdGVyIHRoaXMuDQoNClN1cmUgTWFrZSBzZW5zZSB0byBtZSwgU2VuZGluZyBhbiBvdGhl
ciBwYXRjaCB3aXRoIHRoZSBhYm92ZSBjaGFuZ2UuDQoNClRoYW5rcywNCkdvd3RoYW0uDQo+DQo+
PiA+ICsJc3luY29ial9kZXN0cm95KGZkLCBzeW5jWzBdLmhhbmRsZSk7DQo+PiA+ICsJc3luY29i
al9kZXN0cm95KGZkLCBzeW5jb2JqKTsNCj4+ID4gKwltdW5tYXAoZGF0YTEsIGJvX3NpemUpOw0K
Pj4gPiArCW11bm1hcChkYXRhMiwgYm9fc2l6ZSk7DQo+PiA+ICsJZ2VtX2Nsb3NlKGZkLCBibzEp
Ow0KPj4gPiArCWdlbV9jbG9zZShmZCwgYm8yKTsNCj4+ID4gKwl4ZV9leGVjX3F1ZXVlX2Rlc3Ry
b3koZmQsIGV4ZWNfcXVldWUpOw0KPj4gPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4+ID4g
K30NCj4+ID4gKw0KPj4gPiAraWd0X21haW4NCj4+ID4gK3sNCj4+ID4gKwlpbnQgZmQ7DQo+PiA+
ICsJc3RydWN0IGRybV94ZV9lbmdpbmUgKmVuZ2luZTsNCj4+ID4gKw0KPj4gPiArCWlndF9maXh0
dXJlIHsNCj4+ID4gKwkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4+ID4gKwl9
DQo+PiA+ICsNCj4+ID4gKwlpZ3Rfc3VidGVzdCgiYmFzaWMtdGxiIikgew0KPj4gPiArCQllbmdp
bmUgPSB4ZV9lbmdpbmUoZmQsIDApOw0KPj4gPiArCQl0bGJfaW52YWxpZGF0aW9uKGZkLCAmZW5n
aW5lLT5pbnN0YW5jZSk7DQo+PiA+ICsJfQ0KPj4gPiArDQo+PiA+ICsJaWd0X2ZpeHR1cmUgew0K
Pj4gPiArCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4+ID4gKwl9DQo+PiA+ICt9DQo+PiA+IGRp
ZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkIGluZGV4DQo+
PiA+IGU1ZDg4NTJmMy4uMTdjODA4YWI2IDEwMDY0NA0KPj4gPiAtLS0gYS90ZXN0cy9tZXNvbi5i
dWlsZA0KPj4gPiArKysgYi90ZXN0cy9tZXNvbi5idWlsZA0KPj4gPiBAQCAtMzE2LDYgKzMxNiw3
IEBAIGludGVsX3hlX3Byb2dzID0gWw0KPj4gPiAgCSd4ZV9zeXNmc19kZWZhdWx0cycsDQo+PiA+
ICAJJ3hlX3N5c2ZzX3ByZWVtcHRfdGltZW91dCcsDQo+PiA+ICAJJ3hlX3N5c2ZzX3NjaGVkdWxl
cicsDQo+PiA+ICsgICAgICAgICd4ZV90bGInLA0KPj4gPiAgXQ0KPj4gPg0KPj4gPiAgaW50ZWxf
eGVfZXVkZWJ1Z19wcm9ncyA9IFsNCj4+ID4gLS0NCj4+ID4gMi4yNS4xDQoNCg==

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC275606A33D
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V8Y8EXZZ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WvCPHd6I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BDC10EE1C;
	Mon, 23 Nov 2026 13:58:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AF810E7D4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795442215; x=1826978215;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Gzq/DMFYxi9eCBlwUZnhVkgjmQWTEACBpa2Z0CFSbe0=;
 b=V8Y8EXZZvbsTi0GVGCCDbmcmZtLVe+E90Cbc/12HDNDmfQBZTo8/luTB
 LtRsf4ROFsnbgvOtmRrTSbnT6vN1MoPSuUI5Qz8hPAmIwkdCcyUAhR7xM
 xEmFYykagZzvVA0FHGBV/vZ9YPVNLXi0P3KJ1jNvtwb2gSkq1IfVxWbVb
 VEAjOwS4KPrk2XETzeNzGXz65yipcUm3TuGEe4WGkXzqB2S+n8PcNa5GU
 WWFrTL/0izn53j41OdYyynD+OtolADglYKipM4sCfVn5tRKyoDopBeV0r
 t5VhM/yi0zWIqBBYHYtGME1jGfTLj0EeXbtKTn6CFnELCKN7DRUAF0FDU g==;
X-CSE-ConnectionGUID: pZ1aUul+SHam6hliMs8P6Q==
X-CSE-MsgGUID: iIk6FAaGSueBKqpm0kXG3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4145147"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4145147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 05:56:54 -0800
X-CSE-ConnectionGUID: TYs0mOXrSKyA+r/Ml4amOw==
X-CSE-MsgGUID: +BND3WXqTh2iubQm6mbonw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11500827"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 05:56:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 05:56:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 05:56:53 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 05:56:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cg5osvFSHHuJtQSzBXsnalGpfuwA0Qdo5oufG8zNQOe5DjMlZE0TwDr7Ojz2zsAv0pEoHP0dETjGXbQpXrFy/k5EFY3CAiTrR8We1TA59jv975P7IE8ox+3wpnYio+IiMRv82uftLKiRv+eEn1QxsMQDJkuEQz4lCwUwjSAfp14RpGkNh54hpkupFIjlk9wsQAqLrcyP9JnqMR4CwP8jK5dBUtV2ybSYiVRJBG3aXzxEcreCohH9GtxD9M1srA/2YCOcGdDlvTC4p2LZRiULOFg56h+n9CdvzqlvIxV0knlpzgIjLuUR6OqTA0Oj1iEBMFVHjte7hriharNJmuVzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKN0L8yijvNLiUTH0OtBuqECpl4Au7FlCFkRo5jOvMY=;
 b=eBjl4lsQq2bgiBW+BaAK0zqBiHGw5MaG867LEl0Lm9yNk6H+sLnxGxujj3a9GcDVBUXp752qCMyFgGRhwjMffrhJnmd/LGJ+MajREqEySyppTz7EF1aqtt6qcxR89ikuY9qchbvJs5MDRpIar3LFBj1gPRCax5IVEXVk3ydgWBaZSHUs9ufRg+fnVgE7dfoZR95nCohKQPzPg5wbwC1dLlWuE6Y4ZbUd1S2T9eorKUpYl/+XkT54VK/uUd9yj255m1tmcUM3DRMBsIQexVKILp8CntERJJZcvXKRb1wT0zdgZ+zaJ3IhroRqUqHdB7mz2rdvYXvQDNxWLUFqiCvSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKN0L8yijvNLiUTH0OtBuqECpl4Au7FlCFkRo5jOvMY=;
 b=WvCPHd6Iu57nHU1i7YQIdwJlE3pDAM4msU3GHo707BBknOrceSX8qFtrl+dkyMS39ydYDp25ksxaSZQGYNa2ZgOkd4DZFjYpCNGAdLMbQAYdoBqdQhjbZY7feuzKTZsDri9bhplrdephLYJ3UyA9LiF/FJ4rl4Mdr6SN5Fw310k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by CO1PR11MB4834.namprd11.prod.outlook.com
 (2603:10b6:303:90::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 13:56:41 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Mon, 23 Nov 2026
 13:56:41 +0000
Date: Mon, 23 Nov 2026 13:56:32 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/core_sysfs: Change prints to debug
Message-ID: <24ufqeqqzk7eyxtmmkyhbyhst22erg5eeoeqvfjj3q6dvtdpap@a23m6vz7k5kg>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
 <20261120182614.34410-4-kamil.konieczny@linux.intel.com>
 <dipjvbum3ycw3oew5lp4ze7wtlgh7ysh5fhtvlqdgpmdftiwcb@acclbkbexh7a>
 <brtvn66laxze4abun4l2j5ccbbb2z465b6f7zkfdeqtfxje23y@splske36nodc>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <brtvn66laxze4abun4l2j5ccbbb2z465b6f7zkfdeqtfxje23y@splske36nodc>
X-ClientProxiedBy: AS9PR06CA0706.eurprd06.prod.outlook.com
 (2603:10a6:20b:49f::16) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|CO1PR11MB4834:EE_
X-MS-Office365-Filtering-Correlation-Id: db6cae3f-931d-423d-a3b5-08df496999da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|3023799007|11063799006|56012099006|4143699003|261028144727099003|261026140227099003|261026121527099003|261102123227099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: cAKmF543Y+mBnPdD/seH1O5x4FeR488P9NN7k3C5IP5icLlHvXYHpgxdgCl8q8PhegANDvuUCWDBVfnQK9MOZkgg3wN03WfeXEiFR9CiHm2pqPzOEg+nxWitk0q5UeHyzJi/KyG0qnQG9FF9XIIMyH+UcpQP2WFc8joTGoGGENjqOqU9yyc3uxUICc+1bj8tPSzzzO+iajeRQpb/lXesmaxITQFxdxxzkscZmoX6Ff5AXHdwgfKp9K5XPHdC0PNhCUpYGM6pLwWu2QhLJ3Lj8z6Z93+k2ttLVgaC2a7aAe/dUOSwos5PWuvb3bN5IUaDBjt+Di6BlqgO3ZzBH92A8nJd7Ry4rqLh+42zNg2vqxluQheft9EWcejsQ+IKzYtKyvUgOX7zeKljj0cuNc/2MiIuKo98smCLGvK3POX3iynESZNWMJBCHHuszdqkvzbaMoGlc9dZWTiicrh8t0oDq2v5QenwkMGINojHYzhE/9upE40z9lyWurvCITyio6DyUVXrDYjDmd3O6cPh5x1GpNBQEykjleuz8t9AZ22jwcEguer0LADmNjbzlq56GvxildLT40G0BTgQ/goMlDyfwpZawr594cXeECofvNV00EkAmvbOOk7Am+lJfdQ6gW5QVR6ZvkCpumHHuAlBaviYrL8vSTQNUzZEImtVl1bg4oQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003)(261028144727099003)(261026140227099003)(261026121527099003)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2JOYWJOU1dwcE5rc3g1U21wOXVvZ0F4WUhxTStoOHZQT1YzTy9wNmJOd1Iz?=
 =?utf-8?B?NUpkSWhieXhOZFZhOFprblZ1Wllnczl1anJHUklaZHBXRGw2Tkl3SGpvRnFy?=
 =?utf-8?B?bVpBaDg5ZWdXTmNHUlpJSXl2eDNDR1dPZC9Cc0w0MnJhanRvZVVya1RoUG9R?=
 =?utf-8?B?dXF3bWtkcXUwRUtDaWxmMGYwMnV6cGpidUg2NmYyN2VHZEFrdUVOWW92aW1F?=
 =?utf-8?B?TFluRlRJTzFidG81a0piTTgzcFpSdnEwNTQ1aU1WWHhaM29PeDdnVWFoMHhu?=
 =?utf-8?B?UEZqb2pIYkk4R0FBRGlaRWVxMnUxUzBWWE1vNDZBWkNyOXk4OVFVYjU3Yi95?=
 =?utf-8?B?ZXh3ZDQrRkZESlNqdXFnRHIycmdETFN4WGh4Q2NEalNIekFHV1Z0YVFIRU9H?=
 =?utf-8?B?dkJ1NVIrS0lTR0JBVWcwR1VPdC9qelpwb2NxWVFQbG9MMXRaUnlWK05OZnlS?=
 =?utf-8?B?TW9lTnIwc25KakwwT1IzcUJkN2pzQmtLQlJlVGxRZTdlT0FVdTI5RzdoSHgr?=
 =?utf-8?B?bVVFUFlkbGVFU29RNUNCM0pwcGNOUXY3ZkFtRjVNWW1BRC9yTVJydkxEbHl1?=
 =?utf-8?B?UEhvV1JBTGQzM2tkV1FmdnhFTVZwdDFtZ2UrVktZU3dzRTNtZ2lhUnlsNGtM?=
 =?utf-8?B?VnVvRDhPY0VxMVZSSEs1SEFRMy9yQ3ZmaSt4WkdvalFadGNBancvcllJL2VF?=
 =?utf-8?B?c3N1Q3NtaWpPV1F1QXNMSk8rMzFyWXZOKzVidVZwWStkT2xwankwR3JodmZ6?=
 =?utf-8?B?QWhsL3JHMk5ONDNhb0Naa2JOUW5ZK1EzQkxPR3BUVEJONS8wanBkWWVpVHhO?=
 =?utf-8?B?ZGtnTS9pYjJKa0szVGpxMTByakV2bEpGLzFiNGdWVktyY0lkZkNqYUhYS3NS?=
 =?utf-8?B?WjIveVJScjdHSlY1b3dZZWRyc0VvV2VVblFlZWhjQVE3ajlrOEFTdUVsais4?=
 =?utf-8?B?VkdKc3gzZmhwdjZlcXJ5MTY5NHl2SC9TMjdINmQzQTlOR280VmIxNS9waVpU?=
 =?utf-8?B?SmdiODBMcDJ2N2VGM0hLSEpyMXdPWDg1ckcwd1NRTHB2cUFCeXh6RXF3dzEv?=
 =?utf-8?B?K3FyQUhCa01ESHZuWG95anoweEdlcE9UcjVmckdRRGxHQlkyTnZyZ0xUb3VS?=
 =?utf-8?B?bEZnWlRFSzJ6aVN3QXRmdkZldlNRVW9ESG1La0xXMCtZMSs4VTBNRnZmSXl5?=
 =?utf-8?B?cUozVXJnR3V6SlpwV01QZEZzaTFqOWJxZ3N5eXJlYlNmUTlrTUd1RW8rZ29n?=
 =?utf-8?B?bCthRHNFQ1pmWmFOQjBrMVJ5d1AxeHllRGRjaHBkUGI4a0t0WUphT0VTMHNZ?=
 =?utf-8?B?emRFUTVUU0trTkw4RXQ5M1pMa293djMzU0lOVEduMG1jRHBnR0tmenVBRFdE?=
 =?utf-8?B?V3lhNkVlQWdWUXBDYW9DbnVEbTFmVU5TWDdFdWhaN0I4VnVPYVMyKzdUU2N2?=
 =?utf-8?B?c0N1YTBCSnJvY2IzbEVmYUxkVXRLeDE1dFNMbEVOVU8wS09xSVM4bUprUUl3?=
 =?utf-8?B?aDFlQXk0S3RheTVWcUFiakFiMU41S1orblY3d2Q3VWJtdlNvRkpmWkt1ak54?=
 =?utf-8?B?WHBwY1c0WmR4VEJHcDVXdVJOcWY5b1dNZko0OEY2Z0VCeWtBZk5uNnVrdUhX?=
 =?utf-8?B?anVOY2trWFhZeWFWTnpXZGhFSkRYM2JqSmdhNHlVbzZaTWpmYy9LOFJOUk1X?=
 =?utf-8?B?VHlaK0YvMVJKKzY3aVR5V285RVRWcEZ4OTVySzA0U0xHZy9LWUd1VEx5K1pC?=
 =?utf-8?B?VlVUNXlaODhjVFhrRWN4R0NFbEpINmh3clpKaEhYVmoyRGJlWnRnQTZ2T095?=
 =?utf-8?B?a1VTRWlqNmUvVjhPcTdxVVFmZlRRMVAwb3FmVElKTlcyZ0VXSVhtZUlMUytQ?=
 =?utf-8?B?aG5JL3dmdm5hbHhjNlkwa0lieWhkWjBFZ0NhRitWT2tyaWt0aTJQNTllc3dr?=
 =?utf-8?B?ZXEzdTB2SUROd0lRbXRUQTB4UERZRzVKazQrMXlPRkdGbEpCQmdod0pqd3hi?=
 =?utf-8?B?ank3cGJuTG51SWhOYTU0bWJjNUJ4cDdoNUpsV1F2a2hkdk1LK2RuV0JYbjkw?=
 =?utf-8?B?QVhSWHlORG4vT2lPYzFMUTBzMnpybURKYmdYa0VMRXdmS0ZyNm9GUHJQSXlS?=
 =?utf-8?B?TkMyT2R6U052T1lzdXRMR09tLzdhVi9vMGxmUjhVSmEvb2VuYk95UWlZVXl6?=
 =?utf-8?B?alYxc2VsK2o2Y3pOcDRGa0IyTlg3N3JpL3M3ZGpHTHBhV0JlbmZ3Rm13cXI2?=
 =?utf-8?B?a2E4YVJRUk1FRDVma2doQ3dNV1ZiMlBBSlVqdUNGUVNnOE1tM3NibWtMWUZK?=
 =?utf-8?B?YzAzVzBVNEwza0VzckJrR3RwK3dSeko3c3dzS2NwRWR6SG41Z3FCL1I1MlJ6?=
 =?utf-8?Q?mR7XZLRUz9EwjT7s=3D?=
X-Exchange-RoutingPolicyChecked: UD6MjuvaMXL82yaawW1bfnGBF0UaNQwpPs/GeOIYvlCb9ah/7EQodNhqhCzWGXjgF9dQ3j20For7RmbMphsom6N6TmPrQcagzauKtK41rzk6C3mDicsf6sua6bwpFDbBGZezGelcKjqvTcrukBPKW2aU6hwLTWblx31tjGRQK9RnnmmzBUZpr6CPrrfzcBCDCryRspa2KNZKGz+XFlSk8tx/ZEb8ZZXYtI0rTp6Xy4c+4LN+QB2gNyHWv9qEITJh38s0xDbOIlTccEcrDhEx1F/vChivvK0boTOFM2xF+EdYafxTPTJ5hcgzA3rUzHsXLhXC1kmffFcZAKsaRT9YIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: db6cae3f-931d-423d-a3b5-08df496999da
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 13:56:41.2314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEXenS1jTQ/oEyJe0tGCgQhWxrorFWz0w0InZDNqY5rrMQwDW/3cxDUM0CYb9+k0B07DP1pJms4B7fqER1nPM1g+S0v21T9SVCxMEFg9qvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 2026-11-23 at 12:45:10 +0100, Kamil Konieczny wrote:
> Hi Krzysztof,
> On 2026-11-23 at 10:17:39 +0000, Krzysztof Karas wrote:
> > Hi Kamil,
> > 
> > On 2026-11-20 at 19:26:14 +0100, Kamil Konieczny wrote:
> > > Instead of printing every name of file read, make printing into
> > > debug only, reducing normal output.  Keep only one print at the
> > > beggining of test about a path which will be scanned and a
> > > summary at the end.
> > > Also while at this, add 'ok' prefix to those prints which are
> > > treated as non-errors, for example write-only file.
> > > 
> > > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >  tests/core_sysfs.c | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> > > index 8719b4ffe..f05c8845a 100644
> > > --- a/tests/core_sysfs.c
> > > +++ b/tests/core_sysfs.c
> > > @@ -46,26 +46,26 @@ static int read_sysfs(const char *filename, void *data)
> > >  		len = 0;
> > >  
> > >  	if (lstat(filename, &sb) == -1) {
> > > -		igt_info("Stat fails errno=%d %s\n", errno, filename);
> > > +		igt_debug("Stat fails errno=%d %s\n", errno, filename);
> > Maybe this could also be prefixed by "ok"?
> > 
> 
> No as this will assert at a final check:
> 
> process_sysfs(sysfs);
> igt_info("Summary:...
> 
> igt_assert_eq(read_fails, 0);
> igt_assert_eq(open_fails, 0);
> igt_assert_eq(stat_fails, 0);
> 
> > >  		stat_fails++;
> > >  		return 0;
> 
> Returns zero here to keep scanning and reading until all sys
> nodes will be checked.
> 
> > >  	}
> > >  
> > >  	if ((sb.st_mode & S_IFMT) != S_IFREG) {
> > > -		igt_info("Not a regular file %s\n", filename);
> > > +		igt_debug("ok not a regular file %s\n", filename);
> > >  		not_read_count++;
> > >  		return 0;
> > >  	}
> > >  
> > >  	if (!(sb.st_mode & 0444)) {
> > > -		igt_info("Not readable %s\n", filename);
> > > +		igt_debug("ok not readable %s\n", filename);
> > >  		not_read_count++;
> > >  		return 0;
> > >  	}
> > >  
> > >  	fd = open(filename, O_RDONLY);
> > >  	if (fd < 0) {
> > > -		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> > > +		igt_debug("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> > This also does not seem to be treated as error here. Unless,
> > this is my misunderstanding and return 0 here is irrelevant to
> > what is treated as erroneous behavior.
> > 
> 
> It is the same idea: keep reading all of nodes, assert error(s)
> if any at subtest end. So as this treated as error, there is no
> 'ok' prefix at start of line.
> 

Fair enough, thanks for explaining:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> Regards,
> Kamil
> 
> > >  		open_fails++;
> > >  
> > >  		return 0;
> > > @@ -74,10 +74,10 @@ static int read_sysfs(const char *filename, void *data)
> > >  	bytes_read = read(fd, buf, sizeof(buf) - 1);
> > >  	if (bytes_read < 0) {
> > >  		if (errno == EIO && strstr(filename, "/power/")) {
> > > -			igt_info("power management EIO %s\n", filename);
> > > +			igt_debug("ok power management EIO %s\n", filename);
> > >  			not_read_count++;
> > >  		} else {
> > > -			igt_info("Read fails errno=%d %s\n", errno, filename);
> > > +			igt_debug("Read fails errno=%d %s\n", errno, filename);
> > >  			read_fails++;
> > >  		}
> > >  
> > > @@ -87,7 +87,7 @@ static int read_sysfs(const char *filename, void *data)
> > >  	}
> > >  
> > >  	buf[bytes_read] = '\0';
> > > -	igt_info("ok %zd\t%s\n", bytes_read, filename + len);
> > > +	igt_debug("ok %zd\t%s\n", bytes_read, filename + len);
> > >  	ok_count++;
> > >  
> > >  	igt_debug("File %s\nData: %s\n", filename + len, buf);
> > > -- 
> > > 2.55.0
> > > 
> > 
> > -- 
> > Best Regards,
> > Krzysztof

-- 
Best Regards,
Krzysztof

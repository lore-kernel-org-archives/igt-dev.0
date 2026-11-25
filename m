Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD9606A686
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c/wQpCOL;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fMKPkwcn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFD910FAF3;
	Wed, 25 Nov 2026 10:24:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D56610FAFA
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795602184; x=1827138184;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uFDauMfH9AvhFpKIQsvfkCocEpfS7IZFsAf+1u5Sero=;
 b=c/wQpCOLWtjplUegHFLRBMBnipj5h4kC8DNBI0AJAoFtWQmT8jQlckJq
 dfif7wi64TD9ecmZTj7v2G3A7Tp2dxvUDYBT9o8xfgnR+TPYGvJlkghOY
 nSQhxZlxY1Neo/0yQVmQQdJIGQ8xIVuWa8iFNmqaDQKnkSsHd+byeOxPZ
 +rxdF+SGAm8ACDmMinGUh6pZHGP/6U+robEW/AHTGpNIuVMOi35sRGoi1
 XFS5WCs5USFdB0mhBZha8vxFezAOwuac1uqZOXQgGzBrFjjFP/ngPG152
 3HwBVvCZfs35ttYaOFJZzFL3Hx7nEMHBarIGdbD2Y2e3v1qlyt0uY6mtp g==;
X-CSE-ConnectionGUID: 7WKlDUz+QU2ro9LlvyrU0w==
X-CSE-MsgGUID: E9fWtF3aSQWClSnvYqo6nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4556379"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4556379"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 02:23:02 -0800
X-CSE-ConnectionGUID: w8oYWmYmSsupDv7A8dB9zw==
X-CSE-MsgGUID: d7hT39QJRX6+IUO4pJriGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12153676"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 02:23:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 02:23:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 02:23:01 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 02:23:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEXQwv9t38W4e38v6cB42CaztwmkRrEFEukyzSTOcqOu9E+j9PBkZ3m85ffJDd7DK+EAZPXbWvRevEg+E6PPZKSkRcAljp1daes0ZiG0vrpb6UB21jlOn93AlH3gUGz120uQHSDFeGfN3YaO++SGTnbtsZ12z1vFeLht3jTR8zqOiwqC1xHUOD3oUyxgIQcAkzDEApdDfq0Z6tqOeqYtEGCDIVYAxWdCC/SRe7cNp17HHPD4k+FMa2cMhs6++Tqo77siWcS0JFL3smOzLnsBtGTvqO8J0HuJpMUf7BgdF4OVHLBGZx/NDTAGyw8FvMmgslaf+jNcekh01tzxMnF38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCqFBWC0HcGtYDPj4ShDB5o4t83EfkkSCGDCdyTz+Q8=;
 b=HD6RdgeLpgzG6bQ1ahD+cb0JunTyH+vUKY/sjr7F2fKk4/T/o254y3w4wKt8VGNrD4gh+WDWvNUCNecABoV5U/ZgwIp/YuDkEfgG3bnLWFif+NiQEVJ8kNXp/DRl4fxNqZ4jmdFKC0Nv3K0t1OXv1KVn7D6jxMaPPFLsJEgxpuKekvL+Y1VmrhPBmieVfH5gmfE+9mT3IqQAukJGVm4wS3k6JY+RRa9Wuj814DWM5zqfRSj3nD8MwNos5ABJ/OmqdCBDqu4KVT6Ch6emmHcOx5O5f7u7Msow3m+SoF2gz2kHW5cXjeKUHEvq74TL9SewG1q3o2q0fOd3zOHLy7BnHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCqFBWC0HcGtYDPj4ShDB5o4t83EfkkSCGDCdyTz+Q8=;
 b=fMKPkwcnEU1yGPcmtds2qF64Pp/CkXHlGWCrwUXadM44zjfuziyBEg8+dzMpB8oPfiiiKgTJ1gphXBMtEDyW9yq6PEJLRnfFtA9UjlC70BKbDv58A0igsSvLzcJrcoHuCJNbFs+kPIqdtaz3oeMJVHB60xy/4jtaoe1IqqYOme0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 10:22:52 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 10:22:52 +0000
Message-ID: <0a4b73ae-d205-4a7d-9bfd-e20df36881fe@intel.com>
Date: Wed, 25 Nov 2026 15:52:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: Add max uncompressed dotclock
 limit for non-joiner mode selection
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>
References: <20261116091832.1312335-1-karthik.b.s@intel.com>
 <20261116091832.1312335-2-karthik.b.s@intel.com>
 <PH7PR11MB6796E5A086E9CCAEBEBE1A22E57B2@PH7PR11MB6796.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <PH7PR11MB6796E5A086E9CCAEBEBE1A22E57B2@PH7PR11MB6796.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0356.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ0PR11MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbaae38-a6bf-45d9-e3a3-08df4ade0fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|42112799006|366016|10067099003|4143699003|261028144727099003|261021121427099003|56012099006|11063799006|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 7sXcv2ZXVWgQqDI72X5sDIl5DMzwc96L23leK7Mj/mROoVS7mRz7eZgcUOf1EhgGnNZxxsOrAcdfJye6wy+JL6yAj591UcAflzazOGwn7Y64U7KltncizFSRaTKOeF6Eh/xdujIY34NKozBMNBXnUqlmit64S6pF/SHTGa3nDjYgxKAduyP6RwF7EMGieBJO3RXx6vuX0IHecAsjAO2VIhOgv4wNqE337tZ9AFdM7/h698tXpGNNA6MR2uQHb7gQVM19YKLc54d9ljWO4pwUJukFNV0ktzkv6ayaJM0uEb16+vULuXCq/WOhQuvdTkejv4RgzoLy3R8umCEuMZ3xMCNxcl20lVK8ZxHPiZyywc8UNack81ULqI6FzCIbAnCXDaF7w3yIaIpnx7yzEWbVCr+DH90XJHD6IYQg+2TEcuP8ejyZJXw+PrdrpgqGFtIjwiaO3lAUVsqxMoKFbl97kbGxhyUySvo2Xg9yny5yf9Q23F7YJe4gWtyX1tkUQqZpMMvQGs+Rn/OxKHhjZtJJ0u0kyexHnJrEHL8ZTlOgnWDlXU/jcj5ApYnf84P/cL/k9yIcXL5uoaJM45mU7huTuE+ae9ICMVp78csOGW9iryPXaCIgUHQE75HhHRUUTnPjxPkLbNGbUCyEXQOQLGfx/oeQ9586SMHAdLoKAdXhjDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(42112799006)(366016)(10067099003)(4143699003)(261028144727099003)(261021121427099003)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THIzc29nbXJ4WVk5bUtUQXJKQTcvYXkvZy9OancwY09aUjdTSkgwVWZjMS9i?=
 =?utf-8?B?TnZ3MHFtZXdYL05jT3AvdG14U3dMYlFaNEx1WGFoRk9WeXRSS3VGZGFJY0NL?=
 =?utf-8?B?V2pmdW1NUXhFQlN6b21DUCt5TnBvS3dKbjJBY2JpUE9mYVZpcVF4WVVuSlV5?=
 =?utf-8?B?YVhleklXVXBTODc1WjlPbzhMd0pjakYvOG50Q0ZCQlJPZEMrVW5pMW5lTFNC?=
 =?utf-8?B?YkFPU1pIUW4zWEprWUJJTjlRUmhlVkRHYTRRaTdFV1dhWTBmM2NySStsOWlu?=
 =?utf-8?B?NUxTc09SNDBreFRzYWlRUlZ6aENsSlJ0Q1hMcnBXTnE3cjdBQTV2dU5FcEN4?=
 =?utf-8?B?YWt5bXg0Mk5KZnVCTUtPQTFvMktVdDA2aVlVZVJDd3U4Y25DZ0J5YTRLNldh?=
 =?utf-8?B?dXZSSGNDWEtNWHNSV2Y3RUc2UDl5Uk0vVnJuMVU4KzRkaVhBTGZIdmNMemFJ?=
 =?utf-8?B?MmdXc2RnNzF6SFZZT2daSTJVUUU3WWNVeUY4M0ZFVXBrdlMzdlA3dlVEWU5r?=
 =?utf-8?B?VkFpYTlON0NoczVsdWRua2Q5VXliK2VweWRJbjdQd0szbHNILzkveTlmNVFC?=
 =?utf-8?B?RlVScWtlR3BMSXFIcy9NUys1V2hVOFFjZThyMzVsT0RVQmNJUnpGeUdYb21Y?=
 =?utf-8?B?WXZXbFVUZ2pWZ2ZPMHpPMmE4ZnRidjZjckt1M0wrVlVjdUw0OFpReXhVdlBV?=
 =?utf-8?B?SVdoR3BOOUhGbGtNd3E2RmswRXM0QUVqTERFQnhobFRWRWROd3YxRVo5cFNR?=
 =?utf-8?B?WVVrS2JMTHhFNFZQV3ZGcC9pOWxsSytkMHJjQ3pDVlVDSjMwOWpsdkcwRExi?=
 =?utf-8?B?dTYyNzZkWFByWGF1cUZ6dVFzU3czUXpUclpGYXdidUU4a1ZWcEQwUkRGazlS?=
 =?utf-8?B?SjFTUzcxU0p0SjEvc01ObDVzbU1WRUMxV3FqMjZDbHRXRzhMMzZiY3huY3Ry?=
 =?utf-8?B?M3Zhb2t5RS9iVC9FWVN4YkVsT01lNUhVY3lCR20yNXhKRTM4cGtxd1U2VU1R?=
 =?utf-8?B?L2dvVnJYRlhKUXZEQ01yeXF6UmcrbHdlWlMwRnFVZUVxYjhMYWtlTnNOWml1?=
 =?utf-8?B?N2lZTUZIeEd5Z0tCSGEvY016c0g2OFpHZ3lReWc0SURVN2d1L05COGFjYVdR?=
 =?utf-8?B?b0pXdm92WkJ1TWtOcG9FQ0ZhVlFvdnVTdjBjUE9UOXlHa3VLdEg0NnF2ejZ2?=
 =?utf-8?B?Ykp3ZWhuclFOSmh4K3p1ZCthNFQydEpNQlV1OE5zTHRtMG43NENWZkFuYWQ2?=
 =?utf-8?B?RU0xN2Z6SDg2OEV4eTlIQlk2Vk5lR2RockpONkFRNkwyMHE5d285Y29HN1Nk?=
 =?utf-8?B?b0JvcU1uYWZBaFJ6WlFhaFFqYWlMMnJlTmhReklJTytLbVk0TDlxZDNleXRB?=
 =?utf-8?B?YXJFNk96STZyKzQzT3Z0WmdyS1AxMVBkNktkdVVSVDI0dlR1RUhmeWJISS9a?=
 =?utf-8?B?cVk0L2owa2hiS0NoKzRlQWo0SkVOWXJrTGUxOHIwZ3grcG9QWWdvMVRYNyth?=
 =?utf-8?B?Z1V2blEzeDJ0R2JNMEF0VXY5eisrYVRoK0dML0MwUEs2ZUxaMmdLODdSdzJw?=
 =?utf-8?B?elczYzZxVFFFaWx2SWRvMFpmY3Z0cFBvendOL2RSMWtHVm1EZ0cwby9BYVhN?=
 =?utf-8?B?ajd6WlBEZHJWaTZhaEt1eVhTZ3lNSTU2Q2hsNVJxMUx6U3JOTTNyUTZHZFRG?=
 =?utf-8?B?WFRIQy84Mm1qTGN2bVVyam1Zem9sYUswWlkzS2hkclhnRHJ0Z0RPNDVBQkpv?=
 =?utf-8?B?MVVCY1FZRWc0UEVOcTExTllvUkxwNFB4Zm9Kdm84SHBzb1dpSk9LVGtER0FX?=
 =?utf-8?B?aFdIVXFFcGxGM0pDRy8wRFJTWVk1ak81Tm9pVkQ2Y01wNXIrRWlrcnpCMkIx?=
 =?utf-8?B?RUd3dGNBVHUxSlNYRUFNWmpqZVVsby9Rc201UnZxbkpQcHVoY0t2UkgxeVR3?=
 =?utf-8?B?Y25sa2d2Y241Rk9sYVVoSXlYTGFYMVdkditmL2VpaklIUjBnWmdpaFdKU1N5?=
 =?utf-8?B?OUJvRjEvZGJZS0RiWEtvZnZic1pxaW9RWUFXSzNpamZCc05BNDJ4VmVKMXpB?=
 =?utf-8?B?dEx1NGlEaFRGYjE4bWhuVlZ0cExpK0dSS2k0T293VXFnV2dtU1ZuZzU0SEF5?=
 =?utf-8?B?RTVsZ2hIcjVUcjBNUU1yZEVlVmhPQTM3Q2E2aWZWTjVySUlKQnBKK0dnT0d2?=
 =?utf-8?B?b2FUY0xhcUpOOFc1bS9PLzZWdFRzVTFmV1VsS2w0RlhmaHFxWCtGOWp1NlNZ?=
 =?utf-8?B?cnZXMEtiYi94VWpiUGYvcUd5OFNiS1RUV2ljNDJKY0pyR3VlS001UitiUStY?=
 =?utf-8?B?MkNBZllVenB3SUc2aVZJTUYxK2Z6OWF5KzZibmRYbEZUbmtpblNqZz09?=
X-Exchange-RoutingPolicyChecked: GhHUou2oxhRhkAxheDpQABwcuEGWtFfX5ARCtpVbX+c+QXzaNnfrAjcpZwA+eOq3s9azGsT5FEcJqj6oOkU4R1N+hM8hRZtog21HG07zBCJl0djhhqge/sC5gcndtSnXXZmypun5tly9GTy7gPQ78FLrGwt8b240qAxtWpsmefAYdDFyTzhOvb2g+nsKYdNfw61nygoMoZphzcFihts9IA74zrsHUPAQa7DBMKETyF4UvXkRPH5DrL19uDo0wWZvHFeO5FN//OPYU08I+OmSF70EIu2PGdmjKPY94WOUkJcMcukaP0ZuO21izbrqtDyc/EPZmg/axDhlRIq2thpwSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbaae38-a6bf-45d9-e3a3-08df4ade0fcc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:22:52.3634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csV9VSfx/40ZthE/JDlh5FhUmGyakb3G2NGpnpeqeWC6q9uIKkwdtOeF8RrGjUxPYBmfnoK4wh6Vd170aEks+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sowmiya,

On 17-11-2026 10:46, S, Sowmiya wrote:
> Hi @B S, Karthik,
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthik B
>> S
>> Sent: 16 November 2026 14:49
>> To: igt-dev@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Nautiyal,
>> Ankit K <ankit.k.nautiyal@intel.com>; B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t 2/2] lib/igt_kms: Add max uncompressed dotclock limit for
>> non-joiner mode selection
>>
>>  From display 30 the kernel limits the single pipe pixel rate without DSC to the
>> maximum validated frequency, which is below the max dotclock derived from
>> CDCLK and reported in debugfs (see intel_max_uncompressed_dotclock()).
>> Above this limit an uncompressed mode can't be driven by a single pipe.
>>
>> intel_boundary_non_joiner_mode_found() only checks against the max
>> dotclock, so on a sink without DSC support it can select a boundary mode
>> which the kernel drives with joiner.
>>
>> Add intel_get_max_uncompressed_dotclock() mirroring the kernel limits and
>> use it in intel_boundary_non_joiner_mode_found(), so that the selected
>> boundary mode stays on a single pipe irrespective of DSC support in the sink.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++--  lib/igt_kms.h |  1 +
>>   2 files changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 915c6a8a2..b28647696 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -7207,6 +7207,32 @@ int igt_get_current_cdclk(int fd)
>>   	return read_and_parse_cdclk_debugfs(fd, "Current CD clock
>> frequency:");  }
>>
>> +/**
>> + * intel_get_max_uncompressed_dotclock:
>> + * @drm_fd: drm file descriptor
>> + * @max_dotclock: Max pixel clock frequency
>> + *
>> + * Get the maximum pixel clock a single pipe supports without DSC. This
>> + * mirrors the kernel's intel_max_uncompressed_dotclock(): above this
>> + * limit an uncompressed mode can't be driven by a single pipe, so only
>> + * modes below it are guaranteed to use a single pipe irrespective of
>> + * DSC support in the sink.
>> + *
>> + * Returns: The maximum uncompressed pixel clock for a single pipe.
>> + */
>> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock) {
>> +	int dev_id = intel_get_drm_devid(drm_fd);
>> +	int limit = max_dotclock;
>> +
>> +	if (IS_WILDCATLAKE(dev_id))
>> +		limit = 937500;
>> +	else if (intel_display_ver(dev_id) >= 30)
>> +		limit = 1350000;
>> +
>> +	return min(max_dotclock, limit);
>> +}
>> +
>>   /**
>>    * intel_get_max_pipe_hdisplay:
>>    * @drm_fd: drm file descriptor
>> @@ -7340,7 +7366,9 @@ bool bigjoiner_mode_found(int drm_fd,
>> drmModeConnector *connector,
>>    * @mode: libdrm mode to be filled
>>    *
>>    * Check if connector supports a mode at the platform's maximum single-pipe
>> - * hdisplay boundary.
>> + * hdisplay boundary. The mode clock must be below the uncompressed
>> + single
>> + * pipe limit, so that the kernel doesn't fall back to joiner when the
>> + sink
>> + * doesn't support DSC.
>>    *
>>    * Returns: True if a valid non-joiner mode at the boundary is found,
>>    * false otherwise.
>> @@ -7349,12 +7377,13 @@ bool intel_boundary_non_joiner_mode_found(int
>> drm_fd, drmModeConnector *connecto
>>   					  int max_dotclock,
>> drmModeModeInfo *mode)  {
>>   	int max_hdisplay = intel_get_max_pipe_hdisplay(drm_fd);
>> +	int max_clock = intel_get_max_uncompressed_dotclock(drm_fd,
>> +max_dotclock);
>>
>>   	for (int i = 0; i < connector->count_modes; i++) {
>>   		drmModeModeInfo *current_mode = &connector->modes[i];
>>
>>   		if (current_mode->hdisplay == max_hdisplay &&
> Nit: Something like max_uncompressed_dotclock would read more clearly next to
>          the max_dotclock parameter it's derived from.

Thanks for the review. Will update this.

Regards,
Karthik.B.S
> Regards,
> Sowmiya S.
>> -		    current_mode->clock < max_dotclock &&
>> +		    current_mode->clock < max_clock &&
>>   		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
>>   			*mode = *current_mode;
>>   			return true;
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index dfcb91e02..c0565479f 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1381,6 +1381,7 @@ void
>> igt_sort_connector_modes(drmModeConnector *connector,  bool
>> igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
>>   			    igt_output_t *output, int bpc);
>>   int igt_get_max_dotclock(int fd);
>> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock);
>>   int intel_get_max_pipe_hdisplay(int drm_fd);  int igt_get_max_cdclk(int fd);
>> int igt_get_current_cdclk(int fd);
>> --
>> 2.43.0

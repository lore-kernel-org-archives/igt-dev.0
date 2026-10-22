Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E84606A31F
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 19:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MTLnAbGx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC934892E0;
	Thu, 22 Oct 2026 19:32:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E6F10E02B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 19:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792697489; x=1824233489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yVBL0Dr+c+ye/c6pBKmn+bvg9KtAEs1w8IyBGw0ngJo=;
 b=MTLnAbGxSRsadwKKDCHngHqcCCt8z62cFI4j7x5vQG4eaWx5Mv7d0slu
 DS7xFG6b1Je9a4z39ZGLrOiCu2cfianRc9ga9Z2S3RL72pW7Bu2oE4pl5
 pOY7nZJA0o8e4qvc1kRhgtPhCKiqix4PswJ5TnAp8Er5sGuTGofeyR3po
 U/pTHC7T+nnUxA7Qtg7YQiqYLqxOTRRZ8TvRsbrpMSy2KSzD06sH+p0P8
 JlYE5BxNqElGht59r6CrA6A2eGLgc3kiK313xc9BFOXVI2dzzLNPjwt2B
 RX6LwhU2Z6xs/+V68viebLumjKfzd6c8b+yRGxIAqEDUBCqlgUjUVwY0R w==;
X-CSE-ConnectionGUID: 3N/VQvv+T029xJgL8Q28/Q==
X-CSE-MsgGUID: KZK6ExQQQpmHWZXUGMFlDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1459638"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1459638"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 12:31:26 -0700
X-CSE-ConnectionGUID: IYXCYsbQTOiN2RRsKUvQvw==
X-CSE-MsgGUID: boDwOhWbSVGVLNFWtZyfRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3575159"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 12:31:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 12:31:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 12:31:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 12:31:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHD/VSOVvDspfTp7NAbqBQ/m1+Sz4NLGSNE4s7O0++el74Tyh6cs8KyBgdsaJW1yiSiUrRBGWeeiDtfkQKTHhwyHAGXS5+4H5iRrYgG4aTlXdGuiaGW4krqQ+7kvxiiVeEewcChU/2NQY6QWSvKt5ZK7rsGKZ4L7n9OuhKNLK+6SrZTaXizBRrr64lmphRh2UUK9LvJlesFO9hPhUEHJAoNrEimiLCdnqEWriBkhCuQx2XLSsL7GhxOc0PehHZg+ZU8X+oFWxHgxF8i9amJzeCBRkuIlxm21t+PQYv1BEDexSzbB74TALhVF2CcjdzBiZI7zRZdQTAm+CVEfb0EHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAjCtjvJIB8yXYF9sMjHQj0WFDPNMGu5sMWw+CBVnMo=;
 b=EEJFfZ3GAVIU0StOBeKASIcQYQZTJqX963xPYw6xtAHtjI/bD78eBgkdg2VhYU1hhyZ2Ftp+skpoHfmh2UDGoxJ6WKJaFJxnnNFpjw9o+q0sHJhMDCE8HkgmLQ81rywGAD+fNgMHyfsN8XMO9wWTBE7UC/AbYzaqeVdUs+0krTKlbjNNYYWhsKI0OnZBPwcGJYjxYipaOJT9RO7/xgM51mhCMLZD0CUgW71Osb8eYMiamrY8oLN1h5PAoWCl+jMQHrKRnXsB8cqWuKsRMzyv3qU+UtFvhNfurF1NG8TGd8Wt0G2GL5rs5UHCN7faU+rs7hlU7Rtoi12m3pPJE5ceWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Thu, 22 Oct
 2026 19:31:20 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:31:20 +0000
Message-ID: <5bd1bcf1-31a9-4dd0-bb32-5f6cf18e5f5b@intel.com>
Date: Fri, 23 Oct 2026 01:01:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] lib/igt_drm_netlink: add event notify
 subscription and event wait support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-9-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261013190651.897241-9-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::11) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9391d1-17de-40d4-09a0-08df30730c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|6133799003|18002099003|10067099003|22082099003|261021121427099003|261022113327099003|261021135927099003|261021123027099003|11063799006|261009223027099003|261022105027099003|4143699003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: f/czhjsNwJZAWND8lWaCxP6GOkUmjqcU1I2tcAZXt6dWAvYDshIEetk3F6gb/izCOH4FHggsb1W2rmJTHjYLiDXufHcvpFhyi4ECQPPemfQREj1W1RfGQYTyQWAlmsQWFzb+zWHRLYJSGW4d4uvvEhbKwlFufEKpecQh9/6CEvDJhlmUh9Lgprobba33A0CcaR1B4VAyfxwvp8EOyZEHfAx1mUULBlFr+rLl1+S2JXE7XL9HOMFO0ux4OTCNl2k0PevYbQaCAEJQitkGTSTfeXYYvkVcQBrZooupf34NisY6wjwVtPISxGuKIYEW73UCp2xLoGE6qVIMFwDibeAuHWdLx0xBt6FghvF7EpTjCQ4xjbpek4CALmK3FNTn1whZQ7IFCsrqc8KXiNKLyyQAdLZsGbABcdy0xI1SG+vfH81mV1aJo9UxfViLY+L3jd4mGWtE29978dNQLoga60NEAJhS3U0WQocmX2tkUXXtgw2akR3muhveg4bxwP54amjOphNwyfk9aFUpfhOG1Kp3SMsgcs6smcM6Yq8n0R+y4SY9ZrRxvCgmZ9rCLgHkF4TTF39RWPUViQl+Rf9/n8UBZIW3c3vNJFlDMLbqwp1TAaC0ePOiREuP1hfPMd/gMxLnuAq5u6KFpoEqGX5frHml/rQn4uf/ywQcVXmGoCRapdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(18002099003)(10067099003)(22082099003)(261021121427099003)(261022113327099003)(261021135927099003)(261021123027099003)(11063799006)(261009223027099003)(261022105027099003)(4143699003)(56012099006)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGNCbjgrM3BwQXVORnJMT0lyV1JWd3dNS09JV0lwNGJoUktpV2VrMlc2SEky?=
 =?utf-8?B?bnhxUmQxd2ZrSFkweTlBWGptdXBTblVZS2tGRzVvY3ZkTU16SStDMVZ5RUM0?=
 =?utf-8?B?YzBpNG9qY29jeFQyRXcvb1VvbWo0TTJlZWNVa0k5ay9iRHhRTGhFL0tzS1d2?=
 =?utf-8?B?ZDdOYmtxMmVMVGVxbng4TXRIL3JjVXI4a081MUc2N1VFRVJZejdGZ1dxUWZX?=
 =?utf-8?B?VUk0U25mVHBHVGlRWnZjYnhjUkZuZXdjODB5a29sdE52eFA4U2J5WkRjN29T?=
 =?utf-8?B?QXVJQUU3eVpOR083RncrNURyVTY1U3pIaHhVSStiRGJrU2FrQ3hFVmozTFBX?=
 =?utf-8?B?U0FuTitOakdnWlFwTkxGOGZ2Q291YnlURGZDWWxacDA4SEUra3BkQ3lPN0Y5?=
 =?utf-8?B?UXFyc3Y5LzNvMFZqNGRRUnJwMXhQZC9WTTg3eXF5YTlsMTY2cCtIOGpVYjFJ?=
 =?utf-8?B?ZTRVMkRIaTNhS1B3TWdOZ0VGWGxvUWpDV1lhZjRLQjJoVHhPYWZ4eG1mWXJP?=
 =?utf-8?B?NStKTDhmM0VVYUduNUhkME1kWjBockJES2dxYk9VNUlNLzJrWXRNT2xUNVdC?=
 =?utf-8?B?SWpvcmVQZE1HVmhpSXdLNmYvMHJQQUwzVC8xcll6aEJlRWdYOG9qUysrcEJ4?=
 =?utf-8?B?N0pLamhEMmNGeU4wajZodzk3bUJoTGxSQ0FXaFJIOGV5T3RsZ2tNa1MvaTZZ?=
 =?utf-8?B?YzVxeXVoMnNvMjNLVWtxSXdUdE1oRXg5RjdNQXk0VlVZbmJRVHFSWXBUQ2Y2?=
 =?utf-8?B?U2dqTmMzQXErVkZmNGQ2ZG1kelpybmIvTXF0QjNpSWluVlZDMjhxWWE0R2Fi?=
 =?utf-8?B?UlJCTVF6VlFSWkVLWXFMaGlITFplQWdoMEtXZGRHaUtFY0laNmVYRzFaUG4r?=
 =?utf-8?B?elhYMjdnRDkvK0pia2orL0dGaVQ5NDdaQWJLSGt5TXcxZ1FxZlR5WkJNdW5h?=
 =?utf-8?B?NTFzMGhTQzZIQ3F2NkhPclFjQUk1ZkN0aDZYcDE4M2ZsTTRIMWsyaVdtOTlF?=
 =?utf-8?B?eXE1UXJtSkR5Z0l0ZzZCSXFpM0hDQy9rNGxzcnRYV1M3dkpRZGRFeHM0bnB3?=
 =?utf-8?B?eGt6ZGlsSHFTZGk0RE9CYkhjSmRSZ1BBckpEd0RrclBYdHJhaVBqQWxxQlVl?=
 =?utf-8?B?U0w1ZTNsMXlCNzRJVU93OVg5QXBCTFV0bFNjS1JpSXZxcE03U0xNYU1xa1By?=
 =?utf-8?B?R3VBMmRRejNHa1JWVlpaUExMZHBNMWJYckpKTHRUQXo3emt5cjJJd3ZncDdO?=
 =?utf-8?B?ZURiZFEvejAvd1AzNmg5SzJVeG1TSXVFMGxEbnV1bGdKUE9jYnFMVHBkY2J6?=
 =?utf-8?B?dm0zQ2ZIcW1IQ3FkaFdMMWl0blJmY0Vkc2xaVVRWemtUQXZ4dEFYSU0zcDh0?=
 =?utf-8?B?dkJFUXFZS09RUGRBTHJlMll2c1YrUU9ZQ2JaZlBBWEEzb1Y5MlpVckFrd2l6?=
 =?utf-8?B?QzkzN1VWQ01SSmYzOEtWNjNxR1lTNzNHeHdUdzI4Q1dQZytDZ3J0NjZiRGQy?=
 =?utf-8?B?cjE1QUJJVnkxU2V2cStqYm5yN3ZjVU9nUlJzMXFoVG9kbE5remljTDk4ZThD?=
 =?utf-8?B?Wnl0c0ZuL0tCSlV0WTY4WHh1dU4xRWMxRU42Wk16aExyL1RhNHBJWCtPaWJv?=
 =?utf-8?B?R0FZTzZEWDVrS200TSszUk8rWVB3TnFLeWg4dG1MTlkvZHJhMEs4cExuNk5x?=
 =?utf-8?B?RzhERndvMEZPcFZLK1JocDJSTUFoUGhhVE80QnAzSkJwWmY4MCtYeTJIR01D?=
 =?utf-8?B?RTZQOFZTd1NTWUNYRVdRcHE1M2xxanJmWXVzcVM0Ni9ZcVNjQU8zeXFTZG4z?=
 =?utf-8?B?V2UrUTg2c25ZMWNJUTl4M2cxMElUaFNySnUxSHhIT2U5ZEpDKzJ3NlhiTzUw?=
 =?utf-8?B?M2RwNGVTUGRTQ21Qb0pFQ0U1dmhST2JGazczMSt5U3FKOG9YNjNORS9OUUts?=
 =?utf-8?B?a1doaWtoMzQrSUwyV1h0cnV6czVQckxTdjBsWnVTUFM3N0xsK3ZPSVBXbmFj?=
 =?utf-8?B?K0tuTjZuaHNOUGYrUjI3TkdkMWtUclpNQ3VGZ1RGY1lYV0tJdGVBRm4xbmVK?=
 =?utf-8?B?RVBteFd2bU8vWkR4Qmd6Mk1GeFBvUEFhM2NJWlJFRlI3b2F3NExMbElRdGp2?=
 =?utf-8?B?MDZTRURRZTRqTjNwa0VSb0haWUZjWGxVYmFEVEkvUVZVdzlNaXI0MEtCT0d2?=
 =?utf-8?B?TDYyZ2dzZEZ6cVhDTFlkc1VocTA0alpuN1k5NUVIUng5YUk1RWNCU28ycTly?=
 =?utf-8?B?K2NrQlphdm5iUkVPNEVHaWZ4ZWh0VWRTdzRhSHNvMjVwclhDc1FBMENPdFBq?=
 =?utf-8?B?UjZFTEpFeW1mak01RUV3b0M3QW4rTFpZcGFIQVlvV0ZDbDRXY2lBSllIZ3lU?=
 =?utf-8?Q?1Yd59x74yrMBgcOU=3D?=
X-Exchange-RoutingPolicyChecked: Rzg1V9rCY9SZU3rigWF0v2oULecuZdgthPzbe3FsqE3aoaGI5f48OYSKemr4/mNalJluPUhYMvQq4bjOtWBWByl1FPYbWVUDO29QHrhwAPvB0Koa0HSdiJ/6UL8m098IXE/9ik8Ra/SBGScluy6sMbTymnNLEGWatHVKmZ6g5ZQIwaNOr31WtPmGuAMqDyiXnap/EhTemgv3/vcYOk0YJRIYhnK4ubWFMa0i0dSzDi9dF+c8Z3EFegAmfoMPwOg71lHpMv5iPFfW5NVugkferwU4kvKCI+jEsE4HFle7rjmnakpiOakaCW9yrjszV+rkocCY6lkwfASLd79bVK3vDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9391d1-17de-40d4-09a0-08df30730c8e
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:31:20.1127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YzOLAuth6wo/ZQaCmsB3gRglTCl5EbyRgMXpmanKOHs3OPMJKlsMRqAw9uq7Lu7Ol0dxOFhtQF0NJfN6Dx/hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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

Hi Ravi,

On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
> Added event notification support with subscribe for an error-notify event
> and wait for the event notification functionalities.
>
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v5:Added a guard to prevent duplicate multicast group subscriptions (Soham)
> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>     Jani & Kamil)
>     updated error event name from error-notify to error-report to align
>     with the latest changes in drm-uapi/drm_ras.h
> v2:Handled SEQ_CHECK nl response using separate callback
>     Added monotonic-clock deadline to wait for messages without exceeding the
>     caller’s total timeout.
>     Added support to receive events until it sees an event whose node ID and
>     error ID match the requested values.
> ---
>   lib/igt_drm_ras_nl.c | 182 +++++++++++++++++++++++++++++++++++++++++--
>   lib/igt_drm_ras_nl.h |  18 +++++
>   2 files changed, 193 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> index 94fcc40ac..c5f1a1a3f 100644
> --- a/lib/igt_drm_ras_nl.c
> +++ b/lib/igt_drm_ras_nl.c
> @@ -6,6 +6,7 @@
>   #include <errno.h>
>   #include <poll.h>
>   #include <stdint.h>
> +#include <time.h>
>   
>   #include <netlink/errno.h>
>   #include <netlink/genl/ctrl.h>
> @@ -62,10 +63,12 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   	nlh = nlmsg_hdr(msg);
>   	gnlh = nlmsg_data(nlh);
>   
> -	ret = genlmsg_parse(nlh, 0, attrs,
> -			    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> -	if (ret < 0)
> -		return NL_SKIP;
> +	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
> +		ret = genlmsg_parse(nlh, 0, attrs,
> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +	}
>   
>   	switch (gnlh->cmd) {
>   	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> @@ -85,17 +88,47 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
>   		break;
>   	}
> +	case DRM_RAS_CMD_ERROR_EVENT: {
> +		struct nlattr *event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_MAX + 1];
Please declare event_attrs with the other local variables at the start 
of ras_command_cb(). Could the existing attrs array be reused ? Although 
in that case, the shared array would need to accommodate the larger of 
the two *_ATTRS_MAX values.

Regards,
Soham
> +
> +		ret = genlmsg_parse(nlh, 0, event_attrs,
> +				    DRM_RAS_A_ERROR_EVENT_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +
> +		if (!event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID] ||
> +		    !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID] ||
> +		    !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->event_node_id =
> +			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID]);
> +		ctx->event_error_id =
> +			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID]);
> +		ctx->event_error_value =
> +			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE]);
> +		ctx->event_received = ctx->event_node_id == ctx->node_id &&
> +				      ctx->event_error_id == ctx->error_id;
> +		break;
> +	}
>   	default:
>   		return NL_SKIP;
>   	}
>   
> -	ctx->reply_received = true;
> -	if (ctx->ack_received)
> -		ctx->cmd_done = true;
> +	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
> +		ctx->reply_received = true;
> +		if (ctx->ack_received)
> +			ctx->cmd_done = true;
> +	}
>   
>   	return NL_OK;
>   }
>   
> +static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
> +{
> +	return NL_OK;
> +}
> +
>   static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
>   {
>   	struct igt_drm_ras_nl_context *ctx = arg;
> @@ -157,6 +190,27 @@ static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *c
>   	return 0;
>   }
>   
> +static int register_multicast_callbacks(struct nl_cb *cb,
> +					struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM,
> +			ras_multicast_seq_check_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_SEQ_CHECK callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
>   				struct nl_cb *cb,
>   				struct nl_msg *msg)
> @@ -299,7 +353,12 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
>   	ctx->ack_received = false;
>   	ctx->response_required = false;
>   	ctx->error_threshold = 0;
> +	ctx->event_node_id = UINT32_MAX;
> +	ctx->event_error_id = UINT32_MAX;
> +	ctx->event_error_value = 0;
> +	ctx->event_received = false;
>   	ctx->family_id = -1;
> +	ctx->subscribed_grp_id = -1;
>   }
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
> @@ -440,3 +499,112 @@ int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
>   
>   	return 0;
>   }
> +
> +int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
> +					  const char *notify_group_name)
> +{
> +	int grp_id;
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0 ||
> +	    !notify_group_name || notify_group_name[0] == '\0')
> +		return -EINVAL;
> +
> +	grp_id = genl_ctrl_resolve_grp(ctx->sock,
> +				       DRM_RAS_FAMILY_NAME,
> +				       notify_group_name);
> +	if (grp_id < 0)
> +		return grp_id;
> +
> +	/* Check if already subscribed to the requested multicast group */
> +	if (ctx->subscribed_grp_id == grp_id) {
> +		igt_debug("Already subscribed to DRM RAS multicast group '%s' (id=%d).\n",
> +			  notify_group_name, grp_id);
> +		return 0;
> +	}
> +
> +	ret = nl_socket_add_membership(ctx->sock, grp_id);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->subscribed_grp_id = grp_id;
> +
> +	igt_debug("Subscribed to DRM RAS multicast group '%s' (id=%d).\n",
> +		  notify_group_name, grp_id);
> +
> +	return 0;
> +}
> +
> +int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx,
> +					       int timeout_ms)
> +{
> +	struct nl_cb *cb;
> +	struct pollfd pfd;
> +	struct timespec start, now;
> +	int remaining_ms;
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0)
> +		return -EINVAL;
> +
> +	if (timeout_ms < -1)
> +		return -EINVAL;
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb)
> +		return -ENOMEM;
> +
> +	ret = register_multicast_callbacks(cb, ctx);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		return ret;
> +	}
> +
> +	ctx->event_received = false;
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	pfd.fd = nl_socket_get_fd(ctx->sock);
> +	pfd.events = POLLIN;
> +	pfd.revents = 0;
> +
> +	while (!ctx->event_received) {
> +		if (timeout_ms == -1) {
> +			remaining_ms = -1;
> +		} else {
> +			clock_gettime(CLOCK_MONOTONIC, &now);
> +			remaining_ms = timeout_ms -
> +				       (int)((now.tv_sec - start.tv_sec) * 1000 +
> +				       (now.tv_nsec - start.tv_nsec) / 1000000);
> +			if (remaining_ms <= 0) {
> +				ret = -ETIMEDOUT;
> +				break;
> +			}
> +		}
> +
> +		ret = poll(&pfd, 1, remaining_ms);
> +		if (ret == 0) {
> +			ret = -ETIMEDOUT;
> +			break;
> +		}
> +
> +		if (ret < 0) {
> +			ret = -errno;
> +			break;
> +		}
> +
> +		ret = nl_recvmsgs(ctx->sock, cb);
> +		if (ret < 0)
> +			break;
> +	}
> +	nl_cb_put(cb);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!ctx->event_received)
> +		return -ENOMSG;
> +
> +	igt_debug("Received error-notify event: node_id=%u error_id=%u value=%u\n",
> +		  ctx->event_node_id, ctx->event_error_id, ctx->event_error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> index 5c9be5b17..057c6026f 100644
> --- a/lib/igt_drm_ras_nl.h
> +++ b/lib/igt_drm_ras_nl.h
> @@ -47,6 +47,21 @@ struct igt_drm_ras_nl_context {
>   
>   	/** @error_threshold: Error threshold value to query/set */
>   	uint32_t error_threshold;
> +
> +	/** @event_node_id: RAS node ID reported by an error-report event */
> +	uint32_t event_node_id;
> +
> +	/** @event_error_id: RAS error ID reported by an error-report event */
> +	uint32_t event_error_id;
> +
> +	/** @event_error_value: Error counter value reported by an error-report event */
> +	uint32_t event_error_value;
> +
> +	/** @event_received: Set when a matching error-report event has been received */
> +	bool event_received;
> +
> +	/** @subscribed_grp_id: Multicast group ID currently subscribed to, or -1 if none */
> +	int subscribed_grp_id;
>   };
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
> @@ -54,6 +69,9 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
> +					  const char *notify_group_name);
> +int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx, int timeout_ms);
>   
>   #endif /* IGT_DRM_RAS_NL_H */
>   

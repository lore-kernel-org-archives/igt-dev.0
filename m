Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FC3CAC5B8
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 06:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E5310E26F;
	Tue, 30 Sep 2025 06:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0RYN7Is";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCFD10E26F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 06:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759213423; x=1790749423;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=ezMyqckUC1SrQfEc+QxZzL5sRN3Yd+rKOSr7ZVG8pH0=;
 b=R0RYN7Ismwys5y15B5iceRdnS0GbvoPHfqUfLm1Dix4FJiOhmeTVhaA2
 xn7+J7fnFfyXzXVylpU5rYK3S/SN83daaHj0AAJ9CPvPFgFLV24DGt6k/
 EK3QxuQW3LF8aMPwl0CjS/ZFMOsxQoZ2bZA0zAj8t7R1ibpU6gd2A05fd
 hoNF2s6sn9GwqQTDo8u+6YaykyCIqYLO81xnZVkexRyONtxaTMvOA3vyI
 qP8wIWyQhpAhCuNYuypLrTWJGGKWETxtZGM+Etz/CI2nzy4mUFkTgdkGH
 q6nPPLRvwjByYJN1OjZk3oVaiuqpjXGzqoJ7m83JhN/7XAQ9u/oO0jkFj g==;
X-CSE-ConnectionGUID: 0uX+sJKVQ8WDiGSNE6lWQw==
X-CSE-MsgGUID: IK9/u/qRS8S3YBZWvLyOvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72141226"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208,217";a="72141226"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:23:43 -0700
X-CSE-ConnectionGUID: IR8akD6DQs2ykUzjyePBgg==
X-CSE-MsgGUID: +0Zz7VLpSI6XbbHd5Dz3+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
 d="scan'208,217";a="178462418"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:23:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:23:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 23:23:42 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:23:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/Du0WnuY042ItgBL2Oi8ibN4Q+cr3n+4dqYwm/BrokGbD5L97bfPGJjVlr1w5tj8aPK7dKnQLXMArycrNVLDkE3g44nTGvtSU3mRi3MTVDCz+mEHJyHuCERNNY1GAFWLPUNnrXtN4cxc1lqFZ19G7dRf+iCkdaEB6FIZeLh6w4Xtk8p6ju7xEbuZb7moAtK8NmfAZITPS1ELtBucI8rBcpSfy86eFfLHDMrLnr6WzWHN9F7nLsQrtKKo7VFY9/A8YT9cznUtJoBrLmSSqgpmnqedrtAUchSy+Epr0M/SKiethKwP8zu+aMEFvbQYqrou0VOXkEptcspAxEgElplng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66Rzxw/9oQxzJAWaNTTnhhq1J8mBT64lJ0hsyz5j6Sc=;
 b=sSuPVeU45O7zRMTHuAOmUfFnmPcVNfEWS9KBsCUcYF2UXqWZGi/ASILZzExD+r35y2ATU/R25f93oYridGr2VaAFNMrDMguQwOg19kiYLKTTPR2v4+dDhNp7vUC8M1mhU1s1L//upiUGtjowHtNckx4cGrybwQsuBaSHS1s+CA3X3IVCulUQyv2Fon0WMHiT9Moeq9bmhuRpNqjfnR3YS1hKUHslL6kb8Aqful0K2se6kA4Ua/FLMeqEclk2GDRj2LP5JME+cMg8a2v6KKAc9DKOfShqueUV8mRJU5HtRuV2C9Qbcg2e5RQ4MQx8G1sfLc8CeFQONvohXaqXfBuczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by DM6PR11MB4690.namprd11.prod.outlook.com (2603:10b6:5:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:23:39 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::e656:9300:fc6a:1b5a]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::e656:9300:fc6a:1b5a%7]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 06:23:39 +0000
Content-Type: multipart/alternative;
 boundary="------------9opqpRnxwChl9CkGSzjdSlDL"
Message-ID: <36005d18-1bf7-4f77-b74b-8966f8ab0d19@intel.com>
Date: Tue, 30 Sep 2025 11:53:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend idle
 test case
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20250918190105.37420-1-mohammed.thasleem@intel.com>
 <20250918190632.37576-1-mohammed.thasleem@intel.com>
 <DM4PR11MB63120CA419902E603E263AB7901DA@DM4PR11MB6312.namprd11.prod.outlook.com>
 <PH0PR11MB4806051740CAB94BC07B8CBDE41BA@PH0PR11MB4806.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <PH0PR11MB4806051740CAB94BC07B8CBDE41BA@PH0PR11MB4806.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|DM6PR11MB4690:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c2d359-c509-45eb-37a9-08ddffe9e532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGZESFZWQzhOcHNzS0tENEF1VkVYdTJ5MHhVMFp3aW9jYU5BOTVwS3E5RUQx?=
 =?utf-8?B?UittVkFsREdzeDlZMmh1ckN3dzVnR3hHR01vcHk1OXVia1IvVlJ6Rk1ySFpH?=
 =?utf-8?B?WmZoT09rdlUyZTcrSlNtdUxob3kzNkF4ekd0V2Z5R0dIQ3BMUVNaN1JrUmY3?=
 =?utf-8?B?YUZkR2taYTJOWmdXNmhIaVlpNXRwTUNWaGlRTktGT3h6eFZvZU9QYjloMU5W?=
 =?utf-8?B?SHUvY0tVUHZvZVFEaDNSdVBjUGhEMTJibk9tbUlBclZ2N1FnUitEUWc0WUFn?=
 =?utf-8?B?TmNGR2t6OUlCZ1Jab2tUSVZOS2VlWmlMOVU4VTZ5Rks5THdkWmk0QjAvOStB?=
 =?utf-8?B?SkNyN3FDcjVXZnpQV05TUG9Da2pjMFJZdGxwNGZGb3cwKzlPSUgzR2dENklE?=
 =?utf-8?B?cnU0djU5ck1kNTUrUG5KNHErbDM5WDNVQmxNT3FaTzY1Q0ZTV1I2SXhaOWxp?=
 =?utf-8?B?dnJvTEhrOWxlNFVnTWRkMUFyYzdDdDZqcXRrNUplQUkzd0t1TGZ6WlpDdW9C?=
 =?utf-8?B?RDhDY3VPZjhpTGJlay9mZkVxWjJBV1FIeG11S3JzQlJuNjg5MGRnMlg3Wm1k?=
 =?utf-8?B?WVpaOC8yNGxCMDMrODI1Yjh0TVhaVG5rdC94QWk2dUt2VDNpZWVlSXB0ZnA1?=
 =?utf-8?B?ZzVuclR1Z0J0N09CZ2R6ZUpBSXBqQytCckwrOSttemFpQzRham5JVDRmZmRs?=
 =?utf-8?B?R1lLS21PdWVuRHpGd1J4a1VLWVJMYmVhWGR2RFRCcmcwU3FsNnVYaG9RRUhw?=
 =?utf-8?B?UXd0OWdCSG5tVXFUb0xJWktEaENycDM1bFZFRzN6bWZmam1EazRDNGxINDVJ?=
 =?utf-8?B?Rlg1cFZZb3BYa24yQWU3WHFEK1pjeGZORVI3eGF6c2xmMzUwNHNRRk9xTlVU?=
 =?utf-8?B?UnRBTzN5STBlQUsyOGIwSnJoM1FsZzRPazlRc0k2TExvWTVaamxSZFZqblRW?=
 =?utf-8?B?T211blNvT285RzA5dE1tcEMxN2VJd3E4VEJmeUF1R3FMSHJwQVE2RFJhU1lM?=
 =?utf-8?B?bnV4eEhRYk5aL09YbFgwSTBycUp3Y2xORVJtRStzNFNNcmVXcDJHNjBVMWZH?=
 =?utf-8?B?TTNZWGI2NGc0cjBhbStxL3dSbzFXOVlHQTF4bVU2cFhVVlVSQ0sxQlNHbXM5?=
 =?utf-8?B?cEVEMGhTRDlXVVZPalRpSTR5RUxWQWQxenQ1K01lRmk1cHlUT0U1aFNoSU9w?=
 =?utf-8?B?WHRHZ0tVR01vamdYOEZXUHRYeXZ0R29VU1JRQWdJS2tHLzhGLzJRRWtXVDNO?=
 =?utf-8?B?QThTQ0ovelAxblhLb3BtL1orMElPdTcwNndkTithMVc0RDExN0lWRU9qSkNW?=
 =?utf-8?B?OXhvYy9tMTdyMGgxVER1MFc4UU55QTJzQzNHTVp3ajJUeldmZVpzdXRrRVBK?=
 =?utf-8?B?MHVlVlJhWWx2VUhVK3liM3ZpQ2M5bllzcXByQ2pPSThNWWVZNlB0ZEw0UlF2?=
 =?utf-8?B?bFZzTG1oenJ2S1B0WnF0QnNBNmF4RjVpeGorVVRQNUdoY1hMbENCa3NZMHRX?=
 =?utf-8?B?WEFUMnV1NTg0TlpDeXBqWWsrK0tGOExHTTFmT1I0R1JSUkprOERBSlBFcEp1?=
 =?utf-8?B?aVdQbjMwVHRsVk9ablgxU0hOL3NIS05sdHlBSHhxUW9LTG1KRlVGdCtPcW1T?=
 =?utf-8?B?cXB1ZExhWTBiWWVpSU9FeEtMdWlVQkJ5ZnFGMnN2UzBjZTBXYzJFZ3R6L2VV?=
 =?utf-8?B?Vk1aU1FFaHFXcXMyWVM2R1h3WWZqRUxCR1dqbHpUK0VpeUFyS2xGYTRQQmRG?=
 =?utf-8?B?RUEwQzFjblc1c0dUbVFzK0YxZE9qemFwcDhHRVJrT0NRL2ZlbnJPOUlpb3pN?=
 =?utf-8?B?eWtxNVNqdmNyRlE5aEIvUmdoZGNlSEdwdGkwclBTbVhLemNyZzgwZ0lpNjVP?=
 =?utf-8?B?Q0U2TENNSDArcUFnOTJwZHVaUkFVa3EyekhPeENoYXl5d21YL0RSKzBsc3Iz?=
 =?utf-8?Q?djGaDC0mc8A/bQ+rsgplyI7sSjQIvyTP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFVJYVlYRFRrME13NTk0bmpKMUIxZzhNZGkwWWdNVHJkMEpXbTBmZ2JwVVlI?=
 =?utf-8?B?alMzTGZEWGRxSWl6YmlWNHlvbTlGWkl1SFpub0dkZ2ExMW9wWDlSNERiMVlZ?=
 =?utf-8?B?Tm44dHdaTEN5MFhsSXNWT1drSG1IdEFZamhmd253SnNQUUtUUDh3OUVwMWsv?=
 =?utf-8?B?azBKYmFTM1J6bWF6SE5Benpud2NsYXJUa2dtMnJBSHllT29mdjFpbmNLZkFu?=
 =?utf-8?B?bmxnVFY0TThEUjdkS1NkZFhxelNMUGhMMWE5R2Q3YjlLakJ3dFFERFNrRnpl?=
 =?utf-8?B?UnhpYVY3am02dnBEN2xpc1FmeU5aOFNITFU4am9UcUxSTnJLUWp5aUswS25L?=
 =?utf-8?B?eHFyT3JUWWoyWnA3OXlTL2Zha0cvZCtBSTJaYTFFN0lRbGFzeHVQMGxxZ2xo?=
 =?utf-8?B?aG05MWpucVJtU1RDUEcxbFhGa2NMbUpnbno5RzNoNEdocjhPSHFZdjZpWWlm?=
 =?utf-8?B?R0xDcW8wNVhOYm9GMHFQeGk3WlBCWFhweTU5amlqZFZXcVR0YlNDUUxtelNp?=
 =?utf-8?B?QThCK2dlZDF4R0V2cGllQitMSk5Zd2VGTXJWWkEwTUFXV1VUVFpUa2hrcTJT?=
 =?utf-8?B?RlZ6OG5yR3pja0Q5Ui94YXpPY0p3MmwwU054SEZKWnV5UWZhTG03REtTLzZr?=
 =?utf-8?B?UGZJZWVUSWFLRjBHU0FiS1lDVlI5dDg1bFRCcDB1M25SRDU4TUVodVZIMTAw?=
 =?utf-8?B?RGhpUjFwNlBJcDRsR2VQdUpBdUxjSStEbXkwenY3U1Z1U1hPTjVqZmdxR3JH?=
 =?utf-8?B?ZE94SkMzNlNXcFVKYURiN3dFVTRDajYvVVByY3dEVnBqZVdCSnhmc1JUbGJz?=
 =?utf-8?B?NisvNXhyL3RtVXpScmJHbmtJN1M4WFQ0bTlqdjhENUxtQVZJSGlPeHduYmwy?=
 =?utf-8?B?ODE4cFBCK2pKYy83QWtoTWd4cVNjWXQ0a0hPY2hwWVppdWcrTWJUVlJJQkxi?=
 =?utf-8?B?OVRRa1pyc2JwM0Y3RnBqWTkyeXpHOFlmV2JIcytmZm1WazFEbFVoSElkdFpp?=
 =?utf-8?B?VGZYQUkrY0hoNEMyT0dQVGFyMWdGZjdFRlVvbm8vd1JTelRyNDBNbk9EMXNI?=
 =?utf-8?B?ckpoMDdoR0lFUnpTTjlBVndMbU1JM2daVXprL2ZZSUFtMlVKY1hkV09LWkVm?=
 =?utf-8?B?bTdyVDhuNm1aU2lhZVlXM0FIa0luR2VBWmVHVkI0Ny9hZDF5NGdRT1NIKzBX?=
 =?utf-8?B?RlhjRnhScVhDS1pqeUhjS1JGRTZzMkRSZEV2S0pkRUpQTEs4RHd2T3BvUndN?=
 =?utf-8?B?Ym43MFdUVDhrNjVhV2F1cHZvRDU3VzNBbVVnMWYzZ2c2ZDFxZTc5K0NMRWly?=
 =?utf-8?B?L1JlOFNEbmRhYzhtWUk4aCsySXBLakJEdnlqM0lUUGFTVk1UaW91cTFhZkVX?=
 =?utf-8?B?MDVKWk5MUHQ5VENCUUVvWnpzUmFhN3ZMejVwRFFZZ3NCYUNITTc4YThEQWt0?=
 =?utf-8?B?d28wVG1mUWNRZUFoVkFZL0pUOXQ5VnZ4REllaGhFSjdrbklFVnAwYVM5eitX?=
 =?utf-8?B?Qm9rMFkxVGIwQkZkNmZxd3Q1WjdDZ3hQUWZWeUt6K2JXaTl6ajRzMGdmR2Ra?=
 =?utf-8?B?RHBnR3RKZGtUTDVnNjdDRWYyNlpKSTE5Z09EdTdtVS9YYUVyZllTdjVSWDIz?=
 =?utf-8?B?UzArd2h3ZHJWM3UyYWlaZ2wyZTYwUTJENWFHbXhPaUdZZFlJa0RnbmZidm44?=
 =?utf-8?B?MHFncms1a2l2NkV0N21lVGRESkJOV0tJZnVKcDRBQWtQRGdCSlJoMU8vZjYw?=
 =?utf-8?B?SndSQXVKMjBSSy9JUVAvcXViSlZNR3JmMnQya25EZ1ZCZWJDbFhmNk9KV0ND?=
 =?utf-8?B?SElkdU5PSzFVZmdkYTk3WUtiV2V2VFB4YnFRbmF3ejc4dVRLZ3pBbU1ldDQv?=
 =?utf-8?B?Q3krTjdSTFhXWHVTZzRtenZpcWZDSVFOL3hldkZ2cTFvUmQyMGtJN3ltSXdX?=
 =?utf-8?B?cDNVMHhQSEk1QUI1Z01oMXhsamRucWkxcUEvODNvZmtHSk1lUHBXUCsxZEx2?=
 =?utf-8?B?aVJQSXcxUFQwdjhZMnhMYVpmbjlRc0MvZ0E1enBHSUM4Q0FOVmdkMndkYkxL?=
 =?utf-8?B?YlkrVTlTWWpsZXh1UXlPeU9aRWxLNU5kZnRKT1NGNEh4RjFFYWxIdFpGU2FF?=
 =?utf-8?B?UWtqUEc0YmZaSlVUV1dFZFRZYjRIY2MvcktRZXZqU0NOa1dYdFdyRUxKakV2?=
 =?utf-8?Q?Qih9KNxc1nu+tetkZrHCUvu9Mfrg4lePlcYl2LX4VC0P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c2d359-c509-45eb-37a9-08ddffe9e532
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:23:39.8264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZJM4B6NZe2wl/sBtTLFod16Wum0/g957nH9FJCv32+7C/w/7mOawoWnN0kCUxI+mLgSRntjYw8338xx65pqMPdUVfqnNIxDovesFPh5pkfItiHS665F87Ask1DDAONy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4690
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

--------------9opqpRnxwChl9CkGSzjdSlDL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 29-09-2025 15:52, Thasleem, Mohammed wrote:
>
> -----Original Message-----
> From: B, Jeevan<jeevan.b@intel.com> 
> Sent: 23 September 2025 11:11 AM
> To: Thasleem, Mohammed<mohammed.thasleem@intel.com>;igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed<mohammed.thasleem@intel.com>
> Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend idle test case
>
>> -----Original Message-----
>> From: igt-dev<igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Mohammed Thasleem
>> Sent: Friday, September 19, 2025 12:37 AM
>> To:igt-dev@lists.freedesktop.org
>> Cc: Thasleem, Mohammed<mohammed.thasleem@intel.com>
>> Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend
>> idle test case
>>
>> Added a new subtest that tests S0ix (suspend-to-idle/freeze state)
>> functionality using SUSPEND_STATE_FREEZE.
>>
>> This expands power management test coverage to include modern
>> low-power idle states for comprehensive suspend testing.
>>
>> v2: Update subtest name with system-suspend-idle. (Kamil)
>>      Update the subject title.
>>
>> Signed-off-by: Mohammed Thasleem<mohammed.thasleem@intel.com>
>> ---
>>   tests/intel/kms_pm_rpm.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
>> 344ef8c94..1610404ff 100644
>> --- a/tests/intel/kms_pm_rpm.c
>> +++ b/tests/intel/kms_pm_rpm.c
>> @@ -128,6 +128,9 @@
>>    *
>>    * SUBTEST: universal-planes-dpms
>>    * Description: Validate universal plane (set/unset/change) with dpms.
>> + *
>> + * SUBTEST: system-suspend-idle
>> + * Description: Validate suspend-to-idle (S0ix) functionality.
>>    */
>>
>>   #define MSR_PC8_RES	0x630
>> @@ -1685,6 +1688,9 @@ igt_main_args("", long_options, help_str,
>> opt_handler, NULL)
>>   	igt_subtest("system-suspend-modeset")
>>   		system_suspend_modeset_subtest(SUSPEND_STATE_MEM,
>>   					       SUSPEND_TEST_NONE);
>> +	igt_subtest("system-suspend-idle")
>> +		system_suspend_modeset_subtest(SUSPEND_STATE_FREEZE,
>> +					       SUSPEND_TEST_NONE);
> What are we waiting for in wait_for_suspended state, is it same as SUSPEND_STATE_MEM which wait for Some dump/check pc8. what is it we are checking for FREEZE we need to provide more info description if it is same or define the test little bit more.
> 	-->SUSPEND_STATE_FREEZE tests suspend-to-idle (freeze state) which executes suspend/resume without entering platform deep-sleep (PC8/PC10),
> 	     unlike SUSPEND_STATE_MEM which enters full suspend-to-RAM with deep power states and wait_for_suspended() waits for kernel suspend
> 	     completion - for MEM it waits for deep sleep with PC8+ residency validation.
> 	-->Will update more details at description while merging the changes...

Looks good to me.

Reviewed-by: Dibin Moolakadan Subrahmanian 
<dibin.moolakadan.subrahmanian@intel.com>


>>   	/* power-wake reference tests */
>>   	igt_subtest("pm-tiling") {
>> --
>> 2.43.0
--------------9opqpRnxwChl9CkGSzjdSlDL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">On 29-09-2025 15:52, Thasleem, Mohammed
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PH0PR11MB4806051740CAB94BC07B8CBDE41BA@PH0PR11MB4806.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

-----Original Message-----
From: B, Jeevan <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a> 
Sent: 23 September 2025 11:11 AM
To: Thasleem, Mohammed <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Thasleem, Mohammed <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend idle test case

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: igt-dev <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev-bounces@lists.freedesktop.org">&lt;igt-dev-bounces@lists.freedesktop.org&gt;</a> On Behalf Of 
Mohammed Thasleem
Sent: Friday, September 19, 2025 12:37 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Thasleem, Mohammed <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend 
idle test case

Added a new subtest that tests S0ix (suspend-to-idle/freeze state) 
functionality using SUSPEND_STATE_FREEZE.

This expands power management test coverage to include modern 
low-power idle states for comprehensive suspend testing.

v2: Update subtest name with system-suspend-idle. (Kamil)
    Update the subject title.

Signed-off-by: Mohammed Thasleem <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>
---
 tests/intel/kms_pm_rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index 
344ef8c94..1610404ff 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -128,6 +128,9 @@
  *
  * SUBTEST: universal-planes-dpms
  * Description: Validate universal plane (set/unset/change) with dpms.
+ *
+ * SUBTEST: system-suspend-idle
+ * Description: Validate suspend-to-idle (S0ix) functionality.
  */

 #define MSR_PC8_RES	0x630
@@ -1685,6 +1688,9 @@ igt_main_args(&quot;&quot;, long_options, help_str, 
opt_handler, NULL)
 	igt_subtest(&quot;system-suspend-modeset&quot;)
 		system_suspend_modeset_subtest(SUSPEND_STATE_MEM,
 					       SUSPEND_TEST_NONE);
+	igt_subtest(&quot;system-suspend-idle&quot;)
+		system_suspend_modeset_subtest(SUSPEND_STATE_FREEZE,
+					       SUSPEND_TEST_NONE);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">What are we waiting for in wait_for_suspended state, is it same as SUSPEND_STATE_MEM which wait for Some dump/check pc8. what is it we are checking for FREEZE we need to provide more info description if it is same or define the test little bit more.  
	--&gt;SUSPEND_STATE_FREEZE tests suspend-to-idle (freeze state) which executes suspend/resume without entering platform deep-sleep (PC8/PC10), 
	     unlike SUSPEND_STATE_MEM which enters full suspend-to-RAM with deep power states and wait_for_suspended() waits for kernel suspend 
	     completion - for MEM it waits for deep sleep with PC8+ residency validation.
	--&gt;Will update more details at description while merging the changes...</pre>
    </blockquote>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Looks
      good to me.</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Reviewed-by:
      Dibin Moolakadan Subrahmanian
      <a class="moz-txt-link-rfc2396E" href="mailto:dibin.moolakadan.subrahmanian@intel.com">&lt;dibin.moolakadan.subrahmanian@intel.com&gt;</a></p>
    <br>
    <blockquote type="cite" cite="mid:PH0PR11MB4806051740CAB94BC07B8CBDE41BA@PH0PR11MB4806.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
 	/* power-wake reference tests */
 	igt_subtest(&quot;pm-tiling&quot;) {
--
2.43.0
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------9opqpRnxwChl9CkGSzjdSlDL--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69965C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 05:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAEE10E852;
	Thu, 27 Mar 2025 05:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ln6Wz6Aj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ED210E857
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 05:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743055011; x=1774591011;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bGDCsqFzIT854pfM0W8uN+TdIjg4RZCuIYfD4AeN6iU=;
 b=ln6Wz6AjxbDm5eg/xX81ZUA9uDSSEdSKn2O7S6BaGXyu5dlqgI8Q4NrU
 +BM3pUbEt14aVEYwECfCQG4LtbSsS34+Q/nvdRasaUa+qn0QuZmc79CY1
 EQi40c3wFzhyo0ocd+DJ0M91xmcLoRhfW7E6hDVJ6wTGqbGUsZ9d2B7EJ
 A3pDTwvezpgWVqW6X1nJm3cPTniYKh1fTWQk8dgA6+tO4LS89BLdfe9Q/
 HsZloqn3Iduvqz25TEcWSmtkI/+ac1CbHw8+FHSiRLUJlLGIjZP5q3Cfp
 NNzQdI6q+V3yDEclGhVnCdxNrf+kIwIOXa/5ep5BgeOIB8ClrpswKWo+h A==;
X-CSE-ConnectionGUID: z+i8bQx/SzGEDt8ORoJ2uw==
X-CSE-MsgGUID: NZmw1xYYReiBXHxDllaotg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44259461"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="44259461"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 22:56:51 -0700
X-CSE-ConnectionGUID: GmJ3VqTpTaitzScBqRBT5A==
X-CSE-MsgGUID: Jstws/fGTlugTiMY4mLzXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="125239584"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 22:56:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Mar 2025 22:56:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 22:56:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 22:56:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ug8eIWY0p3AdbZp8tYIPuCneXKks3d+NqlyGgScqRBgX0SKsZFx2I9nkjLNPvD30orLbP3XXMY9Vc35qVSu9CWBZbL/DlIuoIDBI8nS7x991gNUT0Wr37PfzHADSg4ONu+F2aO9c0H07kyKQnYyU6IdfoU+YjfY4e2VRmq54lqkwmhjr6Vs24eVQI5p3zEnDPMqL6WBjDry5VkS2PWThG3vFGCNZlYPzvmHq1EYu6nJRswduA0f9hufAuuXPqScKe+bs7cPgkmhapUElIYv7g0ZENRwzD4r435HYoXG0XadyjoeYeyMpx3ui9vyNy/L9bQfW7Do/+hkvM178Va8oDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhRwiByEsXPgP+aNMpgZeQV+RKKthNrGcIjiM3YRBmQ=;
 b=p6pRpRvoYvVLGUo4hrAov4hYYUtMhGX0Rfxr5Z30MC7HGTJ8hR0WFKcZVCGVbAsEEBtAySMDw2CMJbalG3zE/OZyBR4pHl04SI3fSFwCUYOorXRWCR0EBrYid4znABYaBtPXnlmTZTFU1aRrMdThHCRcEN4B6xuv9rNSzdbiOzg7FhhTVC2QtHVQNVhv9M+Euu3aGDKqFWI9PcIZ4CPZEtwbQw1FoUxPhVAROm+aw9da3LdFXSYIZ7Txy7Dn68iByolL5Hs0gx3XrWpF4tFra38cOZgde13gDX5NjSl+EWZF9koJ77nq9OQylEgKCvqg0UIynxF5JME30xTw54RDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 05:56:48 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 05:56:48 +0000
Message-ID: <01f935cc-7b22-4722-bd74-9621d806703d@intel.com>
Date: Thu, 27 Mar 2025 11:26:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_chamelium: Add
 chamelium_frame_match_or_dump_frame_pair()
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20250324090949.614233-1-swati2.sharma@intel.com>
 <20250324090949.614233-2-swati2.sharma@intel.com>
 <SJ1PR11MB61292493C9C6D0F30ACAA8E9B9A62@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <SJ1PR11MB61292493C9C6D0F30ACAA8E9B9A62@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: b820174f-0ad1-44e9-6639-08dd6cf42950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXh1Qzh2ZVdjU0RxRG11TzM1WDI5eWZhSzRzaFJHOGRBQUZCZ0RZTy9acHcr?=
 =?utf-8?B?MWIrK09GWEVaT0NrcXVrcnBxeksvVDdLc0M4L0ZXdDNtWE9JVGtFQVZEZkxZ?=
 =?utf-8?B?R1F3TkpiMmlZQ1MvM2ZEdFhRMUI0YzdIQWVGUm9BeFU1MmZIWjlvZVhZUldq?=
 =?utf-8?B?YmkyUFI1MTNBT1UvWnF4THlmWnFGSFRpbXd4QTF2T3NtMzU0a0dGSHl3cXNX?=
 =?utf-8?B?TDRIMnU2eEpoT0FraHFmTVgwR3VHYWg4dGQyN2MyY0FSbmZTMDlGbUFBVi82?=
 =?utf-8?B?Ri9jRFVOV3RQNlU0bzZ5ZUVFbXp1ZGNXWXJPNVdKRmRuWGtPb3gxaUVFbU1n?=
 =?utf-8?B?cmxXS3pKZjBxSjFoUkZIQmxyUjE1ZWpHbmg4MTY3SXlEMlYvM09NTks5TFAr?=
 =?utf-8?B?bks5REtXU2Q4MUlLOVRWaE1aTHpjSml0S21rQ3lPTFpic3ZZM21qa1VPSHQ0?=
 =?utf-8?B?cHNpWnhSZmFZWWk0SGlJdWlTa2t0ZXNIVHVFK284aHBCc3FxN2VwVXlGL2ZM?=
 =?utf-8?B?YXFveWwycUU1NlZqdS85c1VBa2RLYXF0WTVlSU1UUXJQa09BZ3EzOUR2Vk05?=
 =?utf-8?B?MUxXbHlIczM5dzhzWmZwYmhmUm11cnZaVXhRblVBckFZRmtSTGNJU0cvMmlk?=
 =?utf-8?B?U1BSdUM0UEFOajJrMDF5ZnQ3T2NGVThyYXZISXZqZStuS3piVDFQY1RLL3RG?=
 =?utf-8?B?Y2RKUzRUMFZJWmJiV0lNWjRjM2FmUmlMcjdUa2g4NXJpLzRPSnQvQjEyYktK?=
 =?utf-8?B?S1BIV0F2MlRMdjVrZTN0bFhpRWpmY2w5NnBmYjRjRVMvVTdBQStrZUVwZW9y?=
 =?utf-8?B?M0d6ZXpDM2QwY0lTYkFzS2NnVE5VZzdxdFJvVHZydkdlKzB3NkJZR0czaVpW?=
 =?utf-8?B?YWxwMHBHZWxvRHJxZUlQalA3WlNGMDg3dlNEYnp2bG8xQStPUTBKV1lnVDRl?=
 =?utf-8?B?Q1dFaEQ1dUlYNUxRZWNxWjVwSVdiU2hGdUxDNUZIYWNmOWNITU5KeHRTRHBv?=
 =?utf-8?B?MHA1R2tvNExsTnBkaXd2Rm9pK2htQ2dIQy9GWGZYamwwNVZnVWw1b1BXUUdn?=
 =?utf-8?B?NEJoL21hWHRJanVySlUvcW1QOFprcHZpZkpsQW5POHoyY3A5SnZSbzZOb3cx?=
 =?utf-8?B?Q2xWeERRR2JmUWdFT0ZyL0FaV0w3bGhvcXpnU09RdVVGYzloaGU0TmRLVVlt?=
 =?utf-8?B?dVE3MTZJcUtBMmZYUW1oTWdvNkdtR2FoZDhicnpCNTUvUjBBR1VSRFAwMmdG?=
 =?utf-8?B?SmMrRlo0QlJjN2lzQVNSVWM5NHVYWTlOUlVFTDd3dStISHNab2xTbytrS3Z2?=
 =?utf-8?B?ZG13T0thWkNyMW5LV2pZYUc1QXk1Y0VEeUlOMzBzdHVKamx6WGpMVHYxRlRF?=
 =?utf-8?B?NlZzSXFtWkNXcStGY1dxZWw3bjJ3S0hlcW5tTnhIQUhNVnJWZlB2Z2FWVFR1?=
 =?utf-8?B?dlcxT09FWnQraTNZUjN0a0RxMnJxVzJmb0c2dXkyaGx4SjUvSjhrTTlmNlhY?=
 =?utf-8?B?b1Rac1piaWdSeGE2Q2hPSG55K0ZlMHQ1My96Y1ZJSkFBUjByZjRBNWxvRTl1?=
 =?utf-8?B?SXFLV2JWU29PZHhhUnZ5TWFxeVorWHJiTFh1UlVQZ0lJV0ZOWUI4L2Nla0tl?=
 =?utf-8?B?b2NtZUVyTzhRem1wcWg2YkxtS0twbmRZQU1RVGNiVXZtYjg2YmdJd2dXSDlu?=
 =?utf-8?B?dWxMOElCT25BRWRRVzdGQ2tBZHhaeWJ5c3FMMHR2WEpUcVV5dHg3MGpMd210?=
 =?utf-8?B?eVlCdi8raXNPL1BrSlg3SmU1RUZQRzBhVHpBbjdxeGdTSFZwUnUwaU9saVRU?=
 =?utf-8?B?Zmd2Q2Y3SlFTcGo0aFovQkllWHN5VzZiYWNDR1JkRExnSGhhbit5Y28xRTQv?=
 =?utf-8?Q?L1ZgE0EKK45Uq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVBCT2pmRVMwUHFqTlNBUWlxcUIvMkgvcTlpRkZxVXdFNUp6TTZENmpTSWJM?=
 =?utf-8?B?MU5oYldPWUtFTzB3VWFMbkRxRCsxOFVsNTdYMHhwbTF6dWVwaXRZS01vZ0tN?=
 =?utf-8?B?cWpHL2lDVWFzQWhObnRTcy9OV3hrY1JLSmt5aDRZYVBZNFpVaVhUc0JZME9X?=
 =?utf-8?B?TnBwZkZYMGFuc3orVjFjRU5RR1NHRVBKSFhRYytQQ1BNV2JLUjRxMnIxWkF1?=
 =?utf-8?B?Q2h2REFjQUJTSCt6TEN2cGpNTklzbm9ZKzdoWFV0Rk4wT0tIRG55VlgrUXV1?=
 =?utf-8?B?aGNBWGF4Mml5VGtnOTNFb3BVcW1CT3NQeXk5eEQvZVlhVjcrSHJ6VmlpVGkw?=
 =?utf-8?B?TUhuZW1mWWFhcXVaa0lBVitYeHZzRittM2p5OTNIWXJvWk1aclFKMVdLOFBw?=
 =?utf-8?B?b2Q4WFFSV3dUQVNwZmVDV3Jud2E3UzErTjJzQm1mWVNjTTNWeExDNGFpSWZr?=
 =?utf-8?B?cVc0TmRIalNPcnZOalljMG1LUXZkUVBSNkRGQkFkV1BnZm9sT2NJSGZtMnpr?=
 =?utf-8?B?NmQ4cFEva3hRV0Q5UWhuSEtWa3NybmtsdGg4V0xuZ3NVc1lIWkJVdzIrdmJI?=
 =?utf-8?B?VXk2YllnTXhTdHo3M3hmdjZoandzbTVNb3lmZ0MwemMvaXRrNXVOVElvOVRF?=
 =?utf-8?B?RWxuVXM5ZVZzaVJrTjVrL3BZaXpCMDJVTHg4dTV3SFl2NjRxMURBdEw3MHh0?=
 =?utf-8?B?S29ZMDM5NFoxcUZHalkyZTIvS3pGYjRBejRZeUU2eCtpQ3Q4L2ExUi9wZFdK?=
 =?utf-8?B?S2lIa20zSFBYZ2FQeFhHL1VubFJnMEREOS9nVmNrN3psQjY0Z2NncWNhYVU0?=
 =?utf-8?B?WHZwQWZYc3VqREk4aUFzQXVlSmVJQVZtQ1I3K2N2ZG45bVdudTFBWFZUUmFx?=
 =?utf-8?B?Z3lpYUllUDRObWVJY0ZyTDBQZVBJWnRLbW9RSjRwUHRkYTlWOGViUHVqdXVp?=
 =?utf-8?B?bHRXNmNSekYyUjI1RkYvbUxYU0F4TFJ3U2k1S1ZUeFcwdkNPcm9OL3N5UzNn?=
 =?utf-8?B?NlVFVmlTRktCMmx5Z01vdFJJSHBIQjVwZjA5Q2VVRzhBclZrMTNkZWZZVElU?=
 =?utf-8?B?WUdMUjlUdldFNW1wNDFWQStWSlQxbWYzdm9Dak50SXp0VVhXYkthK05panlM?=
 =?utf-8?B?UDFyWDVOU2R0Mk1DMTlBenFPRDdtNVBkd2FwTGhncjRaYmJQMmVodndxSm1a?=
 =?utf-8?B?Tyt0TUZyVER3UFlvVGlvZEJwSmE2ajBxZ1BucVlZeHhhTzNoNUhUK21zd0Rq?=
 =?utf-8?B?NlZwalRWUW9BUlprdlZpeGFRakpsbENCZnFyNFdRZmx1YnFZWWVCUWc5Y28x?=
 =?utf-8?B?VzBWNUdQMGlxdVdTTjJlOWZGeEhabFJBMzhMK0ZEOGZJbGNrZU1Gc2h2T1Fu?=
 =?utf-8?B?Wmd2L3ZYekx4SWVzMXhKMllRSVlaVXN3a29DNUdUUndXaUwzRnpQRkhhVEFP?=
 =?utf-8?B?SFJnRnlhRHlTT2ZUZjluSDV1ai8raUhzSHQ3K0dReDZLK0tCQ21leGhFd0Vw?=
 =?utf-8?B?Ny9keWE2RkZMQkdCanZFNEJObWtiVWJocTNUS1B4OWtCWjBzd2UxU0k2YUpi?=
 =?utf-8?B?citXYzNDZGViQmNyUmZjeEF3VkMrUUVtV05TZ3I0NUd2LzRPcXZ3NzZQeS8y?=
 =?utf-8?B?WFZyS2pkZ2VWN0VhSG52SzYyZTFSN0FqOEM3WHNWelRBTnlMaGV5Wml2cldW?=
 =?utf-8?B?eDVyclRwbjBidWZxOHhWTkVmemtxeU5YTXp6QisxQzJleUp4TFNjSkVpUE44?=
 =?utf-8?B?c0lYbGkyeGRFZXJxTFBxUytWVjN0QzZCY1QxdExGL2hxQ2Y3K1ZDZXJTcEhT?=
 =?utf-8?B?cFJ5b0JWUTlhazdwcXNGelh0WnhLdTY5eDF3QmE5Yk1lTmduVXNWVGZibVhm?=
 =?utf-8?B?SmUxNFM0N0hSeDVOMzUxMmloNEhKY1NxREZZOEpoWXpzcW4vcWYxN3NwTFRE?=
 =?utf-8?B?K2RlWHhoWG5JTlVKSEsvWkxOajI5ZTVqVkU0ZStMWmo0SkxSWUJZOWppdXFP?=
 =?utf-8?B?WThOamhsWUw5eTVsQlRlbzZRbFVYKy9JR1RCOEFGREtocU9tYW5Bd2hpaEdp?=
 =?utf-8?B?UzIxTFVVdWRkdXVERDRsWTZndTNoeGx4OFo1ZHdEZlJKcHpTYkpaNE01Ykt6?=
 =?utf-8?B?U09CS0Y5aWw3TXdZTXNURnJLNE5FeUNCVDNjUHB2MWdiOVlmY0hVeE01dEMw?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b820174f-0ad1-44e9-6639-08dd6cf42950
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 05:56:48.1413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mvhxwxdws842njaa1Iue11F+cSsalj8Lg+1JgsCpDVxfKs76nsmUo8vZrNpe7hMQSoTppF/+LRrmXKV2iRGXjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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

Hi Chaitanya,
Thankyou for the review. Please find my comments inline.

On 26-03-2025 05:53 pm, Borah, Chaitanya Kumar wrote:
> Hello Swati,
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
>> Sharma
>> Sent: Monday, March 24, 2025 2:40 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [PATCH i-g-t 1/3] lib/igt_chamelium: Add
>> chamelium_frame_match_or_dump_frame_pair()
>>
>> Add chamelium_frame_match_or_dump_frame_pair() to compare frame
>> dumps captured from chamelium.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   lib/igt_chamelium.c | 60
>> +++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_chamelium.h |  6 +++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
>> 620fbbf7d..44a169b29 100644
>> --- a/lib/igt_chamelium.c
>> +++ b/lib/igt_chamelium.c
>> @@ -2070,6 +2070,66 @@ bool chamelium_frame_match_or_dump(struct
>> chamelium *chamelium,
>>   	return match;
>>   }
>>
>> +/**
>> + * chamelium_frame_match_or_dump:
>> + * @chamelium: The chamelium instance the frame dump belongs to
>> + * @frame0: The chamelium reference frame dump to match
>> + * @frame1: The chamelium capture frame dump to match
>> + * @reference_crc: CRC of chamelium reference frame
>> + * @check: the type of frame matching check to use
>> + *
>> + * Returns bool that the provided captured frame matches the reference
>> + * frame from the framebuffer. If they do not, this saves the reference
>> + * and captured frames to a png file.
>> + */
>> +bool chamelium_frame_match_or_dump_frame_pair(struct chamelium
>> *chamelium,
>> +					      struct chamelium_port *port,
>> +					      const struct
>> chamelium_frame_dump *frame0,
>> +					      const struct
>> chamelium_frame_dump *frame1,
>> +					      igt_crc_t *reference_crc,
> The asymmetry in the arguments (reference_crc and not capture_crc) is bother me a bit.
hmm..chamelium can compute CRC of the last captured frame, thats why 
computed ref CRC and passed it as an
argument. As far as symmetry is concerned; will compute CRC of both ref 
and capture frame in test and pass as
an argument. Will it work?
>
> ...
>
>> +					      enum chamelium_check check)
>> +{
>> +	cairo_surface_t *reference;
>> +	cairo_surface_t *capture;
>> +	igt_crc_t *capture_crc;
>> +	bool match;
>> +
>> +	/* Grab the captured reference frame from chamelium */
>> +	reference = convert_frame_dump_argb32(frame0);
>> +
>> +	/* Grab the captured frame from chamelium */
>> +	capture = convert_frame_dump_argb32(frame1);
>> +
>> +	switch (check) {
>> +	case CHAMELIUM_CHECK_ANALOG:
>> +		match = igt_check_analog_frame_match(reference, capture);
>> +		break;
>> +	case CHAMELIUM_CHECK_CHECKERBOARD:
>> +		match = igt_check_checkerboard_frame_match(reference,
>> capture);
>> +		break;
>> +	default:
>> +		igt_assert(false);
>> +	}
>> +
>> +	if (!match && igt_frame_dump_is_enabled()) {
>> +		/* Get the captured frame CRC from the Chamelium. */
>> +		capture_crc = chamelium_get_crc_for_area(chamelium, port,
>> 0, 0,
>> +							 0, 0);
> Does this mean that chamelium should be displaying the image when this comparison is done?
> If so, It will defeat the purpose of using the frame dump for comparison.
Frame dump comparison is already done before. Here we are just computing 
CRCs.
>
>
>> +		igt_assert(capture_crc);
>> +
>> +		compared_frames_dump(reference, capture, reference_crc,
>> +				     capture_crc);
> Since compared_frames_dump() calculates the crc if not passed by the caller we should let it.
> That way we can remove the need of passing the reference_crc to this helper. (and also not calculate capture_crc)
Like mentioned before, chamelium captures CRC of last captured frame. 
SO, in test we need to compute CRC just after
capture and then pass both ref and capture CRC as arg.
>
> Regards
>
> Chaitanya
>
>
>> +
>> +		free(reference_crc);
>> +		free(capture_crc);
>> +	}
>> +
>> +	cairo_surface_destroy(reference);
>> +	cairo_surface_destroy(capture);
>> +
>> +	return match;
>> +}
>> +
>>   /**
>>    * chamelium_analog_frame_crop:
>>    * @chamelium: The Chamelium instance to use diff --git
>> a/lib/igt_chamelium.h b/lib/igt_chamelium.h index d979de4a2..140d52c95
>> 100644
>> --- a/lib/igt_chamelium.h
>> +++ b/lib/igt_chamelium.h
>> @@ -257,6 +257,12 @@ bool chamelium_frame_match_or_dump(struct
>> chamelium *chamelium,
>>   				   const struct chamelium_frame_dump
>> *frame,
>>   				   struct igt_fb *fb,
>>   				   enum chamelium_check check);
>> +bool chamelium_frame_match_or_dump_frame_pair(struct chamelium
>> *chamelium,
>> +					      struct chamelium_port *port,
>> +					      const struct
>> chamelium_frame_dump *frame0,
>> +					      const struct
>> chamelium_frame_dump *frame1,
>> +					      igt_crc_t *reference_crc,
>> +					      enum chamelium_check check);
>>   void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump,
>> int width,
>>   				 int height);
>>   void chamelium_destroy_frame_dump(struct chamelium_frame_dump
>> *dump);
>> --
>> 2.25.1


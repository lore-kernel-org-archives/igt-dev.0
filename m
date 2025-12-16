Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAD9D5B161
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 03:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC4310E1C4;
	Tue, 16 Dec 2025 03:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCENtW7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C806010E1C4
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 03:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765856003; x=1797392003;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KcpYhWCEqUrQKUbxMfFu690IIdC9PgbSt2t09fxTj3w=;
 b=FCENtW7uGRCUArWnfChqyzMDz7HmG2Ro9bFp1MxUHydwNf+TQ4zjXtg1
 s1T03tUR0xN6M0sHSi+PkRv8nblkFq6TV+EhF+sZJsHDjmk242XnG5rHp
 4E2vreuZA140oIUagy54ift0Ia1OkBaqZyQB4HTFKv2LiOFy36YW/fEMi
 gQkNd6h8yFbwmXlcHU3bw4KatlxGmWtafbbOax4DjNbooKQWh3A1zNcs4
 +Wl4J9P21ud8m1fXGtu/rDtJzVM61GShuK33xUfelB6aRD3aNE3R+6id0
 0glpW2/PH3Wau0b8Ja2eHaMs7J226UYVc4JV1jUNUmB+e6RjAtbHTSHzI A==;
X-CSE-ConnectionGUID: j7bPO6a6QymW7KLzsCqS+g==
X-CSE-MsgGUID: qbpS3bbkQC6bmejVmzfQug==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66957110"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="66957110"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:33:22 -0800
X-CSE-ConnectionGUID: 9y2jS+a4QeWDoGsUJn5cnA==
X-CSE-MsgGUID: zIRRZaCGSTKFQiVK1OqIng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197890777"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:33:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:33:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 19:33:21 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:33:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2nS97ucmgORl1ii7s7C6uuVXWNOuvtfAgK7+tG3ErVqmbOvYSO8FUrm7MoPOjQmRdVjlO4n0z+zs6fY/JMY1mSQuzi15DNyw1cRsOVOuAFeKf90qYIMG/j7XIPf9Dyj+rwwwIXHHyiAnf7oxkX8gqjjLLEyjiZ00iD+X/VoIKnYq3hDx0UXz1qSSUsvfgFK/KbQRtU020t5GNDKyYPlNTMO8YhghONBSQvfJe4jr/ORpK+/utM4lRuTL2pkhp+Ipb/sQ6RHROABm/VoQlEzWozmYH0j/2lKhUsOb0v7ThJR77SPisTCJV2k9Ydi5qm38a4wg8dcqm84yacx/EwAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSWDgq+UOrwPc4tSps7/Iy325Y5F4u0pUg9CIy/q0eU=;
 b=CZ7Bh6KWCBICmP7xXvz9f1CDCeYWnfinpTtHzTM2H/Z48plp+dOqm0F0y3IO2lZ4bo8ueslWUzsiZjeTOIwZ4d1YzfOxzfVLvmmghdAYGNtUA8W8mK4v3cu8CUxcN+DNiXbYculZGsPFKJyWciawyFS1rxXQQoiIuaphRIoX5Pm6UWBdnp6kNrw0TYjlCzqj+wykTRTOwIftsrFDwJVq9y4QR1ieUfpAyR2EFHkBBHOmpbl95N61mixlJkbJzAPe68EBmSvEp8rIQLI6ZTU7pTNZ+0iFVFvPktR1mRCbtkLzhhEcw7reSSbVYXd+dLc846wqhO0m+IWMWzCbd0A4xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 03:33:18 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 03:33:18 +0000
Message-ID: <8e1ad796-fbb4-4a66-968c-d1acac4609a1@intel.com>
Date: Tue, 16 Dec 2025 09:03:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 0/4] Various fixes for prime_udl test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Swati Sharma <swati2.sharma@intel.com>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0187.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9937d9-71ad-4482-b4fb-08de3c53da6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHBJNkNrK2VkV29IL0VrN0xoMXpwQjJqTE9jbnVUamNZa2t0TGFTRURKQmZ1?=
 =?utf-8?B?WTVyMzgzSlFuSzdCL1dtU05EcC9FRGRxVElNeXhnd3BybWxCWVljL01RdDJ6?=
 =?utf-8?B?R3Y5cFBuSGVUUTFpREJhb2xnTUJZSHdDQm1xbGRZZ1FMd1lRVlk0bU1SU1Qy?=
 =?utf-8?B?dEZ5dWxVdGF5R0c1VUZmNituYjlDU1lyK3FhNlpJSjZnNldEeFNsa1pWR05D?=
 =?utf-8?B?aFFlT3c3TzB5czhiRThHMUY3bFVMQlhqT3VJTWltdEliaFFtSVRybnIyRDA0?=
 =?utf-8?B?cm5wSmE1OElVMEp2d1R5MWdrbXFNaUh3Wnd0TEt5N1VTTEYyRi9FS2h4bkI2?=
 =?utf-8?B?UWNaYVhMRmVOckN4M3l5TnRhcXJENXkyZWgxaVB2SEJBYWduSTZlRmRTV3Nm?=
 =?utf-8?B?d3c5ck9RNSt1R0xBYWw5Smk5S095N1BJVGxNQU90Mm54dGZJdCtqTTB3QlND?=
 =?utf-8?B?V2RzZW90Vkhic2ZJTUd5OGloS0d0cEd4K294eCt2R0F1TUNwdTd2anRsUkN1?=
 =?utf-8?B?OG5LUFZSRkNnZHNyMFJvM3pqS0c1QmxjQitSeE1MSFJwSXgyWVg4SGI3SEdl?=
 =?utf-8?B?RjFSU2hleENrNHREeW9GNVMrVlVuYzE0ZnA5b2h6UHBoQjBzSHpKbTZEWUZw?=
 =?utf-8?B?UmVmY0FYK1ZuL0Q0YWVYSjRUV2J0WDFiR011bG9IZHRhc2ZUQUhpUStPY05j?=
 =?utf-8?B?dEFmb1FvNHJOcFA3Wi9rYlVTZEhrN3Rhbk9aaVFlSkE4NEFNSHZ4ZFl2RzB0?=
 =?utf-8?B?L3RiWEliM2pwNk94Zi9XeHdRbzJVZDRvMzFuSktSM21uWitadWFCNjhCODIy?=
 =?utf-8?B?VkJVNEgrNndEZFFKNlpSZ2dXZ3lxei9HMGYzaHlHd284bjBVL1hxaTdWZlhQ?=
 =?utf-8?B?WENTSllOR3dDL2cvcXJlVC9sSjQ0cVhReElsdUQwY2Rpei9rbXNNUXRaTXho?=
 =?utf-8?B?cnlGNzFiSy9nS3ZWSE4xeHV6dy8yRHI1REMwOFUzNWZyOXZXSSs3VUJ4Uzlx?=
 =?utf-8?B?ZGNwcTd3MVIvNC9STVlDYWxmckExcC93NGJJa2ErNGorNDdWc2FiUFFNTFcw?=
 =?utf-8?B?c1R0ODRJQmNrT05SbTR0Ly8zZmxueHY3RklVSFRiekk1eC9NZWlZNHFoQnFi?=
 =?utf-8?B?ZStsY29KeTBWb0l4SU92bk1wVkN3NXdkQ2U0d0RwTnRYdWhlTnhsNURGemdL?=
 =?utf-8?B?U0prdGFzUldlWG9idGFISVU4Q0dkNHBLalY2L09ISjg1M2o0ZlZtZXpSMjkw?=
 =?utf-8?B?NUNOc1cxMGhLK04vTklzRWhHaWx1WGN1ZmR5cU14N2FSdVhYWStTbnhrQldk?=
 =?utf-8?B?NmJ0V0tHL3k2RzRSVmtIZXNKemRpaHBKUHBtTzRxZnZnNmgyNXAvb25jM0tU?=
 =?utf-8?B?YTRRSEZvdkN4ZHlYM3BVNVREbkQzb2hhb283bm1ZazBZeW45Z0FQVjZJaUVG?=
 =?utf-8?B?T29lb09YaDRsTytRVlZpcS82V1Fabi9MR1BNVGhrdldSalpObFlZalRlNUFa?=
 =?utf-8?B?eGdrRlFlaS9kSzFla2YyUFAwMy92OTFrRGpmd01iTHJNN2dxNTNUY3F4K25l?=
 =?utf-8?B?Z3d0T0llclRLbDdocVdFM3ZLcGVXY0NHdVNNU3cxem9ISTliTW0zSzhWTFVw?=
 =?utf-8?B?KzNia3dHSUdYVVZOcmNHNXJVRFB5OGMySndoS21pNm4rRFNyZ0M1N0NsQU95?=
 =?utf-8?B?LzNDdkh4djdMbndMUVVkd2d2YTN5aXNzRDNDTkRiTStCK1p6TGxFK3dmREhz?=
 =?utf-8?B?VXFMMUZVVUlTOVAwZG01aXZMd2cyNVJra2ZURG41WFF1cWkwWFBibzd5bVRh?=
 =?utf-8?B?S2hwS0RKY3F5WFBnZGJUNG1aL0Z0SWZmc3UrMWhlWkxHcWwvZ3U0Q0NDQmhZ?=
 =?utf-8?B?dWZKMnJFRTJKU09BdGc3RktzOStPNFo5NVVZT1FDdkVFUXF1TmRaSi9SV0hw?=
 =?utf-8?Q?t2PwDcD1QX3wDgLR+sns0CdRTsGpSMpf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZQVGVLUE1GRHBIc253RGtBaXM2MDNqNGxnL2g0SG91M0dIVmZqdEtpMlN1?=
 =?utf-8?B?ZE4zU2hwYlRObzVKTFluYjk0VWZHeFBYbzVmTXJFMGQyZzliczBvQnhaVlR3?=
 =?utf-8?B?V2dSbDVXSFE4dXdvcTgrRnEzRUp5cG04NVVPKzhNVzhkNDQ4RVdVZnpyM0Vi?=
 =?utf-8?B?L29wMzdBMlpIZ1BkOFdlVDVmdlAzRjNmaCt1STNYUzdGcVY4N2E4blpHNGEx?=
 =?utf-8?B?SWZkdXFRNEhiaU9ORVhNaGlpSHJuY2VHQ1FqUWozSG8zNnduM3Q4TXlvZWNh?=
 =?utf-8?B?eG1xdmpuYms1K0tGeTJraFQrVjlHREY2TnFOYnVQQm44YklkQ2s1VW1GUis3?=
 =?utf-8?B?eGJsN1RkN1lwRzQ3ZzRnVE9SZ2hoeW84ckg2RDAwWGhJZkVuZHI5RWZzL3VO?=
 =?utf-8?B?RUY4bWpWSlAwaG1YRGhXV0k0d2R3UHI4SnZHcEdya0tZVTZMZG5oaUZrNkJr?=
 =?utf-8?B?WitCb2d4U29keDVkUldwbHkxUnNqRUZSekxqQkhjMUEyRDN0S21ZNnNTRGt6?=
 =?utf-8?B?UHdWemw4QUhMR2pxUGQ1d1RURFd2QTFzSm9IR1ZVQXdnV3ZWbHdpMDFLb0Ir?=
 =?utf-8?B?MFg2MGxiRERiMmhYRDMrL0o1S1dmN0FPUDEwVFE1WW1DM1RtRW5Hays3WFYy?=
 =?utf-8?B?ZDNsM2tReWIxaW1kS1U2ZWNxbi9OUlZvM1JKT3I5M1JqQitXbkVWeTlMdlZO?=
 =?utf-8?B?YjY4SVBrMklyWURHSTVUVXN1aEw1dUNDOTlkZ1Irazk4bC8yLzRBR3Z5REE1?=
 =?utf-8?B?VkpCWXNPSUplWjlTc1cvZWl5bi94OFV6N2x5d0dqSmlXblloTi9hTU5OOHJP?=
 =?utf-8?B?SnRlcUR2Z2lORDljOG9pSGJ6Q3FYVWdKcFhHTnVDUVFRNlJHVTZoRlRoNDM1?=
 =?utf-8?B?dlFZWlJtS2VFUXJSVEdZaUNCTTUwRTBvRER0aGVQMmk1MDU5bGwwazBrVGdV?=
 =?utf-8?B?NitxUllOYUpDUGlCeVBLR2VwcFV0RHU5WHhJNHhsWW9lUWw1RHJhMXJnenkx?=
 =?utf-8?B?SVdnWS9hNHJUaGJxQndsL09qZm1YQkQwYU5MWlF1VFBQOUlpcUZTUWMzMHlt?=
 =?utf-8?B?SG9YRDh6WTMzMTl2aUlWenZMakJpZ0dZVHdjU24vZkF1SkFLN0JCMVhaZ2Er?=
 =?utf-8?B?RnpDMkNiVXJ1S1luejFDSWRYaU5MYVZFdUxsMSs2c2I1Y0VIMG8rRHJhYVU1?=
 =?utf-8?B?eFIrdTcwdWFqZHFIQ0xwK1lIMDBPellTRGZha21pTWkrNUJaa3pCWDR3bGF2?=
 =?utf-8?B?MUk0M2wzbW1JdWROTTNjQmtCRXE2TjBYV0tGZFBnWC9md2JMZFNzU01wcW9G?=
 =?utf-8?B?RWQ1bzZZWldiMlUzR2ZtUVNVTHVKSzRsQUdydnFyemRkRzlYVlMxTzlkZXJz?=
 =?utf-8?B?OHJGUDlXTWV0TXRUVVcvbGdXSkdUZWh5SCsxNk1RT0plaE5MWHRuQ0V0Y2pm?=
 =?utf-8?B?eGcramhra0xpZWVUaWF1TmoyL0d3Qm9YQ0YvVGt3V2VvOWtaRGZWWnArQjFK?=
 =?utf-8?B?RTl6Q0VMRys2dzRsMzJkY0kxZnJWTGYrUmZiTmRXTE9LNHdlSlYvNUhPTm5y?=
 =?utf-8?B?NVIyM1haVjhYVSs2SzlveHVvR1JSV2lIK1lacG5qb2IybnNMdXd0N1d1bWR6?=
 =?utf-8?B?R09ZTTVNWFlDd2twS0dhZlRmS1VMRy83SzRuTitzVkd0Y0lzbWo1d3Nha3kv?=
 =?utf-8?B?MnVVNlliV0Z5czdpTVJqRjVrR1VjMUZBbldGUkM3TXVLeW4zTUttelNNVTlR?=
 =?utf-8?B?M1pRQXVvVjQ2a1RBS3ZEZmdoM2d1dGJEY2d0aWlyU0hQWUp6VGM4blpYaVNw?=
 =?utf-8?B?OUxvYzduZkIybm9jNFl5ZXd1eFJxUkpaMEhtQlQySWZDNEdxVUJib0dudDVm?=
 =?utf-8?B?NGtYZjg2YldVM2h5UmN4OXp3MDRVQmJKWWFXN2RTOGFMbjl3UVRMZTRLZTJD?=
 =?utf-8?B?dXoyQVhvSlgyMWxKa3BOQ2h5OWhiempKUHY0ZTF3cW4yektnQTJCdTZlQkVK?=
 =?utf-8?B?dzVKcXB2S09FVnVWdHF4dk9MaC9TTHk4NmJsLzhXRUVza1RPalBDbkVpMmRU?=
 =?utf-8?B?SXlNU0ZTSWk2d0gyRnp4YWI4QmZaWExBd2dkeXJNSXZTM3JqejRrdmpQVlhz?=
 =?utf-8?B?MjVzbTZMRlAxb2NWalNqR3MwRFVZb1R3d0tacGFiaHluV0g4dVpLMERIRUhi?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9937d9-71ad-4482-b4fb-08de3c53da6e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 03:33:18.0786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dx+u12eTn6t5Y9Fk6DU/Msyl2fbuk3fRN+VFB/aKparjjWJwoqtlALY+TnmaH6QgA7mTYjwjlXW/DSbsj9KNpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
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

Hi Kamil,

On 12/16/2025 4:06 AM, Kamil Konieczny wrote:
> Refactor this test into proper opening fixup, then tests and
> last closing fixup. Also fix few error checks and make sure
> opened device is handled by i915 driver as there are now also
> one handled by Xe.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>

The series LGTM overall, but one open I've is if this test should be 
moved to intel folder rather than the generic tests folder?

Regards,
Karthik.B.S
>
> Kamil Konieczny (4):
>    tests/prime_udl: Fix opening
>    tests/prime_udl: Create subtests
>    tests/prime_udl: Fix error handling
>    tests/prime_udl: Fix i915 device opening
>
>   tests/prime_udl.c | 38 ++++++++++++++++++++++++--------------
>   1 file changed, 24 insertions(+), 14 deletions(-)
>

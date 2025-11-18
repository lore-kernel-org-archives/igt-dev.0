Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014E9CCD19A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 05:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A35010E094;
	Tue, 18 Nov 2025 05:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuA3MHkt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6242610E094
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 05:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763445164; x=1794981164;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=R4h3VXutvnbnW7EezArQT7NZICS/WecVmMw4GXDtQdY=;
 b=IuA3MHktj1PliWQGQBNtgx/1BqqrCTcspvyAQ8cCZAoj06UOSZSgfTvB
 8pwFFrsyDAjo5oA1jS0a+MSyn69RY51p+qtZiHyrw0WccWAHivJKqRBLx
 7Sk7ULrQDu1BFscKayUdUdLkye75cgOGg68xfAqvF1BgGt1sQhxEAkuHY
 bHDy0KHLmnXe36MxnexbIbxPi8mUb6X07uq1XnjFPqZWXgxs9bo+H3DPs
 +cuNKq2gyoI8NPF/ygB4xv80mdZRIiptzbaGy+zlGYXeSDU1+G2Muukir
 +qLH4Kg9uz7/+L5+TCn9IdczpX88N5neby/r2/RkcUXeJb851LI9ZY8Ny g==;
X-CSE-ConnectionGUID: mRuF8tWVTVC0EDVFeMBUBg==
X-CSE-MsgGUID: PoiNN2DrRaWMvG10aIqN4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75779572"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="75779572"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:52:43 -0800
X-CSE-ConnectionGUID: MxorcgHyT7Kbq5b0MhKCxA==
X-CSE-MsgGUID: QBsItQuXSC6r4oEUUa4kMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195123328"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:52:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:52:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 21:52:42 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:52:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwZl/jHHFpSQTh6notnFUb/bDuiyRlNm0pYqXMenJZkuHcjYZJ78dAvY5kcz3MRrnOTQWznm3Hn0aFsdrEtBvzQAzgHxDra9aJGPB+Pk1CYX/VrH+qnQbdU0qooJ+daSrsFDuAEgMapE7Cs0Camua8+gd5CeUVYeUbDH/qVca5iL1S0Yr6DGhcZE80MgwtDr12BFNdu/uKxsgcmV1gWgQqH+qlKoIJ63MTkIo3y7UZ+/6OFhuTLEQlEGS1v4Rmz/jDfn5ErruZNNaHwmc4oGuexckj836devNWdpwQ/vYpxe6T+fsnmHLItvY0NvSvVin73pkCxcJ/14HVRaM38dfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeS37UU6clg5geGYdZMrIC4B4P+zIoxKnnkwTolJWW4=;
 b=ZkEIjDhrs/X74scXinXwjVkOiNzJPLWjMwGY7Zb49pVGjlDPI+s/pVskUMkrj8ycM9Oj5iGM4gtPbs5BnySbcGu5KkdcLLbf9jAoCXwcj09qQt56CmC6Wbt1ZcibakEWWPz8EH18VfS6NSF6YoZr9sivUZl5Ysl4gHeMdjHJAXcV5pdeFlF+RIbXT62kDYRU8HhNzKibXSAh9Ul8inRy+OWrXxCYkFgtOowM6+z9CZDPoXTaDE8iRhR3zNVsBecrJx2UnDokIssgwge6hKEZV18aD4hIfPKQKtkxr6N/aU/LNWF1zQH+FeGusqL+mIQZLaDmkVyn/YUXWJwMnfoJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 05:52:40 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 05:52:40 +0000
Message-ID: <34fae17b-6ac4-46ab-8777-d3b4b795ebc3@intel.com>
Date: Tue, 18 Nov 2025 11:22:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Added 64k
 alignment support
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251118052954.7566-1-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20251118052954.7566-1-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: e7936bd5-75b0-4e65-e00f-08de2666af31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjBGcHQ4ZlRKdURLMmZuenRTQ1FyTFI0ZUgwWkFhUFZoY2dsMDVDZThUdlMr?=
 =?utf-8?B?U3hwTTJKZktENUhhUUFJTTFBUHdwMldUSWlOcXkvLzQ5N2d5bmZpeUVOT2g3?=
 =?utf-8?B?Vy9MSVZlakpLZ3pyRkYzSVh2Y2JtRlhoKytSK3pMWG10OC9ZMSs4RSttOCs3?=
 =?utf-8?B?U01NVHh6RFovQ1dPbzBpL2llWUZsdkhTbUhhWEhCZHJyTkVDcXowTW9nclJh?=
 =?utf-8?B?cWtEWkFEOUlBbjE1ZzM2R0dpcXFuRjA5aWtEdEpiOTg0aWYxL3NOSmZJSmFG?=
 =?utf-8?B?WWkyUy96Z09VZXB3Z09yVUdkZmo2empySm9Pem5HNzFZZEt6aVhvQS9xbjhO?=
 =?utf-8?B?RytSVmxhYWtOUzgzTHd5czNKa3RKVVdaOW9JOTE0Q0d2V3VkUGVZTWJoNjhu?=
 =?utf-8?B?elRPNHJKdVZGU3pYVjk4YVdmS3huYzAxQ1VlSHkrSHYrRlpoQUxJQUVudytP?=
 =?utf-8?B?SnJNYzVaNjByTG9RWmdjMm1peGxDalNnMTNuQnJiYnhML29aN05yblZNMVZ3?=
 =?utf-8?B?QjBNekFRakE1eEVHNU4rY096d0piZ3ZvcHhRMEFtOHVLeG43bzdUcDhYcVpD?=
 =?utf-8?B?WGp3aWFKT1NINlpndDlGaU9aUmEzMDVNbGZvS1p0MFZhUEdyV2VCTzNOd0p5?=
 =?utf-8?B?NVp3cHNrR2tLYTlLUUo4MUNmNmsxOW9uZTJGSUVQVk41RGhKclNWYlBrVkNi?=
 =?utf-8?B?Z2FiMEZ5TTRUZ0hOUVo3K2M2N05nUHlOTWh3NkRUcjBEaFJjWE5mQ1hwMmcr?=
 =?utf-8?B?bkZoN3FoZ3htRHpQNkxNaVc0MTRNTnhGVDNiY1pJd29BZWcvcFJiUHhqRkRn?=
 =?utf-8?B?MXZITm5VTDdCaXd6ck45UGRiRU8yaDNka2R1T0V0TzNRQU1WdUVMQ05RNzdq?=
 =?utf-8?B?blgyNDlCc3RLQWJtTC9uZkllVHhlRGk0TUFIWi8zNG1Ca0tZUnBYSlZyemJC?=
 =?utf-8?B?d0lFdjVTTm9zeUp0bVhXZXdGczV2U3BwZVFvV0VGaVM4cWlkSVdPR25GK2lM?=
 =?utf-8?B?ZjVQTVA5R1hxcjBLcUtic0FGdFcxTWtDSk1SWTUxOS9HeVFCVVZWaStDQzM3?=
 =?utf-8?B?SnRadGxTdzR1bWhwcWl5S2xpcFJRVnEvK3BVbVlueUhzNWRPb2FNMUVzZzUw?=
 =?utf-8?B?QlJsdkFyMGdyRGhyR01yRFpzVC9tWi9EN3FHN0xrWmZEQ3VhWlpWZ21KTGpw?=
 =?utf-8?B?MDAzaGdReldyQzl4cnpDL25YanRNWFptaUkxMDFmVG9IRUFEMTEwZmlWZll1?=
 =?utf-8?B?cXFXVkcvZm5CZ0cyYjJ5azBqdTNkcXNJelA1MWorYzlTUW9jdXFiY3l2Uzcx?=
 =?utf-8?B?MXF0SWl0NHRuNFgrUGZ2L0VGNm5vOXNObkprWEIwalRuNU9RMGFmR3hsV1hS?=
 =?utf-8?B?aGw3VVRZTDNjWE1LVnNGRnRCMGFuaDZIRGdzUEFRQnZBQXh4Z3lkUUxZMXM0?=
 =?utf-8?B?RUkxdm53MDlJODlISFVCTWpOUkdWM0ZVbnljenBZRUlhVnAwSnVLeSswdDVS?=
 =?utf-8?B?RUlyNDNJbmRUVEI1bUEvV0xsQWo2eXBaS3VPOHVhcHkrVU5vaXlwM2owTkh0?=
 =?utf-8?B?eFhNTUl6WXd3eDA3VGh0T0FHZnRHWG1CeVhNUHJ2ZmNQWC9rb3NrQ3dVZ0pq?=
 =?utf-8?B?UEd6TTV0SEhTaG1ieGs5NE1UVnFRVjFpVGxnY0o5VHJVQ1I5Yk5KSW1QMUho?=
 =?utf-8?B?eFdoamcySzJxMUt6Y1lIRmNBODBmNGlFSGV6RjFDblNNV09weFR0MkhjU2pq?=
 =?utf-8?B?Z2xDL1h2QzJRRlFGQnhlZHowRitQNXdCdVNnRTBrSmZkZ1RaaVBzOUpCOW8x?=
 =?utf-8?B?TWJHcmMyL1Rnek4vZ2ZYZjFHcmtxMlNpUFVUdjRubE9ZY1B6M2pCdEUxTUJB?=
 =?utf-8?B?STVuamZiR1dvZlozZGZYZVVJRU1jbkZBU2pTTEQrV2IwVVd3cXgrUnN2bVBp?=
 =?utf-8?Q?jS8nSTLU7u1lSgrNadNogbEFVLgO4Xfx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzM3bGdXSTFsWDhuQXhEVVVmdzh4cHpudmZrY3dOc1lCdHhuRDF0bnUvcnJh?=
 =?utf-8?B?UFI5QXZpdjJIb0F5eFRIQnkwUll6OCtpTUdLM0JPVitzVU0ydjduQkJIWUlN?=
 =?utf-8?B?eFVsWWdJeXE1ejd1eG5SZGpFMjAxa1FobkhTV0hhL2o3TXVIRGZGQ3RmR2NN?=
 =?utf-8?B?TFRxazlzQmIydDJ3bTlxV01HOFozREFHVE5pUDcrOVVpaWlYK00xVHhuUm4y?=
 =?utf-8?B?RGtnMVVRSmdMZUtVWkFKYmV1SmYyU0FVZzRLdWdxYmRLa0NRVEhCdFFlenli?=
 =?utf-8?B?ZWRMTDJPcE51YXZ4K2diZk1kVC9mUXJhb3o5cUplcDJaM1g1SHhSOTVGTzFn?=
 =?utf-8?B?ZThmSjh0WXBsUzJJckcrUS9QRExyTHdpRStzSE5rS2xXYm53RVNybWNhWVg3?=
 =?utf-8?B?UVVhWmh5VmI4VG5GcGJzUVF2V1czeWVPZ2tSQUNSWEhKWHFKVUhqdExmSmly?=
 =?utf-8?B?WWR2N2xNR0VKS0twMmpNUnN6VzRpbTVPOGdvaERvTUZzWmJQQ3A2SHUxWGJB?=
 =?utf-8?B?UlA2Zm11OHBIYVB4b0UzNkVkb3hpK01lWDl5NTdabU5YbEl0a0tIQmp6eFBJ?=
 =?utf-8?B?bGwrUUVxcU93WjBRaitadkdzYkEvOUQ1cWlXRGNROGhoc0czTjJlRnlFVVBl?=
 =?utf-8?B?Qm9SakxuVlpVNWlicUVIQVZPUFJoNmhuTVNMZ1E4aFdyQzM0azdFcU5MM0sy?=
 =?utf-8?B?cXNGeXBRY2VaOGs3SG9GYnI1dFJicDA4RG5tZ1NRSkk1ZkJXcWtXM2ZoVXhS?=
 =?utf-8?B?QUJ2eGpJekVISVg0ZS9CWGlTN0t5NHZEWU0zWTNoVGFKSDNveEQ2b0ZDT2Q3?=
 =?utf-8?B?ZGhDSDEwNEZBdm45QjlqYTErbFhmV0hCWUkrVUhRMnBzamg1ZFRuZXcxNDA0?=
 =?utf-8?B?eE9FVjMzSWNiS0pYNlp0dW9JRmpDWW5IZ3V0cExuWkFRK0VhRHdybmVXTWV2?=
 =?utf-8?B?b01VL1N2S2I3KzBVb2lMQ0ROYUp1dVlmMnFkQ216MTliSGxyTkRGcXQ1UjNS?=
 =?utf-8?B?SDJLZ0gwMlBGK1FZRExYUVlDT1o4cnJLdEw2dnpOWGc4V0cxVXUvVE9BRXNU?=
 =?utf-8?B?RzA0NWJXdnEzZXJ5VWNsMXVsMFNXZTlIekpkL0o3QUF6dDhKbFdvcm5KOS9X?=
 =?utf-8?B?VW9rZzFZb1hTc3FPakluTkI5bWwvMndZcUdieUhlVWhFNUx3YndpOS9DRmpv?=
 =?utf-8?B?bVNoV290dWo3L0dqM0VyZlNyQ1o2QWh2d0kwbGc2T0c5Zlg0ZXB0aUVGTnoy?=
 =?utf-8?B?enNCcDNvQng3QkZCbktVUWMrRUFKbVBYOWczcnRIYmxJemowMWRuNi9GUC9D?=
 =?utf-8?B?UllYRk92WlZ1MUtGbDFhajc1UktLYlVmcjBJMXk0OU1GMFFKTXAwZHFISkZi?=
 =?utf-8?B?ZjBYbnhTa0l3MmtNRDFCb0cxdVpDTGRBREF6aDNmTUpodzdScHpVNExiejAy?=
 =?utf-8?B?WDU5MUNUbGR0aW8yUzAwRDZkb2RxQVhvZzZjUlAvcTF6aE5WNTNZWHJFNlph?=
 =?utf-8?B?QXdrbkZpUXI4US9Xc0lyOE1QU2Y0YWtKam1SVlhQSnd3T0lrNnIyUGw4R0xp?=
 =?utf-8?B?QmxnWDBVa0gzdWxjaGpjcXlidSsyTnZQZjRCcU1EdFROZDg5QUExdEN1VG0w?=
 =?utf-8?B?SE14bVJaSFora2xiWWdUaGtpNkRkRVR4aHZHM1lwODRoUDlyQ2N6V1ZFRk5v?=
 =?utf-8?B?VkIvaHZOU2ZEL1U2TmF0Y3ZVNU5PSjJYRTBGaFhQeWMvRXpBbXVsaG1JMGxE?=
 =?utf-8?B?b083L2RLR0ROUTRVMTZqZGVhR2FyZ0JBL2VzV1g1cHB4OEx5NS9LMk10S2Zi?=
 =?utf-8?B?UkhrMXJMeDIyS1R0NXF6K0k2djhuYTIvS0tRMDdNd0M1Rlh1VXo3blg2WmpB?=
 =?utf-8?B?SlBhRDR6aHFtUFR1VEh4M3dQd3RhWXc3enNDUW5hcXA0bXRiYXZpQUx3aHFQ?=
 =?utf-8?B?UmRURXJrTVJoOXBYWURIWk5UYWF4bHZwbE0xTFVjQmJpbjNZVWlEd3RCZkQr?=
 =?utf-8?B?TXY1Sm96QmlnT0NiRE5tYTVXaW10ZURmLys0TStURGlxc1lwK1VHdEtQRm83?=
 =?utf-8?B?MHRnODg4SGVYNDE5Q3VRWDNHdzJtOUFnUmt2VzJydTdvQ2Q5QWdOaW1qbktJ?=
 =?utf-8?B?bXVlb1dYUXZlbkxiZmgycVFLQ1RnU3dDQk1WNHUyNkxmbk5VVHJtSFVmVmk5?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7936bd5-75b0-4e65-e00f-08de2666af31
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 05:52:40.4202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Su534oYUPgsMaaHhLtWnruAzj9wSPnA0ukZSyyndf6TSB0O/1JHTMDjr6WSlOiuP+WfJijb6Ffky7DLpDomQZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
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


On 11/18/2025 10:59 AM, Sobin Thomas wrote:
> In this test only 4k alignment was there, so some tests fail
> in some hardware like PVC there is need for 64k page alignment
> So modified the test to support 64k page alignment
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 42 ++++++++++++++++----------
>   1 file changed, 26 insertions(+), 16 deletions(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index b88967e58..314836ef9 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -311,11 +311,11 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>   	u64 *exec_ufence = NULL;
>   	int64_t timeout = FIVE_SEC;
>   
> -	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> +	exec_ufence = mmap(NULL, SZ_64K, PROT_READ |
>   			   PROT_WRITE, MAP_SHARED |
>   			   MAP_ANONYMOUS, -1, 0);
>   	igt_assert(exec_ufence != MAP_FAILED);
> -	memset(exec_ufence, 5, SZ_4K);
> +	memset(exec_ufence, 5, SZ_64K);
>   	sync[0].addr = to_user_pointer(exec_ufence);
>   
>   	for (i = 0; i < n_writes; ++i, addr += stride) {
> @@ -368,7 +368,7 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>   		}
>   		igt_assert_eq(ret, 0);
>   	}
> -	munmap(exec_ufence, SZ_4K);
> +	munmap(exec_ufence, SZ_64K);
>   }
>   
Why touch_all_page() function is touched? is that failing due to 
alignment? if yes then it should go as separate patch
>   static int va_bits;
> @@ -825,11 +825,11 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>   	data[0].vm_sync = 0;
>   
> -	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> +	exec_ufence = mmap(NULL, SZ_64K, PROT_READ |
>   			   PROT_WRITE, MAP_SHARED |
>   			   MAP_ANONYMOUS, -1, 0);
>   	igt_assert(exec_ufence != MAP_FAILED);
> -	memset(exec_ufence, 5, SZ_4K);
> +	memset(exec_ufence, 5, SZ_64K);
>   
>   	for (i = 0; i < 2; i++) {
>   		uint64_t addr = to_user_pointer(data);
> @@ -879,7 +879,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   	}
>   
>   	xe_exec_queue_destroy(fd, exec_queue);
> -	munmap(exec_ufence, SZ_4K);
> +	munmap(exec_ufence, SZ_64K);
>   	__aligned_free(&alloc);
>   	if (new)
>   		munmap(new, bo_size / 2);
Same as above comment.
> @@ -1201,6 +1201,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   			    struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
>   {
>   	uint32_t bo_flags, bo = 0;
> +	uint64_t split_addr, split_size;
>   
>   	if (flags & MADVISE_ATOMIC_DEVICE)
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> @@ -1252,16 +1253,22 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   
>   	if (flags & MADVISE_SPLIT_VMA) {
>   		if (bo_size)
> -			bo_size = ALIGN(bo_size, SZ_4K);
> +			bo_size = ALIGN(bo_size, SZ_64K);
> +
> +		split_addr = to_user_pointer(data) + bo_size/2;
> +		split_addr = ALIGN(split_addr, SZ_64K);
> +		split_size = bo_size / 2;
> +		split_size = ALIGN(split_size, SZ_64K);
>   
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>   		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
>   				  bo_flags);
> -		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) + bo_size / 2,
> -				 bo_size / 2, 0, 0);
>   
> -		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) + bo_size / 2,
> -				    bo_size / 2, DRM_XE_VM_BIND_OP_MAP,
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, split_addr,
> +				 split_size, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, split_addr,
> +				    split_size, DRM_XE_VM_BIND_OP_MAP,
>   				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
>   				    1, 0, 0);
>   		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> @@ -1269,7 +1276,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		gem_close(fd, bo);
>   		bo = 0;
>   
> -		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size / 2,
> +		xe_vm_madvise_atomic_attr(fd, vm, split_addr, split_size,
>   					  DRM_XE_ATOMIC_GLOBAL);
>   	}
>   
These changes are verified on BMG so that it shouldn't cause regression?
> @@ -1509,6 +1516,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		}
>   	}
>   
> +
>   	for (i = 0; i < n_exec_queues; i++)
>   		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>   
extra whitespace above
> @@ -1520,6 +1528,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	data[0].vm_sync = 0;
>   
>   	addr = to_user_pointer(data);
> +	addr = ALIGN(addr, SZ_64K);
>   
>   	if (flags & MADVISE_OP)
>   		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
> @@ -1550,14 +1559,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		igt_assert(exec_ufence != MAP_FAILED);
>   		memset(exec_ufence, 5, SZ_4K);
>   	}
> +	aligned_alloc_type = __aligned_alloc(SZ_64K, SZ_64K);
>   
> -	aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
>   	bind_ufence = aligned_alloc_type.ptr;
>   	igt_assert(bind_ufence);
>   	__aligned_partial_free(&aligned_alloc_type);
> -	bind_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> +
> +	bind_sync = xe_bo_create(fd, vm, SZ_64K, system_memory(fd),
>   				 bo_flags);
> -	bind_ufence = xe_bo_map_fixed(fd, bind_sync, SZ_4K,
> +	bind_ufence = xe_bo_map_fixed(fd, bind_sync, SZ_64K,
>   				      to_user_pointer(bind_ufence));
>   
>   	if (!(flags & FAULT) && flags & PREFETCH) {
> @@ -1580,7 +1590,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		if (exec_ufence) {
>   			xe_vm_prefetch_async(fd, vm, 0, 0,
>   					     to_user_pointer(exec_ufence),
> -					     SZ_4K, sync, 1, 0);
> +					     SZ_64K, sync, 1, 0);
>   			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
>   				       FIVE_SEC);
>   			bind_ufence[0] = 0;
Please verify it on BMG platform so that it shouldn't cause regression

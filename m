Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E69C3600C
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 06:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF11A10E049;
	Thu, 27 Mar 2025 06:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPrWSdNB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BCF10E049
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 06:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743055339; x=1774591339;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eCn3rIEdZyUHm97WpYomlwvusZNn2JVSL3LKELQ6UKM=;
 b=fPrWSdNBjlFKuUm15/n9NkZPw2eqrsA9MxYOKVyFbSv/EGYOJ1iLPlbR
 BxtQW0Avq/gFad5ygH0Uie/uasAzvERHEYBUd/5HsN6pTNC+f4JBNg1Hi
 SUwe4YlwugYC7CMtIRKrlemQOIfoZ9aLZcI2D3rGU+SeafjMWB4+OYbuU
 LAIqxT/sgs2ztFhve4mjOvpM1LYF+MSc/YUHZTxO9yZVn2GbYuSj2fnwu
 XUmVO/Ke1AxjQcrBxhUqMi8huSbQUKPzqrj4edZsEJdzUFRwNxPKf/weP
 r+p8nNJPrWksF7En+2cAObBjU14LWn5y2oZyeYN7mW6qT1FxRxfipaZ3x g==;
X-CSE-ConnectionGUID: 0ukoGDdaRs+3lJG7o0YAEg==
X-CSE-MsgGUID: 590iqZqASda5gsZ3Av8J6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43613597"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="43613597"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:02:19 -0700
X-CSE-ConnectionGUID: 4ieMBuc9TL29CQbOzIHhcQ==
X-CSE-MsgGUID: 62gmi56lSC6vfDXm3uvF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="156035311"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:02:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Mar 2025 23:02:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 23:02:18 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 23:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXkldnGqcr/XQOypOYWritidmVvFzhyf98Lt91xu2Dnm9ie44Q7D9rc411maJ9dQs5QgVi4nNTLqOIGN6CmT0iiK67/sfXNWSepf0wVPvym77mzFJaNmGqBLLXUksjXsm4//niMV8ATY1HKRQCnJMpFphZvU7W5cyK2EpYj4nhKI6HsJZ+Vgbtvl5T5/Q6KfR8dP7knWPes+Yk0Yaw16x63No+dyZKtdZC3V8OhEnl38chXGhi/BG3Gyd95YPkivA9bZYd3NfBASFv9CYoATg+I8Ap4QyKHlxR6HTP09WjdSQ2CwdxnmKyB1R/7HBUxxdSXXJfr+g/qb8yaHQvD1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NX+dEqAT2gYcoIcD1YkCbHVSLnpLJ6Zbikd9v6T1X0=;
 b=VfChAnqGdU7eTW7JAMMGJzvR6GaW4WO4FVocMpb7wd/dF0mzptqgvHtAqyJ5wN0NU2sdvOvHZ4u9HZFdUhnrFCPKcqPdhuQF74NXSGZyPMTtRUs4/w47AtGPvML4O6TAtxow4ShbJhgzgfe3y7/e8LqJdMMxpC2+izV5JxBhAEv3NccLnQn1ZCUHeSx+lbbEa6BoynLyjIIj/xyhQq72FbsXisTNLlwgVtXuTI5J609jjtfOgcPqPkkBvualkiIXK5NPWWuMIpDR0OluayCnDROVLMFWo6eo4mSNh7EyTIs8HJLyXeO2yHZ0k+wgUQhbMmXTah2lkrZZ3x5+rmcdSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 06:02:15 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 06:02:15 +0000
Message-ID: <ab6a02b9-6e9f-47c1-81b0-c79695ac649d@intel.com>
Date: Thu, 27 Mar 2025 11:32:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/chamelium/kms_chamelium_color: Fix
 ctm-limited-range subtest
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20250324090949.614233-1-swati2.sharma@intel.com>
 <20250324090949.614233-3-swati2.sharma@intel.com>
 <SJ1PR11MB6129F103D9C4D5B18B4CD941B9A12@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <SJ1PR11MB6129F103D9C4D5B18B4CD941B9A12@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe07205-82d2-4ce7-d944-08dd6cf4ec45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkgxQzhwTDBuZFZaS09HMENvd3dibzc3TUlJR1lEVUNlMVhHZzVKYW1Dby83?=
 =?utf-8?B?Q2xnWWdSOTVrZlRVWitLaWpweUhSR2RqWTZxTlp1Mng1MXR3Z1pmYnE0SVFJ?=
 =?utf-8?B?SHFZK1pSaGdZdXRpRm9kclA4Q0RwTVhmUDhkNUZJRHQ5QTM4dm9MazBtSmpE?=
 =?utf-8?B?RlJ1Tm03RW9GeExBZCt6UWV2am52OEhtVFJmc2JDSkVkS1htamN6YzI4N2VN?=
 =?utf-8?B?R2poamNXbmFWanJIem9CMm92UHhJTXZVc20rNHNyNC9JKzdOWHg1eGRERXEy?=
 =?utf-8?B?Zi9tTHVWeElvdExmOUxxb3R2cFNFM2xLbXRzdjR6aDVlTTZLMSthMG9UVzc1?=
 =?utf-8?B?UWpYT3Jidnh4Y0g2NTlFTjhkY3NERW1pNWU4R29zbmpKcDBEbVZZQk5rdUkx?=
 =?utf-8?B?RElEOU1Qa1RUSFhJM2ZLMUFndExsb0gzWWZXZHEvb3dzemtZOTl3Q2ZqcEFx?=
 =?utf-8?B?emo1dlA0d0VaTmJhbUJwbjFOWHFML1QvOUt4UlFEQWdCQXZYVnhwTDk0dEI4?=
 =?utf-8?B?TXVnejN3TWJuUUhzNWhuY2p5VnhacEhra2pCdDJLU3ZjNnB5ejcwbFd5QWpI?=
 =?utf-8?B?NW55bHhjRTI3djI0MDZHK0MyeUs1M1p1cHFsQU4vTFdCdE5DMmp5UzkyZnNy?=
 =?utf-8?B?MGhXOVc0QWZla2xITkVOcmtkbys0V3FWOXhHRisxY25saTNZMXFTZTRNWllJ?=
 =?utf-8?B?REhwaEZMK1dvbUdrU25CQmsvQ1kyakJENFk5Z2NDT0VBeXRranZEam5iVlNH?=
 =?utf-8?B?ZkNrbXhPV3VNY0U3NGtXRGtUb3JZSjMzS2VBKzJlNzR6ODRGMytXaTUyd0RM?=
 =?utf-8?B?aVV2dFBRMHlocXIvMVNzZEZBNDV2d044MGFCTDdEU1g1cVZQc0h6V2ROa1Yv?=
 =?utf-8?B?cGMrRUozbkp4Nks0VjcvWDhXVW5ubStrNDdUSnVxb3gwNmk1emJzWi9KUm1y?=
 =?utf-8?B?UUlmVmdyMVRqaGtyRXlWMjNkdUdtblRmZ1NuRVo3K3Vqa2N2Mm56NFAzcUpW?=
 =?utf-8?B?c1VnMm5nSVQwSmxJTkVEYkd6c1JpMVpDZzBuNUROKzlzWk9aUXBKaVA3bkZI?=
 =?utf-8?B?OGZTOHlQN3BDMG4zYWlYWVFYK29rZ3dXOVpmdmdLczJ1eEJ4WXVXK0RTN2VC?=
 =?utf-8?B?Tm8waWMxQ1lyTjNsT2N2Q1Jxc2FTSkVtSUhGdStOTTZubHc1djB0eWJSa1cr?=
 =?utf-8?B?RXk1NzNZUllDRnFsRzJRaTc0WW9GNkx3c3U4MnRlOCtpV2xoUnY3WXN0U2tW?=
 =?utf-8?B?cXhiMU1vOFZxTlNtRkxyZkIxcDZXVGYxN1NpOGpJMElpMkZWbnMwU3pWbUI0?=
 =?utf-8?B?MnpYSVpDM0FxOXU5T3Q4N0VOcE1GKzBKcS8xSEFhT0I5YjZGMDdyT3lsaTNG?=
 =?utf-8?B?Vkp4UlpQRDFPeDZvZk5xNUx0NFBDb2xNS1RvRHpiUStDNkxhd0JRamNTRzVj?=
 =?utf-8?B?YXBsMGpVUVBaY2RzOEN2S2wzTXNuTmJyR3hrcldIS3JKVTlyWWFld21sYTlP?=
 =?utf-8?B?U1Z0MFZQMzJmbzNmbS93TFZ6czZTSjd0eWFFK0dCNkdza3NvdFNYanU1MUU3?=
 =?utf-8?B?cklCbzl6ZEdnL2tzT0Q5M2o0TVJLMXozTkhLbU1jdUlqcVBWUkNiTSs3ek9o?=
 =?utf-8?B?bTl4NzZ2YjVqaTl0UjdoR2tUWThyempjM1ZEVGlrSmFZRUkxbndCWkZ1R0xB?=
 =?utf-8?B?S0Q4L1RuUzRWOXE3LzhSOG9hKzlqVTR5ZjgycmNOUWlZWXViUXBjTjFpdFFW?=
 =?utf-8?B?eDRUd2U3Und1eGt1cndHRk9hRGRqSmFCYVc3Z0pHaEdhTzFyYW5XUDAzTW9m?=
 =?utf-8?B?Q2hCY0Y0RnpwWnIzZ2drbXNYQUJSL2JQS1hPWkdseWRxaVlPMlhudGxhd00y?=
 =?utf-8?Q?WNPidkvbiDTTg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek5UT2lqN0pIdlpUdzV0ZC9qMnJLTVhRZkVsNTJDcWFSL21rbEREZHRxSS9r?=
 =?utf-8?B?Z1VwRnI4VEdSS2p3R2RBdjJGVi85bFpickJiQUxaOWNuVkVVNllLVUZUQzNs?=
 =?utf-8?B?d3F1dllydlFxQUlVT2J4SjRiS3VlTjlhZ3RvbEF3Z2FiMjlBU05MOE54eks4?=
 =?utf-8?B?cUlFVTl4TU9vcEFxenhkTUFHQTQ3aEJsWnhQSEx3VFpGbUFXVThBYmJVd2xX?=
 =?utf-8?B?YSswcE1hcnVJVnNyd0NvSEpFOTdqaDlhNkE0b01hRUFOMXF1Z0tpSktDY21P?=
 =?utf-8?B?RDEwRXdtOUpqZ3B0YnI4SmNSQ21QMDBHdHlibnVMSHZ2bS95Z0s3WTlheTBZ?=
 =?utf-8?B?cVNBaXRKOUlaUnlnRnUvL0toRGVZTG43cEpjYXJuN2NhUEs0Nk4wMTMxeFZ0?=
 =?utf-8?B?eXRST1RIUkMzeUhXbDJPR1d6eGFYbHhMUVp1NXJsOERCSDA5WjVtbTg0Y3RN?=
 =?utf-8?B?bTZ4MmVQc3A5S1VCUGcyMjNDRzd5U0dBZ2haN2J0ckxRQlcrUXRaRXVsaS9D?=
 =?utf-8?B?eHBUdkJ5eWlJei9IanphYTJkRkJ4bmNBS09xZWxlaktiTG14SHVBSzBjeTMv?=
 =?utf-8?B?Ukx0YUFnK0YrSEoyTzBvTjh6a01OeE5PenpKR0dnTm5VRk83T3U3M3BCZzAy?=
 =?utf-8?B?NEEwYnNRZWZsZkk2ZXJ0U0xuQTkyR09ZekphakhOV1p1ckxzSWZZWE1TVmxr?=
 =?utf-8?B?Tm0xUlU5VldDRDE2TUJKc0I1amVuQ0JQVE9HVlVPSC85aEV0d3FyOGN3T2po?=
 =?utf-8?B?aVloVjNQM2pZNmRuVXFRdTVZNjJLWldNUmNEQ3VOQXhDYitMNVlOeVZGTExs?=
 =?utf-8?B?dElZYnIreTUwMHRwNnpHb2F2VEFDSU9PTjFUcE4xbHV5NGpOQUZKUEVKOHZ0?=
 =?utf-8?B?L1dHNDYwbUZMUGoreEVndFY5NFZqTHdYTTg1VkVjS2hmS0FKdGZQVHR6V0tw?=
 =?utf-8?B?Y3dFWm50UG4raXBrSlNaOFl0WEpDUDNCQ3dpY2dINUg5NUExdHdrS01rMGZh?=
 =?utf-8?B?clVKbUhOTlZUMnFHazAwR0lRZWtBQk42eE8veDhvVmdKdWRhaHVCQlRiOHpO?=
 =?utf-8?B?enpDU2lLTlJrdlg0WS9VL20yYjc4bXdQelQrd0JXQVNNemlSM3I4ZDZvbDBj?=
 =?utf-8?B?ci9hKzZjcnJObnljNWNNMzhkYXR1V1ZGdG5JSjluRUl4N0t4Ykp2ZDBlZVFn?=
 =?utf-8?B?aExucVRiWWhyWWJXcEE0OHFrd3lVbUhaWUszMUp1bnBjQTV5RnZZRVdrZWpD?=
 =?utf-8?B?WHVVdlN4Y0U2a3Y2eVY2c3c1YmxNeXNFYVhxQ3k1elNDK1A3ZXJ5cXhlVE84?=
 =?utf-8?B?T2hVRm8xNkhSbDNHdnk1cjExU2k5NmQ3aEN2RVN2THhtclNab2RFdEMwQ3Ri?=
 =?utf-8?B?bVpQZFhtcGVsSHA3b3VRT2tPa0RKWkMvanduU0JuaEVNRFBKTEVRSGxRWGtJ?=
 =?utf-8?B?MzNrZHh5VmxOVFNKQ3krS0JBSVdOZm9FUUpDZi9CS0htOE9LdWEwNmZYOWdZ?=
 =?utf-8?B?bnJrbzd4VjlDZk9vMVJlUDdsL2szQjdJRjBWV1FLUnVmblVsRFBjUzZlNHJR?=
 =?utf-8?B?ZVBhRlpxbytTWGhRbFJEVzlFaGpmejdTUDBKeVUrL2o2RXMyZUdoaVNRQm5N?=
 =?utf-8?B?emhzR0VPWkk5cDBjazFMTFdGSFJ0RlUyRXMzUnc5SkNTbDh2dDhkaDlZV0tm?=
 =?utf-8?B?RWtURjUrRHlyOWg4VDFJdG5uQUI0TS9JYkJHV01FNVFIOXUwYzlPOTY4NWdG?=
 =?utf-8?B?NkFQanUrSDhHUHVjOUVHMG9PNjNMS0s0K2F0VVV5VXNzOHl3QXBDY3FyK3ZG?=
 =?utf-8?B?TE1UVVlYanI2NDVnQkdnVGowbHZWQXplR0t0OEF1b0hIenRoRG42QVJNVlA2?=
 =?utf-8?B?QmszVXpHeXN3a2FRUkdQajRKdFVVSWJ3MVFsaktNWXVlSW5lTmF3UnVkcm91?=
 =?utf-8?B?U3hKcWxtVDZaSVRZdXlOanl4UTJkR1d4SXVYK1NGV09SME5YT0EzQm5iNEht?=
 =?utf-8?B?S0NsdmVHL0lRM3dURWI0MnRjMHdzdFVhbXl5VHYwdGlxcVNTNGNEYnJpK0Vo?=
 =?utf-8?B?am9PTUx3MHZYK3JMaVFxMVNPdXB3UDBOVDdKV1BWQ0tsTDBJVHROUGpiNFZ4?=
 =?utf-8?B?Y2hnalJ6bTVQOFhYWEhmWmt6dVVhdzRDU2lERytCTERGeEV4OFlwckhDam5L?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe07205-82d2-4ce7-d944-08dd6cf4ec45
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 06:02:15.1866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Qg3MjfsTsmUFo6f/djCIKQzwpH9JS5oB2zdfGNA8c/aeSADJJRITldu/dCB9oXhJaGvdazXshmU/RXjqPYAOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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


On 27-03-2025 10:57 am, Borah, Chaitanya Kumar wrote:
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
>> Sharma
>> Sent: Monday, March 24, 2025 2:40 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [PATCH i-g-t 2/3] tests/chamelium/kms_chamelium_color: Fix ctm-
>> limited-range subtest
>>
>> Test is fixed, now we take chamelium capture after setting output to full and
>> limited range and then compare frame dumps.
> We should add some details on the steps we are taking during the test.
Sure, will add in next rev.
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/chamelium/kms_chamelium_color.c | 50 +++++++++++++++------------
>>   1 file changed, 27 insertions(+), 23 deletions(-)
>>
>> diff --git a/tests/chamelium/kms_chamelium_color.c
>> b/tests/chamelium/kms_chamelium_color.c
>> index 68611ec6a..355047ed6 100644
>> --- a/tests/chamelium/kms_chamelium_color.c
>> +++ b/tests/chamelium/kms_chamelium_color.c
>> @@ -352,9 +352,10 @@ static bool test_pipe_limited_range_ctm(data_t
>> *data,
>>   	gamma_lut_t *degamma_linear, *gamma_linear;
>>   	igt_output_t *output = data->output;
>>   	drmModeModeInfo *mode = data->mode;
>> -	struct igt_fb fb_modeset, fb, fbref;
>> -	struct chamelium_frame_dump *frame_limited;
>> -	int fb_id, fb_modeset_id, fbref_id;
>> +	struct igt_fb fb_modeset, fb;
>> +	struct mechamelium_fra_dump *frame_limited, *frame_full;
>> +	int fb_id, fb_modeset_id;
>> +	igt_crc_t *reference_crc;
>>   	bool ret = false;
>>
>>   	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
>> @@ -380,21 +381,13 @@ static bool test_pipe_limited_range_ctm(data_t
>> *data,
>>   				      DRM_FORMAT_MOD_LINEAR,
>>   				      &fb_modeset);
> We don't seem to use/commit this frame buffer at all.
hmm, can be removed.
>>   	igt_assert(fb_modeset_id);
>> -
>> -	fbref_id = igt_create_fb(data->drm_fd,
>> -				 mode->hdisplay,
>> -				 mode->vdisplay,
>> -				 DRM_FORMAT_XRGB8888,
>> -				 DRM_FORMAT_MOD_LINEAR,
>> -				 &fbref);
>> -	igt_assert(fbref_id);
>> -
>>   	igt_plane_set_fb(primary, &fb_modeset);
>>
>>   	set_degamma(data, primary->pipe, degamma_linear);
>>   	set_gamma(data, primary->pipe, gamma_linear);
>>   	set_ctm(primary->pipe, ctm);
>>
>> +	/* Set the output into full range. */
>>   	igt_output_set_prop_value(output,
>>   				  IGT_CONNECTOR_BROADCAST_RGB,
>>   				  BROADCAST_RGB_FULL);
>> @@ -402,11 +395,28 @@ static bool test_pipe_limited_range_ctm(data_t
>> *data,
>>   	igt_plane_set_fb(primary, &fb);
>>   	igt_display_commit(&data->display);
>>
>> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
>> +	frame_full =
>> +		chamelium_read_captured_frame(data->chamelium, 0);
>> +
>> +	/* Chamelium calculates the CRC for the most recent
>> +	 * captured frame; that's why CRC of the reference frame
>> +	 * is captured here.
>> +	 */
>> +	reference_crc = chamelium_get_crc_for_area(data->chamelium, port,
>> 0, 0, 0, 0);
>> +	igt_assert(reference_crc);
>> +
>>   	/* Set the output into limited range. */
>>   	igt_output_set_prop_value(output,
>>   				  IGT_CONNECTOR_BROADCAST_RGB,
>>   				  BROADCAST_RGB_16_235);
>>   	paint_rectangles(data, mode, red_green_blue_full, &fb);
>> +	igt_plane_set_fb(primary, &fb);
>> +	igt_display_commit(&data->display);
>> +
>> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
>> +	frame_limited =
>> +		chamelium_read_captured_frame(data->chamelium, 0);
> I hope chamelium takes care that it doesn't retrieve the frame captured using the earlier chamelium_capture()
Yes, chamelium capture() api discards previous capture and capture new 
frame.
>
> Regards
>
> Chaitanya
>
>
>>   	/* And reset.. */
>>   	igt_output_set_prop_value(output,
>> @@ -414,18 +424,12 @@ static bool test_pipe_limited_range_ctm(data_t
>> *data,
>>   				  BROADCAST_RGB_FULL);
>>   	igt_plane_set_fb(primary, NULL);
>>   	igt_output_set_pipe(output, PIPE_NONE);
>> -	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
>> -	frame_limited =
>> -		chamelium_read_captured_frame(data->chamelium, 0);
>> -
>>
>> -	/* Verify that the framebuffer reference of the software
>> -	 * computed output is equal to the frame dump of the CTM
>> -	 * matrix transformation output.
>> -	 */
>> -	ret = chamelium_frame_match_or_dump(data->chamelium, port,
>> -					    frame_limited, &fbref,
>> -					    CHAMELIUM_CHECK_ANALOG);
>> +	/* Verify frame dumps are equal. */
>> +	ret = chamelium_frame_match_or_dump_frame_pair(data-
>>> chamelium, port,
>> +						       frame_full, frame_limited,
>> +						       reference_crc,
>> +
>> CHAMELIUM_CHECK_ANALOG);
>>
>>   	free_lut(gamma_linear);
>>   	free_lut(degamma_linear);
>> --
>> 2.25.1


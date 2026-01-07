Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DEDCF6BEA
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 05:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8963510E00B;
	Wed,  7 Jan 2026 05:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isCNq6eK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79BA10E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 05:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767762560; x=1799298560;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j702AY+X2NiKUS4eAL0R9gAIHSXKiCeabV2Y/iKWHM8=;
 b=isCNq6eKYik2yhknENM23M0uKUnBpUkvWPc/een9GXwTV9kp28F1gtMF
 /nEOYnyS3bGuOteZeQe6y/1u2Ap1dxdEtUMQY88QkmAZzSpq/Z+1veTWm
 D1GQ1ki2ZPJjRfVBWYin26USLAdzQ0LO1iHXCibI0UOG40YCYpMn/eKTd
 2P9/y9dvj3VDPQCK51vDvRMn2DKS1QFfG2jXNYjhJshLhjy7TUxzLdyC9
 THuFX8PXswUDaKLC1XJPWc5t5RhWRL8KLwWOT7MUOyWxVk6+yfvzqmNu7
 qnNlnyjjRIP6Xi33peN/lETdk1/85V1/EvU2LuXWRZYBbXMt4uw793CMx g==;
X-CSE-ConnectionGUID: mqMzgLInR66aVL9rgE8gAQ==
X-CSE-MsgGUID: Mo4QN4iBQais/zLnXRvavg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79431417"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="79431417"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:09:20 -0800
X-CSE-ConnectionGUID: aMusGD1rSsyPPVkRY6akjw==
X-CSE-MsgGUID: 4t2ziTZcRKOXWrXfBMKv5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="201964794"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:09:20 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 21:09:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 21:09:19 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 21:09:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iV9nUCUiATzypNSRwdHkFltUyII+JWCtCrNteTNyqCxae8KCwmnUn3XTjmpcKORxG6lH69o6azOw+fLGyOqhkcTeXH6Jzi8hc0K7/keTRAEnz6c0Y4mt/SCi7aZ9ySjRShbnjgz9UEakPRfE8buzf64zd4yzh6LeyTs1ZluwltBzYgAKvaKh+zM77FvfEZFoSqCFTd5sjR+sjkwjqEI4imhYfPLsPRpokHQJUYjWW3RcwKF1ai062sOAE1VuaaEIGsQ1AGpSYMVtegjfbExgpnbu4cVAMGvIV5OnsK/A5wk+TP77QI2zMZQBUq4qG2XWc8z8pTRDx7eZONM3DQ6QaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br9RbklqiOQJU8uI/dZMtzwOr42gfhml/j7SrUykNcc=;
 b=pQQx5z77xmRMRgje7k27wyuBaG8mmqoRTEO6i5RCJtPNHH97zyeCK/QAc83nEFV07WetZB8W0NqG0Et4MzBkywRQvFABGyrF1J0XVcNCzfpKq3pE2mCXQl0L4JMsl5fOyGWhExjiYADTLOFt4/Saam4d5Y8pf9pPOLpv9FDRYrj/xS38LV2KRr7hNdd1Xerp49W8zPVGzgVXSLVee/P5gieYWxyGRd3nNGpSa40lpjscvIrlLQUSEpxa/b/XAHmD4ALBnXgPObewUI7XC36025F+wABj3cNs7O8Q+dYbrUWJm/Ip7mPqr3/gI1Wkeg9r7hgnLObjzpHirARoWoXPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 05:09:12 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a%7]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 05:09:12 +0000
Message-ID: <91375cc4-f608-4ff2-96cf-f90fc05e9544@intel.com>
Date: Wed, 7 Jan 2026 10:39:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel-ci/chamelium-only.testlist: Enable
 additional Chamelium tests
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <sameer.lattannavar@intel.com>
References: <20260106155130.79192-1-mohammed.bilal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260106155130.79192-1-mohammed.bilal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0276.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::19) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 903c1ab3-0918-42a1-f2bc-08de4daae531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|42112799006|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0hlUmdlWlgzSzJkU21SOENQMElWM2hnNXBySVVKRnVRdk1JdXVpREZSZWp1?=
 =?utf-8?B?K3hacEhjVTBQdmorb2lkazdCZU9mbmRhNWRzcll1NEpadFc1a1Z4OUtlMjd5?=
 =?utf-8?B?RXprWnpQRzBIa3UwNExHVnVBcEhIYkE2R3R4eXBCTlFYSzBaUVlCR2ZKV2hB?=
 =?utf-8?B?Mk1oZVF4dERaTDA1SS9ORElqRWZKRy9kYkp5Z0xzbENIZDE0NEkvL3pLenZn?=
 =?utf-8?B?WWQ2UlVKSUhrWG5ocjgrSnBqaWR4V3kwWU9WajZLRjRaMUFaWHhpTEc1ZjlP?=
 =?utf-8?B?OGZsOERHZ3MySkJhVWpPQnZPVmNXOGZFVks2MHY5eURWdVZGVWE1Vm1SY1hE?=
 =?utf-8?B?bVhvd2JZTHZINXIwWnZnZ3hqdlhTcGpobW9EbEZiSGZkS2lSNmNQNld2R0Nq?=
 =?utf-8?B?ZFNuUjJXTTQySGdpLzB1UzYzKzhFN2NzZmZ2akppRkQvSy8wUHhsQXI5STVu?=
 =?utf-8?B?aUpVK3ZZRkp3aVI4am5RWmV3TFVEWnRIYjNwd05sM0prZWdXMHhDMkJLeU9t?=
 =?utf-8?B?UE1PSlhtSU1hTlR1cWxlZzJHNTF4UzhEdzNCdDJjeU1JMWJISG91dU1DUGlu?=
 =?utf-8?B?aFMrVjdOVjRjb3hvNXlNSDBVQ2Y1b1RIdUZhb05lRmZ5NFRmTnFJeXJOZS84?=
 =?utf-8?B?VXJGWVAvMFhhUGdyNEhJOS9hN1labE1WR2M0UlVteHV6UUVGQ3FnUVdES2h4?=
 =?utf-8?B?MzdmVTl5K1djcWxJZlMrbTA1V2poNjFXTXpvT2gwMjVDRXYyaWlGODNKM2dJ?=
 =?utf-8?B?UGdvYk84ZkNSZEtpaDlJb2lmY0RvdkdFZXdnWUxSMUo0TUZhRmNVWGoraXpC?=
 =?utf-8?B?R0g2RDlXL1dPRmVIZHhtQmtIUGNMYThkZ0RqRDNsN3VxN2RvS0lQRFR5c0Ex?=
 =?utf-8?B?L0tJdXNNQzFweW04S1pjemNFT3hLdGRab2dFZXVQV0FzTEdiZzN4S3Z1eHpa?=
 =?utf-8?B?dEE4aGpZYjNDdUtpZGIyOVYrMFZ2QWtKKzFoRzBNaVJoNkNGS3VMZXhEU2d3?=
 =?utf-8?B?TW5ybzFFWkZFTXlnQkJYb1Z6MjhObVplNGpmdWc4YUlRdGhhN2tnenNSV21z?=
 =?utf-8?B?YzhGMFd4bXdUaXBINmcxS3ZXQkFxeWlFa0F0VmFGRmJiZGhWTkNrS1ZPNVd3?=
 =?utf-8?B?NXdZOGpEK1poVE5rOERSTG9rb3UyUXFGVkdNVnpUdCtGbVNOY0VnaVBDRGpn?=
 =?utf-8?B?Z0hHVFN1bjdYVUptQnpvNHc0U0dGZE1icmVtM2pGeExLOUdZZitUVHUzbHdx?=
 =?utf-8?B?akpNQ1NyTFo5c0htNFpYUnNUK2tFRGQ1emMwT1pQWkJXbThDU25nNDBTaWh0?=
 =?utf-8?B?WmtiNmZhVk9oVGlUV0RCM0R4WW5Va3hTdlMzSjhRcnAySTFnY2FGOXVhZzZH?=
 =?utf-8?B?cmRtVk1JNFpiVS9zQTMxbnRYaFFwWk84SGt2Q1B5SjJKWFFrWEFndDdVMWR1?=
 =?utf-8?B?WGxPem91Ykl2eXRDSmVKVHUxY2U2d3pvVmVLZDUxUWs2bzFlWnZNU1RTU2F5?=
 =?utf-8?B?THFsQ0RUYVZmK0phL1JQb1dGeWxiNkthM2JDQlBET25pUFdnbHNXUUFYSmNV?=
 =?utf-8?B?VEFPa1Y4M3J2Uy9hM0VVQjl6WVZmclN1N2VvODhYenNyRGF3OU1kUFBuZmJ3?=
 =?utf-8?B?U3FaSkhwd0lkT2Q0WWk3eTZ5dUszb1hIM0FrZHdONW0zekhQNVA4K3N0Zk5w?=
 =?utf-8?B?c0J0UUxZczVrS0ZZS2VOSG1Tb3BKWVF1K0czRGdCTW9SemNESmhXYVQ1UUhw?=
 =?utf-8?B?MjdWM0VjaUQ3TWgzVzVUc05BT011Qkc3aDZsd3NzOW1XSnN2NFE1NjdpUy9I?=
 =?utf-8?B?WFBmNG0xYnErQ09pVzdYc0pwWkRaWnZUUTVJQWhTVThkb0ZoWGZxQm9zbU4w?=
 =?utf-8?B?Y3VDWFVzQU9DUHlkVE1GQnl5Ky8xYndhRFhvRVZLeGo2RmxKVzBENERyeXNx?=
 =?utf-8?Q?lg/I2D07RDjez3/uZM6Y2jYKb5h55KM9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWhLV2o0RkIwR2NvM1Y3WVNYM2Ixeit4aFlJMVJ5TVJIb3RWUUI3d09sM2lR?=
 =?utf-8?B?WjBjaWV1dk5sblVOVE1lV202a04yOVVWaW9Pc3JqK1k3Y1FINHNta1FxV0xu?=
 =?utf-8?B?MkN1SmRkWThtcVk1cFZZS0MwbE43ZEJOT0xFZW9sUVhiRGxCS2J5eFJkNHpL?=
 =?utf-8?B?b3luZWIrYmNNekVNTWI2SFdXU1FtWWQ3ay8rQk0xakloYk9wTzQ2dnE4NVQ4?=
 =?utf-8?B?Rzg4K2V0TS9IeDAvcWdKS1Z1MHNBaVNuMHNtYUpQWU01OEtYWERuRGRsY3dP?=
 =?utf-8?B?eUhvTVBSUXZrSWE0UXlZdWl6enJsT2llazhYb2c3SldVWXV3WW5xOGFNL1BE?=
 =?utf-8?B?Q2E5eTlveW44OTdrTVRmV1oxZkk4YWcyUGU2UHNDUkhmR3RScUk4Q3E3Qndh?=
 =?utf-8?B?MHF0c2JLSEFBbGliNjZiREtFaWl4Z3Arc01UdlZaN3ZTVlBIOVZnU0didlNB?=
 =?utf-8?B?bkFaNWQ0U3cvQ3VJaFNMMzN0b3RmWGdNaTR2ZEFkdjFtQm8yRmFPM3BvMkpi?=
 =?utf-8?B?THU3QzZBM0dzVWZjMnVzZThQQksyNkh3S1VTRU9OSkg5UnlGeTB5TFQrUlpY?=
 =?utf-8?B?UFRpUnVrS0l0cmRUREF1OC8yRzhRTDhDMlArYzVHNWM1MThZWU42SDMrUSt0?=
 =?utf-8?B?QW84dzFEM01nK3QrcG1lWmNJT29PL1ZYOG1QWnFaTXJsOXRwbWdDdDZ6VVhs?=
 =?utf-8?B?R2VwZzFkQmpBMnVveFVVVFk0cHAyTXY5UThwRW1ESnJhZis4RWsxOFVJYmpT?=
 =?utf-8?B?SlNrOFFXdFdWUy9pYzU1cnRKU203YkY0NmF1QmVqNWtKelRYS1dpWmUrcjd0?=
 =?utf-8?B?SFZOVFhVb2kvR1hmOEtlQ1Z2VXRIQk9UbVlpRHJjUTQ4SndHZ2dXQWhLSGlN?=
 =?utf-8?B?eXBlNTdRQzhGNk9WWUZyZDNVMFp5OGlUT0lkbUpBT3JHTDRENktKVGFmUWZO?=
 =?utf-8?B?YnBpRmhSbnhTdVFSTUx5bVREdVpLR1I5c0YvZlRFRkZQVGE3WU9yaFpVby9B?=
 =?utf-8?B?UG5RNEVGZ1dkSlJmNjBZMFpWbTJacFlDOWRYWURLK1RXNHZTbnNEcUp4Wkdh?=
 =?utf-8?B?N25BMXBNRFM3QXdvRDdxem1UOUhWVUIvOVdWVDdEOGhOTHhkSU9vSXRZODRS?=
 =?utf-8?B?eGdCc2pRT2lvODNZUHViWDVYM3NBTjhmT2pMQlUyWFhvcEx1Njd0MXR0SVhC?=
 =?utf-8?B?THpSY1FsWVdMT3hhanZrQzN5SU9ySjJkZGJQeVl0NSsvKzlFQnk3OFdqOFNp?=
 =?utf-8?B?VjhnemczTG1MNzdUMDRvRVFzd0Y0MzRIc3VZdGhoRnZiZVhjWDJ6ZkdDTnpH?=
 =?utf-8?B?bC9keGNhS0NKdE1oZVhReGhkYUM4b0pPWWluYzlLVUdNTktFZlRrcGV2NlQr?=
 =?utf-8?B?WEV5QjRMYmY2V3JJMU5jSzJnNzA0Ui9SQWhDd3pEMmhodzZYeVp1eklqWWVI?=
 =?utf-8?B?dnE2bkFMTkxoTFR2L1EyQ2FFR2hjeFp1YU41OEpSMGpLeHhzM2tBZm5RY3FL?=
 =?utf-8?B?eDF4QXlXa0tBdkcycFcybGtsZjlYTzNiZG1GZ1BWTFJZWHJyQ1oxL3ZVUDJH?=
 =?utf-8?B?NzFET3lKMTBXS3ZIY3JxejlCcDlLOFpnaUVuNmF5WFdzcU5TemJBM0cyaDBL?=
 =?utf-8?B?ZG13M2NFMnB1OG05SlZMZ1FaYnpOcURmZXlSd1pnSGxDUXhsMGlrTUY2VXl1?=
 =?utf-8?B?dDM5VWxick5odlVYN2d3NWhjMlRPditaTTU2cDJSNGt4SE1FeUlVMUg4K0JL?=
 =?utf-8?B?RTc3SjdpcmsvTWsrakJDeWJ4N0R1Vy9hY1B2WmpPRFkyYmp2MWJkQjJvT3V1?=
 =?utf-8?B?OFh5QnJQNG8xeFBiMXcvMzZNaXAwUEVySW5wK3RFWUl3WXJFcnk1RXprZ2ZO?=
 =?utf-8?B?NUJYOC92RHh2YVBnWVc2THB0WXYvVWNlM0RIWkxiZlRzNXBXdExSbThOQllm?=
 =?utf-8?B?dlJnRG9HZGlBQ1F4NHVRZDF4N3UzbFM3aDJrMVpPRS9hT3I4eTdoRVY4L3BS?=
 =?utf-8?B?WEtleXBzVDF2a0xKY2wvQ1Nra0wxQzZuWWhlQnUrTlhLL1VFLzZFcmJHZTZq?=
 =?utf-8?B?ZzBPZDdoaGsrQ2ljeTVCbTJOSnBrTDdRNjVONUJBVlZQOXpzblh5ZG5mSDVM?=
 =?utf-8?B?V3BnVVIxa0ZrZzlFWHQ0KzlLNnFhN1RmbEh1b1p4TmdEVTZMbEpwMTZxdXQ5?=
 =?utf-8?B?dGU3WEZxUStXb3gwN3djS3E3QURiczQ1RklTNTBGKzlaSlp0OUQ1cVUyaUY3?=
 =?utf-8?B?NEZhaFBMMWJQckdMNGpYVFFsUDlFM2dWUllOUHNjY3NLam44ZmJoTFFLNnc5?=
 =?utf-8?B?cXZ6QWNFM3V2d3lZU3FoZCtCUzVOekpqL1IwT2NiVFMwQnovU3h1QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 903c1ab3-0918-42a1-f2bc-08de4daae531
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 05:09:12.8827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSk69GD6uiHFjiBZvG7CABAK6WOeTjQzdGcU1g5jGIM2GuYRErnP9wMV2eR1dceVe+mYThHnR5/cAmNAaO0QSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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


On 1/6/2026 9:21 PM, Mohammed Bilal wrote:
> Enable additional Chamelium tests
>
> v2:
> - Sorted the added tests alphabetically. (Kamil)
> - Moved hibernate-related tests to the end of the list and
>    added a clarifying comment. (Karthik, Kamil)
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index 99d2f2409..9adace28c 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -33,9 +33,11 @@ igt@kms_chamelium_frames@dp-crc-single
>   igt@kms_chamelium_frames@dp-frame-dump
>   igt@kms_chamelium_frames@hdmi-aspect-ratio
>   igt@kms_chamelium_frames@hdmi-cmp-planar-formats
> +igt@kms_chamelium_frames@hdmi-cmp-planes-random
>   igt@kms_chamelium_frames@hdmi-crc-fast
>   igt@kms_chamelium_frames@hdmi-crc-multiple
>   igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> +igt@kms_chamelium_frames@hdmi-crc-planes-random
>   igt@kms_chamelium_frames@hdmi-crc-single
>   igt@kms_chamelium_frames@hdmi-frame-dump
>   igt@kms_chamelium_frames@vga-frame-dump
> @@ -67,3 +69,9 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
>   igt@kms_chamelium_hpd@vga-hpd-without-ddc
>   igt@kms_chamelium_sharpness_filter@filter-basic
>   igt@kms_tiled_display@basic-test-pattern-with-chamelium
> +#Place hibernate tests at end
> +igt@kms_chamelium_edid@dp-edid-change-during-hibernate
> +igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> +igt@kms_chamelium_hpd@common-hpd-after-hibernate
> +igt@kms_chamelium_hpd@dp-hpd-after-hibernate
> +igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate

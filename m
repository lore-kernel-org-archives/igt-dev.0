Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA14FC369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 05:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A097A10E170;
	Tue, 22 Apr 2025 05:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVnbCPRU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAE210E170
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 05:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745300492; x=1776836492;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FunxJ7XUQ1gPs3NFL2/o2sq7wtH53Mn3pOnnoBrstnI=;
 b=KVnbCPRU9ShkSc79yPTtDv61O5JnTU60b8FPszmJZHoTBPrqbw8jQsXL
 hmv2mUlJ6pmW2GZUgiGlRtGZRZhKVVpLeo/r6RBunUxbzYuEoMA0CvfOf
 PlGyGg90qoImgO8ZRGrY6poqC2g9mhHCM6zOz7LhKw3WOXdBzH+3t+2td
 HnY96VMn3OXsPEjSyOq0ShUAnz8QZUQxbqLmQB46/o6QkezI2dEw2TQLS
 EMto0167L4DLvj9ibN6+Usug4+r5AHo/UDR4nWc9fevLnV7G+OUikjyXc
 ffFDOuWUPx5t0oB/zlCWF6hJJ2LvhFoJjG2M+jn9nEaavUR6b97un+YiW w==;
X-CSE-ConnectionGUID: V3/kUK0TR0Cao+aqNJhbiA==
X-CSE-MsgGUID: sm5O5kFnTe28yzfJVv2beA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57491561"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="57491561"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:41:32 -0700
X-CSE-ConnectionGUID: q4Nhy7TNQxiyd9dFF+VwZA==
X-CSE-MsgGUID: GPGejMDRR0+PrgtIxOITWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="136891733"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:41:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 22:41:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 22:41:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 22:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghZYRnglzU2V8LTERi4GRdykq60c0m2ILSTQZKKL4uEid+ZmNPZOYsJa/alLjfhW8nzYY9dE1N5WJk/bJRPXjWlK07E+4x2UzkgSqg0NizntSBaIyOumEofHFzrFWeBtTV7T0x1G4C/5KQqdhDDxjwwvpuioBi/3iXVqAzQlAx3v0EW74CRGcMsvS3vglaj93ujgqLqGwH/leVKShCxWMja8gE0SCqKt5Gwrc4P1T74dXqS2/MmtYKdK4eDe2FAGR4VJvvc9XrIKUzuorV3sASkDL/MyJ1yv37Odbdu4MmmK8wjeI/ryeHStJm+UR01LYTtY4WQFj6JVklvMVKxOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lwp/eAdKn/s9HVD+/9mSl1JYTRvIuyS9tDtglUSBo7U=;
 b=MKOoKrqbOPYDREHAob/ILpno0ZLSk1MRhOmVDpj+axe018SvHJZA9jJms9A3fQnkGGrMCqsrQVIeR39yWEZDGzq2k63tyj8Vtgy5iCqeA3oDswtIvYdlU83rfbsXgcPqvDLLNIQigmI8QazAZ36IT+pKwPcuj3HpzRvVbWfe+bbIq/HtKlwfEpw+hlWwgx5DfFTo/DmgliZB3x8bmB29UDPUqEoeewBKS7BkuN4bIntZRamTjAJPHGu5FqIqOS0Fvp88bbBvYx3aE2ohjmDLX452p08jUrV0jtehpI7G3aH8LEETgvdU+DH/rmFLyv+bmRVpALYfvFY3L8cYoN4sig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA1PR11MB5897.namprd11.prod.outlook.com (2603:10b6:806:228::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 05:41:14 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 05:41:14 +0000
Message-ID: <b5b78b6b-3409-4798-bb45-9e2b6705d94b@intel.com>
Date: Tue, 22 Apr 2025 11:11:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_color: force
 connector reprobe after plugging ports
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250415063742.3026718-1-kunal1.joshi@intel.com>
 <20250415063742.3026718-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250415063742.3026718-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA1PR11MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3753f4-d857-4597-f56f-08dd81604baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azNZbjdqTWlkZHBmWGl1dTZqblZCazZNaG9xTUJQNWJQS0RtQlc1cGpYekFR?=
 =?utf-8?B?MWhlTE5BbHNrRURWQkV0bkpONjN5VlYxUVppTVNUUG11VXZGQStxbDZ3TERN?=
 =?utf-8?B?Rmx4OFdEemZjeWFEZ3FaYWpVdGI0dFRMQ3dmVDJUV3dDbkZTalMyQzFhdVg3?=
 =?utf-8?B?WGlPbEZFSmdjK3UxNk42NzFLdEVKNi9tTW9QRmJvZTJjZDE3M2N2V0c2Znpn?=
 =?utf-8?B?d1N0Ti8vSzlTYmJXQ0YyU0dKUEIxWVdqc0xRRjhHa3NuYU1MSFpFNEhFNEJ1?=
 =?utf-8?B?ZFNmWVZDak05WVRLNXQ2SlFwQnlQekwzRTJPR1I0SjdRN0V2bDFuTDNyUnFp?=
 =?utf-8?B?aTFaeTdsTVJ3V2FUaWR2cWVxbDQrQTNEUXlkVHBsL3k3UFdOd2NHQmdQcmI3?=
 =?utf-8?B?MW9yV1ZNT3pSK1dLSU1qcWs4cjJERGhQR0g4dW5IdTJJeFF2WmVXN2hXeUZQ?=
 =?utf-8?B?bGJhOHowSGUvOUdGWE5yT0RUNWlERnYvRVhsb0xNN1ZyUURldFdDTnQwOGkz?=
 =?utf-8?B?ZXJTSGJEa2ZJaDJBR3FTak9xL1BrajcvK1B2VjBWK3pPalQzUmdFcTBEcDZZ?=
 =?utf-8?B?cjdLaWNXNkxvNy9vTnBacVU0TVdBV1lLVVErU0R6eXFubkhjTngvdk5QL0Rq?=
 =?utf-8?B?OG11RWJSM0I5UW5Ua0NXdVhiNVJkL1R1SFIvb0tVM0tnbGlpQU5ldXlBbUNQ?=
 =?utf-8?B?TjIzQjh5eDlXVys0MUhDcWN3dlcrdG9Jd29jWGJSVFkyQ2xoeGVKazRYb3Bj?=
 =?utf-8?B?L25uYmRHZnhEUXdwMElpSGFaVURIcU9jNkpXNUw0Z0w5b3dla3RhUXduMGMx?=
 =?utf-8?B?aGlIckZoSElVL0FQY3BTVHdXNnlieUNsekZwS1NCcEpxYXVXWmRpZHZLWEpF?=
 =?utf-8?B?V3VvVzQvWmtlQjNNK01vMkhWaTMxbXVUTmt1UFFHejJlYW9GUGhPQU4wWUZl?=
 =?utf-8?B?ODh6ZjVmUWhxZ2h3cWlZaHVwUG92eGJaQXJHaXBYbm8xdEN1YWkwK3BVUXlD?=
 =?utf-8?B?YTJNM01HbFdGUlZNMkxNL3lXeERNUE51V0cxQ3VUZjZMR3h3VGFLK0E4V011?=
 =?utf-8?B?N2tpSm9tbHVhcXJRdjNpUFBOUEp3QTU3b0NLNjc5bGxpcUFDdzZXVER5Zlhk?=
 =?utf-8?B?ZDk1bWVRNXArLzFQa3JJT21MV3N0d2FwUmM0NUNQOVVGRTUvQXBYaXBsOTZU?=
 =?utf-8?B?Y0tuelhiNnFWRVYyYStiQWN2RnhJeTRkSXRVYmlucVpUMDNYWllZSG1iRzN1?=
 =?utf-8?B?ZUtoZHUwWW5rRmhiSzVQWkdoa3V2REt6ZVE5dnhkZ3FjMkVYbkVPV2pla3Vh?=
 =?utf-8?B?OTY5NUNlcG9Veld1V0tuaHpVOExPbjU4eUVwWmlXNXcyRklSR1JURWJhNmdQ?=
 =?utf-8?B?NjQxRVkwcnNvSU5YaUpLdW5tRTRFSE5QbmlFQnBqbmxqZ0ZiRkxMZVB2ZGhZ?=
 =?utf-8?B?aXhMNUo0Zitwenh6V2FtZlVkUFp3Z3dxMUxMMU1zVExxYjZEcnVRUVBTUm9t?=
 =?utf-8?B?UWZtUnZDZlhuZi95UHQ2aFVNRTFGNFo5bGN1TW0xOGlOUjg3Um9MNmxmcmUv?=
 =?utf-8?B?KzBSdGdwK1JrNnpUaFI5TVhKTTN6eE1QcGtBRHNUS1pYS0EzN253MjNZN3RQ?=
 =?utf-8?B?SmFXbTFLUWY3TzMvMG8ydTM4K3N0TkZOQmcvYmxJNUttbU5VdCszMGkrQkdF?=
 =?utf-8?B?MlRBdHcrOGo5WEY5VXI4dkYwUElOWXplSW0vWjVVdE9WeGZNcWhXSEJBNnRZ?=
 =?utf-8?B?RzBscG95NDJzK2NpTVdSaHcyeEk4WjdaYUJBL28vUDFzM3Z1MWVnR2lRNmZ4?=
 =?utf-8?Q?wFDhbZ7cuiqriByOs7K35pGzRNHIR/uGxocPM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUpJQ2pqdGtGbHhDRnJ3Vnk0MnNhbERyYnc2UXppb1JKQW83SEh4S2I4UFNF?=
 =?utf-8?B?QWxiNFN1N3hhbDkxdk8vWitXOXFIdHl4VE5IV1FXbW90SXpkWHN3WWcvYlVE?=
 =?utf-8?B?R1pPclNBOFZVZm9UbXBjM09oSHZDeWVGZEtxVy83d1JIaWV6M3YwckxWcnJ2?=
 =?utf-8?B?MDdRY2h3UVRQcm1EbnNFTTJlQWFvUXR1c0w0OFkwUnRjdzBJUmQ3RjdmUjF3?=
 =?utf-8?B?N3FWdlZjK0dDYWNoYXpCa2VKeEZOUWQvQnZkSTBUN3VaVm9ESjhObzc5T3lD?=
 =?utf-8?B?Rk5nL01KbUE2bVdleHNXRndJMGpHV3ZrNWpCT0h3VGxOaWs5cXdTc1oyWk1F?=
 =?utf-8?B?aGs3NG5SYS9oYjhZYUlNUHBlRnc2TllhTFd0NFJwajhRN1VXUTR6TlMzdWs4?=
 =?utf-8?B?bU00bnZ6anBsV0dwMkpQMk91Ni8yRDhEN1o3SXlmQ3Z3T3VHMEtQU0ZVdVMw?=
 =?utf-8?B?d1VDcmx6SWlUODhnanhVWGxQWFYxZkc5ZjVBSFJ5WElob21CQ2NWYlk1aUh6?=
 =?utf-8?B?Ymd5blgvUVBhVmxOT0NuWXFMb0NRTTM2K3NFR1ZLY3d3T0tOdXhRRE5NdXVr?=
 =?utf-8?B?ajVDZ1crYXlpbG9zNGhwQ1ZaSGFrWGFZNWtOVSt4eFVOZFcvVVhBTGI2UHV5?=
 =?utf-8?B?ZVdwdm96SGRFZEJFWnBQUWVYTlpUZHI2NnJVYzdkVDMvc21iMHZMN3BKT3hG?=
 =?utf-8?B?U3VFT0Frb3E4cTM2RCt0UEpka1lRRTVGWndpUlR3b3hyZ01EMzhtVXBCYW4w?=
 =?utf-8?B?UmkxaFZndTg4OXYrb05hMkhEcFFlb2Z0dHRwbS9oVWhuL2Eyd2tHYnR3M3hu?=
 =?utf-8?B?ajlzOHgwTGtxUGRnc0pzakhNQ2ZMSkkyNisxLzFqSjQzZ0JzZGRnaGV6SVcy?=
 =?utf-8?B?T1FuaU4wdmJIWkZ4dUo1bWkxQ2tpaG45YXAwS2Y1MVNMSmdmZUxYNGVRZ2Mv?=
 =?utf-8?B?M25EWGpsMUtFU1dZRFZyTDl6T0tCSVJWS05ic3ErTkZvUlJyQTJLWTBCL0dB?=
 =?utf-8?B?MTY1YjFoa1dtL2czNkRiRWJFckZiUEk5Vng5TmJKZ01ZbzlocDFkQy9jdkxJ?=
 =?utf-8?B?YWZIQ0dEcTUyaVY5YmNGRTZka3VuTWw1S1NzeTJZaDl1N0J0UFZ3VFhDc0NR?=
 =?utf-8?B?RG0vS2UxcjdLTHRVWHEwY1pTTGVYbnRxRVZxZjRHN0FFS3NrQ1VwYVUrVExJ?=
 =?utf-8?B?bHE4MVk2K1k1TUkvMzNYdmlxcy81QnMxMFlKKzhFenBGbjVUcTVWaDh0VnY5?=
 =?utf-8?B?QWlTbXZENUI4d0VqUFZ5aGF2VW5XZ3l5NWlJcDlmQ0FSajA0c2MxUytlYmtr?=
 =?utf-8?B?U3R6dU9XK0dzNGdnaDBBZG90ektzaGoxelFzT2VMb3JDdTRESHFoYWVJc3dB?=
 =?utf-8?B?aEY0a1M5d1NvMlhCTE1KMkg3THBndEQzV3VBWlZFcEF3c1g4aHRObHRRUUNj?=
 =?utf-8?B?ZVpIbmN2d2dhcC9nQ092U0NjMThvcWhIbnpCdXNwT25pdXBrVGw5VXRVWm5S?=
 =?utf-8?B?czI5YU9lUXJadmdBSm4xSC9QeC81SnZBOVhOcmZmS0FvMUJaRGR4cnY1a1NH?=
 =?utf-8?B?UGk5c3FiTGkzZFdxUW4yK2lPbGtoOTd2TWJKLzJLcTcrelBZZjRKR0JKNk53?=
 =?utf-8?B?QjZXU0lpbmk0dVJjYThRZlhRN1k3a0xsL3E5V2EyQ3MxRFhGSVRqblhrMjEz?=
 =?utf-8?B?TncvL28rbmlWcmVQY0tjNHJORlBaZXhrQTJVWi9MNW84b241dStyL2RvbGFm?=
 =?utf-8?B?clR6VW5FdWpXdWprR1lXcU5NRXZlbTI2L2o2d2Q0K0JjZTFlOW8yYmJIVHRE?=
 =?utf-8?B?NFlXbVNQMVlkbGFFUEFBdXZJdXhEWlgyNUVvbUdSSGhVQUxncFFKYVcyNW9S?=
 =?utf-8?B?WUQ5b0JhRlIvSXYvOFFJV2dLclNNYi9TaUdPK2lUS0VsYklqK0t2U3hGY2p5?=
 =?utf-8?B?Y0RsMFNPeFo1ZFJ1N3VrbmExOTJJRStmUEZ3T2NKaitnaklaZ0JKT1RaTG9z?=
 =?utf-8?B?T0krQ0VpelUyRUhpRGlaVHc3azZDZ0ZQVWw0eExQNHNnNVFVT0VUTVV4RVpo?=
 =?utf-8?B?c3dGeHp5UVpxR1JrZzNtNStuQm1yamZXK2VXeG9PeVNVL0NDbC9vUFRpb3dx?=
 =?utf-8?B?VVQ4TUR2UXptQ0lhU2I1WWlneTNSeFNxaVBaUjBQMkhySDRSSXFJWFRPOEQx?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3753f4-d857-4597-f56f-08dd81604baa
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 05:41:14.6540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZku5licpAUGieS+DtRbtL7McCpSVJmqR+ETAJFqliTcJMJdnjolBCo3VUAUNR0KZ2sUvxQz5PNTWS5ZWkUGmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
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

Hi Kunal

On 15-04-2025 12:07 pm, Kunal Joshi wrote:
> Force reprobe connector status after plugging to assure
> we always have DRM_MODE_CONNECTED status for the connector
> before proceding with the test.
>
> v2: use Closes tag (Swati)
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2371
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/chamelium/kms_chamelium_color.c | 25 +++++++++++++++++++++----
>   tests/meson.build                     |  2 +-
>   2 files changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
> index 5f61bc2ec..bf6510969 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -31,6 +31,7 @@
>    */
>   
>   #include "kms_color_helper.h"
> +#include "kms_chamelium_helper.h"
>   
>   /**
>    * SUBTEST: degamma
> @@ -736,13 +737,29 @@ igt_main
>   
>   		if (!data.port_count)
>   			igt_skip("No ports connected\n");
> +
>   		/*
> -		 * We don't cause any harm by plugging
> -		 * discovered ports, just incase they are not plugged
> -		 * we currently skip in test_setup
> +		 * The behavior differs based on the availability of port mappings:
> +		 * - When using port mappings (chamelium_read_port_mappings),
> +		 *   ports are not plugged
> +		 * - During autodiscovery, all ports are plugged at the end.
> +		 *
> +		 * This quick workaround (unplug, plug, and re-probe the connectors)
> +		 * prevents any ports from being unintentionally skipped in test_setup.
>   		 */
> -		for( i = 0; i < data.port_count; i++)
> +		for(i = 0; i < data.port_count; i++) {
Add space after for (

Otherwise patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> +			struct udev_monitor *mon;
> +			int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
> +			chamelium_unplug(data.chamelium, data.ports[i]);
> +			mon = igt_watch_uevents();
>   			chamelium_plug(data.chamelium, data.ports[i]);
> +			igt_assert(chamelium_wait_for_hotplug(mon, &timeout));
> +			igt_cleanup_uevents(mon);
> +			igt_assert_f(chamelium_reprobe_connector(&data.display,
> +								 data.chamelium,
> +								 data.ports[i]) == DRM_MODE_CONNECTED,
> +								 "Output not connected\n");
> +		}
>   
>   		kmstest_set_vt_graphics_mode();
>   	}
> diff --git a/tests/meson.build b/tests/meson.build
> index 9224145cf..6f0beeb0a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -368,7 +368,7 @@ extra_sources = {
>   	'testdisplay': [ 'testdisplay_hotplug.c' ],
>   	'kms_color':  [ 'kms_color_helper.c' ],
>   	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> -	'kms_chamelium_color':  [ 'kms_color_helper.c' ],
> +	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],


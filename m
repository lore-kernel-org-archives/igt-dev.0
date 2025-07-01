Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37589C83038
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 14:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E473F10E5C2;
	Tue,  1 Jul 2025 14:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ar7h2PNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3829110E5C2
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751381688; x=1782917688;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kjL45EFJAtTLBlmZZcq+O7njA6mEQbsDJj4Xh1/avMI=;
 b=ar7h2PNV3tCNDPgE2M3RKnVHiuTdAOfp1Jir8s6AmfqkZSitEMII4RrM
 braQnz2uh1FfrlCq1sD9RQiNlRiK7WFVn8g0bjJ8ZXUaprTl23S0VIWoQ
 dhiiCoO0m9/zhwynUYh+hn+48bBIgSGM3MvlqidDFAZvq60wV9mDw7JDm
 DHZzFLNn3v3agaOPSbrBtWJP5k4LMr0OkVFnp2CgauSZgPE9QGHzOiSEq
 5V51ZhRtf3NwEWhORX7NFpr7trjIAbJi3nG9cXcmkHgkLQBrvjZ+a+sdx
 WXRy7FTILzeu/Khd67X7aCu3UKvWaTsDy7BWUqzKzfg8k5pL9L2bnK07u w==;
X-CSE-ConnectionGUID: jV6K6i7RQBm6RP2n/IhWQw==
X-CSE-MsgGUID: SKPUVVI7R5as3os6Sz4S0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71212915"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="71212915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:54:47 -0700
X-CSE-ConnectionGUID: jsxJlkgpSHOVyL2Ih7yrLw==
X-CSE-MsgGUID: WTVtopBaRBCAfoSpby0SQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154104082"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:54:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 07:54:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 07:54:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 07:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdRmZkxGokaMOT37Msrd3DUwEjkLeGxkppPR7V40w5Az2xwTpqXcZr2XIlsuvVhxwHNDTWgcRAS4cSxLtp0Sqp/2jgRugLueVMwxOBT/SHUuJGN1UUSmDC5/YMrZ3zezDepQah2/C4qXG/0k6sxF3w/3rCINmvXRd4wwbDvm3BXOOcWd6fExDJ/6q/rMYGPssERN9Merfhi6UBeVZqmBftEWRE4fmBZRK2At3NrA4PEstlehi+MmE5K+r6PNSH8etC5VG+aCMlh3B5+WChIJtlWQJOIP+v8bq0xl7o1/9jxRaHnq42N+w0FcNNHuOkHmCPu8A0uAUtyanUMiUzwUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVPWfi+nTHKR0ZdDg30I6MlsQQMbDVkZHjEhu64rZrg=;
 b=AFRbVwHsR7seSXp38CIhEYMjZUhK8EGeaJefMPcHDUZGkvBSIhL7IuA3HuDiX9V460q/uaeJn6IcpGownh2FE6EEwHg1Ycdbr9mk02Ir/JNUplvYiA44nwyLcZMn+Cakaz9aoOxq4X9qUYvifp0U+yjgHN/Wa4ujhsDH1uVrK+LC0fN8zc1JuJHputjgy9MOLHcZ3U1uft/HN8wmep1ICXBeumk0J2r3CFLsDX8ZmKI8PVDn6YU6ljNc1+VrsznOvg3nX2iFLRUz2sCftz/m47QJ7Doe3KgDBYGdhsTxkRX5HooqGYTUmD8XHgNoTNgtfIPOK4uSRsFUYSmNBg9yMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 1 Jul
 2025 14:53:59 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 14:53:59 +0000
Message-ID: <3974b663-c745-49a8-bc1f-9ed12e76ffc1@intel.com>
Date: Tue, 1 Jul 2025 20:23:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] tests/kms_flip: Remove assertion dependency
 on link reset retry condition
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <mitulkumar.ajitkumar.golani@intel.com>,
 <arun.r.murthy@intel.com>
References: <20250701110149.395301-1-ramanaidu.naladala@intel.com>
 <20250701110149.395301-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250701110149.395301-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfa0c00-c293-43d8-6906-08ddb8af1c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHpzVjN3bnF1TWJRckdIa1JvV3NhcEg1SkNQcEwzbjdERjNocHdrUVQ2cGJE?=
 =?utf-8?B?VWZGaHNkaHJ5WkxJZTFaT0lkcDVyRklqQ2dkK0QrNnVMdWhJYXVMMFRHcm9T?=
 =?utf-8?B?djRsWHBzVFJxQUFtbGt5M3BIUk1hKzZGbURDdEhtQUo3ajBWNFZtZGkxYjNX?=
 =?utf-8?B?L0praC81b2pVQVlaU3NScnZKcjFwRkF3bTh4NGE4ekJQM09lVy9WdTBlTWRs?=
 =?utf-8?B?aEk4UzBaOFptOU5IMXcrOWhwYVpKci9QWUhFRHo2M2NRMTVnUFh3SnhOWi9V?=
 =?utf-8?B?dENwZnR3bG9FQSswOHpPVVZhbkVYd1pab21GZ0pNZ0wyeUY4aGFBVW9OektL?=
 =?utf-8?B?VzU4ZVc3Y0dYeEh5RGZyREJpN3dDUTRva2RzeU1yMjRzZ2pnQkZvakQveGdk?=
 =?utf-8?B?VUd0UzFhemxlZkMxRTVXN085RWtHVFN2STZwaFRtbmtRdkRvR3lNUE9qK1RV?=
 =?utf-8?B?WW1OYlFxcUtjd25rTlQzN2dBdlBkbmdsRklaaEFUSXVzSUlpalgwQW0zanlE?=
 =?utf-8?B?U1AvSEF6bXJiUXZybVdMcHZzSC9mbFF4bmxoclhHYnNZTm9NUEVLcDU2U1Yx?=
 =?utf-8?B?ZFZkVDFQYUVjRVUvS3laTld3aDNIRzlnMzljY1hwR0J0RUVub1dPMDFhMDI2?=
 =?utf-8?B?Vk9RTXZsa0d5WmFaK215dkUvTXh4em9rWHIvbWE0a1ZZZkVneG5VL251TXlE?=
 =?utf-8?B?b212L2lIMU5yRVlRRisrZnNyLzNMMkp6amp3bXFKNDhBemZlT2RGdW1YZG1O?=
 =?utf-8?B?RjVFUEcveG1rd05ITTR0VmxtckN2dGlia2V1Y21WRWt1RVNrVzV3TWUrUi9w?=
 =?utf-8?B?UWx5bnhqTnVKRTdkSDZEOUNTVzNuN0VsMnhaOEtGWkJuZXFxU1c3ZjFIcXJ6?=
 =?utf-8?B?MjdUc0tSUVFJMEdZQmcwd0ZYSWR1RHROK0RueHFXdWx3SlRUVGVMWExHbmJR?=
 =?utf-8?B?ZDVqYnNPaExzSDllVUlzQ3dyekFRdEtEVmpzNUx2SFh5anFROS9oM3FhQm8x?=
 =?utf-8?B?NklqT0FDZjNZVXN4VkJ3Tmd0UkV5UzN4L3lubHh1VEJ3K2xHMzBnd0hQdEJG?=
 =?utf-8?B?dWQrTU9ZUUM3YmE5WEJIdGZqY3VqL2NzN3dGcmttZW9tN0l3dWlZRzVMSlNx?=
 =?utf-8?B?N3pyWXlnZllBcllUdlplRnMyaEYxMGVZT28yaXdTTUUyUFNsdXVuTCt4bFMw?=
 =?utf-8?B?ZzhnVktBbHp5MWtmYXhEOFhpU00rdFY1WVl0ZG9zY24zV0hydFpqb0w5QjBO?=
 =?utf-8?B?TWdudTY4Y3U1bXRqWEIrdHFlUDJyVHFTbFcweno0VXRoSnFoOHVUaGJXRFZS?=
 =?utf-8?B?bVBFV0N3Qi9uRVNCUld2L3hTOGM4NGJvNXZHVXVJZC9qaDNkNXZWZHRGR3I0?=
 =?utf-8?B?Q1lGWXRqbnhQRkFvaDRFbXFFQ250Y3ZQWnByQUxwZjJkYmlZQzMvMVZneU03?=
 =?utf-8?B?SUNyc0phanRuU05IQ2JadXlaVWc0YkV6ZGxSN25Cb29zQ0poampvWlhNSHRG?=
 =?utf-8?B?d3k2WndvZEtRcnUzZkNwVldtN3AyK2RRSjJ6cVkzeUMzNGpvSzBqMUxpN1hB?=
 =?utf-8?B?WHJlSEJlVDRIdGVHMCszenVOT01FZ2NLcDFLaTdmNDZWSjlobzdvZlcraFpL?=
 =?utf-8?B?Z2pBS1c3cWIwRkxpcldyWmZIUlpadWl5UlQrU3NKeVRTQVBBV1VBSmUxaDM1?=
 =?utf-8?B?ZWhKb01NMEcycVJ1c2VyYW44ZVpya1VaeEFIMG10YlhQeDh3amFmd1ZwdTRh?=
 =?utf-8?B?RFBYcUk3aU5sUG1Wazl2cjU1KzlFbzNEZG9hcDdoeG9ubGpHR2dBYUlWVklY?=
 =?utf-8?B?K3BodFNMWGtEQlJjeWNJMldtdnpVeGJqUUVFaWFRZll6NkZsQXlmWEZGU1hI?=
 =?utf-8?B?UWdmV0VPdkRvb2lRYjU0R0V0Q2hjZXJKUFRsRjVORnRXZjJQN0ZkbHh0SjN3?=
 =?utf-8?Q?madwkb2fwZQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUpvV09Sei9FMDFFVVgzajFLVkg2UU9WbmpoK05IUFBqMDU2aTVoMXl6QXhl?=
 =?utf-8?B?Tkk2cldFZXpaZ1N2NitCT0JVcnUyOC9yR0d2SWtjU0hkb0sxNjVvblZNNkVm?=
 =?utf-8?B?SFRnUE1GdFc2MkJadytDYlRXbW9EMGdvcFNMWnE0MUVsb2FSd2JmZERodDZq?=
 =?utf-8?B?bVcwZ1BDRE5yaGQva3MvdDZKZWNLbTZic05GTUhpcUdlMnI3RzQ4TDh3alpq?=
 =?utf-8?B?OEFtRFZuNFVtNGUzMmFYbVVqTDR6K2Q1bDBsR3VEdUx1NzB6WGZIZlBldjho?=
 =?utf-8?B?SFFvdVVIbFJ2Vkh2emp1ZjhTMXRGUll0Qnc0SWVEeWpsVFFNc3NoOHdDck0r?=
 =?utf-8?B?MWVaWkhHQWlpWUJNU1Z5bU9xbGd2ZGZ1aDhmaXR0ejZMYjkrdXZodWkyb29G?=
 =?utf-8?B?TzdVaVB6K0tBL2xUMXhkSjYwNm52Q251VFIvTllnMitPVDlhT1ZKTkdLaUNz?=
 =?utf-8?B?RWxJR1MwZTRrYXRkbUVicFRCaWVrMkpqT3hKSElBQUltZEpMMU5iWXJIbjJt?=
 =?utf-8?B?MzFmQkd5Wjczd2tQT2ZQbG5XRmt1cHpkdE1wRjZaTktQOVJEL1NuVGsrUzRp?=
 =?utf-8?B?Q25GMmJKR0VSc01jMlAwc0xRcjR2TjJtdXF4MGVMNmR5ajF5V0lTMmxMRllP?=
 =?utf-8?B?RWFMVTRDMVh4QUF3a0JzNkpRZ3N4aTMwUU5TdzVISDVqZmN0SWZKdlZFdG5F?=
 =?utf-8?B?Q1dZYU8rUVBuMzgxbmJLbXFWMlZ1M1BGTHVmbUl2bDBiUldiUFNIeTdiV0JB?=
 =?utf-8?B?aU42bU5aTGx5VTErY0Y5M2t5STFSRUtmU3ZudWlKUVZRYmhZV25KNVp6T3I3?=
 =?utf-8?B?TU1LVEdBdTduNEEwckJnVDlwY3BNd01RWHgramZmUlNLWjJKWm5BR2JudmQz?=
 =?utf-8?B?ZUd2M2Nta3RsTmhqWUIwS0dwZ2dOaXNiSW1YcWw5NS9CVWRNWldSay9xdFgr?=
 =?utf-8?B?U2lqcjk2clZIaWxlVXZBTlQwcjd0NXVBRlpVa0h2SlYweTlEYUsrN2JoZ2ts?=
 =?utf-8?B?anl6Ujd0MFNhUkFCOWdLZFNKejl0VlZrOGU2KytyQ092ZGNWNDUwYml4ZTNw?=
 =?utf-8?B?YW5LNTV3bWFEVDF1UXRFaXN2SExOREdpYUxwVTJIdEJkY2ZhUHFYTExqZXJ0?=
 =?utf-8?B?bnRia1lNZkdHOCszeUlUVFZJQ2VVcEhrZDE1WG1ZUVNvN3o2aHI3TVNTWjV6?=
 =?utf-8?B?QllQNCt1VUhBQnVzM0I5b1lLT1MyRlljVG4vcTNrdHdkaTg5T21xMVlDaW1i?=
 =?utf-8?B?WGZ3UGZ0dFh6NWE1bkgxdXdyNGU1TGE4QjgxbWFZZ3N6T0VXNlJKN1VnZnVt?=
 =?utf-8?B?VE5Eb1lVTHJsQ1A5SFZKNzgwNThDNmlTZjhOYkt3ZE5GR2RBdXZuNUdVMzRX?=
 =?utf-8?B?bTREWnhxYmJoUFNKT3o3MGpPb05mVHBzSDFUc2J1ejZzNFVhSElQWlBWazFz?=
 =?utf-8?B?VS9neG96a01PYi8vV2UraUhTNTFxYkdEaHlsQ0syZkdINytmVGsyN2lCRlJM?=
 =?utf-8?B?NjJsNU5VUnNTMkF4MDVTVGV2TUVTeTQxSlI4REpyWlk4S0c2THhPamtXOVlF?=
 =?utf-8?B?cDVIcFRDNGZ3YXdPbE9UWXQwWEVQaXZuTDkwajExQmV1QkdTTys0SHNtT1FT?=
 =?utf-8?B?bWsya3RvdXFneXpyRnlhd3FyV1cwWUFpR2NoSVZEWGk5Qk00OFVpTzhWVlFy?=
 =?utf-8?B?NGZzdlgwUzR3QlVOeDFpZmpuNkUxRUtmOXQrQUpKQ2N4UFk1WkZpQ3hUTE5Z?=
 =?utf-8?B?a1VvdU5BcTd2aGRxMVp6eGlWZ1pXUjRXT2lZekI5Q2RRNFhaclVNUytvZ1Nq?=
 =?utf-8?B?UkV0KzVSak1HK2tKYVJtS0t1YlJDRjYybE1iK1NqTy9JTU5nRG1rUDloTlRF?=
 =?utf-8?B?M2djc1dOSWJVU0UvWlpNK1NlcUVzcytYYU5RcENrWHZKTHFIR1BBZlB1R0Zx?=
 =?utf-8?B?ajBtb2liT1FRRVN3RlRPNk5BTkM4Sys5UmcxaThVSmtlNUJJWkRHN211MDRO?=
 =?utf-8?B?clRXcG9GMDFPaWVxenJOOW1zTHE2REN5MGtZR1lOVS9rbEwvUEU5NEJ3akNv?=
 =?utf-8?B?UHlzMVJHL0VDQmpuamlsYVRMTStMOGdETjFPN3lXSHpxZHFVbnpNeml5SXV3?=
 =?utf-8?Q?ikOhOklGjYN8UJLsM/6/NDxle?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfa0c00-c293-43d8-6906-08ddb8af1c67
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:53:59.5377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaVNIHfc1ZhMALiIGRJqdt71hbCutFGxbJDZ38o6AUFg2u9u+QYWggQikljF9O4qw7Bh5YQm00FRb0yZlUPtZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
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

Hi Ramanaidu,

On 7/1/2025 4:31 PM, Naladala Ramanaidu wrote:
> This change avoids test failures in scenarios where hotplug detection
> is inconclusive or delayed. The call to link reset is retained for
> its potential side effects or logging purposes, but it is no longer
> part of the assertion condition.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_flip.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 4dfa1c483..8ce164202 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1641,7 +1641,9 @@ retry:
>   
>   	/* quiescent the hw a bit so ensure we don't miss a single frame */
>   	if (o->flags & TEST_CHECK_TS && !calibrate_ts(o, crtc_idxs[0])) {
> -		igt_assert(!retried && needs_retry_after_link_reset(mon));
> +		igt_assert(!retried);
> +
> +		needs_retry_after_link_reset(mon);

Moving this out of the assert will need changes in the function 
definition as currently it is returning a 'bool'. Also does having it 
standalone(outside assert) add any additional value?

Regards,
Karthik.B.S
>   
>   		retried = true;
>   
> @@ -1680,7 +1682,9 @@ retry:
>   		state_ok &= check_final_state(o, &o->vblank_state, elapsed);
>   
>   	if (!state_ok) {
> -		igt_assert(!retried && needs_retry_after_link_reset(mon));
> +		igt_assert(!retried);
> +
> +		needs_retry_after_link_reset(mon);
>   
>   		retried = true;
>   

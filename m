Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F048C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 10:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DC610E842;
	Wed, 12 Feb 2025 10:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTA7EItF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8FB10E842
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 10:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739356942; x=1770892942;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tFyVmVTFZTfAuHFaecear5Z1uoWf5GECJcpQgzkGxOY=;
 b=XTA7EItFkow6P8BnItBSd0zbxcPRpmSha6+1CupdA9T0FUlnI5xhCh3V
 ADoHQ5m2UYMWyrtvHLWOKxKog0pNCJ9CYJNvabaeX5hTjTLwR5qsAWaW/
 llFcr1kP5+NEX9TCUCzS/3uiyeY6V+k0s8RNrJ9q7F9Jrwx2inGRBZOZj
 VZepdULdnbTTzryE0mQFYK0KvaM/qzsyV/+JvpRcjTdveMW+Qtq7ACKuB
 T1H6DgRYJe0GCYibOvdFZXSQ7qz00oyWQzsv/xK5+fZS28YtSRXKmvrZg
 pdVjBvdURqeo+p/Qe+A5aRwy2jR2FyZ7YnUhaXmaIW9A7sX8qh0o37URW g==;
X-CSE-ConnectionGUID: WEBj5ruHRkyzvFpALoBXYA==
X-CSE-MsgGUID: 5AQmS8pRQ2qj6yCM3ZeBmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57540619"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="57540619"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 02:42:21 -0800
X-CSE-ConnectionGUID: O1MzYyT3QEqh2oWSEIBA2Q==
X-CSE-MsgGUID: dgw1k4O6SKSTay4cr/OKQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112766345"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 02:42:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 02:42:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 02:42:20 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 02:42:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVvP6amx+p5vq+Q+Qgad6kJ5ztnx9AKLQHXwBDc8Nh52zydY79VNw5Hy7lwXj0wbPldLl5fBp7DJXjfCS844dIiSESrK849sZZdKLJxLgEbQqEkaIVN4rF4YVdtiNOn4YUjPcLtG2U+hy2tiVLzd2vksygxXsc4WqXCX4n7v4J95KeWGvD59BYxgvtyIzkFCaoKEr35olFR7WkiCISPSCHvjA9z7lGXvnmfWglKP9IeRFKj86Iv2X8mJTx9kHrh9iNXFQthoEOudXbA22j9i0Bt/s+31Z20uKS/aP/6b/Jh/OP2lm84tG/usd/BSrL/sQdd5CmWCOc6W8bv4M3peuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OA5Ikw6N8TELnAPJaX+nOefOLEx3qENMiIEeXpjiwk=;
 b=TVli3dD2Lcy7gV2lf5H0yj7/BW9O42UAsDJb1wAz0+LywYKsM2+hbO14SYaWwbtLN0DR9tI9hQQpgR48oY2UpTjyaaCb4iDUY6r00skB2Vs+gYnlq4DHyQe9bWdd7MzT9rH83nllsPKgMD6REf0sqw4taYt68Mub/PmV2JD2AmlsJ+Yi4q7A/xuhtCbdtleKMVraOB3OkoevYxi08h8y3loGlredreVVw+fKXEgriENTmVITAATrbacNC0Ue49HujIu44IkvZG66hdWliZYTChkQDR5/aoXuiCuYHbKWU1jlMuao0xF3nCCA3tiI5oRTksSXA+lHn3MsfuuEOjKj0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB4809.namprd11.prod.outlook.com (2603:10b6:806:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 10:42:18 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 10:42:18 +0000
Message-ID: <d87b9a92-5ae0-4e6e-a790-9c1db02f60b5@intel.com>
Date: Wed, 12 Feb 2025 16:12:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_kms: Add lib changes to check if joiner
 is enabled for a pipe
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250212073604.1580120-1-jeevan.b@intel.com>
 <20250212073604.1580120-2-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250212073604.1580120-2-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB4809:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1deda1-e4dd-4485-1650-08dd4b51ec01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2czVHVEdllzWWFqelFEM29KaDV1Q0NWT2pEazRTOW1MaXgwb2JmOGpabmRL?=
 =?utf-8?B?eWU3NzBzSE0zZzEyeVJuT3B4aiszS0Mrb290QXU5M0RPR3VEMCtOQWRZTW53?=
 =?utf-8?B?TUNHaG5JN1dzU1hPcGVBUmJZU2dZL2oxZlhHOGFMQ1VIT1dscUFuMHpRcDBz?=
 =?utf-8?B?cjZMQ01ud0t5VkJweW1Lc1hhUlRsWXhZK2N4NVN5ZGhmZG9ReitaNzdUMUhn?=
 =?utf-8?B?WHFhVFJTV0h3MmVTYkhUNXpVWE8yNzFiQ3FweG5EeWk0Z2hJS1dxaUkrdExr?=
 =?utf-8?B?NHd0eFNkT2Q5aXZVRWl5UWdIMXI0aUtJYWxaUmk0djNTd2I5WUFpMmFnUHhs?=
 =?utf-8?B?WE5BTmJSTjE3TUxseS9Nd0gwNWNIRVJoMUk2YklsKzRRRkNuSUg2VUtuTS9y?=
 =?utf-8?B?UnJCVEkxWUtTY0xZUzlSK01BcGdObmtRcXFXNXU1RFNQWWI0d1kyYmsyNm1G?=
 =?utf-8?B?cDFJcFdBZm56M0ptWUdxQUkvVDZUeit6aGdieEFnMEVTTjZXZndnZ2VxdHhK?=
 =?utf-8?B?MWl4bHhXVkFrdENrSWRPSkF5SzREQmVRYzVnNVplalBWUzBCSzMrSVlIQzE0?=
 =?utf-8?B?QnYvbGdKeVg1dC80enRoQWRMWDgxQjliVG5GL2VGZG43MWtNQUpvTGhUZTFo?=
 =?utf-8?B?dUtKSzBIejNEeVYrQUJjSVZ6ZU03L1QvQnVKQW9RbnlkUlRuWnlyemtOR0lB?=
 =?utf-8?B?eE81SmVqcURtMzB1bWhRTlIyamwwR3hzcGlsTUpkYkRZRTRMaHhrNHJUKzdO?=
 =?utf-8?B?bEZCU0dNKzJjTVVYOEM0Z3FKV0h6TVRERit0K3JQZ2JFVVVDdldKc0lYRjFa?=
 =?utf-8?B?OTN0WktVbmlidG56QzJSN3ZXS0VZY2s4dE5VN3pIaU9pZUhFYTI1bkVBa1FK?=
 =?utf-8?B?RlJ2eDNJbXcrckFaYS82RHdyeDcwOTlzR040MXg0NWZTc0RwaHNjQ082b3Q0?=
 =?utf-8?B?OS8xT2xQYUJ1UkphTERxbWg4MGRRUHdWN2FERVFZSlRwaUR2a3BwVkhlbDBp?=
 =?utf-8?B?Um1DeVBXN3hORlVVQUo4V1U2SkE2S2g5ZTFUaHFLa1lHVVpBOUlwbFhDUEZw?=
 =?utf-8?B?bklCZXBLcjJMbmczWlRxdkFPWlB6MW9IZVFkNXh5dmF2YkhQclBOZ29ZQXdx?=
 =?utf-8?B?eTNOL2ZNeDk4OFRvV0pYdjhLTlExOGJmYVRRTkxXaVRqN2w1aWdnRVlDVWJz?=
 =?utf-8?B?N1plOXJ3RGMxeEEwVjczZ3ZkTDFIVDBIZk9nN1E1Q1lrbXZkWnV2YUFFdi9n?=
 =?utf-8?B?d255eVRSR0tpdGpTYWNIU1FVK2JCdVkxMURESDFOWldLdWUvVVp6V2d0SFNU?=
 =?utf-8?B?SjY1L25UcmhoMm93ZlkxcU9UVHZMNmNDTUtzb0NrNXZTREtjbk11OS9ySFVo?=
 =?utf-8?B?ZmdEaDduVVdLRlgxNGhLRHg0NUpMR1dEMEhGa0JyVGdXbWl0QkZPbmt5Rnp4?=
 =?utf-8?B?L05IcENlb3MzZHd5L3loSHZwU204RXlCQnBnN2RXR1ozeTFuUTNSUEJFTG5h?=
 =?utf-8?B?bVNzNnc5OHlyQUViVWNFOGxYQU9pNmpZV0h5Ly9NTTlqRTY4VTNtRVBaa0lI?=
 =?utf-8?B?OWhVV3k3RWRjVHI0VmFrMFR4bThTc3JoNi95MHZkRnFHMk5iazhTb2NPRkk3?=
 =?utf-8?B?dWo5K3hnOCs5amdwUGlrdzJXQVc4d21JSkVOK1VVMkRxMU0wNTFSTTJxTVg3?=
 =?utf-8?B?TEVoV01Ca0tEYmIzNkV5L3lQQnk2Q3BHbExxUmxTMHlvWFFWMkJ4TkJWNGVj?=
 =?utf-8?B?bHhNdVlMVFUxbkpTMkZycFBYZ0dVOWtQc3JiZDd0UXBYQk1NNkVKS1VXSHVC?=
 =?utf-8?B?T2hMYXk4THYxL1lrTEpmQy94aDFaWnJ0UEZjcXZ1Vm5GbVkrdVVQWTF0Nmh0?=
 =?utf-8?Q?x5iUP2ET3UTJd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmdzMWx5YXljc09HVCtwOThRa3kzbERiR1NZYTVVZ0JBWm5mVXRaSG1DUzc3?=
 =?utf-8?B?ZWl2UUhtRjFNMERqZW1RYllRT0g0enIyQVVTeDdDNXhRUHU3anBWejhNNVl5?=
 =?utf-8?B?elpQS2xFMWRjalpBaDU0UzkvR3FtTlZnYVo2QVljWDdzQWdmSzh2OWdIV2Jk?=
 =?utf-8?B?a3M1M1REN0tvcHJleUNla3RMREJsdEhySWR3SVlDSisyQjRjMzhZNnJGZUlG?=
 =?utf-8?B?bnN4TUhLVzFLT0lqWlFSVEtTcksza2RwNkl4MmdaVUlPWDl3WTh3Nm1PY202?=
 =?utf-8?B?bWFnQzR3dUdmMlNtcTZYQW5WalJCUDZZbTdZZGxSWkFsT1NMWjdwRkkrR0x5?=
 =?utf-8?B?SzY5cktqUUNsOWZFa2JaYTZiTmZWbEthbFFTRVZDWDlyWG82MEFDZlQ2T21C?=
 =?utf-8?B?cHRKd0R0R2d6MHhIYzNOM0lqeUY0QW1Xd0ZxaWRXWDl3aThzcm1CVFg3V1dW?=
 =?utf-8?B?cEo1MlZEbTRkQ2t2cDJDamdjMmllbGdwdEpPOVJDWFc0UVJkTkVZMmNGL05j?=
 =?utf-8?B?TWdJWG1SRFlobmhDOWl5S0ROWHEyMUs3TndOelprQkw3Tm1LcnRhSXpDT2Yr?=
 =?utf-8?B?ckNYdnI2a2MrMnc1QVlSS0ZkZ3JGbTRYdUdJOWYvdXFFbGdseG04aFg4bWZj?=
 =?utf-8?B?eGd0VnVhT2lhQ3J2RkY4MUd2M3RYK25kQ01DeW9WcFhOTGZRbEVaR2Y2V2tO?=
 =?utf-8?B?Z0hObU1kN2JMNnRNWlljdDZQZEZ2aUlnVVpCcjNONGs1RkhwMTVXWGJ5dkRq?=
 =?utf-8?B?dGkwRHdDT0xKUE01NEczSEJlR0RObEN3anhVODFFVWRIUHlQVFdtK1BGRzZz?=
 =?utf-8?B?SzlDOTlubEQrS2tCcGRLRkpqY01CbnAxblZCVmJvclpUMDNINmtVcWdyUnNr?=
 =?utf-8?B?ZjZRVm8zcEJUSktsQWFPS1FTOEFJVkdJSFB4RXM5TGE1OWVjUEhWeG1VZjdH?=
 =?utf-8?B?RU5SQjdub0Z5d2xRTVpVSTMzMndtMGVaUENJSkJIV05xWEJWS09CYWF6emw5?=
 =?utf-8?B?eEEwSC8vR1MxM0FHLzVLMnRSL2taWW9KaW9uZThiVHNTc3FidEd5TDBmb3ZT?=
 =?utf-8?B?WFdvblVyUnBoby9yU09ldXdtbTN5RWtwZ0VXQVA2V2ZVVW9YNHpxNnNNSzdR?=
 =?utf-8?B?ZFNTa2ZOODVSSkc1UG1JcTlvWjBOeFlFZDJ5Rk81K0pNNTBoMU0rTG9iUmxO?=
 =?utf-8?B?ZFgrL1Q0Q0RpdWlWdGhPQ2dVUXpTL0JLYkdiSGRYZmY1djk0MXBFNXlXSkxk?=
 =?utf-8?B?L3N1aDE3L0dDMjF4djUwaGV6Ny8rdXhJNzZrbm50NUt2VW8ydTdRVURteGZC?=
 =?utf-8?B?aUJVZzVQUkJlK04wRzlUemQ0MEZTbXJTWWROdGhmSjYwdkxVbi91dkFBY3lG?=
 =?utf-8?B?TmVaVU9IRHoycENQRU85eE5SQkdVSW9YT3dqVVlhd0UrYVZEdnBqTGN0ekJp?=
 =?utf-8?B?NG5TdEsyTy9aZlRxb25KcThYcFJUbXZNY2pxcnJjdW83c1A3blp2TEdDSEl2?=
 =?utf-8?B?cW5IWFJ3bk9KMXNlaW5VTlFrTnVCMWYrTUhYL1pPeEpBUWhOdmpPdk81NFRy?=
 =?utf-8?B?NkdvL2FKeTFWbmpRMThZYThqS2N0Wk5MT0Zzb1llTFJnRDk0V0piTzRlSWRI?=
 =?utf-8?B?SkFNdlh3ZFpJcG56NlhDcFl4NnQxekIwK1RJd0xpbjZXSzM4VTdDcERRYmU4?=
 =?utf-8?B?bHdHYTl0RjRTRTVobTBXcU9iQ1o2OTg3elRKeW9vWE9US1ZEYzhVU2licmlC?=
 =?utf-8?B?WXVZMUp0ZkswRFZ4RG5IQzFBU2lBa0JKZTdrcEEvUndHazlxbS9uRDI4bksv?=
 =?utf-8?B?OXdRQ3VnU0h0VmFMU3l4bWVaMzVDZWpCbnBjRHVNZmlONmx5ZURONFFoRTll?=
 =?utf-8?B?TUJDZkhYNnIxbVRPWk5DZlQvNi82OUtFWnhXRG1FK3hXVHdsaEhxL2Y0eHpr?=
 =?utf-8?B?ellVakg5ZlFsVVRVSXkvQk84MWFhMVhpbGxORmZlUXM2Nnk5QTdlRUNvYUtT?=
 =?utf-8?B?dUJVQTMzY0N2dGdodnlISzNkYkJORk9QU1ZpVCtRWG9EeWFTb3FncDl3ZUto?=
 =?utf-8?B?alYxVStvMGMxZCtrQ1FINk5oY1dqcXBuNUMzdWZDQU9naGlNeEdKNjU4ZjMw?=
 =?utf-8?Q?brfvcfEBxn9F4dhrdBzSSd7B0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1deda1-e4dd-4485-1650-08dd4b51ec01
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 10:42:18.3849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIVWE2HYxD2DFnU96XFcMWEPmUJ2RZ3Kc32eYmQjd0d7wVHblyiPdhqfNDqMMlqdEofy3930Je+ulhLYkARXBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4809
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


On 2/12/2025 1:06 PM, Jeevan B wrote:
> Added a library change to check if joiner is enabled or not for the
> given pipe.
>
> v2: Update function name and logic to check joiner enabled for
>      exact pipe.
> v3: Update commit message and rename function name and variable
>      name.
> v4: Update string from %X to %x.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 32 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 90f44b4d3..3caba7d77 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6406,6 +6406,37 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * igt_is_joiner_enabled_for_pipe:
> + * @drmfd: A drm file descriptor
> + * @pipe: display pipe
> + *
> + * Returns: True if joiner is enabled, false otherwise.
> + */
> +bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
> +{
> +	char buf[16384], master_str[64], slave_str[64];
> +	int dir, res;
> +	int pipe_mask = 0b11;

This throws up an error with checkpatch. Please use the decimal 
representation or could be defined by using bit wise operators to make 
it more intuitive. (Your call either ways)

Also may be we could add a TODO to move these lib functions to the 
joiner specific library file once we have those patches merged.

With these fixes,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> +
> +
> +	dir = igt_debugfs_dir(drmfd);
> +	igt_assert(dir >= 0);
> +
> +	res = igt_debugfs_simple_read(dir, "i915_display_info",
> +					    buf, sizeof(buf));
> +	close(dir);
> +	igt_assert(res >= 0);
> +	pipe_mask <<= pipe;
> +
> +	snprintf(master_str, sizeof(master_str),
> +		 "Linked to 0x%x pipes as a master", pipe_mask);
> +	snprintf(slave_str, sizeof(slave_str),
> +		 "Linked to 0x%x pipes as a slave", pipe_mask);
> +
> +	return (strstr(buf, master_str) && strstr(buf, slave_str));
> +}
> +
>   /**
>    * igt_ultrajoiner_possible:
>    * @mode: libdrm mode
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8810123fb..1cfacf87d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1245,6 +1245,7 @@ int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
> +bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);

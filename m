Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54BFC36014
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 06:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AA010E309;
	Fri,  4 Apr 2025 06:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InUNa+9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6A910E309
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 06:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743749059; x=1775285059;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tJNjmbUibPEvmWBtFe0u58XfCpJrSusUXwxng3Q18TU=;
 b=InUNa+9o6i9SiWpeLbXDgq0ERK7MY/Uy17e9FY3CQ/EXKQy3jSAOAM+H
 cHgAO2pwBpg1EcIbj4SkwCFgDLkC3+VSGOq6kiik0cy55HDikTWs5V36R
 MPwy/o/TkjOFmp5x0QlFxMy/3btNbbHwCS0W4Nho2/GlB11wZO6RGsfZ5
 KKwNbwLQBMcywnxnEaUGfqXRAw4k5Yi7IOiGd11HYi0f+Lhl+Vl41A84E
 LHXWZfRdC25Gov+T9KYDYdKISK4la6puQkg7uPX75PbFRawo8wsdqE0sU
 TJfAI+v2o3zG25pVUi+OjR5ikz3X+U7hjOX4FtOB8AF2NwCzfUItNUPVU w==;
X-CSE-ConnectionGUID: 3N6FJtr4TKSEacZVLog9lA==
X-CSE-MsgGUID: hkEivPIKQcy9zKpwW5XrCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="49041838"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="49041838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 23:44:19 -0700
X-CSE-ConnectionGUID: uB5wmibFTbCIFNMPZROQMw==
X-CSE-MsgGUID: zh1cN3TmSI2NN/GaYgoApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="127734583"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 23:44:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 23:44:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 23:44:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 23:44:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+FcHEoMtcMcZHdo4KjCESLihrzSd8naLG16uuFN5Wm1OFWSULtALhJVMjH4ThR5HcwlgwKcD2GCjpgUb0VBp+GRhl0MfzhoHyMJ2mSwWdvf3PMKUj4/F3/8J/suyA1XjxPlAFnL6b0YVeBRPuxMHc+5CeIxjIYUxg/AHhLxFf+dj2pYYmHISza7V71RmU7x7C04Bk5uAAsBGihj0hVTjheRuLe7L52W9an5yi8p1/sXfBvfVc+B540J3pmA4f42c8/cqdTdHJSEpVtqf+SO23CZAdDqSJ8eEnYcVh2zVnO/3PT7OcvewcS75CfReVC6m3lhQv1tZeuBuqfkzE0RRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJWbGI4dlLbvJ17YNwOBJWwG5S/zdLc4ux1Ku019MgI=;
 b=n/Os9NIbUuQiFH190QIwk3r020gWxa7YCYcnqFW8vL2S+wP1ykbhH62sdVGw3NvUKE/K3l0XoNPtMYkZoWEvZKF6Vb5VWMRszs3nGP0mxOkMesjXYP/SXi5NSGM8kHDeV6WrmP38U4UbyHpg2Dq835DP2kZ9JYcJV3oPVeOhEZKCnXodWJ+231c/wEL0gJ3V096ZqGR9BUxi6qpi6CNA/mC4ca26F+lolQd3q8N/VZD79YsqcLXPk5BGWunA9pFhxMQ9VTxbS8qUIbeLLMaNo3hy45ApPvE2dlWUV88aj2vDGLLgwURlYAy9fCXq4G5RTQqPm+DnkM5AVK/70+XPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by BN9PR11MB5306.namprd11.prod.outlook.com (2603:10b6:408:137::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 4 Apr
 2025 06:44:13 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 06:44:13 +0000
Message-ID: <f970d9ff-d4ea-4802-b2fe-5dcd04cc8bd8@intel.com>
Date: Fri, 4 Apr 2025 12:14:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Fix misplaced parenthesis
 in display version check
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <vinod.govindapillai@intel.com>, <karthik.b.s@intel.com>
References: <20250404051503.2095885-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250404051503.2095885-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::34) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|BN9PR11MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 799c8f91-8c9a-4da6-8d57-08dd73441c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1N6Zk5Xb2NhZytYQWFRcnkrN0JvSXJJc3V5dXVNRkRra2xwMmp6YUVjSUs5?=
 =?utf-8?B?eDJmNk5NNEhCb25oc3FSS1Q1V1hXek9yV3U1UXl6SzVQWUFFbUY3a28vbVc3?=
 =?utf-8?B?YTVmcjZiQlczOE1ZdU9xWDVTSGhqNVlYcUZFcjZOVUJSRHZCUUNWa01zR2xh?=
 =?utf-8?B?S25KT1BJaHZzb0hWYllxV3NWWStlQkpFeThuZXpkL0Uyc055K3IzclpFSkVY?=
 =?utf-8?B?bGFLMWU4TGROdXpTSFNpZU4yaDZIVnNtQVd1TEY0RFcxWHBBbzBtOUpKUFlQ?=
 =?utf-8?B?aTh4UFBvZUMwUVVXT3dtVHRSQ1RBWC9oMTVnbW02Y092SVpLdld1elZmT3Rw?=
 =?utf-8?B?dHpWWkpvOFVHZFVFVWhaZVNuNnpNQkVhSnFJRXIwTEpVZ2dhMk1mN1ZjZmlw?=
 =?utf-8?B?ZkxMa0dkZ1hqeHZzMTZISVZ2cUFUL0dZcmF6Qjc2d2czSXoxSTFmTTk4RlEr?=
 =?utf-8?B?VzZ1VUFmNjgvRjJzU2tFTnpJbWYwdDludlVNQThCMlo4V2FMcUlnYy9qb2F3?=
 =?utf-8?B?aXAvOUpzRGxabVlzQ3ZaeXdLZVNxWnY2aUJBQTRKdU9RWW5PWHBKVnhTOTVm?=
 =?utf-8?B?NGRXbmxaT0RVUzJhTDhWU28rZ1lqUkdBVXNqd2tqRVlrOTlPK3IwY3FxTlln?=
 =?utf-8?B?a0FHUFNWMGlMRW8zeVF0RWZQK1VybGxXTStFWXVJbi9iNGhlZEhRNm95OHlk?=
 =?utf-8?B?aUE5dkdmUGxjak1vS3VVUHErZzdKeXBvSWRKQUovYlBrVWQxTUs2YnlLQnJS?=
 =?utf-8?B?ZStoTWNzR3RTQlZJVitNWklrcjVzR0pXSnNVVlIrWVJ5MHVqbEFoTkovRy9z?=
 =?utf-8?B?eDQxWTQ5bjhLeUJTUjVpbUVRZW5ldWZ0L2pSeEdqNS9sM2gyWXNYd0dNQm8x?=
 =?utf-8?B?eExFZG0yM0wxemJ2c1ltT0pra1VscmMxRTMwc0ErVll1MWN4KzB4WFIzZmNi?=
 =?utf-8?B?eHNaVW4vNnVkUVZWOFdiZDllbDg0dnNnQ3kzMU5mMWlhY0tNcFZOR2lobkhh?=
 =?utf-8?B?QnRZUFdlbXZhc3JYTER5SG5kRk5jWG40cHJuZ2JnakFrMmxJRmt2YjRabnp4?=
 =?utf-8?B?Z0VGR1ByK3pONDJoUXdqSmhsaUQrNmZHc2VMN3ZHR05pMzJoT1R5UkpHT2l5?=
 =?utf-8?B?bjhIVEVIMlRMRjU5Q2hlcVhsTTlQbTVSS0MrTXd4Q29SZnJhZmprRXhoNnp4?=
 =?utf-8?B?ZC9OZzdtT0VuajlaZ3duQUdjbTB5R01ySFRSTmNPT2RYc0ZIZ0JYdUZTV0NI?=
 =?utf-8?B?cHQxMi9waGV1RVJrVW14b2ZKOW1uYlFWOG9aNURCeUFPUHdDOXlUZExmbExH?=
 =?utf-8?B?Tk50bUQzYmI5SFM4ZWpTcW15bXJIOVlqWXU0U2xNZU5xcHJzUFZPc3M5NWJH?=
 =?utf-8?B?ZGxXR2hMNDdGTWdZQlFUT1R4ZUprUWJhcVpYQXN5WGdndk0vMHN1WmZvOWVR?=
 =?utf-8?B?UEFyU0RMUWF1ZHpVMmxVaTVXem9OcG9ZTnd0YkNOb3JkblhJZGF1SXoxRU1a?=
 =?utf-8?B?YS9qSllQQUEvUzliYmhlcHNQZWdxaFdwMjEvRzFZdkh5Y0l3UExxaGI1Yjhx?=
 =?utf-8?B?T1Z6Nk92ZVNFdGF5WXVMQm5jOG10UmVLYklhY08wdjMrQUFzZ2JXc01UeklD?=
 =?utf-8?B?V2wwVmpGNm5IZjR0ZzM0ZHBqWlU3aFZNU0hoait4UElPOGxmdUhtYjV6YUFP?=
 =?utf-8?B?N0t6U3cwM0NvRTM3bEtSK0xHZml0cFhSQ21vaktPZkFjSzBCTUZrL3RRNzRh?=
 =?utf-8?B?dTdZVUkwNmhSWmNlTjUxSVl5eTRqaEtzYVhnRjlIU2prVFE0YlBEYytRSDJk?=
 =?utf-8?B?QlZ0YUVEZTRibVNBUzg1WFZQL2QrcUNSNHFtbVpyUENJby9tRktnODBEemhX?=
 =?utf-8?Q?XqMrXQVUXSjTP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRIRHlwUnZ2UFgxZUdLaWswNzZNV05PaWN3cG5OdDJvMGYremh6VWhYbWli?=
 =?utf-8?B?SXo2cHI4dEtIcGlDZDc3VHFRVlQ2d1BwV2VUQVhQcE9wMCt1WGhlVlZlYnhQ?=
 =?utf-8?B?dGxiWnBrd1hMZmk1UG8wV0VPMXU5R3pYSFcyWEErb2pxcFVab2c1TGttcm1X?=
 =?utf-8?B?S0t4WElVMUNza2xhb2ovWWl1MzdNcVlEREFFc2ZDWE9vWWxRSTJxVWc1cU9l?=
 =?utf-8?B?dGRxY3RWc1Y1ZjNoS213SmVRR1dhZlJpdnlCanNOOXpzQkp2eitKcnF1SlJG?=
 =?utf-8?B?VXo5Ky81Znl2L2V2TDErUHV3T1lGVWExQzZMS0M5RFhoeVBWdENzdTUyYUtN?=
 =?utf-8?B?V1FZSkE2UThlUTlhdzlFZmN4b3dCdGYvYTh5bnRtbEN3Q2s0MzZKR1UwRDFr?=
 =?utf-8?B?MTZ1M292UDRoaU5PZFhiRkFDTEVMU29UR1Ria3AzNktEYmxaQ1dxM3VjODZ1?=
 =?utf-8?B?V3p4SWhEbVV2eGQvektmN2VDNmJ3VFE0Wm5NM1cyTmhjWUJKSkZCT2ZLb0Ry?=
 =?utf-8?B?eUZvVTQ3ZHJ3TVA5ME1BK3Q0dVpDODRKRWtndmRTOEQyNm9EUWVNVXJJK1F4?=
 =?utf-8?B?OFVObUhQL2Z1WUlSemh3OFRiT0VmNFAvdlNqdnh2WHpIUVkxb3VRbGlWNWpY?=
 =?utf-8?B?WmF5V0pyZXhYMlJFZllPbk0raTJyTnNacXlMVHRUelhYWnAxdXBvbWNRSHR0?=
 =?utf-8?B?UGdmUDQ5c3d4dUJTajloV3l3QTdQYWVVY1VQRThZaU96OUIzSUxuVkNXUkM3?=
 =?utf-8?B?cjNxSFRsY1lYL0JHazhWa2JHalA0SCtINXlTK1NmUTJsZGFsbEZXNWEzSHNT?=
 =?utf-8?B?dzFhL2l5SCtZM0o4UmtFL3Irdk5GN0dwZTdIenZMTE1DLzNkdm9YUDI1ZXZM?=
 =?utf-8?B?a1BRN3gwa1QvNGY4eTVNSEFEbzh4YWtZNWJHNzEwM09MR1FvSTNOQVpwdXBl?=
 =?utf-8?B?elF2a1A2WXNsOFRWcmY4VzlpU29CRzJCYTR2SVhVNUxNMlZIQ1NaenYrZ3dx?=
 =?utf-8?B?S3JocTNLb2xRV1p0R2w5YnRTL0NxZlFBVEszVzNtNEpQcTdHKzlJT0szNmh5?=
 =?utf-8?B?aDVwSU1kM3ZYVlUrb1AzQW9QR3V0Z1NrdDN6M2NEWDdmSWc4QVkvTWdmNXhy?=
 =?utf-8?B?OGk5eFV3dm1HRDdab2k4VzAxTWI3cCt1VFpZRmlzRk53Qm1vbVo4QkhtUTZ6?=
 =?utf-8?B?QVNpOUZaVTVRWEI5N1loakhYRTgwVVdtM0dDV1ZoazN0dmM4SlE0WmswODBi?=
 =?utf-8?B?aURhMkN0anJnSnZXRUJvZk5MdXN4VzJtYWRiU1owRWRJZUdmZ0poVWY2M3FB?=
 =?utf-8?B?SFQyZDBUYXNYbi80MXBOcHVxNXV2MHVmVmtHRTZlQlhNSTFoYkVHeVExVjdy?=
 =?utf-8?B?ZlN4Y0NWK2Q5NEM5UUhoSkRkTDdydEVmWjBJMkV2RldYSTdlM2taNFVlUUN6?=
 =?utf-8?B?WmpmVHJTMVVkcHFUSkZjY0l0enROOEpobjZvcCtiM043cHhOQzlacmZHL3p6?=
 =?utf-8?B?ZXgzY1JQTlpXWklpNVgyVEd4MHFGSTErTlBjV0dIeUJVeUxnOS81elZSSE56?=
 =?utf-8?B?eG9Qb0xDVktlakFnbDBZblNhWkNPS1BHQjBhaEowVDAyL1FsNis2SVo1L1pN?=
 =?utf-8?B?VUFHVHFsZTdCU2htajNvZ3Qwamp6cWVhTG5kTE45c0JaSXg0NTlvcW9YcEJO?=
 =?utf-8?B?Z1EyVWNsV0dLYjNWcXpPTzViQTdYdHYwOVBCSHhkZ2hhRE0xVXBWWVlkZzY2?=
 =?utf-8?B?Znlac3RVWC8wMTdkRi9OSzVkKzdvcmpUUWxDYUVyYlgwY0s0ZVlQV1VNSlVI?=
 =?utf-8?B?YkpRMm5OcnFVN0RxS3p0UWZpWUp4bXNtaVNWODhIc2QyWU44OWtFaW5ONysv?=
 =?utf-8?B?U3ZZY1NGKzh6MUxrc1lXd1BXRDhMc0Izdkp3MWJHNHVqRHRMWUtEdUJ6RmpI?=
 =?utf-8?B?TXl2R3FGNGpWYXptd1pmSlBkWklXWUxEbVgzc1I1NEw0MEtnbFdXYnZoZHND?=
 =?utf-8?B?Q1cxaklBeUU1N3djSUtSV2M0bFNXb1VuSkViNDBMRTdQVmxQdVh4MTVoZWJa?=
 =?utf-8?B?OThaRFNFZW9mdDVMS05uNzhtZi9pR1J6aTd5WHJiaGMwVkEwRlU2MEdBZ3Y2?=
 =?utf-8?B?Q09kRDMvdHkrWlZxZndTSkZOMVo4T21KQ3VGLzVIUTBTaWQra2xJZ0dtQUg0?=
 =?utf-8?Q?Nd6HDGWcM5g6K5XgpORawcg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 799c8f91-8c9a-4da6-8d57-08dd73441c9e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 06:44:13.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbPmcQgMQ97NC+zOtL6IOvYxpGkaidtaV0Og/WxJvMIlif48NnCFm7l6W2XHAlqyCgHZG9kbUHVV6FxIVubY9xvVLvhbE6nrnQaR4l6oUjlOUq7J1ruHM4wwfHUplBJy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5306
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

Hi Jeevan,

On 04-04-2025 10:45, Jeevan B wrote:
> Fixed a misplaced parenthesis in the FBC display version check to ensure
> correct tiling format selection.
> 
> Fixes: f0b66883398b4a07bb8fcaa3663a2140129d9a58
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/intel/kms_dirtyfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 8efa14447..a5707c5b1 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -386,7 +386,7 @@ igt_main
>   
>   					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
>   					if (data.feature == FEATURE_FBC &&
> -					    intel_display_ver(intel_get_drm_devid(data.drm_fd) <= 8))
> +					    intel_display_ver(intel_get_drm_devid(data.drm_fd)) <= 8)
>   						data.modifier = I915_FORMAT_MOD_X_TILED;
>   					else
>   						data.modifier = DRM_FORMAT_MOD_LINEAR;


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F3C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5431510E4A1;
	Tue, 17 Jun 2025 04:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WER6huSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E6D10E4A1
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750133113; x=1781669113;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7YRA4QFtNjZ77Io5db15SI1Ay8eGKjDLGnH0v4X+QgE=;
 b=WER6huSkpGEl5zCBg+DOQsaZ0CqkTNBXECMIHgq5MR3QQLJMCFIP8udC
 rk9Gk3nwnXeZuspvJbIDyZLbpsk3WscPnxdhTTB8Q1MZBmkmvDPWmIsLj
 UhfKuV2DZmegwUBdOVOT52/UefRmWtTmKE0jr+x0iIAMJqRrykrlhZ+ma
 fS40fMo9Ds6skKTonAM3JCou3wTvh2Ki7EnnWTePIc3G9v0mlrvy1xBqy
 L8nceNArbL/UuJE7TQxDS/H4AhPetoFHxlIy0phll0olupIjJfXpUR42r
 3XOG62pVZisT24X+lvuHACmNLtFi0DsaP/2FGZISNqsT/HOe9Deqjdt3/ Q==;
X-CSE-ConnectionGUID: 0RFbGi8ZSDqkWjfFWiwKXQ==
X-CSE-MsgGUID: fdriR22fTtKYPhzjx7pY/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62945925"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="62945925"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 21:05:12 -0700
X-CSE-ConnectionGUID: kWVV4CCMTZeFaUwqO294RA==
X-CSE-MsgGUID: 3HiMqu0AT2G1V+LDKzVFtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149197614"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 21:05:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 21:05:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 21:05:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.77) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 21:05:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/yGGtG/PYb7VapMxAPyPfhVQp7fYXnUGuwy+EjOhS5H7JbchlwJvyStKmo+lK4NFtstPXe7e/1m1hI6+dGcDt/9aKeOvKnqb/voqUR1f4IRKU7c8MaVDTCQUTd1fygiV5V6kYoVuT2Rqg6P2E0VnKyfDNCYmpj4+GxC9MTUmR3ChiAOhRRi1eSTmc2CVdw8C8SkxUtqAF4OUtelAhqDe+4PmNe0ZWrNDs/DnAWGlVKuw8mN1Fz4kr9VkH1WUP3UyN7/1N/0YGuqREtUUMIgcsCmvOUFLJ0Ez0CVnVERy8qr2mnalmrlJotbbg42oYBzMY158VVPlh/y3TAAp4UW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zurxWE5EUmwK1ma11QBWy2xe9/164o4SbyPHhjFasCE=;
 b=unLYvt+wjSF+z2cQQTvaqT0vadE1Hkuh9qCH74CR048bfUZzglVCs3zzoDgsdcis3Vax4TDJ1n8/DelzDEO5On2u2Tw7ZqZBOc5xzEAis7f6M8GTTnUU9Q3fBfxI0u5mNOOhooOcRgjuu6XuqYvezkPZJJo7Oweqqi2mDdrJ+ZeY+DE0ylW69JqbtM0r4ujheR86PUAeuB8+lqF/aMNDRNWjFGaz1e11rVO3Qn50UG2cBtZy6E3k9irr9tTneUznKSxCig+2kNJxjLB/hZ0Al04B3sII1L7le6Y2iUPSj2KIYRDuhrdN/UNUX/SfuMGshNWqqJ5m4/0dTmYqTb92Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:05:09 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8769.029; Tue, 17 Jun 2025
 04:05:09 +0000
Message-ID: <6036f0d9-0516-4fb4-afce-68809dd6313a@intel.com>
Date: Tue, 17 Jun 2025 09:35:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/5] tests/kms_flip: Track and report unexpected
 events with pass rate metric
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
 <20250616063831.3332042-5-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250616063831.3332042-5-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f8f07f-9751-44e8-42b4-08ddad542672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzJWYitxcjJYU2NTZ3d4L1NRQ1UvaDZQS1Z3ZVBTbmVDQXc4cUE0TjhTUldP?=
 =?utf-8?B?Qnk4U2JwK1cvOGV3TmYrTGpwV1FuOEdMN3c2QkRlZkY1NHJKemJEMHZPbVJF?=
 =?utf-8?B?Q1BCMjNCWUZBTmlBMVpuN1p3VVRxa3FZeFRTSFVQV0IrRy9iQ1Z1OTc4KzNL?=
 =?utf-8?B?UEtHNExucGpEcCtjQkQxSGc0VmhZTUNLY3ZUYUgyRmw2QUlWdHVhWDVlanI3?=
 =?utf-8?B?Z3RJTFpJVER2V0tKWHg5N29IUVlOVVdwMzdWYnBieXg0WTBkQlZWbVZ6NlFh?=
 =?utf-8?B?ZDJFTXZVUWVyREpQTlBGWGxuckpFSjRyZTI3dHRYcmkxdVhvdWp6ZncxdG5R?=
 =?utf-8?B?YWtRcHJ5blJKWDRweHRXSUsrcU9CU256SnhaWjgxOWFEcExnQ1JhR0JUSlNx?=
 =?utf-8?B?bmY4dHg1RlRFeld2NEp0OUdvaG85aGp2eVFNbVViQUt3WGVSaXV1VnZyQWNW?=
 =?utf-8?B?MmpzNGxSc1p2dWtmdHlzZk14ZG0rb29ucFU1MkU3T25JTEtMZ2FDOUhrb3hk?=
 =?utf-8?B?SXdtdmtlWERhbDlyZ2FzdE5sendvcksxWjNOdEtqS2tPRWgrNGlXTEc0b0lZ?=
 =?utf-8?B?MnZFVlRUR2k1MTUydFprbTBDQk5zVWFtbTRpL3ZxWHcxNlExT0o3T1VmOWlk?=
 =?utf-8?B?WUo0VktDSDF4eVU3RG5lQk05Z2VCWmhVaHJQUGdUZzdmWWlId1hLRWN4Ni9X?=
 =?utf-8?B?NDMydU5jNGcwVlRQNWRrMDZUSkd2dEV2dTM4bHU4ZCsrNVZmaUY2SWE1QytP?=
 =?utf-8?B?TEtMQ2FqYlRxR0tMV0VWUVBPQzgwVWI5NGcwYlY4OXJLQVZ4bFd3T2Qwbmlh?=
 =?utf-8?B?QXpBOE9wQ0taTG9NZXZ5MnRXUUNHR0FCY2swUDR3ZGd3UTNFT1kwOTVmZWFx?=
 =?utf-8?B?azRCYWhLd1A3dk1vRVkya0dYVU1zeS9HZEx0VGtIbkNWNFFwLzdzSE5TQnRn?=
 =?utf-8?B?UUFDQUs5ZWxtQXFTdjV0K2htTVQ3MTZjdUw3NWlpOVhYNW1aWVdISFpURERY?=
 =?utf-8?B?RGZ4T090NEdOQjRkdXlFcDVMSzJEOTFzV2xVemZzWUxTMWRhemZ3ZVA1bExo?=
 =?utf-8?B?WHJEUXU5dndjS0htcHU4V25RSE4yK1REUTRwU0pDYktWbW1UeE1Cd0V2cXlh?=
 =?utf-8?B?YzBxMUI3dHMxL1oza2Z1cWtJTk82a0l6bVVHanRQVDZKQ240SUVtZXBlS3Rh?=
 =?utf-8?B?VEtYTFdvQXcrQ2IyL3BjNHQ4bFE3bHJ0MEtCSG5QTUJLVDNKeEU2WVVIODBS?=
 =?utf-8?B?VkxpUHE0TThLU1JlUk92bGhUMjRwaVhrbXZpWVdUS2NUL1R4cmI1NVdCN0xI?=
 =?utf-8?B?dHZ5TVJCY2ZoWDFkSE5iRFdndzJxbjFpa1VhaVp4SG1xZ2NzeE9EZjVXeDVZ?=
 =?utf-8?B?d0h4bHlURmtCeTdWU0prWnpPMVNvUnNHV1c4MDR3RThmNysyKzdEVnFnVGJY?=
 =?utf-8?B?NnBhRGJRZUlZMWJ6d2x6K3NqVmZNUVI0dVkxR1pOOWxrbFdQdWRwa243YVg0?=
 =?utf-8?B?NWVjczcrZW5pakFkZkFORkdjaVk1Uk0yTVVQb1IzZk9EZEFscjB3ZzNXRVBZ?=
 =?utf-8?B?NU0xdzFudGdhN3hoUU0xMUFCZWVlTzMzZ1E3M2Fhd1hkMytwQSttTk5KTnVZ?=
 =?utf-8?B?eDNmWnRaSUxiQUpRVzRONmticXh3bzZpQWFsU2pLblhHWEk0dk80RzdoNUlE?=
 =?utf-8?B?RHcvWkxlVnBDNk45TzFuSVE3NE5rWlhXeERyRUtkeXJhUnVXbXZpakJuQzN0?=
 =?utf-8?B?bk44N2dIOERid0Yyd0d6UDNmSHpvOCsxRmFWYVp4dFJyOG0yU1ZxblRtV0tX?=
 =?utf-8?B?aE9RdXlha0JtK0gvL2FNZ2I4YVMvQ0xNb1FWZkZEWG1zQ2JzWGtpclR0eXdF?=
 =?utf-8?B?MTJkSC9YLzlwZzRUWlZSUllBTVkzV1BGWlZOWW1uaWtoenQyK2xGc3hWZ2Zy?=
 =?utf-8?Q?BV5ywrGIJoY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHFyTHZMa0RNRmhmazluSFB3ZzUwb0dUd202NlYvQWJkOE9uVFk5YnVjT0t3?=
 =?utf-8?B?dCtQcFVOblBWVFUzWml5bXNUZ2cvRFR4V256RDZDcDlNRHl3ZFJBdkVva3Jh?=
 =?utf-8?B?SkJEdjEvSWhYRlM0QU9hUzZnWGo3YWlyQUxDcHRrZjBjZFRPWUhUalE3QUxH?=
 =?utf-8?B?Z0kyakZ5Q3Y2MWxENEJQMTg2VEVkb2FDL2t4Z2JENFp0MW90cEVyS2VHQkd2?=
 =?utf-8?B?cllIZ0xOcU1NZjYzZUx6VXBuYkVGVXNSbCttQ0pad0Rnczl4OEZNU0oreVJP?=
 =?utf-8?B?bjd1ckJkYXRZNm15b0NSWGYvVk4xK1k0MEdzbEZGUmdHRG9iTkV4NUtlZWVn?=
 =?utf-8?B?eiswcUE1SmJTK0dKWDBtd1Y3SXBFL3E2ZERhMW0rb0xoNUFFV1FjbkhHbTJv?=
 =?utf-8?B?WVZQMTFOcDltSHNScWZTaXdLM2RBM0s0MnlyQWJkVW9tcGtSRVBDZXRPUE1u?=
 =?utf-8?B?WG1YYndGRXlzMXVaTllLQldLNlVGSy9hNGhnYVpMMUlja09uUWd1dktDekdG?=
 =?utf-8?B?Y1AyQmdPVjRVWFkyZThLeVpXZUdSOE40VG0xRDdjNkpCSU9wYWZhUHVBNmdk?=
 =?utf-8?B?MGVwRWFuWVkzQ0JlQk9RM3ZLZExtVWMrM0RTNmFwbmJ0bFNuemlINjNteVc1?=
 =?utf-8?B?OEtMWjdGZE91ekVBWndIbzdxNG5nNVZHeEVYWWdTSDFaZy9JTmJyL0NQYjAy?=
 =?utf-8?B?UWY1ZzdPdGlKQ05NUFU5TUQrWjNVaW83bDdFN3FQUVFWWUN6TlRSSzdKVGln?=
 =?utf-8?B?Z1hmUmtyWUwvbFE4ZzVCZ1JmcE96cTJ2Vmt5S0ZDdlFtT2t4Q0ZEUzNFTkJR?=
 =?utf-8?B?LzhCWElXOFNqUSszcmxDcmtDOThDZm10QTNxYzJjMzhIOFY5bGtDb3JlNng1?=
 =?utf-8?B?TkNGalB3YTE2ZnpwVTU2Nzg0UkxJcE9qNktzTVF2VDQ4dTExUEMyd0FIandJ?=
 =?utf-8?B?UEpkdHYwQnhjNzlFc09QczFoRjNVdXpkaWFiZm5yS0ZqMVErYlNLZm5JTnQz?=
 =?utf-8?B?S05pWk10aGpFWC9vNFRJbkJTVG94cWxOUkx3L1ZBbzlvR1VWcndjdVFSU3g4?=
 =?utf-8?B?TkJYMzFJWFlGVDJ1YmZHOWdmSm9xN2FSNFBXS05lb3k0UU1odjlLWEVMdzZ5?=
 =?utf-8?B?NU9FMzZSb2dLSldINmVCT0U0Nm42MExOVjJFaGJTWU43N2dIbTkwY1dQWC9N?=
 =?utf-8?B?UUV4aGtHa1JqWFljVUtCamp0TjZTTUZldWlVN1gzLy83UFN3b1gxb0hMVUdm?=
 =?utf-8?B?aFhpSmdIb1Y3WmVDZGtVaDZFOGpmQUlVelZlRm1BL3dCVmJiblZ3cmR3aW96?=
 =?utf-8?B?ajhaVy9ITDArT0ZUMFVLak5aOHBSaXArZFMzdHl0SFJtWkZXa2NtUEJrd0ho?=
 =?utf-8?B?NHN0SnhoU2tzK3loejd4amRCVGFHQ2FvU1dxM0N5cFE1dVE3WTVFbUdDNDdE?=
 =?utf-8?B?MUZtVnlQaHNjYVBWem5OSWNpeWpYbklkNkZzbHk1amFLcDFWSGd2YjdNbFl4?=
 =?utf-8?B?RXVTYVI2YmtHSWNKekFFU1BlQW9yM1M0VkZlYzJSamZSVklIUzNia1pOcG10?=
 =?utf-8?B?Sk9yZmlTMXNyMGViSlZhZnlhTm1CR0tTVUl6emk4VkFtSW9Zd1Z4cE9Md2Fp?=
 =?utf-8?B?dklSTmNRa2lPWkU0TlJVYkVDd3Zyazd3dWxKUnB0TE1Pc3NjSXVxSUxUSlJp?=
 =?utf-8?B?Z3pKNm9vZzVRUDdNY3RTbzNBL09uMlM0QVRPeTRleUdvek1VNmF2QlMyQm5y?=
 =?utf-8?B?K010YXhuSkpJeFM2cDk4LzVEckU1ejRyWDZxbjAyVlhlSnZOR0k5T1c2TU5Y?=
 =?utf-8?B?RjE0ZGtZbHk2cVlmSHdWcDRHaDJQaWFIVWhRbXNhTGJKa25ibFYzeEF2V1E0?=
 =?utf-8?B?em4vSk45OGhWdnBwM0VTSThhWERtWjdYck9VUHdlYUM1T0ZsOXFzZlpic29B?=
 =?utf-8?B?MThqWVVIdEFXQk51WXFjOEQxaUswcExnelZLamhsV05haFpFVjQ2RDdVNndB?=
 =?utf-8?B?QkozVzlPbnFJL01XR3loOVhvcTAxNVlqMkRUcWlkaGo1OHRPYW1Xd1U3Rzdv?=
 =?utf-8?B?anR3OVZ3VzhmdVh3bWVEOGJXY3F3OHFmekwxeXk3VlNNaWQ5TXlZMUdQeHA0?=
 =?utf-8?Q?cuVJNbEPAPZ/cEKfWxUM67jAM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f8f07f-9751-44e8-42b4-08ddad542672
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:05:09.3750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wl4rI5nBGumbhv+1Y9B65btwMNPU8Gq7iDD5FAGroQjY3vrsBTRR5vrEkOk/DPBRsE9njkULW7j5Oe1QuIXMFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7901
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

Hi,

On 6/16/2025 12:08 PM, Naladala Ramanaidu wrote:
> At higher refresh rates, There is a possibility of flips being

Nit: 'There' -> 'there'

Other than this, the overall patch LGTM.

I would prefer having this patch combined with patch 2.

Thanks,
Karthik.B.S

> submitted during the evasion window, which can result in one extra
> frame and cause the test to fail. To address this, the test has
> been modified to calculate a pass rate based on the number of
> expected versus erroneous frames. A threshold of 85% is enforced
> to determine test success.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_flip.c | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 5873591fa..5ac0e2c4d 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -309,6 +309,7 @@ struct event_state {
>   	unsigned int current_seq;		/* kernel reported seq. num */
>   
>   	int count;				/* # of events of this type */
> +	int err_frames;				/* # of unexpected events */
>   
>   	/* Step between the current and next 'target' sequence number. */
>   	int seq_step;
> @@ -677,7 +678,7 @@ static void vblank_handler(int fd, unsigned int frame, unsigned int sec,
>   	fixup_premature_vblank_ts(o, &o->vblank_state);
>   }
>   
> -static bool check_state(const struct test_output *o, const struct event_state *es)
> +static bool check_state(const struct test_output *o, struct event_state *es)
>   {
>   	struct timeval diff;
>   
> @@ -706,6 +707,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
>   	    es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
>   		igt_debug("unexpected %s seq %u, should be >= %u\n",
>   			  es->name, es->current_seq, es->last_seq + o->seq_step);
> +		es->err_frames++;
>   		return true;
>   	}
>   
> @@ -735,7 +737,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
>   			igt_debug("unexpected %s seq %u, expected %u\n",
>   				  es->name, es->current_seq,
>   				  es->last_seq + o->seq_step);
> -
> +			es->err_frames++;
>   			return true;
>   		}
>   	}
> @@ -1233,16 +1235,16 @@ static bool check_final_state(const struct test_output *o,
>   	 * those use some funny fake timings behind userspace's back. */
>   	if (o->flags & TEST_CHECK_TS) {
>   		int count = es->count * o->seq_step;
> -		unsigned int min = actual_frame_time(o) * (count - 1);
> -		unsigned int max = actual_frame_time(o) * (count + 1);
> -
> -		igt_debug("expected %d, counted %d, encoder type %d\n",
> -			  (int)(elapsed / actual_frame_time(o)), count,
> -			  o->kencoder[0]->encoder_type);
> -		if (elapsed < min || elapsed > max) {
> -			igt_debug("dropped frames, expected %d, counted %d, encoder type %d\n",
> -				  (int)(elapsed / actual_frame_time(o)), count,
> -				  o->kencoder[0]->encoder_type);
> +		int error_count = es->err_frames * o->seq_step;
> +		int expected = elapsed / actual_frame_time(o);
> +		float pass_rate = ((float)(count - error_count) / count) * 100;
> +
> +		igt_info("Event %s: expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
> +			  es->name, expected, count, pass_rate, o->kencoder[0]->encoder_type);
> +
> +		if (pass_rate < 85) {
> +			igt_debug("dropped frames, expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
> +				  expected, count, pass_rate, o->kencoder[0]->encoder_type);
>   
>   			return false;
>   		}

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496D5C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 13:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC81110E190;
	Fri,  7 Feb 2025 13:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKkVnd5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D9010E190
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738933644; x=1770469644;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Nl0t0+IIxqADi6VtTtlLrz/CuWpdTUMcU1b+0hd29Y=;
 b=gKkVnd5pSkz32nvOVfRgQn8dF7n/5hzydmBqStDYuw9M0YVFY3klNvDf
 lstIrGExvNfz5R4QoCCcQ9LSO06ZdztFbBR0GkAWWrogZTSYoksn257Xm
 sFtDjcHiFuoAPUeAHBGfo90YfgT+IUHaAaYNtiPSBDuWsMC/ftVIxqjKy
 0JzBfTiphFDAG9VzDZ9YSw5zT6un91c7I+pFnE8ZrYKxsB/0loe2YeERL
 yJ1et3zFLr3wFdBeHJZ7lA77dy/nwb8T3Wzf6jgeoe8jJqawrnJTFNMNr
 cOxaISZGI/lAAwr4RYkPDLf6BzXM7o+hpXcXnrtye+8SsrBm2eiWKyOpQ g==;
X-CSE-ConnectionGUID: zwsIqXPUSoucNaFp2vMICA==
X-CSE-MsgGUID: bBOaDgX/QP6sNuZ0EeMTgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43333367"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="43333367"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:07:23 -0800
X-CSE-ConnectionGUID: nbbEi6UETWa1FjVgFZcbpA==
X-CSE-MsgGUID: nlA2Y7/5TRmqVXJmXWgVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134754326"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 05:07:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 05:07:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 05:07:22 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 05:07:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJ33/VisePhVcwjYGwhpRNCosktWGFe2OrlbhgdKCX7CYrR+veNp+YgFe30r4LpE7IPXoIC9DF3fsJQqPMIfbPZ2/Yw0zC0L6D0PhfGWQ+C2Sb3y7RdMFLdRmFUU7SgmN6BQCNsjXjgfXyAVjUmMGoi2ir5A1TanCUgGPEy3NkaEvtD09tfBYkCe/GwGSuOGHIvpwQF1wl+fZyBjO4WNfmQXiX2yW054ogTfRu3bnXJ1ESsPqgnaFpd7V7I9BWhomB5ra8neMrXBiz0q07olB5j1w7ETiDitHDADyzq/swL36qLPFnA0QTKVZoCG+29eJB8pK2tmEoKJwsXFz5/4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdF4D+kuKWo/3yOry/9h2xqr+WINmumjXAdXYVGHM+s=;
 b=HkJHfdfm8Hum0aHRjxMgrbznT9HBkJmETOrSjZKHV/r5XMs6MQW5ylkoUU5Y5J4Z/vuqsNizL1hNwdXVsbMXPhNYxCM4cVH5eRli6ggpELyvTSPK+NHH4rSUjg5YOKVo1AbQB/glWni5SPwKKCo//uG9W0Tz/fbFFasqSRZoDwQFm362OiOsHQBXC/iDCShO1wWVbiFFsQJni57lv7krdkJlG+HAgvvaozv4Bt1/icK3LHEviy2pYijIL0Rarij+mhpp9vpdfdIcsnXEhvjCfXcLzpPXdbHdFKHvjv7GlnLkVocngk+PpFxg0p+ycdiBeM3Kcx8ZgbKXMqdy2LV17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 13:06:50 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 13:06:50 +0000
Message-ID: <66c10237-437b-4476-b442-34ad6bde7723@intel.com>
Date: Fri, 7 Feb 2025 18:36:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Add logs to skips
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20250207043510.1027295-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250207043510.1027295-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::23) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH0PR11MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efb1cdb-5d84-4768-c75e-08dd47784918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y29XMkE2alBKTjVqajAvQStYa1JlODdpWUFJSWVGMnR1MzlFR0cxRlJ4WUFK?=
 =?utf-8?B?QUdVUkN3NjNYbXlETVdsSHZ4b0RTVWF4Sk5YYk9aL3lqZ1J4L0hkYUNhbVgw?=
 =?utf-8?B?cnFaTHpFeXBZcmJrWVVGN0NuTUpFbUEwbHBHUnJqbFQrR2tyWjR6RGFKL1hJ?=
 =?utf-8?B?S3Y0V0tteDVVdVU2VTVrWW0vM0x5R1BibjRhaytTMGgybW84N0xXSGJqU29B?=
 =?utf-8?B?ckpHcWNaRUJQSUxMdm5GdzZYdmZXR2FESU9CWUhkcDBwRy9QeDFoODBpWlIw?=
 =?utf-8?B?YlBJcnFvcVdGbnF2R1dHRjVoRTc0R2pNVTZZYjFVSmpJQ05GV0hJYlpRSTB0?=
 =?utf-8?B?QkxUcXFsRFVZcVcweEd6Mk5IbVBYTldjZnZ5K1ZxMXBUUzI5OGNtNHRRcmFp?=
 =?utf-8?B?SHFBMFlyNk1hczZIMWVGVHE1Z0U1NTdscGQvVU4yQmFuY1U3dmtiSWZRaWZ6?=
 =?utf-8?B?c2xOOXRMS0tieVNDaXQ0NHBKb3paWWxkU1MydWo5cWd1VTJhQXNpSFRuTjlU?=
 =?utf-8?B?c1JYRWlBbk5UR0t1dmVsbHBZN0F1VURoR2M1eEZ0c09KaS9yaHFGTWw3VElq?=
 =?utf-8?B?NHFvVWlBWTE3R3dlVTdHcmoxY1BrU1puMmJ0YkNxTHl5OVJHanc0TVJBNm1S?=
 =?utf-8?B?Zk5QSkdjQnVsZUwyY2xwazVNWWVwR1YwbFRGQUlKTy9CbWZ4ZzBoOGIyNDVi?=
 =?utf-8?B?VG5OV0c0bDQ0bjlIODNEWFdiSFozRkJ4NENtdW8xbUk1OU9BcFkyMDNEaEc4?=
 =?utf-8?B?U2luUnhZSTRXWXpFakViZFRsN1FVNjY5dXdObEs0d1ZOV1RRR2NNb1dYWkxY?=
 =?utf-8?B?RU5hZWRhU2tUVm44Sm1VbEZlN0pSOFZaVDV3Y3BWOHBVajcvakN3dFVmbFlW?=
 =?utf-8?B?U3NuWWZyMnFNWU8wdU45S1VZMU9qUkpIVi9XcVE3VVYrdTk4TVMzU3NLdXU4?=
 =?utf-8?B?SFNHZWNtczBGaVpzL1JQZW40VDBJenlKQXBvT09GWVlLZHR5VzV5N0NvTzZD?=
 =?utf-8?B?azRCK0l0bURiYm5iOFlud3BaRmpLaWF1Q3RwUVczUXZlcjRqaGVReXVMbDdT?=
 =?utf-8?B?YlF1cC82SExhNk5QMlJ5SWtUMnB5TjlBaDBYa0JWOUY2NXg1bSt5ejJhMjAx?=
 =?utf-8?B?ZEJXeG1XL05NMnh5VHFPbTVNOHhOSTZ1RzUyd0Y2WmtIM0FXY1hIZnM1VTha?=
 =?utf-8?B?dzRkdENpenlzRlpwZ3lXVHBLODkzczhSbFhtWjNFNy9ISU8vQU9pMmx6KzY1?=
 =?utf-8?B?OEFRMXIyZGFZeHhYRDAxWnRDRk1OVTZMOFd5RlFFUnNjektiSGlLaW9EZ2Mv?=
 =?utf-8?B?ZGc5NHI2VVhhakF6bHF6QXhvOGRDZTBkdXNMbmFZUE1LNVNmTSsvK1JwYXJX?=
 =?utf-8?B?QmFzbC92SUdGMnBIcGNkYkhaeldhdVdldHpiaDBHMDNzek5EZXp3bER4VzBZ?=
 =?utf-8?B?cHNrd2xDTzFSaGVNMGIxc0JOb1hZM2dHVGxMemp2N1lUcldGcU9LMGwwQW8r?=
 =?utf-8?B?YVlyeUllYnhyZGxxV21SQVRPa2h6cG1STzR5MUNNckZLTHplclNtME5MUjh2?=
 =?utf-8?B?VlJDV01PQXhlTlNrNW9FRFNoQnh0TXE4ZEFxMzJQUVc1SEx2T1pPRmhFYkli?=
 =?utf-8?B?ODNXWGdpNkJOOU5ZNWFya2xCaUtDSHJoeXM0MDA0WUgwNUVqenR2TVlnZ0pq?=
 =?utf-8?B?MlFnLzVxWTNrOWlyd3lIN0lpRm5vVXFFWDNIMHVyRTlUV0lRd2RWNGxWUVdm?=
 =?utf-8?B?Wkw1enlaRjRod2orQzVoRGd0QjFreVZXTkFOeG96VHg5NXZGaVNQOGYwZHFH?=
 =?utf-8?B?dkhEVWRrZkxNcG9OTE1rMEw2MG01V3VsNGpiNnExOVR3a1RwcWRuYXUrNkUz?=
 =?utf-8?Q?D2YkGtxE+Vmhh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFU0RGprWlp2aGxMN1pCcmI1V0R6K3NmNEZYZXZSV0JsNUJLYnFoTzhiUk9t?=
 =?utf-8?B?TzlWTVFjUmxlZlNWb0RTQWFpUnlWdlBvN0Qzb1Z6MVNwdGNKWVhCT0xSRmRi?=
 =?utf-8?B?Rmw2YjFwTGJiTnpULzl4YW51ZmdsaXRLUVM4NXRLTXpCYjZFcXJ2U3h6YW4v?=
 =?utf-8?B?SWlDb2tkOXFnT0NWMTJzb0NSU1NEZ00raCtDUlErZFIzTm9EZ3B4YXQyazhH?=
 =?utf-8?B?cXNOTHpqT2RQUFFvejZDdkMxWUZjNnRpbndYYk8yQ2hUelhNRmlFK3pDd2pk?=
 =?utf-8?B?dTZmdE9XU2tNWTZZT0xtd0c2VGMvem56V2FORC96T3RwTGpjZGIzM05lTmta?=
 =?utf-8?B?YlYzSjF6aFNvajRjM2pmekN4RU1jNUhxOUJhTTBBU3NwL2M0TFRUd0ZrOFo1?=
 =?utf-8?B?ZEZHNmNxVjlsSVhkait3VVZweWRwNDFjbVcvTGFBSksxU1UxaFdCeGZYSllo?=
 =?utf-8?B?SFdMYmd0QjEwbTZLblM3UGk2cE0ybXBOYmhveXhUK1hVSHBGZDBqS241WFR1?=
 =?utf-8?B?WFVoeUNYQ1gzTUh0akpQWjBWUFZ6U1pVbFp4VHpzVUdMY2F3UjUwWGpyZExK?=
 =?utf-8?B?MlhLZTFLREEyc3BQek1CWjZ1VUFZTS8rOTVOZ01pd3o0clFHS0xvUFpZLzcv?=
 =?utf-8?B?VWc2Z2RLbGFCbHl1Yk1TRmcyNVZRTHU4Yk4zSXpvbkJwWUF4R0s3UDZPNjg2?=
 =?utf-8?B?Qi9HTjkxaE1DZU94N25RUUEvM0g2MVhxWHZKUVhOdGZWSjBXaDRvMmNLTUtU?=
 =?utf-8?B?ZTNxSExRRmk0ME9NWk9MM2pEcGl3MXBLVHhYV1E3bEtUR3R4OWR2aXB6MFgw?=
 =?utf-8?B?VHdGdFdyNmlpUFJreDJwWTFQQzE2RmwxS1c1WVFYaS8vaTd6M0Y2K3lCeURZ?=
 =?utf-8?B?Y1NVcVQwNHpENGJaTTRBRm1pRmZJZXgzQkZDbWh1a1hzdVI3ZUlvSU01TVF2?=
 =?utf-8?B?QjlaaGwrWTNlQkh6MjR6ZmhzNXVVVGFjM2dLNHVtcUlRc1JlY3h2SExpTTR3?=
 =?utf-8?B?SkF2Kzh5M3J1WERtcXBOV3F5dThjMHowU3p3elEzREk1WUZVTVpudFROdzBB?=
 =?utf-8?B?S1ZjbU9zSzdmWmQ5MitCcGphMzRlYUlvd1NwaTFyV25zTE9PUEZIblZGeDhk?=
 =?utf-8?B?dDU3NHQzQWZ3QjNkUWZ3K1p3elFRQmpKYVdOK0FNV0VVQm40anZsRkVGRUxH?=
 =?utf-8?B?Q3lJRTBFZWpDQUdYaldlaTlURnY1bFhWKzg5Snd2SEJVdzV4ZFFGcHY4MWRy?=
 =?utf-8?B?cDdvRVBCUmlwQ3BtZGJhQWNZbW1jZWdybm5IMnIxTUt3NTRPbVlkakVPeUtV?=
 =?utf-8?B?MkhZc3ptRER6bm1yUStXQ2F4VlhGamhqeTgxWnVJMVNxY1d3R2plaG9BRVRJ?=
 =?utf-8?B?QXllRlZxUHBuMHgrZDBEalprcE9sam1uc2pBZ29SN2d5bEJINFd6cTJwRVUw?=
 =?utf-8?B?KzdyTnZlOGFDVkVaWkpUVGVqTXBVT2Z1cWxmbGpsaDlRa2I2QW85ZXhyVkly?=
 =?utf-8?B?NitFZGN1UnBwTnJwZ1B6bkxoajJ6TmxzdFVvRzVrc2w1aGF2ekNmZWFKa2lY?=
 =?utf-8?B?RURlbGM5U1ovVVBYTHN5WFhrYVZub0tsT1B0VzRLOG5nT3BnNlJuYnVxdlRz?=
 =?utf-8?B?N1U1cWZkNUJrNVR2VFQvNC9LQnVQU0tIK2hiQkhtU3JYRmlDcGdBZTJUZThC?=
 =?utf-8?B?TGg3Wks5US93blRCcE1rWFl5OGlHdmw0dWtDcGh3b0l6b1BHUEpKMkVUalRX?=
 =?utf-8?B?bmlzbW5YK3pzbC9ucU9RbW1id1lHZzFHZURQOGplNGRCVHRjUTJ6TzRyWDI0?=
 =?utf-8?B?UVZpWkR3MGFZQ2JIK0JIRmREeUtRNkl4cW9VOE5FRnJCREJzWnNaMXk3djNR?=
 =?utf-8?B?UTRScFdzbkdSaUtqWS9Hb3FBcWVtZU1uUUtJMDdwM0FoSk1KRUxtS3gwd2VH?=
 =?utf-8?B?QXNlV2JnM1hZR1dZZnphakVmU3cyaDdMY2RLWHNUWUZJY1RDRjJta0lrTUZO?=
 =?utf-8?B?Vm9GYWhqQmF4dGRSaWhXM28xNFg5R25ZQTA4NUdnajZjVGdNZCtjMWVrc21O?=
 =?utf-8?B?ZkdHdnFnMnlvQWt0QnlmY0g0T1pObHZqWi94ZHJBNHJBUkxkZVVpUmlvd3B0?=
 =?utf-8?B?ZWUyTGZnT2NyQXpUQ2xaNkhROU5GS0t5Tlp5Sy9KcjhGVHNDdHVNZ25Dbkpr?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efb1cdb-5d84-4768-c75e-08dd47784918
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 13:06:50.8254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gY0Zx4vvToUGeh6YzEfoS77JlrZObSA2GfnlPeGMDJFn9KgYRbNtpBzYdFNQQtLSDGrxOqm0TtXyHYsYgYATgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

Please change the subject. A constraint is being added in this patch.

On 07-02-2025 10:05 am, Jeevan B wrote:
> extended mode test needs minimum 2 display to run, so add igt_require
%s/e/E
> to check if the required criteria is met or not.
>
> v2: Fix commit message.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index e41c60cc0..117f82325 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -335,8 +335,10 @@ igt_main
>   	}
>   
>   	igt_describe("Test for validating display extended mode with a pair of connected displays");
> -	igt_subtest_with_dynamic("extended-mode-basic")
> +	igt_subtest_with_dynamic("extended-mode-basic") {
> +		igt_require_f(count > 1, "Minimum 2 outputs are required\n");
>   		run_extendedmode_test(&data);
> +	}
>   
>   	igt_describe("Negative test for validating display extended mode with a pair of connected "
>   		     "2k-4k or 4k-4k displays");

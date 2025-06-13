Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4929DC61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 06:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF97110E1BA;
	Fri, 13 Jun 2025 06:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0Ob9ydx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AA610E1AA
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 06:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749794881; x=1781330881;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=gnHOk85Oj7stuCsVaAtseAYr+mr7TtSBkaSU9u6oC00=;
 b=c0Ob9ydxGVJ0bX+LxkCrOLfrNz084y3vN2e6s/+ut1Jk1ttDxFnecICI
 ITc0LjjRCoSDdxf/nHPgTB2QYxzdsu3Sv5Oz1G3Z2Bw+vCqGVAWKjPq+F
 o2rcbVm2oU4iDSe94X/ZFXkYMeDyWaecS0Sc6yldgSbilyZP5dvH6S7iv
 Qpriq2nW+zQCm/ExlDr0W4/Ggh0MhWk+xwid4c7evvewtRxQo6lA5qK59
 vqc8wK5SNJOi4CkhCbSV+NAOvddpsYI9M46fevp3mxPTvQMTANkuusw8+
 REg/eE4S9TxWN7wn15mZiDdtg7xAySI+TmeV3gGMJVakOgbwZR9+kX768 w==;
X-CSE-ConnectionGUID: wv60xVy5RvqTkj1gSydfLg==
X-CSE-MsgGUID: 5sVCnPquStKnWF+2rGwnsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51114531"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208,217";a="51114531"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 23:07:59 -0700
X-CSE-ConnectionGUID: 5lBB4RA8QdW11/d7L5REyg==
X-CSE-MsgGUID: 3Q4T/Z4tS7Owt0p94Rf1Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
 d="scan'208,217";a="170917242"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 23:07:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 23:07:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 23:07:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.89)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 23:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqqxxgTTKDVMbMNiHt7+QMFxAIXyRTb3IyX9RsVCm8pQdfxgSHoY+qeFdc3P/12i2IpYKoFLtTp0JAFDHHdchsb/bHCtR1wCYfMGcpTASsu5gr5hpeglG/ptah/oVmRhYP8WaZl67CFBEN8VltYegPCBIWJCXPvrdDqIr7+U1FZpi2QJpVty2bQneZaISPLMkhoG3uDaUVi+deNl2OlEaPekxgsgNLMb2e5cYqF4w+kvfG0Sox31KJajArNhCzp7APm9bMjBPdJO9HK9NZPRyWV2tEn/tuHWyqvy1+tiaFIMmnfwoIc3BVn6vqUebyc3HiSQQTDfUmmsccwJdg97Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45njr1l6rPUvo1kfHOKq9Qm/ygAoIit5cPtUQGVNjAc=;
 b=bFejPrfE6Jp8gVzomJsENw0t1A2a+7PivabFLIWs1NC3E/da0TBvfQUNMk/kl3lQqo4cQ2C4YrLLnBKUhMhBiw40a6lLsi73D3ArcQbJYCjsgD8HggN+u/yxsVo8tpY4u+3W9SbXINk76X2FxE4v6VPno9MdtgQxNxlicrpJ9HwnlAHm8RCdg/NlAGA/FT5bizKyp9d/wEwL5cbnWsuNKgZPox0zd+QqffYIM7+ut9k4nwKOpxpCKslpZARr3j7Gf4G6pFjTSSpKpt4ciKtPxjvpBuISgNn0qmHT9345+FVKI1+7oZPbxHhqOHirRDNG63x6Gy4YC8Q7zpq/LnBnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Fri, 13 Jun
 2025 06:07:55 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 06:07:55 +0000
Content-Type: multipart/alternative;
 boundary="------------XA8Bmm4ZFY64Mhy9efplQCV1"
Message-ID: <f8463d56-61b8-4ead-a7e6-c5e79349933f@intel.com>
Date: Fri, 13 Jun 2025 11:37:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_pm: Enhance vram-d3cold-threshold test to
 verify VRAM self-refresh
To: "Poosa, Karthik" <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20250527183957.4137136-1-sk.anirban@intel.com>
 <9b0cee58-f6c5-416c-8085-6e0b1a60e09e@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <9b0cee58-f6c5-416c-8085-6e0b1a60e09e@intel.com>
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 26fcf363-b075-4349-ee14-08ddaa40a31b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmJpNnovV0xIaEdSeCsyZjZGbHdGL011MUN3L2hRMDNOZkY4cW1ETlJGRkw5?=
 =?utf-8?B?Nk54TFhJTzUyK21JSXNCM0U2bXB3TEIrZTBrL0ZGTW5IbnlFMkI4d0NMTThO?=
 =?utf-8?B?dEY5bVY1cmpJZVBDQ2pHbTBvWnNSUDhkb08vQmU4WmFYSFF4d3lCc2JmNThS?=
 =?utf-8?B?d3V6enJyMjV4OFk3blhvR0tuRmxPUUhRdmphK05BRVFRY3dDZmZxUXBtYnhT?=
 =?utf-8?B?THlnTnFoREpOaXpZRURDVTFvdDJnUjdLVGtVc2h6aUkyZ3BZRnl2Njk4TmJO?=
 =?utf-8?B?SWJMdmZIUEFLT3E4RkJVeEU0bGszTEpabGxmUVdUZFV3N1ZYUVJNWDRCUWRO?=
 =?utf-8?B?Y1B2d1pRVEpIWlBtaEtwblNWQ0hPMnBjbHZQWlBXbm9wZUFPTlUzb3hpUW1h?=
 =?utf-8?B?MGRwUlkramR6eUlDRWFMRWpQc2VOL3VYeC91b0FJdXhOVFpwVStUNWRhL0sx?=
 =?utf-8?B?UHpHRzRTRVFrM0wxRDhNN2MvNFVBSGVRUWhBeFlXWHE2NjlzeXhyU3A4VTIx?=
 =?utf-8?B?ZnAyaGplWWMrRUxaczdUYitJb0xjQjhlS0FJMDJmRWRxbWp0bVpKdnliUWJD?=
 =?utf-8?B?ZlpmSlhhY2FvUmVWU3djUmdPRzh4Q1QzSmgwZ05LS0JvSktkdzRuQ2dIWWhM?=
 =?utf-8?B?NFBvaytmQUorZkEwVW00TWh5dDJnMi9PSGd4eC9CUEdKQTlLb2tQN01mSHdi?=
 =?utf-8?B?eFRNWlVjUUx5cVh0RDNtTXN0S3FCSVlrMVJXVHhmNW0vVnA4ODNwTTdSRWRi?=
 =?utf-8?B?TjZzaUVOMHB6UTFHNmZTRUFYcGZEQ0JGNEZ3a3lkTFM1NWNRRWg2d3crSHBz?=
 =?utf-8?B?cDh5VzRYbm9vOXQ5REsxQkJ0WVZzMlFveGdDNUVLRmpQSnFhR3VyK0NWd1Zp?=
 =?utf-8?B?L2RHWERIckRKd2VtNitkZnNXOXhNQytMenJlVXJiREUvL0hmbU5HSURDTEp5?=
 =?utf-8?B?cGtxWEZhNVdXamNLRzRKVVNMRnhOMEwvUlVZREJrbHBlK1NjWHd4d2xlU0tS?=
 =?utf-8?B?eGtNQVBYTUVKVWNFUlNMOGkybTJqU0NaekkrVzRkQ0tJcEwzRGZCb0ZQUG5s?=
 =?utf-8?B?OXE5TVJ3QmNleXBCVW9iTnZ5c0g4MGFmeGo1RlNtc2VoSVR2NlpJNXF3UUpE?=
 =?utf-8?B?b0Jqd0lFY2ZrWmZOSjcrY3E2TFlPbHJzc0gzdWR3dWtBYlUxVnd6NWN2M0Fi?=
 =?utf-8?B?U041MkY1TUROd3kvUnlIWWJqZDczNGg2U0hZdXJhRkdueUoxaUUvUDFVZ1g0?=
 =?utf-8?B?bXdpME5GWkxXT3B0bDNaVmRHQ2RVOXR2dXd4VzdONWpDWVd1Q1FoaGdMTGlO?=
 =?utf-8?B?M1VYN1RKMjZXNTYyTlVmbEVWbWdLazlvTytHSWtsT2NmQ25uY25ocm9qUmJW?=
 =?utf-8?B?ZXNMLzNMc2t6UlNaaStUQmdhRFJuRk1pSXlVbmZEUG5SNmV4ZWxNdFd3dVZ2?=
 =?utf-8?B?dWRucEE3TGF5b3RBYjhBTzhpamlvdlRBY20xY2o1NFZERmNKdW5lU1poanZB?=
 =?utf-8?B?TWtpc3hNQUJPd1ovWWdnclFtUWpCaGw0c2lFM1QwNTlXaVo3azBVdEZFOFAv?=
 =?utf-8?B?S2tGdi8wcTN4d2VsaGtVK2oxTkVaeTFkUVdDUDJkcWIyNXMwMUNMclBHeTVn?=
 =?utf-8?B?bkhTMVRPc3IrUU93ZjdRVVBmTGM0MkpHU0M2S2hMM0RwWkJtU051aERJYmV3?=
 =?utf-8?B?SDBwbmYvZWpGd1pQa0FRTUZuRDVvUUhRVG85YXYvNDVPUTIyNXdUZDdmMjJh?=
 =?utf-8?B?dm9RWEVKdWwrSDFhRVNBM21DTEpXOVVqV2ltak5JbkpoV2daUEtZL1dKeGF4?=
 =?utf-8?B?SnA5OUp0TGlIUFUrVFhKMUJML3BwMWloQzlIRlpINzNVaDEvNm9sRDZkSDdS?=
 =?utf-8?B?bUNpV2t3U0haUUp6RWRSd3gwd1hOV3B3RW1zbW9OeFFSdEZZMUhidGQ5SGNC?=
 =?utf-8?Q?epgCPbXnmU8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TndlNUNULzQweW0wQzAwVEhPbEIwbHJ3TFJ6czE3THdHVUVhVHdlcy9DK2Vm?=
 =?utf-8?B?K3RvUDhwbEtSTDVUVnpSTnRTSGxRbHpOUnN6ZnZUS1ovUUh4SkxIOHpTaUds?=
 =?utf-8?B?ZnM3dCtsN3k0Y3pUSWFLbjhRVWtTZVNneXN4cE9MWVhLMmFpNFdnTlRFWXVY?=
 =?utf-8?B?QnlTVTZ5VjFKN0I0Y2MxQWR0dEp0ZXFRTHVaU1NEQldXM0NQSEhSSzV3MjlW?=
 =?utf-8?B?MFZDN2ZyOEpQMzFLTUxmeEZlSFNDVzRTYUgrN2tuY0Y2WURLMllpcFNXM1FU?=
 =?utf-8?B?Q0pwdnBjUjVPRmlGR25YMSt6c1VyU2VNY1R4L3dnV1ByRXNzaGVCVFVNOUc1?=
 =?utf-8?B?L2dCT0RmOFJiK2IwRTQ1RWdDN1Q2MHVqOFNzci8yL0NQemFaQ0tDdTBMSDhk?=
 =?utf-8?B?d3FiMjFVcXd4TTN0UTNXL3hWL1FwVGwvS0pSQ2p5NkVZNCtWUUhUUWl2cmQ4?=
 =?utf-8?B?YmsyZkxlck00OThydzg4ZFFwcVZ2ajk3V2xJYVgxQ0tnQXRRZ2NGOE1DOTdU?=
 =?utf-8?B?SHpIK0ZKa3pQaERiWTRZT01Ha0tvTVh1SW95MWlWN2tBaFNMQ3BZaitWelJP?=
 =?utf-8?B?K2JwNUJpUzUvTk4zYzFsSU53K0pGUWc1dHpGdEE4Tkw5UktVdk1rak5qTzRh?=
 =?utf-8?B?bkdkWTB0TVNFZGVqam5hSjBLS0ZwVFNoSjAyalVqVUJGQWVpRkF1cENYdG1I?=
 =?utf-8?B?cFZ1ZGUyT2I5UGpaR2k4VUl2eWVVRWpwdHc5QlhNekl2MzFWa0dhbGdwTEQr?=
 =?utf-8?B?Y0hwS2J5aXBkNER5aUExVkpadUg3T0h3UmhIVWlIN3dLK3RZT3BOSVpwT3da?=
 =?utf-8?B?ZzBNVnhucEFWRHVMNEpLaS9TeE9WRVlXc3hNMnQrU1FOSUZTNHlpcU4xU052?=
 =?utf-8?B?cHVKYVVVYmtFSXhWcUQxNEZhZmtoeVYwTllDYkR0ZDNSTjJxTnlqTnNEVWhO?=
 =?utf-8?B?YUFUZ20xMTRuelNhajJ5Mm42MHNJYW52YzFGN1NSOXZrYW52Ymx6ZGtBVWNo?=
 =?utf-8?B?dSs2QjFiT1NHa0VSd2d1QnhBbXF0UWxLSHFnY3RCZVR5MHY3Rjd2UVlxZUpR?=
 =?utf-8?B?azhhRUpRcU41ZHZRM0FndFZZYVE2OWFhdktGd3Z5eDFERmFTKy9wVGExcVhE?=
 =?utf-8?B?bVp4U3RKRDRkbXFOMXVHMytyeWRrSG5MOEttK0hIZFYzUVlvakNwK2cyaVd6?=
 =?utf-8?B?VVZLZTlQckljQlI3ekhDRllYUzZkRUdXRTBUbEY5Z242OFBtR1RBcVZKdlFa?=
 =?utf-8?B?aktYTTBnS1U0NWM5emNma05QNkZWTDZ4b1BWTmROaUpOZ0xKMThkbVJnU01w?=
 =?utf-8?B?MDd5dWNkM2FVSlk0MHZjaDFka205NGJnVzZ3R0VoZVdIanhvWEVvUWo0Qzk1?=
 =?utf-8?B?cWxDT04zNzd1RitaYVYzOVVoc0dNVGE1YjBseE1FNmlnVi9mbllaU1YwTTFC?=
 =?utf-8?B?Tkh3ZElidm9keDBPUnBySS94N2ZOVldXQnpzU2hHOWZVOVlwWTk5WlE4Mjdu?=
 =?utf-8?B?RDkxVTJjVlNNdFlQb0JwVVhOZG5MQ0RwMjVGUUk2R1hyMXBiSmpVM2hjRGFQ?=
 =?utf-8?B?dVBQQnZySGtVZ3BIOFlXQTRvQmdiZGc0SHVuUHcxTmxRZ211OERlQUpTaDFk?=
 =?utf-8?B?UWMwNis5UmVGTEZ0NHcxSkFNZTBXMklsY1VHeWhZeDBpSUZuWncvcFFTTmxy?=
 =?utf-8?B?VHUycjZCRW8vcSsyNnVrWS9vVEtjL3pDYnhOdHZpbmx6eHdBeDVuWVc3cGRN?=
 =?utf-8?B?bjExc0xYcW54ajJtUHFKMVdyQmZMYVJzNFdya2tZaUVpK095ejdtajZqM2xO?=
 =?utf-8?B?NVdCY2xTMjZYWGExZzF5ZzFLL1pWV3YyTzVPeFFhVDBEcVRxVk44WkQ2cGI4?=
 =?utf-8?B?TVY0SVlldmhINHMvUlY1VmFnTGJHenEyVlBrdUR1dzBUb2dBdk1VMkNrbkRU?=
 =?utf-8?B?NFUyU2hmVHFqaFBMdkMzS2t6TlRkakh6bTlhZDdKQUxxT3Q3eEtCakVRcHpZ?=
 =?utf-8?B?b0RIRlBzQUxVbTNsOVJqZ3lZOEc0ZVk3Yk9sS010T3oxR2IwdDMwc2FJWitY?=
 =?utf-8?B?VGkzdzAweDFDbWtFN2R6Z2k4UktLVDFOYXZUdnpUbHc3TGQvNlhjL0RzaUpR?=
 =?utf-8?Q?vtboR5qKjgVb+K4u2w1P0Fbsr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fcf363-b075-4349-ee14-08ddaa40a31b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 06:07:55.1454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Coiu7WSLp6vGHaUbx5GkDDLW0HtqEN6cNYZ1xjt2SVCzXLCg9fAOZNPirOhjIarvYwNdz1jvW2zJQ7Ug1qPRVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
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

--------------XA8Bmm4ZFY64Mhy9efplQCV1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Karthik,
On 13-06-2025 09:40, Poosa, Karthik wrote:
> On 28-05-2025 00:09, sk.anirban@intel.com wrote:
>> From: Sk Anirban<sk.anirban@intel.com>
>>
>> Update the vram-d3cold-threshold test to include validation of
>> VRAM self-refresh functionality. It introduces checks for VRAM
>> self-refresh capability and verifies the ModS residency to ensure
>> accurate self-refresh behavior.
>> The test now distinguishes between D3Cold and D3Hot states based on
>> VRAM self-refresh capability.
> You can rephase commit message to|,| Update the|vram-d3cold-threshold|test to include validatation of VRAM self-refresh (VRSR) 
> functionality, by including checks for VRSR capability and ModS 
> residency. The test now differentiates between D3Cold and D3Hot states 
> based on VRAM self-refresh capability."
>> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_pm.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 50 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index 6eb21d5ec..f8074a9c6 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -144,6 +144,29 @@ static void vram_d3cold_threshold_restore(int sig)
>>   	close(fd);
>>   }
>>   
>> +static uint64_t read_mods(device_t device)
>> +{
>> +	uint64_t mods_value;
>> +	char buf[4096];
> we dont need 4K buf here, 256 Bytes should be enough.
>> +	int dir, ret;
>> +	char *mods_ptr;
>> +
>> +	dir = igt_debugfs_dir(device.fd_xe);
>> +	igt_assert(dir >= 0);
>> +
> this extra line space is not necessary
>> +	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
>> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
>> +
> this extra line space is not necessary
>> +	close(dir);
>> +
>> +	mods_ptr = strstr(buf, "Package ModS: ");
>> +
> extra line space not needed here.
>> +	if (mods_ptr)
>> +		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n", &mods_value);
>> +
>> +	return mods_value;
>> +}
>> +
>>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>>   {
>>   	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
>> @@ -561,10 +584,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>>   	};
>>   	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
>>   	uint32_t bo, placement;
>> +	int vrsr_capability = 0;
>> +	uint64_t mods_value = 0;
>> +	char buf[4096];
> we dont need 4K buf here, 8 Bytes should be enough.
Sure, I will be sending rev2 with the suggested fixes.

Regards,
Anirban
>> +	int dir, ret;
>>   	bool active;
>>   	void *map;
>>   	int i;
>>   
>> +	dir = igt_debugfs_dir(device.fd_xe);
>> +	igt_assert(dir >= 0);
>> +
>> +	ret = igt_debugfs_simple_read(dir, "vrsr_capable",
>> +				      buf, sizeof(buf));
>> +	igt_assert_f(ret >= 0, "Debugfs vrsr_capable is not present.\n");
>> +	close(dir);
>> +
>> +	if (strstr(buf, "true"))
>> +		vrsr_capability = 1;
>> +
>>   	igt_require(xe_has_vram(device.fd_xe));
>>   
>>   	placement = vram_memory(device.fd_xe, 0);
>> @@ -595,10 +633,21 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>>   	munmap(map, SIZE);
>>   	set_vram_d3cold_threshold(sysfs_fd, threshold);
>>   
>> +	if (vrsr_capability)
>> +		mods_value = read_mods(device);
>> +
>>   	/* Setup D3Cold but card should be in D3hot */
>>   	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
>>   	sleep(1);
>> -	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
>> +	if (vrsr_capability) {
>> +		igt_assert(in_d3(device, IGT_ACPI_D3Cold));
>> +		mods_value = read_mods(device) - mods_value;
>> +		igt_assert_f(mods_value > 0,
>> +			     "Mods residency is inaccurate: %"PRIu64"\n", mods_value);
>> +	} else {
>> +		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
>> +	}
>> +
>>   	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D0);
>>   	gem_close(device.fd_xe, bo);
>>   

--------------XA8Bmm4ZFY64Mhy9efplQCV1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <br>
    Hi Karthik,
    <div class=3D"moz-cite-prefix">On 13-06-2025 09:40, Poosa, Karthik
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:9b0cee58-f6c5-416c-8085-6e0b1a60e=
09e@intel.com">
     =20
      <div class=3D"moz-cite-prefix">On 28-05-2025 00:09, <a class=3D"moz-t=
xt-link-abbreviated moz-txt-link-freetext" href=3D"mailto:sk.anirban@intel.=
com" moz-do-not-send=3D"true">sk.anirban@intel.com</a>
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.ani=
rban@intel.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Sk Anirban <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:sk.anirban@intel.com" moz-do-not-sen=
d=3D"true">&lt;sk.anirban@intel.com&gt;</a>

Update the vram-d3cold-threshold test to include validation of
VRAM self-refresh functionality. It introduces checks for VRAM
self-refresh capability and verifies the ModS residency to ensure
accurate self-refresh behavior.
The test now distinguishes between D3Cold and D3Hot states based on
VRAM self-refresh capability.</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre"><span style=3D"color: rgb(66, =
66, 66); font-family: &quot;Segoe Sans&quot;, &quot;Segoe UI&quot;, &quot;S=
egoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Robot=
o, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style: nor=
mal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: =
0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; white-space: normal; background-color: rgb(250, 250, 250); te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial; display: inline !important; float: none;">You can re=
phase commit message to<code>,</code>

Update the<span>&nbsp;</span></span><code style=3D"color: rgb(66, 66, 66); =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgrou=
nd-color: rgb(250, 250, 250); text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">vram-d3cold-thresho=
ld</code><span style=3D"color: rgb(66, 66, 66); font-family: &quot;Segoe Sa=
ns&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -=
apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-=
serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; b=
ackground-color: rgb(250, 250, 250); text-decoration-thickness: initial; te=
xt-decoration-style: initial; text-decoration-color: initial; display: inli=
ne !important; float: none;"><span>&nbsp;</span>test to include validatatio=
n of
VRAM self-refresh (VRSR) functionality, by including checks for VRSR capabi=
lity and ModS residency.
The test now differentiates between D3Cold and D3Hot states based on VRAM s=
elf-refresh capability.&quot;</span></pre>
      <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.ani=
rban@intel.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">Signed-off-by: Sk Anirban <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sk.anirban@intel.com" moz-d=
o-not-send=3D"true">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pm.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 6eb21d5ec..f8074a9c6 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -144,6 +144,29 @@ static void vram_d3cold_threshold_restore(int sig)
 	close(fd);
 }
=20
+static uint64_t read_mods(device_t device)
+{
+	uint64_t mods_value;
+	char buf[4096];</pre>
      </blockquote>
      we dont need 4K buf here, 256 Bytes should be enough.
      <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.ani=
rban@intel.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">+	int dir, ret;
+	char *mods_ptr;
+
+	dir =3D igt_debugfs_dir(device.fd_xe);
+	igt_assert(dir &gt;=3D 0);
+</pre>
      </blockquote>
      this extra line space is not necessary
      <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.ani=
rban@intel.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">+	ret =3D igt_debugfs_simple=
_read(dir, &quot;gtidle/dgfx_pkg_residencies&quot;, buf, sizeof(buf));
+	igt_assert_f(ret &gt;=3D 0, &quot;Debugfs dgfx_pkg_residencies is not pre=
sent.\n&quot;);
+</pre>
      </blockquote>
      this extra line space is not necessary
      <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.ani=
rban@intel.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">+	close(dir);
+
+	mods_ptr =3D strstr(buf, &quot;Package ModS: &quot;);
+</pre>
      </blockquote>
      extra line space not needed here.
      <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.ani=
rban@intel.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">+	if (mods_ptr)
+		sscanf(mods_ptr, &quot;Package ModS: %&quot;PRIu64&quot;\n&quot;, &amp;m=
ods_value);
+
+	return mods_value;
+}
+
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
 	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
@@ -561,10 +584,25 @@ static void test_vram_d3cold_threshold(device_t devic=
e, int sysfs_fd)
 	};
 	uint64_t vram_used_mb =3D 0, vram_total_mb =3D 0, threshold;
 	uint32_t bo, placement;
+	int vrsr_capability =3D 0;
+	uint64_t mods_value =3D 0;
+	char buf[4096];</pre>
      </blockquote>
      we dont need 4K buf here, 8 Bytes should be enough.</blockquote>
    Sure, I will be sending rev2 with the suggested fixes.<br>
    <br>
    Regards,<br>
    Anirban
    <blockquote type=3D"cite" cite=3D"mid:9b0cee58-f6c5-416c-8085-6e0b1a60e=
09e@intel.com">
      <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.ani=
rban@intel.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">+	int dir, ret;
 	bool active;
 	void *map;
 	int i;
=20
+	dir =3D igt_debugfs_dir(device.fd_xe);
+	igt_assert(dir &gt;=3D 0);
+
+	ret =3D igt_debugfs_simple_read(dir, &quot;vrsr_capable&quot;,
+				      buf, sizeof(buf));
+	igt_assert_f(ret &gt;=3D 0, &quot;Debugfs vrsr_capable is not present.\n&=
quot;);
+	close(dir);
+
+	if (strstr(buf, &quot;true&quot;))
+		vrsr_capability =3D 1;
+
 	igt_require(xe_has_vram(device.fd_xe));
=20
 	placement =3D vram_memory(device.fd_xe, 0);
@@ -595,10 +633,21 @@ static void test_vram_d3cold_threshold(device_t devic=
e, int sysfs_fd)
 	munmap(map, SIZE);
 	set_vram_d3cold_threshold(sysfs_fd, threshold);
=20
+	if (vrsr_capability)
+		mods_value =3D read_mods(device);
+
 	/* Setup D3Cold but card should be in D3hot */
 	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
 	sleep(1);
-	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	if (vrsr_capability) {
+		igt_assert(in_d3(device, IGT_ACPI_D3Cold));
+		mods_value =3D read_mods(device) - mods_value;
+		igt_assert_f(mods_value &gt; 0,
+			     &quot;Mods residency is inaccurate: %&quot;PRIu64&quot;\n&quot;, m=
ods_value);
+	} else {
+		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	}
+
 	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) =3D=3D IGT_ACPI_=
D0);
 	gem_close(device.fd_xe, bo);
=20
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------XA8Bmm4ZFY64Mhy9efplQCV1--

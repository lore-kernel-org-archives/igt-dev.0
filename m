Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ADCC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 06:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3794910E0E2;
	Mon, 12 Aug 2024 06:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XuFU4TzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AC110E0E2
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723444787; x=1754980787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eceDSqDOwKj6Dk7+mQaTKDNDrSWwMomsbhDjEjXBBEA=;
 b=XuFU4TzLkRwhRGVgp6HmRywYFIvAKWIcHdV4elet1iiFKJutMIwIxyBc
 Npv5fHobdUzmYZDqkT1KyRGwOYc5OIF5X/M5h9Me7kzBrlwqbRi0vljB0
 vNhQfEJjW3VcCdPhcqkurnVJTDZrwSBB4bNqi35NjI8u5Cm1lov8p2sfC
 bj5VpuOAnnuiXJ7cAs6CPQxPcFsJw6DM42kttKQzqvxntFkzaFnGW3ukR
 rVAsp2+bg9G7vAcxIUwFg9UnqAIwuupfyFGsGrN7S1ti4tgrm8xTjOR6K
 aipYZFPfBKvFUx78TC0O7WrEzs9wn8hriw7VGp2OBATXtg9cT7JUfmj8q w==;
X-CSE-ConnectionGUID: YV/vZypZQ8KZ92Yls4+umQ==
X-CSE-MsgGUID: BvziToPQQIm/G0SAsujitQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="46938474"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="46938474"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 23:39:46 -0700
X-CSE-ConnectionGUID: vC+JEPkiR7G/vAUWSVGVYQ==
X-CSE-MsgGUID: MP8z+PciTxankl8N6rqWqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58121366"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Aug 2024 23:39:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 23:39:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 23:39:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 23:39:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 23:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ2T6t/EBeCdh5CNn8FjcBDCcgSHSYzQ+YkRR/ZFfGAj0Y/HwGC7YK1QMn0CPgNaNyT4Ik2m3MefEw1OEcsB8kT6P6wQWbrNPuh4BKSg3weQ5orqehKeya794HSqpzzyQjxOJGdFTjQ+v0MSLqZue8XjO7rU5Z8dzOwfdwX/yPF8s9J8aPEUaTUlEYEakg6rucuHjQDLMquwv0NKdQSzBGTdQNCWo2lRu26WhybtqH3s4Fzp6dCSt/J0FIvicy34SrA8hhiwYJHZXleePexFr/3RK0fl6ZpcqrcfSu5L30SvHHasCDOxEeGQaM8vn2P4dZY89uwJFtIQi6La/njzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNyKY/IC7p9E0fg2GVLBhiphDU/r5ZcE3BgpqxIjtvY=;
 b=BhPDL4akin1P7QrFNazdEVB+Sc3ob40vGnMIpo5ayEc5adpFtUDSRWh01u/BRNlN07c+2WJsDYJi8EDgwr3u6zu4Cks89Lxvxx8C8SRTHK957/HGbQ0eNo+V8U9aOJYQfrchTVu/X/+UFUxW3sOJK/+hd/HiVEebZzJnRonYAPno6TAEhJLXhdVvDd45DEwBFv/BImiraAeajO0lyms4xtK2ZPilVQa2GdPUVngsx0aUTPXNolyXN6g7LM0LSYnj2p4nPMtLA1N5w86BetdDnziMm3a3qJ8GZZ0gX1lzPGVQOto4OBvitVQkNbexoEuU7YCFClwUrWYX3Ui7GuccIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Mon, 12 Aug
 2024 06:39:42 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7828.030; Mon, 12 Aug 2024
 06:39:42 +0000
Message-ID: <31fa69e1-fdf0-4bdb-bab2-30dbfa2a69ce@intel.com>
Date: Mon, 12 Aug 2024 12:09:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_joiner: Add tests for Ultrajoiner
 validation
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <santhosh.reddy.guddati@intel.com>,
 <kunal1.joshi@intel.com>
References: <20240812044739.5630-1-karthik.b.s@intel.com>
 <20240812044739.5630-2-karthik.b.s@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240812044739.5630-2-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: a80d20a4-4740-49bb-3b81-08dcba998bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTJUUm5ld0JzOHhSWUk3QTVKQ2pycG00NzRzdjdUdnJFbWg0cGEybFowM3c0?=
 =?utf-8?B?L2ZXK3c0VU13UURZWEVYa25ueURreTFHNlBtNythV2pBUEIxTno4UnVHdFpB?=
 =?utf-8?B?N1JTS1dBc3ZQakxnM01Ub1FjcUdPMXdWNDdoekxkVk83ZEN6Mm4vOUFLMWtN?=
 =?utf-8?B?NEs0QUhPalRsWEZkZ1JqT3ZpZ3V4YVFGRWp4VXhiakU3dVNjQUc3RlVhckxi?=
 =?utf-8?B?NGtlMFBkRE5FWXRwUitXZUdPQzlNajlHSHY5T0d1RS9pa1JVTWNZTG80NjEw?=
 =?utf-8?B?a0RzMStkeXdGcUMvZXN1VUtJUkVqZGplWHpRSmpiVW9VZkZBcVM0ZlJ2YS9t?=
 =?utf-8?B?QlAvT3dsRnBqS1c2TDIrRXBUY3h6V2lVMWUzeTFNZ01paXN6TGllTlhCWWJz?=
 =?utf-8?B?bUsyUmRTWHZMdmcwaEtHb05yTzZ6bFE4MlRNNk1xNnB5VE11bmFKUnpUdTlt?=
 =?utf-8?B?K0RoRlRvVndaWitUWDNTRFQxUUV0Q25uMmZhbk0rTnFBUFh1bzVyVll6MTJx?=
 =?utf-8?B?UTJ2ZlFyZmJLZ1QzYWpqem5XNnZHckpIZE9oNFNEVnduNTVlZUU2ZlRVY0l4?=
 =?utf-8?B?WUZjWkt6dG5PMkZKcE40NDV5SFdNUTd4QjZaNHF4Y2lBVksySVVnc3dJaGw5?=
 =?utf-8?B?WmN4SGN1RnhoTGtlN2hqcktXN0REUkNxaWxCVmZSYXNQUzVoTEhuZzJDZkdO?=
 =?utf-8?B?SnZQcDBLcjc5RUl6b2l5N3JWenBCZWlKcnVnOG9FdXNMUG1UNjhEZTFsclNO?=
 =?utf-8?B?ZThlcFBTNGFWeHAzOTFVR1MyYmJoTlZFTnNQcnljUG9ZWG9zdjFoRDFNOHVW?=
 =?utf-8?B?TnNOMnlsUG9yK25YSGhWSWxBWnIrNGh3VEgyTXBFNkpnMkZ3NnBjLzgxdGlK?=
 =?utf-8?B?dHlMV2dkdVQ2VldsWUtYQmdRd01xVTRMNEdudUVFaGpXR2tid2o0cXV5eVhN?=
 =?utf-8?B?YzQ2S3h1Q1lnRjNVcVBnZXVaUnVoUTZlMFpVMTJ6aSt5YitLazhTYlUzR1Vr?=
 =?utf-8?B?RFREQjg3VnZ3Ym4xVnJhYnBnaWpnOWZyYUtPakhOT21UR0xxTkRqaHlnUHVL?=
 =?utf-8?B?VE9qMmgxUkRLeGVZT0VtL2RISmcwWkhnV21DU09uMDN3bUg3NDIzVVEzSENW?=
 =?utf-8?B?eWs3NnVmZWx2ZkwrTndWbDFXMnpHazV5cE1zaU5sTFJPWnZjRFZVYzFJOHA0?=
 =?utf-8?B?LzJ4clozbk84aUZMMzhXNmc0S1dGa0dqMlNSY0V0TmhwZitmNm9NR2dOSCt4?=
 =?utf-8?B?em9vSDBqWml4VGNJZnp3SUlLbkZnUlkwTWFPRmVxdzhhT0JoampBOFA2R0lR?=
 =?utf-8?B?MXlYNnlUS0UvNTNiR0JwR2JkbWthOWVULzZRTUxSUE9PbWRKTHBqVStrYWgx?=
 =?utf-8?B?VzFlY3Y2ZU9NeXl2dFV3c2dIMG5lWC9PUldLU1ZqZHRXeGlLbVRMOHZpbktR?=
 =?utf-8?B?SC9Ca3ZxVE0ybHgvRDM1eElCSTA5cldnUlZYQnBHaHNPcllncEFYL3dCakE3?=
 =?utf-8?B?NlBGc2djSmlxOFJsYmVEVUV1SHBwOGs5aVhjYTNORGRGUnNZY2JiQ0JxRCtJ?=
 =?utf-8?B?MTlqVjdqVVlQcVI4OG1QOE1RQjVCSFp6cTdxazl4UmZkdVE4bmFabW1jTjBl?=
 =?utf-8?B?bklxRXQvaU04ZlVpcGZETS9ta2hoUTEvV2hyMnNUUGJOa0JidkN6Vko0Tmpt?=
 =?utf-8?B?dFB4TmNRVHlnMEc2cjdiL1ZuUU1EQmVTbzZCb284Vnd5anlrMGR4VC9BUi9j?=
 =?utf-8?B?eXhBOEhFZ0x2OW1QZzgzclZxVUtLSFVLT2VKTDFJTkhXUCtIRytwTDV5Y3RW?=
 =?utf-8?B?QzdIbHd6cTd1cmhRcFV5Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UENSeGc3UTBSWkl0SnNwV2NqNnhkWkh1WitDTjk1WkJidmw0MlY5eUlBcmp0?=
 =?utf-8?B?Q3lWdExzMmJZMkJRUlpJYzNsQUFhSzBidzNkaVllcndUeDd2ZUtoR2tsVDZS?=
 =?utf-8?B?NllDZWV2YUwrd2xFakdxV0VYTTZ2UVZNcXFyZkh2OE8ydmRiN3pCL0pNRzY2?=
 =?utf-8?B?bkZzSCs5d05VZDBMOE16ZkozazZ3VisrRVRHUi9Wb3EwRlJIT0x2MlNpU3RO?=
 =?utf-8?B?S21ZRmE1RTFLdTFhZ0dWT2YzMWZZMXgvNkRNMzluWUhlOFozb01MY2hySmlm?=
 =?utf-8?B?V2E1NHU0K05ZSXk5RmZleWJuRXdpaEZtVGRnRENwK2NjejUyV2NGQ1VsNVBs?=
 =?utf-8?B?NEpWdWtEYThjdm05RSt1RlFBTUlRcW9sRUVmU2R0OE54bFA0R0Z2RHViSmht?=
 =?utf-8?B?R3hwYTZWNUpvd24rSnZETEdrV2ttd0laTHNkM3BNZmFrajhiNTNkdDZsb3h3?=
 =?utf-8?B?blB3YzNnL3ZNRDczLytlVHMxRUM4REVKem9mby9QY3RlampVdW4yTTB2MUl5?=
 =?utf-8?B?ZnAwTXUvZnlxRzEvYmhJQU0rWWcrS2RaRit2VlBJcHlPaDBCZUJGditHK2Ji?=
 =?utf-8?B?WXpsdkMwV3FzM3VlUHpOOVRxakZPbVdTYzVIMldiZjdOcVFQNFFEZUVMcHlX?=
 =?utf-8?B?VGVEcVY1U2RidExUcXpWS0lYNzFmYnRBNEtQcVkwaTF0NG1CY3ZTaUZJYmdm?=
 =?utf-8?B?SEhoTndad0dmazdMdHlQU0p6WGpVNG13SVhKdmtoQTJrZVVlRFhabHJvamU5?=
 =?utf-8?B?Z1FGZ3RQS3Y1Uk43WXpUR3F4NVoyRmw0cjZCU0RRL0d4cXl6TSt3Zzk2VWlJ?=
 =?utf-8?B?RzVaQTg5a01FOGFQendMblN3YTJKbFM1eXRNZzE2WCt4VUZFekF6eWZ3cC85?=
 =?utf-8?B?TnpwUy9aL2hyTG1RQll1T0RUWjZ1NEFMYmI4V0lNZCtNLzZGc3hoMHZMZUFP?=
 =?utf-8?B?UkdiQ2VhcWhMdXZSek1TeG9tTzNOQjJVWXkyd1Z3SjkxOSt2eHJqVnZkOGlH?=
 =?utf-8?B?NTBIV3o0OGFuanU1RktHSk5lNmk0Vkw4Tkt1TWxpakJhUUVJTVlFdFFSRU5t?=
 =?utf-8?B?MG1FcDVCVU85eDlIUWdsTC9qYUIrS2hKRGgwZHRxUDdRRGpKQWRWZk1nWGx1?=
 =?utf-8?B?Vnp4S3JPQ3Bha3JqK0hRM2d2N2w5SmJGZ0lQNnBEam43Yzd4UXJnVFRqWVUz?=
 =?utf-8?B?b2tFZWV5bWlCTkQrNTNCcmR6RjBvUm83SkVoMlpaR2R1QTRiYlAzU0c2Wk5E?=
 =?utf-8?B?ZnFNcVFaR0hqcWpWNlVDczdILzBpV3VRU2Q5Q1cwR3FZMTl6OHpPUDVKbDM1?=
 =?utf-8?B?S2lsYmFjbnJzNS9IUzJZdTFkTnlMQmNPUlp1cDhVenhVZkdYZlZYSytpL3Vi?=
 =?utf-8?B?YThOU2pZTXpCK2dSZmV2WnRYQjhPcFBZR3hnd3NsNktUY2djYi9JOGFQSGtT?=
 =?utf-8?B?eUllM0NTZGVuaGkveExIWlFtQnMvcThDUkl3eHA1Z0NIQTZMckMyLzVUYUNM?=
 =?utf-8?B?T281NElpVjBzVmRMQmRZcDczbTBDTHpTV25zUmF6OHdEc0ZiZ1MvVDNrMmtx?=
 =?utf-8?B?YjhldzNFQXZ2RTF3YStSQ3M1Z0NYL1liZEthTEFWY3BCZlY1dWtsWDMyVGIz?=
 =?utf-8?B?eks4SHZFY0ZDbXordHB0WUpJc0lYdEZkZVQyWmhnWmhkSU5oMUx0Rlhrc2pj?=
 =?utf-8?B?QzJjMU1yZWFmcnV6RktYUHNZeTh4aU9vNnBpMVg1MmRNSHErbEpzZk53em9k?=
 =?utf-8?B?SmNnSWd2QVhxc0JCS2RVMk9FNWhKbGNwbzRNa3ZFcXVJYzlPZGVRUFdaYW15?=
 =?utf-8?B?VHpRUVJpRkRGQTZwVXpBSzNrdjdtMVo1LzFBQWlQTWx0QlZjOXh6THo4SlpH?=
 =?utf-8?B?Z2hSbWU3VmJBM29WOXV0MHREU29INUZ6ZDRFY2lUUGZEYTFnZUpaWjEvMGty?=
 =?utf-8?B?cmNNd1J1VkRneW5xK2lDaldrNmxtMnNnd3ZwVXpXTkdTTGxKSncyRm1CT1Ux?=
 =?utf-8?B?U1ZVK1NralRZVE1veVVXK1U2MFRDSXJXUEF6OFROS0N6aHNRZDkrUEZMZWZP?=
 =?utf-8?B?NkdXMU05K2o5d0hpRVdHeUQ4VFZKYXl3NFgzRittdTlMZ1FERENSTDdNaWRj?=
 =?utf-8?B?bU5SQ2VYbDlWVzBWVGZmVDRMd242c0kwNjJDV2VUMVRGTEJTeXd2RXVsY1Bs?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a80d20a4-4740-49bb-3b81-08dcba998bf4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 06:39:42.1458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6DWu+E/xHjBcv7SA4kdLEHZUNVY2eIlekpr4CTmexAF5eDU2Fwfk1jMXm8OzzLNKjXGZWAow0VvG8u+E4typZhLbJrbOR75fFLHBMIHV+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
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


On 12-08-2024 10:17 am, Karthik B S wrote:
> Add a subtest to validate basic ultrajoiner modeset and a negative test
> to validate invalid pipe configs during an ultrajoiner modeset.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c                                 |  44 +++++
>   lib/igt_kms.h                                 |   3 +
>   .../intel/{kms_big_joiner.c => kms_joiner.c}  | 150 ++++++++++++++++--
>   tests/meson.build                             |   2 +-
>   4 files changed, 183 insertions(+), 16 deletions(-)
>   rename tests/intel/{kms_big_joiner.c => kms_joiner.c} (74%)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e030b35a6..08b628f1a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6347,6 +6347,50 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * igt_ultrajoiner_possible:
> + * @mode: libdrm mode
> + * @max_dotclock: Max pixel clock frequency
> + *
> + * Ultrajoiner will come into the picture, when the requested
> + * mode resolution > 10K or mode clock > 2 * max_dotclock.
> + *
> + * Returns: True if mode requires Ultrajoiner, else False.
> + */
> +bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
> +{
> +	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
> +		mode->clock > 2 * max_dotclock);
> +}
> +
> +/**
> + * Ultrajoiner_mode_found:
> + * @drm_fd: drm file descriptor
> + * @connector: libdrm connector
> + * @max_dot_clock: max dot clock frequency
> + * @mode: libdrm mode to be filled
> + *
> + * Ultrajoiner will come in to the picture when the
> + * resolution > 10K or clock > 2 * max-dot-clock.
> + *
> + * Returns: True if big joiner found in connector modes
> + */
> +bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			  int max_dotclock, drmModeModeInfo *mode)
> +{
> +	bool found = false;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
> +	if (!found) {
> +		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> +		found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
> +	}
> +	if (found)
> +		*mode = connector->modes[0];
> +	return found;
> +}
> +
>   /**
>    * igt_has_force_joiner_debugfs
>    * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e8582a45b..c8e89b076 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1216,6 +1216,9 @@ int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
> +bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
>   bool igt_check_force_joiner_status(int drmfd, char *connector_name);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_joiner.c
> similarity index 74%
> rename from tests/intel/kms_big_joiner.c
> rename to tests/intel/kms_joiner.c
> index 7c370bc60..633bf51c7 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -37,13 +37,20 @@
>   #include "igt.h"
>   
>   /**
> - * SUBTEST: invalid-modeset
> + * SUBTEST: invalid-modeset-big-joiner
>    * Description: Verify if the modeset on the adjoining pipe is rejected when
>    *              the pipe is active with a big joiner modeset
>    *
> - * SUBTEST: basic
> + * SUBTEST: invalid-modeset-ultra-joiner
> + * Description: Verify if the modeset on the other pipes are rejected when
> + *              the pipe A is active with ultra joiner modeset
> + *
> + * SUBTEST: basic-big-joiner
>    * Description: Verify the basic modeset on big joiner mode on all pipes
>    *
> + * SUBTEST: basic-ultra-joiner
> + * Description: Verify the basic modeset on ultra joiner mode on all pipes
> + *
>    * SUBTEST: invalid-modeset-force-joiner
>    * Description: Verify if modeset on adjacent pipe is declined when force joiner modeset is active.
>    *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs,
> @@ -54,20 +61,24 @@
>    *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
>    *		the test exclusively targets non-bigjoiner outputs.
>    */
> -IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
> +IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
>   #define INVALID_TEST_OUTPUT 2
>   
>   typedef struct {
>   	int drm_fd;
>   	int big_joiner_output_count;
> +	int ultra_joiner_output_count;
>   	int non_big_joiner_output_count;
> +	int non_ultra_joiner_output_count;
>   	int mixed_output_count;
>   	int output_count;
>   	int n_pipes;
>   	uint32_t master_pipes;
>   	igt_output_t *big_joiner_output[IGT_MAX_PIPES];
> +	igt_output_t *ultra_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
> +	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *mixed_output[IGT_MAX_PIPES];
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   	igt_display_t display;
> @@ -286,6 +297,81 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   	}
>   }
>   
> +static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
> +{
> +	int i, j, k, ret;
> +	igt_output_t *output, *non_ultra_joiner_output;
> +	igt_plane_t *primary;
> +	igt_output_t **outputs;
> +	igt_fb_t fb;
> +	drmModeModeInfo mode;
> +
> +	outputs = data->ultra_joiner_output;
> +	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	for (i = 0; i < data->ultra_joiner_output_count; i++) {
> +		output = outputs[i];
> +		igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
> +		igt_output_override_mode(output, &mode);
> +		for (j = 0; j < data->n_pipes; j++) {
> +			/* Ultra joiner is only valid on PIPE_A */
> +			if (invalid_pipe && j == PIPE_A)
> +				continue;
> +			if (!invalid_pipe && j != PIPE_A)
> +				continue;
> +			if (two_display && j != PIPE_A)
> +				continue;

I guess, we need similar checks in intel_pipe_output_combo_valid() or 
somewhere in the igt lib to prevent other subtests to fail on 
pipe-(B|C|D) and so on.

- Bhanu

> +
> +			igt_output_set_pipe(output, data->pipe_seq[j]);
> +
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb);
> +			igt_plane_set_fb(primary, &fb);
> +
> +			if (invalid_pipe)
> +				ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +			else
> +				igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +			if (two_display) {
> +				for_each_connected_output(&data->display, non_ultra_joiner_output) {
> +					if (output->id != non_ultra_joiner_output->id) {
> +						for (k = 1; k < data->n_pipes; k++) {
> +							igt_plane_t *plane;
> +							drmModeModeInfo *mode1;
> +
> +							mode1 = igt_output_get_mode(non_ultra_joiner_output);
> +
> +							igt_output_set_pipe(non_ultra_joiner_output, data->pipe_seq[k]);
> +							plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +							igt_plane_set_fb(plane, &fb);
> +							igt_fb_set_size(&fb, plane, mode1->hdisplay, mode1->vdisplay);
> +							igt_plane_set_size(plane, mode1->hdisplay, mode1->vdisplay);
> +
> +							ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +
> +							igt_plane_set_fb(plane, NULL);
> +							igt_assert_f(ret != 0, "Commit expected to fail on second display\n");
> +						}
> +						/* Validation with one output is sufficient */
> +						break;
> +					}
> +				}
> +			}
> +
> +			igt_display_reset(&data->display);
> +			igt_plane_set_fb(primary, NULL);
> +			igt_remove_fb(data->drm_fd, &fb);
> +
> +			if (invalid_pipe)
> +				igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> +		}
> +	}
> +}
> +
>   igt_main
>   {
>   	bool force_joiner_supported;
> @@ -297,7 +383,9 @@ igt_main
>   	igt_fixture {
>   		force_joiner_supported = false;
>   		data.big_joiner_output_count = 0;
> +		data.ultra_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
> +		data.non_ultra_joiner_output_count = 0;
>   		data.mixed_output_count = 0;
>   		data.output_count = 0;
>   		j = 0;
> @@ -310,24 +398,31 @@ igt_main
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
>   		for_each_connected_output(&data.display, output) {
> -			bool found = false;
> +			bool ultrajoiner_found = false, bigjoiner_found = false;
>   			drmModeConnector *connector = output->config.connector;
>   
>   			/*
>   			 * Bigjoiner will come in to the picture when the
>   			 * resolution > 5K or clock > max-dot-clock.
> +			 * Ultrajoiner will come in to the picture when the
> +			 * resolution > 10K or clock > 2 * max-dot-clock.
>   			 */
> -			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> +			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> +			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   
> -			if (found) {
> +			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
> +				force_joiner_supported = true;
> +
> +			if (ultrajoiner_found)
> +				data.ultra_joiner_output[data.ultra_joiner_output_count++] = output;
> +			else if (force_joiner_supported)
> +				data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++] = output;
> +
> +			if (bigjoiner_found)
>   				data.big_joiner_output[data.big_joiner_output_count++] = output;
> -				igt_output_override_mode(output, &mode);
> -			} else {
> -				if (igt_has_force_joiner_debugfs(data.drm_fd, output->name)) {
> -					force_joiner_supported = true;
> -					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
> -				}
> -			}
> +			else if (force_joiner_supported)
> +				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
> +
>   			data.output_count++;
>   		}
>   		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> @@ -337,6 +432,7 @@ igt_main
>   			data.mixed_output[data.mixed_output_count++] = data.big_joiner_output[0];
>   			data.mixed_output[data.mixed_output_count++] = data.non_big_joiner_output[0];
>   		}
> +
>   		data.n_pipes = 0;
>   		for_each_pipe(&data.display, i) {
>   			data.n_pipes++;
> @@ -346,7 +442,7 @@ igt_main
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -	igt_subtest_with_dynamic("basic") {
> +	igt_subtest_with_dynamic("basic-big-joiner") {
>   			igt_require_f(data.big_joiner_output_count > 0,
>   				      "No bigjoiner output found\n");
>   			igt_require_f(data.n_pipes > 1,
> @@ -358,9 +454,19 @@ igt_main
>   					test_multi_joiner(&data, data.big_joiner_output_count, false);
>   	}
>   
> +	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-ultra-joiner") {
> +			igt_require_f(data.ultra_joiner_output_count > 0,
> +				      "No ultrajoiner output found\n");
> +			igt_require_f(data.n_pipes > 3,
> +				      "Minimum 4 pipes required\n");
> +			igt_dynamic_f("single-joiner")
> +				test_ultra_joiner(&data, false, false);
> +	}
> +
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>   		     "when the pipe is active with a big joiner modeset");
> -	igt_subtest_with_dynamic("invalid-modeset") {
> +	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>   		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
>   		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>   		if (data.big_joiner_output_count >= 1)
> @@ -374,6 +480,20 @@ igt_main
>   				test_invalid_modeset_two_joiner(&data, true, false);
>   	}
>   
> +	igt_describe("Verify if the modeset on the other pipes are rejected "
> +		     "when the pipe A is active with a ultra joiner modeset");
> +	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> +		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
> +		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
> +
> +		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> +			test_ultra_joiner(&data, true, false);
> +		if (data.non_ultra_joiner_output_count > 0) {
> +			igt_dynamic_f("2x")
> +				test_ultra_joiner(&data, false, true);
> +		}
> +	}
> +
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>   	igt_subtest_with_dynamic("basic-force-joiner") {
>   		igt_require_f(force_joiner_supported,
> diff --git a/tests/meson.build b/tests/meson.build
> index e649466be..7cf359962 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -242,7 +242,6 @@ intel_i915_progs = [
>   
>   intel_kms_progs = [
>   	'kms_big_fb',
> -	'kms_big_joiner' ,
>   	'kms_busy',
>   	'kms_ccs',
>   	'kms_cdclk',
> @@ -255,6 +254,7 @@ intel_kms_progs = [
>   	'kms_flip_scaled_crc',
>   	'kms_flip_tiling',
>   	'kms_frontbuffer_tracking',
> +	'kms_joiner',
>   	'kms_legacy_colorkey',
>   	'kms_mmap_write_crc',
>   	'kms_pipe_b_c_ivb',

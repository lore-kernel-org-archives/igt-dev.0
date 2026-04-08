Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A15FFD5F87
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 06:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FE610E0C5;
	Wed,  8 Apr 2026 06:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXZfH3Iy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4941F10E0C5
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775630834; x=1807166834;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=DqMpPH5BvMua9io794U50ZLTi7C3EwWB3wzCub4i0dk=;
 b=JXZfH3IyDManf218mRZFawX64rdSrJcqlSjCMwj+cNpJG/+b9mBzlcPH
 z4zfemRJhtj7Mts2zusFf5FBZa03sw0XCHQBvx5T5BHlSKaqxTVuvATeE
 a5iMFnVNG6VlueyuVH9emQe8BrqYOvGRAkHnCfp5XtLrc5Issga/iFhGx
 YwN/MHJHIsnZkmcVUl/9M3BosouS7vj8mAYqIXCyj8dx/qi6f6l43jVFi
 m2uEk6ftP7jMgJg8CanQdhg0n8L7RkDuH/0uD8xOU4YoPY4E2hW1uJHoB
 kkg4gvvyBjOvXcK34oAorSjZ1s4GS1iMtVkf9qcvZMZBEi9wyPg1VAMI8 w==;
X-CSE-ConnectionGUID: HOeULtgTTrCUKZps/0Oc+Q==
X-CSE-MsgGUID: It/H5a+rRNOioeM7UZ65Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87232817"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208,217";a="87232817"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 23:47:14 -0700
X-CSE-ConnectionGUID: pVXUfBRkSCOKftY+3+hswQ==
X-CSE-MsgGUID: 39Hs6wutQPmTpg2zH3gMjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
 d="scan'208,217";a="227366212"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 23:47:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:47:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 23:47:13 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUdZFmrgVHKWjutnNDjNa4e4YBHd4NmffUwhiZLeScjQaK1Ydo/l+WA8mZnfcC1HwYWuVs9drhPC3Mw0+FYw4rFTC1F9oaBJEyWBTnU+mwOSwXfyDYNMe5Hcz8ZjI7N02z4Ad0GYOhSwW9JPgxK+vGLkF3ZXboamebgQKWdJxiasxgqifq53yinwODBd1bd5oFfLJvQSaO9jb1dpDdb7zxY8qCEtMKF5EE+vSIezU858lCO5pAfN8qj9KYBLIg9WggGADvBDJ9McTKTjp+VWHNix/5GedvMEmqX7AbmXFsQXbL0Z0xT6xQqeEh7M/urprXiqYxo54GdZWiiULlt/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrTSLHkzmlsIN1QKBmBj68CA+wBpahF1fJnvcYPgS8w=;
 b=lnB40qtwOIIkeH4TO730ipZPk4ppgmQOm+rLKN8UspoFcfMUvEdp7sRXN+UijYPAhLyPSjjHvSrRh31YyODcgMpR6mduLzbsp+D1HhEtkJe3lB+Br6ycLga6mvHDYBXYrk/KEP7ESZJgiB/E/BImG9eSa48w3OmS7ogBSBnBY1SAzzRafQayz3vrxpEYzfSR3x30syBaqT+uI395oJbaeovyk6UgLppRDQ04SyRdEB4E8+QzOTxNlBOjEM/ixEYojMedowoseCG21sgypxcdGEQdxI+w3FNrwmG66T0LNhQD2n1jJe+DKS5BqiMy0ryw0OO7nYfMyxjPkM2TnleNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DM4PR11MB6549.namprd11.prod.outlook.com (2603:10b6:8:8e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Wed, 8 Apr 2026 06:46:54 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 06:46:32 +0000
Content-Type: multipart/alternative;
 boundary="------------H8wNZs5T7h00z1yaoL2M060p"
Message-ID: <c6ac10c1-1200-4c98-99a5-cf81f5a30ba2@intel.com>
Date: Wed, 8 Apr 2026 12:16:24 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fpm=5Fresidency=3A_ensure_C6_GT_before_cpg-gt-toggle?=
To: <igt-dev@lists.freedesktop.org>
References: <20260309105756.110294-2-sk.anirban@intel.com>
 <177309599281.335140.2306016128870622116@a3b018990fe9>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <177309599281.335140.2306016128870622116@a3b018990fe9>
X-ClientProxiedBy: MA5P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::16) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DM4PR11MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b062eb-e9e8-45a5-edb8-08de953a91a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|13003099007|18002099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: 6h/mqBu9fRzJibmq67Pr4s1k0PIpeijTVO9aMmry3UdGh9Vg6z+IpCRaJWjOsH9QOFePAzd+wAtUz5SDtxbo/Mg1aiWNB0lnK8iPr957//ncNBIbAq+y7Z+VMPzBj2bUgQI+HpXmLV7/56SdmG2UcQ+2HOhhWmJoG3yJi8DklvHj1T4OPC6fVdoW6XIuq6wx/YMOAXMmWiFv/xrqZeXCr7HJTztJy4C2LHaymJYe3c/OcUXuM0/8p4vLkAwRYBu5fg32cFq5ABjvDzcnkKHu0WAucttFoosXhLmKO3C8D/d5CclOa+CeJ7QZzmq+QOGX81J5XrF+65QmIXPVb8/R+RNvrVUJvifyTxmEJ/iOuHlCcoWXKj/+3Xs47MADddVj0OiyvGBJv7qnxOa/YE9xC+redfm4tLnPbAVDi450WXJTF9eiNzcU0GzQFytcK7jXbD3dVT2sfQquNymyE1ta+ubyf0BIKMXYvExbkcxXhs9wYMzB53vO+HIK8oBrM645jXGskhCi5EwmHjNjiKcYmuJHAdFvAnTRSO4gclku0eHk9Aqm1Bv/a2MlLTUeZQGvdwkbVmrD0jn7jVabG1+8zZmmsQNfEBF6e0rUniFSXkp0YtiauAYosS8wlyOWYCIGEEizNqnYUTL3a5MhnxhjYa9x5dPNlHNtDLIwesCSo5vSqxE3xbUzqt4apTTV127b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(13003099007)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXdlYVh4K2NTRTkxVkRJNnhQby80T2dvM0ZZU0pQaTJlNkoveDBhdnNxdi9V?=
 =?utf-8?B?ZTVvYlpoMkJUcllDdkg4bWZFR3JMRW5NNmMxRGl1VVJnZy90YjVJWER2d3dv?=
 =?utf-8?B?OEJLVlhkRlhiTEVLTFUvUk44ZmZnWWpzVDh6MlQ3UzRIL3VCMVNIL2VQZ0lJ?=
 =?utf-8?B?clhZQnBBNUl2TlZoZCtDeTJPQWN6MEs5dlY0L2ZabHh4ZzhqL3lDcmxWYlNT?=
 =?utf-8?B?TVB0Z3k5TUcyeXNUSXg0eXRNbWdGcVJpd1BiNXpCV0I5SWd4aXhCUCtOcnVC?=
 =?utf-8?B?UjVSVGJaRlhpZXViK1ExZWIxNURtendKRWhHZFRJa3I1bjNrblN2OGVpbnh0?=
 =?utf-8?B?cnovRSt3aXVjc09FQzZvbEZTMkpqSEZEYnB1MDhNbGQ2MWFLTGRuOENNbm9M?=
 =?utf-8?B?R1pBY0c2OWhEblVVRFFjbThUNjVGUzZIQ2pINHRnQzRVZGZrbTM2cnc2RnFr?=
 =?utf-8?B?VStFL1EzNmNLNzdiUmNMR2w2Z0RTYk54UXMweGt3SFVtSGI5NjVJbUJkdzlU?=
 =?utf-8?B?MTBiRmtHN3ZVVTZrWml1MEJnblZVVGlQK1Awc05iMDRsblZVSjJ0UXA3MHp5?=
 =?utf-8?B?dzJNM1VqYUVrT1ovNkFZUm5TcWN6RDB5SXYveTJMV2NIOFJqNDdob3djVHUz?=
 =?utf-8?B?T2tqT3YyUmpkWkFBOTU1ZGl2OExpZ1Y5WEdsSTRoTHZDemlYVit2aHI0OTZo?=
 =?utf-8?B?bUVCMDAwemdyNVI2RkJzdzRiS085RU91YVoyaUhJRTN5UDh2cFgvMDVYRmNT?=
 =?utf-8?B?Q0pKOEF3dWZvU3JlWWk0OWdGdlJLQktzQkN2KzdYUUdCS2xsMVV2REFnb2Qy?=
 =?utf-8?B?TGY3VmJuMmRIcW9vSWQ3bVhZT3YwaG1LR0JqcG1za1dwTkt0OFVvUnZwaTN6?=
 =?utf-8?B?d2VUZEt0TWk3dUtkWnpMMHQrSGIyTzZ1VG9UQkJvZDllaC9CNFB3dlVNemtE?=
 =?utf-8?B?cW5wNXo2Y2ZwaDIrL3Z3TXBKajc4NThVTHltQVBYQitwbExhczYvcUxDQStI?=
 =?utf-8?B?ZzM4SFF6MElQc3UwUE5RYzNBL0N2ZmhFU0JoVzR5aGlPZGh2eTFTQlBlcGU2?=
 =?utf-8?B?RTJ3S3BhN2dnYUJidEVpcDRhdzQyOHRGc2l1UVhFZXNKeEVXR2lFd0I1Y2k0?=
 =?utf-8?B?QXFQQVBQVGNORUpBMHY1VEcxNktJc0FCMGVoSnRLZUlFY21BM0oxbDlMZ1Nt?=
 =?utf-8?B?dW1yVlJmUXZieXlHdEltZUNqY0pWaTJhallzb3ExcGdSMGFoRyt2Yk4zRzRi?=
 =?utf-8?B?Rk5vYjR3NjFRZEVHVExBRTdZWm9sYmx4KzdlV2ZTUGpTcktkWmJDdzloZTMr?=
 =?utf-8?B?NUVpN2FrREZwcnRGUzBwQzFqRjVDVzYvbGJ5ZWtybnlZUEw1c095VUVtVHJH?=
 =?utf-8?B?MXRYS0RINzN5WWRvbmNaZ3U0K1dRbzRZd3poNXo5M3g1d3ZHNmNTRGxLT0RD?=
 =?utf-8?B?ZTRTR09oSExYeVIrMW9pcWxGNFVlNXhMY2VMMmIxOU1CR3VtNHpGNE45RVRy?=
 =?utf-8?B?cmxwODV2SVp2ampyVCtrL2huZjJ0RUdxTURJLzJBRDFLZkhiMVVtYjg4YzFZ?=
 =?utf-8?B?eFdCeTJqUTFCRUdNd0RacS91a0tOS0VSWVRzMGZZem92ejBGYUN1eTRFTXF3?=
 =?utf-8?B?R3JZLys4NWM5b2xzakRPaWU2Zi9rYW5rSWoxYzgrTTlvZDRtM0syOXRIM0dp?=
 =?utf-8?B?WkpRMlpaVzdYQ3VPdW5UVlpTUWNGNlhkYmVVNlQ3d3hwWVZLTG9rbE1NaStW?=
 =?utf-8?B?SUc2RG1jQ2lPUFR2UWhxNkNyckNYY2UzRnhKK3oydlNpY3JYUTFqcnpVZXJE?=
 =?utf-8?B?c0licjFMcFhGTmZMNHJNWmpoa0R0Vk9KY0NNSmFKcVh6eU5vM1Evc0dXMnMy?=
 =?utf-8?B?U1dKUWF3V1g1cmdSNGlmdElMQ0FxYVE3Vm9HcHBYNlNzaExvK2V0MXJiTTMw?=
 =?utf-8?B?ZGlhWUNNWTI5MmdmSVlPTEZ2a3VTSWpFbVBnWDQxa0pBRkZUa0svc2w0ck1X?=
 =?utf-8?B?T2ZvdnBFUlJGeDViNm5zSytoM3lNL1E3S3B4UU1OM2RXZGhJSVpZek15NW1Y?=
 =?utf-8?B?Y2xGMEFMUS9OdVM2MHQwZFZHc0xoYm9UdXpjb1ZYODhTemZad2ViMWIrMkZx?=
 =?utf-8?B?WnhNNHVvejYzdlNVZHAwTDlMWDAzWUtZZUFaTnZ0Z0VoVVpiOW9NOUE3K0xK?=
 =?utf-8?B?NEcyYUdhZkhqd3dobTc0b0RLK1pPV2xTbnppNTkyaThuYVM5TEZoNjcvZDln?=
 =?utf-8?B?WjRWSVpGMklHbHFPditmL1J1dUlNT0VrZTNwakM4RS9GZ2hyMVVWS3poSzBa?=
 =?utf-8?B?Y2ZZYVlOb0ZQSzBoYk9xZ2ZqWUM3RUxsYk85WjVRMTdnNXZiSmZMdz09?=
X-Exchange-RoutingPolicyChecked: moRVHADbhzRSSQSVaSIeCpWllCcWJLhDxlMW2WfP0jNl8U+Acgz5Zb5qopJh8ZsrUPSsfkwfD2NGLtdqGgf8nx08KZYHzA/iDHF3xhKGrRcefGtMt+xBKN1MLN/9eu2kB6jpDEDvKh0gD5CMAG6WL6ReolDML9OlRWxUW5UK6sdlExfXqRwQ6W7gdS8QoYhp7T8iN96hAeoRPKRRMMzn7ulhbGmEJUDpxGNwniYj+9yqlCThv+BhgB2OMmWmF7F517Tp+8v6alDWJOGDOJfIaV00dSE5LFzxiay3M/DtU1mc2PqDwryi3CPJspSgo1n4SifRfa5HgR45xaP1XfTfFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b062eb-e9e8-45a5-edb8-08de953a91a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 06:46:32.0957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6aoRf5BldCWbzpNCGy5sAl6b2zkFWbO7MAcW9IFzvb7zmofYW3nlgbRQ+jjHajvwP0BI3tN4sNiBZkGLENP1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
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

--------------H8wNZs5T7h00z1yaoL2M060p
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

These failures are not related to my changes. Could you please re-report?

Thanks,

Anirban

On 10-03-2026 04:09 am, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_pm_residency: ensure C6 GT before cpg-gt-toggle
> *URL:* 	https://patchwork.freedesktop.org/series/162863/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14700/index.html
>
>
>   CI Bug Log - changes from XEIGT_8787_FULL -> XEIGTPW_14700_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14700_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14700_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14700_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8787/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14700/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         +2 other tests fail
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8787/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14700/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html>
>         +1 other test abort
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_14700_FULL that come from known 
> issues:
>
--------------H8wNZs5T7h00z1yaoL2M060p
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>These failures are not related to my changes. Could you please
      re-report?<br>
      <br>
      Thanks,</p>
    <p>Anirban</p>
    <div class="moz-cite-prefix">On 10-03-2026 04:09 am, Patchwork
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177309599281.335140.2306016128870622116@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_pm_residency: ensure C6 GT before
              cpg-gt-toggle</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/162863/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/162863/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14700/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14700/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8787_FULL -&gt;
        XEIGTPW_14700_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14700_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14700_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14700_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8787/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14700/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">FAIL</a> +2 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8787/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14700/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html" moz-do-not-send="true">ABORT</a> +1 other test abort</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_14700_FULL that come from
        known issues:</p>
    </blockquote>
  </body>
</html>

--------------H8wNZs5T7h00z1yaoL2M060p--

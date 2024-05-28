Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0C8C25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 07:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0559F10FFF9;
	Tue, 28 May 2024 07:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8zs4vEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605D410FFF9
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 07:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716882073; x=1748418073;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wHe6IHfiwjiaP2I/2s3ltpIYYrD3MvMcc8/gUvRk1yE=;
 b=A8zs4vEZWUKZ0nx1NHExWyTfMWKQSArneUWR4m8jmvo/csiDfQPcyego
 fYRbYstmEcHVuFyeLNFoQCJJW1qCDwZvErE/15C+n/ers0vySNqw6VCP8
 +6bsG1NbvqJrxp/zGg15lLaPUik7O1A4rpdk35JTyOPPLQg71ILR91foE
 ycIhot2VMz2DE097L/05EExOKV0Ys+e+UH+Rna6WOQExEA6SmZiMUIRai
 yPL5Gxp7hrUSuiimcV7OFOqIObhaisb4O6XktEXOIoVfb6yFoyW3b6SyN
 ri+1LLb8Q0TtJKIEcsfSuKJHqYfvNrQnaFBbJl+ugIAy7O8On1EVfyOKL A==;
X-CSE-ConnectionGUID: J59vcbD5SX+KDE/xhtcJhg==
X-CSE-MsgGUID: kVHCBPKKRZ2puVu+mh27MA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16158992"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="16158992"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:41:12 -0700
X-CSE-ConnectionGUID: nAmw4Cp5Sz+fjOP61uILdg==
X-CSE-MsgGUID: a0nQ6W1vSX2fQCz7vl/W+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="39415757"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 00:41:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 00:41:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 00:41:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 00:41:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 00:41:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1MluijuqfZUFdi7u5O8YZewR+s+sr68w1PnGMi65CnfGmwDH0FFZVjC+Pw92o+GHc4hA808NOqlQc0xFj5T67TUpKwxkqbkLq2zwBUKJwqSHQ1M32/RDYxf1fQWTPONdE8KptlfsXhFG4bbLprENJFYJuXEn0TGRxpt3aA4LFrCbcwnaYoUTjVNv7ZAF0N/EGBreftzDkvDPUgijJDSLc8t2MvmWH8E8T4mdR9VMnqfs52regkcUwW4Htq4DykOS9POrEe26m0fo3YNcfAGJs8i6FhoBPTM384oj4auarFyGqSM+L/21At50YA4TrvfYrP7APwC/ns223F2x2SVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFUy/m/53yBWbZzMeMWbWNwUmygCgeh4pS0AB8ou3wM=;
 b=Q3U/oLlpYJu+dbAz+OewbVjraxDg2Bg76B4oN6r1SSC+ebWl1wzL7K3rrjJxbF7lB6HGKgQUy2ayBNbtu0JxskskID2ORgXMN4Uxp1wPx58CDnU/byV5LzIE8LXChe7Ddt1G8KUqfS/defvylGeb6vkCXlN52bc/wwSoHbawgU6ARFqc6ETODoHtpEUkff+xweE4DrtpDAn4LnKt9hT0j8+Nkq3JZwieehzNBXKxWUQy59GBUQ4wCO91l8OXP6JXPyiJ4tc/oF298QTJY0Am/nhwinH5X5BNqFouY3U+HJMU4iIvCHzctsdClUN2+HOEukoJfGdiN6qdzpYLP/kFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 07:41:07 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 07:41:06 +0000
Message-ID: <22b5ca86-d0b8-45b9-9b2f-40e4806ca276@intel.com>
Date: Tue, 28 May 2024 13:10:51 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Enable_fbdev?=
 =?UTF-8?Q?_tests_on_XE?=
To: <igt-dev@lists.freedesktop.org>, <lgci.bug.filing@intel.com>,
 <tejasreex.illipilli@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
 <171687749535.2215174.12243496619124255263@8e613ede5ea5>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <171687749535.2215174.12243496619124255263@8e613ede5ea5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|LV2PR11MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8cd53f-82c3-46cb-5c0d-08dc7ee988ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzVtRmV3NTkzRkdTUXhlQUN4aXZpWkhEbFRHclpsWlJDR2NDQ1JrVWgwUWJq?=
 =?utf-8?B?UGhXUytIU1dBdEF5WEQwbHFFT292MWVjNDA1VXpQQyt5MHZ5dEpweGc3VVg1?=
 =?utf-8?B?OU5aVk1Jckx4bVlzSE05UThIcFRyQTFheXAwNzNTNmh1OGRWQWtFTmdQbm9p?=
 =?utf-8?B?UjdCcDdqL2tKZDZ2ekk4eUl3UjhZUUxKWk5LTlhBL2l5SjZFQlVNZldQWWdM?=
 =?utf-8?B?Y2J6TEdpYmNtZTBRbGxLZEFXK2xNcGo2c29BcWNCckx1Z2FpRmsrVE80L1lD?=
 =?utf-8?B?RGFUNVJnRVdFK1Zoekp1ejZlSzA2cE5uSXJrK1ZlUENuMGNtMklmd1lBVk9z?=
 =?utf-8?B?STl6QnltdEFhT3g4STN2ZVpFQkZKczl6ZHovTTNjc2E5WkNPOHcrOHhtektT?=
 =?utf-8?B?YWYweE1nS3NXMTBiRE9jSGVzRVFEd3dhY1hIdnB4VzJnbVBJaEZ2RGNKdGl5?=
 =?utf-8?B?ckZJK09FSUJvbGRLbnNQN0dYZjVtZVZzdnVFaHZDd1ZYMkdWQ01hTHpYN1FG?=
 =?utf-8?B?WVdGSjR2S2hKay9uRERWaTJXZHRwK25JREtwWDRzTzNBNElsSTJDR3hRdXkr?=
 =?utf-8?B?enllYTN2MDVCa2Y1RVZrUTk2ZzNic3RnVzVmbFJpYmlEeGJKbVUvYThQa2tE?=
 =?utf-8?B?NmRjTVV1T1ZiMkNMeVprTEJpcmJ3dFB6am92VW9pL2tZbEFSTU5WL2FSWStu?=
 =?utf-8?B?Mk02MVkyZGkwWE9RRURGVXhZb0JDd09TK0tQTlhPQVczbHRZMmQySW9kdnpn?=
 =?utf-8?B?a21oNFZzc29idnhHaFVhMnpoRWRhSWk2dDJoMWd2T0swY0UvRnZFVzgzVkd2?=
 =?utf-8?B?OUxMY1liTldSeVJKUDVScnVtVEQvb0p6Rm1vQ2R6bVJ5MkI3SXhsSXdaZXZ4?=
 =?utf-8?B?NHlwWlhkTHVESmhPbTkwUldnZ3BuQmU4d2Q1TzBzTFUyQ0U0RHdIdTd2T1J5?=
 =?utf-8?B?NzdGdDA2Ty8wTWlrb0kxUG9obnpNdkoxK1cyc1RVNmQzTGpRNStjZnoydVRS?=
 =?utf-8?B?cU05bXJGd0hJMTlzY3oySVhlMWlOTXZCYi9SemdDVTZqdHVpbEkyMDluajdR?=
 =?utf-8?B?OUxUR044dmFWdmdqeldWNEsvakJRK1ZGYVdXTkdPaG15cTdVR3F0TjRwcFlL?=
 =?utf-8?B?dUZxczI5WTBiWWp4YXUxVlg0RVl4TVJIaUpyR1hBQmNSTG5zOVY1VDZqOWVo?=
 =?utf-8?B?NS80NzJyUFJkR2QzbU5FcHFkbm5QQVlRRGR6TlFXcDFwbllTVE1IM25OUXp4?=
 =?utf-8?B?alRaRE90NUFBM3hKOExYQ1dKZHRCWGtlbTVPdm52dHUzQVdFaEJuRllzZTds?=
 =?utf-8?B?VFRNMy9MK2tDQUlDMjZDUTlYZkgrS2tvWFhySTF0Mnc0eko0MWNOMGpQdVAw?=
 =?utf-8?B?S25xSzZGdUxNbVVubEQ3Y3JSWU5Hd0xBQktnZk1zSlZOOC9wbDA1V2Z5T2RE?=
 =?utf-8?B?cmdSWFFTWTNCSTBaOXRhNTR2VFI4Wjh3aE84KzFmZW9jb2NNSE9uS0JuMUpG?=
 =?utf-8?B?enZqYVBSR2NyUUUxeENyRENGMW11ekhjc0Z1WFd4Vm9MSERRTWtvV1Y0OFE5?=
 =?utf-8?B?Nm1wUEZWVzlzU1lueU9HaUpGaTBxd2ZCSWMwRTd1R0RXYTh0K1RZSFRoZHlD?=
 =?utf-8?Q?yTlWFhnj5p0vqFFR9NgG0OlzHqk9OWY+mLRf+asj4vUA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGdvUHZ1S04wWEpmK0VtaU5ISnRMSkU4dU02YmFzMGZ6YUZWWWs0ODZPWWhE?=
 =?utf-8?B?c1Fneno5ZDBCT0ZLbklKSkpTdkhtMmd5ZUo0YTk3TWt5UHB0SitXNThXYmtI?=
 =?utf-8?B?SUhaNVVCK0NLKy85WlVSeDIyeFVCcG1tK2t3NnRPNTB3ZURPSWtxOTY5WU5R?=
 =?utf-8?B?OUhxL0owSWtmZHVHNVlNU1hWNStsSnN3S3lKbmRMc1lmVFN3aWxobGlxWG55?=
 =?utf-8?B?bXpkWE91WE9tTEZaaWZBR0F6Sm9hNTAvejhPSlI4Wk42YkJUSWJERGJtSmhW?=
 =?utf-8?B?aEYxb0gxeW1UQjVVY1plSWVoL0hmeW02S2NKQnhqc05WK1luV3grV1VITlBS?=
 =?utf-8?B?cUozdnRUZDlzZlhGSnFCejBpeW1UaHdOVjh4YjZ2K3dPbWpiVDhEaHFUeDRK?=
 =?utf-8?B?UmtJVDgzUFFvZFpUSiszMkM4dlNIYkVkSFhUVTR3a0tMaEJKbkcvRUdGN0ZJ?=
 =?utf-8?B?ZElVT1MrUS9SMDZKR2VqSXpyVG8yOWFvQW5DN0xnRmlGRXJXL3gvcGJTMUdy?=
 =?utf-8?B?Y2V0Mk9lWVE5OEJhSE1WK2ZqM3l6cndMdWZlNFpscmI4c0pROHR3dUo2Skd0?=
 =?utf-8?B?OTdqWm5SQnZ6R3BCa2FDcjZpVnUwck1EV1VuanRmSWVubmVBZVQzdFRRTDR0?=
 =?utf-8?B?N1R1N2RUK28wa0JlTDREQU1ZSEtKRlYrUWN2b1VDUTJ0UVZ6YlY0TVVCdW1k?=
 =?utf-8?B?ZUNDTkFzUlJkSzQvQ3VMTkVBSVVYazhJbHZjQXMyLzZmcGtSMnFlSzJXamFF?=
 =?utf-8?B?RjlWbkU1WFdXczg3SVZCdzE5VEVKd3Y0bnA1NmZ1amtqbUhKN2p2Z1cxdmZ1?=
 =?utf-8?B?RHZoeFBKQWw4SHBGSW02SUxYMlVCcXJrYk5JcXlFek1LaGE3SkNCaHdiU05Q?=
 =?utf-8?B?akNPV29FVC9oNGN1aHVrNS8zbDZaMHNRalBzYmpGSUpId1pWMlZ1VFEyTUkx?=
 =?utf-8?B?VVJseDZ1SFN5Z0duKzNzVnhydjZ1TEZuQUxrbnpHUUVyeU0weUFBUUtlNE83?=
 =?utf-8?B?T2hNeFpOQUZ1b2x0L0lTZEw2QXkwTXdQb3NWeTlCUU5rS2hmaFVPcGhaVkFs?=
 =?utf-8?B?Ynl4bjkxOEIyTDgyeE9ZWUxDeFlYV1NEYmpkTlpUN1hKUkloeDlkR3dVSExw?=
 =?utf-8?B?WnpjV3lQdHFlTHZSNGlTVVI4c0JrSzh2bE9ZSithZER5aVMvdENVc2FtQmtM?=
 =?utf-8?B?RHBOL0JyYkNpcXZDZVZPVzRkQkttbVQ5ZHVyRGJ5eDAxNG9Vb0Z4LzZ5OTQ3?=
 =?utf-8?B?OWJ5SjhaM1k4aFIzdnpkUUYrWG1wNDZ6WUxWeTVVRWRzVDNmRUVMU1l3NkZi?=
 =?utf-8?B?TEZ6WWdENXR4aE5BVXlnb0pKVklOdWhmZklwVUZqTVRVL1Y3cUVaMHpxb0Nw?=
 =?utf-8?B?QzZwbGRxMkZnNDFvQzZSY3BnZWpremxlTlNMZFMvNUNaVXFXeXJKODcxeHZQ?=
 =?utf-8?B?aEZlZFhOUmFxM3JvVCtTbWpiVlFTZ3NpZGpWamNKanJhZm1QL2xMWkU0azAw?=
 =?utf-8?B?NHVLRmljcEFGYXJMcm45RkFrcmhVLzhhd3JLZkZhV25tV01XNGJVeFAzS3dN?=
 =?utf-8?B?WGMrVUhRMUwzaEtjM1d3eXg5bzFYRnAyTFFVTFJsTlhYK09CdEtVTElUK1Mz?=
 =?utf-8?B?bUswR2o3NnhTUWV5YnNLS1Y0Rk9CVU5pdmU3K1pNSVBFYktJdnFCSEZGQWY1?=
 =?utf-8?B?eGNCck9hVHRTSWlNc3dkWmUvVUgvY3k5Yjk4ZmdZUzhLUjBaSnovSWkyeHVN?=
 =?utf-8?B?NXZ6SWc0NUs0d1NyWTBjYkx1emRQa0hpYXlNUUMzVUlMakU1NGI1a3g1Z2Y2?=
 =?utf-8?B?aGgrZy9aUkFNMXdETm45Vi84dnQzSFc0cGNoQnJ5dVIxc0pkd2NuQjVWc214?=
 =?utf-8?B?ZGZRMi9OTzdPd1FxanA0MmpYOVdtUElDa3k2dFQ4YTRZSWhmM3JBMEFNekxy?=
 =?utf-8?B?QUQvQWJEUEZMZTZtNXBka2pwS0M3eEhtRUlpOEgvSEpBZlRLVWNhSnlsZkts?=
 =?utf-8?B?OVNvdUpJOVM3Q240UjdqTUZCSm8xYjE1Yjk5TitRVVVjS1M2VlBhaHVFOVlE?=
 =?utf-8?B?RmhpU3NTdkZKTmdCakZoMlhzWDhCMkEzU3IwTVVCcEZqR2NxZ3JnVFNPbm0z?=
 =?utf-8?B?c05LZTRBUVRUNnlMdzBEVEtYZ1JPa29HWXZFZnU0Zlp6WVdNckpPREdRNlQ3?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8cd53f-82c3-46cb-5c0d-08dc7ee988ad
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 07:41:06.6260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ab3x/BtU3XIe2gVE8yKxIxdBugIPWTRUjnakxB2tvYSo8NmIxlQuMuqwX6BqeVFSfaPjFym9o+QrJExEKAAMspnLp+kwpZ878u/NKIQKg/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
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

Bug filing team,

Below issue is a false positive, please re-report.

On 28-05-2024 11:54 am, Patchwork wrote:
> *Patch Details*
> *Series:*	Enable fbdev tests on XE
> *URL:*	https://patchwork.freedesktop.org/series/134106/ 
> <https://patchwork.freedesktop.org/series/134106/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_14828 -> IGTPW_11200
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11200 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11200, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/index.html
> 
> 
>     Participating hosts (37 -> 40)
> 
> Additional (5): bat-kbl-2 fi-kbl-8809g fi-elk-e7500 bat-jsl-3 bat-arls-3
> Missing (2): fi-glk-j4005 fi-bsw-n3050
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_11200:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@uncore:
>       o bat-atsm-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14828/bat-atsm-1/igt@i915_selftest@live@uncore.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-atsm-1/igt@i915_selftest@live@uncore.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11200 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>   *
> 
>     igt@fbdev@info:
> 
>       o bat-kbl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-kbl-2/igt@fbdev@info.html> (i915#1849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@gem_lmem_swapping@basic.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o bat-kbl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html> +39 other tests skip
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html> +30 other tests skip
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9886 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html>
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
> 
>       o fi-elk-e7500: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html> +24 other tests skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@runner@aborted:
> 
>       o bat-arls-3: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11200/bat-arls-3/igt@runner@aborted.html> (i915#11189 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11189>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7871 -> IGTPW_11200
> 
> CI-20190529: 20190529
> CI_DRM_14828: abaeae202dfb4e361edd660a124e22178340725d @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11200: 11200
> IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E0BC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 07:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0554F10F454;
	Thu,  9 Jul 2026 07:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VapKJc9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E05B10E02D
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783583007; x=1815119007;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XClE25D5JVjPtSrqMsi4MHyX1buhx7zMgYWK5ji5FUM=;
 b=VapKJc9Vf6q+kLibvkk9pgEbNX4VmgdzuLr/yZV62udNOFgnI2eOK0d4
 HacrLLa5lS6sQfsNsWjKjs/CmYm3SmNjt1wQUsLmk/TZtv7xnh6YYZWVW
 Zi62xOJxP16EIS1OHkHrVDHI911NyrMbNr6lZUzJn5j9WSDfdvCSbpT4a
 6bWGdIoYWRZl0DQ4jmili7T2NiIn6BtXFNwzQqcnzDGm37i9J9hKarTJ2
 fh67wGZatMGl3FU73jpYUOxlBM4yZJBCkqvt/AALXoQAMaitPQP1w51Rm
 9pJET7VcAO6Bq0iAdZyNk/IDsq7Sm/lRJ13Jadn7wHsNidbOixWC2T699 g==;
X-CSE-ConnectionGUID: oNzlVVTQSNqLVrJoCaGU+g==
X-CSE-MsgGUID: GHTZ65DLTtW1wP+UF7uQyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84448892"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84448892"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:43:26 -0700
X-CSE-ConnectionGUID: X6baAHp3Rx2Vv0FuL/LL/Q==
X-CSE-MsgGUID: qITWVxY8QXiBV+j0kf+0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="256433692"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:43:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 00:43:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 00:43:25 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 00:43:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQyqxsCb1bJvuOxuCnDQJbTeyWCi9E6CyCd23oTLoefn7t/Y7t0EPSTd9TpbSIvuq/vaqmwJuO0kcPWq9jXoQIInMP80K1K1V64mUbXWbsNiTFoebQTwhB/ZvxvJQVLWftmuxJ+hdMz3ijB9ff5RBgT8dV6B0hUku4+cdZwarS2hWTKe3pV7J2PmOVVml1TEP/+ZEBW1Wq7d00kTDsR2+rsHKyebUVweLyvLazx/hrN7KA1Sj2WQC78YWz2gOKrA43G5N5B6A0i1pCmPA48f9TlER3RpAEGnpRJCPoWfQt6n5Wej9RV8WAH9SQbaGiOEDAqlk8t71/kwj3mYS6c1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xdrm3sEIIBX7NeVvtaSGaWZsxod50r+jf28atzFo/HY=;
 b=MXvi/Y/BpUNNJTANqP+BhoaiPqUEiRUZ1AH64XO+8oQCc6J2oHul77oDNnQuVNqHm07Y9t2wi1+t0l//fULAofl9wS8HXNnqjSnCyaNvN9SWuF5Cl03aWlmsTySyvwsaWEF+Dm9Wm4Hel3gZfKish3plTK78OT3gYLa/XRsvLN665xcwmFOyGNDn0LvzlwrtkVkNSWO/z+WIY0MjPbF+3nbrNH1FMqRGTTBDouhqFoPZ+HR83DUO320JJ3ZZlvS/NHVDxUawak6+/zTD4lto8rXo2n3qnIx4at9rIhcvbACAxFWEEbNV349IKtw934Obj22ej9JeiOdOF9mjX+86gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 07:43:21 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 07:43:21 +0000
Message-ID: <4b87768f-c198-448b-b456-7eb6c540e4f7@intel.com>
Date: Thu, 9 Jul 2026 13:13:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel-ci/chamelium-only.testlist: Add
 chamelium tests
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260709055349.66437-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260709055349.66437-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|CH3PR11MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4ee139-1e29-4d7d-5be8-08dedd8dbfd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: SXStsQbuP4dOAA85raVr03AoOe4zlnqZJChTQ4Bvfbk8iRHu0AeRSFZ1RO7Btc3NnP0ytX6awfXF7ATdAAmUSNaJt9G8ENEd813yHK4kHdm8mE6p1jTVhGtzokpDQOwhmJYq2mdLp1ofQDLg3i32KqV7hnWVaBt3wTexqlDltusnLUPloUL95jU7/hVN9aE1FtNnA6aBr2cAMWgHC2B3hzoYPUJCEkIxuKfFZo1AjAY8dsB3mDlMcGvmxA81hDwZ0t8EBlAbaC9xR0uQyxypAZblBT1xX92wJOtCbIGYM2V55Tl+H1PdPKwNGiOt8e5Q9q0wmovqh2tdOXtaUedALYFgzAJAMZph+9I5j4un5qikAPyT0f/MrMSLqFaZraQRhLR4pNc448AMMHzmj9YFBd8m+J+Shghpqd6u1U4nyFAe55fZzhDrqQe5q505mMzp1VN/nWvPiE+2jK4rGAUfbzC2hxXGMlHQugmQuAfayD4i3LEjXILF6sYYNagN8M/hTHoNqkTqVijtVuFU86VE8UilPddzZpQDskzkQ6z4tpUdjDS6VrJOGHyczNknHg/xDa/9/2N1ey8hsC4jc/trgKRDHnPMdMXP3dRtE8HlPFEVCu70xLomNFFbMSMQihVqD2SDcARuIroq84gNIwh89lpQ6MbG/wB3ayAcfjV4q4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjA0b0k1Y3ZQYlg3bW9lQkNSclNZSGNxdVdPNjR2dFN1WWljZVZRek9kdTU0?=
 =?utf-8?B?V3lueGxDOU56RFpxREFnNTBzQ25UMHlDWEc3QmNIMmJKSXpPYW1DajF3OEhH?=
 =?utf-8?B?eGNvaEQ4cEo2NFAwVmErT1FNNFoyc0pVMzMyVEhhQm1qS3NFMm0wVFhzV2J0?=
 =?utf-8?B?ZG9zZUZrTkZlZEcyR01FSm0rOVh2NVk3eWUwVWJLZ2xId2VHZGRhTTN3dy9X?=
 =?utf-8?B?R3FBdWlFUk9iQjczektvNkk0b2Flc0xJYXRpb00zR2ZjT1dVbSt3Z1FmV3g4?=
 =?utf-8?B?S0dlVjJ2UTF6RVowLyswZGRhOHBXZE5EdVJJdm95aHkrR2l3Zk9aVXgrQ3d3?=
 =?utf-8?B?UERaS3I4OXpZR2ExR09WNVhoSlZGR0VYZGQzektWNFFlM3c4MXFoNEtqZlh3?=
 =?utf-8?B?SHJXRXJNQTFDZ25TcDRvd01DdU5DNkxiZDk4bkJHMW1xOTh4ZVV4NTFoUEt5?=
 =?utf-8?B?OGNra2lqbUkrekZ6cmxFQ2tlMDUxK1BRNGZHejdnSDhONXF5SnpWekhnMWRi?=
 =?utf-8?B?VVBDQXB2S2V2WWNCS3cyZzExNzZBcDlGc0xZaWFHRXd5L0t6TGIwNlcyVWRO?=
 =?utf-8?B?TWRyQzRSL2JnbnJkNFlKc1o2OTFQRVRUM25jRUcxYm9jUHdydTJHeHBPUDNF?=
 =?utf-8?B?QkFRZEZXQ3dRRGZ5QzlLaXY2MzMrVWE5Nm9BTUNrUHhPSU1EbFZmUE5qeTI5?=
 =?utf-8?B?dDVwS29kczV2QkMya0pFUjB5QkRMWkF6QjdMc2g3R3hQTDJ3VElrcWt3N1Qv?=
 =?utf-8?B?QTlRL1JGMG9mbW9mM2dFaUthRkh3U1h1RGdwZlRFWTRQcmh6dWJBQUpJa25D?=
 =?utf-8?B?bzViYjB5cTN5ZHhrTkd1cEMzZU5MWlcyc0hXTFduYW5qWkY4MXRGbldIem5D?=
 =?utf-8?B?aEdCM2pIMzZHdkd2SE00V0tia09VUENEZkpXMldxRWtxbHdpV0wvdXhJT0Rr?=
 =?utf-8?B?dHFqSUhFalFuRURiNmxtaHdYQ29PM1A5RFN3UnBUSy9WYVMrS0JxaHFXWHky?=
 =?utf-8?B?UHJpNVdoeUNMSktCdUhCcUw5d1k3cUc1ODE3cmEyTjlvM1VqeEQxMTNkZmFx?=
 =?utf-8?B?T1cxcndKMFVvMmpQeUUzYVJZaXZqTzR0NlhqS1FSd3Jpc1Q5enVPRTcraEhQ?=
 =?utf-8?B?SDkzOHIraG42UG85TkNFSDl6Y1gwVXJ6WllFRm0vSUg1a3YyeUFjRTN5dmNQ?=
 =?utf-8?B?SDRkdEtkVUpqdmJVU3FzZmpCV1lKbzVXL1RaQzUyOC84b2o3SVN2Mmkva3pl?=
 =?utf-8?B?WnR2QVRYZ1RJeTlubTdEb0dFd216Z3RDWkJ4dE5wYjFlRWtXRkVIUkVZS296?=
 =?utf-8?B?K1RGNjlmMDhEemNWaGtVV1lZckdzdU9mZVp6djBHUElZODdDaE1IT0RjSWdv?=
 =?utf-8?B?VC9RZU91cVJ0SW95ODRHT2xRbzIrTCsxZ1JtRDdTcWdVN296OU1VdDBlMHlX?=
 =?utf-8?B?a3pMMHUzUWxFdU1BZDJYWXNQelEyNzRpZVBQRSsyNXBIUzY1UE5PTFE2Ty92?=
 =?utf-8?B?UER4WndwdHorempUVXBZM25hQk9xT1FKdnh4Nmw1eTJmM0Q0RThXeGN4NzBR?=
 =?utf-8?B?N3A5dm1yaWcrc1VkZk1MbEpxZ0FoZnphTTEwcEQ1UkU0azg2NzVHSjZlalVB?=
 =?utf-8?B?ZjJoQ21uMkdUVEo5ZzNkbXVEU1oyQkNBNEhHKzBxQm1RZm5qWjlhV1pzdkdN?=
 =?utf-8?B?SUVId3BWY05vdDdVRjYxVW1mMzdGVzZIZVVIbXBWV2p5dGw0SVMrWjhCZEV1?=
 =?utf-8?B?Vklic0hjckczNVJTTnlhMitrOEVCcTBCb2VKM29LcEhaL2NNMFptZVpuVXU1?=
 =?utf-8?B?a0dWVWZpZm11ai8zUUpaSHk4QUFnL054Wmh0SGNTcHc1WjVZTmVOUHoyZ0M3?=
 =?utf-8?B?K1E2ckhZb3E4c2hDRkJnTDVrOFZEdngrQzRaMDVjY1RuVWtvaGJaT2tFMEVB?=
 =?utf-8?B?V1A0YVVJLzJVVElxMDQ1MEtRZ2EzV0x3LzlGbXIyQ3g5VkRMbktWSHNQeVJw?=
 =?utf-8?B?NXlJblZjU1VVTDhNczRtNm5vYlRFREpNSEdGRVQ1U3FhTkorN3d4UUI2UFl1?=
 =?utf-8?B?RG1RVVgyRjlwdVpoa3B3cXUzZkZkVGQ2bWx3ZGlTVG53OUJhNDRjRGhDdXBU?=
 =?utf-8?B?QkI2RWdVNHlCMncvWEc1WGtqclQvVWd3UXpCMGZaZFNhVjYvWXVvZU80eWxt?=
 =?utf-8?B?bXBsNndoMUZZMWxUb2FEWGxhSmVDZHZEckVwcVdUTWZ1eUZZMkRCUmZpaG1v?=
 =?utf-8?B?NEpuQ1ZQaGpoZ29VdVVyVWwrVFVaNVR3ajFEYnVnc2pSUWROTXZLOHNISTNX?=
 =?utf-8?B?cGoyaFI2Sk1uWTBJTzZWMDdvejRNL3dOV3c4Uk5saTFIZFhXT1Y5Zz09?=
X-Exchange-RoutingPolicyChecked: EPKF+OhYcTJz51zQk0gbNDHcwiAZhM3meBG/4zD/TkE9nBvd3sEvLX22n5+WL+qxqZnxPmWh9vFaEkgtmeC6NjvU6fM7aqFFXINtm/506ENjSbkeG0hYkYtzwQIP4XUBPya7wWSXb3pUZXcyYIEuUA6+c7AZ6BM6siB8RF/hOxq9eqb9xwfTIx6KxYwrC9prGg4vNuirl9n5/jjeLnzzAY27MXOVfgNaZpbbFlY2I4bnTsHp69kfV84D9d8VLLiPQUYinz5cFY5HrZq6zqqBLRPHkKvNj9PylZOTsPi9gdZi2fEQ+dcnVAby1OsxjF0fZ5ulFcNfNLQD+8uIKEdqFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4ee139-1e29-4d7d-5be8-08dedd8dbfd6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 07:43:21.6333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNy/utY8uK1CNwdQkh9K8j2oRYSYakwu7oR8LubWfAhIKQNBddXEOkm4T2aXjIwzFq2tMIcSgWX6IpY0owUNbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
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

Hi Pranay

Subject could be like Add audio/color chamelium tests

and prefix should be intel-ci

That's it.

intel-ci: Add audio/color chamelium tests

With this fixed,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 09-07-2026 11:23 am, Pranay Samala wrote:
> Extend chamelium-only testlist with audio-after-suspend tests for
> DP/HDMI and kms_chamelium_color_pipeline tests.
>
> v2:
> - Update commit message (Kathik)
>
> v3:
> - Update the subject (Kamil)
> - Split the pacthes (Kamil)
> - Move suspend tests at the end (Swati)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index d627ad414..898c53134 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -14,6 +14,15 @@ igt@kms_chamelium_color@ctm-negative
>   igt@kms_chamelium_color@ctm-red-to-blue
>   igt@kms_chamelium_color@degamma
>   igt@kms_chamelium_color@gamma
> +igt@kms_chamelium_color_pipeline@plane-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
>   igt@kms_chamelium_edid@dp-edid-read
>   igt@kms_chamelium_edid@dp-edid-resolution-list
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> @@ -71,6 +80,8 @@ igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
>   # Suspend operations can cause system hangs or connection timeouts,
>   # so isolating them at the tail ensures stability of main test
>   # execution.
> +igt@kms_chamelium_audio@dp-audio-after-suspend
> +igt@kms_chamelium_audio@hdmi-audio-after-suspend
>   igt@kms_chamelium_edid@dp-edid-change-during-suspend
>   igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>   igt@kms_chamelium_hpd@common-hpd-after-suspend

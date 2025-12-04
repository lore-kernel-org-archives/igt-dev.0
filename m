Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0B8D29FB2
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 19:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A9B10E0BA;
	Thu,  4 Dec 2025 19:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HSFipcIx";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010032.outbound.protection.outlook.com [52.101.46.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7986410E0BA
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 19:35:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqszYr6UVEpGjVCvA194xFj/4k57Br8uE5on48o26ueykPS+SEPX1qCJ9k6KmqufH8Uoa4ykXEGF8qI6fRqQYhqzwUEnmgD1ZEKHQkYBH7IT7Ad5OtwfAhS4dpoRzZ0mQIKdTDrUmVvPxNSuGAJTUjpgaJgAV0d6Ecbp8RB5MDpKfsjTyGL53x9ikXba4mkM6FTgGrp6ftuyoYDIffWr5CNOqJz0DooEYF8ee2YP09WwNHbKPM2nQLVsNXIXpnyPqdKsFZsF2I8I1r+32lgVYQeATodkBFlOwRVcSzkIEQNOzK5RHDj2mBVgaghAd3TheBk3h/mTOaVWJVxNv3JVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exNQGuqKgRRDuJqYZHBSi/rALn25ToV29ykZQ5w2F04=;
 b=oO6B1IqqIK7K2YvDmEitsQQaw2sTnuoy0kzVC3xtWf4FZvpeZDtoBTM+5RjkITJECH/0TFN1areSRG+hK0qVfcGwlHkNQRozJSMDLfrnT8/swIx116afY7n4CAplI38WO95fc+Mc/sbMioNaNrGI7sU7cp5oTbDXFl47Umn7/FiWX0rjfn0eehlgAgtbEzxOi7ht/ZSCmb93nBoCY3y36I8c22soD/Ca+CJ8xY3NxJHB0nXjlJdaLkB7Sy37wHCDW35greURzKEs9vu5osn9INgowMzgLPdXJz8LKs1hIGNcOgSMMbmMfGRB2o60TF/HQnDuInfhAv8ypqJZP/KiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exNQGuqKgRRDuJqYZHBSi/rALn25ToV29ykZQ5w2F04=;
 b=HSFipcIx0vDMK+vSFdO409fbJ4BfY6Lsc6hF2RAXT1K+aFh2RVrmAANFyqvyLbVLVKf2O1FG/XtDb+O9bnTWUc8sFrHNQacPwWuLBy8KpAV9FYh6IN2xQHrV4SymvQfztfl3hwEPHEp4VNesQtGAAXbTSU2Jmz8M7Qd4cwlb+vE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 19:35:16 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 19:35:16 +0000
Message-ID: <4f023956-121f-415b-b0b5-53f11e65b783@amd.com>
Date: Thu, 4 Dec 2025 14:35:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu: fix build without amdgpu_device_get_fd
From: vitaly prosyak <vprosyak@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
References: <20251204181442.45975-1-vitaly.prosyak@amd.com>
 <20251204192316.kmd4yp3sh2qwitlq@kamilkon-DESK.igk.intel.com>
 <db784603-9f0a-4395-bf77-a2b6e4a3e984@amd.com>
Content-Language: en-US
In-Reply-To: <db784603-9f0a-4395-bf77-a2b6e4a3e984@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQ1P288CA0010.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a57bd8b-c8f6-4e1f-57b0-08de336c4091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFpjUjNQeDZUeDdZZVVYZ2xwbHBVcnZUVStHL3g2cms4THVZcmxUeXpTSHZU?=
 =?utf-8?B?bXhwbXczSXp2a1RFaVVqeWJVL2NIenpjQzFIZ21UQTd5dkNJNG5DVEJOSDRH?=
 =?utf-8?B?UWdXMk1kM1ZGSjUrbGtEZW0zMmpZNThGM2JmNFBVTFpHbWowT0FHVWpTVlVj?=
 =?utf-8?B?b0dLTmpxT3hGdGcrYnRzY24zaU8xRDBEK1hNdEo3NmVWYmRSbUhYc0lCbFRQ?=
 =?utf-8?B?K3dpaFhYQ2FCbjF0UU5vcVZBbTZDbW9PbHdiUjYvZGkrM1JDMFNZcndEaWZo?=
 =?utf-8?B?S000eGxMSEp5NDcwL3UxM1VoMVFIem5rNE1FVHB0RUFmREZwOVAwUk5ycTFs?=
 =?utf-8?B?SHR1MVdlSUUwd2o5NUg5M2plQlNsMnpPL1h1VG5HMFlUa1FGNFQvdHFkeFVZ?=
 =?utf-8?B?OHdzaGxvL1c3bENKcHZOcE9UMDA3dTU0MG1PY09PMHdlMlFYWTc3eEVSc0Jm?=
 =?utf-8?B?UGg2RDI1ZXVJclI5T2lNOTEvMXZpT3ZQVDZzOUJmZFcxTkRBZHYyTjZid2h3?=
 =?utf-8?B?S2ROUVgzR3JqdkNqVFZKT29BQzRKK2NMUUw1OXR2R0tZL3B2S2sra0luVm43?=
 =?utf-8?B?ZDRXa0xsMGhGdkQ1ZCtXdzMyOE9vbnNrNXl2aFU2VVNkWnNhalg5K0Y2SUp1?=
 =?utf-8?B?UEIrKzk4WDJQWkhYdnEvVXpyb0F3dDFPNlhnUENvcEtIbjdTZlBnNmJKZG14?=
 =?utf-8?B?U0tVTC9vUDJlNjBsZWFhblV1MGdqTmZwa00vMWJrVHVSUGNmOHVBMWZwb3Zw?=
 =?utf-8?B?N2FITWJnaDcrbDVxc1h1NGpJWnFaYmozMkhXRFRpTTBuL0ZYNlRVWmIrSzFG?=
 =?utf-8?B?NjNZQlY5VmZKVDZOZTBPTHNxWERiS3ZKeitNdDllUjFCWllOc3YvL1RsZXl5?=
 =?utf-8?B?ZmtqeVhzMTR4dGRNWkJ0Rkp0clhOY0ZMVEpxMmNrOHQ1R2NRT29CZVh4OXZW?=
 =?utf-8?B?Qm00Q0VhdUJTb1lvMUN3SEkzV0pWeXR2VFFnU3NJeG5NVE9EYUEvaXhFb0h2?=
 =?utf-8?B?YmxUMUFRUkg5dVVqY0QxSTJ1U0UrZU9Cd0lkcmUvZFBGalpjSXJ3em9sMWdW?=
 =?utf-8?B?SFVzNGl3STI1Sk1ETllzL1ZJY05LVmdPSUtBdFcraWZUeGpwVUh1dm9HY0V2?=
 =?utf-8?B?NkxqK1JsYnJxV25nWC9ndFYxeG16NjFpaWlaeEJMMlRLVVRKUmY2SGI2K1p4?=
 =?utf-8?B?QWt5dUtCcTUyeWhpQlpHMHlnVUc5aTlkRmFEblBLSHY4Y3NwR1ZjblZhUVdn?=
 =?utf-8?B?dTEzSGxSN0lWekVHUU5Cc3daKzlyRHE5VU8wUTdUNlRzVzdOVmpNM3dPSHU3?=
 =?utf-8?B?Q0F5M1pqYzEvZ1R5NzB3UWFaV2tYc3pjMTBoZ05SQThmSmFGU3BadzVZMjlT?=
 =?utf-8?B?c2g3bURKRFRtQ3B6NVhxS1ZLNEo0SVhiWjlKbm1icGVIdGdUb0pHT1l2OUVs?=
 =?utf-8?B?ZFRuOG5wK2Uxc0d0cHZlOElZdnJqem5hYTlyRExjWDhPRGJRaWtvbWRGZFNE?=
 =?utf-8?B?ZjJRYzJIVFJvSm5PTmdnSHhKSmsxbDJmUnBybWNpNnBmYWRXZzJHUmRVY0FS?=
 =?utf-8?B?VG55K3RheGhDaUFnUStRTGpSdFBOYy9RaWpQVmJYdmZsNW1YVmUrK20xTHFv?=
 =?utf-8?B?eEdmUGpkUHJsNkxyTGNtcGpkbmVubnR3aGQzWnE0NVAwd1JvdlRwbU1qVjdT?=
 =?utf-8?B?SVhJdk4xVmJkRjlzUGxxK0JNa1U0ZVBaaDIycUZxZndLZEdPTUQzdy9xeGxQ?=
 =?utf-8?B?UnA2Mk81ZnoyTlJhTDk4bTB4WXYxbEZ2MER5RFc4YXFQOWRGQVgzUFc5MEpM?=
 =?utf-8?B?V3BkellUamdIUmIrV3pha3JrUVRNQ014eGViNWdFRHIvTG8ydVAreTc5K0lp?=
 =?utf-8?B?bnpETHFmdm5CcW1RcjBlM3E4MVJrRXI5d3NrRWV0K0xFMnNLMDVUUXhDUi9n?=
 =?utf-8?Q?SUpG9++4z/2TLUGIDLAbbQdkYpojvytG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0oxTHB4TzlpZjBmeW9wUkFqV2tOTE1JZVRsZVZQYUl0NjRmYlR6aWJRM3lw?=
 =?utf-8?B?c0RBOE16Sm5qSVU1Q24wbWlrdGFaQXlwVVBMSmMrV0pGM2NvSys5Q0JZdEVY?=
 =?utf-8?B?UnNtVEJ6WGtnWEVZUno1UUJSbWNVOEpZd2NiVk5zdDdWOUlqYk03amxYb25G?=
 =?utf-8?B?bXhReFZlNnJubDAvZVpxNUtjaUN5U3JpUFZBNFlJTitMZmlJSWN6Y3NDa2w5?=
 =?utf-8?B?amJ0dFRvMUZobVpnaGRQSDNvQVZTN1lBRGI2TmtpcXZQV2FqdXJIQ2pRVzBK?=
 =?utf-8?B?bFZGL2ZWRG9WQVBZd2pkMEdEVFVaMGdzejFGc1Zmd3A3ODBYMHE5MUtVaVBI?=
 =?utf-8?B?dytlRjQyMWZWSFNGV2RQT1dhUW5xN3FFY1hvdytQRnUweXJSTVU5Ui9VRnBP?=
 =?utf-8?B?SldFRE52SmEvb2JPbXR5WWszaFZmQnFwNFRmeHB2YkNaTWVmWmNNd1N5NHN4?=
 =?utf-8?B?cjdleDJod2JGMUdObnJseXVYS3lsajhlL2szMEk3Nmd4clcvSTF3eWQ0ZEYx?=
 =?utf-8?B?bkJqeWVZbU5lcnpXYXZYNlJCWElEY0lKSmZIV3JtckdlVnM3Z0hHRTUrUUVY?=
 =?utf-8?B?OHFQeXRPNXVRL202ekFOa09LMzkybWplcDNsb0FuSGk4TUFPbTZ4VVBmZDNI?=
 =?utf-8?B?NWo1L1Q4K0p1YTJyVllqS1VDU3FwYm81QnJjbDYxMEQ0dlRUVWZxZklhc01D?=
 =?utf-8?B?Ung1UjVveE1VbU5PYW5ORjRKOTZlWWN2Wno5MzNvR1IzVDAzV2hFN3ZYUHNZ?=
 =?utf-8?B?YzJhOFFFL3VMdW1Md1dJS1RQWVdGVFBKT2hWNkdYa0dvRVBzcit6R0FjZGtP?=
 =?utf-8?B?aVBvcm1MQXRzMmlhVXltWGw2WnJId1NjRlEzdnllVk5xeXVTM1BBZm9zTUw5?=
 =?utf-8?B?bEQvNHMwazIvUm41cjR1cmlZQW9ZbW1zdFR6YVQ0UFRGNm1LUTRHYWd5WWE0?=
 =?utf-8?B?N25tRXUyMHFyRXE3K1hBM1A4NkhYZEtYOGdDb2VxTWlLWmx3L21WcVBSOGFO?=
 =?utf-8?B?YzlEcnhJNTM3N014anZkL0FiRTMyNFZmanRPOUJWaXRNRGcvbWo5aHRjVFhV?=
 =?utf-8?B?amlwcFoxWkY2VnRvWitZenhHOStTOWdwR3RHNFRJVU5pMTBJQ1RoRTJMUDdX?=
 =?utf-8?B?OHVoM2lubXdYR0pHSFFqcjBMbXB0S0xTdFY1S0N1c2ErcUtyRDZkSjBHSDls?=
 =?utf-8?B?R0VXbVZlZnN5Y1lNNHZ1ajhrUEVldmphWUY2RWE0QW9ud0NoNWhibFhJZ1Nw?=
 =?utf-8?B?UzhmclZZdWdnU1BMOEh3WWJQai9vTkxWa2h2d1NveHF3ZzZQNUZXS25pTjBp?=
 =?utf-8?B?SFdLWHpsVzF0bmJ0UURrSlVOZXJGelVZL3VxbnJhS1ZwdEJLa2NteUIvZVVF?=
 =?utf-8?B?Q1ZGTmlteUxBQ212VGE0cTBGUDhWTThYMlk5ZEZIYVEyRSszdUtOdXVhVm93?=
 =?utf-8?B?RndnUWhnR2NIN0YxVEJ2TlU2QmM3YlB6WWswallqTFBXWjZzdzdvSUM1c3VH?=
 =?utf-8?B?a0Z2eHJYK3ROdDBnZ2R2ZldndDd6c294S1Zyd2pRYTg0RVQ0emswMVpwZGxx?=
 =?utf-8?B?VFV0R3owMlc4MEQ0N0daY1FueDl0NWY0L3ByZXY0eVpYbFNkMFoyc2UySGk5?=
 =?utf-8?B?YUVsWDRhcUNjdDNDUjVuOVkveWUvbUUxRFltcVNlR0ZrMWVXTENBbTRoQkZn?=
 =?utf-8?B?eWMzZlBGcHFHY0plbDRQanpHeUpoTERMNTVJRUV5SHRrUkthOWxpcHNyUXBI?=
 =?utf-8?B?dEpJR0JSY1kxdzZjTHVwLzV0MHpSeTNRQjUzL2JIMVJWczQvSWRUZ0RsMDd2?=
 =?utf-8?B?WEJSQzkwOXJudjFlVGx1QkR0K3hydm9JRnorMXd3cEY1NmhwdTNBRjFpaWJa?=
 =?utf-8?B?VVRwUGZOQXg3b3Z2T3lmdWdzS3JXdmFUdEZjTlhabXFseko2aitTdy9SU3Iy?=
 =?utf-8?B?YVJGaWhSMUg0RFNYYkl4MkxZbGNsaWE4c3pUcFJSN2YzK1dwdXVvOUF1OGJV?=
 =?utf-8?B?Z052Yk5BZGZBWnl1eFZOUWZFeFZPZmJKdkZ4V2dndklidUIvWDFMTWdrRTVK?=
 =?utf-8?B?VTB2eEhBUklwT1dIZzhYVVMwUnFJSEdZdC9FUkxOSFZYNlhKUmhkdHhHamFC?=
 =?utf-8?Q?7mhmCR3jAU9+QzjFsGEDuCnZd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a57bd8b-c8f6-4e1f-57b0-08de336c4091
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 19:35:16.7475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OZuWWAlew1GBleASv25f1UHI4aitWfICpbTPRjDfjVgIqXeR4VPwOvcN7uJeOCBNih4aNuK3KEUUjL1C9fDHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614
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

Thanks, Kamil, for taking care of merging the build fix — much appreciated!


On 2025-12-04 14:30, vitaly prosyak wrote:
> Thanks Kamil for fast response! I am going to merge now.
>
> On 2025-12-04 14:23, Kamil Konieczny wrote:
>> Hi vitaly.prosyak,
>> On 2025-12-04 at 13:14:16 -0500, vitaly.prosyak@amd.com wrote:
>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>
>>> Building IGT against older libdrm_amdgpu versions fails with:
>>>
>>>   amd_ip_blocks.c: error: implicit declaration of function
>>>   ‘amdgpu_device_get_fd’ [-Werror=implicit-function-declaration]
>>>
>>> because amdgpu_device_get_fd() is not declared in <amdgpu.h> on those
>>> stacks, and we compile with -Werror=implicit-function-declaration.
>>>
>>> The tests already have access to the DRM file descriptor when opening
>>> the device, so instead of calling amdgpu_device_get_fd() from
>>> get_dri_index_from_device(), pass the fd down from the caller.
>>>
>>> This avoids the dependency on newer libdrm_amdgpu while preserving the
>>> existing behaviour for resolving the DRI index.
>>>
>>> Changes:
>>>  - change get_dri_index_from_device() to take (amdgpu_device_handle, int fd)
>>>  - update the declaration in amd_ip_blocks.h
>>>  - plumb the fd through tests/amdgpu/amd_mem.c and call
>>>    get_dri_index_from_device(device, fd)
>>>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Thank you for quick fix, this LGTM
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> Regards,
>> Kamil
>>
>>> ---
>>>  lib/amdgpu/amd_ip_blocks.c | 4 ++--
>>>  lib/amdgpu/amd_ip_blocks.h | 2 +-
>>>  tests/amdgpu/amd_mem.c     | 6 +++---
>>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
>>> index 6ce207fb2..73bdace5a 100644
>>> --- a/lib/amdgpu/amd_ip_blocks.c
>>> +++ b/lib/amdgpu/amd_ip_blocks.c
>>> @@ -1768,7 +1768,7 @@ bool is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr
>>>  	return (ret == 0 && glob_result.gl_pathc > 0);
>>>  }
>>>  
>>> -int get_dri_index_from_device(amdgpu_device_handle device)
>>> +int get_dri_index_from_device(amdgpu_device_handle device, int fd)
>>>  {
>>>  	/* For AMDGPU, the DRI index is typically available through the render node */
>>>  	/* We can use the device fd to determine the appropriate debugfs path */
>>> @@ -1778,7 +1778,7 @@ int get_dri_index_from_device(amdgpu_device_handle device)
>>>  	int dri_index = 0;
>>>  
>>>  	/* Try to read the symlink from /proc/self/fd */
>>> -	snprintf(path, sizeof(path), "/proc/self/fd/%d", amdgpu_device_get_fd(device));
>>> +	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
>>>  
>>>  	len = readlink(path, target, sizeof(target) - 1);
>>>  	if (len != -1) {
>>> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
>>> index c591d21c1..51f492da2 100644
>>> --- a/lib/amdgpu/amd_ip_blocks.h
>>> +++ b/lib/amdgpu/amd_ip_blocks.h
>>> @@ -436,7 +436,7 @@ int
>>>  find_dri_id_by_pci(const struct pci_addr *pci);
>>>  
>>>  int
>>> -get_dri_index_from_device(amdgpu_device_handle device);
>>> +get_dri_index_from_device(amdgpu_device_handle device, int fd);
>>>  /**
>>>   * is_apu - Check if the GPU is an APU (accelerated processing unit)
>>>   * @info: Pointer to amdgpu_gpu_info structure containing device info
>>> diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c
>>> index aebe22e66..39abd4f66 100644
>>> --- a/tests/amdgpu/amd_mem.c
>>> +++ b/tests/amdgpu/amd_mem.c
>>> @@ -1401,13 +1401,13 @@ cleanup:
>>>  	}
>>>  }
>>>  
>>> -static void test_gca_config_basic(amdgpu_device_handle device)
>>> +static void test_gca_config_basic(amdgpu_device_handle device, int fd)
>>>  {
>>>  	uint32_t config[MAX_CONFIG_SIZE];
>>>  	int dri_index = 0; /* Typically 0 for primary GPU */
>>>  	int bytes_read;
>>>  
>>> -	dri_index = get_dri_index_from_device(device);
>>> +	dri_index = get_dri_index_from_device(device, fd);
>>>  	/* Try to read from debugfs */
>>>  	bytes_read = read_gca_config_debugfs(dri_index, config, sizeof(config));
>>>  
>>> @@ -4223,7 +4223,7 @@ igt_main
>>>  
>>>  	igt_describe("Test basic GCA configuration reading from debugfs");
>>>  	igt_subtest("gca-config-basic")
>>> -		test_gca_config_basic(device);
>>> +		test_gca_config_basic(device, fd);
>>>  
>>>  	igt_describe("Test allocation of large GTT memory buffers");
>>>  	igt_subtest("largest-gtt-buffer") {
>>> -- 
>>> 2.51.2
>>>

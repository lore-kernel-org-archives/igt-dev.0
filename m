Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B766C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 08:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C9710E05D;
	Tue, 22 Apr 2025 08:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MjgZ8R5u";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532D810E05D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 08:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REPHR8ne+wo0NeIqIsEHnZOVW2Y6oZdAzmFlsH05vmMGtb8XHBvcqJE1R89bzcmGu0gxt25CsM9ubfXZ7HjcyGgPP94dG2IC2JuFpIXZqABdGqZMvTFzUi0lJNrEu2d6bzCcSAosEpS9sqL/PW78w2NmzOx77gqvxIqAK5XxQGXlDTcNdIzHRDjNVxh7ISwFpCFG5BTIc0qscKU1/w8X7+qb7jic/U8dCl4Cb4DUPQdjaqyIwQkvrNDNR037KZkdmVUdoW8/MZ1ErV2dOaubkkWSvhYSK5fqnddIDSBC2Ol3joEr6An06niCWVG3pwka60jhltnr2hGPikDidUhxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxhxpOgF2Imphq9oHTyViBExCuZBZbI4MnqXYiTrYC0=;
 b=ZOBORT7QA4nHMCg1DshayfmXyslJSk77p3TX/Y0ATJbzoVOdkQbgyPKyp2xl+09kLcr8/YCwD7Y9d4eQI//dkKBcG9DyoLgrZ9DlJgiSE5ihbTdWXXqzfRtbyvyZs/gixGu2aza7HoI9sk4YJ68USmnBppFnXiHxCsDz9dsel2wLNuKJubSpdG5EBjShrvVV7OpkCrKkEk98/iAdONjryDPUwY4Rs+bE/QThpnCa/IVuHNTgnOgQxDYtil3lZPFcTteNWk3Sy0SwvH875zt8QJLVYeJmZUHECVVu5lozWF/YoQa+DHuOU6ySn41f7h0Lahs8IUQ4ktwLbTc48OiNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxhxpOgF2Imphq9oHTyViBExCuZBZbI4MnqXYiTrYC0=;
 b=MjgZ8R5ukWlbV/Gqz/ux4bYv73UKExbH1Nhb57lnSf0rvheF9vlfZwkQ3mkcuf8PgTkpQWl+muRZ99o5CtLdBcw07VE8mlRuw5A+oDREmY1p9QlqDscHUYFHxcEekzxB4jLeMz5xgSiGbvz3wGGayNIXB9xgPfxPtjiPMmHAYRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6576.namprd12.prod.outlook.com (2603:10b6:930:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 08:21:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8655.025; Tue, 22 Apr 2025
 08:21:12 +0000
Message-ID: <f25bbd40-e195-46dd-b0df-d881033bd69b@amd.com>
Date: Tue, 22 Apr 2025 10:21:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] drm-uapi/amdgpu: Add queue priority and
 secure flags definitions
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, sukhatri@amd.com
References: <20250417085247.592557-1-jesse.zhang@amd.com>
 <20250417163710.rr3j4dc7fin5ikfo@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250417163710.rr3j4dc7fin5ikfo@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 912e7900-ec5b-4417-1ed5-08dd8176a445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGVGRHJHZHIrelE4MC8zYVFFRU1aRFg3MDNGRWd4WXhMN0VhMWFRek42clpI?=
 =?utf-8?B?ZDRQeDg1NVVMbmNqNE8vSU1aV0VITGdnMm1NQlBKajFLc0NDMnNsSGIyWUtK?=
 =?utf-8?B?bFhhRk4zWE9lY2NnR0piMjN3b3Avc3pScWpCMU1yRHJqeEhUVHMzNXJsY2Rr?=
 =?utf-8?B?ZmFZUTJzQi9jTGFCWGo1Y2FqRzM1M2djTGV1QVVYYitmSTZ2c1lPUHVINk5W?=
 =?utf-8?B?WEo0c0xkYjcybEJrQ1BBSzVTUzFrN3JNU1FBVHk0eXFwejdsYmhpd241MWJ2?=
 =?utf-8?B?NjFYWEhIaUo5M3hpTUZER0Fid0YyR211aGlLSjJERjhUL2NkRVd3azRpbUJw?=
 =?utf-8?B?Lzh3cW9RMWZOUWd1UkZEZ1E4Q1VXNkV4Rk1URUt0MmlsZDJVcVhFVUVXVk9C?=
 =?utf-8?B?emRoZ0g2ZGl1OG1TRGlpMEgzK25IejRNRms5SUpmbkdnQm11UGc5NjBFa2ds?=
 =?utf-8?B?ZTQvcEdXQVZrTDJBdVBOMEpEUDRTbmZwTytaSDNCdUNpbWcxNHV1ZDUyMmtG?=
 =?utf-8?B?OHIva1FlTHBFMlJmaEc2c0tGMXlEUFZrQ3o0NnZIOUYzRGxBalR5b1djMERP?=
 =?utf-8?B?UVl4RzlndTZ3aWp3WEpnZzJhbW9IZTFCZlBQUWpJNWQycXRTUi9TcnlPUkJI?=
 =?utf-8?B?d0FXSDVXQzNRSGIxMHV3WHdWaGxpYmZhSm9RSDREeVF4ZDdxVkk5Y1VEQk9J?=
 =?utf-8?B?Qm1rN1VqM29qNWJrSlNLWEdmZXRRTDM1eXdhOExEOS9JT3dpZVRXNTFTOFQ4?=
 =?utf-8?B?ekRZRmx1NGNBUGN1eWcwa21sc2U3dE45NUsrTUYyTCs0d3FjVDJOT3l4Uk9w?=
 =?utf-8?B?T0daS1BTNWUrNnY2U21UTHp3L2ExSnNUWTU3UnNZaGcxajU1TEdHakR6Vy90?=
 =?utf-8?B?STd0OUdHQWJzdUk4KzN5bkk3MnNiMnR3bTZNOXM3MmdtbElDY2RudG1yazVP?=
 =?utf-8?B?bXNzdVdWL2UxNDV3MWUzUCtuMTRWeTRkSTNvTW44aWRRQVJNZVZEelY1YUxp?=
 =?utf-8?B?ZC9NamJVdnlTc3BNeVY5L0tTQkd5VHluRmFaQktNV0QwZ2NZNkpZTWRINFEy?=
 =?utf-8?B?NE1DSW1sVWJPUnFBL3BXU3M4LzZIRlYxbkJaMy96Z0Zocnhub0RCazFBMUJU?=
 =?utf-8?B?LzB3R1Jpc0ZJdGkwM2E0QkVKN1I3TWxzNGhZTnhvNFFhS3MvQzJwdkJicUxW?=
 =?utf-8?B?eE5OdUhTRjVpOUVtNFYrWkYvVGNFMDEzRmx1VCthbEZ4VkViUjhvYjF5dWtD?=
 =?utf-8?B?anYzaVpTOVZ4NXVVZG41YmhWM3ZveU5sMG15RnI4eldJbnJOQVg2MytlaUZ0?=
 =?utf-8?B?ZEtYUGN5UkFDQ2tjT1BiRndqTXJEa3Q1NjZpVlQvSmV1NFgwZE1abE1XemxG?=
 =?utf-8?B?cTFhVGtUT0JPMytuVm8ySVJCNXBMLzNKS2J4T1lhZ3NTNkJQRGloMEJ1Y2xM?=
 =?utf-8?B?ZkJWRXNRTkVBZW52NkhFZnpGVW5hdEtudWFwem1WS3ordjh6NEVCUVRaZi9v?=
 =?utf-8?B?dWw0MTZDMTMzaEoraXNKcVJ2NGNEQnZtMkkxVjVUUWtNWE1mbkJ5K28rS1h1?=
 =?utf-8?B?Q0tJQThnaWczUHBzdEVCektkMnJKREg5ZjNVUXd5U2JhU21BNDZaa1pidVcx?=
 =?utf-8?B?aWZwVkxJNHhWRnVua3BvQnVFV1Izb0hXWmZ1YnQ5aGt4bXRLT0NVZjdndjBH?=
 =?utf-8?B?RVQ0TjIrT1dPejExRms4endqdVRXVTNJN2tJUlRWVFUwZHVHR1hzd1BnYUY1?=
 =?utf-8?B?R3JMSE9HbjJmNzlvbnE1V3RCT01rZFowTDFuNzZ6dEtsTFNmcm41eHQxQ2FN?=
 =?utf-8?B?cy8xN253OWVkTEJGanU5Z1ZZRC9mWFhOODM1NXEwL3JlMWpITHNqY2M3clVG?=
 =?utf-8?B?ZVBQeGh5eWNmdzdKem1qRVA1M0tPVjVxWkNOdGtMSW9KVzdFZWs1TnZFV1J6?=
 =?utf-8?Q?saVwJC0z1k4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzRpZVFxeVlKRDlCcXRqR2xvTDl0SDFlMWdYc3MvWmJpV3J5dzZ1WG5qREVr?=
 =?utf-8?B?ZWJuZllpQk1Tc2o2RzRsckExdmxpMmVYRDFJdVJqR1VXa01ZNnZIYWtJSjU2?=
 =?utf-8?B?ZTU0VEZNdFM3S013TjJQSnZiVmdkNUlmNExsSWV5VnV6VGJkNlc1aTEyMmNB?=
 =?utf-8?B?bXdJYm1QSUNKZXBHWUdVcDBkRVgwTTJxa1FxTmh6TlA1M1dRMmN4WVZTWXFm?=
 =?utf-8?B?MFJQdDArdlJVWjlKV2ZnYXozWU1obzVoaG5EdHlPenpVSFZyZmprd29PL2tU?=
 =?utf-8?B?RkNWL3pFZFUrcFB4NzgwME4zNStWVzZBTEFjZXlCVXJud1pnTmR3dU1WZ0tK?=
 =?utf-8?B?WEd6WjMzbzRLSnZ2ZHJXdjNOWU5OUU8veWVpS2d6NnFmNmdRbHV4cHd5YnlO?=
 =?utf-8?B?UVRXNnRKWVMxWkRVUHlqS21aZXd3d0ZTd3FPUGxseU5oeTRWVHpqNVpNVWl6?=
 =?utf-8?B?eXhNZ2d1MDU5eUlzTVZyVitONHZkV2xEQkt6RHB5bFc4dW9iUUJ1QVdFcGVJ?=
 =?utf-8?B?YVhQekl0NDlrUW5IRHcxeXVuVXgvN2NncC9XeXRxdmhNRiszcy8zZWRYeFBh?=
 =?utf-8?B?ZmZ3cGsvL2xMVEx5WmFsVnpnd0d5bWtFYTlzUHpsTkd4c0NPYWRwS0REdXRM?=
 =?utf-8?B?OTdZQ0xhNUtmSFo3UENwZkg5Y25YdG5sZVVEMjJjbWRvQTdaTGZ5WEpBYk1a?=
 =?utf-8?B?TzFoRmJ1NVBMcHdTT3I2OTl2L0NuRzA0eGp6c0cvL2ZyOEtTdUlvMDhLSTlw?=
 =?utf-8?B?MXpkakg3cm83Z1VxWnBzQ0Rkd2hndkRkMkU4NGt0Zk5GRTR3WWxIeGhacTh4?=
 =?utf-8?B?eVRqTHZyMmMrbk00YUlLMk5hRktONmgxU21QSmxsZ0I1THBnZjVlWVlNekhy?=
 =?utf-8?B?ZVc4SkljZDk2N05JbDVSR2RjU1FWQjkzVWVUdno3LyswWE9Bc29FdGt5SGtS?=
 =?utf-8?B?WW9xbE5HYXpOV2tCZ2NUUXFvSzZWRHhSLzhrbFZMTTN1OTJhQVFtOWFTdENB?=
 =?utf-8?B?V2I1SUZnS2ljM0pYRThMNW1ldkxBZFNpaEZRd0toMnhsdjVPTTNXZ25McVp1?=
 =?utf-8?B?bWJTSlhSemZJcU1tek9OeUJZSzhuUzRzZ2l5VXl1cExySmcwZklFNjMyOW1P?=
 =?utf-8?B?cWNndWtvK3Z6aVRia2ltVUtiRE54dkVZOTMyNERFUzNtYWhCRzFzODZnZ0Qw?=
 =?utf-8?B?QkZoUkIxdXV3ZjR3S0gxbEV1UEppWFhkSFdSUHN2RFRFOFhLQmhNeE13enl1?=
 =?utf-8?B?S1k1YVBUNUNZZnRFOThiNUlyaWVRclI5UHlrYlRxVHZCc3dIbUlHUTA2ODND?=
 =?utf-8?B?M0F3dnpYem5raVVOTjJWN1ZLakx6eVlHR2lkelNRc3hLSFRYblNDNDlpNGdL?=
 =?utf-8?B?S2praXBlbnh5WnNVdHIzSUl5M3E3MGVzVyt1ajlvclZDWFlYRTd4N0t0aStz?=
 =?utf-8?B?N1pGdXo1TUJ3SkQvcTlvc1dIdTl0QmhMSXJFa0IrTHdaYWkvN1lsckFOS1l4?=
 =?utf-8?B?QUd1OWpWK0hjMlBxaG1iWTBzcG51WTlFVk9SN21USmoxdmdUYlRBb3Z1K1kx?=
 =?utf-8?B?N0FRS3NURkJtMkZkQkQ2cFF3eGhwb0QydVFrNkRNcEwycHFOODYzTTFlU2Zs?=
 =?utf-8?B?NUtEdUdHOUxCR0RmM0UxeWx4akxBeUJnUG5LTmN5MHFGV1ZxQmFYMU5ZMWdE?=
 =?utf-8?B?cVJRcHZLTlh2UlFiU0FwUTE4cDhEdHRWZWFJeVhabnI0OUJQVlpMdk1aaVk4?=
 =?utf-8?B?ZHF6MEZVdS9LTmVQdnNicHJyWTFENFhlRFJWSXVuYmlHc0lrOHBsL0ZrdFdn?=
 =?utf-8?B?UDBBUlRMTmlHU1greTBnYmZXOVNPckNhcjRCWkdISFFBdGRReWFSY3laK2NP?=
 =?utf-8?B?eitoaTZzaWxvc283Z0lGdXRSUFBPY2hYT1o0RlhmWWtkZVN2TEZ4aGtMVCtl?=
 =?utf-8?B?LzJFdEVtUWszYUgwNEpVNjdOSVBUelNXUTZCL0Z1ZnY1T3RVU1JkcU5leUE5?=
 =?utf-8?B?RkMycktaRUd5VG0rU0M1SGtWT2NGaURTaHk3MmtSZkR4Mll5Uk9kYVVCTnBT?=
 =?utf-8?B?S1VjWWIzT0FtTUk2cWl0NzJRcUowZzYrdnBrTE9rbndXME9YbWFsK0xyWWF4?=
 =?utf-8?Q?vEsA1gAXy0BkhArehlVViNGiV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912e7900-ec5b-4417-1ed5-08dd8176a445
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:21:12.2787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXqofOQuK5inlln3rKYGhDXxc3EcjH3+i86ik+sJIC3iVcIR1AgqTKOZuycFzLjz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6576
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

Am 17.04.25 um 18:37 schrieb Kamil Konieczny:
> Hi Jesse.zhang,
> On 2025-04-17 at 16:52:46 +0800, Jesse.zhang@amd.com wrote:
>> Add UAPI definitions for queue priority levels (NORMAL_LOW, LOW, etc.)
>> and secure queue flag in amdgpu_drm.h. This matches the libdrm changes
>> in commit fdf384d4b546 ("amdgpu: add priority and secure flags for user queues").
> Please write from what tree comes this commit or
> give lore.kernel.org link.
>
> I tried to find out this on current drm-tip and failed,
> am I missing something?

This is a patch for the IGT test cases and not the Linux kernel.

It has i-g-t in the subject line and is send out on the igt-dev mailing list.

Regards,
Christian.

>
> Regards,
> Kamil
>
>> v2: In general, UAPI changes should be part of a different change and only uapi should be part of it (Sunil)
>>
>> Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
>> ---
>>  include/drm-uapi/amdgpu_drm.h | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
>> index 8191d0bd0..3f4813879 100644
>> --- a/include/drm-uapi/amdgpu_drm.h
>> +++ b/include/drm-uapi/amdgpu_drm.h
>> @@ -329,6 +329,16 @@ union drm_amdgpu_ctx {
>>  #define AMDGPU_USERQ_OP_CREATE	1
>>  #define AMDGPU_USERQ_OP_FREE	2
>>  
>> +/* queue priority levels */
>> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK  0x3
>> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_SHIFT 0
>> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_LOW 0
>> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_LOW 1
>> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_HIGH 2
>> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH 3 /* admin only */
>> +/* for queues that need access to protected content */
>> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE  (1 << 2)
>> +
>>  /*
>>   * This structure is a container to pass input configuration
>>   * info for all supported userqueue related operations.
>> @@ -355,7 +365,7 @@ struct drm_amdgpu_userq_in {
>>  	 * and doorbell_offset in the doorbell bo.
>>  	 */
>>  	__u32   doorbell_offset;
>> -	__u32 _pad;
>> +	__u32 flags;
>>  	/**
>>  	 * @queue_va: Virtual address of the GPU memory which holds the queue
>>  	 * object. The queue holds the workload packets.
>> -- 
>> 2.25.1
>>


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA4BC52D7D
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 01:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488C410E0D1;
	Tue, 13 Aug 2024 01:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y/SG0xno";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766E810E0D1
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 01:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sw1cRW0DRdieHfS0qOk6085rtdFIu1Al1HBn5wZufhPthWhJ9RjqdXDH6MZuTQbEsyHZnnEuGVgKbjHM+ao3jsQMCM9UFZkbTfCMOfO0yRC5ZW5vRAyZGtfKBQoPyWSrEtiqnR49iFSTnCeApkrvO1NPdlX+0B9qgpxclqM8zyjahDPrOixasv4Afgs9TyMwnBWzds6NR6Sxdjx1sCoQ61jFe5O6gi75b2mcRW07Wl7dtSO1fQ44/IzE+p3i5CHu6azl3QXQuZnk93DCkrR3vi74cmwPQIhJKPg32nu1r4+CiYk0zqJ3Bgm1LBPYT2TL7n+2Glx97Ez9j8AgbqltRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocrhWzHHra6Ic+6PA78ueP7WFVOwBPYviuFGP1PHMMA=;
 b=RISXwaVzi82fvldvUPMv2z6RVtCUMFGCDlRyb8nq/dd6Am3uS9iDiTgV9i/TbqXDcVcPaEzCFNBafMsnN36OXMwHwdySTo0FT+ttyGfcgXWN45oU0Gzk+qAGYZSI+v/aqOgcaN2g3J/FHQuQcZyDIWJDdkErPp9OyxKMymRkPhPC0Fu28rNTVUDePTgxObTtRC6J5piZI35yj3bLrOgtkCI6ks5CN85Okv8TEv4vjGIsqAbqYqvLQ3n6PEruyNJgczvlhJSg9lhyUx5TEi0YxEpnM5ZrM/9GOH0fEUBZcDdgTWXC4/2ayh9/M7mmod8VgVwPqLr+7rEkmuFhUHaHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocrhWzHHra6Ic+6PA78ueP7WFVOwBPYviuFGP1PHMMA=;
 b=y/SG0xnoYTZct8yM18UdC/UW5s8a/bwb4kyQCFJnnYExcPDw9pUJDCZDnRwMHhhnQfRQuqqgAbDVRVtoEoZJDlNfVUDAla9QDeJ6OeSjqS92+wce55xDFQK6njeCTZPhfLgdKhdezs7FAOQ3H3LNH2cnX5J3zpyI1KD+HGttNB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH8PR12MB7026.namprd12.prod.outlook.com (2603:10b6:510:1bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Tue, 13 Aug
 2024 01:03:56 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 01:03:56 +0000
Message-ID: <6b7ab7e3-bfc5-4e7d-a8fd-9c025447832a@amd.com>
Date: Mon, 12 Aug 2024 21:03:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amd_queue_reset: fix dynamic subtest issue
 for amd queue reset
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240812075051.2925305-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240812075051.2925305-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0225.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::13) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH8PR12MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: b59c7997-4b23-4d5a-87bb-08dcbb33ce42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnFlZUtkQTVjbzZ6amNsN3dycUtUa1hLYlVqTDVRMTFPbDlzWnJ4bGl1dDFl?=
 =?utf-8?B?dzhGZkt1RGNBQ0RFUzRHVkppbG10SUJlQ0ZIOFRiQWpmSHlNTDFxem81RnJM?=
 =?utf-8?B?TE1hRDJBYlVlaVJXczZ0QlpVTVd6WGtJeDUvQnBYOXJqTEVvNzg4RTN1bVN3?=
 =?utf-8?B?MFpoSjloS2lWbVBLR2Q1WG5HTkFJT0NBSXNmdFhzUFZyYkM1ekFMVnV0cVd4?=
 =?utf-8?B?N2tGeUlXME5YYnUySFk3U0QyODU3N2pMSHd1T3RacTlnOVlVZlFPS2x1UkxX?=
 =?utf-8?B?a3g5WFVMajcyYThBRHNjUEJnQ2RYc3V3enNmOEZ4VTNlWWEybEVWb2pvdFJk?=
 =?utf-8?B?cjlvbC9neFc3WS9RWkx2bllrd2hSaDFxOXYwdU1ZdFhqMHVuNTgwOWorajMw?=
 =?utf-8?B?TDBoOTh4SFNaUmNaOXFwRXhjbUtQRXVXelNlSUs2akg3Y0luL2RzU3dxSGVq?=
 =?utf-8?B?enpqWW14NDJQVXhrWmVWWWNWWWI1bkcxcSt1dFVvaHhKZGFSdmQ1VTEybDEv?=
 =?utf-8?B?SFRTSjhscml1R2VCUDRuTTdUYTNaWnorMndFLzBGYW0wQnU4eGZuSXBOK21E?=
 =?utf-8?B?MHpaWlNLbzhGdFFQOWMxUzRTOEM1Q20zaUJYVUd4NDV5WnlYeElRRHFxRjNh?=
 =?utf-8?B?cW1oTVhhMkhRQjJiN1NuandDcnFiK0N4OW9ZbTRPSjFaWHN0ekJqT0gzSDll?=
 =?utf-8?B?ZmpPS01tanUvUDJGd1g1NUlhYUVlMUhnQkhQZ0JkUThWSzRBNUp6YXMxQjFt?=
 =?utf-8?B?RFMwdVBFdGcraisvNGNFZE13NnJKaE4rSkRrcUJ4ekdRdkRXd2JwTCtrSVhw?=
 =?utf-8?B?M3JoL2hvVjluUy9LNHpuQ0lEL05qRzAyR1p3SWsvUDhrMzEvaWl2V0RFZHJs?=
 =?utf-8?B?WDlERTJGTXEyWUhqSmhCeW1FM2VLSW83MG41ZzVtU0lja0pIczdGTmMxbnlw?=
 =?utf-8?B?U21HVW9oQzdzZjBIS2Jzc0o2bHVySzNib0FSZmMrbGdMZnlaeEJWWDNuY0JZ?=
 =?utf-8?B?ck1Cc1hVUCtZNTgyZS9MMG85V0xrc3YzSWhpMlV4aHpHeVJMNTY5ZGVzanZS?=
 =?utf-8?B?SEtYQkhHQ0x3cCtNVS9YVkhIY3NKYmpXZTlPMGhoTzhSWVpjRzZVQTJWMjRV?=
 =?utf-8?B?L1RCRmxkTHNXdVFuMnBxa3EvZkZUTlQ1aUJPNDFRQVAwcDIrclNUYm1LcGtE?=
 =?utf-8?B?OEgwQzhFVktMVk9uVjkvcTVmS0dYWkI1WjlhRloxWEh3VnR4cCtodk9DVkly?=
 =?utf-8?B?eHVkZXArTnF1QkZNMjYrV1VQQ2tYWXR6S2ZrOXB6M09kUWcrRlhYNFlaVVJJ?=
 =?utf-8?B?eFhPRStadzByNVVxN3Z1Q3NmM3NacmhWbExraXlCVDcrWUNiWWpnQ0M0YWJz?=
 =?utf-8?B?ZkRLdXhidzhJaXlqWGpxZVUzSkEvNzZSVWVQR2E4NTlQWHRvY3g0Ulp3UUVv?=
 =?utf-8?B?WU52NXdzWkZzZThsajNjV28xWFQrVGRkVCtOd0toOVc3Z3JzRGpSb0svU3RM?=
 =?utf-8?B?QUVqbnlCWnhlb0orTmxTNDZjZkROY2MyaHhBR3BuOE1KRGVrQklxNGprZnNI?=
 =?utf-8?B?WmZYSUZQMWFiMFFrN1R1RVY4N1dTYUp0RVJhOURJOGJ5K0MvcGpVN2R1ZDZ2?=
 =?utf-8?B?VXlIVWR6UlZKYzNzS3JyUk5tSlRVQTRmSTl4VVFvR2JQK1RGeTFaQzF0Nkw1?=
 =?utf-8?B?TGZRUjNGN2lLckoxd25wUkxiOVNUMVVwREtwdng1bk9uNzYwQy9OUzh1N2g4?=
 =?utf-8?B?b3p4NVBERmRndXM0V1c0UW02NUl4YUJqTUpZeWpEVXcrOGZ1aHJJRFhBRFEw?=
 =?utf-8?B?RkJqT25IRE5BbElUQTNOZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCtTU3hEWlJ3ME5tNWJDbFZaQ1BYL0Jrd0k1VFlUUmhaQThMbUJDMWkvdVNU?=
 =?utf-8?B?RkhUb2NIaHB5c2VFRGlMd1FxRHUyOFFFdkN6WFZ3dC93aGQyZy9sM2hHcFZT?=
 =?utf-8?B?OGdVN09iUFppQkkxbWxuS3BwMkJ3amFLRHphVyswS0Vub3RWdmZobU16dnBG?=
 =?utf-8?B?YkhpZW9vMDNZWXk1MVhxb2FxMmVVZzQ3NVEvdTB5NmcrV29JRjdjL3FjOXhE?=
 =?utf-8?B?aEEwSVZZNFZMeTdWOXpKMThudlVhZFBIZ0h2ZXJ5VGxoRWt1UGkrQ3NLaUFN?=
 =?utf-8?B?cjJTMjhqRFdFRWg0Q0QwL0Zzd2tEVWtTUitCQ3d3MjhTRlAyNCtXdHA1cUpQ?=
 =?utf-8?B?b29uMVpjdldzWFB1OGlmUWlRRnd3QmMvM1QzelVPeGRwbEdlb25Ia3B4V2hG?=
 =?utf-8?B?UzM2SWRLL3l0SUhRSjNPZGRhWmVHNXpPaXZsZ2xvcnd1MnBYYXZQWnFFejBn?=
 =?utf-8?B?dDN1SnMwaUl6YWRhbG5DR3o0L3hpU2xRSkFxbkVZejNPRE1yRkRNL0wzZ0l1?=
 =?utf-8?B?a2VtM1IwbWx5V2VqeFJjVHNReUxYZlVWdlduVDNMd2cvMkdwN3d2S3dhVTdq?=
 =?utf-8?B?TlJNUW5iNGJTb01aOEFkTWdpVlZzemZwWXVOeXNxY2FEYUJEWUNWS2JzMThu?=
 =?utf-8?B?SnNGWEp3VDhnU0xtZmI3QStMSXZwOS92WUpOZXRBRm5VT1gzWUd6SW9VTE1I?=
 =?utf-8?B?eGhsZFJ4UFg4OXRUUHNZbDJpODR6dGhjQU9VVnpCYnI4MWF6em42SXhnYjFK?=
 =?utf-8?B?QWh3YUFRcWhhVG5aYjBsUncycCtHVDg5NVQ5WGF2bkt0SjZmSnBDdFo3SG1w?=
 =?utf-8?B?TTZnOWt0cE9FN1RLTmEyK0R3OE1BQW1qR1B3cnViS3kyeFFvekZwemRTN0Ux?=
 =?utf-8?B?WEtrWXVLZGlWNUx3RytEakVsSGI3dkx6b3JTOHJFWkU2WkIvQ01tbjlwTWhI?=
 =?utf-8?B?bThPb2FxcFlydW1oTmwvUDRoelN0aU1Wa2xqY2NxTmR2L2xkeDR1bXpMTEUx?=
 =?utf-8?B?YW51TDRnTmRhTVEvQldPbTR1clJocGFPQXB0VzVibWl4eFIwbGp6MWQ4YW1a?=
 =?utf-8?B?NGVvMzdFWDY0QUhmTndOd2Z4YUxHNEw4QkhrS2xLaTJlSlhwM0dCODhVd3ZI?=
 =?utf-8?B?Qm5zdXNEUGpSNHFlSXFuMHNXUWZyeDFGZkduVkx4SUtzZ3hYMVVkR2FBWnBJ?=
 =?utf-8?B?TFFudG5mQkNNd1BYTWt5dmFtMWx0bCtneFRyUFR4UjRmSUdZdk1wLzZVV3Va?=
 =?utf-8?B?TW5pSWRMTk9RQTVKblp2UUlBZjJHclJEcE1wMjgvZ0dJQUc1L2M2cVdTTU1W?=
 =?utf-8?B?R1dMa0hVZWR4Z0xwSXc2S1B5YVRYaHE4T3dVWHVuVFlTcS95TXZGcVVQaTgv?=
 =?utf-8?B?NzVhVzFjdjFLeGgrVjdCSTZYemtuLzh4NUtDNUJsZ1J1K3VFeEtCclQyNFY1?=
 =?utf-8?B?R3JaRWxhaVRKaEFLRzArVENydlBuSFVFWmZUaVFENGIzdnBEK3kzVTVsblNP?=
 =?utf-8?B?M2ZZa1dwOW1DVWZHek1pODRLcVpZVkhTdm5aUDNtcTQxM3dOaGFUZFI3Tmlu?=
 =?utf-8?B?VVAwd3ZXajJPdkkycmRrbmdLd0t6RFoyU3cwTVZYSFZmNXhyQk9HUUw3QnI2?=
 =?utf-8?B?aUc2eTVrbkQyUFFWWk9HZFdOZTBtcHg3OE5kdHJraGxiTDhDUTc2cEg0U3Iv?=
 =?utf-8?B?bmNzYnk2c3NEcDNKRE02dU5ZcktqVkVzNkRTU25HcFQ3VWRjRERWWFZReDAz?=
 =?utf-8?B?c214YW1RWnlveUZpdXVVdTR0b0xXb29OWFlDSi8zN3BRSDNQWHRUVXE3dGZI?=
 =?utf-8?B?UEZBbDZUdXJFSzBIOEhRTUN2N250YXJzWjdUNG00U0h6bWV4QkFzdEJ0Sk1L?=
 =?utf-8?B?emY0ZDg0c0xqeVR5RmxUUkRGWHM1NXhsMCtJbHRYeS81ZWhEM09uYlZmWjJG?=
 =?utf-8?B?NjdlY3RXSVcrTWtRWW41YlpzMkxIZ09pZFJRbWFONjFXZTVTaEI4ODNSNHB1?=
 =?utf-8?B?RWp2OTlDTDFrT2M2V0lHcDU3L0FDTGw2ZlNEYWVPYi9vU3d3TWdnTGdmSWJH?=
 =?utf-8?B?dGw3bk5ERWRHMHZ4ZlIwTVVYM3JLK1JqTnM4a29ocUNkZEY1ajJuRW9TLytF?=
 =?utf-8?Q?zrVd3edf8vI43snIVBAnkMpi/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59c7997-4b23-4d5a-87bb-08dcbb33ce42
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 01:03:56.0605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJC5ytu1UOG04iP/I+NVuSCd6TzS4hYdFtvbf0sOtL8Cy6okKwDEWco7PfPaNHF2IagNyZulrdqDsbfBnUZfkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7026
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

The changed looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-08-12 03:50, Jesse.zhang@amd.com wrote:
> Correct the usage of igt_dynamic_f or it always print SUCCESS, like this:
>
> Starting subtest: amdgpu-gfx-CMD_STREAM_EXEC_INVALID_OPCODE
> Starting dynamic subtest: amdgpu-CMD_STREAM_EXEC_INVALID_OPCODE-1
> Dynamic subtest amdgpu-CMD_STREAM_EXEC_INVALID_OPCODE-1: SUCCESS (0.000s)
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_queue_reset.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 1a128265a..729286d82 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -1000,9 +1000,8 @@ igt_main
>  			igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
>  			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAPHIX", it->name) {
>  				if (arr_cap[ip_tests[i]] && get_next_rings(ring_id_good, info, &ring_id_good, &ring_id_bad, i)) {
> -					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name,ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAPHIX");
> -					set_next_test_to_run(sh_mem, it->test,
> -							ip_background, ip_tests[i], ring_id_good, ring_id_bad);
> +					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name,ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAPHIX")
> +					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_good, ring_id_bad);
>  				}
>  			}
>  		}

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5272CA100F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 15:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F45110E1E1;
	Mon, 22 Sep 2025 15:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PHsT/2Ty";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF98010E1E1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 15:52:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdhyDJvh5Bcx2IuPmBYrKW1oYXKovZvDskScHtjkM3uN3M/3y/mA32D6QTeESoSJDmcgQZo/+PzCdNUxVe20WYIer/Sd07wErhzbq+wUDRsTK/Y5ZCR3vf+temAlX9if6z5J2qooKsmyz+TbxTS4xvG0DW0YTKA9VlgM+etE39pr7zVhGQkkgGAc/mKH+xCHOWsokwtwa2D7dFd1DmksOUDAc7F5tCsoGAReaZaHtDQDNkCMLztw7pEoJYlbZ/LmNJLNpmiEfs/FxwTyaXU/0KF7HSMSOjDw1DTN5sw6DFQldx3pj//X6BfKHcJ6NF3kkHexXl81SxZBUXcqI3XUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAODyVS2UEtdZ/AWSOBzic1+/g91evURq7RNbcQqil0=;
 b=SU8Dsn19cN6pL5zZxCwr0jgo79XumHzRA5znPlP43vS57qIL9v3Qkdq5fVn8D/q9EF8PbNyIme73byMxVzuWf/CRMmPOHuIav7HOl5u3sJcIaoRQjd/Vu9NZ/36XDveLu8EYWth4UbrMnzfoVvsQfrRGHs0+JyMeUGv4gH9+3McZuJUeNH2SHrj2rfGEhAVi15vGDv4fVPQTpXSiKGSQW0jWxZqYGwCdSAtTrAUdEW53p1j4O+amcFGnEb/0Gf6zm8OnLgvPVeguFhDCt8UzsM+zqofCw6bgWwQ5i9w1Cek0Lwh3tjRPDmQLy9SZZ2f14QoZKMvRJ/sXGnSxW0z1Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAODyVS2UEtdZ/AWSOBzic1+/g91evURq7RNbcQqil0=;
 b=PHsT/2TyVTPF7GyCQAU8YMw0LQRirjXvgIVIKePfeU1gL0lmOdw4Foe13+DQLQMaYXs80I/jfKfqlnvwRBfB2I0jYj3rdLlfgwrxLShxJ2NgeoVTQAjlzMADCXJEihGRRHFdF1VtRThpLUn4ykx2UN/AJt05vJ19bnb6/B7anVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB9075.namprd12.prod.outlook.com (2603:10b6:510:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 15:52:03 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 15:52:03 +0000
Message-ID: <8609722f-2e54-45d3-b4a6-9d8e70553611@amd.com>
Date: Mon, 22 Sep 2025 11:52:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Refine VCN test skip condition to target RX9000 (GFX12)
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Yinjie Yao <yinjie.yao@amd.com>
References: <20250919193329.92904-1-vitaly.prosyak@amd.com>
 <20250922103523.p3kaoixh4dose75j@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250922103523.p3kaoixh4dose75j@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::17) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a8b39f-6362-48ed-7d25-08ddf9eff944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGh2eUtQWGNxTGdWZkdXM3NRWDRMbVc0RS9RV2JlUzRQODN4YlRvdTNRcUdH?=
 =?utf-8?B?UHJ1MkdmMGZvL1ZwMm9RV0lZZ2F3RXM4TjhoMlp6MFlieWZVRm52emtYUlRs?=
 =?utf-8?B?OEdNNEp2Y0pwTkJaMVUrVmFyU2RSQjQ4dXlUbnhqSUlqczNieW40TnBpc3gx?=
 =?utf-8?B?eEVqYTdrSlZOTzRQUmsyWVlPSk93VnlIdmJBeE1xZXlhaHNhNEZOTklHc0xz?=
 =?utf-8?B?aURPazZtN3FON1hTWmt3QkZQYlNKVXJCNWwxNjlSQldDbG05VlczeVlCKzZP?=
 =?utf-8?B?Z3FkN21DRG9CN21DVUZtaERxLzIxaW4zdUtnYTNOZWo1VG5SR21jWmliUldG?=
 =?utf-8?B?WHBQUzVrVmV1UExMYjFTUndpejlMT2U2UnBDL0t5UUZPMnhjc2M0dk5aL3hS?=
 =?utf-8?B?VU9lRi9hN2xtZmFkMFRBQWtud0FSRTcwOVNOVVVHNm1TNkcyM1VsdjhjTHpp?=
 =?utf-8?B?RmQ3aXJlcGZhR2VkTUwrRGJPMmV6Y3JEZERSM013dFZHZ3pORUQxNFAxQThj?=
 =?utf-8?B?NlZyYWlZUzlycis4VkwwVUYzZlppQmlLUGZnU2lSSk1ia1ZGMnMxa2ZYY0tj?=
 =?utf-8?B?cGI3MDE1bzhISEw0emJPdWptYXlFSFRNaExodlJNODM0MWlHOHFsOXBMdGUv?=
 =?utf-8?B?blJLTk9mVklCOHNySUhQcDRZeDdHQlhmZ2VXL01LcjQwWVh1RFc0UzkyZFpF?=
 =?utf-8?B?eWJ5UWhKM3RiSk1LUk1YbUw3TU5jZGR5WDBVaVpqU3VIU3BYUjNhaTNVRkQz?=
 =?utf-8?B?akM1ZDg5d2xkaTFBVzc3VUlobEtOK21ZT1R3UXhOSWVXZnJIOVZ4TnBDKy9Q?=
 =?utf-8?B?VXR3T29SRGExRFlVc0liM0tNZ2dkZk9Ic2hhaktzTGFLSmFlcE1CZS9pSG5C?=
 =?utf-8?B?b3hCbC9GV2VlTDJTRXF1N1lEMjJjVUtnbXl1YzlHYUZSZCt0TXkxV0gyckFX?=
 =?utf-8?B?ejhTSWRZUEdZUmNqUHZWMm8wV0tienRIQ0Z0UjZKbDJYTDZLc0IvMWtBTkNF?=
 =?utf-8?B?VWhiUjk3NGd6MWNXa05OVlI4ZmRiRUJCVEphaGIxMWVXSEd4dno4V1ZsekNu?=
 =?utf-8?B?dmxoK2EvaDI1bUZDVVMxUzRhdGp5akFJT1p1ZVc5b0JXY0RETGNNTzZrRkVJ?=
 =?utf-8?B?WitoZG4vUDFxRTFhSFQ1NUY1dUwxVmNpMlhycE9yVjRkQW4vYzVldkM5SjdR?=
 =?utf-8?B?cnhzM2J0dE5nVU5kWjlDVnpXTERNU0Y2RG1GK3gra2xGenlLcXVZbTJKRWV2?=
 =?utf-8?B?UkpHM0ExMzdhZDJ5elB2Wjg1U3VFRVREMDlYV085R1pBRjZ0aUNlQjgweDh6?=
 =?utf-8?B?NXFwbnNpRUx0dDZObzlTaW5hYVd1NVNrc3dXVTBLVDVncHYzUkxucm41bk53?=
 =?utf-8?B?Szd2ZzZiYUhqcVEvVS94WTkvYVE0cnpFRFMvRlRrRldpaDNwUEZQbDlOanly?=
 =?utf-8?B?L093bDFMSGpRaU9qb3BkZm45c3RIQ3V4L2RTTXJxNGVWRmJTUjZNQ0NPdjZO?=
 =?utf-8?B?ckVHMkp5eW9wVGM2U3FzTGVNcHFoQjZzR0xqQjRpbXhsT0haaEpYaWF5UVJl?=
 =?utf-8?B?SDhXa2p6T05MQzlPNXFJZ3Fvd3MrbXJiOXJGSVcvTVdOUUZJUi9JM2tEM255?=
 =?utf-8?B?Mm1nb2g4WXNDWHlDM1pCekMzdTh6Q0NiTFNGV1ZNTGwvYVJNZWZheUI2aG5t?=
 =?utf-8?B?Wm1neHRXdXlsbmYzRDZJVTJTeTNFNVFJM1NqWjNrdHVXTVRUSUlQbE9Vdy92?=
 =?utf-8?B?R3V1R3lUcDl6c2hIVFA3VURndlNiZnQvL1c5U1ViRkZNMk5HbHFYSkIxajRC?=
 =?utf-8?B?WlBBby9Sd2g2Z29Dc0QxRG9CUUs0UHJpaUxCaDlGdXFzQXlVMGxGSGlQZXpR?=
 =?utf-8?B?SVUzTHZGYTNVMWMyMkxNQXRSK1VlMGNBL1NQOGQzZHpEU2dmRUhtbDgrZEFj?=
 =?utf-8?Q?iPLf6N2lrb0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlVXRFJhWW9nNDNhWkpOSkpjSkZhUFM2VmtEa3lZZGJ2NW5hbDdoQ0VCTWFI?=
 =?utf-8?B?Q0pubngyYTdYTEFFYTlOTGw4VE92RG9lWUUzcGZkTEFIbXBwbnlsWWdLVHdr?=
 =?utf-8?B?TlVDU3hSbTFmVEJTMEY0TTIrVGN2T3NqS01FTC9lWUc0dThVOFIwbEdTb2dT?=
 =?utf-8?B?RS9mV01SaFc0cVhZeHBROVJjWlNjN3Q2RVNCSXNvNjdBc0lTYzgrdWZvR1Jm?=
 =?utf-8?B?SEI4U01QMW9ERXlmZ09MMFFNd2dlcTNsY29OMFU0d2plQzFXZGJhdGJ6bXlU?=
 =?utf-8?B?dmsvUDJRekZCQlRIcUQ4N0hhalVraWpHMjZqeFVTcnNkbUhrNkNmdG4zTitP?=
 =?utf-8?B?bnlSUGVaZ0dZUGdLOFRIV2hPRlBqZVpmRkt1dm1zU0IxNFhiWURxbkdRT0Za?=
 =?utf-8?B?eWZmd2o3cWVDbCs3NGRCRmRodEhBeWlkMVJpMHNzS2RDRkVONzkrdlBKWDkw?=
 =?utf-8?B?ZkQ5bUNHUHlMRjNySHQrbUcvekoraEphaEJRM3J2dk1FcUgwNkR4VUFuU2Zx?=
 =?utf-8?B?K0NRTlJtV1A1WmFibjZ2S0k3UHNKOEJlTUErckxMSmNPWmR4YnZXQlBlUytz?=
 =?utf-8?B?M00yMmg1V01XV0hRUzRKVUwrVktxM0VGVTFlTXVaekxzb0h1cUlub25IdUd3?=
 =?utf-8?B?WnZ1dEM4UjliZkp3czN6UmVrVllYUStYWWtHV1ROZE4rcGh2c2VTL3k0SHh2?=
 =?utf-8?B?MDVHQTZFWVRGQ2xWcmxnOGtpYjYzTlQwSnQxVG5LWWM0dk95bkN4MnJxaFow?=
 =?utf-8?B?TXZON3NEMFBWQ3RGNFVGeTAzWUdzaitGb0tydW9NbHNMWlBvU1FUL3ZhbFdW?=
 =?utf-8?B?dEhXcnk1N2M5NGEzdGc2R2RMa01UUEVPNy9OVDFINEpmOGlTWjJtMnlJTVZ4?=
 =?utf-8?B?cjZxQzQ5cmF6NTlPUFhNRVhyeVF0SExieWZsK0FuRjB3VUFncDBSZC83c3BI?=
 =?utf-8?B?T3NqcEpJZUxCSkxuL2N6QmdyTkU1N1NBaERBZ0U2d2tEdHZvNHZHVElHU1c5?=
 =?utf-8?B?Ui9ZdndGTEdad25XangzYzFDZlp3RUJNQlZYd0g0Z1UwUEFsZFRmbzFEVTho?=
 =?utf-8?B?aENKMEhIVFBLZ0hnZ2VTSkhjTTIwVlRaMmxjeC9FY1VSTzNLSm51STJySlNG?=
 =?utf-8?B?MW9QRFNOZXlDWWphNDVseHRSVC91YkU1dUlmaDJNMDN4bjV5SkcwajBKSndv?=
 =?utf-8?B?bGtaL2VmTzA2NVlLZVJZSytmb3QyU29xNUJuWHdPbVNzUUFXSFdRVk9MaWs0?=
 =?utf-8?B?VWVCLzlXWGVmU2NpZkZPUnF4djB6ckRFcWY5dUl5TGxKRC9mUFJlRkloMjlm?=
 =?utf-8?B?dXhrUGd5TklLZHJ3WFdzeUQ0Ui9nR1NKR3piNGxmb1dMOGhjQ2tqbnFrOUs3?=
 =?utf-8?B?WUpuUGhkaE9sS3lwVDNEcy84VGpJNW5Rd0RsWDJBNkZaQUQvaS9ndFRRMkVK?=
 =?utf-8?B?UmY4QzhkVlhnK0lNVWZQalFteE00M1M0T1hmcnFocktpZzhTQm5qeVZGaFNu?=
 =?utf-8?B?YkZzeWdHN2UyU3dwdjlTZkZ6MEpDMkw2bklSQ0FvaXdEN3V4NGdQWXVGUER3?=
 =?utf-8?B?UHR6aWdObW1RbUpRTm1mZ3g5N2N2dUF2N2xXZ29PeWI5WE1lanZXc05EOVpy?=
 =?utf-8?B?V04zZDlPenlGdWlEa3FCeU9vYlk4dkZsbHBOdDU5MVNZZDA2dmJsK25DTm12?=
 =?utf-8?B?Tk9sUG1lZzNtVzRHYURreHR4SSt2RDAvaXM1Y2QyVzRmS2V0cGd1bnJMMWlu?=
 =?utf-8?B?cGVFRHdSbUVJRnZHeFgyZ0FYak0wR0FxSHFuTndkUWtkZjhsU0UyU2FkWWZn?=
 =?utf-8?B?dEtDeDhOaEZWNlhMRVFXYWhjOUZPMnI0eVBpdzNsdUd6bCttQmJTRmJGWjcy?=
 =?utf-8?B?Umt1YjEwZVlEeDErYmIrQVhmWU9sU3NVN1pzWWpOaHR4Y0FTZm95T1NudDl3?=
 =?utf-8?B?Sk1CRXVPZVoxOXJ5Y0pFbGJwTG8yV20zZmowK0V6aldxREZLbHc4OElsZTRC?=
 =?utf-8?B?NU9FTWxxMVdCM3B4Q2lBOVlRbURlOEZQZFJQNVFhaElrSVdJcTVkZ012NHRi?=
 =?utf-8?B?UUp5RGozeExGQnBaMW80TmdBTE96cnU1QzhxWGIxQlVJU0VPNjgwNS83VFJP?=
 =?utf-8?Q?Ovl/47uxTppqu/WK+9bhhnDw4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a8b39f-6362-48ed-7d25-08ddf9eff944
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 15:52:03.3661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+a8V2ulrMFift+4/sDoe/43CENYmNQMuSeDZy69bgilE+8eNKgx1ney8yURlInefkT+eeNuhMCY1Q567LN45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9075
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

Hi Kamil,

Thanks again for the reminder — and you're absolutely right.

Apologies for missing the subject prefix this time. I’ll make sure to follow the proper format going forward to keep everything consistent and aligned with our conventions.

Really appreciate you flagging this!

Best regards,
Vitaly

On 2025-09-22 06:35, Kamil Konieczny wrote:
> Hi Vitaly,
> On 2025-09-19 at 15:33:29 -0400, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
> small reminder: please use prefix in subject, so it will be
> like:
>
> [PATCH] lib/amdgpu: Refine VCN skip to target RX9000 (GFX12)
>
> As this was already merged it could stay as is but please
> watch out for other similar changes.
>
> Regards,
> Kamil
>
>> The previous patch attempted to skip VCN ENC/DEC tests on RX9000
>> by checking `chip_id == 0x51`, but this was not robust enough across
>> multiple system configurations or future variants.
>>
>> This change refines the skip condition using `family_id == AMDGPU_FAMILY_GC_12_0_0`,
>> which accurately identifies the GFX12 GPU family and allows
>> for consistent handling of RX9000 devices.
>>
>> VCN tests are currently failing on RX 7600 and block IGT enablement
>> on this platform. This patch allows test infrastructure to proceed
>> until a proper VCN fix is implemented.
>>
>> v2: Fix RX9000(Yonjie)
>>
>> Cc: Yinjie Yao <yinjie.yao@amd.com>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>  lib/amdgpu/amd_vcn_shared.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
>> index 61075d8db..32766c0b4 100644
>> --- a/lib/amdgpu/amd_vcn_shared.c
>> +++ b/lib/amdgpu/amd_vcn_shared.c
>> @@ -59,9 +59,9 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
>>  		context->vcn_reg_index = 2;
>>  	}
>>  
>> -	/* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id = 0x51, family_id = 152) asic_id= 7550*/
>> -	if (context->family_id == 152 && context->chip_id == 0x51 && context->asic_id == 0x7550 ) {
>> -		igt_info("Skipping VCN tests on RX 7600 (family_id = 152, chip_id = 0x51, asic_id = 0x7550)\n");
>> +	/* Skip VCN tests on Radeon RX9000  (GFX12, family_id = 152) */
>> +	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
>> +		igt_info("Skipping VCN tests on GFX12 RX9000 (family_id = 152)\n");
>>  		return false;
>>  	}
>>  
>> -- 
>> 2.34.1
>>

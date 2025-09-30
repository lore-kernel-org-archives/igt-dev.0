Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2508DCCA468
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 14:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C721F10E154;
	Tue, 30 Sep 2025 14:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yR6SDrDq";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE13010E154
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 14:02:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHaIbF4bNAlsZEBtnTW9ZQGX0IPoRnQufbiVve1XiYKtegvsvhbq9d/gwaXTCSftIqgoLULqSp5ZRdUgZs50qFHjugCo0sphluJGpHOtJhDoDWMjiyPVCntcOHOQLQp68hcuZoHzcmCEsi0UNCPj8NdZKLqeCaoeXHlU88JMHKN+sz+db8Wyh9oNv1YEHUOU7xlJSZv48ypkFnM2i4ijkFBDkNlUIjMJc/pr9IoP9X007h+MOftFZuuSfwsCLJETFyKP6IKMnql/iJqGlUClscWznYfV56UX6kc2Wf84AZQUS8RK/JxepeDNWwdJQ57KtoKTVgCg1xaE4SX7hsseCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XdwAijVlku0VFdqeEaW3LUryn/PYtKGgVHPQJpTF3Y=;
 b=nSdXquN7c9X2ftrxYNrZKWH7YEXyRCynAoI4potOO2kFpA7TiK44luEhWC8Reme+yUAr6nBeRQ1HhILrjQ8Umm84pjW50CIUhFxFb2y1RRJnRHyN5hjEPFGtQvm0lJBZgHi1panVKV598BoeprQzxB5xdrBmXIgYH1SXSslTPT+MYyKDOW498nAnaNWqdN0FHd1zKcEKjSsw3Vtiu7FA/BJLKf1qepuHEwNELmWgLbkxAmSh1QBw6+KaLCYifp6NsbAOI3zZOyd5KTWE5pV4UzZQEzo0cge3GxC8YDv7eqdMk1EofHXq3Dnvk+XsFjbW3VknmfgsSAIkRPhSiWOzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XdwAijVlku0VFdqeEaW3LUryn/PYtKGgVHPQJpTF3Y=;
 b=yR6SDrDq2aGmWt+tEnPefeK2+DOGnl5f/jW/xDE+5LP9j6xmDa0NNqVzpg0PZaSW/E5JMX7hdxT1uG4oO/X8IIspHV4RFWYeu5mtZDmhQiG2qDWLrlstNxaZNRz6UP16f28RuAQJPmBTLuZ0grqA2BuSesVCyddb4sPUdJjZq6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Tue, 30 Sep
 2025 14:02:04 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.017; Tue, 30 Sep 2025
 14:02:04 +0000
Message-ID: <d214f49a-98cf-4970-9617-372d7a49f9e5@amd.com>
Date: Tue, 30 Sep 2025 10:01:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
To: Louis Chauvet <louis.chauvet@bootlin.com>, Alex Hung <alex.hung@amd.com>, 
 igt-dev@lists.freedesktop.org
Cc: leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
 <782d02dc-3b1c-48ca-a77c-b7f01801c14b@bootlin.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <782d02dc-3b1c-48ca-a77c-b7f01801c14b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0147.eurprd07.prod.outlook.com
 (2603:10a6:802:16::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: e27031f6-f06d-4975-6dd0-08de0029ef2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3RtV2lmT09hU1o4bENwYUlvRlVscnZJZ3dGV00rZEdHenMrVWVXOFdOV1h6?=
 =?utf-8?B?U3FiU1ZRRnhpcTAyS2hDWUhxbXdPampKSWVHeXBPbDRac3V2OVBJNENJTGZs?=
 =?utf-8?B?a2ZBcXMzTk5uVVhVa3RobWYvNGVVSG1ZbnkwTXp6Q3ZzZ2l4cUdxZDJmbXlt?=
 =?utf-8?B?YjlTUVpiTDNTclVqcEhhWmhFMzVCZ2J3R2N5MTk5ang4T1RFeDdDeW9aT0Nv?=
 =?utf-8?B?VVZXMS9qK2VSUWNwMzJKTWJOTDJaaXl5V21GcW1tSGZFY09CZVFWcFVDa09l?=
 =?utf-8?B?V0lCMytaTFBwZFNRV0hVbmhyTmJIejJpQytnc1luSVdCNFpCcmtTcGhCQWdU?=
 =?utf-8?B?WlRnTWwwcGJyby8zNHFUOGIwSVN0RkNxVlVmV2tGWS82NXJjRWVMZzhScWZI?=
 =?utf-8?B?VEo2cTJJdVhMaENRM2FqYUZpZXpGeGJzZ1FhUk9sdHJkMFNiQUQrdTlGNStr?=
 =?utf-8?B?WnNjdVBrdjlCbFFNN3NDQ2c5VnVrK085cnFIQkN4a3I4U0pxVzJmUmJuN1FL?=
 =?utf-8?B?QlBzaEhzNjNvQ0EzOUhpNXV5cnRyL2RIN2FDVU83OUZOV2ZtY0pDOWU0aFd0?=
 =?utf-8?B?bjVtVXQwcnd5QXBDdDd3N3FRZEttdVRnZWNNa1hXNnlLenJURHhYZnUyQncz?=
 =?utf-8?B?M0RNaXFGU3Z3UmJCOWtXY0dvUXRmWVZ0ZTRoOTJ0Q0lNOGxLTEdCVXg4b3Jl?=
 =?utf-8?B?ZUpoU3Z5MHAzZjIvbTY2U05KUllJMTNIUXhHZTQ5RUNMZ1p2QWJBb2hzd0Ix?=
 =?utf-8?B?eGh2M05jNFNzcE1rc1pkTGJ3ekNVcmZ2alo5MVY5N1dreFJOdGg5ZCtJeTAr?=
 =?utf-8?B?dGxMOHQ1UVEyaUlZdkhSZU9mT1BkaTgwSTYrblNlbVo1ZFBBaE5GNUNYYk1Q?=
 =?utf-8?B?R3RjYzUxRlN4SVMyNSs4RU5QT0hnK0lob1VpMXJXaSt1bERtek9IZ0hPOVUr?=
 =?utf-8?B?TStkZGxJdkY2SW44NHkraXMxbTRvdk9VcjlqK3BjV0NvblhZUytZY3c4Y2tT?=
 =?utf-8?B?YWNBaDFFNlVtTktOQkJBRUpMY3R1Qm9vWDd4YTRFY1BJTnJLM1dLUzBQdEJL?=
 =?utf-8?B?cy9adjVDNHdmdlBsWHljYjZHdjFSRW56QmVBV1Nlc1E2L1M2YmFHbmdDSHNM?=
 =?utf-8?B?TjRDMEZLQ1p3ak9odFErZXNrNDJTVHRRTVVwaDBscDRmWlB5aTNHTmZvcjFE?=
 =?utf-8?B?UHF0dE4xamg2VkQ3eUJ0UFlrb1B5dmtENGU1QmtxY1ViVHBpQUZiRjIwc3k0?=
 =?utf-8?B?bE5adG5ISEpFRGErMlNjZDlYN09wTy91R2JVUnp5a1A5WXdKQmRQbXUzTGgr?=
 =?utf-8?B?UkNFR0xKV2tiWFBNZklsa29FR2d0YmVxelFScFJQdlplamRHT1JFdUtwVUdp?=
 =?utf-8?B?TFJQSjVUVmVTSzlFU3R6WVlXWFI5TmYvMWxUZDZaR09ieEttTUlTVEZzTzVV?=
 =?utf-8?B?eDMwQkIzZzdicVdJckJvQWNCK2ZvMy8zKzNpdVNreWtvMjlaMXpzTlVMVXhR?=
 =?utf-8?B?eVg0ZDhpYUZNWWdkcXNIZE04dFFMbzRsSDBMVG9KTXR4NU0zUFBoUG5ibm51?=
 =?utf-8?B?NmRkOHNMelFJS0ZmSXBFamNUZzNXNlpUVlNjOFVOM2tuN21oMzJvbUp0ZDU4?=
 =?utf-8?B?TnF5T0x2Y2Fvc0lBZVNnRElhcUlkVW1uSmFjUkMyWWI2UEtUZWdwTTBnUFpY?=
 =?utf-8?B?Vm9PUm9lanlBMjJhbUJHWFVkMURhNFpUbWVxOXRxUzErdzYxMnN6UnNBS2FL?=
 =?utf-8?B?WE1QUGJxVHBmWTc0YStMTGtNbVAwejYyeDIxL1FUWUNOMktsYnpVeDB1My9V?=
 =?utf-8?B?NVM3UDduWmprOERleDZYVjZSaWZPVWZJRmdDWUJNN2hzSTZrSXhxdGRyK05t?=
 =?utf-8?B?NHRleHB5amJEdk5Rd1BXT1MvSml1VVVtNE9zRWhEMHdpMng4VjN1SzJCdkRR?=
 =?utf-8?Q?/U4if/DpH3VNty/yj4DD2jwjyzRhdcxb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3B5Z291UHcxNTlmdDVWQ09hUHlLbkc5OWdQbkM5bkhObERGV29hSHZTcHNV?=
 =?utf-8?B?WTlvSmdsTHRXVlhRRlRtaFppYmVCMXo0QjdjNTQ3WXk3cXR3YjFCMDZuOEps?=
 =?utf-8?B?RlUwNVdzbko0UXBxMDBJU05SaTJYeGl4NzhXVmRZT0U5ZDdVeEtNS2FYWjFQ?=
 =?utf-8?B?QkR5WFd6Mmw4YW9NT2UrS1A1V3Yrczlnd2J0eDJWajBwYnRoNmkzOUdUMHRQ?=
 =?utf-8?B?YStrNU42ekJtcFpsUDMvNDhkY2tSaXFWTHlYcFpwbXREYnBCTi92dTJYYWZ3?=
 =?utf-8?B?NjkyU2NkZUd4MkVlRzdKc2VSRytOZWhtQVM5MjhvZHA3RU10WG5tczRxNzhX?=
 =?utf-8?B?eFYvU0FBNFVyRVYrQUJ1d2JoNzZyZFZ6S1ZLUTlYbFo3ZDNUNXdPRDZwMGF0?=
 =?utf-8?B?ditWQWgyd1RWdzMvTEIxVlE0UTFJTXBPVTRiemRTa2pUSnhDOXpUSHc4UkV5?=
 =?utf-8?B?eGl3dEN3UnRqN3R2Z3dwUjlQRWhBZDBuUjQrUjNaQXlQSlQrVzZpZnFRTGR0?=
 =?utf-8?B?RXBydnlPNTFleUtNWVlkNHo0ZHI1WTVQMmluVm9VYjFLWHRoN2Vpbk1kcDBm?=
 =?utf-8?B?L0llTlpZNnRGKzhXcldmeTk5UXNxNmVQOU40QnlPRFg4eVNvUlVWVzZISlNr?=
 =?utf-8?B?dk12bmE5eWM0SU0zSDRRNXJZbUZkaGhoZEMxWWxVc3I0ZnBCWjErUkM1S21P?=
 =?utf-8?B?U0p5TUV3VERVODZIYzlxN1NTRXN6SEZTa1hNK1E5S3UrTGJxd3lsWFl3MFdY?=
 =?utf-8?B?MjFOM1JvMXhFQUthbEpHSUk2WTBVaXhWRnNuVmRIT1RMbXVLdjl1MGFtNDZz?=
 =?utf-8?B?YVJVRlJ6RGNEWWRkT1lVeWN3VUhpalRYejd0ZTBDcG5tYTNJMnFicFpwOXRa?=
 =?utf-8?B?OG5SUTF6YVl1Tzd2S1RHMDRLR0Vqbmpaa0NMS2UrVzJTeEZtMkZQQlp2VWpn?=
 =?utf-8?B?ajYzLzgvQjhBaEkyZ3JrVEFibUVIM1RLUjArZWp1NDB4UVhUdEVKZEgxVW00?=
 =?utf-8?B?cmdiTk42RUpkTTlPU2ttdHdCZE1GQW9nSFBWZkc5MnQ0ZHV4LzN1ODdIeTNh?=
 =?utf-8?B?MW1qQWd6ZzRWN01sN2tsTnVKbGE0Ty9Jb0JUSGFRV21DZ2F1bnQ4UDV4SkRR?=
 =?utf-8?B?TkhBenpJeWdDc3RvUEg1OWVPdXNMeXJyVXpVeEt1QnoxMldrWUE1NlQvbTZx?=
 =?utf-8?B?c2psSjhEVGs5b2I5bFhaeENqUUo2UGlhbzlwemNKNXlKaXRsTmNNcjNZbkIv?=
 =?utf-8?B?c0xtZDA2VGJvczU5TlFwc21aV05vL3NVQWE1dStmRDRkVXppUlNlVFQvQ2Nt?=
 =?utf-8?B?RjU2cHBvdHBWNG1ZSkxlM281OGJGTEMvSlJYZUpEbzU2RnJLRXFrbytPa0Nr?=
 =?utf-8?B?R1lLbXRldmNMenRieG9nV2xDWGJHZUtBOEZjNnBnY1VzZk5RQkdxVjhYdlNw?=
 =?utf-8?B?cU5Ya3doMC9mL0xSNUgzNDdUcGJtekw0QjR3YTA1ZXdramx3SStxdEpoUVB0?=
 =?utf-8?B?VCswV1Q5d3ZXWEI4MHdKV29WWDN3YncwMXkvcFdRNzdSWnBLNEwwR3lqZWNS?=
 =?utf-8?B?VXgxRGQxc05teG0remJkYlNJTktVYWFYYk96RHA2bkR3RThPZTlxSXZMaXdh?=
 =?utf-8?B?dXFvbVF5QWdVQzBxSUpvY3BFMWxHdDBudjd4TDFSN2xnOFZobEpSUVB1citL?=
 =?utf-8?B?b2tMS2IwdnEzdXhZclh3WnFWQ2tTTDducnE4ZmFIcTArVFhEM21SMDFWWjBL?=
 =?utf-8?B?MWxyZGIwdjlVWFBZSDYrRlJJaS9pODZkYmxweUsxa1d1M1FDK0VrTXcyNlQy?=
 =?utf-8?B?d1dmTEk1R3BBU0RhZUJsdUJ5TG1lbzFPb3BXSENZb3lCZzJoL2NKK21mRklL?=
 =?utf-8?B?RTZ1a3lYcCt4anlTeUxKdnlSQjM3Rm5YQ0JHOEFIVk9oNnkrcHVJRmRDK3A0?=
 =?utf-8?B?ZVFmYVpqOVl3ZUNyUXNxNlNrcXJtdlNzdmIvbFZxU2dBajdBellseXVzMXN5?=
 =?utf-8?B?dDBTNkV1SGJwcUI2TXErM1ZoZzgzeTdFZGRqcTlUS2dpMGZScW4zeGdNYjVG?=
 =?utf-8?B?SEY1bHdBeExTWloyYkVjMVI3VThBK3JSTXRVRktHbldJYlpmRmZDcmpzd0tX?=
 =?utf-8?B?OGhjSlJHYkJZVVJqODFacmJMM3I4b0RhNlJQSmFWcWhZRlhYOE5zdjJMcm9Z?=
 =?utf-8?Q?xhsTMEhTy9gFjR843BKsrAA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27031f6-f06d-4975-6dd0-08de0029ef2a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:02:04.2866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G06dEaYYBIHsa3FKL8mHQ9bp+bF03DBPYhGRHvagfXTDdMXXe8OqDO5fHl3TUnSfqDMz1rqK01tmhxPS8iTNYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692
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

>> +static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
>> +{
>> +    if (is_vkms_device(in->fd))
>> +        return igt_cmp_fb_pixels(in, out, 1, 1);
> 
> Can you add a comment explaining why vkms is an exception and how the 
> [1,1] bracket was choosen?
> 

The idea was that each driver is best served by their own bracket. A 
later patch adds an even worse bracket for amdgpu.

If I remember right, this bracket was simply chosen experimentally, 
i.e., by trial and error.

Harry


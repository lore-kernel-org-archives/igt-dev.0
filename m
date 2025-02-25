Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FC5C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 22:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308A610E810;
	Tue, 25 Feb 2025 22:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WxJzHNcI";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E7F10E810
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 22:47:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGkPwBzK1InKcM+B/X0vkNFhaqbQe9Rkc4LKf/B6nQMD5UD897KOuOOH0hG+tn4p/N4fqBc4DstErMvE9lDfiedo3bFc0jLEOSlpDGK4VcPuy4N3aPy2nPb1TOzHoYn5sb20uJGtfnQo+8zTpMQedRiwa3bBqIm9262yrzmCEw4dXgJccEBCgwVPSq/ZCOGjtGQfW8p/qUWxof+IyHzGQNUPPUghfDEDu0WjR01z+N8l/zoHdC0/77EzrfSgmf7dyN4ZcC/pANlIUgcEHhDAYs6wM04dBQmSOJB9amwdxea9vgSGwgfBUNB5OJbvBpfEO5UaoGFHpkCDPn1GPcYfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVkURHhzgu0clwOGOApYn3IPphN6EXmEDJ5HyMv7v0U=;
 b=IW22/eHApDHmgwI0Agi18cAPw8/YR6cHrmuGbMTDix6kWHgUF5WSeH3Bx2PHZ2uSfDABN1arwoDPwjnVF21DoGPIlpE2CoZthU5e18ju/QEkrwHPm7S0Fh6JaTrZNwTqsTorttyJDeucjmwJgeCqdTIr9v/UccZeAr4R7P/tDwZZiUIZClqu7uuji3CBJEN8XnQevaeOSLIG+ohMhtMqakT2zzT0N3kmU5M+NOtnTxue8nB+JFDPzVnQVmudnizqH7nz+R5u1WM9ppOQENHoBavC5GrqooMbDgZ3v/dKK4ye4fdrSidCGkVsrOeBaRanSXc/a4BvCThVRS8s/92C5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVkURHhzgu0clwOGOApYn3IPphN6EXmEDJ5HyMv7v0U=;
 b=WxJzHNcILeIlSYLdD+33IVl/zISI92gpirQsh6Cswc2Je+J0WWP7fktIUQhyOTHdyMecvRfHdgbXexYDhztvLnPuyxEXl1hbQi5viXLKts9Fz7utMt6cpCoxNxINdkv8HmOG9bB841vub5GxEBCAVGkMO13k9rIBgvdma79lq/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB7298.namprd12.prod.outlook.com (2603:10b6:806:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 22:47:45 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:47:45 +0000
Message-ID: <0138a6e0-8e3a-467a-b6c6-41244bd1737c@amd.com>
Date: Tue, 25 Feb 2025 15:47:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/kms_async_flips: Create subtest for overlay
 planes
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 vitaly prosyak <vprosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com,
 Harry Wentland <harry.wentland@amd.com>
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <20250219103703.2hbadorsyh5ezd3e@kamilkon-desk.igk.intel.com>
 <5b88ea25-c9a6-4025-8f9b-34e1b213e258@amd.com>
 <78c0bb06-fb95-443c-a16c-9478daa11562@igalia.com>
 <a8fc5cef-5ccf-486d-b401-f587e500746d@amd.com>
 <41966687-e25e-42eb-a6b3-fba5d6c85e16@amd.com>
 <96660957-4656-4a48-9df0-bf62f7aa5433@igalia.com>
 <ebe71668-236c-4f6d-bcf3-82b8c2c63d02@amd.com>
 <4c03e73f-e110-41b7-995f-b81857546d8c@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <4c03e73f-e110-41b7-995f-b81857546d8c@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:930:a::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 5734068a-2e78-46e6-ec96-08dd55ee6b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkduYXl0UkFkbkFPL1RTWis4eE5zL2FiYkZtUWNGdVNzb203djZyVDdKUUJG?=
 =?utf-8?B?dCtCSEJRczZDb1kvVnNqbU5YQ1dsdmlhM3FpUnI3Ry9VaGVmVk5QSkhmZWpT?=
 =?utf-8?B?K0xQSFMyUTFxbG5ac0ROWXhseDNDTGs5N2xOZGp1ZjB6bGdieTVwNzBqR21a?=
 =?utf-8?B?UHVCU2ZIUmJFbzN6Y3ovU3hVeENNMVp6dzRvbHpVcE5pL25yd05YWVFVSVJY?=
 =?utf-8?B?dm12ZWlkalZnRnNWakpoMkRIeW5FaitGb2RRcHRRU295aEhjeXowayswUjVN?=
 =?utf-8?B?MUppZERLS2FYb0NoZjRoWmIzQnRWUjFjcUdmdmEyV1gwM2RmQW5VOHZnWWMy?=
 =?utf-8?B?SERCUU55ZEZOSTJyMWRZRWNaVUFSNnQ5TitLNlZDNzV0VDNJRjBSb2hZR1ZB?=
 =?utf-8?B?WjZHZDcxOEJuN3FnTnVBZ1VtOWtnektpZDlGeHVmU0ViNUJlMmpId1VzTzc0?=
 =?utf-8?B?a1dRekp5L2tUR2xia2lFUVB6RHowemxxMVJ3ditmZ041YTlvaUxNZllsMTIw?=
 =?utf-8?B?SlFRN1dvRUxQRTdMb1ZMbHdOaVBCQWF0dGNWaHdVVjYyeUdyMnhuUFp1MWs5?=
 =?utf-8?B?cFd2eDNrYU5aN0ZSODdHcEVzd2llUkpOZWdHNHlkL3lKelJWM0U4V0hOdm5K?=
 =?utf-8?B?a1JCaTlWekxtSTZ3V3E0VGt2WUdpYVhLYmQ1WGU0cERTczBCcHpRSkhtTERu?=
 =?utf-8?B?d21pN2ZPRUt5NGp1Y2lwc2c0bTNIeERkY05YaHkyempYMVl5Wnp5eExLNWk0?=
 =?utf-8?B?Vzg3TGNaVE9OK1FWTXRBejhkR0hMTEdiMkJPeFFaVEFtZmxFcnEwNExJOUUw?=
 =?utf-8?B?MjNSUDNrVWxHcGpLRnZ1emp5d1puZW5leW5SVmVURmVrV2R5WFE3SC83d1Ni?=
 =?utf-8?B?T3pRUWs1SjVsODZYVjRaa0Ivb0o1NUpVS0VnUHVaRnVWZk9JQ0wybklBRTl4?=
 =?utf-8?B?ajhHWXFGaEp5UkRlSUk3RktuRHlidUZ4NjdaYkpTZDAwNjRtbXF5OVJqaXcv?=
 =?utf-8?B?eE9GWncwOUFOVUxnbzJpRDlTd0JoSk4vbE5samN6T3JXOFpxczFTZEVHR2Qv?=
 =?utf-8?B?UkFBRHp2TUcwd0psWDFSSUs5NmhRdWU0SVd2TGZiVTEraTVQdVlLR01NbHVx?=
 =?utf-8?B?N3p4c295SkNlWTJ4SUZZYUwwWGovc1N4VjlwMDNvMEtxTjJGUlIybFp4L3Zy?=
 =?utf-8?B?MjM3WnpnNnVDUGFsT2w1U2tYdEhDWDVCQURZR2JYRkwrTUkwc3Y5UU9HQW5Z?=
 =?utf-8?B?NE15eXEvWW5nRm5iQUN4aFdBRmFKRlZQNjYrNWdleVRsdVJzY01WUS9PZEZU?=
 =?utf-8?B?ZTgzNElIMHhVMnRrU3dkQjROV3UzeXM2aXpNY1I1Qmpsa2k1M3VLRTNoSktK?=
 =?utf-8?B?ckc4d0p1NkJISkcvUnNkSGgyVzZlZWFZakkwOUVPSGhOZmVCb2g2c3gwdSsx?=
 =?utf-8?B?WjFyNTN6Skwzd1JQb3VvUTkyWm9TUWV4RE1pVFh5UFl0d0FUdFFtZHBsSFBQ?=
 =?utf-8?B?dWZGamh2SG5SSWJvL1BLbGREY1F1cnpFMEFNeFFaQjBZaU9yUkR1ZFUzSEU5?=
 =?utf-8?B?UklOb1FMZ2VQSjYvUnZPVEo0eEVpSDBValdUZ0J6cURlS1lKRHFEUjFKVHhY?=
 =?utf-8?B?U1N0NWxqRjlSUks2Nk9nb21HUFQ3MkFMVm1GSkR2ZWg5WHZYSTd0a0lWdGJl?=
 =?utf-8?B?MzFlYUhnYTQvZms1Q215WWl4bUVXbEVIaEhMY2xzTXBpNjlhc2tmd0xteTJP?=
 =?utf-8?B?K3I0MW5XUEdoZ1AreHhsM050SVVpWXhzbEhnWER0K3RBampVeHBZMXM4Rnkr?=
 =?utf-8?B?Y0Jsa254SmZMU21aKzZ2dmU1b3ZGTXdTVDJCM2YxdVNJbVBWdXpXYXhmQ0l1?=
 =?utf-8?Q?iym+NJKXRObI9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qng5bjBZWHhiRFB3YU1xUkp1eVZHck42TFJCaFU0RG0va01iSXdrbHA0S0Fz?=
 =?utf-8?B?ZmhXOVo1Rzc0amNPQ3dRRGtLUTByaUttaHFCYjNnZ28weUtvQ0VmeURweTBm?=
 =?utf-8?B?bkFHQ3FlSW1hdnJBanJXd09SVi9DL0w0cE1FNERlQ3R5d0ZTaU03aDFDUXVo?=
 =?utf-8?B?VlB5dG55cjhISGJIb3dFNThGRmNONmNZdXNoU1dPUHk4QzdVOUVqTlR0bmgx?=
 =?utf-8?B?amYybm9BbkppOHdCMjhnS2JxaUk5b210am5HcUlWNTBpb1hJU1pmbnQ0ak1i?=
 =?utf-8?B?Y0J6SVNOeEU0OUcxRVRxbHlhcXY1Q2hhR3NucWp0L29TREV2dGxkRmFHOWVC?=
 =?utf-8?B?bkpOcUFsUlBwREVZbnFRK0tnYWpDcXp4ejhzQmxWazRQOThxOXZ4NTdmUHpM?=
 =?utf-8?B?YzJIUzFjeGJicWNJQlJQQ3c0TEFJOGhDekRWTVhDVll2WHU5dWlKNVN5RG81?=
 =?utf-8?B?SGgwYTdaeUQrcjFLTENtWkFZVFRJN3dtcXV5cFhUb1pUK05LMkpXYzdKWDZn?=
 =?utf-8?B?SmhsSWRSV2RNRE5IZHRDN0YyMW90ZUV0ak5zTzJOOURncVFGYi9DdDdZVngy?=
 =?utf-8?B?SXFmNWI5MzZGQWlDUEpDTzY2eHNxaDdQMit6MWdacmd1K0JCV1FiRWt1ejdq?=
 =?utf-8?B?T0xHczJURXNZYjlEbzNsOUZ4d3lQSHNYc3lRZDZoMnVDQUlJdnlwMWdxenZa?=
 =?utf-8?B?MkxycU5IR2RxdmVCOU9vaGFzQW1oUkdSMEtVdWkvczYrOUo1c3BwdUMrWUxM?=
 =?utf-8?B?MXpERFFCbG5sZWpRbmdzRDBEZXZOWmt4Nk5QaDdKTmV4Zk5aTXo3dEpOUEto?=
 =?utf-8?B?RVVtbG52czF1a3VaRnJJK2pkUDRYZkw1a0dwWXZlc1BuODdXb3VzcGhsWDlj?=
 =?utf-8?B?TlIxMnhBUWIxdi9pbzJUVFhic0ZUTGorZWZQWlR2aUZUbzNGYysraWFFSEJS?=
 =?utf-8?B?QnJkcm11WDRYNmhtTUlCZ0NVNCtIMnFpdldTbXdlZGE5czhScmdIUk9Qcy9M?=
 =?utf-8?B?enNsZXNuRGRwMjkyQjRqejVpbmpKdkpOSU5NOWdvQkNhcGs5VHc5WnQ0WEo2?=
 =?utf-8?B?Ry8xTmdHMVZGK0hFU2RYa2t3QldyWWR1VXdrUDU0NHJMaTBFWnpGRjNaa2dy?=
 =?utf-8?B?V0dTblp1enFycTNoQnZrREZoRy9DUVNGNU40a0RYQjJlclZ3cVBhV2Y2cUZX?=
 =?utf-8?B?WDBrSks3UXdxLzJiN05xQ0xGMW5hZkVoWG1CVXp1NXQ4Q1JCd202ejhCTUFv?=
 =?utf-8?B?YVcwaC9ZQWJVYzl1TkkxampFT1VoMEJKR200NTcxc29PL2JaUlJma2oyaExU?=
 =?utf-8?B?NStBQkdJVFJNKzRScm9wTDgwTHFjd2l3d3lwZHg0MUs5Y2pxN0xZVmh5bWJ3?=
 =?utf-8?B?d1lrUkJxS3U1d2h0SVJFUzg5TnhCdkdreHVyajdpWjB3dWQ3eTdKNGtvMktF?=
 =?utf-8?B?RDdWdDVVK3hNb2dKSC9Vek1qWmdJcjlUYVl6UUJVekdUUjZxc3J6MzhRUkxT?=
 =?utf-8?B?OG1YNzdMZFg3eWZoMWg2eHRlakVNQnN0ZVFzeWJXMDRPTUxpNC83bE5LdGxs?=
 =?utf-8?B?TzNXOTR1cENqbTdWUnkwUEJDOVRRRFRYT1hlaVRWVWRiUnpXaktvTk9Rb2Zl?=
 =?utf-8?B?eGNZbC9JelNLOGZRREJqNHNmUDVOZU1IdjJkQUsxZ2xIUmJ6Rk1DTXF4dmdQ?=
 =?utf-8?B?Z29SK0tmTlFGK05sdmsxT3o4ZHk2cFJoS1lFc3FqMzZCRlQ2djloOC9ubzdQ?=
 =?utf-8?B?Y0FmSFBjSDlVTktoQXFNcy9ZcUdEZjVzWXpUd3RlV2h6cUVaT2RvdllVcDBW?=
 =?utf-8?B?dzJtOEVKS01LU1NoMk9GSW1TQlViUDdvcHZaZ0tTb1YwUlVHMWFyaFlTRjdl?=
 =?utf-8?B?eVlvaHhkOENZNWRzTkdaU2ppdzdYS0lhd0ErbEtzamtGNWNKT0hIbXFkRnYw?=
 =?utf-8?B?T1puejdIVnFzOHNZYUNUeTBFQ0M2Y3c0bWRrUmcrYmZpYVdtZFhpMWdVeTYz?=
 =?utf-8?B?U1dCWTJHdldvQzBYWS82SmQ4Z2xjNkZKRHdZY1NvZDFUQ091Q2QrQ2h0K0Fu?=
 =?utf-8?B?cEJaL2JtbXJpSWtuaTRMckozSHhLWGhnMEVSTmFoMlNBejAxMGZ6NTk4WmNI?=
 =?utf-8?Q?3+gGkUARI698KCquft04yFlTM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5734068a-2e78-46e6-ec96-08dd55ee6b4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:47:44.9669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZ8QJXP9vgFdtTOkZKamQWzkWXVreclQzQyjMHoGB6zREihXuwihGmxGejR3QlHmc9s9io1zCePogOfFEOON/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7298
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



On 2/25/25 15:01, André Almeida wrote:
> Hi Alex,
> 
> Em 25/02/2025 18:40, Alex Hung escreveu:
>>
>>
>> On 2/25/25 13:16, André Almeida wrote:
>>> Hi Alex,
>>>
>>> Thanks for testing it.
>>>
>>> Em 25/02/2025 16:06, Alex Hung escreveu:
>>>>
>>>> We don't have a CI to test individual IGT patches so I tested this 
>>>> patch on an APU and dGPU with kms_async_flips
>>>
>>> [...]
>>>
>>>>
>>>>
>>>> If I run overlay-atomic alone (i.e., --run-subtest overlay-atomic), 
>>>> overlay-atomic fails as below (partial outputs only). Is this an 
>>>> expected result? Does overlay-atomic need to run along with other 
>>>> subtests?
>>>>
>>>
>>> This is not the expected result, I tried to reproduce here but it 
>>> worked fine. Tested on Steam Deck, rebased on current igt master 
>>> (commit 6cdff4099c6c95e):
>>
>> I also have IGT rebased to current commit (same as yours)
>>
>> db3a185f3 (HEAD -> master) tests/kms_async_flips: Create subtest for 
>> overlay planes
>> 6cdff4099 (origin/master, origin/HEAD) lib/i915/fbc: fbc psr combo 
>> support update for xe3
>>
>> The kernels I tried are
>> - 6.11.0-18-generic (from Ubuntu's current)
>> - 6.12.0 from amd-staging-drm-next
>>
> 
> The changes required for this tested can't be found in any of those 
> branches. They are in after the tag drm-misc-next-2025-02-20 ("drm-misc- 
> next for v6.15") and this is the patchset:
> 
> https://lore.kernel.org/lkml/20250127-tonyk-async_flip- 
> v12-2-0f7f8a8610d3@igalia.com/
> 
> So now the mistery is not about why this test fails, but why it succeeds 
> in the first place :) I will have a look using an older kernel to see if 
> I can figure that out, thanks!
> 

I applied the two patches on top of amd-staging-drm-next:
	drm/amdgpu: Enable async flip on overlay planes
	drm/atomic: Let drivers decide which planes to async flip

The results are the same, i.e. SUCCESS when running kms_async_flips, and 
FAIL when running overlay-atomic alone but with different error messages 
(see below). I can tell the patterns on screen are different.


IGT-Version: 1.30-gdcb53a091 (x86_64) (Linux: 6.12.0-99-custom x86_64)
Using IGT_SRANDOM=1740523111 for randomisation
Opened device: /dev/dri/card1
Starting subtest: overlay-atomic
Starting dynamic subtest: pipe-A-eDP-1
(kms_async_flips:3133) CRITICAL: Test assertion failure function 
test_async_flip, file ../tests/kms_async_flips.c:384:
(kms_async_flips:3133) CRITICAL: Failed assertion: (fps / 1000) > 
(data->refresh_rate * MIN_FLIPS_PER_FRAME)
(kms_async_flips:3133) CRITICAL: Last errno: 38, Function not implemented
(kms_async_flips:3133) CRITICAL: FPS should be significantly higher than 
the refresh rate
Stack trace:
   #0 ../lib/igt_core.c:2055 __igt_fail_assert()
   #1 ../tests/kms_async_flips.c:384 test_async_flip()
   #2 ../tests/kms_async_flips.c:728 run_test.constprop.0()
   #3 ../tests/kms_async_flips.c:840 __igt_unique____real_main773()
   #4 ../tests/kms_async_flips.c:773 main()
   #5 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
   #6 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
   #7 [_start+0x25]
Dynamic subtest pipe-A-eDP-1 failed.



>>>
>>> sudo ./build/tests/kms_async_flips --run-subtest overlay-atomic
>>> IGT-Version: 1.30-g19c7e62ea (x86_64) (Linux: 6.14.0-rc4-00318- 
>>> g72d0af4accd9 x86_64)
>>> Using IGT_SRANDOM=1740513273 for randomisation
>>> Opened device: /dev/dri/card0
>>> Starting subtest: overlay-atomic
>>> Starting dynamic subtest: pipe-A-eDP-1
>>> Dynamic subtest pipe-A-eDP-1: SUCCESS (2.124s)
>>> Starting dynamic subtest: pipe-B-eDP-1
>>> Dynamic subtest pipe-B-eDP-1: SUCCESS (2.101s)
>>> Starting dynamic subtest: pipe-C-eDP-1
>>> Dynamic subtest pipe-C-eDP-1: SUCCESS (2.101s)
>>> Starting dynamic subtest: pipe-D-eDP-1
>>> Dynamic subtest pipe-D-eDP-1: SUCCESS (2.101s)
>>> Subtest overlay-atomic: SUCCESS (8.950s)
>>>
>>> However, I saw this type of error before where the first flip is 
>>> refused with -EINVAL. That usually happens because we can't change 
>>> most of plane properties with the DRM_MODE_PAGE_FLIP_ASYNC flag and 
>>> the previous state was somewhat different from the one that we want 
>>> to present now, so we need to do a sync flip to modeset, and then do 
>>> the async ones.
>>>
>>> Is there anything particular from your setup so I can try to 
>>> reproduce here? I see that you have more than one card attached, what 
>>> did you run prior to the test on that card?
>>
>> I tried on phoenix APU and dGPU Radeon RX 6800/6800 XT, and both of 
>> them have the same results.
>>
>>>
>>> Alternatively, adding the following lines in the begining of 
>>> test_async_flip() should force a DRM_MODE_ATOMIC_ALLOW_MODESET and 
>>> allow the next page flips:
>>>
>>> igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>> igt_display_try_commit_atomic(&data->display, 
>>> DRM_MODE_ATOMIC_ALLOW_MODESET, data);
>>>
>>
>> Like the below changes? It doesn't fix the error messages for me, and 
>> I saw some SIGSEGV.
>>
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -326,6 +326,9 @@ static void test_async_flip(data_t *data)
>>          struct timeval start, end, diff;
>>          int suspend_time = RUN_TIME / 2;
>>
>> +       igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>> +       igt_display_try_commit_atomic(&data->display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, data);
>> +
>>          igt_display_commit2(&data->display, data->display.is_atomic ? 
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>
>>
>>
>> If either alternate-sync-async-flip or alternate-sync-async-flip- 
>> atomic is run before overlay-atomic, overlay-atomic will SUCCESS 
>> (tested on phoenix APU)
>>
>> Cheers,
>> Alex Hung
>>
>>> Thanks,
>>>       André
>>>
>>>> IGT-Version: 1.30-g8fee6d12c (x86_64) (Linux: 6.11.0-18-generic x86_64)
>>>> Using IGT_SRANDOM=1740510058 for randomisation
>>>> Opened device: /dev/dri/card1
>>>> Starting subtest: overlay-atomic
>>>> Starting dynamic subtest: pipe-A-DP-1
>>>> (kms_async_flips:3180096) CRITICAL: Test assertion failure function 
>>>> test_async_flip, file ../tests/kms_async_flips.c:361:
>>>> (kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
>>>> (kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
>>>> (kms_async_flips:3180096) CRITICAL: error: -22 != 0
>>>> Stack trace:
>>>> Dynamic subtest pipe-A-DP-1 failed.
>>>> **** DEBUG ****
>>>> (kms_async_flips:3180096) DEBUG: Test requirement passed: ! 
>>>> (is_joiner_mode(data->drm_fd, data->output))
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(handle=1, pitch=13824)
>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>> passed: igt_has_fb_modifiers(fd)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(handle=2, pitch=13824)
>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>> passed: igt_has_fb_modifiers(fd)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(handle=3, pitch=13824)
>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>> passed: igt_has_fb_modifiers(fd)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(handle=4, pitch=13824)
>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>> passed: igt_has_fb_modifiers(fd)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(handle=5, pitch=13824)
>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>> passed: igt_has_fb_modifiers(fd)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(handle=6, pitch=13824)
>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>> passed: igt_has_fb_modifiers(fd)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(handle=7, pitch=13824)
>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>> passed: igt_has_fb_modifiers(fd)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>> igt_create_fb_with_bo_size(handle=8, pitch=13824)
>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>> passed: igt_has_fb_modifiers(fd)
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>> plane_set_fb(151)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>> plane_set_size (3440x1440)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>> fb_set_position(0,0)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>> fb_set_size(3440x1440)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>> plane_set_size (3440x1440)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>> plane_set_fb(151)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>> plane_set_size (3440x1440)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>> fb_set_position(0,0)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>> fb_set_size(3440x1440)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>> plane_set_size (3440x1440)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
>>>> "MODE_ID" to 0x96/150
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
>>>> "ACTIVE" to 0x1/1
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>> plane data: A.0, fb 151
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "SRC_X" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "SRC_Y" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "SRC_W" to 0xd700000/225443840
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "SRC_H" to 0x5a00000/94371840
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "CRTC_W" to 0xd70/3440
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "CRTC_H" to 0x5a0/1440
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "FB_ID" to 0x97/151
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "CRTC_ID" to 0x5b/91
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "COLOR_ENCODING" to 0x1/1
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>>>> "COLOR_RANGE" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>> plane data: A.2, fb 151
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "SRC_X" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "SRC_Y" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "SRC_W" to 0xd700000/225443840
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "SRC_H" to 0x5a00000/94371840
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "CRTC_W" to 0xd70/3440
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "CRTC_H" to 0x5a0/1440
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "FB_ID" to 0x97/151
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "CRTC_ID" to 0x5b/91
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>> plane data: B.0, fb 0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting property 
>>>> "COLOR_ENCODING" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting property 
>>>> "COLOR_RANGE" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>> plane data: C.0, fb 0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting property 
>>>> "COLOR_ENCODING" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting property 
>>>> "COLOR_RANGE" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>> plane data: D.0, fb 0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting property 
>>>> "COLOR_ENCODING" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting property 
>>>> "COLOR_RANGE" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>> plane data: E.0, fb 0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting property 
>>>> "COLOR_ENCODING" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting property 
>>>> "COLOR_RANGE" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>> plane data: F.0, fb 0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting property 
>>>> "COLOR_ENCODING" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting property 
>>>> "COLOR_RANGE" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     DP-1: 
>>>> preparing atomic, pipe: A
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: DP-1: Setting property 
>>>> "CRTC_ID" to 0x5b/91
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: }
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>> plane_set_fb(154)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>> plane_set_size (3440x1440)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>> fb_set_position(0,0)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>> fb_set_size(3440x1440)
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>> plane data: A.2, fb 154
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "SRC_X" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "SRC_Y" to 0x0/0
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "SRC_W" to 0xd700000/225443840
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "SRC_H" to 0x5a00000/94371840
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "CRTC_W" to 0xd70/3440
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "CRTC_H" to 0x5a0/1440
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "FB_ID" to 0x9a/154
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>>>> "CRTC_ID" to 0x5b/91
>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: }
>>>> (kms_async_flips:3180096) CRITICAL: Test assertion failure function 
>>>> test_async_flip, file ../tests/kms_async_flips.c:361:
>>>> (kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
>>>> (kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
>>>> (kms_async_flips:3180096) CRITICAL: error: -22 != 0
>>>> (kms_async_flips:3180096) igt_core-INFO: Stack trace:
>>>> ****  END  ****
>>>> Dynamic subtest pipe-A-DP-1: FAIL (0.227s)
>>>>
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> Thanks!
>>>>>>
>>>>>>> Vitaly
>>>>>>>
>>>>>>>> Please add to Cc Vitaly from AMD:
>>>>>>>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>>>>>
>>>>>>>> Also add Jeevan here:
>>>>>>>> Cc: Jeevan B <jeevan.b@intel.com>
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Kamil
>>>>>>>>
>>>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>>>> ---
>>>>>>>>> v2: Add test description for GitLab compilation
>>>>>>>>> ---
>>>>>>>>>    tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++ 
>>>>>>>>> + + + +++----
>>>>>>>>>    1 file changed, 41 insertions(+), 4 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>>>>>>>> index 4a72be7b5..dd0907d50 100644
>>>>>>>>> --- a/tests/kms_async_flips.c
>>>>>>>>> +++ b/tests/kms_async_flips.c
>>>>>>>>> @@ -89,6 +89,9 @@
>>>>>>>>>     *
>>>>>>>>>     * SUBTEST: async-flip-suspend-resume
>>>>>>>>>     * Description: Verify the async flip functionality with 
>>>>>>>>> suspend and resume cycle
>>>>>>>>> + *
>>>>>>>>> + * SUBTEST: overlay-atomic
>>>>>>>>> + * Description: Verify overlay planes with async flips in 
>>>>>>>>> atomic API
>>>>>>>>>     */
>>>>>>>>>    #define CURSOR_POS 128
>>>>>>>>> @@ -109,12 +112,14 @@ typedef struct {
>>>>>>>>>        uint32_t crtc_id;
>>>>>>>>>        uint32_t refresh_rate;
>>>>>>>>>        struct igt_fb bufs[NUM_FBS];
>>>>>>>>> +    struct igt_fb bufs_overlay[NUM_FBS];
>>>>>>>>>        igt_display_t display;
>>>>>>>>>        igt_output_t *output;
>>>>>>>>>        unsigned long flip_timestamp_us;
>>>>>>>>>        double flip_interval;
>>>>>>>>>        uint64_t modifier;
>>>>>>>>>        igt_plane_t *plane;
>>>>>>>>> +    igt_plane_t *overlay_plane;
>>>>>>>>>        igt_pipe_crc_t *pipe_crc;
>>>>>>>>>        igt_crc_t ref_crc;
>>>>>>>>>        int flip_count;
>>>>>>>>> @@ -126,6 +131,7 @@ typedef struct {
>>>>>>>>>        bool allow_fail;
>>>>>>>>>        struct buf_ops *bops;
>>>>>>>>>        bool atomic_path;
>>>>>>>>> +    bool overlay_path;
>>>>>>>>>    } data_t;
>>>>>>>>>    static void flip_handler(int fd_, unsigned int sequence, 
>>>>>>>>> unsigned int tv_sec,
>>>>>>>>> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>>>>>>>>>        igt_output_set_pipe(data->output, data->pipe);
>>>>>>>>>        data->plane = igt_output_get_plane_type(data->output, 
>>>>>>>>> DRM_PLANE_TYPE_PRIMARY);
>>>>>>>>> +    if (data->overlay_path)
>>>>>>>>> +        data->overlay_plane = igt_output_get_plane_type(data- 
>>>>>>>>> >output, DRM_PLANE_TYPE_OVERLAY);
>>>>>>>>>    }
>>>>>>>>>    static void test_init_fbs(data_t *data)
>>>>>>>>> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
>>>>>>>>>            prev_modifier = data->modifier;
>>>>>>>>>            if (data->bufs[0].fb_id) {
>>>>>>>>> -            for (i = 0; i < NUM_FBS; i++)
>>>>>>>>> +            for (i = 0; i < NUM_FBS; i++) {
>>>>>>>>>                    igt_remove_fb(data->drm_fd, &data->bufs[i]);
>>>>>>>>> +                if (data->overlay_path)
>>>>>>>>> +                    igt_remove_fb(data->drm_fd, &data- 
>>>>>>>>> >bufs_overlay[i]);
>>>>>>>>> +            }
>>>>>>>>>            }
>>>>>>>>> -        for (i = 0; i < NUM_FBS; i++)
>>>>>>>>> +        for (i = 0; i < NUM_FBS; i++) {
>>>>>>>>>                make_fb(data, &data->bufs[i], width, height, i);
>>>>>>>>> +            if (data->overlay_path)
>>>>>>>>> +                make_fb(data, &data->bufs_overlay[i], width, 
>>>>>>>>> height, i);
>>>>>>>>> +        }
>>>>>>>>>        }
>>>>>>>>>        igt_plane_set_fb(data->plane, &data->bufs[0]);
>>>>>>>>>        igt_plane_set_size(data->plane, width, height);
>>>>>>>>> +
>>>>>>>>> +    if (data->overlay_path) {
>>>>>>>>> +        igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>>>>>>>> +        igt_plane_set_size(data->overlay_plane, width, height);
>>>>>>>>> +    }
>>>>>>>>>    }
>>>>>>>>>    static bool async_flip_needs_extra_frame(data_t *data)
>>>>>>>>> @@ -283,12 +302,17 @@ static bool 
>>>>>>>>> async_flip_needs_extra_frame(data_t *data)
>>>>>>>>>    static int perform_flip(data_t *data, int frame, int flags)
>>>>>>>>>    {
>>>>>>>>>        int ret;
>>>>>>>>> +    igt_plane_t *plane;
>>>>>>>>> +    struct igt_fb *bufs;
>>>>>>>>> +
>>>>>>>>> +    plane = data->overlay_path ? data->overlay_plane : data- 
>>>>>>>>> >plane;
>>>>>>>>> +    bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>>>>>>>>>        if (!data->atomic_path) {
>>>>>>>>>            ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>>>>>>>>> -                      data->bufs[frame % NUM_FBS].fb_id, 
>>>>>>>>> flags, data);
>>>>>>>>> +                     bufs[frame % NUM_FBS].fb_id, flags, data);
>>>>>>>>>        } else {
>>>>>>>>> -        igt_plane_set_fb(data->plane, &data->bufs[frame % 
>>>>>>>>> NUM_FBS]);
>>>>>>>>> +        igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>>>>>>>>>            ret = igt_display_try_commit_atomic(&data->display, 
>>>>>>>>> flags, data);
>>>>>>>>>        }
>>>>>>>>> @@ -772,6 +796,7 @@ igt_main
>>>>>>>>>            igt_subtest_with_dynamic("async-flip-with-page-flip- 
>>>>>>>>> events") {
>>>>>>>>>                data.alternate_sync_async = false;
>>>>>>>>>                data.atomic_path = false;
>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>                if (is_intel_device(data.drm_fd))
>>>>>>>>>                    run_test_with_modifiers(&data, 
>>>>>>>>> test_async_flip);
>>>>>>>>>                else
>>>>>>>>> @@ -783,6 +808,7 @@ igt_main
>>>>>>>>>            igt_subtest_with_dynamic("async-flip-with-page-flip- 
>>>>>>>>> events-atomic") {
>>>>>>>>>                data.alternate_sync_async = false;
>>>>>>>>>                data.atomic_path = true;
>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>                if (is_intel_device(data.drm_fd))
>>>>>>>>>                    run_test_with_modifiers(&data, 
>>>>>>>>> test_async_flip);
>>>>>>>>>                else
>>>>>>>>> @@ -793,6 +819,7 @@ igt_main
>>>>>>>>>            igt_subtest_with_dynamic("alternate-sync-async-flip") {
>>>>>>>>>                data.alternate_sync_async = true;
>>>>>>>>>                data.atomic_path = false;
>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>                run_test(&data, test_async_flip);
>>>>>>>>>            }
>>>>>>>>> @@ -800,7 +827,17 @@ igt_main
>>>>>>>>>            igt_subtest_with_dynamic("alternate-sync-async-flip- 
>>>>>>>>> atomic") {
>>>>>>>>>                data.alternate_sync_async = true;
>>>>>>>>>                data.atomic_path = true;
>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>> +            run_test(&data, test_async_flip);
>>>>>>>>> +        }
>>>>>>>>> +
>>>>>>>>> +        igt_describe("Verify overlay planes with async flips 
>>>>>>>>> in atomic API");
>>>>>>>>> +        igt_subtest_with_dynamic("overlay-atomic") {
>>>>>>>>> +            igt_require(is_amdgpu_device(data.drm_fd));
>>>>>>>>> +            data.atomic_path = true;
>>>>>>>>> +            data.overlay_path = true;
>>>>>>>>>                run_test(&data, test_async_flip);
>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>            }
>>>>>>>>>            igt_describe("Verify that the async flip timestamp 
>>>>>>>>> does not "
>>>>>>>>> -- 
>>>>>>>>> 2.47.1
>>>>>>>>>
>>>>
>>>>
>>>
>>
>>
> 


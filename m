Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8102DC54749
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 02:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4359510E430;
	Wed, 28 Aug 2024 02:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rOaBnROy";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DD710E430
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 02:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVtBLq1NVVkILjhEJwP/G1aLnHt3S5wqovHTTLxbL0rqhErhkRQfQDQ6fic3+WJsa5AfEzKtUMmYJSGYuvP4FjHWbSQE7KSJ3AV4+zfENn4TaVThgtFpa+GNbRJSDNK+RTtizrElTA04LEnBPaFAHg+5B2ircboewWtF3VmxRarUp1oeljG2VJcnZRCQ3m2pJWUxk5rgwmeBZ1Bg+j0JzwNQn50+UHveURjnG9DeBIXw+s3LS1gnQ6men2iCVJAw7b2oq8uxqKg/vcY14NZybyAGFxxxtt7XuvyR5RlU9rdpqG+AAMqqs9LquwcUqhzux/Qbs0OUOuW5Wo17RtRaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzhEq/usP38M8/A6fxQz7erO8B2fWqZUhmKotyeJyg0=;
 b=vhWkstup5dNyL/dRvGGvSG4L1UzVhIELXalEd99w29fthoRXM+UrdTV6QS8bFlnUhh56YNLccQtgGjwajxJy81EtiN3XX/2V0pSQODIGAd3NTl14i6djAVbqiXZFuQP8XAjrD28n5C/gprw9k2gGJPbzlqGlDMZEA8Je/zMegFftDiHO/+kdKEAPRUupmfsiAXZXXXe5vlDF6ihqLFffyaIZiYrPfqDcZzNZ8T/BsgmVRptyEs712q7yKvSt55Jrpi7J/bOn7BnH5OYUjsosoGwBbiZWKq7n9Ts4xrqVq8SMXrmDU5Zdj3hl9ciWMH2bNRbLLPfeFDSYcVmjQhq3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzhEq/usP38M8/A6fxQz7erO8B2fWqZUhmKotyeJyg0=;
 b=rOaBnROy5Jj+Kc+U72HnKBvw4NUAz3CzplNsFbm1LZguVdH5TBLJ9ygYDVUt4r+b3exZLVAfGQWa1NLIWEQPernq0tqHCFa6FSfSwT/qSCStDCKmIj/1i+ibibSnZd+Bo0Qz8Y+zJ0eWZXm1PYN/1lL+D31LrpsKCSraPt9OSsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB7281.namprd12.prod.outlook.com (2603:10b6:510:208::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 02:05:57 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 02:05:57 +0000
Content-Type: multipart/alternative;
 boundary="------------TqCIPJNoT14qCfZ7OrbIBUti"
Message-ID: <d2ff19f7-cc37-416e-b789-f7c1e2903d13@amd.com>
Date: Tue, 27 Aug 2024 22:05:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu queue
 test
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20240827051932.74382-1-jesse.zhang@amd.com>
 <20240827072407.hqiwzgxsmhipdgyd@kamilkon-DESK.igk.intel.com>
 <DM4PR12MB5152CD509AA9B6B9A0B1E7FAE3942@DM4PR12MB5152.namprd12.prod.outlook.com>
 <b19ad831-f022-4d2a-b3bb-e786a43e771a@amd.com>
 <DM4PR12MB5152F4675A22C9079370877AE3952@DM4PR12MB5152.namprd12.prod.outlook.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <DM4PR12MB5152F4675A22C9079370877AE3952@DM4PR12MB5152.namprd12.prod.outlook.com>
X-ClientProxiedBy: YQXP288CA0014.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::41) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 9691a7e8-a536-4191-486c-08dcc705f4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmgzaEpjV2ZxSlNuT2hqOU1wWWFwekZOS2M2NzdnRUFJYTJqdWxLTTM2aUFu?=
 =?utf-8?B?dnppL0duZ2diRFdHRUhpWkloZkgxbGgyMnZWVzZiZDhzZjBkaTRRbEVxc3lT?=
 =?utf-8?B?c21jcHAwcWJOcU5WYXU0ck5ydVJOT1pmVkt4dkNjUWNNKzRqYmtnYWhmTnJN?=
 =?utf-8?B?MzdtSlkxaE8zZE8yM2c5SXVXcFR3OXJGdkM5SnZleEd4RkJrU0VOS2dmTkFw?=
 =?utf-8?B?NDVieUJYWTd0c1NCM2hPTXVUZ1p4NXNvWnI1RWhINjBSbWlDL0RycnJxeS8z?=
 =?utf-8?B?QVo3dDU4Ly9OWnFxdU9PR28zTVdBYjY0VTlZVXdsWUpid3FhVGxiY2tKLzBh?=
 =?utf-8?B?bWlvYml2Sld5cXlBK29KT2pqeEZCcU43RXRIaUFoMEttRTBtZGMvOEFWVUw3?=
 =?utf-8?B?Z1hGQ1dpMERJaVRCdWpqZ0w0a3R6T1VoZHVWOS9BbGxEYXpyWVp6NWJzOHJG?=
 =?utf-8?B?dkRENnJWRVFUeXNZeEsvbWlXMHBKMmE4Wkw2OXEyWUY1aG1hdFd3REdZMis3?=
 =?utf-8?B?WmZLRVJnOHBtNFRoWkJxS3gvcEE2R2hzUWNNVDFvSUthRitkcHJqendwb1gz?=
 =?utf-8?B?R0JqZXJYQ1pIUjZCeGwvM0ZsMkxMQ3lUdXI5ZU55dmFBT215ZklHSU53eERu?=
 =?utf-8?B?OVF0dEpIOUN2ZTVpbm9KQmorRVJpaU5BbHMxM0ttNldsYWkyNC91Wis3YWdl?=
 =?utf-8?B?T1JobjlBQktoZnVoaEJKMVV5MkdmZjJxVVI4bFRQOWlPbjFkMGtxcVhHa21J?=
 =?utf-8?B?NDhwMWhaQlRXc1dBbzdxamFWQTlvd3I5U2JxZExyNHNId2hZT013bFdyVStm?=
 =?utf-8?B?d1gxV2JJSU05SlIxamRsaFF6RFpyZ1lFTDV3NnNxc0szaHhSalF0d2tzOHlE?=
 =?utf-8?B?U2kxek9pNi9CQ0xIcGFqVXRrYnhrZ0ZJTHZBeWJsd1FzcHJYSk5ucThPWVFS?=
 =?utf-8?B?ZWJROThqSDdFRzNndEduZXR3WU9LeC91cVpSWGVPbVEvaGVzTTgydFB0a2FZ?=
 =?utf-8?B?YVJ5UEFDaFp2b3MwdjJBUFJvREF3S0xTeDNUTDFWZFc5cUExay8vY0trSlo1?=
 =?utf-8?B?V25sbC9RazZpbUJaVjRxTlFmd2pxYjRRbzdPSm94aWtGT0IxcWxhcEpCU0cw?=
 =?utf-8?B?ZlM3WDBKQ0xUOTNhSTNUVkoxM2dNcVlyem9zNFU4eWJ2b3pDTmk0VC82ejFl?=
 =?utf-8?B?S0dJOWNVbVlLNXpWaTRXR1VUQmpWVGg5eUFJemZadE9YTlNlampqejhEa3ht?=
 =?utf-8?B?WkdlZ2M5QWN5R3lYWWtVbkRHcnRrT1JJNkk4eGs1eU82MXkxc0hxZStUcU5P?=
 =?utf-8?B?dWpiSjZBRDYwd1pra29maVVxc0dubmphOEtIMk1GNjM1N0hCUVJoWDkrc3Z5?=
 =?utf-8?B?M2thZHV2bytqQ2llZ2pqQVY5R3N0MG80ckZLSXEwZHpqRWJiN2hqVmEzZDhM?=
 =?utf-8?B?dTFtdzN0YWVFOE5QeFM2WkxaL0J6ZFUySlBEWDNPQ3doSUhoVEFLNkNieFhM?=
 =?utf-8?B?L1VBdnhrSkJRZzI2TGR1eG13WVFXOW0zQjRBWUkvRDJkSDAwamkwYmhaVGNq?=
 =?utf-8?B?UkhPUVZQMm5oM294L2lEclBUNURGVGJPQUlmaUc1Z3ZNLzR2SnQxVHFPelZP?=
 =?utf-8?B?OWlGR0RhTUVCS2hEV2JKNktwS2xRdTNQTzZlTzdUUmZIQURUenFRQW1BMlRk?=
 =?utf-8?B?ZElvUzRWSFdtdEpNb1M5cCtjNEsxZHBXNy9ETHlxaGlyQ2FoV0tKb2Q2L1BD?=
 =?utf-8?B?OTJydTNkQ3gzUkdrU1hDendXbU4zek5nSFU1a0o5MVhvaFF2NmRubm9MbUZI?=
 =?utf-8?B?RGxERVBuUUtORzV6MG9KZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzlXaHRtUklCQkFsNjE4N2l3em04aE8wN3l3RzI5RmJJQWRuTVljMGlPVXNN?=
 =?utf-8?B?Z29OK2NwMjFOeHRTMjlFNGMvSUs2dGVWdndjcUZCL29lV3lpM3FWRm5aZE1r?=
 =?utf-8?B?TnZJTld1UzNGVzdqb2VJYnBNL3U3dCt5Tm93VHhmQmZzb2orbDVXQ0VBR0p2?=
 =?utf-8?B?S0svQjVqb1diVHRpUTBhVzk1bTU0djFDVDhNdmxONlF4T1VRY2xOY1dHbXI2?=
 =?utf-8?B?M1BkYUJJYzZNUjVDSEordU9VczdRMGJFZ2dxU1hpN3E4dWdFUEV4clZhdjdD?=
 =?utf-8?B?UkxNeiswUmJkM3hZTXVHcXJhYUpZb0IyNE5jalB1aVlwQ1U1OWxwbnE3Qlpj?=
 =?utf-8?B?YWlrQmZIb3JETzV3dlFUNWVSb2toUDRNUjdwT3BuZ1N1TkMrd0pBWVpwUXdP?=
 =?utf-8?B?bHByem15K2lvTis5YkRyMVZubWFlbTFzR012R3ZqUllhZi9XRXRPaG9PTk4r?=
 =?utf-8?B?TXBmdjBrWlJYalUrYk56b0RraWRZWmhXWWVhdVNNdzI3bW9EeWYxWGNYZlgw?=
 =?utf-8?B?MDM1MmJ3Y1kxTHMzZVdXaFVmVDNOYjRCQi9TUXQ3RDRzNVJuMWpLSUxNRUZE?=
 =?utf-8?B?Z0J0d0JlOVlYQ3hTMGIzZzA0a00rNlh0V095VkdwelU2UGQyc3k1YlpvOW91?=
 =?utf-8?B?TEpWRGlKQno2QmVzREFvVGFiV2QwNW54Y2hFNWN3ZmxzS1ZSWE5ScGlyTVZW?=
 =?utf-8?B?d1V2SWM4SHlhN2tBSnhjaEZyV0dxbWpoMloyZllCMkpEZVlhTDVScmZhaXdy?=
 =?utf-8?B?ZmxwT2U1djlOSVBUZkdoN0VGN3c2THpQOWtZM2k0U2JkTm1Db0QyN1lxMnRU?=
 =?utf-8?B?WXBpSm4vekRrMHR6TjJQRk5ocm9uTEs2ZXptdGxrVEUwM0JwU2VPSEtGU3Bk?=
 =?utf-8?B?TU5ObVVSa3RleEt6cVhiaEMrdTN2bHVqcjB6c2g3Nms5YmlSWDIwTFFwUldi?=
 =?utf-8?B?V0NNSlV3WnR1c0RmT24zRUd6Wm1hNllyZTg3V1Q2M1QyRkZaSzQxWmx5ZHp4?=
 =?utf-8?B?Qkw4azM4YllZb3F0Vmxaa2hYcFpSUnorVjVHa1hGWllpR1VibWhXY0ErZUkw?=
 =?utf-8?B?TlYrcVg0UnkzaXZsR0pRdzQ5NWRTcUM1Rm16TTNMNEFzNWV5bzJaUkhlcG1C?=
 =?utf-8?B?RnVEaWNCMlJBZmtmTmpISWx6ZDJ1S2VuSGJoem1xR0tXWEJucUxQdjhTRDc5?=
 =?utf-8?B?Q0RoN3BpZ3RMamppTFRjM1NtNXEwNWtocnpYbkVBMlVRYjY4NXpMdnJKaEJQ?=
 =?utf-8?B?UUs1d2lNcUhuS2lOYjZDOFdLcE9HQlpaUzEwWDNPM3hSeHFESDVVbG95M0Qz?=
 =?utf-8?B?ZXd4WEYwMkJSUlQvL3g0bmNSSDFmRUVGRVlaRnVNdEpUL3JOQUpxRUlpLzdZ?=
 =?utf-8?B?QjdrUlQ4Q3YvSjUxN2ZIL2VFa2RhVnNJaU1WVUZaQUt1ZVgvdGpxbTJvMlZU?=
 =?utf-8?B?VFpEWk9VVUh0WVRmT3BFdU5JZUN6QXh0WENSOXo0c3hrUFlsWkhNd2VqUzJ6?=
 =?utf-8?B?ekY4czZ4alZaNEZMUkMweVp4TmpiUmZPYnU2aXZObzFGc28wMndCRGVpVUNz?=
 =?utf-8?B?bVREelpFM214SnRnUGJZMUhBeUtJMGIrUEVhYzYxYVVlM1NSWUpQZVl3YU9Z?=
 =?utf-8?B?Wk1aak0rcTJGaHlQTWp1K203enJ1V1FuU1RFUWlCNS8wdG5KZXBjNE9BWnVh?=
 =?utf-8?B?SEdzSS9RaXZzNEVxYVpLQmJmajkrcWZlcG9LY1dJTGlqYXhQMmpTR29LR1ZO?=
 =?utf-8?B?cXQ4SkRjUENQa0xTK0NlVFQ3OHhvT3dkcEFRU3VFajF3ZTMyYW9ockp6U0dS?=
 =?utf-8?B?aGdpYnJ4SXZnVXRVTzlEbnlYWjIvbC9tMUJDUmpsbEJzbjA1eGZ1SEMvV0Nl?=
 =?utf-8?B?eEM5ekJuYWdranZRSlVyZC9USzk3MlBVYXRaQ1FlU01XTTY2WDhvclBvOHZk?=
 =?utf-8?B?YVp6SjZFK2JJSTRpbVFWMTdjV0dhaXFqcG1xQXE3SjNmdG9VYzFpUWxIRjVp?=
 =?utf-8?B?Z1NNalNYTTZETE9ZSkR2c1Rockt5RlNXdGIxa0pGNU9iNGk2dVlITlh6Y0FD?=
 =?utf-8?B?NDRQYWkwdWNqK2xrdlVpUlB5cVY2eGMrNDVQUTI0cm5BNDZPNEpBcFlHUnQ3?=
 =?utf-8?Q?SQx5otCHmNl+VRwcjX6cQAQO5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9691a7e8-a536-4191-486c-08dcc705f4b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 02:05:57.5965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHATF1zytJQQuHVYtHBQpsY4j86EibbRBEIOAUhzy65pmQIGP0NHgvT4rR0MqUD8HKwOoGSOkRnz/v1uNnuzpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7281
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

--------------TqCIPJNoT14qCfZ7OrbIBUti
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks for catching this! You're correct; I've reverted my request to remove |sh_mem != NULL| since the |igt_fixture| isn't executed when the |--list-subtests| parameter is passed. I'll merge the changes tomorrow. Thanks again!


Vitaly

On 2024-08-27 22:00, Zhang, Jesse(Jie) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Vitaly,
>
> -----Original Message-----
> From: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> Sent: Wednesday, August 28, 2024 9:51 AM
> To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: Re: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu queue test
>
> Hi Jesse,
>
> The changes look good.
>
> Could you please remove the condition check for sh_mem? This check is redundant because we already have igt_require(sh_mem != NULL); in the igt_fixture.
>
>
> when we run sudo ./tests/amdgpu/amd_queue_reset --list-subtests, the sh_mem is NULL, and it should not call set_next_test_to_skip.
>
> if remove the check for sh_mem, it will have segmentation fault, like this:
>
> jenkins@image-update:~/workspace/tools/igt-gpu-tools/6code/igt-gpu-tools/build$ sudo ./tests/amdgpu/amd_queue_reset --list-subtests
> amdgpu-COMPUTE-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH
> amdgpu-COMPUTE-CMD_STREAM_EXEC_INVALID_OPCODE
> amdgpu-COMPUTE-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR
> amdgpu-COMPUTE-BACKEND_SE_GC_SHADER_INVALID_USER_DATA
> amdgpu-COMPUTE-BACKEND_SE_GC_SHADER_INVALID_SHADER
> amdgpu-GFX-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH
> amdgpu-GFX-CMD_STREAM_EXEC_INVALID_OPCODE
> amdgpu-GFX-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR
> amdgpu-GFX-BACKEND_SE_GC_SHADER_INVALID_USER_DATA
> amdgpu-GFX-BACKEND_SE_GC_SHADER_INVALID_SHADER
> Received signal SIGSEGV.
> Stack trace:
>  #0 [fatal_sig_handler+0x17b]
>  #1 [__sigaction+0x50]
>  #2 [__igt_unique____real_main1025+0x27e]
>  #3 [main+0x2d]
>  #4 [__libc_init_first+0x90]
>  #5 [__libc_start_main+0x80]
>  #6 [_start+0x25]
> Segmentation fault
>
> Thanks
> Jesse
>
> With that adjustment, the patch is:
>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Thanks
>
>
> Vitaly
>
>
>
>
> On 2024-08-27 03:54, Zhang, Jesse(Jie) wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hi Kamil
>>
>> -----Original Message-----
>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Sent: Tuesday, August 27, 2024 3:24 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Prosyak, Vitaly
>> <Vitaly.Prosyak@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>
>> Subject: Re: [PATCH i-g-t] test/amdgpu: fix unknow test issue for
>> amdgpu queue test
>>
>> Hi Jesse.zhang,
>> On 2024-08-27 at 13:19:32 +0800, Jesse.zhang@amd.com wrote:
>>> Queue reset does not exit properly when executing unknown subtests.
>>> Because other processes are still functioning.
>>>
>>> It should exit the other three processes (test, background, and
>>> monitor) for this case.
>>>
>>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>
>>> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
>>> ---
>>>  tests/amdgpu/amd_queue_reset.c | 10 ++++++++--
>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/amdgpu/amd_queue_reset.c
>>> b/tests/amdgpu/amd_queue_reset.c index 60208e085..85408e3ff 100644
>>> --- a/tests/amdgpu/amd_queue_reset.c
>>> +++ b/tests/amdgpu/amd_queue_reset.c
>>> @@ -70,6 +70,7 @@ struct shmbuf {
>>>       int count;
>>>       bool sub_test_completed;
>>>       bool sub_test_is_skipped;
>>> +     bool sub_test_is_existed;
>>>       unsigned int test_flags;
>>>       int test_error_code;
>>>       bool reset_completed;
>>> @@ -148,6 +149,7 @@ skip_sub_test(struct shmbuf *sh_mem)  {
>>>       sem_wait(&sh_mem->sem_state_mutex);
>>>       sh_mem->sub_test_is_skipped = true;
>>> +     sh_mem->sub_test_is_existed = true;
>>>       sem_post(&sh_mem->sem_state_mutex);
>>>  }
>> Do you re-implement igt infra?
>>
>> Hi Kamil
>>
>> No, in the queue reset test, we start three processes (test process,
>> background process, and monitoring process) when running any test (including unknown tests, such as such as:  sudo amd_queue_reset --run-subtest amdgpu_testxxx).
>>
>> The known process can exit with the other three processes.
>>
>> The unknown process can exit, but the other processes will not exit.
>>
>> This patch fixes the issue of other processes exiting in the unknown case.
>>
>> Regards
>> Jesse
>>
>> Regards,
>> Kamil
>>
>>> @@ -327,6 +329,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
>>>       sh_mem->good_job.ip = ip_good;
>>>       sh_mem->good_job.ring_id = ring_id_good;
>>>       sh_mem->sub_test_is_skipped = false;
>>> +     sh_mem->sub_test_is_existed = true;
>>>       sem_post(&sh_mem->sem_state_mutex);
>>>
>>>       //sync and wait for complete
>>> @@ -405,6 +408,7 @@ shared_mem_create(struct shmbuf **ppbuf)
>>>       shmp->sub_test_completed = false;
>>>       shmp->reset_completed = false;
>>>       shmp->sub_test_is_skipped = false;
>>> +     shmp->sub_test_is_existed = false;
>>>
>>>       *ppbuf = shmp;
>>>       return shm_fd;
>>> @@ -1128,7 +1132,6 @@ igt_main
>>>                       create_contexts(device, &arr_context_handle, const_num_of_tests);
>>>               else if (process == PROCESS_BACKGROUND)
>>>                       fd_shm = shared_mem_open(&sh_mem);
>>> -
>>>               igt_require(fd_shm != -1);
>>>               igt_require(sh_mem != NULL);
>>>
>>> @@ -1136,7 +1139,6 @@ igt_main
>>>                       process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
>>>                       &monitor_child, &test_child);
>>>       }
>>> -
>>>       for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
>>>               reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
>>>               for (struct dynamic_test *it = &arr_err[0]; it->name;
>>> it++) { @@
>>> -1154,6 +1156,10 @@ igt_main
>>>                       }
>>>               }
>>>       }
>>> +
> Please, remove
>
> sh_mem
>
>>> +     if (sh_mem &&( !sh_mem->sub_test_is_existed))
>>> +             set_next_test_to_skip(sh_mem);
>>> +
>>>       igt_fixture {
>>>               if (process == PROCESS_TEST) {
>>>                       waitpid(monitor_child, &monitorExitMethod, 0);
>>> --
>>> 2.25.1
>>>
--------------TqCIPJNoT14qCfZ7OrbIBUti
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Thanks for catching this! You're correct; I've reverted my
      request to remove <code>sh_mem != NULL</code> since the <code>igt_fixture</code>
      isn't executed when the <code>--list-subtests</code> parameter is
      passed. I'll merge the changes tomorrow. Thanks again!</p>
    <p><br>
    </p>
    <p>Vitaly<br>
    </p>
    <div class="moz-cite-prefix">On 2024-08-27 22:00, Zhang, Jesse(Jie)
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DM4PR12MB5152F4675A22C9079370877AE3952@DM4PR12MB5152.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">[AMD Official Use Only - AMD Internal Distribution Only]

Hi Vitaly,

-----Original Message-----
From: Prosyak, Vitaly <a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>
Sent: Wednesday, August 28, 2024 9:51 AM
To: Zhang, Jesse(Jie) <a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a>; Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Prosyak, Vitaly <a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>; Deucher, Alexander <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>
Subject: Re: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu queue test

Hi Jesse,

The changes look good.

Could you please remove the condition check for sh_mem? This check is redundant because we already have igt_require(sh_mem != NULL); in the igt_fixture.


when we run sudo ./tests/amdgpu/amd_queue_reset --list-subtests, the sh_mem is NULL, and it should not call set_next_test_to_skip.

if remove the check for sh_mem, it will have segmentation fault, like this:

jenkins@image-update:~/workspace/tools/igt-gpu-tools/6code/igt-gpu-tools/build$ sudo ./tests/amdgpu/amd_queue_reset --list-subtests
amdgpu-COMPUTE-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH
amdgpu-COMPUTE-CMD_STREAM_EXEC_INVALID_OPCODE
amdgpu-COMPUTE-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR
amdgpu-COMPUTE-BACKEND_SE_GC_SHADER_INVALID_USER_DATA
amdgpu-COMPUTE-BACKEND_SE_GC_SHADER_INVALID_SHADER
amdgpu-GFX-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH
amdgpu-GFX-CMD_STREAM_EXEC_INVALID_OPCODE
amdgpu-GFX-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR
amdgpu-GFX-BACKEND_SE_GC_SHADER_INVALID_USER_DATA
amdgpu-GFX-BACKEND_SE_GC_SHADER_INVALID_SHADER
Received signal SIGSEGV.
Stack trace:
 #0 [fatal_sig_handler+0x17b]
 #1 [__sigaction+0x50]
 #2 [__igt_unique____real_main1025+0x27e]
 #3 [main+0x2d]
 #4 [__libc_init_first+0x90]
 #5 [__libc_start_main+0x80]
 #6 [_start+0x25]
Segmentation fault

Thanks
Jesse

With that adjustment, the patch is:

Reviewed-by: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

Thanks


Vitaly




On 2024-08-27 03:54, Zhang, Jesse(Jie) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">[AMD Official Use Only - AMD Internal Distribution Only]

Hi Kamil

-----Original Message-----
From: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Sent: Tuesday, August 27, 2024 3:24 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Zhang, Jesse(Jie) <a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a>; Prosyak, Vitaly
<a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>; Deucher, Alexander
<a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Koenig, Christian
<a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>
Subject: Re: [PATCH i-g-t] test/amdgpu: fix unknow test issue for
amdgpu queue test

Hi Jesse.zhang,
On 2024-08-27 at 13:19:32 +0800, <a class="moz-txt-link-abbreviated" href="mailto:Jesse.zhang@amd.com">Jesse.zhang@amd.com</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Queue reset does not exit properly when executing unknown subtests.
Because other processes are still functioning.

It should exit the other three processes (test, background, and
monitor) for this case.

Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>
---
 tests/amdgpu/amd_queue_reset.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c
b/tests/amdgpu/amd_queue_reset.c index 60208e085..85408e3ff 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -70,6 +70,7 @@ struct shmbuf {
      int count;
      bool sub_test_completed;
      bool sub_test_is_skipped;
+     bool sub_test_is_existed;
      unsigned int test_flags;
      int test_error_code;
      bool reset_completed;
@@ -148,6 +149,7 @@ skip_sub_test(struct shmbuf *sh_mem)  {
      sem_wait(&amp;sh_mem-&gt;sem_state_mutex);
      sh_mem-&gt;sub_test_is_skipped = true;
+     sh_mem-&gt;sub_test_is_existed = true;
      sem_post(&amp;sh_mem-&gt;sem_state_mutex);
 }
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Do you re-implement igt infra?

Hi Kamil

No, in the queue reset test, we start three processes (test process,
background process, and monitoring process) when running any test (including unknown tests, such as such as:  sudo amd_queue_reset --run-subtest amdgpu_testxxx).

The known process can exit with the other three processes.

The unknown process can exit, but the other processes will not exit.

This patch fixes the issue of other processes exiting in the unknown case.

Regards
Jesse

Regards,
Kamil

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">@@ -327,6 +329,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
      sh_mem-&gt;good_job.ip = ip_good;
      sh_mem-&gt;good_job.ring_id = ring_id_good;
      sh_mem-&gt;sub_test_is_skipped = false;
+     sh_mem-&gt;sub_test_is_existed = true;
      sem_post(&amp;sh_mem-&gt;sem_state_mutex);

      //sync and wait for complete
@@ -405,6 +408,7 @@ shared_mem_create(struct shmbuf **ppbuf)
      shmp-&gt;sub_test_completed = false;
      shmp-&gt;reset_completed = false;
      shmp-&gt;sub_test_is_skipped = false;
+     shmp-&gt;sub_test_is_existed = false;

      *ppbuf = shmp;
      return shm_fd;
@@ -1128,7 +1132,6 @@ igt_main
                      create_contexts(device, &amp;arr_context_handle, const_num_of_tests);
              else if (process == PROCESS_BACKGROUND)
                      fd_shm = shared_mem_open(&amp;sh_mem);
-
              igt_require(fd_shm != -1);
              igt_require(sh_mem != NULL);

@@ -1136,7 +1139,6 @@ igt_main
                      process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
                      &amp;monitor_child, &amp;test_child);
      }
-
      for (int i = 0; i &lt; ARRAY_SIZE(ip_tests); i++) {
              reset_rings_numbers(&amp;ring_id_good, &amp;ring_id_bad, &amp;ring_id_job_good, &amp;ring_id_job_bad);
              for (struct dynamic_test *it = &amp;arr_err[0]; it-&gt;name;
it++) { @@
-1154,6 +1156,10 @@ igt_main
                      }
              }
      }
+
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Please, remove

sh_mem

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+     if (sh_mem &amp;&amp;( !sh_mem-&gt;sub_test_is_existed))
+             set_next_test_to_skip(sh_mem);
+
      igt_fixture {
              if (process == PROCESS_TEST) {
                      waitpid(monitor_child, &amp;monitorExitMethod, 0);
--
2.25.1

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------TqCIPJNoT14qCfZ7OrbIBUti--

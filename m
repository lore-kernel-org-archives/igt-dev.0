Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0BAEF06E2
	for <igt-dev@archiver.kernel.org>; Sun,  8 Feb 2026 04:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E652910E113;
	Sun,  8 Feb 2026 04:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mJmsX5He";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BF510E113
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Feb 2026 04:29:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVvyKHZ4zUcabxJjvGLMRnyRO2aLjfAj4nZJ8SeBFdnxclcgR7p5AsOhCECAKhcY/p6Rc400/c1K3z0wrN3GfFnFhVuRX4UiSt5rg4J9Sxw7ufJjEogc+bap2MAJkXDrKrJTrAZbuFJ4b5E/R1Lb5qQBFuWY9ru/RrO6cgBpu3fw4hVDiYRF++I17InUGSx2upFzyXRxVhF5LLWJtEJOwQIMFSJ/JDgLqxIMCi84/NdyY8uwaJV40aLhVHAO/rSftatB1+rO7H57+sSXt/rpc1Hv0HIWdTBqW8/eCSGe8Rhi2Wp85uw/0hCpoUFyNRTMI5rojYRROBHtsERBhMxycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JXEDuFLBXb1e3lpL/ItllNeJoKy6SF4CCFyqGZYaz4=;
 b=kN0M17UYYjNK0bHnLIZMxu4LQaSIkD3+8yt+bknaTuNwXAPPQvQO5nAAXsdMe+CUD1wOgEB0/iHQ1dVXrPMoJwe9kWui8+aOVLJBPJq3lE+IfEyT+9wcFDAxnaD5UiMnBnN29j1/md2DOnEIakg3DV9mcPSpfgqvEbNvUlslcmKkTfp9RoSbMP0MaAg7hiW09rA45Lphe85rEOAsJDCyVrsbluvTIOxacenT4VJRQMEaxWSUyBHF4YKpSpBIY/oS3pKqdNTX4x3sSak10j1bqWEiDOjXmKQfsIyJMKkwsQjRPeKm4sVe+0p1uooHpPpmJw+KV7dD21EuvUaLMcVlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JXEDuFLBXb1e3lpL/ItllNeJoKy6SF4CCFyqGZYaz4=;
 b=mJmsX5HebUSmD+rAs0cEoFemq09T5j+osjF4Imm8tn/2aYayuHVeL8r4fG8BH8p6x7FhzEXEdQH0AbxONyS0+q4F3+lnJVtuKOFMqAZRxJGJ044Xx9O/QY49yGNmSuc7c041ORq22nV5uga9WPl5l8aesWQJesrL1GcYWMXLOHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Sun, 8 Feb
 2026 04:29:03 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9587.017; Sun, 8 Feb 2026
 04:29:03 +0000
Message-ID: <90eb362d-7f46-49a0-8ed3-78665de8ba3d@amd.com>
Date: Sat, 7 Feb 2026 23:28:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu/amd_jpeg_shared: Fix JPEG decode on VCN 5.x
 with correct register offsets
To: Tessita Thomas <Tessita.Thomas@amd.com>, igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com
References: <20260206095617.453868-1-Tessita.Thomas@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260206095617.453868-1-Tessita.Thomas@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::8) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c99e016-9502-4a1a-8e62-08de66ca96a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEdxNDk5SFNqUlJBc3lrK00wYUJvZzd3dmtiemx1Tm5CUHF6WVhVUW5WNHph?=
 =?utf-8?B?dEkyQUZaK2xTUll6cE9aMDNPUFFtc2tPQWhBMmFmRENGUGQyTk5uMEE0aDBQ?=
 =?utf-8?B?U0QrcEdISCtXUU9vRk5MdDVBc04xM2E0NDl6NWRrU0ZhZ0hPWjJqZmVpNUw4?=
 =?utf-8?B?NXluOG5ucXhlTUUzcmpvZVZNMU84OXQ4Q2RFeGNHTWdLR3hCODNhdVREUXQw?=
 =?utf-8?B?SVUwNlJuN2twelJIMWs3L3p3NEpJTUNxeDRyQzlkSVNnQ3ZSTjVlMDA2SjJK?=
 =?utf-8?B?TUNjNVFiL2FYYUFqb0RsTlJrcGZPMkE1TGMwcjE3NlFZamdSWkl3T1hkTExp?=
 =?utf-8?B?cmdDajVHNE91alZabTdVdWFNdFFtMlZKd3JaT3JXRGNoajM3ZDZoeXZQQmhj?=
 =?utf-8?B?a2IyLzZxOC9IMHhmUXJjMWdGTkt1eXlmVzBzcUtLVlhMT05JV1NkVDZ4WGtt?=
 =?utf-8?B?VWZIWFIzK3kzUjRuZXU3VUR6aDI0UFBoQndDdzFhSTVFdGtZZCtUOGdpRVhD?=
 =?utf-8?B?bi9DbW5EWjk4ekVISUNPKzl0aWsxWVJxeHZtTnBoaCtNWTgxaUtpRnBSbGZj?=
 =?utf-8?B?VWFjNEhsSkJnWFNwdjdyVnBWRTlRRkt0djlmMGRLbHFWTkdXNVM4UXlaQnhO?=
 =?utf-8?B?b1RvNjlxNitEandLT1lRN2IvR3dSK1UrVTVaSWRBejFvdHVGWDVDdFk5TkR0?=
 =?utf-8?B?N2xOSksvMTFhdlFMWmdVZUhSV1U4WUxXMHgrNU9pbDlvbzJXUGFZUmpPNHVJ?=
 =?utf-8?B?d3NXWVVCV3RNOUFhNWw3ckFiZytBMHZBM1pWNkFQV2lxZWRhZGx5cmlMSEJO?=
 =?utf-8?B?VjRZYlRobFFTaWg5dXdYUHRaNC9zblV0WlVqR3B4bXhDNCtOa0JIMDl2SWV4?=
 =?utf-8?B?UkhHMllNc21BZ1QxV04xQ25PdjZlNnpzQXR0WjQwVGJUNUpnU1h4TjVwdGMy?=
 =?utf-8?B?QkVaSkV3MmVUeUZ5Mis0aU5tMnhSbEpoTll6NTNldEdVRnRJekNES2MxVTlm?=
 =?utf-8?B?NHViT2hEWTNZU295eDI0Vm4rN2lEckdSMDdmdXlmeEhhSFNWWktNblc2Z1d5?=
 =?utf-8?B?d1pVSmdMQWttR1QwT3VtcTFhK1ExdFNydDdKRkRlMzRzWTVKRVF1Q1daUmRj?=
 =?utf-8?B?Q0pBT0tiNFJwK1l6L0gzcGsxZkR0T0Z0cFhTRkN6U2p5NjFBNzF2ck8zWmtl?=
 =?utf-8?B?MHMzcGxJY0hRelhmQmM5UkF0NE9ob203VFNlMTdWcDNBbDJOTndHelNiRWts?=
 =?utf-8?B?VzNjSlVmQjZWVEJ0c1pmem9YV3BEdDhiSW1NWktMRnNoaGIzVmtTa2tHekRs?=
 =?utf-8?B?T1QydkNoK2hyRE5JcU1VL1RzN3BEamJNMGhKUGhjckhhY2ZsVEtLQS9ua0JY?=
 =?utf-8?B?WkEzYjNrMDc0Zld3M2lYZjg4MmIxTHhOL0F3TUROUDJac1BENkZPVGJqbG91?=
 =?utf-8?B?RzVscXpRdjNhdEJVTW1LOFFqV3d1RDBSTjJySHljVE9MdDR0TmFKREFWdTlo?=
 =?utf-8?B?Y051K29VZys2SGUrZ3JaNmJEaUV2L05yVXJDZFIxc0V3L0psTHpKVkhUYUQx?=
 =?utf-8?B?dk5mK2xnWHRoaENrZTNqamVUUHVyY253RUlRNW1pQy8yUlcweUttNmc0NjZX?=
 =?utf-8?B?OFJXdi83S2ZKclBkY3RkWFBNL2xoZzRvQW50UTZNeW9yOCswbzJGZEhpLyt3?=
 =?utf-8?B?TkxmN3N6a0g1WlkzMHEySnBaVHByaTZqMHZ5RTNBdTRNS09RMGlkWHIwcGZJ?=
 =?utf-8?B?UmFFdGFmQ2xVTDAxMkM2TDNUNDJQUlorVDl2bUVFcEczVW9kUm1LdnBrM0JS?=
 =?utf-8?B?QnhXNDcyMW1SbXkza3hMbnY5N0wrdTlYemo5RWg5OHE1SVBGY25TYW90cGdm?=
 =?utf-8?B?MUxKZVRzc0ZNZW00aFZNUkJuUy9WUWV1aDZieEpuWTFaTndnNDdIUkxPNHQz?=
 =?utf-8?B?bVJqdzB2RWpkL09icEJVV01Pc0htRmVmcXV1S3NSYkJmY3R4MUVzWkl5NWdR?=
 =?utf-8?B?bWxMRGFNQ0tLdHFBR2U1U0RXMEJ6bG9qbW50UTFyUTA1Q1ZjU21ZNEZLakE1?=
 =?utf-8?B?R1diVkd2Uk1Ibk4wc2c0cVBlaW8vTTRXQUVrTnU5Y0g1bksrV2dwOTZNeTRC?=
 =?utf-8?Q?dfS0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW1lbnRkWTVvT0lzMUF5c1JPMG9UQlh5eVRjMTRJcStoWlV5ODJ0R3BXdDRQ?=
 =?utf-8?B?S1ZKOElyM3YrRHYwV2dEMWFBMnJBckxlNjVBNm1zZW9QSmhLbmNkcE56c2pC?=
 =?utf-8?B?YnRYZ1BKeENqSmt5MDJnSE8vZjh6MHhDSXlJVkl6WURXOFZNRGNFNmltblk3?=
 =?utf-8?B?ZnNwOWZjckQvSWFiUU1CRW5hK1ZEeTFYNlgxVDBlM3JQR3o0OUVkMzlNYjA5?=
 =?utf-8?B?WCtQQk9kNGZaZmdzRFZjRk1vcE9KaytGbldqRnM2ZXUrS2lkeHJpczhUN0Iy?=
 =?utf-8?B?am9Qd0lnc3A2NlFROXV2QmhoUHNiYkJ1M01YQnhQQzd3OXVYVC9yc2U1bXRE?=
 =?utf-8?B?V0NYMytyT08xR3lKYU1iZEVKMzZBdWhwQkhldDJpcHlhVG5RTnMzeUliUG1M?=
 =?utf-8?B?L09xQy91bVdUVG1ZeUt4OTNiWFhsV01UN3lUTjVneGIyOVdsclQvMlhnMXMy?=
 =?utf-8?B?bWtjSTZtVWk4VklES1JhNU15U2laclY1a0QvUkZ1ejA5bVRIaGhhcyt5WUw2?=
 =?utf-8?B?NXZaNUVLR0JzbjJsT1FUK295YTZQM2hoQTRMSFI1UmhLa3FWU25peElmTEJ2?=
 =?utf-8?B?VmdOcFJkZUc3YW5jMG5WSFo3RGtWbzZsZzFqNnZIQk1PTCt5ZWd4WUh1MW1t?=
 =?utf-8?B?b1VFNWlLczJveENHNkZtakk2NnZKclYyVkg5QzFtQzgwL0liZFJSNVZWYU5B?=
 =?utf-8?B?b05lOWZPRlc4bHJubndIL1RMOGN4RlFVY0hWV1VOTkJQRHhZTFpaSWpOT213?=
 =?utf-8?B?enRibFloTjhtSldCR3RMS3c2Mk5nbk55dkIzZUp5WXdQbFZLQTNNMFMwZVF1?=
 =?utf-8?B?YXZoRnN6VXNsTnFteHZLWTJQSzFqNDBBcllWcWdPUm5ucVhIWC9KR3daU2ph?=
 =?utf-8?B?NHFoMzBGazI0aUszb1JTUzNFNFgyOEo1YS9EZUMwK0hxdTJrUHJXWGRIQXhF?=
 =?utf-8?B?SlQ3SWx1am51R0FGdHk0QURsZkFOOFptQnJYYndxNjhGWDJ1M205MDNwanNY?=
 =?utf-8?B?S3ZuTXVCM1dWREkrSkNZZHd1MnlqcXkzNHFFZzhaV254bzl0L3dkV0d1Qkp4?=
 =?utf-8?B?aTRwcjlTeDFsYURldnJiZmpuQWJCSmV6eTM1V0ZESDFtSElOeXFLaG9Bcnlo?=
 =?utf-8?B?Z3NKS1NWWDN3OCtkY05zNDdlSC9Ca0RvdExQYWJ5aDErWkYyc2NqeFJDQWNi?=
 =?utf-8?B?VmRBMDFWQ3VUYU5lZFhZTVIzZTB1ZjY3T3E4Y0ZuTlh6cHJnYk8wZ1g0d0JE?=
 =?utf-8?B?Sy9JVkRIV3RhcEJVckNxRW4vTm1kazhCaW4rUWliYU9MRTlYMHo0ZnNydkY2?=
 =?utf-8?B?c3R6dzBUL0J0WnVrR3dZc2h6eHRYcnlLc0hETVBiaTErYm5uMWJnQ05zWXRh?=
 =?utf-8?B?ZkM2NUhZWVE5cStUL3ZFa3FYbDZaYjRGa01lQVluNlhRL1lONDVwck0xOHNq?=
 =?utf-8?B?SW11R2QwYitkWHgrdmtHZXplY0ZYS2FHODRhZkE4OGoyUWgvZkdwckxlSGJT?=
 =?utf-8?B?OEN4Qk0vTHpuUTJjbGZ6ZGQ2NG94TXd5TGhDZ3Q0N3hjc2Z3U3o2L0xHTUZZ?=
 =?utf-8?B?dHF6NVVpZDAydk1ONmJPYyt0bUNkeThoOThZeHMvQm45aVErTVhVMzBrL01H?=
 =?utf-8?B?cXI1U3FlbkFCZU9FTm9OdHZvanBHUWxsL0J1eTVGWU4zVVlzQUV6SXdkTGhD?=
 =?utf-8?B?NG4zdVJhWDZ4dTRGTUk5ZStnc3pwWGJyUDdTL2xKL2t0YVQ3Zjk5dzNCaU1H?=
 =?utf-8?B?OG92ckxVaDJUOEl2TnVldys2b3p5Z1Y3S3poN2tmcldiQUJPdU5pUlppM2Nv?=
 =?utf-8?B?Sk9TSWRuNHpsVGpuTkxuQmJUMFNyZU4ycjc0aXJ0YzF2QnZlZjJTakRjODd6?=
 =?utf-8?B?U3NNK1p4UWFjTVcrakJpQk9oeHdNM3F5Tk1yRENZYUo2d004bUhnSkFvcUxX?=
 =?utf-8?B?bjBuSlhDV2E2ZHIrRkp4SjhsSGZOOWtjOFVSaGJGNkRQeVo5NXlnWUd4Wkl3?=
 =?utf-8?B?SjRrdnhINGE5bkdSUXdFU0lXREE3RERqQThza2JNUjFkaXNLM09xS0dUeitN?=
 =?utf-8?B?UDMzRTEzaEN5T0kzMUo3M0o2UGxxQXp5ckVPLyt3ZWIxRFc5NVFtWUpYNzJp?=
 =?utf-8?B?SDZyL1hpaWMyeXdlRGNpWUF6bmIzaDVGUGRQREkzMEdkWkJFQVMyZlBjNVhW?=
 =?utf-8?B?SjdXbnNZTXcrYkJ2d2FDSGY4MjdqSHFtWFBZb09ZYzZxaGRsb2RUZnVmNE1K?=
 =?utf-8?B?eTV4eWZvSWF1SlpRMkJEbGxoWTFHNSsrT1ZGREttOGJ5OWNoOUpiZlJveXRQ?=
 =?utf-8?B?bkNMNE42eWF5ZTdZYk1QUHJCaVBMRkVzVlBpWFp0c0hmZ2dQVk8zQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c99e016-9502-4a1a-8e62-08de66ca96a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2026 04:29:03.3647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3O1uk9SeHupMVb/KXum530uHN2iSXCGio27BjMg0af2D1qJKhqb4j9GgagHKpboIzUD1FaCdGdDAtZOoM8/vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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

LGTM, Reviewed-by:  Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 2026-02-06 04:56, Tessita Thomas wrote:
> The JPEG decode test failed on VCN 5.3.0 with GPU timeout
> because it used wrong register offsets.
>
> Added support for vcn_ip_version_major >= 5 to select
> the correct JPEG register path(V3).
>
> Signed-off-by: Tessita Thomas <Tessita.Thomas@amd.com>
> ---
>  lib/amdgpu/amd_jpeg_shared.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/lib/amdgpu/amd_jpeg_shared.c b/lib/amdgpu/amd_jpeg_shared.c
> index 4c17f89b7..0b56eea56 100644
> --- a/lib/amdgpu/amd_jpeg_shared.c
> +++ b/lib/amdgpu/amd_jpeg_shared.c
> @@ -38,8 +38,9 @@ is_jpeg_tests_enable(amdgpu_device_handle device_handle,
>  	jpeg_cntl = vcnipUVD_JPEG_CNTL;
>  	jpeg_rb_rptr = vcnipUVD_JPEG_RB_RPTR;
>  
> -	if (context->family_id == AMDGPU_FAMILY_AI &&
> -		(context->chip_id - context->chip_rev) > 0x3c) { /* gfx940 */
> +	if ((context->vcn_ip_version_major >= 5) ||
> +		((context->family_id == AMDGPU_FAMILY_AI) &&
> +		((context->chip_id - context->chip_rev) > 0x3c))) { /* gfx940 */
>  		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST_1;
>  		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1;
>  		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1;

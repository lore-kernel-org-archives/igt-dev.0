Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867FBC19F32
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 17:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A40A10EB4E;
	Thu, 27 Feb 2025 17:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eS8C9m07";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEE110EB4E
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 17:22:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bzv7L28e4hnCJMD62NgAY1gVtjsNCsRjhYy703lJTRT2Y5YrCMkCy6Meg6K1uU60V66Hf6OzVl66mckGC9z8gCIaFg0TKKXiFTNeMS62Jn3JgzuTN2iLSFGWLr+ZePtsg8bL29LVo6WMdcESniNkUsIKHCF4r8EWFoXhHQoWGmxFzIJtaft60rEqPcHnSiEf8qlqCrvN9w77Z1WNLKfnu7YZoPlEod9mb61EfCIUrO5ERdfnjnSeFDwQznV2hbPuEHQYZ4nchjWMW05T9iQN7/5bQPlhg1XsH9j3V38armYLlzi88slkvUCB4CHTqjbYfLimoNzjYqwpUHYpdRg4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0mMFuF/k4RSvCtiCPGv7eCBOOxOfT+laeBbH6ZPgik=;
 b=sFQbSJCyLCmd/lwVaCgKb3EclLjaCbdMlReRefijElzdD2CxZRxHy0sHQ259F/+zNVxf4pP4eVjzMZyYIYsaO/ufVO2VqnvQbGkYr0/Xs7jznTqLrWVTn74XaW3zr9+MYNbomnQWNEfmKjZQzCE5ro8KGYZcdTdLmERO16jQRrQarH8q/NYwu9hEjdcSAmjjFxElLLlAiznP+wlyqvdxS/9FKLvzVVYiQ2U9SQfpCD6pkwJwdzTnY9dThtVHjz8o1isqVHj9MNqkdo3tJGCV5j6DCo7U89qfoXrtcLTaNsIxTm1uTEAg6EUR4GcaDbtFq6QLB1s+5CENgAlVw0vtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0mMFuF/k4RSvCtiCPGv7eCBOOxOfT+laeBbH6ZPgik=;
 b=eS8C9m07O/GaIqMVTJ8Uh/sbdqCkGCjl7/5Jev3+tLYrfzsu9LqdhVI0WLOn+ak6/yGhxE4rnbrnxLH/iLI+qLVIZI6L0qxObmF4B/AcZ/YvMXRiRWixCqFxHH8Al+brCPA+RPPaoVSFHC1pZOHeACZX5pPXta+RsA4p0wr3JNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH8PR12MB7133.namprd12.prod.outlook.com (2603:10b6:510:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Thu, 27 Feb
 2025 17:22:16 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8489.019; Thu, 27 Feb 2025
 17:22:15 +0000
Message-ID: <8dfea7b1-e1ba-490b-a4e2-68c8be4e34af@amd.com>
Date: Thu, 27 Feb 2025 10:22:11 -0700
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
 <0138a6e0-8e3a-467a-b6c6-41244bd1737c@amd.com>
 <a94b0312-b5db-483e-a4f8-5ef5b57d2952@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <a94b0312-b5db-483e-a4f8-5ef5b57d2952@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0309.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::13) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH8PR12MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfd9ebb-caa3-4a42-b54e-08dd575347ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGpDMDFFSEhmMHJUaUxaNEZ2ajljN284UVNiN1l4enNSTm9IZVdRSVZ6dFdX?=
 =?utf-8?B?dXlDTko3S25oYlNDdXQxbnFUeGZYS2xianNOQ2N2WWw0VGl6MndMS3ZOTWtz?=
 =?utf-8?B?SVRGSU1nSzRaZ2MyeGZqUHVoZkFiMDZ0cW9Xa1g2TFBOOXlQRTg4RklGcXpR?=
 =?utf-8?B?VkJIemkyMzdEaXNEajJRUnFFY0Z3V0Q5QlQ2Y05OOERSR0ZjdWp6Vk5UcDlp?=
 =?utf-8?B?dHp3aXJmMkhNMkY3cDJpZ0xHOWlEYlMvR1BWWStCOUtnNW1rZyt2UUs3ZWRn?=
 =?utf-8?B?M3J4TUFkT204TnNSeVNMYjJxaXFmWjBTa1FFK3hEdUg5cnFWTktYcTFJSDVh?=
 =?utf-8?B?RUhpUU9mRXZrYkIvdUh2MUg3S0RwWFJydTFlVjlJZ1k2TnNnNjA4ZVREclJY?=
 =?utf-8?B?cGR4NU9leU5ESVYwMWVucWpDM3RPQVdjSjRJeS93TXBzTU9Kb3JQWVgrdzFj?=
 =?utf-8?B?UitZOG05cnR4SFBBY3lkdGVKclNRZGRrMHJMSGRmZFVqMnliRTBnaFkxOTBL?=
 =?utf-8?B?eStUcGNaNUxXVnB6ZTcvSlJLVmhJMVJmVnFpMlI4NDRvMEVocFhxR0RSZjZT?=
 =?utf-8?B?SGNCbmNrYURYb3pTVjhOSldKb0xmWW02MG9sL1ZvZURDMFlEbVlkUjB5Sm9P?=
 =?utf-8?B?UmhGNlpTTTVaNjlpS0wzMlk4VmNjbC9xWHdhRE1NQlB1Ty85aW1RQjkwdUYw?=
 =?utf-8?B?bVdpc3JRdmhSek16KzdiZXdKc095aVY4cG55OEcwdzRsWlRJaDFiQ3M2aitO?=
 =?utf-8?B?OUNJVnNBMjNFSHJBSWRTNEZYdHFNRFBuNGwwVEFxZEJwN3lqR2tJMWhYeHNM?=
 =?utf-8?B?S0tjd0pYcnhmZC9QTGRTZHRKbEVxa0tSaDJlYVplS1Zpbml4UVBBazVoS0c4?=
 =?utf-8?B?SjF6ZFl0Wk5zUGVNQXp0UGFQV0RINEpqbXJrMU43bmZZeW80dmFiYnR1ODVF?=
 =?utf-8?B?N05FWXFPZXdhckY4K2VvRGM3b2wrZHlyL0hGNnZwU2VQNVd6YWZNdnJNVkZ6?=
 =?utf-8?B?UnRldVJoT1ZiT3BzMUQ3eFRRQ2xZZWw1RXZWZDZ3eTdYaUc0RlpuL3NiRDY2?=
 =?utf-8?B?c2JHM1pNUW9NSS96cHhRNDR6OEhCZTFKY2NrRElyMG53UjNlTGV3NTdpcXBx?=
 =?utf-8?B?YUh6SExDcVhucEdkd2xNNGlYaVpXdjdEc2RwZEgxamhwWFhHWmVsdXRuMStB?=
 =?utf-8?B?NFRHWnlyUS9STVpGWUo5ejNYeXJGL1V1ZlNjclc1MWd4OGNmcE1aTVZoVWNK?=
 =?utf-8?B?VmMzd3dxSFM2a21mUnU2dWlQUWdUeVdqNjcrc3daYWt0a1lTV09lM01BQ1Y2?=
 =?utf-8?B?Z1VhVDJPUWJDZklZNXFxZHZCRG1BaXVoMTFmTTkra1FyNlE2aGExVkxjMGRq?=
 =?utf-8?B?VjNSR3RYRENrcXFVSXFFKzgrbGVjK0NKNklSUFliTkhTU0l1bnJ1eEZ3cjRa?=
 =?utf-8?B?eUgrM2JUa3R2b0JxSzVQSm9EM0ZScGFhdWdpK2tKT3FSdnNNSzBBazB0NTVX?=
 =?utf-8?B?dGo0UmhVT05scFE4NHdLV0hrVHRqT3BEbFRBcXhINWZFbHFwNmdtclhKbG52?=
 =?utf-8?B?Zy9zcWN5U2k1L1Jlb1A5bXZRWi91UW80NTJsdlA5elQ2UlhLOUM2TWJPZmJG?=
 =?utf-8?B?UXZaUjRFYnhCT3JZQ05IeG43SDlIT3BkRjVCT0dvV1VLdmljRWhlMktmazFD?=
 =?utf-8?B?cEVkbU01Ry93SVpiWVdISjBUbUFlNUdOWllqREh4eUtYOGljdVIwUXRDMnZR?=
 =?utf-8?B?QmRta1VFUGJDVlUwdmhYVkppbmxnckZFQnY5UHdKNjBJSU5kc3JRbzY5RFBm?=
 =?utf-8?B?MnRUVlgzaTREMkxOdEVWSjI3NWlYalRYNkNCa0grZE0yZCtGMEtlaG9kNDl1?=
 =?utf-8?Q?q1MhheM34pkhP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2NJZ2c1WDlCS2tIRUJ4OTM0V1BQckVzZUJpN01IRGMyVldaWDYwWjFyejRp?=
 =?utf-8?B?ZFhWdG1xcEVvaU1uWmFUcW55bk9mM0NQUDZ0WWU1cjZwaGtSSWZhb2s3R1Nm?=
 =?utf-8?B?QjFUUlBFWjFFSTFDUWN0R1NSeHlBYzB6U0Zoc2hGOFNSOEtxd1VGaXRnclMz?=
 =?utf-8?B?UUl5MUIvcWJnVDhSak1HVFkvdEdnKy9rRlIybnlzOG43cVpUMmVlOXZEbVpr?=
 =?utf-8?B?bFNveWhTa3VZNzBYMjNQRlNHb1dRM2d0MDFoUGdobDk0T1NBSy9MYktBSFJQ?=
 =?utf-8?B?TUlGNGt2K2FQVFAxVHFERDRMU0tmWHFIOFBoa0RRajRPVFVob1R6cy9DSncv?=
 =?utf-8?B?QmYwNTNNbTg1WGhjdVgvc0xWM1BiZ2MwSjZPZXhnaWRuRnNKcDRZeW5WMEt0?=
 =?utf-8?B?OFgvTUJBcElVcW9UREhadWJHOFB5VGtucDlJNHRybS9EQ0RPWFRnazBURXpp?=
 =?utf-8?B?dFNQb3QzZ3lqbDYxQ29NbzBhZXhMZmhGTDZCa3hEaXRnZnY4OHdYWExjeWgr?=
 =?utf-8?B?TEowS29hR2t6UFFsNVpHS1ErSnRoMGoxR3JYMEhvamlWUUxETlVmMC9aanRv?=
 =?utf-8?B?UWlzQitRd29KNTVMQ0cwck5kVm5tS2s5Ynp4c3FqUW9YTVRXcFlONEFNTXRQ?=
 =?utf-8?B?SmNWRlJMbkJGZnJmaHZ2Njdvd29KUzVMM29BWi9FK2x6MEduNUYyQzJzQ2pt?=
 =?utf-8?B?OVdPNURwR2J3K05paDdvUVd4QnJoQk1EQUVWVHJ4ZmhPU09CVVBGTXQvNkhY?=
 =?utf-8?B?dHdyYlRoY3BGQk96SG5TREpwUmZsN2d6bDcwcWZmVEJBd0JLM3hXcXZ3UTYr?=
 =?utf-8?B?V0xHYXI5dk4ydDRJQzFpYnNCc1JwNHhZa2FBZTRldzBzN01lblBSZE1udFZ6?=
 =?utf-8?B?OTg1UHJ6OVVXa0poSThMNUFqTGtKUnM5Njg0THV3eHUzeTRUNUNRa0NIYks0?=
 =?utf-8?B?N0doZDZIYWNNUlNGTHBJdVhpUWJ5TGtNNVdkcWNaNzRrT3ZIRkhRd0kvRW1j?=
 =?utf-8?B?RlhSTGt5RlBwaVp4SzdXbE0zUXRQSkF5Umt2Q2xsK3ZZSUtHWkJpL2xvVGwz?=
 =?utf-8?B?Tm16Z3Zmd2JOOE5HRStYVUl0WFRNQ1ZIWk8wZDBubHNWeGMvdEZLVmhhL2Zz?=
 =?utf-8?B?QWNLYkNLM01DTnJ3Mllpb2NpN0RoMVkyNEF4WWJTY3hnQmRGNVgvN3BLWFhS?=
 =?utf-8?B?dmlPZit2Z1UvdWFwd3RzQmRVNml5TElwL2dWb05aeFExcDF6dmVFamtVaTFD?=
 =?utf-8?B?MUdoOWFaUFVoUUh6Z2FNbU0raklFd1pNaG44SER2LzZPUS9EMXhmNjJ5S0dw?=
 =?utf-8?B?aWRFSWNQUHVPWlNjY2RiWDNLd2dxSDJNd20zcGkzYTF0cVdFUVZCVDVaY0Zl?=
 =?utf-8?B?ZHM0c2dNbDBKN1FFVmtuS1hYRXlRUGFsdEkvQmFJSTJadU1ndHRVMFVWNTV6?=
 =?utf-8?B?NCtnaTViTllKYW1nYXE0UVVpVE9mMnhBYlAxSEU1clRBS1hJeEhMdm5ZRjJi?=
 =?utf-8?B?VkNqUEhRTmVmYnBuOUgzMWN4N0ZzaThkSEJqby85NXZCanl6bjFEWjhiWjgv?=
 =?utf-8?B?N2JrZW5XREF2a2FIdGZXWFR4a0paTXZXT3Y4VlJVQkZOeFV4WTlzUjVRU0pW?=
 =?utf-8?B?OTdad3ZjeWdLb0lGTHVXbkkyWUs5aldzTmdnSVJpNm1heVFkVEorZzNNTHcv?=
 =?utf-8?B?SS9qNFMzNTEwSEhySDZWd3kwWC82ZkUwRDRJd014YnUvUEtRNmo5OTBNQW5E?=
 =?utf-8?B?Z2dYdk1WTnljWFZQSlg2UWFRSGdYSklITTU5dDFaWkNXajRlWGREVFNndUMx?=
 =?utf-8?B?cHFXeTlDaVA3bzgzZExlRnA3enh6c1VqS1U4ZlpqenZicXAwdEkxSHFmd2V4?=
 =?utf-8?B?eXl0aDVmVmpDZmtMYlNZMjlwUHp0UzZJZVJXZW5EVkpYemlMcHRlNThUaEs5?=
 =?utf-8?B?WFpHWFg1NW9mZ1dISGxJNThESlA2Z1FMalYrTFlOU0x5eUp1WUxIVis0aWwy?=
 =?utf-8?B?aXNKVk1wSy9DMm9YTUpKVEpQWk56R0lhUzh4dmo2YW9Kc3oyK1c1NkZ0dkgv?=
 =?utf-8?B?c3I5Ny9NbjVUNnVwcXNXN3BnWmxzajhwNndla0pXdU93c3FlM0NFT2tNK3Bh?=
 =?utf-8?Q?hKWnsPt7AbNm5aKxX17SSeJSh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfd9ebb-caa3-4a42-b54e-08dd575347ba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:22:15.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYL4o7Cy3eNhzUfJrcSLcnQtUI4HzAwMV6mH6NnS83vUpCG7F5ziUc9YjEv21k6qIF3NcYu34xsrWC1qNMhKzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7133
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



On 2/26/25 19:07, André Almeida wrote:
> Hi Alex,
> 
> Em 25/02/2025 19:47, Alex Hung escreveu:
>>
>>
>> On 2/25/25 15:01, André Almeida wrote:
>>> Hi Alex,
>>>
>>> Em 25/02/2025 18:40, Alex Hung escreveu:
>>>>
>>>>
>>>> On 2/25/25 13:16, André Almeida wrote:
>>>>> Hi Alex,
>>>>>
>>>>> Thanks for testing it.
>>>>>
>>>>> Em 25/02/2025 16:06, Alex Hung escreveu:
>>>>>>
>>>>>> We don't have a CI to test individual IGT patches so I tested this 
>>>>>> patch on an APU and dGPU with kms_async_flips
>>>>>
>>>>> [...]
>>>>>
>>>>>>
>>>>>>
>>>>>> If I run overlay-atomic alone (i.e., --run-subtest overlay- 
>>>>>> atomic), overlay-atomic fails as below (partial outputs only). Is 
>>>>>> this an expected result? Does overlay-atomic need to run along 
>>>>>> with other subtests?
>>>>>>
>>>>>
>>>>> This is not the expected result, I tried to reproduce here but it 
>>>>> worked fine. Tested on Steam Deck, rebased on current igt master 
>>>>> (commit 6cdff4099c6c95e):
>>>>
>>>> I also have IGT rebased to current commit (same as yours)
>>>>
>>>> db3a185f3 (HEAD -> master) tests/kms_async_flips: Create subtest for 
>>>> overlay planes
>>>> 6cdff4099 (origin/master, origin/HEAD) lib/i915/fbc: fbc psr combo 
>>>> support update for xe3
>>>>
>>>> The kernels I tried are
>>>> - 6.11.0-18-generic (from Ubuntu's current)
>>>> - 6.12.0 from amd-staging-drm-next
>>>>
>>>
>>> The changes required for this tested can't be found in any of those 
>>> branches. They are in after the tag drm-misc-next-2025-02-20 ("drm- 
>>> misc- next for v6.15") and this is the patchset:
>>>
>>> https://lore.kernel.org/lkml/20250127-tonyk-async_flip- 
>>> v12-2-0f7f8a8610d3@igalia.com/
>>>
>>> So now the mistery is not about why this test fails, but why it 
>>> succeeds in the first place :) I will have a look using an older 
>>> kernel to see if I can figure that out, thanks!
>>>
>>
>> I applied the two patches on top of amd-staging-drm-next:
>>      drm/amdgpu: Enable async flip on overlay planes
>>      drm/atomic: Let drivers decide which planes to async flip
>>
>> The results are the same, i.e. SUCCESS when running kms_async_flips, 
>> and FAIL when running overlay-atomic alone but with different error 
>> messages (see below). I can tell the patterns on screen are different.
>>
>>
> 
> This error signs that the commit was accepted but the flip wasn't async. 
> Could you try to run in a newer kernel to see the results? This is the 
> HEAD that I'm using, no need to apply any kernel patch:
> 
> commit 72d0af4accd965dc32f504440d74d0a4d18bf781 (drm-misc/for-linux- 
> next, drm-misc/drm-misc-next)

The results are the same:
overlay-atomic fails when running alone.
overlay-atomic succeeds when running with alternate-sync-async-flip-atomic.


Kernel: 72d0af4accd9 (HEAD) drm/msm/dp: Add support for LTTPR handling

IGT:
135f66659 tests/kms_async_flips: Create subtest for overlay planes
f0b668833 (origin/master, origin/HEAD, master) tests/intel/kms_dirty-fb: 
update modifier based on display version for fbc

> 
>> IGT-Version: 1.30-gdcb53a091 (x86_64) (Linux: 6.12.0-99-custom x86_64)
>> Using IGT_SRANDOM=1740523111 for randomisation
>> Opened device: /dev/dri/card1
>> Starting subtest: overlay-atomic
>> Starting dynamic subtest: pipe-A-eDP-1
>> (kms_async_flips:3133) CRITICAL: Test assertion failure function 
>> test_async_flip, file ../tests/kms_async_flips.c:384:
>> (kms_async_flips:3133) CRITICAL: Failed assertion: (fps / 1000) > 
>> (data-  >refresh_rate * MIN_FLIPS_PER_FRAME)
>> (kms_async_flips:3133) CRITICAL: Last errno: 38, Function not implemented
>> (kms_async_flips:3133) CRITICAL: FPS should be significantly higher 
>> than the refresh rate
>> Stack trace:
>>    #0 ../lib/igt_core.c:2055 __igt_fail_assert()
>>    #1 ../tests/kms_async_flips.c:384 test_async_flip()
>>    #2 ../tests/kms_async_flips.c:728 run_test.constprop.0()
>>    #3 ../tests/kms_async_flips.c:840 __igt_unique____real_main773()
>>    #4 ../tests/kms_async_flips.c:773 main()
>>    #5 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>>    #6 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>    #7 [_start+0x25]
>> Dynamic subtest pipe-A-eDP-1 failed.
>>
>>
>>
>>>>>
>>>>> sudo ./build/tests/kms_async_flips --run-subtest overlay-atomic
>>>>> IGT-Version: 1.30-g19c7e62ea (x86_64) (Linux: 6.14.0-rc4-00318- 
>>>>> g72d0af4accd9 x86_64)
>>>>> Using IGT_SRANDOM=1740513273 for randomisation
>>>>> Opened device: /dev/dri/card0
>>>>> Starting subtest: overlay-atomic
>>>>> Starting dynamic subtest: pipe-A-eDP-1
>>>>> Dynamic subtest pipe-A-eDP-1: SUCCESS (2.124s)
>>>>> Starting dynamic subtest: pipe-B-eDP-1
>>>>> Dynamic subtest pipe-B-eDP-1: SUCCESS (2.101s)
>>>>> Starting dynamic subtest: pipe-C-eDP-1
>>>>> Dynamic subtest pipe-C-eDP-1: SUCCESS (2.101s)
>>>>> Starting dynamic subtest: pipe-D-eDP-1
>>>>> Dynamic subtest pipe-D-eDP-1: SUCCESS (2.101s)
>>>>> Subtest overlay-atomic: SUCCESS (8.950s)
>>>>>
>>>>> However, I saw this type of error before where the first flip is 
>>>>> refused with -EINVAL. That usually happens because we can't change 
>>>>> most of plane properties with the DRM_MODE_PAGE_FLIP_ASYNC flag and 
>>>>> the previous state was somewhat different from the one that we want 
>>>>> to present now, so we need to do a sync flip to modeset, and then 
>>>>> do the async ones.
>>>>>
>>>>> Is there anything particular from your setup so I can try to 
>>>>> reproduce here? I see that you have more than one card attached, 
>>>>> what did you run prior to the test on that card?
>>>>
>>>> I tried on phoenix APU and dGPU Radeon RX 6800/6800 XT, and both of 
>>>> them have the same results.
>>>>
>>>>>
>>>>> Alternatively, adding the following lines in the begining of 
>>>>> test_async_flip() should force a DRM_MODE_ATOMIC_ALLOW_MODESET and 
>>>>> allow the next page flips:
>>>>>
>>>>> igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>>>> igt_display_try_commit_atomic(&data->display, 
>>>>> DRM_MODE_ATOMIC_ALLOW_MODESET, data);
>>>>>
>>>>
>>>> Like the below changes? It doesn't fix the error messages for me, 
>>>> and I saw some SIGSEGV.
>>>>
>>>> --- a/tests/kms_async_flips.c
>>>> +++ b/tests/kms_async_flips.c
>>>> @@ -326,6 +326,9 @@ static void test_async_flip(data_t *data)
>>>>          struct timeval start, end, diff;
>>>>          int suspend_time = RUN_TIME / 2;
>>>>
>>>> +       igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>>> +       igt_display_try_commit_atomic(&data->display, 
>>>> DRM_MODE_ATOMIC_ALLOW_MODESET, data);
>>>> +
>>>>          igt_display_commit2(&data->display, data- 
>>>> >display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>>>
>>>>
>>>>
>>>> If either alternate-sync-async-flip or alternate-sync-async-flip- 
>>>> atomic is run before overlay-atomic, overlay-atomic will SUCCESS 
>>>> (tested on phoenix APU)
>>>>
>>>> Cheers,
>>>> Alex Hung
>>>>
>>>>> Thanks,
>>>>>       André
>>>>>
>>>>>> IGT-Version: 1.30-g8fee6d12c (x86_64) (Linux: 6.11.0-18-generic 
>>>>>> x86_64)
>>>>>> Using IGT_SRANDOM=1740510058 for randomisation
>>>>>> Opened device: /dev/dri/card1
>>>>>> Starting subtest: overlay-atomic
>>>>>> Starting dynamic subtest: pipe-A-DP-1
>>>>>> (kms_async_flips:3180096) CRITICAL: Test assertion failure 
>>>>>> function test_async_flip, file ../tests/kms_async_flips.c:361:
>>>>>> (kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
>>>>>> (kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
>>>>>> (kms_async_flips:3180096) CRITICAL: error: -22 != 0
>>>>>> Stack trace:
>>>>>> Dynamic subtest pipe-A-DP-1 failed.
>>>>>> **** DEBUG ****
>>>>>> (kms_async_flips:3180096) DEBUG: Test requirement passed: ! 
>>>>>> (is_joiner_mode(data->drm_fd, data->output))
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(handle=1, pitch=13824)
>>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>>> passed: igt_has_fb_modifiers(fd)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(handle=2, pitch=13824)
>>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>>> passed: igt_has_fb_modifiers(fd)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(handle=3, pitch=13824)
>>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>>> passed: igt_has_fb_modifiers(fd)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(handle=4, pitch=13824)
>>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>>> passed: igt_has_fb_modifiers(fd)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(handle=5, pitch=13824)
>>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>>> passed: igt_has_fb_modifiers(fd)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(handle=6, pitch=13824)
>>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>>> passed: igt_has_fb_modifiers(fd)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(handle=7, pitch=13824)
>>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>>> passed: igt_has_fb_modifiers(fd)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>>> igt_create_fb_with_bo_size(handle=8, pitch=13824)
>>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>>> passed: igt_has_fb_modifiers(fd)
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>>> plane_set_fb(151)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>>> plane_set_size (3440x1440)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>>> fb_set_position(0,0)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>>> fb_set_size(3440x1440)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>>> plane_set_size (3440x1440)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>>> plane_set_fb(151)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>>> plane_set_size (3440x1440)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>>> fb_set_position(0,0)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>>> fb_set_size(3440x1440)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>>> plane_set_size (3440x1440)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
>>>>>> "MODE_ID" to 0x96/150
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
>>>>>> "ACTIVE" to 0x1/1
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>>> plane data: A.0, fb 151
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "SRC_X" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "SRC_Y" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "SRC_W" to 0xd700000/225443840
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "SRC_H" to 0x5a00000/94371840
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "CRTC_W" to 0xd70/3440
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "CRTC_H" to 0x5a0/1440
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "FB_ID" to 0x97/151
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "CRTC_ID" to 0x5b/91
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "COLOR_ENCODING" to 0x1/1
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>>> property "COLOR_RANGE" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>>> plane data: A.2, fb 151
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "SRC_X" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "SRC_Y" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "SRC_W" to 0xd700000/225443840
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "SRC_H" to 0x5a00000/94371840
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "CRTC_W" to 0xd70/3440
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "CRTC_H" to 0x5a0/1440
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "FB_ID" to 0x97/151
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "CRTC_ID" to 0x5b/91
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>>> plane data: B.0, fb 0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting 
>>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting 
>>>>>> property "COLOR_RANGE" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>>> plane data: C.0, fb 0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting 
>>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting 
>>>>>> property "COLOR_RANGE" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>>> plane data: D.0, fb 0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting 
>>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting 
>>>>>> property "COLOR_RANGE" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>>> plane data: E.0, fb 0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting 
>>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting 
>>>>>> property "COLOR_RANGE" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>>> plane data: F.0, fb 0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting 
>>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting 
>>>>>> property "COLOR_RANGE" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     DP-1: 
>>>>>> preparing atomic, pipe: A
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: DP-1: Setting property 
>>>>>> "CRTC_ID" to 0x5b/91
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: }
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>>> plane_set_fb(154)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>>> plane_set_size (3440x1440)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>>> fb_set_position(0,0)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>>> fb_set_size(3440x1440)
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>>> plane data: A.2, fb 154
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "SRC_X" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "SRC_Y" to 0x0/0
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "SRC_W" to 0xd700000/225443840
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "SRC_H" to 0x5a00000/94371840
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "CRTC_W" to 0xd70/3440
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "CRTC_H" to 0x5a0/1440
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "FB_ID" to 0x9a/154
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>>> property "CRTC_ID" to 0x5b/91
>>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: }
>>>>>> (kms_async_flips:3180096) CRITICAL: Test assertion failure 
>>>>>> function test_async_flip, file ../tests/kms_async_flips.c:361:
>>>>>> (kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
>>>>>> (kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
>>>>>> (kms_async_flips:3180096) CRITICAL: error: -22 != 0
>>>>>> (kms_async_flips:3180096) igt_core-INFO: Stack trace:
>>>>>> ****  END  ****
>>>>>> Dynamic subtest pipe-A-DP-1: FAIL (0.227s)
>>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Thanks!
>>>>>>>>
>>>>>>>>> Vitaly
>>>>>>>>>
>>>>>>>>>> Please add to Cc Vitaly from AMD:
>>>>>>>>>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>>>>>>>
>>>>>>>>>> Also add Jeevan here:
>>>>>>>>>> Cc: Jeevan B <jeevan.b@intel.com>
>>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Kamil
>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>>>>>> ---
>>>>>>>>>>> v2: Add test description for GitLab compilation
>>>>>>>>>>> ---
>>>>>>>>>>>    tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++ 
>>>>>>>>>>> + + + + + +++----
>>>>>>>>>>>    1 file changed, 41 insertions(+), 4 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>>>>>>>>>> index 4a72be7b5..dd0907d50 100644
>>>>>>>>>>> --- a/tests/kms_async_flips.c
>>>>>>>>>>> +++ b/tests/kms_async_flips.c
>>>>>>>>>>> @@ -89,6 +89,9 @@
>>>>>>>>>>>     *
>>>>>>>>>>>     * SUBTEST: async-flip-suspend-resume
>>>>>>>>>>>     * Description: Verify the async flip functionality with 
>>>>>>>>>>> suspend and resume cycle
>>>>>>>>>>> + *
>>>>>>>>>>> + * SUBTEST: overlay-atomic
>>>>>>>>>>> + * Description: Verify overlay planes with async flips in 
>>>>>>>>>>> atomic API
>>>>>>>>>>>     */
>>>>>>>>>>>    #define CURSOR_POS 128
>>>>>>>>>>> @@ -109,12 +112,14 @@ typedef struct {
>>>>>>>>>>>        uint32_t crtc_id;
>>>>>>>>>>>        uint32_t refresh_rate;
>>>>>>>>>>>        struct igt_fb bufs[NUM_FBS];
>>>>>>>>>>> +    struct igt_fb bufs_overlay[NUM_FBS];
>>>>>>>>>>>        igt_display_t display;
>>>>>>>>>>>        igt_output_t *output;
>>>>>>>>>>>        unsigned long flip_timestamp_us;
>>>>>>>>>>>        double flip_interval;
>>>>>>>>>>>        uint64_t modifier;
>>>>>>>>>>>        igt_plane_t *plane;
>>>>>>>>>>> +    igt_plane_t *overlay_plane;
>>>>>>>>>>>        igt_pipe_crc_t *pipe_crc;
>>>>>>>>>>>        igt_crc_t ref_crc;
>>>>>>>>>>>        int flip_count;
>>>>>>>>>>> @@ -126,6 +131,7 @@ typedef struct {
>>>>>>>>>>>        bool allow_fail;
>>>>>>>>>>>        struct buf_ops *bops;
>>>>>>>>>>>        bool atomic_path;
>>>>>>>>>>> +    bool overlay_path;
>>>>>>>>>>>    } data_t;
>>>>>>>>>>>    static void flip_handler(int fd_, unsigned int sequence, 
>>>>>>>>>>> unsigned int tv_sec,
>>>>>>>>>>> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>>>>>>>>>>>        igt_output_set_pipe(data->output, data->pipe);
>>>>>>>>>>>        data->plane = igt_output_get_plane_type(data->output, 
>>>>>>>>>>> DRM_PLANE_TYPE_PRIMARY);
>>>>>>>>>>> +    if (data->overlay_path)
>>>>>>>>>>> +        data->overlay_plane = 
>>>>>>>>>>> igt_output_get_plane_type(data- >output, 
>>>>>>>>>>> DRM_PLANE_TYPE_OVERLAY);
>>>>>>>>>>>    }
>>>>>>>>>>>    static void test_init_fbs(data_t *data)
>>>>>>>>>>> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
>>>>>>>>>>>            prev_modifier = data->modifier;
>>>>>>>>>>>            if (data->bufs[0].fb_id) {
>>>>>>>>>>> -            for (i = 0; i < NUM_FBS; i++)
>>>>>>>>>>> +            for (i = 0; i < NUM_FBS; i++) {
>>>>>>>>>>>                    igt_remove_fb(data->drm_fd, &data->bufs[i]);
>>>>>>>>>>> +                if (data->overlay_path)
>>>>>>>>>>> +                    igt_remove_fb(data->drm_fd, &data- 
>>>>>>>>>>> >bufs_overlay[i]);
>>>>>>>>>>> +            }
>>>>>>>>>>>            }
>>>>>>>>>>> -        for (i = 0; i < NUM_FBS; i++)
>>>>>>>>>>> +        for (i = 0; i < NUM_FBS; i++) {
>>>>>>>>>>>                make_fb(data, &data->bufs[i], width, height, i);
>>>>>>>>>>> +            if (data->overlay_path)
>>>>>>>>>>> +                make_fb(data, &data->bufs_overlay[i], width, 
>>>>>>>>>>> height, i);
>>>>>>>>>>> +        }
>>>>>>>>>>>        }
>>>>>>>>>>>        igt_plane_set_fb(data->plane, &data->bufs[0]);
>>>>>>>>>>>        igt_plane_set_size(data->plane, width, height);
>>>>>>>>>>> +
>>>>>>>>>>> +    if (data->overlay_path) {
>>>>>>>>>>> +        igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>>>>>>>>>> +        igt_plane_set_size(data->overlay_plane, width, height);
>>>>>>>>>>> +    }
>>>>>>>>>>>    }
>>>>>>>>>>>    static bool async_flip_needs_extra_frame(data_t *data)
>>>>>>>>>>> @@ -283,12 +302,17 @@ static bool 
>>>>>>>>>>> async_flip_needs_extra_frame(data_t *data)
>>>>>>>>>>>    static int perform_flip(data_t *data, int frame, int flags)
>>>>>>>>>>>    {
>>>>>>>>>>>        int ret;
>>>>>>>>>>> +    igt_plane_t *plane;
>>>>>>>>>>> +    struct igt_fb *bufs;
>>>>>>>>>>> +
>>>>>>>>>>> +    plane = data->overlay_path ? data->overlay_plane : data- 
>>>>>>>>>>> >plane;
>>>>>>>>>>> +    bufs = data->overlay_path ? data->bufs_overlay : data- 
>>>>>>>>>>> >bufs;
>>>>>>>>>>>        if (!data->atomic_path) {
>>>>>>>>>>>            ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>>>>>>>>>>> -                      data->bufs[frame % NUM_FBS].fb_id, 
>>>>>>>>>>> flags, data);
>>>>>>>>>>> +                     bufs[frame % NUM_FBS].fb_id, flags, data);
>>>>>>>>>>>        } else {
>>>>>>>>>>> -        igt_plane_set_fb(data->plane, &data->bufs[frame % 
>>>>>>>>>>> NUM_FBS]);
>>>>>>>>>>> +        igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>>>>>>>>>>>            ret = igt_display_try_commit_atomic(&data- 
>>>>>>>>>>> >display, flags, data);
>>>>>>>>>>>        }
>>>>>>>>>>> @@ -772,6 +796,7 @@ igt_main
>>>>>>>>>>>            igt_subtest_with_dynamic("async-flip-with-page- 
>>>>>>>>>>> flip- events") {
>>>>>>>>>>>                data.alternate_sync_async = false;
>>>>>>>>>>>                data.atomic_path = false;
>>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>>>                if (is_intel_device(data.drm_fd))
>>>>>>>>>>>                    run_test_with_modifiers(&data, 
>>>>>>>>>>> test_async_flip);
>>>>>>>>>>>                else
>>>>>>>>>>> @@ -783,6 +808,7 @@ igt_main
>>>>>>>>>>>            igt_subtest_with_dynamic("async-flip-with-page- 
>>>>>>>>>>> flip- events-atomic") {
>>>>>>>>>>>                data.alternate_sync_async = false;
>>>>>>>>>>>                data.atomic_path = true;
>>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>>>                if (is_intel_device(data.drm_fd))
>>>>>>>>>>>                    run_test_with_modifiers(&data, 
>>>>>>>>>>> test_async_flip);
>>>>>>>>>>>                else
>>>>>>>>>>> @@ -793,6 +819,7 @@ igt_main
>>>>>>>>>>>            igt_subtest_with_dynamic("alternate-sync-async- 
>>>>>>>>>>> flip") {
>>>>>>>>>>>                data.alternate_sync_async = true;
>>>>>>>>>>>                data.atomic_path = false;
>>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>>>                run_test(&data, test_async_flip);
>>>>>>>>>>>            }
>>>>>>>>>>> @@ -800,7 +827,17 @@ igt_main
>>>>>>>>>>>            igt_subtest_with_dynamic("alternate-sync-async- 
>>>>>>>>>>> flip- atomic") {
>>>>>>>>>>>                data.alternate_sync_async = true;
>>>>>>>>>>>                data.atomic_path = true;
>>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>>> +            run_test(&data, test_async_flip);
>>>>>>>>>>> +        }
>>>>>>>>>>> +
>>>>>>>>>>> +        igt_describe("Verify overlay planes with async flips 
>>>>>>>>>>> in atomic API");
>>>>>>>>>>> +        igt_subtest_with_dynamic("overlay-atomic") {
>>>>>>>>>>> +            igt_require(is_amdgpu_device(data.drm_fd));
>>>>>>>>>>> +            data.atomic_path = true;
>>>>>>>>>>> +            data.overlay_path = true;
>>>>>>>>>>>                run_test(&data, test_async_flip);
>>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>>>            }
>>>>>>>>>>>            igt_describe("Verify that the async flip timestamp 
>>>>>>>>>>> does not "
>>>>>>>>>>> -- 
>>>>>>>>>>> 2.47.1
>>>>>>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>
>>>>
>>>
>>
> 


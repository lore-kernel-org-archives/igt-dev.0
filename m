Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827CDCCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 21:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2405510E223;
	Mon,  3 Nov 2025 21:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MwwJJO8M";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7931210E223
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 21:48:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTRCT5U2WkpoSftp0JjR38Zm8onJERc/8ApMTV5/rTxurFpNl7ECUI/mYp8SBfBBKo/0sfWSY0C1MYzGTaVpvkW28sCn3YzVmNm71ZRM7kNGJc3XsNZyqVEvCl9wU3rHUd+V2k8NNGZoTSVI1S1JII7bc+vnBiHfBQ+xBM+Y2GOxmssSw+/ZZll8UkqzY0MmOdS/J9PTRqrWS1Yhu3xtGFJJEmnaAmvsavIt2D8VCZSrs4aldM84jOj20BIPEgkF8SFGe1fHC1eQblAlE/Zsf/7w/q6SleDR9MD5ZOaMnVcEP0W6LNHd4fsqf2Ukx9X2s4t5PpIeC+fL0/2HBmGW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KgtjV0d7PC35gkr5eTT0LzFZzM5emfjKIE4vxFeo9A=;
 b=EdldpyYekT/JlMTe3wZZ8Bz+M46HETAibMx2OsRP2p1g8a8btMsNwxV/K6rx8KeiYTyZUk6YIj0KSNjnYFl4s2xWzUZL06dly7LjwrReLu4tIBV/eeG8pEIgxx/LY+BnbQrxXYH0gpfoBBZqYmnHcjafKKrvZjIsn59xsMLJbk8NrD3RRK+QxsA82Nrqrtk5Z70GxpYguQX31MtizeD0Ik0fh6GoaLJV3UE9xgVIQYiqj8aQHTiU0vYtQVvMw7ZAQ3KzaQ/cbZYO/Gz+YHDrKIc6bFRWpSeMxJq32kOE1jPO9Yk3dzcZL2ZxbLuyXQfedTlSKyKsjwoqOuYh90aNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KgtjV0d7PC35gkr5eTT0LzFZzM5emfjKIE4vxFeo9A=;
 b=MwwJJO8MQ6WWoyCf8nTlwcSP1pW4kuKu1WKWNO9Goq2aVCPZWCYZdp3hUJk9oSUO4vCPzWDuoplcrfsT1fIzEiyTYHa4H8HpW1VubSCpcIFxATZzOCfpV2JIC/mz5uVab54Qyfb9t+S7UDnNIMefy/M/kQHqH0OSVRlErmdpCZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 21:48:00 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 21:48:00 +0000
Message-ID: <372691b0-c30c-47f9-86c1-29e75968320d@amd.com>
Date: Mon, 3 Nov 2025 14:47:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/32] tests/kms_properties: Add colorop properties
 test
To: Leo Li <sunpeng.li@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-7-alex.hung@amd.com>
 <5372a9d7-b9d1-43bd-973a-ad431e97d87e@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <5372a9d7-b9d1-43bd-973a-ad431e97d87e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0129.namprd04.prod.outlook.com
 (2603:10b6:303:84::14) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: cac7968f-f978-41f0-dbc3-08de1b22a83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGxQODEwMkt6K1A1R1RnU1JJOTFESWtZUUdUbS8yR1pkY3M1RTZEajZDRUls?=
 =?utf-8?B?b3RiVzg0Ry9UbWx6eUJvWkJUc21zYjFDeVNsT0RWc2tUR0xCdWhTSHlMOG90?=
 =?utf-8?B?QUwwL2Q1clNOdURsaGJXQ2ZrVjkwc3Y5amJTcEhQa3JET21mdGVXKzg3YTVl?=
 =?utf-8?B?UU1GU1FxRU5QU1dJTmx6Qmo5eThjVEkreldPY3pBdUNhbDlnUGNiL2FodGV1?=
 =?utf-8?B?ZUFDaGFsdXdXVEpmeTFQcWdMQktQL0tldHVpdEpsMFdvUFAwQ2dxdklFVUV0?=
 =?utf-8?B?V25uUjRGSGdmNmNsREJVK0IvYitxMHFJaUtRN1d1T2FnSm9BN1VLU0JFOTZz?=
 =?utf-8?B?SG50TjNjeXA3RXpQUUhDTkpYemNRdmxDRzQ1TlhsQXl3QXpwbXF1V0xaN1Q4?=
 =?utf-8?B?aFkvZDB1ak5LWTc2UHhRVW5rLys5Mnk0aFR6RzN0ZEw4MEhJb1d1RUpZWUY3?=
 =?utf-8?B?NUloUzlUMGUxeHBnMFVUZHc5RXE1a3hQRS9ORG50Y3Nhakl5TkZzQmQ0TEZz?=
 =?utf-8?B?S0lydERuL0FDWkx5V2lRQnBGbnRXMW1TSk9PU0hYeHZmWWJ3T3dxcW55MlBl?=
 =?utf-8?B?blhUbDN1OUhybUpNU2NubTR1L1hUOHEzbEJaSFNNVDBDMWlvRUFVMFlMTHVh?=
 =?utf-8?B?ME5xa3pZdlo1NUhKbENYZWZjY0xXNHpJTmsvSW5XcFg5OW9hamJDeXhucis5?=
 =?utf-8?B?TW5iRmQ3OExNOXN5WDk1ZVU2VFlkLytwMzl3REs3LzN4RTZTVW5BUlNkaG1M?=
 =?utf-8?B?bnpMSGwybGRvdjZnYmg3d2JvVXByRnRoZXJMdSszY1BEMkZHUUlPbEF2ekdH?=
 =?utf-8?B?dmpCcG5iV21uQ0FOY2VpUFhJL01Cdk1RTisyanM3QWxoZE1IUWxCMVcxZkNm?=
 =?utf-8?B?OXNGbGh4Wk1RK3RaQVkzL2RvbUJyM0RJT1R0TGMwMTFzZzhtVnVHWFlXc1p1?=
 =?utf-8?B?aW5tbkhCUVRqK29TL1YvdWdZZHN1KzVRdWoxdXBtUkhVblFHdDJBdzFGMTUw?=
 =?utf-8?B?YXlEMk54YmpOZmtVRFd3dkp2aFFLbFBmYTlqZE1ZNFhJRWtXSHJPTDBFUmht?=
 =?utf-8?B?OWp6WFJzck94enBvQ0NmRFVuOEhaM09nOFNRMWtPQ012WlR5WENvSmRyL2FF?=
 =?utf-8?B?WndlbFE1MzVDTlpLMXJ6MG5vWWQyZ01jemRRTGFDaUZrMjFKMXlBTzl5SEs1?=
 =?utf-8?B?SXpEMnU0NVFsRElQZlptTVlnUFM0OWljV2FuMnFLdVdJYk96amRMU2R4dXdI?=
 =?utf-8?B?ZGw5TTRxaGFtaHFSb09UZE90Ky9VWnArd0ZqdFJDeFlIazhaMjNCNWRqSDlm?=
 =?utf-8?B?ZmtlNHNnZHpWK1JqVkZTYlYyU2JvNmx3c3gxL1ZHVG1mUzFUeDlMTzkwV3pV?=
 =?utf-8?B?bmtGYm5pV05jbmM4dmtWSldvai81SC93N2hNSFhmY0lPWE5KUHZrZE0zLzZu?=
 =?utf-8?B?cUxaNDIzL0cvUE5BNHJXMlhiZUpEZzlqS3JKNmlFeTJOOU9wVTc2R1k5T2I1?=
 =?utf-8?B?UyttRExsUllGbTlGT2RZaWR3MDFnbEFJQmYrRGV2OGV4ZVNzeDFJK3JWazds?=
 =?utf-8?B?Z0Z4V0VaK1RyQTlDdVpYbVplRnZPNGNyOHZZZDRsM1hLRy83K2lHZVMwV1Zt?=
 =?utf-8?B?Y0lQZGx1bW8yenBld3gvV3o5TjFodnh2Q01SQkdPbmRkNWhTQ2d3Y3VzNWlh?=
 =?utf-8?B?M0ZuQm5PWTdLUUxFbTFhK1VXSnhyeTJDbmJIQWd2b3lMT0Q3YkhPZlo3ZUg2?=
 =?utf-8?B?WjhicXVZbDJ4aHRHUGk3ejFMWlVsaWJsNER3Q0l4STdoVzhwVmhoUU1ZTUFq?=
 =?utf-8?B?R1ljT2M4NU03RE5YUWxRSWNYZUxvSFhRTUFUeGdyRjlCSzFZRnEvSXlNTURj?=
 =?utf-8?B?aGJmWGMwWkQ4dVZQWnFpOG9mTFpBdk5lbEE4djhtY1ZaV2ZWcUtjWlVCcG5W?=
 =?utf-8?Q?5cHGllGOiOO7Lg+3cpCEUL+DdHgzNnEn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dklxUmRycVBZa1NXRU9DZ0tCTnlYa1NzYXZLRFMyN2t5WGx2SnQxT2VsN0Y2?=
 =?utf-8?B?dUNrR09zaHdYZGd0Z1FPNkZINjJqclRVM0h1QkxicHcrdU1uNlkxOTd5YkRK?=
 =?utf-8?B?QWhxMHhMWTlaemRuWXpLTXkwaXRidWVaM3kwTTNPT3ZDYTRab1IyRlZDNmdT?=
 =?utf-8?B?eDc0eXhPaWhxUU9YVkdvclVJYjk4Q1NLdWZSWkVjVXJlbUZoYURBd0RJak5s?=
 =?utf-8?B?YTRCWi9jaFN2TVV5L1BvMzVqb0docHJ1RjIzYThoc3RFVmNBMWdiU2g1QkFD?=
 =?utf-8?B?ZzVGYUJaVWkzQTkyLzJ6QUJjSWlPWGd1OEZvMUVqSkNHWUVKUEo5WCtYTVFm?=
 =?utf-8?B?YVVwQmk0SzNUc3JqYjVVL0p3ZHRCUFl3VURDN1ZSTTI3dU1peUVZanVGL1hw?=
 =?utf-8?B?S3Exc1BlWmF5WXlRV3ZJUFozcGxCSFRMWFVQQkY3U3ZCeVQvNVJqSHpIR1kx?=
 =?utf-8?B?MUY5bC85eDNRY1pPdmVPYU9MNGh3Y3J6Z0VPZlgwTjJNWnhRclVoTU1UUDJ4?=
 =?utf-8?B?Unh5WWtxNFlnbTczbHZIRE05R2RveElPWFJwSUR5NEprYWFyVzVZSlJqekgv?=
 =?utf-8?B?amVpMTlMbU41eGozQWU2d2pTMGpxQ3lFbTRPSXQ5TVJmdklqaWRlbUFQUXFi?=
 =?utf-8?B?QjQvVkNJUlV2WG5weGRzR29DQXF1dFZuRDVmMVZFbkVMandHdVlPamFVYzZ3?=
 =?utf-8?B?UXhydURIdnpHME4wRlo3MHhMNGN6MHBPdjY3MGNwMTNRdU53M0FQV2NFMW51?=
 =?utf-8?B?RkFsejRES004SG4rTnB4VzhySXFYbkNiV0N3THFCbGdFRUZIR0FGZG10TGEw?=
 =?utf-8?B?Uld0Wjg2dUVISC84anJlMmhOazU5ZGllaEtpdDkvRzFMVWZDMTU1MXRyeWFj?=
 =?utf-8?B?YnBVM1Flek5TK2k3MnhkcFpVdkN3NjZDNExBaWpHTURiWnNiWTFNZGhIQkVW?=
 =?utf-8?B?YjNjbi81QUVqaGxoWmYrY1RTdDdiTWNvR0JsTjZQUWdDS0lUSjBsTEVXYmxJ?=
 =?utf-8?B?cnFVQUpGV0VRM2Jzemk1cjEzU3hnR29weG9oNE9oM3BiaVVsazJweEpTS0xi?=
 =?utf-8?B?K21WeGhXTkN1REFBdnBvQnJnSGJYd1MxcDhRODJpOE8rTGlNdW5ZNDRlUTRZ?=
 =?utf-8?B?ODZPMjNVaG1EMVcyRThrUnEwT2xCZWxBQyt5eU54K2VvSThvZENsMTE3M1Az?=
 =?utf-8?B?R1Y1YjVtMDdwQ05EWEhxN0JOQjFkRzdLUzJackx3Q0FOV1E2T0Q3aXV6WnNW?=
 =?utf-8?B?aER4a1dVSTQwVld0K3lQejZRVFJyQ3dRaGNkdXdwaFBGK29OOHhTYkRVK0ov?=
 =?utf-8?B?T3RtQlpoVGJzTWFMNWhCREp5czM4NVd2dG9Fc0cxNG5aWUg3OTZFc2lXbkQ5?=
 =?utf-8?B?Y2pOQkVvYnQzbFhwR3JOcEJvbVFBelhNNnMyNk55dUpreDdON3ZiTVBEdVBh?=
 =?utf-8?B?eFk5bFAwVDhPUDFvWUN0eTd3L1MwM0ZIaFJlRCtHY3dzem9ZUnF4RXVTaDky?=
 =?utf-8?B?enM2MlhzbVdVZVphbHlFYk9pNk5LWVdjSzZpeUJValhpWnRTZzB0bDBJNFFT?=
 =?utf-8?B?NGxWcnVBQjJLTGRVQWoyeUNXZzJ1QVRCd25YNXVtVlcwcjVKNHdRaWJObkY5?=
 =?utf-8?B?L0hjc2FuUUtFczkzclRBVFpDL0VDWkI2NHliQk9QQzJBWXZ6eE1tSHlHMEtO?=
 =?utf-8?B?MWZ4UTA3OW5LRmoyLzlHTTFYeUE1b3dXVGp2RWFhamZvQkYwei9oSlZuRnVm?=
 =?utf-8?B?VXd3L2U2V0dEZVNGZ0djQXhYaWFNYnAwU0MvblgySUw2L3BSTldLQkxCTmxQ?=
 =?utf-8?B?QkRCZnhXUkN3WElidzhXTjhhT0hySllZOWQxTDlkNzdjZGJpYTlReTRPTTJx?=
 =?utf-8?B?M2J0eXA4bFpBV2RkM2s5NFYvMUpNemZOc2lmT1VnaWp5RkJmcldveVBVaTFO?=
 =?utf-8?B?NUtzTHhlYU1YZ1ZVY25CRjBqdWFxR1kxTzNoNTB5Wm9ZODZWUlhHcXJHcGVG?=
 =?utf-8?B?b3pINkdBYldYQkc1WjhmUFJLVGRNbHFYaDdxY2xNZVR1cnZJbHBVMm8yTkJG?=
 =?utf-8?B?T0l2ZHdseitsVldmanVVQlc2YVFHcGp0WHRBSlFVUXRrTXlDM3JqSmd5YTlH?=
 =?utf-8?Q?FlJ3aI9dAlE3YZHJSq+WyR5/Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac7968f-f978-41f0-dbc3-08de1b22a83d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:48:00.0532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YH4fBtAo2K4QJzlBVU8w9x/rZdmhicK0FOzLG4WUzCpZvJ+y3oE/xDgRACuT1FnI/rainmnNkCgZqq0D/sGovA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503
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



On 11/3/25 14:28, Leo Li wrote:
>>   static void plane_properties(igt_display_t *display, bool atomic)
>>   {
>>   	igt_output_t *output;
>> @@ -853,6 +920,10 @@ igt_main
>>   		  "Tests connector properties with legacy commit" },
>>   		{ "connector-properties-atomic", connector_properties, true,
>>   		  "Tests connector properties with atomic commit" },
>> +		{ "colorop-properties-legacy", colorop_properties, false,
>> +		  "Tests colorop properties with legacy commit" },
> If colorop_properties() skips on !is_atomic, do we need to define a legacy subtest?

Hi Leo,

Do you mean removing the atomic for colorop since colorop doesn't 
support legacy?



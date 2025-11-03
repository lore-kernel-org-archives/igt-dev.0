Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4A8CCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 22:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEAD10E4AE;
	Mon,  3 Nov 2025 22:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cIdIjcVX";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011015.outbound.protection.outlook.com
 [40.93.194.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D578D10E4AE
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 22:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuzXIK/TOGgHUcETU8muvRaXpfgl1xDJBliILnjDE2Y2MlgiNsnffvCSHCFqsjMGKivNX4EMcsopu+Dijkbi11yC7u8ay26DHvd2c7O3+s2zvOoJl9KageZEKnEbQwY8zjmGCwMvPeucM6Udju5A25UGPvQRQYo/h3rg5Qc6wGvzEPufV05C1dApu2R4lu0zNm+f2Yq4bkGyXtRoRm+yZWdro7zDubaAMjljXQERRyT22ezKcd1jAev8JM/4UIms4qMa09U3UGFTh34mEZZKh+3+Hss7mDRrWD3JIAROa06aaSdHwcgC7Trd4o9tqNjuEr3+JLi+KRNjNx+uW5p1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7Y7SY+gDv0WWSYqE/MbyAIXrLZp80WCUgPFPbMQEo4=;
 b=uQxsPVfdtYglD4AJsESYEHtEyOlF9eAEZFl9uOK/DirWB6+171+RBt+K4lL7CpJkXrQMK5sOOHPQWppm9AAD9eBAkga4TXgPTIeVDzanA9mJUkDCy3fBwXSh0YqNURTdUxxWciIUka84yHYkTdHcyR6WTVlqHdBAcRws+gfrNgewkZ1eilUxSlm5jrfbiPYRSlkH4YmRezh/UOdxTQ2LnB7UeT3h532+C6tYBonUDMDHdVvcaLN8YHayzJ3o//EOOJurl+fzjuU+BSwPVHkaYX2ejBrJga5tFSLTwDau0Xi9fFxMDFFvf+iDtrWK+k3gxTJomtdhJxTkqTjwtVIzaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7Y7SY+gDv0WWSYqE/MbyAIXrLZp80WCUgPFPbMQEo4=;
 b=cIdIjcVXf7gLPSpfpwSzIFMlrbWapvWRv0+eM3/wpwK4aZ4RrvwrjhQ90DmpYihz2xXsirwycci+e2BkJLCpeq/Fj/y5Nii8kMPiFSscQ/Kk05OXeiGmrE2ve1bOdw9uU9aqAZeasuWcQ6+c9LWF2zdTdcY0pACIoRt9qHcYlEY=
Received: from SN7P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::23)
 by BN7PPFD6BF22047.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 22:04:09 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:123:cafe::65) by SN7P220CA0018.outlook.office365.com
 (2603:10b6:806:123::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 22:03:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 22:04:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 3 Nov
 2025 14:04:02 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Nov
 2025 16:04:02 -0600
Received: from [10.4.13.158] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 14:04:02 -0800
Message-ID: <ac4f21fc-538c-486a-855c-d6c93e57dff6@amd.com>
Date: Mon, 3 Nov 2025 17:03:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/32] tests/kms_properties: Add colorop properties
 test
From: Leo Li <sunpeng.li@amd.com>
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-7-alex.hung@amd.com>
 <5372a9d7-b9d1-43bd-973a-ad431e97d87e@amd.com>
 <372691b0-c30c-47f9-86c1-29e75968320d@amd.com>
 <4ad03b16-c2de-4308-bc09-ad661961f3f6@amd.com>
Content-Language: en-US
In-Reply-To: <4ad03b16-c2de-4308-bc09-ad661961f3f6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|BN7PPFD6BF22047:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7206d7-c23e-40ce-7df2-08de1b24ea2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1B2WEFJdDluaUVFN2JPWGNYa2M1L01Vd0Q2OWsxMHNuYmtqcURnZ3JmZFpM?=
 =?utf-8?B?eXIySnVtT3lVVkZEZGVGSmFtYlk3OVorRjBycUZYWm5IVlNnWnJiblFSZ0t0?=
 =?utf-8?B?T3Y2enpmTEorR0pLMVp5eWcyQy9aZ1VCc0NZdjVmRlZYRkUxOTBtMFVZMDlF?=
 =?utf-8?B?Y1VCQWxrWDJoU3Nvc1pxTk51ZXJOQnNUQi83RkdCQXVGdHpFbWJWcHNZRHpH?=
 =?utf-8?B?bHg4NVdFMXBxVUFPY3MyV0RhM2c4ZCszditmR3pkekFoTzN2SlpHVGJpbitI?=
 =?utf-8?B?V2FQTSt4MGEyam9qdHY4cmErRmxCck56bE9mN1A4NlZqVC8yYnMxWE1xYW1L?=
 =?utf-8?B?REsyc3pibmlWUjR1WFN2SDludnZMK3BKN0lINnltdWJZci83YlB6MjlDUmp0?=
 =?utf-8?B?V1Y4Y1JQSyttbWpsaUs2Zk9Ya05TTkJwTU5RUnI1Z3MvNTJOSWxud3BSWWgx?=
 =?utf-8?B?MStlTTAwMUhFUzV2Zmw4SVFsMXFCQTJrbWx5cDUrNzZMdnRpVWxodEdLK0ZH?=
 =?utf-8?B?eXRHZVA4Wkt3TGNtTTFXWXFwZEZDMG41a1BubGo2dEJuaDFNNmg3VVpwMlVx?=
 =?utf-8?B?Q29FVEtUQXBCcUxIY0VwMHlNQUFwTEovc2pWUnlDemlNcUVNRWxTSFFpeFBK?=
 =?utf-8?B?WmF3TllldWx1V3hsSE1vNVlTQ2VwcndhSUZuR2hJdGQzN2k3Z2x4Z2RDTVZT?=
 =?utf-8?B?akRSTHlJMWlTWTdIb2treXJ0M25waDdKR1BYa2VDRVhjdG1GMjdGRUluMnV6?=
 =?utf-8?B?aEcveTA1Vm15bFo1Wks0clVrZHZ4Y29YWnREMXJTdGNnRzdEakZnTTMwbGFT?=
 =?utf-8?B?U3BuVEhRT253ZkQxY0RRd084VDVidkVhNHFZdlhuQ3NRUkRUbVkza3R6L1Vs?=
 =?utf-8?B?Wjh2ekp6U0ZKRTVPN1ZzcG1XK0lBUUdzakJKeDJ5TGZ6M2hPVjZOYXFMUk1H?=
 =?utf-8?B?TUpEQVloVEN5L0tiSmppVjg4dmE1VmdJWENEUXowRklVM1NIYUMzVVVUL29t?=
 =?utf-8?B?aEx4aWMrVGM3UHZBTW1ldUNvOHYwS2psR2ZyZzBVcjVpWkNTaVd4andDdWJs?=
 =?utf-8?B?WDBNYjE3L1o5aXFlcmE2MCtXb2Nqa3RjSS9adWtZYnlvbWVuYzJBT0VkeFVq?=
 =?utf-8?B?ak5KRjY3Zkl2c2x2cFB0b3MwZ3lxRFJnVVk5clZ6dVpwMHVXREJmV1U2L0tS?=
 =?utf-8?B?K3Q1MlN4bXR2RzFGT2ZlUk1aeFRqSFE4elVJbHRKT3N5a0tNdHhTQVRKdmdX?=
 =?utf-8?B?cElSZEU4TVppbHZnYS92OWplY0s0Y09waE03MTExQkNFbENiZlRNVEg4bnM5?=
 =?utf-8?B?YldxNkxnWVVvNkVpTzRmMVBhNklGN0NaVGhkbGU4R0k4bDdXaUZ2L3RLL25a?=
 =?utf-8?B?TnQxSmgzdEVIMUt3N1BjKzJsenY1MkZTZFJQQXIxTXgyRUxUejB0ZkdJZ1Ba?=
 =?utf-8?B?YnFGVzFGaFJ2YU5jd0NSZm1ld2hJck5HSjVheEZUMktXTERtb0hQUGhDcTE0?=
 =?utf-8?B?OHhyQ3Rwc21uWVI3UEg5bXIzN09neURFOG9oYWNDM0x3VTBiV05wYmlQYkVE?=
 =?utf-8?B?c2VmbE4rMlYraVdXeVVmdjV2LzN0RjE1TTk1ZGN1ck5kSUJZS2syNFVNOVBU?=
 =?utf-8?B?d284RFRjemlpZ1lOSmR6c2MyM0w2NEl4a2lYeXdHU2VhUisxV2k1bUhhazJR?=
 =?utf-8?B?NXNURFI2cm1lbnJNbVEzTmFmVVlZb1l4Vy9FUHVxOEk1U3k0VnY5TXhvakdn?=
 =?utf-8?B?NUNuWUsybFFCaGIvTVJGaHZRS3ZuTE9uOG13VlA2a3NSVmlLN0s1a0F4bXgr?=
 =?utf-8?B?dmtkY3QydUd6M0Z6dk8zUlpDVEdSNklpeFJnL05sYkhic01RQk8vUGxWb3JI?=
 =?utf-8?B?NGtEQTRuWE95ejZ5UzdFTEJ0aVdrU2RTbjJwY1V6VDQrSTIzbVdxRTdITmFJ?=
 =?utf-8?B?M1E1S1ZoeEEzUEZtWU9aSHUvMm1aMVNQWGRxRDVrY05MZXB3MjlQNGJGRlJx?=
 =?utf-8?B?ZDlLMlJEMmRnUFJRVHNobERCd01WOWtGMHpZb2xDb3gxL1lEV1A5eVloZFBu?=
 =?utf-8?B?eGI3Y1RSTGlHS0QvYUJHK0Z2d1ViYndrOUFRTThveGMrZ1JLZEhqWmdJMTIw?=
 =?utf-8?Q?dAb8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(82310400026)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 22:04:09.4230 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7206d7-c23e-40ce-7df2-08de1b24ea2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD6BF22047
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



On 2025-11-03 16:58, Leo Li wrote:
> 
> 
> On 2025-11-03 16:47, Alex Hung wrote:
>>
>>
>> On 11/3/25 14:28, Leo Li wrote:
>>>>   static void plane_properties(igt_display_t *display, bool atomic)
>>>>   {
>>>>       igt_output_t *output;
>>>> @@ -853,6 +920,10 @@ igt_main
>>>>             "Tests connector properties with legacy commit" },
>>>>           { "connector-properties-atomic", connector_properties, true,
>>>>             "Tests connector properties with atomic commit" },
>>>> +        { "colorop-properties-legacy", colorop_properties, false,
>>>> +          "Tests colorop properties with legacy commit" },
>>> If colorop_properties() skips on !is_atomic, do we need to define a legacy subtest?
>>
>> Hi Leo,
>>
>> Do you mean removing the atomic for colorop since colorop doesn't support legacy?
> 
> Hi Alex, I meant to ask if the "colorop-properties-legacy" subtest was added intentionally?
> 
> I ask because the colorop_properties() test func has this line, which seems to make the legacy subtest redundant since they'll all skip:
> 
>     igt_skip_on(!display->is_atomic);
> 
> - Leo

Nvm, I need to read better :)
The skip_on() is for whether the driver supports atomic, not whether the subtest is using atomic.

Please ignore that comment,
- Leo

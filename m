Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B93CAC597
	for <igt-dev@archiver.kernel.org>; Sat, 20 Sep 2025 05:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFCD10E286;
	Sat, 20 Sep 2025 05:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xJGfkR1F";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013047.outbound.protection.outlook.com
 [40.93.201.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD01810E286
 for <igt-dev@lists.freedesktop.org>; Sat, 20 Sep 2025 05:00:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPPICi/L2enJ9siPHBs0OkoW0zbcMeQ/ywDCgeMBT3UZnYejTTDJdqtj1w2KvNMcDSABIPYK86Ks+vblKrtfYVcuXRuztKJjYrt+1mFkxQtU30XYsdBrd8T0vvQU1ZM9S714pBODyymQO0m98cAgetylLsPGBxGmwx02YLSnjrVoTausEu6Z1ETxbqio3luzNehZH1ktFyJCo+A6PqQkBXylUBnxjzdgLfKXrZU7o5I897io1g21w3AuV5q8lpNzBCYbvWHbbsfjZEMjcnbgvb4pDMk7+cPnviRO8JzLNpXGv9r5PPQJy3x9Cptkf4EFHEjv6CXAZIwl+N5GvCDWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A19nA7LTpnegrkxDoREUDLCqMjohayNjB/IAiPS9g/o=;
 b=MRVh2fZ3SaKx18mBbAT8G7/KGrbvfKS0TyM2ebbee9sFJ17z/QH60NHxlLxAe2ZgpLG8WChFueoWe72ANTyUQSDo3UCV2AMDHNDWt3Is0bQ6mQJ72qTrracsdWkq+25Py0j6rkz2SWH1jFR9QF3+lH+UO4vu5N5GG05fRtNRjK6qAt/gIq0q1MxLtCap+AAFe6x1iPe5Gq4t2oehF5tW0ArUWATB11JYHC1RkInpoWFJCkjF8/+BVj3nMOj2x5hELOSglKPsu46V71g9ynpEhXnbDVL+ohg0C9AmTu7yaCgWFfPeEeLjHQtcPJcansMlb/T05rRC8Od2NYfuPGYHVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A19nA7LTpnegrkxDoREUDLCqMjohayNjB/IAiPS9g/o=;
 b=xJGfkR1FzNFkFcpTa0dnlb18UhgfDWA/JbSrmYxMdM5y+eh6a8UNz3LIAUM+tK0mSiMZIogaqPz3S6eC8gnOZ4RF5hFS5bx29jFUOSYxOSpeY1Mpw6uhRiC50vzOVNaVea9EVm9sB3XLzuRj1M7r9XEUI7l1VBZZcsAH1BAcVHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Sat, 20 Sep
 2025 05:00:16 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.9137.012; Sat, 20 Sep 2025
 05:00:16 +0000
Message-ID: <604a313f-48e8-4ccf-bf8b-2a58b1705119@amd.com>
Date: Sat, 20 Sep 2025 01:00:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX
 7600 until proper fix
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Liu, Leo" <Leo.Liu@amd.com>, "Ho, Kenny" <Kenny.Ho@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
References: <20250919165538.70152-1-vitaly.prosyak@amd.com>
 <BL1PR12MB5144BBDD90431995DCF16A4CF711A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <BL1PR12MB5144BBDD90431995DCF16A4CF711A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0224.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::23) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: ad35b137-9eea-4f67-5c2c-08ddf8029690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXo2SDhvZ3lVYnpSNnQxc3JPN3RUWnhpQytzS3lJM3RhZWllSHhaR3pwdmRH?=
 =?utf-8?B?T1pva0dqaGhTUVRETDdtUHhSUlFISGVXaDhXelcyamFCRmpxTzN4NDJhKzZJ?=
 =?utf-8?B?Mk1EeWhXRTV5OW9jcGlqeVo5djBXYjhhU0hYejZsZDk2NzF4T3dZbm80UDgw?=
 =?utf-8?B?QVNVVGlhQ2VXSDRrZk1KM1oxS05TakhBNlZWakJYNnhjd0dsTUM5Y2NJL3FN?=
 =?utf-8?B?QWd1dEhyOTRHSUR3Vi9HZkZzS3o5TFlCaTdta25QdkZIMlRzV3huZm1KMFZI?=
 =?utf-8?B?cm9pRWxnMmtTVjFFbFVnR0pncGNCVlJnNzZIK3FOWmtpbEI3RDU0WkVSc3lt?=
 =?utf-8?B?NG9MQ0pvc0YxOElINHVadlZUdXBiUVFXYzcyLzJVekFMMFZwTDh4RW1QWERK?=
 =?utf-8?B?MHVkalU4TXYrNWJaM0RHdjlaOXBKYk8zb2QxOW5qQzVWS01aeXAva3J6aGVk?=
 =?utf-8?B?Z3M3Snd6akpTcWtIbW1XWTM3cEIwSUdWZ3Q2ZWI1bDlWR3cremdndzRPVXVo?=
 =?utf-8?B?cUdySStHeWtFNGo2aVRUL3B6ODJ6ZTlxOVc4NXB0bEEvcU1STC9sdUZtaGJ4?=
 =?utf-8?B?d3l2b3VVSEFVMCsybnlvNGZGYVQ3ajdycjk0bGlmeVJuL2xSMEFCai8zU2ls?=
 =?utf-8?B?TXl3V3E1MlpTTHBmSFJxSDM2aEp0VEo3S0Nad3RjTlNYNDJrMkVuTjJtaFo5?=
 =?utf-8?B?UGZqOGZoeXgySDVHMVV4S00ybDlFdWFhMkk0eDVsUjJpWlJQUkNEU3EyZWQ5?=
 =?utf-8?B?ekJqUlZDVEt2ejlqL1lLU1QzdXpvQ0o0SFNxRXpFeFRKWmN2cm9zTTlpQnVF?=
 =?utf-8?B?RFl5NU5Id3Y4RkJwUmRHdEZRMWM2dlZtZkI0TkhjVjFUaXFobVljbGlNM1FW?=
 =?utf-8?B?d2tIU2FHbi91SnBVRWcyc2RNQmMvaTF5SHByZjhwZkxka3R5SmcwSkFjRUF1?=
 =?utf-8?B?R0tZYzFNc3hydVFlR0hWbUFhNk14SEp5V051YmNmcndIUVFzQ216dzEza25D?=
 =?utf-8?B?b3lvalhCK013QzFxdm9IVlZCeGlvb20wYnNrWFFvQ0RZVEpRNXpSM3Vabzho?=
 =?utf-8?B?cjVCUmlNSndTL3h4eGpydmVzVkpZZllVdXRJT3hSMGduY3NzSkwwSnRQZDMv?=
 =?utf-8?B?TS9KTEJrdEpab0FPUVZtc0VkeDUxRnlKRW4vWnhnRHpWYk8yaHV4UWxPS1Ir?=
 =?utf-8?B?Tm41WGVUWVhlVHhpV3ZKeXVWZjJWcUtydmlkVjhWNGZaY0MrL1krVDk3NTdK?=
 =?utf-8?B?Ymk2ZGpCd1h0QkpvQ1ZkZXByWS9vK1ZJOElHNXlXZWF2RGV2OE00WDZMYmVq?=
 =?utf-8?B?MmlKVE1MOVVxUktHSXpxbFN5aTdoYVMrMDhBcGorYkFrWlZEVU1iZ1NOenhS?=
 =?utf-8?B?MW9yTzkvQTlBTGxFaGVlSTg5dGxwbDJEUExtVmhNZVVYWUNnQmpXN0ljOW5t?=
 =?utf-8?B?OHdCaW14WmdMWEZKRU1JYVhib1d4QTJSQXREb25WTXVSR2c5WDZqcWpTZGFS?=
 =?utf-8?B?VFF4SWNIbjA2dzZ4NkFFL2sxMktsSE1xa09tc04wY28wVWNDNElmK0U0ZWN0?=
 =?utf-8?B?NzNIVUZNVHdMcFBVb3NWaHlxRmdUYXJsb3U1YWt5QjdyZHBQdkV0VmxXQ0Mr?=
 =?utf-8?B?NTFEYWVUQ1N6SE9uM0JLQkd5SEp0Zy9MMW10VUV4NUgvdklrK2dPNnIwMzRI?=
 =?utf-8?B?cmRSWnhvTmV1d3lKV3BLdzRlaWNEaTZmOWRsWU92MytrcG5Vc0Y4SURQUU1v?=
 =?utf-8?B?ZFJ5NEJ2NldXMjhBeXVQTVRaNTVaV3l2a3ozQkJwM0tsWExwa3A1S21Wenhi?=
 =?utf-8?B?enVwQUU1K2t4WjlxbGNmdXdTek14MVdVd2pQd2xIQXdhVXZYNGd5Zk1DU2ov?=
 =?utf-8?B?N1VzOFNvaTJDS1dRanJreWZHbExNUTVKU0htcXpIR0h1YUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjNwWFlWQVNaaXF6S3JyTlppZHFIbDdmTXdjR29ZNnVkQnJYdDlPS0dBSC96?=
 =?utf-8?B?b0V5ZzQvOG1xTnpJZ054ZkJ4bDkyNndHZEFyTmRmdFFBbFhYSzF3SFJPSE1Z?=
 =?utf-8?B?NDVLazczRXZKVllJTW1qWDZ0VkxxRjAvR0RmUkNzY0l4QnFrVTVOL25IaXdQ?=
 =?utf-8?B?MW03OENPVnpRMWJmYTl4ZXV3QVAzdytwSWkyK3hwbTd6bkZLc1lHa3J3RGt6?=
 =?utf-8?B?YjdhNnE1UUpLZkZZeXh5Z2U1a2pQRk5DMXhMaURyMTF5eXBqSkg3aWxFcHhH?=
 =?utf-8?B?YXBYY2lnNE96djVTV0tJZVRFblRUMGRubVZKNVFGNkNMYXBXaXdJOFZ2b0Np?=
 =?utf-8?B?aXVMb0RrTnFpRWRyOW8xbHZHZFZWZkVxY3Z1RnJORW4yNm9rdmNkOUpWem44?=
 =?utf-8?B?RlF0QlJYUm0rVEQ4YmYvZjRkKzhaNmdWQ1hacTBncDlVYVhaUnltbWJ5bmpN?=
 =?utf-8?B?YXo1VEVoOG5pcEZoR0N6aUp2R2M5bDh3REhFaVJMVklxR2RMNUgxb3BTQWlK?=
 =?utf-8?B?bThmSlhOU1NxSHhFTHpJZXBoc05YNFVXQm0vWXpEa3N1K2ZDSlQ2MDd3VEh3?=
 =?utf-8?B?c041WU45Ump2L1lsNUR5dDRPQWRPMzg2NmlpcnM1bHpNdlhPbWdPbFRWZjFH?=
 =?utf-8?B?bUsrZkxHck8yajZHN04zUkkxNThPUitkNTU2cWZSclRWa2xPUWcraFFqVFJq?=
 =?utf-8?B?MUpDS0YySS82ZVdneTJ0eUpFWWR1SlZwVmtPY2JXdTdUWklUOERLSWd3ZWNq?=
 =?utf-8?B?YnFtZFU4R3JLTSt4Qjl0WUFvY1p6SDltalV2bU9yaFhqOENuMTNaUmhicEtk?=
 =?utf-8?B?UW83YXA5bVZ6aWN0NGk1RjZaZVpOTFNMU1NIKzI1cytJekNNbitqdlUrN0Nr?=
 =?utf-8?B?UVd3ckozdm5vODg4YmxhKyszK0M0dnpUSDdKcCtRelVESUZxTVQwY1FYKzRl?=
 =?utf-8?B?TmFFM29mRm9IUUtsb1R2WTVySVVweFAvL0Yxc2dhQWhtMitnTDgyQmd6Q0lT?=
 =?utf-8?B?c1o4Y1dZeHlTOTZkMXkzdjNpUHN3ekFzMmxUWWt5bFZSWWVIdTRGZFBZUjFO?=
 =?utf-8?B?YVNaWjIxQUhtcUY3NXYvYXpmR0w4MVVyWHo2dFlIWVNxNTBHQUJFd2NrL0th?=
 =?utf-8?B?SzZoSXNiUjYrL2tSeC9FZE5Pd2FQME8xUk80R1czd292YU5MUFYxSSt3ckk2?=
 =?utf-8?B?UTYrbjQveUJyQTJsUVBGMERhZXVvK3FBTXNqc2U0akJEUGdwSmxKZWdrRlF1?=
 =?utf-8?B?ZGV6Mk1QS1JpK0g5OS9UNkFYTHZ0UHhKOW83aWhTVHBPZHh1ODdua0RJNE1S?=
 =?utf-8?B?V09TMnFaaHpCdkJNRFprNTVIWG9vNmM0MUEzYWJTckpIaC9xMG1XN0ozcHBZ?=
 =?utf-8?B?WnR5RkhTQjEvV2plcG8xT1hIU2d0QlVwQXlUVE85UzA2QTBOdE5qWXZQUFFN?=
 =?utf-8?B?Z3hjd0U5bU9CbG5HVjU5dVFvalowbHErYnBNRTdjL2dUeElhV24wNlYwL3JJ?=
 =?utf-8?B?dWlIWUxVTWtvL01VWkxiK3VBSElwdkVrOWFKUjJLL0c4MTZxRm4vUGxuRnNt?=
 =?utf-8?B?dHowZWoxcE14RzlZVVdLakp1UisyRGxteHd0eW1QajVNM0lpeExBdEgzbEF0?=
 =?utf-8?B?Vyt1TVoxYmk5U3ZBU3RtV3hub0JiMFZWNUdRc3BYRDlTM0Zyc3BSSXl5RWph?=
 =?utf-8?B?ZkMvc3dINEQ3NDhoSU9rcENKRGJxS0ZrdjdmMlBnVnpHUjJGRmhoWnZPckRX?=
 =?utf-8?B?cmRHZ3NQZUFTSER3enRxZFhsMVRGWHJkcHljM0pCYmJIZmxZbS8rM1ZHa3Bn?=
 =?utf-8?B?UEExSGJOU01wdW1PZjN2RUg3Q2dGQmNQNlVsakxDNVpuTE9KVEdobUNrVElo?=
 =?utf-8?B?Q3FuYlJXNFk0cHk1Rml1OFFGTmlRbnZqdnp5UFMySlkzdkx5ZEQ3aElYRjNp?=
 =?utf-8?B?YlEvY0p2ajUxZU80KytOSVBDTXdHelZKUVc5OVB1cGUybitZUFZ5Skt6amJ2?=
 =?utf-8?B?UVd6ZUZaUXBESm50ZCtIOXRzc2NLNEZLWnhkUWJWejNZbWtSNlR1bFZuakgr?=
 =?utf-8?B?QmsyQ0svcUQ0czZmNDhENVJ1Zi9WMGEzbnZJVzFhNTIrNVJnVUkxRlQyZVdP?=
 =?utf-8?Q?AcNxX2GFo0boG1Vj6ZNpfk++J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad35b137-9eea-4f67-5c2c-08ddf8029690
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 05:00:15.9656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz4VCYBU8M113aFBNs8O3JG3DIjx2sM0LjRq7c5AyrOW2p/5fW7trPVUtnOZkrgOHltWHxFvk5XM2uLXP0BdUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688
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


On 2025-09-19 16:55, Deucher, Alexander wrote:
> [Public]
>
>> -----Original Message-----
>> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
>> Sent: Friday, September 19, 2025 12:56 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Liu, Leo <Leo.Liu@amd.com>;
>> Ho, Kenny <Kenny.Ho@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
>> Subject: [PATCH] lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX 7600
>> until proper fix
>>
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> v2: Fix comment to GFX12 (Alex)
>>
>> Cc: Leo Liu <leo.liu@amd.com>
>> Cc: Kenny Ho <kenny.ho@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>  lib/amdgpu/amd_vcn_shared.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c index
>> 3888ec112..61075d8db 100644
>> --- a/lib/amdgpu/amd_vcn_shared.c
>> +++ b/lib/amdgpu/amd_vcn_shared.c
>> @@ -59,6 +59,13 @@ is_vcn_tests_enable(amdgpu_device_handle
>> device_handle, struct mmd_shared_contex
>>               context->vcn_reg_index = 2;
>>       }
>>
>> +     /* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id = 0x51, family_id =
>> 152) asic_id= 7550*/
>> +     if (context->family_id == 152 && context->chip_id == 0x51 && context-
>>> asic_id == 0x7550 ) {
>> +             igt_info("Skipping VCN tests on RX 7600 (family_id = 152, chip_id =
>> 0x51, asic_id = 0x7550)\n");
> Not sure where you are getting the RX7600 from, but all of the GFX12 boards are 9000 series.  This board is a RX 9070.
Thanks for catching that, Alex — it was just a typo. The next patch includes the correct reference to RX9000.
>
> Alex
>
>> +             return false;
>> +     }
>> +
>> +
>>       return true;
>>  }
>>
>> @@ -188,4 +195,4 @@ vcn_dec_cmd(struct mmd_shared_context
>> *shared_context,
>>       default:
>>               igt_info("Not Supported!\n");
>>       }
>> -}
>> \ No newline at end of file
>> +}
>> --
>> 2.34.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27356C021B8
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 19:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D399410E0E7;
	Tue, 25 Feb 2025 19:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UnOyxEXW";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF75610E0E7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 19:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDhWzXp2S8EnPQRFc8aIseGiJKIPQgXI8shpXifX4GwGhc8B2PF6xaomO25ffdbO4Q4SYrFD8gYnNejkP9D3VRYe5c7EyO+uHO+QqdS3soitXRWTtCJAqCSx8FngLXBW/vZw+TeNJHL0rKpMrPNySKcnc67hu9jfzR8CVYIAmAwwfqSp1BwEfFsSZrDTEpBNCfQLh8zJzVu5oY9PSl4uh5HeBvOcJXdQNmVPGht60yy55W5KZm4guSJvaHhZmRsA62L+Blo6PyMvDJpPzQXBh636T2hpBXb0C7wAULGgIAbgRgV5zV5e4rlcw4IzzZtX9KU3M7zKk/4afRTplPKdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x30Dk+7u2FyCt9BNWVrXZBtoD6E7ClcOimj8gJVX9nc=;
 b=fJwCKUHFZrikIuRJjDPf6E4Y84OgUU+1ZRQ3Fd0bj7JvXWezwYYKoJn5KyrAxblxMfpDldEa0UK7CfW2IEiGDcKygF4Ex3t6XM5x73CfsBFCAgGrSFjE4ZiQLbDAQ/x+cRVnl7EgwR+SxpM7BjAFLWsV8cqeuNGo8qQzpXvXmqI3jHL5uqur1Nj3RdNkd4jeqjIQjisdw0Qg4PJNly+3GUg/ytD9hDt4qOvUlEdvSN8gx/61NNAWo+eRl0aAt6bhdIq8WKBBxkgQ7qH35i/eOvx84rV5UjA4U3vx63x2cRxCl2aY6KdFAEEwYoqbQ4+NBCXELIuOZNCNwS4nQVFSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x30Dk+7u2FyCt9BNWVrXZBtoD6E7ClcOimj8gJVX9nc=;
 b=UnOyxEXWDALofUiEJooszHQ+cLjjdRMbkY1B/oZgCsHe+RrSLHtoxICJI3pDk6UHudMU++VM13heRIXRDDffPVItMWY7RvYAtXdZMTpdGWsV67K5guVhzCzt1t8PI2ICFYGleJFZd/DNySeyXDLgnBKAk8WSnrCJtciRDvzJ7r8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ0PR12MB6968.namprd12.prod.outlook.com (2603:10b6:a03:47b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 19:06:11 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 19:06:11 +0000
Message-ID: <41966687-e25e-42eb-a6b3-fba5d6c85e16@amd.com>
Date: Tue, 25 Feb 2025 12:06:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/kms_async_flips: Create subtest for overlay
 planes
To: vitaly prosyak <vprosyak@amd.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com,
 Harry Wentland <harry.wentland@amd.com>
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <20250219103703.2hbadorsyh5ezd3e@kamilkon-desk.igk.intel.com>
 <5b88ea25-c9a6-4025-8f9b-34e1b213e258@amd.com>
 <78c0bb06-fb95-443c-a16c-9478daa11562@igalia.com>
 <a8fc5cef-5ccf-486d-b401-f587e500746d@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <a8fc5cef-5ccf-486d-b401-f587e500746d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0184.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::18) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ0PR12MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5d14f9-3410-4cd0-90c2-08dd55cf77f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFJxOVF3NW1ZOHcxMGNtNDFQMlJjNjlwZTNLdE1RZWR1Wm9RcHZQeDE4eDJm?=
 =?utf-8?B?QXRuK0FXRlpZdFJOZUJEbTdBZkx5TVpKYmE4ZUUrZW9qL2JqUHhEdDdhTjY5?=
 =?utf-8?B?cUJoa2hVY3RCOXlZZFE2MDZOeCtodDRvZG9QOTMyTkFOTHRsMGNnbzhmVDBM?=
 =?utf-8?B?cktaMU9LTndkdFlVTUkva3FOVTVqVWV4TktSZ21EajRJdnhEcjZZUU5WajNS?=
 =?utf-8?B?SE1DNkV3OEwvNmVZQ0YyWHZYMEk0bzJldkJCR3IwNndJL0F0L1ZVTzR0aTlq?=
 =?utf-8?B?dWdFbmliUU10ZHFpWlcyQWgzVE4xM1Z2Z0NaWDAwRFpvSVpFRTk0RlBZZGxU?=
 =?utf-8?B?YTQ2TXVuQ3B2Q0VZOUUzYkF6cHUycXhUWlZ2dllpYlhiSVI2T3N6Q3dMZmpz?=
 =?utf-8?B?WlkyYVhWZEc0Z00xWVVER2kzd1BwSmUrWlMyYjNBK1RXdmpoRll6RU1RY3BG?=
 =?utf-8?B?TkNQdFI5aWZFV1A0NUhNS2RyNnQxMTkvR3VOWEprLyttV1V2LzFNNCtZVkcv?=
 =?utf-8?B?VzBhWXJCRGNhL2x4TjloaXhod2ZlOFdkTnZGcmxkaEU3T2VMb1ZTTXhHTnM1?=
 =?utf-8?B?amZteS9yVC9EVngyZXJucnJjWVFtK0hPL2RjM3k2NVNSdTZoRU8zQnRuUEJX?=
 =?utf-8?B?VUl1SUdTOC90RUNBaWNuM3E5eWhtNVFMd0lMU1lUb0xGZWU3c0NWSndMVEVa?=
 =?utf-8?B?Z21yaWloaWxvUkRXTjArdjdtUWlnT0FhY3phbmRTZjI3Q21nN1lYclh1WHlM?=
 =?utf-8?B?dkFDM2FhYTNMMjRkcUtkV1ZOVGtSTlJ3bFlSa2VxYVB2VVo5L1REcVRmZmJx?=
 =?utf-8?B?K01uajkxS0hRbXJwbEdBT3pwNTNCZ0ZWajBNeHowQm5iL1VjbC9QUDlIQTZi?=
 =?utf-8?B?dFFkZUtqZ1o1Nk9xR0xkRkhmenJMTjJpUnhVZ2pnbzBQK0tHWVBDbGkwY0tO?=
 =?utf-8?B?c2wvQk00ZVp3VGpkbDNFR0dRWnZnY3kvb25USkZCa1h1cTNtZW5LMjJZQnpu?=
 =?utf-8?B?SDlxNXIwSURMRzZ4K05pR2RoTzZlSy9zSmtRY283akIzYy9HVmIwZE5weE5Y?=
 =?utf-8?B?WkdNY04ra0x0WFZnR2RpdVRseTN0cVB4YkV0OHk1VkR0cjd4amZDajNoT1l4?=
 =?utf-8?B?M1A3UmUwMzAwcnh5MUtLR293OFp3dHFIcSs5YkN0NnlKTGd4ejdPUHBnMktS?=
 =?utf-8?B?azVGaG50bE53OVlMSzV1V0ZFSE55dmlLM0lpbitlNVJLdlA1MzMxRUF2bUM5?=
 =?utf-8?B?M0FzcUUzRlV0dzVGOW9ibEEyT2Zma0VWT1JJNGFkY2RPZWN6dklZdXE1L3l5?=
 =?utf-8?B?STQxUDMzcEFNSlZNQlRjUzN6eWVqeDEzUUsybURZK2FGYWRKRXdFMzB0eGZZ?=
 =?utf-8?B?SVFjVzZ6MFVwRUhNNHc2K0U3c0NJZEMwczZZVTJnQ250bWV1RFdHZnFRM1dy?=
 =?utf-8?B?Tmx6dkhNVGpTZnJVYklORFYwd2dWVUxaUHdLR1NvWmN5c3FFNWQwNFVEN3FR?=
 =?utf-8?B?RllhR1pnM1pqd2w4UjZGS2RBUEhHd3FSSFRVNHBUL3RiZk0wQytnVjExSGt6?=
 =?utf-8?B?ZklYbFdlOXFVVEFRb1dWYW1DZkpnSWVBdWNpYi9qVTROZEk2dGhJODE2RGNM?=
 =?utf-8?B?Z3BhTms5WGZxbS9SanQ1dWVMZk83c2t3elB2U3hVb0UxWXAwNnU3SWVvSmFl?=
 =?utf-8?B?eWhXYlYrQ3JMK25RWE9pVGloL3p4Z2tFR3hLcDI4S3hMN0QwRkgwYm8ybVlO?=
 =?utf-8?B?ZG5lUy83bXplc3dsNGwybFgyTW5FOUhKNnlXZSs0TkNsVWdWQnVNeWRKZWIw?=
 =?utf-8?B?NDBKM0NySDFZQTNseTB1M3haK3ppWlV1S3dTK1JlZmhTbTZZMDRzUWdBZXFj?=
 =?utf-8?Q?GszsWaWso0UW9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmdKV0VVaGVpYUcxT2F4RTVPS083dkt2cWs4UDR2Qmw5d01FN0NaajJZUldN?=
 =?utf-8?B?bHBpUUtML1BYNWlzUDlsWTZiRHNjSmdwS3dVOWgwNDdxdWx4TFVRcWFjbEJF?=
 =?utf-8?B?ajJrcjFYc3M4a0IxWHMrRENLMC9pamZTWDhVSlpkMGxmNXpUWW9GeWRPK05k?=
 =?utf-8?B?T1hHSEtLNEtmWGxjcm5GK0FMTXRqVjJYWkFrbEpaK0NmZGczVGI0ZGg5bCs2?=
 =?utf-8?B?WkhieGRvdG1veFZ1VlcwOUVzMHNpNXYyOVpBU0txSTFDT2xzY2pMazR6RkR1?=
 =?utf-8?B?ZkdFckd1cDIwSjhEU1pFd2NBMnB1R0lkUW9qS3NNc2tiQ3N1MFRXOGNoQlRS?=
 =?utf-8?B?bCtWWmsrVXFjRXlFd2xiaFp6Ym50WUluN004ME54VkdoVEIwUmFFSUd3L0tY?=
 =?utf-8?B?cWNpUDdXa3VsK3RIMTZnUU1UOHBuK2R4Q2t1Zys0Mjl3MTJHS25nUVEyN3ZY?=
 =?utf-8?B?ZjdKdXVZT3E2QVRvYWEwRWxWUDJZVUtZWlpGSDYxSnYza0pSYzZUaDNmVXg3?=
 =?utf-8?B?UmpOSXRET0g4c2RTZTFEQzZjVmJvSE84L0RQUlY1bElBanJlTHRnK2dqY0pX?=
 =?utf-8?B?SEM0WUlwVVhaSVNvUHJCWERnTEF2VnZhZ2kxcVhjeHBiYlYvaFZVSGc3YllJ?=
 =?utf-8?B?RzF4NUo0QXJJK3FwUXd6Q1paN2ZzL3dZTHIxR3VubHl6SGVwQUR3UDc0bUdE?=
 =?utf-8?B?dHNBNDd6aEUvRzdIY0h6QlhmNElVNURxRTVoUTNvcjFIaEhWMEtKbCs5MWpG?=
 =?utf-8?B?a3FnUFhjdytacy9ZTmpQR3dBbHRvNnBmMEJKU1F1bERaM1lYaHpoamhhMkpL?=
 =?utf-8?B?cGZaR055MmYzWHYybXhCcXJuOFFuRzBYZHVGOWUrcFZPOE9tRFVTU3E2WGZt?=
 =?utf-8?B?ZHQ4TzYwSFBlV0tLQ3BOTFdLOXdFdVh2bEc0TkY0UW1IVEpJRWtBemNKM1VM?=
 =?utf-8?B?NHZyL1hsVEVBdUQyWm51K2RCbW5Ub05STjhaZHFzeWhDV3JFcXpJZ2o0eW10?=
 =?utf-8?B?MjFlUGdaZjNpTFNTektoTFhJVXhxTVFPTmkraDNWQ1ZXRWxMbE00UGVaL0xT?=
 =?utf-8?B?V3RqSnRZTzkyWHllZlJEY1MySmtpQ1FQcVVHZ09FY0RKRTJiYklHek1TR3I0?=
 =?utf-8?B?T0lYaHZWWjBkNUFBTk84QjE5NGRXTVZQQzZiOFFKcDY0elRCL3FyeG9JN25y?=
 =?utf-8?B?Mm9ac2U1Zi9pTk9YS1EzTWpORFVsY01qRTlRNVhYd0lLaEVhRVZUUi9uZzRH?=
 =?utf-8?B?UzdEYWFubE9mL0NVMXc1dkZCNURnbXNTMVBoZ1pyNGhjL1FyWit3WS9MZWNy?=
 =?utf-8?B?TUo5WjNDb1Y2N0xLNkRiQmZ1b2x4YmtZcTlKUlBRZ3NralJWTGxadkVHZnNW?=
 =?utf-8?B?ZmhuaGR2b0RPMHFxNXJwVWVhc1o2aDVnaEUzOFVlMHJxYVA1VnJWbFBsSm9F?=
 =?utf-8?B?WVNSbU4vRGJ3NkFmU3Y2MzJzTFErOXRYNGJFUTBSb0JSWTlPSEVCNjFGaFNW?=
 =?utf-8?B?aU0rOHFNUmZJcWtwMXcrbzN4WG1KMWJSSy9uRTlwYXh0VGsrclp0REVWK3kr?=
 =?utf-8?B?UzVUN1o5bjJyVzhrMEEzb3Y4VlVLZjNwVUVVU212QndVV0FSQWo3cmZBTzIw?=
 =?utf-8?B?cWhland6TjJhUVNjdTlsaWliQVQrTWt6M2p3ZnVlNGt6QnlBNUUvajZwZ0Fm?=
 =?utf-8?B?akp2QWVWallwTWQvY1J4VmNGODY3Mk9xVDdpNGI1UWtta0FON0hPOHMzZTAz?=
 =?utf-8?B?bWprcmUrM1drWUYzSzBWV1pxcWpRWHRMMm5sNVdsd3diTzlPWkFhVlQxS3FY?=
 =?utf-8?B?RjVDTEtwYk1JTzBZV2RoMVpRVEtvZXJYdGltSnE3UEM3OXpCTk8xdS9zTGE1?=
 =?utf-8?B?VTRQaUtxaHlKS1Ztc0U0TlNFbDdoa1ZXRzNTczJpU3pNbzZPVFVlajZzT3FH?=
 =?utf-8?B?NkFhdGpFdGZMVkIzQ3kySU1oRXhDa2ovN3prV3JFemlwZzZ4U2VSTHhISVZI?=
 =?utf-8?B?NWIwSWhWQ25FeERIS1p4K2Y4cTd5TDdCVmkwbjczRzNjemlBQnE0UTErN3VE?=
 =?utf-8?B?VXhjTGQ2SG5tMkZoMmRzRlU0ZlZhbElnbmh1Z1pWdmNGV1ZXbTUrVmoyK0lZ?=
 =?utf-8?Q?7zX9k27t4pyf+J7dVGCc2N2VK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5d14f9-3410-4cd0-90c2-08dd55cf77f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 19:06:11.7900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5xceiQsD2M2eLAIWqat3pqdSUCiKr4d5vB56Jf9gt3vNdlBMqi3AUimXpBnLy8uoLfg0NLuZYnb4OagukgB0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6968
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



On 2/25/25 08:51, vitaly prosyak wrote:
> Hi Andre,
> 
> Apologies for the delay.
> 
> On 2025-02-25 10:42, André Almeida wrote:
>> Hey Vitaly,
>>
>> Em 19/02/2025 15:06, vitaly prosyak escreveu:
>>> Added Harry and Alex
>>>
>>> Hi Kamll
>>>
>>> Thanks for the letting us know.
>>>
>>> On 2025-02-19 05:37, Kamil Konieczny wrote:
>>>> Hi André,
>>>> On 2024-12-16 at 17:24:27 -0300, André Almeida wrote:
>>>>> amdgpu can perform async flips in overlay planes as well, so create a
>>>>> test for that.
>>>>>
>>>> Vitaly could you find someone from AMD who could help with
>>>> review and testing? Thanks!
>>> Alex,
>>>
>>> Can you help with DAL CI to run this patch ?
>>> Thanks in advance
>>>
>> Did you managed to get this running in the CI?
> I currently don't have access to DAL CI.
> 
> I've reached out to Alex again via Teams and will keep you updated.
> 
> Thanks, Vitaly

We don't have a CI to test individual IGT patches so I tested this patch 
on an APU and dGPU with kms_async_flips

== APU ===
...
Starting subtest: overlay-atomic
Starting dynamic subtest: pipe-A-eDP-1
Dynamic subtest pipe-A-eDP-1: SUCCESS (2.773s)
Starting dynamic subtest: pipe-B-eDP-1
Dynamic subtest pipe-B-eDP-1: SUCCESS (2.772s)
Starting dynamic subtest: pipe-C-eDP-1
Dynamic subtest pipe-C-eDP-1: SUCCESS (2.772s)
Starting dynamic subtest: pipe-D-eDP-1
Dynamic subtest pipe-D-eDP-1: SUCCESS (2.772s)
Subtest overlay-atomic: SUCCESS (13.686s)
...

=== dGPU ===
...
Starting subtest: overlay-atomic
Starting dynamic subtest: pipe-A-DP-1
Dynamic subtest pipe-A-DP-1: SUCCESS (2.160s)
Starting dynamic subtest: pipe-B-DP-1
Dynamic subtest pipe-B-DP-1: SUCCESS (2.160s)
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (2.160s)
Starting dynamic subtest: pipe-D-DP-1
Dynamic subtest pipe-D-DP-1: SUCCESS (2.160s)
Starting dynamic subtest: pipe-E-DP-1
Dynamic subtest pipe-E-DP-1: SUCCESS (2.160s)
Starting dynamic subtest: pipe-F-DP-1
Dynamic subtest pipe-F-DP-1: SUCCESS (2.159s)
Subtest overlay-atomic: SUCCESS (13.952s)
...


If I run overlay-atomic alone (i.e., --run-subtest overlay-atomic), 
overlay-atomic fails as below (partial outputs only). Is this an 
expected result? Does overlay-atomic need to run along with other subtests?

IGT-Version: 1.30-g8fee6d12c (x86_64) (Linux: 6.11.0-18-generic x86_64)
Using IGT_SRANDOM=1740510058 for randomisation
Opened device: /dev/dri/card1
Starting subtest: overlay-atomic
Starting dynamic subtest: pipe-A-DP-1
(kms_async_flips:3180096) CRITICAL: Test assertion failure function 
test_async_flip, file ../tests/kms_async_flips.c:361:
(kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
(kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
(kms_async_flips:3180096) CRITICAL: error: -22 != 0
Stack trace:
Dynamic subtest pipe-A-DP-1 failed.
**** DEBUG ****
(kms_async_flips:3180096) DEBUG: Test requirement passed: 
!(is_joiner_mode(data->drm_fd, data->output))
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3440, height=1440, 
format=XR24(0x34325258), modifier=0x0, size=0)
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=13824)
(kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3440, height=1440, 
format=XR24(0x34325258), modifier=0x0, size=0)
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=2, pitch=13824)
(kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3440, height=1440, 
format=XR24(0x34325258), modifier=0x0, size=0)
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=3, pitch=13824)
(kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3440, height=1440, 
format=XR24(0x34325258), modifier=0x0, size=0)
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=4, pitch=13824)
(kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3440, height=1440, 
format=XR24(0x34325258), modifier=0x0, size=0)
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=5, pitch=13824)
(kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3440, height=1440, 
format=XR24(0x34325258), modifier=0x0, size=0)
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=6, pitch=13824)
(kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3440, height=1440, 
format=XR24(0x34325258), modifier=0x0, size=0)
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=7, pitch=13824)
(kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3440, height=1440, 
format=XR24(0x34325258), modifier=0x0, size=0)
(kms_async_flips:3180096) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=8, pitch=13824)
(kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: plane_set_fb(151)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: plane_set_size 
(3440x1440)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
fb_set_size(3440x1440)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: plane_set_size 
(3440x1440)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_fb(151)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_size 
(3440x1440)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
fb_set_size(3440x1440)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_size 
(3440x1440)
(kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
(kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
"MODE_ID" to 0x96/150
(kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
"ACTIVE" to 0x1/1
(kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
data: A.0, fb 151
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"SRC_X" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"SRC_Y" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"SRC_W" to 0xd700000/225443840
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"SRC_H" to 0x5a00000/94371840
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"CRTC_W" to 0xd70/3440
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"CRTC_H" to 0x5a0/1440
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"FB_ID" to 0x97/151
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"CRTC_ID" to 0x5b/91
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"COLOR_ENCODING" to 0x1/1
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
"COLOR_RANGE" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
data: A.2, fb 151
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"SRC_X" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"SRC_Y" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"SRC_W" to 0xd700000/225443840
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"SRC_H" to 0x5a00000/94371840
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"CRTC_W" to 0xd70/3440
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"CRTC_H" to 0x5a0/1440
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"FB_ID" to 0x97/151
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"CRTC_ID" to 0x5b/91
(kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
data: B.0, fb 0
(kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting property 
"COLOR_ENCODING" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting property 
"COLOR_RANGE" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
data: C.0, fb 0
(kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting property 
"COLOR_ENCODING" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting property 
"COLOR_RANGE" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
data: D.0, fb 0
(kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting property 
"COLOR_ENCODING" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting property 
"COLOR_RANGE" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
data: E.0, fb 0
(kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting property 
"COLOR_ENCODING" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting property 
"COLOR_RANGE" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
data: F.0, fb 0
(kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting property 
"COLOR_ENCODING" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting property 
"COLOR_RANGE" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: display:     DP-1: preparing 
atomic, pipe: A
(kms_async_flips:3180096) igt_kms-DEBUG: DP-1: Setting property 
"CRTC_ID" to 0x5b/91
(kms_async_flips:3180096) igt_kms-DEBUG: display: }
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_fb(154)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_size 
(3440x1440)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
(kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
fb_set_size(3440x1440)
(kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
(kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
data: A.2, fb 154
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"SRC_X" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"SRC_Y" to 0x0/0
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"SRC_W" to 0xd700000/225443840
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"SRC_H" to 0x5a00000/94371840
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"CRTC_W" to 0xd70/3440
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"CRTC_H" to 0x5a0/1440
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"FB_ID" to 0x9a/154
(kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
"CRTC_ID" to 0x5b/91
(kms_async_flips:3180096) igt_kms-DEBUG: display: }
(kms_async_flips:3180096) CRITICAL: Test assertion failure function 
test_async_flip, file ../tests/kms_async_flips.c:361:
(kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
(kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
(kms_async_flips:3180096) CRITICAL: error: -22 != 0
(kms_async_flips:3180096) igt_core-INFO: Stack trace:
****  END  ****
Dynamic subtest pipe-A-DP-1: FAIL (0.227s)



> 
>>
>> Thanks!
>>
>>> Vitaly
>>>
>>>> Please add to Cc Vitaly from AMD:
>>>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>
>>>> Also add Jeevan here:
>>>> Cc: Jeevan B <jeevan.b@intel.com>
>>>>
>>>> Regards,
>>>> Kamil
>>>>
>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>> ---
>>>>> v2: Add test description for GitLab compilation
>>>>> ---
>>>>>    tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++++++++----
>>>>>    1 file changed, 41 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>>>> index 4a72be7b5..dd0907d50 100644
>>>>> --- a/tests/kms_async_flips.c
>>>>> +++ b/tests/kms_async_flips.c
>>>>> @@ -89,6 +89,9 @@
>>>>>     *
>>>>>     * SUBTEST: async-flip-suspend-resume
>>>>>     * Description: Verify the async flip functionality with suspend and resume cycle
>>>>> + *
>>>>> + * SUBTEST: overlay-atomic
>>>>> + * Description: Verify overlay planes with async flips in atomic API
>>>>>     */
>>>>>    
>>>>>    #define CURSOR_POS 128
>>>>> @@ -109,12 +112,14 @@ typedef struct {
>>>>>    	uint32_t crtc_id;
>>>>>    	uint32_t refresh_rate;
>>>>>    	struct igt_fb bufs[NUM_FBS];
>>>>> +	struct igt_fb bufs_overlay[NUM_FBS];
>>>>>    	igt_display_t display;
>>>>>    	igt_output_t *output;
>>>>>    	unsigned long flip_timestamp_us;
>>>>>    	double flip_interval;
>>>>>    	uint64_t modifier;
>>>>>    	igt_plane_t *plane;
>>>>> +	igt_plane_t *overlay_plane;
>>>>>    	igt_pipe_crc_t *pipe_crc;
>>>>>    	igt_crc_t ref_crc;
>>>>>    	int flip_count;
>>>>> @@ -126,6 +131,7 @@ typedef struct {
>>>>>    	bool allow_fail;
>>>>>    	struct buf_ops *bops;
>>>>>    	bool atomic_path;
>>>>> +	bool overlay_path;
>>>>>    } data_t;
>>>>>    
>>>>>    static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>>>>> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>>>>>    	igt_output_set_pipe(data->output, data->pipe);
>>>>>    
>>>>>    	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>>>>> +	if (data->overlay_path)
>>>>> +		data->overlay_plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>>>>>    }
>>>>>    
>>>>>    static void test_init_fbs(data_t *data)
>>>>> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
>>>>>    		prev_modifier = data->modifier;
>>>>>    
>>>>>    		if (data->bufs[0].fb_id) {
>>>>> -			for (i = 0; i < NUM_FBS; i++)
>>>>> +			for (i = 0; i < NUM_FBS; i++) {
>>>>>    				igt_remove_fb(data->drm_fd, &data->bufs[i]);
>>>>> +				if (data->overlay_path)
>>>>> +					igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
>>>>> +			}
>>>>>    		}
>>>>>    
>>>>> -		for (i = 0; i < NUM_FBS; i++)
>>>>> +		for (i = 0; i < NUM_FBS; i++) {
>>>>>    			make_fb(data, &data->bufs[i], width, height, i);
>>>>> +			if (data->overlay_path)
>>>>> +				make_fb(data, &data->bufs_overlay[i], width, height, i);
>>>>> +		}
>>>>>    	}
>>>>>    
>>>>>    	igt_plane_set_fb(data->plane, &data->bufs[0]);
>>>>>    	igt_plane_set_size(data->plane, width, height);
>>>>> +
>>>>> +	if (data->overlay_path) {
>>>>> +		igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>>>> +		igt_plane_set_size(data->overlay_plane, width, height);
>>>>> +	}
>>>>>    }
>>>>>    
>>>>>    static bool async_flip_needs_extra_frame(data_t *data)
>>>>> @@ -283,12 +302,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
>>>>>    static int perform_flip(data_t *data, int frame, int flags)
>>>>>    {
>>>>>    	int ret;
>>>>> +	igt_plane_t *plane;
>>>>> +	struct igt_fb *bufs;
>>>>> +
>>>>> +	plane = data->overlay_path ? data->overlay_plane : data->plane;
>>>>> +	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>>>>>    
>>>>>    	if (!data->atomic_path) {
>>>>>    		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>>>>> -				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
>>>>> +				     bufs[frame % NUM_FBS].fb_id, flags, data);
>>>>>    	} else {
>>>>> -		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
>>>>> +		igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>>>>>    		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>>>>>    	}
>>>>>    
>>>>> @@ -772,6 +796,7 @@ igt_main
>>>>>    		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>>>>>    			data.alternate_sync_async = false;
>>>>>    			data.atomic_path = false;
>>>>> +			data.overlay_path = false;
>>>>>    			if (is_intel_device(data.drm_fd))
>>>>>    				run_test_with_modifiers(&data, test_async_flip);
>>>>>    			else
>>>>> @@ -783,6 +808,7 @@ igt_main
>>>>>    		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
>>>>>    			data.alternate_sync_async = false;
>>>>>    			data.atomic_path = true;
>>>>> +			data.overlay_path = false;
>>>>>    			if (is_intel_device(data.drm_fd))
>>>>>    				run_test_with_modifiers(&data, test_async_flip);
>>>>>    			else
>>>>> @@ -793,6 +819,7 @@ igt_main
>>>>>    		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>>>>>    			data.alternate_sync_async = true;
>>>>>    			data.atomic_path = false;
>>>>> +			data.overlay_path = false;
>>>>>    			run_test(&data, test_async_flip);
>>>>>    		}
>>>>>    
>>>>> @@ -800,7 +827,17 @@ igt_main
>>>>>    		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
>>>>>    			data.alternate_sync_async = true;
>>>>>    			data.atomic_path = true;
>>>>> +			data.overlay_path = false;
>>>>> +			run_test(&data, test_async_flip);
>>>>> +		}
>>>>> +
>>>>> +		igt_describe("Verify overlay planes with async flips in atomic API");
>>>>> +		igt_subtest_with_dynamic("overlay-atomic") {
>>>>> +			igt_require(is_amdgpu_device(data.drm_fd));
>>>>> +			data.atomic_path = true;
>>>>> +			data.overlay_path = true;
>>>>>    			run_test(&data, test_async_flip);
>>>>> +			data.overlay_path = false;
>>>>>    		}
>>>>>    
>>>>>    		igt_describe("Verify that the async flip timestamp does not "
>>>>> -- 
>>>>> 2.47.1
>>>>>


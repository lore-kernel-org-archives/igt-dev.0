Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D5AD116F3
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 00:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402A388735;
	Tue,  2 Dec 2025 00:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BqVTKYxz";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010032.outbound.protection.outlook.com [52.101.61.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5545410E4ED
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 00:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uS6z6v0c2JRSYByBUvn0uy/epGvfhxWa9hcLaeFsGu4tSBQrWBnvUE+cA+Hqjj9gWJ2s184co06uiskxP8LpjnLpO3mse+bPfv6NG4JyCCRfyLBz2acYGsprfUanVlSgVzIZ/ZoTErsDroZJbDSP8UdzhPGzLHRPPh7CGMXKZH5qsu5oXeoiTZgmx2e0xWjUoKPLaUguPMeKn/SRgELod/9bG6QBtyAWidFRueRROVVCmzaEXPoZxXWzyj1IrQruCzKSIOydOdNVr8zcIr3FjW0MARCG9z1dcxb4BUZT53lYHJAVadcoQ2sIXwn0nzngYNGhsnPIxJfNWNl5tqx+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jal/7DnicMWc3B+zO2UIa96ZhxjGa1NTpVj5yvJzW4=;
 b=YqA8Ud5MtLzenltUgMn9iXzFst+21loYi5g5yulIEadF7TdDi8fOBJvV4FmBUpcuHxinaqvvCsLmQFI74k+NsiyAsmn8QPPYC2l6EIS4lFFPHJ1gyal0U+HBQ+EdLRi5EdL0xAovudhTaqnezdFTY8A0EZJkoeXvVZwMZmLaUKmzZ2z8eUZYwd4QqASkyaA+lC4w/vqyMkWSs2V0NMFklNISl8EbcGPcsJnSBGpKc1BTaSc6MyTvZ2R1HJ62kPZMVKOE8jH+lorpUTWsUN4rAYaEdWR+wbzTNDSGYdTsYf32q9S4XI3nJRGV23RzSc5cati1EmU2HeMfXcOWSEaPzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jal/7DnicMWc3B+zO2UIa96ZhxjGa1NTpVj5yvJzW4=;
 b=BqVTKYxzBJmuGPl24YFHqZ6CqEY5JFKGTwtveWoNH0XHuZaRrp+B2rd6plqtXMqNPIJoeW7qoCFFTIjhmg0I0HIWIZ4rYJPfQp0YZ/o6o9r/DAgxTP8Gf3xF8rkCTRKJaJ9klr5dCZhGZ8XuMzvjEc2io+37C1eyeVedU4EzuMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 00:24:31 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 00:24:30 +0000
Content-Type: multipart/alternative;
 boundary="------------uHjF8fdbtStxo2GwFiOqsshG"
Message-ID: <f1b50e2c-2737-4954-9f62-ea2346ae6b88@amd.com>
Date: Mon, 1 Dec 2025 19:24:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/6] lib/amdgpu: Add flexible command context API
 with external BO support
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20251127011219.3119242-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20251127011219.3119242-1-Jesse.Zhang@amd.com>
X-ClientProxiedBy: YT4PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::6) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddf5e71-0623-456d-b564-08de3139290e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVBDK3B3Rm5PbDBkNENWTncvdkZoYm51UWxnK1ZERU93MDdhQy8zTlg4MVQy?=
 =?utf-8?B?emwrWmhYMWIvTk1YaklHbWZEaER6K244cnlpTGhHbXM3VzVuSXBoY2VZelBY?=
 =?utf-8?B?WXJCVC8rejlXY2RRSGpaaytOQmc5enhreld2QnhrUU01RkZGYU5UMFBCRnBR?=
 =?utf-8?B?UC9zOWJORkk2Rk4vUWZqZGUxQ28vRzNtTVZZU2JnL2JRd3drZXNWSm5pZFNC?=
 =?utf-8?B?MDBVSjI0em4wRVEvZGdBSGJnY2xRQXZmRmRmNzFuNGxJZUQrc0FWR2NCOE9P?=
 =?utf-8?B?VUxNWklXcVVJZzhsWUdqcmhiRjZJQ1FGMFoydmdFWW5yTm5pUm9PRGdBcm9y?=
 =?utf-8?B?TXFMVk11dlYrcmZ3K2J2NkRuQ3RZTVNLblMzRDExMy9vWk4ydXc2MjhZOTlU?=
 =?utf-8?B?RFltbENMeTBCZ2RHYVZRN2dLQm9WREpKakZHaEZDZmhFNFM1c0sxeW01TDZ3?=
 =?utf-8?B?eFFYQWhvM0dOTXh6UlhtQVkzeDZtZS9kcTM4Sk5oRWNSUXlKRzlTVGdGWUVP?=
 =?utf-8?B?VDVyTURpTDFaRHhnbDdSalRaMjZSUUx1VDVnU2FGT3pzaDVHekJFdHhTbTNa?=
 =?utf-8?B?b08vaHU3ZFBlcGxsU04vS0pLUWIvMlBKMWcrRVdneVRkeHVLSjFicHYxUzJ2?=
 =?utf-8?B?TVdLWFNqUUM4SDM1VTlSK045RVBxL3Q1NVEwc1NWamlMcDhORCtmdGdhS1Mx?=
 =?utf-8?B?VVl3S00xbytpQ3BpMUhOVlhNWmFyakQ2TXB6eklzOEp3aFFrd1k5aE9SK1Bl?=
 =?utf-8?B?b29TWUkwVkFrc1l6ditKa1ZDcnVJa2RoeUtJelhrS2RPVDU5ZUtGZWlzSWg4?=
 =?utf-8?B?RVY4azBrUVhEcFdMOTN3b3R3c3Z4amM0MVlWVHpuM3lSam1MS0FjVCtHZWZq?=
 =?utf-8?B?elY2a1FxYTBsV0g5REdPYnc4SzZJazNqcHdOVmJ6NlBTbHR0bTBpMmpEL2tu?=
 =?utf-8?B?Rml2MDJwNjVGQUpDd3EvRElnczE0Zit2OXE3Zk5Mak1aODlzQUFvVTM1TkNp?=
 =?utf-8?B?dXlhR3owQXdxb3lFWG9IWnJ6UHhuaTVSdWExVFhhSTlJNUE0OUJydmJsYTJO?=
 =?utf-8?B?SVdPTXNadWJxOGVrNS9kU0pnbzJCL1pEbEthaTdGUEJGSUNhSDVORlBxaGR4?=
 =?utf-8?B?QmVwMWtQRERqZlR5N1o2aW95eUhCY2NteXEwclVYaXgzbmMrU3lSVDJRazE5?=
 =?utf-8?B?TDRXVHVJOTFNeXlXNWRjQVUxcTlvQURxOGlza0VTUFJRRzNCVmtCMHV3RWV0?=
 =?utf-8?B?OHY2UERiVVd4eWptRmRKQk81WTlnQS92cUxKTS84aGgzbzFiaEE0cHErKy84?=
 =?utf-8?B?Q2NLVkIxeHE4MjU5YVgrVmErV0hBRmliSitoOCsweTVUM3dVWm4xdWQ1UitV?=
 =?utf-8?B?cXVGS2ZQT1J5WlZlRGJRVWpVOFpxRGJsU01JdmViM2orckNHV3JxQ1JWbXVW?=
 =?utf-8?B?OW1LMXArcXNSU0VTTXRaQUEwUDlHV3dtQVJpc0tMSS8zVThFdHJOZHJnTTVa?=
 =?utf-8?B?VUFoZWg1YkhCS3VEYk1uY09HZllaMGt4cXZZbFZBTm9uQ3IvUVc3ZWZCQTd4?=
 =?utf-8?B?VHdlNW9rZTNVYWxtNXpjY2YxNkNBaGRCelZqaVRGRHhlQmc2TnI5OFZpb2pa?=
 =?utf-8?B?aFJQcXFQeDJ4L1RHclB3dVNoODFtUFA1WHl2emE0aGM5ZlNMWExrMXVLblpK?=
 =?utf-8?B?cU1HS3FJcExyS0lBcDU4dlQzakZTa1Z4WHIyY0IxaFJKa1R2ZzJzV29nc0NH?=
 =?utf-8?B?dThhcExqT3AxTko2bHladnNqazlaR2hrZitoQW16N2U2aHcyZGdITDBmNEFW?=
 =?utf-8?B?SEtXQTFFdHk3a0wrSDlVbjllVWViM2UxYyt3emsrenBwNmJoa3ZyZFFBclg2?=
 =?utf-8?B?WmlTYmYyM2s1WS9haU0yTExuU29qekhHMlJOamxoeCs4c0JmZUFoamtwSkZj?=
 =?utf-8?Q?LjuaM7oKTF12uwBxcdSuxrmJ45ZPsRV8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZENMM2JQMk1ReU1HcGo4ZDdpUCtJalZ4a1JZT3pDY2pmdzRJbFNsMklnZUNu?=
 =?utf-8?B?aUhzRlRKMzQraWJlTmRUTGE4N0ZPRHpqb1J2T2VhMkpSem0vdjZDcU9PYmFl?=
 =?utf-8?B?T0E0NklFUEJBazRYdW9WaXlYNFM3YUlqOEozS3dtMlR1RFBjWXgxeno4M2Mr?=
 =?utf-8?B?MFREQXNiU2REUnhaa2x3UWE4L0huRUNCQXFwK0pTVGY5MitMRm16ZnZ4TVEz?=
 =?utf-8?B?ZE5jZDg1MDBVSU5VcE5lM3NFRzI4Y3hMb2lxK2NyRmhiTmhxWmFBZGNQYnhT?=
 =?utf-8?B?ZE1WamZCSG83clZmVVNuWlBmNEJqMnpiRHhXUWZaOFRSaHB1a2g0aVY4Z1pj?=
 =?utf-8?B?OEVrU0xmQUVSeFhoSW82bktSajFWNHhGWVlrNnRTWTYwY3h5TGFxdXNwSis4?=
 =?utf-8?B?a2lCSGtQZVdIVFl2c25wbUc1b0dYSmsrWE9LV2xsRlh5ZHJxVlhGNnVoUW8w?=
 =?utf-8?B?RHo0c1ZnWFN4YWQ5ancxVE9BMEk4WXFDRGxKYmsxUjRiM25SMXFnL2psNHl5?=
 =?utf-8?B?cWhzRkJUaEE1NVlJakozcGt3UWlQSzdkQlJHK3VHamlVV1FUd3kreC9wQXBa?=
 =?utf-8?B?dVRQUEdobEZjY2hQVks0RlFiWmc0NXB0TlQxMHBBdGJmclFqNC8xdURDNFF1?=
 =?utf-8?B?Z0VMTlB5YUU2RC9wanhxVFZ6MnJWektQNUdyM1pLSFNRbDNXeVkySXlvaDBI?=
 =?utf-8?B?dHMvcmdVNUFQOFN1VWF1eXNSbUs5bXhudHB1TXhTa1B3TjZiVGF1S1k2bDho?=
 =?utf-8?B?YnZxbUtVTXF4a1Y3ZVNNZTlhRmtYTkpvQXhvQ2JwWm5XMDRXZDhKVHBCKzZz?=
 =?utf-8?B?dWZRdm5DT0V1REFpVlozei9HZlpINFl2VThjTTc5dXRVdVNmSGVPVjc1aHc1?=
 =?utf-8?B?MmVNeG0zY1QyZFhWY0JPaFY0V2VYdEFFRk9UOTBBR3NzcWt3L1IxVDJ4Q0ZF?=
 =?utf-8?B?MjUzbFpWNjFmaUJqZGJqb1NJUWZKTkRQaUovbnRQZTBYY2xmOGFqeDlEcUoz?=
 =?utf-8?B?Nkt1STluMWVSQ013S1orbnFnb0VWMUg4UjJFZmdwMjFQR2swem5BTHF4a2dN?=
 =?utf-8?B?dWUvZUtBb0pLNkNjVVdKZWMvTkw1NEhlSytyQUVKYzNTM1JGOW5YY1QzTnVY?=
 =?utf-8?B?cFBIdHFvOTc3OWIweldEdVk1VE9GRFJ5YVIwNXg2ZjNrYk0xY2VvUU0vYkRi?=
 =?utf-8?B?THRHVEZlWEZKY1R2S0dHSTEyUS9Td0VFMnQyQVRSajRqT2Rhd3hza0M1c0pa?=
 =?utf-8?B?VHEzQVpIZHZSL2VqZzFOWlVKKzNqajV4dE1HYVREUm5UMVpPcTA1bE9HYktD?=
 =?utf-8?B?ekE2QmZPWVVEOVYzc3daL0d1K1V3ZG54NUpiN3lNclhYVXErcTYxUXBBdnd4?=
 =?utf-8?B?NGorVVJNOTlaeUxDbTYzQ3pNWGxQU3hheGRhWU9QblZwTUUzbE8rZXplQytP?=
 =?utf-8?B?MVIwNTlGSkk5WllZajJweUZLZ2VBSGdHWmVVbVdlMzU0TmFWTTlHTVZRQUJI?=
 =?utf-8?B?UmRnVmMrRklrbFNtc1ZXaEh0S1N4c2RaWDNuUWxYdHloLzc2UFQ4OUh1MFV6?=
 =?utf-8?B?U2FNRVZJdzlhcHRpWXBOeC82cS93YlRqbVBXQTNKZHUrY3B0NjhONnVwZ3NZ?=
 =?utf-8?B?eGJ0TUFPcWpsM2diaWZUWVdyYjRJa0pZeEs2V3JFVjY5NC9pVnE5WjJXVXpN?=
 =?utf-8?B?K3BmSXcwc3pRaTE0T1MzZU9la1oraFdXT2xXcnhORk5QTlF4VGxQTFFNYVVo?=
 =?utf-8?B?TjlSTnMxaFhUTzdHVEtJUERyRlpHZWd2RGpwdTJSeDBSekVoT1lLMVpQREV2?=
 =?utf-8?B?cGtwcDV4U3JzVzcvalN5N0J1RE45S1QzT1ZBR2FRTGhHZjhmU0JkRkpBdkhw?=
 =?utf-8?B?QUNoMUFocWUrVCtzOUVjbEdCY05sbUVJYXdBbkMzd1IzTnIyaXFHcjNVTVNE?=
 =?utf-8?B?SkJLYmV6ckwyZjZ4ZGIzOUlnY0ZWeE5SUTNBUnlDdUVlNUduOW9mV0g5NFJs?=
 =?utf-8?B?STEvWnh6cUprYVRjY2RFZm1EL2NtUGhwc250ZEV0UldTU0ZZaWxOM3lpcTZx?=
 =?utf-8?B?WHh5cFRtb0pybGg3OER0emltR09Td1RCRmRXNjVvNkE5SkFBZkRkRHR2SWpr?=
 =?utf-8?Q?em4o88SSELr9YJN3iXDlyb8Rd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddf5e71-0623-456d-b564-08de3139290e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 00:24:30.7449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeFY8kgBRwPMrbkjsbRfjoDK/nxr8Z++dUixoSbM/jr5Blckbm4bDpaletNssNfpxTi8gwMo8aPdZu3wP9Wy6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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

--------------uHjF8fdbtStxo2GwFiOqsshG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The first five patches are:

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

The last (6th) patch introduces multiple definitions of amdgpu_llvm_asm_init in two files: amd_llvm_asm_stub.c and amd_llvm_asm.c and compilation failure.

Please fix .

On 2025-11-26 20:11, Jesse.Zhang wrote:
> Implement a new command context management API that supports for command submission.
>
> Key changes:
> 1. Add `cmd_context_create()`: Supports external BO injection with GPU/CPU
>    address tracking, and maintains backward compatibility for internal BO
>    allocation.
> 2. Add `cmd_context_destroy()`: Conditional BO cleanup (preserve external
>    BOs unless explicitly requested to destroy).
> 3. Add `cmd_submit_packet()`: Use separate IB buffer for command submission
>    to avoid overwriting original BO data, and properly manage resource lists
>    including both user-provided and internal resources.
> 4. Add convenience functions: `cmd_submit_write_linear()`,
>    `cmd_submit_copy_linear()`, `cmd_submit_atomic()` for common operations.
> 5. Add utility functions: `cmd_ring_available()` and
>    `cmd_get_available_rings()` for ring validation.
> 6. Add `cmd_wait_completion()`: Unified waiting for both user queues
>    (timeline syncobj) and kernel queues (fence status query).
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 592 ++++++++++++++++++++++++++++
>  lib/amdgpu/amd_command_submission.h |  72 ++++
>  2 files changed, 664 insertions(+)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 4b59cdab0..f53f1b070 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -852,3 +852,595 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
>  	free_cmd_base(base);
>  }
>  
> +/**
> + * command context creation with optional external BO
> + *
> + * @param device AMDGPU device handle
> + * @param ip_type IP block type (GFX, DMA, etc.)
> + * @param ring_id Ring index to use
> + * @param user_queue Whether to use user queue mode
> + * @param write_length Size of write operations in DWORDs
> + * @param external_bo Optional external buffer object (NULL for internal allocation)
> + * @param external_bo_mc GPU MC address of external BO (required if external_bo provided)
> + * @param external_bo_cpu CPU mapping of external BO (required if external_bo provided)
> + * @return New command context, or NULL on failure
> + */
> +cmd_context_t* cmd_context_create(amdgpu_device_handle device,
> +                                    enum amd_ip_block_type ip_type,
> +                                    uint32_t ring_id,
> +                                    bool user_queue,
> +                                    uint32_t write_length,
> +                                    amdgpu_bo_handle external_bo,
> +                                    uint64_t external_bo_mc,
> +                                    volatile uint32_t *external_bo_cpu)
> +{
> +    cmd_context_t *ctx;
> +    void *cpu_ptr = NULL;
> +    uint64_t bo_mc = 0;
> +    amdgpu_va_handle va_handle = NULL;
> +    int r;
> +
> +    if (!device)
> +        return NULL;
> +
> +    /* Check if the requested ring is available */
> +    if (!cmd_ring_available(device, ip_type, ring_id, user_queue))
> +        return NULL;
> +
> +    /* Allocate context structure */
> +    ctx = calloc(1, sizeof(cmd_context_t));
> +    if (!ctx)
> +        return NULL;
> +
> +    ctx->device = device;
> +    ctx->ip_type = ip_type;
> +    ctx->user_queue = user_queue;
> +    ctx->last_submit_seq = 0;
> +    ctx->uses_external_bo = (external_bo != NULL);  // Now this member exists
> +    ctx->initialized = false;
> +
> +    /* Get IP block for the specified IP type */
> +    ctx->ip_block = get_ip_block(device, (unsigned int)ip_type);
> +    if (!ctx->ip_block) {
> +        free(ctx);
> +        return NULL;
> +    }
> +
> +    /* Allocate ring context structure */
> +    ctx->ring_ctx = calloc(1, sizeof(struct amdgpu_ring_context));
> +    if (!ctx->ring_ctx) {
> +        free(ctx);
> +        return NULL;
> +    }
> +
> +    /* Setup ring context parameters */
> +    ctx->ring_ctx->write_length = write_length ? write_length : 128;
> +    ctx->ring_ctx->pm4_size = 256;
> +    ctx->ring_ctx->pm4 = calloc(ctx->ring_ctx->pm4_size, sizeof(uint32_t));
> +    if (!ctx->ring_ctx->pm4) {
> +        free(ctx->ring_ctx);
> +        free(ctx);
> +        return NULL;
> +    }
> +
> +    ctx->ring_ctx->res_cnt = 1;
> +    ctx->ring_ctx->ring_id = ring_id;
> +    ctx->ring_ctx->secure = false;
> +    ctx->ring_ctx->user_queue = user_queue;
> +    ctx->ring_ctx->time_out = 0;
> +
> +    if (user_queue) {
> +        /* Initialize user queue if requested */
> +        if (!ctx->ip_block->funcs->userq_create) {
> +            free(ctx->ring_ctx->pm4);
> +            free(ctx->ring_ctx);
> +            free(ctx);
> +            return NULL;
> +        }
> +        ctx->ip_block->funcs->userq_create(device, ctx->ring_ctx, (unsigned int)ip_type);
> +    } else {
> +        /* Create regular command submission context */
> +        r = amdgpu_cs_ctx_create(device, &ctx->ring_ctx->context_handle);
> +        if (r) {
> +            free(ctx->ring_ctx->pm4);
> +            free(ctx->ring_ctx);
> +            free(ctx);
> +            return NULL;
> +        }
> +    }
> +
> +    /* BO allocation strategy: use external BO if provided, otherwise allocate internally */
> +	if (external_bo) {
> +		/* Validate external BO arguments */
> +		if (!external_bo_cpu || !external_bo_mc) {
> +			igt_debug("Invalid external BO arguments (mc=0x%llx, cpu=%p)\n",
> +					  (unsigned long long)external_bo_mc, external_bo_cpu);
> +			free(ctx->ring_ctx->pm4);
> +			free(ctx->ring_ctx);
> +			free(ctx);
> +			return NULL;
> +		}
> +
> +		/* Use caller-provided external BO */
> +		ctx->ring_ctx->bo = external_bo;
> +		ctx->ring_ctx->bo_mc = external_bo_mc;
> +		ctx->ring_ctx->bo_cpu = external_bo_cpu;
> +		ctx->ring_ctx->va_handle = NULL;  // VA management is caller's responsibility
> +
> +		igt_info("Using external BO: GPU=0x%llx, CPU=%p\n",
> +				 (unsigned long long)external_bo_mc, external_bo_cpu);
> +    } else {
> +        /* Allocate internal BO for command operations */
> +        r = amdgpu_bo_alloc_and_map(device,
> +                                   ctx->ring_ctx->write_length * sizeof(uint32_t),
> +                                   4096,
> +                                   AMDGPU_GEM_DOMAIN_GTT,
> +                                   0,
> +                                   &ctx->ring_ctx->bo,
> +                                   &cpu_ptr,
> +                                   &bo_mc,
> +                                   &va_handle);
> +        if (r) {
> +            goto cleanup_error;
> +        }
> +
> +        ctx->ring_ctx->bo_mc = bo_mc;
> +        ctx->ring_ctx->bo_cpu = (volatile uint32_t *)cpu_ptr;
> +        ctx->ring_ctx->va_handle = va_handle;
> +
> +		igt_info("Allocated internal BO: GPU=0x%llx, CPU=%p\n",
> +			 (unsigned long long)bo_mc, cpu_ptr);
> +    }
> +
> +    /* Initialize resources array */
> +    ctx->ring_ctx->resources[0] = ctx->ring_ctx->bo;
> +    for (int i = 1; i < 4; i++) {
> +        ctx->ring_ctx->resources[i] = NULL;
> +    }
> +
> +    ctx->initialized = true;
> +    return ctx;
> +
> +cleanup_error:
> +    /* Cleanup resources in case of allocation failure */
> +    if (user_queue) {
> +        ctx->ip_block->funcs->userq_destroy(device, ctx->ring_ctx, (unsigned int)ip_type);
> +    } else {
> +        if (ctx->ring_ctx->context_handle)
> +            amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
> +    }
> +    free(ctx->ring_ctx->pm4);
> +    free(ctx->ring_ctx);
> +    free(ctx);
> +    return NULL;
> +}
> +
> +/**
> + * context destruction function with external BO control
> + *
> + * @param ctx Command context to destroy
> + * @param destroy_external_bo Whether to destroy external BO (if used)
> + */
> +void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
> +{
> +    if (!ctx || !ctx->initialized)
> +        return;
> +
> +    if (ctx->ring_ctx) {
> +        /* Handle BO cleanup based on allocation type */
> +        if (ctx->ring_ctx->bo) {
> +            if (!ctx->uses_external_bo || destroy_external_bo) {
> +                /* Clean up internal BO or external BO if explicitly requested */
> +                if (ctx->ring_ctx->va_handle) {
> +                    /* Internal BO with VA handle - full cleanup */
> +                    amdgpu_bo_unmap_and_free(ctx->ring_ctx->bo, ctx->ring_ctx->va_handle,
> +                                           ctx->ring_ctx->bo_mc,
> +                                           ctx->ring_ctx->write_length * sizeof(uint32_t));
> +                } else if (destroy_external_bo) {
> +                    /* External BO without VA handle - just free the BO */
> +                    amdgpu_bo_free(ctx->ring_ctx->bo);
> +                }
> +            } else {
> +				/* External BO, preserve it as requested by caller */
> +				igt_info("Preserving external BO (GPU=0x%llx)\n",
> +						 (unsigned long long)ctx->ring_ctx->bo_mc);
> +            }
> +        }
> +
> +        /* Clean up command submission context */
> +        if (ctx->user_queue) {
> +            if (ctx->ip_block && ctx->ip_block->funcs->userq_destroy) {
> +                ctx->ip_block->funcs->userq_destroy(ctx->device, ctx->ring_ctx,
> +                                                  (unsigned int)ctx->ip_type);
> +            }
> +        } else {
> +            if (ctx->ring_ctx->context_handle) {
> +                amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
> +            }
> +        }
> +
> +        /* Free PM4 command buffer */
> +        if (ctx->ring_ctx->pm4) {
> +            free(ctx->ring_ctx->pm4);
> +        }
> +
> +        free(ctx->ring_ctx);
> +    }
> +
> +    free(ctx);
> +}
> +
> +/**
> + * Submit command packet without waiting - Fixed submission logic
> + */
> +int cmd_submit_packet(cmd_context_t *ctx)
> +{
> +    amdgpu_bo_list_handle bo_list;
> +    int r;
> +    struct amdgpu_cs_request ibs_request;
> +    struct amdgpu_cs_ib_info ib_info;
> +    amdgpu_bo_handle ib_bo;
> +    void *ib_cpu;
> +    uint64_t ib_mc_address;
> +    amdgpu_va_handle ib_va_handle;
> +    amdgpu_bo_handle all_res[5] = {0};
> +    uint32_t res_count = 0;
> +    uint32_t i;
> +
> +    if (!ctx || !ctx->initialized || !ctx->ring_ctx) {
> +        igt_debug("Invalid context parameters\n");
> +        return -EINVAL;
> +    }
> +
> +    /* Check required parameters */
> +    if (ctx->ring_ctx->pm4_dw == 0 || ctx->ring_ctx->pm4_dw > 1024) {
> +        igt_debug("Invalid PM4 size: %u (must be 1-1024)\n", ctx->ring_ctx->pm4_dw);
> +        return -EINVAL;
> +    }
> +
> +    /* For user queues, use userq_submit */
> +    if (ctx->user_queue) {
> +        if (!ctx->ip_block || !ctx->ip_block->funcs->userq_submit) {
> +            igt_debug("User queue submission not supported\n");
> +            return -ENOTSUP;
> +        }
> +
> +        if (!ctx->ring_ctx->bo_mc) {
> +            igt_debug("Invalid BO MC address for user queue\n");
> +            return -EINVAL;
> +        }
> +
> +        ctx->ip_block->funcs->userq_submit(ctx->device, ctx->ring_ctx,
> +                      (unsigned int)ctx->ip_type,
> +                      ctx->ring_ctx->bo_mc);
> +        ctx->last_submit_seq = ctx->ring_ctx->point;
> +        igt_info("User queue submission successful, point=%lu\n", ctx->last_submit_seq);
> +        return 0;
> +    }
> +
> +    /* For regular queues, setup and submit CS */
> +    memset(&ibs_request, 0, sizeof(ibs_request));
> +    memset(&ib_info, 0, sizeof(ib_info));
> +
> +    /* Allocate separate IB buffer instead of reusing command buffer */
> +    r = amdgpu_bo_alloc_and_map(ctx->device,
> +                               ctx->ring_ctx->pm4_dw * sizeof(uint32_t),
> +                               4096,
> +                               AMDGPU_GEM_DOMAIN_GTT,
> +                               0,
> +                               &ib_bo,
> +                               &ib_cpu,
> +                               &ib_mc_address,
> +                               &ib_va_handle);
> +    if (r) {
> +        igt_debug("Failed to allocate IB: %d\n", r);
> +        return r;
> +    }
> +
> +    /* Copy PM4 commands to IB */
> +    memcpy(ib_cpu, ctx->ring_ctx->pm4, ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +    /* Setup IB information */
> +    ib_info.ib_mc_address = ib_mc_address;
> +    ib_info.size = ctx->ring_ctx->pm4_dw;
> +    if (ctx->ring_ctx->secure)
> +        ib_info.flags |= AMDGPU_IB_FLAGS_SECURE;
> +
> +    /* Setup submission request */
> +    ibs_request.ip_type = (unsigned int)ctx->ip_type;
> +    ibs_request.ring = ctx->ring_ctx->ring_id;
> +    ibs_request.number_of_ibs = 1;
> +    ibs_request.ibs = &ib_info;
> +    ibs_request.fence_info.handle = NULL;
> +
> +    /* Create resource list containing both original resources and IB */
> +    /* Add original resources */
> +    for (i = 0; i < ctx->ring_ctx->res_cnt && i < 4; i++) {
> +        if (ctx->ring_ctx->resources[i]) {
> +            all_res[res_count++] = ctx->ring_ctx->resources[i];
> +        }
> +    }
> +
> +    /* Add IB as the last resource */
> +    all_res[res_count++] = ib_bo;
> +
> +    /* Create BO list */
> +    r = amdgpu_bo_list_create(ctx->device, res_count, all_res, NULL, &bo_list);
> +    if (r) {
> +        igt_debug("amdgpu_bo_list_create failed: %d\n", r);
> +        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> +                               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +        return r;
> +    }
> +
> +    ibs_request.resources = bo_list;
> +
> +    /* Submit command - strict error checking */
> +    r = amdgpu_cs_submit(ctx->ring_ctx->context_handle, 0, &ibs_request, 1);
> +
> +    if (r != 0) {
> +        igt_debug("amdgpu_cs_submit failed: %d\n", r);
> +        amdgpu_bo_list_destroy(bo_list);
> +        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> +                               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +        return r;
> +    }
> +
> +    /* Record submission sequence number for waiting */
> +    ctx->last_submit_seq = ibs_request.seq_no;
> +    igt_debug("Command submitted successfully, seq_no=%lu\n", ctx->last_submit_seq);
> +
> +    /* Cleanup resources */
> +    amdgpu_bo_list_destroy(bo_list);
> +    amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> +                           ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +    return 0;
> +}
> +
> +int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
> +{
> +    int result = -EINVAL;
> +
> +    if (!ctx || !ctx->initialized || !ctx->ip_block || !params)
> +	return -EINVAL;
> +
> +    if (!ctx->ring_ctx || !ctx->ring_ctx->bo_cpu)
> +	return -EINVAL;
> +
> +    /* Clear the buffer before operation */
> +    memset((void *)ctx->ring_ctx->bo_cpu, 0,
> +	   ctx->ring_ctx->write_length * sizeof(uint32_t));
> +
> +
> +    /* Build the command packet based on type */
> +    switch (params->type) {
> +	case CMD_PACKET_WRITE_LINEAR:
> +	    if (!ctx->ip_block->funcs->write_linear)
> +		    return -ENOTSUP;
> +
> +	    /* TODO: allow user set the dst and data */
> +	    //ctx->ring_ctx->bo_mc = params->dst_addr;
> +	    ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
> +
> +	    /* Build PM4 packet */
> +	    result = ctx->ip_block->funcs->write_linear(ctx->ip_block->funcs,
> +						       ctx->ring_ctx,
> +						       &ctx->ring_ctx->pm4_dw);
> +
> +	    /*  Copy PM4 packet to ring buffer */
> +	    if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
> +	        memcpy((void *)ctx->ring_ctx->bo_cpu,
> +	               ctx->ring_ctx->pm4,
> +	               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +	        //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer\n",
> +	          //       ctx->ring_ctx->pm4_dw);
> +	    }
> +	    return result;
> +
> +	case CMD_PACKET_WRITE_ATOMIC:
> +	    if (!ctx->ip_block->funcs->write_linear_atomic)
> +		    return -ENOTSUP;
> +
> +	    /* TODO: allow user set the dst and data */
> +	    //ctx->ring_ctx->bo_mc = params->dst_addr;
> +	    ctx->ring_ctx->write_length = 1; /* Atomic operations typically work on single DWORD */
> +
> +	    result = ctx->ip_block->funcs->write_linear_atomic(ctx->ip_block->funcs,
> +							      ctx->ring_ctx,
> +							      &ctx->ring_ctx->pm4_dw);
> +
> +	    /*  Copy PM4 packet to ring buffer */
> +	    if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
> +	        memcpy((void *)ctx->ring_ctx->bo_cpu,
> +	               ctx->ring_ctx->pm4,
> +	               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +	        //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer (atomic)\n",
> +	          //       ctx->ring_ctx->pm4_dw);
> +	    }
> +	    return result;
> +
> +	case CMD_PACKET_COPY_LINEAR:
> +	    if (!ctx->ip_block->funcs->copy_linear)
> +		    return -ENOTSUP;
> +
> +	    /* For copy operations, we need both source and destination addresses */
> +	    /* This would require extending the API to pass both addresses */
> +	    /* For now, use the internal buffer as source */
> +	    ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
> +
> +	    result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
> +						      ctx->ring_ctx,
> +						      &ctx->ring_ctx->pm4_dw);
> +
> +	    /* Copy PM4 packet to ring buffer */
> +	    if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
> +	        memcpy((void *)ctx->ring_ctx->bo_cpu,
> +	               ctx->ring_ctx->pm4,
> +	               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +	        //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer (copy)\n",
> +	          //       ctx->ring_ctx->pm4_dw);
> +	    }
> +	    return result;
> +
> +	case CMD_PACKET_COPY_ATOMIC:
> +	    /* TODO: Implement atomic copy if supported */
> +	    igt_info("cmd_place_packet: ATOMIC_COPY not implemented\n");
> +	    return -ENOTSUP;
> +
> +	case CMD_PACKET_FENCE:
> +	    /* TODO: Implement fence operation */
> +	    igt_info("cmd_place_packet: FENCE not implemented\n");
> +	    return -ENOTSUP;
> +
> +	case CMD_PACKET_TIMESTAMP:
> +	    /* TODO: Implement timestamp operation */
> +	    igt_info("cmd_place_packet: TIMESTAMP not implemented\n");
> +	    return -ENOTSUP;
> +
> +	default:
> +	    igt_info("cmd_place_packet: Unknown packet type: %d\n", params->type);
> +	    return -EINVAL;
> +    }
> +}
> +
> +/**
> + * Build and submit packet in one operation
> + */
> +int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
> +{
> +    int r;
> +
> +    r = cmd_place_packet(ctx, params);
> +    if (r)
> +	return r;
> +
> +    return cmd_submit_packet(ctx);
> +}
> +
> +/**
> + * Convenience function for write linear
> + */
> +int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data)
> +{
> +    cmd_packet_params_t params = {
> +	.type = CMD_PACKET_WRITE_LINEAR,
> +	.dst_addr = dst_addr,
> +	.size = size,
> +	.data = data,
> +    };
> +
> +    return cmd_place_and_submit_packet(ctx, &params);
> +}
> +
> +/**
> + * Convenience function for copy linear
> + */
> +int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size)
> +{
> +    cmd_packet_params_t params = {
> +	.type = CMD_PACKET_COPY_LINEAR,
> +	.src_addr = src_addr,
> +	.dst_addr = dst_addr,
> +	.size = size,
> +    };
> +
> +    return cmd_place_and_submit_packet(ctx, &params);
> +}
> +
> +/**
> + * Convenience function for atomic operation
> + */
> +int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data)
> +{
> +    cmd_packet_params_t params = {
> +	.type = CMD_PACKET_WRITE_ATOMIC,
> +	.dst_addr = dst_addr,
> +	.data = data,
> +    };
> +
> +    return cmd_place_and_submit_packet(ctx, &params);
> +}
> +
> +/**
> + * Wait for all submitted packets to complete (equivalent to Wait4PacketConsumption)
> + */
> +int cmd_wait_completion(cmd_context_t *ctx)
> +{
> +    struct amdgpu_cs_fence fence_status = {0};
> +    uint32_t expired;
> +
> +    if (!ctx || !ctx->initialized)
> +	return -EINVAL;
> +
> +    /* For user queues, wait on timeline syncobj */
> +    if (ctx->user_queue) {
> +	if (!ctx->ring_ctx->timeline_syncobj_handle)
> +	return -EINVAL;
> +
> +	return amdgpu_timeline_syncobj_wait(ctx->device,
> +					   ctx->ring_ctx->timeline_syncobj_handle,
> +					   ctx->ring_ctx->point);
> +    }
> +
> +    /* For regular queues, wait on fence */
> +    fence_status.ip_type = (unsigned int)ctx->ip_type;
> +    fence_status.ip_instance = 0;
> +    fence_status.ring = ctx->ring_ctx->ring_id;
> +    fence_status.context = ctx->ring_ctx->context_handle;
> +    fence_status.fence = ctx->last_submit_seq;
> +
> +    return amdgpu_cs_query_fence_status(&fence_status,
> +				       AMDGPU_TIMEOUT_INFINITE,
> +				       0, &expired);
> +}
> +
> +/**
> + * Check if ring is available
> + */
> +bool cmd_ring_available(amdgpu_device_handle device,
> +			enum amd_ip_block_type ip_type,
> +		       uint32_t ring_id,
> +		       bool user_queue)
> +{
> +    struct drm_amdgpu_info_hw_ip hw_ip_info;
> +    int r;
> +
> +    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &hw_ip_info);
> +    if (r)
> +	return false;
> +
> +    if (user_queue) {
> +	/* For user queues, check user queue slots */
> +	uint32_t userq_slots = hw_ip_info.num_userq_slots;
> +
> +	return (ring_id < userq_slots);
> +    } else {
> +	/* For regular queues, check available rings */
> +		return !!(hw_ip_info.available_rings & (1ULL << ring_id));
> +    }
> +}
> +
> +/**
> + * Get number of available rings
> + */
> +uint32_t cmd_get_available_rings(amdgpu_device_handle device,
> +				 enum amd_ip_block_type ip_type,
> +				bool user_queue)
> +{
> +    struct drm_amdgpu_info_hw_ip hw_ip_info;
> +    int r;
> +
> +    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &hw_ip_info);
> +    if (r)
> +	return 0;
> +
> +    if (user_queue) {
> +	return hw_ip_info.num_userq_slots;
> +    } else {
> +		return __builtin_popcountll(hw_ip_info.available_rings);
> +    }
> +}
> diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
> index 8b090359a..7826c2d0f 100644
> --- a/lib/amdgpu/amd_command_submission.h
> +++ b/lib/amdgpu/amd_command_submission.h
> @@ -28,6 +28,45 @@
>  
>  #include "amd_ip_blocks.h"
>  
> +/**
> + * Packet types supported by the command submission library
> + */
> +typedef enum {
> +    CMD_PACKET_WRITE_LINEAR,
> +    CMD_PACKET_WRITE_ATOMIC,
> +    CMD_PACKET_COPY_LINEAR,
> +    CMD_PACKET_COPY_ATOMIC,
> +    CMD_PACKET_FENCE,
> +    CMD_PACKET_TIMESTAMP,
> +} cmd_packet_type_t;
> +
> +/**
> + * Command submission context structure
> + */
> +typedef struct {
> +    amdgpu_device_handle device;
> +    struct amdgpu_ring_context *ring_ctx;
> +    const struct amdgpu_ip_block_version *ip_block;
> +    enum amd_ip_block_type ip_type;
> +    bool initialized;
> +    bool user_queue;
> +    bool uses_external_bo;
> +    uint64_t last_submit_seq; /* Last submission sequence number */
> +} cmd_context_t;
> +
> +/**
> + * Packet building parameters
> + */
> +typedef struct {
> +    cmd_packet_type_t type;
> +    uint64_t src_addr;
> +    uint64_t dst_addr;
> +    uint32_t size;
> +    uint32_t data;
> +    uint32_t *custom_data;
> +    uint32_t custom_data_size;
> +} cmd_packet_params_t;
> +
>  int amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
>  				unsigned int ip_type, struct amdgpu_ring_context *ring_context,
>  				int expect);
> @@ -49,4 +88,37 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  
>  void  amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
>  					  amdgpu_context_handle ctx);
> +
> +cmd_context_t* cmd_context_create(amdgpu_device_handle device,
> +                                    enum amd_ip_block_type ip_type,
> +                                    uint32_t ring_id,
> +                                    bool user_queue,
> +                                    uint32_t write_length,
> +                                    amdgpu_bo_handle external_bo,
> +                                    uint64_t external_bo_mc,
> +                                    volatile uint32_t *external_bo_cpu);
> +void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo);
> +
> +int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
> +
> +int cmd_submit_packet(cmd_context_t *ctx);
> +
> +int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
> +
> +int cmd_wait_completion(cmd_context_t *ctx);
> +
> +int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data);
> +
> +int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size);
> +
> +int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data);
> +
> +bool cmd_ring_available(amdgpu_device_handle device,
> +                        enum amd_ip_block_type ip_type,
> +                       uint32_t ring_id,
> +                       bool user_queue);
> +
> +uint32_t cmd_get_available_rings(amdgpu_device_handle device,
> +                                 enum amd_ip_block_type ip_type,
> +                                bool user_queue);
>  #endif
--------------uHjF8fdbtStxo2GwFiOqsshG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><span><span class="ui-provider ed ft bhx bvj bvk bvl bvm bvn bvo bvp bvq bvr bvs bvt bvu bvv bvw bvx bvy bvz bwa bwb bwc bwd bwe bwf bwg bwh bwi bwj bwk bwl bwm bwn bwo" dir="ltr">The first five patches are:<br>
          <br>
          Reviewed-by: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a><br>
          <br>
          The last (6th) patch introduces multiple definitions of
          amdgpu_llvm_asm_init in two files: amd_llvm_asm_stub.c and
          amd_llvm_asm.c and compilation failure.<br>
        </span></span></p>
    <p><span><span class="ui-provider ed ft bhx bvj bvk bvl bvm bvn bvo bvp bvq bvr bvs bvt bvu bvv bvw bvx bvy bvz bwa bwb bwc bwd bwe bwf bwg bwh bwi bwj bwk bwl bwm bwn bwo" dir="ltr">Please fix .<br>
        </span></span></p>
    <div class="moz-cite-prefix">On 2025-11-26 20:11, Jesse.Zhang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251127011219.3119242-1-Jesse.Zhang@amd.com">
      <pre wrap="" class="moz-quote-pre">Implement a new command context management API that supports for command submission.

Key changes:
1. Add `cmd_context_create()`: Supports external BO injection with GPU/CPU
   address tracking, and maintains backward compatibility for internal BO
   allocation.
2. Add `cmd_context_destroy()`: Conditional BO cleanup (preserve external
   BOs unless explicitly requested to destroy).
3. Add `cmd_submit_packet()`: Use separate IB buffer for command submission
   to avoid overwriting original BO data, and properly manage resource lists
   including both user-provided and internal resources.
4. Add convenience functions: `cmd_submit_write_linear()`,
   `cmd_submit_copy_linear()`, `cmd_submit_atomic()` for common operations.
5. Add utility functions: `cmd_ring_available()` and
   `cmd_get_available_rings()` for ring validation.
6. Add `cmd_wait_completion()`: Unified waiting for both user queues
   (timeline syncobj) and kernel queues (fence status query).

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>
---
 lib/amdgpu/amd_command_submission.c | 592 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |  72 ++++
 2 files changed, 664 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 4b59cdab0..f53f1b070 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -852,3 +852,595 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
 	free_cmd_base(base);
 }
 
+/**
+ * command context creation with optional external BO
+ *
+ * @param device AMDGPU device handle
+ * @param ip_type IP block type (GFX, DMA, etc.)
+ * @param ring_id Ring index to use
+ * @param user_queue Whether to use user queue mode
+ * @param write_length Size of write operations in DWORDs
+ * @param external_bo Optional external buffer object (NULL for internal allocation)
+ * @param external_bo_mc GPU MC address of external BO (required if external_bo provided)
+ * @param external_bo_cpu CPU mapping of external BO (required if external_bo provided)
+ * @return New command context, or NULL on failure
+ */
+cmd_context_t* cmd_context_create(amdgpu_device_handle device,
+                                    enum amd_ip_block_type ip_type,
+                                    uint32_t ring_id,
+                                    bool user_queue,
+                                    uint32_t write_length,
+                                    amdgpu_bo_handle external_bo,
+                                    uint64_t external_bo_mc,
+                                    volatile uint32_t *external_bo_cpu)
+{
+    cmd_context_t *ctx;
+    void *cpu_ptr = NULL;
+    uint64_t bo_mc = 0;
+    amdgpu_va_handle va_handle = NULL;
+    int r;
+
+    if (!device)
+        return NULL;
+
+    /* Check if the requested ring is available */
+    if (!cmd_ring_available(device, ip_type, ring_id, user_queue))
+        return NULL;
+
+    /* Allocate context structure */
+    ctx = calloc(1, sizeof(cmd_context_t));
+    if (!ctx)
+        return NULL;
+
+    ctx-&gt;device = device;
+    ctx-&gt;ip_type = ip_type;
+    ctx-&gt;user_queue = user_queue;
+    ctx-&gt;last_submit_seq = 0;
+    ctx-&gt;uses_external_bo = (external_bo != NULL);  // Now this member exists
+    ctx-&gt;initialized = false;
+
+    /* Get IP block for the specified IP type */
+    ctx-&gt;ip_block = get_ip_block(device, (unsigned int)ip_type);
+    if (!ctx-&gt;ip_block) {
+        free(ctx);
+        return NULL;
+    }
+
+    /* Allocate ring context structure */
+    ctx-&gt;ring_ctx = calloc(1, sizeof(struct amdgpu_ring_context));
+    if (!ctx-&gt;ring_ctx) {
+        free(ctx);
+        return NULL;
+    }
+
+    /* Setup ring context parameters */
+    ctx-&gt;ring_ctx-&gt;write_length = write_length ? write_length : 128;
+    ctx-&gt;ring_ctx-&gt;pm4_size = 256;
+    ctx-&gt;ring_ctx-&gt;pm4 = calloc(ctx-&gt;ring_ctx-&gt;pm4_size, sizeof(uint32_t));
+    if (!ctx-&gt;ring_ctx-&gt;pm4) {
+        free(ctx-&gt;ring_ctx);
+        free(ctx);
+        return NULL;
+    }
+
+    ctx-&gt;ring_ctx-&gt;res_cnt = 1;
+    ctx-&gt;ring_ctx-&gt;ring_id = ring_id;
+    ctx-&gt;ring_ctx-&gt;secure = false;
+    ctx-&gt;ring_ctx-&gt;user_queue = user_queue;
+    ctx-&gt;ring_ctx-&gt;time_out = 0;
+
+    if (user_queue) {
+        /* Initialize user queue if requested */
+        if (!ctx-&gt;ip_block-&gt;funcs-&gt;userq_create) {
+            free(ctx-&gt;ring_ctx-&gt;pm4);
+            free(ctx-&gt;ring_ctx);
+            free(ctx);
+            return NULL;
+        }
+        ctx-&gt;ip_block-&gt;funcs-&gt;userq_create(device, ctx-&gt;ring_ctx, (unsigned int)ip_type);
+    } else {
+        /* Create regular command submission context */
+        r = amdgpu_cs_ctx_create(device, &amp;ctx-&gt;ring_ctx-&gt;context_handle);
+        if (r) {
+            free(ctx-&gt;ring_ctx-&gt;pm4);
+            free(ctx-&gt;ring_ctx);
+            free(ctx);
+            return NULL;
+        }
+    }
+
+    /* BO allocation strategy: use external BO if provided, otherwise allocate internally */
+	if (external_bo) {
+		/* Validate external BO arguments */
+		if (!external_bo_cpu || !external_bo_mc) {
+			igt_debug(&quot;Invalid external BO arguments (mc=0x%llx, cpu=%p)\n&quot;,
+					  (unsigned long long)external_bo_mc, external_bo_cpu);
+			free(ctx-&gt;ring_ctx-&gt;pm4);
+			free(ctx-&gt;ring_ctx);
+			free(ctx);
+			return NULL;
+		}
+
+		/* Use caller-provided external BO */
+		ctx-&gt;ring_ctx-&gt;bo = external_bo;
+		ctx-&gt;ring_ctx-&gt;bo_mc = external_bo_mc;
+		ctx-&gt;ring_ctx-&gt;bo_cpu = external_bo_cpu;
+		ctx-&gt;ring_ctx-&gt;va_handle = NULL;  // VA management is caller's responsibility
+
+		igt_info(&quot;Using external BO: GPU=0x%llx, CPU=%p\n&quot;,
+				 (unsigned long long)external_bo_mc, external_bo_cpu);
+    } else {
+        /* Allocate internal BO for command operations */
+        r = amdgpu_bo_alloc_and_map(device,
+                                   ctx-&gt;ring_ctx-&gt;write_length * sizeof(uint32_t),
+                                   4096,
+                                   AMDGPU_GEM_DOMAIN_GTT,
+                                   0,
+                                   &amp;ctx-&gt;ring_ctx-&gt;bo,
+                                   &amp;cpu_ptr,
+                                   &amp;bo_mc,
+                                   &amp;va_handle);
+        if (r) {
+            goto cleanup_error;
+        }
+
+        ctx-&gt;ring_ctx-&gt;bo_mc = bo_mc;
+        ctx-&gt;ring_ctx-&gt;bo_cpu = (volatile uint32_t *)cpu_ptr;
+        ctx-&gt;ring_ctx-&gt;va_handle = va_handle;
+
+		igt_info(&quot;Allocated internal BO: GPU=0x%llx, CPU=%p\n&quot;,
+			 (unsigned long long)bo_mc, cpu_ptr);
+    }
+
+    /* Initialize resources array */
+    ctx-&gt;ring_ctx-&gt;resources[0] = ctx-&gt;ring_ctx-&gt;bo;
+    for (int i = 1; i &lt; 4; i++) {
+        ctx-&gt;ring_ctx-&gt;resources[i] = NULL;
+    }
+
+    ctx-&gt;initialized = true;
+    return ctx;
+
+cleanup_error:
+    /* Cleanup resources in case of allocation failure */
+    if (user_queue) {
+        ctx-&gt;ip_block-&gt;funcs-&gt;userq_destroy(device, ctx-&gt;ring_ctx, (unsigned int)ip_type);
+    } else {
+        if (ctx-&gt;ring_ctx-&gt;context_handle)
+            amdgpu_cs_ctx_free(ctx-&gt;ring_ctx-&gt;context_handle);
+    }
+    free(ctx-&gt;ring_ctx-&gt;pm4);
+    free(ctx-&gt;ring_ctx);
+    free(ctx);
+    return NULL;
+}
+
+/**
+ * context destruction function with external BO control
+ *
+ * @param ctx Command context to destroy
+ * @param destroy_external_bo Whether to destroy external BO (if used)
+ */
+void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
+{
+    if (!ctx || !ctx-&gt;initialized)
+        return;
+
+    if (ctx-&gt;ring_ctx) {
+        /* Handle BO cleanup based on allocation type */
+        if (ctx-&gt;ring_ctx-&gt;bo) {
+            if (!ctx-&gt;uses_external_bo || destroy_external_bo) {
+                /* Clean up internal BO or external BO if explicitly requested */
+                if (ctx-&gt;ring_ctx-&gt;va_handle) {
+                    /* Internal BO with VA handle - full cleanup */
+                    amdgpu_bo_unmap_and_free(ctx-&gt;ring_ctx-&gt;bo, ctx-&gt;ring_ctx-&gt;va_handle,
+                                           ctx-&gt;ring_ctx-&gt;bo_mc,
+                                           ctx-&gt;ring_ctx-&gt;write_length * sizeof(uint32_t));
+                } else if (destroy_external_bo) {
+                    /* External BO without VA handle - just free the BO */
+                    amdgpu_bo_free(ctx-&gt;ring_ctx-&gt;bo);
+                }
+            } else {
+				/* External BO, preserve it as requested by caller */
+				igt_info(&quot;Preserving external BO (GPU=0x%llx)\n&quot;,
+						 (unsigned long long)ctx-&gt;ring_ctx-&gt;bo_mc);
+            }
+        }
+
+        /* Clean up command submission context */
+        if (ctx-&gt;user_queue) {
+            if (ctx-&gt;ip_block &amp;&amp; ctx-&gt;ip_block-&gt;funcs-&gt;userq_destroy) {
+                ctx-&gt;ip_block-&gt;funcs-&gt;userq_destroy(ctx-&gt;device, ctx-&gt;ring_ctx,
+                                                  (unsigned int)ctx-&gt;ip_type);
+            }
+        } else {
+            if (ctx-&gt;ring_ctx-&gt;context_handle) {
+                amdgpu_cs_ctx_free(ctx-&gt;ring_ctx-&gt;context_handle);
+            }
+        }
+
+        /* Free PM4 command buffer */
+        if (ctx-&gt;ring_ctx-&gt;pm4) {
+            free(ctx-&gt;ring_ctx-&gt;pm4);
+        }
+
+        free(ctx-&gt;ring_ctx);
+    }
+
+    free(ctx);
+}
+
+/**
+ * Submit command packet without waiting - Fixed submission logic
+ */
+int cmd_submit_packet(cmd_context_t *ctx)
+{
+    amdgpu_bo_list_handle bo_list;
+    int r;
+    struct amdgpu_cs_request ibs_request;
+    struct amdgpu_cs_ib_info ib_info;
+    amdgpu_bo_handle ib_bo;
+    void *ib_cpu;
+    uint64_t ib_mc_address;
+    amdgpu_va_handle ib_va_handle;
+    amdgpu_bo_handle all_res[5] = {0};
+    uint32_t res_count = 0;
+    uint32_t i;
+
+    if (!ctx || !ctx-&gt;initialized || !ctx-&gt;ring_ctx) {
+        igt_debug(&quot;Invalid context parameters\n&quot;);
+        return -EINVAL;
+    }
+
+    /* Check required parameters */
+    if (ctx-&gt;ring_ctx-&gt;pm4_dw == 0 || ctx-&gt;ring_ctx-&gt;pm4_dw &gt; 1024) {
+        igt_debug(&quot;Invalid PM4 size: %u (must be 1-1024)\n&quot;, ctx-&gt;ring_ctx-&gt;pm4_dw);
+        return -EINVAL;
+    }
+
+    /* For user queues, use userq_submit */
+    if (ctx-&gt;user_queue) {
+        if (!ctx-&gt;ip_block || !ctx-&gt;ip_block-&gt;funcs-&gt;userq_submit) {
+            igt_debug(&quot;User queue submission not supported\n&quot;);
+            return -ENOTSUP;
+        }
+
+        if (!ctx-&gt;ring_ctx-&gt;bo_mc) {
+            igt_debug(&quot;Invalid BO MC address for user queue\n&quot;);
+            return -EINVAL;
+        }
+
+        ctx-&gt;ip_block-&gt;funcs-&gt;userq_submit(ctx-&gt;device, ctx-&gt;ring_ctx,
+                      (unsigned int)ctx-&gt;ip_type,
+                      ctx-&gt;ring_ctx-&gt;bo_mc);
+        ctx-&gt;last_submit_seq = ctx-&gt;ring_ctx-&gt;point;
+        igt_info(&quot;User queue submission successful, point=%lu\n&quot;, ctx-&gt;last_submit_seq);
+        return 0;
+    }
+
+    /* For regular queues, setup and submit CS */
+    memset(&amp;ibs_request, 0, sizeof(ibs_request));
+    memset(&amp;ib_info, 0, sizeof(ib_info));
+
+    /* Allocate separate IB buffer instead of reusing command buffer */
+    r = amdgpu_bo_alloc_and_map(ctx-&gt;device,
+                               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t),
+                               4096,
+                               AMDGPU_GEM_DOMAIN_GTT,
+                               0,
+                               &amp;ib_bo,
+                               &amp;ib_cpu,
+                               &amp;ib_mc_address,
+                               &amp;ib_va_handle);
+    if (r) {
+        igt_debug(&quot;Failed to allocate IB: %d\n&quot;, r);
+        return r;
+    }
+
+    /* Copy PM4 commands to IB */
+    memcpy(ib_cpu, ctx-&gt;ring_ctx-&gt;pm4, ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+    /* Setup IB information */
+    ib_info.ib_mc_address = ib_mc_address;
+    ib_info.size = ctx-&gt;ring_ctx-&gt;pm4_dw;
+    if (ctx-&gt;ring_ctx-&gt;secure)
+        ib_info.flags |= AMDGPU_IB_FLAGS_SECURE;
+
+    /* Setup submission request */
+    ibs_request.ip_type = (unsigned int)ctx-&gt;ip_type;
+    ibs_request.ring = ctx-&gt;ring_ctx-&gt;ring_id;
+    ibs_request.number_of_ibs = 1;
+    ibs_request.ibs = &amp;ib_info;
+    ibs_request.fence_info.handle = NULL;
+
+    /* Create resource list containing both original resources and IB */
+    /* Add original resources */
+    for (i = 0; i &lt; ctx-&gt;ring_ctx-&gt;res_cnt &amp;&amp; i &lt; 4; i++) {
+        if (ctx-&gt;ring_ctx-&gt;resources[i]) {
+            all_res[res_count++] = ctx-&gt;ring_ctx-&gt;resources[i];
+        }
+    }
+
+    /* Add IB as the last resource */
+    all_res[res_count++] = ib_bo;
+
+    /* Create BO list */
+    r = amdgpu_bo_list_create(ctx-&gt;device, res_count, all_res, NULL, &amp;bo_list);
+    if (r) {
+        igt_debug(&quot;amdgpu_bo_list_create failed: %d\n&quot;, r);
+        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+                               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+        return r;
+    }
+
+    ibs_request.resources = bo_list;
+
+    /* Submit command - strict error checking */
+    r = amdgpu_cs_submit(ctx-&gt;ring_ctx-&gt;context_handle, 0, &amp;ibs_request, 1);
+
+    if (r != 0) {
+        igt_debug(&quot;amdgpu_cs_submit failed: %d\n&quot;, r);
+        amdgpu_bo_list_destroy(bo_list);
+        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+                               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+        return r;
+    }
+
+    /* Record submission sequence number for waiting */
+    ctx-&gt;last_submit_seq = ibs_request.seq_no;
+    igt_debug(&quot;Command submitted successfully, seq_no=%lu\n&quot;, ctx-&gt;last_submit_seq);
+
+    /* Cleanup resources */
+    amdgpu_bo_list_destroy(bo_list);
+    amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+                           ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+    return 0;
+}
+
+int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
+{
+    int result = -EINVAL;
+
+    if (!ctx || !ctx-&gt;initialized || !ctx-&gt;ip_block || !params)
+	return -EINVAL;
+
+    if (!ctx-&gt;ring_ctx || !ctx-&gt;ring_ctx-&gt;bo_cpu)
+	return -EINVAL;
+
+    /* Clear the buffer before operation */
+    memset((void *)ctx-&gt;ring_ctx-&gt;bo_cpu, 0,
+	   ctx-&gt;ring_ctx-&gt;write_length * sizeof(uint32_t));
+
+
+    /* Build the command packet based on type */
+    switch (params-&gt;type) {
+	case CMD_PACKET_WRITE_LINEAR:
+	    if (!ctx-&gt;ip_block-&gt;funcs-&gt;write_linear)
+		    return -ENOTSUP;
+
+	    /* TODO: allow user set the dst and data */
+	    //ctx-&gt;ring_ctx-&gt;bo_mc = params-&gt;dst_addr;
+	    ctx-&gt;ring_ctx-&gt;write_length = params-&gt;size / sizeof(uint32_t);
+
+	    /* Build PM4 packet */
+	    result = ctx-&gt;ip_block-&gt;funcs-&gt;write_linear(ctx-&gt;ip_block-&gt;funcs,
+						       ctx-&gt;ring_ctx,
+						       &amp;ctx-&gt;ring_ctx-&gt;pm4_dw);
+
+	    /*  Copy PM4 packet to ring buffer */
+	    if (result == 0 &amp;&amp; ctx-&gt;ring_ctx-&gt;pm4_dw &gt; 0) {
+	        memcpy((void *)ctx-&gt;ring_ctx-&gt;bo_cpu,
+	               ctx-&gt;ring_ctx-&gt;pm4,
+	               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+	        //igt_info(&quot;cmd_place_packet: Copied %u DWORDs to ring buffer\n&quot;,
+	          //       ctx-&gt;ring_ctx-&gt;pm4_dw);
+	    }
+	    return result;
+
+	case CMD_PACKET_WRITE_ATOMIC:
+	    if (!ctx-&gt;ip_block-&gt;funcs-&gt;write_linear_atomic)
+		    return -ENOTSUP;
+
+	    /* TODO: allow user set the dst and data */
+	    //ctx-&gt;ring_ctx-&gt;bo_mc = params-&gt;dst_addr;
+	    ctx-&gt;ring_ctx-&gt;write_length = 1; /* Atomic operations typically work on single DWORD */
+
+	    result = ctx-&gt;ip_block-&gt;funcs-&gt;write_linear_atomic(ctx-&gt;ip_block-&gt;funcs,
+							      ctx-&gt;ring_ctx,
+							      &amp;ctx-&gt;ring_ctx-&gt;pm4_dw);
+
+	    /*  Copy PM4 packet to ring buffer */
+	    if (result == 0 &amp;&amp; ctx-&gt;ring_ctx-&gt;pm4_dw &gt; 0) {
+	        memcpy((void *)ctx-&gt;ring_ctx-&gt;bo_cpu,
+	               ctx-&gt;ring_ctx-&gt;pm4,
+	               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+	        //igt_info(&quot;cmd_place_packet: Copied %u DWORDs to ring buffer (atomic)\n&quot;,
+	          //       ctx-&gt;ring_ctx-&gt;pm4_dw);
+	    }
+	    return result;
+
+	case CMD_PACKET_COPY_LINEAR:
+	    if (!ctx-&gt;ip_block-&gt;funcs-&gt;copy_linear)
+		    return -ENOTSUP;
+
+	    /* For copy operations, we need both source and destination addresses */
+	    /* This would require extending the API to pass both addresses */
+	    /* For now, use the internal buffer as source */
+	    ctx-&gt;ring_ctx-&gt;write_length = params-&gt;size / sizeof(uint32_t);
+
+	    result = ctx-&gt;ip_block-&gt;funcs-&gt;copy_linear(ctx-&gt;ip_block-&gt;funcs,
+						      ctx-&gt;ring_ctx,
+						      &amp;ctx-&gt;ring_ctx-&gt;pm4_dw);
+
+	    /* Copy PM4 packet to ring buffer */
+	    if (result == 0 &amp;&amp; ctx-&gt;ring_ctx-&gt;pm4_dw &gt; 0) {
+	        memcpy((void *)ctx-&gt;ring_ctx-&gt;bo_cpu,
+	               ctx-&gt;ring_ctx-&gt;pm4,
+	               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+	        //igt_info(&quot;cmd_place_packet: Copied %u DWORDs to ring buffer (copy)\n&quot;,
+	          //       ctx-&gt;ring_ctx-&gt;pm4_dw);
+	    }
+	    return result;
+
+	case CMD_PACKET_COPY_ATOMIC:
+	    /* TODO: Implement atomic copy if supported */
+	    igt_info(&quot;cmd_place_packet: ATOMIC_COPY not implemented\n&quot;);
+	    return -ENOTSUP;
+
+	case CMD_PACKET_FENCE:
+	    /* TODO: Implement fence operation */
+	    igt_info(&quot;cmd_place_packet: FENCE not implemented\n&quot;);
+	    return -ENOTSUP;
+
+	case CMD_PACKET_TIMESTAMP:
+	    /* TODO: Implement timestamp operation */
+	    igt_info(&quot;cmd_place_packet: TIMESTAMP not implemented\n&quot;);
+	    return -ENOTSUP;
+
+	default:
+	    igt_info(&quot;cmd_place_packet: Unknown packet type: %d\n&quot;, params-&gt;type);
+	    return -EINVAL;
+    }
+}
+
+/**
+ * Build and submit packet in one operation
+ */
+int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
+{
+    int r;
+
+    r = cmd_place_packet(ctx, params);
+    if (r)
+	return r;
+
+    return cmd_submit_packet(ctx);
+}
+
+/**
+ * Convenience function for write linear
+ */
+int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data)
+{
+    cmd_packet_params_t params = {
+	.type = CMD_PACKET_WRITE_LINEAR,
+	.dst_addr = dst_addr,
+	.size = size,
+	.data = data,
+    };
+
+    return cmd_place_and_submit_packet(ctx, &amp;params);
+}
+
+/**
+ * Convenience function for copy linear
+ */
+int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size)
+{
+    cmd_packet_params_t params = {
+	.type = CMD_PACKET_COPY_LINEAR,
+	.src_addr = src_addr,
+	.dst_addr = dst_addr,
+	.size = size,
+    };
+
+    return cmd_place_and_submit_packet(ctx, &amp;params);
+}
+
+/**
+ * Convenience function for atomic operation
+ */
+int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data)
+{
+    cmd_packet_params_t params = {
+	.type = CMD_PACKET_WRITE_ATOMIC,
+	.dst_addr = dst_addr,
+	.data = data,
+    };
+
+    return cmd_place_and_submit_packet(ctx, &amp;params);
+}
+
+/**
+ * Wait for all submitted packets to complete (equivalent to Wait4PacketConsumption)
+ */
+int cmd_wait_completion(cmd_context_t *ctx)
+{
+    struct amdgpu_cs_fence fence_status = {0};
+    uint32_t expired;
+
+    if (!ctx || !ctx-&gt;initialized)
+	return -EINVAL;
+
+    /* For user queues, wait on timeline syncobj */
+    if (ctx-&gt;user_queue) {
+	if (!ctx-&gt;ring_ctx-&gt;timeline_syncobj_handle)
+	return -EINVAL;
+
+	return amdgpu_timeline_syncobj_wait(ctx-&gt;device,
+					   ctx-&gt;ring_ctx-&gt;timeline_syncobj_handle,
+					   ctx-&gt;ring_ctx-&gt;point);
+    }
+
+    /* For regular queues, wait on fence */
+    fence_status.ip_type = (unsigned int)ctx-&gt;ip_type;
+    fence_status.ip_instance = 0;
+    fence_status.ring = ctx-&gt;ring_ctx-&gt;ring_id;
+    fence_status.context = ctx-&gt;ring_ctx-&gt;context_handle;
+    fence_status.fence = ctx-&gt;last_submit_seq;
+
+    return amdgpu_cs_query_fence_status(&amp;fence_status,
+				       AMDGPU_TIMEOUT_INFINITE,
+				       0, &amp;expired);
+}
+
+/**
+ * Check if ring is available
+ */
+bool cmd_ring_available(amdgpu_device_handle device,
+			enum amd_ip_block_type ip_type,
+		       uint32_t ring_id,
+		       bool user_queue)
+{
+    struct drm_amdgpu_info_hw_ip hw_ip_info;
+    int r;
+
+    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &amp;hw_ip_info);
+    if (r)
+	return false;
+
+    if (user_queue) {
+	/* For user queues, check user queue slots */
+	uint32_t userq_slots = hw_ip_info.num_userq_slots;
+
+	return (ring_id &lt; userq_slots);
+    } else {
+	/* For regular queues, check available rings */
+		return !!(hw_ip_info.available_rings &amp; (1ULL &lt;&lt; ring_id));
+    }
+}
+
+/**
+ * Get number of available rings
+ */
+uint32_t cmd_get_available_rings(amdgpu_device_handle device,
+				 enum amd_ip_block_type ip_type,
+				bool user_queue)
+{
+    struct drm_amdgpu_info_hw_ip hw_ip_info;
+    int r;
+
+    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &amp;hw_ip_info);
+    if (r)
+	return 0;
+
+    if (user_queue) {
+	return hw_ip_info.num_userq_slots;
+    } else {
+		return __builtin_popcountll(hw_ip_info.available_rings);
+    }
+}
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index 8b090359a..7826c2d0f 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -28,6 +28,45 @@
 
 #include &quot;amd_ip_blocks.h&quot;
 
+/**
+ * Packet types supported by the command submission library
+ */
+typedef enum {
+    CMD_PACKET_WRITE_LINEAR,
+    CMD_PACKET_WRITE_ATOMIC,
+    CMD_PACKET_COPY_LINEAR,
+    CMD_PACKET_COPY_ATOMIC,
+    CMD_PACKET_FENCE,
+    CMD_PACKET_TIMESTAMP,
+} cmd_packet_type_t;
+
+/**
+ * Command submission context structure
+ */
+typedef struct {
+    amdgpu_device_handle device;
+    struct amdgpu_ring_context *ring_ctx;
+    const struct amdgpu_ip_block_version *ip_block;
+    enum amd_ip_block_type ip_type;
+    bool initialized;
+    bool user_queue;
+    bool uses_external_bo;
+    uint64_t last_submit_seq; /* Last submission sequence number */
+} cmd_context_t;
+
+/**
+ * Packet building parameters
+ */
+typedef struct {
+    cmd_packet_type_t type;
+    uint64_t src_addr;
+    uint64_t dst_addr;
+    uint32_t size;
+    uint32_t data;
+    uint32_t *custom_data;
+    uint32_t custom_data_size;
+} cmd_packet_params_t;
+
 int amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
 				unsigned int ip_type, struct amdgpu_ring_context *ring_context,
 				int expect);
@@ -49,4 +88,37 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 void  amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
 					  amdgpu_context_handle ctx);
+
+cmd_context_t* cmd_context_create(amdgpu_device_handle device,
+                                    enum amd_ip_block_type ip_type,
+                                    uint32_t ring_id,
+                                    bool user_queue,
+                                    uint32_t write_length,
+                                    amdgpu_bo_handle external_bo,
+                                    uint64_t external_bo_mc,
+                                    volatile uint32_t *external_bo_cpu);
+void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo);
+
+int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
+
+int cmd_submit_packet(cmd_context_t *ctx);
+
+int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
+
+int cmd_wait_completion(cmd_context_t *ctx);
+
+int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data);
+
+int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size);
+
+int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data);
+
+bool cmd_ring_available(amdgpu_device_handle device,
+                        enum amd_ip_block_type ip_type,
+                       uint32_t ring_id,
+                       bool user_queue);
+
+uint32_t cmd_get_available_rings(amdgpu_device_handle device,
+                                 enum amd_ip_block_type ip_type,
+                                bool user_queue);
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------uHjF8fdbtStxo2GwFiOqsshG--

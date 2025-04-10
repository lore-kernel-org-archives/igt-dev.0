Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0C7C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ABE10E186;
	Thu, 10 Apr 2025 22:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aVODohjc";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB9210E186
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vm2QUQFEhDGcVg8psvmKs7kAjtF79XHWjP12oTW32ic8vZiqZ+0Z2Es3fs99QbYnLXhRwvsBidd+HBw4OmMmu/Z5jq7RY0LRRtpeWFAGc2ppQfQQ7LtQAdO0la9hzwCsGHLQTU6rd5KMfpDLkFV2Voy5+HS6lOTV4zyHjyvHsrz+9D7aAMKfXrFUkvO7uTR91O9oqzWtEPw11/i7vypDq+aaqLEnhR8M8L+7CvMFzSDvDpzM8ujIGfrdevE6NonzutEWSVW2ZWQxa+5s/v9epzn4B8F/tVC8XhN7Vj8WQUORvBwIVhv/jDLrledn4n4DtFmJ4tdrEa3NLOEZLsvB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z8y0gLdHDjVNFHwPTevbKsiioGzJwNVtJsYV5Gx1rs=;
 b=EDK2q9dGTJ2da1qGEmc+NZIaAY401Cee3PJY1KPj8X8r4YbJBxHFX0vXGBFX+PwcbfFrJVxjqJcA6pvGSN3i7uvjQRN1S4Dw6VT9dyKA+oQX2dchp2Bo2IvEMuGbFHC0ru9dkY6KmoMLgPxFJfz4t2Y0dYfXGUUQ8BtrcrPmGTWQw96p5E7OTaXcbyVWDd71JQk3y2NfGxohbxHFKW+a+i5lHjIkGw1GD6JmitkelHHbERTbnhYrOZdteds1dOIt9f2odcUDHf/+Rrt/HtQ5UAypj0fRUD8LYQVaIYaSbOCcokt25ja5gL3y4lR87BNDwUpQW9W9uksx5wR1pEKP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z8y0gLdHDjVNFHwPTevbKsiioGzJwNVtJsYV5Gx1rs=;
 b=aVODohjc7qkJrKa9HUMGTkQlzvFBEqOMuIKImFHG0wUJpjNBEuR8J/g6jvBY1JKjejRA5lKXeulswT+2BSuxNcwDxgTHdSd5VMGZd6hhMTNKEzY3dZMQIa/gTOj+B3I/s0vm5RCsU4NHNfgk3DP8tDs5i5Uya/GZiuccUwuQrtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS5PPF266051432.namprd12.prod.outlook.com (2603:10b6:f:fc00::648)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 22:14:17 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 22:14:16 +0000
Message-ID: <e4266ad9-18a1-402a-9cbb-5fd5479f6171@amd.com>
Date: Thu, 10 Apr 2025 18:14:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/3] lib/meson.build: Add AMDGPU_USERQ_ENABLED
 check for user queues
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, sukhatri@amd.com,
 prike.liang@amd.com
References: <20250409075653.2502119-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250409075653.2502119-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::41) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS5PPF266051432:EE_
X-MS-Office365-Filtering-Correlation-Id: e2de5840-d867-4516-802c-08dd787d087b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDhabDMyTmJzeW5lcUJZNXFzUW9MdzRQQWw5VWVaQjQ1MHA2Vk12Y1I0aWta?=
 =?utf-8?B?TW9scFZ5RHVJTGpXelpVWVVxNXBtSytXZE53TmQvTzB2OUFGYTNFWUNMRVpp?=
 =?utf-8?B?bjFqb2t4dnJrcWxseWdQWmtuM3JUU1Y3NDdjQ0FyWWxCR1M4S1lPNTVhUmx6?=
 =?utf-8?B?WXA2VzREZCtGZjZBY2tyWitGZ0h1dEg4WDRHSGp4aElUUEJ0dWozSmg1eml1?=
 =?utf-8?B?dXkwWWh0Ym5DUzFUM1p5KytiT1pDcEVqaUthZldQU2JJSU1UQmZGbVlMWGZQ?=
 =?utf-8?B?Z3dHdGp3cVdQUXNDcnluUmVoL1JqZXRjYmtqZ1hJQURxUjJMTC9CRVRFQ1px?=
 =?utf-8?B?ampTSFlDQ284Y1hkR1hCS2xpcmxJT1FjZTQzUmh4MDE2VGFLSktsYm4vbmtJ?=
 =?utf-8?B?US83cituekJzOEdneXlkKzBzQkhXbGU0bm9qSU5GNjJlU2FTWUxONlpKK0Z4?=
 =?utf-8?B?aThxSVEwKzF6d3pmU2cvaVZBWEtUVjRQUkF6dEc3bHR5MFRyYVAxVERScFNQ?=
 =?utf-8?B?QkdRQ2VnQi8rTUZWdW00ZWZBRWpCNDl5aVhza01jbXdIR25HOHVtemJQNFFC?=
 =?utf-8?B?NzBRbkhLaWRiaXpVTlVlZ3BzVVg5NWgvM01Ea3ZnbjkxRzU0YnpHTTQ0TU4v?=
 =?utf-8?B?VFBwR2ZtWTV1MVhtbUZoalFROHVUdFlycFAyTmlTZUFPYzNTbW5YVkgxcE8y?=
 =?utf-8?B?QzNsSC9YQnVMMm10cjJFY1dLN05DY091L1ZqMXIzMFJUQlNvQ3hGT3pZbW5P?=
 =?utf-8?B?ZUljUm1VNmJpSzU4M1dBZU1vRDRBbi9sb3hVR01WSXZQcXMrNG13V3pCUFN4?=
 =?utf-8?B?aFlYUDVxTDNmR280WHg0TmMrMG5pclZYWVAyWWd4Y2p5ZXFkQ3V0aUwrcXBj?=
 =?utf-8?B?QllSOE5QcDkySG94b1d6RWFSL3NJRzd5MjBnd3ZRQjVGZ0dVWTA3SzFTdmpv?=
 =?utf-8?B?V3pRNGxPVis3bzd2UTBmSDlKRnBSTldaNWtZZE1hSTBNZ3JDRld5VGhEdmdn?=
 =?utf-8?B?QkFVQVRwNnZ5dm1yckxZdXdBV0hBZUNqdXJXeEEvSWRTYkM1YW16QXJmaWQ4?=
 =?utf-8?B?UVJuVmh3V0hoL0trYUxTYkVTZURycGp5dHZwU2l3a1VsYkFwUkZRSkh1Qkwy?=
 =?utf-8?B?NTJiaHNXd2VwTkU3aVB6cjh2YWFiTm9PeDdHRlBRNmxEK1EyUWNEU2U3RklK?=
 =?utf-8?B?YnNpbC9KeHhjYUNWanZyQ3k2cWtRRkxaWERGOHZhWTVBcHhJZSsxbnFneHQ4?=
 =?utf-8?B?alhKQnNnRHhmQkxjK1lmL3VzR1ZSajRoSGZLNnJLYVFsNHpkcndMbWtqV1c2?=
 =?utf-8?B?Vy9rcTByam9YcXIycWRzVWlsaDFVNHJIU2ZMTnNvTUUwRC84SjRlVnNIc1dk?=
 =?utf-8?B?dnZ2eFdxZ1hJeXAzYjlPamNqUVAzZFlMZzg4RHUxaHhCb0NtLzVKZEFYeG1k?=
 =?utf-8?B?MWZ6YXdUL2hrc01BNDlINkszVVJkQVhoNE0ybGp0bFBwdjdUSGd1Q2RDdEx2?=
 =?utf-8?B?MjE0dUhtTzdjazgzcjExK0dUd1pnbUpxY1NJbjczMXdHNDgrUFBLQkRJb05m?=
 =?utf-8?B?MDYvRllaU0VraG8zdVhDK2UwTWtEdytMc0tTeEoxbUFNNU9lM2czclJyclFz?=
 =?utf-8?B?eDdhei9JZVJoOGlMbDVSYy83bnZ4cG9LMVJKcmRXeHBHUFhpSGZLVGlPWElz?=
 =?utf-8?B?S00yYVpUc3dqU1hQSmpPNkNFMHRPQjczdjVNc2t3ZldkQVhvY2YweEJFc3N0?=
 =?utf-8?B?R3RJVm9zZVo5RGVXaTJPM1QvaDFLRkFSdnNndnB2bThWVEdYUXl0elhrUHl3?=
 =?utf-8?B?S2ZudUl0U1pWZFlTR092ZCtIaU1vZFFaOGUyYnRyd2Y4dFJqTTEyek9aRElk?=
 =?utf-8?B?OVZndmpsUC8vWlVES0cxZmtNbDJYeFl4K2xJQmF0bS9xbDIyNTNiSTRMZ0c0?=
 =?utf-8?Q?doI+RX1qoGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bER0cVJIc2dENWI3U2VjYXkxNFFhRHZiRm43dGo5azBZQ0NsN3VBUUt3QTh0?=
 =?utf-8?B?MWx6em1SMkNNczNHekxJa090NWdTQzlNUUhoczJzWnR2WnVMMUl2VEhMUktZ?=
 =?utf-8?B?Mis4Tmtka1JJTExOc2R5K3YySjZtWDJtckFkZTkvMllaUWRGTjk0dmkzMmFs?=
 =?utf-8?B?bllWVjZ0TkVaWThuNmoxZVpxSHMyRDhheEJCeFNkMS9CUnNEamhHZlY1N29L?=
 =?utf-8?B?cjB1T2lMYnhsQWFqcjh4STE3N09tVGdQMlE5Y0llVUJYQUM1eE9qQmF0NHFM?=
 =?utf-8?B?TFF4RUQxOW16TUFQOXo2MnRnU3ZQYmNjdWhFM2gzN1dpKzZSeFgyUjlBcitv?=
 =?utf-8?B?WGhObXpIK3FiM1FPSWswcVhic2MxTW1nNGFlYjlRTkJzQTBDV2RISk5UWkh6?=
 =?utf-8?B?SENGb3VldlZpdnpyQml4SUNjSmc1VWdDbWtnZTl4a1VVbnBpaHg4WFIxaEg5?=
 =?utf-8?B?bENHcGFUZ1hUZm8yR0V2NDEyUk9teS9rVm8rQ002MDF1dHc0SnBsREwwVWpF?=
 =?utf-8?B?WTRRVDIvZGZzN2ExZm5xeTJaMFVibkxaeVdKR21yMVlrclRNVGtVNUJNZXpQ?=
 =?utf-8?B?UGdla1dWNHFsaDlSU1hpVXgrQnZxVmtCUmQyc2gwSzhwa0s4MzJ2WHcrT0dD?=
 =?utf-8?B?VzdMZXlpQXFlU1JmZGN5UUV1UXlQbFZsaXJYQ1N6VmVWNnVmZjFCSmhiaDgy?=
 =?utf-8?B?UjZISkdsZnJSTHJMV08rQVYvMnVHY3k1SjJuU21KeHpreTlIaWFSV0dlSVdY?=
 =?utf-8?B?RnpEVXZ0TlFwekFkSWErREZRT29kejNkczRReEtTeUpJZzVUakxYdGl6VjFR?=
 =?utf-8?B?MWJJRTU5NkdIZlJpWHovS05oL1lLd1FBQm94VHltdElFZ3FkM1J5YXM3eGYz?=
 =?utf-8?B?QTA4QWlkcURXWXVGZXhuaVhwcm9lUHdoS0pwMktmdU1oZW5lTVJXdXhpQUNC?=
 =?utf-8?B?TTB2QUUzNDU2Y016WjNUdVZpZkdXWE5aSWQxOE96RG94cm02RDRoTnlxSEg2?=
 =?utf-8?B?MGQwK1F5WkZwREp0aE54bE51dFlVSlQ0a2RDNWNIdWtydFduRmNmbVhlTEpU?=
 =?utf-8?B?OTd4YjlMZjFJYWVKUFoycTk1QjQvTEdCdUlUWU80V1R1YmJObjJ1dGwza0JV?=
 =?utf-8?B?emhYSDUyMzRvbE1kMDBTU0o0R09lNFRQNnNZeXZvc0FEQmVvUTY3bnhkbjI3?=
 =?utf-8?B?V2lpTko4UGFkSUZLWCtib0NuOE9YVEpLMlllcFRRdTFqUkFVby9TRWJjcDlC?=
 =?utf-8?B?NkVOZW1oaEtkZ0xacC9ZcU1ldnNIY2RsVEhvTWtCSkMzWHlFY2x3eFAxVXhP?=
 =?utf-8?B?VGNOL1AwY3h3azh3YklkdVVrM3F0RHNSM2lZRm5GUUxQWkI5bCtHbms5bGtU?=
 =?utf-8?B?eUI1MmhySWhVK3YyblQwNUdVVFlCVGlLM3lwUnRxaXdLQURlSDdHWk53bGtX?=
 =?utf-8?B?WVZkQzkrZGVod3RKRE5DM045YU55RjVZTzlwMWJ6aSt5TUtwcys0cnE4REdP?=
 =?utf-8?B?cmY5NTNMc2xjRitzSis0REF6aEd4aVY2L2JnalkyRnNlMlZ1RElCYndDYS95?=
 =?utf-8?B?Nmt4V0JZTEJjSG80Tzhya2J2R1BWYi9jUkhFdElFek93ZUpCOEFBSlFUTUFu?=
 =?utf-8?B?YjNES050dGg0a0dtZEg3VURNaWhqMHJvMUxUYUNoRTAvT0JobndSQVQ3R2ZN?=
 =?utf-8?B?aUpXU1R6KzZ5TENheGY0eVJsckxKL1NpQUpWMWNpVW43ZkNWNlE4QURtNzBX?=
 =?utf-8?B?blRtZ01EN05aOXpEclM2MUtSZytmTUVZb3UxRzhYQ2thR2dVdGVkSzZpeWU3?=
 =?utf-8?B?QkNtNzRBZEU3bzM5QXdTSXEwVnc5c213bkVOVEp5Qi9DUzZ2aEJjNzk5Tyt0?=
 =?utf-8?B?ZGpIZW9WWVBnYjB3a2tOdkEvcUtwallYT1lkOEsxcEFicmttT2o2T0FRMXFV?=
 =?utf-8?B?YWxLVldRVnBBaVgwUWNIVDFhNVM3SU5EeXNiUEwyemYzSFlJelVzUGkvMXcv?=
 =?utf-8?B?TUEzWEtTWU0yRHJHUmZ5WTRNallEUUF4MldmcDV5RUtnZVhrei93QVp3ODJm?=
 =?utf-8?B?ZjhzWVgvTGRXVC9CeUZncWRqUi9ESEp0SnZJMjhsajVTbXVwM3duMDk1eFA5?=
 =?utf-8?Q?ZmkN6oOPgq3JCtjWBW5h+b0q4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2de5840-d867-4516-802c-08dd787d087b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 22:14:16.8392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uq5O26dd8WcQiOraWQ1r04ZB2mZpzcuffDlmSNpW7LWHdXrc8kKHPqsOZoCGBFV/zri8rVMY4QusX/SOB/NbCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF266051432
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

The 3 patches looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-04-09 03:56, Jesse.zhang@amd.com wrote:
> From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>
>
> Detect whether libdrm provides amdgpu_create_userqueue() and define
> AMDGPU_USERQ_ENABLED if available. This enables user queue support
> when building against newer libdrm while maintaining compatibility
> with older versions that lack this function.
>
> Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
> ---
>  lib/meson.build | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/lib/meson.build b/lib/meson.build
> index d7bb72c57..8517cd540 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -172,6 +172,11 @@ if libdrm_amdgpu.found()
>  		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
>  	else
>  		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
> +	endif
> +
> +	if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_amdgpu)
> +		add_project_arguments('-DAMDGPU_USERQ_ENABLED=1', language: 'c')
> +		#conf.set('AMDGPU_USERQ_ENABLED', 1)
>  	endif	
>  endif
>  

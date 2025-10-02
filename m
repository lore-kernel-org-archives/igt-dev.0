Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78831CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 20:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101F810E39D;
	Thu,  2 Oct 2025 20:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A9AVDL/V";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B57A10E39D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 20:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhOQ3QypbUQiIQhZ49tM+eUjiYctXwgp/W+YfvE5GQCjBsHnRH1NNI/EWqzsn7WOmILdmlsF8f//YcFUH1ndLQQC6s30YyAegIV6bU95QRMXbot+fo98blcy3LQr4p5C3ZtfkVp8eNM0IMpe9TsuR1BbO7cXE1cv/y6rreStmcYnqoxR/F5qN2ewJGiIOKN3aetYIB52OHsOANBsKxh/BKe0nfV00MR5nUTRwQnVjrQT66hTt6zXh3MZnp3/sKRrY886Qiv33daL+5XPHPfZX3QRwxKcnD4KiqghafMX+F9wVKW17w3l0gk6LqyKE6GQ8UTWg7WpXtrznw/AfXHX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMJ3kIRM+VM5tnH9nIUDqLlr3YkBmSeUaSxWWVbx0Ww=;
 b=e1NRaOFLUn5BT2uZTWRmGqCZy5MR4WXrBBrETYAkbCMlC9Y73n9mblgfHUGqaUZnkeIFzCuOKFs9QzIeiuaawbVrMqq1jOgAbsf1qFwoBAe30qXi2u7YSH492V2WFlw8C2Zqen6fj53iyEZaEpCby0jD6Z+aOISJe9d2UVO11plwYxZmTy7LtKXnfvjcUhxAJ3lY1TKrLrBnQ8hQI3ZwUHX74IPaOwoyWn5gck2um6sZwDCtRX/PuXLKOCX8jMTV+jOG5x8P2jSf7Zhws1BIJz01+MmKcoMn2LUEPHZnANslsJ2Tj43R2pOdL6LxdmLc2rfwEzG7juhYAobVemEjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMJ3kIRM+VM5tnH9nIUDqLlr3YkBmSeUaSxWWVbx0Ww=;
 b=A9AVDL/Vizn7xPWRbgX8nWfVsZkbrKNsVQB8AG/3X0nuUPnT0so9oYa2JSzXrDXxhrt52ucOJfs92Yf2RFCzN2r1M5sVI2CYnQCj9aIqvVy2BIlX+2vTTUnyvzhI32x42ZsZBY5s1jAnScfpNuoYoCRnLWuQNNy78V5VFxIO5po=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV3PR12MB9268.namprd12.prod.outlook.com (2603:10b6:408:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 20:14:04 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 20:14:04 +0000
Message-ID: <c1cd3cab-c028-46e3-b76f-61b56b4f2963@amd.com>
Date: Thu, 2 Oct 2025 14:14:03 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 02/30] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-3-alex.hung@amd.com>
 <5efb9dc9-6007-4d0b-bf84-950cbf208362@bootlin.com>
 <20251002151152.24whdoghdyiwpsjv@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251002151152.24whdoghdyiwpsjv@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:303:b5::18) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV3PR12MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 7959a62b-371b-4400-91e2-08de01f03c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2RNTVN4anpMSGlEQVlGNUg1eHZyUzlZdDd3OUtZakdIemd6MWJHSUQ0eENM?=
 =?utf-8?B?ZTVJRkYzeHViRFZBbkdXeWRWYU1NYXNjZkhjUXhLY3JDTDBzdlNMdFZERHhj?=
 =?utf-8?B?U1ZOS0paUlBPZ0NrZkY2TU1qai8xc0NEMWFmUkJxeXBwcFkxMUg2SWp2VCtv?=
 =?utf-8?B?MTAzTnRWMDJWVEUwNm9ObnBMTWpCYU9MWGZIenB6Z3YyZiszWkdjMTdVeE00?=
 =?utf-8?B?WVQxcWJYVDlyMDFaYkVnUGRyUTJrMzQ3Ymg4eU43OG1tT2IyYWJJL2pIMzFw?=
 =?utf-8?B?NURFeGpRa0dHOVhyNU8yOVJFUG5IbDd1azBDZUk5am1MZnF2THgrbld4U292?=
 =?utf-8?B?WllNeXpEUGwvZElnbGs0MFRNeEFSMkFqeVl5QnV3aVlaZDc2UXBZd2Iydy9N?=
 =?utf-8?B?Vjl5aWM1SzB1angvQ2s2bjE4ZjFJcXRRQytzMzZXOVZ0WSs0eEMrWXBxN1lV?=
 =?utf-8?B?RW02QU9KUTlwQnNuVG9USjVGaWdtU2oydU81WWdlRThtK0M0b2hTSzhOZVox?=
 =?utf-8?B?SVFFZkI4aUt4U0dnbU9PRnZpeWdsazRiSWpQR2tIVUV1eFVZNEJRNjc5NktX?=
 =?utf-8?B?c0xhUS9hYWxhMUVBWEhUMVpjZE1keVZHZS9LZ0RQNXZjWXhNbGJLSkdEeFpy?=
 =?utf-8?B?NjFXdTlBY2xtZERSQnpHR1J3YVpQQVY4UnVtMGpuWmE2LzVJUXdLQWdpT1Vj?=
 =?utf-8?B?MkV5bHAvSTU4SDVtOU4wZTZpKy81WE5SNWpjdkR3Y1hzOG9HR3k3VVFDOURy?=
 =?utf-8?B?TEpYTXlqQ2d1UVRHRXdlV2VHUXdXRVdBNG11NTRzazh1UndvRDBLbUpGMk1F?=
 =?utf-8?B?VHl4SWNJd0hnelFZOXFyUVlJb0ZwMHEwdm5UM1lnSlBVZk51K0dEMUxQUHhQ?=
 =?utf-8?B?RWlZRE5OdkEvVUM1Mll1MnA1ZWpnZjgrUysyWG9DYlJGNHZPRkpJTXdCQkth?=
 =?utf-8?B?MERBeVJGZjFKR2tZSnByNGNhTmlpZGJwRk95OGQxdmoybHRHSjI5bitORDRZ?=
 =?utf-8?B?b25ENzZJQW5wV0hMQ3MwZExwaDllSjFIaW5zdTg2UC8xb1FSVXR5NzN0dnlI?=
 =?utf-8?B?RWZucnkvVzhwcWRlN2psZVFYUWs5ZEtWMUtOQWJ6QlNEbXR1a0kzTFE1NEVu?=
 =?utf-8?B?dmVBZ3duUXY5YW4rb0xRVlphVEVWL0F2M3VtMzlnMFdQMGw5clJyOWN2ZDVO?=
 =?utf-8?B?VENiTld1d2RLcDZaeWRpdnhkamN6ZmNBV3Mwa1NYM0F2NWlVUjJKMDVEaVVo?=
 =?utf-8?B?NnRJWkRwaEFZVlV1UTkzc3dZWlp5UTZKZmpwZEJQQk9OOW9ZY0ZEdUtpeDAy?=
 =?utf-8?B?Q1R2MjhMejZFUVh0SEVsNmFtQnZYVU9PTGIyWlgzUHEvTCtoaGgrTGtockMy?=
 =?utf-8?B?SXRmRXBGSlJVZ0dMOHlYZUZqTkpYT0lhblFiaDBOa296ZXlmNTVTLzdXMzVC?=
 =?utf-8?B?OXQxNnJraFl3U0ZVUjd3YWFBRGpiODVSV0VKczh0V05sMkdLbUFFelBRN0RX?=
 =?utf-8?B?SjNyUjh1SE5hZHVOOVF2d204N1VNdVVXVTdoaHlBSnY5RnA2aFJ6b3djZ3M4?=
 =?utf-8?B?NW0vQS93MDBEMWprNFA5NldoTGZsTGF3UWZicW9hVlJZY3JHZEZwY1g3Mldx?=
 =?utf-8?B?VjNadjVGZDNqazJkL3ZFQVFjTS92U0ZVNnJwcTc1ZkxDUmE5dVVadmZyMWJt?=
 =?utf-8?B?MS8xdWtoYytXdGJkVnROd1RJN3p3bVVqUmc4UHFSd2F1bkE0ejF0ZWJGNUpW?=
 =?utf-8?B?eUxCd1N5cHlMa3doTlRiWW1NT0pFYmV0YWxoZ1hsVXptOHh0UU1jN0lWUGN0?=
 =?utf-8?B?d2pQUEdYYzgrcUU2TWhhODA0Qk13d1gzWm9PL0o2NEZVcEsyQ0o5SzQ4bGsw?=
 =?utf-8?B?WDhkcEdUejloUHlmLysya1hVa3NmeDIrNWI0Y3BHVDd2TlpyZ2cxMXIxUU5I?=
 =?utf-8?Q?EuKOHZuxIXVrJ5aoFZA7nmnOMdHxzW+B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkRnMm9xRW13TjV4dXQ4eDhTclBITmpoc1c3VWJQZzIwSER6YzJUekk3U0dD?=
 =?utf-8?B?RmdydmtiM2lKYXhwMXVTN3puTUovYlFjRzBhSG85ZHlaaXdCSVZPWUhnOHdr?=
 =?utf-8?B?Q1I5WGt2NURkSlZJQVlxMFV6bkdLK1BmWW1sWk9ZMkpIZVg1enJZV1pHWnp5?=
 =?utf-8?B?RHM4Q2J3WW9CT3V2ZVpzdC9zZ1N2RG9vZ3VwNVB2L3JyektkQkpYSDJDNzdP?=
 =?utf-8?B?SUkyTlNrenN5cldwYitzWWY0cHBCWllZeU9ob2ZDcjh5OWRQM3hSc29oa0hk?=
 =?utf-8?B?MCs1K0MwVTJmTWV4QXUxWmU5Tk1sNnlUc2RqNHk2U3JKUmhxOS9OM1dMUExH?=
 =?utf-8?B?SVA5UFQ4ajZ5ZVIyOXlZQzJiYmlBYURBcFJnem9xQklWQ1gvMmRrWmpzRC9u?=
 =?utf-8?B?UVBUVzlDcnpIc1VxUDZJZzZSM2ZEMTJhcjh6ZlYwM3ByRVVoVEMzdUR5NEMy?=
 =?utf-8?B?eUZtWk5MUVN6WDBOTXYxWEw4c2p3Q2h2OVg0NjRjNU95R0I5b2w3dEI2dUN0?=
 =?utf-8?B?OC9zTms5clUzcjh2SFhrWlRGR2VBWGJBY29LWUtnVkVDcExXRlBNYWtpVUl3?=
 =?utf-8?B?NkY1anNROGhKaHBtM201WG9DRzdVK1duVDU0WGM0VWZzRktncXQrdVhQT1lp?=
 =?utf-8?B?WDdBV3hSeFZCZ0JmVG9aTlRzdDFsU211V1E2aGhHaGpoRDlWbU1YV2dwTWRD?=
 =?utf-8?B?UmVSSkVjQlZJYXVvazF3T3QrWVR6bU1NVDVVc2lXTktWMlRQRlNjR0IzTS9R?=
 =?utf-8?B?dmx3Y3R2NFBtMG1RVkp5ais4WGVnWThrUW53KzFHUFFjbGxqRWhjajVNRHFL?=
 =?utf-8?B?RzUvdG1TTm9Za003aU91YTllaHpZakR3RTB1Y3pxVTJhMnpJTDYzbkFidGp6?=
 =?utf-8?B?Q0hxZm44SXE4T0lwdGp0M1Z3cWZBOEROWXFLZElzNlE5Si9pbkY1Mk5hclIv?=
 =?utf-8?B?eDNKcXViVW1JWGlxNi8yYXE3VEswemQrN0ZkZDFKak00L0oza2U2clhnbVNT?=
 =?utf-8?B?c3BBODZpK1dzRXBWNzZ3Z041MjNXQ2NxTlhISFZ6SVJVWUdiMmE5ZmZzdFI3?=
 =?utf-8?B?aWc4VjVGQWFleHpvejE4TDBvdWloTU5KMGI4MGlEVE9QTkJ0dkxwV1JCQUNz?=
 =?utf-8?B?QVd5anVENlBGYU9WMStobmNmY1pYK0xsTTFHMWhJTWorMFNObCt5ai92QjVw?=
 =?utf-8?B?aUFlVUg3T1JSaHBjZFpjQ21KelE4cmdpcWpLQVdTZ1lnNWdaR09jZ2h5SVJ2?=
 =?utf-8?B?bFluSUJwUDdEUFBqeDBRNDBHaE1xTVFHVDRYZ0FaM2ZMd3ZxTUZqRFFPNHNo?=
 =?utf-8?B?SlpVMXBvMTRxd2FmdEd5dTBnZ0owSDVhekJ1RS8vaHhDbkRQM0w5VWhEdEJ6?=
 =?utf-8?B?SXR6VTZKWEhwMWlIYStrTTlGK2xqYXE4cW9nRFBPZy9FTUJUeHhQZXVZKzYz?=
 =?utf-8?B?L1o5MHI5SXNoUmI5MFJRWjVtbEdYdzBCZlhzemMzdnBwb2c5dTJqRmVIZHkv?=
 =?utf-8?B?ZWl4ZWJSUzErU3JvdXYzRDdjN1E4a0Z1WkpPMW5NZzYwRXprNFdMRVNWNUM0?=
 =?utf-8?B?WWlkUGNmdGhMM1R6VUZRbjVVZzRydWpCRkE0SGxwNTJVczBNUG5GTGd2ZnA3?=
 =?utf-8?B?aE0xR3cyeUU2dnI0MTNzaHlTbXFqZ21DYzBVSmxsYjJBS2lJaXVhZm42Ri9T?=
 =?utf-8?B?NW1lS2ZEZ0x0OXZiZGEvdnZFQWZEZTBCMVpTRVVBY0RBd1BPekY3ZXlxaUpX?=
 =?utf-8?B?WEpvQ1YrR3NKVHdoTDRoNmhZZ2cvZkU2Sjd4eG85ak9YWjUvU3NQUnFxRDFV?=
 =?utf-8?B?SEQ3T2prYzJkQUFoS1dLMjNRZ1p2ZDRGckhZQnZUaTBCaUphZjVQVnJmTmNk?=
 =?utf-8?B?S2M1TDR2M3ZBb0RDQXNLQ1N4Uk1NSXN0YjByR3ZjUE4xUkQ2SFMyZDFSdE41?=
 =?utf-8?B?K2VUSkNXaXhnTzdqT21NdFEwVmI0dUZ1MzBSaFdWM2xwTlM1ZHRRZWVQc28w?=
 =?utf-8?B?SjhUcmE1T1orWEd2OVZOYXJ5T1JUWmc2elBSUmc3dnlySmVzYW9nMWMzb1NZ?=
 =?utf-8?B?bnNaYkVkRGk5dmxlUm9idkh0ZGhpRDNzSFdJbERBL0FocVVuMWFlcERtUis1?=
 =?utf-8?Q?MOh1fzgCkz4n+/9UoW56uUqMb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7959a62b-371b-4400-91e2-08de01f03c36
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 20:14:04.8567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sh9NDxpcglL0W/DfMzDMiy9n3Pv3xdPMbIyXqVYOQa3PqY42MHMtbCmeHMjz0FJdWObF8ZU8JMjOUM2ixsNp0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9268
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



On 10/2/25 09:11, Kamil Konieczny wrote:
> Hi all,
> On 2025-09-30 at 12:37:17 +0200, Louis Chauvet wrote:
>>
>>
>> Le 15/08/2025 à 06:06, Alex Hung a écrit :
>>> From: Harry Wentland <harry.wentland@amd.com>
>>>
>>> Setting the COLOR_PIPELINE plane prop is only allowed when the
>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set.
>>>
>>> Setting COLOR_RANGE and COLOR_ENCODING is only allowed when the
>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is NOT set.
>>>
>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>> ---
>>>    include/drm-uapi/drm.h | 15 ++++++++++
>>>    lib/igt_kms.c          | 63 ++++++++++++++++++++++++++++++++++--------
>>>    lib/igt_kms.h          |  1 +
>>>    tests/kms_properties.c | 20 ++++++++++----
>>>    4 files changed, 81 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
>>> index 4e4f7c2c3..6b9af3348 100644
>>> --- a/include/drm-uapi/drm.h
>>> +++ b/include/drm-uapi/drm.h
>>> @@ -869,6 +869,21 @@ struct drm_get_cap {
>>>     */
>>>    #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
>>> +/**
>>> + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>>> + *
>>> + * If set to 1, the DRM core will
>>> + * - expose plane COLOR_PIPELINE properties for pre-blending color management.
>>> + * - reject setting of these plane properties:
>>> + *   - COLOR_ENCODING
>>> + *   - COLOR_RANGE
>>> + *
>>> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
>>> + *
>>> + * This capability is currently in development.
>>> + */
>>> +#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
>>> +
>>
>> I think this should go in a separate commit ("inclde/drm-uapi: sync with
>> color pipeline series")
>>
> 
> O even shorter:
> 
> drm-uapi/drm: sync with color pipeline commit
> 
> and in description give a sha1 for drm-next commit which
> introduces COLOROP changes. See log with
> 
> git log -- include/drm-uapi/drm.h
> 
> Please make uapi change in separate patch(es). You
> could also read about it in igt README.md
> 

Thanks. I will separate changes in drm-uapi into another commit.

Kernel change is not yet merged so sha# may need to be updated later.

> Regards,
> Kamil
> 
> [cut]


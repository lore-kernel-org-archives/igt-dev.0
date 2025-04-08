Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCF3C36010
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 21:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286F310E77F;
	Tue,  8 Apr 2025 21:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iSELpUeT";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9C210E77F
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 21:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0ZB7wttyl1LjYM3zHTU5BnUyRYXu2wlDOLBs+WM5G1ta7zHm5kZ2w1UJ4Nvh2Fj9VFknA4v9uwTB8uGcwbtZXFQ4xCDn6i3QG5ZBCX3ziYPKEAZfAk+ZiAltZS3NHUK6OCFAgbIVxmoDxdXELO6uljjl9tuklCyylTglfQjSOli23SUDCUFnrX4BAOmkLosVoX65vyhwK4dgiJ8GS8hhdfzfQKBiHVLrqG7NqwQulI0cx+hWk7/GO6JX0UeXgRpEM1kM5MlpeKwGQHfwxTD69wLiiB4+FT+uy3Ko2lQw6ftibXYSzowYDJzFduWO4Iooenka1+8orpAR95yCWPPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqTh2I0q2YQy0Mv9VOXyJ8jPDXiH/ZQGYsu5TYYnX6E=;
 b=pKLgDCVd/r7S5IpExquFA3pgXaG3iU30LiS3BIAitUluvj7ua8aHrFV90MVvsd+0pvWJAs/e2PuRziqYz2skq078YR3Db65b+rk38fnz5oTkAg/eOTlPvea8LVyCUnwlFTcverhSGBkRguF0O0FO8tCUNPt6nX2XbzSw9k4gdNavkZW+DLJx94vr/mh8xlZ0Wl3sNK6PtHFuuEmmY3MZ7jwOLeuzL3k1vdkUhm3gLEFhhpKo5nuRWg7WVaTMvq3J/HHDut5/5TnS/4SAapIqXdZ4/woC7CsM9tgWXLaIWnayJSXI1vo9fVKEXfIiOeE+dwUoN2XloNzwkseATt168Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqTh2I0q2YQy0Mv9VOXyJ8jPDXiH/ZQGYsu5TYYnX6E=;
 b=iSELpUeTSPNCZNZfE0R7pAv1RiMvwbDg3HxFw7PxVj1YmLx2qJY+1TbvK5BeN+wcwP/ADr7q/Vf84zI4yr3gbIsHE9laqFB7V6yqBqKWhFUvbGUFJLHeHO+LMBMwPWMbUlvs61ivdcd7e3TZ1h07BphveHbtBK18yxtxwaouWeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8906.namprd12.prod.outlook.com (2603:10b6:208:481::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Tue, 8 Apr
 2025 21:46:28 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 21:46:28 +0000
Message-ID: <9a6eff78-7205-4c5f-b553-dbe99d27eb7b@amd.com>
Date: Tue, 8 Apr 2025 15:46:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] tests/kms_async_flips: Create subtest for overlay
 planes
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Melissa Wen <mwen@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
 <20250408000221.140459-5-andrealmeid@igalia.com>
 <afnz6bdd4ocgkhj372owmzarejsrsyfbtettjhhsj73eqv4pxz@mt3phtr6l3wp>
 <3a9ad1a0-eaee-4049-b07e-d7e352853373@amd.com>
 <0ad8fce8-d8f3-481a-bf8d-c14f0677b0d5@igalia.com>
 <a9220ac3-273b-4f31-8252-5ef20fbcbed6@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <a9220ac3-273b-4f31-8252-5ef20fbcbed6@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::23)
 To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 176d73a0-29b6-4e23-a33e-08dd76e6d120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTQyZThnNU9iUEk1c3NIdUc3UGtpd052TFlCeWxhTmxRM2UxL0I2R0dyRE9M?=
 =?utf-8?B?QTZkVVN1L2FSbldkY2czT2s3Tjc5UUN1dDhDeExOa1V0Sm1ha3RtbklaaHUy?=
 =?utf-8?B?T083bHZjUUlzQ2JCc1RTaTRDdEZXNGVEbVRRRmUvV3ZPaWorMEFSdlhZOTBR?=
 =?utf-8?B?elYyMFRDVldCcFk1YWw1VlBKV0gwbEJiTG53K21xVXp5TENvcEViQjk5S0hW?=
 =?utf-8?B?UzZtS0EvN0llS2JYVk9NNnRVQ01lM29iUGQ5NWZKQ2xVVzlBdEdVZkVCbmdI?=
 =?utf-8?B?dkEvR3gzZ2dYTGNDTjRoVVZxTDlGc0pJNTFzSUl6eUIyWDdUWE9McjlJdFM0?=
 =?utf-8?B?UlhuZTZlMStqWk15K2Zuc0U1aEJLRS9tOExrd2VJK3hZYTFBbTVraWdCSlM3?=
 =?utf-8?B?eDEycHZlc2lPaDllOWVsbHJjQzhybk1HQTNrZFh6NlpsTFRDUi8vUGJRTlFw?=
 =?utf-8?B?b1YyOHpSRlF6eWxUSHh1RXpuUXl1WXo2K3NMWWIrYXZuUklZVkZ3WDc0bUd5?=
 =?utf-8?B?bGsrQlZHWjZCbDBISTBpQVJ5RThZcGF4Qm45K0QxMHVOLzd2d3JscDIyaTR6?=
 =?utf-8?B?Q095NjArb2NRdVk1allLQzZlUWR2aXRDWkJaWGJTV083MXNsSXJwUXNQRUwv?=
 =?utf-8?B?Nm5ITG0wWkc5MHZvZ0JXRjR5NVIrMmF5ZFNWN0pOVlErbmRFbmZpYVdhditW?=
 =?utf-8?B?eEc4VTFRY2xUaXUwaDE2aWdTc2pUYlhGaDlyM0NHeW9ZZTlid3EybkI1VU1m?=
 =?utf-8?B?dXNsQklBNjdxMmVzZkR5UjJ6L1Ruc0RWZHdUNENiOWFIVDBDVDQ2bGN4eXZK?=
 =?utf-8?B?MHdWWjJmM3JxZm5BRFJVemVPa1dRa2FXeWdtMGxKT1RqWGw0eUFZblVJck5N?=
 =?utf-8?B?bDVSVGorYy9mNnUvbFRZdHlRcXQ0RENreUNxY0o3OTZVZ2J3OXY2VDlpZ1FG?=
 =?utf-8?B?MWR0UWhCdXRCeDJNQjNPb3NwdGlua3psN00rRUdnc2RyL1Q3czd2cHJxUmRs?=
 =?utf-8?B?UzVabGx5TXBVNXNUbjBjNTN6R1g2cnhVcXMyVlZ3UEx3d0lqQ3FKcmFaa0JY?=
 =?utf-8?B?NWM4QkVsWVRubTUvT3k1bm9yZHBoQU9ia3NPOS9qcWxOS281eXlXYmZrK0RX?=
 =?utf-8?B?blFWWi9PeDZJVU1NdFVmMVFNVnd4WURTbEFBM0FiUyt1cXc0U0NJUU9RK0No?=
 =?utf-8?B?Q1FMdDJnRHY1bktSUWtZeTIreGUrTHZTRmVDbTNqcXlyNjBvNlZsQTR1VEtk?=
 =?utf-8?B?VWhwaDlKZkhEbUZrTGdiOU9RYTZDMnRFa1FNZVYvQ1VEUThwVGtQRzBpcmZF?=
 =?utf-8?B?R1JpNVhqeGJMajBrZjR0enFEaUZhdGhFYVNnWlkyT2gvLzRIY3RGSmpvQXB3?=
 =?utf-8?B?SFpld1BQaHhXQTNSY2tCVFVWSUZoUjB1eWw5ci9mMFhIbzROMjdBSGQ1bzNM?=
 =?utf-8?B?TWNEV2dDTGdxZUNJWVlqU1NPYzJlOUpvMzJ1VnM0cGJtZVFUcWdrdGNZbzBB?=
 =?utf-8?B?YldXUEtWa3h5a2k3RGwrMjR6alRKQmdEQWZ5NHpqbVpwVXN3dDRvaEFScUll?=
 =?utf-8?B?N0xBeG83c0lFa3pqTEJMWUZLU2lsQ0EwOEVlYnp1aWFYckdyS29aVGNWYk5q?=
 =?utf-8?B?dndNaGxCbVlvSGpDN1k2STJQYlNPY0c2ZTZoWDRWOWRXL21aOHpmSEVZR2ti?=
 =?utf-8?B?dTd5VjhJcy9rUUJCNm05dG9yM2JDWG5sQ011NkxCd2hGRTMrUWtHOGYxbXk2?=
 =?utf-8?B?UmtoYzRJb1o2T2pxejhBMExrTHBEZ0JZOTNjTlJoV0hkN2t6emRnZVdtUU1C?=
 =?utf-8?B?ZERlZ0s5SXZCRUNKVFZkK0tTTFVVdTR5K05aa2pySzhHVlpNVjdKaDhidUpy?=
 =?utf-8?B?N0NTS0MrQWtYYzcraUcrK2pPRmxsS3ZieUpwNEtGM0pnMjVXUlVLb1pFbXZZ?=
 =?utf-8?Q?6Xt04ZHG1W0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em5wVVE2akdXUGMwdW1na3NwSWNDQzNoakxDRXpIQkxQUTZYemluYU11ZGw4?=
 =?utf-8?B?YVJ3MGZNUGZWM3ZzK3pTTE8wN3B0c0JBTGE4c3IyK3M5dGtlSmtEQmtXQWdL?=
 =?utf-8?B?ZU9qK2lZdUc5YzdwVVBpVG10dXpoYWIyekh5YjQzeElvTlFVZzVkQ2trcjdx?=
 =?utf-8?B?MSs0V1dTdS9VSVgzV3lKR3VLQkhJVkRlOXNwSkdrSFBKSHJRajdjaFQvMWlY?=
 =?utf-8?B?ZGE2eXZrR3MzdGp3RFJuNHdsbUNrNThFZzZ2ZUpZdXJKaTVoK1lHUkJGZE1S?=
 =?utf-8?B?Wml6N01YR1VMNHJRZVNoeEdWWXpoN0VwcURuR0FqNHJCRzB0djc3ME1VK2gx?=
 =?utf-8?B?OTRYZU1maEtkdmtJcjE2elpBK3R3czNyUzJGL1FGb0xEZ084Umk1UUhZYTNy?=
 =?utf-8?B?NjdlKzh0bEtlMTY0UDBJcHRYelhzdVYwdFM5bWdTbmtSWGNLbkI5VGtOWHRO?=
 =?utf-8?B?QjY3YXdsZU5FOExhNXlYRlpRSTFYYk4xZnoyWVdLWGt1WHBubURCb1BDcWtS?=
 =?utf-8?B?TDRYd1pHSTBOM3VLZ1ZraVViM1FQajVVZUZ3aWdrQi9WOVFoRWFFZ2xFc3dx?=
 =?utf-8?B?Tks5QVpzVHZrSEFvRFkralc3SzNqR3BBRllsOXVVc1lWZUgyb2ZDR0VuZmJO?=
 =?utf-8?B?dC8xZCtyMXp6MVV0Z3c0VFZPNHBiczdpTERlbU1HL3dmWDZGWXg2VWg4bkph?=
 =?utf-8?B?eG9MQUlXZ3NzMlJJWTJRUlRrQkM1VjBrQmpFeFlFMC9JQmE5aUczNk81LzBW?=
 =?utf-8?B?aFROeS92dE5Udm94ZlA3VDFVdG1pQWdEME83WjhDMHFlbEo2NDY3NWtvbHBm?=
 =?utf-8?B?WEtwdi9KQ1cyQnRndjhTZE5NU2RTZnByYTdNcXYvYjFkTzZ2aXJyNnVkdUh2?=
 =?utf-8?B?K1JFdHJOazQ2NTRnTXpoUUZva1ZrQlc4dzlTT2FVZ1F6aFhNU2FDS0FHdG1H?=
 =?utf-8?B?ZTNUYnM2VkRlNjMrUXg0RW5aWTRxRU5MOWlYU29uQWdIaXFSZnA5UndBdzVT?=
 =?utf-8?B?K0Q2eWJqUlJONXEvOFdwTkJFNDBWZS9VQU45SXdLN1ljSHk0di9uOThPL3lR?=
 =?utf-8?B?cUdISzZmSWRZWXVqSDRGVlZrUUtET3pHRDBybFZhaHd3Q2ZjQ1p6aEtPSGVo?=
 =?utf-8?B?UDJsVzU0a3N3WkRONWpYZGUxdTdyanNGRlhxZmM2WW1qU1VhQmU4VGxzeXdo?=
 =?utf-8?B?clQxcEgrSEVmSHphcmdDVUp3Szd5d0pjbVlUMHFsQjVxMHVJY0FaT1B2bTR3?=
 =?utf-8?B?Q2FQbUtDZVhmN3dMQ1dab3V6Nmx5b0l2TkNxRE0yWEE2U1hmUmF2VTRWeHEr?=
 =?utf-8?B?eXlhVlltNFU1Q2sxd01LTGlYNFdPMTFjT21oYVB0NHI3eEJIb3drWFkwTmFD?=
 =?utf-8?B?ei9qRldZVkNSbG92MUVSM1dCZDQ0Vm41RThMZFBIQk9rQjcvVjM2TlM0cm5h?=
 =?utf-8?B?dG1CaEFwUk1nMk9kaWQ3eGI5bE9mQXltN2tWem1yWXZFR3lZYkhvN0V1aUt1?=
 =?utf-8?B?K2xFYjlCQU9lUXNUbnlqZTd1M1ZpQ25pc0JHSmxhSkJ4c1NtTnB3T0lucWQz?=
 =?utf-8?B?dGtiVkttZWR4aEhTcHdGanZUcWRqZzExRlZJZlV5TENhNW1QQWZGLzFuNzFE?=
 =?utf-8?B?NG9LYm9uMzkxdUE5Wk5INXdVQVNudXJhTkJvNHpubE9oOFB2UExPMkZMQzJS?=
 =?utf-8?B?ckFMWmZVeGorQ2hBL2NNLzQ3b0VHVHRYZUx0SGIzanNKUCtFWTBreHJZRGl6?=
 =?utf-8?B?MFk3TEhpNlNDK2pncTF0a3l6TEpwYWVySGk0M3R4QUlxOUliSFBLczdnVUFi?=
 =?utf-8?B?MFA3cStpdkpjaXEzMmhxUzAwekpIV3o0eWdZOFVTYnlxSUxUS3RYQU5sYjVi?=
 =?utf-8?B?bEVvVlc3Z2tBYUdYT2JQQWR1VlJhZEFDZW52Qys2TG96REV6OFVJcjBMeTFP?=
 =?utf-8?B?N1dESnQwSjZzMElNVHZIVCttYVBmU2VXOEZvejFjZ2hCWGE5Q3dRY3VabVB2?=
 =?utf-8?B?dzJ4ZUFsTzNXY3lhYWpKTld4WWEzUE1vWEVRNGhYZW9VTndVVHhIVGtSY2d6?=
 =?utf-8?B?aWRsTHNaczVSL2ZFTXk1dWRyWlc4ZG5jWFBPdEExVmRBczVhMnZqV0xxeExZ?=
 =?utf-8?Q?XeJ6baAaW5JT5ufQR1UBH3bBZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176d73a0-29b6-4e23-a33e-08dd76e6d120
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:46:28.1320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xn0grJAOQEpDnw36pDIcuRXj1fzCxtVk79z94XnJwqaZyZhOcOPpKXnk4naOpj+WuXWsw73AwT2Lf6IzecXlJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8906
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



On 4/8/25 14:45, André Almeida wrote:
> 
> 
> Em 08/04/2025 16:26, André Almeida escreveu:
>> Em 08/04/2025 15:53, Alex Hung escreveu:
>>>
>>>
>>> On 4/8/25 10:16, Melissa Wen wrote:
>>>> On 04/07, André Almeida wrote:
>>>>> amdgpu can perform async flips in overlay planes as well, so create a
>>>>> test for that.
>>>>
>>>> Hey,
>>>>
>>>> LGTM. Thanks!
>>>>
>>>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>>>>
>>>> Alex,
>>>>
>>>> Can you check if it's fine for AMD too?
>>>
>>> Hi André,
>>>
>>> I ran the subtest "overlay-atomic" on PHX APU + kernel of amd- 
>>> staging- drm-next, and they were skipped.
>>>
>>> What the kernel and ASIC did you run overlay-atomic?
>>
>> I'm using drm-misc/drm-misc-next (eff0347e7c228335e9ff64aaf02c669578) 
>> with a Steam Deck and Melissa tested in an AMD Cezanne (DCN 2.1) GPU.
>>
> 
> Also, please note that amd-staging-drm-next currently doesn't have 
> support for this, so you need to either checkout to drm-next or drm- 
> misc-next, or apply the following commits to your tree:
> 
> 41129e236f14 drm/amdgpu: Enable async flip on overlay planes
> fd40a63c63a1 drm/atomic: Let drivers decide which planes to async flip

Thanks. I was able to run overlay-atomic on either drm-misc-next or asdn 
+ these two commits.

overlay-atomic ran fine on PHX + 1080p panel, but it failed on PHX + 4K 
panel (more specifically, 3840 x 2400) with the following errors:

(kms_async_flips:8296) CRITICAL: Test assertion failure function 
test_async_flip, file ../tests/kms_async_flips.c:431:
(kms_async_flips:8296) CRITICAL: Failed assertion: (fps / 1000) > 
(data->refresh_rate * MIN_FLIPS_PER_FRAME)
(kms_async_flips:8296) CRITICAL: FPS should be significantly higher than 
the refresh rate

Where
     fps / 1000 = 121
     data->refresh_rate * MIN_FLIPS_PER_FRAME = 300

Comparing to the result of 1080p
     fps / 1000 = 1232
     data->refresh_rate * MIN_FLIPS_PER_FRAME = 300

However, this doesn't seem to be directly related to this patch and is 
something we should look into.

Reviewed-by: Alex Hung <alex.hung@amd.com>



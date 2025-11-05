Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED375CCFA1D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 23:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9255110E7C6;
	Wed,  5 Nov 2025 23:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dgMAvkWt";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010013.outbound.protection.outlook.com
 [40.93.198.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BCD10E7C6
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 23:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqN3WA5DYx0CCn1PRL7uDV9hqUhQNzPldvGiM642sTGXngde5YK1nPvA4mL2guyU4Ei6UiQ9l43mblIYfNFE2FV3kNgii6K5tTT+7wdGxXV7x9TmspZXc38Qiz9Z6ueON5lAkNwx5OjKONGvW9blnVVFzvYSqmTN5qpZBo+3SPraB+eybSuCtXelT7C/NuCYLn0dIJijYyTQ7QDwQqQ0jLcE7oEoDJtrC+7g4zYn5hY4S+I9wEoc733cB9ktGFLLxIxmUHEwR+SAx5TnIWn2RJK38C/5rJmKK2Bn3PR3l8oiYtxp317mbD4ZR5Vu/9KOS8xV+8005gLNYz2puf4Xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOfoJkuwLQ+XFooWKlwTD4cwIlQ5o7sEvaGuujjMXpU=;
 b=UV45DSHmqfU/eDs3AEZ3RdDmML78+m5TARbRIWz9mh9YIROnnSFy8PG1p4W/z9xT5GAgsJbHHwfA01DW/IeUIMtPxG0gAcsu6pm+NmTPMVRkEV4vOjGefzJto3UEjhY/ubByRCLqA7o5y819LBNuEe7R1ByAUaB5+8VCWFTEdnGXkVrSCmjB18Fl3wO6AS0HLnd+6LyXn6W08ZaiU7pkdGoZ0/9CMrnnWH80OzByPGA3aHMSON6qUHVzwKz+fLUYnQwoV6RO2PckiVsnwXOFXIEWU5/AiJ890PHpbqGFdSYKvGIUyjQJ+AiMOwXjIsEgAF7EyWZak9UHbuFnJE/mbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOfoJkuwLQ+XFooWKlwTD4cwIlQ5o7sEvaGuujjMXpU=;
 b=dgMAvkWt8ErSqocTXitplBvOPDMs4WY2NpXkXixbaDT7x0Ja7CjKmnYhvncOKEy4MKMhLN/OBStQ1hNTtiJGaTck58Vla5O3jsg2L/3UqtqEQlSYNSkjL+dJgDCKIbKY5Jjr2MsB22V7ag9NP+EGiu7xbsxwSqj+GIhj4H42+kY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS4PR12MB9745.namprd12.prod.outlook.com (2603:10b6:8:2a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Wed, 5 Nov
 2025 23:19:34 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 23:19:34 +0000
Message-ID: <b1d192b6-eee7-405f-aeb8-3f0615ce044f@amd.com>
Date: Wed, 5 Nov 2025 16:19:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 29/32] tests/kms_colorop: Add a 3D LUT subtest
To: Leo Li <sunpeng.li@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-30-alex.hung@amd.com>
 <6fb1d8d0-4fa2-47c1-9f35-f759efd851d0@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <6fb1d8d0-4fa2-47c1-9f35-f759efd851d0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:303:b9::13) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS4PR12MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: e8dc01e9-506e-48f2-816a-08de1cc1c7c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXdKbUlEc0RWZDgwTkFjVXZRMmZlTlJmYjJpa2MzNlBUY3RpYlJnVHlDbUhu?=
 =?utf-8?B?cUp6ZWpBWU1OclB5QmJnV3pGR1dBMEF5WHVUQXRKYkRPUHMzelBMbmZvMWM2?=
 =?utf-8?B?MFBMVUJPMTBwYmtKUGZlOWtIQWI3VVdERlJaOEQrU0FOdlhBSU5wNlB6bzZw?=
 =?utf-8?B?dkQxREQrYTYzbEQwVHo2WDNqaE5yUFczQnJ4aU1PaHpVaUFxaTBGd0ZaQTJB?=
 =?utf-8?B?NEJHMlo5RnBQR3o1SWhiZkVCMnpycmUwb0RLZnhjNUI4Z2ZuUUlrYXZkcEp6?=
 =?utf-8?B?MG5MdHc1dVYvcUJEVVc3NmRuZlFpTGg5ZExaczFaeXliRGNEWENnSDh0emRy?=
 =?utf-8?B?Y0JYZWlpUlBPMmlubFRmTk9mTjVmYlRIdnY1SHdUU0FITDUwTmZSVm8rMU5Z?=
 =?utf-8?B?ZkNydDExdk1MUWozK0hOMy94NmFFTjV5UHNMV3BFVzVYRTFPTm1tcGZrd3pw?=
 =?utf-8?B?QVVNeEZId05XU3Y2NjlRdjl5cDhGUjlyL0JwcndkUEc1TnIxTFdjV3FrS2lF?=
 =?utf-8?B?bWpsMjNHNUo5OFJtWmZ5bnp5TFlVaVRJZnRrQVdyMVV1cW9PUVV6djg1RnZp?=
 =?utf-8?B?bEtHZzJsM3lSNVNDQmVWQmJRVFVpMVJJTytDTUc1QlBrc1d0SisrQzZCUmpq?=
 =?utf-8?B?OGQ3TTBkWUgrNTdXNjBub0hpR0dxa2hoRXFFTzhTd2hoblVneVpMOGQyOUZC?=
 =?utf-8?B?WHNXbVZpa3ZxNi9jWElFTjFXUExETGJtZ0NTVG15WVpzWi91eEkzTXozdlhD?=
 =?utf-8?B?Y3JBa1ZFMEpkTWE1Y3dWcVlUMEQvVzQ4RmhKRWl0d1YzalpQaWNKTHk4VW04?=
 =?utf-8?B?TjdxTkZEa0ZOQWxQZ2MyQ3EwaVRLUUVnRlg4ZjZUb3lTMmpkSU5HNU5Ub0ZC?=
 =?utf-8?B?djRXcnVJVjdjWkdOTnhEUDhGaGlqNEpOUE1reDBpM200M2I1cXgxTFRQWHZi?=
 =?utf-8?B?NGJ2S2lYbExTS2tENkU0ZnBKTGdENDdmV1FRMEJsMVAyK1NCUkRvSGU0T2xq?=
 =?utf-8?B?Y2VyTy9HbEkySGpxSkZSQ0pqbHFVcEU5aVdVbTZIdjRCVzIwdXZuQmxEdzVB?=
 =?utf-8?B?MWZLK3pyZXRFU2tmTDJiNGM0di9iTDZUT1Z5Y0Jya1JWNEV5clZZZlBFdkFI?=
 =?utf-8?B?ZHBwWVdFMlJvUDc1K051N1Z4T1BZUFhsc0Z1RjRQeXU2WVVwS0t5SWJzSndY?=
 =?utf-8?B?QkdpLzRnU011R3IzY0NQYlFCZlBjYkpReEZsWGg5TEFNc3Z1aTc2a2ZCYnFB?=
 =?utf-8?B?RnA2VmcvaVZ4UmFPTWJXZjFZSlArL1IwbTc4N0JDVXpqa3pMR1V0QndVcGNG?=
 =?utf-8?B?M2kwRHpjaVI3ZUk1WXQ1ajF2elhuNVdmbFNOL1RsQkhVaDY5WU5hMkkvWVJa?=
 =?utf-8?B?M0V4Vm1UdW0xblZhazlmbFhyZ3hFSlZKRkNXSDJReFhmU1VyclMwbHFnNzAy?=
 =?utf-8?B?anVJTENTSGp5YXQxQk5TYTVLZ1MrQmxKdWErN3ZCeW5BQ1Eyb1hqbHZVWjFy?=
 =?utf-8?B?TVpucU5vQk5UdDRUbDYxWWVvTzQrL01LOE5tRmdHdFRTbXNrenpNMmdXSFlN?=
 =?utf-8?B?c0tzQ0plcUNuUHlqZ1YxZDVhOHlyN01zcnJXdjFnMTF0c29LenVXbk9EUGVs?=
 =?utf-8?B?L2h5cUM3bHZRRm00dGR6ZStPUUZKVmFJZFRTSGVYK2FmRnhEVEhjU0JjT2Zu?=
 =?utf-8?B?dDdMMTJ3SHplZ0E3d1BBRW5QYXV1OTRIR0lra0xDbktmU1k2SEdTR3hLS1Vx?=
 =?utf-8?B?ejdraFFMTzNlT0JLZmJOWTdxdVJjYUJveWFVcGs5N0Y0Q3B6eXhVRjVGWWhJ?=
 =?utf-8?B?eDZJclY4eFpIZkphYzhHMk9Pb1ZtTFgzRlJCQVJ0b2dMRkpDd3czMHVBcThh?=
 =?utf-8?B?QWZLZyswR3FDd1ZmaWttb29IQURpYjA1Q0haSzZ1MFA2eHFCclQ0bThiWDQw?=
 =?utf-8?Q?tzdfZOkdXhYIX0jSyxBmUaB1Ygqqa2Kz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDVQd095SEdLYzEvQUJNRURJbXVRVzF4YnArKzFzZjFlV1dCNVg2c05nOEdj?=
 =?utf-8?B?M2JOcDVPc1V0R3h2TlZSMTNMek02RnhRUTRvem9XVFVxa0hxVTlLbUxTV3ph?=
 =?utf-8?B?VmlUZXdGbk9xdVE0ck1PdGRKcmZxT0F1T3RJYW4xZjZMUGtEQXNhZkw1M09N?=
 =?utf-8?B?K2FQSEhKeWE4eVQzK3VKVVNleXcxWU1rRDlTSHl3TVI1ZGJTSy9GQ3JwSFZh?=
 =?utf-8?B?b0dCcjVrTnp3WWl6SUw5dFB1Q0FidEdXdjh1aitkM284SHRGVHlTZzBwQlhX?=
 =?utf-8?B?NEU5T3Z5a2szSjlhRll0UlBaUzhVdC9rMVhTb2JROTBBdk4ycjZyY1A1UGdM?=
 =?utf-8?B?ZStnbDVXaG5EMWNxM2xaU3hvblJDdW1ERFZjc1p1NEdNSnhVZjNqSk1MQUpu?=
 =?utf-8?B?V3hPYTVSbmN5Zk83WHpXdGdVWkNRVnRFdmlVdHhTMzNidXR1dEFqSWg5VVlo?=
 =?utf-8?B?dkNmenVjZkRHT3hJUUp6Qy9STGdDT2VNS2pEa3RyclBwWXNyTjJwNzQvaEYr?=
 =?utf-8?B?SmFLamFpMlJQTnBZQmpVR3NRMzRsYVg5bDZqRUI2YVVwbkNva2lmSE1PZzFK?=
 =?utf-8?B?eGFMNjlRWjhpdzRCd3p4Y0VGcElxOHFHOXBkTWNpRFVBSDRQbVY4YUQwS3VN?=
 =?utf-8?B?c04zQzdMVU5iRXJLRjRydi9WQUxCam1aSE0vR1hEMVYxb1hCL0ozSk5vUElF?=
 =?utf-8?B?U1ZIVE53WmM0SFlRV1hOOWNEeE9PeUNsVVF4MjhiaUZTeW16djlsZTA0VUtF?=
 =?utf-8?B?SldpVko2cTg4cmRtR1FsL1hycTgxZmJZZ3lPK2llYWMrZFlocSsra3ByYmFv?=
 =?utf-8?B?MkFDRk55YzQ1R2JieENKdXBXMVJqc3k5MExXVG9VRHdVbHFuS1U1aVpYZDVM?=
 =?utf-8?B?QjJuemZ3M2lBbm9abVUvaWpHc3RlSENXRjZ3RTZIdzhrMFQ0YXB3K3JUK0hi?=
 =?utf-8?B?S2FVTDJTQ3dIeWR0ZmFmQ0VBQWJGaEpmMzBFY3NGSCtsQkhSUEUrVUdGa0Nr?=
 =?utf-8?B?ZVA1UFVwK25EeWluQ093WmFvVEJPeTUwK0lvbGlveC9oMVJ0ekdCVVoxak9C?=
 =?utf-8?B?bnlFc3Bvc2NGbmV5V3FHdUZmbU90a0JkYXM0TWh0blNWUjNKMFU0Q3NzcTQy?=
 =?utf-8?B?NTBTYmxBQUJoUGIvckF0cldVVjVhQ2VVVUFjZjYraWdRMkR1QWVuZEtqZmJq?=
 =?utf-8?B?WlJwQ3lER3kzSktBdVlWcE82QWUyWERaMy82V0R0RDk4VXRyNDVWdmtrSjBV?=
 =?utf-8?B?U2dRZUg4K3hMS1hEQWVBTngwNUpBdm5vK2kvMmJNODAxVkkxdml5RitOVWd6?=
 =?utf-8?B?aUU3QmtsVUt2cTFTSkJ5clJqNTJRaTQ2b2pQeS9TVndLWXhLTGRMSGdwTVNo?=
 =?utf-8?B?OU9yYTlCWHFxQ0RkUEdMeVFNZWR2Wk11VDBRUU5sbzErV2dFcXB3bjdFU2FV?=
 =?utf-8?B?Y3NxZmtWTEJrTGI1WElIWklEV1YvT2szUFVtQW1nUWhyMnA5bENhUUNUajZH?=
 =?utf-8?B?Qk1nY0Ftb2JQY1JBVmkyY0cvK2xLd2RZK2dXamFSZk04ak8vTlVJZSt4eXdC?=
 =?utf-8?B?a1ZweTBENjQ2MTAyR0swZC9EYzRhZFduTXJHcndhNEJGSEo0UDFjTFNrdWVB?=
 =?utf-8?B?L0NIRW1KRkE0YjVVT1pjMVZXYUZ0d25naERJbmVjM1g5Ly9FNzU0b0tIN0xH?=
 =?utf-8?B?VGQvaFE0OTAxakN5SFBIY2YrZlkvQWE2U2xqYXp6V2d0dFo2NStEUnJaNnp5?=
 =?utf-8?B?MmZvWENZQmtFZy82dEV3Q2ZPY3J4MHBSY0VTTjgrcnI0TGR1Sy9GM2xMQ001?=
 =?utf-8?B?NnNwenJEMnBUemkxZnRYY0dvbWtyZ01TSkNJK1I1MExQaXJKRS9YVEtYYTFn?=
 =?utf-8?B?dFVHWUZudWw4bFl4dEhmaHd1RFJ5R0dTRkV0dkxoTEVsOG9WNlcxeXBrWDcw?=
 =?utf-8?B?a2F3YUUyd1liSkZ5TEs0Y0RidzFKUWFPUFd2R3hDU3d4RFVFTzM0NGRuNnVn?=
 =?utf-8?B?S24xMURUN1E4S0hUdnJ4Sm9sUjZpWk53UW1kUlJrRmp1UXUzNGpoM2NhUDVB?=
 =?utf-8?B?SkVQTjM5ZzhPbGh0UGFubzRUS2JFRkIzNFVYdjFnWkZ3YzdBWnRYLzlxalpk?=
 =?utf-8?Q?BnxaKApmbni3IvAD4P94fnOhA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8dc01e9-506e-48f2-816a-08de1cc1c7c0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 23:19:34.1076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Paqbwp3IFZAzUOMhNrUC4g64WOdQC0CNFnHwcTDunZhN9ZjJebCrCdmNBDwHOf0cHvQyWL1SrIll2eu/5LwpMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9745
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



On 11/5/25 14:50, Leo Li wrote:
> 
> 
> On 2025-10-30 00:27, Alex Hung wrote:
>>   	case KMS_COLOROP_LUT3D:
>> + lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
>> + interpolation = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_LUT3D_INTERPOLATION);
>> +
>> + /* Check driver's lut size, color depth and interpolation with kms_colorop */
>> + igt_skip_on(colorop->lut3d_info.size != lut_size);
>> + igt_skip_on(colorop->lut3d_info.interpolation != interpolation);
> 
> Do we currently not care about color depth?
> I see the property enum IGT_COLOROP_COLOR_DEPTH was added, but not defined in kms_colorop_lut3d_info_t.
> - Leo

color depth was added in a previous more complex 3DLUT and is not used. 
It may be still required in the future but I can remove it now.

> 
>> +
>> + configure_3dlut(display, colorop, lut_size);
>> + break;
>>   	default:
> 


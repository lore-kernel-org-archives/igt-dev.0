Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEADCAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 03:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5702410E1A7;
	Fri,  3 Oct 2025 03:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yg3rgtcF";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DECD10E08E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 03:59:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPxzuRs1xsvNGz9yoieZrZ0VCp9rO84worOlatIjHJS/xIHHRgCaRc6mqmCSzdTuPXMzXRdAPPVxgrNG4q6fVO8YcOmzD6lb2Vt/BlhS8PwkhygBRxsYLJq+M0mPxUIUxKRwVrhR0L3RyCXz1/T2rxs4F/nfA4PNs+bzom3GH38TmbJ0ne9jSGRWjqEtej3fZfFbM8NJ/gFLN5AxSRcGQb4cZaqbslhAzCqR31NEz4hjp5jyGNY7k+EqeYNAY/0Rw9hcvdjiM4XJ6hPnhBZcedZHicm1tJD4Up3r1ZWH9RX73qOz6Vj4vz2V7CrRftgm2gycnHlGts5bCrplre24ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEX3uW5LBp2a80vDaiRRhjxok6PBCgfLwCysN5IDCmc=;
 b=dFwKsm547TEzuSGwkmIycMIHGHJHFtlZIqRX+tv3lpl0edMsk1aHvDWrWKM1a+i/YL4ryq1uBPntJBbsFtymL42mBFmbesv9qAhChq5hQk+UWnJiVCmIL3xKgTUej+XED2GnUE9u0gp6IDO5uIvSnRl0B/8jHZezZFGMDDJydxSMt07/M6lf+/N+Un8cG9kKNEcxbh+1dWtI6S/HHgh+9iWqgpXBETa4eGQDbVzr2B8GofNHxdlHiYOduugVCyRWMvYFaJ28l4W4ThC7ckNEYQruUQ00531haC5D2H43LrDD96NAyouobs4CDha/vCoknMjlEtLVjBV31O0c8lYvmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEX3uW5LBp2a80vDaiRRhjxok6PBCgfLwCysN5IDCmc=;
 b=yg3rgtcFdtCg0GJrnbEG3t9U8ijcBFUqqSQgVkITS3Js3jrc3GVbrpP89XAS75ZGjjUQVepYKph8Op4CMmGvY5zSHQrtIwO/uHnhLPlyEj842q0ZJEdRmkzXKuL8Q9lsNVhl6nhf+kgTHKCIYnuvEkrVIdnCTsAeXwNT8CpYyJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 03:59:39 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 03:59:39 +0000
Message-ID: <0c1a88f8-ed1e-4e69-80a1-5cae02b85400@amd.com>
Date: Thu, 2 Oct 2025 21:59:37 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
 <782d02dc-3b1c-48ca-a77c-b7f01801c14b@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <782d02dc-3b1c-48ca-a77c-b7f01801c14b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:303:87::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb8c11d-43e4-4c0c-db9e-08de0231466c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlN1UkY1dFZTcCtiOFl0dFhDZXYveXpEcWN1WHRSck5qSlM3aElNaVp2SW1R?=
 =?utf-8?B?d1ZsNWNOYnA1NEErMy9aVFdRQ04vVG50bjNYZ2VDSXEwcmlRblo1NGdKK3FX?=
 =?utf-8?B?TGxlZzZOTlcxeExNUkwwQW9rSzRTaVVVYTB0OEVnOHg5MXZsSFBISjNFSm90?=
 =?utf-8?B?MDJVNEVpTzlNUGlqN1Q4MVpLdCtLTEFHalhyRlovQmpDNnlSTVFpTlN6dUVm?=
 =?utf-8?B?ZEJkcmxyYmo3TDZUcmhmL3JjM2hFUFNwUVZzMWxKTG5ha2dZM1lXeUNROUhY?=
 =?utf-8?B?anowZEFTbWU3ajY5ZGNKVnBRWnpDT1VCcm1yU05Pd0FWK3Nld1RYbEZtbXR3?=
 =?utf-8?B?UnFWYmpWTzA0bHNZWXN6eGNkWDBIZGRmandIaGZ0Ujltc3pUM2orQTZ2WnNV?=
 =?utf-8?B?aU1OS0RocUdWRXJDbFVudkpDOU0xcTVWQWVqazJmNk9VcUV0ay9hWmhCeUhJ?=
 =?utf-8?B?M1ZXcHJDckxyTWM1RDNiQ2pwN0pYeFFpTzFDblo1OGtsNUhacDFSRmpFNzlz?=
 =?utf-8?B?SmcrUWJOcEFyYUpYbWx5OHFVZkQzQi9BWlFUTGFBd28xSUFzTzVrZVRZNHJ1?=
 =?utf-8?B?WUI1c1VqTDZ3SjVCT1QxQU1iK0pBR2s3aXl0V1pFTEEyejdyaFBmVkdiWFRz?=
 =?utf-8?B?NGt0Q3lFdlJWcDI2OUkzdnFLTDVTb25FaG1zRzJ4REVaYVppYk8zdXdJZ2Nr?=
 =?utf-8?B?aklWNHpRNTZrODNucCtudjNVeEZ2d3U5R3dXWW5FbjlUU2NodVlmK2ZNU0lC?=
 =?utf-8?B?WmU4eXRKRVJEdGFVV29UMDVQS2J0eHN2ZGFUQkovNWYvWGRObktYaW5zZm11?=
 =?utf-8?B?N2VzUUd2YWo2eVpiRTV6QmFZbEI4Slg0eDFBeUxpUmsxeWRaOTFIdnZGWWt6?=
 =?utf-8?B?cjA2K3JrVWtOSks0Q1pkR0RqK2xTV1RidGFsNEl6QnBLN2I0UEUvNVV5K3Az?=
 =?utf-8?B?clB6bUd5MnNsZEErdnBSTy9KWjdXODVnQjlKQnRwOHNzekQ2REZTRXFoSUF2?=
 =?utf-8?B?ak1kb2MrZEI5Z0RTSnM1RUlzZ2ZHVzlGa2U2MVJDaFlkeWh2eEJvREc1OUV4?=
 =?utf-8?B?SzhuYW1YSXM0K2hTRGYya2NxTjhWeDFtZW1STmVwZDE3R3VnaTBPUmVNMi9Z?=
 =?utf-8?B?N0d3dWVGVG93cHgyWHRqNmxlUWpYZGVjTEZDODFWbitvNkdVYVRWcThvaWJy?=
 =?utf-8?B?b0F0YTNsSkJxZXhHelhrYUJFOHFjbkJRamZXcUduanFPdEkrVWZvTldBWHJa?=
 =?utf-8?B?WUNFQXVXM2JPb0t0dmFzZXdOSWFhbGRqbWhYUG9Da2NKUEdaZ1NORjZiV00v?=
 =?utf-8?B?aUV5clNGUlkxeG1VTWFqa0dJY2NLL3RhSHNZWk56Y2hNR2tiNW5CWGNXS1o4?=
 =?utf-8?B?WHlJeTNCb2w4MkNMZFhQQ2djRllNQWVBOG1Wc0hEMjJ3OGZwYWZPYnY2T0xX?=
 =?utf-8?B?Q2hyeGs3QXhyYzJpYlUxRi9RU1NzOGNneGVjRjVpd1dpMWg0Y0pHcDV3U3hG?=
 =?utf-8?B?WGl1Q25sV0VNYTJ0VjBEWkxOVC9QeG1lRHphSTJmS2NHc25HMldiZHJjUDNX?=
 =?utf-8?B?OURvNjZuODNpRlZiK2lISE5VZ3QyNFJreE8rbVlpK1E0Vnlvbmsva2VkTitu?=
 =?utf-8?B?Y05WcnArRXBkSm5LbDB0K3RsRHN1cnVBZlNLa0cvRWhpMURUV05sZ0NzNVdG?=
 =?utf-8?B?Vm53aG05dCtscXRiK05HYkJwY3BlMmQ2ZXlnbWxWamVvVEZCVXVac0FXeHgx?=
 =?utf-8?B?NmVvTjhvNXBvRkN6WWdza1ZaWWxjZkNNejNuckdUbmloMWJUMzlLUWtBSWdj?=
 =?utf-8?B?WmJ1OWpTNHc4OWs4NUdsaVFEdXZtWkorV3ZEZXdGd0VEOFp0M3NBbUxrZE82?=
 =?utf-8?B?aDFhQkpXYm04S05sOTZUZDBkUjMxOUdCTkRkMm1aQktPcERSdC9rZ0Z6WVpF?=
 =?utf-8?Q?cwElKxFM0fz3rE+VwLE/h3PHywXJllwa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGw5blF5YzRVZW1rZzFpUVNoTWhEb3ZYRmIzSjdtZXdQOEk4a0I5ZldEeW1C?=
 =?utf-8?B?eXVKSnlwTVhZd1RhWUV0TWNsT0xleXF5cWJqRU0wcVFhaSthUWRPRTVmTVNl?=
 =?utf-8?B?UXVsa0MzeEoxR1VjZExaUFpicmpWN2VJZ3FHQXFxcDBhY0NDRUdjTjFFU0pV?=
 =?utf-8?B?ckVla3ROL1psTW9ZcENqWm1tVldoZm4zemlXWUwzK0Y2UEU2VXRkekdIRkg2?=
 =?utf-8?B?ckJkTVBzMXF3Z1B6bGNENDBJWnQxYlg2bnlaNVFFZHdrL3ZuNklZSGliZzBk?=
 =?utf-8?B?OGpxSlRWMHg5cEZ0cEtHUWQ0VnZsUWg3TXJmaG1nMTdMN05TQ09CbVBEeDFr?=
 =?utf-8?B?YW9PV25laDFVODVPZWw3Uytmcmw2d2FYcGhvSnlPK0g3ZWF1ZjR3bmN1VVBY?=
 =?utf-8?B?RVEvRmpkbVdhMUxRSWtiM3Bnb2RGR0dSQ0RQU2hCajFOczNTTHRPdlphbWVL?=
 =?utf-8?B?b1hVcElUWVdSb0ZjNjNRVnBIUmcxVlZpRUkrZVZsaDZLdXhiSnNJTzI4RUtW?=
 =?utf-8?B?ejBRZXIrTUtyNnJQTTRuQVNrQUE3b3VpU3Z6Y1p4ZFJFZk83Y25rSDgwcEJt?=
 =?utf-8?B?eUpUaXN1YlRSRkJlL2plRkdjMFVRM0hGYWhERmFRWmFTZm1WUEJWbXRCSVBr?=
 =?utf-8?B?MjByWEQ4MklGWVo5dXJ5U3BGRUkxUGIwS3lWbjV5Nkl5bldGb1VtNnhpZHZR?=
 =?utf-8?B?SWs2emdKalRkQVJEaXlyZ05EdTFFOG5EZi81UDk5Y0JNaUxTb3owcnRHbTR3?=
 =?utf-8?B?MjYvdEFqWi9FYm5ubENlTjBjSWJQWDN4TGp4TkNjc1NvemVJQ1JsUzVFWmJ1?=
 =?utf-8?B?TGlWWGNPemRyMFVpb3JRWVA4cVdZQVd1VWZUV3F4em42MmhqVDljemhNc0Fi?=
 =?utf-8?B?UFpkZVdTR0hTQVhOU0xGOUdDUGt2eTJ1UXNkZk9hRG5rRy96Mld0WjAwUk5F?=
 =?utf-8?B?S0JFbTJKMmpQSFFLWTFEdW5EbGRMbjFoa1YxQ01iekdXS3VXcWd4akhFT284?=
 =?utf-8?B?N05pZVVzVVNzanBwcXN6dnVaNmdHTlF3bnhBbXF1aDBVSW9JcjVlWDBUSHJZ?=
 =?utf-8?B?dzRmeVZvZ0EvUjFGZ24rSFpndUl4dVJMa3BaTnp5UksvQ0UremkyazV1aGdJ?=
 =?utf-8?B?dUxNRHpzZzl3NEgrZGViOXdIMHNjYjdhQWNlNzQxT0Z5TnlJZUNrb0hmdGxF?=
 =?utf-8?B?VkwxMDkrRDFGZTNRNi9uRWNuTHgrTC8vUTd2ZitORHl6ZWgyNnpSUHI2MFBr?=
 =?utf-8?B?Y29wRDlpUlRIME93MWFpbnU3djJkU0JYckZxUjNNaitNV1NpbTFyTlBpMklP?=
 =?utf-8?B?K2lCOWhCV0tHZUVEd3p0OUFZbkJXdGl4a0JnNlF4OU41bHFuU3I1WkVCZFJw?=
 =?utf-8?B?RW5mUGx1eE9TR0phbzhqR1d1TUlhY1pSaEpXcE1UTGRwSlNtM0ZwNXl4YXdN?=
 =?utf-8?B?bUdYVjBjV0V6M2lIbFVHYXk1eXFrRFR6NGdTR0tybHVWMW8yVWJPaUF6VWRH?=
 =?utf-8?B?NkNtMFNHQmpxU01Bc1lpM2NaL09MN2s4cmY2aklheERYTU40Q0R0QzNOVDgy?=
 =?utf-8?B?cWcxNlpWc3h1enl3VnNhT0ZWSDgzaUxtQjdpS0V3NVJzTERHb1Y3R25XM2Vp?=
 =?utf-8?B?cG1tYlF3SHV1SFFGaXB0c255Mll4WHhjQjRGcEdObk1mWU9PTkZzSG5hSWlQ?=
 =?utf-8?B?NGJ1alk2OS9UTmRqSmdPbHByd2F1VmlrTmlWbHhNNDRyL2pWWmQzcm13OEFn?=
 =?utf-8?B?V1huVHdCRmhtak9MQWlGdmcra2YyQ3owSEZmS2YyUkxEWGFNVEc4Qzk3Vnlk?=
 =?utf-8?B?S2dTcGtLVHZxMmNaL0lDZ1RzRUdDbHJFY1lQSzN0RmRONUlDbW9RYzFWbjhE?=
 =?utf-8?B?QS9sdWJLRElRUXdzTEErVlROMHB5cFFycXRZR3NzVVIxQk43dWhZSUVKOUhV?=
 =?utf-8?B?aFk4cnZkR3ROR0V5SUZkYWQ2a1M3SXo1bjJGWUthZzUrd1NNVmpmK0M3NEdm?=
 =?utf-8?B?Z1Vlb2ZFYXVEQ0I1enltc0RYNmdWcG0rVDNINDlTZG9rdURWUkY2bTdpVlZW?=
 =?utf-8?B?UDJQVnpCQTgzcXdVLzF5ZXA0ck1EbHdYalJZc2R6QTc2ZzVRT0FneUd5dlNq?=
 =?utf-8?Q?y5XBlQ1WdrZzc503kX0qinZuM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb8c11d-43e4-4c0c-db9e-08de0231466c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 03:59:39.4082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9IRdTCjelEvaSeGdt7h+sJYsEk9X3E6TGy6HRx4zfcAWcq+JXxeRevn+xa0NcsiIG8EnNCx0wB4wZeh72e6zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350
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



On 9/30/25 04:36, Louis Chauvet wrote:
> 
> 
> Le 15/08/2025 à 06:06, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> This tests the color pipeline API, exposed via the
>> COLOR PIPELINE plane property and drm_colorop objects.
>>
>> We introduce tests for:
>>   - sRGB EOTF
>>   - sRGB Inverse EOTF
>>   - sRGB EOTF + sRGB Inverse EOTF
>>
>> The last one is the holy grail of LUT testing. It tests that
>> after applying an EOTF, followed by its inverse EOTF we arrive
>> back at the original value. We can use this to test for
>> precision loss in the pipeline.
>>
>> All tests are tested via writeback. All transforms are done in
>> SW (in floating point) and at the end the SW transformed buffer
>> is compared with the KMS writeback output buffer. The two should
>> match within a bracket of acceptable deviations. Since these
>> deviations might look different for different KMS drivers we'll
>> do this check on a driver-specific basis.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   tests/kms_colorop.c | 508 ++++++++++++++++++++++++++++++++++++++++++++
>>   tests/kms_colorop.h |  88 ++++++++
>>   tests/meson.build   |   1 +
>>   3 files changed, 597 insertions(+)
>>   create mode 100644 tests/kms_colorop.c
>>   create mode 100644 tests/kms_colorop.h
>>
>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>> new file mode 100644
>> index 000000000..e247477ec
>> --- /dev/null
>> +++ b/tests/kms_colorop.c
>> @@ -0,0 +1,508 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
>> SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>> DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_color.h"
>> +#include "sw_sync.h"
>> +#include "kms_colorop.h"
>> +
>> +/**
>> + * TEST: kms colorop
>> + * Category: Display
>> + * Description: Test to validate the retrieving and setting of DRM 
>> colorops
>> + *
>> + * SUBTEST: plane-%s
>> + * Description: Tests DRM colorop properties on a plane
>> + * Driver requirement: amdgpu
>> + * Functionality: kms_core
>> + * Mega feature: General Display Features
>> + * Test category: functionality test
>> + *
>> + * arg[1]:
>> + *
>> + * @srgb_eotf:                   sRGB EOTF
>> + * @srgb_inv_eotf:               sRGB Inverse EOTF
>> + * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
>> + *
>> + */
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>> future) use */
>> +static bool check_writeback_config(igt_display_t *display, 
>> igt_output_t *output,
>> +                    drmModeModeInfo override_mode)
>> +{
>> +    igt_fb_t input_fb, output_fb;
>> +    igt_plane_t *plane;
>> +    uint32_t writeback_format = DRM_FORMAT_XRGB8888;
>> +    uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>> +    int width, height, ret;
>> +
>> +    igt_output_override_mode(output, &override_mode);
>> +
>> +    width = override_mode.hdisplay;
>> +    height = override_mode.vdisplay;
>> +
>> +    ret = igt_create_fb(display->drm_fd, width, height,
>> +                DRM_FORMAT_XRGB8888, modifier, &input_fb);
>> +    igt_assert(ret >= 0);
>> +
>> +    ret = igt_create_fb(display->drm_fd, width, height,
>> +                writeback_format, modifier, &output_fb);
>> +    igt_assert(ret >= 0);
>> +
>> +    plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +    igt_plane_set_fb(plane, &input_fb);
>> +    igt_output_set_writeback_fb(output, &output_fb);
>> +
>> +    ret = igt_display_try_commit_atomic(display, 
>> DRM_MODE_ATOMIC_TEST_ONLY |
>> +                        DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +    igt_plane_set_fb(plane, NULL);
>> +    igt_remove_fb(display->drm_fd, &input_fb);
>> +    igt_remove_fb(display->drm_fd, &output_fb);
>> +
>> +    return !ret;
>> +}
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>> future) use */
>> +typedef struct {
>> +    bool builtin_mode;
>> +    bool custom_mode;
>> +    bool list_modes;
>> +    bool dump_check;
>> +    int mode_index;
>> +    drmModeModeInfo user_mode;
>> +} data_t;
>> +
>> +static data_t data;
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>> future) use */
> 
> Is it complex to do it in this series? I think it could be nice to avoid 
> code duplication.

Some functions evolved and cannot be shared with kms_writeback but some 
can be moved to lib. I will sort them out and remove or reduce the TODOs.

> 
>> +static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>> +{
>> +    int i;
>> +    enum pipe pipe;
>> +
>> +    drmModeModeInfo override_mode = {
>> +        .clock = 25175,
>> +        .hdisplay = 640,
>> +        .hsync_start = 656,
>> +        .hsync_end = 752,
>> +        .htotal = 800,
>> +        .hskew = 0,
>> +        .vdisplay = 480,
>> +        .vsync_start = 490,
>> +        .vsync_end = 492,
>> +        .vtotal = 525,
>> +        .vscan = 0,
>> +        .vrefresh = 60,
>> +        .flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>> +        .name = {"640x480-60"},
>> +    };
>> +
>> +    for (i = 0; i < display->n_outputs; i++) {
>> +        igt_output_t *output = &display->outputs[i];
>> +
>> +        if (output->config.connector->connector_type != 
>> DRM_MODE_CONNECTOR_WRITEBACK)
>> +            continue;
>> +
>> +        for_each_pipe(display, pipe) {
>> +            igt_output_set_pipe(output, pipe);
>> +
>> +            if (data.custom_mode)
>> +                override_mode = data.user_mode;
>> +            if (data.builtin_mode)
>> +                override_mode = output->config.connector- 
>> >modes[data.mode_index];
>> +
>> +            if (check_writeback_config(display, output, 
>> override_mode)) {
>> +                igt_debug("Using connector %u:%s on pipe %d\n",
>> +                      output->config.connector->connector_id,
>> +                      output->name, pipe);
>> +                return output;
>> +            }
>> +        }
>> +
>> +        igt_debug("We found %u:%s, but this test will not be able to 
>> use it.\n",
>> +              output->config.connector->connector_id, output->name);
>> +
>> +        /* Restore any connectors we don't use, so we don't trip on 
>> them later */
>> +        kmstest_force_connector(display->drm_fd, output- 
>> >config.connector, FORCE_CONNECTOR_UNSPECIFIED);
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>> future) use */
>> +static uint64_t get_writeback_fb_id(igt_output_t *output)
>> +{
>> +    return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
>> +}
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>> future) use */
>> +static void detach_crtc(igt_display_t *display, igt_output_t *output)
>> +{
>> +    if (get_writeback_fb_id(output) == 0)
>> +        return;
>> +
>> +    igt_output_set_pipe(output, PIPE_NONE);
>> +    igt_display_commit2(display, COMMIT_ATOMIC);
>> +}
>> +
>> +static void get_and_wait_out_fence(igt_output_t *output)
> 
> There is no /*TODO*/ here, but I look useful for other tests
> 
>> +{
>> +    int ret;
>> +
>> +    igt_assert(output->writeback_out_fence_fd >= 0);
>> +
>> +    ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
>> +    igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(- 
>> ret));
>> +    close(output->writeback_out_fence_fd);
>> +    output->writeback_out_fence_fd = -1;
>> +}
>> +
>> +static bool can_use_colorop(igt_display_t *display, igt_colorop_t 
>> *colorop, kms_colorop_t *desired)
>> +{
>> +    switch (desired->type) {
>> +    case KMS_COLOROP_ENUMERATED_LUT1D:
>> +        if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) 
>> == DRM_COLOROP_1D_CURVE)
>> +            return true;
>> +    case KMS_COLOROP_CUSTOM_LUT1D:
>> +    case KMS_COLOROP_CTM:
>> +    case KMS_COLOROP_LUT3D:
>> +    default:
>> +        return false;
>> +    }
>> +}
>> +
>> +/**
>> + * Iterate color pipeline that begins with colorop and try to map
>> + * colorops[] to it.
>> + */
>> +static bool map_to_pipeline(igt_display_t *display,
>> +                igt_colorop_t *colorop,
>> +                kms_colorop_t *colorops[])
>> +{
>> +    igt_colorop_t *next = colorop;
>> +    kms_colorop_t *current_op;
>> +    int i = 0;
>> +    int prop_val = 0;
>> +
>> +    current_op = colorops[i++];
>> +    igt_require(current_op);
>> +
>> +    while (next) {
>> +        if (can_use_colorop(display, next, current_op)) {
>> +            current_op->colorop = next;
>> +            current_op = colorops[i++];
>> +            if (!current_op)
>> +                break;
>> +        }
>> +        prop_val = igt_colorop_get_prop(display, next,
>> +                        IGT_COLOROP_NEXT);
>> +        next = igt_find_colorop(display, prop_val);
>> +    }
>> +
>> +    if (current_op) {
>> +        /* we failed to map the pipeline */
>> +
>> +        /* clean up colorops[i].colorop mappings */
>> +        for (i = 0, current_op = colorops[0]; current_op; current_op 
>> = colorops[i++])
>> +            current_op->colorop = NULL;
>> +
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static igt_colorop_t *get_color_pipeline(igt_display_t *display,
>> +                     igt_plane_t *plane,
>> +                     kms_colorop_t *colorops[])
>> +{
>> +    igt_colorop_t *colorop = NULL;
>> +    int i;
>> +
>> +    /* go through all color pipelines */
>> +    for (i = 0; i < plane->num_color_pipelines; ++i) {
>> +        if (map_to_pipeline(display, plane->color_pipelines[i], 
>> colorops)) {
>> +            colorop = plane->color_pipelines[i];
>> +            break;
>> +        }
>> +    }
>> +
>> +    return colorop;
>> +}
>> +
>> +static void set_colorop(igt_display_t *display,
>> +            kms_colorop_t *colorop)
>> +{
>> +    igt_assert(colorop->colorop);
>> +    igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
>> +
>> +    /* Set to desired value from kms_colorop_t */
>> +    switch (colorop->type) {
>> +    case KMS_COLOROP_ENUMERATED_LUT1D:
>> +        switch (colorop->enumerated_lut1d_info.tf) {
>> +        case KMS_COLOROP_LUT1D_SRGB_EOTF:
>> +            igt_colorop_set_prop_enum(colorop->colorop, 
>> IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
>> +            break;
>> +        case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
>> +            igt_colorop_set_prop_enum(colorop->colorop, 
>> IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
>> +            break;
>> +        case KMS_COLOROP_LUT1D_PQ_EOTF:
>> +        case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
>> +        default:
>> +            igt_fail(IGT_EXIT_FAILURE);
>> +        }
>> +        break;
>> +    case KMS_COLOROP_CUSTOM_LUT1D:
>> +    case KMS_COLOROP_CTM:
>> +    case KMS_COLOROP_LUT3D:
>> +    default:
>> +        igt_fail(IGT_EXIT_FAILURE);
>> +    }
>> +}
>> +
>> +static void set_color_pipeline(igt_display_t *display,
>> +                   igt_plane_t *plane,
>> +                   kms_colorop_t *colorops[],
>> +                   igt_colorop_t *color_pipeline)
>> +{
>> +    igt_colorop_t *next;
>> +    int prop_val = 0;
>> +    int i;
>> +
>> +    igt_plane_set_color_pipeline(plane, color_pipeline);
>> +
>> +    for (i = 0; colorops[i]; i++)
>> +        set_colorop(display, colorops[i]);
>> +
>> +    /* set unused ops in pipeline to bypass */
>> +    next = color_pipeline;
>> +    i = 0;
>> +    while (next) {
>> +        if (!colorops[i] || colorops[i]->colorop != next)
>> +            igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
>> +        else
>> +            i++;
>> +
>> +        prop_val = igt_colorop_get_prop(display, next,
>> +                        IGT_COLOROP_NEXT);
>> +        next = igt_find_colorop(display, prop_val);
>> +    }
>> +}
>> +
>> +static void set_color_pipeline_bypass(igt_plane_t *plane)
>> +{
>> +    igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
>> +}
>> +
>> +static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
>> +{
>> +    if (is_vkms_device(in->fd))
>> +        return igt_cmp_fb_pixels(in, out, 1, 1);
> 
> Can you add a comment explaining why vkms is an exception and how the 
> [1,1] bracket was choosen?

Will do according to Harry's comments, ex., chosen experimentally (by 
trial and error).

> 
>> +
>> +    /*
>> +     * By default we'll look for a [0, 0] bracket. We can then
>> +     * define it for each driver that implements support for this
>> +     * test. That way we can understand the precision of each
>> +     * driver better.
>> +     */
>> +    return igt_cmp_fb_pixels(in, out, 0, 0);
>> +}
>> +
>> +#define DUMP_FBS 1
> 
> Is it possible to toggle it at runtime? (see kms_writeback and 
> igt_main_args)
> 

That's a good idea, and I plan to make default as 0 (no DUMP_FBS).

>> +
>> +#define MAX_COLOROPS 3
>> +#define NUM_COLOROP_TESTS 3
>> +#define MAX_NAME_SIZE 256
>> +
>> +static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t 
>> *sw_transform_fb)
>> +{
>> +    int i;
>> +    igt_pixel_transform transforms[MAX_COLOROPS];
>> +
>> +    for (i = 0; colorops[i]; i++)
>> +        transforms[i] = colorops[i]->transform;
>> +
>> +    igt_color_transform_pixels(sw_transform_fb, transforms, i);
>> +}
>> +
>> +static void colorop_plane_test(igt_display_t *display,
>> +                   kms_colorop_t *colorops[])
>> +{
>> +    igt_colorop_t *color_pipeline = NULL;
>> +    igt_output_t *output;
>> +    igt_plane_t *plane;
>> +    igt_fb_t input_fb;
>> +    igt_fb_t sw_transform_fb;
>> +    igt_fb_t output_fb;
>> +    drmModeModeInfo mode;
>> +    unsigned int fb_id;
>> +    igt_crc_t input_crc, output_crc;
>> +
>> +    output = kms_writeback_get_output(display);
>> +    igt_require(output);
>> +
>> +    if (output->use_override_mode)
>> +        memcpy(&mode, &output->override_mode, sizeof(mode));
>> +    else
>> +        memcpy(&mode, &output->config.default_mode, sizeof(mode));
>> +
>> +    /* create input fb */
>> +    plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +    igt_assert(plane);
>> +
>> +    fb_id = igt_create_color_pattern_fb(display->drm_fd,
>> +                    mode.hdisplay, mode.vdisplay,
>> +                    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +                    0.2, 0.2, 0.2, &input_fb);
>> +    igt_assert(fb_id >= 0);
>> +    igt_plane_set_fb(plane, &input_fb);
>> +#if DUMP_FBS
>> +    igt_dump_fb(display, &input_fb, ".", "input");
>> +#endif
>> +
>> +    /* create output fb */
>> +    fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
>> +                DRM_FORMAT_XRGB8888,
>> +                igt_fb_mod_to_tiling(0),
>> +                &output_fb);
>> +    igt_require(fb_id > 0);
>> +
>> +    igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
>> +
>> +    igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
>> +
>> +    /* reset color pipeline*/
>> +
>> +    set_color_pipeline_bypass(plane);
>> +
>> +    /* Commit */
>> +    igt_plane_set_fb(plane, &input_fb);
>> +    igt_output_set_writeback_fb(output, &output_fb);
>> +
>> +    igt_display_commit_atomic(output->display,
>> +                DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +                NULL);
>> +    get_and_wait_out_fence(output);
>> +
>> +    /* Compare input and output buffers. They should be equal here. */
>> +    igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
>> +
>> +    igt_assert_crc_equal(&input_crc, &output_crc);
>> +
>> +    /* create sw transformed buffer */
>> +
>> +    igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
>> +    igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
>> +
>> +    apply_transforms(colorops, &sw_transform_fb);
>> +#if DUMP_FBS
>> +    igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
>> +#endif
>> +    /* discover and set COLOR PIPELINE */
>> +
>> +    /* get COLOR_PIPELINE enum */
>> +    color_pipeline = get_color_pipeline(display, plane, colorops);
>> +
>> +    /* skip test if we can't find applicable pipeline */
>> +    igt_skip_on(!color_pipeline);
>> +
>> +    set_color_pipeline(display, plane, colorops, color_pipeline);
>> +
>> +    igt_output_set_writeback_fb(output, &output_fb);
>> +
>> +    /* commit COLOR_PIPELINE */
>> +    igt_display_commit_atomic(display,
>> +                DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +                NULL);
>> +    get_and_wait_out_fence(output);
>> +#if DUMP_FBS
>> +    igt_dump_fb(display, &output_fb, ".", "output");
>> +#endif
>> +
>> +    /* compare sw transformed and KMS transformed FBs */
>> +    igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
>> +
>> +    /* reset color pipeline*/
>> +    set_color_pipeline_bypass(plane);
>> +
>> +    /* Commit */
>> +    igt_plane_set_fb(plane, &input_fb);
>> +    igt_output_set_writeback_fb(output, &output_fb);
>> +
>> +    igt_display_commit_atomic(output->display,
>> +                DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +                NULL);
>> +    get_and_wait_out_fence(output);
>> +
>> +    /* cleanup */
>> +    detach_crtc(display, output);
>> +    igt_remove_fb(display->drm_fd, &input_fb);
>> +    igt_remove_fb(display->drm_fd, &output_fb);
>> +}
>> +
>> +igt_main
>> +{
>> +
>> +    struct {
>> +        kms_colorop_t *colorops[MAX_COLOROPS];
>> +        const char *name;
>> +    } tests[] = {
>> +        { { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
>> +        { { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
>> +        { { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, 
>> NULL }, "srgb_eotf-srgb_inv_eotf" }
>> +    };
>> +
>> +    igt_display_t display;
>> +    int i, ret;
>> +
>> +    igt_fixture {
>> +        display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +
>> +        if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) 
>> == 0)
>> +            display.is_atomic = 1;
>> +
>> +        ret = drmSetClientCap(display.drm_fd, 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>> +
>> +        igt_require_f(!ret, "error setting 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>> +
>> +        igt_display_require(&display, display.drm_fd);
>> +
>> +        kmstest_set_vt_graphics_mode();
>> +
>> +        igt_display_require(&display, display.drm_fd);
>> +
>> +        igt_require(display.is_atomic);
>> +
>> +    }
>> +
>> +    for (i = 0; i < ARRAY_SIZE(tests); i++) {
>> +        igt_describe("Check color ops on a plane");
>> +        igt_subtest_f("plane-%s", tests[i].name)
>> +            colorop_plane_test(&display, tests[i].colorops);
>> +    }
>> +
>> +    igt_describe("Tests getting and setting COLOR_PIPELINE property 
>> on plane");
>> +    igt_fixture {
>> +        igt_display_fini(&display);
>> +    }
>> +}
>> diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
>> new file mode 100644
>> index 000000000..f414895dd
>> --- /dev/null
>> +++ b/tests/kms_colorop.h
>> @@ -0,0 +1,88 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
>> SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>> DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#ifndef __KMS_COLOROP_H__
>> +#define __KMS_COLOROP_H__
>> +
>> +#include "igt_color.h"
>> +
>> +typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
>> +
>> +typedef int (*transform_fb)(igt_fb_t *in);
>> +
>> +typedef int (*transform_pixel)(igt_pixel_t *pixel);
>> +
>> +/* Test version definitions */
>> +typedef enum kms_colorop_type {
>> +    KMS_COLOROP_ENUMERATED_LUT1D,
>> +    KMS_COLOROP_CUSTOM_LUT1D,
>> +    KMS_COLOROP_CTM,
>> +    KMS_COLOROP_LUT3D
>> +} kms_colorop_type_t;
>> +
>> +typedef enum kms_colorop_lut1d_tf {
>> +    KMS_COLOROP_LUT1D_SRGB_EOTF,
>> +    KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
>> +    KMS_COLOROP_LUT1D_PQ_EOTF,
>> +    KMS_COLOROP_LUT1D_PQ_INV_EOTF,
>> +} kms_colorop_lut1d_tf_t;
>> +
>> +typedef struct kms_colorop_enumerated_lut1d_info {
>> +    kms_colorop_lut1d_tf_t tf;
>> +} kms_colorop_enumerated_lut1d_info_t;
>> +
>> +typedef struct kms_colorop {
>> +    kms_colorop_type_t type;
>> +
>> +    union {
>> +        kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
>> +    };
>> +
>> +    const char *name;
>> +
>> +    igt_pixel_transform transform;
>> +
>> +    /* Mapped colorop */
>> +    igt_colorop_t *colorop;
>> +
>> +} kms_colorop_t;
>> +
>> +kms_colorop_t kms_colorop_srgb_eotf = {
>> +    .type = KMS_COLOROP_ENUMERATED_LUT1D,
>> +    .enumerated_lut1d_info = {
>> +        .tf = KMS_COLOROP_LUT1D_SRGB_EOTF
>> +    },
>> +    .name = "srgb_eotf",
>> +    .transform = &igt_color_srgb_eotf
>> +};
>> +
>> +kms_colorop_t kms_colorop_srgb_inv_eotf = {
>> +    .type = KMS_COLOROP_ENUMERATED_LUT1D,
>> +    .enumerated_lut1d_info = {
>> +        .tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
>> +    },
>> +    .name = "srgb_inv_eotf",
>> +    .transform = &igt_color_srgb_inv_eotf
>> +};
>> +
>> +#endif /* __KMS_COLOROP_H__ */
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 5c01c64e9..e612e1a05 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -26,6 +26,7 @@ test_progs = [
>>       'kms_bw',
>>       'kms_color',
>>       'kms_concurrent',
>> +    'kms_colorop',
>>       'kms_content_protection',
>>       'kms_cursor_crc',
>>       'kms_cursor_edge_walk',
> 


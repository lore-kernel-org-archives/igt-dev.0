Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EE8CCFA03
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 22:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E00D10E4B2;
	Mon,  3 Nov 2025 22:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ajyp9Pl/";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1131A10E4B2
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 22:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/od9zV90p0Qwx/X9pQoddY2QovfS9bbTN7L5JAfIUX8GOQM7i+hoQ2b7J7V03BK15db70DADu1fqA1szpJL4eBHFhSNW37J057SmtaA08vYmLID7YQbcVHIElhFL06qhjSJ6+iHTSpWleaPvktefV6kS43ikWBgRiQtc1piKtoYB1J8Vw8K+MwhSVIc1DM5r5Tit/2uhklBvZqcNO9egKSC5SxdWFOdmiZbLxzNMf+D859BbfAcL5lpshtqdgilD82SnIXneM6mkAOLrNMiIbrLcFIIRrFxRIYjk2K/6NG2NpgyFBlXQWEn0bXeDAsIRH3RmVdiH0OeC0e4n/Avtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CmXnqusJo8sT4+7wLRiq7+mmjyA4zPciHnHMpZ8Tto=;
 b=B/KLt8yw2JfE0nBHerq0n4aJ9XvbsrgSUkx6mj9nhnUJlNlU9goTzOvUFL97b4A0wWY1bw0B2kGezueEop0z21m7e3o/ftfQwCPB0KL3182GW5yr+zPXcYdxe6jKvAudpoK2WCBGzm17bmLDuqoIIdHggoIELT7a3Ly3ShlVM5/UjtbyR4cElEKLqXo+/+ykuPc8yvnpQxKmb9pd1QRw9CvbxZkbpdwyFdrwyiHAjWIWotqP/YlNljvnnTy7vlipivuJN7XkF5HGBynBZUV7MJoJDKas/FgqmZN4X6dKbUaJH2p/aB0p5ECQ1C33dVSR8rVwkm7R1+xe9NRHInGrsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CmXnqusJo8sT4+7wLRiq7+mmjyA4zPciHnHMpZ8Tto=;
 b=Ajyp9Pl/qom6DhjiA88XB/8PqKBOndlLsZqHEYLp8x99sx6gljI+TbTzWyJSM97gpxESASoa1vmq67GJBb50hcSD5juim5OC8AAj1PcpQHB3U923Pi7IudcCxUwx7I5+r9v/UWhzNTh2Uns/TZSCadQ3gIngV7J8Tgkll8bDahY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 22:04:50 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 22:04:50 +0000
Message-ID: <02074472-30b5-462e-b9f8-52450adacfdc@amd.com>
Date: Mon, 3 Nov 2025 15:04:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 05/32] lib/igt_kms: Add COLOROP properties and helper
 functions
To: Leo Li <sunpeng.li@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-6-alex.hung@amd.com>
 <58e9bfad-b78b-4ea7-be37-f8ad158ce771@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <58e9bfad-b78b-4ea7-be37-f8ad158ce771@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0107.namprd04.prod.outlook.com
 (2603:10b6:303:83::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f32a85e-eee4-48ce-b60e-08de1b250237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWxQeGdMM3hrMUNxVFZleENYM0d1M1A3TGhGU3pOQkl3ZTlPSFNCM3Nwcmdj?=
 =?utf-8?B?TnQ0QUxRSXRMUlpnTjlyRWxTUk42anhPQ1J3eDJhY0Q0cnR2RnBCTkZweWJ5?=
 =?utf-8?B?NC9tWEh6b0o1RmZQUnU2bnF1TkhaTm94a1JKSlVhakk5Z1ZGL3NYL1phcm1T?=
 =?utf-8?B?NzdacGs0cFZhZjkvNklSTGxDYnozdGJ6RzR6c3dUTTdMQm5xWWVCRjdRUHVh?=
 =?utf-8?B?aTl3Z0NoQmtYdkdUQm9ReHIxZzNGY1ZhUlp2SnRsZTBnL3lWNGphaVZTYUxM?=
 =?utf-8?B?eW5RWkdsTDBIR3hJaXI5UmJIdXpqY1dJdVJDRVByZlVRaEN1M2VrZFdXTFdI?=
 =?utf-8?B?TlpIWHNxdFoxcno2WVA5YzAvdnAxMGR5WkU0eTlvdFZCYUJCWjJvS1lPS3Vy?=
 =?utf-8?B?ZlA0ZTUwTVZ4WitRL3JLdEdjcHB6cXo5SnZheHdIdlBMVm01dWNpRTlvNU56?=
 =?utf-8?B?QUxXdjJ2OFhtYW5MbHhQM2NHRkNhS0lkc1J6N2QzQ3FiZmVYNlYzTzhmOHlO?=
 =?utf-8?B?bjU3V1FEVzFlRld3L2NBa2VUSnFScWV2ekhCbVAxdkdhRWNQV0FxMVArdC9h?=
 =?utf-8?B?K2hIYmI1V2MwTkZxem5EWnBWcU9kL3hWc2FVU1VSWHBkaWUrSWpobnRpZzR6?=
 =?utf-8?B?YkQ1cFplYjdmUmN3WS95cjAweUZzUlZsSm81dUhnWWpEb213bU9kK1pFdFlq?=
 =?utf-8?B?VFhaZUgvdElIUFVqYUhZOVdDL0pJbzcvR2pvME01YVhEZW1kOEo3Q0U1L2Ez?=
 =?utf-8?B?eFByNVcyMTIzMHRWQUVCdCs4VWFPa0FnaHpqSC9DWlhFeGFiS2JSSmtReHp1?=
 =?utf-8?B?TkpsdWZrNEJtdnlEL0pSYThtd0w2MkJNcGpXdmNXazF4OXhSbnBqSE5EZ1NQ?=
 =?utf-8?B?UmNJcHZRa3Y0UGxwZWtJejNNYkJnRnVmQ1hlREIwcnIxYk5BR1ZCS1VqeS92?=
 =?utf-8?B?UzFNVFRGMHJmWXZHb1dRRzhSekxndGtxL3pLRVNNM09LdzdMSnJlS1llRVdx?=
 =?utf-8?B?REtyVFBVa1JRSi9uNDFsTmwwbXZxWHBHbUYzcjEzNVBpT2ZCZzVZNnFxeUxo?=
 =?utf-8?B?cHAxZ3ZiT1JLT0lzSHJkcENVR0V5cGF5YUVpZlFqUHh0VktUNHVZek9jRmxs?=
 =?utf-8?B?UVEwejlTUUY0eHVmK2V6UzlTT3ZXOWZPV3h4TkxtRHhXTE9sOWFXMzdsY2ti?=
 =?utf-8?B?bnpBbWJnWXdNK3BsUEVYVlI1VnhXbUsyUU9qbWVGMWF1dXFrZVVWS2lBaVNq?=
 =?utf-8?B?NW5KOXJoUnlHTXpPUHRhQkZkVUFleHlHdUVEbFMzNEkyaVh0RmliREI3TG1D?=
 =?utf-8?B?SEc0RnJweWJjN1JraEdIamYxU0tld2srQVEvU1pUYlo2L3p5NGdHUTVacDk0?=
 =?utf-8?B?TzdKR3NRSlNtNDIxQ2xPTXA0ZHEvclNWdnJLeDdBSkhBWlJlb1psQWhzbHpw?=
 =?utf-8?B?dFNYMFBhNGY4emE0MkJkeTJTdnVYTXE1QlVZUkYxdlcrRUlEaHgydFBBZGdG?=
 =?utf-8?B?dnh0L3Q5VUpPS2R0Q1Q2cllLaGRyUGFxWVRxclNPWldZZURST0xUWitPa21D?=
 =?utf-8?B?M0IvUXptWFg5TWMxT2IzYlRWRE1aQzI2cWFYQlF1YWUwelVmNmhURzBjRHpp?=
 =?utf-8?B?Zk5YNVBLbis2aVQyL040YjE4cFhyR2N4WUdDbkpFVStmTmd1MzhjWEhHTFNQ?=
 =?utf-8?B?U0pQR3RRcVVGY0NHN0ZQR2o5dEFsbFIrTWdMMnVObHdxU3QvNnFWbHpLODRS?=
 =?utf-8?B?RXNyZVNieDlBZCt3Y1U1SjVvUFE1MVpFRURKTi9Ec0hYVEZ0SWtjNGdMVlFu?=
 =?utf-8?B?TWJvNThNZk1Yc29DZjh2R0p5RFRJcU9MVzlkSFFaT212VHBYN0ZvU2ltdzB0?=
 =?utf-8?B?ZldYcW5VR2pIRzBlL2ZWUmNlTngxTTVpbmpCQ09VRWQ2VDQveHhVb1dwcEFu?=
 =?utf-8?Q?sXSAeLOIF0m2wypox6q9t1pj5WxJzix2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHBUeUsrVUdkWlNHazhuV0R0VUFSdWtHdTlhRzgzTHB5dTA1amtISGlPdHBi?=
 =?utf-8?B?OUJ6SUpRYXhHKzU0Vk01Y0Z5VFhFWTZiS3l2WGtKbVdqNE9zTmg3YUpGKzBz?=
 =?utf-8?B?UmVlQzhCOEJoZTRCSUt2NUhGbnZ2NmxGaXd3bG1xK3NUb2NxVktRSG40RUNo?=
 =?utf-8?B?T01YTWJGMVhEZlZXSDdsd0J3OXRpby9FTFpYNFhWN2dNU0theXBZVmhvcjZC?=
 =?utf-8?B?TlorSmRoVk4rajgzY0RnekpkcVFmWTdmNzRVRVROWVVGcDlPQTYyaHhEdkJa?=
 =?utf-8?B?c3FsaEc2Mm1pTGcvcjhyR01sb3JDRW05UGpLZ2lZekpTWWJzM01oU3JpOUFp?=
 =?utf-8?B?aENheDlUMkNJa1F5SWlRUEFNRSs4K054M0ZGeVdDU3hkdjQ4SFljcTBJSmZ2?=
 =?utf-8?B?S0txWE5GLzNsZVVyR0grT3kvR2NiNWtxanRTZ1JnT252c09sVit5QWVEajFZ?=
 =?utf-8?B?STRQcFVjUUhPSmltYWdoOWJOb2dYWng0UytZOXZvSnUvUlQ2RHBOQlVNd2Ju?=
 =?utf-8?B?QWFaWjIxZEZsRUlVNnJMWXJrWDkxeUVKZ3IwTlJRODNneUlSTjNndmI0ZUo4?=
 =?utf-8?B?ZU5pckVnT3djSi9xa3VRa1MxNmZEMVZJcENxbjYxZ01YVTJocVp5MHVoS1gx?=
 =?utf-8?B?VjdaeUc5N1J4MUtKRFJoYVpVaWFRV04vYnpRZVlUN3Uwa2RDenFab1g0ZnUz?=
 =?utf-8?B?MUpIeWpPMS9BZTJkaFUwQXB0TmtpT1ZVRVB3YmVZOFkxWHlyT1MrUWxkSXNv?=
 =?utf-8?B?K1IvWUdINFZqV1l1cTFvTE0wWm9zMzMzdkRnYjFDWDVvSU14WTZEZ20zS0Zu?=
 =?utf-8?B?OUJWRi9Zd1JRM0lGMVNBckorK20vRDZuMllYVU45UXNERUpJZ1JLcjNkLzZz?=
 =?utf-8?B?MVVtNE5uL2RCTlBBTDNRbkJpMkdHdEJ4emt3eWF1NzhkaXJCNDJTblQrVTls?=
 =?utf-8?B?MjVaSFVqOUdKR2JUdFlzUkRHRjNXQUtFN0VlREppTnZoZ3hsZi83Nzh4b3Zn?=
 =?utf-8?B?ZFB3M2dwRkdzOUNVakRmNk92WDFWMFUwUXVtNE1yaDl0b3NOckZ2TVBTVUlW?=
 =?utf-8?B?MkJjWkJOSHBYWVptdmJ0UG9jSmFYOWZYK1RvT1M1UnJiY3dVU1NqR2RpQkh6?=
 =?utf-8?B?c0xuWjhZUkJJbGVHeXpjdVdXVThEQTZDUXhhM1FXb1FzZnEzR1dZUzREV3hK?=
 =?utf-8?B?eEI2aW5TdHhNZDdYVDVqQXg3eVVTMjUvbnV6Wk5CZnQ0OFJCREk0WHZ6YVZK?=
 =?utf-8?B?ODIrWGhLcW5NeFBZTk8zeEpRYmJIMTVzUHdmNERhd2YzOGxvSkw2clZqL09m?=
 =?utf-8?B?a1VHeXdzQlcvYkx1NGhtOEVQUTJFL2l2cWhJS0YwNkVWWm5BU215SzNDOGRW?=
 =?utf-8?B?RGNDRHdQMW5DZjVCZXFDR1Y0aHY2WHlrUHVWSThCTVNNT0Z3Q3NsaHlzdlhJ?=
 =?utf-8?B?QUVtL1BjUWoybXoyMXBIZ0Q4TzJMbG9VTFQ1dGVxMXp4SmFURCtSSlpYMFAz?=
 =?utf-8?B?T2d4MWhuSmJOZks1OXZFWllkakxGM24vbmhINTN5NW9Kc0liOTZpS3ROSGp0?=
 =?utf-8?B?Vm9jNW9YdzNNc0xlR3pLaVZKK25vVWw5SjY5cUwvMnprczhuYm0yMkU2djNT?=
 =?utf-8?B?ZDJnNnZBaGdtMWR5SlhxTTI0L1luZXlNQWpSbW5aS1d1MlZ0MCtTeUFJWitO?=
 =?utf-8?B?YnIwV09uWDZHN1gwWTNKMkJvSjB6N0NUV0VSLzJuL092N2svck1nQ2dQZlRU?=
 =?utf-8?B?VXhtdC8rSGVQYU04U3BGYWxxenQ2T2M4MHc0T21NMFpDb1hGbCswbDV3OVNo?=
 =?utf-8?B?aFFXS2NOS2FlUGNWM2JRNjRDdENZWFhsK0ZqSXg1U1FnR1Q2eHpBdENRMHBo?=
 =?utf-8?B?QWZYRFlQOVBBM3oxalBxMzZjaTZSWGhjNFhsTUQ5OHAyYjkyUlYvVkVKREQv?=
 =?utf-8?B?RWJYdXJHMmZQWXlFQlA4YjFhZDJMVTF3eU9hZzR0S3QyaFhxRHFzY0k5TGFT?=
 =?utf-8?B?cTZGOWkxclRPbnF3NmdZL1BnNjRKNENSVDRXTmxuYnRBRytoM3VPUWFrZktC?=
 =?utf-8?B?RzdCaVhlcjFKREJuZTgxYm54S2JiVUl4b3drUmpTcy9jSmszTndEQ1RzdXc5?=
 =?utf-8?Q?J1xqCm23BBXcZGpU5t19IHtlt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f32a85e-eee4-48ce-b60e-08de1b250237
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 22:04:49.9759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQN3yLks2+k4P5bjmx0kcikWE8YNhOhEiN42PZieFxsFMvwloNP6kvubFKUgC4chcoDSGSJIZynDCDE2E0TypA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8209
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



On 11/3/25 14:22, Leo Li wrote:
>> +static void
>> +igt_fill_colorop_props(igt_display_t *display, igt_colorop_t *colorop,
>> +		       int num_props, const char * const prop_names[])
>> +{
>> +	drmModeObjectPropertiesPtr props;
>> +	int i, j, fd;
>> +
>> +	fd = display->drm_fd;
>> +
>> +	props = drmModeObjectGetProperties(fd, colorop->id, DRM_MODE_OBJECT_COLOROP);
>> +	igt_assert(props);
>> +
>> +	for (i = 0; i < props->count_props; i++) {
>> +		drmModePropertyPtr prop =
>> +			drmModeGetProperty(fd, props->props[i]);
>> +
>> +		for (j = 0; j < num_props; j++) {
>> +			if (strcmp(prop->name, prop_names[j]) != 0)
>> +				continue;
>> +
>> +			colorop->props[j] = props->props[i];
> Should the values[] be read in as well?

Hi Leo,

the values[] is updated when igt_colorop_set_prop_value is called, and 
it doesn't need reading here.

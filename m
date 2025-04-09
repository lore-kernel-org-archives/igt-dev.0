Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34062C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 15:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D931B10E06E;
	Wed,  9 Apr 2025 15:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ltyUWAS9";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A9310E06E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 15:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwyR0Srztm0zstl/Dm5N6S/WanlkOda3/QDLmGMfgI57fvmiFrPvONa3NZbQSn8GoZZTrcYmxp+8qPRXv8E+H+cooMjiAQbZKvgmwTdjw1p/i1mWfyt80mriibuMdjzseGtPNCtvqVEREs1Wp83v3mBBOn1EfUZuI2qFFLdqg7lIpRu6fV02qIpyIdJagcbUx7DE+rl+8POrtJzGyntbBpqXIZq6snUdIqMgcYTBBLhC0FOyeFag1I+IEg3UBnIuzAZls+qGl78VaHVLSyoJ8krIoOVVCU0H4P9YT8cT3XVL5WfZ8qXMpjc6BVBxTaDZ6QuEm/YxLDB0EwBXqgzrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze0UB99oH4Bl20iwiwYA50PR4sbnyQSaxkqF/ebbN5w=;
 b=HcPSw2spYZ77fAmXOYSLrAcgpvvuBxZlZkPn3lICF7J+85JCXbirWBXOqVbg80NObHwpZZNj7Aa07xtsrd8Tgo2EPouz0i5TmTSE/drPGcUrhCo6vBUVVXN74BpWkNjkBUHdwy5WXDFyxZQyQ13DHQxYNyK8pGz5bxfAHP5i+Yp/on5qydsXwg/SrfjJYPrVEjtyWfmGqlr4gKAh9YUm/rpqm/mJ6pAV0VaeodS01rwiIVOFz61beAyOPMYufqp1X5dnl1TUPtNqxq/VjUnRwoNIzloFT/0wb+G7KfyChsu9hLmik5XnqHzWtLncWU3Bb+Yix1Y/+NrgV61l+Gwhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ze0UB99oH4Bl20iwiwYA50PR4sbnyQSaxkqF/ebbN5w=;
 b=ltyUWAS929NKxfgHFM354KTPREk6W9E2ngdMWOkyzYQRt6q4/o+Wc0yJWQ68ZmGfuVR1u4AymG64PYU3fPI39pyFUHWbWhyQu8UOnKQWSi8TTvGJnYOhNaQklqrp4Pqfp+hNArkccm4Xdraj9jWimxtJRumqAWmCnhnn92tcUgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Wed, 9 Apr 2025 15:29:25 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 15:29:25 +0000
Message-ID: <eb7c4637-0ed0-48c4-aedf-4aa953a20544@amd.com>
Date: Wed, 9 Apr 2025 09:29:22 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] kms_async_flips: Refactor data options
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Melissa Wen <mwen@igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>
References: <20250409152206.132022-1-andrealmeid@igalia.com>
 <20250409152206.132022-4-andrealmeid@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250409152206.132022-4-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::20) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: e656f2e7-12e7-4da6-06c2-08dd777b4f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGN1ODRLK2d0ZW5FdlFSSUNaQ1VCc3FIc1Z4SWFLZ2E5QlhOeFhvazJTbk5L?=
 =?utf-8?B?RGRzT29UaXRsc2kwYnpZK0JuOXNFNzlSeGczbTN1UnBCZWcrNnovMGN0YlBh?=
 =?utf-8?B?VWZrandYd2psd2NneE1jOGtzTk1pUEIzeXRSSW9oSGY4bWtOcUl1dGZablBt?=
 =?utf-8?B?ZlJ5ZmN6OG04Y1JtdmRPbDQyQUpFUk1ab0cwZ3VGTlFTZlpWOXVFZ2NjWkJz?=
 =?utf-8?B?VXBhRU1GdlVKTUlGb0oyQXJMWk5hM0s4bCtNeGQrTit2OHV6UDJ4TWN1UHk5?=
 =?utf-8?B?Z0ZyVG04cVdCNUlZNFdEblhXdk9reXJ6NTg2UGNuVTdHUnBIdGRYdHdaQzRz?=
 =?utf-8?B?ZURDSzdvVWV3VEZnSkhJOG5JMmZueDJKbW82NDMwSUU1OWdhamU2Nm41YnND?=
 =?utf-8?B?VFE1MzA1S3hqOGFjOW56b0k0MHpZeEViRnVDL3lrUC8zRG9CV0MwSXQ2RjlN?=
 =?utf-8?B?NEZodVZFaFdQamJKWEllN2tUOWtqeHFlQ0RtaldMZ0NQTDd2bkttTU1Hc09X?=
 =?utf-8?B?YmVKd2xzQzZrNkowaSt4T1dKOExoQ0t5ZGNBNUkyZUN2RkJCVHNvV1RUaldk?=
 =?utf-8?B?eU04VjVsdGFsNTRTdHp3T0p3dWlMNnYybHhFaE1EOHlNY0cvSXlBSkVTbFFO?=
 =?utf-8?B?MmJIemVGQktIQ2tvZ3hiUTlidXk2RnZacCs0OCtmZU5jQUxSOCtZemFiV3ps?=
 =?utf-8?B?dWZEalFIZzdYNU11L2JoUkZEZGVSczRmdFQwTHpjbG9BSGlRTHMyc2Nzbk4v?=
 =?utf-8?B?TUtMVW9TbzhCVTVRa0kvNTNlTXg0ZWpycUhJNTVQMC8rb28rbENzRjdBRTd5?=
 =?utf-8?B?TlV2aTIrMWJ2ZGp0ekxObkhBMmVqZFAyZG9wT2xMdzJMWlluc1hwSXYvMEVp?=
 =?utf-8?B?RC9EUUUyNjhqc1VTQjNCY0EvTDRSMlovczJ6TmJ4THVEdXphblg0TFFDWXpr?=
 =?utf-8?B?TkZsdG5UdnhzV1E5YUQ0UUF4YWZGeG5sNGRqRExuTk9PaG9vOWZUT2VweWRJ?=
 =?utf-8?B?alFISHo3aXpVS0p1UHZHOEIzcDNrUzJzYUlnVjBVZFRjL1hsMkpySXFrRkIz?=
 =?utf-8?B?U2JHTk9uK3UrSXlwZndGeTJlRlFlZ29HajFvbkF3cmx1b2o5L2gwZlIyTFVl?=
 =?utf-8?B?ejBjeFVEV0ppV004cjhubmxQWnBIYzM1bjhaY3FuVWIzYllvTkNwRU1SbzlG?=
 =?utf-8?B?ZHFRdi92Znl2VGNOYjJIb1NVS2pxL0pkczNxM0RXcW1TVGdvVlM5NGgrS3JP?=
 =?utf-8?B?OHN2Qm8yNnFPVEhodHhIeWp3VnpjeDhxdkF4THEvbndvdUFFMUlBL2VHaG1P?=
 =?utf-8?B?RlBvaWFsclprSkF3ZDhscmpiWUs2Q1lQWFhQNkFsRmVUZ2tLeWxWWjUwK2ZF?=
 =?utf-8?B?RTJjd3lCVTljSmlPQW82bUtqREJ6cGMwWTNmOUVPZjN5TnZ1Z1VhM0ZvVmVF?=
 =?utf-8?B?dkppRVNiTW5wa0prVDZoM3pjZUJxSDJSRURGcy93WDY2SmFpMW10Y3pQbmFm?=
 =?utf-8?B?Q21lL1cvdGhTb1hYMWI2SzFOVlNuaE5hZy80U3doUi9FL0FLZXJtY2ExTFU1?=
 =?utf-8?B?Vk9xMzJrTk9SbkVEc1VUR0hWeEh5VkpjMFMvNDZFZXVneDF1QXRPSVA5UzU1?=
 =?utf-8?B?OTBtWFZheXF1SVUxd0xFNTZnSGpCZzZic0d3TnVkNGlNUWFSWXRqbyt4VGJv?=
 =?utf-8?B?djFyYm5QVGo0VGtvQ0I0UHA1NTQvMW5hbE83aG9BeXBjQS9tdmhLZDZoWUlp?=
 =?utf-8?B?a2Mvd3RTWUoxaUdGL1o4ZGdFclcrS0JvVTZxUTc0b2Z4ZTlyR01YRk1PRzYw?=
 =?utf-8?B?RkRTS0RUWlA1aFhudWMyeWxSOUVtQVF3L05kYW9kVjFTYXhsa0EyM0VEUWw2?=
 =?utf-8?B?MWJ4bEhvdTEzTDFUN2I4OFFnM2JaN1N2TU9Ed0RkSk9iUE8rTFJtWjRRTlVH?=
 =?utf-8?Q?veZH4muDD7E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alRqdUtIUWFPdzFBb0RFMWRCZjhucS9DZWc1Skd3UHc5d1hTRXVPS25SVTdX?=
 =?utf-8?B?NFh0RTYxNHE4QTF1UnpwSWtGRTIxR2JHUFNNV1FjZnBSNTFWUktXTVV4b1B0?=
 =?utf-8?B?UXlVc3lnMEVTYkFhb1VNODdMM3VZZWdHbmxPdDNqTFpkenZiQk5JQjUrNWJD?=
 =?utf-8?B?a2FpU2dndnFJZG9ETWNtRXJZbFNVSVdMRnpyb1YreFgrZFV5NkczYUNTSHhW?=
 =?utf-8?B?ejdxK1B0RXRmcDNoTWVyV2xhWU91Y205N2lyRm5zb3N4bjhybzJUbjFVYkdU?=
 =?utf-8?B?U2J0TlpIV2tISTdsQ01ZWGtqSTRwS2pvZUNTQkh0YnVCd3dtWVk2eWdTMmtl?=
 =?utf-8?B?eEE2cW1zK25GeHNKNDBoLy9sbXBPc0k0SWZMcnQvdEpwTkJIRWgxMGc5Vjhr?=
 =?utf-8?B?S0lUK21JcnFFejFTcWxsd1h4RlRFaHJKMUthd2NyZjB4TXpGVUU2alcxUGFB?=
 =?utf-8?B?VjAvd1V1bmtYVHVsSW5Fa3ZUYTBvcGROaUc5UkYrVnNua3dxdlZveFNIaURM?=
 =?utf-8?B?Y3R5Z3RjekR4eGdiNG1NWkdRKzA0d1VNU1VZMnE3QUlIQ0g1RnZEQ3NKMUdS?=
 =?utf-8?B?RDFXa3J6L29VTWpqT1JzaXV3czN2Vzk1c1hhZWMvRElvakdwOW5EMWJubUdv?=
 =?utf-8?B?QXRXcG5hbWZqUElScnZveUJaL0ZyUXlJUndWK1FwemtybWoxdVpENEx2QldC?=
 =?utf-8?B?Y1poYzR6OXl3Z2JwSC85TCttYndoNEw1TmpLNHJ5dUlHWlJvdWRNWVV5N2Fj?=
 =?utf-8?B?b0xaQVBNajBTUjQ5UkcwRS9rUkxaNEZjOXBvcW40TGZ1TFdsWG9HQU9wbUNX?=
 =?utf-8?B?Wjl6SXU4U1oyaUw2ZGJHTStIcHhtN21hdHhDS0dBV3hBVWRZNVZYKzkyWUdx?=
 =?utf-8?B?SzhrZ3g5OFV3Vm85MEdEa3VtbnZaQkFpTVJzRHVPVlVudWk3Nk9tTkRZemFr?=
 =?utf-8?B?alFTb2dNYmh6SjJaQkNMeHVKb2V0TGdpekxmbDVQU2VYdGgxMDJiUWE4Y2tl?=
 =?utf-8?B?TmhqTGlKeC92Zll4Q0w1dmxoZDVyNi9VMEswWURWVnUyREVuVU5oRGdWSjFQ?=
 =?utf-8?B?Z000R3U4bWQzK2Rsa25QYUpDS0ExQm9iMGhVMFlBaEMvdm5TaDVyeTJYTFJs?=
 =?utf-8?B?ZmpaVVRzaDVtM2o4YU9KQ0NmdUtmaGFoQ0hjeG1KN3lXTzRmVHFkUVZUS3RI?=
 =?utf-8?B?NlNOcEdpZmhyNjIyZzlqaWkvNVA5S053RDBDWStWNXYvMEQ1UWVTbk9UdUV3?=
 =?utf-8?B?UEQzZlAvVTkyRzkrS08rdlVOdW5CWW05Ujh1aTR0WXlDMzVIcnFOWlBZZU9a?=
 =?utf-8?B?RDI2Zi9ZZFpHZWVJaDljQWl1QkdCa1Vremd4Mjd3azFFN3pUUmxhekRnYTVp?=
 =?utf-8?B?Skp0eFVRTEZPUDNJM1NWU3E2N3RkcURtQXJRUzVMcy9ra1dXUlVRay9EMitl?=
 =?utf-8?B?Z3JsdFg1U24zcVgzYVhRSXkxcWZHOC85dTMrMTJIamtvQzhyQXIwc3lhSHVV?=
 =?utf-8?B?d0h2Njl5cDRHYkMwYnN6emo5eWNhZDRqVHJaV01rRHZBOWdFNEt3dU1MYnA3?=
 =?utf-8?B?N0w2Mm43cFRGMDhSbVM3Tkgrd2VPNUo5WmlZazFORmovajRNc3JDelpXTXQ2?=
 =?utf-8?B?UituN1ZLQ0Iwbk9oQ1Byd1RxZWFEeXJoSGcxc2xtQ1h4UVkwbWZNbmx2NXo5?=
 =?utf-8?B?NGdBK3lWSXN2ZnBRdnJWeEdybDl3bXEzMjZ6Skh2eFd6cDBkNlI1dWVXUlVh?=
 =?utf-8?B?QVFzeDYwSElwNWdEdXdqdVVwNVoxUzNvclk2ckVpcHh0SnV6R1dNeHZhM01V?=
 =?utf-8?B?cmRFbDBJampiS3VleWl3UDQ0dGI0LzZ2eXB0NXR4U0tKK1Y4UFMzQklkR2NL?=
 =?utf-8?B?T0xjUGZ5NFdTMFdFb25Jci9jbnh5b2s5UVdmSTlBZUsraU1pd3QvakgyY3RU?=
 =?utf-8?B?Y1FzM2V3SDVmNUw0ZFpZM0xpOFAyY0dXU1VQZXZDVHhBRTBpL2tIY2Jkck5q?=
 =?utf-8?B?cCtUempTRVMrS0V3SXZlNGJLenNsbkpiaUhNTWFVbGJtb0g3UElQSnBtc3lG?=
 =?utf-8?B?MndzcFhkZmZ5SkNjYXNhMjNFVU5WSWxFRDdWQXZZSHRnL3NCMzZ2c05QRkc2?=
 =?utf-8?Q?xQSCi0rqEQ6LCnzw1wlKroTPu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e656f2e7-12e7-4da6-06c2-08dd777b4f71
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 15:29:25.5200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pcKAsOthPRHkRADqm4GTlCB/zPSK6mUoXNHd2WQLG4meYzCbC0N2M5EP1e14L6fRi8SYJl8mhRrOdFblDIUHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 4/9/25 09:22, André Almeida wrote:
> Setting the test data options as true and false for every test is error
> prone. Instead, reset all the data to false at the end of a test and
> just set the needed options to true before running a test.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---
>   tests/kms_async_flips.c | 27 +++++++++++++++++++--------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index f7a233045..19c781925 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -234,6 +234,12 @@ static void test_init(data_t *data)
>   	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>   }
>   
> +static void test_init_ops(data_t *data)
> +{
> +	data->alternate_sync_async = false;
> +	data->atomic_path = false;
> +}
> +
>   static void test_init_fbs(data_t *data)
>   {
>   	int i;
> @@ -785,8 +791,7 @@ igt_main
>   
>   		igt_describe("Wait for page flip events in between successive asynchronous flips");
>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
> -			data.alternate_sync_async = false;
> -			data.atomic_path = false;
> +			test_init_ops(&data);
>   			if (is_intel_device(data.drm_fd))
>   				run_test_with_modifiers(&data, test_async_flip);
>   			else
> @@ -796,7 +801,7 @@ igt_main
>   		igt_describe("Wait for page flip events in between successive "
>   			     "asynchronous flips using atomic path");
>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
> -			data.alternate_sync_async = false;
> +			test_init_ops(&data);
>   			data.atomic_path = true;
>   			if (is_intel_device(data.drm_fd))
>   				run_test_with_modifiers(&data, test_async_flip);
> @@ -806,13 +811,14 @@ igt_main
>   
>   		igt_describe("Alternate between sync and async flips");
>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
> +			test_init_ops(&data);
>   			data.alternate_sync_async = true;
> -			data.atomic_path = false;
>   			run_test(&data, test_async_flip);
>   		}
>   
>   		igt_describe("Alternate between sync and async flips using atomic path");
>   		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
> +			test_init_ops(&data);
>   			data.alternate_sync_async = true;
>   			data.atomic_path = true;
>   			run_test(&data, test_async_flip);
> @@ -821,13 +827,14 @@ igt_main
>   		igt_describe("Verify that the async flip timestamp does not "
>   			     "coincide with either previous or next vblank");
>   		igt_subtest_with_dynamic("test-time-stamp") {
> -			data.atomic_path = false;
> +			test_init_ops(&data);
>   			run_test(&data, test_timestamp);
>   		}
>   
>   		igt_describe("Verify that the async flip timestamp does not coincide "
>   			     "with either previous or next vblank with atomic path");
>   		igt_subtest_with_dynamic("test-time-stamp-atomic") {
> +			test_init_ops(&data);
>   			data.atomic_path = true;
>   			run_test(&data, test_timestamp);
>   		}
> @@ -835,6 +842,7 @@ igt_main
>   
>   	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
>   	igt_subtest_with_dynamic("test-cursor") {
> +		test_init_ops(&data);
>   		/*
>   		 * Intel's PSR2 selective fetch adds other planes to state when
>   		 * necessary, causing the async flip to fail because async flip is not
> @@ -844,13 +852,13 @@ igt_main
>   			      "PSR2 sel fetch causes cursor to be added to primary plane "
>   			      "pages flips and async flip is not supported in cursor\n");
>   
> -		data.atomic_path = false;
>   		run_test(&data, test_cursor);
>   	}
>   
>   	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after "
>   		     "async flip with atomic commit");
>   	igt_subtest_with_dynamic("test-cursor-atomic") {
> +		test_init_ops(&data);
>   		/*
>   		 * Intel's PSR2 selective fetch adds other planes to state when
>   		 * necessary, causing the async flip to fail because async flip is not
> @@ -865,6 +873,7 @@ igt_main
>   
>   	igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
>   	igt_subtest_with_dynamic("invalid-async-flip") {
> +		test_init_ops(&data);
>   		/* TODO: support more vendors */
>   		igt_require(is_intel_device(data.drm_fd));
>   		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> @@ -872,13 +881,13 @@ igt_main
>   		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
>   						       I915_FORMAT_MOD_Y_TILED));
>   
> -		data.atomic_path = false;
>   		run_test(&data, test_invalid);
>   	}
>   
>   	igt_describe("Negative case to verify if changes in fb are rejected "
>   		     "from kernel as expected when async flip is done using atomic path");
>   	igt_subtest_with_dynamic("invalid-async-flip-atomic") {
> +		test_init_ops(&data);
>   		data.atomic_path = true;
>   		/* TODO: support more vendors */
>   		igt_require(is_intel_device(data.drm_fd));
> @@ -892,16 +901,17 @@ igt_main
>   
>   	igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
>   	igt_subtest_with_dynamic("crc") {
> +		test_init_ops(&data);
>   		/* Devices without CRC can't run this test */
>   		igt_require_pipe_crc(data.drm_fd);
>   
> -		data.atomic_path = false;
>   		run_test(&data, test_crc);
>   	}
>   
>   	igt_describe("Use CRC to verify async flip scans out the correct framebuffer "
>   		     "with atomic commit");
>   	igt_subtest_with_dynamic("crc-atomic") {
> +		test_init_ops(&data);
>   		/* Devices without CRC can't run this test */
>   		igt_require_pipe_crc(data.drm_fd);
>   
> @@ -911,6 +921,7 @@ igt_main
>   
>   	igt_describe("Verify the async flip functionality after suspend and resume cycle");
>   	igt_subtest_with_dynamic("async-flip-suspend-resume") {
> +		test_init_ops(&data);
>   		data.suspend_resume = true;
>   		run_test(&data, test_async_flip);
>   	}


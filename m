Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73137CD98F2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 16:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128D910EA87;
	Wed, 17 Jun 2026 16:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Fuk3xtEO";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E644210EA81
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 16:26:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJ3twbKNGXo5ZCtdYWiENi7XnF8Hx5BztyOxbuNFjbRF/f3YuOOkMeZawhJ7QcsmbiATpRLXCw8+ztOepVfd19wRst+dvCNmCA8vn1M7BGpQvyy2mOld9xVe/J68Vt08EGQmPPZuxJ5c5055cwnlQiCKuJMTjy5EaO6sxXDFPi1pnsdQOuZ7BZd/956sigV9+aEJOFXFCqym7lAsS3NivVhBAY32WsYnKzVVQaMhyJiCSTRlzmhTBFlMhTJUBV3lAO2W93jGYjEbCgG2IX4wiOdf8FdAdaTo1BUjfOtZNtDwxBysN/h4l5tQQO6mdlu7ZFY9fSi8a/VyGZiV2LyXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OC94Pd6kcDL9raRWL/S+Hzw91q6Z4rzymsvDtnB65yc=;
 b=uTiQUxxuWDHdaZ9t+LBFEMtpz3CInx+ZwedInKOV+IZ78rMl1TQ2MX/tlRr31xMbL2lY7PugGTlOTaZviwzu6PiB2GKuWEQ4YoiuvyVCBzITJppKuHOnDq+l3uQAs0J83VYrnmuJh+PYBWHLmvz6XB/+eAHFmfBBYgZQRShaxuKoTQ9nyNtSmho+dwQ3v2DYx4nV71gwHH8WyEGfS/SjHxPX9X6wUYMnBrBhEr6D7d0DYOOYcoA5eqAVmVTBbV+gE3OixUarDBAEQJTfXVh6GpyW862QYq5qZ0j/HCcQaGtTyjNYbXTnaq8N5Xma0IvGcpsbSUUttCfdBZ6RvgfVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OC94Pd6kcDL9raRWL/S+Hzw91q6Z4rzymsvDtnB65yc=;
 b=Fuk3xtEOjULie/lOUhLSNLMSAJmZxDWT6oi6mpvaLDNkP+kq4T+rpMw/Qm3S0q30ZEXsV1OgYkkYT0Gagv38tuXGdtpr5sLL99lU6OAiNYRGyQZGDZmPPIOnmVjlFptv7VtlD5q2mRu6PUUXccWjw+fXGc1qiaLKrkDDB2FqksQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by CYYPR12MB8870.namprd12.prod.outlook.com (2603:10b6:930:bb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 16:26:01 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 16:25:59 +0000
Message-ID: <092e3257-58e7-4e84-997c-1e01e876bd8e@amd.com>
Date: Wed, 17 Jun 2026 10:25:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/2] lib/tests: make igt_get_output_max_bpc()
 return status and handle failures in callers
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pranay Samala <pranay.samala@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 swati2.sharma@intel.com, sameer.lattannavar@intel.com
References: <20260611064213.1300403-1-pranay.samala@intel.com>
 <20260611064213.1300403-3-pranay.samala@intel.com>
 <20260617121444.5xopy5pkex6dfpj4@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260617121444.5xopy5pkex6dfpj4@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|CYYPR12MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: b288bbaf-4583-468b-68f4-08decc8d1db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|5023799004|22082099003|18002099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: BryuLM/WpmD0zG17JuOFkiRAU/0hw1v3MKyuk73g4cVkWbAoIfivSe2Ul/QFJoJCopBP++GbrcFmvYdNMuWoAeD9KFGpl0QPCgab49JuHdMnJUFGpioLcEA1doFGd2d5E2jMFPGcFYlJf5Alg0PQOCwnz/MZ9JFbtu/LRI1PEL3h8SITqpEryQvqvHQ5ZH9PQwc4gulNhEGhoGCGsG+U13Mww0T0aUTw8AvNrLa1LrtBNRJ+Vz3lAVRHlB2RgXoE1u4FWfTRyrmBLA7jFvf+Y6VG4BXFf5T2jCtgefaBP8wceo/zFYieT9cLOOihVI/HwzZBVqD4g2q8zcnSN6br5xBd558jMcMIlBO9pRKsjF/zDEmOcxiM1u29FABEEP4yixOH+sB9lkBnxeZ9vbO12h8gEx84b7sX/eQbkquBPqA1F2uKtCWPt9++qwr0q2J3/0U5a7pitfmrdTvgeLnXhCvTa/twzUYx0+akXHlNqSI6jJBrgD3fcNawBoaFfN1xYb8aqjZr+lo8p4xO3vGfL8Dl4m+2fsXvATl+IeDZR2cDj3YRrv3q3Of61RlRvywFBGyb7McoPtRQ40lq+gtX5tqQGbYA5YEuNrbJrKUD1go5kUXWzCgPlsrgYMxJB+gx55Q1aHmfZIOmfBIS9N/f9G4q2roOdcQzuXtkgIr3Ce/95E+SFCV799vRUwztfSKg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YldydjNKRzMrbG9sVFJRRUptSDQ2RWlDWCtsVHBCYjdCSm9mTEN0bEhsQ1pB?=
 =?utf-8?B?anhHZkdEa0oxSllFUWZPdDc0RGtwM2xiaWg2Mk1FUnNrMWVldkppV2F3QU1a?=
 =?utf-8?B?NjBCVWQ2Y0dUb1VjcGxhdWJzMCsreU9LU3FHaEtwVjhPejNxSngvZ0hGU09L?=
 =?utf-8?B?WERtU3pqMng0dklGTXdRTWxYQnhDbXo0MWFpQnp1aWVMTlFSTDVKTVhSNG1M?=
 =?utf-8?B?UEJQWjlXTjRrbXpFN2F1d1poc3Uydk95cXpBNlc0WXc3QlBBSmcwQkI0SHNw?=
 =?utf-8?B?S0xIT1A2eVdCbFJYS1RxTGorY011Tk1OTmVGcTh1QnQ1aStoYjlBeXZnaU5s?=
 =?utf-8?B?Q2tmL3llU0o1RnZ0a3dEWVZxbmRKdlpvSFBwbFAxWWRNK29ZemNSNW1KOXpU?=
 =?utf-8?B?eFliUmJUZWRFREIyNExrRHRldUo1bit6TTN5UWxmMVNVYmdHOTh4a0I2VkZS?=
 =?utf-8?B?RytOSHBIU3NMeVJCOERURDc0Y3ZxcWl1dnE4d2lUekF6Y2dmaWJZSVN4M3NT?=
 =?utf-8?B?aG91eGEzQ1Ewdnh2RXIvSTJ2RmVXeDVuVGRKbnRNSHdUNGR0R0dhWmlYUHV6?=
 =?utf-8?B?aDZCa3BTYU9BWkhuNm50ZlE3d05aWXdCcFpOeDdSZlhNYlRkZkI0ZFdiUS9q?=
 =?utf-8?B?T1F2aHh0a2FnRUFrVyt3VkluUGEwbHdvTVp1L1NRMkNKL24wTzdHalNLdG96?=
 =?utf-8?B?RVBYWTB6akhBS3RDM2REa1ZKSjBLaS9oR2ZCYlpRNmVPbUpaQnllOC9Va0Er?=
 =?utf-8?B?Z1JrVS9xOGRXYkRtVUZadHJKYjZEVysveWtSbUVKQ1piQm9QeGdNT09jQVJJ?=
 =?utf-8?B?VEFTUnlpOEtyYi9USExLb05BY290RitHa011aU9sTllUSE9JK0dDSHpjeXRX?=
 =?utf-8?B?eG1DRTZNaDh5WG1DUkxONHZlUkVodTB6SGY2Vk9POTZ2QnBQWkNQa1lMRnpJ?=
 =?utf-8?B?VU5YbXR3a1ppbzVvUjBVTVJ4WlVvM1F1dU9wUnpJNjMzbUJkOURjdXMwaFFK?=
 =?utf-8?B?WS9QZUZ0ZTZhamtCZUFjWno3bE1qdERUY0dxVE9NNC92ZlU1aHpEcWxCSklG?=
 =?utf-8?B?SzRaaGpCK1Q4dFJrYURBMkhHaVFma243SUlzOU1PZ1UwTWUwOUx0VndBcmxR?=
 =?utf-8?B?LytJTldlZW1iamNOYkFZT3haNWtlQys1SXMwVnFXdno5SllzTDM5NENMcnRo?=
 =?utf-8?B?emorWmhabzhwdVpSUzZMOVN1eUhqbFQ3NGlLTkFXUmx5TVNZKzhsVDdxakRu?=
 =?utf-8?B?WTZqS1Z2ZUlESzlnb2YxY296NVlsZlRWTDdsL0Y4R0lzcnFKUE9MR3VxK3hQ?=
 =?utf-8?B?RjBndkZRV3ZrYWJFVWo2WXpHQlNVY0Z4TEZFV2tEQ1hYRnJ5QXhoSzZacUpF?=
 =?utf-8?B?K3BNVkl6VkdkNW1pWDRCeTZTZGdIQktaajQrY3JyN1hRMGcyRUxZbGpHWHFy?=
 =?utf-8?B?RjQ5K0s2b0RVOGpnb0daUkxkNitGbjFWcDBVeXhPamplMTZuRGJFUWRwVmtw?=
 =?utf-8?B?QjZ4NUVuUEtraVFNVlRTM3IyR2ZXVCs5YlRIWDY2d2ErTzRWT21wUm14UlNa?=
 =?utf-8?B?d3lRbE55NW9mZ29JM3JGS3lXaWttc3h5YTVmUXpGN3RtU2pZb3M0akE4Zldz?=
 =?utf-8?B?VWwvdml4ekxxNUpsVW9YWUxhYkhBQjJCT09BYjRnTHZaMXNZR3V6QnNqa0d2?=
 =?utf-8?B?VGhFQkJEamJlTWtXYkdROUdFY1QwS25MU3I0U3FxeWpabFh0YkR3Q0N2QzJ2?=
 =?utf-8?B?TFFEbXFsSkZHajJhT1RYN2M2NHQyUHdNYXRpak5PK0lZV0l5aS9NYUkvZ2Rk?=
 =?utf-8?B?Q29TMmNQenllakRUZys2L05heXRqUFhFd2p3Q2dUL0U0WUVrclJybUJ6QmFO?=
 =?utf-8?B?VHZKUVJ6WjdJcDNNeW5ZQU1wUlZSR1NKbmdHam5odnVuUGtjZjB3UW5STkpp?=
 =?utf-8?B?WW5jQ1hneHgrNEwyeW9Eek56ZWJTaUl2ai9ES05JNElmWW5TZnFkYVZPTGlO?=
 =?utf-8?B?MUJmdXBDRlZYcTJLY0pkOFZBRi9udlpIWjdQMmt5TEZzcXVOaEsyYmgxWk5q?=
 =?utf-8?B?cHVic0U4cnBudXVOQ0F2ZjdYZWJSL3hFdUE3cUczTDdhT1BSYm1IMkM2L3dW?=
 =?utf-8?B?eGlWZzc4ZW1OMGIxRzhVZnVWTEtucXhSa2hoanZXK0poQWlNZkFKYTJEVGhp?=
 =?utf-8?B?aFlYK2VleG5EdnVYd3RmcW16R0xwbkYyaGlCREtnTjJOZ093WjZKcCtCRWps?=
 =?utf-8?B?VmpteXlpaGZmaEk4cUZZVmxHRWZrbWJTeXBIVk1qZzJrdUMveGhJcnQxelRw?=
 =?utf-8?B?QzMxL0l3Q1N0QVRoWlc4OVNmbDlxQ1ZNYjRDc25lcUFxT0lyOTlIdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b288bbaf-4583-468b-68f4-08decc8d1db5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 16:25:59.6169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lqhTjA3BYDwlBrDWe4GVCYQljYB7AKtvbClB+eGwZcF2+I6c0ALG4t/auZijIOm6sJrpIMlmR7rdSF+mtFSWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8870
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



On 6/17/26 06:14, Kamil Konieczny wrote:
> Hi Pranay,
> On 2026-06-11 at 12:12:13 +0530, Pranay Samala wrote:
>> Change igt_get_output_max_bpc() to return bool and fill an output parameter
>> instead of asserting/requiring internally. This lets callers handle debugfs
>> read/parse failures gracefully instead of failing inside the helper.
>>
>> Update test call sites to use the new boolean-return API so each test can
>> decide how to handle max-bpc read failures. This separates read/parsing
>> failures from capability checks and makes skip/continue decisions explicit
>> with clearer logging, while preserving normal capability validation when
>> max bpc is read successfully.
>>
>> v2:
>> - Combine lib & test changes into single patch (Karthik)
>>
>> v3:
>> - Add description for the helper (Swati)
>>
>> v4:
>> - Rebase (Jason)
>>
>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   lib/igt_kms.c                          | 41 ++++++++++++++++++--------
>>   lib/igt_kms.h                          |  2 +-
>>   tests/amdgpu/amd_bypass.c              |  6 +++-
>>   tests/amdgpu/amd_dp_dsc.c              | 10 ++++++-
> 
> You touched amd tests so imho please add some of amd devs
> to cc, found by git log -- file.c
> 
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> 
> Regards,
> Kamil


Reviewed-by: Alex Hung <alex.hung@amd.com>

> 
>>   tests/intel/kms_dsc.c                  |  5 +++-
>>   tests/intel/kms_frontbuffer_tracking.c | 10 ++++++-
>>   tests/kms_color_helper.c               |  5 +++-
>>   tests/kms_dither.c                     |  9 +++++-
>>   tests/kms_hdr.c                        | 16 ++++++++--
>>   9 files changed, 83 insertions(+), 21 deletions(-)
>> [cut]
> 
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 49bdbb358..244c24610 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6769,32 +6769,46 @@ bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
>>   
>>   /**
>>    * igt_get_output_max_bpc:
>> - * @drmfd: A drm file descriptor
>> - * @connector_name: Name of the libdrm connector we're going to use
>> + * @output: Output to query.
>> + * @maximum: Pointer to store the maximum supported bpc value.
>> + *
>> + * Read and parse the connector's debugfs output_bpc entry to obtain the
>> + * maximum supported bits-per-component value.
>>    *
>> - * Returns: The maximum bpc from the connector debugfs.
>> + * Returns: true on success, false on failure.
>>    */
>> -unsigned int igt_get_output_max_bpc(igt_output_t *output)
>> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum)
>>   {
>>   	igt_display_t *display = output->display;
>>   	int drmfd = display->drm_fd;
>>   	char buf[24];
>>   	char *start_loc;
>>   	int fd, res;
>> -	unsigned int maximum;
>> +
>> +	if (!maximum)
>> +		return false;
>> +
>> +	*maximum = 0;
>>   
>>   	fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
>> -	igt_assert(fd >= 0);
>> +	if (fd < 0)
>> +		return false;
>>   
>>   	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
>> -	igt_require(res > 0);
>> -
>>   	close(fd);
>> +	if (res <= 0)
>> +		return false;
>>   
>> -	igt_assert(start_loc = strstr(buf, "Maximum: "));
>> -	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &maximum), 1);
>> +	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
>> +
>> +	start_loc = strstr(buf, "Maximum: ");
>> +	if (!start_loc)
>> +		return false;
>>   
>> -	return maximum;
>> +	if (sscanf(start_loc, "Maximum: %u", maximum) != 1)
>> +		return false;
>> +
>> +	return true;
>>   }
>>   
>>   /**
>> @@ -6838,9 +6852,12 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
>>   static unsigned int get_current_bpc(igt_crtc_t *crtc, igt_output_t *output,
>>   				    unsigned int bpc)
>>   {
>> -	unsigned int maximum = igt_get_output_max_bpc(output);
>> +	unsigned int maximum;
>>   	unsigned int current = igt_get_crtc_current_bpc(crtc);
>>   
>> +	igt_require_f(igt_get_output_max_bpc(output, &maximum),
>> +		      "Failed to read max bpc for %s\n", igt_output_name(output));
>> +
>>   	igt_require_f(maximum >= bpc,
>>   		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
>>   		      maximum);
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index e89f1f3b6..4b90577fc 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1322,7 +1322,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display);
>>   bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>>   bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
>> -unsigned int igt_get_output_max_bpc(igt_output_t *output);
>> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum);
>>   unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
>>   void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
>>   				 unsigned int bpc);
>> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
>> index 3c537ea9e..e59691f16 100644
>> --- a/tests/amdgpu/amd_bypass.c
>> +++ b/tests/amdgpu/amd_bypass.c
>> @@ -323,6 +323,7 @@ static void bypass_8bpc_test(data_t *data)
>>   	igt_display_t *display = &data->display;
>>   	igt_fb_t fb;
>>   	enum pattern ptn;
>> +	unsigned int maximum;
>>   
>>   	test_init(data);
>>   
>> @@ -345,7 +346,10 @@ static void bypass_8bpc_test(data_t *data)
>>   	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
>>   	 * with 8bpc.
>>   	 */
>> -	igt_skip_on_f(igt_get_output_max_bpc(data->output) <= 6,
>> +	igt_skip_on_f(!igt_get_output_max_bpc(data->output, &maximum),
>> +		      "Failed to read max bpc for %s\n", igt_output_name(data->output));
>> +
>> +	igt_skip_on_f(maximum <= 6,
>>   		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
>>   
>>   	igt_create_fb(data->drm_fd, data->width, data->height,
>> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
>> index 1742c7df4..dc71e903e 100644
>> --- a/tests/amdgpu/amd_dp_dsc.c
>> +++ b/tests/amdgpu/amd_dp_dsc.c
>> @@ -480,11 +480,19 @@ static void test_dsc_bpc(data_t *data)
>>   
>>   	/* Find max supported bpc */
>>   	for_each_crtc(&data->display, crtc) {
>> +		unsigned int maximum;
>> +
>>   		output = data->output[crtc->crtc_index];
>>   		if (!output || !igt_output_is_connected(output))
>>   			continue;
>>   		igt_info("Checking bpc support of conn %s\n", output->name);
>> -		max_supported_bpc[crtc->crtc_index] = igt_get_output_max_bpc(output);
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("Failed to read max bpc for conn %s\n", output->name);
>> +			max_supported_bpc[crtc->crtc_index] = 0;
>> +			continue;
>> +		}
>> +
>> +		max_supported_bpc[crtc->crtc_index] = maximum;
>>   	}
>>   
>>   	/* Setup all outputs */
>> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
>> index 3687e795d..056fd37ae 100644
>> --- a/tests/intel/kms_dsc.c
>> +++ b/tests/intel/kms_dsc.c
>> @@ -422,8 +422,11 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
>>   
>>   		for_each_connected_output(&data.display, output) {
>> +			unsigned int maximum;
>> +
>>   			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
>> -			    igt_get_output_max_bpc(output) >= MIN_DSC_BPC)
>> +			    igt_get_output_max_bpc(output, &maximum) &&
>> +			    maximum >= MIN_DSC_BPC)
>>   				data.valid_output[data.count++] = output;
>>   		}
>>   	}
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>> index 37706cab5..3adf14bd7 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -2281,6 +2281,8 @@ static void setup_drrs(void)
>>   
>>   static void setup_hdr(void)
>>   {
>> +	unsigned int maximum;
>> +
>>   	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>>   	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>>   	    !igt_output_supports_hdr(prim_mode_params.output)) {
>> @@ -2294,7 +2296,13 @@ static void setup_hdr(void)
>>   		return;
>>   	}
>>   
>> -	if (igt_get_output_max_bpc(prim_mode_params.output) < 10) {
>> +	if (!igt_get_output_max_bpc(prim_mode_params.output, &maximum)) {
>> +		igt_info("Can't test HDR: Failed to read max bpc for %s.\n",
>> +			 igt_output_name(prim_mode_params.output));
>> +		return;
>> +	}
>> +
>> +	if (maximum < 10) {
>>   		igt_info("Can't test HDR: %s doesn't support 10 bpc.\n", igt_output_name(prim_mode_params.output));
>>   		return;
>>   	}
>> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
>> index 24663444a..a50ac3a37 100644
>> --- a/tests/kms_color_helper.c
>> +++ b/tests/kms_color_helper.c
>> @@ -40,7 +40,10 @@ bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
>>   bool
>>   panel_supports_deep_color(igt_output_t *output)
>>   {
>> -	unsigned int maximum = igt_get_output_max_bpc(output);
>> +	unsigned int maximum;
>> +
>> +	if (!igt_get_output_max_bpc(output, &maximum))
>> +		return false;
>>   
>>   	igt_info("Max supported bit depth: %d\n", maximum);
>>   
>> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
>> index ca367db61..236e5c7c0 100644
>> --- a/tests/kms_dither.c
>> +++ b/tests/kms_dither.c
>> @@ -206,6 +206,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>>   
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>> +		unsigned int maximum;
>>   
>>   		if (!is_supported(output)) {
>>   			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
>> @@ -213,7 +214,13 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>>   			continue;
>>   		}
>>   
>> -		if (igt_get_output_max_bpc(output) < output_bpc) {
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("Output %s: Failed to read max bpc.\n",
>> +				 igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < output_bpc) {
>>   			igt_info("Output %s: Doesn't support %d-bpc.\n",
>>   				 igt_output_name(output), output_bpc);
>>   			continue;
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index c334c907a..9a9c8e197 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -254,6 +254,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>   
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>> +		unsigned int maximum;
>>   
>>   		if (!has_max_bpc(output)) {
>>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
>> @@ -261,7 +262,12 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>   			continue;
>>   		}
>>   
>> -		if (igt_get_output_max_bpc(output) < 10) {
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < 10) {
>>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>>   			continue;
>>   		}
>> @@ -535,6 +541,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>> +		unsigned int maximum;
>>   
>>   		/* To test HDR, 10 bpc is required, so we need to
>>   		 * set MAX_BPC property to 10bpc prior to setting
>> @@ -559,7 +566,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   			continue;
>>   		}
>>   
>> -		if (igt_get_output_max_bpc(output) < 10) {
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < 10) {
>>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>>   			continue;
>>   		}
>> -- 
>> 2.34.1
>>


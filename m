Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACFDC531C9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 07:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C9110E0F4;
	Sat, 25 Jul 2026 07:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ltVOEc+l";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012015.outbound.protection.outlook.com
 [40.107.200.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110BA10E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 07:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJQ7yV8CUNsPTfOZM5sdu4kIvwmWCOf7SwMBRtOvSMuuIWkr38RbkAHO+TycNMkDLvs7SHOEn6ePxDaFya/V687ixzr0QYsTbc092Uv159K4ztsTI2Mboy9nGSaO9saMuKQYTufP8H+Qjr5sZAAqHGJmw9qJN9YZ3s5nVRk9NEp8VuxS05njh1mIWMhSGjP2vKBIwibZaCLZPY2gpxYYUJbJOeoBwCLG558t47lXgVwgAfK6F4QSYAVHhdKmqepEDWdqby1ZSs7fQ8i9npuHuuAz4SQdUK2tYm1jkOT4xQdILqaIsXCVuQ2UhwJcxo7JZzRComOhM2HrP06ZlzGNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89dZtIX+IN/jETt84miWHKev/V1t3ZXWLXsloPjiBgA=;
 b=xcuNtV/fzuBcdjaElMnOmIYrWMJS1uecP9BpDvVhn27EfHCDtLQl81BUhlIcvKqhsQxB5MwvX2OC40elOtfC5Wl01+qmInTG57mVpGoytoDjgYGeyXruRmdGmTH8n0O1Ih4ZCGMJP+rXLCVpc8Jg3T0lF5MoGBybfl37AHtiIkTXY3VaJ/ttCvPjaFR1ZofjmqKm1Q5S09NZjxUpkLWdkVU0mh3qLnxhMkjn5NCuH+kue4Uw1Q9u/otpUjHNFlrOA1bRekbBDKJDmP1lujVq/UfeY2ocOIJ1+EX8il6X+uuKuWV6kqJQ3WphVZYXIxRc7lA+xbc9Gja3gbUk940qlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89dZtIX+IN/jETt84miWHKev/V1t3ZXWLXsloPjiBgA=;
 b=ltVOEc+lcNKZC6GLscYH6Dhs/I1T5/7uJDbEzqwwIw+KxZXL0XsCSaOaAF/aNDtJ9oQp27ceBovRVP6saPRpgBLfnpqZeoma81J6q5vFvkxHT2dd1B8tWk68tmeQShCRAjp8x0bI87cfgUKGUZ6FfgIZZD8mVMBTBPce5gmBiYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SAWPR12MB999166.namprd12.prod.outlook.com (2603:10b6:806:4e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 07:24:35 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 07:24:35 +0000
Message-ID: <645625a1-ce91-42ba-9689-5df9e50c3ed3@amd.com>
Date: Sat, 25 Jul 2026 01:24:33 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] tests/kms_colorop: Increase VKMS bracket to 3 up
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-13-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-13-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::14) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SAWPR12MB999166:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b2d4ef-3893-4358-3a3b-08deea1dc715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: q3/idbrt7/30q5t8jwhfuJIJvf4EgGrrZxM+iSj9Zccz4LhluRXqcVZ6+GYY5WwvmoD7rfA4iAI+ixesiNM/cguHrmsnUWu8Rt5U/Gd7alWLm8vRpLFKjWLZPFPrcP5ZZ56kjEEP/BQocN69vaHHl7Kfdk//1nmF7am0J3dV+J1Rw4kZnE13LnbavSmiVd1uTOXYkjPg4km5L0aKzgB4FWXt93mbGTeXGOT9/EdZwewBDmEB/zSgDcM1zAXMv22UceErzr23vIecKz/gxW3E23viwtEV+kKtV0LG/D6pe5uvDhrXGk/dTQY9RbnSkfV1d/nLO8qqsNz1V/PL89oBgpwAEJB776GohPsa5GcbZYaZkFwPmCnMvFxBM2gIVcu3NDn1gmt1ALPRwUc4eFsEsvPc4w4TuW1BByLttd9LjWJl9VLUmc515htES+MgRGll7wvIBa0nLVIvi4YAMoGI8Xazr+3upViRT+t2FLOjnxLdxX0iKz6kIADoRoq0UaO7XCPfSSeTJxxpQRVjs1zrNiOLoUBN6u3Y8NfjnK+NCvK3KWfmb5h1yHtzTXIf2+ZQBjfNtPXcCHYBvyY6PzCwfM6+/8Fq4uhLRYpm3jY4YNP1EfwnDCjsSGDMB78SMjSoGyFXB0YB7g7qOk97klgDEofHSn9mzl23NoLMiIf3UVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlpsVVhOdXB1R1dWNEkwMXRsZkFCdHJxYllIb3dJODA1VUgybEVHRnNhd0ly?=
 =?utf-8?B?R0tpOU04Zlk4dkVZYllhL0Q5MDJFTDBIQitYakpBM1N4bVpBSDREamNTdVpo?=
 =?utf-8?B?ME14RjhCeVhoK1Q2eTgxRXdaWXZYTFpQejFlZVdCb1pvdkRjK2VCaVpPeUd1?=
 =?utf-8?B?eHErTFE3WnZTM3l3MDRyeHRiN3FpcE0xZzNFVHdIb0dZZVBtUGNjM0JDSDJE?=
 =?utf-8?B?R2NOYVBYaTlWdGx2Zm5FeHdzeDVnVzRTS3NoNFlNc1p4RVVFY09kdS9LcCtF?=
 =?utf-8?B?WnFtNzdzOCtrZ2hldVZJcUY5Z0hQemJsM3dmeWNnSVk0Z3FBNnFyK1FzQnhw?=
 =?utf-8?B?R0lnVHdGWFhpaUNjaVVKRDl6TFYwTSs4amNJLzdTMUpuK2hoNEtoL0RPOTlv?=
 =?utf-8?B?UEw1akM0aW1CWlcwTzZhUGloVEs4WmR6bjNkTVkya1JuZDBzb2xwOVYwT294?=
 =?utf-8?B?c1pYWTBvay9yeUZtZkQ1TVJFNkYvbkJOZjRNUDlKWnpIZ1RJR0ZjeUJrdzhM?=
 =?utf-8?B?cEFnMWNQTmJHUUlOTE4wOThXQzM0a0xPWFdZR1VXZUZ5Z3FvTGRhS2czZ3Bk?=
 =?utf-8?B?Q3FoblB6cGV1aGpXZG82NllUZy9jSHFPazlsVzdNcDZJb3Blb0NOcG1Dbndj?=
 =?utf-8?B?aTM2YnBSRlo0WVhWRDI4SFhNQ3Naa3hLR3lWejNENzk3UThMU3l5QXJQT0Uv?=
 =?utf-8?B?OHZQaTJBQzUzeHFzU3lwZ3UrTEQ0Y2ZNd01VeEVJZlBObmJ2Ly80akdrVTBn?=
 =?utf-8?B?VU1NaDNKQ2t4QjZFbnIwdnA5TzJYYWdSOFhndWlEWDh0Nzh4eDVjTmt5SFRI?=
 =?utf-8?B?SGc1dGZ0Y1dKR1VNRnNBVUwxWi9ZQmtuMzZrYVFESkdCc1dFcngyRFhEcWpu?=
 =?utf-8?B?eGhUa0FjV2IxMmhqZ1BZZHJKKzd3Qjg4SU55N2p3QnhveGsyeWtLdGx3WDVa?=
 =?utf-8?B?YXJpakprNlRBdlc3RjM5Q2NFMHpTLythalBTYUdzcHJrTzhvMHBzL3lRbjY0?=
 =?utf-8?B?RGtqNTdwdmhFSEFZeE91dVYvbmgrMzhlTS8zREZkOUhUNEZmOGZjQnQxY0JT?=
 =?utf-8?B?WDRMV1Ava3REVG1EWTZLUUh5TGpEYkY4WEFwTkUxWldHNVViR3ZjT21GbEp3?=
 =?utf-8?B?LzAzZFgyOGpvUFVaeTJJaVBrYmZZeFhCWk9TOWw2MHpreURIRS9nY3NkRmU1?=
 =?utf-8?B?YVgrcG9Ha2VoenNGdEpHQlNDNmFiRmdRSlEwN2JyUGJkUEFTYk9IVDgrQlZJ?=
 =?utf-8?B?bUhjRmtwbEtPZVNTZGtaTEptVDN5ZnNWRHpZK0YyaEJGc1VWRTIwRkN5K2wr?=
 =?utf-8?B?eC9IYTRwOC9tKzZoRXZ1eGpYRm5uWmI3NEhpeGdQUjRINzUyVjVlOURHZ0pS?=
 =?utf-8?B?ZXNWaHZ4TnRvL012NXl0WmMvb3Vhc0gwMUFXOFdMQTFZVXZHaFhuN2RmbzZE?=
 =?utf-8?B?TC9vaG54Y21sMzQvQUN0cFFrdlgwYy8vM0VxN3R3UEhmb3U1ZXl4Y2VsQ09n?=
 =?utf-8?B?SlFlVjFEQnBuYTdhdDVKZmpFMDYxZWVWZnFaUFBNKzd0eUxqTlkyT3lZUjBL?=
 =?utf-8?B?N1JwWUt5MTY3cVVWN2thNjVmWEhUUzdTMmNaRHlMUk1aQloxRkhkSmgvbXdl?=
 =?utf-8?B?K3BVSFQzMk5zdElVZmhnb3A1alNjd2JKSXZsV0Qvc3U4eFJ5K2pVT2VOTDZl?=
 =?utf-8?B?TExXMXA3YXlXcFRDcWlycWVMMERNNXoxOHg2bjJWZUN1dWRjcGNhNytRS1I0?=
 =?utf-8?B?emVwOGVUTUFLUEF5QjJreSt3U0ltZXhWR1B6SXN2MTBCemh6RG9wYzE3L3Nz?=
 =?utf-8?B?MmdSQml1Y1gyYk9CendkUFlWTGkvQ0RuTnpXY29GVjNWYmhFOHRaUlBMb3lG?=
 =?utf-8?B?SlJTZVNPL2QvZE1Ic2dGN0orV1hPTUxVc0NlS3FiSXBaZVcrcDVrU3pnMjlC?=
 =?utf-8?B?dktQenIrUTFIVHlEd0hvUlI3UFIyanNRSCtPTjB1ZEQvSU50OUN6N1hZNFd5?=
 =?utf-8?B?UjREajNRVUxCbTlDdG1wajFDbzJ4Ry9QbXJ5aW5EMTR3dkk3aXhNa1ptTTc5?=
 =?utf-8?B?eWlWZXgvalJZUlFWdkZhMGNPZmhiM1NINWZrWEFJOUJIT1dsbTlLeFFjOTly?=
 =?utf-8?B?TlY5YkRac3NtNXFKOGN3TmJRSnFsOEVrcCtBR3hLL0RuaS9UVjhXNXQ0U3N1?=
 =?utf-8?B?SkVSbElibUtGK3c0LzJTQzNxbE04RGh5d2N2L3RQbUJiUHFDWjQ2OGtKWnFm?=
 =?utf-8?B?MEU4bjh3QnJkbmtoU2ZtYUFhL21EQ2NCMExhVnYyUFp2SG5aNGhSeWpJUTZ0?=
 =?utf-8?Q?PNfrnQXzJblC0Tw4Im?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b2d4ef-3893-4358-3a3b-08deea1dc715
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 07:24:34.9499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uO80m8b2JXHDLxlknkl9X/+IxgrAhyFi683WNojaafkdXE7vz+x0mPOGbbpR8w+qZpn7X025z91aMvgFXa0IaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999166
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

On 6/23/26 11:57, Harry Wentland wrote:
> The delta is a bit wider for tests of the CSC with other colorops.
> 
> Increase it to 3, which is still pretty tight.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   tests/kms_colorop.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index a2784243c0f5..393c66de51ed 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -234,7 +234,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
>   {
>   	/* Each driver is expected to have its own bracket, i.e., by trial and error */
>   	if (is_vkms_device(in->fd))
> -		return igt_cmp_fb_pixels(in, out, 1, 1);
> +		return igt_cmp_fb_pixels(in, out, 3, 1);
>   
>   	if (is_amdgpu_device(in->fd))
>   		return igt_cmp_fb_pixels(in, out, 13, 13);


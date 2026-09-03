Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2247C624D7
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 20:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F78210E538;
	Thu,  3 Sep 2026 20:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DfIPyMEP";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A57B10F77A
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 20:51:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2CKsVRB6gjv4CqtTe23AeeqAbmwY3bblPPSDyZN1wLCIrJwq50XQWjVZFObYL5CNl45rvbna7l1O2RShbaNjUfOiXvoqIByxdksIPkrTX8Mks4LWgnUKdcDeweECQCxVEVukTo6x62s/EeIOW0JMoCJRnrf7/LcDUVeV/b6fv6wYlUtK78yk6nTrVzNqh/Xg6TGTxEWXhUw6/gaz0sJAJ0bBUAnuqLJWXnObN31qLGkXszKgvCALynnfPuBzf3ZfitczU2RchzEwXPuvaNmBoQqHiFR2Ad4mK7WMRwk2nHPacWafCzJ25K2YufV3fCJNW+Xo2UMhcneCYFIH7npMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dB6y73KOGFJYmYIfYoOdU6H4gFvu25mvcELclrheGrw=;
 b=SpYSK9cW3jHIicBTcatx4tj8bHVOjyr9dwlC4GnjxicZ43OUtd/1CP6bZh492IMRNbeEKibR6ZNcqJvDg4e6M27FxntFgfUxd5GFzdpvI5K6y2a+MUvNI9jYN7oss9gZegPGw6usqAi4LpvTdRfLDZZMBck7cw4gnyfdP77XHIUZ52X7sLGqksSr+7xxnn9vJpK3bus8jIso9OtZehh91GgLGLZyzu1smc0MzpGSqrLeMCQ5Idd+rXoojAxp9MvXrYIxlnyCnMzkMUqOuGJh44hTwS5Z9SKRHbHfWlCmwk7rRG+y12ElVivdhrGYplCJrvUk1Vg7FSxCgp1eftMRvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dB6y73KOGFJYmYIfYoOdU6H4gFvu25mvcELclrheGrw=;
 b=DfIPyMEPWJcaIbcOIq5mIC9uIhxu0wCUWSRN7R1l4OjSJqpNUS5bgafGUb7ONZps74dlTy7IYsyhY9/TDtmDp3Pw7T00H0qryn/vK4VeGjh/vn/SoNlfY/69Evuq1PiMiQrFkwp0bn0VhqFxda78OloTa2RQXIqGiGuGo0/L3BA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 20:51:07 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 20:51:07 +0000
Message-ID: <b43aae06-2a34-419b-a7cc-9f377050014c@amd.com>
Date: Thu, 3 Sep 2026 14:51:04 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2 2/2] tests/amdgpu/amd_dp_dsc: Reset link settings after
 subtest
To: George Zhang <george.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20260903192458.1149302-1-george.zhang@amd.com>
 <20260903192458.1149302-2-george.zhang@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260903192458.1149302-2-george.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:303:b9::16) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ef4e46-8ea7-4731-6e07-08df09fd1376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|3023799007|10067099003|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SQ1Iw2NjDEIeqgQq8xBSagcmJwqMau17pks9wJcOZTY2SvTl6cjWCeNVkctHmWTy45kq8K4Kk5kPZY2PI4T8IdBkfkRjsRifN4ZtYH4byO8UhtIvp3VGFKfQV04mF/9CrA+WQTTqpx5lGcpIzrvFJSkcHTMH8fQvpnLZlI44MO5+Xym1gjxnzpcdfHUVygS32YyXD2LNnCuaFFBXtMyA5zZIbsxgOK6BAQmtXETwzq4QWRIRhe93kRjtIt81vQeu3WyWrQzsH3y8JElMDL0KaPqJZpEAEcinAFQtrhuFuAAk4+oaEY/Cy2Iv/JNthL/Ohh3yoc1afwv08xUHMvLAv4GOqw/YCyDEMQEYxl3fykQewjJMXfxC7wrtG9np68p7/WTj3U1p3iwMXwOHBAysAGWTkPgu1Qzt+lroQpwZhZftKXiD7fdLZILYtaEVsw3MLHtdtFGGYiwGmC5b4dni78S93300YW0LELLvrSbrWehu6Rwp6q+MEJQYI+R8P4FYTl7GTZYae3sJvwqJAYB2tHmjBGEvJXgCo/SCTHxoIVmWf/uqi4obgBg3pOqdYH3PWW4+lC5k0CiRYGz+JxgkCV8KkMfBRWp2zTQ9MZry7KS6raTAW6pBShYrwasf5Pbat+jcuHbVFDJErh6ewAUTA4D7A3yVrhQX34o8Q5UYgM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(3023799007)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEJ2SE8xcDRMQzQxbzlDQUVFMVhhZFZFbGNWRWp4M0RoUDR2ZnpWM0xlaWdj?=
 =?utf-8?B?aVYxUEZHS09XaVBOL1IwZFZtOEk0R0tHb3NEbTcwYzVlNDFBajdaZElQWWhW?=
 =?utf-8?B?Mm4rcGlaN0YrYmtwWnFxMW1UM2N2ODh6UGU0eWxSYVZVQjRSdCt1RkRwMzA4?=
 =?utf-8?B?SG4zSDl6bTltQ2RTT3o0Nlk3TklTaTV0Z2N6SXUyTWptaisrT1Z0UmVMcTBj?=
 =?utf-8?B?S25oY2NxblVMSC96aTNuUVFRek5xcjlnTXpRU3U2UFhDcWVoWldKSm5FaVB1?=
 =?utf-8?B?bHBIYXpKZ1JMT3BZNFg0VVcwY2RIVXBlMFU0cE80QzQyV1ZLenlQdnFLQzdC?=
 =?utf-8?B?ZEpSbGRwYkR2czJhRFNHZ1JBL0d4VnZyM3l6UTJkR0dtOE5GWW5tREF6TDZU?=
 =?utf-8?B?SlVQT0pua3ZvdDlFUWI3d1N0OXlGa0dGN1ljWElpTGo5cEJkQlArUEVrOUVR?=
 =?utf-8?B?MUovUWNtc2VLaGFxQk9kZmtPYVNWZ1hBV3c2R1p0RWxTMlRNdW5xem9uei9D?=
 =?utf-8?B?Vks2RUU0cUVkekppVVBJeUdQczJnMWFBS2dvUExGN0tTWDNBaXYwd2FhK0F6?=
 =?utf-8?B?K0VjQ1lVNzBNdmk1VkVFbmczZFdjWkQrTWhTeVhWSlEwWmU4UnBRMERoSnJY?=
 =?utf-8?B?dUVpdTk3cFY2elRTYmtXa1FlYzgvRFQrNGVBZHMvdVY2MzdnYmRXRjlhdGRk?=
 =?utf-8?B?NExKa1dTYU5pQWZkNkxNZWdubFlTUG4ybVRkbnY2eW1iVzV0bW5UaW1sSitE?=
 =?utf-8?B?cnZEa1Rodnh4RUEva3JTZDdjVVppUGk1UE5zdGhNN1VkbHd6L2ZNRFFDWFRm?=
 =?utf-8?B?ekI3UEEyU3FjYmhRMEtGNFJvcHlzdVVGUFBROXBQM3d2T2w1QS8rN3pLbzhI?=
 =?utf-8?B?S2JSMERoU0NnQ2RybVhmZEdWRWgrWjRvZGFuN0gxWll3NmRTRS9LQVI2RkJ0?=
 =?utf-8?B?Sk5nbll0dUpTanRWcWI1TTNSYlZKLzM3N1QxSVFBdVphRlR5VUU5U2JSdGhn?=
 =?utf-8?B?eERUSHZpYzdxK3l0NHI5ZGtJRFZUSTBYMHE2Yk4xc3p1V2FLMG1DSktaYVFq?=
 =?utf-8?B?dCtaOTNwRXQ0WXBrOG5xQzdsYjFESW41SFp2NUNJb04rVnlIcU4wSmttNDlJ?=
 =?utf-8?B?NlZNdFVEMjkxOW1jZDdKZ1dHY3k0M1U0K3o3WVRrU1Z5eUhqM1dkc3Q3VEZm?=
 =?utf-8?B?V1RqRnpKYW1CTi9aOVJlU0JVcVRIVDBML0RZb010N0s4L09uRXV4aXphazlr?=
 =?utf-8?B?V0hTWFYwK2M2Z1hUY1g5NENTaHljd0NzWUNYM3R5bk1nRTU4cElWL05nYlFQ?=
 =?utf-8?B?VnYwb2h4bzlYTEpoWTNzK2twWDFBQm5xSDJlKzd1aVNKanl5Qm5JS1NLaUJI?=
 =?utf-8?B?YWJVdjJtRzhMVUFLVXdlL2I1SS8rM2J5clU0VVZEWUtsVXhUanhjRzQ0OHVT?=
 =?utf-8?B?amhaS0JCbTljdEYyWHY4bEg3NVBKN09TanhpM3UvbzVGOFFnMkZXQVhIN3ZB?=
 =?utf-8?B?NG92bXJKWnZTN2R4UDljckFqOVo4enVHZCt4eHMzcE9ub2pVeEt6M2RKTlND?=
 =?utf-8?B?SkxjZVNjQzQrWm9kOWhPZkxqakNZdXNPMmRRa29qSjN4WHI0MEFralA5Mkpj?=
 =?utf-8?B?YlMyMXhja3MwaVBZWUQzQ2M5bSsyMlYwOUkrYi9TYk9pSCt0R0lQOUxVV1lm?=
 =?utf-8?B?cjk2a05DQnc5VnA2T1U1c1ZwUnNyQnpyNjMxRFM5QVVLZzkwemlGeGx3ak4x?=
 =?utf-8?B?VjVEU0FCOGMrQVBWWDZEbFQ4aHpSTTQrV2F0c2FIY015bHJZS2VOeXBmUExm?=
 =?utf-8?B?WDUrR0ViNUpkN0puWEhKUHlhd3MwMG1EMEhGZ0ZvemhCeDlCb1pLNzFYblA5?=
 =?utf-8?B?a1huV2ZKNGJGYXNIMk5xUEMvU2I2NlJkdEJTU3RuemRpWVRBNXJSY0ZIVFJX?=
 =?utf-8?B?bWt0TmpmcFdzRmErVzhZUjhGMDdYMUJ6elJ0RFlSakJQTHpaMmZmMVA4TVY0?=
 =?utf-8?B?YXd4dW1DWDg4WDBCb2NkMzc5NCtKdFJUVHNTcWlNUWQrSno1RHA1ZmJVV2dn?=
 =?utf-8?B?NHpNY0tqWnNuSnc4NGNzZ1dCcmlrbmJlMTd1dkhhRVRGcFBsbHJNOGhGMW9l?=
 =?utf-8?B?b2U5TmcwUTNEL2l5aXR3Q1FjR01mSXYvaU1mUFR0RGZmWGdxRUwxY2l4L2wx?=
 =?utf-8?B?d1oxZDJFdGdma0IyNHFiSVpNZm5mTC9jZ0Y5ZUM4SXVRYngwVTQ0THAwKzl3?=
 =?utf-8?B?ek1RS0s5UGw2YVdObUxGMmVseEFEaG10RVNsZlp4bHpyeXVzeUZteFN4TXhC?=
 =?utf-8?Q?dbXEuXo7++PpkDIwH+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ef4e46-8ea7-4731-6e07-08df09fd1376
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 20:51:06.9966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwVkTC0qKDQwpJDuLKyauR3111cWtQE3svQHdMDWNwkq478vVnBuc3gryfiTPB7FCGclYolIpFD3ja/BaAXHOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042
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

On 9/3/26 13:24, George Zhang wrote:
> Currently, the link settings persist after the link settings subtest,
> and can retain a lowered link rate/lane count going into subsequent subtests.
> 
> Fix it by resetting the link settings on an igt_fixture after running
> the dsc_link_settings subtest. We can do so by setting it to lane count
> and link rate unknown and letting the driver set it to the default values.
> 
> Signed-off-by: George Zhang <george.zhang@amd.com>
> ---
>   tests/amdgpu/amd_dp_dsc.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index 690a6c39d..6c8e76e00 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -356,6 +356,23 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>   	igt_skip_on(test_conn_cnt == 0);
>   }
>   
> +static void reset_link_settings(data_t *data)
> +{
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +
> +	for_each_crtc(&data->display, crtc) {
> +		output = data->output[crtc->crtc_index];
> +		if (!output || !igt_output_is_connected(output) ||
> +			!is_dsc_capable(&data->mode[crtc->crtc_index]))
> +			continue;
> +
> +		igt_amd_write_link_settings(data->fd, output->name,
> +					    LANE_COUNT_UNKNOWN, LINK_RATE_UNKNOWN,
> +					    LINK_TRAINING_DEFAULT);
> +	}
> +}
> +
>   static void test_dsc_link_settings(data_t *data)
>   {
>   	igt_output_t *output;
> @@ -609,6 +626,9 @@ int igt_main() {
>   	igt_subtest("dsc-link-settings")
>   	    test_dsc_link_settings(&data);
>   
> +	igt_fixture()
> +		reset_link_settings(&data);
> +
>   	igt_describe("Tests different bpc settings and logs if DSC is enabled/disabled");
>   	igt_subtest("dsc-bpc")
>   	    test_dsc_bpc(&data);


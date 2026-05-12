Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B29CD343F
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 19:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEB210E2BA;
	Tue, 12 May 2026 19:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GtFzvItD";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2175C10E2BA
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 19:37:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScTi4A+E2bJCsNQh7IEKxAy1cAJtd0yLC9lzZp8acpd1vOTQmL+xbsmjY4O2xa3Gd3JSxrQCHvUJHbUJ6iHqbmh+P9L1UMMtAZSceOC16uGlGt4czGexyenQwQBNG2FRRuJFQlLCn8LAYg9SovjzDpr3gOLxQoLe/IWfp0n2NLgPkvDhp8/ufL9xPhLO02XEEIdDqgtkelBYZs6DsY4BpdOBOGDMxMeKI729YbzRjSpSwN2Hg1XcGWKAIdKdtUgnVFL7qO949riqlDhjyjcUWjj/YsJGgIEIsOra/H7jLEFuFCsNsE8Yx3yGTDKyQe62IMtl57uCaI/emYvRGeposA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6Pg/+2NRhhQMmvUE/AVJz1ilIWLYU4lbn+bYzMzxXk=;
 b=dWHHX05Jz73dnHERuGUjnP8Y5nCUdiaLoZ9l13Q3DhtsNFVQi10YgsXhvnrG/vhSzqtKIdxcTOa7pu9SNAZ2lD1aaAw24n30fvQxz5fy55z/JPtgNmqrR8OM3pIlNaNS1Wy5QF6mp5TaGh/PPJQ87OIegUrnVqwihspOK8eXrOJ8YSQkkqtI+Gg982h2y4eWPsO9CohlbI4r6Xlje8QW+v8e2comaCDXG0RI42jE4SED2TszEqSKu6RsfL33f9c5teWG2Go2HgSrOAyOk/8BNfaedXyrwilEhwsuq60o2gOtoLB4/8lmWxoGQHTbbb1sYxKQmb3L6sGuTWgrF0kQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6Pg/+2NRhhQMmvUE/AVJz1ilIWLYU4lbn+bYzMzxXk=;
 b=GtFzvItDzU68tXXC5/UWX1rai/tIuJLaJQiLl3gCmxJ980Bj3FmVMz0KcaN9B2lQPUDGNpv4GDxpT18sO0ag1ywzd968mV7mb6iZOIZ8rZ3d+Ym684QJjEWaXssN10x71KqvLl7g889ORJjwHHrLJlhOKCxy9IS18QoLSPwKiwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB8074.namprd12.prod.outlook.com (2603:10b6:610:12b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 19:37:04 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 19:37:01 +0000
Message-ID: <44692a5a-4f27-4e78-adaf-03dcece28604@amd.com>
Date: Tue, 12 May 2026 13:36:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t][V3] tests/kms_hdr: Add visual HDR verification
 subtests
To: "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Mark.Broadworth@amd.com, vitaly.prosyak@amd.com,
 kamil.konieczny@linux.intel.com, jani.nikula@intel.com,
 Wayne Lin <wayne.lin@amd.com>
References: <20260507211330.2640022-1-alex.hung@amd.com>
 <a6ed9e4f-96f5-4aaa-8a46-659677ab0deb@amd.com>
 <7225a744-f1e0-4060-a7ed-d11a38adeab9@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <7225a744-f1e0-4060-a7ed-d11a38adeab9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0305.namprd04.prod.outlook.com
 (2603:10b6:303:82::10) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 7843ef0e-06e9-4d74-7b46-08deb05dd6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: f3I+E215Byu/vtdtDlqfUIGtI8FQx4fHAV24/al72T3wV8Vl0SBkvaRF3XjWG6coGEFTK/HWTD+KgyZP4Wivn9pYUK2rXob0+pIQQJENAfqWVOoWZyLFqM+jTArQT4WAGEeK7HPhGgpdXkR8RAFxAKQg6OtpSaH0W9K+ZERckVBuGJpmjX5VaGnPudvk2wbx+2RSh4mc18EWogW6T6DX6MQbbHy6g99PUWoWiosZ0eXHoHqYSex8UnWnvlmRxdmG1RXMYAjDzq7c3wOo5zlXmbR36lEQ5K0oEonwOz4dFGUtUxCAH1CdnUrJCZh47cYMdpJCA00ghBb25mlX9oG/HSIiiyjdptNArB8eejdW8wpI/2zyGLVy9K6llKmvI6IYhcyoAe//GCKClEwPaBYWzzX6qkO6ewYleyZS9KXN0Vd6tTiph6Ukj7NP/n79Bd8G1hVLQ9VJugz7V0ewWeBNsNPj7VnF5narBB3tfPBeNwnA8XOObHKbGTOYwPs0qTrTGougyutQ7DiLzb/CMJzGn3l/HiKA++9IbtxNbkDhdE60jEd9uIBLzHWILe+BAMFFr0iPR7/tdEimxydGNOcdC74Ee87o0G5wiX1/hWGvbKLlREjiJNkgHDnZKEbfDVdKwYi8r7UAVNjr+MnA45ael7Zamv9AUkzDoqR1PL+K2neE/46kJa8Nb5JwANEyRT5M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(3023799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEZCYVgyOFdUeVpPSy9NYkdRZVZzOG81TVlvRVMwNityd3FFNVkxMW9DSXQw?=
 =?utf-8?B?anE3Z2xieUhhWFdOTFJMcGYrTGFINGNhTUkvK3E3aXhFWGJkRTZwcVdpKy9K?=
 =?utf-8?B?WFR5c2E5OXZKTXpLNmFuQmQyRlpnbkdQbjlBeUJYak9YYUM4aDhrWjU0OXdu?=
 =?utf-8?B?LzBneElVVVl3bWtGdHpoa3dibm5ySXErMWFmSWtYcWgwNTBiQUZzdTVXMWhH?=
 =?utf-8?B?SngrMDNRTmxZVldibGIzeHA2RjZHRUJkbHF2OElCaHJUL3hjNHNIVDJwUlFx?=
 =?utf-8?B?bmYzaW9qT0Z5Ni9PUXNtTGFtemtlRi9PMFRKd2F5S1ppaXYzMXJ1SVNqeTlX?=
 =?utf-8?B?SEFJQmNQTjVnT3ErU25mRC80dldoVFZwRDZkdEhxMEhWTEVnYVltLy9VVEpo?=
 =?utf-8?B?N0o0aUxnZjF3Qk1xTTNCTlQ3SmRzZlMvMTVLOEdTaEtvUmk3d1lUd0tsdUIw?=
 =?utf-8?B?NkY5MzRvUFJBNXpoRGhCdlQ5L0lDNWZDZXJFSTJPaDBtMFRHODk2UVFFTzZq?=
 =?utf-8?B?dUU4K3pnam5ldTF0WFF5UjRRZ1hOaDRsQlJ5Sm5lbnl4cXIwbFpTSVlLZUxh?=
 =?utf-8?B?cXdrYWo5eXpzekorWHZLOGhsSlM0MmlzSklZdTZuZ2w4cEozeGxvdUcxT2xu?=
 =?utf-8?B?eHBPUGgvK2Eramx2S0VzbzAxRDIyM2t1ZE1KNUJ3anc5anFqNnAyeDc5SjRP?=
 =?utf-8?B?TG4yY2NhTDJwcTc0VFZHQm1lZHM0UG0vcTkwNjE2VEdZRUQxdktwNnc2Nmd2?=
 =?utf-8?B?SVhzbmRwd2JONHBId0RkdXFLUldQWHk4RHJGMm13dzRwRmxiaUt4SXVUYjBl?=
 =?utf-8?B?NEcxNnkxRlZNaEJQcU9rV29Qc2R0RjE4MWNDc2lseDJBUXRnS3dCdEI0cnNv?=
 =?utf-8?B?c21tenFTS29tMDF4aGpsZUovWlNlMHNEMlJMaVJBNVliQ3ErUGZOVWNtbVVz?=
 =?utf-8?B?TERjbUxoNlJHcklpSkpzV3FnV29zZjRGNGZxeXRWeFZsS0FPNExwanNvTmdW?=
 =?utf-8?B?RGtoOWppNzlsOFhsQkhmK2FVYk5acGREZnZTbklVdXV1VnJsdzgxZGxlV284?=
 =?utf-8?B?ZTFReEFTdmx1WTJXZkRZQ1FGV0RISFpwcXVzdGpPWXhCVjJqMWFxMmVFU1E3?=
 =?utf-8?B?dkxiclBSR1FoQUFMSXg1SjBMUjRGTlBaMlg4SWYybXg5RW1yTGZYTXJiQTY4?=
 =?utf-8?B?Vk1PNDUxZk9ZNjJrSElDaG9hRUFMZXV1YjVFUVk4S0JVNEF2QWROd1AwU2gw?=
 =?utf-8?B?WjR2bWZIR3RYcjRhREU3RmJEMnIrem1tR2NsVTlCMHpLb3h1dFZoRStoMENV?=
 =?utf-8?B?N3JwMytadHo3VllSNEZiUUJaUFR6anQ2Q2FyS1Y2VTluUk42OGhKVWh6bHZ2?=
 =?utf-8?B?bmZ5RzBJWGxXdUNQUTdNZGZrNlFhTThXaFhQTTR1NVBFODJtTGkvMzByU0hl?=
 =?utf-8?B?SDg5bVlKU3FmM2lYdy9PWmZ5Wmw5OS9VVGxEUHZrMWxReXFBdFBNY3pKNmh0?=
 =?utf-8?B?ZFRYSG91ZG9lVXRNM1pUSi9rSlJUbzFDWUtaSUMyeW1wY0tLZkR6eXMrWlNk?=
 =?utf-8?B?SXkyUnZ1MW4weTF4QW9raStsbzV1dFpGNFBUMWpJY0ljRVZlMW1kRDhkVWwr?=
 =?utf-8?B?NjNTKysxOXZDOUxOR0N3T3RLQzdlczg1VGl6WEJpc0tMN2pLNlQ2d2VrSlF2?=
 =?utf-8?B?Z2U1bkVUTEd5Vks1dlVGT2VCSTZCSWZZTVV6c1Ezb2lqWjVZOUdkWHpVU0JW?=
 =?utf-8?B?YVlXMmk1ekg4VTVqVUY2S2ZZV0NSN3QyQU1WVGtpa1M4RzBhdWFIOHUxbVpn?=
 =?utf-8?B?SG9Wanh5cWpXOHlqbTUvYTVsYzN5MGY0dTJpbHh6V0did2JoSDFkZ0xJb3hR?=
 =?utf-8?B?b3V1SmpBaUlLWnZzRFFMbEJINzl2eU03dTd3VStlZzduQzVlNkVxcTJUb3l5?=
 =?utf-8?B?VGV0M3lqOHF1NjdXRmk4QmZpTE1TSEtqSzA4U2F4TElZTkxrMmtnaWxLTENi?=
 =?utf-8?B?MVViN1ZpdU5DRWtURTRMVkxQbmxzck5uUCtYU1BlUzd0NzN4Zkd1MXkvM1Rn?=
 =?utf-8?B?RGExZ2RmK1VGQ2k3cU1Na1ZXSW0yemRwNUtsOFd3dWh2amtKamdpeDhrVnds?=
 =?utf-8?B?NlRwZENaR0tLSUtFOGc3bVdIZUVJVnB5clNhVTI0K2hSNWRHSmlSalB4WmdU?=
 =?utf-8?B?VkluSDN2YkIvbWtWVHQxV2pMU0xmajZDZWJHaTN1QWc1cTFEd0gyYWNVMzcy?=
 =?utf-8?B?bFpkZUE5bWdBdUNISGl4MkJUTXk4bXAxWS9EemZaeUtIdm9vcjd3ODlHNFUw?=
 =?utf-8?Q?O+A/Z5imOoHqz/icEB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7843ef0e-06e9-4d74-7b46-08deb05dd6d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:37:01.8432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KniSjJf4w/5NkntEYC2nS1c+b3j0z5ynnym7wp9iHSx2Y0+kjFNerBo6VhKIyPbXa7VO72XTO0J15MEgmaTHqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8074
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



On 5/12/26 13:18, Sharma, Swati2 wrote:
> Hi Alex,
> 
> On 12-05-2026 06:06 am, Alex Hung wrote:
>> Hi,
>>
>> Does anyone have any concerns if I merge this patch?
>>
>> On 5/7/26 15:13, Alex Hung wrote:
>>> From: Wayne Lin <wayne.lin@amd.com>
>>>
>>> The new subtests display an HDR test pattern under a given metadata
>>> mode and pause for user confirmation, enabling manual inspection of
>>> HDR output quality on a connected HDR panel.
>>>
>>> New subtests:
>>> kms_hdr --run-subtest static-swap-smpte2084 --interactive- 
>>> debug=smpte2084
>>> kms_hdr --run-subtest static-swap-traditional-sdr --interactive- 
>>> debug=traditional-sdr
>>>
>>> Co-developed-by: Alex Hung <alex.hung@amd.com>
>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Is Co-developed redundant?

Thanks for catching this.

>>> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
>>> Assisted-by: Copilot:Claude-Sonnet-4.6
>>> ---
>>>   tests/kms_hdr.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 89 insertions(+)
>>>
>>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>>> index 876c1c03a..c13e985e1 100644
>>> --- a/tests/kms_hdr.c
>>> +++ b/tests/kms_hdr.c
>>> @@ -67,6 +67,14 @@
>>>    *
>>>    * @swap:                    swapping static HDR metadata
>>>    * @toggle:                  entering and exiting HDR mode
>>> + *
>>> + * SUBTEST: static-swap-smpte2084
>>> + * Description: Show a visual HDR pattern with SMPTE ST 2084 
>>> metadata and
>>> + * require user confirmation.
>>> + *
>>> + * SUBTEST: static-swap-traditional-sdr
>>> + * Description: Show a visual HDR pattern with traditional SDR gamma 
>>> metadata
>>> + * and require user confirmation.
>>>    */
>>>
>>>   IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>>> @@ -647,6 +655,79 @@ static void test_hdr(data_t *data, uint32_t flags)
>>>       }
>>>   }
>>>
>>> +static void test_hdr_visual(data_t *data,
>>> +                 void (*fill_metadata)(struct hdr_output_metadata *),
>>> +                 const char *mode_name) +{
>>> +    igt_display_t *display = &data->display;
>>> +    igt_output_t *output;
>>> +    igt_fb_t afb;
>>> +    int afb_id;
>>> +    bool found = false;
>>> +    struct hdr_output_metadata hdr;
>>> +
>>> +    igt_display_reset(display);
>>> +
>>> +    for_each_connected_output(display, output) {
>>> +        igt_crtc_t *crtc;
>>> +
>>> +        if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
>>> +            igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or 
>>> IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
>>> +                 igt_output_name(output));
>>> +            continue;
>>> +        }
>>> +
>>> +        if (!igt_is_panel_hdr(data->fd, output)) {
>>> +            igt_info("Panel attached via %s connector is non-HDR\n", 
>>> igt_output_name(output));
>>> +            continue;
>>> +        }
>>> +
>>> +        if (igt_get_output_max_bpc(output) < 10) {
>>> +            igt_info("%s: Doesn't support 10 bpc.\n", 
>>> igt_output_name(output));
>>> +            continue;
>>> +        }
>>> +
>>> +        for_each_crtc(display, crtc) {
>>> +            igt_output_set_crtc(output, crtc);
>>> +            if (!igt_crtc_connector_valid(crtc, output))
>>> +                continue;
>>> +
>>> +            prepare_test(data, output, crtc);
>>> +
>>> +            afb_id = igt_create_fb(data->fd, 512, 512,
>>> +                           DRM_FORMAT_XRGB2101010,
>>> +                           DRM_FORMAT_MOD_LINEAR, &afb);
>>> +            igt_assert(afb_id);
>>> +
>>> +            draw_hdr_pattern(&afb);
>>> +
>>> +            igt_plane_set_fb(data->primary, &afb);
>>> +            igt_plane_set_size(data->primary, data->w, data->h);
>>> +            fill_metadata(&hdr);
>>> +            igt_hdr_set_metadata(data->output, &hdr);
>>> +            igt_output_set_prop_value(data->output, 
>>> IGT_CONNECTOR_MAX_BPC, 10);
>>> +            igt_display_commit_atomic(display,
>>> +                          DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> +                          NULL);
>>> +
>>> +            igt_info("Displaying %s HDR pattern. Press a key to 
>>> continue.\n", mode_name);
>>> +            igt_debug_wait_for_keypress(mode_name);
>>> +
>>> +            igt_hdr_set_metadata(data->output, NULL);
>>> +            igt_output_set_prop_value(data->output, 
>>> IGT_CONNECTOR_MAX_BPC, 8);
>>> +            igt_display_commit_atomic(display, 
>>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>> +
>>> +            test_fini(data);
>>> +            igt_remove_fb(data->fd, &afb);
>>> +
>>> +            found = true;
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    igt_require_f(found, "No HDR-capable connector found.\n");
>>> +}
>>> +
>>>   int igt_main()
>>>   {
>>>       data_t data = {};
>>> @@ -698,6 +779,14 @@ int igt_main()
>>>       igt_subtest_with_dynamic("invalid-hdr")
>>>           test_hdr(&data, TEST_INVALID_HDR);
>>>
>>> +    igt_describe("Show HDR pattern with SMPTE ST 2084 metadata and 
>>> require user confirmation");
>>> +    igt_subtest("static-swap-smpte2084")
>>> +        test_hdr_visual(&data, igt_hdr_fill_st2084, "smpte2084");
>>> +
>>> +    igt_describe("Show HDR pattern with traditional SDR gamma 
>>> metadata and require user confirmation");
>>> +    igt_subtest("static-swap-traditional-sdr")
>>> +        test_hdr_visual(&data, igt_hdr_fill_sdr, "traditional-sdr");
> igt_debug_wait_for_keypress() is a no-op in CI — these subtests just 
> duplicate static-swap with no added validation.
> Instead, add igt_debug_interactive_mode_check() calls inside the 
> existing test_static_swap() after each metadata commit. This is CI-safe 
> (no-op without terminal) and provides Y/n visual verdict when run with 
> --interactive-debug=all. See tests/intel/kms_dsc.c:90-92,216 for 
> reference. No new subtests or functions needed.

Thanks. Let me change it and then send V4.

>>> +
>>>       igt_fixture() {
>>>           igt_display_fini(&data.display);
>>>           drm_close_driver(data.fd);
>>> -- 
>>> 2.43.0
>>>
>>


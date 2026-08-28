Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F333C61DCB
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 11:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF9610E002;
	Fri, 28 Aug 2026 11:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pKySre2Q";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA97910E002
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 11:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HabPw56rEQSaHT4ubY2D3UIxEaHD+04A7Tn75PdyOiGMM/NqcDLftjHL7okoJDsmqX9kWXU588Yvz+iiFVBB8v5AR7n+G9rKRPemaZijWDCmZyySEjHvmZKi+pdIEGjmkh1Q/qDlZZWAL/YcSIGTtRkMd+bxHAd/PVyDR+jUqn8LRaTWgBE5fisLlVXsfl7q9V5IMqfei69DYjvqnl/dB6cgApOdon5IBYPJkDfGRrjAuAEgkEcs1WGR9eDKzfLnnH1NDNAtqUeZQ5SUJzlkqkZo0yf5m8nmOT9vDVN7HidOQ6LvT9MdGysUgc+2erq3t8xtK6Y0P5aUug/p23ZtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+lpwQB/BxbtdSfMLRqd6tZgHUhKb1z60ujyTe0jHtU=;
 b=B1j2sf/KhuzxiigFRLaA59Qs6X1AZSGWhbne4l29mG2Hs1XYen6g8u+h6ImFNi626XPVDpXj+KEId33/L0Daz5iNOEWqO4Wr5IGrWqkxoW7oiL6+Snfrr/F82aiGKNE9VT48bkH/KRc+JeLNkNGFy4CDKevOs8Rl/7my/iqorW3MpNNJ0XJsBK5Pvm4UE3Kdayo7Fmcktz6V6iTvbG/RYj5LE3n+CGw2h4MSTIMuP9ds55LsKb+JjGo36dBLd+5qu2CSVuRrslzezCgyRLDv+52cKCOr9x2VySav0ZwcWKTJ80X5DpwlJ+wa+63e1lu9Ftp8iCJ/J3KsfSSejQWwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+lpwQB/BxbtdSfMLRqd6tZgHUhKb1z60ujyTe0jHtU=;
 b=pKySre2QqEe1m2Yk5HZRpmd0aeoaAW8hIY2kThfOz+KiDGNTH5DvUKRuYJldn8d8m8DzaIwkp/IKEVLm25CUzmi985+m+4p0W5Sds60zzVYsGeTYw2CgD77cyhWUt3Px1TA0eyARLYw5CaPl8uBMGRunXTBbDJSvXFD/42raDSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 11:04:07 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 11:04:06 +0000
Content-Type: multipart/alternative;
 boundary="------------QQnlFEbqVwnn0Piqd4r5K4ce"
Message-ID: <7f78ff21-e4bf-417c-bf9d-c605b13a4beb@amd.com>
Date: Fri, 28 Aug 2026 07:04:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org,
 chaitanya.kumar.borah@intel.com, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Mark Broadworth <Mark.Broadworth@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
References: <20260827185355.378279-1-swati2.sharma@intel.com>
 <20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: YQBP288CA0022.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::6) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e92d60-f365-4460-bd81-08df04f413f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|13003099007|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: i/I3I+mVERY11mICQ3sljo04sIXzrf9lYxK068nLwSC4mbiOvmM7uFZlLUgRAC5geoWvFE7IFAM9xHwA78FV6ffRjBaw56QGpwHObyGQ4QRsh42GCJz73m7MMfaN5jlYE4oUCTzcgj2/cYkXfKc1rk7FuTbHzuIqPaQ6u9+o5iYrBckPSV/attmXvnZSx8BoxcUwzatIR3s5kBCmQlPpgNTAr63S73qPeqsc0ZmM9D9P3Ik7YihM8KfGSXjMppW1r8z8epEq5iZC4gi7a9xAkfBkFHm8tcNYUYY+tfMZhxor26Z0yHoh6rskws/ywh4AqzMbaaUNhIcNpemxJ8mhxq0i0eC92NTeJ4cq1NdmrUcRjQqm4P5XQn0fHs3lZP/iD1jaXM37RbM1WJwGI3Q8+iz8C/I+WBzWbx15oQwzwZeV8gXQm1HaoVBYoZ5SYuD1514gxYhXRojmcqfavgGNK99M8UiS57SzKKb+MNx1Y77GKpDRAvOlQslv7pOxfqpFg2vxMTAjxt6ne+NOpsHyTP0dZqoXeLBKjOFosure7BPzPjaIIcMb5O0/3DF9yeP12KIOKR7GhJNerPzAxepEAX+dEamg5yuUzthUC8j/2JtJxhA7zEb5uzDfEsb2PkxVcsKWiOHzLHCA/ZVXHTnqjVvmrMEfovLBCAIOZ+EBiCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(13003099007)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2lKUGd4ZjVsTmc5bUxqbmJtLzFxZjVISzhlSjRET3JZbVhNOTNvdEc5TFpP?=
 =?utf-8?B?dVVSU3FOcm1FeUhiVHJJM1JFcFFRQWdxMGFIblJJRFBmY09GSjk4bFRmT2ts?=
 =?utf-8?B?Ykcwa1RzUDJzNFRUV1NzcDhyOHpjejhsUXdQQm8wem90Q0FnMzd0dm5BRHVY?=
 =?utf-8?B?NzZ0NzBMWEswcGp3Y2NKTTUvUEMyaDB6VWhuYUpWUkthNnNYOXFPSEIvV1Vr?=
 =?utf-8?B?Qk9haFVDRkYxZitRUFZFd2ltUldnbG9BZ0pUMktOMVR3U2cxNWdlNThScWcv?=
 =?utf-8?B?KzAxcTlBNUN4TzI2QWdiSXovN1VuT2tRUk4yUWpBWlVqQ25odlpzT3Nzb2Rs?=
 =?utf-8?B?TXliK3dCWnhkb25Nb3FtZ1BOa3dqaE1PZHNVaTdqSEFRZW9rR3JGWTJJSDlB?=
 =?utf-8?B?UFVlTldnN2h4b2ZTKzQ0NUp5b0IyTWVBTTNuNGdzQUx1eHQ4dzhuVytzVUdx?=
 =?utf-8?B?Rlkva2ZPSFpkdmY4ano5UXBRZ0UyLzVRdEV1Mk1IZzRjaG1lUXJrbXJCZGd6?=
 =?utf-8?B?M2ptNU9FakNyUlRDc3ZqZ25xSU4rcVVwU1VkZy9oQmRGVi9kT3d3K1hIWnJL?=
 =?utf-8?B?dkJhMXRoNWN4OUpHNXpZNWN6OEpjc1o4aC9HZ3N5OEUvL2V6VSt1K0U4enk1?=
 =?utf-8?B?V3RaU0puZHhPMmtCTnlyTVVXcXFsV1pIQlBwYXpCZHFpL0RNd3E2bnM0K0hi?=
 =?utf-8?B?SVI1MXZzc1BEREJkeUVwb3RoU0NSSUlncHUySUE2UWI2elZBSXFybmJRRXZr?=
 =?utf-8?B?TWpabkwwNWwveDNQYWpoL2NIS3Z2bmNreVBHL2xlNTdrVUdPVnkwNFUvNWZ1?=
 =?utf-8?B?dGdVMzYzZXUxOXprMlFTc2g1V0xXbG1EYVJVb3YzVjJHcTVuWWdILzU1emV1?=
 =?utf-8?B?bGk3WkxzVmpDenQxM0JTSldLeWp4V0YxL3FkRVpVVnZjbGdjaTdkMHE3Ukth?=
 =?utf-8?B?U3A2ckovVmlnM3Z0ekRBVDYvWHNVQjVub2xSWXZKUmk1b2p0d0N0SmJDS29Z?=
 =?utf-8?B?TlhXOExqVVVWSlpycjBPeUlvZW9hWXdST3VnUjhld0tLajcrWEI4Rit6TjNh?=
 =?utf-8?B?VXdoTm9rVFB0TE1vcXpOWW90dDJCdmtER1FKVFV4ZkVwcmNSc3J0MC9YRGs4?=
 =?utf-8?B?TFdBUGJ4VlR0TnV0ZmM3RzBhKzhnVVhRQjYvUkVTcXU1c3VwZ1pDRkYrb3pq?=
 =?utf-8?B?T2FJSmpQLzcyYjBsajhuMVJRZ3EvL1J1QVVpeUUrWHVORldxWnJPQmdiWDRP?=
 =?utf-8?B?VWtKRzlFU3FKOEtmRkhRaEtXK2t6NWZoTU15WEw1UHcxMy8zamVRUWlkZmNo?=
 =?utf-8?B?MmxjZ3pldkRFY3VkdS9TN3RUTTcwU0tGUUxrY2dnQUZ3Nm9oanlsc3hvcUlC?=
 =?utf-8?B?c3psZis1RnIvcjlFcm8rYk9DYVBsby9iSkhCbURlNFoxVW00RVJseG5UOUth?=
 =?utf-8?B?NDdJcE9pVFJGaXVHNDBnVFBGRmhBalU3SkhKejNtTUZSbUp5SDRMNTRjcGZO?=
 =?utf-8?B?ZHhkajhzZUMrdC9aQW1yajl0akxqT3FKaDdHQWdFRG1ndExtZGdNeTRNRjVv?=
 =?utf-8?B?NlVzNy9sNVpHR3M5Um13SDBOb3NtUEtXanFhdHFUOFRJdno4WG9qSVk5Y0Jz?=
 =?utf-8?B?QW4wS3hrQnV1VTd4V0RNekhQY1Nybjk3OU0zZHFIdk4wYUFMRm96MVErOU45?=
 =?utf-8?B?Z0I1Zm5ROXViU1BuS3djZDZ3ZUJLOTBTdFZERzBDZjF0YUJRMUxKc0sxOUJU?=
 =?utf-8?B?YzhmMDA3MHpXcXhWTDZVZFBOWFFhczc5SE9NaXUxN0FDdldudDc1ZVI1c2JR?=
 =?utf-8?B?VjZmZ0dSOENiaUZmN0hQU3NmZWtFREoyNnBrTHFnYzZlVnJlYisyZTQvK3RP?=
 =?utf-8?B?cVZDVXFnSzkzOTRVcFpDclp4ZFFSNzExYkxpVnRtaWhIWG4rRm4zS2JOOEdM?=
 =?utf-8?B?U3VtODluN2JTV0pYVExXbFZXV2M0dzFBdG9tOEJDM3RHNDdYNHBXOEhaWU16?=
 =?utf-8?B?UGR4c255Vm4wZlBLRU4rK0Vyb3lpbHNMQlJGQUoxZ3k4RTlGd2R4ZS9CYmtF?=
 =?utf-8?B?aVFQTEZYZlN5K2hXaG8yWEZaL0hrZ2hHMWtvdlQzVmM3RGRLdElhVUIyM1VW?=
 =?utf-8?B?U3J1UURRMlQzcW44dmVwUGFMN2xIMFpKQzVtSUZOM0htVDNnV2h5TlBodTdl?=
 =?utf-8?B?K3lZRy93MzhWTEtLU0lzWHRqZHptK2hJbHB4QlhzS0NDbWwyS3daUzNLcDd2?=
 =?utf-8?B?QzB2eXVGTjg4em9IcWtvc1NnOGxmY09QdUR5UlltaWsvbmRCU05penpmbXAr?=
 =?utf-8?B?L0N0UHJuUHAxRzYvOGJaOC9oZHNWdnRDVmQ4YXBRVzhiVzRzblp1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e92d60-f365-4460-bd81-08df04f413f2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 11:04:06.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ir2+ksN3NWjr5f2BDxrue4xRAhdyNBRAdWDo3ZKP5LF00rNmEuKZNdr+roA/JmaBxNlTc4dhFeMuFn/A6cT0Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876
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

--------------QQnlFEbqVwnn0Piqd4r5K4ce
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Added Alex

Hi Kamil

On 2026-08-28 05:58, Kamil Konieczny wrote:
> Hi Swati,
> On 2026-08-28 at 00:23:55 +0530, Swati Sharma wrote:
>> Rename the AMD-specific HDMI compliance utility to a generic
>> igt_hdmi_compliance binary and update the build rule.
>>
>> Keep the existing AMD debugfs flow for pixel-format forcing. Skip
>> that operation on Intel devices until a driver-supported interface
>> for selecting the pixel encoding is available.
>>
>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> I will forward this to few AMD GPU dev to make sure it will
> work for them, +cc
> Fangzhi Zuo <Jerry.Zuo@amd.com>
> Harry Wentland <harry.wentland@amd.com>
> Mark Broadworth <Mark.Broadworth@amd.com>
> Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Vitaly, can you forward this to your devs and/or CI team and help
> us here, please.
>
Added push for testing to our internal CI :

https://gerrit.core.linux.amd.com/c/upstream/gitlab.freedesktop.org/drm/igt-gpu-tools/+/1951

Hi Harry and Alex,
I hope you are both having a good week.
I am not entirely sure if the DAL CI is executing the new remote gerrit correctly. When you have a moment, could you please help me look into this?
Thank you so much for your time
Vitaly
> Regards,
> Kamil
>
>> ---
>>  tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} | 9 ++++++---
>>  tools/meson.build                                      | 2 +-
>>  2 files changed, 7 insertions(+), 4 deletions(-)
>>  rename tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} (99%)
>>
>> diff --git a/tools/amd_hdmi_compliance.c b/tools/igt_hdmi_compliance.c
>> similarity index 99%
>> rename from tools/amd_hdmi_compliance.c
>> rename to tools/igt_hdmi_compliance.c
>> index 2af4c0bab..ece0abd1d 100644
>> --- a/tools/amd_hdmi_compliance.c
>> +++ b/tools/igt_hdmi_compliance.c
>> @@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data, int pixel_format, int conn_id)
>>  
>>  	test_init(data, conn_id);
>>  
>> -	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
>> -	igt_assert(fd >= 0);
>> -
>>  	igt_info("Setting %d on connector id %d\n",
>>  			pixel_format, data->output->config.connector->connector_id);
>>  
>> +	igt_skip_on_f(is_intel_device(data->fd),
>> +			      "pixel-format forcing is not supported on Intel devices\n");
>> +
>> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
>> +	igt_assert(fd >= 0);
>> +
>>  	switch (pixel_format) {
>>  	case 1:
>>  		entry_name = "force_rgb_output";
>> diff --git a/tools/meson.build b/tools/meson.build
>> index fbc6c0a00..68c31da92 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
>>  	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
>>  	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
>>  
>> -executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>> +executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
>>  	   dependencies : [tool_deps],
>>  	   install_rpath : bindir_rpathdir,
>>  	   install : true)
>> -- 
>> 2.25.1
>>
--------------QQnlFEbqVwnn0Piqd4r5K4ce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Added Alex</p>
    <p>Hi Kamil</p>
    <div class="moz-cite-prefix">On 2026-08-28 05:58, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Swati,
On 2026-08-28 at 00:23:55 +0530, Swati Sharma wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Rename the AMD-specific HDMI compliance utility to a generic
igt_hdmi_compliance binary and update the build rule.

Keep the existing AMD debugfs flow for pixel-format forcing. Skip
that operation on Intel devices until a driver-supported interface
for selecting the pixel encoding is available.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I will forward this to few AMD GPU dev to make sure it will
work for them, +cc
Fangzhi Zuo <a class="moz-txt-link-rfc2396E" href="mailto:Jerry.Zuo@amd.com">&lt;Jerry.Zuo@amd.com&gt;</a>
Harry Wentland <a class="moz-txt-link-rfc2396E" href="mailto:harry.wentland@amd.com">&lt;harry.wentland@amd.com&gt;</a>
Mark Broadworth <a class="moz-txt-link-rfc2396E" href="mailto:Mark.Broadworth@amd.com">&lt;Mark.Broadworth@amd.com&gt;</a>
Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

Vitaly, can you forward this to your devs and/or CI team and help
us here, please.

</pre>
    </blockquote>
    <p>Added push for testing to our internal CI :</p>
    <p><a class="moz-txt-link-freetext" href="https://gerrit.core.linux.amd.com/c/upstream/gitlab.freedesktop.org/drm/igt-gpu-tools/+/1951">https://gerrit.core.linux.amd.com/c/upstream/gitlab.freedesktop.org/drm/igt-gpu-tools/+/1951</a></p>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAIBhAB" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Hi
      Harry and Alex,<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAIBhAE" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">I
      hope you are both having a good week.<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAIBhAH" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">I
      am not entirely sure if the DAL CI is executing the new remote
      gerrit correctly. When you have a moment, could you please help me
      look into this?<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAIBhAK" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Thank
      you so much for your time</div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAIBhAK" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Vitaly</div>
    <blockquote type="cite" cite="mid:20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">
Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 tools/{amd_hdmi_compliance.c =&gt; igt_hdmi_compliance.c} | 9 ++++++---
 tools/meson.build                                      | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)
 rename tools/{amd_hdmi_compliance.c =&gt; igt_hdmi_compliance.c} (99%)

diff --git a/tools/amd_hdmi_compliance.c b/tools/igt_hdmi_compliance.c
similarity index 99%
rename from tools/amd_hdmi_compliance.c
rename to tools/igt_hdmi_compliance.c
index 2af4c0bab..ece0abd1d 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/igt_hdmi_compliance.c
@@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data, int pixel_format, int conn_id)
 
 	test_init(data, conn_id);
 
-	fd = igt_debugfs_connector_dir(data-&gt;fd, data-&gt;output-&gt;name, O_RDONLY);
-	igt_assert(fd &gt;= 0);
-
 	igt_info(&quot;Setting %d on connector id %d\n&quot;,
 			pixel_format, data-&gt;output-&gt;config.connector-&gt;connector_id);
 
+	igt_skip_on_f(is_intel_device(data-&gt;fd),
+			      &quot;pixel-format forcing is not supported on Intel devices\n&quot;);
+
+	fd = igt_debugfs_connector_dir(data-&gt;fd, data-&gt;output-&gt;name, O_RDONLY);
+	igt_assert(fd &gt;= 0);
+
 	switch (pixel_format) {
 	case 1:
 		entry_name = &quot;force_rgb_output&quot;;
diff --git a/tools/meson.build b/tools/meson.build
index fbc6c0a00..68c31da92 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
 	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
 	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
 
-executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
+executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
 	   dependencies : [tool_deps],
 	   install_rpath : bindir_rpathdir,
 	   install : true)
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------QQnlFEbqVwnn0Piqd4r5K4ce--

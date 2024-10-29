Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309B4D3A66D
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 16:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0E310E25E;
	Tue, 29 Oct 2024 16:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wontz7+u";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F381510E25E
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 16:07:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjHgBvPNrNbJ1JzxnSOpjfyJ/Uvdh0CmcJINVPb/HSTJnQK9mM2G7CNb4XWX5JQNvMbeWX8txTI4yrxQMXegdO9Vf0BxP013mDGnVp4RXdnh9/MFoTU3/kreC80vjs7XhgrDZ0KQqXjfX2FCGiMVLhxyh9N3DTt8bYq56Mwhf+DroOiSFdS4/8obsP1TpqWqScAE900FUxO0ULMoV+TOFQu8gfvUeAkLQq6kVV4xPQzp8Mi7TdEqyfaa1WM526W+YPw4z4zbTM7f7yH9OnRSUH8MjwXE7zGHtGivhQf0VHkuFK0EvKEHceNRPtLv2ArCta6lupPr8st5MkG7Thm1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNpl+VK8t1lp/6VS3GtDSFu73zI6faKbg7iy6ZKuHWA=;
 b=sKECi5CPwNIcriSfE18ObfaemOiaH80DD8V9xku81K40934shJoD4x1reLThTx7NCiKEAOWZ2OG+uDq0LIl3rKcHPDIXyldV3tkqgRzD5s/WpMLy1RVj3uGcYDDSLjpN5733PYIWynXpcoCR9l6hblLc3KS1OjfaEAJJgwbAjtc4aeC4aYQsvZECq6jABlOa/MLHsolLg3Ez113gG5bqAx7Jy6SYtXfkbYOtVGKYKzDqoB/f87VuMeDHvqN2uTjwfRJ0L7sBP7mg9dwx4poi3fNMSEpPD8LcPaD+2m/WMnzPfQQfCI9D6Lk+JJMH9a6cRwTTgyeSQe1fLnEQ99kA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNpl+VK8t1lp/6VS3GtDSFu73zI6faKbg7iy6ZKuHWA=;
 b=wontz7+u3iXfJyPu1a6dCpHOgpKMSQgY0ojOwjuRa8rsfnHMQCOvXVoJAzQyowFG7Px/SMb+NiDNs0ceUE9Q50pTnR3284cjdRTrR11zkGwmzEq6isQJo1HNWXZk+yh2nWkLCgukPsjn7c/qZhd2OR+jbEQNCG+hAet/yrfURbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 29 Oct
 2024 16:07:14 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%4]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 16:07:14 +0000
Message-ID: <659820d5-c81e-4b5d-bd35-820608832598@amd.com>
Date: Tue, 29 Oct 2024 10:06:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] tools/amd_hdmi_compliance: Add timeout option
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, mark.broadworth@amd.com, sunpeng.li@amd.com
References: <20241024210345.511501-1-alex.hung@amd.com>
 <20241024210345.511501-5-alex.hung@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20241024210345.511501-5-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::24) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 3640fa15-3a5a-4ee5-89a6-08dcf833c0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWtacHRVNXVYZnc4WGZLbEJ1TEhBL21VVHdVQjNrRml2dGRmc3RzSGRwYzEy?=
 =?utf-8?B?UWN2Z0xESE51WE5La2t4ZXd3WkJQbzZxa21kSHlpZHBwcnpicCtoUU1BdGhT?=
 =?utf-8?B?SXV2a2VkeGZEcEZmZzNmK25EMEdsSTBRcXRmK0NBSTJvVWJVRTB2WGVFd1U2?=
 =?utf-8?B?S3lJUENOL3FtN0VJRnk5TzR0Slk0Y2lZbWZLNXJ3NHUwRlNYWW5RK1VlN0Uz?=
 =?utf-8?B?V0xPSDdmQVE5SnNaaC9CejBpN1I1UXJ2VEdFQ1JvQkRzeWpMR3FZcFQvV2dP?=
 =?utf-8?B?MHUvWWxld3c0Z0ZCUnNVZmhlSkE1WnpjUnY4VDBlMEh4VWpvaWRoYXBXeVFw?=
 =?utf-8?B?a0EvWFZZOGRRUTNoMmduSk55U0YzWU5kZUdMcllaMjNWUmM4aGIxdjVMeHJ1?=
 =?utf-8?B?dlVReCtLOERXNkpTb3M3QWxQWldPNDZlZHZaRXJYMERhb1BvZWpGbk9RQlF6?=
 =?utf-8?B?RDltZjE2OHUvZzZHNERXZVh2NEkzaDFLbkp6TXpHWkVzQjFTVVhoS2c2WVBL?=
 =?utf-8?B?TFRvYWFWd0swR1ZkbjF0clZJQ1pXSXdYYWhnYjd2bGg4QXd3cEdGWHU1eXhV?=
 =?utf-8?B?UjQrSHlHUU81VzJ4UTZMQU5tUGQxdzZEK0IwTWpSZ1IzU3lhdDIrZG9FOHJv?=
 =?utf-8?B?Nmw3NUlPN01KcEhlRHZzQThWQnFaK2owMjdmS0s0U3NqLzcyRCtocVJoaXRL?=
 =?utf-8?B?c1pIOUlNUEFGT2k4VG9ZS210N2dSV3d1emNkTi9USlJGZ3BNUWZ6bGhHNWhj?=
 =?utf-8?B?VEVQcFpGTkhQc04ybVZmaGIrcVFCTTV4blJROGFiNlA3RlN0aUQ4NmV6RVZP?=
 =?utf-8?B?R28xSkNXR2dvYTF3c0hNenRZQ29iZGVzU0hIR0tpSDhtdjJ1UStpcmRTUjYy?=
 =?utf-8?B?aWpzRnJwT0FGeENiMHJZdElyRDV2dlNVejlTMkdiUVBOVXMzMm1PRXB2V3dr?=
 =?utf-8?B?L1FiSGo1TWkyQ2swZ3ArR1o0TWNzc3R6OEljdW1yUUxEUjhDeHMzdWlXRVNi?=
 =?utf-8?B?TXYveUViaEdzZDdVU0NsZFI2aVZ0K21xRHNhU1d3SWc4b094OVk0YlYrNFh0?=
 =?utf-8?B?Tk0vMEJpZW1uRUlnSnY3Z3Fnd05nSFo0bUJOdHg3UERyUGpIaU14MW5MaWpL?=
 =?utf-8?B?MzNXMzF1N0lLNkQ2cmtQWXk5VXY2Nzhvb00zSkdHcDhhZS81ZkNDMlRtS25X?=
 =?utf-8?B?Qk45eGFzZkRic1RPRGZKVUtveGg0ZGRTOWV4SVBOaGdzaWhlMmplU3FRWjU5?=
 =?utf-8?B?VmV5Sko3eHp0UmdBOXpDZHl2bm1sQ1VrNXNEQ1QzRlN6SGxXcll4czFwbTBt?=
 =?utf-8?B?MERUVWFhNit1c0RVL2VKNjNCN3p6RnYzQXRTZExHWFkxWWRXSVMxSzIwUjIy?=
 =?utf-8?B?eHhaeWFrV0JDRHkvQkF2V3ZIWm0rSHVpY2RjRUtEaHNjMGE3dXN2NmFtOHpL?=
 =?utf-8?B?WnVCUk1ZbHBxemlSOHZlUmUrTy8rTlBycEVFZnNlWXk0WHUvQ0NkM25INXBZ?=
 =?utf-8?B?bGpHUmdDZ1V0REhPOXFVRmtQS0RyNzcyMyt4SzZZWlNUZEpYd1R2SkYxd1pC?=
 =?utf-8?B?dUU3eG5QY0N3UUJ5Wm96YVZWbmxoaytDUFJoQmZDWUFGMUFDcTZNQWRHSXVs?=
 =?utf-8?B?T3RIc2NvZmtKcFVtRjJwRWxxTEx6VTRpaVdjbTRyM2NOcGo0ZC9CWnNZdDNP?=
 =?utf-8?B?TEl3OG9SZUg5RS9xS1ZRZGRhRWpKM0d1aGdMVW4rZEtXZm52a0VLeXBOWG01?=
 =?utf-8?Q?pgCrA6xeVF54Y+/7xFTqTrBGbNVb8hG3WXNHR2T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEpRTTFPUkZQa0VtT0xhM1FWTk1OVUdibGdMeGs1M0wydTVNUW5qZ1JVREV0?=
 =?utf-8?B?aS9wbEY4VHVQdzQvbHFaNlREUWNTMksvTzlpTmtqbzR4NDViQlRGUkJiOGJH?=
 =?utf-8?B?TzVCOFpzYnJFZmxBRGppUHlMRk00TTNSWHBZZ0Z1ZkRTaXR6QkJEVXJYQ2Jq?=
 =?utf-8?B?eG1ieUplR0FVQ3VEYlp4WWtRazdXWS9jTFM3bEw1MXptN2dId0plc1B4YTVV?=
 =?utf-8?B?a1lQV2NzSkkzR3Y5NWs0bUFpSmdibTRNUTlEZllNVm5xU3I5Z0VmS0ZIM0tl?=
 =?utf-8?B?Rnp2S2I3eUl3RWpQVHFhTFdGNGt0VEVMY2ppaW1WMisyYlRZbFVuVlpReXJQ?=
 =?utf-8?B?NWRYU3hJWFlOS0tHSnJXMHdVSjhNdUdQZS9HZFdCYVJ0REI3Q3pYU3lqdm4y?=
 =?utf-8?B?SWR3eEVIVlh5TEovQTFkalZGNTZZY1FxcklFMzUxOWhuay82MW56MTJZSFJR?=
 =?utf-8?B?bXJSZnpxcUpGM0FCSlQ3Y0VzMmpWS1c5K3c0VmVZK1BIQ0pidHRIeWtQTFpw?=
 =?utf-8?B?YnU4M2gyaWxMY3o0Nkp0VnY3Z2lhN3hWb1pqalV0bGd3cCtqdnRodWIrN2xP?=
 =?utf-8?B?V2ZvdXhhSU8wQnBYQVg2NjVWUEhib3dGSnpnZEhUeG5FQ0RuSEp3MjFKalcw?=
 =?utf-8?B?OW82bURIZE52Ky84ZFZ5eDR1Qm0ydFY4UTVBbUw0UC8xaTdTcnVKWU0wSFBh?=
 =?utf-8?B?ejZRRzN6WDEweERGaWFxWVlZWEl5anhVSVcwQ3JBdWs5cVVwSHBKamQ1N1A3?=
 =?utf-8?B?MFUzTy9QZ3lQbHV5Vit1dTdtMVk1QXdVbkd2TWNqRTYyRXlKTkZuNyt1QVdt?=
 =?utf-8?B?YzVIUTVaRmJ5bDVKalBPNnd2UjFwNGdTblZ4UTlObnU1ZUtobjRkcmVLc1pH?=
 =?utf-8?B?TDlNZjRiMW9QZUN0WlhveWhyWEtLdmFCOFJDZ2FoNlZURnhrdDhTam14WkN4?=
 =?utf-8?B?SURJbTZ4NHB3WnBDd0tlS25haXlPNUNyQVBkZlVSRXF2cDRFUS9LY2o3eW92?=
 =?utf-8?B?NkJsUzdUbTBjblBXODhsZnk4aDVLd3dMbHk4U3hBeWsrdGw5ejlVZ3ZpZmtz?=
 =?utf-8?B?aWhJVk1sWDQzL1R2VklxZW5KTE9xd2x2UUs5TUdVaFhSUGc0a2RUbXZ3QjFj?=
 =?utf-8?B?Q3VDc3Jod0dia3RJVUhQTE95N0oxT3c1VGNwQkNxU1o0UllUL0dsbDVaaDBJ?=
 =?utf-8?B?cVY0dms3OXMzN2c1Mkg3aHlyVUNWVkJ5Q0RieldlbEZYNWowTFptOHVHcFJ3?=
 =?utf-8?B?SjR4VjFpUVQ4OXVpT1R1dnNzM0RNaWVaMVRoUnZoZXZCRU5oN0h3YzJOUUJp?=
 =?utf-8?B?NWxIMEZYbnVXOTBDOUtxczU3Z2xiUnBvMnl1cFdXUlYvemNQcW55cnZVUzJT?=
 =?utf-8?B?d2Y3QTNVS3QzNDdGaVRvTlo4ZVlFREpKVjBkRVlzTGJuR2xIRzZXRWJIK2Vp?=
 =?utf-8?B?YmhrRTV2R3lKNlZoNUwyU2dTdkdLckJKejRHTDE0ck1hSjM2VThnL1RiOUFK?=
 =?utf-8?B?eWtPOHFRZ012aDB4TlFJQlJnWFJiaTIrK0R6eDRxVldtMVhDcUV0MWxaU0VE?=
 =?utf-8?B?S3B3c2FlR1pLTGt1Q0wvY0tSNWJSQWNxREhSNFJVcHRlc0Fjb3FUY3kycWZX?=
 =?utf-8?B?VnRia0FZN05zTHBRZmtXeHczQi9RNUR5OVZCU2lON21HT0xmNmR3bUZBelEw?=
 =?utf-8?B?dGRZYUJJSUZabUJLTXdRWGpmYlRDWk1DUFhwRUw4SDVxeDZ3cys5ZnB1aTVy?=
 =?utf-8?B?VXVxeE1PTUVHaUFzM1VKUnBXVkRIYWdnaDRWYUo0UkhJQXYvTW1Ea2s3c1lw?=
 =?utf-8?B?KzNOM0s2RndtQTVSNjBuSlM1K3cwUTBhYVcveE9OcExFZHlmUlNQcUc2VVNY?=
 =?utf-8?B?L1pSUVBpSldsVG1HUzJRVE10NkhyZ0ZodmJHQXFjbzhIU21Xd1dEOTJ5ZDFS?=
 =?utf-8?B?Q3dLdnk1andLa24zMUxtYjdpTk5GNTlxNXdpd1QyWHBycGtzeEozM3JJVTlY?=
 =?utf-8?B?YlhuUFlxMG5PT1FjQ3I4TXEraTVhbjREZXJ3b1RaUFEvWHBxZU9oN2NpMWxY?=
 =?utf-8?B?VUxJVTRIaHFnejBNVG1wU3hhbXlHeGZPTVFTdWNOUzhBUEZTTXFPcXlFTE5z?=
 =?utf-8?Q?Z7nIWOgCFNKb/oKKnsQvuY7VP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3640fa15-3a5a-4ee5-89a6-08dcf833c0eb
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:07:14.5214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRy8/jhbJFgf0hNzy6Ul7iLgoPpAilGBRJnMPv/BYwOI6X4+U8nFmQ6riU/l/xXETDiREBhGKtC6vwXvtSO0AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097
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



On 10/24/24 3:03 PM, Alex Hung wrote:
> From: Stylon Wang <stylon.wang@amd.com>
> 
> [WHY]
> Displaying test pattern only exits by user manually pressing enter.
> 
> [HOW]
> Add option -e to exit with timeout and still allows pressing enter.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> ---
>   tools/amd_hdmi_compliance.c | 35 ++++++++++++++++++++++++++++++++---
>   1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index 49fc21d5a..e810b61ba 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -23,6 +23,8 @@
>   #include "igt.h"
>   #include "igt_sysfs.h"
>   #include <fcntl.h>
> +#include <signal.h>
> +#include <string.h>
>   
>   /* Common test data */
>   typedef struct data {
> @@ -34,6 +36,7 @@ typedef struct data {
>   	igt_pipe_t *pipe;
>   	enum pipe pipe_id;
>   	bool use_virtual_connector;
> +	int timeout_seconds;
>   } data_t;
>   
>   /* Video modes indexed by VIC */
> @@ -370,6 +373,12 @@ static drmModeModeInfo test_modes[] = {
>   	},
>   };
>   
> +static void signal_handler(int signo)
> +{
> +	if (signo == SIGALRM)
> +		igt_info("Timeout and exit\n");
> +}
> +
>   /* Common test setup. */
>   static void test_init(data_t *data, int conn_id)
>   {
> @@ -402,6 +411,19 @@ static void test_init(data_t *data, int conn_id)
>   
>   	igt_output_set_pipe(data->output, data->pipe_id);
>   
> +	if (data->timeout_seconds > 0) {
> +		struct sigaction sa;
> +
> +		memset(&sa, 0, sizeof(struct sigaction));
> +		sa.sa_handler = signal_handler;
> +		/* without SA_RESTART so getchar() is not restarted on signal */
> +		sa.sa_flags = 0;
> +
> +		if (sigaction(SIGALRM, &sa, NULL))
> +			igt_info("cannot set up timeout: %s\n", strerror(errno));
> +		else
> +			alarm(data->timeout_seconds);
> +	}
>   }
>   
>   /* Common test cleanup. */
> @@ -412,8 +434,11 @@ static void test_fini(data_t *data)
>   
>   static void wait_for_keypress(void)
>   {
> -	while (getchar() != '\n')
> -		;
> +	int c;
> +
> +	do {
> +		c = getchar();
> +	} while (c != '\n' && c != EOF);
>   }
>   
>   /* Write 0 or 1 to debugfs entry "force_yuv420_output" of connector */
> @@ -478,7 +503,7 @@ static void test_vic_mode(data_t *data, int vic, int conn_id)
>   	test_fini(data);
>   }
>   
> -const char *optstr = "hvt:i:b:y:";
> +const char *optstr = "hvt:i:b:y:e:";
>   static void usage(const char *name)
>   {
>   	igt_info("Usage: %s options\n", name);
> @@ -488,6 +513,7 @@ static void usage(const char *name)
>   	igt_info("-i conn_id	Use connector by ID\n");
>   	igt_info("-b max_bpc	Set \"max bpc\" connector property\n");
>   	igt_info("-y 0|1	Write 0 or 1 to connector's debugfs force_yuv420_output\n");
> +	igt_info("-e seconds    number of seconds to display test pattern and exit\n");
>   	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
>   }
>   
> @@ -519,6 +545,9 @@ int main(int argc, char **argv)
>   		case 'y':
>   			force_yuv_420 = atoi(optarg);
>   			break;
> +		case 'e':
> +			data.timeout_seconds = atoi(optarg);
> +			break;
>   		default:
>   		case 'h':
>   			usage(argv[0]);

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4E1C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 19:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCABE10E9BB;
	Wed, 26 Feb 2025 19:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pgvmdyMA";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CCA10E9BB
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 19:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uINUgxKn9CsS8OmO4WULK2GzZ4+L/29mchqMfumYspXhW3IPkfvoScFco/qA/pFH1olnOgVVyDzosVaxMobwLu746iUF3BLfXYi8TIANOHMJcbc/v5+y5B0d8G6WqtqS/r2A4eL6vzLZ2+IIdascs5ANLRpliGJcssx4n6MSSHVEaoFTud/YS617/evk1D7rkBQsSBJLUK1yD6s+TX5v97ZloioP3y1oL7mHqf6owFQRWf7Tlmb9MnlL0TYnD9RaxHh9eaeQTdbDYaiPfpwnnt0/oiGwnNfaRNAO67sD8xBta4/a4dxHNSSL/cGeJhzdomhQ0smHRsvjkqez+yRfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm7SPhZCk77hsZpnv2s7tPcJEP87lk7tdkxDwI6NM10=;
 b=PIsLlZEsVYbRrwH3VXTh+klkyVdt2iV7+5mVmcpjK8NSvrRzIP5M+q5KkvzJzFzHbixnBlIqt1wc5Bq+5el6VjgFz1Zdc0Vo73GWlLoU8f8h1vNsu1KOaFA0jXe6oIMU7w0/YVLuL5vqyjQyw+6n2Jbp8D0hsYfxxtvjP14OQZfHXd5FD3yVwgM2oWEswheqgqV9xl1F+cCo/Tc+Vl9f7514Y2uJg46k0I/Y9Q4g6iITN7CF88oqCDpd0bbtWGoG9POhbxo6u0SO0JqZi2rQPxIiMTi0U30ranSKQD+vBuwJ3zxGDd+2UOu1bLvYlUqjmu9lhZg97mtobD4cJMOgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm7SPhZCk77hsZpnv2s7tPcJEP87lk7tdkxDwI6NM10=;
 b=pgvmdyMAxp2ROZHMZikq732sPabLObdQjAGH7/XaJ3S95ZmMgrBOn3r6nItWRdTLwjKuoJUQYHAzQ7hfIX9Y9w2nqykkadiPvY5DOLi0icPHGnbWHhwKLuHDOJG9zFwNkyJwcat2273lxZG+R1vEkqYrWQIThF525ndbdIq1oYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH1PPFDAD84AB72.namprd12.prod.outlook.com (2603:10b6:61f:fc00::627) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 19:02:24 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 19:02:24 +0000
Message-ID: <d1c6ce12-04e8-40be-b6a7-a51de67c5003@amd.com>
Date: Wed, 26 Feb 2025 12:02:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v3] tests/amdgpu/amd_abm: Fix test failed on
 self-refresh panel
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com
References: <20250225101006.10869-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250225101006.10869-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0097.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::33) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH1PPFDAD84AB72:EE_
X-MS-Office365-Filtering-Correlation-Id: a3290fc8-c91b-44eb-ebf2-08dd56981ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2MzRjg3Nmk5RVE1Vm9RRnY5MGU1amVPQ3pwaE5UczVoVWVKWFZqQ1VWMzBa?=
 =?utf-8?B?bmcybVlFTnNWSi9LUHFublVMT0ltL2YwU0N4d3lXRFUwRjdKTE1QQ3ptY0R2?=
 =?utf-8?B?c01MMmR1OWxZQWVpTUxtdjAzbHU2RXdkUmJWOUlTdVFmbVNQS1lqc0lhWnll?=
 =?utf-8?B?SHZ6ZWlyNkNDNGgrUW50eVUyM041OUVWaUVKTGlkUEFhYUMzYmk3N3JsNVYv?=
 =?utf-8?B?b1BnMUN5SUZJOHJReTdMUVgza0t1cVVJL0tpZW9YbEdmb3BOWDhNekdzU2lz?=
 =?utf-8?B?MEZKWm1INDRYdGtVbVdxa1lPYU9Za2dxUk9JdnhqWjJpTUY2Ky9QUGNvN2U4?=
 =?utf-8?B?QytaM29EeDgyL093bjBaYjFlaFZxMFdyR2M1TjFqbmsrdy8wU2l1RHNFQUxX?=
 =?utf-8?B?UkR2ZlNkejVGY1NiVDEwbFFoeDdqOXk0Rkp4WVJNeUpueHpIS3hiMVFSakdo?=
 =?utf-8?B?N096ZE5XaEZWZkJBS2E0TXBZL3RianQ5UlJ4aUpCbHgyV0FDcnpJQmNneXlG?=
 =?utf-8?B?cVhHMnpPR0Uvb3VNVXFBd0pXSSt2M2o2ZERQYndjRUxvVDFoZnVoRGFFYUE2?=
 =?utf-8?B?RG5hS3p0dGdzalJJbHJlNlAwRW5sSjhJYURPSERHWHg2TXY0QWFUNGh3aFhS?=
 =?utf-8?B?eUh0eEV4VFlpdlA4blhHV0U3cU5tUFQzdzFzSkU1RkpLMGNNMk9nMVBJZVMr?=
 =?utf-8?B?RjRIbHZGb2JOUDAxQk42alo4SlgrNDlVZENiemxleWp5dEdEOTRSUmtCVVd6?=
 =?utf-8?B?UlJ2MlZTVzJrb0k1OVVSNDgrVy9DTXNQY2ViaW14VEltTCsraWMvT1BVN29M?=
 =?utf-8?B?cDVwNlM2MkRyemJPSXJkVGg3M1dWMG5iNldldnBJaWpoL28zWDNJVld0bjhR?=
 =?utf-8?B?NEJPVmNIeXRNRVBUejdaLzREYlJqNG9WWW9yc1BkMVcxeDlxdTM5WlR3a2lo?=
 =?utf-8?B?SWJRd2RLNXh6UWpEQU9RdUpHM2ZUbWFPV1hERTNQOXkxZkw2TTJHRWlTZ2tx?=
 =?utf-8?B?UFNQQ0N1bzFwaVZTZWtoU1U0MCt1Q1dGNHV1M2d3QUFYK2JTZExOR0lJMEkx?=
 =?utf-8?B?b1FKSVphSDJwWm9aSUdTNXEwUzJLa1dsZkU3Mm1NMnZxdk4zMEhSK2JRYWk4?=
 =?utf-8?B?cGFsYjR2NjNWVE9PVG1xeDl3UndvNlh5UHZnWStNalplQmFkS3VQY1hYblN2?=
 =?utf-8?B?UXJNbTVEN29MNTIxczFSUm1hZFFqbmZsR1p1aWE2Yk1IMzN4bExoNWxpelMx?=
 =?utf-8?B?WGZrL0dQSHBZYXFmaEpkZkxrQTNYK1c4bXV6eGgzYVhLV3drR2VzNjdjK0tS?=
 =?utf-8?B?SGlmOVpZekYyN1hDRjV6V2xhL09pVjZ6WnZTaGNmV0xXUUpjZkRHTko1aDg3?=
 =?utf-8?B?cTArN2drcGJDVHpwU3YzaHpKam52aUo2NTBhZExrMlp3Uk1BSjFrM0JxUXdx?=
 =?utf-8?B?d29CUGd6TFF6T2g4b205TjNlZXVDME1sOTV3SzFCQzlCTU5MZ1pJTzdRd3Fi?=
 =?utf-8?B?RFQ2a2NOV1pEMTFoeHkxZTFxMlFaeC9GQVIwdktZR1MzR3V1VDE4R2FFM0JZ?=
 =?utf-8?B?K0ErcmpGYUNPWkVUS0RWS2l4dmZlcnpVRW1wQmFUY2M4NUYrYXVCblNCOExS?=
 =?utf-8?B?STBuc3lIVFJjdHpTWU5pVFhXUmQwbVNoV3NIT0hJckZYaVllMlp2VG9SeU02?=
 =?utf-8?B?S1NyMzlFZXl5bDlQYVpGeWQ4WTZ2bm1GYllpWXpsUnBWRTkvbWJ3MHZCdkFs?=
 =?utf-8?B?UVVCditzSm1IRkpJTDkwRUpVbFNOYTZDL2ZrTDlWcForWFZVcksvYVltMndW?=
 =?utf-8?B?UGhtTzVmSUpJNU5vOXdQelFDK3VoOGpKWklPTkwrMFlHOW1hQWE4VHd4ZllS?=
 =?utf-8?Q?/N5ufWAWDn6Gx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TExCM2tEKy9ZRG5zTm1kbWFQNy9IZTJiRnhRbjYxYjZrN3ZucEZJaEdod1hY?=
 =?utf-8?B?L2dOaXJybTFNTEZQTUNVRXRsWHZjQ20xdThKdk9oS3VtOGVkUXBleEZJVDJU?=
 =?utf-8?B?RlhmUVJ5azN0T1Q5TE9OcDk0VThpdXpjQ2c1WUtCcEUzMWJKUS9QUzlOdVlD?=
 =?utf-8?B?anlpaHJ0ZnhGQ0RiQmJ4TnVCeDY0NkZXK3IwVlpDcmFXK3JxbVB1MW1Ja0p3?=
 =?utf-8?B?ZXA0NFBuQk1ZT1ZKZGx5ajRWdzhVRldqaUsxZmRFRFdGZ3JVQVgzQ2ZWYzg5?=
 =?utf-8?B?NXdBZWlLbDlzOURuK1FvL2pZQlVGUjRoYjZBT2ZzbFgrVzMvSlowT2J1b29a?=
 =?utf-8?B?ZXFGQVpSREYxcnpmTUI4V2dlaU5pWXFGRWFGOFNWak5RVTRaME4vZG1xSElo?=
 =?utf-8?B?MHV6Y2UwZC90S2loNmZXYWZJd0JCUW9BcG4rV3FiZFN6eW9YUVExUlUzNjFX?=
 =?utf-8?B?Zk03Z0ZqTDlhbWVPTWhMclc3VnpJVGNhVWdEeENBeDR0SDhyQzg0T2piUUY1?=
 =?utf-8?B?ejVQSGN5T3Fhcm1vOERjNWdDbTN5VFhlQzFYQ0hkcTdzTVc4blpXRnJyRktW?=
 =?utf-8?B?ODEwd2UralRmdzFNTkZkYmI1VFBhaUVQdU52Q3Z4Sk0ycFo2bDVWR2ZwdjB0?=
 =?utf-8?B?dFJUMUQ4RGlZL0R6dU1aR01WS1d3K0ZmRUVJTzhhUnJSQzFDdCtWNEJxUHJj?=
 =?utf-8?B?YUVuRElzVFNNK0FDdTk5MndDdjkybFF3YzNxVDlHdXhIcmE5V0N6M1N0TnVm?=
 =?utf-8?B?UlRDNjdOWlVBSEhhRVg4bXNFaFY0b0xTUUFUNGVKeHB0bXhtQUl2R014OVU2?=
 =?utf-8?B?QXZHVy80c2puK0hPR0E5WXU0R0RZVHQ1UEFFdmxnSy8xcG9naVArZEhmTzly?=
 =?utf-8?B?WXZRcHZPaUoxcS80d0p5TFVlQmtKTVg5dVphT2pNUHd6eW1TWHVsOERxSTNN?=
 =?utf-8?B?NGlCSTliakZwWFhjbEdsOTFnRzBobGpPSjlBMk5sV0hqME1DWmovR1JkSkQ5?=
 =?utf-8?B?WndsZnV6ajEyaEtGYzM5dUZZTEdhQlZQb0tWUFBxYklHZEdLdisvZWs3RmpO?=
 =?utf-8?B?KzlCVFM3ZkNiVUtmbk5jMkRxVWtoU0trQ095QURCSExKWWZMRU5xWWUxQWdn?=
 =?utf-8?B?ZHZ1a2tDb3dSWkJUQ3BFSXlNcHdUOGMwMHAwamYrdG0rSWp3d3dsOUxrVU9t?=
 =?utf-8?B?Vml4Vm5qR0d2cDJRbUxQQUNuOXBGN2REZmhMZnJoaEhJSkRHVFhTNG9EYkFv?=
 =?utf-8?B?ODN2UmlmenZyeWRWQUFjdXVONkZPdE5rclVlNFJNeExPQm9XdzE4UmV1aXdZ?=
 =?utf-8?B?WnRpdlUxMGtDdkN6UHJYbG9KMkx5RkZULzlabDNVK2ViNC8vSHNURW5ZQVZz?=
 =?utf-8?B?SHVhYWhmbGR4MzdUS3FySVVLSVRVSXBuOHJQeTJINU9SYzEza0ZmdGRjSWEw?=
 =?utf-8?B?cVo3cmsyZnYzL3RySnRFcGpOZ2lVVG9UaVA5N3EzSmxqVTczaGpuSGJiZGVP?=
 =?utf-8?B?MXVEbk1iUTM0ZHN5eVVyMC9xZzNoemlWamp6c3VTZDFiUDViU3pHdVdMcXVp?=
 =?utf-8?B?Mlp3V0VqdFFweUJKczVrYjZLTVJyb211a2FRa0haSloyYWk3TUY4bC9oTVNS?=
 =?utf-8?B?VjBOWERTWER3MEpXSFdldkF1RjQzWVVDQ09Ea3RUY1dxUzNTSHRYbmU4dVZy?=
 =?utf-8?B?RThYWGJaYzJ6U01aeDBNclQ3ZzFLWVgwbGxlK1VPTGlGajlxNDUrVWRKWnMv?=
 =?utf-8?B?QmRtV3BQOFMrZjVSZ1Z3QmRaeVoyaHVwWDIyT0ZVME9zSlFkbUsrL1lqRnZw?=
 =?utf-8?B?YWw0aEM3N29xcEx5S1hoSGdYVFR5Nk1rZ3Y0ZXVmU3JTUThPU29RT0k4RjNU?=
 =?utf-8?B?QU5YeUh6OFNZNUhSVXN4M2RPZDVvL2oxc1RRSUVLNEYvU3dnc3QzclBZbDhT?=
 =?utf-8?B?YnVzbGVUNHdnZEpRdmJqN2NaaFMvRlM2dVVaSXp0TWp3MC9vRGlzWlc5UjBv?=
 =?utf-8?B?eWtwc2NoZ3FtaWdyR3FOV25udVpKUDYxNjdkK0FPQk1VWU9CVjlteVpyaWU1?=
 =?utf-8?B?MFdER2hrNnh4VW9YTEUzYmJ3Q2dHQzlDK0JrS2NjYUFJekh2VWRGRCtrelJa?=
 =?utf-8?Q?tTt6oK2umnGO7SJzDD+gP/63b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3290fc8-c91b-44eb-ebf2-08dd56981ae3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 19:02:24.4051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CrN8W8i4yl38Tdlt8mdaof/fju7hHYRWxlwrpI1gEmXjLbYnBdS/zjAkvU7WT7KMi6JCy2dP7slhp0l6sHCpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDAD84AB72
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

On 2/25/25 03:09, Tom Chung wrote:
> [Why]
> For self-refresh enabled eDP panel, it will have some delay before
> backlight take effect after set the abm and cause test failed.
> 
> [How]
> Slightly reduce the brightness before test and do some page flip
> during the test can resolve this issue.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
> v3: fix conflict
> 
>   tests/amdgpu/amd_abm.c | 101 +++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 97 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 8f7f489ad..d0cfd029a 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -36,6 +36,7 @@
>   #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
>   #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
>   #define PANEL_POWER_SAVINGS_PATH "/sys/class/drm/card0-%s/amdgpu/panel_power_savings"
> +#define MK_COLOR(r, g, b)	((0 << 24) | (r << 16) | (g << 8) | b)
>   
>   typedef struct data {
>   	igt_display_t display;
> @@ -47,17 +48,74 @@ typedef struct data {
>   	enum pipe pipe_id;
>   	int w, h;
>   	igt_fb_t ref_fb;
> +	igt_fb_t ref_fb2;
> +	uint32_t *fb_mem;
>   } data_t;
>   
>   static void set_abm_level(data_t *data, igt_output_t *output, int level);
>   
> +static void fbmem_draw_smpte_pattern(uint32_t *fbmem, int width, int height)
> +{
> +	uint32_t x, y;
> +	uint32_t colors_top[] = {
> +		MK_COLOR(192, 192, 192), /* grey */
> +		MK_COLOR(192, 192, 0),   /* yellow */
> +		MK_COLOR(0, 192, 192),   /* cyan */
> +		MK_COLOR(0, 192, 0),     /* green */
> +		MK_COLOR(192, 0, 192),   /* magenta */
> +		MK_COLOR(192, 0, 0),     /* red */
> +		MK_COLOR(0, 0, 192),     /* blue */
> +	};
> +	uint32_t colors_middle[] = {
> +		MK_COLOR(0, 0, 192),     /* blue */
> +		MK_COLOR(19, 19, 19),    /* black */
> +		MK_COLOR(192, 0, 192),   /* magenta */
> +		MK_COLOR(19, 19, 19),    /* black */
> +		MK_COLOR(0, 192, 192),   /* cyan */
> +		MK_COLOR(19, 19, 19),    /* black */
> +		MK_COLOR(192, 192, 192), /* grey */
> +	};
> +	uint32_t colors_bottom[] = {
> +		MK_COLOR(0, 33, 76),     /* in-phase */
> +		MK_COLOR(255, 255, 255), /* super white */
> +		MK_COLOR(50, 0, 106),    /* quadrature */
> +		MK_COLOR(19, 19, 19),    /* black */
> +		MK_COLOR(9, 9, 9),       /* 3.5% */
> +		MK_COLOR(19, 19, 19),    /* 7.5% */
> +		MK_COLOR(29, 29, 29),    /* 11.5% */
> +		MK_COLOR(19, 19, 19),    /* black */
> +	};
> +
> +	for (y = 0; y < height * 6 / 9; ++y) {
> +		for (x = 0; x < width; ++x)
> +			fbmem[x] = colors_top[x * 7 / width];
> +		fbmem += width;
> +	}
> +
> +	for (; y < height * 7 / 9; ++y) {
> +		for (x = 0; x < width; ++x)
> +			fbmem[x] = colors_middle[x * 7 / width];
> +		fbmem += width;
> +	}
> +
> +	for (; y < height; ++y) {
> +		for (x = 0; x < width * 5 / 7; ++x)
> +			fbmem[x] = colors_bottom[x * 4 / (width * 5 / 7)];
> +		for (; x < width * 6 / 7; ++x)
> +			fbmem[x] = colors_bottom[(x - width * 5 / 7) * 3 / (width / 7) + 4];
> +		for (; x < width; ++x)
> +			fbmem[x] = colors_bottom[7];
> +		fbmem += width;
> +	}
> +}
> +
>   /* Common test setup. */
>   static void test_init(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
>   	drmModeConnectorPtr conn;
>   	bool has_edp = false;
> -	int i;
> +	int i, fb_id;
>   
>   	/* Skip test if no eDP connected. */
>   	for (i = 0; i < display->n_outputs; i++) {
> @@ -94,9 +152,16 @@ static void test_init(data_t *data)
>   	data->h = data->mode->vdisplay;
>   
>   	data->ref_fb.fb_id = 0;
> +	data->ref_fb2.fb_id = 0;
>   
> +	fb_id = igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
> +		DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->ref_fb);
> +	igt_assert(fb_id);
> +
> +	data->fb_mem = igt_fb_map_buffer(data->drm_fd, &data->ref_fb);
> +	fbmem_draw_smpte_pattern(data->fb_mem, data->w, data->h);
>   	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> -		data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.6, 0.6, &data->ref_fb);
> +		data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.05, 0.05, 0.05, &data->ref_fb2);
>   }
>   
>   /* Common test cleanup. */
> @@ -116,8 +181,11 @@ static void test_fini(data_t *data)
>   	igt_display_reset(display);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>   
> +	igt_fb_unmap_buffer(&data->ref_fb, data->fb_mem);
>   	if (data->ref_fb.fb_id)
>   		igt_remove_fb(data->drm_fd, &data->ref_fb);
> +	if (data->ref_fb2.fb_id)
> +		igt_remove_fb(data->drm_fd, &data->ref_fb2);
>   }
>   
>   
> @@ -228,6 +296,29 @@ static int backlight_read_max_brightness(int *result)
>   	return errno;
>   }
>   
> +static void page_flip(data_t *data, igt_output_t *output, uint32_t frame_num)
> +{
> +	int i, ret, frame_count;
> +	igt_fb_t *flip_fb;
> +
> +	if (!data || data->ref_fb.fb_id == 0 || data->ref_fb2.fb_id == 0)
> +		igt_skip("Page flip failed.\n");
> +
> +	for (i = 0; i < 2; i++) {
> +		if (i % 2 == 0)
> +			flip_fb = &data->ref_fb2;
> +		else
> +			flip_fb = &data->ref_fb;
> +
> +		for (frame_count = 0; frame_count <= frame_num; frame_count++) {
> +			ret = drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
> +					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +			igt_require(ret == 0);
> +			kmstest_wait_for_pageflip(data->drm_fd);
> +		}
> +	}
> +}
> +
>   static void backlight_dpms_cycle(data_t *data)
>   {
>   	int ret;
> @@ -343,7 +434,7 @@ static void abm_enabled(data_t *data)
>   		igt_assert_eq(ret, 0);
>   
>   		set_abm_level(data, output, 0);
> -		backlight_write_brightness(max_brightness);
> +		backlight_write_brightness(max_brightness-max_brightness/10);
>   		usleep(100000);
>   		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>   		pwm_without_abm = prev_pwm;
> @@ -351,6 +442,7 @@ static void abm_enabled(data_t *data)
>   		for (i = 1; i < 5; i++) {
>   			set_abm_level(data, output, i);
>   			usleep(100000);
> +			page_flip(data, output, 10);
>   			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>   			igt_assert(pwm <= prev_pwm);
>   			igt_assert(pwm < pwm_without_abm);
> @@ -377,7 +469,7 @@ static void abm_gradual(data_t *data)
>   		igt_assert_eq(ret, 0);
>   
>   		set_abm_level(data, output, 0);
> -		backlight_write_brightness(max_brightness);
> +		backlight_write_brightness(max_brightness-max_brightness/10);
>   
>   		sleep(convergence_delay);
>   		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -387,6 +479,7 @@ static void abm_gradual(data_t *data)
>   		set_abm_level(data, output, 4);
>   		for (i = 0; i < 10; i++) {
>   			usleep(100000);
> +			page_flip(data, output, 10);
>   			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
>   			if (pwm == prev_pwm)
>   				break;


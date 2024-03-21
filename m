Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD0FC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 14:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4FB10EAD9;
	Thu, 21 Mar 2024 14:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hmM7zla1";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C8A10EAD3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 14:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIkCSJNeXqIWERnWC4vZkGZqhYhZGYcpxAscCfqJk5sueKjf/7LEHZw0ekQMncB6tefc1tsI5EfM+JXlVybbPvpVLMqO81up01Ae2usvYYmD6jiwngaRRRUS/Fl/7Zj7wLUDSeflOzgYYwOrBALz7NpVG8IBU6wD7Os0Pl5IwiejUqZukUu5FwDmI58EkxQqjIxcSlx8pC9t9gs0iBu7eDRV89irXPzU77ziKPZy2+ptCsetfsle27lJ7xHFxH4pAOBeocWohKX2svqkqA8dFYiLUEwhEngHPsMZEgyL3hvx7Rzqe1wriJiNRtpSJnYURfa8YDsFkLW4xC6kbyhAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tG5dTn4A+yx+hsadJyglhx4Qek2LMFZhTmvMUI21J/Y=;
 b=oMcJDfK3vLx7LHViyl2n8Uqj6BSCg8EN3Y4rwtUDwkrUPr8hARbyDKHL0SUrLr5oyy0tu5fiXrK3FbNvAro6uTyutLeoSgMbLR3Flhe7F3d6tfgNaNXYeygEQRrYTIE2hXr1T0tsOLe0mZO2Qps9fieStC9FvVIFbn0IALe96lNGIo6/V+n2NIy7gxibWjuNOAwo0Bzz4N/8KTCzueIBZX9apqFZ45Cmg0dIzCj771fDnisIWpIaKFUM00KVG20uR+Yflo4FVFiG3Hit/ahd8H57Y2wI3iDd6B68V+d/zT05f11ZN2hQYp62EeYSQN02FUEtLSlEMvz51c5N/qtO5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG5dTn4A+yx+hsadJyglhx4Qek2LMFZhTmvMUI21J/Y=;
 b=hmM7zla1pF7Lo7cAxJ8Knls9WUfIxwfsGoiQLlO2Ki+5jJrQMOQkmROlOaFxIDZdTyZFWMwI1XUOw/t/Mf4asxR47ll1OtAiFIDhwLnfEH2+9jg+G4sy2K3mlB+YlLthHghGlIizmAsTDWIYCqkVhsfDCZgvBFPCCIidAJgD6oI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB8609.namprd12.prod.outlook.com (2603:10b6:303:1e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Thu, 21 Mar
 2024 14:00:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef%4]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 14:00:36 +0000
Message-ID: <e13d30ed-8114-4bc8-8872-d428f8a387ca@amd.com>
Date: Thu, 21 Mar 2024 10:00:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms: Skip amdgpu's writeback connectors on panning
 tests
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: rodrigo.siqueira@amd.com, hersenxs.wu@amd.com
References: <20240321020646.844372-1-alex.hung@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240321020646.844372-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0023.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e87219-8c71-4e57-78fd-08dc49af4826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FD0faZQPufGU4ofm9pHK7obdxYDpG0ROmfj6mWACZMqrHD1emgnJ9kwyYEp4y1F6CghoYVrHQFSRXbM/9bAU33whbSst/ZQ2dCcMyZcHlxuJ5iIjNYzfPqOygcZJ/mQKpacBkjGqWkXwO2zZjJB/uSBwNY1w5PUktzz7LXa3xaJGUi+Jh4qf+giv2NOKN4nifnO0xvZPQ6JfzcREIRfW40awhPI8Uf8mWT6spF6ROtS/y05Op/kF0DI7ZrqKuJ91UXeEH9p1eFTZU3nm3Xwa7j04nj+EEJlx1AXmih0WqNk1xSY17nPklkWydU1evQaHiULxk2DhwH8HmaPYaLwbIEYM/fvuYjweY4NhLCFZvAeaZcuIpKEqrOf0j0eao78+7Ff/zm/Q3slrFg2WUYFMgPhlV96nRfltHDd3k5a4vwSt5OFkN+KLStBrOz5oZ2wcTlOF1sM0H7qHr5Gc/MuqeTRi79PgiXLUXS/O0TFu3FhLZiZ5zLD5xLB1KD/vPAhxVfiZL/OpUV4SQzRWoswhgkY/JH/hHgqzAdc1LmTyqy9zQ2cpAQDR5ALZBtGEn1WxZmAE+88hVsBhU04eUizmRziWq5l0rVcAIvSbKcvs/5PFNQUt79GtLZdGf2MkR8tqt0YW0z+fmwl68ZRlz6tWtO8+4nTcUTSh5FTEu+WIJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enoyT3FWcFZKbjJxNk54Y3ptQzNicG5MSjRVWHNjelBPUVpmY0lwYlhlRlAz?=
 =?utf-8?B?TFNLSlgrQTZNSkZKRk9aVjZpQmpZWWh3OCt3TjB1cCtOQkZITjFDcTlGWXZK?=
 =?utf-8?B?eTVCdEdRbXZNME1pTjVBUWhIelNxeHF0aXdhdEtUZXNqRW5GVHhsTWhTNjBG?=
 =?utf-8?B?enpQM25wd3Q3ajNjRmt0UjBxaU9rakYyQ1pMTVBmT0RyQnljNjV5bkpHTklH?=
 =?utf-8?B?TzNrVVg3TXdnMnd0aWN1V1VoYlQrQkpYMDZMbmpRcHZ5RkR0eHBLYUMvY0hz?=
 =?utf-8?B?Ky82cm1TSHJ3SG1valFRSVNVQk9ydDVoOHlJbUkyY3dJa0VHNnlNcXovdFhF?=
 =?utf-8?B?WG1tMTNBS3dkdmZid0ZsNDJJWUk4ZEpxbEhuZlV5cnR3QmZndXFBdEdWcnVS?=
 =?utf-8?B?U2xQQ1NqTHRKV3pNbWs0UU1TZGtZVXVTU1BlT2RPd0o4TE9qcjBDRTRqbENj?=
 =?utf-8?B?dTh3cFF3ZzZRbnhrWERFdE9oY2MxcU0za2U5aHB5TUNkamx6bzE5RlBpNzFk?=
 =?utf-8?B?SnVhSXNhcE0xd0U1Y2tnaGF6SHQ5VnZLRXhLcUpzTmJWWE1sb0xvcXJNNWZW?=
 =?utf-8?B?WDRXcXU5RGpYQytwYll5ZGlKY1hJNk5nS2E2dnNTbkJ3TjE4aVJQQWY1YlVO?=
 =?utf-8?B?NlcyUG9uS0VDNDkyT1hTZm82b1JOdit1enFNSE0yenhWd1hERWZlaFNkU3hw?=
 =?utf-8?B?dDQyeXlNenExdFp3WlJtQkxkTXVpSzg5bEdpbzQ5WUxyRTczRWJDdU9wT0ts?=
 =?utf-8?B?aGpyRjFTdTZaWWtMMGNKS0FEVXJYc0lBbUJFcHNpTTQwME1yemJyQ0g3ZXAz?=
 =?utf-8?B?dFlBb0QxT293aDAwUUcwMkdSQkp3eU85L3QzcjZIR0NBNC94KzdhUjI0YkFY?=
 =?utf-8?B?U0tIZXlaVkliR0FiWEhmZVJoRFdDQnJrdUgxSCtwVitSZ204S09CeHVKeHph?=
 =?utf-8?B?d1o5dEgzeVduMitPRHRqODZGSVBHYnJZSWF0M0hmVmxBbXZYK2l5emljdHBz?=
 =?utf-8?B?UmpjMDBHT1RJMmIvcXhQL2trZWlyaTV5a0VoU3FUMlVPOExHS0U4em5GR2Jk?=
 =?utf-8?B?SU9ua1c1bkhRczBPNmgvUVVoZW4vUndkck0wYk1LZWJQZjkwY2ZERGVVY0Fm?=
 =?utf-8?B?K0tuRlAzQW1xYjc4Rm1JZzlRVHg0Y3A3RzF4Y3BRSk83b2VEZHp4TzNwcFBl?=
 =?utf-8?B?OUJOS0dROERKMkZCN1JSeWU0UTVTcTIreGp5cjMwSkFqMmZmVU9NVUlYeTI3?=
 =?utf-8?B?RGo0NGRSOTY4bUhaTHpZV01XbElwRlFabVBPVjZOelpoM24xMFJPckx3Q2Jz?=
 =?utf-8?B?cWNYeVJNWjBaYkFTMmxCVDFtOVMyS3VGcTREb0tYYlBjSkhGSVpSRmR5dXVH?=
 =?utf-8?B?MFNJd1VjQmxrZW93a3NhMFQ2RUNzUGwzZFJNWFRta05wNFdiMzlGbllReWpE?=
 =?utf-8?B?S1RBUnF2SHRNYk5SaFRxY0lYdDd2V0gwSXVhdmRFRXRKbGpNcFhZZTFidURa?=
 =?utf-8?B?NEZCd1V6WGY3Mk1tc2JVYmMxYzdEY0pEcE95dlMvUUJuOFNPcXUvL0hRRFE0?=
 =?utf-8?B?WjdLRmRPQ2I3RWJ3VDMya2hPQUxuOS9JQ1JmUnBycnJEQUc5NnVjOHhWWXFQ?=
 =?utf-8?B?RXI0Z0lyczFDUE42UGFSbGl5bnZOREE2SUxkMGoxV2ZzOXVMcWV3MXhROTZH?=
 =?utf-8?B?Rk43c0NlM3VzWlRWeXRpS2ZJeGdLTnZxTUN3ME5DSVo0dzVDQWlCWUhSemt2?=
 =?utf-8?B?cC93YVdoM1VDRDJTbFpGNzhVbVFoZkVEUmFKQ2d6L2pPRGFZcmx4QUhEa1F3?=
 =?utf-8?B?MmRzNmFVSmh4S21pN3FwcFQvcHNoYnFycHdORG5nN2RnMzdRL0lDSk1PYWMv?=
 =?utf-8?B?VHVNdUcyT040L2tBT05NdVQ2YnJMOXlDQm9DUVFiV0xNVWlNMFdWZTExK1B2?=
 =?utf-8?B?bGV0VW82NFFXNTF2aFRNRXlqQ0hSNkVrdzFnRG1tS1ZpcnR6VmxMTTQzU3c2?=
 =?utf-8?B?NlJwdVR4Z1drcmVvV1diZnZmWmZkb2VPOFg5d2doMExxd0JDcmNOY05YeDlh?=
 =?utf-8?B?blJTUU5lNzJvWENkcjdEZXI1SG9LS0RiSUpjR0l2Y25CNWlLaldQaXZ4S2px?=
 =?utf-8?Q?buRNwJirAUWAzZhTim1kYgAm3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e87219-8c71-4e57-78fd-08dc49af4826
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 14:00:36.0074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFAzVnrPxql4YznXwcuMLE3f48z/QTth2u7dsR9MfCZOkIHpyCK+6gulv7QiVgWaD3gyMr1sjLEJSEAj9dC9+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8609
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

On 2024-03-20 22:06, Alex Hung wrote:
> With commit ff1d9a601 writeback connector will be enabled. The
> AMDGPU writeback connector is to be skipped.
> 

Why?

What happens if we try this test on a writeback connector?

Would we expect the same problem to happen on other drivers with writeback connector?

Harry

> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_plane.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 406aecc04..d76b3a8f5 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -482,6 +482,12 @@ test_plane_panning(data_t *data, enum pipe pipe)
>  		drmModeModeInfo *m = &output->config.connector->modes[j__];
>  		uint32_t fb_size = m->hdisplay * m->vdisplay * 4;
>  
> +		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK &&
> +		   is_amdgpu_device(data->drm_fd)) {
> +			igt_debug("Skipping Writeback connector\n");
> +			continue;
> +		}
> +
>  		/* test allocates 2 double-dim fbs, add one more, to be safe */
>  		if (mem_size && 3 * 4 * fb_size > mem_size) {
>  			igt_debug("Skipping mode %s due to low memory\n", m->name);


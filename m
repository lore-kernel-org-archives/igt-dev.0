Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AA2C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 08:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E7710EDD4;
	Tue, 26 Mar 2024 08:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObCKNWuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E7D10EDD4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711442440; x=1742978440;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sLCP2hALLaP98R4KfVAX/DlOfm9A0oZ5JM0PD8qPRUM=;
 b=ObCKNWuhq+t9+L2AbuJP9fNgQuWWmEB8W5X9d5vgyGb63yqd8YSvbrja
 vcBxlE4TYVTOMUmTFMsZgzjg+KG/xPJgnRbxj6Zu8Cy+M3/AL6ODwbdiD
 8TNDAC6eMjr4x4ebmv/lBJGrMaZcS8sFzRgdcIAn12+dvBQvZ0vMZ3SSo
 0jIrwvIiJNVQKYEAKAMAJ6ICmQOmO+4WKYGjGZdPTW94YiszmFviQEytZ
 FdfekcWAa4Mcgl2C75VnNnAwBG0Rm5bMc7M/MJ62OHR/7qiJ4uOhyk/QZ
 d0ASG3u3/7nV64PJk+Ah+ran497tssu1hqZjQR6QxH82Cy4hkqDiBBY6Z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="23967090"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="23967090"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 01:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="39010590"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 01:40:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 01:40:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 01:40:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 01:40:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 01:40:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fR+vkTIUjraI0C7NPg/r7b8O3WGcNphj9pAbYwkxIZ2dGAEMWUB7mbUcdfa5GXM1MsiZZTgIWrZYiED1ip2FhHz1KmFZOeXa/QKghJLQQ0Nj+ulxp7j5+wfDfC6L3wgObBxJwWWfNtywLMIMMXv0G+2+10Fj5Ufjt0twxTkbPaBThRFrM3nK0ic9T2kTca44kYVlmKbQhwj40wh1EA03BmsSwzJxbZF7/5Hq9EKn7R9+OPunNkNeul754Tvc+3rKg0a3T0Slr5p4SEAsSmTYg/dmIF9wSVyK+1npIJAmtAoe3SobnX0J+nmehniR7jetctq7ugP14ikzQiSRodwu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuenIF36PDIWVb7O02Xcqokn9Vk2paBjDHy0GGUz/20=;
 b=YRG4dmoRrVfd18fSy0a/OLDtM4iO8+4ZNh9l7DUm85NFvVuGqdXwT3sDQ0r9u2TyPOKDPUb3qSqa4pVymwG7wkHMhcJtaXAl5rwJwZhV3vP2mTJ/8B5KxD+eN+yxBnWDeQmjdUmzyPzwArMS2yyNwPp9l3vFcX9m2u9Z2EeF2LfAQxWr7r+SL+BfMqw4spyC56SI7XvXDQ9hnJ/MaGs1Eu+XJ6RR7TTQ9EaA+rYACm3awm1CZrbjbIwdLx9QgcoDInM3y6MQHul/u9ev+MtGof3R/PQ2QvgrjUBqZ86nkBbkIy3T2fu3K9aRMGda2J32RundBWlpNmNwg7rmvPQS8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5685.namprd11.prod.outlook.com (2603:10b6:8:20::21) by
 SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 08:40:27 +0000
Received: from DM8PR11MB5685.namprd11.prod.outlook.com
 ([fe80::ff59:458b:28e:4346]) by DM8PR11MB5685.namprd11.prod.outlook.com
 ([fe80::ff59:458b:28e:4346%5]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 08:40:27 +0000
Message-ID: <6e6228d5-e307-49f5-a4f6-6d3049e47391@intel.com>
Date: Tue, 26 Mar 2024 14:10:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_bw: Fix the condition check for max pipe
 count
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240321052454.377561-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20240321052454.377561-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::21) To DM8PR11MB5685.namprd11.prod.outlook.com
 (2603:10b6:8:20::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5685:EE_|SA1PR11MB6733:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3zNixMnyuSptpY7dE14eJ0L/1z8hzmIw+z301S+qQO3MtooxySrWNNwjwlrMQAYNrwewwUn9rd1BoW4/ACj95v56rkpc4PUdxgHmrKAwTVdf7eWygUVsBrshmzmS6cogyr2bVP5CJ8EMXkb8YuJTTt/H4EzJQfGFmiv2xXE9KpXPw0kQK6Toy6o9d5YdJWO9ViNb02M1RJ4PES3F6+Aogm3SleuwcnR+ZGeW8LwYxf2A6/VS3C2lGU/WzHFXN9jnlhZCuh3bY3m1No2i0UWuhwPXrQcB4ml3J6tP3VArFA6snusuJfy0EHaiZ2xhClJ84PZU7vhEfyUkDcltPdHXe/HjcVbEWN3AShnenH4xYlcpFg2BeIulDpibqSk5pJs8f3LBYwo3PwP6emTPXf22whn8Fa5xXkqCEVQ33wyb3OTmOPFFt8DVxNqclXLc+ijAW0is7Lgc61s4nuY582dnQHNFIfDGH8uRbkre4ID9b98CKNqDbXSwvWoNFjTLHN7+gaLwMHBLWPmAx/5blqAGTqFznnIvk5wxC6b4vsDK9Oh3+ENV3nB+/ArYvUnQng14dIV9pBhu41cNgcqki5XS/U08K+GlJaK9iKmluqlTTLNREYo4mEzKlYi2gLHdAKyKHbZIMmVbAg1EEVNTj36fm0QCYaSrDeB+STEehrXOWw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5685.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2t6WnVoalB0WnB4SFZZS1F2aFZyZExkTHM2ckFFVUU0eWFaS2lDaEEwOWxh?=
 =?utf-8?B?UWVUU0JJTmhMblVVRFNBMWhZRlIzazZoc2psQ0J6MjBZYmNlZ3NLZ1g0Ui83?=
 =?utf-8?B?cU8xUWw3dTJ6VitoYzBJWG5qQVZiNFcrRzN5WlVKNysyTTFZQ0J3VElXZis0?=
 =?utf-8?B?L2ptTVpIK0YveVNOM1JCa1k4RGNlZXlMalBuR0Q2NmlrcmVuUUg0YmN6WFJi?=
 =?utf-8?B?VzFlNlgzR0NOTXNXSExCL2lmcHMwbk1jeHU0aXlZMDF4elduQzJOeUhtZ0dE?=
 =?utf-8?B?SzFPUHdXc1A1T3ZUb0ZObGlLWHZHVzBlRm1ZNGlOMDRUYzhZakQyUUw4VVdx?=
 =?utf-8?B?U2c2R2JoUjI5QmNqWDk0OEs1WGJRVDRoM3gzZEtYTWZLYmhST3NQUDdVMk5V?=
 =?utf-8?B?TW0zS21QeEhCRElHQ1IrZmhZdXYzdmViR0FVVGRvcmh3WUN6WFBOMUpuT2tw?=
 =?utf-8?B?YzF4M3JIcGxkaXJOU1BrdEVYcXZiRXd3clJsVmdpRXoxQ0F1SjFhT2JPMEhR?=
 =?utf-8?B?VUJqNWtiQlJKeHNqYWRCM3FIUHVpR3EyQ2NiY2F0b2JkU0U4WFJ5a0JlVHhx?=
 =?utf-8?B?U2xwNDRXNmZzb2pNWW5kSXFCNnp4VU1KUC9JNnhQMEw2OWN3Tks0ZmF6WHov?=
 =?utf-8?B?bjhWSFc2VG5aSWV0WHdFdy91UkFESHdYVnliVkxmdjJxREhSY0JwQjZ0bHFO?=
 =?utf-8?B?Rkh6d0hSQnRQYmFsL3JZUTRnaGl5ZlkrUFBkWmdXR3dkL3g1OS9TTTdVZWI1?=
 =?utf-8?B?WEtGa2l1c2ZQeFFNb056bmNnOW5NaXRxd2NZb3ZsbWpyUzdSUWlVc2VGTTQy?=
 =?utf-8?B?dkVCblBLRWVyRm5HVlpxc3JJTTdkcE02TEU2MkFPZk1BcFlhNFNLN05KU3JQ?=
 =?utf-8?B?M1NueFZjcnAvbWRqNkZTRHBjek5UeTBDU3RMdVB1NkYwSy9YcS8zOUlUejUz?=
 =?utf-8?B?b3JMSkl5S05wSHhCdGdSaktGT1dxNjJ1YTFtMXFlYkxHcG9SSjFRSnh6aERI?=
 =?utf-8?B?S3psU213cTRNVnM3QWxwYW5GSnJxNDRINDBscDA4R3ZHUDd1QnlSS1VLNVcy?=
 =?utf-8?B?bE1RU0pSaHlaVURWVm5XdlBuOEtIdisvb09QOGdKN3N4Rjk1OFQrODhPOFpm?=
 =?utf-8?B?SEs1WEgrczAwOGx5ZU9NTGE3c3RDZys5WlNmVnJRMG5LNWxmTG5iOFY2Tzkx?=
 =?utf-8?B?MHk4dUJFYytPZUtiRTZnNWdnN1dia0JpQ2FMaklaQVpyOXhFTHNlQVNmbU9p?=
 =?utf-8?B?RERSUmN0ckZ6SVRyUGdUc2VrK2FjM1hMMCsxYlpGL2ZEa3FySkNjejRZSUR1?=
 =?utf-8?B?V1pVejA4WXZZamxQWTlhaFFQems0ZzFkSnFvVmlWclZES0FoWU1veDVsRWsy?=
 =?utf-8?B?MmFwemFVbWx1ZkpEMWdWT1ZmUFZPM1RzLzY0MDJ5TTk2ZHVxYlpvYi9KNGRw?=
 =?utf-8?B?eFJPTEpxZk8yMUdTNEsyNTBUMXVaTFluanhyb1plZzBoMVN5SlFsSWUyUkFl?=
 =?utf-8?B?T2EzKzdVYmh5UXEyR1RKSGlFMGJ1dXBrcmNITXpUTFJLUnVhUzhXbU9RUjRh?=
 =?utf-8?B?NXViaWxJTE8yS3FNMmRvMTFpMkxPaU1rQU93K21ZVEM0bmxwZEhScWtEbE1S?=
 =?utf-8?B?aEZadVpJZkZ0TGFlZGRMcWlqTkxUU29CUnh2aWZpUFpiTHE4US8rcUQyNjIx?=
 =?utf-8?B?UzFINXNKeXVLb2o3eEJib0haVTJkdFVyQURxdFJZeU1xZHhxNUVPR2NIcDJR?=
 =?utf-8?B?YnREMklQWHdaQ1dLc2FoNWZ5c2FlakFPbUVuU214cEJHRDFYNUxLNTNqc3ZL?=
 =?utf-8?B?TmF2WVFGdzFNTkZKYy9vVzZIb0lTNVVZV1Q0d1g0MnpUazE5cHlaT2FrcklJ?=
 =?utf-8?B?ZHZrbW9oMVVRbFNBeWkySmVESzlBemc3S0pFWFR5Wms1QVpOYWlJVWxKNHFu?=
 =?utf-8?B?Nk9Xc05SWlI2S2I3NFpLU2R0LzFWbzR1b1pCNjQyalR5aks1NHc1ZUNqYjNZ?=
 =?utf-8?B?Z1kxNmhsV3p0ZXpHQzlVcURMTTRvUU5YcDhGTGkwVU03dTZlS3puQUg1a0or?=
 =?utf-8?B?clJEVTUrZ0xyZjdacDhFaEdiVE4rUUJzL0tDWEpVd2E2bkp6UGcxTzF4b1Vj?=
 =?utf-8?Q?sgw6TYDNfDpToF+T5wu+1x3vr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 596ed8e8-9264-4f4f-ffe3-08dc4d706301
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5685.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 08:40:27.6225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGDzpt7LlfAP1NFR1yAuXsSUoGu5+f0VVaVC2AL3t8se6HyynYzLfoQTIKkaVuBYU/lFzacykq4ICxndqxDb6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6733
X-OriginatorOrg: intel.com
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


On 3/21/2024 10:54 AM, Bhanuprakash Modem wrote:
> Fix the condition check to skip the subtest if ASIC doesn't
> have the requested number of pipes.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_bw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 96b19199d..05f7e79ad 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -186,7 +186,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
>   	for_each_pipe(display, p) num_pipes++;
>   
> -	igt_skip_on_f(pipe > num_pipes,
> +	igt_skip_on_f(pipe >= num_pipes,
>                         "ASIC does not have %d pipes\n", pipe);
>   
>   	test_init(data);

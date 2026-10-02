Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F58CA5FC4
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 15:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D9510E4D1;
	Fri,  2 Oct 2026 15:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h/idqbEE";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BB210E4D1
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 15:02:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkrGqKFKVL6rBu0EAsAU40v3bJ0ZA0t4f0ZIARU227JstSfTZ/Wq74EhiCQgdsK3bUAkanT087wrfN9ifZNh0+VRcJSFac/eU9cxFTtVX+Rs2fvbCyccVjBkxcvdhifyVDtrokdO+tSXYdreJM8ggF4Hwy6CdcfTTbhL9mJT59a/fgsXY/ADeLSQl5BdIGgdHP/kqgv2AzlhwUS7iILvzKd+8+MYRBnrhNBT01aB6H1v+YSk1BrbH+sRVoUPNXSREuZc/R6/E0dRiFfZDZ/A8iZOq/ynmocqGX4+fORCKSaXuUYqrRpk40cfTWfT4uCBSs4oYvHfQ7gZE5DFAf8E6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf7aoNHQxUeDJykovsaGocNzzmCw4+xoZPdsxM79C2Y=;
 b=Nons7XC4dbs0LXVxiPQgni+aJzthyFW/vsZJbqIiySK3Kq47MQhV0Lft/CU5r0tM0ygph/oTV+JnYRRtqgvtt/yOaur5kidYerI1+Xcfcg5p02GT66SykWw4hTqiCWpqRUDesPcNtD9mL7oPTXB/61NeyWd5dQfvU7EJ5Uzli4cTBxQ2hsypXvQ6QwI4bIx+BRm0oLDmPbH0R2mO2cHLX9Ecf74PUGYRycIFLg9RBCgLogdmmQOeocU+lKvOJ6MA/Z0HwASoqLKXs4jsktFs7lgOpqvFAAnOw0TnmJZyP69+z9tenMohOb4Aqa4GSNBmdE7/POM06Yk8MRBtzXAWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf7aoNHQxUeDJykovsaGocNzzmCw4+xoZPdsxM79C2Y=;
 b=h/idqbEEoD252lv4+3CP7BnTAb5dAfYExKRbYjvmKpdOdAuFdnZibjPmzcyzjKwYeT6fqx5bsaMnIoqujVSE1+ZOBA6NHZH16UYTAbYbzAflFLrNT6jjFPmZGMJS46xEmDmFAdoCWug2AybySvG5FFqKamiNttwdSdrGle8fyzA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 15:02:50 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 15:02:49 +0000
Message-ID: <65fbbaf7-3e31-4504-be14-d2050cf4efb1@amd.com>
Date: Fri, 2 Oct 2026 11:02:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] runner/executor: Fix writing endtime
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20261002130522.42708-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20261002130522.42708-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::6) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d2cd17-fad9-4b62-0d6b-08df2096394f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|6133799003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 2+x8azkLQrfk1XKnXWh5NWwwyI792OUbXfbquXzHXYOfFAxzmk+EtFTNZeQb2wNmTvcJtaeM6BtI91/h1jqQu2duMQeNOLDs2pgYpZzMsabEhepVGF/b34am/QN9JEkZTdlp9J8kza1o1gbKcTu2Fc40EyxDfa1riYx220rh9+PUkRZ8TBbB0AsAn8nFGFA/R7+7vLfUO9KzGLp4HJDqe4XkaLn176TgG5Bg/5hRGaDVh5AJithU4S9ut0qONlca2JfVOuty2EqJcvdW0jDtmHo1jhFNrYR+3dhhYvHD9AWCDP+GQWIkNVgUjUxE5hLE/m12iFWRRFiq8JjFA91e+x9Xdqj+oYnoB1d9pck0TFfTjRN9+l+5MUxrT4synhWm7cmGsnjqN4Z2NNkWUJAJDqVcdbW8PQDQYWXm9EPCBKr1ccU7gyizDUDDNYP0Oms83rk/mb83u2qHuFdo/jKw0TFxIlyE0Cli9Q0Xg/k6mAQ0yly2L43RD3EnM3jBA80UcoVSOYzf41FP86CMoTbYL1SVI4CSz2i3eTtf9BpKyeJdWC0n96ELkpnrtmtOOYGSWQ1neAMLOgwNQzyjihMkQj5C63+1X4tiOQcJ9LsZag2jxLcTnP9zPJQ7Ckp/tPoXbLiNItnd88Al9dqJQpIQ0uogKSR+zRvbqmFkBhUH6Oo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWZqUmpHYWtlOHBiRTd2SGNseFNOWk1CRTlhL3FPaDkxLytFTjlHN0tmQ0VG?=
 =?utf-8?B?R3ZybHJVZ0lSNzhtVEI4eThDQ1pveGVSMmRHdi92Z1loRXhLWVRWL0wrZ21L?=
 =?utf-8?B?OTBwaDc0UzZRNVV5WWpaMElZYzA2RUE3U1ViTzlMdnBYSVJCUHJEUXpvSmVl?=
 =?utf-8?B?QklzQmNqeGhhLzhycHB3cy9hQnFqK1c2TEN6eStEaGlwOHFIS1JTb2ZlVkcz?=
 =?utf-8?B?d21YSnd5aVpPNFRRY014S3FQYUVEMnN3ay95T0VEdFJzMk9pWjJZdTFmb1FX?=
 =?utf-8?B?YkFoNElnZkMrY2QwTzJKWmk1NVNFQ25LeGt3Z0FURlV2K3VlWHorMk1zYWxq?=
 =?utf-8?B?ZGRzaU92MmFVb1NmSDJmUVlUUFpSTFhsdUFUYUtUYU1QM3RNSDhhbEN3MjZh?=
 =?utf-8?B?dFQ5TkZnTXdzc2YvU05wOCtIYXdyMjhERUUyZy8vQ0VHVkNkU0FpOERMSXAv?=
 =?utf-8?B?S0M2N0MwM3p3Z1k3UERNMWRyUTFudkN5Y3RCd2l3WWE5d1Framhzbnc4Zm9q?=
 =?utf-8?B?aHhSS1YrVm5keGNocDd0a0svajBqQ21sSG9ySGNzSGE3TkFRUHVnMHF5VFB2?=
 =?utf-8?B?RzhaSEhFUk1pUEU2d1IwR1FZcEE3Y0I0OW12eE9MY0hOcW9DbUc3YS94b21R?=
 =?utf-8?B?RHNBVTQwenRMYUttWklPL1pVWVNqWmNpajlBcEFHTnZ3UmV6UnBWRVNXZXo2?=
 =?utf-8?B?MEZLSnAyd01OUnlUMTBJSmNVdHpFeVlvajRRSmg0NWpQL05INnFxZnJHQ280?=
 =?utf-8?B?aUs5RXlpRFNHdnlwQmd1WGxDdDFJeXJnUlhKS2FFYW5VSkZyTGZ5R1hIT0ho?=
 =?utf-8?B?TEJYZWZ1ZFQ1MDkvRHdLbWFMNHU0V21Td2JlRzM2d1FobTJmSDZwVkI3RzVm?=
 =?utf-8?B?SmR5MERlc29tNnZwNmhWcUxsbG1uN1JlWDNNTE1XZDBNVURNYnArcWRzVlg0?=
 =?utf-8?B?aHBUKzlLc1Z0aW80ZkY5RUhVb0psV2JyUHJJMVVNeHBveThQVHN6aSt6eDFU?=
 =?utf-8?B?SFRVY2w5WWlVY2RJd2puR0tWT0ZkTGpTcWtmTENzVjVzbVAyN3R2ajBDVWZM?=
 =?utf-8?B?N0pTYms3VG5uSUh1Nk1WRE03UHExUUYwdWNvSkc3TDB0eGxZUVR1UzBkZGJ0?=
 =?utf-8?B?WldJT0pJbDJ2OFpoSnlSa1JpRjdmdzFDR08wQXZieVB2WTZCWHYzUVFCSHdK?=
 =?utf-8?B?alFDaEhnMGM0MHpQOGprV0ZhVGR3SWNwKzlHN09kTGxSQTRDbks0L2dLd3dW?=
 =?utf-8?B?bWYvMnRLY3VlUGp5eHhPbDlZSStRWUpKVThOL1NHTjRvVWl3Mm11ekpMVTN5?=
 =?utf-8?B?VUFIUHppenZVQWJuWFc0QmFMZkRaWnB3blpsM1dWTlMzOThqUFRQUmw1dEdy?=
 =?utf-8?B?M25WejVQQnV2dElGd3ltdVNHUGRoMnRuSjNob1ZwU09HMnlZSU9aa0ZWaElp?=
 =?utf-8?B?Tk5ncUFLbVNxMG13UkEvZTV5bm1UWXdIN2ZFYldTTlZGYmJOSzdBdzIraTFq?=
 =?utf-8?B?SXE5TUlXRThIV0pVMmtwSEcwZ2p1TWRBeDRRSUJFOFNiRXpNdFpLVlJjdU56?=
 =?utf-8?B?ZStiamw2aTc4ajgrc1lBbFB4TENJQVo1d3o1RlJzdUJoYzJ3cTNJWHQ1VVpv?=
 =?utf-8?B?UjBjem5hQldtdENmSzl4MnkxcVlRVEhGWjFvekZSYmx1SGdDd2NHb0xROTVZ?=
 =?utf-8?B?aHNQRkhuQ1MyYnlMYnVNMDFUejQvMGlDaFVZb3V1V3VwVG5kTmlmUjhZQkI0?=
 =?utf-8?B?b0QrV3l5Rm1QU25nbEJmdENWT2x1TGdyeXB6SmFDMjY3QlMySVBoVUkwaGhT?=
 =?utf-8?B?TVJ5MG0zZ0t0OTRmNTN2V3dBeHVJZk5tL2kvN096T2hrV1dyUjdpay9KeGE4?=
 =?utf-8?B?Sll4dXJ6MGFrNDhTaExzVmIyTC8zN0FUNlhMNkFiTUdaZEZXdzVqQUlrdmps?=
 =?utf-8?B?Rzdma0tVR2t4VVB1ZWhhd1JscGZXNTN1ZzRzZjArcmRTWVFibk16S2IxdEw0?=
 =?utf-8?B?Q0l6dlVZT0kyLzRvb0MrbGkvaE9pR25UZ0VHRVpLZzVQTG8rdmg5YjhmM1lN?=
 =?utf-8?B?Yko2SEtjaE9iVWozR0Y4WEpzOWdUSEJRNEFtT3ZBREpsem9FOG5pUXVMN3VC?=
 =?utf-8?B?QWk2WmVEcEpqSXVKUlFmc3JDbW1tSGhOZFZ1TGlpeS9HckFiSE9WWm02aGxC?=
 =?utf-8?B?NVFtaXlzN2U2TmR1ZXdMMXhwS0xJdkxIcmJiTHQ1L1BVeHR2bEFBaUtMVENy?=
 =?utf-8?B?VTgwbm1INGpQT1FQQzhTV0J2cUxJSlBoTXBiZDBZcnlHWk5iYTlBOTc1cUdM?=
 =?utf-8?B?TU1oMFRkak55UG5zbDNzQXNyWHJSak4ybUgvT2Z2UTlXdkhkMy81UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d2cd17-fad9-4b62-0d6b-08df2096394f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 15:02:49.1554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZ3t+mxZnSjgiUl5Yorp+0Ltn2xMovEIQ3bb9xrT/mMatA4r5JekL3Dg/Ctf7cF6p8HgYuFDdWxCxe3dcJbgqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
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

LGTM,  Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2026-10-02 09:05, Kamil Konieczny wrote:
> When option --save-results-after-each-test is set, file
> endtime.txt is rewritten with current time, but O_EXCL option
> will make open fail and this in turn prevent creating partial
> results.json with already executed tests, except the very first
> test. Fix it and use O_TRUNC instead.
>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Fixes: 8d3284b5ae16 ("runner: Create results after each tests end")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/runner/executor.c b/runner/executor.c
> index bbe011cbc..8103c2a52 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -2480,7 +2480,7 @@ static int open_comms_if_valid(int resdirfd, size_t testidx)
>  
>  static int write_endtime(int resdirfd, double a_time)
>  {
> -	int timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666);
> +	int timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_TRUNC, 0666);
>  
>  	if (timefd >= 0) {
>  		dprintf(timefd, "%f\n", a_time);

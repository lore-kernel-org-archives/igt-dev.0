Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5057C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 22:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B5C10F0A8;
	Thu, 18 Apr 2024 22:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ybw63xSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1D010F0A8
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 22:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713480718; x=1745016718;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NFzo6teg4TXnkOFj/FYixyWCYFCBPjrcISI0vn+zWvY=;
 b=Ybw63xSJNjd+jexL6hLdiHjucFtb9dYR35kOmSkf4mcwkaxBNz/AIG6L
 L9yod9u/ZX3pwJope5AhF+TmDnf1G429QsnMV1JEWtSp6aY8U5VlETgeq
 qr0cHNcAitu6SYX7T7lJVyoF/NSm2ZgqJmk3dOMo9gmVnbm8BzsBFKe43
 4KmxFRR5nZ/mPNvdFUgnWsblXp+MfPEm8Lcggjr3qDfRqHS03NXWlJ1GR
 L2YT8R/shfwDdk4CYvegHz91MF6SfwOVNMs9wFWVdL1VpYyNMFrN6CYf6
 fVSvJ0lnoMaqSh2unOtuezWvgbmozGAnVZ/+qDGaIpLy2Dlqr6Co903f/ Q==;
X-CSE-ConnectionGUID: uTUcbwbGSlaXdtgNMzLAGg==
X-CSE-MsgGUID: Sz69jhWlQEyk69VS3GVrdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20202564"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="20202564"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:51:58 -0700
X-CSE-ConnectionGUID: COSm76XpRLKX5rUEONvPEw==
X-CSE-MsgGUID: 7AnGzVNyRia9a50Gn3/qng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23202442"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 15:51:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:51:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 15:51:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 15:51:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2KkiIVu3C4dTHyGdJUe0LYxYKqxkPcmQLjtnNDwqpFNoOl1gg+gn0xUhdR5HSOxknxHMdg2BzH/OS3hAxB0G+pSLyteVLnH5YhVMgVD8uIXmQHF0QHVapcRgkHnwk44waIWMVgNXFJYMCXceJ4e9BH9v2hqml19yq52p+GupCa1TCzfI+XD/FLNGM1E078oRFO46rTyiwg553a1+nIpJiSL2LUTSBXN/QbE8PdwD+La7r//kRnrqZOGc6SEU+ZjEAqD2Otiy5uwjQFuKtAuS2MYw8/v5g2z7fNib14Bj/B5TeDMW2eaQzMHOMluVAHZeR1IInrVWz06TivbTJ5STw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lkh7OvXI2G0AWD2BigJkmWpfBbmLpRJwW6CF3qiM6c8=;
 b=fsaF+8peRWbFZ4G0bCqWeyDnLJTM+lQ/gPlNkDADlWCxIL0VN3dh0XimvnMYXtRJ8bZFt7fhioRs4Eih6RW7zcPNvZKGQTdaG2LcAJp0O4BeHJBeVGwtjwoxh6DsPyz3i13cCnxuWC8RaEExdgl5DIqEQ3RtI8G8csmwSa6/SlDSlhcsAEQt8+B39wjKmuImgL/k7c/HMvGSj5Txf5Ob+kg0i5ycp6JPa7e30Dwz2re6LVvY6mDA3y57vJBQK7zJO+mRYy8QIDdFMJShh4hVpgjuT+5tXHklK5C8I7Zp6ifIGwiLDTiwS0HFDfpJ0u05jCiFeXcEXNT9zWr1Gtx0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Thu, 18 Apr
 2024 22:51:54 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 22:51:54 +0000
Date: Thu, 18 Apr 2024 15:51:51 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 10/12] gputop: Extract method to update console size
Message-ID: <ZiGkB2hXJH+YpyP6@orsosgc001>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405060056.59379-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR20CA0036.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::49) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e163254-aee4-493d-2cee-08dc5ffa246b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CfHxBBQCuzy8HoG4X1qEhlVhOlpapNebAdt553va0OlkAyfHvj7aYwgFp0WDqESWXekZX9Ob+jwU22C/Q6dTFyVPKRHDwfeo2uJIpG91man6gzLsEZmL3QrhELfTcu+uGAHleYtA25AUTR+tlM3foXh9jH0ePAuzoXrEU0IAv+07kNr5g/jRfimuX09QIF1/BMVWziPIPYQmhlNvty4ifPuvLWvNSVSv0rQPOB0OqKRs4nrT/PRY5BhDfptV8zOT2ekK+cwNxorp3LwTrmTyQo62pBViS2pIoGbSwtFY07iCQCg8o4rsP5YnU4/txa6VZsy79WELR2q9rhvw/NQzE1IerYm3NNaYD8OkBbR4dj6Fb6l0PSw8BL3WMjp02S+7b2qIM9m/YlZ6kKtL/XIb+fqro4yOnQXwARNkGpiQENJD0D8c6+ltj1P6ns+j0zVwDKKNGTch9bJmJBbDHUMdbOSBXIT449vUCTH43lsOf0tqLMa4wg2/a9gGFOJDk/lXVwdHFXz006QCtcnIwyLXSfdATDzZu5MV24DdIQ/T5llv0EgpN0ikGP4hEa3Rzc0MqsuWXQ6KCDeAqMSxT6xOxKSBf2eg4xDheBCJ2UbfF/Q5yGOx5u0kdVlTODdyY1xtp4op9trzD1+h/aU9M7ivTDJ7ue5v4BFEx40TeCNX8qo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGtRdkFXOFYzamp1OS9ZYUxzcGxadXF2RGxMd0xxWXZYWUxETjJpZUE1RDJm?=
 =?utf-8?B?QkUrYnJNUkNYeVFRb0tyZVRocmd4OTFMdXR5OTFBVE1wODBrdXBuOElyeE93?=
 =?utf-8?B?UTIrT2UweHQvNVAvZVg5N0lQQlQ3Q0NZV29tWHFBZXd5cHBqbzVkU2ZwVGYr?=
 =?utf-8?B?WU1CWmN0S2lBRE1Gb1JqaXBzM2x1eDVWU21leHZmZnh0RUJhd1VFNUdteTNv?=
 =?utf-8?B?K3JmSFJCY3NUU2NxZXprMFdDM2g5SmkyT09RSGNiUDd2c0VRaHJ5YXptSU9h?=
 =?utf-8?B?MTcxSEpzSmlMVXZyV1JaVUNYV0FwdnJnb3lqM245Rm4vV2dQc3ZVZGwzOExq?=
 =?utf-8?B?aWlDbHQ4aGlQV1dPdHRkYU5hd0tiZ0Y3RXo0L25GWWtSOUt4c3lPVHNwNXlr?=
 =?utf-8?B?OGNNQVpTcTExZDUwQjNDZ3Fld3dVbWVEZmhPRU5xeEJKM1dOOU5zVWJSQVU1?=
 =?utf-8?B?RFEzSmd2UW9NOTc5TEVxTWlkODcvaUJST0pJckhyTThUa3lPZXA5M1A3eHg4?=
 =?utf-8?B?bEZ3MzRDVjEzM1hCYVErdUt1eWpJNW9KU2R4c3JoNW9kK3pyVW9TSFY4OFpZ?=
 =?utf-8?B?bDZldUd6Y1l6Ty9OcTUvWi96SEpkR3VRTzBXS1UrL1Mra05rZE5TSXByaU44?=
 =?utf-8?B?eFFXUFNtMHpiSlMwTW9tRklpN2JJdnF2aWpOb0h1WjlhR1hHZzBjbVVhUEVX?=
 =?utf-8?B?QnN5RGpPaktIYTkxY1RBSnZIQnd5MGtmNUlKZUo1OGUxUDRKdjVPenFuVUhS?=
 =?utf-8?B?NFcrc3ZwQ1AzOHoyQ2RJMFd2VGhzQks4Q2tUaWNPVlFOU29TSE51bldsSXZz?=
 =?utf-8?B?bUg4Ri9pcXJ2Q1hBZDZrS1BoLytGMnErb0FJWFVBSnBScnZHT2RMYzlzUG9u?=
 =?utf-8?B?c0tBMktvTTl3SjZuZVpBeTBWRlMyN1A1VWdrbnFqY01HVXNDMGtDQVExNW9W?=
 =?utf-8?B?Z2Q2WW45MU1saS9waVl0NnRaNy8zUUwxNWZtaFY1WTdneTNqVDFpYnhVZlZR?=
 =?utf-8?B?SjZOWjZ3akY0MnFRM0NVVktvcXAramdZNGFJLzVzZXdwTUNmS0NVdDkwTU1T?=
 =?utf-8?B?ZnlISFlaRFVraTBWdU1idStrTHBSY0JEWmF5UXVndmZUbEh3c09lSXBUcm5p?=
 =?utf-8?B?R3JPbUlUaEREL0hwRitaMEJJWEVIR3k2QW5CYmRWTmljRXRzVlByS1hTWHlp?=
 =?utf-8?B?bG9MWjBqdGJ0THp3b2dTQis1U2g5MzR3bVAzZVVGT0ZpbEJ0VU01YTIxQTVw?=
 =?utf-8?B?bmtiam1yNVl3QkhTWDJUUFlUVmNzQ0dadXdTSkVkQW8yNERiM2VEVVhkamFa?=
 =?utf-8?B?ZDJZMnNjam1QRmxVU0d4czRGVUFWMWQzS0FsTnlDMnB6dVNHRXBCeWY4R2V6?=
 =?utf-8?B?d0JodjcraHgvQzdRdFd0ZGxtQUFHQ2NuV2d2eWZXZVBqZGc1b3V0UlQxUURH?=
 =?utf-8?B?ZUY4Q29QZVdLcmN2UnBvV0pxRTQ2Rm0ySExjWThXUVUrZThVQW5JZ1Z2SFgv?=
 =?utf-8?B?T3lGZHdtMDlnUWRjbXhoNnV3ZkgreE9KNmY4L1pxbHRJdHpJUC9SOG41NXg5?=
 =?utf-8?B?enRWUm5GUStOWUdVT2p0blJCdmY0djMxV25HNjlGcW02VTk0djVmdTJ0UUVj?=
 =?utf-8?B?Y2xVVkFINHhTQXhoaVBRbFpvYjFIanVpOTh4MmF5MG5mazV1cmpCZ3Jnc1Jn?=
 =?utf-8?B?OWRPRkQ4UU56cS9JRGRxUm5uUmRjTHBMUnpWSlVqM29xTmI5K2VjUE5uSy9F?=
 =?utf-8?B?cThNaFl3RUpGbjFEM2xlaDJMTVR3SHFCbERRS2VYTldzcEhZbzRVRitCUmxB?=
 =?utf-8?B?OE1tUFJZQzlPQkwwZjRMZ3o4RHp5RDd3NUpJbTQvSnRtSERmMlRDUkUydHp3?=
 =?utf-8?B?WTlzNlBLTjBDRGg1Q05pUjhBTG50VFc4aWN3QWtZMzJZcHhkY2JXVkxEWjg0?=
 =?utf-8?B?d0NOSE1zNlRkL2Yza1N5cnVOS21Td2R1Z3JUNWhqSWZsbmFuSWc1VVZaMThX?=
 =?utf-8?B?YXNWSWpmaStub2lFVkNyRVhaNE1ER2ZOaU83L2xPc0RjdXorZHVCekNVR2lB?=
 =?utf-8?B?b09FVFhpcnZ2OFE2SVp2TkpmTlpqRm1pWFN0VUtndzFjQVJlT0pRQ1k0MEtF?=
 =?utf-8?B?aFhVZVlIazF3NmRFdHMwQnkwZVRNeWl1ZURuVzd2cWJGN2tRNzBxQjZ2NGpZ?=
 =?utf-8?Q?ukQwRNNCDpG83e2RMNMa8G8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e163254-aee4-493d-2cee-08dc5ffa246b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 22:51:53.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBZ7hxoehzGLzAct0GKKbVDcrCSlPIZPkNCgk5gD6VHz+9fGfGKkahgHOJbTceIP4rjkbffwqcEfIk/LH+Z8dsR1/41llFZmX4qpnD59rQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

On Fri, Apr 05, 2024 at 01:00:54AM -0500, Lucas De Marchi wrote:
>Cleanup the mainloop moving the console size handling to a helper
>functions.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tools/gputop.c | 30 +++++++++++++++++++-----------
> 1 file changed, 19 insertions(+), 11 deletions(-)
>
>diff --git a/tools/gputop.c b/tools/gputop.c
>index b13044b50..1f349b3ed 100644
>--- a/tools/gputop.c
>+++ b/tools/gputop.c
>@@ -243,6 +243,23 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
>
> }
>
>+static void update_console_size(int *w, int *h)
>+{
>+	struct winsize ws = {};
>+
>+	if (ioctl(0, TIOCGWINSZ, &ws) == -1)
>+		return;
>+
>+	*w = ws.ws_col;
>+	*h = ws.ws_row;
>+
>+	if (*w == 0 && *h == 0) {
>+		/* Serial console. */
>+		*w = 80;
>+		*h = 24;
>+	}
>+}
>+
> int main(int argc, char **argv)
> {
> 	unsigned int period_us = 2e6;
>@@ -258,17 +275,8 @@ int main(int argc, char **argv)
> 	for (;;) {
> 		struct igt_drm_client *c, *prevc = NULL;
> 		int i, engine_w = 0, lines = 0;
>-		struct winsize ws;
>-
>-		if (ioctl(0, TIOCGWINSZ, &ws) != -1) {
>-			con_w = ws.ws_col;
>-			con_h = ws.ws_row;
>-			if (con_w == 0 && con_h == 0) {
>-				/* Serial console. */
>-				con_w = 80;
>-				con_h = 24;
>-			}
>-		}
>+
>+		update_console_size(&con_w, &con_h);
>
> 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> 		igt_drm_clients_sort(clients, client_cmp);
>-- 
>2.44.0
>

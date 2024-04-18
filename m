Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6708C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 22:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6227910EE3F;
	Thu, 18 Apr 2024 22:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GqZwFvyA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F9010F03F
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 22:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713480747; x=1745016747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+pXjs2Nj7XR6O82PR8698r+hpWZIgxBdSoYJ1nFsQTs=;
 b=GqZwFvyATyyGHywd6BSuMQYVsZKCclmXHIlVaKrtjF9HOjfXxlinw3i8
 BfnUk+gaA/WoB/aN5IeaDPnJBQXhie95mwM3SQVHjxbo30WRj5u1+LTaE
 LtH/91xJHF6v2N/ZzxLNOvhADUc0A5jUf/z3EtS6wSCm986URs8nTw1qI
 iTZ1CMqh/MfcdRetz1mgArQ/Cxpu+9QVq1zyPBS4P61EZRNvKRJLhERwW
 HJtd7yQsO3ubLiWVjqdsYB9omvyLeSiuz2hWhP7HTcDvj4ydf+3jXkbgl
 jq+uySciorOZ361KtV/0DRTXpYG+KkpA9sIb9h5T/vaw/zC7FXkkAbEVF Q==;
X-CSE-ConnectionGUID: xKiep/xCTxaSGkNfnblUcg==
X-CSE-MsgGUID: z4lsoaLpS/GnGVIOvYnwNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26574450"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="26574450"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:52:27 -0700
X-CSE-ConnectionGUID: vZzmh6tKTIK4GtLclaOdEw==
X-CSE-MsgGUID: UGfRFnocS0ak+1OeelG+EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23209754"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 15:52:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:52:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 15:52:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 15:52:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3DLckh8rnfjuZBETEJX2AMrfKbKpkwYk0HMru/vPtMvfwqROFN/cgYfBjjnAvRAV3XCa51JLjw3gf4TUvQH5SVg+SD15wxIabEm8VU5QlKDlsqCGiJL9x3PTi5QC6X/qVLk4/2w5hKBRsO6QfiBKLEM67SqD7qHmoaUvdNJV6O50hnTilbQqgQjX6aD+P2Ll+ZaQknHtkTJ22wKNK9fCoqoDMpNlPPIRy6OatMQPIdCFAOXB+/R9QhklnRjOMzV7b7AKpciMiMVgGNF5VXItOzdapgq13NB7Oe5ghUvmBdjxniTcJbBDsvJwpDpOCepmo/Awr75R9bAzAj8D1/8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOrrcAk63xVbfAaxEH+H5d3gOnN4kQtZPeni2ZJmyAI=;
 b=cwSni4pyUkBsWdhprBDCBGEAnPnp/+S0AwpLJWu2XwyhuBZ43CAKmAeqz09Mpb4s0tpF36ITVpMR8sVvUKSUnUsQiIGa7xdzpDfxrVRWoTgnb20hmuOdayU/Eno8/Jp+jVpUNQQKCFl+vKtDa/u1RqVM1tg3xpZgtfXm6wxY52/UGx8nZJE3u7J5ChQUKuK/jvTWhcM9r0gNpvTpVqe/39fH8bD7i98TyXuWKg/MoNz7AQmMpBwgIb7oXKTMC8R7t6IDe6v39YgFfpcIwrkjXrDnQVKW4b66riBN0hhuVijjq7YDWcdF+OAb69oSpYGKTDiUuHD69B4Q1Pt0lsnNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Thu, 18 Apr
 2024 22:52:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 22:52:24 +0000
Date: Thu, 18 Apr 2024 15:52:22 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 11/12] gputop: Extract clrscr()
Message-ID: <ZiGkJoel4GD0xUzG@orsosgc001>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405060056.59379-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 60c9344b-9c05-445a-f935-08dc5ffa3684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1m10z3vmTeab1HfdlV+xib9WhTEtTqtV0O3Mb/gsgkBM6MPmFiYneV+0+KAteLV/r186ntQ2IUSg2pznFkJuMK7qMxHV6tTb8zmOZWrpvePvfR/8yeixML4hGgS+pYuqf/wbS2dfKR94qhOPkBlxteT5/GIGXmW8lT4BmStJP0uVelYzJssw8czk8dAk18USHfFNWjLhL2tsuNxOYWM4TA2RrwSDMVhI2mzjGG2WybOZ/iD2V7azcI0H1yggfqQxUb2iE0Xesp1gWJuYzaiQdMQjlq3nJy5m5OX8KE/IcAljR/mudVUo6FjoZ13JLUyrkmwLUWM2nUli8DisO/Tus1becsTRJkrbAC+GRHTf3n+PwWDnnw3OrFEzXGLoINcmJdhHruzG+yXyNy1BxoRI8jGHJ17Z4zUQhTGEmboehFuiut89LtEBeI791J/5Usl2I+ZX2d/HWGwxibMpFqgN1xmHH2nM48JIn+vEzuk92Y1p/MRFhsU3CVjI/KFRqnrORPAgM0rhj1j/WabM4K2zOR542AJcd6O1yqW+JwZhywbb11od+6lQNnJlFXww4NMsf9McZugXEI57juPRmS/xJVYPDVk5OxgkaxLZzDNo7otet/zbMwAeYRGeH6jOI0IWuEXLtdzx6ZbeK37LikUhR0c4M9FGk6itPhVA0gVkI5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzhKWVpoTnE4ZUVZTnRNVGU3Ny9SK0FpOXRWVkFwaDlGZUltNUkvZFBGSmx2?=
 =?utf-8?B?YTQyaVZ1aVFuTVRUMUNSd1M2ekswSWRwYkRobStwNVJIRVlWemZLdXI1dHdY?=
 =?utf-8?B?OXV5MDZtK21uaTJLNENpZXFhUnUvZmYzY2I0RTBVS1MyVzIwUDI0c3c0VTZh?=
 =?utf-8?B?ODBtdHlFendOU2FpYUNkdkVLUnp3SXNJa2RpSjh2QkVCMUJvelZhV1U0MnR0?=
 =?utf-8?B?SHZRb3NyQUl0Vzd2OGVTY1NHQ1UyZUM4aHpHMUtWdVBNVTZ0bC9TeVNZdkY2?=
 =?utf-8?B?NlRHTy9kWTJqRnJ0OFk1ZXJENndJSWtEalZDNzl0dE9URHlXSWdRT3Y4SkNV?=
 =?utf-8?B?ZzQrSnJjL2s4U1BBVTRCVHdMZU9LK1pFamF5bUZCaTdiclpBZnNzMUR4MWpO?=
 =?utf-8?B?WitNdUR1WnM0TUFyU3BPbkFZQlNTb0VxR1Z3ejhoKzhlcE5jOUpHOGtpQVVQ?=
 =?utf-8?B?YWo3RXU0THBVcGZ3amdUQm91R0x6dUlFTjlrMDdhUGZVME5VaUFRbTcwMlZI?=
 =?utf-8?B?Q05pZ1dJUzNYcnlXN0dUa0ZiTjQrZUcrbkp5RkNYM2R0S21zU3haYzBhTUYx?=
 =?utf-8?B?SzZGcHV6MEFudHVINVRGYWowSFV2bmpJMWczSzl5eHcrZXVGQ25pSFFydU5v?=
 =?utf-8?B?b0hhYStLNWd0YUdNcW85Uk43eEdHTW5wTUl0WkZuSzJOQVhIaGRFci83UU1j?=
 =?utf-8?B?ZHE2R2EyK1JYSHFUNjlWWDc3SzFvVE9pZVJaU3R0azRVbjNmWTlFSVNNZ0tU?=
 =?utf-8?B?N3J5ZUdPYys5K0YvYlVDVXNZY2Fra2JBSHF6UWxjU0Y5bzhrdjZYeGZiSW42?=
 =?utf-8?B?ekVDVjRRaTNxQ21vU0YyNUFXWE42MFpOY3BnRFRIZi9tSmMvbHFmeTVuZWlV?=
 =?utf-8?B?THhlSlk4c2FrUzhvaU1zY21KMXF2M1VPMFBjZEs0bGNHWjlDNjR0U1FwbkZh?=
 =?utf-8?B?S2JxWXFDTzJERkFKVnZBS2RuSG4yZWNvZnZZZlo5RWJZVHliNzJxZTFwNU1w?=
 =?utf-8?B?bTVRMWdmdEoyNGJURVpWUmxDb2c3ZytHaHkwVE0rR3owNmQrS3Q0amJ3Z09L?=
 =?utf-8?B?aXJGb2ZQWGNiVjRTR05ITkthOXh2RG8xZExOa0RUU01aRHAvd3FXaTlELzhO?=
 =?utf-8?B?cGI1WlQ4eUhVcHFYYk5waW1iRVNLVDFUMjNWbHJFT0ZSczRtTUh4SzcwTzg0?=
 =?utf-8?B?TmlISTZQZGZxMHRiaXA4aDNULzBDdUdzdHM4Smk1KzBSMkNQTE1nYUpHVDh2?=
 =?utf-8?B?SE9uYkM0WVVsTG5JOVJ0T05wUkZ3Smo2MDdpd0RnbU91aE5mejNsRzl5QnpC?=
 =?utf-8?B?TkdkaG43V0ZpdkdMQmU4a0lSVFdCRHg3M0p0MWI0cGJ6QWVzaksxeEhvenVF?=
 =?utf-8?B?QU5ENnJ6UGZNajdkTjJDSXJGNU1lejI1UWVNU3dqREdBVGxXeWo4VDc3SGhH?=
 =?utf-8?B?UXVxTllpR1FyZjVSbW1hUXNVTGZSWDAwUDhIV3IyeWJvUWN0THU3R285cWlJ?=
 =?utf-8?B?SlhXSUpFbUhGOGlOUUo3TEVEZU82QlFJVUVDRDgvaWtRdkJocFJQVDM3OTh2?=
 =?utf-8?B?cXdlSXdlbU9GcndiRExJVkZpaFR1U0NsMEc3a25rZ0szbDA2dXJhV0J3OGlM?=
 =?utf-8?B?ZkIxN0ZxbHg0Y25sOU1mblRZeVhXeW52aFI2TXZrSkNuNVdOT29iRGZOUXNT?=
 =?utf-8?B?bDZJbmJwNE9Za0o2MzBtNml4MEpjd0RuOXMySVAyNVJWWnkxN1ZzTkplUmFw?=
 =?utf-8?B?L2dValRoV202ZFM0MDZPWTREaXVFNmc4anJ2ZE5WdC83Z295YXhoNTFWblJB?=
 =?utf-8?B?M3ZXVHhHb3VPdHVzUXM0Q0JvcjBvOWxXVjZ0WmpPZWJ0TWJ1Q0dZeWsyZFpF?=
 =?utf-8?B?K21yczAzWEdyRXo4M09XQmk4ZVhNcVMrSmpQTVFpRnNJekozVElURjJ1UkVH?=
 =?utf-8?B?ajF6ekFIQlA3cDVDcnp1VlJMaVM4TzJwN21QenpHQkFtdWN1RTArZFd1NTZI?=
 =?utf-8?B?dm5yYUN6RHRTTW0yenVyUU9UcVhXcksyRG1lbjVDMmVmNU9idDNzVVVqWVRK?=
 =?utf-8?B?V20vU1dzK0hnV0pZa2hVemJ0RXNLZEtmdnZJd1BSK1FiSVBkZE1jaEltdG1w?=
 =?utf-8?B?a0hBWXc2L01VMUxpUDQ2UDYvOGZ2dVAxRUJYeERYak1NeUhuWG5mUXNHTGwx?=
 =?utf-8?Q?kVvTNvAo51bD3LsZxTP7RHU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c9344b-9c05-445a-f935-08dc5ffa3684
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 22:52:24.2251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9oqlrYiMcTHwV1LGVnBqn9/L68sGkWv92gGDZnBkrBNPDKRvkAkG1qsybuRnFu9BNJiSMyCxbANGY9s6/Dygs82KuBqxBk4T9YayKnGMoc=
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

On Fri, Apr 05, 2024 at 01:00:55AM -0500, Lucas De Marchi wrote:
>Make it clear what the CSI is doing.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tools/gputop.c | 10 +++++++---
> 1 file changed, 7 insertions(+), 3 deletions(-)
>
>diff --git a/tools/gputop.c b/tools/gputop.c
>index 1f349b3ed..ea23e1de5 100644
>--- a/tools/gputop.c
>+++ b/tools/gputop.c
>@@ -260,6 +260,11 @@ static void update_console_size(int *w, int *h)
> 	}
> }
>
>+static void clrscr(void)
>+{
>+	printf("\033[H\033[J");
>+}
>+
> int main(int argc, char **argv)
> {
> 	unsigned int period_us = 2e6;
>@@ -276,12 +281,11 @@ int main(int argc, char **argv)
> 		struct igt_drm_client *c, *prevc = NULL;
> 		int i, engine_w = 0, lines = 0;
>
>-		update_console_size(&con_w, &con_h);
>-
> 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> 		igt_drm_clients_sort(clients, client_cmp);
>
>-		printf("\033[H\033[J");
>+		update_console_size(&con_w, &con_h);
>+		clrscr();
>
> 		igt_for_each_drm_client(clients, c, i) {
> 			assert(c->status != IGT_DRM_CLIENT_PROBE);
>-- 
>2.44.0
>

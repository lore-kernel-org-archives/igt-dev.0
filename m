Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81539C5AD2B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 23:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1F310E478;
	Fri,  7 Aug 2026 23:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qe2YeIc2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADBB10E478
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 23:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786144503; x=1817680503;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xTi80CsJ5YrcMVyQgFEfDVf86Pfn82sP/Em0nDr8bzc=;
 b=Qe2YeIc2b+vko0erOUlUjbKUJI9yOCliITD8an6uoLcENGRAtkHiqJ9w
 6Lf/RnS85bSXsXD+ZcZ8uPIREZk5G+jGog3yHjKJFCVgOeX4ibq5GyKco
 iaSrwfnUbJF1nwYiUeOOoqYnXIH/X7eHGhbrnVpdONr4WuG+21IeH0Wrc
 rDipgBqYS/SGdvsyLjM5Qw9pq27gxUFx2bs4YEdIibablJtWAJYZ71llm
 wWFovPZ9AmgOxQjuKAEwW1kC5b3iRv76BueP27WjtOCaRFjdHQOJEZcNJ
 1QstqYlVEnSC+hgwk83jG7IzFTpMS7Ga3JKt02h59gr+6uI96i4mw6E4M Q==;
X-CSE-ConnectionGUID: gsEPNChIQH25eMCkqfsY2Q==
X-CSE-MsgGUID: x0bln3cKT92KJFobxiQxkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86837487"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86837487"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 16:15:02 -0700
X-CSE-ConnectionGUID: +aYlF67lT+O7Mt3+JpXBSg==
X-CSE-MsgGUID: vDeFm4uJSTauYIc8gBRQ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="264512204"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 16:15:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 16:15:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 16:15:02 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.29)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 16:15:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+fgcO+cOb4gmVqIqxfBAeTcwnYCBFgpDW++yaFgzaj+zk2kq8ENQNCti0H7oanpXDF/MyxStiE1UpTufj5cToF7ye0EXm3yRcccr2/AklTlJHu8EujktLTIBXkhCo9Zb3w+TtFk/WrFy6Nr5rqdjZVyTqWTzDA8P/yX8BpkqGQfq0PJhfXMAeeTWBvqWLil5gJzPuvZnrDASLoPZMUTDii/weOlgobutffMbs73kmPqcwvAR4YnyyiirmgfoQecbXq3Ws8M8A7stS7WHu3VpLTY0qXVGYWkre30J+Zb54NxZ/ZJ8iy+pnu+NwXcW3OhfcCiVYUjm7VvMgBlmhFwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSE/f4msAmrl0VcH/e2IszIYH3WXNO8pEoq5c6CfCCY=;
 b=tt1aat+za+tMvBil41BZ44rS5zLalbkwrNaELJS3TRSB4on1pEMVfbSk+pw8vwB7ZYlVLHdVFT4j0g1WqroH8uO4gB0ULooVjTEQo0nkU0Ko/FLnMcJ+8IdnI3iuIqNyPLNmnJsXoV0nF0ZGuIcob5hDpkhtMGU++hKk8V0vQotxq9gM2ZoeBEoIkYzsJ4s2qAhyCRZey4BAfz/hloo8HObf4py1ANEMZH9ZOb1cxrTYoGOYnbVHqDeiyj3n6zowocKKWj5zNJ0Q588sPduDM6KEtK11TLEzs/YPNcGAKkdWORJeSfXiAXqYPiauAzUbTCcyM9XvSQnaGTWq/Iqu0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ0PR11MB6767.namprd11.prod.outlook.com (2603:10b6:a03:47e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 23:14:58 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 23:14:58 +0000
Date: Fri, 7 Aug 2026 16:14:54 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH 3/8] lib/igt_drm_netlink: add get_error_threshold command
 support
Message-ID: <anZm7vt-fj_qtHph@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
 <20260729121959.603890-4-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260729121959.603890-4-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SJ0PR11MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: b2214f83-4890-4697-6e4d-08def4d9b29c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: hg13BzQpR+YxiGLrmpBVLRvGr7obfmSHEQCIRTmjFWfqzelOMq4ZF3Sx8aYBVv8YRUHfiU7gfXyxZMZJGoFYYl+iWP7Yc5N7kjJdewf5vr28S4oktkH7rX/HPE3+4zYPlqtIhtkpsG+co/rR3sXLkj8GPkB4zJp3b7xXzqsRQuA4YiZmm1UirEWSvik5YgcCqfWXp6OG9QhOyjgsmr8ILS+f474E47+lqSi4cgSn+y1v9/I4nA5FrflUwWW9G2RRIxivJ5ql2hFmGIfNFa23HYQygx5BNcZ7PgV6EE81mD5ET2FKuSEOtMh+qBpXDDbJKoF4tgPaJmy30SERPVoqXFntAlbsHltHjms+7dPO6myIuEYtCk2OZhhy2CkkPATiYQ8sHKrt+rNShRyjzaKpEgsy0e1POSJkoPq0bDecC3D16uf3A1ywxMB1K1NbrN6O+6LKYyM11fgyuuhsV2e+8LLGhId81rCInCoUckj5yUsVQ9tEVM413KCKOjfexE5zIST5yiWfiMZqy8zpJ2LNMMt8ZTQXELyebc6yfxxrEG7UlQR7K/y+pQY0xDeOf+a+C8AP5DRHmr4UEEymhUF20YvJ62e8TXA4WiE96DAgZEfNFrQ0qIIFPa5iS38AzuVOGawHOLe0D7XTDXT4feX5LIgiXTJrBPa+a0dKKkCXf6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1VGOUhnd05oL1FQTHFoUEtyd0M0TTRha0Jrc3hKcmNDQ2JCT2NoS283TUJm?=
 =?utf-8?B?Q3g3djBIYzFsdEphRGk1WERveGlVeThPZGszaHRIUUNEQTJJOGNEcFJRQ05H?=
 =?utf-8?B?VzRnYTRZaC9mOHZSRWd5K3RzWWJvNmR2bllERjZObStrTHFMRExsd1hRQjY4?=
 =?utf-8?B?K2VUandiMUw4L1VZRzhCME9XSzRGZEVmME1DMlVaY1I0QVc5ZDVOVDNoS1gr?=
 =?utf-8?B?MDB3NXk2amFMbzNGcXRDTnJOS0NoenNQTUFMSzA2amxUbUo4a2l3V2d4Sktl?=
 =?utf-8?B?YlJHTllQZy92Rmw3UGZDZkNQdFlJbnVMYWZNa1MxSk9mVnREQlh3aTh3QUVu?=
 =?utf-8?B?MXZJM0piVFNTNHE4TDIvOU1lTCs0THJMVGQ2aVNPaThCZlJDZlNiVWh1TGJy?=
 =?utf-8?B?dkpUMmlacGtUZmxDRnJpSENUaHFyQmFtOENuSmxLSTk3Q0VNajNad2lHb0R0?=
 =?utf-8?B?VksybWV2cWduTE15T1JSZlFpaHZDVU4wOXhPY3E5eWtacW9jeWg4YzVzMWVP?=
 =?utf-8?B?Yk80NXhFZldXN0lPeWUxMkZqTG05QW8wYWVnSzZORldEVWprM2dlVVVaSHJl?=
 =?utf-8?B?SlY5UVZ2d3ZxY0VJZ05MVld0dituQXNLM3pWK09aYnJndDFRc2xQUW9sR0VP?=
 =?utf-8?B?RXNkNG1LeDA1QUVJcXRTd0ErQkpoY2FXY2FmUHl3TW5VMTJwd1V3NlFwR2NE?=
 =?utf-8?B?T1Y1T2ZlMWxVcmVpRzVCQmJTQUxiaTJMTkhDV3pZekN5U0dJOVkyS1E2N1ph?=
 =?utf-8?B?UDRrNll3TFlSZFpZRUlvVW52UnAxWUs0R0xobVVmTjZEc1Rwb0d1dDdLRGNW?=
 =?utf-8?B?RHBsRFN2RVNhTVZGZ3BURjdITlYzcW94OUlORHkyZWRicy9pRkFiTlg1akZV?=
 =?utf-8?B?NU5ucDhTekFIUTZmWGJPVytYUXEwRlRreDVqSit4QjdXbXZ5MkE3ekxTSTFF?=
 =?utf-8?B?eXJET2I2TzdzbVk2bEVzdkZwMUNlbWJDSzdNcnV5TWUxdndSNXJybHE1Tmpv?=
 =?utf-8?B?dFVMY3JYM3IreHNBdWlaMGZ2M2xzaWpEVTVvcmxIN29vcllJdjVmNTk0YVZL?=
 =?utf-8?B?V2dZUXZySlh1VHFpaFRlbFpsK0MxaWtaNHlSNVNYSUJHczhyN0F0R3Z5aFJk?=
 =?utf-8?B?WjhvZDhDUGVINENrdzV6SEd0QUxYWkJ1QklmWHRrd1J1RkJQSk9wT0NlNnRS?=
 =?utf-8?B?OGF6SFpiTFo1SHhCUEVBdzloN1JwMWRSMWorbkEzZVV6RFJGaS9mSGpxYXFm?=
 =?utf-8?B?M1FpckFJUmpSeWFQck1ueUxEM1pXUW5wdHpmRHIzQnBlK3ZJcUZobm5iT3Rv?=
 =?utf-8?B?c2JZYUpza2FvSk1mcGg3VExMZXhzbUdheWRHblhPcVBybEc4VkNaSW1rNnlI?=
 =?utf-8?B?SHM1OFJrUXZpdWdxeUF4R05qME5FeXBlTW5qV25ueWVsYjJTUlJtbW1tR0FL?=
 =?utf-8?B?eWhCOE5NREU2cWNKSlNLMGxKMTlFbDNXVG9Fa0tKVlpPYzlNS1pOMEV0S2p3?=
 =?utf-8?B?aTNadEhKRGcvUXcySEIwQXpqZkpNRkU3L1QvMmthcEhVQTFidU1BclAzU1Fr?=
 =?utf-8?B?L3hwWE9KUStBdmxxMExLcnNnbm5NMXZuWjhGS0xTS1A3TEZpemh6TC8xN01q?=
 =?utf-8?B?V3RhZ283QjFCR0Z2N0hlV21jdUd1bmhaRDZncGVMcEVCNVk0MEdqWkhrOGNO?=
 =?utf-8?B?aitLa1ZkNGVhcVM3TTJuWnpocnhXS2YvM3NJZkF6bUR4RDlSbGh3SHZZTGNr?=
 =?utf-8?B?L1c4aXhoVGpYMXVZVGU2T1JmcWh2Vk9sM2o4dnp5bmNjNU5vaDVJeWJwdk1B?=
 =?utf-8?B?U3I2c2VRcWJiMGdqNkhjSjFDamEyWVpuYmhXenQ2VTdDakpSdDZ2TWQ0UUlk?=
 =?utf-8?B?YjlES3p1NVE4d1E1eE9ndzRCbUMwR0JKeXBvQU5ocitWVVpseVBCSCtwWGdF?=
 =?utf-8?B?d0hjTkVMeUtOL2FZNnhmUm1zbEZBVENJdzRkSzR4N3AvcWJtN09Zd2o4dmhY?=
 =?utf-8?B?YVQ2bVVpd3gzdE1vS2RZQnVBNzE3QXhiRTc3cURhdzhnV0JrcEhoUkxES21K?=
 =?utf-8?B?dHNEeEJQeDk1MWtpYWtkSXhYOU5tMzZKYjB5RkJSUDgyWVVTM3ppWnd1K21r?=
 =?utf-8?B?SFkzNzBhWTFrbGZVNXFvbllXalVYeXlWM0MweXFFZTBJd1R0eEx1VEVES0kx?=
 =?utf-8?B?TlBaNmVsQ2hHb3BQMi82YUNiSlhlbjdzbk5VM3NxVnU0djRKdkRjNzduTkpr?=
 =?utf-8?B?Zlp6Rk5mQVF6NEZWZ25QL3VnWXljQjNzUjJQRmlpclg5eXZaYlJWSTJQODU2?=
 =?utf-8?B?UVNjc2xCL2czZ1orU2lQd1lPZHROWk1kWlFLeFJ2SjJaSUVJaDhYM0Z1Wm1E?=
 =?utf-8?Q?/qxJEQFsuNhdY+d0=3D?=
X-Exchange-RoutingPolicyChecked: ggm6WLQbqdxHC1A+fbB55vaoPojwp1xXKoRkehH3lbtkHLt/n5DWtz0xxgYjmcSF1g++xeWFNu+5GQrsTzEMIgH1BtiOKJdt8uwW0CBxUWCdPHLQxAifcsF4Z8mB3XdHTt5/sVp1HwmxAbufQZEbTi9qTO5ncTqavIMk8D4mlvrrgiJNPaxIswuC6oMETScQXRnWdQabbyY+ENBX/jUGBzCEXfXCynKk8iDEc01nM8POjNBt5SWAhWerSLeHA7zKxy2/YUBJRw3aINysLsK3StLj8AfU0skSR9KEzvsZTbNovav7WeEh7R4MHl/ZNG8B1RSeJTh3KIh4D7hPeuxw1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2214f83-4890-4697-6e4d-08def4d9b29c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 23:14:58.1121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbrxwMq1nCUEcm2RRU5reRK06TudBQ+DpwSixl7Vqdt9diDdAec4MVEaanURcldXd3IXDbiLiFkix65sDaCmlPMNY8gqA+rePicC3RW11Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6767
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

On Wed, Jul 29, 2026 at 05:49:54PM +0530, Ravi Kishore Koppuravuri wrote:
> Add support for GET_ERROR_THRESHOLD to fetch the current value of error
> threshold
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>  include/drm-uapi/drm_ras.h | 18 +++++++++++++
>  lib/igt_drm_netlink.c      | 53 +++++++++++++++++++++++++++++++++++---
>  lib/igt_drm_netlink.h      |  2 ++
>  3 files changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> index 218a3ee86..60611833b 100644
> --- a/include/drm-uapi/drm_ras.h
> +++ b/include/drm-uapi/drm_ras.h
> @@ -33,18 +33,36 @@ enum {
>  	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>  	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
>  	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
>  
>  	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
>  	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
>  };
>  
> +enum {
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_DEVICE_NAME = 1,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_NAME,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE,
> +
> +	__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
The above enums are not used anywhere in this patch?
> +};
> +
>  enum {
>  	DRM_RAS_CMD_LIST_NODES = 1,
>  	DRM_RAS_CMD_GET_ERROR_COUNTER,
>  	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
> +	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
> +	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
> +	DRM_RAS_CMD_ERROR_EVENT,
DRM_RAS_CMD_SET_ERROR_THRESHOLD and DRM_RAS_CMD_ERROR_EVENT are not
used in this patch? 
>  
>  	__DRM_RAS_CMD_MAX,
>  	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
>  };
>  
> +#define DRM_RAS_MCGRP_ERROR_NOTIFY	"error-notify"
Same here. DRM_RAS_MCGRP_ERROR_NOTIFY not used in this patch?
> +
>  #endif /* _UAPI_LINUX_DRM_RAS_H */
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> index 4d543275d..036660a6a 100644
> --- a/lib/igt_drm_netlink.c
> +++ b/lib/igt_drm_netlink.c
> @@ -43,6 +43,21 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>  		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>  		break;
>  	}
> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
> +		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
> +
> +		ret = genlmsg_parse(nlh, 0, attrs,
> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD])
> +			return NL_SKIP;
> +
> +		ctx->error_threshold =
> +			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
> +		break;
> +	}
>  	default:
>  		return NL_SKIP;
>  	}
> @@ -94,6 +109,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>  	}
>  
>  	switch (cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>  	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>  		ret = nla_put_u32(msg,
>  				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
> @@ -141,6 +157,7 @@ int init_app_context(struct app_context *ctx)
>  	ctx->node_id = UINT32_MAX;
>  	ctx->error_id = UINT32_MAX;
>  	ctx->error_value = 0;
> +	ctx->error_threshold = 0;
>  	ctx->family_id = -1;
>  
>  	return 0;
> @@ -155,6 +172,7 @@ void cleanup_app_context(struct app_context *ctx)
>  	ctx->node_id = UINT32_MAX;
>  	ctx->error_id = UINT32_MAX;
>  	ctx->error_value = 0;
> +	ctx->error_threshold = 0;
>  	ctx->family_id = -1;
>  }
>  
> @@ -206,10 +224,8 @@ int init_nl_socket(struct app_context *ctx)
>  	return 0;
>  }
>  
> -int get_error_counter(struct app_context *ctx)
> +static int validate_inputs(struct app_context *ctx, uint8_t cmd)
>  {
> -	int ret;
> -
>  	if (!ctx || !ctx->sock || ctx->family_id < 0)
>  		return -EINVAL;
>  
> @@ -222,6 +238,17 @@ int get_error_counter(struct app_context *ctx)
>  		return -EINVAL;
>  	}
>  
> +	return 0;
> +}
> +
> +int get_error_counter(struct app_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> +	if (ret < 0)
> +		return ret;
> +
>  	ctx->error_value = 0;
>  
>  	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> @@ -233,3 +260,23 @@ int get_error_counter(struct app_context *ctx)
>  
>  	return 0;
>  }
> +
> +int get_error_threshold(struct app_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->error_threshold = 0;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	igt_debug("Retrieved error threshold: node_id=%u error_id=%u threshold=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> index e539bc030..fae9b0e06 100644
> --- a/lib/igt_drm_netlink.h
> +++ b/lib/igt_drm_netlink.h
> @@ -23,6 +23,7 @@ struct app_context {
>  	uint32_t node_id;
>  	uint32_t error_id;
>  	uint32_t error_value;
> +	uint32_t error_threshold;
>  	int family_id;
>  };
>  
> @@ -31,6 +32,7 @@ void cleanup_app_context(struct app_context *ctx);
>  void cleanup_nl_socket(struct app_context *ctx);
>  int init_nl_socket(struct app_context *ctx);
>  int get_error_counter(struct app_context *ctx);
> +int get_error_threshold(struct app_context *ctx);
>  
>  #endif /* IGT_DRM_NETLINK_H */
>  
> -- 
> 2.34.1
> 

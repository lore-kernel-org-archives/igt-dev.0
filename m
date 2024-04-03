Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC4BCD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 23:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F56E113023;
	Wed,  3 Apr 2024 23:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/oxUEJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EC2113026
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 23:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712188450; x=1743724450;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wMcIV6KiuvXl5G8m8Oq/1SrE4RzPKeLOMKOfIP+oN1E=;
 b=A/oxUEJNjw/jsQzq4J0FZY+fon7e+5vODHJt6VxU2q5Z2cW4tWUEYJ3R
 BVmAkLJ9XNusoDiIDXQtbcvEIfbgJavmWPESI3SrylwW0pFUJ3zRodBor
 bHl8P+vqbUmcMi5fRyrc/5FHypyPHMmysOvapdh4lL/iwfY3KBBoSLZAY
 kYLsrzaeQ8h+MSHocHN+Pnx9prHXn5QCdjEoywHjINmGWCSbk/MM3SQMb
 Dyma69fUcyNl4+bf12y1fQ+hUFQYq5aV7MeOR897L/sAT3M48AadGl4lb
 PNQ/fNerfhM4sAWs5uur1sWpFJBDXCmJjOQf/w7qPsA3EL66bo/RHPu2W g==;
X-CSE-ConnectionGUID: vuqXunYMSEKgGmK2MxuvPQ==
X-CSE-MsgGUID: o89Ek9V6TH+q6f5YZT9qTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18028456"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="18028456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 16:54:05 -0700
X-CSE-ConnectionGUID: GflQkQroS3Ss6j5vXmb/zA==
X-CSE-MsgGUID: fAwxLvecS3mhUArkswJeIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="18651995"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 16:54:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 16:54:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 16:54:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 16:54:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 16:54:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBXUamSigCdFFPrBB0ElwAYJmYn9GlViXCey8ZE/s8DlK0UD8zw5OVT+9/nir2c38bmnsiZmxu7o+UXwqqj18jUInZu43+c9Wd0qyPCPufXtZs+uSCmcfEXMGDXlcZv6yaaz/5+eYJTgxCgRYsU6ZQ/gLFwyUPaCAEmHzjv0aVFPHQ/VRQaGrmsJBxYkG8t1wiwVsboCwIXMKs8mVsWBVbWDMRDhFW43z3kJFHW7idp4QS6h+ubzUkwdzMmQONzgCxz8LvdIBfeQDOz9PlU7juIXqHaTKdjrYitNVljRGUXWDa6FSmvRLZXDHJwouV9RLU3Mtvpp4dBHacLAJ1kAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VywbV3X1QA9mOJVlzdYY9h0riNM1pg7K3eTRjPJuFck=;
 b=kmjoFlW1pzwMm8rlyHvceHMvoqvAyCwY4NHf8WqPxH0xvmGK4xzpxgW8HywvimXobrtERI3abRwAQbAhgFJldIeyW+RnGbtrFdW/dgujTUaSNTzqTvh1mHRwABz1bOcurNhX1codjApiLh1nbObCiSnQQ4aCMGCHB8sIEQsenQ3IjYD4BAmNsVJLdbMTu6nhRR/9xxBsjWPz58dCJHWUAp5sqFEcGsgK6GySRJw9om9IhMcO8hiOcPxw5PO1QPTvo77D/zeySG8dwo0QjUF0yjR6LzEpOUR8M+1gHLbE2WQ4POn5HRc7NhT64YN3UuR6Zco/HMTNZJQVePTMq6EScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Wed, 3 Apr
 2024 23:54:01 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7452.017; Wed, 3 Apr 2024
 23:54:01 +0000
Date: Wed, 3 Apr 2024 16:53:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 7/8] lib/igt_drm_fdinfo: Remove prefix arg from
 parse functions
Message-ID: <Zg3sEDKpjSyRpmEn@unerlige-ril>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:303:8f::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB8588:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzq+EIFe2QNQiNkf4UAmgaXrtyvggZFF2jIo64lVJsCiPPR2RVzRzdG8ZA2XEKZa/LvdHvyraXcX4N2uUQQrPYycGRsEYHXunRq/nYb5uuUKzOn0qYppNknQqeS0jNjfTz/kQKqoOUGx3/1SFtfSTDMRjnBecrOMBT4McBJI+if55ZAbmClcejxcnA3GxXCbU27JsCS4JeqA3hztEA1K1Xd59ON1iefNPC9kJrdaWQn/dT0pM0qe5Y0nFo2HQWZUiw270zyXewhmG3CwLL4Qh7WJT/HMaTIt1VCh5lT6mA5ThMUgJQ9jb+YWhyojh4uhaASrUZezA+IpIS8f5p3gK8i9qKsYccfOLANvFlZfaRYFsefJeJM5mUPdsfuuaWLLfiIDJy6JqGs5lIEWVpmAz/o/vOOkHQubSPa1hg2BX3dkuJqrn+48roFcRBKGkc/5kqYULVfYyUaXUNxnPsZNxXZwl6PAaj2sU5ZbRgtC1j/86AEl5ODuAJageNaGb0nmi/3zJIRvywOz4kRKPPuf4ymI2A5fCZvSl/js7RsV8M6cebUSwQQB59R0L3wyCfWwWVZHZKquP+DNkcrJCaAGethAzRLgJyOFboGjCdT1bPbNhIjre+18iv6ab14fRI9unKZYNAWs9wGIJ43ugOYIUP7LjsmxMwO8JxBJjOeCDG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdqNFlyT2NHUmFFWnEzeFVSRDBHMjJIdHBUQ0t5bTVkN0Fja3p6TEs5ZUk1?=
 =?utf-8?B?QXZlaXI5dFFFZUtsbkFsTjlLMlBaMlJLTXBsUFRhSGZUSm10eUJxdVQ5OThl?=
 =?utf-8?B?bWRGdnhXdFZLYlFvZ1NVMjY1NEZXWldjU0twSE9mZ1pidDBLU3NqS2JUWGRO?=
 =?utf-8?B?ZzBMOGl6UjE1Z1ozcnR2TlNlb0h6UERXYTRVd1R2blJIc3NCbkZUOGFiU2xS?=
 =?utf-8?B?OStZcENYSXBFR2pRaFVZQ01iTE1iY3NVUHZmaHFGdG5Pb3NNQ0oyeS9jZzNj?=
 =?utf-8?B?cHE5d09UdUY0cEFKRXZaVUtybnNaeDRPWDUyQ0pTb0RseEx6eDJXc1ZncHp2?=
 =?utf-8?B?VzlxaGU5NWE2MnN1MHFiYXZhVnc1czVXdHovNE5lZUJrbzhRNldOaHpGVlc4?=
 =?utf-8?B?TGZqR3lEeGE2d1F3cUdEUlRFb1FzRkpUUEVkOFBPb1d6aUwydEFVa2R1OWxL?=
 =?utf-8?B?czJvZWtydlRFc3IrRlh0blNhc2ZyNnRuNCsyQ1hrVXZnS1dUYm1qZjRWOGdo?=
 =?utf-8?B?dmljYmFZNE9aWVY1eWZ1K2FhNVdLRFJJUk4wbGZ5Wm9yWUNhQjVQWDRpcVlx?=
 =?utf-8?B?NFo0NEJ5OGtETStmZXp6WVlrN1RaMDEwSHFqUW03V1VXajllRjhDcW5CQ3FZ?=
 =?utf-8?B?TXdzZW5XeXM0Vmd1ZmRValJQc1gvMlVrVTdiQlcvTldKVWg3WjZtcWhqMTRT?=
 =?utf-8?B?cE95NTBZRmRhdEVDUGtzMkdjWXYwMlZXQVN3Y09ScmY3YzdsRGYwcDQxWkht?=
 =?utf-8?B?ZVBSVU1jNmJlYk9YWkxLVVVFakhvbHRTWHJqMmRtL2h2VzQyRkVUSnIwU3l1?=
 =?utf-8?B?L2g4WnVvM0RyRHlreFRjME5YUjd1c3FHOWo5K1pDQm1QcU9JLzZPTWZpMlJh?=
 =?utf-8?B?ZndWajBBS2V3VHpKdmJySEo1eGU2T2ZGNVl2aU95TE9SN1VsQzcvY3lCN2tT?=
 =?utf-8?B?TFVaNDh4N2tMRmNpeHB4MkI3enlCUkU1b3VHSUo2cTRIdzRFNDRJK2FqdFVz?=
 =?utf-8?B?UTJIZUNvdURlRW5nQnNBYjFwd0RadGFvS2sybmhMTVhuYVZrVDlKWlc1bjd2?=
 =?utf-8?B?SlFlMlIwUFJqbXE4YTd5UnZnY2F0VXhvTjZ0WWprTkJPTTl5SW1iRXZjZ09K?=
 =?utf-8?B?akptaEJtZ25HbitTSGphbkcrTDh4WlFJUjNWeFduRjdIZFRiK2JRSVdTT1BD?=
 =?utf-8?B?QW1ML1JLNWJML2twMEM0Wi8wOHNyOUJLSC9XazcvbDNDNmtueVFjVjJnSzRy?=
 =?utf-8?B?QVYySkpiYzZnSExLRmZUMTJiOHJJZ2tTQmpUQUZMNGdETGw3aGlGVWdJY0Q4?=
 =?utf-8?B?Ym9PNWk3dDR0b09Zdy83S2dRRGdGbk5kSlRBQ243ajJpTGNCak5HMjJ2U0ZB?=
 =?utf-8?B?M25qS2ozYy9IRU9zY0hvd2dDeEJob3pyM1JMOVJ0N0lsUVRFeG03cE1wNDl1?=
 =?utf-8?B?MW1YbThTem9uZ21PZnZobDI0dE9OeXBZbUc2cjZKekxHRXNRSzFBR2tucUFD?=
 =?utf-8?B?MnJhQ01uSGo1TC90UjRTWHpXRThDTXBoeUtnOVBDUlpYTUhGbm9sbDBJTjY2?=
 =?utf-8?B?cllHMTdncjV1Qmx2S3RmMEl5MENpMGVFQUFhSWxleTE5dmhkT0RzWGNQV0cv?=
 =?utf-8?B?YkR5V1I1UHpodkkybU9tZFNWSWJwNXZYbkNVdjV5ck4zVUI3b05GQTRiUHZT?=
 =?utf-8?B?SnF6QW92VUFqL2NEQmhOTFNseVp1TjkzaHB6NXlweDdhMytQSDZka2x0VUJV?=
 =?utf-8?B?d3FGMjFsdHlQemRTZTFHSDkyMWYrNDZMMHEwa0hhLzVJaFdYWTNkTmF2eUZK?=
 =?utf-8?B?OEc0N3d2LzZabEdDa2xLUlg0SzY5ckMzRktybkRhYXNJbDZ1U2U3dm5tQklj?=
 =?utf-8?B?VXF3OUpUdWpmQUNQd3oyenNSejJKb3plUFFPdkZNRzI0OXkzMGpaOExEWnR3?=
 =?utf-8?B?bVo0dTQvTVI2TStDcUFWaGJsNXBiSHFtZG1sZkVPNlo3R2E5b01XTWNrUFh0?=
 =?utf-8?B?SWozL2s5b25Nc0RvMGlrTHM4OGFnc3pITXpraVpRb3J6K2FtcExNMG5LbjdX?=
 =?utf-8?B?Q1l4dVFWRmxyVnNEeVpxNTNzMWF1RTU5S2lnZ1UvZmFDVWRhbEliK3NaSkYw?=
 =?utf-8?B?ZzdhRkk5andrd2JJS1I0ODRJcmFVeGJDSVYyVGFCNjZUWXp1WDZ0TXQwZ0N2?=
 =?utf-8?Q?X3ryKiZrJQRD6WkXbYpU2/0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07351534-0c68-42b4-a109-08dc54395616
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 23:54:01.5487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ljSmXuKC5qJwcHO/YMEVihd6o7dTYoJrN2T7I6lnF8tWr2ZkijXgyemCqB1yPCzASo3nE7ZNYSJsGKCBnWfu22JZHdup/UYGq6Pg84WPHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

On Tue, Apr 02, 2024 at 03:17:15PM -0700, Lucas De Marchi wrote:
>The prefix is not really needed and __igt_parse_drm_fdinfo()
>can simply pass l + keylen as argument which simplifies the parse
>functions.
>
>While refactoring this, it also replaces the remaining calls to index()
>to use strchr().
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_fdinfo.c | 69 ++++++++++++++++++--------------------------
> 1 file changed, 28 insertions(+), 41 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index a0b41e956..7a9ae94f0 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -61,25 +61,23 @@ static const char *ignore_space(const char *s)
> 	return s;
> }
>
>-static int parse_engine(char *line, struct drm_client_fdinfo *info,
>-			size_t prefix_len,
>+static int parse_engine(const char *name, struct drm_client_fdinfo *info,
> 			const char **name_map, unsigned int map_entries,
> 			uint64_t *val)
> {
>-	ssize_t name_len;
>-	char *name, *p;
>+	const char *p;
>+	size_t name_len;
> 	int found = -1;
> 	unsigned int i;
>
>-	p = index(line, ':');
>-	if (!p || p == line)
>+	p = strchr(name, ':');
>+	if (!p)
> 		return -1;
>
>-	name_len = p - line - prefix_len;
>+	name_len = p - name;
> 	if (name_len < 1)
> 		return -1;
>-
>-	name = line + prefix_len;
>+	p++;
>
> 	if (name_map) {
> 		for (i = 0; i < map_entries; i++) {
>@@ -105,40 +103,30 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
> 	}
>
> 	if (found >= 0) {
>-		while (*++p && isspace(*p));
>+		p = ignore_space(p);
> 		*val = strtoull(p, NULL, 10);
> 	}
>
> 	return found;
> }
>
>-static const char *ignore_space(const char *s)
>-{
>-	for (; *s && isspace(*s); s++)
>-		;
>-
>-	return s;
>-}

Removal of this ignore_space should be in patch 6 (like Kamil 
mentioned).

The rest of the logic is same as the previous code, so with the above 
change this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>-
>-static int parse_region(char *line, struct drm_client_fdinfo *info,
>-			size_t prefix_len,
>+static int parse_region(const char *name, struct drm_client_fdinfo *info,
> 			const char **region_map, unsigned int region_entries,
> 			uint64_t *val)
> {
>-	char *name, *p, *unit = NULL;
>-	ssize_t name_len;
>+	const char *p;
>+	size_t name_len;
> 	int found = -1;
> 	unsigned int i;
>
>-	p = index(line, ':');
>-	if (!p || p == line)
>+	p = strchr(name, ':');
>+	if (!p)
> 		return -1;
>
>-	name_len = p - line - prefix_len;
>+	name_len = p - name;
> 	if (name_len < 1)
> 		return -1;
>-
>-	name = line + prefix_len;
>+	p++;
>
> 	if (region_map) {
> 		for (i = 0; i < region_entries; i++) {
>@@ -170,20 +158,19 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
> 	if (found < 0)
> 		goto out;
>
>-	while (*++p && isspace(*p))
>-		;
>+	p = ignore_space(p);
> 	*val = strtoull(p, NULL, 10);
>
>-	p = index(p, ' ');
>+	p = strchr(p, ' ');
> 	if (!p)
> 		goto out;
>+	p++;
>
>-	unit = ++p;
>-	if (!strcmp(unit, "KiB")) {
>+	if (!strcmp(p, "KiB")) {
> 		*val *= 1024;
>-	} else if (!strcmp(unit, "MiB")) {
>+	} else if (!strcmp(p, "MiB")) {
> 		*val *= 1024 * 1024;
>-	} else if (!strcmp(unit, "GiB")) {
>+	} else if (!strcmp(p, "GiB")) {
> 		*val *= 1024 * 1024 * 1024;
> 	}
>
>@@ -251,14 +238,14 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 			v = ignore_space(v);
> 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
> 		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
>-			idx = parse_engine(l, info, keylen,
>+			idx = parse_engine(l + keylen, info,
> 					   name_map, map_entries, &val);
> 			if (idx >= 0) {
> 				info->capacity[idx] = val;
> 				num_capacity++;
> 			}
> 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
>-			idx = parse_engine(l, info, keylen,
>+			idx = parse_engine(l + keylen, info,
> 					   name_map, map_entries, &val);
> 			if (idx >= 0) {
> 				if (!info->capacity[idx])
>@@ -269,23 +256,23 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 					info->last_engine_index = idx;
> 			}
> 		} else if (strstartswith(l, "drm-total-", &keylen)) {
>-			idx = parse_region(l, info, keylen,
>+			idx = parse_region(l + keylen, info,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, total, val);
> 		} else if (strstartswith(l, "drm-shared-", &keylen)) {
>-			idx = parse_region(l, info, keylen,
>+			idx = parse_region(l + keylen, info,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, shared, val);
> 		} else if (strstartswith(l, "drm-resident-", &keylen)) {
>-			idx = parse_region(l, info, keylen,
>+			idx = parse_region(l + keylen, info,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, resident, val);
> 		} else if (strstartswith(l, "drm-purgeable-", &keylen)) {
>-			idx = parse_region(l, info, keylen,
>+			idx = parse_region(l + keylen, info,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, purgeable, val);
> 		} else if (strstartswith(l, "drm-active-", &keylen)) {
>-			idx = parse_region(l, info, keylen,
>+			idx = parse_region(l + keylen, info,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, active, val);
> 		}
>-- 
>2.43.0
>

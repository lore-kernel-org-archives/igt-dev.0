Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD44D60D0A
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 01:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CCA10E598;
	Tue, 19 Nov 2024 01:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqZan4DH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264E610E598
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 01:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731980138; x=1763516138;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MdQx04l0wfGEPmH+flx0rUFrz/wHgeV7f3VuuND5mPM=;
 b=iqZan4DH28lP1RovL3qtK70C7P0uzyMxENHma25+5zW0g1DSiATWkSeT
 txY7nYSLn7TMR9grPCp2wcjaFoK1vIMWkqpBkYL/Plv+7yIa6DAvnUVkh
 5vpKzhkicthYKYXY/z0wTXLouh75Ygk179+6C9/lyEr8XMGVV1CohWvpQ
 kwuPzuzd606FQALoJoTXVmyZx21Sl7NJM4xw5UJyzhoMJLCvs4RfyXpj1
 k9pBSeiGno0mvOONCOL07B+B4kKGDynjiEvsUd2TAhQpkFaJVUG3b1O28
 nx0qDmN4v8Dhg+kYKDPpSU4wfkYcbYI/rdq2EXPmSFph4SLdzoXusshUz A==;
X-CSE-ConnectionGUID: mn4oN8SKQ4ClYZ9uuVnxaA==
X-CSE-MsgGUID: UkkgpNTYQHO7MLPD5yop2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54460877"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54460877"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:35:38 -0800
X-CSE-ConnectionGUID: jKL0ayl/TlC8MXPl5op1tw==
X-CSE-MsgGUID: D9i4TKQlS6C1BR8v/sltaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="90203703"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 17:35:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 17:35:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 17:35:36 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 17:35:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC3ZC8vq3HUQWjYCawsUyVXAmj1Qi9kG7p0nhv5I7A96YB5jVszTsR9m21GDLoRIXnSgcn9JsR+dwXehHgZplawubUjDQeKzuJujkeDwMJ9ICfdDhNL60wawVfdFaev8M1yeDDzn1B7MHuCR8jCgNyi/qI7qMzJ7d5/NiZH6yIr3aGRoQkfXHWzIf9wT1gvXB4ol1uqOSTcx7bz0zJwNLXzXhjzGfBSvX8e3YbWbHIGXLCG/18HCffHFC2SEncZGj6CemJcZdIET7FibyHRKHKu9xdRCXFru9zRmnxpmquNbh2/MYKAwkUay32OtK0uUNFz91sxAm4dWNdOmLlQ1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMS4ltRjNMDe/eAY0gedh72mfZazDgHmTYSuBSpDj5A=;
 b=euBsuhICxeo4LGc5h5qS8uTmsfQ5Bk9JhAIxhAm/g+Ls926tax8+wrcsxTSTLTkM7VZ6Sbh+4ChIJxTr74L8bX6ho5kj6c2TFxB5sWMLkuDCDZC5l09Eq7VIWjbrPB+e5lmQQSc18qGjfMFaQVIB6jghHoP6F764XCcp7l67NXt9ztAqqWKXBtHHKnl9iJvhDIRvMCQKPeHkLCQg+qTt2GbrDfXoisPnYr9OqWwfoaIrekWp1BMLGEqtirgfe/I0a76tar2nCLz1oy2CuKIGjl8JU3cVkgNIaGZowev9V1J0TKdXmq/T9Xda5DQpG96nofxdKEqU75xqPmNVZnsY7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 19 Nov
 2024 01:35:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 01:35:34 +0000
Date: Mon, 18 Nov 2024 17:35:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 9/9] xe_module_load: Stop caring about snd
Message-ID: <20241119013532.GC4891@mdroper-desk1.amr.corp.intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
 <20241105061845.2486557-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105061845.2486557-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: b659d90e-9ec1-4705-41a0-08dd083a7653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CQnuOtYPqV5M0iQodGfqhIYAF8o5roQLoPF8JcwnqxSy60TaHgsLAtG1NNlV?=
 =?us-ascii?Q?aeRJJPF44C5XpHMLwxPP/Sfg+oO7aIKGzeX5h88mRbPKOQw0pLY/iSUl9xnD?=
 =?us-ascii?Q?30nJ20nRYZsgEsb+j89CLV4WorkZ9dmoNrWgExwnPQK0wjw5wNmTHiKwHOMW?=
 =?us-ascii?Q?xPuk2V/LSsIgt9M4HlTodSjQ1VUPUGR7WMqwfvIc7B/cgod8+ANYRZC6NA1y?=
 =?us-ascii?Q?+BCtbJrXyzdYVFOhfe2eT4DH2Th+Cf+1xgIIOzJj+FPvGQW8PhlJ8ww5W+M9?=
 =?us-ascii?Q?PPJ5o60erxsiDx2qfzEQaIN55ClcZpob1Rl+jXigvCQLrC1cZ+lipxYjG+8p?=
 =?us-ascii?Q?T4s++grih3gkRTBlkvoV06KTujkbW9SsWaULPsJNbb2z2M2NhlL4dcCihDUJ?=
 =?us-ascii?Q?m6Jghc3EblOwnwrm1j35td/KFRbejJ8BkzE36OvnB4u69TSz/W2pvr1OqXjq?=
 =?us-ascii?Q?OwkaREoWfHrdrknmOuy950FxygIYVwdxBTqbpmjqv5lWJmfVlA3V7eo70mzK?=
 =?us-ascii?Q?mqs5wrPPXwlYNR/ynFWK1pQkbR/8gwmc6MyC7CFhkomdIon4MarOEhYRSRf5?=
 =?us-ascii?Q?dJ2vdD6aoBMBmKhuFxtJKYzDjcAYYdB17vub21PFQNf7RnvK7uPkckxlgf0H?=
 =?us-ascii?Q?XQaiMsgKJ3fJfqb5KMTtcJzrqoSRMF6hqpyVF2z1vIxKuQXNuax7zPrBHsov?=
 =?us-ascii?Q?TOFIpAedXd0nftEFQLL6nUCRjG5tcAbtgzDOjyNpYskJ6GNfCqUnlWR8tawa?=
 =?us-ascii?Q?S24MOQV5aobf2NHFLja6wSMyCgni8U2112gOZ3JGc48yJVqxwQL0DyOZLs+e?=
 =?us-ascii?Q?NLshLYQ4gYPQHH9wmEC/oY9fGWH+g06PFhjLFnI9r9NmuIE2HOe13eT5jQNw?=
 =?us-ascii?Q?iU78lTvPhsC+M2Tir+SM9IMrxDtDQfhl8re4ekCgO7bq5yKiNy8/I99tyYKk?=
 =?us-ascii?Q?m8z81xmlpPBaAE0rZAwNDH1C0B9pNGezjot9eT34XccjXsHUC/ubAr1Dy4Oc?=
 =?us-ascii?Q?rh03WareHITuMdKS032bS2FioKb3CsN2VUXmWpdm66Kjbxhcs/pzp/HDe4ok?=
 =?us-ascii?Q?2NZskos8Ou4v4MWsyAHi6hpGdrkOsLLJ8IaIbmz7iAQBxFeVx5z3/VDrw4rF?=
 =?us-ascii?Q?XuwUaVhgIw0Yg/7meO4keXYtyJZMHfVOwGV/YFIxjQQV2NKUU97ZGQrICNwe?=
 =?us-ascii?Q?+xkfXFaKqwKbfUl5nq4Mvu/26om1mp9zkf4PGWNDSFVCYCypIvKtAHQQJ5CX?=
 =?us-ascii?Q?5HzMuN7mAdqmHOLVpImrx/iPYmBmelrAbBqvDfwXf+z5ePDjB3vg8zIiW3MS?=
 =?us-ascii?Q?Dsujz/MyuTqGNiEbZaP+BxPd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HYQqvzF3aMlMDFnj+1YkqO6Dg4gxfaKuRcGTS9ZeaG8VIfzl1nimS+9UvkbS?=
 =?us-ascii?Q?a+96H5fBWLsmWyfbTCwsfvaNlL9/Kvy+PaTgugmP+Ib20XY2lW3vDhpgOi0j?=
 =?us-ascii?Q?edvpOH7D9QprOjYX/SuALFdppGemFbpOTN1ZEjIX5fm6lHHP77fiZes0JuRi?=
 =?us-ascii?Q?VGSRljEABpp54pl7i8Aq80kwdsejt609wlW6jxgG/RKj3bEB/l1/vTB1c+bI?=
 =?us-ascii?Q?g/pyvK2huhJGkblK/MqDtdOmn/pL4Z1a7A8IDeD3uR6H+9xBWu7gJRi0D0tL?=
 =?us-ascii?Q?676JXXmEefM9L666ptwEZ3SYUHYiaSXOJcG4ZyQnQ7xJ/77mtdtp9IQgpeDz?=
 =?us-ascii?Q?9yOcsjeaLyl/4rDJ359Hfn+zpKaxjojjtD5lTSupruxtRCUxRA25YX/1vC5g?=
 =?us-ascii?Q?3WyEf3feoYcc23bZeGsP97JrNxdgs2TGNASSgqXYalozS8tQ3VLULR24MQp4?=
 =?us-ascii?Q?ABUu7ZQrC8+T6AnSaUZXqrSa19BWTHCWBcQq8BuhgMs+mbOpgcHdTAiOJZ/P?=
 =?us-ascii?Q?6jThTYrioYqrBKtuibvVPiUTC+pcNKUcLIYypwNlDUyhXjq/suKFncC297pd?=
 =?us-ascii?Q?tBuwnC41ytQC2DSxXaiXeARz53iu05rm7tD+cig5G9re7upJuOaNR4s5wm7q?=
 =?us-ascii?Q?RGSp99camW2YQp088MLG9tuGzEJ0/F18xQ/XtKkTzXI6qaMPotYyJWksOUu4?=
 =?us-ascii?Q?4068K8oZwSw7QaunhhkhgXhxbr+P/7aktEtKSvo1eOr9bu1nUGsQU+VmE8Nh?=
 =?us-ascii?Q?qlkVRszhK4RQaS8HvyuhxoE3WG0AVXYi/f2swNRrd8LoOeZE3Kpc5ZQuaqhB?=
 =?us-ascii?Q?4pVOMglMV/lARU3S6FLOrwLQkSJesIH0lHGZcGUpUvSKWbMtQQVuNSyVPsr9?=
 =?us-ascii?Q?3jIArF2tPJBeB4V3fDqGBhIE2fgwEyfXAGWAvlKU6TRolU96bDKDxWGW6dxx?=
 =?us-ascii?Q?FqF3TdywDswkPgikAbRu+9yrMLf1UU3UxLI8gACbszdTk7xRCg/NKEjmgiBh?=
 =?us-ascii?Q?ZcPoqdDhd6GgX0KpnaspA7cEYnQPcpr6I/BSZASGohGnWOhs+5vW1h7hZDIr?=
 =?us-ascii?Q?H83mdITzcBn5BgEovDjtFL8/qce1hZj0BiQdy6pPT9xXXPORqYS+T6Ftd2wC?=
 =?us-ascii?Q?n8iw+QDaln0iGmTIJa+3wsafxyIDTzu70M06KfVChpZFJCfkhVkil2GhcRQX?=
 =?us-ascii?Q?jM2qKoy6ayBYdmEO3Ws12jX0bTd9S0sWisHDF7FpodRrw/5VVnWoGuIdXTB2?=
 =?us-ascii?Q?TOZ5nDqgp5ozZslSum/LOeKfpn3zqIT8xKzCHPEJYyYBNppaw7q3SRc+dqms?=
 =?us-ascii?Q?HNPjTFT9/5hJt7GiHwNDIEuYAD6PHgtPI7p99BSk9ADSKCmSXr3tVoLcnoVA?=
 =?us-ascii?Q?EsWaAHrrwy2pzHZjPsE+kp7wSCiSnHGC6YQ6ZzpckYjrz86YLfjnLG+5t4xK?=
 =?us-ascii?Q?TwFnSfckCbiM31ClFiTC/8f7m4p5QgSLKLDky3G9dkTHwB19O3mt4DI6lMIX?=
 =?us-ascii?Q?AwpeTvYxzn4XbzjQH0XdQF7J242RCYWhkZO0bqBXHZsXcMqa1p6StxtDxLba?=
 =?us-ascii?Q?DzrKXaK9mPaO85Ifbfz/8NmPmjSbcutPjwDu7YUN5QxrJ4XE324oEJOFYowr?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b659d90e-9ec1-4705-41a0-08dd083a7653
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:35:34.4965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNg0gsPcpLwf/KzX95oixgHh/U+FmvGqU+md7xEP+nE+pYhwVnDSnrqxUBx60IMejL4DY09TP/kYew7FMXTn0oHRZ95K8vNhohu/7zVKmsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
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

On Mon, Nov 04, 2024 at 10:18:45PM -0800, Lucas De Marchi wrote:
> Just handle xe and it should work.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/intel/xe_module_load.c | 40 ------------------------------------
>  1 file changed, 40 deletions(-)
> 
> diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
> index 83e37430f..b91da5c32 100644
> --- a/tests/intel/xe_module_load.c
> +++ b/tests/intel/xe_module_load.c
> @@ -36,52 +36,12 @@
>  #define BAR_SIZE_SHIFT 20
>  #define MIN_BAR_SIZE 256
>  
> -static void file_write(const char *ptr, size_t size, size_t nmemb,
> -                       FILE *fp)
> -{
> -	int count;
> -
> -	count = fwrite(ptr, size, nmemb, fp);
> -	if (count == size * nmemb)
> -		return;
> -
> -	igt_debug("Can't update hda dynamic debug with : %s\n", ptr);
> -}
> -
> -static void hda_dynamic_debug(bool enable)
> -{
> -	FILE *fp;
> -	static const char snd_hda_intel_on[] = "module snd_hda_intel +pf";
> -	static const char snd_hda_core_on[] = "module snd_hda_core +pf";
> -
> -	static const char snd_hda_intel_off[] = "module snd_hda_intel =_";
> -	static const char snd_hda_core_off[] = "module snd_hda_core =_";
> -
> -	fp = fopen("/sys/kernel/debug/dynamic_debug/control", "w");
> -	if (!fp) {
> -		igt_debug("hda dynamic debug not available\n");
> -		return;
> -	}
> -
> -	if (enable) {
> -		file_write(snd_hda_intel_on, 1, sizeof(snd_hda_intel_on), fp);
> -		file_write(snd_hda_core_on, 1, sizeof(snd_hda_core_on), fp);
> -	} else {
> -		file_write(snd_hda_intel_off, 1, sizeof(snd_hda_intel_off), fp);
> -		file_write(snd_hda_core_off, 1, sizeof(snd_hda_core_off), fp);
> -	}
> -
> -	fclose(fp);
> -}
> -
>  static void load_and_check_xe(const char *opts)
>  {
>  	int error;
>  	int drm_fd;
>  
> -	hda_dynamic_debug(true);
>  	error = igt_xe_driver_load(opts);
> -	hda_dynamic_debug(false);
>  
>  	igt_assert_eq(error, 0);
>  
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

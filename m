Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45998D2B950
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 16:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F2610E115;
	Tue,  5 Nov 2024 16:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfXGBoBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6530B10E17B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730822992; x=1762358992;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wqoguG9+dvms/nlOfOr7Gt+C+HCQRdbV091qCOJuTPI=;
 b=LfXGBoBNUpeVfZu/U3TGp7Zl+ZZNyNJW7N5B1dh0xb4VVfnrKZPTxG6+
 jS1VtLkOAdWhNSkHBDMOnupJWslhDSMWVeVoofs6vruj+vZ6mvpVct2wV
 WogjEdFHVyQPzFq8EeUYxqEDwvKVamG56LVhlFCY3bHpBiAu//M7msB4/
 SJOzvOkathfEaEcH8ByO38Itf63rAd7MNfguX0BQxPgHlVSpAwx5m9tuR
 eTF41C4P8iBjk6PNYVcfrjMQx1d6Adxv1CfZdJ0x9jgyhDi+tiucqOVAI
 oGarWCwuYcbNj2zGQurjlkOECPy6y60VlRB+Ov/li1QGC3fDhJ4Zc8JVK Q==;
X-CSE-ConnectionGUID: W7PD+b/dRd+X/v3o8ZBjEw==
X-CSE-MsgGUID: 2+s28VrzS2u/RjCDNSAeVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30742406"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30742406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:09:52 -0800
X-CSE-ConnectionGUID: B17fCYtvQjSVzZauL4ppdw==
X-CSE-MsgGUID: dgPRujzZTjayfPYUH8Q2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84158237"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 08:09:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 08:09:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 08:09:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 08:09:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGxJzC7UN2ailrQZ7kDZlBOqWQIi0yPuxndmVJHCoZLDdlZRPnM+NFY1t8mVbEhefCPd5pF5OnalhngQDDZKHdfWL7NmE0G4rS1WPRfJO/A6RyzUsIEW7H5+zFhleVhulKMUnwAoFiol+nlT9Uqk7RKoSnk9gHv6sJzZP4WKfoCvZTMWZjq4F98n4Sq2Sk8GoMVL6vCfGiFgF8YIY+Hb4kPVgRMHC+6Ej66EYUWLD8UhkGL0IvJFiQ95Wm7vy1ex0vrb42i8mZtkzPzcJTGgKaK6NXKen9Tft/tvZ11WfK6i3lGYg+MJebl6ceh1HKUKWHZQCtpih/4lrxt+H9MQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXFinwirj/CsYnZiiQMclSRj3pD1IUlPme8R9qj88Cw=;
 b=jT0i2PF1Nz19+EH/T4V1Ddvr+m0xqPKJWrnkLxKi14E1jfp6pHe67BAQvCDXmghm3d/1UUh8RkWo4y5KXHX2KzM3ab9vv+qsx8q4VCs+N69cE8BAJiWLZow7MUfoUz8snMOayKeaFRd927wm4lLYgvSahSME3ZdBWgJn6PqjtkwzXU2E9OPOUIGSu8aF70Ra37NFUeflQxeMoOpUV2pzt3HYR5nXG+EKelgx6oyCBxc72+5La+kDw+p+8UIb7+WyCPiChTXNaR+E/obHyGuSCO4stIAa+QxAOm3Cr/PR29daR8TlQTGbhh1Hm+4rmctwiu8xlaINQfEu3z1DSq8cPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 16:09:47 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Tue, 5 Nov 2024
 16:09:47 +0000
Date: Tue, 5 Nov 2024 11:09:41 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <John.C.Harrison@intel.com>,
 <sujaritha.sundaresan@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_gt_freq: Change basic throttle
 API test criteria
Message-ID: <ZypDRUBurYJBd9eo@intel.com>
References: <20241105063228.452559-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105063228.452559-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 653d0b0f-ab76-48e4-802e-08dcfdb4441b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QfCJ1LmsmEjrVxvDy0p3P2zoG1LgCVuQTInZxIRE7Mv3BGKkEOD8HY6aiJ1r?=
 =?us-ascii?Q?ITHVpIQSYTdsrdKGlZQC4JKUamJzf3y+IhA/uzNGnq48VVxPiDqmc1E+WKx+?=
 =?us-ascii?Q?4TYHLsfBT9lB6ogPKPBLad+VM1hN0xn2XZR2mnxR2z7CJoC8u+xZ/6GN8eb1?=
 =?us-ascii?Q?0DSHd/2pwJErs/Cx3j/tdag7NHy77GiaYwhKgOpX6g0QiFUePILfIDCs6CGP?=
 =?us-ascii?Q?3Crlyh12oARAu7kZLgyOpBoSxWXdzXF4EckF2GqGr94MyrLqA7nChZURjBId?=
 =?us-ascii?Q?4kdPmiEka/bItnPnsO2a8addcC1hYKVauOoOhKiNx6FfgnhB+CUpZ2Z7IETl?=
 =?us-ascii?Q?m1GMlJI38qfFHaRs9vx4hd7q7qpODtncLIXbhPXJ1iipLSZ+TT/PaQJUDenL?=
 =?us-ascii?Q?fjXerZrPBBTmos1CSWhLhVLWgHZOUGzWBkYc6akXIKN+PlHJL+Tf3/6oNpk2?=
 =?us-ascii?Q?m7jP56IfOUwD0HV/OD9KbmE1JkYw4m5/rJtoNb+bURen2/DsO0G9RRBnf0dG?=
 =?us-ascii?Q?6kwAb88BU2Z39caZ/7H469ykuIL+vp2GiVPa/JCgEaGI1YB02BBfuUCFMQd7?=
 =?us-ascii?Q?99TSIbTgXXwPkqO4CNqZ0Rf6weA8a68Ss0DabSoCHKAl4MtVF8hxM/F6BA4p?=
 =?us-ascii?Q?eG/yVmAKUK9+Dx/bjhYsKJETCeMszxQoBG4Lb9duJm1PCqVO7wkYsQbQQnVr?=
 =?us-ascii?Q?aIPkUQiIFYE5TsvL7T2jz/c0B/qvbFc0zFGafGEOk9iI1tWN+bDG83lqlxGG?=
 =?us-ascii?Q?czqYVQLcjV6wcfvqvr9NpR4GJs2dleFv1qR++MGj0SUntlDWf65u93n1wkbW?=
 =?us-ascii?Q?BEKtNEGX76z/j4jozfSdIJe9dU3N65YIUi6gQx8Z00820xqtbAQY2bXl3YuX?=
 =?us-ascii?Q?8/1aw5kAKvBoX1jxVl6MHJaxp/qFkWyIRZAa/gdc4a++HSx46kVK4YhRfNSM?=
 =?us-ascii?Q?F4SlrpMQo30k23wD1nYaU1ssiPqaeqHexSVjBWiQJL+9YToexfa406Ik5PEF?=
 =?us-ascii?Q?4bbzZHRsh/N1mUvGGPy9+qexNVie2UBRQtsu+pmuDtSun4PEvcx0VmUr0Rbk?=
 =?us-ascii?Q?ivlA6uYOxC9wMhIkFpecYzyXF+mTVhbhO/RHxNPe430HyUQWLUhRhctpdM3d?=
 =?us-ascii?Q?8Gh9Y/8KiWgGt1jVFD8sznKpaU4Psf+HKOgjHikWVr/oE8wDILjKJnRXtILE?=
 =?us-ascii?Q?dPmp7nJZVQwqPM1ms7ZH1VAuB+rCkmOaKVhXADsks0l7SLgdJGp18TodoLB5?=
 =?us-ascii?Q?T3Ydgdl//H1oz3x9qckes7MixF/a0rv5bE7IJFKoKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1rL6gcbY2R6P8Aaec2IRVO4kfwjCj5CiywUUzkbJuMEiifbwB/lItDgEHbWi?=
 =?us-ascii?Q?HmaHEr4ZPvyd7qGj010SWdbCmal7sam3BvjrQ3N/C8szb9+dcTph2DgIL/Ga?=
 =?us-ascii?Q?es+bduLdaDIoWdAZxZ3q5mpek1q2/SGorCtFKvOWSYMGedlL7ZmsoOxMypw+?=
 =?us-ascii?Q?cH+L+9IIb2anS3sBkJzuraQLSvZsUvdBY2U8Dai7igEevQLBOsC+jfJmZ71g?=
 =?us-ascii?Q?a9g2x6u2OrBkRIPbm7otNJpj9YCrvRKMnTyB7ojLQXZtZtmx5fm0MVZuhvua?=
 =?us-ascii?Q?W5pZ0Hjx4xwtqFyrXN9HeTMyOCFGWUJt36mfiJ/N2Nk2ltDMiI2OgcqktkmF?=
 =?us-ascii?Q?emFMq4HF5cp422WdlA+/ZxUHtB9yfBcqLr16o9x5+Rzom6z2CwMx/a9wovSz?=
 =?us-ascii?Q?aLi0rvdPsGydCLIspfLIw25voYQ6iASznyscpdLeDPVoZpuXkKACrCtihuMp?=
 =?us-ascii?Q?R1yH3tDXbhRwtGYp9K2rvVG2ng77+p30qzSnfa6MTZo4ivXrqPLvU0jNwG8D?=
 =?us-ascii?Q?mze2+K6gf7rKEewusx/tcMSopSARKFDjEjEXTlXO1igS3adCqbKPgOX0br0g?=
 =?us-ascii?Q?Qrl/nK4Ne8WBExT8zECQMxSsMjXTUC8WNUmNVlIQZnSaS7O4+G8++awoKu0C?=
 =?us-ascii?Q?/hh8CiyEMCjJ14l7q3QqAW6fVXuX1zVfic2bfX0AHJMEFaw+refuLRN9I36A?=
 =?us-ascii?Q?fBJfKIBzaLgMKBoduOnbL3E36ZJmMQkJ/MrdmNiKcrYrOpK6H+c2FEzXB67f?=
 =?us-ascii?Q?J/AKWei0VZoHuHf6L9yn0lhEB0VbVl0iKRUlQdJf3j00qair6413NqAYwI/F?=
 =?us-ascii?Q?pSXhhoK4seu9rKWTfZXBW6gCs7BZCfM+VsqWUS8cUrvTfA2A4N6n0IgiLntw?=
 =?us-ascii?Q?Tae/bsKecfewxpTaEbBiyy/n1zS2BKmsBzIeeaYw9peCZttqQYGTrBeZl1TJ?=
 =?us-ascii?Q?ehMNbfZLkJoN/KymVhOapm7gie/Qrv8xo9wb5KS5bSj8MUxpOicOqz9bHrfT?=
 =?us-ascii?Q?I0GX1kdnXqDqt4T//RLcyxbzjcos52KL4ELTxcGa8V6A4898n4jhDL7glFjX?=
 =?us-ascii?Q?ah0tTJXIRiNKGwW5JL/W1bOhFMKYsFi5i/+zGUDUeuDSwF5WJtaARq/MC+yu?=
 =?us-ascii?Q?sr16SSzG4nexN2O+jMPEwYxDhvshlAcBnnZBtFNFTMHgau9mD/RbBch+UyeT?=
 =?us-ascii?Q?Bfz55l8e8ILdfbXUZOGR2kb1AmDhyzeCvf+X0nwXjUuTlCo3LZfVpsc4TE76?=
 =?us-ascii?Q?7JWmtRGmv81yxt5kUj/wosqmV7p4RRvvclPO5ZnrHfmSxjbOHFQtAP8830AC?=
 =?us-ascii?Q?ouVKNQf4BXaYdxumSGpd2ALzZiVtyRXT+yUJYCv36tJyFtEqA6mT2GvQTeAp?=
 =?us-ascii?Q?h1v7P/iIsQys3SlLf2IK/JuoWQRuJqgN+1Ss/jaSBKENFoJGE+1wnZnhyCWx?=
 =?us-ascii?Q?tf2/VC09w9mwNKSWIbSwIcj8clZv9Mp7x29OqH1iyXKwnv8CVcwNO6VlJAyn?=
 =?us-ascii?Q?BpPF03i7Rav7ghsBeybiUrJ8dVRetUvdCTLAoxNtwRujfnmdVMDSyvpAHc13?=
 =?us-ascii?Q?Pl6QRSx4TRbi51PMF67D4qGfbsIj+wNOVO2GjMiNdg+/MbxdiqWUOqNdIfbw?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 653d0b0f-ab76-48e4-802e-08dcfdb4441b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 16:09:47.0960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmQars7EvOdcKkugqzviQzk8picH63otmkHdvm6UDg9b34IzILmpOFDVQtwJj+titPKfyX0YVIW5kiG+3uar6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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

On Tue, Nov 05, 2024 at 12:02:28PM +0530, Raag Jadav wrote:
> Basic throttle API test is implemented in a way that expects multiple
> sysfs reads to provide atomic results. Since atomicity is never guaranteed
> between multiple sysfs reads, this is an incorrect expection from the test.
> Change the test criteria to check for boolean value from throttle status
> and throttle reasons sysfs entries.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3254
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3147
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810

There's clear something wrong with the 'status'....

look at this tool: https://github.com/ulissesf/qmassa
look at the recorded example in the readme... status is poping up so much.
that is not normal. I noticed this here as well. status is flipping to 1
so many times while we have absolutely no one of the real reasons flipping
to 1 as well. This is the problem that needs to be solved.

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  tests/intel/xe_gt_freq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index de4d111ea..632415d33 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -121,10 +121,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
>  	reasons |= get_throttle(fd, gt_id, "reason_vr_tdc");
>  	reasons |= get_throttle(fd, gt_id, "reason_vr_thermalert");
>  
> -	if (status)
> -		igt_assert(reasons);
> -	else
> -		igt_assert(!reasons);
> +	igt_assert(status == true || status == false);
> +	igt_assert(reasons == true || reasons == false);

This would be the same as deleting the test case...

>  }
>  
>  /**
> -- 
> 2.34.1
> 

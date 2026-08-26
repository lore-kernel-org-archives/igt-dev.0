Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67D5C61DC4
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 20:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E2F10E2DC;
	Wed, 26 Aug 2026 20:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzrKWc3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259B210E2DC
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787776009; x=1819312009;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EtT/bNtCB/X4Hx/x5fTLEIPV7iw2h1faznwvD+U7TUc=;
 b=XzrKWc3k6OC5ayJYyZ+cwzn1/YK32Uq2tcCasglgvOe0j55kYELcCWhJ
 lc1Hcsx5HMKZYWNpJmLgt+dy7njZrAOe1homV5v5kNiO4LkPTkxwlhZZt
 4IgOZRB/+FGZAmg5IxUkk4pwyRLHwbVYIBpFTxsJ5kSK+fSMmCHOTC7FV
 GlEpPIni5KZidAuqKO/ehIGj4yRVo/v/UIYjUsA4MggE5leHdFlhAbb86
 1Lj9ZyeFaTR6Cy5U86hRjDmxKToZ68zKI6eYJcrxeQbA7JLsfhu+at1oH
 pNTGcOS6XZdB1ljZeZIk5lEIXDC/ERidBSiFzwgqzGPFT7w61dsuHh+yz A==;
X-CSE-ConnectionGUID: 3eHTlOULQCS+PJPlCjOIXg==
X-CSE-MsgGUID: oC9O4P1mTZaVFGebJ9a4rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105644594"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="105644594"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:26:49 -0700
X-CSE-ConnectionGUID: hHyFuHvDSLqyz7SRZ0/KRA==
X-CSE-MsgGUID: 2os4EwSzRamU8cqevV3ThA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="305897568"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:26:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 13:26:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 13:26:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 13:26:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV73iEzy9Gc3VzCwFHhqVyMm3PEvFqFIIkpmecfVmC0VOypoIKLsXYAn2EbQoG85ASNc6rRYit4HZ2pZkmCC9An7W3Kt5cPB6N0t4DbWQl6DLdxCYUkyy9HnNts7kV3Lb1A0qbFYkRewxtVQR5GyHto00c93ceurxpSFmiv23+3p+lKqGHFU/KC9YDdRwaC5uadd2/mw7tuHsXRFflasXm1iGXyJRuFHAGvfXZqa+wVrSVYfu2asd02CB12suX9DEpmKA3kQWozUTL6y/lvdcL9CYpIGjuIYXZNzOfiEzwypdtrg+v6fita4B2p3v01fPLM7TpnD2QsWpyYd/HRxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKOIU5y2X1JzGM3iufg7CRc6W9hLv+XAr7+kz0k8lkk=;
 b=sx74Klo/9+asefhaLPSHqgCl8buvcMdhRA+lAkjKBUC2xTKBLu1z9rZ+1Ot48L58/JblrcIHGRUiYH4/WemZ7mKqaeo6KUsjHoFB4GL3H9KJX3ggvjTChgvBGlvMcYxI/ck+lB6iBaed6J3UbtPjBaaf2z0LGzvgZWvzUELoAIaIEJTMeU69+t7+JobClHzVc7hEeMJVPMANgiVKpeEhDHK5QU2+WU5h941jH6W02Ufy2yJLGsl/sR08oD7mE5SO1uNs5PunEzj4pCNASe4Xp0ZPAY0Q44DDWtjGvw0UzVbG4MvfohNbb5vW3Q6s5FutEndXCK2P9BIp3y9hXHH+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA4PR11MB9130.namprd11.prod.outlook.com (2603:10b6:208:56c::18)
 by PH8PR11MB8014.namprd11.prod.outlook.com (2603:10b6:510:23a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 20:26:40 +0000
Received: from IA4PR11MB9130.namprd11.prod.outlook.com
 ([fe80::5963:c494:5f1:1d5e]) by IA4PR11MB9130.namprd11.prod.outlook.com
 ([fe80::5963:c494:5f1:1d5e%4]) with mapi id 15.21.0339.007; Wed, 26 Aug 2026
 20:26:40 +0000
Date: Wed, 26 Aug 2026 13:26:33 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 10/10] intel: Implement Wa_14026539277
Message-ID: <20260826202633.GA56250@msatwood-mobl>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-10-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721-wa_14026539277-v1-10-0c147eeefefa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::34) To IA4PR11MB9130.namprd11.prod.outlook.com
 (2603:10b6:208:56c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR11MB9130:EE_|PH8PR11MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: d208a35c-96c5-463f-2a85-08df03b05604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|23010399003|4143699003|22082099003|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: es/IkRFouSxgTyfhXVAkVNj4qnnNupX+W/RKaYDH9M9LL0CrsB7XLmfa9RjyK+HKyCkQEJAY6T/Bfzb6J1hhnQvKoPho8ZIHEfOVh9eYiPx4LGUxekpGMrs6/OpyVq5EjPy2oyLuyunrOZZ/mOY9RUq2CP6QXbnphNkHjbCDbJCc2Ik3AuawGhfa2Ag5qdeJlCGCFIULLkpzh4sZPKSiIEHvj67s5u6FNNifghdLTFwg3O2xntVgAmj776Gc6unS4U9aYatL1kE5p6LD7G+wk2THNPjRFKCvR9XIEfJjsZV22h6efpSBm2y3BHBwG0vA8BYq1OKkAtjYuFQG/b3j29DJD8Vm+5rFbdq7hJP+g3AdYFHeV1eDRxp9FvdnIYGZ3jLNBzrbZRmypAPf6G6iTJ310pbhwtnm98x7mjdpwqWyXb4EUypLEkgCX9HZwKvNCU5pxkkyj7LsVbpmRcqPtArCc4Rec+2CBszOSTVpd3gfxkBGer0kBKnMsREcXAeaiexhyfmMFGR0bMbiL28F9HmOJ0VVeWqBWWh+Nt6GIO8AtaJD4EwKFm19GUgc6vqUol5Mn2wxXM18VnuFM9OhGPN5FNvp9j0SaLyKs7Q3pNFqh3yO34XUeajK34BaWJyh9xOZw5nCp7MBtNF+9xVeqB7y6Cc17ZdDmu+u8acnnsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9130.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LAL8eabqrO3di8DkHDMZq1CnaY97CmcDeykdSK/ZtTWKjbYoO9uZMMoVdmOK?=
 =?us-ascii?Q?Ykgn/ErXvcn+klTHGysmqr8QSVMSnr5EHbJUul5PE5CQNITN89jdaDpTKW7A?=
 =?us-ascii?Q?kaMTcwE7B2Mivl4h6ojuIXTHwpWJiVvEJ7rLD9/qDlwhZZA6OCrDKPiRhh8X?=
 =?us-ascii?Q?EzP8GDIytkzF389gzbIsiMWdRSSLLQBtupbDp/68H0pJzOtr4okzN0jUOfFF?=
 =?us-ascii?Q?lcxUOzJJL9m/akCjElKYwCS1urrNP/9eB0x+p1YPGf96q7gT0ZpsM9kYljjw?=
 =?us-ascii?Q?k8MLa7LQyabT+1qWKcgWO+/DmiO9YRg/WNI1MEef96SlfYzmhuqQzMD4iM1n?=
 =?us-ascii?Q?TPBL4LPtLLl4WXWn+0TFmeJnlKCV9VGiMPXsUkA5kTL0EkHsFxgHRybvZYe0?=
 =?us-ascii?Q?gCK4CkHpA2dIwg8+zODY+fBqUxNkdRICvHpkss+duOwq9DFW3bP4rRqfIb9F?=
 =?us-ascii?Q?8rxgy/u03ofEACpDYlkzm9GhOmYrGKsMOWpZiV0sghpyeMFNBBuQOd+Rgt8x?=
 =?us-ascii?Q?2/b+31zwAUauayAC03w1RX12ZsJhOYUnllIJRiO3+/3vmRF1cd8FXmMXlU/L?=
 =?us-ascii?Q?pWzcp+2OH8SAOTayb8yFZigkvcbp1jN8OT6Y6sQwbGrmOVC3PkpUlivdzo0+?=
 =?us-ascii?Q?FJmkTQmy2v2cc7BdqjoDrwbbxSamvHmJrFh713D89dbQ0LmiMzdbvtU7+b3R?=
 =?us-ascii?Q?MmbZcPuPcya4OnD7AOfryiqWe3stgKSx0zY/X7dR8wMyV0sO5vAsQMRJw8IB?=
 =?us-ascii?Q?VFq3qofmNyuLGPCtuBsX3xTFw4zZng0F1H5Yj5ITqz7vLrXbZWrKsDGs5PiT?=
 =?us-ascii?Q?PX2VktEclRzU57lxsDTTTOgly/4/0gz/Lba0hlPHVKHVr/wLceO4W3wG/lA3?=
 =?us-ascii?Q?bR81pqk+5JZ7EE900+a6li2IhkKWoLU66Z7wYzUp6zNYtJDK4LKf8tlv2mW7?=
 =?us-ascii?Q?k57josl1vUqKq0SkQijgZVtUYy4yHzX30EvH61xqLsKpEAp3BzyeeURB61gT?=
 =?us-ascii?Q?tCO3bBAC1lQXobDTFkcMOP56fbF9181sdd8Ct0n33B80BhTOIFVkmEyndvCO?=
 =?us-ascii?Q?no8ogz2epx6vpPlKPF1M7R5L663/7XsC3Gq8818x5q9l4lDcJ/CAWwcG6ODi?=
 =?us-ascii?Q?nY+/tD/nDyG5nny1fdAoL4cKY9MIyc+nYbA5bR3q8eCvCWQPuC37qS+E7m5c?=
 =?us-ascii?Q?GtUyOwg/FH1GvAtbkVaph/wkqcgl7pOe6eYcP4joomqnQGp/4VYFTclnI3Tv?=
 =?us-ascii?Q?N9STWVLCFhZklG0cJxUuZVGsqo2IpMGRXUN0kSsidfeC1AWc6f3tuH+Zwnbd?=
 =?us-ascii?Q?s1ux772TnutETYF0UR7tuwLn1FbSJ33IZmfAvy4FYq8uJSyyv+KKqtCjZbWX?=
 =?us-ascii?Q?a3k4yq2ew8fLumUQgmbypw1mnI8k6s4MBmao4ar6u6irzQwYHph/yv1iKKB4?=
 =?us-ascii?Q?FkNavkESOGpOWKCjhlOBmbVftkpaLs8Tb1OGCsp9kHyDmkodN1JfGREdAHPj?=
 =?us-ascii?Q?rQtC0hvGwmNbWS7lDX6m8pi+4acmasz+AVgFjG8WUTqxZ20u2vUfI0bpjS2m?=
 =?us-ascii?Q?clZUX8TH0kA/zd8mSf6APrWHJ64IfYFDcm6fToBfhNOEx7vm0ozNRAJL6y/6?=
 =?us-ascii?Q?yuKgKgTUeod14RAGTnBnVHFLds+XikKrVT+ymP9m1usnosIWrYpmKCbchOgR?=
 =?us-ascii?Q?1cmCGd4gIdV7XBxbs49MambiJZNajTHmie0Z//KCtR9DMPhYDl47yctqFs5V?=
 =?us-ascii?Q?ONjsg8E+oirZc9anjqSh0A9OtNDAoxbtkzwz/FhqZQ+i1c06MwJjKgyzJZMn?=
X-MS-Exchange-AntiSpam-MessageData-1: zXGix4w+dDEbd03kM6VbuzdlLwLwCN57Krs=
X-Exchange-RoutingPolicyChecked: J6Xvmo+RBh8s/Kb71GPZVfe0mLLvbQwu2eO8HjwlXQ1hwYkNuue147HjFFJka1N0XEoJ3hZ1wrzT1GbijahQvkbxV7fTc5fSnvTjYlKgvXxyWXfDZC6iXwEQKg/BJeASPUXrspWY2Kcn6PsR+wJWMmKfPkk0Tmqw9NPAEWvamJ/Ytl48pT+zKhvfSCbLuOAAlcLPHCHDr6U7A0CEqXt9lMpCCY9rk2/oArkRKUp5IAl5eagx76SwtJwGV+OCg2RY71SUnJvuxe/rmOnBsJlfcioL8kPqm0D3TQHrpOJ4q2hQPvFghMRosUVQ1293Y9AB67dSS0+A8gO0Rwn0fUl06g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d208a35c-96c5-463f-2a85-08df03b05604
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9130.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 20:26:40.5717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEHTl4/vJMBFpUPCaZ19jxMkfCQPP4ZCZUedhb/UQBIaiZsDDZYc6zPEtu6UTvYD3OCdh/hRV0G0Yim8UMLKnTUWvQA+XThd77e5mxdwRqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8014
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

On Tue, Jul 21, 2026 at 04:00:03PM -0300, Gustavo Sousa wrote:
> Implement the adaptations in IGT required for Wa_14026539277, which is
> basically selecting an alternative PAT index instead of 2-way-coherent
> ones.
> 
> Because xe_pat_cache->wb is expected to be at least 1-way-coherent, we
> need to select an alternative that fulfills that requirement.  Let's
> use the XA 1-way-coherent index for that (PAT index 19), because other
> 1-way coherent configurations do not cause GPU caches to be
> automatically flushed at the end of a batch in certain occasions due
> to the L2 Flush Optimization feature in Xe3p.
> 
> In the specific case of the xe_pat "false-sharing" subtest, it already
> checks for XA 1-way-coherent, so it is just simpler to skip the
> creation of the dynamic subtest for the 2-way-coherent PAT indices,
> which are tagged as reserved by the KMD on the debugfs dump of
> pat_sw_config when the workaround is active.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Obviously some feedback from others on early parts of this series, however if
this stays the same after...
LGTM
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  lib/intel_pat.c      |  4 ++++
>  tests/intel/xe_pat.c | 28 ++++++++++++++++++++--------
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index ebf5cd428c68..caac00ad68fc 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -7,6 +7,7 @@
>  #include "igt.h"
>  #include "intel_pat.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_wa.h"
>  
>  enum xe_pat_config {
>  	PAT_SW_CONFIG,
> @@ -109,6 +110,9 @@ static int32_t xe_get_pat_config(struct xe_device *xe_dev, struct intel_pat_cach
>  	free(line);
>  	fclose(dbgfs_file);
>  
> +	if (xe_wa_from_cache(xe_dev, "14026539277"))
> +		xe_pat_cache->wb = 19; /* XA 1-way-coherent. */
> +
>  	return parsed;
>  }
>  
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index bb2975b545e6..e1d329637aa1 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -32,6 +32,7 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
> +#include "xe/xe_wa.h"
>  
>  #define XE_COH_NONE          1
>  #define XE_COH_AT_LEAST_1WAY 2
> @@ -1865,30 +1866,41 @@ static void false_sharing(int fd)
>  	uint16_t dev_id = intel_get_drm_devid(fd);
>  	uint32_t graphics_ver = intel_get_device_info(dev_id)->graphics_ver;
>  	bool is_dgfx = xe_has_vram(fd);
> -
>  	const struct fs_pat_entry *fs_entries;
> -	int num_entries;
> +	int num_fs_entries;
> +	struct intel_pat_cache pat_sw_config;
> +	int num_pat_entries;
> +
> +	if (xe_wa(fd, "14026539277"))
> +		num_pat_entries = xe_fetch_pat_sw_config(fd, &pat_sw_config);
>  
>  	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> -		num_entries = ARRAY_SIZE(fs_xe3p_xpc);
> +		num_fs_entries = ARRAY_SIZE(fs_xe3p_xpc);
>  		fs_entries = fs_xe3p_xpc;
>  	} else if (intel_graphics_ver(dev_id) == IP_VER(35, 10)) {
> -		num_entries = ARRAY_SIZE(fs_xe3p_lpg);
> +		num_fs_entries = ARRAY_SIZE(fs_xe3p_lpg);
>  		fs_entries = fs_xe3p_lpg;
>  	} else if (graphics_ver == 20) {
>  		if (is_dgfx) {
> -			num_entries = ARRAY_SIZE(fs_xe2_discrete);
> +			num_fs_entries = ARRAY_SIZE(fs_xe2_discrete);
>  			fs_entries = fs_xe2_discrete;
>  		} else {
> -			num_entries = ARRAY_SIZE(fs_xe2_integrated);
> +			num_fs_entries = ARRAY_SIZE(fs_xe2_integrated);
>  			fs_entries = fs_xe2_integrated;
>  		}
>  	} else {
> -		num_entries = ARRAY_SIZE(fs_xe3);
> +		num_fs_entries = ARRAY_SIZE(fs_xe3);
>  		fs_entries = fs_xe3;
>  	}
>  
> -	for (int i = 0; i < num_entries; i++) {
> +	for (int i = 0; i < num_fs_entries; i++) {
> +		if (xe_wa(fd, "14026539277")) {
> +			igt_assert(fs_entries[i].pat_index < num_pat_entries);
> +
> +			if (pat_sw_config.entries[fs_entries[i].pat_index].rsvd)
> +				continue;
> +		}
> +
>  		igt_dynamic_f("%s", fs_entries[i].name) {
>  			__false_sharing(fd, &fs_entries[i]);
>  		}
> 
> -- 
> 2.55.0
> 

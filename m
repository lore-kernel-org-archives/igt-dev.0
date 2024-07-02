Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5D1C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 20:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3456010E690;
	Tue,  2 Jul 2024 20:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPPICCzQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46110E690
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719953867; x=1751489867;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t7bPihUtqB4dL6Iw39/deiN3OH7uyabuaWN2B3hQHzY=;
 b=IPPICCzQXiiI6y4xsFTkXucrxI4NjEBQ/HgkJRwUbcdgNn9x3wUhf8co
 ApQ+R48CWOnWkOGsNRyGD6BQGgmolUsdy8yXE5Qu5bS1/Z+5KGMyYqiUc
 +tIW+PHhhxagV8b+0fvFe0cgK9OoRuE/3EI3BiMrEyhO6r66PiZd4FLS3
 qAkxH5EfF8T9vIq2wID3ydtGs+GvakAffC/M2Wa2Sj1sRvspv92ROnUOr
 mLe7rPBnwk9WKu3bU5KM5uVmwOro4XikUkmd13yLYFf6K3QHnr3G4oI/x
 X/uxcTWd7tKTy352ObxOnI6OZQ0P10pxvzp7boeMel/jN4W/MhE6uLnAZ w==;
X-CSE-ConnectionGUID: 62cLQ24RSDCjRf0SlPhUJw==
X-CSE-MsgGUID: 1014yfYbSJeDterRqtcfQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20055075"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20055075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 13:57:47 -0700
X-CSE-ConnectionGUID: 9/sSGDRfQKiP43B8Am0/5g==
X-CSE-MsgGUID: 4srKkJywR7mG1yp1/q6oVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="50977352"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 13:57:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 13:57:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 13:57:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 13:57:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AytRIyBo5J9W9BhtTILGaRzRyxv2Lb94A7gyzzD2NFpc4a1WkbrSu31oC3TfjWqD43dMnJFQP7qdcx59PaJAPtFRV4tBpzMnNNFIbi9286JqlK/MoFp+QXF6xWvFGxaic1NHakGWh4Nh6cZ3WPZjb7tYU85GJ8gGxcujlXC+uLeMeTST2hUMfWidxwD2lwGu+oFNYg/xOUMMM+niam5QS152y4p4ScVb02p3+rswJ/9oc/YcYhzhBDdMDy33mVeXh/9tLK+kS7M5QN9+6kmpZb1zaFiXh1ZpC5qMkfo947lAu6gPyLG516k1ZdlHg4h6KPDrWGspU7XMp4GaDYUXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ympvOD2WtsP/tkEmssbRXJ6nZAqien54pjQC9+kYPx4=;
 b=HRmCKyJdXY65FFM3vj+beRu/+O6AQfw4cfKIkaPzEsAKmYcnuNjjwpOHOArt7kv+1NJcjvIM8Ol85vHpXqNWIW5uij5QDuXFxaFTyd/iEwetRpoD6VJUMqY2Tbmz/Y+Nu6O+UAWHlvj90sGO0AETnV0h93Fktt820GLohV+lWL8U8/Uc1oVgpy1NP07n8ALssBmRf+fVW4hwCz9c4T5os598OhIebiqfQsv8tgtHjtMQ9JJI8lW7mFxm6w6oeTZb7Kv/CBwD1QG3SfL7SiHwDaj8mcogSdyp8Ke3iaYAHif9ny6HWM7xvLqHK2WJ+jX2o+dERx9er8Ot5+X482oKWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7138.namprd11.prod.outlook.com (2603:10b6:806:2a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 20:57:43 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 20:57:43 +0000
Date: Tue, 2 Jul 2024 13:57:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/8] tests/intel/xe_drm_fdinfo: Add single engine
 tests
Message-ID: <ZoRpxPzKDQdD9IOr@orsosgc001>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-5-umesh.nerlige.ramappa@intel.com>
 <hbv7noflzphd4rlkfqbpqfwqaygqfezuavd7p7ovddvm3y4vl5@445l423pjo3n>
 <ZoL009g5Pd+J8XDw@orsosgc001> <ZoREiBXWJethW5kO@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZoREiBXWJethW5kO@orsosgc001>
X-ClientProxiedBy: MW4P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b98b15-0795-4a98-fe5c-08dc9ad99df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eElYSXJhaDZTOG0rVyttZDdlakt1QnpHeWdDZjFwZTFJcmVvMmMzWkZKalpB?=
 =?utf-8?B?NnRwYVd0TTZhUkRNNTRHaTd3bUxLandRSll3Q2RRcWU2YitkSUo4dGRsTzNn?=
 =?utf-8?B?UnZybm1nMUZYR2NqdHA4c3ZIbGRwR005MVVJVUpqT2w1OTU3Q2VMMnpkRlVr?=
 =?utf-8?B?RUVFck94RXg4dWRiRFFQZ2paUWRMQUtodEJGem9mS0N6Qk5vODRYVzR1ZHFX?=
 =?utf-8?B?NGdlRzU0MUdBVE1KZFlvWWRDSy8vanFDbTZFVzhVbkRRc1dKUTFpa1J3b1Ev?=
 =?utf-8?B?ZE1xQlYvdTZuL2hvbHJHMzl2Rm5xUkx0VVg5WWZmQ3FOSkdIcFBFaHg3ZHJK?=
 =?utf-8?B?Wm51enFDTUxrYmo1eUNVMmZLR3QxNmgwMVFIM0Vxd0hwNndzR1paQS9KNHlU?=
 =?utf-8?B?WGlrRHNzNDJtR3V4eWxXQlVoOTIxT00xcGErM2licEMzNHd4T0FpWDlOZkNX?=
 =?utf-8?B?aGZySHRtdGhicjRvTDA5a25LeDFsZFFsMkZHcUE0VU13MEpGUmxadTcvZkhr?=
 =?utf-8?B?OEYwdjV6MThYQlJSR01DTUJGVnl0ejdhSWRNem82Q2Nvd3pnZkY3QkRMdjlG?=
 =?utf-8?B?VURWWTZOWjdTaHJQTVltclNSOVpWckErMTJDVi9SbzZvbHJtTEFRSTB4QW5W?=
 =?utf-8?B?Rm1mNFpNT1JsYnZtRVZ4V3gyZ2RoMUJJS3d3UnRoM2hIQllwVkJZUVRnd1BF?=
 =?utf-8?B?OEgvVUNnRlYwK3BFUkd2VjNxM0RkQXNsZXFzYWowZ1MvR1E0QnViQ2tPQmZN?=
 =?utf-8?B?VVNRZUtwVEZjSGdGWVBmSEY2Rjh6YkZIRm1GUUhObG9aekNQdGpyeWNIdmVl?=
 =?utf-8?B?SXlkMFJIRlZac3RobGdJSmNqWXoxMzRQMU5RZVJ0OExwWU5reXdYeEluQ1d6?=
 =?utf-8?B?aExjSnlBbjVYemFMbzlKZHhlQjRCTW5Dc3hWeDFCaGEwQ21pNVZRcnVYRFUv?=
 =?utf-8?B?aUpmMzVHY2lMeHg1RE9kNTJ0VG96YklkQVJYbXlENnhNVG91K0F4ai9zS3k5?=
 =?utf-8?B?QkUyZGxydjZkZzJTeEZKU3kxdTNPUytkcTFEQjJaM1R3SzlDbFB1STI0L3JO?=
 =?utf-8?B?SGtjTEtuU2lFMitOaGRIQitUZTBJOU9XYldTMEdCTHJYZkt5N1BVTzZHTG1s?=
 =?utf-8?B?dmNpSFpmY25wL0FMaEFLTTdYdmxOQUFxMVFrelNUZjFFVWhKZUJUMjZCV1dE?=
 =?utf-8?B?ampmdVMxZGU0QU1aRTJtblJ2dUJ2Z2NzdENPKzkyZ0VwN3NoK0FkR2x0ZWtk?=
 =?utf-8?B?b2dJZ1ViNDFmc2hINlZVRkR3K2dUVFpIaEwrS1hpTmlsSXd1a0ViMnJ5ZVl6?=
 =?utf-8?B?amNIWnAvZXVYWFZmdGxvQVZMbGdERUpBNk91TnNuN2hPU0pySjVvM2N5UG9L?=
 =?utf-8?B?Ty9xL2taRzRBdi80c3Y3c1QxZmJyZGlNQ1NHV2tWMXRrYzkxVFkrbDlPZlEy?=
 =?utf-8?B?b1dGUEx1cWQ2N3ZPVFE4bUFIZGl6THhtOXMzNU1ENWM3K1FNS3ZUZG5PZDdC?=
 =?utf-8?B?K0tCMU1PbVgzSkV4OTVselZZZ05pbFJwYXhaL1FJMzNyUWpOcW5vM0c5SmYx?=
 =?utf-8?B?anpVOEZJVjY5WVJjK292NStTRlAvWFZhTG1mYlp3MVNhVDloSTBFWjlOWDJL?=
 =?utf-8?B?eitKbEkySDFMRzFlZVVRVFhmWXlMY1dxa1FDL1NxZldnSUJaMHpOdjFqM1lE?=
 =?utf-8?B?Mm9TS3lOQmdlS2xvM2dMV0ZRSHJkSlJ4NVp4RFFuQjZJZ0hZZUlaTkYzdFZ5?=
 =?utf-8?B?S1QyQlVyd2FHNmMvRnQ4UDdWd0txTDhpWnRZOVBWOXlSalVRWnZyN0FzamRN?=
 =?utf-8?B?dnlxSWYrVmtNbysveTM4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmRSRFREUW05ODFYRHVhamNKckh6S1BJRWRKZnp4VUc0OHZKTnFsWXZNdFlW?=
 =?utf-8?B?K3MzakszZVZQSWV2aXd3UnBobXA3Y0ZrTUs0dlp4N1BQQ2RQb3BveTdnSkFl?=
 =?utf-8?B?czdaaWxhMHhjc05jZzN0Z3MybDhxUW5wQjFBNDZhSkp3K24rd0dsbFlwWERT?=
 =?utf-8?B?eE9KaVlmTXVEUnVmbjBUcVhxWFpnck9McTI1enhXdnFHc2o0TkZIKzhQSmo0?=
 =?utf-8?B?aVFQNVpuYlRneVhQaGxZWjNweFNRd2h2WEpxVjlYOEo5RmNwQjFHN0Z2eFls?=
 =?utf-8?B?aE5OUSt4RHdpM09odFVienovUCtEVE9kY1RBWFlaSFBXMy9BVDRkclZHZE1X?=
 =?utf-8?B?VC9OSTZzcnNaejR2dmpJSktZVVE3MHRnYlhoL2kxbVU0N3BRMDNJRm9Pajk3?=
 =?utf-8?B?VEhUalNLNFZsQjJNdEZmQ3h5OEwxNUdSTm8wOFFTUExrZlR6dEMzTmRvUFVz?=
 =?utf-8?B?SktXQmZvbENzUkxST1hsS3lxMmE3dlVuVHVtMGVMeHdBLzhUK1p4bHArRmtn?=
 =?utf-8?B?VGIxa21iYVU3UmR1SVNkQWc4ZDVnV0I4RXB0bXVBaVJUMVpROTFxSURDNUpn?=
 =?utf-8?B?MW1GOFQ5U1hncUtUTjVkMVBkMW9rSW15S0xZUzI3b21GTFFHby9uMlpib3N0?=
 =?utf-8?B?Q0xqUWhzaXJEcFJLODk4U1FUNm5ZRVpwQ2tVMzZNSEpWWXhGMEhVbVQ1Q1dX?=
 =?utf-8?B?TVJqTTVnNnNMb1lETG5HYmI5dGlnaGo3d1BDYXJmaWlpV1Y2R1pnVERFMitX?=
 =?utf-8?B?ekJMMVJyUEYwdkVwWElBQTVQeVVoN0xjbmNVcUJ0SW4rQytmZzhjN1BQSnIr?=
 =?utf-8?B?YXRLMy9La0xYT0hKeS9qTkVKaGZlR0VsamhkSGJJVXVsVDlubXpzQ0NsWkJN?=
 =?utf-8?B?WDZzREhpeEpNUjlBemlIQ2w2bi9PMk1nWkFLKzdOY2ZRd0QzSndSNk9sTmE2?=
 =?utf-8?B?bS95NkpmWlRIYWc5UVREOFNneHhiUUUyUlI5UVRPMHBpMmJiUVdDSW84UWJU?=
 =?utf-8?B?U2xFQ3dWbzR6d3NsVXhEdlpaajg4Wm4xVmFic05IUFI4TFNPMFFtNXdHNktN?=
 =?utf-8?B?TjZNZGU2Y3JQYXRpOE40cjFWcmxTMWJaTWNUNnBDRmU0YWlLNXorUGluMElY?=
 =?utf-8?B?UllhZTNsNXMySnR0U3g1RG9jeStZZzFxYTg4QUlJcFNiakRpMFlvV0hsbUcx?=
 =?utf-8?B?bEpnRXNzdVZVYVIzVmp4MklKbCtYQzl6eHNSZzFJR2ZiYkE0bGtQd3JkUWdC?=
 =?utf-8?B?cUFweUM4cC9IbktlNmdTdjQ5Wkd3T1JvR0RxTkNmQXZDTzRQRFhMV1JteFcr?=
 =?utf-8?B?N3R4QW5MYWVNdGd6Smp4VkgxZlkvamMwZGJJSjluVExLNXlzU0VhSGVwV1NT?=
 =?utf-8?B?Rk0yYkdNVjU5V0wvWUdwQW9RVkEzZzBvNkJUcEEva0pLRk9WdXVxZVIzc2Q1?=
 =?utf-8?B?V1hSR2JkNHhyMTk0NmxZMWkrU1NPdHp0eWRudXdOWitVbFZrSGlzVWR0Y3NL?=
 =?utf-8?B?NnJsVUJISHBYbEZZYlBScGRkbThBc3hUczRKZGlyNWx1VEM1eGh0RzhZckRj?=
 =?utf-8?B?UnJRcG43a2oveTlvK3pOMHg1ZWFtaHRxMk5HSy9BM1U0eklPbmtSSW51eXpT?=
 =?utf-8?B?MGdJMkJZV1dwcmFqMjJBSjNwdDloWkt5azdBUGl0WWNvRk1CaWs4QnFPcU1j?=
 =?utf-8?B?L1BtQml3K2tkUzBibmpKMFQ1eVJJYWpGY01lVDlrVWpOaFFEcXpzRkJWVmtB?=
 =?utf-8?B?UnVvbC9VdG5qYXFLQkk4VGtMMkFEMTBSTmI0cTBOOE93SkJpNXlnV2gxSEZu?=
 =?utf-8?B?WDl5ME00R3U1VkIwT2E0RUpjWm5FcE5vb05GQmw5WmVuUHg2ek1qVURJcU5T?=
 =?utf-8?B?NzNLLzJ5OCtad3lyWE42NlZkK0VXc3VaTnZVeDdTS3ByeDlOaWh0dWRjNyts?=
 =?utf-8?B?a2Y4UEFGL04zdU04Q3MxaEY3Ym03QW1zNTJvRjdDRlBUM3M2YXlmTU15ZEV3?=
 =?utf-8?B?V0dSaDlHMzd3KzJvZ2ErTnBhVVNtK3BYamNJbFU0cTMzOHVTNkI1VDFra1ZZ?=
 =?utf-8?B?b0p5eU1lQ1Z3SzgrRzBXTXRUMXBIOWFFMFRzKzFwOU5KUUdOQnFzdmg3SkpN?=
 =?utf-8?B?VGE1S3ZiaEorZlY0bm9SbFhTRGNkMS9PaEFKT2Y0dHJqMzNMYURUUWZjQmhJ?=
 =?utf-8?Q?aaWujmD/m2ommKlY7iqKkcs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b98b15-0795-4a98-fe5c-08dc9ad99df1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 20:57:43.1314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2+vBJnhjjf90S2nMkzCa2F5DIYbfeE7YsrDxEyT3l48FPQhtJfcdYrd0tMUKl8kOi/j8woxK4RFE1bfEI4qJgW3+DZ9+ckk0XwujRJ2COg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7138
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

On Tue, Jul 02, 2024 at 11:18:48AM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Jul 01, 2024 at 11:26:27AM -0700, Umesh Nerlige Ramappa wrote:
>>On Mon, Jul 01, 2024 at 12:35:24PM -0500, Lucas De Marchi wrote:
>>>On Sat, Jun 22, 2024 at 07:00:58AM GMT, Umesh Nerlige Ramappa wrote:
>>>>Add simple tests that submit work to one engine and measure utilization
>>>>per class.
>>>>
>>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>---
>>>>tests/intel/xe_drm_fdinfo.c | 109 ++++++++++++++++++++++++++++++++++++
>>>>1 file changed, 109 insertions(+)
>>>>
>>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>>index 27459b7f1..852931d71 100644
>>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>>@@ -25,6 +25,15 @@
>>>>* SUBTEST: basic
>>>>* Description: Check if basic fdinfo content is present
>>>>*
>>>>+ * SUBTEST: drm-idle
>>>>+ * Description: Check that engines show no load when idle
>>>>+ *
>>>>+ * SUBTEST: drm-busy-idle
>>>>+ * Description: Check that engines show load when idle after busy
>>>>+ *
>>>>+ * SUBTEST: drm-busy-idle-isolation
>>>>+ * Description: Check that engine load does not spill over to other drm clients
>>>>+ *
>>>
>>>can we split the mem-related basic check from the utilization-related
>>>basic checks?
>>
>>will add a separate basic subtest for utilization.
>>
>>>
>>>>* SUBTEST: drm-total-resident
>>>>* Description: Create and compare total and resident memory consumption by client
>>>>*
>>>>@@ -39,11 +48,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>>>
>>>>#define BO_SIZE (65536)
>>>>
>>>>+/* flag masks */
>>>>+#define TEST_BUSY		(1 << 0)
>>>>+#define TEST_TRAILING_IDLE	(1 << 1)
>>>>+#define TEST_ISOLATION		(1 << 2)
>>>
>>>shoud we document the mapping to the subtests?
>>
>>If you mean something like what the xe_exec_basic (below) is doing, 
>>then I can try that.
>>
>>{ "basic", 0 },
>>{ "basic-defer-mmap", DEFER_ALLOC },
>>{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },
>>
>>>
>>>>+
>>>>struct pceu_cycles {
>>>>	uint64_t cycles;
>>>>	uint64_t total_cycles;
>>>>};
>>>>
>>>>+const unsigned long batch_duration_ns = 500e6;
>>>
>>>please use * NSEC_PER_SEC
>>>
>>>>+
>>>>static const char *engine_map[] = {
>>>>	"rcs",
>>>>	"bcs",
>>>>@@ -76,6 +92,27 @@ static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>>>		pceu[class].total_cycles = info.total_cycles[class];
>>>>	}
>>>>}
>>>>+
>>>>+/*
>>>>+ * Helper for cases where we assert on time spent sleeping (directly or
>>>>+ * indirectly), so make it more robust by ensuring the system sleep time
>>>>+ * is within test tolerance to start with.
>>>>+ */
>>>>+static unsigned int measured_usleep(unsigned int usec)
>>>>+{
>>>>+	struct timespec ts = { };
>>>>+	unsigned int slept;
>>>>+
>>>>+	slept = igt_nsec_elapsed(&ts);
>>>>+	igt_assert(slept == 0);
>>>>+	do {
>>>>+		usleep(usec - slept);
>>>
>>>mismatch between usec and nsec here in the first sleep. I guess it's
>>>easier to convert the arg to nsec and then always have the same unit
>>>
>>>>+		slept = igt_nsec_elapsed(&ts) / 1000;
>>>
>>>NSEC_PER_USEC
>>>
>>>>+	} while (slept < usec);
>>>>+
>>>>+	return igt_nsec_elapsed(&ts);
>>>
>>>wrong unit? you receive usec as arg and are supposed to return usec, but
>>>rather return nsec.
>>
>>Hmm, there is a lot of unit mismatch in this helper. I think I will 
>>just convert everything here to nsec.
>>
>>>
>>>Also, I'm not sure why exactly this is needed. usleep() from the C
>>>library already guarantees it's going to sleep for *at least* the
>>>specified amount.
>>>
>>>usleep(3):
>>>...
>>>DESCRIPTION
>>>     The usleep() function suspends execution of the calling thread
>>>     for (at least) usec microseconds.  The sleep may be lengthened
>>>     slightly by any system activity or by the time spent processing
>>>     the call or by the granularity of system timers.
>>>
>>>RETURN VALUE
>>>     The usleep() function returns 0 on success.  On error, -1 is
>>>     returned, with errno set to indicate the error.
>>>
>>
>>I think the requirement is to know how long the delay actually was  
>>because the "sleep may be lengthened". All utilization/counter 
>>comparisons will be against the actual delay.
>
>Looks like I am not using the returned value from measured_usleep 
>anyways, so will drop this helper.
>
>Umesh
>
>>
>>>
>>>>+}
>>>>+
>>>>/* Subtests */
>>>>static void test_active(int fd, struct drm_xe_engine *engine)
>>>>{
>>>>@@ -451,6 +488,66 @@ xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
>>>>	free(ctx);
>>>>}
>>>>
>>>>+static void
>>>>+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>>>+	      int class, int width, unsigned int flags)
>>>>+{
>>>>+	double percent;
>>>>+
>>>>+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>>>>+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>>>>+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>>>>+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>>>>+
>>>>+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
>>>>+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
>>>>+
>>>>+	/* for parallel engines scale the busyness with width */
>>>
>>>s/parallel engines/parallel submission/ ?
>>
>>will change
>>>
>>>>+	percent = percent / width;
>>>>+
>>>>+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>>>>+
>>>>+	if (flags & TEST_BUSY)
>>>>+		igt_assert(percent >= 95 && percent <= 105);
>>>
>>>percent should never be > 100.
>>
>>Yikes... that's a miss. I did see a couple >=100 though!! and 
>>modified this to check how far it goes above 100, but completely 
>>forgot to debug the issue itself. Will debug.

Update: > 100% looks like a possibility because KMD is doing this:

Sample 1:
Read RING_TIMESTAMP
Read CTX_TIMESTAMP

Sample 2:
Read RING_TIMESTAMP
Read CTX_TIMESTAMP

The delta of CTX_TIMESTAMPS can be larger than the RING_TIMESTAMPS. If 
we take a Sample 3 immediately after sample 2, just to get an updated 
RING_TIMESTAMP, then we can ensure < 100%. Is that acceptable to let 
user handle this or should we ensure this is guaranteed in the KMD?

Thanks,
Umesh

>>
>>>Also, for >= 95 to be true this needs to
>>>be the only client.  Should we check for number of clients and skip if
>>>we find others?
>>
>>Didn't think of that. Wondering if there is a way to enforce a 
>>single client somehow in the test. If not, then I agree to skip if 
>>more clients are present. Any idea how to check if there are other 
>>clients?
>>
>>>
>>>>+	else
>>>>+		igt_assert(!percent);
>>>>+}
>>>>+
>>>>+static void
>>>>+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
>>>>+       unsigned int flags)
>>>>+{
>>>>+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>>>+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>>>+	struct xe_spin_ctx *ctx = NULL;
>>>>+	int local_fd = fd;
>>>>+	uint32_t vm;
>>>>+
>>>>+	if (flags & TEST_ISOLATION)
>>>>+		local_fd = drm_reopen_driver(fd);
>>>
>>>so you have 2 clients in the same process... Maybe add this info to the
>>>subtest description above.
>>
>>sure
>>
>>>
>>>>+
>>>>+	vm = xe_vm_create(local_fd, 0, 0);
>>>>+	if (flags & TEST_BUSY) {
>>>>+		ctx = xe_spin_ctx_init(local_fd, hwe, vm, width, count);
>>>>+		xe_spin_sync_start(local_fd, ctx);
>>>>+	}
>>>>+
>>>>+	read_engine_cycles(local_fd, pceu1);
>>>>+	measured_usleep(batch_duration_ns / 1000);
>>>>+	if (flags & TEST_TRAILING_IDLE)
>>>>+		xe_spin_sync_end(local_fd, ctx);
>>>>+	read_engine_cycles(local_fd, pceu2);
>>>>+
>>>>+	check_results(pceu1, pceu2, hwe->engine_class, width, flags);
>>>>+
>>>>+	xe_spin_sync_end(local_fd, ctx);
>>>>+	xe_spin_ctx_destroy(local_fd, ctx);
>>>>+	xe_vm_destroy(local_fd, vm);
>>>>+
>>>>+	if (flags & TEST_ISOLATION)
>>>>+		close(local_fd);
>>>
>>>humn... it doesn't seem this is actually testing any isolation? It's
>>>just reopening the fd and testing the same thing on the duplicated fd.
>>>
>>>what I'd expect of an isolation test is, e.g.:
>>>
>>>/proc/X/fdinfo/Y
>>>	drm-client: A
>>>	drm-rcs-cycles: 0
>>>
>>>when executing on another fd:
>>>
>>>/proc/X/fdinfo/Z
>>>	drm-client: B
>>>	drm-rcs-cyles: 10
>>>
>>>
>>>so, check that read_engine_cycles() returns !0 for fd where you
>>>submitted the spin and 0 for where you didn't.
>>
>>will do
>>
>>Thanks,
>>Umesh
>>>
>>>Lucas De Marchi
>>>
>>>>+}
>>>>+
>>>>igt_main
>>>>{
>>>>	struct drm_xe_engine_class_instance *hwe;
>>>>@@ -485,6 +582,18 @@ igt_main
>>>>	igt_subtest("basic")
>>>>		basic(xe, num_classes);
>>>>
>>>>+	igt_subtest("drm-idle")
>>>>+		xe_for_each_engine(xe, hwe)
>>>>+			single(xe, hwe, 1, 1, 0);
>>>>+
>>>>+	igt_subtest("drm-busy-idle")
>>>>+		xe_for_each_engine(xe, hwe)
>>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
>>>>+
>>>>+	igt_subtest("drm-busy-idle-isolation")
>>>>+		xe_for_each_engine(xe, hwe)
>>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>>>>+
>>>>	igt_describe("Create and compare total and resident memory consumption by client");
>>>>	igt_subtest("drm-total-resident")
>>>>		test_total_resident(xe);
>>>>-- 
>>>>2.34.1
>>>>

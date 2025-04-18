Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4C7C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 20:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9276B10E2BC;
	Fri, 18 Apr 2025 20:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5TgmFhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8868310E2CF
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 20:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745009880; x=1776545880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lEZy7TDkzMyhRov6qTDXucGjCbwTE3OXLjE1cU6fE68=;
 b=f5TgmFhQA/agZVjw/aYJRmFxg9nfiH9ppMeofpGkLi2xmowYGrMmjbKr
 9VMS+TWfPHlTBD7qH0cfuziHOwrFcGGaZe6/jUOpKdymqGKyi37e5ZTOJ
 BfZ4o1sJPO2EI5UEHBwN9Y+ctEi7gN4DIEwlLwy5fXZGvgItRjB1/Ehn1
 flaiD27HSzv+2pbI6fGMGjEQRL9VssEyHRoLUtjsXk/bJCXVpU9sobj3u
 QPQ+F8T4XJ+nviaUR4SbVDdbC8SEwfH8ym6qaLg43ML7Ifazozh/rHcCg
 gsAczghaRQN9L13ux6ycVIwtq+Yj4UaJsrS8Czrp0NblIJTfnnuP9up+y Q==;
X-CSE-ConnectionGUID: DRWIPSRTQKCkF7v5KFeRMg==
X-CSE-MsgGUID: D47XjYrsQ/SLqljz9is8KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46532845"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="46532845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:57:56 -0700
X-CSE-ConnectionGUID: u/+idzjGRxeNLeIcjGProA==
X-CSE-MsgGUID: NHhDXUKCR4aTWrIi78/7Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="131215861"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:57:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 18 Apr 2025 13:57:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 18 Apr 2025 13:57:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 18 Apr 2025 13:57:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dql0GnFqvoZuyJIh6CGqpHNkeIQ/nBva2gjwAim78rDiJmj4mzX7kG+GGXr9eZ/qV5LDML40yRW+NRAlzN2IAKpV757uttFX+uS/LyaQ/7nnvTylqvc41jwNpazsTGyxJs5SFN0jdTQQYPwMbA2Q91qkUS8ITJgOTmqtAuhSSdNPXCSvIIPNScqWze3KGZj8FWWlQeMKyvhCNE1be9eCQc3oaiJ6z5kc61iRLEaaYIxzLXqxdFR7Hn7Ndke7+FKuNxFsz7E46zIGQW1ZWx9jUHZo9kBEUtvOMKbsLIk3taUg7htlLTzZpoozCi7SRpa2SeAMLGgMHeYvZwrKl2yx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgbQGEUxzXX3MOg5vKa5caTnaAsZnN+juPG8nl4RoP0=;
 b=g9YvjarezPkjLX/xGy8wdllnxmRFrL7eV1W8S99yQIvoscWHabg22ETYB/F3eBQ5SG8cRT5QFoopoNhP7lYvztm3wVRIA9N90ABVDKC2r67/GI4gciK1X+SKrSz7XcdbNpd5yxJfa1OPu1wWTtp0Z62H2bCnvd2gawtxkqE9xyHlU3a0o91aL+hx2GwzXYL2omMfitYvHYlKuAUuZ7Ucq1Ja+fad+BHiv5alk3ebQZdUZ36lhsGE2whJc3QAkv2AKPcCBEJiY6a8IxdhdGOJWLPJEOfgzsaBeA/sUAi6ytVMGo8t4ByEbSsr1b6+Dj/NrQehciGzPuipdidHPO2x7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Fri, 18 Apr
 2025 20:57:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.040; Fri, 18 Apr 2025
 20:57:51 +0000
Date: Fri, 18 Apr 2025 13:57:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2] tests/intel/xe_oa: Remove buffer overflow guard from
 buffer-size tests
Message-ID: <aAK8zu_lCo3zH-G3@unerlige-desk.amr.corp.intel.com>
References: <20250418205211.346135-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250418205211.346135-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 86471a6b-e156-49c2-63ee-08dd7ebbaf09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjVnNjE4UHFBWHBzbWI3d3UzUmNiQkVSNnJKRS9qdFcyMnkvWndVREZ0OW44?=
 =?utf-8?B?RjVTZ0pJRHJadFpZdVh2VzdkMVR2V1hFenh3ZklDOXdCazl0K0ZMWGY1cWEr?=
 =?utf-8?B?NUVTeHdhS2dvY25wS0VLVGJjdWFRbzhhajFXTDRGRGFxaXFQQWJndE9RSlM4?=
 =?utf-8?B?K2svQ3BQV0NEMlVkZ2dUMFZlUm5EcHZITVoxSTIxNVZ3N1VWVmRFU21DRlhz?=
 =?utf-8?B?WXgwaGFPRHJpMFNnZDFZK083U1lBYjJ5U09Penkwbmo0Nk5qc2FaMEpGeWRw?=
 =?utf-8?B?TlJhUXhCMlNHU3U2ZFpwbFBZOEhPZnJBajdaRnQ5aDAwbkhOWFNVeFl0ZWIr?=
 =?utf-8?B?K045Rng1ZFJOTVN1eFoxM043MjZMb1VReFl3T1VXRHZsVW5PR2hvdWMwMDhS?=
 =?utf-8?B?UE0yKzlHREMxR1BPS2NTdVFWOVplS3pibjRPemNKdFJHbDdRNVJzeVdmR090?=
 =?utf-8?B?S2ZPMFltSjI5T1ZFUXgxWTB6QmpiS1RLemxTUmFDR2oyTXNYMVZTdU9IZlFm?=
 =?utf-8?B?cXVxRnRpSU9LYXN0S3JSK3Y3OGNOaHdESThOWStVSUZubnNXcEhtTVBJbWZz?=
 =?utf-8?B?TUtrWFhCOGc2QTRiSXUrSDZYcThMUXVkNXJQOUJhajMyUXhRTzRsYjMxY201?=
 =?utf-8?B?Wm5nRmtLd0w3VmNmSStDUXFTeEZpSjNwZVlWOUZjYWZZbUE0WEZpRUluY0FS?=
 =?utf-8?B?eC9zazlwZlVUeGczbUE3Y1oyL3ZyRXVNcFlnUWRkMmRybktpekhnSmNHVFhM?=
 =?utf-8?B?MVdXWWkrbFhkWGhVSDhIOHFkNEFaazQyN0thc3diUGNWM3g2dm1WOHI4cDJ4?=
 =?utf-8?B?MGhwd0phSHZ1TER6VlREem1MT2NuZE96bFd6d0lNRzYxZXhDTjh4WENFZzQ3?=
 =?utf-8?B?bTFYTnpoZW54OWtmQ3F6UFRKYzM3Mllyem5SK2xGaUNpUy9WWkRWNFYydzVT?=
 =?utf-8?B?OHY4MXRBSEVIcDM1blpKeUZPU3dCQ3ZTSTNPSTQ3cFNPZmhCRkZZM1FCZUlz?=
 =?utf-8?B?L1RKL3NsdkVMd2Z2M2QrRjI2T01Uczl4SXdsY3l4cUwzUGJSQzhFalNkbGRo?=
 =?utf-8?B?UHJqZXp4dHo4VUNSczc0WjFBTmlpTVMxL0I1UXVhZFBCS1hXQW1zQzBaQVE5?=
 =?utf-8?B?UWE5Q3I2aFNFeXRDTEFDcU9oSDhJaWV0dUVXVzYzYi92Z1JJS0o4S1JoSVFV?=
 =?utf-8?B?S2J6SW94eGtjVVl2ajFOdithbm9vWnYwanpkK0ZhcGpuOHFYZ1MybWxGcS9M?=
 =?utf-8?B?M1NzcGlWMExkeVg5QkxBQnkrUWUwZXphYzgyNTRlVnFXaWNuNGJnUXh2OTE5?=
 =?utf-8?B?L293MysybStIa0hUZzhCQXo2TkRYaEpMN0FsWUJVelgzcitJa3pPRlUzOGQy?=
 =?utf-8?B?MVpuZEVUanQ5MW9QdGExMWNYcWJFZXhSb3hqZFRHYXM1UmM1NmhGcy83Si85?=
 =?utf-8?B?LzJwWi9yS3VHMERoaEQzOWJsZDFGazJaNmNYMS91YVBYUlQrRGU0MGVITk1D?=
 =?utf-8?B?STl1YnNBQ1U2dFBidkdEWEZFQWJkWFE2Rlo2OUgydWpnZ3VxclcvbXpteDJw?=
 =?utf-8?B?T2lJNUFuc2pmQzZEQzNkemtkeXM1ZENMbUc5ck9GWFd0bVl1NkpOcjBxaWdO?=
 =?utf-8?B?Nld1VnAzMXVXOEZMNVdUTzRidEtRV2FRMEg5TTNRRTAzYmVyQXF0Zm85Y3l6?=
 =?utf-8?B?cnNwSi9xWmFrTExtVm9sMGJuYzdhTUlLT2JnNU1HcWxJOTREVjB0WW5ScEN6?=
 =?utf-8?B?ZmFIOVhtR3FEelk2QTNMU0ZGSFRnODEveUZmYkJpMHYwV3g4WFlZaHZWOWVh?=
 =?utf-8?Q?HYD8+Fq+J8Ego3G5mKRXX+Lng1r+xy1swpBsg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWt4dFhiREdDVVMxcjZaOHgzSHIvOXUvaEFnUjkvVlNDdGc1Q2J3ZVkxL3Nu?=
 =?utf-8?B?dExma1F5MkRFbnB5TmNmU1EvSzRsbFNiUCtDbFQ4QTF6UnYrbjNaODJjSnJ5?=
 =?utf-8?B?dU15SjVFSTVQaFpVSWtIcDkvMnhCVFNUcXc4YVorTW9vWldHUEJnc0xtQ0Y4?=
 =?utf-8?B?aEZLVHJ6aTFFWExvMkx3Zk8wT2U0WENqYkQzWlZWdmpKMktsZERnSjdMUEsy?=
 =?utf-8?B?RkZlRyszdDVSTUdWblJ2TjN1MDBKdFN0a3BZQjBVeHM2MGNrTit5WUdJNlpM?=
 =?utf-8?B?eFJnODFHME9FMjBQUjE0QkJzbUQvVUZKclFQdDZwODAyc2lpMUVqanJzcXFo?=
 =?utf-8?B?VzlVemovV3I3NjZRMzZBQ2N4TEVrcUpMMTNuc1QzdUVtaHh0STZvb1YrZEY4?=
 =?utf-8?B?UHFyZVhSZklNZmM0VmJKZ0hXb3RqckVpenFSYys1cDZ0WlgyNUdqQUVYeElH?=
 =?utf-8?B?NjVZRnVyT3NIa0lIODI3QWRLQktaQkdVTU9zVmtNR2pWREkySnE1VUVsbWxa?=
 =?utf-8?B?LzE4UUQxbFc4Q25mZTdLOWRFMjhmU0hoM0RBbXZzSUpQdThlK1FiQU1qS0xp?=
 =?utf-8?B?dFRLVFZEMmRTQVZzaFA0VVdIM0RaeFFmRk5FRTBzZ2UrcVpvenF0Nk1YQkl5?=
 =?utf-8?B?Wk9oaWtRYzd1WVlmNDNtSlZtNVJKOXQxcnN2d28xRkFNWTQrOVkvNWpwV3M2?=
 =?utf-8?B?TW03a1hFdFczS29Bb0FjSy8zSGNlMnVEUFdPQzMrc2JYamNZMUVpVUFTMDd2?=
 =?utf-8?B?dWVDMHV0VFJpMk1PR0FGRjMydDhsc3lBaTNKR0dWTlQwcW4vUTZjUlEzZzZV?=
 =?utf-8?B?VkZkcytXUEJpbzE0bmRJT0dCT1Mzbnh0OEEybUo5YjNzdzhzZStkTC8wRjhP?=
 =?utf-8?B?ZWpZQ2hGbC8vbDJvM3lwNmNJbm02c05EclpNQkZ2cnBKT00zSFFCSXBWL1FR?=
 =?utf-8?B?alVldXpCcmJ6Q3oxZnlQcUxhYWtGd3prN0RWN2NmaW0vVlgrU1ZRa3BPY2RM?=
 =?utf-8?B?b1RUVjZtazF1Uy9kelB6cU5ZZW1IbEV1aHJOUFN4WmNrQi8xS2xaVzZUTGp6?=
 =?utf-8?B?RU9YM3JKazdCM3BaM1RmZWFLZGl6V1gvTnRVUFZhQ1dVVC8rMDVybTJyT0ZG?=
 =?utf-8?B?QnZMVElvamx1WkRJaGkzQkRjWW9hSzI5RVdTOW1qYzZxeTh0QmovcDFYY2Vp?=
 =?utf-8?B?amtaeHg0VGY3cW1hMS9taXhSNnNHeUJFMld6bDdxRlYvNWdMRmNyZ3NsU0VM?=
 =?utf-8?B?QmliWFJYemR1WFhEb1k2cEVlb1FDb25rckFlb3lvNWRsYUNyYllMVUxjZDZV?=
 =?utf-8?B?eXNWVU5uOGREakFwNjRnQzRrU0lIcDV6cThKNVh0K2ZxeDhDRXAyTE9uM05s?=
 =?utf-8?B?NDRCNXMvbVI0NDVDUzFDeHY3cXExZnFkWmVPbEFVNHkweWlUeFg5bi92ZzZi?=
 =?utf-8?B?bkVFYkZUVU5hK1NNTDBPWjBMeXBsaWVtUklhNjZVV2VmR0VHZDhSaWc2UUxE?=
 =?utf-8?B?S0dZUXo1d3JHbWs2VysxbEZXT2JxcDdCdnFtc2R6TkwweVhHaEVqcTErRGhQ?=
 =?utf-8?B?WDVEMzl6MXU5bERHOHM0K1I5TkE5aDd5SUZzVXlJemg2V0kwWnpIUWpZTHR2?=
 =?utf-8?B?N0xLeGZIeXMzaitKRDJKTTlJclJvbG51RjRVNW9FdUovNGhYWTV4SG1lbkdI?=
 =?utf-8?B?Z3ord3RobWI0MXp4U1ZlRWl5bUhOeXQ3L0U1cjk2ZnJ0THpKdytDcCthR2tz?=
 =?utf-8?B?TnhDdHE1RkFVWFpGM3FGTzVuRlJyM094TFZEcmY2Zzl2Q3FrZFNaYkQxOFZW?=
 =?utf-8?B?WGJ6K1RReU9MZFVRU0w3eEhuUDBFWkFoOXNuUjN4cFk0NW9HRG1WQ2w3Wmc4?=
 =?utf-8?B?d0hsSlJLUkNHK0hUbi80dVJPSUptNW9zbGQ2YW4rRUtoN1RCak42aGM2UklL?=
 =?utf-8?B?ak42VmdBSEtmUHZuUGtCUytvd2tzTG9xLzBqMHRFR1JxdWMrN0pQQ3gxT2Rz?=
 =?utf-8?B?aEpiT1dtTXhENjR5VU1wNndjczk2NXJMK1hVMk1GYTUzTjdrL0Fydy8vU3lS?=
 =?utf-8?B?OWl5ZFZNbkhpVWxWQnM0alVsc0dNM2pNMnJmU1JUU1V0S2dFV3orSFE2MnVt?=
 =?utf-8?B?ZEk0OC9EcXloMTRWV1BGTDUrdm5ub2dpTTQvaElURmlERUprT3FyWU10eERD?=
 =?utf-8?Q?ZqjttwK+NcG6JoV5blhU1f8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86471a6b-e156-49c2-63ee-08dd7ebbaf09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 20:57:51.8592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghjINk50i8H9IY+ck1HprkFnasUIzQntfVe+x1j1P0QAltFSYqhCmrzYptHeadzcpScs/Nvo11LiC3tjmhroBdw0sWAuqTE2/RgRQzfzpBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
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

On Fri, Apr 18, 2025 at 08:52:11PM +0000, Jonathan Cavitt wrote:
>The guard was a holdover from i915 that is not relevant to Xe because
>the buffer contents are preserved during an overflow.  Remove the check.
>
>v2: Keep check for non-zero-reason test (Ashutosh)
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4541
>Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Suggested-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>---
> tests/intel/xe_oa.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 1fc8bfaafe..9db3d850c4 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -2503,7 +2503,8 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
> 	while (total_len < buf_size &&
> 	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
> 		(len == -1 && (errno == EINTR || errno == EIO)))) {
>-		if (errno == EIO) {
>+		/* Assert only for default OA buffer size */
>+		if (errno == EIO && !oa_buffer_size) {

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
> 			oa_status = get_stream_status(stream_fd);
> 			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
> 		}
>-- 
>2.43.0
>

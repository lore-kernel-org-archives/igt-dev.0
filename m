Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF9BC0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 06:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEF110E013;
	Thu, 30 Jan 2025 06:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8uQhODT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED00F10E013;
 Thu, 30 Jan 2025 06:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738217919; x=1769753919;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vohiia8IAq6C07NOlfJYZLwlOlp/FGnZR3YuvvdwPRc=;
 b=m8uQhODTPTq6M5kKD5nUCaoRPWZLC273F8tTsJlg+1ALOlJ8kkxKTUm4
 yaUSiIR+G19bKx7Qq46olsOHoWjM5iqJ0PxgOSJ3MYUZYP7OWt6WVw9Wq
 EQ+vQM206ku6fWc2Z/xfRVBE5g3dPLF0LZVwLT+D0vsHY4Pa0NXPa3u+J
 VmEqCC6+tr1M3DW6dEW27KQXeDVELT3go55Ngr1qReLNoDC1MM736gx02
 li4tKV1VlpqnaDvDVpGHikfdw1VPWgAjXw7g1J9HphUP8x2xGWbsSDwsO
 MoXphzE34M2tfVqjJ1gci1QSmNJ6xc15aZYr0KEWzHGsCL4Gvs6HeW9oj A==;
X-CSE-ConnectionGUID: UhbInzm7QyGrNxdjHcDPKQ==
X-CSE-MsgGUID: o8vCcYJwRWGiL/QQR0FC4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38918333"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38918333"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 22:18:39 -0800
X-CSE-ConnectionGUID: Wr7J7zYdQ8m9weQXZuRHRw==
X-CSE-MsgGUID: PsOtT1HpRfKl4BsqMUdQ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109679107"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 22:18:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 22:18:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 22:18:37 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 22:18:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMf9qOoTxK4Kvi/+97fnT/5SYVqYWZYfFeSeRmG5DWZwJ8CnnUU8IHARY5idZ+Tz9M/Ns1brdTdJDBpdrwbxepwVgHpCiVqO/FNaYm6UqvecNcwBcIwpv18f4qpVLnsKBR5CSKH6uRK7oDVSl0Iur4YNzNvWYz95Fw64KqxdI7jylfTPxJdZNnyjuOUyZKf6300XAxq810RXJWIYUY2wgEPTNL2XIdd3XB4DCSGetXHmLun60OXR07oPoWwwKsanFO6ZoOrRjlvEj+znuod5Z3h5o16+i7xHckDIjQXt/EPr/P1jVFcqnPFqcYuvGfRutGh/r3uGhu8vMpdL+AZrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vohiia8IAq6C07NOlfJYZLwlOlp/FGnZR3YuvvdwPRc=;
 b=lJHTmnzwCATjkDIBNIJrIcorT0jFtuO3Qe8/zKuvTYwvOq0rZvUnHCmVffSFPQiOv8kT33fw//DPk8oYVic4D4hIEcdwWHy9J+cA/x71PdC/GmjPTFwG1kMd8ZD8CiV2fkD+EV+elYipB8jvuLvzf5eMmi/f3sd42awiqu6J9A1ML4fartK6Xqu4PSiwGnerl1E2Mi3DLg63vvP0pF2HCR6yeLBv61FbehYidGMlUEGDF/CE30fZQi8VSygSan5m1rDxJwS6+S8cak3MOSHrJrkr5792T0genZJW3C8FMj+9MzmvlN0R3pyU57e3vVp7ERvFaMkM+hKj3eUgRaOgVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5502.namprd11.prod.outlook.com (2603:10b6:5:39e::23)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 06:18:08 +0000
Received: from DM4PR11MB5502.namprd11.prod.outlook.com
 ([fe80::9292:61e:1a29:3447]) by DM4PR11MB5502.namprd11.prod.outlook.com
 ([fe80::9292:61e:1a29:3447%6]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 06:18:08 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIEludGVncmF0ZSBr?=
 =?utf-8?Q?memleak_scans_in_igt=5Frunner_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgSW50ZWdyYXRlIGttZW1s?=
 =?utf-8?Q?eak_scans_in_igt=5Frunner_(rev2)?=
Thread-Index: AQHbclB/izKhZjsEGk2+YbOu5e+NGrMu2W2A
Date: Thu, 30 Jan 2025 06:18:08 +0000
Message-ID: <DM4PR11MB55029AD56848B575CF84A393EFE92@DM4PR11MB5502.namprd11.prod.outlook.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <173814993873.2353200.11583681237015847203@b555e5b46a47>
 <437ae65f-b434-44b4-b91a-0b6c9978295f@linux.intel.com>
In-Reply-To: <437ae65f-b434-44b4-b91a-0b6c9978295f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5502:EE_|SJ0PR11MB6816:EE_
x-ms-office365-filtering-correlation-id: ef622958-24f9-4bd5-43e2-08dd40f5dd5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700018|13003099007|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?RndiUkdpaUJTcHBKaWJzVHFZM0JxWGl0c3NPOGhWQ0dodVlXVmNoWCtNWDht?=
 =?utf-8?B?OFN6Y1kwVTZJcExLbWN0UHJVRzJreERxc0kwem9KejdSRGxQeXU1Rm94M1g5?=
 =?utf-8?B?Q2RmdWtzZUJpU3JkbjY2K3hZak85bFJTU0J1bTBTQ1lLZlFKdjN4RHQybHRP?=
 =?utf-8?B?cTZHN0R0Rkt6bVpqZVRGRDZpZ0oycmwzS0VEb0dCYmVZc2Z0Q1BXNFRoN0JE?=
 =?utf-8?B?OEpMVk8waFJHNlVKUFdsRnU1bTlvNDlQRmRIZmRjTUYxaERFSWZGZ2lsOHZS?=
 =?utf-8?B?UFBvYmRjL0Q2YlR3N1VOWTV5QVQrczFWL3hLSkN5aWhLczBycVA2RzdFUkRL?=
 =?utf-8?B?ckJUR3NlYVJVWVBFSHIzdzNwYW96eXVQK3pCZkdhZVE3dWlScGFRcEd4OXVU?=
 =?utf-8?B?QUprcFVMejkzM28wbVpJSkdKMVhnSWFiOHpxSFdEUmU3NHJpaGE4N2cvaDhW?=
 =?utf-8?B?WVRiQnNJYXJ1Qk5STFFTZElsSXNONVJsaFBic3FlWGFMZUF2akxlN2l1ZE1l?=
 =?utf-8?B?UjVGQVRDMUwwSklkVStmWnZoMDdyMWJaMW8xSTE2c09LR1I5UmdWc1c4NkdD?=
 =?utf-8?B?YWt5RG5YQlMzRUJmU3VrVG12SzhnczRocEdZNkZyVTBXNXE3clRhVjFUU2ND?=
 =?utf-8?B?Q3NGcXFQVEs3N2NrM21xeWdTYWY0MWRtL2NBdVlCUnpaalpBTTlGbmVCRlFH?=
 =?utf-8?B?RUtITUd3d3U1WllkZTFrQ2dlQ1MyQ1FWZW13OFJhdFFtQ0xvZ2NWSnJYNmRa?=
 =?utf-8?B?YmNIc1puMHJQWmJBZUg2UDhFNjBvUnVoVkdROVY3VzFTUDR6SFMwWDRlWGQy?=
 =?utf-8?B?QXREemkxQWk3Q0NyUEN2eVVBbXJKL2FMRGNTVEswZDVMVWtQSFlqZzU2MzBR?=
 =?utf-8?B?eHlSeUxuaU5pL0U5VjR0NmJlb1JoS05Nc1Y2NlM2TlpTdk84MWNhZVVBUkFs?=
 =?utf-8?B?NlNBSkxIVVVnbGhlVlRFWDRBdXpKbitqQkE3SE5BdFM3YVFmRDkyQWZpSjVa?=
 =?utf-8?B?UXVPRFlPRC9uMm1nT0FsVkRKUW5NbC82SWt3TnRWamVpSW9MNGJzZFBhdERp?=
 =?utf-8?B?MkttRFdiRkVUU0VKQlpYYm9hWGsrdGNqZCtJTUtnTU8yaysrQ0QrNG5OaGRF?=
 =?utf-8?B?aWtRV1dYWHc2OHhjQjhqT1FCNEJnQ2dDQm85MjVkSlRKdGtYK3NWWjJDMzdi?=
 =?utf-8?B?cHd1c0hpM3NTVnJ3R1hQQktnR3RlOGdTenN2STh0eFVsWndqaG5qOE1peUFm?=
 =?utf-8?B?SzJuTUF1alFidDF6SngyRWFWWkRSNUNGWkk2eE5ZQ3E4R3UzOEluOTJ0REl4?=
 =?utf-8?B?QzNodjNuMTltMHJaK1hYL3dIaUNKNEsyM2xDQWExS3JMMGZiUVJQRVI5bWli?=
 =?utf-8?B?dlpHTmgyVi9ONmc2dGVxT3Raa0JXV0ZpRTNIMHJJazZUWUtnMnZxZWJQazU3?=
 =?utf-8?B?UG1WV1ZyclpjRDYvMUxNRUJjV0FHMkZTa25obVlCVVZ5VUUzYnhyOFZSMm9C?=
 =?utf-8?B?My93L1poS2ltQS9xdDdWMDZkYkdCOWNmWkljVDA1Q1d2d1ZPWmJjQ1BvV2xa?=
 =?utf-8?B?elh1dFZhaXdWVVBOT3RUa3EzbFB4MnRXRHVhOG5RckE1YU1ZNXZRamZHM09x?=
 =?utf-8?B?Y1BsVjd4dXhvRW1RWEw1Q2UvbU5SdXBsQUJFK3RtYWJtWkpBeFE5aXNyZWlM?=
 =?utf-8?B?aHQrd1BhWXFyeGlhWEZ4ZHRCd1h5dDNmSzNPUkNXUzRDVmpGc1dUakhIeHBy?=
 =?utf-8?B?M0NLQm5keS9WU2F4dERaaHBFdk1PZnd4aERsZmVEVmpOcDliT3FlSUhRSkVz?=
 =?utf-8?B?emxOOGhtbi9WMjZBb1drVzMyUFo3elFBbjRxWnpRaEMxNWNTQ29rK3pRNEwz?=
 =?utf-8?B?bnNrS01yNC9OOURvdWhLWis4V3Y5RUZjeVVzUEVIWUlCRXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5502.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Um5ZbzRPV25WWHlFMEc2NEZBWVBmVGNWUHVPZlBiUDRTVmFwc25RKzBVSEdz?=
 =?utf-8?B?SCsxTWY0V0lsclNKT1VqYWQrNzlSQzlBcExHRW52M0FpOUZ6cTBWY3Y3NUMr?=
 =?utf-8?B?VTFPdUZmZ0hKZXpOOTdRWm5LbTEwUWNPdzdTaFhFYzVISlM5VjRnTTZHdS96?=
 =?utf-8?B?L0xqWEtJeVhENWppdnVkZEN4S25GQURLaGJ5VUoreUxIMFZqd0lsT3pqeTZF?=
 =?utf-8?B?SzNHNmhCcnFzVUwreGp0aU5hMk9mMTZtT0s2d3R0VE5sSW5vUGs1c0p5RlRL?=
 =?utf-8?B?WWFZdUNhcDJwTzFVd3dZTmZUYUh0OEF5cmNwdVBDY3pMdTZ3S1dtMU9jYUl4?=
 =?utf-8?B?bU9oRG1ocm5GOUF6dE8rT3QzUHhTYmtheW8zbUFOaUZZZytINkwzcy9xenBs?=
 =?utf-8?B?SkhkWHUvdFYxbDlWMERkbjFNL2EvNm1hTTlGU1FURXF3SDlqWE5JOXFrbnZo?=
 =?utf-8?B?VStnTUd6UDBvMUI0TW9weXNURThTVXlBSVlVYzNDWnU2eTdDMG1YK29KY2Iw?=
 =?utf-8?B?Tnd2WXVDN2JxY2FwdVU0eHUxODZkOGVEYWJTUElEd29nb3NzQ29oUjNwYmsz?=
 =?utf-8?B?dlRuWFJlV0lhUCtLak5oSEZtekNhVWhlSzJNa1JBYjhrbU9aa3ZQaG1RVWlo?=
 =?utf-8?B?Mnp4TDYwcGgrblM5ellxSDdGR0tDeXc4T3liRmJ5eFFwWkhUWVF3L0hhekZR?=
 =?utf-8?B?R1M3cCs5Q0M5YklzekorNzhRR3JDUSsvNVB3SmxLeWZ0WmcrUEtkOTJibGx3?=
 =?utf-8?B?dUpDV25MVnhRdFE2YkNVMTh4NHJXWFFrbUdzWC9iQllia2tKRzJVQUcxOVpk?=
 =?utf-8?B?c215d212ZVROd0liQ09HeUdRV0tvM3VreWxpdWVUK2w0akRsQXF0RllHdnpG?=
 =?utf-8?B?NGhLTFFkVFhnNENQeXdBY0ZCOXhhNkFrdEduQSs2RmgvK29GekJYeUE5eFZ2?=
 =?utf-8?B?eVNTdDhXaG05enpuaUZEWHY1b2ZpOEJqbFNNUEFtVmhJemxKUng4TnFjRlph?=
 =?utf-8?B?NmpDVGxZM0RCeHRaUFBhTzZTQVAydjRsdXY4OG94bGcrUlliNERWMW40dE5K?=
 =?utf-8?B?UzlVRHRPdjY4SXU5WlJlalNxbjYyRjJ4dmdxY1RnVzFjQkFRSllHS1dvN3ZM?=
 =?utf-8?B?QU5GVWh1Vm85ckxydlJqWWJ4NjRHZFZSdjB4a2tNbHNGVi93aWdtN0l6VmxJ?=
 =?utf-8?B?WGJVU25LS0NiMk1XNWZNRXpkU2VnblRuU3JwZCtOOGJqNzVOUVhlZk5DTjlU?=
 =?utf-8?B?WGVkam0zTGhxNUJJdDJTRWpJYWdxazJ6WkQ3anREWmpoQUpTdHZ2RWNYVzVj?=
 =?utf-8?B?MWd4OU9WQ1ZlYVdlQkRoVTMzWjd1THdad250Z0ZrQm9jdkd4eHNnOVpqZEc4?=
 =?utf-8?B?Z01Wcmw0eUNHODlJcVk4SXFhMjlnYUZDQk1ZNXltMElYVFZSOU9HbDAxYzgr?=
 =?utf-8?B?U3RHWXFBOVlMSzEwSTBBcFdDUUxmMktvWWhVa1dYbEhsa3R3M1dwVkwwMmY0?=
 =?utf-8?B?NFg4QjBxUVhWeHlrVUlaaTdxWnY2L2laWENkM0FqSDVsaXpyb0VwQmx4UkdN?=
 =?utf-8?B?RUhhOTVxTllFQTJRYVN2TEpBYTZUZWNTQmN0VEgvd3ZFK3AxVlYrQ3prc3c2?=
 =?utf-8?B?THVvWHJvY0xCLy9ORzJVdWpIWGlJdWczSlJxWGh5R1gydy9YRzd1RndRd3Mx?=
 =?utf-8?B?cklzMU83K1l1dHNtMUd0UmtJVDVOdFk3U3A3ak9NZEMwUDJnS0cySjBVMUxE?=
 =?utf-8?B?NnRoZkoyVUxnQUxORTFJbDVLM1krcW9pVWtLU2VtWC82ak1jT0dwcWdjUmxB?=
 =?utf-8?B?ekdONUR0TEhaeWFadGU4T2h1bUYxS0Myb2s0STBPcjBqT09KaVhWOE0wM0hE?=
 =?utf-8?B?T2JtdzRURDNXRGVXVnl1endMMk52d2w1TGlhZmhUc1JLdjlCQncrSDhvOEtS?=
 =?utf-8?B?WFR4UHNTbUZjZlorVExPTWtYREhxS1c4V1dGNVBNRGxVWVBTcDFOWStVck93?=
 =?utf-8?B?dVJLWm1yYzgveUtwMmFGaWVwbjZ4ZTVGdloyOGtSQlFNanZmUWd4Qko2NHFz?=
 =?utf-8?B?dWJRNTZnRFhpb1QyTHRncGhyZ0cwWG5HODBQVWVnejdseEluRUZhb0ltS2ND?=
 =?utf-8?B?NkpFbjQ5bkIvWWo5bFhubnRBWW1aM3pIUWpDRmRIUnc5TWFRT1FxYXVUTTF0?=
 =?utf-8?B?UGpJa1V4N0kzc0srcGJqNlVvdWR4ZExFNUI0MDRjaE1BZHA4RldZN2loVDNR?=
 =?utf-8?B?cUNIcDBLMU80T0kvaXVtOFdHNDVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5502.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef622958-24f9-4bd5-43e2-08dd40f5dd5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 06:18:08.0984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Swl9uT7d5YzxWhzJMIQJgWnZV+jEQqqF1SW19/ANl9SqBTh3fypnLChA9+Je+nFu5dLIBheyIi00SgQVrf0kvVyINWMLTSiFSyN0XtQKW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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

SGksDQogDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0Mzk5Ni8g
LSBSZS1yZXBvcnRlZC4NCiANClhlLkNJLkZ1bGwgLSBBZGRyZXNzZWQgZmFpbHVyZXMsIFhlIGNh
bm5vdCBiZSByZS1yZXBvcnRlZC4NCmk5MTUuQ0kuRnVsbCAtIFJlLXJlcG9ydGVkLg0KIA0KVGhh
bmtzLA0KUmF2YWxpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNp
LWluZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBC
ZWhhbGYgT2YgUGV0ZXIgU2VubmEgVHNjaHVkaW4NClNlbnQ6IDI5IEphbnVhcnkgMjAyNSAxODo1
MA0KVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJOTE1LWNpLWluZnJhQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUg
Zm9yIEludGVncmF0ZSBrbWVtbGVhayBzY2FucyBpbiBpZ3RfcnVubmVyIChyZXYyKQ0KDQpEZWFy
IEk5MTUsDQoNCg0KT24gMjkuMDEuMjAyNSAxMjoyNSwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBT
ZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBJbnRlZ3JhdGUga21lbWxlYWsgc2NhbnMg
aW4gaWd0X3J1bm5lciAocmV2MikNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvc2VyaWVzLzE0Mzk5Ni8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1t
YXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIENJX0RSTV8xNjAzNV9mdWxs
IC0+IElHVFBXXzEyNTA4X2Z1bGwgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAq
KkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJ
R1RQV18xMjUwOF9mdWxsIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVh
bGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5v
dGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTI1
MDhfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3
IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0K
PiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVFBXXzEyNTA4L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9z
dHMgKDExIC0+IDExKQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAg
Tm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNz
dWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24g
Y2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xMjUwOF9mdWxs
Og0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNz
aW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGdlbV9laW9AaW4tZmxpZ2h0LWNvbnRleHRzLWltbWVk
aWF0ZToNCj4gICAgIC0gc2hhcmQtbXRscDogICAgICAgICBbUEFTU11bMV0gLT4gW0FCT1JUXVsy
XQ0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lf
RFJNXzE2MDM1L3NoYXJkLW10bHAtMS9pZ3RAZ2VtX2Vpb0Bpbi1mbGlnaHQtY29udGV4dHMtaW1t
ZWRpYXRlLmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMjUwOC9zaGFyZC1tdGxwLTcvaWd0QA0KPiBnZW1fZWlvQGluLWZs
aWdodC1jb250ZXh0cy1pbW1lZGlhdGUuaHRtbA0KPiANCj4gICAqIGlndEBnZW1fc29mdHBpbkBh
bGxvY2F0b3ItZXZpY3RAY2NzMDoNCj4gICAgIC0gc2hhcmQtZGcyOiAgICAgICAgICBbUEFTU11b
M10gLT4gW0lOQ09NUExFVEVdWzRdICsxIG90aGVyIHRlc3QgaW5jb21wbGV0ZQ0KPiAgICBbM106
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE2MDM1L3No
YXJkLWRnMi0xL2lndEBnZW1fc29mdHBpbkBhbGxvY2F0b3ItZXZpY3RAY2NzMC5odG1sDQo+ICAg
IFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdf
MTI1MDgvc2hhcmQtZGcyLTgvaWd0QGcNCj4gZW1fc29mdHBpbkBhbGxvY2F0b3ItZXZpY3RAY2Nz
MC5odG1sDQo+IA0KPiAgICogaWd0QGk5MTVfcG1fcnBzQHJlc2V0Og0KPiAgICAgLSBzaGFyZC1k
ZzI6ICAgICAgICAgIFtQQVNTXVs1XSAtPiBbRkFJTF1bNl0NCj4gICAgWzVdOiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNjAzNS9zaGFyZC1kZzItNi9p
Z3RAaTkxNV9wbV9ycHNAcmVzZXQuaHRtbA0KPiAgICBbNl06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI1MDgvc2hhcmQtZGcyLTEwL2lndEBpOTE1X3Bt
X3Jwc0ByZXNldC5odG1sDQo+ICAgICAtIHNoYXJkLWRnMTogICAgICAgICAgW1BBU1NdWzddIC0+
IFtGQUlMXVs4XQ0KPiAgICBbN106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvQ0lfRFJNXzE2MDM1L3NoYXJkLWRnMS0xOC9pZ3RAaTkxNV9wbV9ycHNAcmVzZXQuaHRt
bA0KPiAgICBbOF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVFBXXzEyNTA4L3NoYXJkLWRnMS0xMi9pZ3RADQo+IGk5MTVfcG1fcnBzQHJlc2V0Lmh0bWwN
Cj4gDQo+ICAgKiBpZ3RAa21zX3ByaW1lQGJhc2ljLW1vZGVzZXQtaHlicmlkOg0KPiAgICAgLSBz
aGFyZC10Z2x1OiAgICAgICAgIE5PVFJVTiAtPiBbQUJPUlRdWzldDQo+ICAgIFs5XTogDQo+IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI1MDgvc2hhcmQt
dGdsdS03L2lndEANCj4ga21zX3ByaW1lQGJhc2ljLW1vZGVzZXQtaHlicmlkLmh0bWwNCj4gDQo+
ICAgDQo+ICMjIyMgV2FybmluZ3MgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfcHNyMl9zZkBmYmMt
cHNyMi1vdmVybGF5LXBsYW5lLW1vdmUtY29udGludW91cy1leGNlZWQtZnVsbHktc2Y6DQo+ICAg
ICAtIHNoYXJkLW10bHA6ICAgICAgICAgW1NLSVBdWzEwXSAoW2k5MTUjMTIzMTZdKSAtPiBbQUJP
UlRdWzExXQ0KPiAgICBbMTBdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0t
dGlwL0NJX0RSTV8xNjAzNS9zaGFyZC1tdGxwLTUvaWd0QGttc19wc3IyX3NmQGZiYy1wc3IyLW92
ZXJsYXktcGxhbmUtbW92ZS1jb250aW51b3VzLWV4Y2VlZC1mdWxseS1zZi5odG1sDQo+ICAgIFsx
MV06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEy
NTA4L3NoYXJkLW10bHAtNC9pZ3RADQo+IGttc19wc3IyX3NmQGZiYy1wc3IyLW92ZXJsYXktcGxh
bmUtbW92ZS1jb250aW51b3VzLWV4Y2VlZC1mdWxseS1zZi5odG0NCj4gbA0KPiANCj4gICAqIGln
dEBrbXNfcHNyMl9zZkBmYmMtcHNyMi1vdmVybGF5LXBsYW5lLW1vdmUtY29udGludW91cy1leGNl
ZWQtZnVsbHktc2ZAcGlwZS1hLWVkcC0xOg0KPiAgICAgLSBzaGFyZC1tdGxwOiAgICAgICAgIFtT
S0lQXVsxMl0gKFtpOTE1Izk4MDhdKSAtPiBbQUJPUlRdWzEzXQ0KPiAgICBbMTJdOiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNjAzNS9zaGFyZC1tdGxw
LTUvaWd0QGttc19wc3IyX3NmQGZiYy1wc3IyLW92ZXJsYXktcGxhbmUtbW92ZS1jb250aW51b3Vz
LWV4Y2VlZC1mdWxseS1zZkBwaXBlLWEtZWRwLTEuaHRtbA0KPiAgICBbMTNdOiANCj4gaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjUwOC9zaGFyZC1tdGxw
LTQvaWd0QA0KPiBrbXNfcHNyMl9zZkBmYmMtcHNyMi1vdmVybGF5LXBsYW5lLW1vdmUtY29udGlu
dW91cy1leGNlZWQtZnVsbHktc2ZAcGlwDQo+IGUtYS1lZHAtMS5odG1sDQoNClRoZXNlIGFyZSB1
bnJlbGF0ZWQgdG8gbXkgY2hhbmdlLiBQbGVhc2UgZml4IGFuZCByZXJ1bi4NCg0KWy4uLl0NCg==

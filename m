Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFE8C3ABC5
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 00:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D2810E227;
	Fri,  9 May 2025 00:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4NfvBok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC2510E226
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 00:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746748827; x=1778284827;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mOgVTATznATEnajVuUTcsWAxh5yl1dwbsyA3UlqLhTQ=;
 b=c4NfvBokdk02jeGqNbuPc+tB4AfdivRkuoNyD6D9+pOAp17FLOwoLRuV
 4xFdDNh11hPq08IzVAvCobYra8uHPBiWPgmvUWZm1epm/gmzTZAjYkir0
 42zLrwvvzJOW0B802vnWbc9j8fhg8bvZ50jc23NPsnM2b5rPRVorvMwpP
 GUFJetkkW2s+E47SxZVW364agv6QoUhXuSXwRuMy0dpLnifbrT2l7u7z/
 Y25DjnK4xCeoAIgcfkjzXpOQvT9fN9e3yOF9Ovbxo+9sitSB4dulAPuXh
 KZQo2WBSLD2AWji5mJVtUWidN2cHMu55ObTnVylJGQLMEBApHI5IqC5Sw w==;
X-CSE-ConnectionGUID: TiAgwPXjSu6Mk+Tro9c2Xw==
X-CSE-MsgGUID: FkPd22r5Sru0sJKHiLVRBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48468163"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="48468163"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 17:00:27 -0700
X-CSE-ConnectionGUID: vV8oZpDTRvKQUJGeMhFaTA==
X-CSE-MsgGUID: CQYh104OTcSlGvmEK+2zTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="167388047"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 17:00:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 17:00:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 17:00:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 17:00:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTcVmKuGIcJd0L7YU7amnYlfWeScG4xgSvKlS3zXzSMl9LZHJtBFTo3z6uK9isHkuMqIsrcCQkfz4+1OWDHK3n/GuwLZeWwIbHP+UHjIMYe6Nw9mgpWddPBIg2ypDyoB4oYn7aDalo0k+D4VT3zU2VWC6L4oLvXHCLKxmNh9SRqRSkcptwnoU4SLlpNEskdgsoQ57jVbL5vIFUjVmDq6ljQ9PkYCzN+zAqEvHO0xqxz1nbLEzqFwV/Mh+O985T+VNSG8S3Xl5WwzZukEhmKwQMDMTV5jfOOuND7XMLrbTchu7rfcM0vpKl1fKXY6/DtdBlN3YnFWziIhiQzJI3R/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/7Z8hs3VwffAZNkzRkH0fM6JrdxX9svNLu72k23pZU=;
 b=WoilHfTCTgyMSrzLitjiHSli/rd5H2Vo+q4IUsBlhqXVrj1nb1fJZjC1Y6sKMYYeHWZ0iTKfxS1vO8nmca27ZB42PvDsbkHVEMeQhL6Jq860lN4DFL4yng3HgMuyqPBgHdaSGHHS0Ome9tEFO/mRoT+keqskcIlZQWX325XtKFPK+aGpGP3O4c1xCpcFvu3xWzlaZ5bytpUZtD5jrAYr7IPUoqR1wDo3TaocZ2+swzvJlaL1DU62PCdDG2RMXvxugmUo3lFHTwUf0ITL5vv5U8p7Sr1h5K+TMJR3UOMZwlSaO7s/NO4L4J24csDaM6fgebuPz+1JpGm9UB3o0R42Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 00:00:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Fri, 9 May 2025
 00:00:19 +0000
Date: Thu, 8 May 2025 17:00:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 4/5] tests/intel/xe_pmu: Add tests to validate
 engine activity on all engines
Message-ID: <aB1Fie-8Cxg66dAK@unerlige-desk.amr.corp.intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
 <20250508055006.734259-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250508055006.734259-5-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8e7e58-c72a-41e2-c451-08dd8e8c7cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjlaRzdpVmxyclJLMU05U05LU0NuaFptdERJTUdDYStzY3FzcERMN2lrV1ZL?=
 =?utf-8?B?OWx2MXhuNEVDYzlVOUJ4aTZsSTlRbkdjc0s0TFQwRnd1YUxQM1o4cXRYM0Jk?=
 =?utf-8?B?dE9UTjlqRnhLNHlxNURoRkkwY2wybGRLY3JIajhMVThqWm5GcDZ0THhvbkRU?=
 =?utf-8?B?cGdWZ0NvaDlJaFprcWlteWhBdTdhWk9SOUZ6d3drV2pHeHI0RVYxSkI1NWVG?=
 =?utf-8?B?cG9YZVRwOVpXSVZCTHZhK2V4L1FUL25IaFJwcFUxMXNEb0Q2aWsvVmh2cU12?=
 =?utf-8?B?L2twVkNyZUdZNmlZL2Z6NlNvemZnNzZFU1g1OEppUjRpU1hIQzFuazdXZWRE?=
 =?utf-8?B?UnFXbXNacEk3Nks2Q2JvekcrM0w2enJuZG1vT2lhVEY0emtNTE5jcHZBZThM?=
 =?utf-8?B?anAwdTd6akg4V0VpclBMNzJNb1lzM1hnSzVlamRyUzQzS2dnWEhZTTQyZWtz?=
 =?utf-8?B?L1MyRzZEeU54U2ZqUGdPazN5endVZ1RmSTVPM3lIcXpQSW56VXBmOVBpM0lr?=
 =?utf-8?B?RlMrWDhJZlhwSEtwdVRIRW5hS05kOVBKaW1taFRCNE0vV09hdi9rZXFiamd5?=
 =?utf-8?B?UlFwRUVKT2pvUjl0dGlLTUtYZk9ZTlBMWEFlMEMxTXV5ekRpN05ycjZsVmF6?=
 =?utf-8?B?aGhYM3ZjRGJFYmE5T0hadDNEaXY1RGFlQW1CR0VEQlR1S1pDKzJBNjhzdjhx?=
 =?utf-8?B?Ymc2dXlnd0NqdDRBWTNhNXBGTzFyWkNIckJWRHMrQ0dSdlhJZ0kzSVlCM1Z4?=
 =?utf-8?B?TjZ6MGErN29lbXREZDllMGJ0K0NESDMrTkJqQzg1WGljaW5YTUZ3TWhzREVH?=
 =?utf-8?B?Y21WSE5OY1RVWllFVXliM1VEQi9UQzF2Nk5lNDRXMmN6Y0kyeFo2OHhaL2dP?=
 =?utf-8?B?TjBFeDlmZ1cxMzdoS2d2eVB2eEhWamxuVGVPZmxiaFY4R0NWSXJ0T3VObldz?=
 =?utf-8?B?cWYwS3BXYmlqT2NKODd4QXhieWcyOFdwZHhOa3JMUVVtMjFUZ3NSdzBZWDZZ?=
 =?utf-8?B?OXA5M0JhWG5YZE9WRy9GZ0c5K2dDZE1ZZkZMcWNCYjkyWjVoUEZIejFEclQx?=
 =?utf-8?B?bk9DSzRabGdNSC9nWlMrUzIvMjVKWHl0TnpEbGtlYmdaOUQycTVlZlp2eXZn?=
 =?utf-8?B?MktOU21YeTVRMmQvekNOS1krOGhJQ1pHMC9ydG00VG94dGJjNkFoZkQraVBu?=
 =?utf-8?B?RkNkTVJGc0cvcU1nRUg1MDkyTWdiUzJibFNQMDBQWloxNkxSRm1LT2EyaTFV?=
 =?utf-8?B?dzlma0Q5QTVKOUZ1My96OCtYQkZKeHZpRVVVYWhicUptaFNCeURveUhReWYv?=
 =?utf-8?B?OTQzdVd5SUYvSnNCQithdVVKc05id0o3SEd3REpyczNpVnU3TUI0dTdJM2w5?=
 =?utf-8?B?TWdHWnIzOEZ2VHpZY2VwcjNacldPMjJ4b3lCMCtYTkZmV3dWMDdKNi9EVXVO?=
 =?utf-8?B?bXZRdGJKQ0dYNzJGWVNKK2JKUnZlUkhKRDhBM0JORGFhR3lEVUFFT3B3VVF4?=
 =?utf-8?B?dkY3UVJFZzYva2R6MWE4THJmaFZ1U2NhdWlwMXF3cFVNdGRseUJFZS9jYWxR?=
 =?utf-8?B?WmlMYmUwLzdoUjB6UzdKMjVVdytFeWR4TDdTOW8yQnY3S0FMNmsrdzlDTUxW?=
 =?utf-8?B?NU9RTkNQTUYxOStMcW9sOXFWMnlsc3VWZ1VmWDlURFRxNm5qSW9WdTdGV3ps?=
 =?utf-8?B?ajNTdFFGZml0VFpTakJjdmxJSVZuNG92bXV4djNnd0tsWk1obDMraHdXNXNn?=
 =?utf-8?B?QXoySlVJbkFVM25JOE5uQzZwNVUydEg0bnlXMTdyMFFKUW9EcnRmdm15eW1N?=
 =?utf-8?B?dmlqMnFmVTF6ald1RUJ0eWd6THBsZzBrQTN6ZmlFTjlNYzgxakkrbHRuc1Vl?=
 =?utf-8?B?Qk55VzdTaHBjQUlSQzBxR25WdjNNVFpybkFYTXdTU090V2RiUzhWR3EyU09z?=
 =?utf-8?Q?AA8pGUCpqHk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXhqK2MxY0ZveVdqSEhPQkpIN0ZqdDZTQ3FEZXc4TERXTzhzcXhuWUZOQ3VC?=
 =?utf-8?B?WTZNL0NSTjRtc3YyWnVnTWdBQXBrWXUxTHRZaW9uMGt6akN0K2dDTVowZ1ZX?=
 =?utf-8?B?NFBaZUUyTEp1eEUwWkh2MWZJMklrUmhGbzBKck1iS0xhSUVwU3NVSWxrcGRT?=
 =?utf-8?B?K1ZkT0lVYk1tRUFTek52VzN2Y2VJYVlXVklYaFFBSVJwbVFBMHJ4bmplTWRi?=
 =?utf-8?B?MmJQa2NMU20xSVFldDdXR2lxVnlURzBJYURiK1ROaHdGREtoUXBwRHR4YkMw?=
 =?utf-8?B?R3Z1VUVranpCNnNvVERPZndmM2xLWGN0NkloK1NYYitjOC8rUmRrWVRFdTVN?=
 =?utf-8?B?TVNrNm0zVjlvdTlZaTdKQmpJRjJWc1ZpRUdkT3hQZzNMaUU4UXJOQ0dJelpQ?=
 =?utf-8?B?ajNGZ0l2WmNYbDJrZU9KWVc5UEd6OUFCdi91cVFvTFNWTnVvalFlUFYzR2Vw?=
 =?utf-8?B?bW03eHhleXNjbEVCU3owNDRxajdFMzhSZjNKSzBTK0lGMUYrcjZWT1RNcVlP?=
 =?utf-8?B?RmFnUFplODFrUXpDZEh6aWk3KzFtVmNYR3h4dVRaM1FMUjJMQVhic1NjMkV5?=
 =?utf-8?B?RkNBM0JDcmpGdkhtUmFjLysyR1kwTWhBeGluZ25Janh2Z2Jrc2d1YVkzU0w2?=
 =?utf-8?B?RGkxb2JLV2FtV0NLV1FCWklmaUVyYi96a0srNVNWb3NTVFFLTkQ2Q2NXQm5j?=
 =?utf-8?B?d2xFUDFBeStzT0YrUUk4Z1JXVzc4TzRwM0p4RTZOMkNLeEpnN2RObmZJeVpQ?=
 =?utf-8?B?Nmd6dVVXUUFMYXRiQjQzRUxWYlBld2dLVndoUW16QUo3N0JnMWtUU3k3a2dG?=
 =?utf-8?B?MHowSDRDODh5V2pKQkVVektaM2ovQ2V1RGdkbkZvUlBhaTJPclVTOGNSc0tY?=
 =?utf-8?B?NnpPcTQ3QW9uMGkvMjF3R1pUdGFkck9heE9qSEdHS3Y4RUtLNlc4dzNFZ001?=
 =?utf-8?B?bUFVdzVONFByM1dlQUZ4UTZRSUs1a3RId3pnaVZvdWxBbVhRczBkakhsMDNm?=
 =?utf-8?B?NTF5ckpPWkYvZlVLRWNIeDdsS0ZubVBRUndxYk5laFhkbGs5cWV6K3E4OUVr?=
 =?utf-8?B?ZExWSmVBWml5dzRuSEVLK28rSi9tSCs0T3lxS1BWUGlMN1o0a1NQZUpMZjZX?=
 =?utf-8?B?QjRqS01TOGR3am1wcFZjTXVONXllU2UyOG5MTUlBV21oOVlYRlg1U1hieklq?=
 =?utf-8?B?UDdNdHcxWGh2NlAxNnBxRHVnUGdVdlBXMWNHNFRtbXA3RXZCRmNwS003MExa?=
 =?utf-8?B?Ui8vMzRBTXl2S015RW9hUzJaL1A2WHBHdll0eVMrc0hHRUZRSi9Rb0NLSGRs?=
 =?utf-8?B?SmxDcm9TbERGOHplYmdsWGFzZmtQOGE3aENOVDIxZ09VeTdpYy8rVnBmUmtX?=
 =?utf-8?B?aWxMUjhta2ozUGs2cUdaTnZRNHI4aVRRVnh5NTNVSHN6bkwyUk85QmZNeTBU?=
 =?utf-8?B?cFM0dXFadUNDZm5TaVl2MWlDT09TR1pOaEN4KzN5eEl6L0x0NFlzSDV0M3Y4?=
 =?utf-8?B?TFpKb3p6Si9zNkdlREU3T0F6K3hZR3BJc3o3NE9rRjNiOEMxejc2R0owdWl2?=
 =?utf-8?B?eHErbGpNUDFoaHZra2lLaGNUNDRabWxGNEphRUdjZnZoVHA4NS9XNVFPaTIr?=
 =?utf-8?B?YWhvQy81VjU1YVBnbkQ0Nkg1dUxpc0VjU0hCRjc4Z1JmWlpLcjl2T1ZQdXQ1?=
 =?utf-8?B?N0E3VEFZTHZ1MGNVM0oxR2poY2EybzgxMTNLTC80cXBYWHRtR2NMaStqYXFh?=
 =?utf-8?B?TzNzLzNUdjlMdFcvK2h2UjA0clVYdGQ4MmZEZE90MjNwVXF4Q0FjbEk2bnlx?=
 =?utf-8?B?MGRZcHZMbFBIMjN6cHlMaytRc2gyQ3FWUmFnUUxvTW03Q3EwVy9WemZWYk1K?=
 =?utf-8?B?SWhLQ3J4WkNnNGUweWlMWWx5VzZnQ0dXVjZDbHV6TFFjTkdSWTJsVnBSTEp1?=
 =?utf-8?B?Y01JRFRJQzhmOTNiVUNLL3VaRmRwYnVSWDF4d2w5NFplNjA5di9PeXNHdFB2?=
 =?utf-8?B?alArNXplVmFQZzc0dWtxWFI1bXVGQU1JUTRsbHArZE4yMkVGL3NDTjdLSE1Q?=
 =?utf-8?B?VjhHNXk4ZXptbmtlTkw2Q3ZoUnVOLzNoMFdDNE55V2NFWkc3Yi9ma1pzRkdi?=
 =?utf-8?B?OHFrRXFFdk12UmhLWUc0Vml1OHczREo3alFER203NjhWdEdDK3ZML1IwQ3Fk?=
 =?utf-8?Q?2Rjh8wsQ89M+5RlDHDf9utU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8e7e58-c72a-41e2-c451-08dd8e8c7cce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:00:19.9028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YutamNxZk0fh7MM7YnVNSeiTYxAkbu0/b2Ao+FBNPcv8LjKA3avLmZizwyLmOtKooOVJvDLXbSbUCknb9ThMs/rfj7RD+o33f6TI+Jzng8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
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

On Thu, May 08, 2025 at 11:20:05AM +0530, Riana Tauro wrote:
>Add tests to validate engine activity by running workload on
>all engines simultaneously.
>
>Also add trailing idle test.
>
>v2: use allocator
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 67 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index d78b8bea5..2df460b07 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -32,6 +32,14 @@
>  * Description: Test to validate engine activity by running workload and trailing idle on one engine
>  *		and check if all other engines are idle
>  *
>+ * SUBTEST: engine-activity-all-load
>+ * Description: Test to validate engine activity by running workload on all engines
>+ *		simultaneously
>+ *
>+ * SUBTEST: engine-activity-all-load-idle
>+ * Description: Test to validate engine activity by running workload on all engines
>+ *		simultaneously and trailing idle
>+ *
>  * SUBTEST: all-fn-engine-activity-load
>  * Description: Test to validate engine activity by running load on all functions simultaneously
>  *
>@@ -319,6 +327,57 @@ static void engine_activity_load_single(int fd, int num_engines,
> 	log_all_engines(num_engines, busy_idx, TEST_IDLE, before, after);
> }
>
>+static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
>+{
>+	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
>+	struct drm_xe_engine_class_instance *eci;
>+	struct xe_cork *cork[num_engines];
>+	int idx = 0, engine_idx = 0;
>+	int pmu_fd[2 * num_engines];
>+	uint32_t vm;
>+
>+	pmu_fd[0] = -1;
>+	vm = xe_vm_create(fd, 0, 0);
>+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+
>+	xe_for_each_engine(fd, eci) {
>+		engine_idx = idx >> 1;
>+
>+		config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+
>+		config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+
>+		if (flags & TEST_LOAD) {
>+			cork[engine_idx] = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
>+			xe_cork_sync_start(fd, cork[engine_idx]);
>+		}
>+	}
>+
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	if (flags & TEST_TRAILING_IDLE) {
>+		for (idx = 0; idx < num_engines; idx++)
>+			xe_cork_sync_end(fd, cork[idx]);
>+	}
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
>+
>+	for (idx = 0; idx < num_engines * 2; idx += 2) {
>+		engine_idx = idx >> 1;
>+		if (flags & TEST_LOAD)
>+			check_and_end_cork(fd, cork[engine_idx]);
>+		xe_cork_destroy(fd, cork[engine_idx]);
>+		close(pmu_fd[idx]);
>+		close(pmu_fd[idx + 1]);
>+	}
>+
>+	xe_vm_destroy(fd, vm);
>+	put_ahnd(ahnd);
>+
>+	log_all_engines(num_engines, -1, TEST_LOAD, before, after);

okay, I see a new variant here ^. Looks like you are using -1 to 
indicate that all are either idle or loaded. It should still work the 
same way as here if you split the helpers.

Ideally, if you want to do this, you could use one helper and just pass 
an array - check[num_engines]. Each entry in the array would just be 
either TEST_IDLE/TEST_LOAD.

Any approach is okay with me.

Test itself LGTM,

Thanks,
Umesh

>+}
>+
> static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks;
>@@ -683,6 +742,14 @@ igt_main
> 	test_each_engine("engine-activity-single-load-idle", fd, eci)
> 		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
>
>+	igt_describe("Validate engine activity by loading all engines simultaenously");
>+	igt_subtest("engine-activity-all-load")
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>+
>+	igt_describe("Validate engine activity by loading all engines simultaenously and trailing idle");
>+	igt_subtest("engine-activity-all-load-idle")
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD | TEST_TRAILING_IDLE);
>+
> 	igt_subtest_group {
> 		unsigned int num_fns;
>
>-- 
>2.47.1
>

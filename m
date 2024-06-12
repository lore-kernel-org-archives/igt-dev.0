Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8602FC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 13:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFF510E86D;
	Wed, 12 Jun 2024 13:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeVpsxci";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F071B10E866
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718200716; x=1749736716;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=dyFEHrN3KqBnLmX4+tCitfRI/QyfnzWkyxREjncn6Ok=;
 b=BeVpsxciwUxtQkrlVIb753hxUPhsMgQOz4hU7Nd0BGIi7KstZhto13vb
 EQxpw7gJck4prV1JYV6wxq88YCG7PF3+PEMjFFlkvVn4Tlg3ghlFFshGM
 UNybH/wTAIOCK85A1bDGwfoO8SvWIRQ4BJ7ETa3egH2UX4UYwF1iB8Eli
 8UdrvcLnIYqb83SvGgnIPxVWd9+OVwcWN0yMKIzMsGLa0pt5Qd41EKPoW
 FsJHaoBYZJDRwTG60Iqib5H+psTOOFNeTNJpQeguvStxyh4cz3hZNVx9d
 0V9BC/m0rJ5OiYI72SYc57oMV1iGn28DmHLQ+qVYLGzL9T4E5BwAeeOUD Q==;
X-CSE-ConnectionGUID: RHFhA488QMO9wO3q9bDAmA==
X-CSE-MsgGUID: JFP5yR+DSPqJsyiIuDLfpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15094215"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15094215"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 06:58:36 -0700
X-CSE-ConnectionGUID: BKewhfNnSP+mmId6i2cQNw==
X-CSE-MsgGUID: STrIx3NxSo+C0BKo8AiFjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="71003038"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 06:58:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 06:58:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 06:58:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 06:58:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRqsebUWjNph7Qv2dlc6S+cpOrLWqQ34vYEf2FJmlToKdn7zyiwTuCaIbiFswN854fag6pvoAvJG2hsE392iC/BsH1VljNpJGjaGoLj1CpAkEhPCVpiuNBXzNRjMgHuDrkCiRkXZQgp0RQzW2RR7w/FhDqLdID1fD++sj6rnMDE8PXAVd8fE9MokB6IdSYuHDE8Av0Uhixjf0IP5KSABJA76I771gHT/M67L1TPFfcduT+nfMB6nYZokc6/gxr/ML6MWYTkE5PbCTj1+tx20JGGY65voIAZcVKAx+YjGzTglB3Yn9gyf9IzyGhanKVZNqhCg2oI/m3pCsm4k39pRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyFEHrN3KqBnLmX4+tCitfRI/QyfnzWkyxREjncn6Ok=;
 b=V37ewH/YtD9Xl8WIRyf9MsxyxObmsyo7NW1+1UJa7x30G7UAwz4ALToa04wIAUA8QYQjvzzMrNbxUoZQbyX6WAdDLPAWjsKwEu2GfEPif4IL53kB1W94e7SYgyM4rZsYdfZaF9xG+z/grLO8TDNFTo/Bu49aPkuF6e4tjZHMZrPRyBa6gyTo6BFgzt79X8JqGoXDp76kKdUoJF0GRvAHIay7n99+o7afxDyxVJWU2qgkiUAuZhuBXT32mSPAaqaacwvMdBLgkLqbYMiPcM9K/xJwseFx471xDbKA6ZZ904ocUrmxigW1vrX3dXTdd+O91kKTK/At63rSFa6iXwrSWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13)
 by PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Wed, 12 Jun
 2024 13:58:32 +0000
Received: from DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::80b3:e6e7:efec:dbee]) by DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::80b3:e6e7:efec:dbee%6]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 13:58:32 +0000
From: "Coelho, Luciano" <luciano.coelho@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_chamelium: check
 drmModeGetConnector() before using
Thread-Topic: [PATCH i-g-t v3 1/2] lib/igt_chamelium: check
 drmModeGetConnector() before using
Thread-Index: AQHauOjGx7HcityDlEmq55klx/LxcrHEL2QA
Date: Wed, 12 Jun 2024 13:58:32 +0000
Message-ID: <fbea1a4d88da9ea06c78f4a045365da8769ff6dd.camel@intel.com>
References: <20240530085908.564733-1-luciano.coelho@intel.com>
 <20240530085908.564733-2-luciano.coelho@intel.com>
 <20240607144115.mkje57af76sg2fy2@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240607144115.mkje57af76sg2fy2@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7382:EE_|PH7PR11MB8600:EE_
x-ms-office365-filtering-correlation-id: 397c889b-720a-4318-69d6-08dc8ae7beb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?utf-8?B?NkZYQWlnczZtcTIvdVJCeDNsT3o4bkYvYk5ZYjBWTGZYazIreEdyVyt6WlZ2?=
 =?utf-8?B?VHVvTVN2c2NRd3RYOFNKQzhXTk1sNG93ZDlZVGxCSlJjbzVBZThTMjIwek1G?=
 =?utf-8?B?VDZFZE9lV0NERi9EVVFjWjF5OU1TZVIwOVlrOWEvYnBPTU1XSDh5ZlJTZzhX?=
 =?utf-8?B?aXRXR2ZqL2piQXRHZkd2R0xRdm9VZzVQdVdMWktLM0U3QzZhd1ViSXVsbXNG?=
 =?utf-8?B?L2RXMkhncndPZVJFWnFrejM2L1pNMzJzTFRNemRJSXMyR29FU0NIc2E0N1lo?=
 =?utf-8?B?Q0d3c3BlZ3ZERERTZjMwSFBGdmVZeVlqNkpzMmRtRGNoUDlTRTlUMWVVRWVo?=
 =?utf-8?B?MlpJc3R1UzBJUWg4djlPRjFBeHY0UVB4Vm1qYzhGVGVJSXJpTFpJODUrTEdM?=
 =?utf-8?B?d1R4L0g1WUcwL2FoUFpYeW9ka3FLL01FVmw5OHZQemdYUmZZeU10SW5mWTFu?=
 =?utf-8?B?SHpUdWhsZDRGRG4vbU5SZ2hGbmgzSDhIRCtGSnYyT1E4RzE4OHpOcEw5eUZN?=
 =?utf-8?B?Umw0TDlIa2xzYkhXcFpZWDVBanF6M0h3SktydnBXOG4vNGhsMnVqWHRvYzgy?=
 =?utf-8?B?aERpQ0w0VHNCTGNydy95VnlONWk1QmZmOXlLclpVRzlHVzlpcCtTQ2lDRTVk?=
 =?utf-8?B?amdnSldmQ0F6TWRraWEzd2MvOHA2VHdjeFFPYitmVXBObldYVXZRVHFzZHZX?=
 =?utf-8?B?c2NVaEcvT0RXZWJ3OGdRK0dCMFJqWGphT2hQeUpHTjBVL1YyZVZxZUsxYUgx?=
 =?utf-8?B?Nk1ldUd6Y3FJVGZZYjJDcG02Zyt6QW5BclVLdlE1dm0yRTBMZHpNTEFJc0VC?=
 =?utf-8?B?M2dmczRCMGI4dWdYcHAvUWtndDNGN0ZhYVFtZWJCRUpLdEcyT1ZHVmtYNk5p?=
 =?utf-8?B?cWsya0tkNGVocE9jU0dRWVRPSGVMbi9OTlhzSGNPem14U0NvOHRQZVdDSDJ2?=
 =?utf-8?B?S2UwWkZadmVOd1Y4bkY1enFwYXNQbmRwempoa3UzTmRZUVFwMVpOcUh5Qmha?=
 =?utf-8?B?L1BURkV6MHBkck1Gd1IyVFc3S29rcytWeXFRT09aL2RaN0FPUEFqUjdXOStQ?=
 =?utf-8?B?WWhEaUd1ejVwNlRXQXptbThQeFVSLzRYcHNSVEpKZ2Y4bjZLazgxVFhRWnYw?=
 =?utf-8?B?UlV3UGM2VGRZYnpKY3ZVMXd1N3hnUnY4SlBhbXhIallIYnAzSVU1RmtUcXVR?=
 =?utf-8?B?VmR2UG1CZEc5SUpoMlRoTWRwRVdUSjJGWUxYaENxVVVHa0VoWE5JUTBoa3N4?=
 =?utf-8?B?cHNPYVJSMU5tblo4bXV6Q0lrMUxucE9kWmQ5ZnhhTW9LcnN2YmU2VWJESWVS?=
 =?utf-8?B?MHJkUEl3N1ljdWEzUXYzMUpmZlArb0NnV29nQlNmUi95YkdYK1RFNithRzBZ?=
 =?utf-8?B?ekNuajlKYTl6NFlSTXlqUDNxeHo4RmZDd29tU3NaeHUvL1pSeFdHUDFTVHZm?=
 =?utf-8?B?SStZY0Z0RXZnZmRkK2RRYnpyWHNjT0UrYkhVaWJQMlY1YTc0SU5CQTlUM3VT?=
 =?utf-8?B?OUhIVkk1UEpJUitSekp2VnlWOFlnNnJTQ1dGYkZJNHovUTZBMXh5TlNmM3Iv?=
 =?utf-8?B?Tm9KejFqY2YyL05jT1BDdDdyem5VVCt1Vm1ZR3BWRzhGOE51NWZwYUt4cUdB?=
 =?utf-8?B?MW5pNW5QdERzaTlzeGxqNlRGVVJWR3dFTnV1VTRyN3ZxMzVVNVpaOXBoWFFq?=
 =?utf-8?B?Uzkyd2M3RmVUWTUwL1ZibDJ6UG9wL0tqeHJxUXBqcnBLQTJoMVMvSGpRMWc0?=
 =?utf-8?B?YmRIVC9LUG5iVEc4K0RnVlkvN3JJZlFMZTZZUmhVRElEZzhibHpWMS9iS0Q4?=
 =?utf-8?Q?Rfq7BjXGGsmq/2DjhLashub/Amt/+lydBeNvs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7382.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ti81Ym1MZi9YdVZZdHRlTmxwMGc1eGR2Y2ZiTWNJQWpNSzJZcnhubkZENXUz?=
 =?utf-8?B?VTNFd0tNK0hhWUhGdjdIVFE0SDNETjNwNzdZS0hiQ1BhMGh6SmpqS2N2a0Zv?=
 =?utf-8?B?c3dXaERNNWNFb05VNFBrRGRUUW9hVG0zMWczbVBnSmIxQmNhamZvY2srdmlo?=
 =?utf-8?B?SU02dWtsWDQyYlUrZll2MXI3c21SQ3liMThjc2ttcXlnejlVUVZpeUFPYVdD?=
 =?utf-8?B?Q2YySjBqc0VVTkRxbFhwdlg3QWdxU3dIekloU2p2aHlSQ1E3OEwvaUdGTytY?=
 =?utf-8?B?VGN3K3lFbG5JYWloSTZqSXpKeVI1a3JRY1FyS2dLTjB2emYxODZEV0pDZksv?=
 =?utf-8?B?b1BHTUxMallGZUgrZnRzQzEwRDR2MjlDOStwMk9nODNldWJZdzhLWGg3Y0pz?=
 =?utf-8?B?WDZPRDJYU1kxSUxZV3hWWG83M2lPWS93YjhqdERTL3lsVXJHdDV2aE0rUUZL?=
 =?utf-8?B?UnVvM3I2OEJzOWVLSTN4ZkdOQzZObGN6Z01zN0NOQ0QzUW5aVmc1N0VQN0t6?=
 =?utf-8?B?VHB6bUNGNFA5ZXdKU0xMUmIvaWRpNWhCZ1ZJMy96MFdkL25SZHQwRHNoREtB?=
 =?utf-8?B?MTNaQmd6SGh2bEFXZWxkVnRmeUNaU3dBWjNGWFhWaU5qekZxUmkwM2RMZi84?=
 =?utf-8?B?UGZ3RjBsRDNSTWhCNzJ3MVp2OUpJT1YzdVhHc21qbVBJa2Y0bnlKZ2xsSnE3?=
 =?utf-8?B?NDZJTE1XVXBtdkhGdTR4LzE0c2V0NUVPN0x2MldnakFrV2ZlSHRBVllhS05q?=
 =?utf-8?B?YU4zWjlsVnZHS0JaVWJnei9RR0crU3JPWnVjUHN0YkhoeTJCbnBDVk1SRGZV?=
 =?utf-8?B?MUJOMldYbm1GbDRrd3Z6OFFEWjhYSk9CTHBoNDFXMFA1ckF5WDgrSGE2MDl5?=
 =?utf-8?B?OXpRQTQzZENNaTlPdlIxZjZLVkRHUkVOQ2IxSlpjZ3lKeFFreThEbm5BMGJC?=
 =?utf-8?B?SjZMSk1Ub0xJZmxTcXhORFBSVjU5T0Z5Y1orY2ZKT2N5UTU3aGdqd3dJR1E0?=
 =?utf-8?B?NmR4cnFpZnNUTE00MVlSRko1ZlBGaDdDUWV6TVRpVmJ2UlhTbmZvbWNqVklx?=
 =?utf-8?B?Y0JtWFVuTDZlOWtHck8xczN1dHU1a2FSM2N3VlRrVnhVTXh1MmNrSjM5NFZI?=
 =?utf-8?B?M0ZsVEVxc0lnMzdNS0NzVEREdzFHN3ZUeFFuS1ZoWHNhcmVTd3Y5RmltY3Q1?=
 =?utf-8?B?Z1ZaTXpkRzl4R0JDc2hrMkZZQWJQNGVQaTdicHczU2tBVE1LanZMcVVTTk8z?=
 =?utf-8?B?QnErYkt5eGhjalRWZktpM0Y4ZFp3S29mVm8rQnhmYlExS3B3OEk1SitLSi82?=
 =?utf-8?B?VERnTk9sUGZ4WndQalB0eDJabk1UeW1IVHR3eGE0c3JiNGREQndZTVBqRndv?=
 =?utf-8?B?UUZPTEo1UXdzSlEwU3hiSk9FQUk4eGdsOXU0V254WklheFpZMmFBcEZvRFVY?=
 =?utf-8?B?dlV2NEYxMi9QMFprcERFTFFXVGE3bGxXenFkOEM1YkEwU1QzekpnZkV3WEYw?=
 =?utf-8?B?TmNyZ3MwNjY0OXd0TjNhS2NRTDMxU3gzZUx3UTBBNzY3RytURS9ZVmU1V1JO?=
 =?utf-8?B?d3dRb1ZoLytvU1Z2RXoxUC9xbVRyUkVRTlZ6czdnUWg1bW44K2xRNFhqU3RC?=
 =?utf-8?B?M2ZpcDlaOTZpZGwwZGZueVdIK056THd1ZE9EZGNCQzB0R0RHRmZqbUFIRmJU?=
 =?utf-8?B?ZjVMYkFJdUJqOXlRS09oOC9nMllCeVJmMmM2Njhhd0lkSk5hbGtEQnpNcWY4?=
 =?utf-8?B?bTMwdUJPYlJHM2d1RFVkS0ExcWxrWE9jOU1HNUJJUEo0QksyTTNxMkdJZ1Aw?=
 =?utf-8?B?MEhrQW9RSEtMbkkwcnhKSnJHc1kwWkl3dllCOUdQNkIwaVdGYzE3dkl4enlo?=
 =?utf-8?B?ZFhaR1IxNGNZcG9EQmM4RWg1UmJjTzdacjdBMFp1VzJhak1LakpiVEdTRlFG?=
 =?utf-8?B?MkdIMk9SV2VTRW1nQjkzdm9BajhiSGZ3QVBLR0VhRjNFRk85bks4TVd6VUpE?=
 =?utf-8?B?RTFOZ1ZNSThwMStSK29QejlUSUk3QnJEN0N3UXkwUnZjeWIxRUlWelNYcDZS?=
 =?utf-8?B?RnI0Y01NbTNUTExXTENTc1lFL0ttWm1tcjhSMitTOWRmelMwQ0JhUnRLVkJi?=
 =?utf-8?B?ZUJ2VkNvYk54a3VWQ29TSDNaL3N5Unp4RjhEdml2bWtGc3ZTU1IvU1UzNXMy?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05A39959EF41874B8DCB164AAF556D81@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7382.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397c889b-720a-4318-69d6-08dc8ae7beb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 13:58:32.1587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LCldrMtbCYUXrD/ifJNCyN2n73BnaI+xYNa7lodpGAQ0pwQYYwXxHFtNmFu3jRQCmyUjf11zJWXjzUbfuIDtve134ydSpOT05VmY+CHXv+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8600
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

T24gRnJpLCAyMDI0LTA2LTA3IGF0IDE2OjQxICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEx1Y2EsDQo+IE9uIDIwMjQtMDUtMzAgYXQgMTE6NTk6MDcgKzAzMDAsIEx1Y2EgQ29l
bGhvIHdyb3RlOg0KPiA+IFRoZSBkcm1Nb2RlR2V0Q29ubmVjdG9yKCkgZnVuY3Rpb24gY2FuIHJl
dHVybiBOVUxMIGluIHNvbWUgY2FzZXMsIHNvDQo+ID4gd2UgbmVlZCB0byBjaGVjayB0aGUgcmV0
dXJuIHZhbHVlIGJlZm9yZSBhY2Nlc3NpbmcgaXQuICBUaGlzIGlzIG5vdA0KPiA+IGJlaW5nIGNo
ZWNrZWQgaW4gd2FpdF9mb3JfY29ubmVjdGVkX3N0YXRlKCksIHNvIGZpeCB0aGF0Lg0KPiA+IA0K
PiA+IENjOiBNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+DQo+ID4gQ2M6IE1h
bmFzaSBOYXZhcmUgPG5hdmFyZW1hbmFzaUBjaHJvbWl1bS5vcmc+DQo+ID4gQ2M6IEthbWlsIEtv
bmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhIENvZWxobyA8bHVjaWFuby5jb2VsaG9AaW50ZWwuY29tPg0KPiANCj4gUmV2aWV3
ZWQtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4N
Cg0KVGhhbmtzIQ0KDQotLQ0KQ2hlZXJzLA0KTHVjYS4NCg==

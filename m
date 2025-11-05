Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D17FCCFA04
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 03:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A220210E154;
	Wed,  5 Nov 2025 03:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adfo/HgM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9405110E154
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 03:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762313247; x=1793849247;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EtOI9Wt/f6mGzD+aIHlTqny+V48Nkb+/+AkHEGS3608=;
 b=adfo/HgMXma2k3Ieqg4jX+y3cUh0nMg/CJG7CwUnyOI3g43r2kRH7P1b
 GGdfV/IiHHe2HswN1AXSq/yB6OFIyuXSCHU1DtC+qhDRNjppJpdtGygGc
 vcxieXV81tPNKUE0jSoUEl5owQDvfTLlSlaC2/ajYu/Pbx3hcOW+C3++E
 lSXWVE5suldabYFrzXdRxmnS/VCioRm1lCmVahBXP7itA3p7V/pGIIOze
 hpZXzGrPeKJbNGZoFcFFHr92YgGKtEwuGW8TYgxBQPmOSkTXH6Ed1LlM+
 KpkrheK1SrrUmKrJCsTeAQQg2fv7/ApW23Ww4lbmoGTnaGotb47NhLAKI w==;
X-CSE-ConnectionGUID: ezeSvPYTQmKZIFSENNbAFQ==
X-CSE-MsgGUID: WKW/ht1mThyWGCTpCl5XBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="51989871"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="51989871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 19:27:26 -0800
X-CSE-ConnectionGUID: yh8sWBi6R4KGZ1OVFBaFAQ==
X-CSE-MsgGUID: 4xIXOGddRJG1UB8YDAedBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="217979024"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 19:27:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 19:27:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 19:27:25 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 19:27:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCAs2ef42dHZZ/rbG11Fb7aAtUylzac1Ho9BQAPOyuEPn2OmcFoTKnikmt1stpd0RfizeedJZqRWkzCT8BWAgTrm+D56iU2WGrYvlbbYEpSMuEma2PdgWV9OVeHc3fs4MnYiIryZey7GMHW99f0QhRVsunhnayd1CDjBqgxounuyIyeDUXvNG0bjUQecEC3RdE3shI5/M6iMEdb0RY4+BGxKb9DsuGDnq/3Wr7zBBLrhFVMT6yo7Rqzarf+zP5vQR/+fCi/ar8dlHqUdANlI68DQeo0Upk6WsagdzfK/h1sarwn694y/ZhyCSMUiZihgvGOqeUnQDuue0/5X8zyr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D5c1oIgrG+sPO/qwAhgUT7Ef7pbP8OI5r6UFMhzRms=;
 b=rbkusHofBkZ0RVfGCMOONMoN8ChbUqXmaoPHxUNqCB7rl0YYvGgOBOOQ+uJqhHZNqkQgFMrhogSLMs73TCmUbH5q8hQ+FycZEPfrMVkuMnhUaHTHTS5vyW4iS8WymuaHmIjQLtJxAS2RYsHDws8oxpyTX6oI8GHDQ7kHjEO/yfX81ydLjAIP6XzgiemFK1xdGSzmeSLn8XO1b+DVNJqMeVMqGQPfAs+6EfG66YP3reX/naG64qZ8mgN/XLc56EZ+fqNqeZjkRuvZoyllXMQPJx43WvOIvBd0ASTmhqQ6rdTcV1TcLMGe4t8DROAjBBchXMMTSojvnx8oJz8VLJCjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 03:27:23 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::81d3:8eb1:c91b:61c3]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::81d3:8eb1:c91b:61c3%2]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 03:27:23 +0000
Message-ID: <a95d8f5c-feec-4703-81d6-7a31f3b0cbd2@intel.com>
Date: Wed, 5 Nov 2025 08:57:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pat: Add subtest to validate
 NO_COMPRESSION flag
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
References: <20251103143027.2882191-2-sanjay.kumar.yadav@intel.com>
 <CH3PR11MB8434E6ADBD3922747C35006E8DC4A@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <CH3PR11MB8434E6ADBD3922747C35006E8DC4A@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::17) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|DM4PR11MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fba5f80-6533-482c-cf1c-08de1c1b3bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2x4d3l5RW4rUFJIRTFicUl2bUs5Z0dDN0RwVDBkVmFVNWpDRVBBUmo1bHNv?=
 =?utf-8?B?eHJwZlI5R1oybG1KMWdQYjJhakErM0JrNERJUzdVaThQMnp1Y0EwM3A0T2cw?=
 =?utf-8?B?c09IMGdQTDlURUVudUJXRjIxRjZreEk3dHUzYkZ1Z1A4anR1SXlpS2xNWFdQ?=
 =?utf-8?B?ZHNrekxRazFWRWJpbm9oR3F5cWhuNFZIVFRtY0x5cGR1TjUrRU5MYzlsVVVQ?=
 =?utf-8?B?cTNpaWxVYUdzVFMzL1dmZWhrVTY0NFZrRW1mVFQxLzdJSzVsS3d0Q0dVMlpD?=
 =?utf-8?B?WlpGdG9KTUgwODdLNHRBRG9kUHJNREYzdWdaa05vVDFKY2VqREcyT1pPWmxs?=
 =?utf-8?B?Q3RRNXRYVGRNcFNWZUdtRjdqUmdLdUdVUWd5MnNKQmQzUVRQR2s2bFVXUzFt?=
 =?utf-8?B?WVRUOHNKZmd4TVpOM3hLblNPVWsrVHVKT3E2QThrOUYwOGo2UnVTUThBc3pM?=
 =?utf-8?B?NXlpTmtydldISFVET1p1eWFhR0xpeVBMQnVpbUg4U0JJdVJOYUVyL1FwZEN6?=
 =?utf-8?B?Ykk3NC9mR00vSUVMMUlrQmFQNzQ4dG5TbGpYVVJLaURIa201Mi9BWlJJM2Yw?=
 =?utf-8?B?eU10d2VBVmt6MCtjUEVOVDMveHhna2pTTW1uVitEVmI0M3dvQnkrNTdhcHZv?=
 =?utf-8?B?SDVlQzRLTzdaazhxQlQ2c2ZyWUdkVVYvUjZQMklBd1o0R0JpUHpaVUt6MDlq?=
 =?utf-8?B?ai9GdXpSaU05dWFPQjlmaTN0S3ZwNmYzZ0JUQ2RKb2NkczhhWkQ1L2IrQm9O?=
 =?utf-8?B?ZjVLUDJYQkFod0dNWmYzdlM5Z3ZrQ1hTblduSG5wT1RzZzhqb1c3d08zbEt3?=
 =?utf-8?B?dnFub3FXVUVpK3UzMkg3T2twOXdxTDFLYW42SHAzYVJ3REpXOFhiWWM3WnBv?=
 =?utf-8?B?cmdDRThBQ0F1S0MvMHVCR2l0dHVXV0dKNWxnV09wT3ptWEp3aXVzVUVZd3ow?=
 =?utf-8?B?M1pYQ3orYW1yRnFHdThkeXY2NnRCVWhtQ0UzeUxWUk1UeTN4aVVMUTNiMVF4?=
 =?utf-8?B?V3JHU0tFd0lWdjN5RDlKNkduc2crTXUzKzgzZUJFeHNYZ0VncjNOK3JyRkxu?=
 =?utf-8?B?elpiMytYME9EenhWVVBhY1JxWElPWWJEL284L2swZDRORG5GZmwwTzMrRFVX?=
 =?utf-8?B?K3VQTUZWS2htWS9ZNk52Nno0bHpUcmkwZW1iY3Y2cnIyeEpNZTlmZFdHbUY1?=
 =?utf-8?B?b0VHdnVISmFiblpLWlhhaDNpa044cFF2R1dwK0xnSXc0NUVaUUlDSTZkbHQw?=
 =?utf-8?B?elpyOXQxQ1c3K1gvT1JxbEh4alN0blFoejV5ZEpoRDFKbXk0ZWlDSVhmU1hE?=
 =?utf-8?B?UlBrWWxrMWNtWlBKZzBRZlJ6NVgrM3l0SVFObkVNOHJuSVhORmNST3VVZnFN?=
 =?utf-8?B?TDZFVm5OQ2o2R0kzWHUyd2FreDZ2TzNKL2p1Y3F6SzdoV3M3WmtMVXdwVS9Q?=
 =?utf-8?B?OHVVOWo3MElWV21NZmR2L2lBczNHZWdIb2x4ZnYvcmFtS0hUdjd3d2xESUEw?=
 =?utf-8?B?M0NUeUNYb3FZdlNzSjZVRUdrYWlDYnEza2tiUHdISU1ZZWVheTNFQkFoZ3Zu?=
 =?utf-8?B?Z2lXbVhIOHVvUzNwVEo2bEJESWJZa09sUnlHRFBraTFXOHFyWnliVG9jeVg3?=
 =?utf-8?B?aVJmZGIwb09KaUVXOE5SY2drT2tuTWNRVXJuZkhmMUw2RmtRYVZhMTlJYnJp?=
 =?utf-8?B?ODlNODB2c05Iek5iejRZdndTazMySWZJcE1KNDZaWlZNT0dWV0lmQmxiT1Rz?=
 =?utf-8?B?T3FyM0dRQUVkQ0lINjZFMGc2QysyMzVndGdRcE5icDBLVFFBRHNMRk5uMVdC?=
 =?utf-8?B?WloxOUdEM0JuOVJ4dDROZUVOZEN1WWpQaFdnYlF3V2MxUVNRUFB6eVhXcVNl?=
 =?utf-8?B?TnduUjhYQ1RyazhKN2VucXNPaEdNNXBlVlNKdEtjSGtKZHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGYrTU9ZUTJ4NjhLa3Y1YmFwSlN5MHVocU9RU1BycW03WTllMTFEd2EvWnhy?=
 =?utf-8?B?VXNieE1SUDdPOGVZbHRkWWZ1RXVwUDZhMXk2aEFLdFBhWFlhQnBOQVQwRWww?=
 =?utf-8?B?Z2FtZTloY3FndGp3OXdScFNvU09JZEJzUGU0Zkx1SzJJa2MyY0VjU2pkRGJy?=
 =?utf-8?B?Rzk5QmV4eVpzaG5uNUFOWTF0WHFmZ3ZuSEpXZDdLYlpjNXZCZnROM2tJWVBh?=
 =?utf-8?B?bU9DcWY4VVZ2MDJvVXprRXlucnMzWkZNWnJmY2tzd2FxS3FteWkvTlJSVVFC?=
 =?utf-8?B?cW51czNHY1hDZDdNUXZNVkkxemZmT1pUN0k3MWJKV1pZR3NzVGVqenpzRHZi?=
 =?utf-8?B?c0dieXVVOWV3ZndtRU5RWUhFd1FWMWFIQ1VYZTJWQm9yUkxRUVViMVJTU0M5?=
 =?utf-8?B?NWpKWi92SGlnaHNoaGt5RlIzY25UczIwTC94Y3BMZzRpS2JudE1aaWtCckNB?=
 =?utf-8?B?bTRkSUdPTVFmM1RCYy84R2d4bU9najYrRUp5YjUyTnFjc05yVzBqOElzb2Uw?=
 =?utf-8?B?U0JOaWNMZzR2aEUxcFpaMmNaRll2Y0dtMHZKcTh2cDFrSEVqdGNLL2VQV0ti?=
 =?utf-8?B?d2VURUxpZXZwb2RzZUcxTG13NVhIeHZGa1k3anBKWnBIZVNQT0hlQVk2OHg1?=
 =?utf-8?B?MXVCeW02cmJobmJrNzdFcktaWDlVU0JPSU9mQ0YrS2JEUDIrVXE3V0w3Q0RI?=
 =?utf-8?B?dHROQlBmVXBWLzJjMlJjWHdvYmdUZGlId3RuaDI5NE1QNTJvM0VGWERSYUVn?=
 =?utf-8?B?dGlSWCtrQ0RDeHBFN1p2ZkZnVG91K3RnRlZURzRsK2x2L1BzZEVHdGd0QzBP?=
 =?utf-8?B?WWhCSUlUa0Q4V0NCdlA3RWFiajJwWlpEcm5ETmxocGJTZjN5a01Yd0xzN3dl?=
 =?utf-8?B?OXlKUEloSGhvQVIzL3hjMWIvZlg4VVBZeW9VVGI3bWMzNFk4bkJaNUZIWmpO?=
 =?utf-8?B?ZWZTcUp5RmtFTTBvaHJZcHFBaEE5NWMzLzJwQlpXdXdDWUVYUlNUNkNkVjVk?=
 =?utf-8?B?QjlPL2lIUUV4a3hrc2hlYnNaWTlHVUgydlYrekUyTlpZZnFoQnAzM2lJSDF5?=
 =?utf-8?B?SFl1VC92SGZjWm0rdVRmY2V4enBsTzgvL1J5ZCtZaElxRVlMNzJjOTFBWmIv?=
 =?utf-8?B?QUNRVU9nL1RJajRXZFpsVk41SDBnTzFieUZGMFBITXFRcUh3N01kVUJZYWF6?=
 =?utf-8?B?WlVxWXdBVFVta2krZW1JSEtYM1RjS2hIZEFoejlPUU54OVpVWFovTUQybHN1?=
 =?utf-8?B?QXVxK3M1Yis4d0ZvY0M5Ym5lNCtNS0NnUUg1bmhkV2EvdEFJTzlkRVZ0VjYr?=
 =?utf-8?B?eXRFa0dxMUJUZW5oSFN5VUxjYjNCUUw4OU92T05Ua3hHQTAvRzRDdWp2WkJr?=
 =?utf-8?B?ZTlaZVBmK1dDZmdSb0hvVWVzMVBDcERtT2RnM1lHR0dyNlFjejZ4NjVoMEpm?=
 =?utf-8?B?M3ppV1BCK3FEOHBFMGUyZVFmSHFkdHdSN2hiWGM3YWhNMlNEZVpIVlpMOVFS?=
 =?utf-8?B?L1lIY0VDSVByeVN4QVJHR3g4b210K0piN3RQcW1aQW1xM1dXK1phdWZ4a1l5?=
 =?utf-8?B?VUlNbDVZR1N2WGM1SEhwK096T3FZRk5ybjZNRE5NaTFIS0RrTFFkbjUycnJB?=
 =?utf-8?B?ZDVvdUxsTVcxUFNjODJtMFZOQmVqN1h2R3NxejhpL3dYeGhNVmVxMGRLby9h?=
 =?utf-8?B?S3hjTEhDYmFiZHlPYkRhTmhSdHB2UmpWRm1KT2JQU1czMTZ5S0wvYk8xYzJQ?=
 =?utf-8?B?dWRUZWg5WVd2S0tFSUJkVDRHRnJlVHYwZHFlTFlGVkM1TFlPRytPbVovR2Vs?=
 =?utf-8?B?MUtSVWdrSjVrSGZ6c2hmMUJidmNzWE5lYVNmOERBcnVqODBBTDJIY0RYU29E?=
 =?utf-8?B?Rm04cC9iQmtRYWZZUnU3eTdqMFFlcm1EaXpSYm93Nk9rT0c5NGoxZlBabFRU?=
 =?utf-8?B?UXdaMi9TS3RrSXJSdjA1bWhIdGxlVExvckVrbzhBWGN6TzQ0Y2d6N3hmUkU4?=
 =?utf-8?B?LzJ5UnpHM2ZLRXdsNW5lVjdhSFJINkRnazdic0VCK1MxUDFOb2JZWVNjY2lR?=
 =?utf-8?B?bnhQVEFvU2RkUUticDRCNGFNSzlXQW1DOWs0Um5kNFFnWStQdkxVRnpwa1dM?=
 =?utf-8?B?azR1ZkNaTWNIRWFSNDFQalJJSWdkNXdkdlVvK1UyTE1kZTV6cFhmemRsNGRN?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fba5f80-6533-482c-cf1c-08de1c1b3bc4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 03:27:23.0670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTUUd0W1SXlszGqkNPIkYNDmObkGt1TIbSJZxNjboiVFp34WFIHnThBA2m0FxjrNwyN57js3eJhKvLQOHXm3OsTA+cYe9C8Se6nDBaT8xLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
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


On 04-11-2025 20:05, Dandamudi, Priyanka wrote:
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sanjay
>> Yadav
>> Sent: 03 November 2025 08:00 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Auld, Matthew <matthew.auld@intel.com>
>> Subject: [PATCH] tests/intel/xe_pat: Add subtest to validate
>> NO_COMPRESSION flag
>>
>> Add bo-comp-disable-bind subtest to verify that a BO created with
>> DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION cannot be bind with a
>> compressed PAT index on Xe2+ (bind should fail with -EINVAL).
>>
>> This ensures the flag works as intended to skip CCS operations and related
>> state management for such BOs.
>>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   .../drm-uapi-experimental/intel_drm_local.h   |  2 +
>>   tests/intel/xe_pat.c                          | 53 +++++++++++++++++++
>>   2 files changed, 55 insertions(+)
>>
>> diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-
>> uapi-experimental/intel_drm_local.h
>> index b48c9e219..fc2aaa462 100644
>> --- a/include/drm-uapi-experimental/intel_drm_local.h
>> +++ b/include/drm-uapi-experimental/intel_drm_local.h
>> @@ -20,6 +20,8 @@ extern "C" {
>>    * clean these up when kernel uapi headers are sync'd.
>>    */
>>
>> +#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION (1 << 3)
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
>> 169405799..5179c63fd 100644
>> --- a/tests/intel/xe_pat.c
>> +++ b/tests/intel/xe_pat.c
>> @@ -785,6 +785,56 @@ static void prime_external_import_coh(void)
>>   	drm_close_driver(fd2);
>>   }
>>
>> +/**
>> + * SUBTEST: bo-comp-disable-bind
>> + * Test category: functionality test
>> + * Description: Validates that binding a BO created with
>> + * the NO_COMPRESSION flag using a compressed PAT index fails
>> + * with -EINVAL on Xe2+ platforms.
>> + */
>> +
>> +static void bo_comp_disable_bind(int fd) {
>> +	size_t size = xe_get_default_alignment(fd);
>> +	uint32_t devid = intel_get_drm_devid(fd);
>> +	uint8_t comp_pat_index, uncomp_pat_index;
>> +	uint32_t vm, bo;
>> +	int ret;
>> +
>> +	ret = __xe_bo_create_caching(fd, 0, size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION,
>> +				     DRM_XE_GEM_CPU_CACHING_WC, &bo);
>> +
>> +	if (ret) {
>> +		igt_assert(intel_graphics_ver(devid) < IP_VER(20, 0));
>> +		igt_assert_eq(ret, -EOPNOTSUPP);
>> +		return;
>> +	}
>> +
>> +	igt_assert(intel_graphics_ver(devid) >= IP_VER(20, 0));
> Code from ret condition and the above assert line can be removed as it can be just checked with igt_require which I mentioned below.
>> +	vm = xe_vm_create(fd, 0, 0);
>> +
>> +	comp_pat_index = intel_get_pat_idx_uc_comp(fd);
>> +	uncomp_pat_index = intel_get_pat_idx_uc(fd);
>> +
>> +	/* Expect failure when binding with compressed PAT index */
>> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>> +				   size, 0, 0, NULL, 0,
>> +				   0, comp_pat_index, 0),
>> +		      -EINVAL);
>> +
>> +	/* Expect success when binding with uncompressed PAT index */
>> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>> +				   size, 0, 0, NULL, 0,
>> +				   0, uncomp_pat_index, 0),
>> +		      0);
>> +	xe_vm_unbind_sync(fd, vm, 0, 0x100000, size);
>> +
>> +	gem_close(fd, bo);
>> +
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>>   /**
>>    * SUBTEST: display-vs-wb-transient
>>    * Test category: functionality test
>> @@ -1451,6 +1501,9 @@ igt_main_args("V", NULL, help_str, opt_handler,
>> NULL)
>>   	igt_subtest("prime-external-import-coh")
>>   		prime_external_import_coh();
>>
>> +	igt_subtest("bo-comp-disable-bind")
> The below condition is enough; test will work for xe2+ platforms else it will skip. No need to write the condition in the function.
> igt_require(intel_graphics_ver(dev_id) >= IP_VER(20,0));
Using igt_require() at the subtest level would simply skip the test on 
pre-Xe2 platforms,
but in this case, we want to explicitly validate rejection behavior. 
Instead of silently skipping,
the test should assert that buffer object creation fails with 
-EOPNOTSUPP if the feature is unsupported.
This ensures the driver correctly rejects CCS disable-bind requests on 
older platforms, and also asserts that the feature is accepted on Xe2+ 
platforms.

Corresponding KMD patch for reference: 
https://patchwork.freedesktop.org/patch/684749/?series=156658&rev=2
Please let me know if am missing something?
>> +		bo_comp_disable_bind(fd);
>> +
>>   	igt_subtest_with_dynamic("pat-index-xelp") {
>>   		igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
>>   		subtest_pat_index_modes_with_regions(fd,
>> xelp_pat_index_modes,
>> --
>> 2.43.0

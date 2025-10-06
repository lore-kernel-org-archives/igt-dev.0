Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D04CCA470
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 05:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD0110E165;
	Mon,  6 Oct 2025 05:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOZTu1bZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE8910E165
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 05:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759729672; x=1791265672;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JSv9fzH/giNOpUt7QIcw6AjCw4tMPpqOxsOpeKCnxYs=;
 b=VOZTu1bZ/aMa1Ov10dWXSX34+gNdJIPfEidwsG/cJ1LWPVUxStKU3Jsu
 Dk+bKZ9tsxZlMEXHg1hIHPpScfEi/fPiG9adpC0mwnO9UXT5HsuoJpa0L
 tSWhRDhkc3xvAkMU89V/mbVMNiucYghx30Gl4WFY2/KtWxUOCsSwouTFv
 de2atcG6t2jYfkbfY2wu/3m4PCaBgR7SuP5yfDSuxJJpv6938M/3/5qaT
 E0sc9zQt6s8BMXbVW35jTxeDZF5rrucbVxryzkg6afiULG9GYM7Dn27rp
 jozTC8rSVXoap5giEU5tncCpyf/KeJqXJW+dvtQ8lTbjsGvw+keNPLezy Q==;
X-CSE-ConnectionGUID: qR3YBU++QXmK1/dJKE0blQ==
X-CSE-MsgGUID: Gxdmj1Q0TrOzGEIAeD74Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61786896"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61786896"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 22:47:51 -0700
X-CSE-ConnectionGUID: bNyAFY9ZTYy3aujXurXtvg==
X-CSE-MsgGUID: yqIdg56ITdSXjuvhtYEb/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179619934"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 22:47:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 22:47:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 5 Oct 2025 22:47:50 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 22:47:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cp9tlBEq19HgIrFHO1v+625E5ijL9sUlRYKGS8JCnyCYl3IS38VM1sOZS9j1qvQzsFu+HWHadGP9rUxkv06l39Pc1asrWnasO/DEzF0KWzDhw0duBKw3WF9oPHPmK1hx1VIQ37aUjDnvZB7rhxhF6gBkaazz4NWi1eD5DuYv+hJdabE05P9dksKby5Wki/k+6T/SelBHM2LRO2fdJPxSYVW0lI7psfqfOgJAcaM5gVXN/pZyvpEDSsnsCM5acEfr81esvTpDIs/TqLjb7mEKVNigoSDsvs2rJXjy4HXvg2obPYoNLEitqincv7Xi0mGRPYFkPlpUyJC/wlFdqj4RJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSv9fzH/giNOpUt7QIcw6AjCw4tMPpqOxsOpeKCnxYs=;
 b=ODhwu7KG7DBciJ8n6SUfz8m8YwY4qB1MjQznopjA445rBcuV7R3YUzOSQwSazXZFxpqmcjZut0S6CQv0I9fmpQW/epRze8K04T1ZZG2Od2xdaXVL6H/ZeLd2jcmrU/893YD2Tk7WdZgyDa6JA2jB8rVcFnV5lzoPXusjJQvtrxrHpQGxcWJ4toyWbX59gLzLTQeg4sYf4l64AF3ffqt66d297+j62I//EV3JwzkzOEuWQdoM35Whh8MMBRE8z7M1uj5Ah1VutK9vXEy/nR9Y5L+KqlWuNw3XWiyixaRTvH6xOmKa3jQKd1V8Q5FO6tmDoDrtaME6yePaFeBFCFEbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ1PR11MB6226.namprd11.prod.outlook.com (2603:10b6:a03:45b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 05:47:30 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 05:47:30 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
Subject: RE: [PATCH v4 i-g-t 4/6] benchmarks/intel_latency:Add
 xe_vm_create_destroy test
Thread-Topic: [PATCH v4 i-g-t 4/6] benchmarks/intel_latency:Add
 xe_vm_create_destroy test
Thread-Index: AQHcJ9R9xnsLjo8WdEeTN505uXhHaLS0uX+Q
Date: Mon, 6 Oct 2025 05:47:30 +0000
Message-ID: <CH3PR11MB843466D1B77B38362B8B4C0F8DE3A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917131003.71762-8-gajendra.uttamchand@intel.com>
 <20250917131003.71762-12-gajendra.uttamchand@intel.com>
In-Reply-To: <20250917131003.71762-12-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ1PR11MB6226:EE_
x-ms-office365-filtering-correlation-id: ae1d1f00-0742-4353-c0e2-08de049bd706
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WFQxa0o2cUFOUVhWbHpCbjlNcWxkYVBlV3IwcUdJWGxXeWtoUmlKbi9oNjc5?=
 =?utf-8?B?aDk1aU9wT2R2WjNIc0tnbm5BNStVdVJFUHlUTE1pVVpxMVBDb2JJcVJQdlE1?=
 =?utf-8?B?Y1JsdllLeUdOcDhJWVBqWnNkdmVZRFc4SWp3WWV5Y3k1NGNjMGQ0VzUxdGNY?=
 =?utf-8?B?TjMvZllYTEZVd2RONmt4MEJOZjlnNnAzU1FuYjJLWXpTUm93dFNIeXFsRVdU?=
 =?utf-8?B?TngyUm9CZW1ZNEtJTExpcER3THFhUDU5cGU2aWh5NW5jcmVZVG90ZkplRTNG?=
 =?utf-8?B?MnZDR3krWXJGQU5YZWFWRTRYWlkvMzczSkloamRUbXQ5Q0VFY1dvOVdvSHVn?=
 =?utf-8?B?ZlI5U3JIcUdZdTdWbVpOakFFTjNycGRKaWdUYXpYR1orSmJsb1NIb05YWEhB?=
 =?utf-8?B?ZVVmdmkwdlBJTzg2d0RqM2syK2wwVjU0YXJ6SGtEMkZyaktRVzdDQVBndks2?=
 =?utf-8?B?aW1JYVU0OVdPa2FKYWFaM0hvR0NpOXRFRDJvMEZWbkJ4S05LWEpkY2dGZHc5?=
 =?utf-8?B?Z2ZkNkk2MXpaN3F6eGU4MG9lUFFwN2dab2Q3Rm1DTmpjSWxvL0dzOE9VY3No?=
 =?utf-8?B?T2wzVGN4RW44OE5oT1FZY2o2bHdyL3QxT05wU2Z6T244aFA5cHphMENuN0hI?=
 =?utf-8?B?bjhKWXBSWXF6eE5oQlVJNnpDM0wrbzkxYUVhRm5iRCtkdDhLSWN2UDE5aGRE?=
 =?utf-8?B?ZGc1YnBLM0tUa1N4ajBTenovdUZDcmhlbERLNHNrdGc5UEJ4c0ttM1BVdUtw?=
 =?utf-8?B?YWNDc0tpV2JCM3hwU3hXN1FyRGFVWTlJQlFUME5rbzRmTVlFODJWZVM0VFBE?=
 =?utf-8?B?R0g0ZjcrdkcwUkhRc3dBVWxFbjJ1TUg4Q0ExUzNjeVNhYXNNNElBTDhpQjhF?=
 =?utf-8?B?elpVVEhhdlZCVmVJU1A2dFl0bWFUS3l4RkdsOEVRTEtmMGZDL2Jyc1RNanQ1?=
 =?utf-8?B?azI1Ri9GdUZ2eFdqcXdpU3NJejY5UE5FOUtyK0ZNalQ0cUZtQjR5ajNoREVz?=
 =?utf-8?B?TWdjRVhVVXJ3WEw4OVVKKzkzaXh4ZlZIVm5GUytpN2tMdjhtSGtiWmxzYU94?=
 =?utf-8?B?NytFODBOR1g0QVhoUGMyb2duY3duRHZLVzNrYU1WQk9qanVuSG9EZlRUc0JX?=
 =?utf-8?B?Y29OVjc3bTJqUllOelpQRDFVci8vMGZ4SFlQOTA0VVdGdGFhYWlWSjd5bXlL?=
 =?utf-8?B?cDVjb3FsbU5sS3FScUdYL0RYU0xTWTNSOGpOWE41UnBUNjlUYlVZTFdaTmo3?=
 =?utf-8?B?UXFhdkJwdjNCZ2R0OGJSeEpUOTkxQW9ML1VnRVpvTnNYT1ZndjhYTk5mWlo3?=
 =?utf-8?B?SzNhblJqZnlPZVJrSndiSWdFVTZjZzBGVGN6OWVxQW1lZ1o3N3QwNzBibHZC?=
 =?utf-8?B?M1lFb205ajdneWUxcGJRWTUzRjV1b0FNcTNXVjBncU0vTmlWVHNiUThFV2VR?=
 =?utf-8?B?cEQvTU94Z2dmNTZNWmJCeVpoWXF4ZDYvK2RVTExBb2N2MGFRMGRSTHA0bnhH?=
 =?utf-8?B?TGhpaXMza1hDL2tJTTNBUUlob0o0MVpGQm15NlNqMmRRMGtCNVQ1cDY1dnBi?=
 =?utf-8?B?VzBRMVFxTkhWK0NoZ2ovTTBUaTgwaFFmbzBHS3RwSkJuRFMvbCt6dnptTElK?=
 =?utf-8?B?aUxaNkRSWmVaMGZjRy9GbGRWaWJlVmFxMVEzanh6SFdKMGh5ZG43UlQ2ZlYz?=
 =?utf-8?B?SUFHOTMvYlE4d29keHdrd3IyeFhBMHUvVWJ0dlg1NmIzQVBSM0lieHNMWTMr?=
 =?utf-8?B?c0lITStjY1lEeXZYL3JDazU4KzYzNDhZOFp0TGV4d3RvdXhaMFFZZVROSmxm?=
 =?utf-8?B?aVlwbS9GbWp2ZGtMSG5VTEdwajdselBpdWVsNUU0QkVVbmFpY3N4RlowQjdJ?=
 =?utf-8?B?SnN0djJ6RlQ2ZlQrNVBlVThialJYOE9kVjFuVkhKVmNOd1I1K3Z6ZjNteVFu?=
 =?utf-8?B?M1pPY3FWQXBVREUzbHVlN2tVNmIxRGdKdTV3alNNT0JsL2swOG1jTXc0YkVI?=
 =?utf-8?B?UzgyUVlLeDg5a1Jkd292bCswci9wZGRTQVllME5kbktoNjl1OE5ja2RWcTEy?=
 =?utf-8?Q?kZpHxd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVh0QXozaWplcVdFTXhoTTdDaytpdVpvdXpmb1JIMU82bm12V0pCS2ppWkdX?=
 =?utf-8?B?ZGk1QTRHTjFrMlc3bHZNNml6Y2JWbFdnaGNpek5kSEhvMTY4U2xkWm1MZ3Jq?=
 =?utf-8?B?bzRsL0lnbk5QbExIUmpBblhHcVBPbHR6My80akZJYk9sUS9YbzFwSFlLZ053?=
 =?utf-8?B?ZDlBVmNnbnJRcU5CVHQ5Y3o3MVZtdUlDSHA2bVl6M29IaURESUtoQU1MdGUr?=
 =?utf-8?B?aTZsUlJvdGtxNytSeXIwNitlamh1UThzL0k1Ky9JZkRBSVFqZ0ZMMmhWR013?=
 =?utf-8?B?N1g2T0xRZzh3d0pNcjYwSi9yeWVBS1I5ZDJwSEJLU25DMnJjVDdzUWNLalpT?=
 =?utf-8?B?bmRFQ3RGSzZJNERUQkRFNXVFdDhKUHp2MHhIVmwwWXNwb1JhakMvWjNOaHVW?=
 =?utf-8?B?aFRlSlZMUlhwb1lEUUZncGN1K0JnQ0t5QU8vMmhnYU1nNFc2U1RlSEpudTlC?=
 =?utf-8?B?STVLa1RzREJPUDBLVmpRL2k0OEhzTDZVMFZ5WFZpSk9VSkhGUERhY1M4cFcx?=
 =?utf-8?B?TVVYN3EzbVRiZVpCZFkrZjlrcWUwTlNacXM4MS9GUGlhVjJVbnJHOVhkeVc4?=
 =?utf-8?B?cVFLYVMzT3pqaTdTQXZjR0RVekZHVmhIRlEwclhac0NIMyt1TU1USHFJa3ly?=
 =?utf-8?B?VnF3dzhtdG5XdzFHWUtKR0kzd1VFS3llSUlmeU96MVNtMVFxVVIzc0JMbkNJ?=
 =?utf-8?B?bTA1RTBwOFZOK0xHYkRIaFpaNG53UktFVVE4NkpOWVp5U3Z4bHBaSExnTTJN?=
 =?utf-8?B?MzRsRnQxR2dWUUw1MmtrVXgvWWQ1R3VOb295UC9tOENGYmJTVkFQY0w5MDNt?=
 =?utf-8?B?ODllN200T2sxcTNxQnQwTEgzcnNBTWV0a3RZajlsYmxrL0xPaHYrOUlzTnFQ?=
 =?utf-8?B?WEg4K3dodStqc0hNNmdMa1Y0MUxzVDlaaEdRT3JzV1B4UVJncTdwdGtVbzcx?=
 =?utf-8?B?V2tsL0ZseEc1LytucjNCYytSbXdBMXRnYWpSZjduMEYxUEZIeVpuN1VBc1Fx?=
 =?utf-8?B?eDFDZjdNc3l5L3lHZnNTTjhldURWWVBoYU9DaVRKK0hWY3YxQ3FHVDBuc2hm?=
 =?utf-8?B?YmYvS2pINFhQQ01taHdiWmJ6eVJVVjh1Z3dWRkR3aW42Z2xpTzRuZkxHZTNn?=
 =?utf-8?B?Q2pZZkJxcmpuZllHVFBKMXB0eklnV0xWSVJNd2NFWm44UUIrZEhJeVZrSXlE?=
 =?utf-8?B?eGs1MGxBUzkxc1IyZkFaOWJWdmtmSTFIKzhTb2tHbXVOMmFXUGJydlVaajJn?=
 =?utf-8?B?c2M2RnA3MUN5NlYvSnpOZXdDcEgrQTFyRUh6TTN2MUlIQWE1OCtCTDhXNVJy?=
 =?utf-8?B?WUE2Nmcrbzgyc0lBNXhzTkUxUEQwK2pNaHljYW8rMnRVTm9XSEltTXlwOFls?=
 =?utf-8?B?QWlwQkYwd0NoNTF2NWd5SU45QVpqcU5reElFUmVSc0xzWEgyOWRhNlNtUmhk?=
 =?utf-8?B?VnFMZlpFaWxwRllJOVUxd1RRbXpPSmx2dWZuNncvRGFOVEhsem5uRDRUcFA3?=
 =?utf-8?B?YWcxeTBFa3VldVAyeDRacktEbmFvMHYxQXZSWkw4MWxPYWFYN2Z2Y2YzTjk0?=
 =?utf-8?B?Sms5NWtCZ2lPamNGTzBZZXNFeE9LYThGNGNDQXJUcXBPN1REakppbWlsTHpo?=
 =?utf-8?B?L0FRRWxDRnhVN3V3bTI4cmwreDFWcXRoU1cyb0d3Y3JRTFcvWHhVWklpaFNL?=
 =?utf-8?B?NmY1S1QwRlBDUW1GRFlZYXMwZzRNK3hFcDRUWjRybis1UGZEdVNMVzZGcHdu?=
 =?utf-8?B?b21oR0pXMXFteGZuZzJ0QVc0NEJieTNQUW43dVJZZTE1c1FjOHFRY0NhY0xt?=
 =?utf-8?B?QVEzaDkvVFhHbWJQS2tHZjZMNmhhdUxzalp2Sk9sT1o4KzhOMnRFVTBudkM4?=
 =?utf-8?B?d0tHN3ZiUFhBcmtLUWhEKzFoNm5ydmJwSnRIb1JoUjJPMlNndGt4RHhhUUQx?=
 =?utf-8?B?NWJ6UjN6NjJhWlZLM3JXQ2xDdE9rOHN2QnNlZmpXV1E4OGhOTU5XSnN2Mm8x?=
 =?utf-8?B?Y2ZrS0NXdnBOYm9KUlIraWRWekRDSHZJVmx4aUdnd0twb3BITHQ0VHdEdVRF?=
 =?utf-8?B?NWZCcms5aFRLU0VXUlVXa1hJeHBxNXBuMzVOWFBLWm43RUJGUnIwVit4MWF1?=
 =?utf-8?B?ZDQ0b2xlaU9pN3VQZmlSR0swL09odDJwMEF2amJQSjdpb2VyMUdldWt5ZDF1?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1d1f00-0742-4353-c0e2-08de049bd706
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 05:47:30.6913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pq1p0FdHyRZCYxZN2mflRBUi9+GRfgIBCqgajQSBHoZSFWzCSp2Ksf9XHxRMnIBxDm+ScPPD3uZPj2qYLG3NJdJvuojkKqC4W7fSTz8gvw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6226
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEdhamVuZHJh
IFV0dGFtY2hhbmQNCj4gU2VudDogMTcgU2VwdGVtYmVyIDIwMjUgMDY6NDAgUE0NCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBVdHRhbWNoYW5kLCBHYWplbmRyYSA8
Z2FqZW5kcmEudXR0YW1jaGFuZEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NCBpLWct
dCA0LzZdIGJlbmNobWFya3MvaW50ZWxfbGF0ZW5jeTpBZGQNCj4geGVfdm1fY3JlYXRlX2Rlc3Ry
b3kgdGVzdA0KPiANCj4gQWRkIFZNIGxpZmVjeWNsZSBwZXJmb3JtYW5jZSBtZWFzdXJlbWVudCB0
ZXN0IGZvciB0aGUgWEUgZHJpdmVyLg0KPiBNZWFzdXJlcyB2aXJ0dWFsIG1lbW9yeSBjb250ZXh0
IGNyZWF0aW9uIGFuZCBkZXN0cnVjdGlvbiBsYXRlbmN5IHRvIGlkZW50aWZ5DQo+IFZNIG1hbmFn
ZW1lbnQgb3ZlcmhlYWQuDQo+IA0KPiBEZWZhdWx0czogYnVmZmVyIHNpemVzIGZyb20gNEtCIHRv
IDhNQiwgMTMgcmVwZXRpdGlvbnMsIDEwMDAgaXRlcmF0aW9ucyBwZXINCj4gcmVwZXRpdGlvbiwg
MiBzZWNvbmRzIHBlciBzYW1wbGUsIHNpbmdsZSBDUFUuDQo+IFBhcmFsbGVsaXNtIGlzIGNvbmZp
Z3VyYWJsZSB2aWEgY29tbWFuZC1saW5lIG9wdGlvbnMuDQo+IA0KPiBDcml0aWNhbCBmb3IgYXBw
bGljYXRpb25zIHdpdGggZnJlcXVlbnQgVk0gY29udGV4dCBzd2l0Y2hpbmcgYW5kIGhlbHBzDQo+
IG9wdGltaXplIG1lbW9yeSBtYW5hZ2VtZW50IHBlcmZvcm1hbmNlIGluIGNvbXBsZXggZ3JhcGhp
Y3MNCj4gYXBwbGljYXRpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2FqZW5kcmEgVXR0YW1j
aGFuZCA8Z2FqZW5kcmEudXR0YW1jaGFuZEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgLi4uL2ludGVs
X2xhdGVuY3kveGVfdm1fY3JlYXRlX2Rlc3Ryb3kuYyAgICAgIHwgMTIyICsrKysrKysrKysrKysr
KysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyMiBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX3ZtX2NyZWF0ZV9kZXN0cm95LmMN
Cj4gDQo+IGRpZmYgLS1naXQgYS9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVfdm1fY3JlYXRl
X2Rlc3Ryb3kuYw0KPiBiL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS94ZV92bV9jcmVhdGVfZGVz
dHJveS5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uMWMwOWI0
OGRjDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hl
X3ZtX2NyZWF0ZV9kZXN0cm95LmMNCj4gQEAgLTAsMCArMSwxMjIgQEANCj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRl
bCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlICJpZ3QuaCINCj4gKyNpbmNs
dWRlICJpZ3Rfc3luY29iai5oIg0KPiArI2luY2x1ZGUgInhlL3hlX2lvY3RsLmgiDQo+ICsjaW5j
bHVkZSAieGUveGVfcXVlcnkuaCINCj4gKw0KPiArI2RlZmluZSBPQkpFQ1RfU0laRSAoMSA8PCAy
MykNCj4gKw0KPiArc3RhdGljIGRvdWJsZSBlbGFwc2VkKGNvbnN0IHN0cnVjdCB0aW1lc3BlYyAq
c3RhcnQsDQo+ICsJCQkgIGNvbnN0IHN0cnVjdCB0aW1lc3BlYyAqZW5kKQ0KPiArew0KPiArCXJl
dHVybiAoZW5kLT50dl9zZWMgLSBzdGFydC0+dHZfc2VjKSArIDFlLTkgKiAoZW5kLT50dl9uc2Vj
IC0NCj4gK3N0YXJ0LT50dl9uc2VjKTsgfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB0ZXN0X3ZtX2Ny
ZWF0ZShpbnQgZmQpDQo+ICt7DQo+ICsJdWludDMyX3Qgdm07DQo+ICsNCj4gKwl2bSA9IHhlX3Zt
X2NyZWF0ZShmZCwgMCwgMCk7DQo+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiArfQ0KPiAr
DQo+ICtpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ICt7DQo+ICsJaW50IGZkID0g
ZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ICsJaW50IHNpemUgPSAwOw0KPiArCWludCBi
dXN5ID0gMDsNCj4gKwlpbnQgcmVwcyA9IDEzOw0KPiArCWludCBuY3B1cyA9IDE7DQo+ICsJaW50
IGMsIG4sIHM7DQo+ICsNCj4gKwl3aGlsZSAoKGMgPSBnZXRvcHQoYXJnYywgYXJndiwgInM6Yjpy
OmYiKSkgIT0gLTEpIHsNCj4gKwkJc3dpdGNoIChjKSB7DQo+ICsJCWNhc2UgJ3MnOg0KPiArCQkJ
c2l6ZSA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ3InOg0K
PiArCQkJcmVwcyA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWlmIChyZXBzIDwgMSkNCj4gKwkJCQly
ZXBzID0gMTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ2YnOg0KPiArCQkJbmNwdXMg
PSBzeXNjb25mKF9TQ19OUFJPQ0VTU09SU19PTkxOKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJ
CWNhc2UgJ2InOg0KPiArCQkJYnVzeSA9IHRydWU7DQo+ICsJCQlicmVhazsNCj4gKw0KYnVzeSBp
cyBub3QgYmVpbmcgdXNlZCBhbnl3aGVyZSwgdGhlbiBubyBuZWVkIG9mIHRoaXMgb3B0aW9uLCBp
dCBjYW4gYmUgcmVtb3ZlZCBhbmQgdXBkYXRlIHRoZSB3aG9sZSBjb2RlIGFjY29yZGluZ2x5Lg0K
PiArCQlkZWZhdWx0Og0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwlpZiAo
c2l6ZSA9PSAwKSB7DQo+ICsJCWZvciAocyA9IDQwOTY7IHMgPD0gIE9CSkVDVF9TSVpFOyBzIDw8
PSAxKSB7DQo+ICsJCQlpZ3Rfc3RhdHNfdCBzdGF0czsNCj4gKw0KPiArCQkJaWd0X3N0YXRzX2lu
aXRfd2l0aF9zaXplKCZzdGF0cywgcmVwcyk7DQo+ICsNCj4gKwkJCWZvciAobiA9IDA7IG4gPCBy
ZXBzOyBuKyspIHsNCj4gKw0KPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiAr
CQkJCXVpbnQ2NF90IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tf
TU9OT1RPTklDLCAmc3RhcnQpOw0KPiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0gMDsgYyA8
IDEwMDA7IGMrKykNCj4gKwkJCQkJCXRlc3Rfdm1fY3JlYXRlKGZkKTsNCj4gKw0KPiArCQkJCQlj
b3VudCArPSBjOw0KPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywNCj4gJmVu
ZCk7DQo+ICsJCQkJfSB3aGlsZSAoZW5kLnR2X3NlYyAtIHN0YXJ0LnR2X3NlYyA8IDIpOw0KPiAr
DQo+ICsJCQkJaWd0X3N0YXRzX3B1c2hfZmxvYXQoJnN0YXRzLCBjb3VudCAvDQo+IGVsYXBzZWQo
JnN0YXJ0LCAmZW5kKSk7DQo+ICsJCQl9DQo+ICsJCQlwcmludGYoIiVmXG4iLCBpZ3Rfc3RhdHNf
Z2V0X3RyaW1lYW4oJnN0YXRzKSk7DQo+ICsJCQlpZ3Rfc3RhdHNfZmluaSgmc3RhdHMpOw0KPiAr
CQl9DQo+ICsJfSBlbHNlIHsNCj4gKwkJZG91YmxlICpzaGFyZWQ7DQo+ICsNCj4gKwkJc2hhcmVk
ID0gbW1hcCgwLCA0MDk2LCBQUk9UX1dSSVRFLCBNQVBfU0hBUkVEIHwNCj4gTUFQX0FOT04sIC0x
LCAwKTsNCj4gKw0KPiArCQlmb3IgKG4gPSAwOyBuIDwgcmVwczsgbisrKSB7DQo+ICsJCQltZW1z
ZXQoc2hhcmVkLCAwLCA0MDk2KTsNCj4gKw0KPiArCQkJaWd0X2ZvcmsoY2hpbGQsIG5jcHVzKSB7
DQo+ICsJCQkJc3RydWN0IHRpbWVzcGVjIHN0YXJ0LCBlbmQ7DQo+ICsJCQkJdWludDY0X3QgY291
bnQgPSAwOw0KPiArDQo+ICsJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZzdGFy
dCk7DQo+ICsJCQkJZG8gew0KPiArCQkJCQlmb3IgKGMgPSAwOyBjIDwgMTAwMDsgYysrKQ0KPiAr
CQkJCQkJdGVzdF92bV9jcmVhdGUoZmQpOw0KPiArDQo+ICsJCQkJCWNvdW50ICs9IGM7DQo+ICsJ
CQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLA0KPiAmZW5kKTsNCj4gKwkJCQl9IHdo
aWxlIChlbmQudHZfc2VjIC0gc3RhcnQudHZfc2VjIDwgMik7DQo+ICsNCj4gKw0KPiArCQkJCXNo
YXJlZFtjaGlsZF0gPSBjb3VudCAvIGVsYXBzZWQoJnN0YXJ0LCAmZW5kKTsNCj4gKwkJCX0NCj4g
KwkJCWlndF93YWl0Y2hpbGRyZW4oKTsNCj4gKw0KPiArCQkJZm9yIChpbnQgY2hpbGQgPSAwOyBj
aGlsZCA8IG5jcHVzOyBjaGlsZCsrKQ0KPiArCQkJCXNoYXJlZFtuY3B1c10gKz0gc2hhcmVkW2No
aWxkXTsNCj4gKw0KPiArCQkJcHJpbnRmKCIlNy4zZlxuIiwgc2hhcmVkW25jcHVzXSk7DQo+ICsJ
CX0NCj4gKwkJbXVubWFwKHNoYXJlZCwgNDA5Nik7DQo+ICsJfQ0KPiArDQo+ICsJY2xvc2UoZmQp
Ow0KPiArCXJldHVybiAwOw0KPiArfQ0KPiAtLQ0KPiAyLjQzLjANCg0K

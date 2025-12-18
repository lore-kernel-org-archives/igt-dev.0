Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6881CD68BC9
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 02:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EFF10E1E6;
	Thu, 18 Dec 2025 02:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Do14J963";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A961210E1E6
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 02:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766025834; x=1797561834;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XhK3DA35sALjBBOQdXUuCDwGhuyCnx/rV2iHgeBaN/A=;
 b=Do14J963VVfP84Lua577OUxkyg2APz2aO9qpafb2Tjz56rpfP1Lltrhd
 stL7kwH4nTxEw4pF+xfsNLysAaInnQfSqa5PvCDO0YEYNKmhXdnl8riRq
 d7Soy8GmDU+NQWDQnk8JTNccyvMxTYZLi7mEOcT9+We3G486Ccmv1hDn1
 RB1cPzmCYODl4zFNhYmgyqekxSbS9QyPfwHSPe++G+NzljLE1hkPTIuF6
 +khQO1lHAzeiV663kzJkT6awEPhpYVrmhjlXYMimVl9wpCdmpzknmyUHl
 k5pAAv1t78yEe9v4fdmWYS5NUR1F8v9Sp+wMvp9hWR+o4UyunSGvuw1zn w==;
X-CSE-ConnectionGUID: uvSRHH7yT4ChfiHrQ/eRzQ==
X-CSE-MsgGUID: qNVk76PJQWGau7fcLKtb9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78686718"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="78686718"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 18:43:53 -0800
X-CSE-ConnectionGUID: 1CjTDhQaRFWczbxajewW9A==
X-CSE-MsgGUID: tGP0lGkvQTmJSgqpxuJjjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="203537441"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 18:43:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 18:43:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 18:43:52 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 18:43:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOHGbf6yogEZgQqYsl1fZUgHwlsoyYCXnCXEmcd/BzcEbRsnF/nAbr7BogBDhPVyTEwhnSkoC/DWxGpv2lIblsiH4ifFoCjZGvocrJSQZ0sj1kZ63eyJgE42kEXjyMHGoB7BUzrasdrA5J/rbECN+i4uvoNcfpFOEryPyiTr9XqjvOs+ohILlDlsVCns1nyPSDKHNh2cmOTQw8rhkpnBdkwdRbDalqtbAuQxatdTZeefSqnc8wxvQuGaXHC8qKAA6x1YDNhHLHF/L2syrNsIE7bLe0Fga8IYKrZpXmln1a0wahU0OOsCPI/l40nvPx5KZMVQ2VYcBaTnX07fUI02+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8xF3mOqpYEjQUAjQseJpptuFhSGbMSKaqUdauakNYM=;
 b=hD9bIX+wvYxX+2fAD6hOiOCw6ZBeYXF4DTikfp4EbpN0yLAHhXeN8oOi19F7aDal7ga/VfHaUvxx0JBz3LgNlA20rdiIiBkeDAbsm8MoSYEHpTaPsmlFDM9/fOKNao+1+DzPG4Fj2f6HdaqPUQdKIGv/enWSJjQHmVcE8lZn1YP/MJHS9A6oxcyjOlFvKSmoZS+JQSANvtt+b0fDIxHlEnBeuTpIMk5BqMiGLnl7GCOGTd2jb6CiqJvqSN1M0tHB8rgBsa83SOhslHm+j8NUUHKhhR8Vd+CerwUw17+QeZxewRQmbIMzeJtI3VSXieoSOQ7FKCb0Oy9PpmNPptY3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 02:43:45 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 02:43:45 +0000
Message-ID: <ec15d0f9-149b-45fb-b499-420d76f1f258@intel.com>
Date: Wed, 17 Dec 2025 18:43:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] lib/intel_pat: read Xe PAT config from debugfs
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20251217080732.266257-1-x.wang@intel.com>
 <20251217080732.266257-2-x.wang@intel.com>
 <20251217191535.GB1180203@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20251217191535.GB1180203@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|BL3PR11MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 877284ac-ede2-46d8-b751-08de3ddf4340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|42112799006|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Si8vNFUrYlRyclJ6RXo4c25GMnEwMlQvRWUzWlhsOUVMOUVsc1NGWUdNaHV5?=
 =?utf-8?B?cUtYY0Vmb0FjMTZDcW1lbG11TGFwazZHT3g3NzV6dURCZkRaWjFPSGNhRXNG?=
 =?utf-8?B?T3cwUTV4YXpETFJKVmRSWUV2dDJMd2Zhek4rZmxzcWh5Sm1ybmxlU21RdDNW?=
 =?utf-8?B?Nld0MWo5bWo2RGVuOHJZVTJqMVVxc2d2ek5sTzREMlZPTUNkbnFadzRZRWlB?=
 =?utf-8?B?THNjLzNSZm5oVVlMcWR1N09RNjVET0owLzZuWXJNempPaTk3cmVYQ2tnWWp4?=
 =?utf-8?B?TDN0WEF5MEtQcFRRMFVMWU1qR3Yvam94andwTGJLUXRPa2dhZ2ZkNUlTejZy?=
 =?utf-8?B?aUtDTEpFYVFCeWFkZ2lJUVZtc1d2MTlGSkx1KzllRmxqN2ZvbHFsUmNjYm5t?=
 =?utf-8?B?SWhCY2poVTUxeDNTRWNaRWQxWm41ZUJyNzVMZU1IZnoxbUFUL3BhcmlyUlE4?=
 =?utf-8?B?ZndTcnplbXdRWjdTSFBTeC8wd0dNVFFCN29xbVZQYUVtNk9ybTdaUkMyOVVm?=
 =?utf-8?B?R1Zma3hjTzRHSWFUK1o5b2NnbCtUU0NNUjF2cHhYNjU5eUY1aG5YSTdsNUpH?=
 =?utf-8?B?UkJodHJSTTl3bytDMlFBRlhpRFBwSGVjUlZjblFqWnFha1EvSHQ1cDJtUHZa?=
 =?utf-8?B?OUdnNFJvaWVPc3dpNXVFMWRUdGEzN0FTaXZyUWhHdG5mVEVxeGNSczlmdkNo?=
 =?utf-8?B?SkFjRUNDekY0L2VtWFlLVXBuWkU3a0ZZMXUxbjZNUUdZcVg0Ykl5SW9BUFFR?=
 =?utf-8?B?WGhnV2xSaW9kbzJPZC9SVHNSc2puN1BZZHNSbFZzWG03azZsNTNYQkJtSG1X?=
 =?utf-8?B?Q3BFWDJRVVV0QlR0WjgyaWlIc0JnTmZLcWY0RWQrRFZONGVjVi9hNDl0QUxZ?=
 =?utf-8?B?N1dmcldad3M4VzB4SmY4a1FwclFNQTBEcnFvWTR1Z1UwelpIT3hzbGN3ZStP?=
 =?utf-8?B?OFN2YVptb2ZTcnBoZUhBN3Y2ZGtDOWJXVis5ZytDUFpGYzNOTHpMWVlXNnVR?=
 =?utf-8?B?OGdTMW11VUNlemZSY1k2OHlVbTI4QkVOLzdCaWtyV3RtdS9PSHczUzA4emtU?=
 =?utf-8?B?YlAzKzBZbUJyWjg0dTZlWHVqaGllM2szcUxQZGtyK09aUnRRWXJZOTB4VldC?=
 =?utf-8?B?b0Y5YUdIQW1yVkVFSFV5ZU1yMitkcDJsaHNhcXp3ZTdDVy9td3gweTRianQ0?=
 =?utf-8?B?ZGZBWkkrVDZIR2FhZGI2ZTFoS0FON0ZpSGM5MCs2YS9zS2VrVkl3aUkrN1FE?=
 =?utf-8?B?cUdySUl6dmxyNVM4aGVUWGpDYlc1VlFBZ0VBVk5RTk5lZzZFMENsMjg3NzBw?=
 =?utf-8?B?MWZuZnU4d21PWEJwS1lKckV6N3FKbHZ1ZitDc2ZvSFYyN1ErWGIxUDBYRUl5?=
 =?utf-8?B?bkRzK09HZnc1S1hmdUgwa1c3ZG1XaTNoQzdXRy9qYWZlSlJRMUtCR1NLZTBh?=
 =?utf-8?B?amw5SHRGWE9TYXF6cFlVdmJEL1JyUzEyQnBOSmVLemIrTDRiZjZIWURoZU9w?=
 =?utf-8?B?NmRHRUlHeUpPV2dSY2lkcUZjajhKeWIzelFtVHlhbnJVd2tSS3h6WlpSWm0v?=
 =?utf-8?B?dDRiNTlGZ2xjcmNhNEhMVUVnVE5RMzJHL0RpWDdvaVYyRHpIYWo3NTFLMXNO?=
 =?utf-8?B?amQralIxTXQ4aE1TdkxYQm9kUmdWbnlWbk1hLy9IRmNvenhNd1B4NzREUFUr?=
 =?utf-8?B?T05ZbFNzYXBwdWNXby82TW5LV3RMbDA3YU0wUU1Xb2xRaktXNERRQU14alNE?=
 =?utf-8?B?STFXQmJCY2x0Rzc5em9mMUdMakRuQWQ1UDFxY3VQM3BjdXQ2SWluSDZjWW5J?=
 =?utf-8?B?em5jOEp0dW82dXlOSlB0eUVHNjRpeHhlSzlPZ0pvMUEyMG9IUHZ5RFA0U3Zh?=
 =?utf-8?B?U1dlRUpDTStDY2tYdXNERm42VFlBNTVEVlU5UkFHdFpET3BYYmFlU0daTWxm?=
 =?utf-8?Q?eptuQM9Ve3yB/NeZdJUX6g648ZXI4XmO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R01hSnRzd3pLMWQzd3FkR3kzdS9HaklzTnpFRjZDWlNsTXhrbXJlMnk3VmFZ?=
 =?utf-8?B?YjRDT25ObFlOelJma29FUUU1OGtrM0cvZjJIamlrb0lrTFVPWHdwcFd6akZP?=
 =?utf-8?B?REZjcVNGUjd4MVlkODkxNXJRd2JXaDlIanhYY2dFQkRBY2xFaGdlaGpiMXpn?=
 =?utf-8?B?L1E5QkxTZjJBUlNDaXQ2NEhObjVtVitMUkRXZWVKVE1uODR4dU9UVjhoc3Vw?=
 =?utf-8?B?RFVzNENnK2VhaXEreUFnQjNlcUNVdlJIcW1rTVZidm9UeldkQ2xBcWFrdllV?=
 =?utf-8?B?UExzRTZZVlhFZHE4alhlUlRZVEFzeVRsOHhxOERFWGFIa3FuUDFYa0xYajNC?=
 =?utf-8?B?NGp3bGI1VXpoS2N6ZXlyNHhtSjVpdjhMQVEzcGRmWGdOdHBaVmp2WHI3b24y?=
 =?utf-8?B?SVVpWWJGc1VWQXY3dHp0M0hPQ3ZpNk5taGZKYzR3eTdxNjUyWVR5aTBmbk1P?=
 =?utf-8?B?MjB3bXE1aEM0MTZJNlorRUJZRWZhVE16ckpmT1ZEMTFoMk1FaDNRSXFrSE5Z?=
 =?utf-8?B?dnJDalZoVzhhRVFjbVJueTJ0b3FmQldtd1RDczJuQU1SNjhybUxycEVYTzUy?=
 =?utf-8?B?WUJDWmora01YbVJKV1p3ZW9vLzVtK1orbnNMaHpyamhnbkpmVzljcWlod1Uy?=
 =?utf-8?B?bTZ2UEJ2M1hxeXJQa0Z2c2hrejAreXlSQUQ4b3h0V2VUZTNqdWpLb0xGNnM5?=
 =?utf-8?B?NEpacWJnbzRPMk92Q1JGOHpJc0ZEWFo5V0ZUeEx5czU4bEdjTlZGdHRFTXg3?=
 =?utf-8?B?WGMrUmZvVjJCbnkzV3lFTkhhUU9wbmZPNmN0aytOY3pVTC9OeFBVZGtFMUdX?=
 =?utf-8?B?ZHkvOVlKelhWd3p1dEhNaEx4OEl0QUVSSGp4V0NDekhuT3h3OXlDRmM0KzZz?=
 =?utf-8?B?dEM2U0k1cjgxQTVPK2hJTmlHTEpObTBRWThOdnFtaGxvMTdTNms0ZWsyL1B0?=
 =?utf-8?B?MVdRQkcyMVpxblpxbXoxYW4zSk5pSGRFK2ZPODkwUVAxdWt1MzlTdmFvUlRF?=
 =?utf-8?B?Z3lBb2RhczZmVHpaU3BTVTVEVlAzUXNxUWg0Y1lpSkRRUmRvSGo2NkVqVTVO?=
 =?utf-8?B?ajRObVlzdFhMRkovaDA4cWFYbDdJK2FQeCtNSEFhWnJpRi9ENDhiOHE1RGtV?=
 =?utf-8?B?VXlmZWhmZE13Ym42ZFNVd1NzNUN1Nk1xZWF3Kzg3cnV0R0dReTd4VnRSaVJH?=
 =?utf-8?B?cFdwLytGK2tCbXNQSjR6cFlTOCtHdWlZTiszKzNNUUVHakR2MkNxMHVqMGda?=
 =?utf-8?B?RVlXUWhxNUdGVTl5T2MrakIrQXNPRmcxRVgyMjlqOWxxOElaaFVnNUZ4Yktv?=
 =?utf-8?B?VEhCQlpBZnp0MUQzTGR1NmRjRm1UOHB1YVFqb2crL2ZnNWxCdFMwVG56enUz?=
 =?utf-8?B?NTdkQU84ZUxjRFYwaXEzK0NCK0RYV2U4Tk12TkhzMGZDc3dGUW5DTk56T2R1?=
 =?utf-8?B?WVV4N3hESGxmYlN0aGVJRE9oSHpmZ1N4OU9ENmtWYW0wYkVjTS9VVkdqc2tG?=
 =?utf-8?B?Q1phY3NYcXpXSlVrbnp2eTJwYTh4bHlMKy93OHBjT1hLd05JT21Pd1g3UHNl?=
 =?utf-8?B?bmxXMEhYVDFNV1M2UTIyWVNPaDZvdTRlY3ZyVDZSVlNabno5Q0ZmQWQrNk04?=
 =?utf-8?B?OERnQkZFRFhhdVNlemdMZlBHd0F3b21UWGplSjVzejIrYnZ2NGU1eXNMckVv?=
 =?utf-8?B?dlBPYzJuemt2cTdJVUV2SDBJZXgwbU5CVW5BR05IR1RyTlJobmZtSm9zb1dX?=
 =?utf-8?B?aEpjSzI4R0RaMUlDbmFDUVhCSnFnUmczU3FYejJGbGRQN0xwM0dQalhVUWZL?=
 =?utf-8?B?M0lNTGVIN0YzWWZ1ZHBIb0hHWTduY2dXeEVYb2VONnVxYXBpbDYyODdSM2s3?=
 =?utf-8?B?akwySjhYbWZEZ0RnNlhidWY5cHE4WVU5SGtDMnlqRy9ValprVkxjTUt1RW9u?=
 =?utf-8?B?aEJBc2YxYmZuai8xUU93VkZlK3Z6SlNHT0UwdVdZVjdGU1FxUVhrY3M3T3lk?=
 =?utf-8?B?VllZWlRleWErblVNZ0d0Vko1OUZhRGozaTVZcWNkK3BxQmEyL0ZocGp6ZGNk?=
 =?utf-8?B?Ry93VDBKa2t0UFBJM1B3ZkIyWndlS0dVTlY4eTBuSmdYeDlwYVlyVTlqbE9Z?=
 =?utf-8?Q?AGvr98vDC1WvPN/WXCAelXe2c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 877284ac-ede2-46d8-b751-08de3ddf4340
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 02:43:44.9665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1PO4GAGrkR9l4t4TPwZJGSVDHsK1X08DHSRJp3tS0en3EAbwTbKu0eiMdQNGZHml26ukJbiup9ej+xjPur8QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
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



On 12/17/2025 11:15, Matt Roper wrote:
> On Wed, Dec 17, 2025 at 08:07:27AM +0000, Xin Wang wrote:
>> Parse the PAT software configuration from gt0/pat_sw_config instead
>> of relying on hard-coded indices.
>>
>> V2: (Kamil)
>> - Show a detailed skip info when opening the debugfs file fails.
>> V3:
>> - Save the Xe PAT software configuration into the xe_dev structure
>>    to prevent scenarios where certain test cases drop root privileges
>>    after execution begins, which could block access to debugfs.
>> V4:
>> - Cache the parsed PAT table the first time we read pat_sw_config
>>    and reuse it for subsequent calls. This avoids repeated debugfs
>>    opens (and failures) in tests that drop root between steps, while
>>    still returning the correct PAT layout.
>> V5:
>> - Make PAT debugfs parsing lazy: avoid requiring debugfs from
>>    xe_device_get(), so tests that don't need PAT won't be skipped.
>> - If PAT info isn't available at device init, keep pat_sw_config empty
>>    and only require debugfs when PAT indices are requested.
>> - Add xe_get_pat_entries() helper to expose the parsed PAT entry table.
>>
>> CC: Shuicheng Lin <shuicheng.lin@intel.com>
>> CC: Kamil Konieczny <kamil.konieczny@intel.com>
>> CC: Matt Roper <matthew.d.roper@intel.com>
>> CC: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   lib/intel_pat.c   | 140 ++++++++++++++++++++++++++++++++++++++--------
>>   lib/intel_pat.h   |  21 +++++++
>>   lib/xe/xe_query.c |   6 ++
>>   lib/xe/xe_query.h |   4 ++
>>   4 files changed, 148 insertions(+), 23 deletions(-)
>>
>> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
>> index e3588110a..46f6cd884 100644
>> --- a/lib/intel_pat.c
>> +++ b/lib/intel_pat.c
>> @@ -3,37 +3,118 @@
>>    * Copyright © 2023 Intel Corporation
>>    */
>>   
>> +#include "igt.h"
>>   #include "intel_pat.h"
>> +#include "xe/xe_query.h"
>> +
>> +/**
>> + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
>> + * from debugfs
>> + *
>> + * @drm_fd: DRM device fd to use with igt_debugfs_open
>> + * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
>> + *
>> + * Returns: The number of PAT entries successfully read on success, or a negative error
>> + *          code on failure (-ENOENT if debugfs is missing, -errno otherwise)
>> + */
>> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
>> +{
>> +	char *line = NULL;
>> +	size_t line_len = 0;
>> +	ssize_t nread;
>> +	int32_t parsed = 0;
>> +	int dbgfs_fd;
>> +	FILE *dbgfs_file = NULL;
>> +	static __thread struct intel_pat_cache cached_pat;
>> +
>> +	/* Return cached value if already read for this thread */
>> +	if (cached_pat.max_index != 0) {
>> +		*xe_pat_cache = cached_pat;
>> +		return cached_pat.max_index + 1;
>> +	}
> I'm not sure we really need to worry about caching the results here.  Is
> this getting re-called repeatedly in a single test to the point where
> it's creating a real performance problem for our tests?  If not, we can
> probably just keep it simple and re-read the debugfs if this function
> gets called multiple times.
The main reason for caching in xe_get_pat_sw_config() is not 
performance, but
correctness in the presence of privilege changes. In

igt@xe_oa@unprivileged-single-ctx-counters
igt@xe_oa@mmio-triggered-reports
igt@xe_oa@mmio-triggered-reports-read

these tests drop root privileges mid-run; after that, accessing debugfs can
legitimately fail, and without caching the PAT layout we can end up 
re-parsing
(or failing to parse) the table later in the same test run even though 
it was
available earlier.

My current approach is a compromise with some trade-offs.

On the first open of the device fd, we try to read pat_sw_config from 
debugfs
once and cache the parsed result in the xe_dev structure. After that, we try
to rely on the cached xe_dev from cache.map rather than reopening and 
reparsing
the debugfs file repeatedly.

However, if a test doesn’t actually use the PAT table (or is running on a
kernel that doesn’t expose/support pat_sw_config), then forcing a hard 
failure
during xe_device_get() would be unnecessary and could cause unrelated tests
to abort/skip. To avoid that, I changed the logic in xe_device_get() to only
attempt to read the PAT config and tolerate failure there. We only report
an error later, when a test actually calls intel_get_pat_idx() (i.e., when
PAT information is truly needed).
> I think we should really try to minimize / eliminate the whole "use a
> static variable as a cached result" pattern.  It leads to inconsistency
> (and possibly mistakes) when we implicitly cache some types of lookups
> that IGT libraries do, but not others.  And honestly using static
> variables this way just feels kind of hacky.  I think needing to add
> implicit caches like this is really more a signal that the function
> interface we're using isn't very good and could use some refactoring.
> For example for the PAT stuff, we currently have a bunch of API's that
> take a device (fd) as a parameter and return one little piece of
> information.  If we want to improve that and eliminate redundant
> querying/parsing, it would be better to recognize that if a test/tool is
> working with PAT in the first place, it's likely to need several pieces
> of PAT information and define our library API accordingly.
Regarding the “static variable as a cached result” pattern: I agree it’s 
not ideal.
Longer-term, we should move toward a more natural API where callers 
fetch the PAT
table once (or xe_dev provides an explicit “ensure/prefetch PAT” helper) 
and then
query UC/WB/WT/etc from that in-memory table. I can follow up with such 
an API
refactor; for this series I tried to keep the change minimal while 
fixing the
privilege-drop correctness issue.


> For example, if a test wants to get the UC, WB, and WT PAT indices,
> today it does something like
>
>          pat_uc = intel_get_pat_idx_uc(fd);
>          pat_wb = intel_get_pat_idx_wb(fd);
>          pat_wt = intel_get_pat_idx_wt(fd);
>
> which triggers three separate debugfs open+parse operations unless we do
> some implicit caching inside the PAT library.  I think it would be
> better to just redefine the library interface to something more natural
> like:
>
>          pat_table = xe_get_pat_sw_config(fd);
>          if (!pat_table)
>                  // error
>
>          pat_uc = intel_get_pat_idx_uc(pat_table);
>          pat_wb = intel_get_pat_idx_uc(pat_table);
>          pat_wt = intel_get_pat_idx_uc(pat_table);
>
>          free(pat_table);
>
> so that the data is only queried once, and then the caller is empowered
> to manage its lifetime and do further caching (e.g., stashing the whole
> table in a 'struct xe_device') as it sees fit.
>
>
> Matt
>
>>   
>> -#include "igt.h"
>> +	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
>> +	if (dbgfs_fd < 0)
>> +		return -ENOENT;
>> +	dbgfs_file = fdopen(dbgfs_fd, "r");
>> +	if (!dbgfs_file) {
>> +		close(dbgfs_fd);
>> +		return -errno;
>> +	}
>>   
>> -struct intel_pat_cache {
>> -	uint8_t uc; /* UC + COH_NONE */
>> -	uint8_t wt; /* WT + COH_NONE */
>> -	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
>> -	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
>> -	uint8_t max_index;
>> -};
>> +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
>> +	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
>> +		uint32_t value = 0;
>> +		char *p = NULL;
>> +
>> +		/* Expect patterns like: PAT[ 0] = [ 0, 0, 0, 0, 0 ]  (     0x0) */
>> +		if (strncmp(line, "PAT[", 4) == 0) {
>> +			bool is_reserved;
>> +			p = strstr(line, "(");
>> +			if (p && sscanf(p, "(%x", &value) == 1) {
>> +				if (parsed < XE_PAT_MAX_ENTRIES) {
>> +					is_reserved = strchr(line, '*') != NULL;
>> +					xe_pat_cache->entries[parsed].pat = value;
>> +					xe_pat_cache->entries[parsed].rsvd = is_reserved;
>> +					xe_pat_cache->max_index = parsed;
>> +					parsed++;
>> +
>> +					igt_debug("Parsed PAT entry %d: 0x%08x%s\n",
>> +						  parsed - 1, value,
>> +						  is_reserved ? " (reserved)" : "");
>> +				} else {
>> +					igt_warn("Too many PAT entries, line ignored: %s\n", line);
>> +				}
>> +			} else {
>> +				igt_warn("Failed to parse PAT entry line: %s\n", line);
>> +			}
>> +		} else if (strncmp(line, "PAT_MODE", 8) == 0) {
>> +			p = strstr(line, "(");
>> +			if (p && sscanf(p, "(%x", &value) == 1)
>> +				xe_pat_cache->pat_mode = value;
>> +		} else if (strncmp(line, "PAT_ATS", 7) == 0) {
>> +			p = strstr(line, "(");
>> +			if (p && sscanf(p, "(%x", &value) == 1)
>> +				xe_pat_cache->pat_ats = value;
>> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) == 0) {
>> +			p = strstr(line, "=");
>> +			if (p && sscanf(p, "= %d", &value) == 1)
>> +				xe_pat_cache->uc = value;
>> +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) == 0) {
>> +			p = strstr(line, "=");
>> +			if (p && sscanf(p, "= %d", &value) == 1)
>> +				xe_pat_cache->wt = value;
>> +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) == 0) {
>> +			p = strstr(line, "=");
>> +			if (p && sscanf(p, "= %d", &value) == 1)
>> +				xe_pat_cache->wb = value;
>> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE_COMPRESSION]", 28) == 0) {
>> +			p = strstr(line, "=");
>> +			if (p && sscanf(p, "= %d", &value) == 1)
>> +				xe_pat_cache->uc_comp = value;
>> +		}
>> +	}
>> +
>> +	free(line);
>> +	fclose(dbgfs_file);
>> +	cached_pat = *xe_pat_cache;
>> +
>> +	return parsed;
>> +}
>>   
>>   static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>>   {
>>   	uint16_t dev_id = intel_get_drm_devid(fd);
>>   
>> -	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
>> -		pat->uc = 3;
>> -		pat->wb = 2;
>> -		pat->max_index = 31;
>> -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
>> -		   intel_get_device_info(dev_id)->graphics_ver == 20) {
>> -		pat->uc = 3;
>> -		pat->wt = 15; /* Compressed + WB-transient */
>> -		pat->wb = 2;
>> -		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
>> -		pat->max_index = 31;
>> -
>> -		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> '> -		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
>> -			pat->max_index -= 4;
>> +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
>> +		struct xe_device *xe_dev = xe_device_get(fd);
>> +		memcpy(pat, &xe_dev->pat_sw_config, sizeof(*pat));
>> +		if (pat->max_index == 0) {
>> +			/* If PAT info is not available, try to read it now */
>> +			igt_require_f(xe_get_pat_sw_config(fd, pat) > 0,
>> +				      "Unable to open the pat_sw_config file in debugfs.\n");
>> +			memcpy(&xe_dev->pat_sw_config, pat, sizeof(*pat));
>> +		}
In the next revision I’ll simplify this block to only fetch/require the PAT
config into xe_dev->pat_sw_config when needed, and then do a single 
memcpy()
into the caller’s pat:

         if (xe_dev->pat_sw_config.max_index == 0) {
             igt_require_f(xe_get_pat_sw_config(fd, 
&xe_dev->pat_sw_config) > 0,
                           "Unable to open the pat_sw_config file in 
debugfs.\n");
         }
         memcpy(pat, &xe_dev->pat_sw_config, sizeof(*pat));

This keeps the same lazy behavior (no hard dependency during 
xe_device_get()),
while making the flow clearer and avoiding the redundant memcpy().

Xin
>>   	} else if (IS_METEORLAKE(dev_id)) {
>>   		pat->uc = 2;
>>   		pat->wt = 1;
>> @@ -96,3 +177,16 @@ uint8_t intel_get_pat_idx_wb(int fd)
>>   	intel_get_pat_idx(fd, &pat);
>>   	return pat.wb;
>>   }
>> +
>> +uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry)
>> +{
>> +	struct intel_pat_cache pat = {};
>> +	uint8_t max_index;
>> +
>> +	intel_get_pat_idx(drm_fd, &pat);
>> +	max_index = pat.max_index;
>> +
>> +	memcpy(entry, pat.entries, (max_index + 1) * sizeof(*entry));
>> +
>> +	return max_index + 1;
>> +}
>> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
>> index eb48cbc65..48ee10c0e 100644
>> --- a/lib/intel_pat.h
>> +++ b/lib/intel_pat.h
>> @@ -6,9 +6,27 @@
>>   #ifndef INTEL_PAT_H
>>   #define INTEL_PAT_H
>>   
>> +#include <stdbool.h>
>>   #include <stdint.h>
>>   
>>   #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
>> +#define XE_PAT_MAX_ENTRIES 32
>> +
>> +struct xe_pat_entry {
>> +	uint32_t pat;
>> +	bool rsvd;
>> +};
>> +
>> +struct intel_pat_cache {
>> +	uint8_t uc; /* UC + COH_NONE */
>> +	uint8_t wt; /* WT + COH_NONE */
>> +	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
>> +	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
>> +	uint8_t max_index;
>> +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
>> +	uint32_t pat_mode;
>> +	uint32_t pat_ats;
>> +};
>>   
>>   uint8_t intel_get_max_pat_index(int fd);
>>   
>> @@ -18,4 +36,7 @@ uint8_t intel_get_pat_idx_wb(int fd);
>>   
>>   uint8_t intel_get_pat_idx_uc_comp(int fd);
>>   
>> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
>> +uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry);
>> +
>>   #endif /* INTEL_PAT_H */
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index 981d76948..a456aa44e 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -299,6 +299,12 @@ struct xe_device *xe_device_get(int fd)
>>   	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>>   	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
>>   
>> +	/* Populate PAT software configuration */
>> +	if (xe_get_pat_sw_config(fd, &xe_dev->pat_sw_config) < 0) {
>> +		/* If PAT info is not available, zero it out */
>> +		memset(&xe_dev->pat_sw_config, 0, sizeof(xe_dev->pat_sw_config));
>> +	}
>> +
>>   	/* We may get here from multiple threads, use first cached xe_dev */
>>   	pthread_mutex_lock(&cache.cache_mutex);
>>   	prev = find_in_cache_unlocked(fd);
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> index d7a9f95f9..12cae99d9 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -12,6 +12,7 @@
>>   #include <stdint.h>
>>   #include <xe_drm.h>
>>   
>> +#include "intel_pat.h"
>>   #include "igt_aux.h"
>>   #include "igt_list.h"
>>   #include "igt_sizes.h"
>> @@ -74,6 +75,9 @@ struct xe_device {
>>   
>>   	/** @dev_id: Device id of xe device */
>>   	uint16_t dev_id;
>> +
>> +	/** @pat_sw_config: Xe PAT software configuration */
>> +	struct intel_pat_cache pat_sw_config;
>>   };
>>   
>>   #define xe_for_each_engine(__fd, __hwe) \
>> -- 
>> 2.43.0
>>


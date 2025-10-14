Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37C4CCD190
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 18:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A8010E67C;
	Tue, 14 Oct 2025 18:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7aVvhYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B95A10E67E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760466866; x=1792002866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tFnzRpsYx1tvZ+t/BvfD1xRAq4pwVKuGfS+PoKg//+4=;
 b=G7aVvhYSx5dcbOPQQ3DuaNJrZeCHcKIHsEnI0IfcIo03VZ/0SX38ZjcZ
 vSQB4eihcY6a0NS16kBsB/H+AF0xIIZD6P3Mt4I3Hqek2lVBNHQikzDr3
 fgwHx/T4y4cOGmFAHG8y8eUrZ1TCHbfuCbTyaQUnVUIgZ6N8ssThkin1R
 fL5MQMvYyMLdlGZPyIQmYKmJtYFzLmw5hNRTdWsrXIBmC2rQWJjMoGUsM
 dG/o2HniBoSP0QUadDwiPVTAGWdBoto6Eb/+If+SMLpQoLH0/0Cc/5aKm
 VgI1uAp/IZptYRyfu7ncva0zVpW46tW+UVPZAlSUB4TJG2qjk01UpOwri g==;
X-CSE-ConnectionGUID: p55xGqy/Sli3VwUWosEJ/g==
X-CSE-MsgGUID: O0Y2osRLSPatur4bpHfxMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73738080"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="73738080"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:34:23 -0700
X-CSE-ConnectionGUID: cbxKknjCTWW7qX2156O3QQ==
X-CSE-MsgGUID: JtXPDWF9QCOU/0bVZyLIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="182742124"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:34:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:34:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 11:34:19 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:34:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVJS2IAm1xqk1D0eArn85cN31+tbwYdPpJs3sNhtjscyWsjJTBdiYkpxOL5KzStmfOVZgpt+R2mAOrQ1NzpNJuKQFS0ZehzN/upM0W3EQ6jqa2rbtzycPbk3EIDr2VzI4gx6y+N1vDtvjZFVZeaX962gzHE9P1G1fbhXIxunGLpUYAe3Jzd9oiV3I+1HFjEZpA2zsW+DBcxjRNa10SRLE/NAebZn/DmIwNYq3osRExIodBEvlJmqn2g6pheAgKNdOBi5I6xQZtdWUmUXgfQimJuPif+uq//973yIUeWYutcCdgfZgN9pd0aOlCDYAJoi1dbs1T6ZCkX3jBQsluYQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q48Wd1JeWzoDgokBdQvQZtRAjgFMiX26ebU2FSoxBTE=;
 b=vMUqbj1CyKVe00oN3OAw13VDKUc5iVhAgvvNW5mpZwLcaKVkKLGDiKbDCd4G9X2Xygw8Zshw981OVYZeyH95LcVKY9BXqGtTCXSeU+GFY/PczCVITUk/IKIMINUkLjPhBhNwR35+9/tgzXn3LbD+b9vgbAkuNXdgAonMjHl98wlpYYC2RUybvvURtoqVmuxMMFmQXsOkA6BHfZOIosqCGdmXMVE1rVj8fPAj5mY9L/tV8NwOruCFk+jNs3Xww8HxQMXwR9i/8lYdNw5FONC5Hv4yEAEp4a4YW5gGha6kGTJiN8QUnD4DLSgWl1PF0Aj/9JNFYht5cjuBQeVrT1psQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 18:34:16 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 18:34:15 +0000
Message-ID: <a277fb42-da44-450d-8ff6-7fcc681c4120@intel.com>
Date: Wed, 15 Oct 2025 00:04:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Check DSC slices for force
 ultra joiner
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>
References: <20250925110913.430704-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250925110913.430704-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH0PR11MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0b84e7-1de9-46e3-0a0d-08de0b50473b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEZzb1c5dytQRUhiTENkOXRpd25HWkxUbGlLR3VZL1JwbUM4aWE1WkNDdFNr?=
 =?utf-8?B?bDVsUmdoam9pb1NvUXYydkttb0hXY0lLZjNHaEFuZkxDdHdwbnEvSHYyR3Vs?=
 =?utf-8?B?dVl5UDZkQnptSjFrNUVaVmxLMHhLUE5RSlBLNjAyV09ab1JXVStRMnN4WFJ4?=
 =?utf-8?B?SS9KZlByZVZWbHVCemphRmVTVlR4eXhQZklObFVGU3U0cGpsRHdrdGxNeFVz?=
 =?utf-8?B?M1NZOFpBS3NPSkhWbVg4ZkltdmQxT2dvTXZDM1ZGSnBlVVVCVzAvWmhFaEVH?=
 =?utf-8?B?NGxXdWlNdDZIeW5ONkVEQlRyTG1jTCtTQlVlR2NMKzBzazBzbFhhRWdtQXV6?=
 =?utf-8?B?WjNvTUMrVS90Zkl5RUlJb3ZveXB6T1VHSHJIaE1xUFFmQlVnVlhYZEQrYzFv?=
 =?utf-8?B?NG85YkRLc2VIZ1YrU2psQWprVUlsUmgzMDFCZHI2RUY1QVpGbFI1bTYxOGx5?=
 =?utf-8?B?Q3dTVkdjV0RCbWhiY1J2K2Q0VzNpNnF5Q2kwaXVwNGoyRG5CKytJSHJwKzcy?=
 =?utf-8?B?d3V4MHJWQ2dzb3FKZThRZU1SY0JjNmllcVNiZmlhYkFQSzVuUnkvck9GS0xh?=
 =?utf-8?B?S3BzSHo2NXFQT1d3c210KzJ4Q2VqNkNJeE9pY1FhTzZGZ2ZnZFd4bXNDNXJ2?=
 =?utf-8?B?SG9OeVFJUkdXNHpvQ0FjelFyTVNtWU9HcWNpSEtWRitWYnpWRmxkUHJVQkNU?=
 =?utf-8?B?MFpIU0kxcGpDMU01M0ZhTXVvMnVvQkhybTYrT0dhYURoNmorN3ZIdWVEbHor?=
 =?utf-8?B?cE1GOE9ob3l1OHg0clFYU0Ztcmg5azEzUytwZDh0UFhZaHdFT0hBdFNSMFdI?=
 =?utf-8?B?UGpGRWljU0UzU2o3VkkrZXN5QllhNTJHaFM5UWtuNmgva0N3ZDQ4L3JpblF0?=
 =?utf-8?B?TXJobVVzK2liRjI2QWw3aGlNbEJleGh4eEdqcC9EdjYySE41aVB6dVMzVUVq?=
 =?utf-8?B?T1pBdUpkMy84YTFKTWYvajZBdW1md3hJRTJmdnNNZTlMUTc3OFEzTGtKbDc3?=
 =?utf-8?B?WEdoczZCeVlWV3Ywb05qSUtpN3lPcjdIRWtUSVJUM3FHNkVkN3JWays4cFVn?=
 =?utf-8?B?SVVIcTRyVmJxeWdvSE96YXgxVDA0TUd2ZUFlSmlsWElLaGQ4cWtGQzlkbFg5?=
 =?utf-8?B?bFhQaXJLVEttbXVReEhJS1YzTExrZHFabnlOY1kzbHFlc1dUcDhhc0dmTXFD?=
 =?utf-8?B?ZFNtNHhYaFllbHBhZUt3QmFtKzZ4U1J3cUZSK1B4RTVCelorRXBuSnMwNzQw?=
 =?utf-8?B?TjBQYVpyajZ1MmZHczdjMnpBRmtpdVMwK0VuUDFBQmIxdEsxMkN4S3JYdCtv?=
 =?utf-8?B?Tis1SWpYUzhhQWNON1ZoNDY3S2t3OE0zelU2TXFncDZDNHpqRk5hc0VMRE5t?=
 =?utf-8?B?eS9OOVk3dDhKYlZJejdLT2V5a1NNVHVvTTZZVGtVNGl5bStsd2JOMW10MW9D?=
 =?utf-8?B?bk01aG9PMklqOGxucUJDZWpjejFXT0swZWd0S1VXQmVqSVhwbW9jaXNiUllh?=
 =?utf-8?B?b1M1NHh5Vm4wVlVROEJzQU40TFNZZi9KRitLb3V4ZkNHQkZyVHJJQTlCM0hD?=
 =?utf-8?B?SXZxcW9aUHdOYVdpNkJXLzZ4dEk3L2s3M3RML1JseXFhWmRpTG9oNjBjOWxq?=
 =?utf-8?B?QVdqSFNhcVp6bUFJbE5UaUFSb0E5eU9ZcnlqRWVjV3ZRT0NXWEVJWjdWdmRw?=
 =?utf-8?B?RjRzeEg3VDJaa2dURG5UQk1na1dsbEZrSDdEa1NMcDJwNGl0ODUrak05bjZQ?=
 =?utf-8?B?NVZVK3g0WVhoR2t3T1p2dTJmSDNYalRLeWpBTHlHMVdXb2tpaTE1ZGo5QnNy?=
 =?utf-8?B?MzUva3F3enVjdEFUZmRsNGVIc3gvRW5kVWR6VVJaWThmTUNiMVp5RVFnUFVp?=
 =?utf-8?B?WExBTmpJTU5xRnp0Y2dkTEluZHVJTktFbk9WNlZXUVNZMFI5WVVucitSTXFN?=
 =?utf-8?Q?8P4ciV66X+w+di02bkJaJIdd7HHz9a4C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0haRU1UbFpqSnpZUCtqWFNWMFJEbHZvWkpuclRRSDFhdk9OczU0TFY3WVdl?=
 =?utf-8?B?aWg4bkgycmxFc0tMUXIxVGpXVGhoZzA3aSsxVFNEYVRlMTY1aXRPMmRkbVpB?=
 =?utf-8?B?SlBUY1BpbGw0ay9ZUzI5MmxRQ25pUWFEcnIxMXFWNHFibmlNMTY1NW5FT3hr?=
 =?utf-8?B?ZGVZc2FXaEs0bXFqeUoxTHZyQktYYjRDOTNHZFV5UmZjbWM2NFZmUmNVa3RV?=
 =?utf-8?B?UkJRWnFwMUU4cEM1TUdzaVl5MXNFQWV3TmNNVG1qbHFudHRZSHhHbWIzRkJm?=
 =?utf-8?B?cFZnQTdkNklKR2tCb2VQTVdBVi8rUXNteUR2K1NydkhTZ1dPbjZPRTdvVE96?=
 =?utf-8?B?Z2NhQWFnWkdUYTBDVXlFNXhBSWJLOWF2cU8yREk4RDJCbHlzTEFrRGErbnFK?=
 =?utf-8?B?enhKN2Rkai9sbG50cTRjdVcxRVN3QmdVL1Qyd3c3N1pjY3pVSnZvVlhPNkN0?=
 =?utf-8?B?eGRKT1h2UDJBM0sxRzFheTFlU2REQU1QRUhTVzJGbklYQ0VndFhSbkhQUXRX?=
 =?utf-8?B?eWNacWRLRjNSOWxveFVJZlhtQUNIcmEzcDBkem1tQXZSQW9qcmlzMkxwS2FV?=
 =?utf-8?B?TngrSEdmRm9YR1BQaUN3aFovTVFYdGtRMkZrNDhCRkRaUi9VNEFTRDNqU2h2?=
 =?utf-8?B?VGRDOEEwUkQrN2J1ZDZML1Z0dUduZmcxa2x2UHprTURiSlRNZU0zaUo2WVNv?=
 =?utf-8?B?dW1Tcm5ONTZMaE1CaVQxcGdram15aHRtNmlEd3ZpWFh1dlVrSnA2RktPclVT?=
 =?utf-8?B?VWZXd241aitQNmtnNkE0ZzhiYnJaSHVRV1MrQXhyd0dXVkl1RjNkcGppdUpT?=
 =?utf-8?B?dE93YXNsVDhaWmExT1ZrQ0Q0d3NMa1N5K0hINzZmZUxqWVhFNitIRmlyOTRS?=
 =?utf-8?B?ZUcveHZYYVZFZDZ4TmVWZFZmcDdBcUNselNWaFE1bnl5Q2FHQms5Sm9BQkc1?=
 =?utf-8?B?NDU3RTBvaWhHRHVuaVBUcjdOTFRldlhvdTZLNnp6d0Vxa0lXc09ReGJra3ox?=
 =?utf-8?B?Nkxtb3p3bUw1WU03d2N4SDh3UWxwU0k1V1hGL2IvN3lZT1ZPL2Npc1B3Tmh5?=
 =?utf-8?B?Ty9SQkxqM3RwNndZTTVyekZjMWZoMU5XSURMbUJidGpXSDkrVGhRTUNjYlZB?=
 =?utf-8?B?ZExLTWhLRFJ1dWR5YzdlWk9HNHhhcWloZ2ZBRmRlYVlRZHloM3hIVmZDblAw?=
 =?utf-8?B?SkxQS0lJK1FsTUlGOGJlODdRRktiOVJUUWRPazY3b2tXeVBoRmxtVi9ieXN6?=
 =?utf-8?B?ZnZzRkFCTG5BWUJRaGMxNVQ4RjJFMWY5Uk1xK0lRRmRFck93SWxvUy9VNFdL?=
 =?utf-8?B?aUtXYzg3RVJPdm5NZTA0NkVNQUpwUjY2TGpqSlhzUXJ1Z3dFREtaTGczbXB0?=
 =?utf-8?B?dWkxZEFNTk1Nbk02WjJFazJLOW01Qld4Uko0QW42NHo4bWxtb21GWDlyVWVT?=
 =?utf-8?B?aFBWNTFRb2Iza0dZYmNPaDZ5a1l2aEhIL001WWVFR3VPSFNaSEZuK1g5U1Zn?=
 =?utf-8?B?SnZJa0xST1Z5NjVlMXdvcjVyU3pHdlJ4VWRKQzlLYmhISHlqZWF0eVVWWk9X?=
 =?utf-8?B?bm9mSVNhaWN5ZDk3YlE1UmI5N0VER1dPSkVIVlZnMDZ5cmVsM2p5ZEJzMllX?=
 =?utf-8?B?UVAxbVZVR0dTeUQraFdPb0tEVUJXRHZXVTNVbUNEU1Y2bTFVQVpHYVk0MU1S?=
 =?utf-8?B?K3JUYzFSUjVZaGtQa2duemJmcVd0ZDdBeWUzS1RXZ3l4SE9DQlUwd0ZiZkcr?=
 =?utf-8?B?ZHQreFFqTXFCWS9BbTFXaWRUbzRyTGtYSzg3bHlmazZKN05hUlJWSFZ4Rmkx?=
 =?utf-8?B?bFl6M1dBZ21oRU1LOVlteWdLUDZ5K3ByNytLUUVyRmFWNVJsbjhNRVlaWHdu?=
 =?utf-8?B?RnZtTkdEMmcweWNqWkszUEJqZVVSdFRydStTUlBvaHQ1RlBxL1EzYkwrWEgy?=
 =?utf-8?B?b2dBN29Ha3Rna0crK3V2TFZKK2RzVFVIaDhQTzhXZkFMY1Y2UFQzcG96R0tS?=
 =?utf-8?B?WEQyYzliMSs4WFJ4RTJPYStwNm4rYzhSa1Z3dSt5UXdQKzZSL1YxMVc0THpW?=
 =?utf-8?B?VENNWTBaTElVSDFhTXZsZzd4Y3d4djU3M2UvU29UY2pSd2lwdVk5WFdFY3lt?=
 =?utf-8?B?MEFsOCtDdzZRQ3ljdjBUMG1qby9vcFo0bklvTElpOGMwaHltaDNEeEhML3FK?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0b84e7-1de9-46e3-0a0d-08de0b50473b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 18:34:15.7937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOHGvOkufzzddatpKKvN/0l5DxMYcn+mLtJhiDynfpYaHjl1C3Fj9ILIqPlHEfM8e9KuJ3Y1MrPoEp9bmhGloA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
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

Hi Santosh,

On 25-09-2025 04:39 pm, Santhosh Reddy Guddati wrote:
> Check for DSC slice count before enabling force joiner mode.
> This ensures that force joiner is only applied when the sink
> supports at least 8 DSC slices, preventing invalid commits.
Please add Closes tag for the bug which is getting closed with this patch.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_joiner.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index d1ddbeb60..4cbc03cf3 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -187,16 +187,18 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
>   	bool ultrajoiner_found;
>   	enum pipe pipe;
>   	bool force_joiner_supported;
> +	int dsc_slice_count;
>   
>   	drmModeConnector *connector = output->config.connector;
>   
>   	ultrajoiner_found = ultrajoiner_mode_found(data->drm_fd, connector, max_dotclock, &uj_mode);
>   	force_joiner_supported = igt_has_force_joiner_debugfs(data->drm_fd, output->name) &&
>   				 is_dsc_supported_by_sink(data->drm_fd, output);
Can't we && igt_get_dsc_sink_max_slice_count(data->drm_fd, output->name) 
here directly?
No need of creating local var.
> +	dsc_slice_count = igt_get_dsc_sink_max_slice_count(data->drm_fd, output->name);
>   
>   	if (ultrajoiner_found) {
>   		igt_output_override_mode(output, &uj_mode);
> -	} else if (force_joiner_supported) {
> +	} else if (force_joiner_supported && dsc_slice_count >= 8) {
>   		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
>   							JOINED_PIPES_ULTRA_JOINER);
>   		igt_assert_f(status, "Failed to toggle force joiner\n");


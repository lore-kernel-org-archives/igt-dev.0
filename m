Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10153C30653
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 07:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77D710E051;
	Wed,  3 Jul 2024 07:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPHJ+zYZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF3010E051
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 07:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719992389; x=1751528389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xMoZeT7LJ7fRIe2bLq22emHBvZ8DAfLwL1CnycIHYAg=;
 b=aPHJ+zYZLgbhAkBjneRy4ESsrmEZVn9kZ1D4FvoFaLFQbTiEvDutOt/T
 a+Ot6Qh7cviYWHCQu/ebpJvgno/XN7Umc/yZWzU4MyYGq9kPfN1fwR7BT
 VR8PR0tS0SqN2d8KzLmqdmNcxwRPCoOvUNBOsFmW/a5VLfgDWK7k83t2f
 K85jpqcrtSWk0GeDAwQbEURbu+KNC9ej0TspjOnMV5rfQ42hrMnAMZCR6
 yjWCg8YBWdSjQK8fxUUvHTZESETvAVVhd5Njqhb3PTEuCnDlK7SyAv/rx
 vaezuL19PMM2n8R0FWiBT8NORaBsMOAc67kJfP5wxj3hGVBXh73eDF2kQ Q==;
X-CSE-ConnectionGUID: ZjgpaD7DR/+rzpUNHQl+wA==
X-CSE-MsgGUID: zjLiD7WFTwejzvV5U+8oiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16931040"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="16931040"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 00:39:30 -0700
X-CSE-ConnectionGUID: HDv4PF0+TUa8QhrMveO/fg==
X-CSE-MsgGUID: UBLJcsv0SzS1m+/4TERc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="46588214"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 00:39:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 00:39:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 00:39:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 00:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5/xlwkicZpRS+7sqyCHLNWIiMKWUw5wy2r7ngqHLfVHX7MDJny3wI01WT+qXN4rREKacZS7DZdVqX0f6jbiFfM8DMXPFtf02wSlzWH9bIngbctD1w6iMdVErWmEaPEiLUCdyFQh80c9gPRayZMBwKcdAfXC21P1MkTUa6iP2L8K8xYt3Uane9JbWnMsVrF+Zg3MAim62//t6/VkiTGV0vg0dvVMdlRIhO9nqqf7CARqesGQSWIgIHl8EAWuHHfXKwHR/qNL7ktO+yisQhgpiWKXKZOKAjz3/l4Dfni6WcgXdC3woDMVwiV6PaS22P4RF5B2lzylEXktl3MBM0nNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMoZeT7LJ7fRIe2bLq22emHBvZ8DAfLwL1CnycIHYAg=;
 b=fQcGZRQqJWD9WdE1rNAfLyDJnkPxYSz/MBsPM0vrpqkPKJQRpHb7PwUkf1bfkeOQHzBtkxiZIodgjUjxzBIluIsv4GEC5W6MmYngVmlJ/8K6AYaIK5c06EkhDDk+14tQt0V/gH2lAXhjI4IP7v0H0cMNtQOkAs3uALnAogRfokBMe9izRqHfjllTUhM2rPBRWzxJ0KWdP2jwUkixw28YIogS9HtjVKVr0q9z0vNY4M6PN3XyaJqKb4MLV0UDLui0WoDJKsnAU1V/H2oqYEd0fNUx7OLag3vr1QnP0le4i1X/v4srqL9aitZkKCwRmfel8K7rcQqhe/g3n7o8gP+iNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 07:39:24 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%3]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 07:39:24 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t] tests/xe_intel_bb: Reduce render subtest execution
 time
Thread-Topic: [PATCH i-g-t] tests/xe_intel_bb: Reduce render subtest execution
 time
Thread-Index: AQHazRL1VA+lIcqEFkG6piRvapCgmrHknegA
Date: Wed, 3 Jul 2024 07:39:24 +0000
Message-ID: <IA1PR11MB60974CEC61F0006DEA13067C86DD2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240703063314.252920-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240703063314.252920-1-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|SJ0PR11MB4926:EE_
x-ms-office365-filtering-correlation-id: 43b1d267-65e9-4f15-af86-08dc9b3342b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WmNHRXM0VWRQemVTU2F3SlpsZWdWWWl4MHB5UEV4WWhaTVFZV2RvMGJPUEtN?=
 =?utf-8?B?Q2VxeC9Helg0cktGTW4zRDF5UW1WY0ZNTHZtZWdqQTJmVitKZXRneExvdDJG?=
 =?utf-8?B?MTFGTkkrNjVkR2JUeHR6ZE5SMzZMQWp5Vis1b2hUdjdrOUIvL0xRc28rR2lY?=
 =?utf-8?B?c1l0SHBGbHcrMFAwdjc4VTNEbW1jWFZ1WTVqYURpYi84djZqdEhkandSQzNC?=
 =?utf-8?B?UkdndjlMWHFOMTJUQzY1VWJvcElCdy93aktCS0N0THRoTXQrclFPSXd6NmhI?=
 =?utf-8?B?YTMzSWdiaGErRlpDbGozS0VxUUlLNkg0VTNtSnBXYVozNXVHQWN3Y1gxZkdr?=
 =?utf-8?B?d0EzcDV5eVBPZGxMQTBPZGVPV3VtcGhaS3diV2dhR0pMQVpPNmhLWGx2NUNB?=
 =?utf-8?B?cEtwS0VOcmtoMXlrbTdQeGxkUjgrVzlqU0NjTjBpKytHYjFoMSttRFRiU3k0?=
 =?utf-8?B?bHJtbXVlRythQjNoMWRMSDdKOHZMWExpSGU0MWFrcWhaUlVoanRDYS9tV3c4?=
 =?utf-8?B?WWtZOVVrT3FxRldtbERxazVDVmYxK2ZFQkJ6RHlzTkNKaWUrZTloOVlkTVVm?=
 =?utf-8?B?cXZEOGhkOTlaQkZOQXgyNmxlNm5ZUlJpRGxFQ2puYXNnWGVxYUJQYUVJYWpz?=
 =?utf-8?B?UUF2RkE5NzJFMm9ZMkNPNUhVV2tRVFFHY1c2TkpiRFpybjJSRDcxK2UzUlps?=
 =?utf-8?B?VitoZTQyVWNCaFBwQkxjaEdTOVVGVmQ4RU5NSUhLK0x2M21QMUNzMGFmaUlL?=
 =?utf-8?B?ZlY3Qk5hb3VWd2dBajV5N2dYQld6NFUwYW9BNzhDa01SU2x0NGxUeENCQmtO?=
 =?utf-8?B?ZUFsVllXRzMzNDd5czdHekVNZXNJZUhIVFZwQlI0RnBvSGhqOW96aytIbngv?=
 =?utf-8?B?SWVHMk1lMVhDdDlOMm02R2IyYWpKR1E5YXlWQnZUNnUwRFFDTGdiVGxTQUlX?=
 =?utf-8?B?MEovdHk2K25xbm5PVzZYekNVNHpxek9UMUtJWUxQTzNvOUkrTGlWNm9ZUlhK?=
 =?utf-8?B?ZzFxanRQK3M5YmNmMVd5TXhqdmd6WEpRdzdhMWtpdlpFbldWVmp3QlNoT3lG?=
 =?utf-8?B?V2RIdTh5MSs4WjNYeWtCT2lZeW83ZXp0YUp3SlQwSk0vMDJUbHNIQjFrWTlV?=
 =?utf-8?B?ZWE3YzFBQ3kxclFhL1pLYjl0cGRER3pjWFhkU1NTQTBrakcwVi9LTlRYNHZ6?=
 =?utf-8?B?YnFCVzF6L3R0dk1rMU8zTUpPanhpOW9Fd0lhTnQ5QkxrMFJBWTRwOVRsZnVu?=
 =?utf-8?B?ZUJPREwrcVF4L1pRZ3pGNVU0NDNodkVRL2g4NlFzRUZ0YjZyWGMwakpiVDlk?=
 =?utf-8?B?citESW5rNWRkVnRia0psVU1KQkpoZ3FDRlQxVEloRElFRDBwS05WalNRNjNU?=
 =?utf-8?B?VjFqWEJTMnNjcGtvRUJsTEw5SG1CN2sya29sakhTZXlUYTBXOGJlRXFLS2dw?=
 =?utf-8?B?OHprVVNiR2YxVmFJbk44K2ZNU1ZMT0hIWUpMQ2lsSENJSy95L202V3hFMzNV?=
 =?utf-8?B?T2t0THphL3NRVGtiQTZDb0NwZisrTld1b2RGcDh1c2tFb3l5cFRoN25udVYz?=
 =?utf-8?B?K2orQUhUbHBxd1VuOG5VNkRCaUVKczZwMW94dUJpaFUvVUMvT0lZV1JaZFZT?=
 =?utf-8?B?MWZZYytXdHZTZ3V5ZkE4dHNleTNZRWZFRmNMWXJLcUcyUmd2NGtETThCUi9E?=
 =?utf-8?B?UHZjNUU4MGJoL0dlUFUxS2hnSnN0NTNsQWtKRVRQRzdXRk4wa1puMmJESlo2?=
 =?utf-8?B?M1daaDNIUkhtZlJYWWsrRDJDZEllNkhRYjByRitkcDN4QzFMajR0NStObDVv?=
 =?utf-8?B?QW1jNGplYnZZcUVlRjhJYlNSNm5lZWxmNWNxeUpDTVlTNG5CY3FZUjA3Z0VD?=
 =?utf-8?B?TWhveXVQb3FVV0k2cTNPdnA2dm0xaWdyWHBOVGJacVFNZlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enVDellEYm1UUEZrUHYrSS83eDhobVdBc0pRQW9Rak5oazdpcHdTT21FVi96?=
 =?utf-8?B?TkFCakhQcFptd1EwL2ZKaDlZQ2FERktEQWZUOE1nK2JoVDRjNmlHc2tNL1J4?=
 =?utf-8?B?amhXcWZzWGJzbzFlZ0I5SU5INE5VMU1qRkk4ZjJsMVcvL3R4SmZKb1ZhY3pN?=
 =?utf-8?B?dC9IdXJZQTN4eHhBS2xKQWwzdWc2bkhOT2N2L0o2RWZZdjQ5L2dybzcwMTcy?=
 =?utf-8?B?bHEzQ3Nkb1c1elVLbXlRaWdvSnRucVdRYlpYaU1hbFdJSkF6d055UTRRN2l5?=
 =?utf-8?B?clZWd3k2YzU1TkNlV1VXWWZiRHlpbVhuZVZ6MjNCd1QySGRweHJ3WC9xR1pD?=
 =?utf-8?B?OTlkSHk5Qmd6R2RkUDBZV0RFaS9BU1RlaTJ5L3hGbllQKzk5dnZxQnNHMkhj?=
 =?utf-8?B?WlBwZVBQbDVpbEdlNndmaFNsSlVaNktpVGpUZjAyTDZTaytXSDFKWk5EYWQw?=
 =?utf-8?B?cUhUajRwK09CWXNWZjdKcGYwKy9ERHU0eWx1SS9pZlh6WUI3WHYwc1NZeXNa?=
 =?utf-8?B?cmF1aXRqbUNiU3o0OVk5TllFdkJsVHdNUWE5WXA0elRxZVlZVGd5TGxqMHdi?=
 =?utf-8?B?STVWZTdFb3JXZWpmdkxPMjROZEwrM0p1dk9wK0hOZDNVUEc0OEw0ZVJtTlUy?=
 =?utf-8?B?ZFdBdVV1QmhIdE8zMkVvOVlibkR1MEFVU29EVkFHSXZYUy9aM20yK21jeCt5?=
 =?utf-8?B?emJINWpzQ0dUc1krYXZKb1liV1Q5djJJRmpHQ3FHb1MrOXlyLy9kMVE1eEFH?=
 =?utf-8?B?UWVpb0dDNktxRjNpT241dVdrUmhzRE5UM095NHFWMGlxZ1dUUE9VZzNpSzdH?=
 =?utf-8?B?N1FSL0VXNjJiODhua1F0bnRDOUxsOUlRNDhkNFBhU01XMDh3MytkV3VNUUt3?=
 =?utf-8?B?T2xvQW5ZeTZhU3dpd3htUXRLU2JPTlBvWlRQYTltL1dFOElLMVZmU0xWcXIr?=
 =?utf-8?B?VmhSTnErQkNzWDZiT2thMUxKRVNNMHNHeXhrQXBCMElPejdrZGJOOUx5SlNh?=
 =?utf-8?B?eVkydm1ndWUvcmZqcnVObDR1VzJXcytYSXJsNnJ2dUNpcjZ4NEY4ZzBhRUJT?=
 =?utf-8?B?ZkxZd1BwOVpWNmdQNzF2TDBBU3MwSnU2eE5qT2oyOGxpemJkM3JsVHRHYllK?=
 =?utf-8?B?TkI1cDNoRVU0akRFMzNCWHNMbVd5RUQvVU5vVDg4eU1WTWZzZkdJSHdsVFdZ?=
 =?utf-8?B?MlRwbmJpdWtwMEg5azJQcUM2NlJGWDB5TVduRys1cWVpZkEvcmJJWWhBODdU?=
 =?utf-8?B?NnQxYnB1V2tyRDJSdUtTTGFPV0NhVXFBY0RBd1ZTN3Zyc0NFMGRxQzV6SW5h?=
 =?utf-8?B?Ymw2R0NMMjZGVXp3Lzl0VHg0bmFHbEJ3VE1kVGhPalRiMXVxaEcyT1Fjampk?=
 =?utf-8?B?N3RKTGhTbHY2amNuTmFkVjFUMmcwODFwMUNRN0g5RlBjN0FHckYvNVYvM0VF?=
 =?utf-8?B?dHFrdEpIMzJmZUxxaE5pb0tmSnNIUTFJU0czTmRTMGJzTGhvcTRJOWp6Z2Q2?=
 =?utf-8?B?cU0xN3F4Z3h6TFlxSCtaZDJsU0pyT1A0NlNZVXZ1NTczaCtDUFdrdEFNb3gx?=
 =?utf-8?B?Z1NvcmR0bXE4WFFGV2N1M3RCeUw1S29GTzFRR1VrN3c2dnhNSFBXRnpaaUNS?=
 =?utf-8?B?eCt5TnV5WWhqVVNmU3RHNW55MmhlaCtpK0xyNUU0b2dJUkp4Mk1JK0tZM3dt?=
 =?utf-8?B?TC9QekdQSmFxVVExU2JQVXZ3dHFQQm5EUjJvZmtZTU9URjg5cGRRUEpDbTI0?=
 =?utf-8?B?bkZ4eUF1c1BndFh6RXVuaGtsU05nU1hoRTdaS2l5Rm1wUlVqYTRvZDB3Sksw?=
 =?utf-8?B?MWR1bnRRNURwWUp3NkJlaHUxSXozZTVtSU9vanRKdS85azBrVUQvdkYvZXlZ?=
 =?utf-8?B?YVRqOXRNWnBlNS92L1J3RnZhSmloSk0yMU1JRXNFU3NGbEJDRjFqSFlxWGcy?=
 =?utf-8?B?SEtabklCRlB3MSszSy8xZVdocG1rbVAyaVVCKzBCbkNkSjJUeFNsbk1PRnUr?=
 =?utf-8?B?ZnE4eFJxOGNTd0FPTlZvRWYxbkJxOE5iMG9yditXMlRpenZBaFgzTlR2ZnBy?=
 =?utf-8?B?clh5VjE5VjVMNmJIbnFPVXVyRzBLc0xkeDlaTEtQeUN4WlZzcHFUK1FlN0hy?=
 =?utf-8?B?Um9rRTdwMTd2SWFvVFdFYmxVY3NwVGh2VnlxSllLL3NoOGFyNFFvTENEdU1Y?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b1d267-65e9-4f15-af86-08dc9b3342b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 07:39:24.4106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CmPpeSM1TpgsXJSVhGBL3lLtRum+D1csTG6E5iCNorbDYzS0YFTKFXWQ0OKzJd2gBmdpJjOtZ95wxPwmEoDIt3iT30RdXJr1MSSyNVmALkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4926
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

TEdUTSDwn5iKIExldCdzIGRvIHRoaXMuDQoNCkFja2VkLWJ5OiBLYXRhcnp5bmEgUGllY2llbHNr
YSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPg0KDQpLYXNpYQ0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFpiaWduaWV3IEtlbXBjenluc2tpDQpTZW50OiBX
ZWRuZXNkYXksIEp1bHkgMywgMjAyNCA4OjMzIEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tp
QGludGVsLmNvbT47IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVs
LmNvbT4NClN1YmplY3Q6IFtQQVRDSCBpLWctdF0gdGVzdHMveGVfaW50ZWxfYmI6IFJlZHVjZSBy
ZW5kZXIgc3VidGVzdCBleGVjdXRpb24gdGltZQ0KDQpUZXN0IHhlX2ludGVsX2JiIHZlcmlmaWVz
IGludGVsLWJiIHNvIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBwZXJmb3JtIGxhcmdlIHJlbmRl
ciBvcGVyYXRpb25zIGFzIHRob3NlIGFyZSBjb3ZlcmVkIGluIHhlX3JlbmRlcl9jb3B5IHRlc3Qu
DQpVc2UgMjU2cHggc3VyZmFjZSBmb3IgcmVuZGVyIGluc3RlYWQgNTEyIGFuZCAxMDI0IHB4Lg0K
DQpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenlu
c2tpQGludGVsLmNvbT4NCkNjOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51
eC5pbnRlbC5jb20+DQotLS0NCiB0ZXN0cy9pbnRlbC94ZV9pbnRlbF9iYi5jIHwgMTEgKysrKysr
LS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfaW50ZWxfYmIuYyBiL3Rlc3RzL2ludGVsL3hl
X2ludGVsX2JiLmMgaW5kZXggNWRkNzk0YjE4Ni4uNjQ3ZmQ2NGU3ZSAxMDA2NDQNCi0tLSBhL3Rl
c3RzL2ludGVsL3hlX2ludGVsX2JiLmMNCisrKyBiL3Rlc3RzL2ludGVsL3hlX2ludGVsX2JiLmMN
CkBAIC00MCw2ICs0MCw3IEBADQogI2RlZmluZSBIRUlHSFQJNjQNCiAjZGVmaW5lIFNUUklERQko
V0lEVEggKiA0KQ0KICNkZWZpbmUgU0laRQkoSEVJR0hUICogU1RSSURFKQ0KKyNkZWZpbmUgUkVO
REVSX1dJRFRIIDI1Ng0KIA0KICNkZWZpbmUgQ09MT1JfMDAJMHgwMA0KICNkZWZpbmUgQ09MT1Jf
MzMJMHgzMw0KQEAgLTEwNTQsMTEgKzEwNTUsMTEgQEAgaWd0X21haW5fYXJncygiZHBpYiIsIE5V
TEwsIGhlbHBfc3RyLCBvcHRfaGFuZGxlciwgTlVMTCkNCiAJCQlpZiAoIXJlbmRlcl9zdXBwb3J0
c190aWxpbmcoeGUsIHRpbGluZywgZmFsc2UpKQ0KIAkJCQljb250aW51ZTsNCiANCi0JCQlmb3Ig
KHdpZHRoID0gNTEyOyB3aWR0aCA8PSAxMDI0OyB3aWR0aCArPSA1MTIpDQotCQkJCWlndF9keW5h
bWljX2YoInJlbmRlci0lcy0ldSIsDQotCQkJCQkgICAgICBibHRfdGlsaW5nX25hbWUodGlsaW5n
KSwgd2lkdGgpDQotCQkJCQlyZW5kZXIoYm9wcywgYmx0X3RpbGVfdG9faTkxNV90aWxlKHRpbGlu
ZyksDQotCQkJCQkgICAgICAgd2lkdGgsIHdpZHRoKTsNCisJCQl3aWR0aCA9IFJFTkRFUl9XSURU
SDsNCisJCQlpZ3RfZHluYW1pY19mKCJyZW5kZXItJXMtJXUiLA0KKwkJCQkgICAgICBibHRfdGls
aW5nX25hbWUodGlsaW5nKSwgd2lkdGgpDQorCQkJCXJlbmRlcihib3BzLCBibHRfdGlsZV90b19p
OTE1X3RpbGUodGlsaW5nKSwNCisJCQkJICAgICAgIHdpZHRoLCB3aWR0aCk7DQogCQl9DQogCX0N
CiANCi0tDQoyLjM0LjENCg0K

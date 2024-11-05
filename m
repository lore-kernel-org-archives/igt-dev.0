Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C76AD36108
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 19:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BD110E428;
	Tue,  5 Nov 2024 19:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOIXjkP+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E8310E428
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 19:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730834526; x=1762370526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YXEOiA6PIXlY9AouAnB6kbXXDBjbmpGlKOSBp21xTgc=;
 b=fOIXjkP+yEjQl71dPQ18nqQ9KzNVOqvwz4aZ7VDA/ru1Jfl77lfgGTi8
 mt7vJnvIASTwFqtRmv2/UMo2G51BBzIIMnr0IRWyeoBVXe2g374M2EMuL
 WGu8EVpdb0gbN10Lsi+oZ1Y2bF+dvTIcJXeuqxBAeNaOOp/PuMrUDlxsy
 7Z+fqHNCHHKAwC9bQnQGYA1yRuEj0Ftx4+jTAoYm1CoozU16eZ6thNCZP
 /30HoaBvExXUhSvZ38utgvtiGGEBBtuF4b5Qr3VaKfJTPJ7nM1KqdEyi0
 /qCVBdGTE6vWdLB3jw2zrdjbPrxczs982IGHLIO1e78HylMwkcIRRnvPT Q==;
X-CSE-ConnectionGUID: fD9strWhTIaw9OUq7/IAZw==
X-CSE-MsgGUID: 2IMVVH+aSGeHhKsxcNcyaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34296350"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34296350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 11:22:05 -0800
X-CSE-ConnectionGUID: jLew9C7xQ3yY4ZC7ERpAUQ==
X-CSE-MsgGUID: e13hESk7TfuH66c3C03IoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114936799"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 11:22:05 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 11:22:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 11:22:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 11:22:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCo5PLA3QFrQ+zUrYruZQBXsSB24WyXtSeizA2WVU31pip6wA6COQ0PdBkNf7Q61GVoIkaB/oO6vSOqIvRQ3bnMT/ftIHIydbeOdAvGey67beZQ0bSV62H1NMLqN3JB/AwlEkoa9AAAuyu30Go3L01FnI3gfIT19/ZKlcmKF49ApWrXz4S6OIO1wYGRajGeIx7kJQitfs2I8ePLg6t4txu9PM2rvBE1utZLW6mNWAsWdILWe1zO6SXA/9DbNxDWTqZNQwduQOPIJ1tMgLdUXnrh6eWEuNIzRmrM8neU1pFPda0AkTK8wDSQ2w7V05uO12GOXhRxJrqDskJJLjQ0l+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXEOiA6PIXlY9AouAnB6kbXXDBjbmpGlKOSBp21xTgc=;
 b=VyiJdex7/sDhPlJCjCly7Gub2xHPVwPe8YOIJmwNv6Nt29ElR+04GsA/9nvKT2KWQQjSGVs+FitaDMe6cV8eI5NOS0IpWM7sKcyuRtlyGxe4/BjPv6jwO43hkK1JoraXjVNaKX8xPzN4E+ujFW+okIHz0/9mUXZCEk5MYBDGm8a9LC7OQ+Iga52RKwMxsXPBsPj96gB5zHHa16Kbixbaz5jo3P9av6I2eCGOSsJmhJ+j77BcvuF9K54+XiBHBVQFXGpGcdyolVtpd31Ube/OWgLbXEBYekSE78O1qkvGu/amIcX/fKCdpo6bEqkgaMwc6ZqX/Gk5/NTX/bywnvFhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 19:22:01 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 19:22:01 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 2/2] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Topic: [PATCH v3 2/2] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Index: AQHbL5ovslnPNQXTZk2aDffwLZCP1LKo+ECAgAAWYQA=
Date: Tue, 5 Nov 2024 19:22:01 +0000
Message-ID: <CH0PR11MB544424AB4B9AE151CEDAD74CE5522@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241105154823.66078-1-jonathan.cavitt@intel.com>
 <20241105154823.66078-3-jonathan.cavitt@intel.com>
 <20241105175415.7uy4fxqsenus35pd@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241105175415.7uy4fxqsenus35pd@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB8151:EE_
x-ms-office365-filtering-correlation-id: 43c9a075-c58c-4869-bf73-08dcfdcf1ffc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R2hWTVk2cjBlYlpRdG9sTTFiSjJKUzFhRHZLaTl6V3ZhVDVHeDVXVjVteHd0?=
 =?utf-8?B?TG15U1dRVHAvRWIwUFMxclo2bmc1bDV5L3hGYVhzNjJFd1BGVkIrUWQrZFNr?=
 =?utf-8?B?ZHVJMGlWOUxmeEp3QVVaVHNWYzF3Y2dFMEZiZHQ2UklVTXNEVnB3U3BoNkhl?=
 =?utf-8?B?bnh1WEsvUVMzRDdyLzNQb0pyeHZHNmwxeUFUZ0pVeHhXVzY0RXZ2N1paWktv?=
 =?utf-8?B?NFhuZzdhTXV2Y09aN2hsTzhnTHZGR3hyYzA2MGY2V1ZOV1gvTVZINFQ1TlNw?=
 =?utf-8?B?b2hORlREaWNNYXcrMHdiMUdoaGdHUUlUdzJDRlBFeFFsS09KZ2t0SCtKMVJQ?=
 =?utf-8?B?RXU1RHlLUkdjOFdjMG92cUZvWHRwTEIrVFNKNDRCNHk4TUR6MTJvc1p6MGFz?=
 =?utf-8?B?RmFMcHhCUlVlRlE2YUJON0M5MjgrdXZLdnhRcW1CMXpQek5LdFBHWHRJZXl2?=
 =?utf-8?B?YzJwOGpKY0pONXR4MDJ6TDY0ZkJFOUlyTWVqdG5nUVY5TlF0SmZkdTc0eUYv?=
 =?utf-8?B?NHZKdytuVWZPTzh3QmJHRFQvUWp1cGZSSWU1MXh4dXEwRk1qZUsxelU2eHhj?=
 =?utf-8?B?dE5pUnFSbHJuVWIwTXhkaTJGT3FVU1duKys5b3BwaDl3SlAwMC9XYlMrNkJX?=
 =?utf-8?B?MDYyNmw0NVdxaGpJdlBhVk9INXo0ZXdRUUVkVkRtZWRLYXJSK1I2b3JrYkZo?=
 =?utf-8?B?bEl3cnoyblhKUi9MSFI3cWNmVGZFejRUM0JTbzNyeEFLWHhJemZXQzZZRTU4?=
 =?utf-8?B?c1pGRHhGRkVoZExzU0N6TmpiRlV5MWhDV1pxUXJGbVR2bWtveG44R1V2Nlk5?=
 =?utf-8?B?d3pwdTVJczBlVzM4UC9ZVng0SkRqdHNqazhNSmFEK3JxTG5TUUxPRm5USkpo?=
 =?utf-8?B?eGJHMFNzaTRqK3V5WkNBcVBBZ2ZrME1xN1RGT29kTnZMNlNRU0RRS0puVXJl?=
 =?utf-8?B?RjRVK01UZHE3WWtQYW9OY2pYWmxsU0RlbGJueHFvQml2VjdDNzV4SVI2K0RF?=
 =?utf-8?B?Tk5Yak5JUU5BKzdpU21mUllSTElhcTZ3ZkRhZ3BWbC9yL0tHb1JQL1k0S3l3?=
 =?utf-8?B?bXFZc2lsYUY4a0dkWjJ4MWxPaFNDTnYrMGE1ZHQvUE9GNW5QbTRFbjZpNkFZ?=
 =?utf-8?B?a2lKZUpLTVhnak1uVFNZNldLd1Q2VkNCdysvTEJONTlzNVdHbGJMT1JMejNu?=
 =?utf-8?B?TG5hQUVRN05nWnZxaUNDTFhzdnZnVEdnS3F1UkJPc013L1JiTmtkVHJIb0hV?=
 =?utf-8?B?RTRzd3ZJek9qdXIyNzZjd21Ob2NaTVhPWllHOXdnUzZnK0F4eVZGY1RRVURV?=
 =?utf-8?B?OEkyd1g2T0lGbndEOGp4QzI3MDNWMVQ2SmZoZFh0UzE0MnZyZ0V2QzJrRVpw?=
 =?utf-8?B?anczMFJaT3B2MTBIQ1RrM29zSlkxRmtTVWkzakFzME5YZm5lSUhLby9GNHAy?=
 =?utf-8?B?OE1MM0hnVWxYYnAyTEl0NHl5TmhINitMdkw5QXgzR1l5cmhPdUdCVG03NFcz?=
 =?utf-8?B?aXNqdzlZaTRSOXl2bjAwS1pqL25sV2ZCODczNVk1Wk9jVFg0Rzk5QkI4NmFp?=
 =?utf-8?B?L1NHWFVZZ1lPcHN2akN0VVNJUEpnMFg0aGwwVEVIeVhtaTBzNEE2SjFRY0Yx?=
 =?utf-8?B?UjBEN1VtM0ZraVo3SHNBVGkrU24wb0ltaEJ1Q2lhK1kvRTIrKzVudkVmL1lw?=
 =?utf-8?B?M2Y1UjJ5TVp3WlZZYmRFZ1dUUVlucFNWQTBlTlZxcTRQSVU5R1Rza0owdkRo?=
 =?utf-8?Q?ReuS3v0E0FvGuvkH2bQEpLlWkaydyrHryghwTm0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEhkOW95dVhINWN5MmNYNDFLdFlSWkk1RVplbm4rQXVYVGEzK2o5amoyNUhO?=
 =?utf-8?B?UDVKREl2YjRscmRuMEhMR3BkRENCbWw4R211US9SQWlJZVpDOHdERFdKaWw0?=
 =?utf-8?B?TTBDN3VuSEVmUUkxemZvT2pYYmhmblJzUWlIbHNIUzVPdkFDMlNubjIrQSto?=
 =?utf-8?B?VDFEbElIdFdWdnYxb3E2d1NqT08zVFBjUS9qaG9FK2Q2U0ltczVGcFV6TzBW?=
 =?utf-8?B?NEVJc2xoTTkramVZbGhQMDhuK3hZc3FhbzZwK2lEaFhaRjgxMXFUbmp4WXpu?=
 =?utf-8?B?cTU4VjZJUlBsZm1Ob3Uwa0w5azJOZmNhY3ZXK2Uva0IxVmduRVVnTE1MZXhk?=
 =?utf-8?B?WlZUMk10SjRubmh4bWFrVmdWVkFjekErVjQrU1lUWnFxV2ZzNDJnMElBTVo4?=
 =?utf-8?B?ZU8xZ0FQeTFBMDdTRVY5YUFJS25FS25QcFBjVVhHYlRQU3VTczZpUUs4Q21R?=
 =?utf-8?B?amNPTWpSMFljbGtqM0NmSi9oUDZqdmFoM1VNZXF5OGtrZHMvdk9Lai9OQTRF?=
 =?utf-8?B?REZ4Z2hGdms5eWdjSHJmb0s1cmxsd2NEUzR6aldUT2txTTUzSzcySWZGcFlu?=
 =?utf-8?B?RVhTem1TUkliOUU5emVBSHZGOU9HNnYrdjBXaDY4b2o3bkttNUdYYXVJVzhX?=
 =?utf-8?B?dyt2Q0hjdG1oTHc5U1pJOHU2dTczOXhia3luTkdJU1l6Q1JpN0JISkRrWi9R?=
 =?utf-8?B?WTE1L1NXVUQxWWp6ZHZDR0tadncyemR2ams4aGNKalBuWHpHU0EvanBNREZU?=
 =?utf-8?B?K3FtV2M2MHAzTkc3OHdNYmhibTZiaG45OENkVWdQMHE4T1BwRGk1aXFIV0pt?=
 =?utf-8?B?UUtSb3kySDFNajQ0T09pYVZ0dlp2NUtyRG9abzF2YjhCT1AzcFRWbkxrL2hv?=
 =?utf-8?B?cStLeWZXWHQ2bG9leDJUcFgrTllTSVFyZW0xOWhjSGxwTHB1Q0Q4WWlVUXQw?=
 =?utf-8?B?bkRDMkhnblRXbDErT29wbzZnQ2xGcXFLL0ZMb1d5UmFjUC9ITyt5WHJJbmVN?=
 =?utf-8?B?N1JhQk9LV2xJdkRLT21FbDYwOVN2MUhaTHdJSXpXaVZGSUdtdWEzNHpVZFlP?=
 =?utf-8?B?Qm95Unp3c1lSYVBnNlU3ZUZqOGtadFJETjJGU3BGR3FReVNoZlR0MldCYUZM?=
 =?utf-8?B?M2RQbVhiU3M2b2dUSUt5dkxHYkdKVk1WK05JOTJYUVFCMFRteGxieE5vRVRj?=
 =?utf-8?B?NERaTmN1RXhxemVFNWNjQ3h3SlhPMTNRZWhuUU9VbHFSbURBNElvTnBtR2lG?=
 =?utf-8?B?TzJlalE1Nnc0RlN4L3NpR3NiRGVRaXQ2dmRCWHIyVFJGY09jdTZVWk8vaXUv?=
 =?utf-8?B?Y2JFcGZja3RreFd5ZjV4Qm1uL2JFci9mQU9DRVhMbjhBSG1YTUdtYTVNNUZC?=
 =?utf-8?B?aDdSK1pkRE9mU1pMTXZZMVUwN2hOOEdOQnp1aTdsN04zQlhRUXZWUy9oL0to?=
 =?utf-8?B?TFQ0aE1aZlRyOHdoNjQxRGdmazdDdGtYVS9JZnk4Qm50OUJZQUlqZzZpVVZL?=
 =?utf-8?B?R2NVcUdyZm52SlRNbmtGYWlmWUpnOHpjVnBYWWZLclRSMC9DSkt2NEVMY1NT?=
 =?utf-8?B?ZHArZ1IzZzd2YkZCR3M3SENkRk1Mcm1Fd0NkZUVFUWlUS0dqa1oyZ3BrNFhO?=
 =?utf-8?B?RXJ6Z3UwaThvYy9lOFJ2NElxcys5aElQaWo2WEJFUHZ4UC91eWhGdzJwaGFl?=
 =?utf-8?B?UlN5eWtqRWNrczlKUDg1aXppMU9KUGZmV0l1ZVJJNzlwVWl4RXo0bXBxTWc0?=
 =?utf-8?B?MTJvVE1JKzRrOEdnWDYyTFJrWXFPTDhHWnhEdFl6MFNCTFE1R2UydmhMRzlV?=
 =?utf-8?B?VC9FV1Q3OTFRTnZlbGc0Y0tNVXFqakh6azl5blhGb1NLdkhrbytuNk9aelo0?=
 =?utf-8?B?dnNyenNNcWE0bnNEbHc2dWI1aGZ2SzdkVm1WQzFiSnZidkROV3A5OEw2NCtt?=
 =?utf-8?B?UHEwdUJMMm12NkJrdjhRMmlEQlRRQkdsSW1pVWh2TjArbEprK3Y4T1lVZ1ow?=
 =?utf-8?B?U3RKK1RKQXcvOHRHMHVuaTJrRG0rL0NFcG1QdnFTWW5jeUJkS01IcjRzUFhU?=
 =?utf-8?B?ZzdBY2tWWVlNdjUyQnV0anFZWkVJblJXUGpQRWZQRkFwWUpPK1VsbW5pTHVB?=
 =?utf-8?Q?IzbI9gZggvkMokJO8BhT0qMVG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c9a075-c58c-4869-bf73-08dcfdcf1ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 19:22:01.6248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZytpn+5hwWfcMoWTeKe2aRU1N0ByKJ1zs2BLJNRpsVeoUYiqlIPYY+YOG88wqplA+dQBp2PUqUYesVGF5i9MVgqd6wf+HYhl/C2aEcH8KI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciA1LCAy
MDI0IDk6NTQgQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IENhdml0
dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBHdXB0YSwgc2F1cmFiaGcg
PHNhdXJhYmhnLmd1cHRhQGludGVsLmNvbT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29t
PjsgQmVsZ2F1bWthciwgVmluYXkgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tPg0KU3ViamVj
dDogUmU6IFtQQVRDSCB2MyAyLzJdIHRlc3RzL2ludGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJh
dGlvbjogUmVzdG9yZSBwcmVlbXB0IHRpbWVvdXQNCj4gDQo+IEhpIEpvbmF0aGFuLA0KPiBPbiAy
MDI0LTExLTA1IGF0IDE1OjQ4OjIzICswMDAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6DQo+ID4g
VGhlIHN1YnRlc3RzIG9mIHN5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbiBtb2RpZnkgdGhlIHByZWVt
cHRfdGltZW91dF91cw0KPiA+IGFuZCB0aW1lc2xpY2VfZHVyYXRpb25fdXMgdmFsdWVzLiAgSG93
ZXZlciwgd2hpbGUgdGhlIHRlc3QgZG9lcyByZXN0b3JlDQo+ID4gdGhlIHRpbWVzbGljZV9kdXJh
dGlvbl91cyB2YWx1ZSBhdCB0aGUgZW5kIG9mIGV4ZWN1dGlvbiwgaXQgZG9lcyBub3QgZG8NCj4g
PiB0aGUgc2FtZSBmb3IgcHJlZW1wdF90aW1lb3V0X3VzLiAgQmVjYXVzZSB0aGUgdmFsdWUgaXMg
bm90IHByb3Blcmx5DQo+ID4gcmVzdG9yZWQsIGZ1dHVyZSB0ZXN0cyBjYW4gZW5kIHVwIHVzaW5n
IHRoZSB1bmV4cGVjdGVkIHByZWVtcHQgdGltZW91dA0KPiA+IHZhbHVlIGFuZCB0aHVzIGhhdmUg
dW5leHBlY3RlZCBiZWhhdmlvci4NCj4gPiANCj4gPiBTYXZlIGFuZCByZXN0b3JlIHRoZSBwcmVl
bXB0X3RpbWVvdXRfdXMgdmFsdWUgZHVyaW5nIHRoZSB0ZXN0Lg0KPiA+IA0KPiA+IFRoaXMgZml4
IGRvZXMgbm90IGFwcGx5IHRvIHhlX3N5c2ZzX3ByZWVtcHRfdGltZW91dCBiZWNhdXNlIG9ubHkg
dGhlDQo+ID4gcHJlZW1wdF90aW1lb3V0X3VzIGlzIG1vZGlmaWVkIGR1cmluZyB0aG9zZSB0ZXN0
cywgYW5kIHRoZSB2YWx1ZSBpcw0KPiA+IGNvcnJlY3R5IHJlc3RvcmVkIGJlZm9yZSB0aGUgdGVz
dHMgZW5kLg0KPiA+IA0KPiA+IHYyOiBBbHNvIHJlc3RvcmUgcHJlZW1wdF90aW1lb3V0X3VzIG9u
IHRlc3QgZmFpbHVyZSAoS2FtaWwpDQo+ID4gDQo+ID4gdjM6IEFib3J0IG9uIHJlc3RvcmUgZmFp
bHVyZSAoS2FtaWwpDQo+ID4gDQo+ID4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy8yOTc2DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9u
YXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IENDOiBWaW5heSBC
ZWxnYXVta2FyIDx2aW5heS5iZWxnYXVta2FyQGludGVsLmNvbT4NCj4gPiBDQzogS2FtaWwgS29u
aWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICB0
ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24uYyB8IDE2ICsrKysrKysrKysr
KysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3N5c2ZzX3RpbWVzbGlj
ZV9kdXJhdGlvbi5jIGIvdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1cmF0aW9uLmMN
Cj4gPiBpbmRleCBiMzRkNzhhNzg0Li5lZjExYWNjYTEzIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3Rz
L2ludGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbi5jDQo+ID4gKysrIGIvdGVzdHMvaW50
ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1cmF0aW9uLmMNCj4gPiBAQCAtMTE1LDEwICsxMTUsMTEg
QEAgc3RhdGljIHVpbnQ2NF90IF9fdGVzdF90aW1lb3V0KGludCBmZCwgaW50IGVuZ2luZSwgdW5z
aWduZWQgaW50IHRpbWVvdXQsIHVpbnQxNl8NCj4gPiAgc3RhdGljIHZvaWQgdGVzdF90aW1lb3V0
KGludCBmZCwgaW50IGVuZ2luZSwgY29uc3QgY2hhciAqKnByb3BlcnR5LCB1aW50MTZfdCBjbGFz
cywgaW50IGd0KQ0KPiA+ICB7DQo+ID4gIAl1aW50NjRfdCBkZWxheXNbXSA9IHsgMTAwMCwgNTAw
MDAsIDEwMDAwMCwgNTAwMDAwIH07DQo+ID4gLQl1bnNpZ25lZCBpbnQgc2F2ZWQ7DQo+ID4gKwl1
bnNpZ25lZCBpbnQgc2F2ZWQsIG9sZF9wdDsNCj4gPiAgCXVpbnQ2NF90IGVsYXBzZWQ7DQo+ID4g
IAl1aW50NjRfdCBlcHNpbG9uOw0KPiA+ICANCj4gPiArCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3Nj
YW5mKGVuZ2luZSwgInByZWVtcHRfdGltZW91dF91cyIsICIldSIsICZvbGRfcHQpID09IDEpOw0K
PiA+ICAJaWd0X3JlcXVpcmUoaWd0X3N5c2ZzX3ByaW50ZihlbmdpbmUsICJwcmVlbXB0X3RpbWVv
dXRfdXMiLCAiJXUiLCAxKSA9PSAxKTsNCj4gPiAgCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3NjYW5m
KGVuZ2luZSwgcHJvcGVydHlbMF0sICIldSIsICZzYXZlZCkgPT0gMSk7DQo+ID4gIAlpZ3RfZGVi
dWcoIkluaXRpYWwgJXM6JXVcbiIsIHByb3BlcnR5WzBdLCBzYXZlZCk7DQo+ID4gQEAgLTE0MCw2
ICsxNDEsOSBAQCBzdGF0aWMgdm9pZCB0ZXN0X3RpbWVvdXQoaW50IGZkLCBpbnQgZW5naW5lLCBj
b25zdCBjaGFyICoqcHJvcGVydHksIHVpbnQxNl90IGNsYQ0KPiA+ICAJfQ0KPiA+ICANCj4gPiAg
CXNldF90aW1lc2xpY2VfZHVyYXRpb24oZW5naW5lLCBzYXZlZCk7DQo+ID4gKwlpZ3RfYXNzZXJ0
X2x0ZSgwLCBpZ3Rfc3lzZnNfcHJpbnRmKGVuZ2luZSwgInByZWVtcHRfdGltZW91dF91cyIsICIl
dSIsIG9sZF9wdCkpOw0KPiA+ICsJaWd0X3N5c2ZzX3NjYW5mKGVuZ2luZSwgInByZWVtcHRfdGlt
ZW91dF91cyIsICIldSIsICZzYXZlZCk7DQo+ID4gKwlpZ3RfYXNzZXJ0X2VxKHNhdmVkLCBvbGRf
cHQpOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICAjZGVmaW5lCU1BWF9HVFMJOA0KPiA+IEBAIC0xNTks
NyArMTYzLDcgQEAgaWd0X21haW4NCj4gPiAgCWludCBndF9jb3VudCA9IDA7DQo+ID4gIAlpbnQg
ZmQgPSAtMSwgc3lzX2ZkLCBndDsNCj4gPiAgCWludCBlbmdpbmVzX2ZkW01BWF9HVFNdLCBndF9m
ZFtNQVhfR1RTXTsNCj4gPiAtCXVuc2lnbmVkIGludCB0ZHNbTUFYX0dUU107DQo+ID4gKwl1bnNp
Z25lZCBpbnQgdGRzW01BWF9HVFNdLCBwdHNbTUFYX0dUU107DQo+ID4gIA0KPiA+ICAJaWd0X2Zp
eHR1cmUgew0KPiA+ICAJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gQEAg
LTE3OCw2ICsxODIsOSBAQCBpZ3RfbWFpbg0KPiA+ICAJCQlpZ3RfcmVxdWlyZShpZ3Rfc3lzZnNf
c2NhbmYoZW5naW5lc19mZFtndF9jb3VudF0sDQo+ID4gIAkJCQkJCSAgICAidGltZXNsaWNlX2R1
cmF0aW9uX3VzIiwNCj4gPiAgCQkJCQkJICAgICIldSIsICZ0ZHNbZ3RfY291bnRdKSA9PSAxKTsN
Cj4gPiArCQkJaWd0X3JlcXVpcmUoaWd0X3N5c2ZzX3NjYW5mKGVuZ2luZXNfZmRbZ3RfY291bnRd
LA0KPiA+ICsJCQkJCQkgICAgInByZWVtcHRfdGltZW91dF91cyIsDQo+ID4gKwkJCQkJCSAgICAi
JXUiLCAmcHRzW2d0X2NvdW50XSkgPT0gMSk7DQo+ID4gIAkJCWd0X2NvdW50Kys7DQo+ID4gIAkJ
fQ0KPiA+ICAJfQ0KPiA+IEBAIC0xOTgsNiArMjA1LDExIEBAIGlndF9tYWluDQo+ID4gIAkJZm9y
IChpbnQgaSA9IGd0X2NvdW50IC0gMTsgaSA+PSAwOyBpLS0pIHsNCj4gPiAgCQkJdW5zaWduZWQg
aW50IHN0b3JlOw0KPiA+ICANCj4gPiArCQkJaWd0X2Fzc2VydF9sdGUoMCwgaWd0X3N5c2ZzX3By
aW50ZihlbmdpbmVzX2ZkW2ldLCAicHJlZW1wdF90aW1lb3V0X3VzIiwNCj4gDQo+IEltaG8gYmV0
dGVyIGFib3J0Lg0KDQpJIGRvbid0IHRoaW5rIGZhaWxpbmcgdGhlIGFzc2VydGlvbiBoZXJlIGlz
IG5lY2Vzc2FyaWx5IGlndCBicmVha2luZy4gIFdoYXQgd2UncmUgbW9yZQ0KY29uY2VybmVkIHdp
dGggaXMgaWYgdGhlIHN5c2ZzIHZhbHVlIGlzIHJlc3RvcmVkIHRvIGl0cyBvcmlnaW5hbCB2YWx1
ZSwgYW5kIGlmIHRoZSBwcmludGYNCmZhaWxzIGhlcmUsIHRoZW4gaXQgbWF5IGhhdmUgYWxzbyBm
YWlsZWQgaW4gdGhlIHRlc3QgaXRzZWxmLCBtZWFuaW5nIHRoZSB2YWx1ZSB3YXMgbmV2ZXINCm1v
ZGlmaWVkIHRvIGJlZ2luIHdpdGguDQoNCj4gDQo+ID4gKwkJCQkJCQkgICAiJXUiLCBwdHNbaV0p
KTsNCj4gDQo+IFdoYXQgYWJvdXQgc2V0dGluZyBmaXJzdDoNCj4gCQkJc3RvcmUgPSBwdHNbaV0g
LSAxOw0KPiBzbyBpdCB3aWxsIGRpZmZlciBpbiBjYXNlIHNjYW5mIGRpZG4ndCByZWFkIGFueXRo
aW5nPw0KDQpJIGRvbid0IHRoaW5rIHRoZSBwcmVlbXB0X3RpbWVvdXRfdXMgb3IgdGltZXNsaWNl
X2R1cmF0aW9uX3VzIHZhbHVlcyBjYW4gZXZlcg0KYmUgbGVzcyB0aGFuIHplcm8sIHNvIEknbGwg
c2V0IHRoZSBzdG9yZSB2YWx1ZSB0byAtMSBiZWZvcmUgdGhlIHJlYWQuDQotSm9uYXRoYW4gQ2F2
aXR0DQoNCj4gDQo+IFdpdGggb3Igd2l0aG91dCBhYm92ZQ0KPiBSZXZpZXdlZC1ieTogS2FtaWwg
S29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiANCj4gPiArCQkJ
aWd0X3N5c2ZzX3NjYW5mKGVuZ2luZXNfZmRbaV0sICJwcmVlbXB0X3RpbWVvdXRfdXMiLCAiJXUi
LCAmc3RvcmUpOw0KPiA+ICsJCQlpZ3RfYWJvcnRfb25fZihzdG9yZSAhPSBwdHNbaV0sICJwcmVl
bXB0X3RpbWVvdXRfdXMgbm90IHJlc3RvcmVkIVxuIik7DQo+ID4gKw0KPiA+ICAJCQlpZ3RfYXNz
ZXJ0X2x0ZSgwLCBpZ3Rfc3lzZnNfcHJpbnRmKGVuZ2luZXNfZmRbaV0sICJ0aW1lc2xpY2VfZHVy
YXRpb25fdXMiLA0KPiA+ICAJCQkJCQkJICAgIiV1IiwgdGRzW2ldKSk7DQo+ID4gIAkJCWlndF9z
eXNmc19zY2FuZihlbmdpbmVzX2ZkW2ldLCAidGltZXNsaWNlX2R1cmF0aW9uX3VzIiwgIiV1Iiwg
JnN0b3JlKTsNCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCj4gDQo=

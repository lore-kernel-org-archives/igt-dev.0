Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6DEC3ABBF
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 13:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DEF10E697;
	Tue,  6 May 2025 13:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIkpjt+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CCD10E697
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746538466; x=1778074466;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oXGRUlmzOsZb75Egaze/riHln1iNKjU7YRhmK02r610=;
 b=CIkpjt+T8jeKJyoSzkupDDaggGNlvyeagQWxVmvhxMmmOGXZRnpH9l0q
 Wnz61Nys+w4beZznnpfJNnDNdRXdKANzczfThAHWu7rJ+OjCalmiHmk6f
 cIOreZMUlqYbhxxSkJ3pupjJoAFiUOM6GjSfYjX95EI+z1+9FsVMrFB4w
 5XuVGK3EM0nH0+uiSOa8Qiki9RxwWiHo9YoFcpUOipO9cpJACQZ4Esg//
 yKbDMAZTbRteREfLPXrnBXdfN9p+IDoMaf69kdRei7VC1sRao5OlZk2y1
 /BEU0cb1nzREvA1LVUb1RI1yjgpGy+WQfJneoarLFIqX5Fzttw2WQy7ho Q==;
X-CSE-ConnectionGUID: wtJ4wChFQVSUj4E//2zyMw==
X-CSE-MsgGUID: tq8blkrDQ0y06sjK7ngPTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48216462"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="48216462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:34:26 -0700
X-CSE-ConnectionGUID: LD2l/ZRZRkyjek9M61mbtQ==
X-CSE-MsgGUID: EL5rk6WXQuqtTCg8a+MMog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136618815"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:34:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 06:34:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 06:34:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 06:34:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrnQlTlyEnlIocuph4lc/3UmUiJUR5vyr4AYNFgUdTQpy9xBrZmiDaXxr/YypCH0SyQxKyELJpJhUALDiddp1xxS1lXE05t/Be2e6rBiR7XPzFWFR3EW+bsKKKxgac7b3ef7kT38nLQ32a1tw4UImnZUg0GsbPlmeZO0tTwfWVeIGlhR24XuO/XlxlSklECdkIojaMKPBGp+MoY8VMY5G7SJnoYVv9o4tqKSBNbLiRGIvCmnjmkqueJfcm5QYOJcPIRrJPFu35du7as1K9P3HP1uSi8uxZHX8+KSSQ7U60e7LXnyjnBIGYQ7hQ04SCEgvDTWhBrsC4eVFYD/2FJagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haFRDhTVl747EYVRygqkOMAHGYAB5uQU8tn6U9SiMAc=;
 b=xK/PMxhZpvVS/riLOk9L8P9YDCNReMY/L2hipsWYzrTMaxK4uOD14uNndvGVBt5OQqX26AMuPi1il49Rug1eSfUDTDHltlMP3bxkkwE0kVOSck/O/YFi6xVGJUz4kNURTHiVZncXWmEVHkKFiO5TUb7pyDg+NxAjmFc7zW8HS48sdUbXgAwpPRFRMtc0qdAVB/OyOokbQT+l+o68i90eYwSWCe6LpTe8x1hqSEt1g0+vtbVDKzX0+XtMgxHRrskH/LD1ABxndf++EGffdU3utuNIgHaXrKOPvCRqtJ9GBzOoqU9KA1IcqmBUHQnsLuTkJ0IEwDouK+FN2JZRr8lQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 13:33:29 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 13:33:29 +0000
Date: Tue, 6 May 2025 13:33:19 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <zbigniew.kempczynski@intel.com>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v10 2/5] lib/igt_device_scan: Enable finding all
 matched IGT devices
Message-ID: <az3bgjmn7owia3ejyu2cii6bazrixw4br4pitf4p5cqnecupgo@dqrvessxjk4j>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250430070824.3012927-1-soham.purkait@intel.com>
 <20250430070824.3012927-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250430070824.3012927-3-soham.purkait@intel.com>
X-ClientProxiedBy: VI1PR09CA0151.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::35) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 93734742-456f-4ad5-20ad-08dd8ca29677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVc4YUNad25ZbXlaVkhaeEoxZjRiODArdEVTcWdTWUdYakI1amJjVHcyT3hL?=
 =?utf-8?B?dEY0NTFHY0tvL3NOVzZHbHhBZGVXM014NHNmZVdyVUdQb29vRmNxT1RmZmJZ?=
 =?utf-8?B?MlBORG1YUTIySmVNYVBtaGwvaXJKNm5nMFVHZ1BBY0R6YjFpMzlrRkZDN1Y4?=
 =?utf-8?B?MXo0Y2FiM0xuYXRyd1pyditmRmtWNGFpblNYWVhjOWZCZUljdEdvbVVQTHM5?=
 =?utf-8?B?TXd1bFVxSDV6NTBLNU1OR09hemltaHpkdHR5amd2RGI0eWdVUFQxc3pQS2xG?=
 =?utf-8?B?Wk1FNFdTOWNBV2hPQ2xKUXZ4VTROQVAvK09kcjU3dnpDVzdxV1l6MG85K2Zs?=
 =?utf-8?B?L3Yvb1N6bUN4UGMzcE81RGlSUVd3anZoQWVnS1F3OXNTNHM1cHFPYzhRWHhs?=
 =?utf-8?B?T1V4RUtRSXFXZlNPTytnNHJHOHhBTnkyKzdvWlVWVTFRbEtRemV3L2pWek91?=
 =?utf-8?B?dnV2MGo3SStMUk9Gay9lZUkxRk5UV2FPQWZMdVQrVVcwOHROWWdCTWx0TG1l?=
 =?utf-8?B?eElVMUIvK0RESmF4WkZkY0NMK1FPcGtXSE9RT1B4QjgzS3JtS1JrbHQ4MVIw?=
 =?utf-8?B?MFdRL054ZEFUZFd0L3lPTlBuc0xKSGVZM09pM010MnRuUktEbE4wWUx5K3li?=
 =?utf-8?B?YjdlRVYzYkRTb2E1TWZvRGNEWnY5K2JpNmdXN1N4K0FlYVVqamVMQlR0QVFr?=
 =?utf-8?B?bC9vOGtIMWhLejdxRk1uNTBYRXk4b0RPdlU4WnhCWUZ4Y0ZLcW1NajJxSWxK?=
 =?utf-8?B?NC96NTBweFplWnVkNGU0bTFWWXZQRW1kUDhCeVFiSWNMdG4rUlJNTmtIZjh0?=
 =?utf-8?B?U2txOUtqaVUxSDVjSVdmeE1HNUY1ZmdlVFJqMSs1dkV2Vlpndzd1QkVWblVJ?=
 =?utf-8?B?TGNZRnE3UFZHR0dEZG4wWUJaeVVFeGo2L2M0OGY0SkNSdXhBYXoySTI4cnVR?=
 =?utf-8?B?emRHcjJ2ZEI0Q3M1aHZrWFFyL1h1NVFsYUNvTXF5QS96dUVmMlVJZHdwRTkx?=
 =?utf-8?B?SHF2VnlUUDNmZFF5K3JVVDMwdW1jYjdwdE4zdmtyK2ZrOE9URlh1NjZ6bkc1?=
 =?utf-8?B?WENJeWpBdXRpb0E0NU9XN3dhKzZWQVZqam1Hd3hlTmZNWTk4MG9EeGxteTBP?=
 =?utf-8?B?b0xQeENzRk5ZdnE3cUJlQmQ4REFjWmRCWWdTYksvUjBHak1ZU092Y3ZXR3VX?=
 =?utf-8?B?bThzY0pBSi9COE1TV1hIVnpvVkxVWHVjV0xFaEVJbTlxOUxaVENwUjFNRVFR?=
 =?utf-8?B?clA3bWtTUWc0bUhEMWpXbW9TU2M3MkYzd1A0dEh5bU9jbExIbHlLQTFRWGx1?=
 =?utf-8?B?dytMMDNUUWU1U2dFbzQ0TEJqcnJLUExjSkVockh3VFlyM1pacTBuQWFSV0VK?=
 =?utf-8?B?b3lwM0lCckI1bGlnODlEKyt4eHAxd05MWHd5bmlRbHpvSEpYWGtQakRLUUp6?=
 =?utf-8?B?bG1hMXBNWk4wSWYyWW5xQ1hzazZ2c09KaXN2MHZHckZrWUF3a2dnZUJMbU9Y?=
 =?utf-8?B?bmFmK2J4RTMrd3ZsUENhVVpsc1EvdHdmU2MxNnRFWGoyeXJVS1d5UFNzOUN6?=
 =?utf-8?B?KzZXOFhidXI3U0Z6RkxwNUIvRm1lZEZ6aVZQRkp4L1M5NGxTZGtCdlFiMVhC?=
 =?utf-8?B?a3cyUEwwVGRuMXN6UFErWEtRM3NTaXdXTlUwcVpUQU10Nm4vWm9tb0IrT01l?=
 =?utf-8?B?RUg2MlhWU1Vsc0ZUU2NOL25SOUl3Nkp0ZS9halFhNDRiUTNUaW84MXJ5VzdK?=
 =?utf-8?B?dEFDOFJVdkNRdnhkcFl2eFkrSUJrMmRyclBUQnVRTmE2VGM3RUJsMVBiN3hX?=
 =?utf-8?B?SkhWa0hPYnBmSG9jZmdMTXRnUDBXdXBPTCtYeFpObmtVMUdVSnZyelhoS0ZC?=
 =?utf-8?B?NDU1VnAxcVhvZzkreTRGQ3ZaMi9mQU1ubDBRbkEyVWtlNk5tdlMrS05OcWt0?=
 =?utf-8?Q?Wao20tZzLqQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHowSGphRXllNytiNzJMREdyUTlCcFc5S3E1UjE1NWRhdCtGOStHMG5ndTE5?=
 =?utf-8?B?V2FicEcwWWhIb1RZZmdRZ3ZhY0czNU5VclBZaCs1UEhUeFlTazhKVkMxT0xW?=
 =?utf-8?B?cnFtdTkvZE5KNUt4OXJDOThPVW9YZXlSc1grZUUxTWFpcjQ1aXI5M3BSVjQ3?=
 =?utf-8?B?YUlXMDZOMnVkaTR5L0ZRUVdxcXpUOXNxRlpXZ2p3UVd6Z1BVQU1STG9BK1ZM?=
 =?utf-8?B?ck5Uc0RKRlh5Mnp6aFk1MjVoMDhVV0w1d1hzRm4vaEF4M0orQStmQUY2ZTVU?=
 =?utf-8?B?UmlXanpUVXNwWk5ZY0VwVHZLckxoWXVLSjRXa0xTUWw0WStQQ3krM21kbGgy?=
 =?utf-8?B?V2EwTWNtZnkyK0tUMXZYaUZKa09pcVhtUFBvZjVkeWZGanJ4Zm4vc1NPZ2Ey?=
 =?utf-8?B?ZW9JUEhKRzV5YjRzUGNxWjR4MU5TbXlpVFNQWjQzVEFveGpHMmsrblJUWUJK?=
 =?utf-8?B?OHp5ZkNkZ1NwZDZvbDhjbE5sd3VuV2ZoWkJYQlZlVWpFTkxzOWw2SnAyb1Zm?=
 =?utf-8?B?bUk2QlRlZ0JUQ0o3cE04bDd5VjRUY1paeWV2ZzFKZ2tqUW9tNlpvTWp1TGt2?=
 =?utf-8?B?UnFSdjV3K21mSFFNQnRrUlFUblVZZzJWNTlpbE85TXdKejQ1bVZQSWJQb1k4?=
 =?utf-8?B?S1NXTndkVFN3YU16WlNYOG1TaVhjcGNvRis1ajlOZzhlMXdKbmdZT3RiRkdx?=
 =?utf-8?B?eFZuMlZqNnExeEQ2bzFKUi9ZZkErU3lBQU1BSTYxb0lZSEFwVzNLbUcrN0sx?=
 =?utf-8?B?UlVRNDdPNmcvN1ZYcXJoc085Y0VNSU5ZM3dORTJHbXUybkMyWnBCbm9XZFA1?=
 =?utf-8?B?TWFWKzByNVdEUUoxK2VhNWJEV0pteUtRSno3a2ZMY0JxSzdEbU4xWnh4N1Bm?=
 =?utf-8?B?VW5TOGlZaWNOc2NpdFlyYWF0TnowS0NrL0EwTXNmTVcydkJYTUlqQmFFRkNR?=
 =?utf-8?B?TDNiK0lIa011bXFsZDQ3cXJJZklUVXhOd1MxY0U2ZWQ1Q1h2MkFKU0FZTHgr?=
 =?utf-8?B?Skp2RVpuOEtZYldZWkRYcDk4QnBaMXByYzJaOGlWRkxwdHV5Mk9NYS9MdHZG?=
 =?utf-8?B?ckRyT2RkdkJFTTRibjlMVHhtM3JSWnNsQ3M4UE95Q24vaCsveC9GTVdVeXFP?=
 =?utf-8?B?UGpXWDJaQW1ncThVQ0xNT3l5elNMQ2paRjZoMDVzQlZObEZQSmFNMlFVQXNN?=
 =?utf-8?B?SUlyeHpveHJZYmFSV1h4ZTcvelNKa2k4K2xnMXp3WnJNbUVmbVNZYkY5Nmpk?=
 =?utf-8?B?YVVVODFDaDIzb01wOFdJMzdLa1ZwOGtUTDA0U2RFeGdENHNlRms1ajFnd1pv?=
 =?utf-8?B?aURWUUZlOTd1SWJUWFk5a3ZkOXBmdjA1QmlVbUQ2Ty9OcXkxRGJxTGc0YnhV?=
 =?utf-8?B?dS9NYmJ2Y29PclRZNEs1M3kwYlJSOHJxVGNGc3BxUnNVSmpSNmI0ZXZJYmEz?=
 =?utf-8?B?T2I0NnppMUx5VEl3Szh6SU1YcVFwSDd6K0s2MjdSbG9aUVpJUE9ONUtVVUpa?=
 =?utf-8?B?WWpVbzNmRGQ1bzhSdkZmb0ZpbVY4bjhTQWU0K1Q5RWhiQ1FENHNiRjVDNU9S?=
 =?utf-8?B?bHJkeVArZXJlVEpGcFh0ZlRCUWpiaW1UOVAyWW1pN2lha1BHOEk3UE9rTFhV?=
 =?utf-8?B?VmVIRXBGT09HT3BWQkJ5dHJ5Q2lnSFVFZkVoR2J6Y3pGRHVyMEN2UkFRakF0?=
 =?utf-8?B?cS9wZGhjb0xDdjBDNXJSWUxFODVjRGVwbkxsL1BMZWZyTE9yeEtFYzdkMnMz?=
 =?utf-8?B?ZFNndDAyY2xidVo0L2lrd2FWN1Q1UnppMzJoaFNSVzBEck9RS2xTRDIxaEdM?=
 =?utf-8?B?dHJMUlp5L3l4SjZGRVVDaXBNamg2cEdINCtwc2k5aElVOHNEWDBEMjV5OHI2?=
 =?utf-8?B?djdkd3dzekpBOGdvTy9oYnNFNTlNRzhwakowT1c1VzhlT0VwZzlyT0NKNkZ0?=
 =?utf-8?B?TWhYZVB1em1YQTFmc0Q5R2UzSjRZeFluK280dURaVDZpd2ljOUw5aENyN1ZG?=
 =?utf-8?B?WlRXankrQk5LSENQdmZnU1BRemcyRGZlK3RXdkYrL2ZHeDk2LzJ1T2RCc1ln?=
 =?utf-8?B?UlZNZ2EyZHROcHVqOVU5RlQ0MjVlbXRyTnoyb2IwU3c1bXRUbEd6Y3VFcXh6?=
 =?utf-8?B?R3haTkI1OGJGOUl4ZlRmNWJXeERrMlZOd1ZMNmxaMCtzRWZBdzJRZE9LS2l0?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93734742-456f-4ad5-20ad-08dd8ca29677
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:33:29.6512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1qPgXKiz6jQsQXeQ/0fsRzYTFMbjUlR27Ts51my9G6rRcWApYZM7sSAXhF9khpwZb+zOXumr7nlZZogdCRmwaW56TR4MUcZjyOqMTMZUDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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

Hi Soham,

> Use filter to find all the available
> GPUs or few among them by driver name
> and card type or card number.
> 
> v2 : Fix for refactoring GPUTOP into a
>      vendor-agnostic tool. (Lucas)
> 
> v3 : Separate commit for lib. (Kamil)
> 
> v4 : Refactor to use composition strategy
>      for driver and device type filtering.
>      Refactor code to improve memory
>      allocation and error handling. (Lucas)
> 
> v5 : Introduce device card match function
>      to return collection of matching
>      devices using device filter.
> 
> v6 : Separate commit for device card match
>      function.                     (Zbigniew)
>      Function description modification for device
>      card match function.          (Zbigniew)
> 
> v7 : Single return for card match function.
>                                   (Krzysztof)
> 
> v8 : Removed 'drivers' array as card match
>      function parameter.          (Zbigniew)
> 
> v9 : Fixed allocation in card match instead of
>      multiple realloc.            (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h |  1 +
>  2 files changed, 49 insertions(+)
> 

Looks good to me:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof


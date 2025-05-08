Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D082AC3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 06:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C58410E8BC;
	Thu,  8 May 2025 06:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2Oy+e4H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B9210E8BC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746686386; x=1778222386;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dxuhIIp2AtB9PEQNHRTtaaDpijsRGAMwXroEy2vBl80=;
 b=E2Oy+e4HCrL+TVCwbQJ330+URA3Rc8qBS7yJsfzTHJZma7gruYOI6dXz
 FrDi2aEqEdV/gfDEThxb3RQ1glhyNAHNn2kHIzqlfvOkr0yJzaqUM2H9M
 mfWRdeOSpGEC+8gcpeFA9UMVbwFgVd0mdBO5STtWwxEz6OIwZjd/Wdwvh
 Jbkatrzf8o9ds9Gngb/PV+dctF6vEjqyveKKUUFr0zEHpRZ0QcS3lE066
 zUVtGg3REz+L16VBjfWDZsa8XtdKKXx2InxPVdhItcUnquYIs9Ewh85mS
 DxYthbP99PH/7L7ArYon/0YrtvCyO6HEfueVgue/nCMtMC170E2bYtJiE g==;
X-CSE-ConnectionGUID: irXP3QZ/TGuD2PL6+71CAA==
X-CSE-MsgGUID: fNmgk551S3CrPcacvV+tpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59439912"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="59439912"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:39:46 -0700
X-CSE-ConnectionGUID: ON/zqKkbRQOulnmQdwAAQw==
X-CSE-MsgGUID: Y9c3sVyETDuqnn2+sIVtRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="137127933"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:39:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 23:39:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 23:39:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 23:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCPGzuSZPFyqbx+KOHXZe2vhKEznv0LS93gXdFMlamVc7tKZWEzA3rjI4IqL9ek6azEAigNpVHM7umCC/uf9/M5wsdI+t31CjCa6yFwbhwir8ijTQcyD/w+eh3VOr7DzHrR6T8JZmsuAg9Hc3iQwLl8NZ/v6rC1J+SnWE8OQwDF6UvmiQeww9pdXuhgs73dB5RuJNznmWd7FAbXi9tcdhAmk53rX2x1wjzmNoQTrkrJNAvip41EqiJL4rUh6seE3+TJ/ApCCYeE3Zy1SlK9Kzw6PtMljzoCBEEpBWIT2j0HTP+ExKuubKH6VQZQ3a24TlZTb8Bx5053BB+/v1Ur/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CLl7u4nV9AY7Gwu0J+6zH9n3wyoD3SHhYT5n4BcHNw=;
 b=O5UphzaWEGlXynrTOq7VSAWanlp5EsCIfjqKnXQPUJ3q/VbEyckPa1X/8oXzJSR6Hx1O3RQfHNrkO9WL2d/Aa9Cgj9epRaZCF29f/3zpWMBfYx+kgEJlrnSwTC2r929WMQKRAh/lcTzKQaYmmu/VN1hDH5AMNVQKpQYkvWmj4rdMPCVcnGVPSN6EU9zxr7VG614HL6+msfg4ZS7GyYOr+xzfktHCs/EslfY2t3rS1NhU9l0m+litFUo/QZ7OLeIiEvhMGIMZqzMd42eA8JuRBp0cHUBUbMh0jRfHo/MG/nds3gvEqlF6XHACUgsmqMKHBl9EUzlJebiwVOI/fHWpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6535.namprd11.prod.outlook.com (2603:10b6:930:41::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Thu, 8 May 2025 06:39:12 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8699.035; Thu, 8 May 2025
 06:39:11 +0000
Message-ID: <85b02bd7-d822-4ce9-b62f-5551ae39339c@intel.com>
Date: Thu, 8 May 2025 12:09:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 5/5] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250422171108.2170758-1-soham.purkait@intel.com>
 <20250422171108.2170758-6-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250422171108.2170758-6-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d130b2c-960b-4628-1649-08dd8dfb0ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVVpZU9KVCszY3dwSWs2OXJUZmZ2KzNXK01oczhmcWJlc3hZL2xWaVQ1M0dW?=
 =?utf-8?B?WGRTd0tBd0Qreml4YWNudGxtd1pjaU9nVktIMkx1VjZJbHkydDFzcVQ2ejNl?=
 =?utf-8?B?NW9OZEx3N0M2SGQ5RENhejF4OWM3ZjB5S1ZUcUF0V3NpWEV1MVN1dFpOd2ow?=
 =?utf-8?B?VWR5ZkVUd0lwTGszTDB5cnFGSmlHUVNMMVRvRTJuVFZPaHBnelU1eHlTbXZJ?=
 =?utf-8?B?NkxkQlBHSmpsTFR3VC9DaUNPM29NejJnNlpLZmxCVTF4b3hJRDVNT1BDaUZM?=
 =?utf-8?B?WTZYZTJvK1MyZkwzcks5TFM2OVAwNkJPcXZvbDBmZTJTaE5ZTEJMMHI4NURi?=
 =?utf-8?B?MXh2TW5HaXlWQmRUTm4xclZ3NU94N0c1UDhHSkZzdVRNMUl3TjlMdWhxUE44?=
 =?utf-8?B?OVQySmgvWU9lanFHRTllWWVSa0JCZm4zS0loYjNUUEZUVUtGZkI4emlLeVhC?=
 =?utf-8?B?cjByaHcxREc1K3VQWFRNV2xzaWsvcElxTDBNUTBFblRZR2FZVEtqMnpNekNW?=
 =?utf-8?B?SWp0Ynk1Qlk4Q3V6YTZJSjRnZlFDeUJxNHVOVGJwSkNxcDkzZ1BEem1lZmhy?=
 =?utf-8?B?ZXRVWXYwMGhZQXhvQ2NRdUNWL1JvVjBsOEJFWXNubDI3ckNORERHOEI0QjNv?=
 =?utf-8?B?cWpDRWxreFJnVGxJTTlFQVdOVzJSTkN3VkZaUnUyZWpBNjJzU2J5cGRJOXR5?=
 =?utf-8?B?akU4aVk0ZHVRNzFlM3ZNK3o3RVVCa3VWSGxrMk5YdTFqRjZYRERZYVppL0hm?=
 =?utf-8?B?eWxBU0NkUVhLcndLOXN0YktDSUJiNDBmc3pBNVZ6Skk5QldtU3VGYmsxY3dI?=
 =?utf-8?B?dXhJS1hJcHdkaWh2NjF4cTU5QXh3dzYyY2dpWkhIYUJvd25xdTJFaUVRV2Nm?=
 =?utf-8?B?KzBYd3dvWkdPaVpNNW9IMUh5Qmtsa1RadjBKRTRicVJZVFd1Sm8wWWpHcjJz?=
 =?utf-8?B?L29yakxIUUY4ZVRPNmo5QnpzTmgxRjZmTll5aTNIMXBiTUZnVXNSUWs1YmJp?=
 =?utf-8?B?Q0JUNXhFWG9uczZ6SVVTVVJDMHUzUjVNMUNOTnV3Uy9iOUNuelZjV2k4UXVp?=
 =?utf-8?B?c1ZFWks5eG1PamdTUlV1bXQxeWdSbjhXWHVrR2hVc2FpamVJaW9EclY2QjBk?=
 =?utf-8?B?dEZQb2RPYnNjSFZGajgvSVNvQ0hqM0VBYkVYVm1DZFA2NlltK29WMkh1V09H?=
 =?utf-8?B?ZmVPY1VtTHIyYXdSUjdGdXB3cnZ3N0FESE5YR09nempONHpmMlk2N21GOS9r?=
 =?utf-8?B?Wk9SaUVGQ0E1SXQ1ekJ3VHlLbHljbThBQ2JYU0ZmRXZkcWI2WTRLWWo2SEZY?=
 =?utf-8?B?RWpDdkk5dW5NSUQwVURwb1BKT0NIUVNsdGZpdXJaWnNmb3EySXpBK2Q5Tm43?=
 =?utf-8?B?TUFqRW5CR2pMeTlha04xeHY5VTV3azVvQXdJY24wbnVsZWR4Tm9XaytQZEdI?=
 =?utf-8?B?ckRpcmw1bUhDRVo0K0ZPbjJ3NHBRTWkycFplVmpZbms2bjNHaUcrQnNjV2Ri?=
 =?utf-8?B?TktSeU9nWVRTVmFQUDRKaWdKQjRaM3ZXR1ZTZHBoQ291V2xpSEx6bXV2d0px?=
 =?utf-8?B?TVNjSElkVUdwWHpNZGRQZ05qMFRwSG04NGUvSmdkSDNLWnN5MFFNaktvTzQ5?=
 =?utf-8?B?eGVUdkJOY0o0bjE4bEJPZ1hOQ2x4NUZhcW9DdUt3VkJ5dm5vNE1raUE5L1c5?=
 =?utf-8?B?cHZ0ekV5WGFDN0FndzJ3WXprYWhDeG5mVlVxTGgvYXNja2k1Zm1hU1FSV2F5?=
 =?utf-8?B?Q3YzT1JxdGpmVHBUQWVBMjhIOWFiMnRVVU4yWGc3U0dIdGVRZnVnc2ZEQVlz?=
 =?utf-8?B?azc2dEtFUEdaYWpCZURSNTZ4Rm52SlZoVW5UNjhJdS9hd0xUVmtZa3BEZHFU?=
 =?utf-8?B?cWpBdFQ4cWRLOHlGZW4ydW1wUjA4eDIzZC9UWVNNQ3RMYno0eFlzbGlEZTlL?=
 =?utf-8?Q?NwYMu4/j4es=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDNHYnFNaHRweG1DblBVMktmWWtGYVdSMndNUDk3TkZ0eThaekZWck44ZVZa?=
 =?utf-8?B?b1FJaFp4R2xyTVRwUHp0ci9VZ1hMdU9DZExLUDA0VlIzTDQ5RDhHUHZJZHBm?=
 =?utf-8?B?R2k5emtDTGdFMU5yVjM0VjZFbWlXUEVHS20wWGV2SEE2Mmh1ek9MN0JDRW5Z?=
 =?utf-8?B?dGhpRXo4Z2dUUnJtb3p2V3VGcDIwY3VLUjdYUWtUM1c3MVA0TGtqQzYzREk1?=
 =?utf-8?B?WkY4WUlzZllRS1diNE04TUI3YWZNUnB3TklqYzNLVkZCSmthKzNlYU9LOWF0?=
 =?utf-8?B?eWZ1bkx4c2RXQk5IN3Vic0VPUTFGRjhSSDV2b2lBbG1rVVdnbzBRVG84S2Ni?=
 =?utf-8?B?QUwrcVJJUFVua3EwNWZwMW96Nlc2Y3MvTlB4eFVuOG56aDRBa08zMS80N0l1?=
 =?utf-8?B?ZDZEb2hxaDVQYUI5NVZiWEpuNHRsZEFlem9UQTBEL3p0Y1VoNkc3NXdaZ09t?=
 =?utf-8?B?M0dmcW5EcExsbFg3SU5SanUrZTFIOERla1Boa0htZmRzQW5ROFBpT0VmbWJG?=
 =?utf-8?B?VXd2OTZLak5aZ3o3Y0R1YytUVTRvbmtJSzBHR3BYbFYzNFJMMjBVeWU0SzlR?=
 =?utf-8?B?WHo0N0V4SmR5ZkZCd0Z2Z0JwMVN0MXViVUpEZk1JTlM3NEdPMWVmdWgxREZV?=
 =?utf-8?B?QzdmQnhwbzdyMGh2b2JIL1A4dTBpbEV5MnJ1dUpOL05EL1l6Q2VYcjVDckpE?=
 =?utf-8?B?QjJUTnI4TnVqNkN2WTFDRGRVamZCYnNjUDZIVk15OTZGRmNIN21VR1ZEeFMr?=
 =?utf-8?B?c2NYdFNvT1JYSkdBSkxmdjJCd1QydTI4S0J4MnJ4SnZES21RaWkyNjhhSzhZ?=
 =?utf-8?B?N3BVZVkwRkFKS0ZrSUtpdHFsQW1BNXB3aS95Ynl2Zkx6UEpFeldGdVlmTU1y?=
 =?utf-8?B?amNtWDNocW5HOU9xYUtrOWgxY3dBeG02QUpnNmNJQTcrWmYvSWJMbjZ3bU1n?=
 =?utf-8?B?TmZlL3poa3hhYVloM2w0OHZqZ0hLOS90MVZPZUFSdU1YejFHZVd3SkhQK1Rs?=
 =?utf-8?B?RXovRW8rTFpsallUWkRmajlWSWZGeEpaTWV0R0dodG1MNDd2RWY3aitsM3o4?=
 =?utf-8?B?SXVqTzBmM0EvZUl5eXZhbXhxb2pta2JuUHM3K2kvbmM0ZW4wRU5rOHQrejdJ?=
 =?utf-8?B?aDJNOEVBMTZMQTI4YTRUQWVRbTZvQWFRVlRGaytBMExtaDdDK1U3Y0pBcjBU?=
 =?utf-8?B?eUNCbVRTNWUvVlpqSklkZVhlY3gvTWVCSEY5bGtUNURVcFVueFBZRThlVkJI?=
 =?utf-8?B?UjlZWWVMV2RmR1VkSFdGZkpGV0hGYzVWUWVSU3ovdklySGpmcy92Y0h0dkFq?=
 =?utf-8?B?WE9rbzdMUFpKb1BCTHBUNExzUi9VVkY1a0VEcTd5anh6UEdOL3JxNWtlSW1a?=
 =?utf-8?B?SjAyZDdWOExlNjBKMUE5cEJSc3NiNkRjSERyVzE3Wm9OU3VXdFNlV1JWYVZm?=
 =?utf-8?B?NmoyVnRpZFVKSU91MDRYTUdLdFkrRUdZWkFTSjVFU29PUlBXODg0R1BiN3RJ?=
 =?utf-8?B?WFczRUVVdk52VTFhRm1SSndDdjdDbzdOdlJCd1RqWlVRVVpVTUJ1OUd4Q2Ny?=
 =?utf-8?B?WGVqZ0FlSHFpNG1xTlcwOUJPZDdTTXBJcE1WZ29xYjllekdtd24velZJUzJE?=
 =?utf-8?B?UjBjclNTYnFkY3ZPWDNRbFdOc1hIdzNMR0x6eUVDT3A4a3A5MDI3Z1FONm9S?=
 =?utf-8?B?V1V1Q3pWQUpxRWl1NnRjY01SV1RpclcyWUJjRko4V3ZsOWl6cXBxRTZCVDVL?=
 =?utf-8?B?dFhWcTZNcWQwbFhnWGhMTnR3RzNxOTN2N3l5NUVPRnZoRkhQaDBNT0tQT3p3?=
 =?utf-8?B?cWE2eEtvUThrRFd6dVVPRDNQaHpZc0d3dzExcGNnSnhTdmFnekxRc2lMZ3hC?=
 =?utf-8?B?a0hVMVd1SlFac0F1STd4QU9RQlFXdld0dTZLVEtaV21OZThyNVpGT3lnSURG?=
 =?utf-8?B?SDZqVUpWMGx2bFROL2hGL040MGFEWDJ5UEhBZ2lQVVlSdW8xMFFrajFJR2Rm?=
 =?utf-8?B?c0NEMnhSYzJyU3M4VUxhRithSmlBS0p3YUVjK2ZhTzRndFVHTTd2QU1KNnhF?=
 =?utf-8?B?bGhHUisxZW9rdmp0MGhmayttUW83TUl6UkxMcys2bmh6RTlIV0RVMjBlVm4x?=
 =?utf-8?Q?FS1KWgBcpYgqnXhx5JU2S8sa+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d130b2c-960b-4628-1649-08dd8dfb0ad0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:39:11.7988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfFlopQ2fJ7bRcVmHILVR2Ad68nJyCizlvw5D/AA0LEjG1TmVtI7Ojm9EKYM9kQaOkeYe0j7aaw3iVKZnQRcFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6535
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

Hi Soham

On 4/22/2025 10:41 PM, Soham Purkait wrote:
> Introduce vendor-agnostic support for
> handling multiple GPUs and instances
> in gputop. Improve the tool's adaptability
> to various GPU configurations.
> 
> v2 : Fix for refactoring GPUTOP into a
>       vendor-agnostic tool. (Lucas)
> 
> v3 : New year included in copyright. (Kamil, Riana)
>       Removed caps in function name. (Riana)
>       Struct for driver specific operations. (Riana)
>       Headers in alphabetical order. (Kamil, Riana)
> 
> v4 : Commit description and signed-off included.
> 
> v5 : Fix for proper resource cleanup. (Riana)
>       Use "dev_type" enum for card_type. (Krzysztof)
>       Add new filter to return collection
>       of matching devices.               (Zbigniew)
> 
> v6 : Use device filter to populate the array of
>       cards for all supported drivers.   (Zbigniew)
> 
> v7 : Use filter to find all the cards.  (Zbigniew)
> 
> v8 : Removed 'drivers' array parameter from
>       card match function.               (Zbigniew)
> 
> v9 : Resolved 'populate_devices' call.
>                                    (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/{ => gputop}/gputop.c | 224 ++++++++++++++++++++++++++++++------
>   tools/gputop/meson.build    |   6 +
>   tools/meson.build           |   6 +-
>   3 files changed, 193 insertions(+), 43 deletions(-)
>   rename tools/{ => gputop}/gputop.c (67%)
>   create mode 100644 tools/gputop/meson.build
> 
> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
> similarity index 67%
> rename from tools/gputop.c
> rename to tools/gputop/gputop.c
> index 43b01f566..eab415ab5 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop/gputop.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2023-2025 Intel Corporation
>    */
>   
>   #include <assert.h>
> @@ -14,66 +14,148 @@
>   #include <math.h>
>   #include <poll.h>
>   #include <signal.h>
> +#include <stdbool.h>
>   #include <stdint.h>
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
> +#include <sys/sysmacros.h>
>   #include <sys/ioctl.h>
>   #include <sys/stat.h>
>   #include <sys/types.h>
> -#include <unistd.h>
>   #include <termios.h>
> -#include <sys/sysmacros.h>
> -#include <stdbool.h>
> +#include <unistd.h>
>   
> +#include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_drm_clients.h"
>   #include "igt_drm_fdinfo.h"
> +#include "igt_perf.h"
>   #include "igt_profiling.h"
> -#include "drmtest.h"
> +#include "xe_gputop.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * Supported Drivers
> + *
> + * Adhere to the following requirements
> + * when implementing support for the
> + * new driver:
you can wrap lines at 75/100. This is less than 30
Throughout the series> + * @drivers: Update drivers[] with
> + * driver string.
> + * @total_count: Update NUM_DRIVER with
> + * the total number of supported drivers.
> + * @operations: Update the respective
> + * operations of the new driver:
> + * gputop_init,
> + * discover_engines,
> + * pmu_init,
> + * pmu_sample,
> + * print_engines,
> + * clean_up
> + * @devices: Update devices[] array
> + * of type "struct gputop_device" with
> + * the initial values.
> + */
> +static const char * const drivers[] = {
> +	"xe",
> +    /*Keep the last one as NULL*/
> +	NULL
> +};
> +
> +/**
> + * Number of supported drivers needs to be adjusted
> + * as per the letgth of the drivers[] array.
typo

> + */
> +#define NUM_DRIVER 1
> +
> +/**
> + * Supported operations on driver instances.
> + * Update the oprs[] array for
> + * each individual driver specific function.
> + * Maintain the sequence as per drivers[] array.
> + */
ops is better?

Thanks
Riana> +struct device_operations oprs[NUM_DRIVER] = {
> +	{
> +		xe_gputop_init,
> +		xe_populate_engines,
> +		xe_pmu_init,
> +		xe_pmu_sample,
> +		xe_print_engines,
> +		xe_clean_up
> +	}
> +};
> +
> +/*
> + * devices[] array of type
> + * struct gputop_device
> + */
> +struct gputop_device devices[] = {
> +	{false, 0, NULL}
> +};
>   
>   enum utilization_type {
>   	UTILIZATION_TYPE_ENGINE_TIME,
>   	UTILIZATION_TYPE_TOTAL_CYCLES,
>   };
>   
> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> -
> -#define ANSI_HEADER "\033[7m"
> -#define ANSI_RESET "\033[0m"
> -
> -static void n_spaces(const unsigned int n)
> +static void gputop_clean_up(void)
>   {
> -	unsigned int i;
> -
> -	for (i = 0; i < n; i++)
> -		putchar(' ');
> +	for (int i = 0; drivers[i]; i++) {
> +		oprs[i].clean_up(devices[i].instances, devices[i].len);
> +		free(devices[i].instances);
> +		devices[i].driver_present = false;
> +		devices[i].len = 0;
> +	}
>   }
>   
> -static void print_percentage_bar(double percent, int max_len)
> +static int find_driver(struct igt_device_card *card)
>   {
> -	int bar_len, i, len = max_len - 1;
> -	const int w = 8;
> -
> -	len -= printf("|%5.1f%% ", percent);
> -
> -	/* no space left for bars, do what we can */
> -	if (len < 0)
> -		len = 0;
> +	for (int i = 0; drivers[i]; i++) {
> +		if (strcmp(drivers[i], card->driver) == 0)
> +			return i;
> +	}
> +	return -1;
> +}
>   
> -	bar_len = ceil(w * percent * len / 100.0);
> -	if (bar_len > w * len)
> -		bar_len = w * len;
> +/*
> + * If filter is not NULL i will be ignored.
> + */
> +static int populate_device_instances(const char *filter)
> +{
> +	struct igt_device_card *cards = NULL;
> +	struct igt_device_card *card_inplace = NULL;
> +	struct gputop_device *dev =  NULL;
> +	int count;
>   
> -	for (i = bar_len; i >= w; i -= w)
> -		printf("%s", bars[w]);
> -	if (i)
> -		printf("%s", bars[i]);
> +	count = igt_device_card_match_all(filter, &cards);
> +	for (int j = 0; j < count; j++) {
> +		int driver_no = find_driver(cards + j);
>   
> -	len -= (bar_len + (w - 1)) / w;
> -	n_spaces(len);
> +		if (driver_no < 0)
> +			continue;
>   
> -	putchar('|');
> +		dev = devices + driver_no;
> +		if (!dev->driver_present)
> +			dev->driver_present = true;
> +		dev->len++;
> +		dev->instances = realloc(dev->instances,
> +					 dev->len * sizeof(struct xe_gputop));
> +		if (!dev->instances) {
> +			fprintf(stderr,
> +				"Device instance realloc failed (%s)\n",
> +				strerror(errno));
> +			exit(EXIT_FAILURE);
> +		}
> +		card_inplace = (struct igt_device_card *)
> +				calloc(1, sizeof(struct igt_device_card));
> +		memcpy(card_inplace, cards + j, sizeof(struct igt_device_card));
> +		oprs[driver_no].gputop_init((struct xe_gputop *)(dev->instances + dev->len - 1),
> +			card_inplace);
> +	}
> +	if (count)
> +		free(cards);
> +	return count;
>   }
>   
>   static int
> @@ -333,6 +415,7 @@ static void clrscr(void)
>   struct gputop_args {
>   	long n_iter;
>   	unsigned long delay_usec;
> +	char *device;
>   };
>   
>   static void help(void)
> @@ -343,16 +426,18 @@ static void help(void)
>   	       "\t-h, --help                show this help\n"
>   	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>   	       "\t-n, --iterations =NUMBER  number of executions\n"
> +	       "\t-D, --device              Device filter\n"
>   	       , program_invocation_short_name);
>   }
>   
>   static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   {
> -	static const char cmdopts_s[] = "hn:d:";
> +	static const char cmdopts_s[] = "hn:d:D:";
>   	static const struct option cmdopts[] = {
>   	       {"help", no_argument, 0, 'h'},
>   	       {"delay", required_argument, 0, 'd'},
>   	       {"iterations", required_argument, 0, 'n'},
> +	       {"device", required_argument, 0, 'D'},
>   	       { }
>   	};
>   
> @@ -360,6 +445,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   	memset(args, 0, sizeof(*args));
>   	args->n_iter = -1;
>   	args->delay_usec = 2 * USEC_PER_SEC;
> +	args->device = NULL;
>   
>   	for (;;) {
>   		int c, idx = 0;
> @@ -383,6 +469,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   				return -1;
>   			}
>   			break;
> +		case 'D':
> +			args->device = optarg;
> +			break;
>   		case 'h':
>   			help();
>   			return 0;
> @@ -422,6 +511,52 @@ int main(int argc, char **argv)
>   	n = args.n_iter;
>   	period_us = args.delay_usec;
>   
> +	if (!populate_device_instances(args.device ? args.device
> +				       : "device:card=all")) {
> +		printf("No device found.\n");
> +		gputop_clean_up();
> +		exit(1);
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		if (devices[i].driver_present) {
> +			for (int j = 0; j < devices[i].len; j++) {
> +				if (!oprs[i].init_engines(devices[i].instances + j)) {
> +					fprintf(stderr,
> +						"Failed to initialize engines! (%s)\n",
> +						strerror(errno));
> +						gputop_clean_up();
> +					return EXIT_FAILURE;
> +				}
> +				ret = oprs[i].pmu_init(devices[i].instances + j);
> +
> +				if (ret) {
> +					fprintf(stderr,
> +						"Failed to initialize PMU! (%s)\n",
> +						strerror(errno));
> +					if (errno == EACCES && geteuid())
> +						fprintf(stderr,
> +							"\n"
> +							"When running as a normal user CAP_PERFMON is required to access performance\n"
> +							"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
> +							"distribution vendor for assistance.\n"
> +							"\n"
> +							"More information can be found at 'Perf events and tool security' document:\n"
> +							"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
> +
> +					igt_devices_free();
> +					gputop_clean_up();
> +					return EXIT_FAILURE;
> +				}
> +			}
> +		}
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
> +			oprs[i].pmu_sample(devices[i].instances + j);
> +	}
> +
>   	clients = igt_drm_clients_init(NULL);
>   	if (!clients)
>   		exit(1);
> @@ -442,14 +577,27 @@ int main(int argc, char **argv)
>   
>   	while ((n != 0) && !stop_top) {
>   		struct igt_drm_client *c, *prevc = NULL;
> -		int i, engine_w = 0, lines = 0;
> +		int k, engine_w = 0, lines = 0;
>   
>   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> +
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
> +				oprs[i].pmu_sample(devices[i].instances + j);
> +		}
> +
>   		igt_drm_clients_sort(clients, client_cmp);
>   
>   		update_console_size(&con_w, &con_h);
>   		clrscr();
>   
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++) {
> +				lines = oprs[i].print_engines(devices[i].instances + j,
> +							 lines, con_w, con_h);
> +			}
> +		}
> +
>   		if (!clients->num_clients) {
>   			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>   
> @@ -457,7 +605,7 @@ int main(int argc, char **argv)
>   			       (int)(con_w - strlen(msg) - 1), msg);
>   		}
>   
> -		igt_for_each_drm_client(clients, c, i) {
> +		igt_for_each_drm_client(clients, c, k) {
>   			assert(c->status != IGT_DRM_CLIENT_PROBE);
>   			if (c->status != IGT_DRM_CLIENT_ALIVE)
>   				break; /* Active clients are first in the array. */
> @@ -481,11 +629,11 @@ int main(int argc, char **argv)
>   	}
>   
>   	igt_drm_clients_free(clients);
> +	gputop_clean_up();
>   
>   	if (profiled_devices != NULL) {
>   		igt_devices_configure_profiling(profiled_devices, false);
>   		igt_devices_free_profiling(profiled_devices);
>   	}
> -
>   	return 0;
>   }
> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
> new file mode 100644
> index 000000000..4766d8496
> --- /dev/null
> +++ b/tools/gputop/meson.build
> @@ -0,0 +1,6 @@
> +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
> +executable('gputop', sources : gputop_src,
> +           install : true,
> +           install_rpath : bindir_rpathdir,
> +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
> +	   install: true)
> diff --git a/tools/meson.build b/tools/meson.build
> index de866c392..8002f707d 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -69,11 +69,6 @@ if libudev.found()
>   		   install : true)
>   endif
>   
> -executable('gputop', 'gputop.c',
> -           install : true,
> -           install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> -
>   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>   	   dependencies : tool_deps,
> @@ -122,3 +117,4 @@ endif
>   subdir('i915-perf')
>   subdir('xe-perf')
>   subdir('null_state_gen')
> +subdir('gputop')

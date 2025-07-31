Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E53C87FCC
	for <igt-dev@archiver.kernel.org>; Thu, 31 Jul 2025 08:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8570F10E727;
	Thu, 31 Jul 2025 08:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1tXVagD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0173D10E258
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753950571; x=1785486571;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HmxIzEv0AllxUDyncE0N2vdx5NQKa1+22oUcOP3i/Eo=;
 b=D1tXVagDndfVZDGa9CLuoA6/CmKx4GgFDKbcjBkBXVNLtjB4EXGwskc4
 cIW/bVR+hfxADbOnqD6v/pNHOy5Pyu63QsQJyLkAQ8vLjiJYTIAwnJfG5
 r02MIqR3/JBOEONMlnn21ESSAbX0SORYAl5bfaaHETVlz3J9z1BhwqWBD
 f3i4OYAf7m6Hz5tDAkLvhoCOQtL+WOK9oY9jniZmuYekErxDBhbgSsiZK
 bHY2wNPy9rU0fafQw/zFKT0+ufOulI1ANI/1OchQf/Cfgal1ClmT3Y5Ec
 XaBW5qMQ++T5v65OXtC+niMp5SSiRiwkcO260OP4q0A+t1anOdwqPeKzZ g==;
X-CSE-ConnectionGUID: 42PGQdhPSpuxdg2nc+Q6kA==
X-CSE-MsgGUID: HoM0GbhcTpGsWD7zP0Lfog==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66960022"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="66960022"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 01:29:07 -0700
X-CSE-ConnectionGUID: UkQ6PYj5QIiwNda4U9QmPg==
X-CSE-MsgGUID: 0tpGYJXaQDyzXJO8OJYlCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="167457050"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 01:29:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 01:29:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 01:29:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.53)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 31 Jul 2025 01:29:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eebt8l1aGnNHzQDB3IpkWKRaNA8hp+fd+OgJ8kExdY0j65vp7PJ0LIHkcNkXJslF0PmJ1K6GamXO2oDE5sH473pEMt3ZTyjBBA+KuNDUiADYrNNzTuP12h6Z3ZmCAqaqcJZOAB3Ei1kMTEQpqMXf+20KNE9rvPPWozgpBsPVg6Q/evowf7JFTqJVGvBdOjvN92KKXTCgfEmWdMMdI63jO+h+KWvDiT2gSYEnXA8GqhGnBtK9rDCpoo7XXwIkV2h12RdtY7yNlGetPeFSu05vbH8ZMZgegOJxCIstXtlG29/g0KV242nlVh6Wrq4CwLiojrvhnSRFksYGsUDAh7rr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ovbzbIDEgT8oRt2zWS5U+uUDBJS6wVM/1yT5BWu/F0=;
 b=kYYcU43McrvbAnRv7Wjimky89DS2mGqdn1aHiWUjC1qFqQfmhn6aez8hAfQP1Br3pYWEUNJwZgLpabjPPdnjO/6/AFkRYUcgO27GmJKNMIzcffmNC7wYbGq31cqsd9R4kd1vPewnn25vsVZRJI2ddMh13xPoQ1wlrG2lw8KBpqwDnshcBotIXS6j6Ur7pGZI4cdVbtWsIeqWxVPyl46rElhJ2zsgqhZ5SBBFWO3cB90oc0cw0eHjktN663Mdvtvec7YyfSRL+mBw2EgAhQ/W/MU36WlgVPtQbeuFwkm4gYkGtlVraI3KepFe95xYZ1Ez6yoPVYV3CeSFuIa9dPTkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 08:29:04 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 08:29:04 +0000
Date: Thu, 31 Jul 2025 10:29:01 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <marcin.bernatowicz@linux.intel.com>,
 <michal.wajdeczko@intel.com>, <michal.winiarski@intel.com>,
 <satyanarayana.k.v.p@intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_sriov_vram: Add test checking
 VF access to VRAM
Message-ID: <20250731082901.4ykdpmnywkx7ythr@intel.com>
References: <20250717090812.28628-1-lukasz.laguna@intel.com>
 <20250717090812.28628-5-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717090812.28628-5-lukasz.laguna@intel.com>
X-ClientProxiedBy: DUZPR01CA0350.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA2PR11MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b1b178-f9e0-425b-ddb0-08ddd00c4f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjVoYkZ0U0hrdDg3L1VYZDIyQVFQeko2Q2NQd1ZNdms0SXRRNDR2ajJ3RnV2?=
 =?utf-8?B?T3RISHFHM2QxY0hveHNSOUhrb3hiRjBYblU1aVhWSEsrSkJQZGExWWpQWUpK?=
 =?utf-8?B?WUh1cFRXM25RUk9LWlU3U1RjVTRlWnpRby9HSzlmamJVaUxPSGMwcUJWelVa?=
 =?utf-8?B?bW5BY1ZKeVJHNnpPMGJ0SnJvTExUMXd6cXN6MHROeElZaXZhVUl1Mmt4anhB?=
 =?utf-8?B?azUxa3JJYjJuYlR1SGttSEQ3QTBRVUNMVHhLT2t3Tk84WTZ5K2d6TzRUWkQw?=
 =?utf-8?B?UXFFUVhLMTliY1k1ZHBYWmlrVnhNU2ZaQkRJc0xzQkxDbDRDZGFKc3ZMUVBR?=
 =?utf-8?B?d1ZacmFPdDJzOHVRY0lFUi9lYUpFTEhsZjlMTVg4NUYvaUZDZ2xXcGV3UmRC?=
 =?utf-8?B?L25xL1IreXArRVRHY0w1dGxPUXprSlgwWlNJT21TOTVJbE5wK3ZMT0ptS1pY?=
 =?utf-8?B?MUw5bnhoMkI2d09iN2FWM2NnZ2lQYzRQeDFMY2pzVG5GMHBqNTI4Ulp2TERk?=
 =?utf-8?B?UkdKVUZxSlQ0VVZXZ21PaTJkdmwzV1hPYWFnb2dQMHE3NXY2UFlHNWFhMjRK?=
 =?utf-8?B?WkdhNldTekhIZC93Wm9oZiswdlBPOXNlRmIvQnA1MXRVaERmMFFYTnBlMFll?=
 =?utf-8?B?MWM0WEczWFNvekU4V2JHMjZmWGh4TTlETTZScDRic1ByYjJOOE8xZzNTRXJz?=
 =?utf-8?B?SU4xVUM0TG9CNUtVVFNJeWFsZ2JyNHNWVlgwUHdJNW9yY01iaTJHMDdNc2Fv?=
 =?utf-8?B?bUJreWh5YUFKL0Y3Y04zUnBBSWd2dWpFRG5IazFnQ1RYRnIrU3ZnbVJFMmZX?=
 =?utf-8?B?VUo2RE9KOFRuYUxKcWNCWFB6a1ZEcmtabHpCUVh1eFRIT0ZNTFI5WWM3UTNI?=
 =?utf-8?B?NmFacFY1RzZOTjl5U05nMzNpUXZvUHg4TTkvcTkvNi9OY3BXQytpWkpZZ1RY?=
 =?utf-8?B?YWJuNnpid2srbUVSMG5xdlZZUU52M0ZNcEdhK2hGa3cveFpOYTJIV0tzMzkx?=
 =?utf-8?B?SEdsZm4vczA4MkNLTEZJb0Fpb1AzOTBOMG8zbmVjT1ZkVjBQV0JmSU0vei8x?=
 =?utf-8?B?VE1pOXMweGNPdGlPdDVkb1V1aThTMkYweCtoSyswV04ra1pGWHFoREFwSUhI?=
 =?utf-8?B?RTBNV0graWtJQ3BFaVVkQ2tlcUNqeW9MZXBuN1JrOUYyaEpITEN1VGg4ZEJl?=
 =?utf-8?B?cEw2dVFwRzdwcHZkbTVnS2lKNWVjRFVYOTZUSXljYnV5QmdzOEpvb0gzd0ZJ?=
 =?utf-8?B?TlN2VmY2MnpzQXdoZ3ozSnZUcjNxdHJtSHNrL0tzSHhLNzBYWUlGT1hJTldB?=
 =?utf-8?B?REFlbGt1WFZha0VXTXNTMUFtcDRTbFhFWG5OWk81elVXY0ZhZDRnT1lhREZT?=
 =?utf-8?B?TW5tdTVEcEluVW5zandsUnJjSElNNnFKQWVhZjl3T2lIZWlHREtHaXIwcmVW?=
 =?utf-8?B?bE9uZjRDbEF4Q3BCVkJMVDhtTWZXRXB2Z0lHZzNhdm5yNjE5M3Q2MEljK21J?=
 =?utf-8?B?RGtrcG1VZWZjVkdEMUkrUnF1STFGb1VWVHd1RUNWcllUMm9sbG5KVTVRRmdT?=
 =?utf-8?B?THRld0hJMnltU2cyeStHbVd3c2tDUHBXUTZnVkkzaE03VWs4RFRvcHJNa3V0?=
 =?utf-8?B?cUw4MWZoK3VWVkt1QzgvUnNPazZ6VUtLWUhmakc3ZlV4c2tKdENSZGVIMXBV?=
 =?utf-8?B?ZTVSb1dESUdPQmQ5eU1GMm4wRmhhdDdVeHE5WVVPcFJ1MzNyeGFJaVg2QWFt?=
 =?utf-8?B?RElVVC9VdUdFVER4U0grc1JsME9LS3ZCVzg3ZGlvMjBKOWJiNTVOdDNBVVNY?=
 =?utf-8?B?WW8zOWxKN3NRREYrdGVsQTNzZ3ZoQXEwbXZGT0FFVVZ0THRaS1g5Wldwdzds?=
 =?utf-8?B?Tkk0OTFQV3Q3akJlRkdMc2prK0FzR2hQYVhvbmtkck1mMzE0ZUIzUnp1OFpn?=
 =?utf-8?Q?CqgLF8j5CcU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azAvZENZL3dnTXlQNzBhRXRpSmJnZTNDQ0x3Mjl5eitaYURiYldTZ2kxVXFO?=
 =?utf-8?B?am1mTzU3Q3RPVDJJYTZ4dkNsc0Y2U2hnbGJnRUdyY3F4N1lzZjZsT2VxMitH?=
 =?utf-8?B?bHlmcWthVmZXZ3BaaklRNUZRSHI4M0FiQm90aFRRdnBQd2NWVkZES3paVE1r?=
 =?utf-8?B?YXdORHBCM3Z2a285VEZpK3JneHEwUUY5RlVXZ1cvVHR6Qkc5bjVkOVI3clRL?=
 =?utf-8?B?c0s5Mmp3V08yM0dJQzNpVWwvOTZoV0RGT09sQ0k5QlBhVmZJN0lXNDhGaGxB?=
 =?utf-8?B?VzAyR1c2MEpoaS9kamY4c05SWWFaL1hpcnAvR2E3WEsybXVYdFRDdVkwUFN1?=
 =?utf-8?B?Y0RaVG9tdkh6Slk5T01acDJueE5yTXpkTWZFY2RUcFZseXNiSjh4WDNJYWtu?=
 =?utf-8?B?bGRVTElKQU5zY2NxM01ZejZFK1hkQmRnK2E5eVRWcHBzaXdzR0lsc0Z3eElu?=
 =?utf-8?B?TWp0Uyttc3p6K3hRSFJlckNLMHhsK25ZNW83RHBpVnRvQ0VXdlNJWTVRa013?=
 =?utf-8?B?djJlU3ZxQ1Jldmc4WVJZVzRsejlyd3p1Z3JRS3ZzWFVqRU5kUGRUTTlnWXFZ?=
 =?utf-8?B?Ny9ORDMzMGZQeXprQzR2ZVhaZUViV0lLZU9ob0ZFb2tGMTJMQ3ZDNnZPMjlP?=
 =?utf-8?B?bUxRT0pITjlYTTg3dWNIM2xxSEFtQWlSNTVJVFlUZFZLWXR3WitqV0hKM3FQ?=
 =?utf-8?B?c3dPOURrT1NKdCtZZ2Y3QnBsalZKVmtpY0tXSklHZlpsbWc4Ykt1UklwakFN?=
 =?utf-8?B?MnZtNzJ3bFhwQTIrV0o0L3ZzL3FDV1RSbmt5azZzaGkzencxb25XazlnWGhC?=
 =?utf-8?B?T0pDRllJV0hMeTVycW14V1dzUGVFRzZVR2ZBV1RBd3lmNHV6OHIwdGJlVW93?=
 =?utf-8?B?YjVjZjQxdGRoeVlCM1dMM1hodmowaWlWWHM4T09MWmJ4QVJ6Q0FhRW9keHdt?=
 =?utf-8?B?Vm96VXo2VEpDNG1qTFdWakhNOGVldGcxQXFVU3NLSm5lRnJGY3g0QUpad3Z4?=
 =?utf-8?B?QUg4R0piUDV1Sm1US3h6Q2ZnN3E4dDFQaGQyTEVYcEZsQllBYXI0YktEeW1K?=
 =?utf-8?B?ZGFCdDhtT1IyNnVLRmt0MWZGVUZqRTA0SDZPcU03cTE2bjI0ME13TkVBNGdN?=
 =?utf-8?B?dDVmQXVqcTdMWkRHTDdHdG5PTlFUZTc0UVNpR1hkZlY0SVRhTm8zYXlSR0g2?=
 =?utf-8?B?LzJyNmFUbnE0VVpVTkx5RGVxMlovMFZyT3I4S1ViWjNvT0JscjJWRXdtTVlD?=
 =?utf-8?B?aDVvcnNBVGJsdVBMT2dLUCtKM3VrcDdhcEZvVFNzSlljUkNuN256UGNhQ0Fp?=
 =?utf-8?B?cDFmZ2FLbVFTUmZUV2E3Nld4Nm9rcHFSZlBHdjRGanYzbFVwZVNRaUpuei9F?=
 =?utf-8?B?WWd0RTdHSG5Od0hidGsxVDRZUWYrQ25mVUlNdTR5dnlYdlVJdVU0SkhkWlN4?=
 =?utf-8?B?b2I1dkxiWlhFSWlUUmtneWwwYUZZb2MzbWdSSkNEeTAvZzQ0QzFQMWVSdDZv?=
 =?utf-8?B?QVY0REpUdVdSQ0VMcVdpdS9jRnppZGJsbUhoVFZwaWo2eUJINmtlZFVHVTIz?=
 =?utf-8?B?UjZBZDNySjl6ZXhjRnZjemJKQVhlY295aWlXcmVnSkJxUGdmellPSFVoeW9T?=
 =?utf-8?B?VDhIblJJUFFxNU1qWmFCN3NjejdFcUQvYXR1ajltSXJITC9NVHJwNEJTZ1hz?=
 =?utf-8?B?Qml3ZVpSdlp5Z05ZWUhWY0RHcUpYZHV0Vk4wNzhtT0ozT3lyQS9ERmZ5bkhs?=
 =?utf-8?B?SUdIY2JzSXlGRmxEZmwzV1Q4TFVNNHB3Sys4Nnk0S3lDcGFqWi80Smt2UzZ3?=
 =?utf-8?B?b01RMk1YaEUzdkMyMjk1Y2lnWVU0R0pWVW5sSnRjQ0dsWWdXQW9DK0RhOU9n?=
 =?utf-8?B?cDlGT0o0dmhWZENsemwxSnA2RStLYnlEVk0wS01tb0l5THVKZ2VTeHlUcHh0?=
 =?utf-8?B?TkU4RG53VmRuaTA2Y0hWZzZKRmx0OWtiMktIY29BVFUzNWx5d01mclArSmtv?=
 =?utf-8?B?dVJoclg5NnJPQ3dEZDdsNklxWmVqdWdPdkdMS1g3TWlRbzA0RkhTd3BxM1d3?=
 =?utf-8?B?SWhrSnVYY05rMUd5UmhSMVppQlVBbVgvYTQ2aVk3ZEZ4cWxrZlRlZStjRUcz?=
 =?utf-8?B?U1J0Z2l5WlB3NGZvY2dNTGllUkxQanZyelp0c2FzaTNjb3FqbUw3VmFWRmJ3?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b1b178-f9e0-425b-ddb0-08ddd00c4f26
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 08:29:04.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lSiXmiwM2ThPy64IfAhLmVxKpxPM5h5SJ44fjlG23XzT3iMziacyeH1T6d4xM7tOpLmO5PcdJAX2y2XL1itbhZjT0zOf7qE6oRVdCmmf+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
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

Lukasz Laguna <lukasz.laguna@intel.com> wrote on czw [2025-lip-17 11:08:12 +0200]:
> Add a test to validate VF access to VRAM via BAR. The following
> scenarios are covered:
> - VF can access all provisioned memory via the VRAM BAR,
> - VF cannot access memory beyond what's provisioned via the VRAM BAR,
> - VF can access memory via the VRAM BAR after reprovisioning.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_sriov_vram.c | 310 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  2 files changed, 311 insertions(+)
>  create mode 100644 tests/intel/xe_sriov_vram.c
> 
> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
> new file mode 100644
> index 000000000..82f0a2f09
> --- /dev/null
> +++ b/tests/intel/xe_sriov_vram.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2025 Intel Corporation. All rights reserved.
> + */
> +
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_sriov_device.h"
> +#include "intel_vram.h"
> +#include "xe/xe_sriov_provisioning.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: xe_sriov_vram
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: LMTT

LMTT != VF VRAM

Either assume that this test tests LMTT  and name the test xe_sriov_lmtt,
or else you cannot use the LMTT subcategory here.

In my opinion, this test  tests VRAM access via LMEM BAR on VF (and indirectly LMTT),
but these are not direct LMTT tests.

But what if the platform used some other mechanism instead of LMTT?
The xe_sriov_vram test should still be valid.

> + * Functionality: VRAM access
> + * Description: Validate VF access to VRAM
> + *
> + * SUBTEST: vf-access-basic
> + * Description: Verify that VF can access all the provisioned memory via VRAM BAR
> + *
> + * SUBTEST: vf-access-beyond
> + * Description: Verify that VF cannot access memory beyond what's provisioned via VRAM BAR
> + *
> + * SUBTEST: vf-access-after-resize-down
> + * Description: Verify that VF can access the reprovisioned memory (reduced size) via VRAM BAR
> + *
> + * SUBTEST: vf-access-after-resize-up
> + * Description: Verify that VF can access the reprovisioned memory (increased size) via VRAM BAR
> + */
> +
> +IGT_TEST_DESCRIPTION("Xe tests for VRAM in SR-IOV context");
> +
> +const size_t STEP = SZ_1M;
> +
> +static uint64_t get_provisioned_vram(unsigned int pf_fd, unsigned int vf_id)
> +{
> +	uint64_t size = 0;
> +
> +	/* TODO: adjust for multitile platforms */
Why not make a multi-tile version in this patch?
It will be necessary anyway.
> +	size = xe_sriov_pf_get_provisioned_quota(pf_fd, XE_SRIOV_SHARED_RES_LMEM, vf_id, 0);
> +
> +	return size;
> +}
> +
> +static bool validate_access_basic(struct vram_mapping *vram, unsigned int vf_id,
> +				  uint64_t provisioned_lmem)
NIT: s/provisioned_lmem/size

hmm, If you later use size_t for offset, then I think you can use it here also.
> +{
> +	uint8_t read, orig;
> +	bool passed = true;
> +
> +	for (size_t offset = 0; offset < provisioned_lmem; offset += STEP) {
> +		orig = intel_vram_read8(vram, offset);
> +
> +		read = intel_vram_write_readback8(vram, offset, vf_id);
> +		if (read != vf_id) {
> +			igt_debug("VRAM write/read check failed on VF%u (offset: %#lx, write: %u, read: %u)\n",
> +				  vf_id, offset, vf_id, read);
> +			passed = false;
> +		}
> +
> +		read = intel_vram_write_readback8(vram, offset, orig);
> +		if (read != orig) {
> +			igt_debug("Failed to restore original value on VF%u (offset: %#lx, orig: %u, read: %u)\n",
In the log, we should probably use full names instead of variable names.
> +				  vf_id, offset, orig, read);
> +			passed = false;
> +		}
> +	}
> +
> +	return passed;
> +}
> +
> +static void access_basic(unsigned int pf_fd, unsigned int num_vfs)
> +{
> +	uint64_t provisioned_lmem;
> +	struct vram_mapping vram;
> +	size_t vram_bar_size;
> +	bool passed = true;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	for_each_sriov_enabled_vf(pf_fd, vf_id) {
> +		provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
> +		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
> +			  vf_id, provisioned_lmem);
> +
> +		vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
> +		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
> +
> +		if (vram_bar_size < provisioned_lmem) {
> +			igt_sriov_disable_vfs(pf_fd);
> +			igt_skip("VRAM BAR size is smaller than provisioned VRAM\n");
I think this is a valid scenario.
In that case, I think we need to limit the test to the size of BAR.
> +		}
> +
> +		vram = intel_vram_mmap(pf_fd, vf_id, provisioned_lmem, PROT_READ | PROT_WRITE, 0);
> +		igt_assert(vram.addr);
> +
> +		passed &= validate_access_basic(&vram, vf_id, provisioned_lmem);
> +
> +		intel_vram_munmap(&vram);
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_assert(passed);
> +}
> +
> +static bool validate_access_beyond(struct vram_mapping *vram, unsigned int vf_id,
> +				   uint64_t provisioned_lmem, size_t vram_bar_size)
> +{
> +	uint8_t read, orig;
> +	bool passed = true;
> +
> +	for (size_t offset = provisioned_lmem; offset < vram_bar_size; offset += STEP) {
> +		orig = intel_vram_read8(vram, offset);
> +
> +		read = intel_vram_write_readback8(vram, offset, vf_id);
> +		if (read == vf_id) {
> +			igt_debug("Successful VRAM write above provisioned size on VF%u (offset: %#lx)\n",

I don't like the word “successful” in this context: we just failed at something and the test
returns “successfull something”.

> +				  vf_id, offset);
> +			passed = false;
> +
> +			read = intel_vram_write_readback8(vram, offset, orig);
> +			if (read != orig)
> +				igt_debug("Failed to restore original value on VF%u (offset: %#lx, orig: %u, read: %u)\n",
> +					  vf_id, offset, orig, read);
> +		}
> +	}
> +
> +	return passed;
> +}
> +
> +static void access_beyond(unsigned int pf_fd, unsigned int num_vfs)
> +{
> +	uint64_t provisioned_lmem;
> +	struct vram_mapping vram;
> +	size_t vram_bar_size;
> +	bool passed = true;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	for_each_sriov_enabled_vf(pf_fd, vf_id) {
> +		provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
> +		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
> +			  vf_id, provisioned_lmem);
> +
> +		vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
> +		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
> +
> +		if (vram_bar_size <= provisioned_lmem) {
> +			igt_sriov_disable_vfs(pf_fd);
> +			igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
> +		}
> +
> +		vram = intel_vram_mmap(pf_fd, vf_id, vram_bar_size, PROT_READ | PROT_WRITE, 0);
> +		igt_assert(vram.addr);
> +
> +		passed &= validate_access_beyond(&vram, vf_id, provisioned_lmem, vram_bar_size);
> +
> +		intel_vram_munmap(&vram);
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_assert(passed);
> +}
> +
> +static void resize_and_access(unsigned int pf_fd, bool resize_up)
> +{
> +	const unsigned int vf_id = 1;
> +	uint64_t provisioned_lmem;
> +	struct vram_mapping vram;
> +	unsigned int total_vfs;
> +	size_t vram_bar_size;
> +	bool passed;
> +
> +	total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, resize_up ? total_vfs : 1);
> +
> +	provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
> +	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_lmem);
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, resize_up ? 1 : total_vfs);
> +
> +	provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
> +	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_lmem);
> +
> +	vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
> +	igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
> +
> +	if (vram_bar_size <= provisioned_lmem) {
> +		igt_sriov_disable_vfs(pf_fd);
> +		igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");

> +	}
> +
> +	vram = intel_vram_mmap(pf_fd, vf_id, vram_bar_size, PROT_READ | PROT_WRITE, 0);
> +	igt_assert(vram.addr);
> +
> +	passed = validate_access_basic(&vram, vf_id, provisioned_lmem);
> +	passed &= validate_access_beyond(&vram, vf_id, provisioned_lmem, vram_bar_size);
> +
> +	intel_vram_munmap(&vram);
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_assert(passed);
> +}
> +
> +static bool extended_scope;
> +
> +static int opts_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		extended_scope = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --extended\tRun the extended test scope\n";
> +
> +igt_main_args("", long_opts, help_str, opts_handler, NULL)
> +{
> +	bool autoprobe;
> +	int pf_fd;
> +	static struct subtest_resize_variants {
> +		const char *name;
> +		bool resize_up;
> +	} resize_variant[] = {
> +		{ "up", true },
> +		{ "down", false },
NIT: Maybe instead of up/down, we could use expand/reduce.
> +		{ NULL },
> +	};
> +
> +	igt_fixture {
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +	}
> +
> +	igt_describe("Verify that VF can access all the provisioned memory via VRAM BAR");
> +	igt_subtest_with_dynamic_f("vf-access-basic") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					access_basic(pf_fd, num_vfs);
> +
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				access_basic(pf_fd, num_vfs);
> +			}
> +		}
Am I correct in understanding that the basic scenario is with a random number of VFs
and the extended one with total VFs?
If I run the extended version, do we still want to do random?

Thanks,
Piotr
> +	}
> +
> +	igt_describe("Verify that VF cannot access memory beyond what's provisioned via VRAM BAR");
> +	igt_subtest_with_dynamic_f("vf-access-beyond") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					access_beyond(pf_fd, num_vfs);
> +
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				access_beyond(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	for (const struct subtest_resize_variants *s = resize_variant; s->name; s++) {
> +		igt_describe("Verify that VF can access the reprovisioned memory via VRAM BAR");
> +		igt_subtest_f("vf-access-after-resize-%s", s->name) {
> +			unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +			igt_require(total_vfs > 1);
> +
> +			resize_and_access(pf_fd, s->resize_up);
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		close(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..6054a2c34 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>  	'xe_sriov_auto_provisioning',
>  	'xe_sriov_flr',
>  	'xe_sriov_scheduling',
> +	'xe_sriov_vram',
>  	'xe_sysfs_defaults',
>  	'xe_sysfs_preempt_timeout',
>  	'xe_sysfs_scheduler',
> -- 
> 2.40.0
> 

-- 

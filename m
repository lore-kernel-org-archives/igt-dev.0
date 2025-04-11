Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9CCC36010
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 08:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BECB10E049;
	Fri, 11 Apr 2025 08:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMwqagsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1887C10E3C0
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744359708; x=1775895708;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pa3CnKsJ3Z+e5iWDg/qIZhiCi7sHjF9fpl1U510r0OA=;
 b=YMwqagsnnyml9nNIiIUIC02ZgT5eh0814UQZmNsmhWmcBkXMcShiGbne
 5ZB5bK3ANoaAm3U36Gcf2BdI8llfawETyV6YzBrO4G11otA8xvdovebtS
 wHlwbK7KSc9NkW4XP/hPgBFnSMCeWxPfaAF+qTOMLZY5kc3+9HTeHwI2z
 yuNRwklx0Xxa4DI6ZVhG4nx+8MmHTVvEl06toza1Vc+Er0XDQwolc5RdD
 bH2mOXZvi82nK0o2IEY3/AYsqCHdiylsFsLIagyM9c7DHcj3cW47l3GfU
 d2wN8dvTf4+LJNwj6ghXdU/3X45i2RpCzJQHuPY+xdt/AtWhvwK6YF0lC A==;
X-CSE-ConnectionGUID: eNb+/cTfRFOQIiidj46e2g==
X-CSE-MsgGUID: JJi6Rtb8Qo+l0ikAc5hPZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45615183"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45615183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 01:21:46 -0700
X-CSE-ConnectionGUID: cGYm/nD3R46Wph1DU2ynrw==
X-CSE-MsgGUID: 8oPtLaOVQ8GJZSka4eK3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="133238274"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 01:21:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 01:21:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 01:21:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 01:21:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1CoJ3dl69bbCai8i/vqNpXGib33Lvf34BgOzYbdVQ0JrLKGIInk+bj6pVcha3nwex7irWxiSsgKxkZJ7nS/VelNAOpm2l4dHJPSlEjiD2zV+YQPG6t6flIllrIWljuVAnyw3qygtY1E+CdC9yezPNqTPfe5AK1lnFQ17qVLRZ2FRHSuNAYK9CMya2FhqACMRq73T7qXzoXY0UkcKwnTo6+lstAGWvdW3+pxtOa/CAxboyAIu5eMkaHJpIIKbmIV3OAvWMlw3CBY7xGS4ji85iI+R8qWEpTumdm614LLZusSufl7NEUdU8f4t7BjQtI5KWTtSxm0e1xhvpIVCkNBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa3CnKsJ3Z+e5iWDg/qIZhiCi7sHjF9fpl1U510r0OA=;
 b=noO3VA/Ovus4VBSO98BtSjlkueF+rTVCgTGyXOrWOVZECtejZcEZM+GkX0R7GksMfUsV8KHRWHApJ+egrotDCufUrT9tTnLaB95sbs8ceJtV2Prt8bfhwIMkPt7aPE04alGxzLGMOuGUa5OI9AtujRBtjq4Yk5ccOHN1jMATxzS1sEG/SiSiHfq3IwTjyx4k2prj2RwpKEhXHPKpiUE86WMVwJHjTKwLyxjyzi9PkIQ0MKt+IFIu4LzxNkAYB85NnKQs1SwC5uw1Kpwjv2HfLx0YuIMZmDiNHT1DmjF/Vy2hUHQL4XOj0dVMaSi+5QjbC31KqQKuCzeSp1ayEsFTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 08:21:43 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 08:21:42 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>, "Sokolowski, Jan"
 <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/xe_eudebug_online: Calculate bb_size from
 shader
Thread-Topic: [PATCH i-g-t 1/1] tests/xe_eudebug_online: Calculate bb_size
 from shader
Thread-Index: AQHbpJfzCEFyPkIYx0yXh2WdjNfV5LOc54SAgAFAoKA=
Date: Fri, 11 Apr 2025 08:21:42 +0000
Message-ID: <DS0PR11MB72647A9913DB96C94109CD14D9B62@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250403125525.31573-1-dominik.karol.piatkowski@intel.com>
 <20250403125525.31573-2-dominik.karol.piatkowski@intel.com>
 <20250410125911.dwn4vbqfk54wwnxt@zkempczy-mobl2>
In-Reply-To: <20250410125911.dwn4vbqfk54wwnxt@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SN7PR11MB7065:EE_
x-ms-office365-filtering-correlation-id: 992c653a-bd85-455e-3470-08dd78d1e43d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?amZPSVVlZFZBZXZFbHF1QVdiRit6ZjNQR2dOdkEzQ2lXZEtmcUxOSmlwaU80?=
 =?utf-8?B?UW5KdFVLejVPN01rYkw1V0ZxRysxUzA1S0pocFY5RTBFUUtpaXg2YnhLbi94?=
 =?utf-8?B?MlR0c2xodUFEb3doRHpnYTN2emtLTlRXUUNIeTlvTHcvczlHN1RVZTJYV1M3?=
 =?utf-8?B?RzZNeXk1VUYyVTQvdEtNY3p2b0ZaWjlmdU9Hakc5SFVuMEw5V0VGZUdNWU5Y?=
 =?utf-8?B?d3JOcldVZElGYlV4citUeWJIVFdFYjBrOWxrT1JjbG1PcUNaaVh2VkI3djk3?=
 =?utf-8?B?TzAxVTRIUjdTTjlPWXd4dUxoaU1WU25VMGlEaERzekE5K0c4VHZNVmJQa05B?=
 =?utf-8?B?U1pFNjNONWlqU0lTQ2JSNWozL3g4Ly9DaWR1RVZFb2xmWTRLK3FLK0prU1Y1?=
 =?utf-8?B?UE9VVElQU1hIM29xMFQ4UTBiaksrSk41VnB5UWp3cFN3RDltVndGWVoySHQw?=
 =?utf-8?B?UElSTGFFWmZ1RVhjWVdlbFlYaHRPblpvWS83MDhCRzZ0Z0VBWjFpclR2K0I1?=
 =?utf-8?B?QVpyUFF5N1VRVEp5OVVDL0hIeGtxR3pyTWE1V2VKRGUwRTBFdHQ2bStUUkR2?=
 =?utf-8?B?ZzNObCt5SGx0OVhGNEk1cmFwV0tvNUdJV0xEOGJEZGx1U09aenl1Y3oxcW9B?=
 =?utf-8?B?dkJZOFd3NTRZTzdNWnlzR3ZaTWdseWlIMDFRVUdjeVdsam1IQk5UMXloVHhJ?=
 =?utf-8?B?WCtkQlVBajIwanhJdnpCWlg2bkE1dW9wdUl2dlN4OGNEWCswZnFid0VUWjUy?=
 =?utf-8?B?d25tTE9qQ2NIQ3g5TFplaWRwYld5NXB3NlNlZVBEakcvMlFsMzlZM2dOdmF2?=
 =?utf-8?B?TnN5dWl6WW1LWVdvTDRrMHdjbXV2QWIzbjJZWWxXbHdhUmJTSFFoaFJxYjJv?=
 =?utf-8?B?YmtlN3BHb3dXN3RrRkdVcFF2QWtpMnltVW80K0FmbnArWUdzcllRZW1FRWRN?=
 =?utf-8?B?V0xpcEQrRjNoeEJFK054d0h2MEt6WWlSaVFRWGI4RTlTS0lxNHpEWW8yZGNk?=
 =?utf-8?B?Y203VDRvVkxZZDJtVTcvZkU3alBIa3NhT016MDczcEdvc3ZTUU0rTFRiRUVr?=
 =?utf-8?B?S245aklOMzBWVG96akRUOC80NWZwbkVONHZGYWNuR3B2QWpsanlGMGF3T3Aw?=
 =?utf-8?B?SDN6OHRpM0VGdjNMeVRPUzNHV2VWZjA0enZNZWgzc1A4VHY2bEdrMU11TGY2?=
 =?utf-8?B?YjBqVWcrRTJzd21RK1F3dFN1L09mZmdIRmhPdFRra2N2TGh3blRWVDJOanAr?=
 =?utf-8?B?MnhZZVFOUkxaU2ZNUjE3YnA5ZW9rMlAwTDJZY0lqbHlCSVNOT3dmWi9xTnUy?=
 =?utf-8?B?RlBHNkFWZnJURm1USGJIUDV5QkVEQmErUHNWOFF5SWNxUUhBN1hlYTVkTm12?=
 =?utf-8?B?OTZBVEpkdWcyWUVETHBRUzFTazQrVkZxeTNEVkd6NkhmbnNiUGJRRzBVVlB1?=
 =?utf-8?B?RDFyOGN5OUVQZWcrb3NwZVpldjhJMmpWNE9obG9VVmtLYVlGdjd3UUE1UlN5?=
 =?utf-8?B?UWJKelZuYUF3SW4yYjBFeE1yN2FkajJsZjJybDQ5OWJDbndHNXFyaFVoU2sv?=
 =?utf-8?B?ZFh6ZWN4dWN0SStid215TlNPWTlNSjhuOVdMR0UwRXphdC85THhJK0dmSC9m?=
 =?utf-8?B?SEoxR0dEd1VybEtQRUtnSFZzL0x6REVMUm9HQVNvYVNKNkdId2ZLWGdvZ2dT?=
 =?utf-8?B?QVE3OHhjZmlub3BLTUFpWDQrNVgraTRNR1JmdDUwbmtuSklFRndQYnlNSVdV?=
 =?utf-8?B?STVZZ2ZjaStqRkxzNldzei9HVk1lZW5paXArTmhQdWNhT1VmRVJuamV4SWlr?=
 =?utf-8?B?VHBlR1lpZlBDbXdlQjlxZnZCYlJOSXRGNFhmeWVET3pEdGh6ckdXVGpKZ0Zs?=
 =?utf-8?B?enBNTnQrS0dVWUtSOHZXcDJYY1c5KzBmY0k1N0ZLZTVxMitnTkFpN0tXVGtQ?=
 =?utf-8?B?UEdJNGNQcXRPVmtnU092SXIrVWxaclBaUjl0S0JaSzhrNXVQTHRLWTBHQXI0?=
 =?utf-8?Q?CWZGVPFAM6Br3mINGqVkIyKDIMoB1g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnY2SWgrUTUwcjJPTGZMUGxmTENNMmtJZWlySkFCUjhLNEJLSyt6L3EvSzA2?=
 =?utf-8?B?NmpObU4waTg4bnpsVlp5T2x4akY0cjZGUnJNc2EvUG1FY2VvRXIzVDRtUGE3?=
 =?utf-8?B?RFdxZVFnNWpyYXhEUU9QNHlmTnVSWTJ1STlYQVhSVjczS2VEOTFZek5IQi9Y?=
 =?utf-8?B?cDN6ZVFWd1dDaXZkRzE3WGpxemJZSUNXeDlmak1XNE9FYUhYYnpibGZHU0Rh?=
 =?utf-8?B?TFJFZnBid3NRTzdoaDZ6TWZsSFZNUUpTY3RsQmxsT09wOWI1cmFRUlBaSGhl?=
 =?utf-8?B?WTVzRUNKbEJzUk1HeWY3YXdMMTg4clJVNlRVNTgvejY5cjYrcVI3RE5VYzFB?=
 =?utf-8?B?dzgyaE12ci92aHMzQlI4bm9XVkRIRlZRWHdlcWJhMWpSbFdDSDdJeExVTFFZ?=
 =?utf-8?B?dG5Xeno2NzlEcWtyeHMvRUV2MjJYZFE1WGhxSVc1ZVV3VFVIckxEeW5Gay9N?=
 =?utf-8?B?WENmZlliTUpBK0ZHTjBnMDFhajVFTCtreVYyUEhjSHR2QU5BcEFIL01kNFdj?=
 =?utf-8?B?LzZxcG55N1BQSHAyUnFsK0RZZ2pjbFFuWGV2bU85WW5aZ1RoZjBSZEtvbTFO?=
 =?utf-8?B?TFBEV3g4VTQ1VlZFams2M3ZGeFJiUk8rYnBpdnBWU0JZTkI5MnZMdDc1U2pV?=
 =?utf-8?B?SkZrdFRKSW1NWmFTVGFHbkVIYW1lR2h2ZUFDT3hPZjlham1CT2ExMXBHNkp5?=
 =?utf-8?B?YVdRSGppdUtjZ0tta1U1VlV2SU80U05NQ1dwMUtOMjBFMFR3azB6dTBpb21q?=
 =?utf-8?B?eGREakVuQTRmNU9zR1NCemI3YW9RSWpLWklFTDFzM1NteS9Yejg5SFl6Z1k4?=
 =?utf-8?B?TnRQS1RmRERBaitYM2M2Wk9pcXZmQUcxUlY0UDJiQlhQTk5WUmRuVHlJdTRz?=
 =?utf-8?B?NnVQQjUwN211dXpuYWc4eEU3UTRsbGduYk1kR2k5eXVyNzV5dWZ4aU5nb25K?=
 =?utf-8?B?SW1LMVNkVjlSUGVycHFoaEVIaTd6YnJLVWpwblRCaWcxdXo1bmlWUWZ4UU5G?=
 =?utf-8?B?bWwyL2ZxNDA4aDVUTDdQSjhIa2RHc3dUeDBrdDBLVDZVQzZ3M3d1SUUxNzQz?=
 =?utf-8?B?MkptcHhranBvRzR3aVEwQ2JJVGlWeC9FUnE4SThyaWkrcU5EK0Nvc0d3TUI5?=
 =?utf-8?B?cnNpSnVENFJkNjZKTTU5TzJKOEswK0trSU9VRktIL2M3dHVuaVA5N3U3c09T?=
 =?utf-8?B?UWJqQ3JaTVNkZGordXNEQzMwRFhhdG1udEVnT1phZEoraXBNaERIRTFqcExz?=
 =?utf-8?B?MjB4K1E0TU9qNjlGcmRtU1ZpYU9vd2FtMlVkNWhuTmM4UlZYUUc0UCtNUEwz?=
 =?utf-8?B?aEdFTFc3c0YxcmVZdUJYRDZsUFNEZUVSYjgreHYwN3Q3REx2SEQ2SUQ5cjBl?=
 =?utf-8?B?SUd0ZFdaNFZ4bzEvT0VPa1VLcFB1eGp2djA1MVQxMGJKNWJGbG5EeVh0OVht?=
 =?utf-8?B?SFhZR2NSTzk1ZGtCTGk5SjNVUGpuWU0rUHlZdlN1VjFZeExncWtaamp2L2pw?=
 =?utf-8?B?ZURBK0RnNjlYMEdvUUlROVVUTWRRTS8xOHB6Z1NmUFpMTENZU3VQZ1pzWVA4?=
 =?utf-8?B?MTNrR3l4R0pVNUJuTTdNUG9WQlUrc3laRlFtMndhZXJXMHo0bVpCcGxKRlln?=
 =?utf-8?B?ekgwclJCNkRpVG1nS0xCVHhvRk16T0dPeWxZN3ExTzNOSUlZb29idFBtdXo1?=
 =?utf-8?B?eEdqYjhJazI4R3QrV2U3clpLZHdLUi9hZXlQMXVqKzBTdG9xN2Q2cnA4VFhX?=
 =?utf-8?B?V0ZNcTF6eTFqZDN1d01qazRWS3UyK2ZZRUZIS0hlS0l2bjFKQXBXdmVzeFl6?=
 =?utf-8?B?MVNXRnRYbCswRUduTzJYTzc1Njg1cGJYeCtLNEdvTFNUcWp0R09PejdHQ2ZJ?=
 =?utf-8?B?dHMxNVlRYSt6cFBWL1ZGbU5GRkdCaEppNG1oRkI3SExVWWx1elpwNGt6aWto?=
 =?utf-8?B?c3BTcmFtUzh3UUk1ZG15WjREb2NISGJFOHZEcDdlbXYySUVMeXc5M1pLanRs?=
 =?utf-8?B?VC9OMUNGN1d6bVZHdklXUzRmTjVwcGxFYzluOXRlTkdWTXlzNFZ0bkE1Wk1L?=
 =?utf-8?B?U0U0WjgwbE9FdGhZaHl3SUhKV01OUWdDQzRROWNWRE9VWno4K1VVYnduNkw1?=
 =?utf-8?B?cUtGOUE4dmRBalhNQmpFemwwWks2MUNCWHM5ZkRqT0xDbzE5NjJEdVNGVXlR?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992c653a-bd85-455e-3470-08dd78d1e43d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 08:21:42.8762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k5yRL0YVvy7cQ1mUAgI7rT1NBSoMT7POS6F0llWvtqhU+8e8r98H1ASvRv9LMYSwGo8TydzqvZpk1+XQDOJ4ywHtPbDlFoc2tsyqT1Xgsvgs5UUaRpowRIPvcniPlgpT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
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

SGkgWmJpZ25pZXcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2Vt
cGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNl
bnQ6IFRodXJzZGF5LCBBcHJpbCAxMCwgMjAyNSAyOjU5IFBNDQo+IFRvOiBQaWF0a293c2tpLCBE
b21pbmlrIEthcm9sIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiBDYzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IE1hbnN6ZXdza2ksIENocmlzdG9waA0KPiA8
Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPjsgU29rb2xvd3NraSwgSmFuDQo+IDxqYW4u
c29rb2xvd3NraUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgMS8xXSB0
ZXN0cy94ZV9ldWRlYnVnX29ubGluZTogQ2FsY3VsYXRlIGJiX3NpemUNCj4gZnJvbSBzaGFkZXIN
Cj4gDQo+IE9uIFRodSwgQXByIDAzLCAyMDI1IGF0IDAyOjU1OjI1UE0gKzAyMDAsIERvbWluaWsg
S2Fyb2wgUGnEhXRrb3dza2kgd3JvdGU6DQo+ID4gUmlnaHQgbm93LCBiYl9zaXplIGlzIHJldHJp
ZXZlZCBmcm9tIGdldF9iYl9zaXplLCB3aGljaCByZXR1cm5zIG9uZSBvZg0KPiA+IHR3byBoYXJk
Y29kZWQgdmFsdWVzLiBUaGlzIGFwcHJvYWNoIHdpbGwgZmFpbCwgaWYgc2hhZGVyIHR1cm5zIG91
dCB0byBiZQ0KPiA+IGJpZyBlbm91Z2ggdG8gbm90IGZpdCBpbnRvIGJiLiBGaXggaXQgYnkgYWx3
YXlzIGNhbGN1bGF0aW5nIGJiX3NpemUgZnJvbQ0KPiA+IHNoYWRlci4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kNCj4gPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX2V1ZGVidWdf
b25saW5lLmMgfCAxMyArKysrKysrLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50
ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5l
LmMNCj4gPiBpbmRleCA4NGJhNzQ4YzEuLjYyOWEwZWMxNiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0
cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXVk
ZWJ1Z19vbmxpbmUuYw0KPiA+IEBAIC0xMDIwLDEyICsxMDIwLDExIEBAIHN0YXRpYyBzdHJ1Y3Qg
aW50ZWxfYmINCj4gKnhlX2JiX2NyZWF0ZV9vbl9vZmZzZXQoaW50IGZkLCB1aW50MzJfdCBleGVj
X3F1ZXVlLCB1aW50DQo+ID4gIAlyZXR1cm4gaWJiOw0KPiA+ICB9DQo+ID4NCj4gPiAtc3RhdGlj
IHNpemVfdCBnZXRfYmJfc2l6ZShpbnQgZmxhZ3MpDQo+ID4gK3N0YXRpYyBzaXplX3QgZ2V0X2Ji
X3NpemUoc3RydWN0IGdwZ3B1X3NoYWRlciAqc2hhZGVyKQ0KPiA+ICB7DQo+ID4gLQlpZiAoKGZs
YWdzICYgU0hBREVSX0NBQ0hJTkdfU1JBTSkgfHwgKGZsYWdzICYNCj4gU0hBREVSX0NBQ0hJTkdf
VlJBTSkpDQo+ID4gLQkJcmV0dXJuIDMyNzY4Ow0KPiA+ICsJc2l6ZV90IHNoYWRlcl9zaXplID0g
c2hhZGVyLT5zaXplICogc2l6ZW9mKHVpbnQzMl90KTsNCj4gPg0KPiA+IC0JcmV0dXJuIDQwOTY7
DQo+ID4gKwlyZXR1cm4gKHNoYWRlcl9zaXplIC8gUEFHRV9TSVpFICsgISEoc2hhZGVyX3NpemUg
JSBQQUdFX1NJWkUpICsgMSkgKg0KPiBQQUdFX1NJWkU7DQo+IA0KPiBTaG91bGRuJ3QgdGhpcyBi
ZToNCj4gDQo+IEFMSUdOKHNoYWRlcl9zaXplLCBQQUdFX1NJWkUpICsgeGVfY3NfcHJlZmV0Y2hf
c2l6ZShmZCk7DQo+IA0KPiA/DQoNClRoYXQncyB2ZXJ5IG5lYXQhDQpJJ2xsIHNlbmQgdjIgc29v
bi4NCg0KVGhhbmtzLA0KRG9taW5payBLYXJvbA0KDQo+IA0KPiAtLQ0KPiBaYmlnbmlldw0KPiAN
Cj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyB1aW50NjRfdCBnZXRfbWVtb3J5X3JlZ2lvbihpbnQg
ZmQsIGludCBmbGFncywgaW50IHJlZ2lvbl9iaXRtYXNrKQ0KPiA+IEBAIC0xMDQ0LDcgKzEwNDMs
NyBAQCBzdGF0aWMgdm9pZCBydW5fb25saW5lX2NsaWVudChzdHJ1Y3QNCj4geGVfZXVkZWJ1Z19j
bGllbnQgKmMpDQo+ID4gIAlpbnQgdGhyZWFkcyA9IGdldF9udW1iZXJfb2ZfdGhyZWFkcyhjLT5m
bGFncyk7DQo+ID4gIAljb25zdCB1aW50NjRfdCB0YXJnZXRfb2Zmc2V0ID0gMHgxYTAwMDAwMDsN
Cj4gPiAgCWNvbnN0IHVpbnQ2NF90IGJiX29mZnNldCA9IDB4MWIwMDAwMDA7DQo+ID4gLQljb25z
dCBzaXplX3QgYmJfc2l6ZSA9IGdldF9iYl9zaXplKGMtPmZsYWdzKTsNCj4gPiArCXNpemVfdCBi
Yl9zaXplOw0KPiA+ICAJc3RydWN0IG9ubGluZV9kZWJ1Z19kYXRhICpkYXRhID0gYy0+cHRyOw0K
PiA+ICAJc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgaHdlID0gZGF0YS0+aHdl
Ow0KPiA+ICAJc3RydWN0IGRybV94ZV9leHRfc2V0X3Byb3BlcnR5IGV4dCA9IHsNCj4gPiBAQCAt
MTA3Niw2ICsxMDc1LDkgQEAgc3RhdGljIHZvaWQgcnVuX29ubGluZV9jbGllbnQoc3RydWN0DQo+
IHhlX2V1ZGVidWdfY2xpZW50ICpjKQ0KPiA+DQo+ID4gIAlmZCA9IHhlX2V1ZGVidWdfY2xpZW50
X29wZW5fZHJpdmVyKGMpOw0KPiA+DQo+ID4gKwlzaGFkZXIgPSBnZXRfc2hhZGVyKGZkLCBjLT5m
bGFncyk7DQo+ID4gKwliYl9zaXplID0gZ2V0X2JiX3NpemUoc2hhZGVyKTsNCj4gPiArDQo+ID4g
IAkvKiBBZGRpdGlvbmFsIG1lbW9yeSBmb3Igc3RlZXJpbmcgY29udHJvbCAqLw0KPiA+ICAJaWYg
KGMtPmZsYWdzICYgU0hBREVSX0xPT1AgfHwgYy0+ZmxhZ3MgJiBTSEFERVJfU0lOR0xFX1NURVAg
fHwgYy0NCj4gPmZsYWdzICYgU0hBREVSX1BBR0VGQVVMVCkNCj4gPiAgCQlzX2RpbS55Kys7DQo+
ID4gQEAgLTExMDksNyArMTExMSw2IEBAIHN0YXRpYyB2b2lkIHJ1bl9vbmxpbmVfY2xpZW50KHN0
cnVjdA0KPiB4ZV9ldWRlYnVnX2NsaWVudCAqYykNCj4gPiAgCWludGVsX2JiX3NldF9scl9tb2Rl
KGliYiwgdHJ1ZSk7DQo+ID4NCj4gPiAgCXNpcCA9IGdldF9zaXAoZmQsIGMtPmZsYWdzKTsNCj4g
PiAtCXNoYWRlciA9IGdldF9zaGFkZXIoZmQsIGMtPmZsYWdzKTsNCj4gPg0KPiA+ICAJaWd0X25z
ZWNfZWxhcHNlZCgmdHMpOw0KPiA+ICAJZ3BncHVfc2hhZGVyX2V4ZWMoaWJiLCBidWYsIHdfZGlt
LngsIHdfZGltLnksIHNoYWRlciwgc2lwLCAwLCAwKTsNCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+
DQo=

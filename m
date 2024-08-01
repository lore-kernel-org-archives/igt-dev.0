Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7F8C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 09:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0F410E8CB;
	Thu,  1 Aug 2024 09:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGgicAuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD9510E8CB
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722504618; x=1754040618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UnOUoym92F0MjbJSSg2HFjum2KUIZcZlsSGiO2Q37Ig=;
 b=LGgicAuI/RH5XXT32/Tp9LQidHNJWeBsSE13bFHO0MUHqHO1m4J4sp9h
 5VOoB/UF+uUQ7Pwk+cyzhdu0uEhHejO73ywbHKKhPfAELfekgeDuCqtPM
 Ihd5MWIS80U8O+wx2rFuAzjSIL45JSo6pNDgEuSe1If+qBfTUSEcm5Jzu
 jnteO58q+8xBRNEORtDaQ6KM1HsTUxr2H/jPQtiko8psWzYKo6sIIiw7v
 FW+8TSwtC24E5bzWJZ/V/JMZ49c8KtQk/NDemZM/iqMAuycgPTUMFAsZo
 TFHNq5XSuyiusJURxkGpkaYBRVftQofJLx1oi9RuHykDr5mAd9zvaF5/E g==;
X-CSE-ConnectionGUID: QnioKPoaRe21t2UGEWPv3w==
X-CSE-MsgGUID: Bhj9m3qDQry4IqTSov9LGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23362957"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="23362957"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:30:17 -0700
X-CSE-ConnectionGUID: NOM+N1m4SUehOYKUhOfL2A==
X-CSE-MsgGUID: /zI15kJMR+Sn8oOmT33yCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="92512314"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 02:30:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 02:30:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 02:30:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 02:30:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 02:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORIwuViq+qwXRi2FtNsc9WpNcZeyMPGwQ7xvokO3Z/ou7WB22vDR+WjvZoOHu3YhNsJhjcSg8+1n3GNzochdsNMuUfL86bWgeF4D8i9l3obOzsQSYn75KU7kgg/mxvSmSOzfisdrd7alBdBUPS2HQX7MaJouk9JkSyCFDpPVI7DeQrvOoz7pcKzYBL8FcxIyw3J6Ta8uMXtfLXH132P2l9OWvLV1OP14HQfHaIHYx4yn9TrqklzML/g6vaXX33DKAMljcJ1SzQfEdbiCfNGKWaSoVboYw6tHIlNYgrKRuZx7I2xzqbPEOO7In5zw/B4stb/3dfGgam1F0T3CosljWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnOUoym92F0MjbJSSg2HFjum2KUIZcZlsSGiO2Q37Ig=;
 b=oUdYW9VwK7yYoagQrEcoTf0mPn6O/oIzsKVNNpxUqtnG2edZvi3d2zvOLbJYrdxyrNZ1uZKZzSptSPy7rFTkvTXogcaK9bVFvvD552nNSaoxFjdhCmrylkhJorB8utTuL9v8gAo7wVxLDCoU/fpH28YydH1fampiWPHp9QRt+bflrOTNDG05uFoCiL3p5bgKg5m3boYZtsUIjXHORxb+2CAE4tYiCgNWrcb01xIhvbZzMis9Sdi1BnL/VwxSN9Z4howJihTI4aQRTVrKEf9mQ4o8v8nQJP/PnwBF8ZWMLXTWX3O1VlMGzoUqwpxBOgJTsfcIcIMXBUjnXCG++r5CxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA0PR11MB7331.namprd11.prod.outlook.com (2603:10b6:208:435::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 09:30:11 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 09:30:11 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 02/66] tests/xe_eudebug: Test eudebug connection
Thread-Topic: [PATCH i-g-t v2 02/66] tests/xe_eudebug: Test eudebug connection
Thread-Index: AQHa4nYgV1Wxd7To1U+EenJ1PJWHfbISI7qg
Date: Thu, 1 Aug 2024 09:30:11 +0000
Message-ID: <DS0PR11MB726434F35B21C96CA3A77157D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-3-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-3-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA0PR11MB7331:EE_
x-ms-office365-filtering-correlation-id: eca59aae-9f40-448c-bafb-08dcb20c8a6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M2JXVzhwdlBaRFo0NlRBN1dUaTZnSDJZalB3a293ZW1pcldIb2JIQUtVajV6?=
 =?utf-8?B?WHpUS3AzZzZHMDV4c25NVHV0emZydFFGbGVUcDA3Vk51c1VybUN5ZDlzYXRP?=
 =?utf-8?B?UU9YUDBodGtHYW5FMVBCUkhYVWduQWRVc2kvSHBtb1MxTnh0NTRTMVFLaitt?=
 =?utf-8?B?aUNwSGQ3cTZHdkkwemJOMjdSVC95N2oycnBzWXhaRGJ1YWxIdThzRmVPZXJ2?=
 =?utf-8?B?Z1VFd082SVFud3o2MjQ4NmFmLzVCdjBIblFrOEhSbEkrdjhXQ1F1YkV2dkVs?=
 =?utf-8?B?YlJvTytUbUM4dnJmd0gybEtWQzA0c25mb2gyODVuMk5JdGx6T0hmeW1OYTVx?=
 =?utf-8?B?UlAwOHZQOGQzeW94MWc3ME9aRnFnQ0V4NjVSbHNRN0ZJMHpmRzJQYzBEUGNF?=
 =?utf-8?B?NmxUUjh1cDNTS2FUUGVreUg2bFpHNFpQZm5uclg3VlhjOEJMaStjQ1lCN1ZY?=
 =?utf-8?B?L1Y5WHVYYTE4b0p1cVVDMEVmVWJsZlh5c0ozeFBjMEw1VGJNajlJa0ROajNF?=
 =?utf-8?B?aE5KZWpzclo2N3hLdEV0Qkc0a2VScnEyQnRqUDNQQVZJTHh3dGFKUnJOWjhM?=
 =?utf-8?B?TnlKNkl3eVpzcDBnV2pYb2pvdXNJOFJGUmIyWHdlOGJFcXJZZlpHQTFFeXp6?=
 =?utf-8?B?Y1kxUjdmRnlvU2ZWLzVBQjVac3o1TEh3UnNKVytsT0tCTEEyeGhPZHdJS3FX?=
 =?utf-8?B?ajVzU3ZNMHlSRUtnSUUwQ3dkMHdrN0J3bWI1R2VPUy92Q2ZoS0d1dkNENXpl?=
 =?utf-8?B?Vk1mK0xobE5GQy9YaVFQM3cwa3d2YTczbUVNVitCcmZRT1FiZFI2SEVuaVJl?=
 =?utf-8?B?QnFUY25raUlNNTdKTWpnOGpYUVd6SXNJekNxSkZxRW9ubGFFR1N4amNYMnhJ?=
 =?utf-8?B?Q1U2QXJTZ040L1BLYUdsSjFrRkNXLzdORnpLdlpRcGI1amhnckZwNmdZcml0?=
 =?utf-8?B?cmloa0J2MkFURWxscFh3MXFCaDJIcWJHTzVLYytyVVpBMFZ4T05MQWVIckpz?=
 =?utf-8?B?dGZkM0htcVNxR0dnV0taU05kNDl2cWxaYTgvKy9PK0lQaEg3aFVTaWVxSzdk?=
 =?utf-8?B?UXQwc2F2aGhHY2JEZzNJMGhQV3RCR2ZERG0wZTA2WjZnU01hbmkzeXZ6S3hI?=
 =?utf-8?B?MHY5Q3QyMjI5amkzTFdUVEZ1UzBERUd4OXVMR2VONERNSjIvZVNkNmErdlli?=
 =?utf-8?B?TEdtRjU5bDRSSzkyVnBKb2xSZ3hxTUdlT1dRZzRkcmgvUk1kM1U2YTNHd2tH?=
 =?utf-8?B?RFVSdVl2L2xZOE5KY1NRNFZaUUVibDN0aXlMZWZ0MjJ0eSs0MXpST1YxMGo1?=
 =?utf-8?B?Y0t4M3dLWVFiV3Z5SmpST24ya0J6SHFidFJYam5nZ1RVVXJiMU5wN3BjRWJs?=
 =?utf-8?B?RjBvWmJUcjlCeGVpZzR2bCtZUHpYdUhLOUtFN0N1TlJ1akFVMWViTllRWmMw?=
 =?utf-8?B?d1pBOStsby9vKzdndGRnYnZOVFZiVFBiM0tsU1Z5N3ZOUUdaR1U4M0ZzeDhp?=
 =?utf-8?B?Rjh3VVJ6RHBOUHl0WEJxbndYNkRtODNVU2pBUllEM0o3dGZvd0M2clU4cU5s?=
 =?utf-8?B?YjRuRTlLT2gxNHFwTlZWc2pGT1drb2ZBM1FuZzNWNVM1T0FDT3dOUmQwdVNs?=
 =?utf-8?B?dG1TVEZDM1BrTThYdEFGNVBmY3A5eHNlR2xPN2tUeUJHanFxcUJ5YmpFQW52?=
 =?utf-8?B?Y0xZNDlzS2dWNHhGdXUyYkRHT05YMnhkdUJLS2NBYlgyS2QvRld4VytsL3Rh?=
 =?utf-8?B?dmxSRjg3MGphVHVrS01sMFhoZnQ3aU9YMlo5bVoyTlh6T2hTZmR4WitiNDFR?=
 =?utf-8?B?NXpDeitZcXlmcnpFV052eG5EUzI4d3VLaC9uREJTa0NlUU95ZkdXQkJsc3JR?=
 =?utf-8?B?blBYUlFPdTRHM0srWWNBeVMvUUFIZWJKTy9IeWxwVlBrMUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXA2MEZxM1Z3UkR6dVhBcm9zYmxjVzRLTGJmL003NDVtem9IMlhXWHE5UUFD?=
 =?utf-8?B?cXlVcTBvT0RDQzN1bVFKa1VZdkFBSHhKNUIxMGd6KzZHNjlKNGp2LzMwR2sw?=
 =?utf-8?B?OVpIYlBLZmxPOG1pdTdCcFNPWjJoSEUxUU1xaHh0c1doYzFqYjBVYkxITDJZ?=
 =?utf-8?B?VkZub3VUaGszbjVSTVhjWFlzUW8zNEdGeUVkK2tTbHFmd3Y2cVZhMDU1c0NU?=
 =?utf-8?B?UGt0OUZkTnNqUWF3ZnNKUGNtOWJsZ25QN01KMHV0eWVMek8zOXg0eXcrQ2Rt?=
 =?utf-8?B?UVM4N3VSd3hJbUFtTGl3L2xqTXd2VGpnblZaT1NUaFpCZmxxd0pjR3FlL1N4?=
 =?utf-8?B?V0IwYnhNRWE1aC9ZQld5RmdkNDRHNERhbWozeXdWbStMRk5nRkQzQ0o0eTJW?=
 =?utf-8?B?dkxnaDRzU3hYZVFPYUM0UWlJRGFnUUZIWFhuY3I3dFZVOHlqRGV6eUFBVEVu?=
 =?utf-8?B?dHpiZXd3MDczRUxMT0xVWkF0V3ZDTTh4NTlFTlFTS29hWXNyaFk2Y25DQUZF?=
 =?utf-8?B?S1NQdVlFRkFDaUxWSVVxSDNXcGxCdno4czNOS0grdFMza1NUME5YK2pSdnQ0?=
 =?utf-8?B?d0N3RlJVNlJnN1RTTDJtbjZkamJKRVpuc3haVHJEbm5jUWUzd21MWVJvelRr?=
 =?utf-8?B?VjZkQWdUU0YyUzFlSndpdERHRkV1c0txaFgwL21XL09LWmlpU0ZuWlZiV1Fs?=
 =?utf-8?B?Vm5hcUo5dG5FWUZoUHhIUWl5VGtLd1c5WVkrZFlCVkdQdC8zSE9hYjhXYmlY?=
 =?utf-8?B?ZmZCY3ZkeEc4aG05Y3ZUdE1jNlZtQmRyUDZaZjJTOEtvK21kQllCVWkwQTNF?=
 =?utf-8?B?UzBiekdEOUY5TnRsYmRFQ0tnZFA3ZEQrZUFDWVM1d2ZxdGdFc3U0UlJrLzhE?=
 =?utf-8?B?SHZaOVNRT2tZeXBiMkxNb1hnZmc0b0p0cjU4RnRTMzNuTlJQRlVkanFVeUhJ?=
 =?utf-8?B?V0J6VjNHVFYxRFRxV2Fmb1NDNjV3VnVzY3pLRUZIYzFkNXJZMS9Ed2h6NUFS?=
 =?utf-8?B?TFNGdzgzemFINm5ObUF0bkcxc2lPZitwUmhERm1BSmR0TEY0ZDgxOXBGTGwx?=
 =?utf-8?B?ZUJtZ016SzRZSU9DU3BEeE5PbTZjYWRjWEZreDFhUlduUVNCRk1OeFlvMURV?=
 =?utf-8?B?VFhZTDhoaGlDNkFDeUJKWkE4Z2JjU0hRZzFwSHhWNU9NRkdySjVyYytGMWhv?=
 =?utf-8?B?TnlLcm9CdjIxWW95K2tsTHVaWkd0dFZ5ajJ3R3lRbTlHdk1hcGZkbENNMTRh?=
 =?utf-8?B?TlVqS25SczRiemVmVlJoUlkzcnNCdktPVGpqQmRrMURjcHpNdG04K2lRS09o?=
 =?utf-8?B?M1NabmVxSVQ4UUNySVVaVlNQSUp0eTlwdDh3TnhKaWdJeGh5WEtLblJSRDFH?=
 =?utf-8?B?WGtOVkRwSE1Rd1FMOGVOM3E4UEZCSDhzY3BZMWhBenpDdjhBbllObkZNcExS?=
 =?utf-8?B?SDZKZkJVZ0N0T2lGYXBVbVlEbVd3ZVU2dWRyYkt6WTcwOWxhRXpiV0xXSURO?=
 =?utf-8?B?QnllR1BlNDBubk53a2Zqd3ZiV2hSQXZ5eithK2xoVkozV0VyTktKOFRuZzBw?=
 =?utf-8?B?b0pMM0ZFMDZKZW9sVEZsU0poS1BMeE1xSXJZT3VuZTI3dlBnYTQ2RmJ1R1ZB?=
 =?utf-8?B?UllVanFwSURrL3JXWXI3S1BWaFV6MmpjWEN1L0FPQTVYcThYZnVzWVRtZ3Ir?=
 =?utf-8?B?ZTFmUWd2bWtCeE5lbU8ycGQ2WDdkekNoNDRoeWRGMFdLa3hsWEZNVnBzSzRt?=
 =?utf-8?B?TlVtdFdpUjB5Y3NFYnlpRGF2TWQwQ3JWRFJjSm45OUE4aFVLQ2JNMmk0RUpn?=
 =?utf-8?B?YWlaK01OWkEwbVJXd3prRW5qUnp4Wk9TRVRyNVVYUXM3a1ZwcGMrb2l3MW5Y?=
 =?utf-8?B?a1BTTHR3dktrTm9tQUp6eXlVT2hKRlNsK0YvdFJmQmxCWldsRVZ4TWp6TVZG?=
 =?utf-8?B?Wkk0QjUwUGZRU2x2OWlhbzJZbFoyUVNRaEttZmFsa1ZWS05sVDJ1dkNLKzJ3?=
 =?utf-8?B?Zjh4bk5DbkdSMGlvZWhMcW51TnNDcWNkYXFpYldkN0hBZ0dGR0gvMm5EQkRL?=
 =?utf-8?B?dUJIaGU4bGtlY0x6VTlJa0RoY0RqdHRhcXV6R3ZOa2xkVEVZbEVxS1l1ejRE?=
 =?utf-8?B?dFFoSTlTb0QvMFlEMW5sREZySnhFTlFkK2ZwbVo5ZHJrNXo3VXhkT21YZkdP?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca59aae-9f40-448c-bafb-08dcb20c8a6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 09:30:11.1503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRZHU7udeVhfhyAMdixaV3BvxO4rINpDh8zJ2cLvaF5mT8sIr2GWCJwKEybV1/QmCmhJ1pPjcVi1bettu0aHLjDJ+TbV9+665q6LxHrPFOiuslLt6n5RH3ROH41e4V1t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7331
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

T24gdG9wIG9mIGNvcHlyaWdodCB5ZWFyIGlzc3VlIG5vdGljZWQgYnkgRG9taW5payBHcnplZ29y
emVrLCBwbGVhc2UgZml4IHRoZSB0eXBvIG1lbnRpb25lZCBiZWxvdy4gV2hlbiBib3RoIGlzc3Vl
cyBmaXhlZDoNClJldmlld2VkLWJ5OiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIDxkb21pbmlr
Lmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IE1hbnN6ZXdza2ksIENocmlzdG9waCA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lA
aW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDMwLCAyMDI0IDE6NDQgUE0NCj4gVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLZW1wY3p5bnNraSwgWmJpZ25p
ZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IEthbWlsDQo+IEtvbmllY3pueSA8
a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT47IEdyemVnb3J6ZWssIERvbWluaWsNCj4g
PGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+OyBQYXRlbGN6eWssIE1hY2llag0KPiA8bWFj
aWVqLnBhdGVsY3p5a0BpbnRlbC5jb20+OyBQaWF0a293c2tpLCBEb21pbmlrIEthcm9sDQo+IDxk
b21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPjsgU2lrb3JhLCBQYXdlbA0KPiA8cGF3
ZWwuc2lrb3JhQGludGVsLmNvbT47IEhhamRhLCBBbmRyemVqIDxhbmRyemVqLmhhamRhQGludGVs
LmNvbT47DQo+IEtvbGFudXBha2EgTmF2ZWVuYSA8a29sYW51cGFrYS5uYXZlZW5hQGludGVsLmNv
bT47IEt1b3BwYWxhLCBNaWthDQo+IDxtaWthLmt1b3BwYWxhQGludGVsLmNvbT47IE11biwgR3dh
bi1neWVvbmcgPGd3YW4tDQo+IGd5ZW9uZy5tdW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFU
Q0ggaS1nLXQgdjIgMDIvNjZdIHRlc3RzL3hlX2V1ZGVidWc6IFRlc3QgZXVkZWJ1ZyBjb25uZWN0
aW9uDQo+IA0KPiBGcm9tOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0Bp
bnRlbC5jb20+DQo+IA0KPiBBZGQgYmFzaWMgdGVzdHMgY2hlY2tpbmcgeGUgZXVkZWJ1ZyBjb25u
ZWN0aW9uIGNhcGFiaWxpdHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEdyemVnb3J6
ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1pa2Eg
S3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogQ2hyaXN0b3Bo
IE1hbnN6ZXdza2kgPGNocmlzdG9waC5tYW5zemV3c2tpQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0
ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMgfCAxMzUNCj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ICB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgfCAgIDEgKw0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxMzYgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHRlc3RzL2ludGVsL3hlX2V1ZGVidWcuYw0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVs
L3hlX2V1ZGVidWcuYyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWcuYyBuZXcgZmlsZSBtb2RlDQo+
IDEwMDY0NCBpbmRleCAwMDAwMDAwMDAuLjQ0YTQ5MTMxOQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWcuYw0KPiBAQCAtMCwwICsxLDEzNSBAQA0KPiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAy
MDIzIEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0KPiArLyoqDQo+ICsgKiBURVNUOiBU
ZXN0IEVVIERlYnVnZ2VyIGZ1bmN0aW9uYWxpdHkNCj4gKyAqIENhdGVnb3J5OiBDb3JlDQo+ICsg
KiBNZWdhIGZlYXR1cmU6IEVVZGVidWcNCj4gKyAqIFN1Yi1jYXRlZ29yeTogRVVkZWJ1ZyB0ZXN0
cw0KPiArICogRnVuY3Rpb25hbGl0eTogZXUgZGVidWdnZXIgZnJhbWV3b3JrDQo+ICsgKiBUZXN0
IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8
eGVfZHJtLmg+DQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsNCj4gK3N0YXRpYyBpbnQgX19kZWJ1
Z19jb25uZWN0KGludCBmZCwgaW50ICpkZWJ1Z2ZkLCBzdHJ1Y3QNCj4gK2RybV94ZV9ldWRlYnVn
X2Nvbm5lY3QgKnBhcmFtKSB7DQo+ICsJaW50IHJldCA9IDA7DQo+ICsNCj4gKwkqZGVidWdmZCA9
IGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0VVREVCVUdfQ09OTkVDVCwNCj4gcGFyYW0pOw0K
PiArDQo+ICsJaWYgKCpkZWJ1Z2ZkIDwgMCkgew0KPiArCQlyZXQgPSAtZXJybm87DQo+ICsJCWln
dF9hc3N1bWUocmV0ICE9IDApOw0KPiArCX0NCj4gKw0KPiArCWVycm5vID0gMDsNCj4gKwlyZXR1
cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGJhc2ljLWNvbm5lY3QN
Cj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJRXhlcmNpc2UgWEVfRVVERUJHX0NPTk5FQ1QgaW9j
dGwgd2l0aCBwYXNzaW5nDQoNClR5cG8gaW4gWEVfRVVERUJVR19DT05ORUNUDQoNCj4gKyAqCXZh
bGlkIGFuZCBpbnZhbGlkIHBhcmFtcy4NCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgdGVzdF9jb25u
ZWN0KGludCBmZCkNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX3hlX2V1ZGVidWdfY29ubmVjdCBwYXJh
bSA9IHt9Ow0KPiArCWludCBkZWJ1Z2ZkLCByZXQ7DQo+ICsJcGlkX3QgKnBpZDsNCj4gKw0KPiAr
CXBpZCA9IG1tYXAoTlVMTCwgc2l6ZW9mKHBpZF90KSwgUFJPVF9XUklURSwNCj4gKwkJICAgTUFQ
X1NIQVJFRCB8IE1BUF9BTk9OLCAtMSwgMCk7DQo+ICsNCj4gKwkvKiBnZXQgZnJlc2ggdW5yZWxh
dGVkIHBpZCAqLw0KPiArCWlndF9mb3JrKGNoaWxkLCAxKQ0KPiArCQkqcGlkID0gZ2V0cGlkKCk7
DQo+ICsNCj4gKwlpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+ICsJcGFyYW0ucGlkID0gKnBpZDsNCj4g
KwltdW5tYXAocGlkLCBzaXplb2YocGlkX3QpKTsNCj4gKw0KPiArCXJldCA9IF9fZGVidWdfY29u
bmVjdChmZCwgJmRlYnVnZmQsICZwYXJhbSk7DQo+ICsJaWd0X2Fzc2VydChkZWJ1Z2ZkID09IC0x
KTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKHJldCwgcGFyYW0ucGlkID8gLUVOT0VOVCA6IC1FSU5WQUwp
Ow0KPiArDQo+ICsJcGFyYW0ucGlkID0gMDsNCj4gKwlyZXQgPSBfX2RlYnVnX2Nvbm5lY3QoZmQs
ICZkZWJ1Z2ZkLCAmcGFyYW0pOw0KPiArCWlndF9hc3NlcnQoZGVidWdmZCA9PSAtMSk7DQo+ICsJ
aWd0X2Fzc2VydF9lcShyZXQsIC1FSU5WQUwpOw0KPiArDQo+ICsJcGFyYW0ucGlkID0gZ2V0cGlk
KCk7DQo+ICsJcGFyYW0udmVyc2lvbiA9IC0xOw0KPiArCXJldCA9IF9fZGVidWdfY29ubmVjdChm
ZCwgJmRlYnVnZmQsICZwYXJhbSk7DQo+ICsJaWd0X2Fzc2VydChkZWJ1Z2ZkID09IC0xKTsNCj4g
KwlpZ3RfYXNzZXJ0X2VxKHJldCwgLUVJTlZBTCk7DQo+ICsNCj4gKwlwYXJhbS52ZXJzaW9uID0g
MDsNCj4gKwlwYXJhbS5mbGFncyA9IH4wOw0KPiArCXJldCA9IF9fZGVidWdfY29ubmVjdChmZCwg
JmRlYnVnZmQsICZwYXJhbSk7DQo+ICsJaWd0X2Fzc2VydChkZWJ1Z2ZkID09IC0xKTsNCj4gKwlp
Z3RfYXNzZXJ0X2VxKHJldCwgLUVJTlZBTCk7DQo+ICsNCj4gKwlwYXJhbS5mbGFncyA9IDA7DQo+
ICsJcGFyYW0uZXh0ZW5zaW9ucyA9IH4wOw0KPiArCXJldCA9IF9fZGVidWdfY29ubmVjdChmZCwg
JmRlYnVnZmQsICZwYXJhbSk7DQo+ICsJaWd0X2Fzc2VydChkZWJ1Z2ZkID09IC0xKTsNCj4gKwlp
Z3RfYXNzZXJ0X2VxKHJldCwgLUVJTlZBTCk7DQo+ICsNCj4gKwlwYXJhbS5leHRlbnNpb25zID0g
MDsNCj4gKwlyZXQgPSBfX2RlYnVnX2Nvbm5lY3QoZmQsICZkZWJ1Z2ZkLCAmcGFyYW0pOw0KPiAr
CWlndF9hc3NlcnRfbmVxKGRlYnVnZmQsIC0xKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKHJldCwgMCk7
DQo+ICsNCj4gKwljbG9zZShkZWJ1Z2ZkKTsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBTVUJU
RVNUOiBiYXNpYy1jbG9zZQ0KPiArICogRGVzY3JpcHRpb246DQo+ICsgKglUZXN0IHdoZXRoZXIg
ZXVkZWJ1ZyBjYW4gYmUgcmVhdHRhY2hlZCBhZnRlciBjbG9zdXJlLg0KPiArICovDQo+ICtzdGF0
aWMgdm9pZCB0ZXN0X2Nsb3NlKGludCBmZCkNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX3hlX2V1ZGVi
dWdfY29ubmVjdCBwYXJhbSA9IHsgMCwgIH07DQo+ICsJaW50IGRlYnVnX2ZkMSwgZGVidWdfZmQy
Ow0KPiArCWludCBmZDI7DQo+ICsNCj4gKwlwYXJhbS5waWQgPSBnZXRwaWQoKTsNCj4gKw0KPiAr
CWlndF9hc3NlcnRfZXEoX19kZWJ1Z19jb25uZWN0KGZkLCAmZGVidWdfZmQxLCAmcGFyYW0pLCAw
KTsNCj4gKwlpZ3RfYXNzZXJ0KGRlYnVnX2ZkMSA+PSAwKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKF9f
ZGVidWdfY29ubmVjdChmZCwgJmRlYnVnX2ZkMiwgJnBhcmFtKSwgLUVCVVNZKTsNCj4gKwlpZ3Rf
YXNzZXJ0X2VxKGRlYnVnX2ZkMiwgLTEpOw0KPiArDQo+ICsJY2xvc2UoZGVidWdfZmQxKTsNCj4g
KwlmZDIgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gKw0KPiArCWlndF9hc3NlcnRf
ZXEoX19kZWJ1Z19jb25uZWN0KGZkMiwgJmRlYnVnX2ZkMiwgJnBhcmFtKSwgMCk7DQo+ICsJaWd0
X2Fzc2VydChkZWJ1Z19mZDIgPj0gMCk7DQo+ICsJY2xvc2UoZmQyKTsNCj4gKwljbG9zZShkZWJ1
Z19mZDIpOw0KPiArCWNsb3NlKGRlYnVnX2ZkMSk7DQo+ICt9DQo+ICsNCj4gK2lndF9tYWluDQo+
ICt7DQo+ICsJaW50IGZkOw0KPiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQlmZCA9IGRybV9v
cGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiArCX0NCj4gKw0KPiArCWlndF9zdWJ0ZXN0KCJiYXNp
Yy1jb25uZWN0IikNCj4gKwkJdGVzdF9jb25uZWN0KGZkKTsNCj4gKw0KPiArCWlndF9zdWJ0ZXN0
KCJiYXNpYy1jbG9zZSIpDQo+ICsJCXRlc3RfY2xvc2UoZmQpOw0KPiArDQo+ICsJaWd0X2ZpeHR1
cmUNCj4gKwkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS90ZXN0
cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkIGluZGV4DQo+IGU2NDk0NjZiZS4uMzVi
ZjhlZDM1IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9tZXNvbi5idWlsZA0KPiArKysgYi90ZXN0cy9t
ZXNvbi5idWlsZA0KPiBAQCAtMjc5LDYgKzI3OSw3IEBAIGludGVsX3hlX3Byb2dzID0gWw0KPiAg
CSd4ZV9kbWFfYnVmX3N5bmMnLA0KPiAgCSd4ZV9kZWJ1Z2ZzJywNCj4gIAkneGVfZHJtX2ZkaW5m
bycsDQo+ICsJJ3hlX2V1ZGVidWcnLA0KPiAgCSd4ZV9ldmljdCcsDQo+ICAJJ3hlX2V2aWN0X2Nj
cycsDQo+ICAJJ3hlX2V4ZWNfYXRvbWljJywNCj4gLS0NCj4gMi4zNC4xDQoNCg==

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99D1C0219B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 14:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C22110E576;
	Mon, 10 Feb 2025 14:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbVDtiUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99FD10E216;
 Mon, 10 Feb 2025 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739198817; x=1770734817;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NSVwIAk4abRWtkfUt1qTSVWJdEJlFrNOaQTs65rueCA=;
 b=lbVDtiUiUKe6SQ2cAnEz9eB3hnuXRdU7yL/sGkcZ+D5HaOW8ZDDNbHYP
 UxVDqqBhCPSSzbxEYfsakS8bt5aMa2WAU66IAGwFCyVg45ekaqttoUMVj
 7SWe4l+qnkCB5MUDwvq4fU9G8i7mYfRIFiW4nZg7wARseipJJBOYlI6iY
 xKP0wmMcv+AD2w3pbGtqsQAKN0rpecXjj5cuI6bcePGO1yPYPU6e7uIk+
 2xnIH3FeBwZu8HYIeQA+VHUMBiEkK2ztzUUcpfvO8tv0hTbNLXRokbtIL
 GdTQ42Bcl4zV4jA5Zs6z1Au9e+8picJR4V3fgL1CnyAFD9g3524gmyWN0 g==;
X-CSE-ConnectionGUID: jrrJwfMISVWau+zT7D/PQQ==
X-CSE-MsgGUID: WReydwaDT0OZmTU4KMG5qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39016400"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="39016400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 06:43:55 -0800
X-CSE-ConnectionGUID: k01p9cdnTqytEyweqVwhPA==
X-CSE-MsgGUID: mEI51g4aTlmANooPZgPITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143105005"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 06:43:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 06:43:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 06:43:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 06:43:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5i/ybX7PKNeL7anvnejf4gWHGspxlTZ3MA0+w0ZgsX0jKERMUIk+nzJ+mL2CO1IrRz2oqgxn0RF+vdhqVrChMAEYSQNivOdGseGo9xETE1+mtApyuBdyMi4iPAnTd7T9wDcr9oT3tbYyRpvNivoGmidQMcv7OLnTA9yfLi+su8SE+9rKmAnhyKabP55R9fJ3DVSRijtS8Pm2O9KvE8hqdUZMqYdQXqwxFIyeWL2YuPVe1ejTL7PQK19weksa4E3ZJjtkWRNWrj5W0nYxkFu4RKRR8n9UTBtbV8TawICfKp9jZ5Sq3WpH1YcSnS1OjhkbFXIKOTKnpZIlLr8HwWesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSVwIAk4abRWtkfUt1qTSVWJdEJlFrNOaQTs65rueCA=;
 b=gYM7myxyzMjnVpgh0Z7QsFbuixFuTRpTLaNiKlbEMcHSTnlJj0ETgyCZpri28E4PfgCrePK+lTLnVFDo6lzDkXMfBIKFFaTT0iYzHHvzwYWnRa42pt4kk1/dp0DVdleutliwdIpWYe7DNqCi1AW3wdoQg+ZNrJ0dFtUIT8IJX2673iWI4Dpl8qNRAt/QujFhwpfHxlgfm4CjGVWNl+JXAin+V/a14vHD8FHHSuqRFL1FA2w2o0mtn+Khi0jQiW5f6RmhsQ0djGD2scNXhVnJAJWNEBuMjxuc3EOUuq3pZ6Ya6Ry+ILJjCyjrNdhEwlcakV0rZBv46yDlI+jVyzbxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 14:43:08 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:43:08 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIEJ1bXAgYWJvcnRp?=
 =?utf-8?Q?ng_on_network_failure_deadline_to_40_seconds?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgQnVtcCBhYm9ydGluZyBv?=
 =?utf-8?Q?n_network_failure_deadline_to_40_seconds?=
Thread-Index: AQHbe5W9ZERwSebX7UStCInuI2nIbLNAV6fA
Date: Mon, 10 Feb 2025 14:43:08 +0000
Message-ID: <CH0PR11MB5491140C55BE03FEF4B1EAF5EFF22@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <173917129953.152544.2381462515090576682@b555e5b46a47>
 <e6642b8e-cfb1-4f0a-a82a-cd9e30d7b8cf@linux.intel.com>
In-Reply-To: <e6642b8e-cfb1-4f0a-a82a-cd9e30d7b8cf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CO1PR11MB4929:EE_
x-ms-office365-filtering-correlation-id: 02d36d06-2f1e-4c47-7af7-08dd49e13c28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?Mnp1cm0wQ2pJcHJlUWhZV2ZpY055Y0hGdmJEVjQ4RFNNeE84TXFlNnpxUEw5?=
 =?utf-8?B?VnA1MHVrbU12QmU4MFJqcEJ5UjNqV2Z6QlkzTkluYkdxbG10aTlQUitOa2J2?=
 =?utf-8?B?cWN0ZUl0S05kMHhjVUsrb1NhRTNBSlc3b1dUWi9sWmhtMzU0azRHQzVZSFFz?=
 =?utf-8?B?WUZrNExjWlJCSERVQnhFMlFDdUdyM2NvcGI3R3NtdDdwUllmTlgvaCtpaUpS?=
 =?utf-8?B?QVhOK25tV1BHQ2graWdaTHZwUnhLVEdoQVFHdHBqZHAvNGlvNXZRb016eHdW?=
 =?utf-8?B?c2dHWSs1VElkWjQwUEc2UjM5UjBmT0tFeFEzdWxZZzlPd3pFcWpkWnp4RGkx?=
 =?utf-8?B?REhEdThtMS9NY05NUm5qVlVMNzhrSnhORWw2MXJSR3pZV3RrUm9xS1dNbnFu?=
 =?utf-8?B?NlhSWUZwU2J5L2E2SVJiU0ljaXl2SC9OWWtjanVTQlQ3QkVOeENLcWpXZ0l6?=
 =?utf-8?B?UTRDcXJuUVR6Qnc5NUxBV0p3R2ROMnFxbXZLTWpsbUlxS04wMUxzTCtLQy82?=
 =?utf-8?B?VHE2QmZaVVkyaUZGUGtrc0lPaEJmaUd1SVFEOWRwbnpxdFZHKzJYYlB0bm82?=
 =?utf-8?B?b0RRMWNUa2lDVW11dXNiYzVxNzBlRFhuU0tDNUkwdDMrMlBRbUlVMVdyZCt4?=
 =?utf-8?B?R0t3QUJLZ01LRVZIRWowbmNSZngzSno5TDA5c2hmVkh4Wldxd3ZEUTNocjQ1?=
 =?utf-8?B?ZWY0ZHBVT1drVWw3Q1padzN3WmpMNUViU24vSW55M3NWVTFxYXhCYXgyVUx3?=
 =?utf-8?B?MjRoVVZvYnU1blFTQWNRWTFubmJYWXZKbUZRR1lhWGZXbzBuM3d6VEdlYlNm?=
 =?utf-8?B?QlJYRWx3dDJSQ0NLTWlmQWRqNUxHT250L25pQUVWUmNRMUh0QVorZGl0MHhn?=
 =?utf-8?B?Y25oc3p4MmxWTnVnclNsUm5NdHVQdmpGRGZJOGl0dWZUa0R3Uk5zanJma25m?=
 =?utf-8?B?blJUbDA2ZEVBTjNNOHpmQWc0dlIvR0E2bGdnemtCWWhnQUhOTnVJSVBPM1Q5?=
 =?utf-8?B?QnBXc2o2YkRoeEdqTzB3VmFjUFFPZkhqRWFOWG1jRUxxNXlPbWNCNHo1b0Er?=
 =?utf-8?B?SnBmQjVuMkFCRVFmMVRYVGVicmhxTnY4TEtEYXZuZS9RVUt6bVJjbXFBSGFQ?=
 =?utf-8?B?MXI5anA2NHJIQVQvRkp6VXM5Q2w0Ync0OGVDblV4VEw5ZkQxME5WcHpvbHht?=
 =?utf-8?B?V01mWTdyaStVdkMrWU1LTDcxeFpSa21QVWYzSXVSZ1BCazJUTGJaZ1JFeGdj?=
 =?utf-8?B?K0Z2YitUWVVuYU95SnhrSDRhUWwvdlZJZURHK3ZEc1QvNXpldWwzc3FwL3lo?=
 =?utf-8?B?YUhhU0NjaW93dlpkWUxDTEdWM2N3QWQyUzN1K3E1L29hQmFPbFRnU2htdlhn?=
 =?utf-8?B?WlZhVUVNQ3crdzN6N0UwRWxGOUhIVlZpSm1xVkhVMk1jMW9BVEVqL20vN1g5?=
 =?utf-8?B?QTVXMFFzRDJGRkU0Q0U1cld6MXI2RWdtem5WaGk2bklBMTdFcmlpeWtTVGtB?=
 =?utf-8?B?VWk0alp3VE0wYWhEaTdGUUdlbmlXcmU5UUxIYWQ2QXhHNEJjbUd1dm9CUXFO?=
 =?utf-8?B?dmJRTkYrVHh2bmF5UEM1Z2VQUGRoR0FienU5Mm1BaEl2L1BvUDR1WGhra1hv?=
 =?utf-8?B?L0ptcmJLenJMMmlNKzlFRngzWE1ZdVgrRG1RZEZMcW12dWZodkRoYjVKNnB6?=
 =?utf-8?B?RmxHRkZEZkpzMVNkZnkwY1VTMWRzbktVVmsyZTdoMzJEbEROK1Fkd1c4NVBE?=
 =?utf-8?B?b05tRVJYeDV4dlpBd21uMytGalBieG9COGRrQlorckJ6ZWJkWUtaLzNOYXBq?=
 =?utf-8?B?OUN2N0VjVnRvM3B2QSsxQlIwU0tKTDMxb0M5VHhEK0Jza09MNEw1UytyNTVO?=
 =?utf-8?B?OER1WU5HcHp5S2N6NXp0VGxUVG56Y3BobWh0SGZENnErL2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(13003099007)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVRpQm52dlZyeFhkT1ZCdUp2TGdNMkZYaGpVKzRGR3JjYmd5azlNSmZyVjlp?=
 =?utf-8?B?WUppWUdxYzA4VWpYL2pSN3pTUkFPcHBxUEhOUU4rZFRvQzhGYXpSRzhVMUxs?=
 =?utf-8?B?YUNLSmRrTGJ2KzdFQWFoNzNkZFZWNzJMK2h1MEVsb1RCOGppbytnMy81V2pN?=
 =?utf-8?B?ZFk0RUk5UFMvSWhKdExPTlNWaHkyQkFmbytxYm1YMklXaHl5VkpHKzBzbWNi?=
 =?utf-8?B?VmN0cTNKQVpBRzI5bWZqTHVOTUFoRXV4VnJFaXh0ZCt4WGpza2U1ME00L2c4?=
 =?utf-8?B?dEdkM3lPVGhjVlhkTXMza1ZjeW10QWtaUmZNT0ZiUWFZUHcwSWF3bTRkV1RM?=
 =?utf-8?B?OG5IaXgrOGNzTkFSRkdTN1lMMTVkZjNzcGFqb2ZPYlBSRmN3L3d3azdsUDND?=
 =?utf-8?B?THhXTVdlOTViTWdwVERVOElkVkVUNjVBZzJRL3hUVDVPVWpuOHRsM1dxRDdR?=
 =?utf-8?B?aXA0Y1dTcXAyNzR5U1cvNnYwZ3cvZCtHODVtallhQmpHTFAyNjl4M3R4SE11?=
 =?utf-8?B?TlA0TVMvVFNYYmZrQTA0WGQrSEdZbzFZWDRGWE5Wb255Vm1aNFllQ2tpcGdh?=
 =?utf-8?B?UEF6dWFOM1RjRHdSa09qL1dIdWJpWXNKM1ViZjlhZmp5WWFhUUF6bStWNTZO?=
 =?utf-8?B?dU95SGRWNFFnQjNpVkNpcnU1dEZuYjdvL2tjYmVqYXlyeGtXb1BaK2hwTGN0?=
 =?utf-8?B?L0FxMFNBa1Rpa29Nczh2MWErZk1taTdCOGRRclJjOUs4cWJLTzl1bE1vTDhO?=
 =?utf-8?B?U081VDUyVmFLSWV1blRYVEZZVU8wMGFXbmN0OHBVZVEwNktOcmt2NkIyMjE3?=
 =?utf-8?B?b3B6YmgzeElyZjVJWXRaWWx1U2JxYjdvQ3gvK0YrcGdaazI5Mlh1ZmJDcnBR?=
 =?utf-8?B?bmRFZDVYanRoR0huVC9oS3FGNlNzbkxNUlhRNStkYStVTkxDbjYwWkdtSEFN?=
 =?utf-8?B?TXhjS3ZwbWVOZE1ybVJSMnBPS1VVMFlNaC9Sc0JRMGthVS9UNmEwK0thNWJQ?=
 =?utf-8?B?Vlk2TEVRdmRMdmRLYzMvRkh2VVRxTEVhVTZCTzVvUDVYNTdsY080dEV3U0Qy?=
 =?utf-8?B?a3JiaEp6eHl5RG1QU2cwVis0RFlqQUI1THg0QW1uWFZ5clBZemtCNEo5WSs1?=
 =?utf-8?B?OVRJQWtFWXF0V3IzV0ZTbTlQYUJUdHhtZzVHMTg1N0NBMnZSdDVKVHhJWDdI?=
 =?utf-8?B?bjBCRXMwRitRWWNzcVJjVEVNeFZTODlSVWhtTzFkaVpHZ2tZUVZmQ0JmWlQv?=
 =?utf-8?B?U25LbTlFVFZzcW5sRnFnekM0aFlweG51NkNsS1RSenVhQjY3MmxqdVZ3SFRD?=
 =?utf-8?B?Vmg3ZDBuYTh0SStKclFxbzgySTNBWWpBbkhGYzJXZFcrTW85NVUvMEpyLzhm?=
 =?utf-8?B?aXgxYnFlQmdTam9TR1c1N3YrditxWUc4KzZ2U3E2Q05kUml6U2N2SDVhWi93?=
 =?utf-8?B?U3RzOHQ0cE9STVZKVlRNVUl5WFdaNjQ0ZkoraUVnWWIrYTVuMEVYS01KaDAx?=
 =?utf-8?B?dU0zU0ltMko4K1oyOU5hUDBsbE9qZEpTb2lmam5YRDlBZE5RdHJtSlRyd3RO?=
 =?utf-8?B?YW41Mlpra1hwUGVucXlIbGRmK3lpM0ZLMDlBeEY1V2F6eUhVNFhIQXVyd2pq?=
 =?utf-8?B?SkM1S2VMc0cxWFlBMm1TaU5HeEl0YkQyNUExWXBwQUxoaGpBdkllYWl2QWts?=
 =?utf-8?B?aktWcUcrdkp2Z0N3UU5DWGNncERudGVJbnVwa1ZnMFhrNm1vTGZhNlpWOFpT?=
 =?utf-8?B?SlFLTUhNNFY4aFNvSE1qT1VVWUpCVzQzSWhRekJhRzRUUGdaNW1lUmNKQWdX?=
 =?utf-8?B?R2lvaXpuRXJDUjZmaFFEOSs5OU4zanY3U2VZczhOTVBvdWdFck9XckUrTHpn?=
 =?utf-8?B?N2MrWG9DbTJxbkdZMWROV0VZVkZmL0NXcWZSS01ZOTdtenhpUTFjTWQ3M3cz?=
 =?utf-8?B?QXQwcnlYcC92TnpjenBZeDhVMVJ1dkVZck1BR3ZPVHZMSUh1VnhnWDJ2OFYr?=
 =?utf-8?B?QlJpdzZrUm9YNmEvSmtsQ3ZwVENxL1lKY0VaNWJsZzd2RzZaRmtRS29DQll1?=
 =?utf-8?B?Y001VzZGejVmTmVFMklwbnovWGRRUWRud3MzbVFZS0JzUnBCVEwyVzY0KzNW?=
 =?utf-8?B?a2lJcHAvTGhQN3FtaXZ6Mlc1b042VUxhdWJyQW1OZTRWS2VjM2V0cjVxV2U1?=
 =?utf-8?Q?u7kbHb6GgoRasAvKHbete63bJjjiBdT34wN1B9sCH/je?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d36d06-2f1e-4c47-7af7-08dd49e13c28
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 14:43:08.2044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjByNDkgWVmVgvrgn+SFlO+ZbyaGn1xG8EY76KK7YWOCAvYAndbHIxQwKz3nW7y46XfS1ZmOf76YTIFCRmPvAW1ui3i/PaCYJaYgmccikQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ0NDI0LyAt
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5GVUxMIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClJh
dmFsaS4NCg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWlu
ZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YgUGV0ZXIgU2VubmEgVHNjaHVkaW4NClNlbnQ6IDEwIEZlYnJ1YXJ5IDIwMjUgMTM6NTcN
ClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1jaS1pbmZyYUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5GdWxsOiBmYWlsdXJlIGZv
ciBCdW1wIGFib3J0aW5nIG9uIG5ldHdvcmsgZmFpbHVyZSBkZWFkbGluZSB0byA0MCBzZWNvbmRz
DQoNCkRlYXIgSTkxNSwNCg0KT24gMTAuMDIuMjAyNSAwODowOCwgUGF0Y2h3b3JrIHdyb3RlOg0K
PiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBCdW1wIGFib3J0aW5nIG9uIG5l
dHdvcmsgZmFpbHVyZSBkZWFkbGluZSB0byA0MCBzZWNvbmRzDQo+IFVSTCAgIDogaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDQ0MjQvDQo+IFN0YXRlIDogZmFpbHVy
ZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBD
SV9EUk1fMTYwODFfZnVsbCAtPiBJR1RQV18xMjU1Nl9mdWxsIA0KPiA9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0t
LS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5n
ZXMgY29taW5nIHdpdGggSUdUUFdfMTI1NTZfZnVsbCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4g
ICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVk
IGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1
Y2VkIGluIElHVFBXXzEyNTU2X2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkx
NS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBk
b2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBv
c2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjU1Ni9pbmRleC5odG1sDQo+IA0KPiBQ
YXJ0aWNpcGF0aW5nIGhvc3RzICgxMiAtPiAxMCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+IA0KPiAgIE1pc3NpbmcgICAgKDIpOiBzaGFyZC1zbmItMCBzaGFyZC1kZzItc2V0
MiANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAN
Cj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRy
b2R1Y2VkIGluIElHVFBXXzEyNTU2X2Z1bGw6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+
IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAZ2VtX2Vp
b0BoaWJlcm5hdGU6DQo+ICAgICAtIHNoYXJkLWdsazogICAgICAgICAgTk9UUlVOIC0+IFtBQk9S
VF1bMV0NCj4gICAgWzFdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJt
LXRpcC9JR1RQV18xMjU1Ni9zaGFyZC1nbGsyL2lndEBnZQ0KPiBtX2Vpb0BoaWJlcm5hdGUuaHRt
bA0KPiANCj4gICAqIGlndEBnZW1fZXhlY19mZW5jZUBiYXNpYy1hd2FpdEBjY3MwOg0KPiAgICAg
LSBzaGFyZC1tdGxwOiAgICAgICAgIFtQQVNTXVsyXSAtPiBbQUJPUlRdWzNdICsxIG90aGVyIHRl
c3QgYWJvcnQNCj4gICAgWzJdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0t
dGlwL0NJX0RSTV8xNjA4MS9zaGFyZC1tdGxwLTQvaWd0QGdlbV9leGVjX2ZlbmNlQGJhc2ljLWF3
YWl0QGNjczAuaHRtbA0KPiAgICBbM106IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzEyNTU2L3NoYXJkLW10bHAtMi9pZ3RADQo+IGdlbV9leGVjX2Zl
bmNlQGJhc2ljLWF3YWl0QGNjczAuaHRtbA0KPiANCj4gICAqIGlndEBrbXNfYmlnX2ZiQHgtdGls
ZWQtMzJicHAtcm90YXRlLTA6DQo+ICAgICAtIHNoYXJkLXJrbDogICAgICAgICAgW1BBU1NdWzRd
IC0+IFtTS0lQXVs1XSArMTQgb3RoZXIgdGVzdHMgc2tpcA0KPiAgICBbNF06IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE2MDgxL3NoYXJkLXJrbC0xL2ln
dEBrbXNfYmlnX2ZiQHgtdGlsZWQtMzJicHAtcm90YXRlLTAuaHRtbA0KPiAgICBbNV06IA0KPiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNTU2L3NoYXJk
LXJrbC04L2lndEBrDQo+IG1zX2JpZ19mYkB4LXRpbGVkLTMyYnBwLXJvdGF0ZS0wLmh0bWwNCj4g
DQo+ICAgKiBpZ3RAa21zX3NldG1vZGVAYmFzaWM6DQo+ICAgICAtIHNoYXJkLWRnMjogICAgICAg
ICAgW1BBU1NdWzZdIC0+IFtGQUlMXVs3XQ0KPiAgICBbNl06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE2MDgxL3NoYXJkLWRnMi02L2lndEBrbXNfc2V0
bW9kZUBiYXNpYy5odG1sDQo+ICAgIFs3XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9y
Zy90cmVlL2RybS10aXAvSUdUUFdfMTI1NTYvc2hhcmQtZGcyLTQvaWd0QGsNCj4gbXNfc2V0bW9k
ZUBiYXNpYy5odG1sDQo+IA0KPiAgICogaWd0QGttc19zZXRtb2RlQGJhc2ljQHBpcGUtYS1oZG1p
LWEtMToNCj4gICAgIC0gc2hhcmQtZGcyOiAgICAgICAgICBOT1RSVU4gLT4gW0ZBSUxdWzhdICsx
IG90aGVyIHRlc3QgZmFpbA0KPiAgICBbOF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNTU2L3NoYXJkLWRnMi00L2lndEBrDQo+IG1zX3NldG1v
ZGVAYmFzaWNAcGlwZS1hLWhkbWktYS0xLmh0bWwNCj4gDQo+ICAgDQo+ICMjIyMgV2FybmluZ3Mg
IyMjIw0KPiANCj4gICAqIGlndEBrbXNfY2NzQGNyYy1wcmltYXJ5LWJhc2ljLTQtdGlsZWQtbG5s
LWNjczoNCj4gICAgIC0gc2hhcmQtcmtsOiAgICAgICAgICBbU0tJUF1bOV0gKFtpOTE1IzEyMzEz
XSkgLT4gW1NLSVBdWzEwXQ0KPiAgICBbOV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS10aXAvQ0lfRFJNXzE2MDgxL3NoYXJkLXJrbC01L2lndEBrbXNfY2NzQGNyYy1wcmlt
YXJ5LWJhc2ljLTQtdGlsZWQtbG5sLWNjcy5odG1sDQo+ICAgIFsxMF06IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNTU2L3NoYXJkLXJrbC04L2ln
dEBrDQo+IG1zX2Njc0BjcmMtcHJpbWFyeS1iYXNpYy00LXRpbGVkLWxubC1jY3MuaHRtbA0KPiAN
Cj4gICAqIGlndEBrbXNfY2NzQGNyYy1wcmltYXJ5LXN1c3BlbmQteS10aWxlZC1jY3M6DQo+ICAg
ICAtIHNoYXJkLXJrbDogICAgICAgICAgW1NLSVBdWzExXSAoW2k5MTUjNjA5NV0pIC0+IFtTS0lQ
XVsxMl0gKzEgb3RoZXIgdGVzdCBza2lwDQo+ICAgIFsxMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE2MDgxL3NoYXJkLXJrbC01L2lndEBrbXNfY2Nz
QGNyYy1wcmltYXJ5LXN1c3BlbmQteS10aWxlZC1jY3MuaHRtbA0KPiAgICBbMTJdOiANCj4gaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjU1Ni9zaGFyZC1y
a2wtOC9pZ3RAaw0KPiBtc19jY3NAY3JjLXByaW1hcnktc3VzcGVuZC15LXRpbGVkLWNjcy5odG1s
DQo+IA0KPiAgICogaWd0QGttc19jb250ZW50X3Byb3RlY3Rpb25AZHAtbXN0LWxpYy10eXBlLTA6
DQo+ICAgICAtIHNoYXJkLXJrbDogICAgICAgICAgW1NLSVBdWzEzXSAoW2k5MTUjMzExNl0pIC0+
IFtTS0lQXVsxNF0NCj4gICAgWzEzXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9DSV9EUk1fMTYwODEvc2hhcmQtcmtsLTEvaWd0QGttc19jb250ZW50X3Byb3RlY3Rp
b25AZHAtbXN0LWxpYy10eXBlLTAuaHRtbA0KPiAgICBbMTRdOiANCj4gaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjU1Ni9zaGFyZC1ya2wtOC9pZ3RAaw0K
PiBtc19jb250ZW50X3Byb3RlY3Rpb25AZHAtbXN0LWxpYy10eXBlLTAuaHRtbA0KPiANCj4gICAq
IGlndEBrbXNfZmxpcEBiYXNpYy1mbGlwLXZzLWRwbXM6DQo+ICAgICAtIHNoYXJkLXJrbDogICAg
ICAgICAgW0RNRVNHLVdBUk5dWzE1XSAoW2k5MTUjMTI5NjRdKSAtPiBbU0tJUF1bMTZdDQo+ICAg
IFsxNV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE2
MDgxL3NoYXJkLXJrbC0xL2lndEBrbXNfZmxpcEBiYXNpYy1mbGlwLXZzLWRwbXMuaHRtbA0KPiAg
ICBbMTZdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQ
V18xMjU1Ni9zaGFyZC1ya2wtOC9pZ3RAaw0KPiBtc19mbGlwQGJhc2ljLWZsaXAtdnMtZHBtcy5o
dG1sDQo+IA0KPiAgICogaWd0QGttc192cnJAc2VhbWxlc3MtcnItc3dpdGNoLXZycjoNCj4gICAg
IC0gc2hhcmQtcmtsOiAgICAgICAgICBbU0tJUF1bMTddIChbaTkxNSM5OTA2XSkgLT4gW1NLSVBd
WzE4XSArMSBvdGhlciB0ZXN0IHNraXANCj4gICAgWzE3XTogaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fMTYwODEvc2hhcmQtcmtsLTYvaWd0QGttc192cnJA
c2VhbWxlc3MtcnItc3dpdGNoLXZyci5odG1sDQo+ICAgIFsxOF06IA0KPiBodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNTU2L3NoYXJkLXJrbC04L2lndEBr
DQo+IG1zX3ZyckBzZWFtbGVzcy1yci1zd2l0Y2gtdnJyLmh0bWwNCj4gDQoNClRoZXNlIHJlZ3Jl
c3Npb25zIGFuZCB3YXJuaW5ncyBhcmUgdW5yZWxhdGVkIHRvIG15IGNoYW5nZS4gUGxlYXNlIGZp
eCBhbmQgcmVydW4uDQoNClRoYW5rIHlvdSwNCg0KUGV0ZXINCg==

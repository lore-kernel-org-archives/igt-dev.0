Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AB7C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 05:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04D110E173;
	Mon, 10 Feb 2025 05:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVy+KUFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E5D10E173;
 Mon, 10 Feb 2025 05:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739165731; x=1770701731;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=afjHqnSjOowdj4qHpN1DdQ1yd9BF34hVucwlP7zTdfs=;
 b=MVy+KUFH5/Hiv2HvV0uDQbifvud6mlGOwtRtR45mfYFRlgILZjux+D9J
 /XbRYUERqqZYuDMtUFOiE6XgllziJU5U9hsu5XjSr9VlWZhO2ZMD+lpCt
 l3wsZiTDq2oZG8gXxIm457WyMfpZwXc7x8VL77tzRdAXH+X03cuW5iRY7
 fd9F+XCfRayW1gWoI2KEB+OxXfoMcN3hDQ7cWHvMHK+0KhBlxQQJaGCvB
 j3lKhYS+FQFNKg23wNu0yEdO6CJsBMFGU3+0KeLFVb9tIc/uT2TRHkYX7
 76+K1r3JHhY3J+qUQBEcpXS4wHJP+8lvRskbTo059of09VUMNDo63jBXj Q==;
X-CSE-ConnectionGUID: Q73GQMWMRXevneudsfc4pQ==
X-CSE-MsgGUID: Fys07RwORq27iAl7/no6MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57266109"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="57266109"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 21:35:31 -0800
X-CSE-ConnectionGUID: cSzzFRY4RAmkb0MHIqJf7w==
X-CSE-MsgGUID: yM/tQeyDTFmX06++hKWvhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135342475"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 21:35:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 21:35:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 21:35:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 21:35:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3MDhCfzKdORAfN30FQH9YDdVhXqPaaxT3dPNgdXtfB9YRoROBy//wuXflqQtgrAFu3b3Znxz90+XQkqxt6UiU++65mE1xV/eWNOsY25CHnRuxZrJMctoFvKdvg88+4hSx7Vepk94+1DO5MLx1o7vRyrqAiUPnlq0Jv0YVUewjXFoGM/WwGaGB7z/fLIKKcZSdioc7U90Pc3xa0npTWQwb46wBgS7ry4BgJDu0xxWyvQUwH6oqzWpTkcsXGyiUMyf1S0+fyZgdqlist6ZtL+0El30+fLa79olQaEnQq6B1ZFPq4awDzEwe4kXzII9oHmMxWt/w9WhK/c2B1EDBurTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afjHqnSjOowdj4qHpN1DdQ1yd9BF34hVucwlP7zTdfs=;
 b=I52YGax1dHwbxa4E3/Hr61vdncdTArPYCBxPzNZr/1Z2SArwn/ifzpW7K7rxiN8+fa6jnNhqEWIEryCI5pvuLQ9H60kG7TJtc0IbrrJ5H/WT8m3m9BpQRJ64/wyTbJ03eod4O3EEwL1LvH8Oo/bNAKbdF1XJ7LoWvTENtt/Rw2A0TUW9egpDZRhhCVLtFvNonqW+Ec5Qlvh9o8SMNyq9mtLJz0pWGnGmENgP1b3uYo0Rv3dAWxMTGyF7YWAO7ypj/dxaswNAPflfqXPy9HMK9qV6BFIzYn8wrp8vCwtGkvN4696YXbZ/Qit96cpd6XXql+2cowMwXzlV+7Fw55fZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH8PR11MB6976.namprd11.prod.outlook.com (2603:10b6:510:223::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 05:35:13 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 05:35:13 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgQnVtcCBhYm9ydGlu?=
 =?utf-8?Q?g_on_network_failure_deadline_to_40_seconds?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBCdW1wIGFib3J0aW5nIG9u?=
 =?utf-8?Q?_network_failure_deadline_to_40_seconds?=
Thread-Index: AQHbeW7UU/f6JvLMOUm6MfuM/t8GwLNAB2qQ
Date: Mon, 10 Feb 2025 05:35:12 +0000
Message-ID: <CH0PR11MB54910B46C49043D30DB0C12BEFF22@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <173893723487.2663815.3949318546357202110@b555e5b46a47>
 <13d04614-e172-438a-ad1e-b4ed6d217653@linux.intel.com>
In-Reply-To: <13d04614-e172-438a-ad1e-b4ed6d217653@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH8PR11MB6976:EE_
x-ms-office365-filtering-correlation-id: 6c1bebf7-010b-42cb-62ee-08dd4994b0ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Z2N5NEQwd1JTVUlrZGd3TVhiT0VRM0Fma1hDeFU3YXgwZGxTRTRSSlp3Yzl1?=
 =?utf-8?B?Vk54c1ZRS0FPd3FLSXhWMDdVNFBuYk0xbFdFbjI2aXRsWUZnWC9HZlcvMEcx?=
 =?utf-8?B?dWtDQk5SaWR6RDJzMVU1eWMwbytaN2QvbU9udnFiZ0dTcHIxMzhsRHhPUUV2?=
 =?utf-8?B?U1hTcVhwMFV3NHJEcVlMdzYrQ01OZDR4b1BpUG5LSEdGVjZob0twOEdyQ0tw?=
 =?utf-8?B?WGNEM3gxNStxcjJxVGM2bGs2VkhCUURRYWQ1eXNRQUZubjFDOFZ4MklONklh?=
 =?utf-8?B?b0NFd1lmRENQRUNvRThYTnJUYU1oVklPTVFjWnkvZkpZYSszUlRqbXNqZjdq?=
 =?utf-8?B?bUJYRkdxL3YyU2ZpMk9iUmFMdzZpR0FOeFI2SnVsLzdreEZ0c0ZTT0tGTEpn?=
 =?utf-8?B?RVBOaWpLY1FodHkrUVhaUWFmcjljZk1uRmVUV3NiVExldzA2MHdSTWZQNHVH?=
 =?utf-8?B?c1pKV3dZc0hhV3NNN2thRzdMODJWU0puOUk1Y3Fjd1grWFI5NXM3MU93Ykkz?=
 =?utf-8?B?MVZXWlhCSWxaVE9UYmFGNDV3a2RJTmlMMEUrYmVseTlZdGE1Zm9SNjVxeEl3?=
 =?utf-8?B?SzhKOFd3R1FMTFhhUXFFNllQc1M5MHBGZ0FuSlk3VWhGdUJseEN2d0tYSDZF?=
 =?utf-8?B?WGRtWkl0V3g5cWpTZTZtTkJZYXczQlNUd1A5TnFGL1Q4WTJCcW1rTSsxZXJD?=
 =?utf-8?B?eU9nUGhZTU5VREhLaWZocmhVWkVNcTljTXdZeElQS0FHRmJIa0FJUzhMbEV3?=
 =?utf-8?B?TGYzN3QweFVVY2YrZFpvZzQ3ZitKNVUzTlhWbmQ0bHNXQk1ZV2kxeGt6K2pl?=
 =?utf-8?B?NVZCWkkwcVhvZVI5V1gvTm1QbEx4UXRESEFOM0wvcEpXSUJwa25pZW45VDJE?=
 =?utf-8?B?T0dsb21xRCtCdmZrYUhUVXhhWEpVNlpiYVREOVg1VXorKzN1Uytxc3RMaWxQ?=
 =?utf-8?B?TzFpRHNQZW53LzZldE1CRmZxeFRuYVU1YVpUR1JFcjcxMEZYSWRPMjdhcWhH?=
 =?utf-8?B?TXZXUENoQVFLU0N3MVY1YjE5SkZ1cEEwQlcyR0ZRU05ITmZlZUtrcko1REZz?=
 =?utf-8?B?NElrMWZzS2Y3N2lLOUoxK1J1eVJjakVqMXZPRE5MUUFtYW1jdG5PaDc4eWl6?=
 =?utf-8?B?RFdZa0hIRys5OFVENHJPTWUyczNzZXJ5Z3Q3NFZTVE9GT0ppK0pUYThGQmtm?=
 =?utf-8?B?Wkl2Znd4S01EbTRlS1ZFMTVETStlRTBMOGNMSHpaOThYQ0lyN0VrLzl1Ym9j?=
 =?utf-8?B?R05SekVHL2J5ZWRiODJGbG1mODFvcHpuaDd0S0pKeTh3azMvdE1wcEtUM1F4?=
 =?utf-8?B?ZkJmQ1BTaERmbEdOUVpsbGx2QXpHRWxJU0RWRWowbHZRSWEzQytyVU5SY1lx?=
 =?utf-8?B?VndzQzFEQzh5MmVZeDU0Mmg4VXhpSzliSGp5Uzk4MzZ5dk1qQTRsUTY5MTJu?=
 =?utf-8?B?V1hoWUpkS2xRRzJCNHQwaXYzS0phcEVnZUlZWnFPTTFLWUJIUDR6VU1IMkNQ?=
 =?utf-8?B?WjhKR0FRdzRyQk9ndWZWUWxETXQyME13QU1FY1piMDl6SlEyTXpaMG52bWJB?=
 =?utf-8?B?ZjEwYmVuVTgvakhLWEtWcGRBNFl3Z29PQW0yTm5zbFRmVXE5YWg0ZkZMT1Mz?=
 =?utf-8?B?c0lvcllJemt5QVlJQkdhRDRYbDRRdTg5eDlnZTlvNTVzT2hBNDZ2Mysydm5K?=
 =?utf-8?B?ZzBJRjhtbVhJTXY2U1FGZmY0RlNydHEwZUxhN0MxaTNLSHFZYnZUeHZWcERU?=
 =?utf-8?B?M3hVU2ZsRHg2QmsyZWhMdzJ6S0tnc2h3N3ZHcnR3MDVMSUdaam8xd3dVd3Jq?=
 =?utf-8?B?R0tBODdtbDIyV0NvTHlYcEhtaENwTmhRVVRaTzRUZXRucmJHekRKQTNMUENR?=
 =?utf-8?B?a0VqKzFLSXlQRUpDTnFQbXdmS2l1NS91Rm1zQy9TR0Z1UWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXFZaFFIelBYUXgwaVgxb2lqV3ZjZTBYYWFVQklUcWRyU1RyRnREbGVZSldw?=
 =?utf-8?B?TUw5ZmRvakdyUTAvU2EyaWlYN28xY3dQdytVeG14N0c5NXl3SVpHTVZTcmhE?=
 =?utf-8?B?ZURxNzB2Nkw3bXhBQXFqUVdZK0dhM0pCWWFtcGRHZlRMYnVqSzdRQWhXVHVB?=
 =?utf-8?B?UHBBZHlkeWZsZ0h6cWt2bitjRXZROXhieG83NkcybE1udVIwdjhjQ0JSajRn?=
 =?utf-8?B?OGdzZ3pPR3ZZaS9rbS9MQkxpOUxjVFA4UWl4RnFUTzFjQWtPRWlXL2RjejJQ?=
 =?utf-8?B?eDdmUjRncGo3enlMWHE3azlsVHM2clg1YnBHblRSaGY2cmZIM3R2ZzYrRmhH?=
 =?utf-8?B?bzk0bW9IT0VjMm1ESlB6WjdtdWE4WkNmaWtZMDZEbWV6NXlDVTh5UFhxUlNQ?=
 =?utf-8?B?Z1dVZ1grTjgxcVR3QU5GRUNRZzJUOHZNUllnR0g0bU5WMjYwcVlBVjM5MmU0?=
 =?utf-8?B?SXNRTklQTG8rdFczSmpTaFRNSjJSMERNeUZEeXlqdTNraHFhOTNjOXpTNk9K?=
 =?utf-8?B?Q1RhcnZLbWowVFU5QklJRnJnUWRwUHgzbnlMZUhWSjVlNE12VXg1QUJIWUFI?=
 =?utf-8?B?WUJTc1Z6cEs3a1lkcHgyQVhYQndTZjU4dTRsQ2VzdEh4bTVoNzYwMXZQQ0lS?=
 =?utf-8?B?YW8zNThobngwcXVXVGV4VlBmR0JIZVpaTk9TVk1YWXVQV050THN6STBEeDNO?=
 =?utf-8?B?TkRmcGVSTCtTMDBBWnlDMGNROURqdFh6Wmh2UCtYejBIeVNsVjV0eVRwMTBQ?=
 =?utf-8?B?U1BBelpUUHJBbzVKVzhndTVvSGNiVTFpTTg4VFlJK01IVDFxb1FwbHBibUk1?=
 =?utf-8?B?UUJmVXVzeW4rdUJPVjVhNFBBY2NzcUJtb1FBU3ZTS3R4K1FXdkw1b3Z5Qzh6?=
 =?utf-8?B?WUc2TWZ3blFoWFhpV3NMK29lUmtvcVpoK1FaVXZzbWp3aFZtaDNiYTVXb2tH?=
 =?utf-8?B?My82UWFDVllTa2kxblVpV0FFazNBSlNUd3FFQURidXAyTlN5UE9DeVRXYmNS?=
 =?utf-8?B?RkFUeTI3ZDFjTUZSaU04eXI1WHI4cktkWXByZTBrSFBoNGU4aTZ4SE1CMytk?=
 =?utf-8?B?QVA3bzdsWm1DTjhPM0pWZ1lIYjE4aWFZSENVMHBZcVRzcTd6VXI5cjhoMzd3?=
 =?utf-8?B?QTd3cUk5NXI4Z05CR2cxMjZoeTFiSVY4b2piaEc1MklPeWx2WWVtTzh5M1dX?=
 =?utf-8?B?bW0xakkvZ0FRUXlsVDJQejkyRzd4Y3NnM1JQWEZzOVMzV1RUZDJWRjNkbmNp?=
 =?utf-8?B?Z3g4OGhZUFNEanZPMHh6V3lERGY1RXgxWUUremY4dFgvakJvQ1Z3WnZDMVZT?=
 =?utf-8?B?YnBhSTdPa2pBU0RXUXVOR0V4QThZam5BM2w4LzR3WWtoSGFhVUVKM3FSZmll?=
 =?utf-8?B?NWVaYk5BenFpZUd1RjhaWkVDVWVOMC9LODNwQ0RPRWpWckUvakdxTW5WeTJB?=
 =?utf-8?B?VnJNSEZNNDgxVVRXVzcrYk85VWcwajc2ekZmWm9KZ1JlVjVoYVkvbHgzcXVH?=
 =?utf-8?B?aVNXcFNHLzBRRVJZd0tYdnF2ckx4OU5hM0pST1BZZzAraDJGejR6UmE1eFJs?=
 =?utf-8?B?OTRnclRGaVRPdUE0VUNEVlFUSGNIYUxQM25EQlNxWXhTd256VndHd2Q4dWRV?=
 =?utf-8?B?b3NaclU2SENpL0ZtZlBIYW1BMzhBWDlRWE9KalJyb3Q5YThJeWJWd1pvdmNQ?=
 =?utf-8?B?NjNlaXlVOE45VzFtMDFLa0RxdER1U0RNTVN3dTdiS0hLQjJFQUxJbzJBL2Ja?=
 =?utf-8?B?M0tncllTeFVsQUYzWS9jTWJwdDFsczlhUUVGbk9aTkMwUHdaSldSREV6ay9o?=
 =?utf-8?B?dVhJcGYxblhwNEczWWh2VVpQL2JnN096V2NNN0VGUGdoZUVCcUFXT0lhOUxh?=
 =?utf-8?B?d2JSL3N3NGFJUXlwZ01CdFlLWGw0SGUveFArR1NnSUJ4REQ5RzNZRG56WmlU?=
 =?utf-8?B?NlBWNTZ6TFVNUXVvc0hZUEF4S0t6a2J4SDFVZ0U3eVJMaTA1QjQ4Zzh0dmNX?=
 =?utf-8?B?TnpYUkFvL1NxTitLKzlLN0dRWms0aSt6bzZ2bG5PZWszNCt3REdTV01BS1M1?=
 =?utf-8?B?QmFubXVwK3hsQkEzd1JPOWUwTytTN1dtVVYxWi9OdEZXT0lVZE5NR001WVMx?=
 =?utf-8?Q?8xKgrgqdjTYiNHAqMfkvdh5AP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1bebf7-010b-42cb-62ee-08dd4994b0ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 05:35:12.8692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cj0lMx1yj9wynFPyLRge/EXzCLdZuvVPw08JYtwjZ3cf/14DvgJjK4wPTeULmT5JTw/FfvFurH82YJom1mGWKeJQY9vzJSEhn2s15EbEEaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6976
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
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2
YWxpLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8
aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IFBldGVyIFNlbm5hIFRzY2h1ZGluDQpTZW50OiAwNyBGZWJydWFyeSAyMDI1IDIwOjE0DQpUbzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBCdW1w
IGFib3J0aW5nIG9uIG5ldHdvcmsgZmFpbHVyZSBkZWFkbGluZSB0byA0MCBzZWNvbmRzDQoNCkRl
YXIgSTkxNSwNCg0KT24gMDcuMDIuMjAyNSAxNTowNywgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBT
ZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBCdW1wIGFib3J0aW5nIG9uIG5ldHdvcmsg
ZmFpbHVyZSBkZWFkbGluZSB0byA0MCBzZWNvbmRzDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDQ0MjQvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiAN
Cj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBJR1RfODIy
NCAtPiBJR1RQV18xMjU1NiANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJ
TFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBX
XzEyNTU2IGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAg
IA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8g
ZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTI1NTYsIHBsZWFz
ZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUs
IHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJu
YWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQ
V18xMjU1Ni9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICg0NCAtPiA0MykN
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE1pc3NpbmcgICAgKDEp
OiBmaS1zbmItMjUyMG0gDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBo
YXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xMjU1NjoNCj4gDQo+ICMjIyBJR1QgY2hhbmdl
cyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGln
dEBpOTE1X3NlbGZ0ZXN0QGxpdmVAZ3RfcG06DQo+ICAgICAtIGJhdC1qc2wtMzogICAgICAgICAg
W1BBU1NdWzFdIC0+IFtETUVTRy1GQUlMXVsyXSArMSBvdGhlciB0ZXN0IGRtZXNnLWZhaWwNCj4g
ICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MjI0
L2JhdC1qc2wtMy9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGd0X3BtLmh0bWwNCj4gICAgWzJdOiAN
Cj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjU1Ni9i
YXQtanNsLTMvaWd0QGk5MQ0KPiA1X3NlbGZ0ZXN0QGxpdmVAZ3RfcG0uaHRtbA0KPiANCj4gICAN
Cj4gIyMjIyBXYXJuaW5ncyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfbW9kdWxlX2xvYWRAbG9h
ZDoNCj4gICAgIC0gYmF0LW10bHAtOTogICAgICAgICBbQUJPUlRdWzNdIChbaTkxNSMxMzY0MV0p
IC0+IFtBQk9SVF1bNF0NCj4gICAgWzNdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVF84MjI0L2JhdC1tdGxwLTkvaWd0QGk5MTVfbW9kdWxlX2xvYWRAbG9hZC5o
dG1sDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10
aXAvSUdUUFdfMTI1NTYvYmF0LW10bHAtOS9pZ3RAaTkNCj4gMTVfbW9kdWxlX2xvYWRAbG9hZC5o
dG1sDQoNClRoZXNlIGFyZSB1bnJlbGF0ZWQgdG8gbXkgY2hhbmdlLiBQbGVhc2UgZml4IGFuZCBy
ZS1ydW4uDQoNClRoYW5rcw0KDQpbLi4uXQ0K

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B55C02183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 16:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF6310E6F2;
	Mon, 13 Jan 2025 16:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiooKRvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74F910E6F2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736784031; x=1768320031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GrA9u0hhYcP1xSzIGhq209+EILzwxQrH7/LXhtClBCQ=;
 b=fiooKRvIbtetpG2gd/MnKeAlYx5KVdoxiyfL/W2Tf2xjKhH9+jFHg8Rw
 OHKgBXdzrf750ds0Qimu5RS3iW/DHdb3UN7H7e/RX/fMjmPmCVGppCetM
 TsDDe8O0fwAZ/3x9XKQE3In9wpwgKMdfxBnmdUwx8dcHYJN7mdOLaeAVX
 pgmfQgiQD9E56B/ZZf5J/vDHUdRg9QrU+tET3Wqmf6JWr+nvyB3vx0JrY
 G5CGxPeLOBvz4q4pE5K0exc6SP45SCfvxP1wJ+88s3Kk0qDJQbinOfZLG
 TczJRriKjicPE16RCa3v8lOyTu8sGXXHma/TfBsAD5zWIb0Fwskgqpjq/ Q==;
X-CSE-ConnectionGUID: bDn3YjjGQ7WAxC1uPAO6Vg==
X-CSE-MsgGUID: 4yxrBJxMSJWXmpwVth7yvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="62427425"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="62427425"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 08:00:30 -0800
X-CSE-ConnectionGUID: D3C7BQF/QX+5RPDs/HDniw==
X-CSE-MsgGUID: /H5nphwqSoK6g4bIl3It1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104603340"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 08:00:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 08:00:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 08:00:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 08:00:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaa/lpHU+LK9uxzJLgDJenrYzbgr87qSuvcTQgPZ/tSUdRU9XQgc4ZARdc+QkOIeslMJf0Chb8/CecXk+fGnRIQAW6id2UY+J7GCO1iXocni4XIW1xx/hZJBuQvvz2lEJ2454PSZlh1WoUbAAjlmGVWjXojZ37p/8ZmdlxNHXJz0R8cO8/ArCEMwytdD+EBo2ZSF3WJhChM6yIZNDWXV6kOddaaO2Lrb8BRFFk57O4yihPVP1neAGuODPeTBfpe4lVyuUu2lpPgZsUx2kEj4O1YL5aXiu5m+INsJSs5BoCv04BddOnw3rMD07eWZYIOZG7gR+5cmgklASVYTZrh8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrA9u0hhYcP1xSzIGhq209+EILzwxQrH7/LXhtClBCQ=;
 b=aa4uGoTi55DDAWoS5yP28EchMTpw51et+VOR1GGKXHEhPxuzyVqPGBCVehztqftPDo9syeeJLkkicIgv2uDG2mdpgV0Ea53W5Gs1AcnC5/0WpFik3w6Qnlra/9/xYjtEPZqLJWVE87vDX59nd7RCzt5gDDH3K8mDaiC+DiwG1NObh67XCbZfHpe4LHX/qPnNujFqCyQJJVtin+ncUUvD5z2wg5Y5cds182XoifwBW+8ThnneNN2PIdhQX5Hb/kTheWuDHG+gv+gWJkBXJ5F+303Sb6OP8/ouh/P9f+zYAZfNoJBDTUY3eauqoQNCi9hk5o4Wa+PA4fdbc6oThkobSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB8042.namprd11.prod.outlook.com (2603:10b6:806:2ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:00:25 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:00:25 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Add a vm_unbind after
 the stress test completes
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_reset: Add a vm_unbind after
 the stress test completes
Thread-Index: AQHbYiBMQobRewuMFk+nDFtQgMFF37MNiJAAgAEMhICABk8sgA==
Date: Mon, 13 Jan 2025 16:00:24 +0000
Message-ID: <b2947f22bcd6921688b404c2ab6ea1056b433f23.camel@intel.com>
References: <20250108225424.95051-1-stuart.summers@intel.com>
 <CH0PR11MB54443F5CD1871591FB85DC4EE5122@CH0PR11MB5444.namprd11.prod.outlook.com>
 <63cc246d2c4e3929dedce3058cd93d9e17ba1a83.camel@intel.com>
In-Reply-To: <63cc246d2c4e3929dedce3058cd93d9e17ba1a83.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB8042:EE_
x-ms-office365-filtering-correlation-id: 4ccd2be6-2682-42b1-88b5-08dd33eb6455
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TzkzdEU4ZlluU2l1S3pGUC8vdXhWUUtESktuMDdKSVlrd3N1QWJndU4rY24v?=
 =?utf-8?B?ZzNHY2JPOGFOWFRGR2dTR3o4OTRlT1VuZkVTZ1RnOGtSSllLcmRGOWtBcElw?=
 =?utf-8?B?L0Vud21JY3lyK09ZN2FLL3lRSHNZTFF4Rk4wM2ZVWDJxazh6YUcwVGVCY0Zs?=
 =?utf-8?B?NVVncDY5Skcza2luYy92NVBPRGhOa3A3ZXRaWDBYY3NxZ21yUDE0K2pUOE5q?=
 =?utf-8?B?ekZlWnJKSkx2RVFQTFppcG1XbUxTSHpnWXA3VC9hWmZrZ1ZJVTVZZi9xS3N4?=
 =?utf-8?B?d2FLODZ1SXg1UHhFdURqa001SnN6T2NsN1pYY2wyV2U4dWV4S3IvL0NXT3Fn?=
 =?utf-8?B?UTAzalpqV0l2REJKTVlvbTVudGRqMURIQTd6Vk85T21IRmFFNmt1RTViaVVs?=
 =?utf-8?B?RWlKcUdtZnpIOWp4TDlDdHZjRm5KOFU2eTlDTTNoVExqWlpnZjAyMVVVQlNw?=
 =?utf-8?B?ZXRuNnd2TTloaC84QTlTZ1NjL3k0NHRJVWlJeUkvbzR6bGJyUHhPWU11b0lr?=
 =?utf-8?B?UTYzcnc1eG16clN1OXEyUzBQcHM0VTgxLzYrWmdVdDBvb2JNZzdTcjdFYkI2?=
 =?utf-8?B?YnF1NHB0eHZya2x2cFo3Z2w1cXUwRlByYzNzUHBpVEtyZXBWejNTdjh0a0hL?=
 =?utf-8?B?ZVc2SnBQWTJyU0NtL3VOYml2aE9tWGNWQVNYdTZKNk15eUZnWWZFZ1poRUJs?=
 =?utf-8?B?Z0hDQlMwSzJadmVWRXJuYVQ0TUhzdFhyWmpOOERzVUtuQWpGcysrenZVdkNq?=
 =?utf-8?B?bVNJeklFdHkyWFQ2THY0MFV4YmFtck1OQ2d5Wm5rQnN2OEh5blZYenVMTHBV?=
 =?utf-8?B?c0tUbWdGeUN4TnY2emZac3Jwd0JidlNpVGtraCtZUEIyTXpJYmplMHpqUmQr?=
 =?utf-8?B?OW5wM01ucUxic1RkSHhlSk8zME5ZRlBMR2J0U045eDRuUWJDam9udFdHR0xP?=
 =?utf-8?B?U1haN3hGQlJtelNENWsxUXlFalpLb1FQMWl5YVhhTnBRaitEa3Y0YVIxQUVl?=
 =?utf-8?B?QmVWWm9QcHduZmZUVlZhdVhHeWEvbHpHRHIreDJVcU1ZeGNKc3hKYmFrUzQ0?=
 =?utf-8?B?TTY5a3pEQzBFWjYxdmJ4cGRoV2N1b0swRDM3cmVpSVdqTmtxYnZ3Wk5tZ1pm?=
 =?utf-8?B?ZzRJZW1ybzJHcEoxMmF5NEU5N0MzaVlFTlA5YVEyVjNoTk5sMlJVSm84bE1W?=
 =?utf-8?B?bStkOWJ4NFliYUFDRzBMQ2pURWFBTmpkbi9iaTRPRnJrd3diM3FPUC9pUGNq?=
 =?utf-8?B?cWhUOWdTMWllUVhrZkh4VHpERVhkelBWd0JEbnFJMXo4TFZ2dGo1V0ZyT2t6?=
 =?utf-8?B?azRmZEdOU1FYVEpRMnBYLzNKdGVzc0JaNmRoRVhzM1M2Mklrb1NteWhUUVRO?=
 =?utf-8?B?UlpEZC9vcTdNRENjL2tscWluK1NCYmlTaG9wcndJL2VJMUVjcWh2SmpOeG5C?=
 =?utf-8?B?UHJYRjVSKzR6ZjNZTzJkeTNBSllpNE1BeGpXWEY4bXVBWHFCenBuRGUrR3Qy?=
 =?utf-8?B?YUY0WXV3NGFJTU5KRlN0Uk80YWd1SmlCdGduMmZyRGU4a0RtYlBkSDlOazFv?=
 =?utf-8?B?ZDNiOURuQ3pQNVQ1UndabnQyV2gzVXcvclU5dGpCOXAvejJNdzVSSmVkamZo?=
 =?utf-8?B?cnExK3lKWXlsQVhjcGNtOUxqMlBsaldRUlFWc1FReVRsTVR3OVBLT1FMb2RX?=
 =?utf-8?B?TDFiOTBIRE9RSGxKbTJUL1ErZ1RmSjZyNmRWaTZXUFZnK29kK05GYWVFblNH?=
 =?utf-8?B?QXFFeWVHMTd1RVI1RDkwdHJoMnlPekhkZnd6eld4Y1ozTkM2Q3ZJVmovS2lv?=
 =?utf-8?B?NmZQSWtaQmhnY0dwZ3dmU0lSM0hYM3pZSFgzRGxiOGhDRWJxTnNrYTM0ajgr?=
 =?utf-8?Q?uD5+ext544g5+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzJ6MDQ4Qkd3amhMWHlMNXVSOVlvZFd5VUN6TWFpRVdmMjQwSjFpcjYxVFBy?=
 =?utf-8?B?NGlnRVJOZ0hyZGtzYWMwMEwzMHNiWEs0R1UvVHdud3c3bDRNMEtSMHZYdjNW?=
 =?utf-8?B?SG80ZTVwSmVlYUVqWlBnT1FQZGhxSUhzTlRCUG1FY042cXV3ZzZZKzkrb3d2?=
 =?utf-8?B?MWRGMGtpNEd5aHNDY3JucGdoZitYdTBlQVFHK01VL3dtbXVNbWVINk95dXdZ?=
 =?utf-8?B?ODlQSUhzalRqZEpSQWZFRjRSKy9IWFFMbmhlWXlxQXNxeENjSit4cG1MeVcy?=
 =?utf-8?B?MkV6bVdNQklqUXlKVE5aT2t5SHYwdS9JL3FueHhTcEI2dDI4ek9teC9TOWhR?=
 =?utf-8?B?S3A3RTR4NjZ3MElZZzFReTNuamdZTUdFcWNud0pRdU1FUk1xSm5mUDNuSmlj?=
 =?utf-8?B?WkNKY2MzM1lpZXk2VTIxc3pmU3prZDVPMHZuMlpUdjFEVW10WWVRNHpVc1Y4?=
 =?utf-8?B?Ulo1bzVjcjkvcGJSU0s5U3JVZ2oxRFZ0b1pPbHl2YmFDcHlvWU1pZSsxUFN0?=
 =?utf-8?B?OEtNL0Q1NzdNOFR6TjhSSmY3azNUUmZwYkRFblEyYUZKanVVUlZra2o3dzNL?=
 =?utf-8?B?QnYvQjNUam40VytDKzcyM1B3Rk0waEVjNWE5QTYzbkFPZE9RRTNKQzNDYXJT?=
 =?utf-8?B?QkQvZXBreVZLRGRsSGpJY2svVjlJZ2xCVFViZktZU0JEdzZpRHJlZllHWDNM?=
 =?utf-8?B?RkJOYkhhbXFtMTNYR3lpUDFDcnpzbmZBN3lWUTJ3U04rQy9vU2N4VUZRRXJV?=
 =?utf-8?B?NTM3K1l0U1JUNXI2aTZ5YVBxVUlmdG8xUnpMKzJwOVY2ZDcyY0Jmc3QwZzFK?=
 =?utf-8?B?OXVpYnZpalBad2hjSjZZZ0ozNHlKR21lY3loUlpsN1VSOU1ZVmNLT3hRaXl5?=
 =?utf-8?B?M0tTMmhCanY2NktnY3hGcEtKQ3pqQUhCL0dzcE1VSDhSQXhVcGtlRkpVcytK?=
 =?utf-8?B?K1B0RW5HbU0zaVh1ak9YY0duNHNJeE16K2tjNG1lREM4T3hpbE9CZXN6azBY?=
 =?utf-8?B?cHg0Sko1OHhPaTV5bk00QWMwd1BKdmg1Z0NXakxNRThoRUdibjlMYmdyNnln?=
 =?utf-8?B?c3VLdmxIVUVaM2FiK1JGVXBwbFczZjlNVHNKeTAycjBsclRpVHZNRU9XRDVn?=
 =?utf-8?B?eHYxNkR6QmVNdm9WcW1RNjFUSEEzd0hLNG1INlpmS1NTV3dzT3d4NVowQkhZ?=
 =?utf-8?B?TWRiY25JL1VRSEF5eVFzaEVNdDdaeXpwZ0Qzb3JVQ1Q2L2JEczVCR2lpZk1h?=
 =?utf-8?B?Mk9HM1NpVVFoSUJKT2VPOFcxRjlVQkFOZ1JkU0lhQTU0RG5WL3BOd3VOZnUz?=
 =?utf-8?B?MzZiZXVITllnKzJCWVg0SWpHOXAwVElkdlY3M0l4bEcxUlNUZXdlMHp3SlVE?=
 =?utf-8?B?U29TdTdkSzM3OG4vREVMcklmTjhmYnk4T1JJVDBmbDdZMlJia3BqNkdWVGdy?=
 =?utf-8?B?M1J4YU9pR0FTbTR3U2x0Rk1OdVo4b2J5T3JtY0NsYnNna1ZhYU5hbVNjd3cw?=
 =?utf-8?B?YThDdG9aWkdTeXh5dGFNZnhLWFVlbkR5ckRueTl3bE9hbWNUMkV5UGRXRVpS?=
 =?utf-8?B?VG0yaUs0YmtFM1A4SS9VWXRxUUh1Z25PSjJUOTF6U2x0QUFzZnJUVzJ3NFRV?=
 =?utf-8?B?MVhyYlBLOFJaNjNkMjdycTg0aCtOd0VBS2lwVFN3UytHOWdBd1pNMG5mUHlx?=
 =?utf-8?B?STBtb3lkazJDbFUrTmp2YTk5OTg1MDZxZU9VemdDbGk2ZW83c3Rmc0hwcWdT?=
 =?utf-8?B?bFFRcHBDN28wZlNwQVcyZitKbEswbXA4Z240S0xLM09IcCtjanZaUUU3ZTdE?=
 =?utf-8?B?eTltbVRZU3pQbzBpNkVFV2I2YnRSOWFEV1FOblczRWVtMEpLSEZFemJRcFBn?=
 =?utf-8?B?N2FueXFOL3VEMVJ3WGNvNzVxQitXREc5Qnh4ZkQwT2txOVVIaFNydnB6ai9N?=
 =?utf-8?B?dkhCMENLVjRWVmVqRlpsMlpEY1ZydStrQk9yZkIwMlRHOWdhaUNkNlY1YlE3?=
 =?utf-8?B?UE00SEZ5Qlo0RnNxTUpNc05ibHBzYUcwQ2haVktDWjQ4VVJlc1lWU2FFT2tv?=
 =?utf-8?B?UTc1azRSUXI0b202Vk5VcHhwT1IrM2RBOHhBMFYybWxxWlZKeklNNWk4Rlhr?=
 =?utf-8?B?TTJPQmM4YjNyZnh0UUJhVDVPeVJLK2hDNjJvRWNPenovZ29KMFd3NmphWXo5?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B997777876040246B2F0C5EE098196ED@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccd2be6-2682-42b1-88b5-08dd33eb6455
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 16:00:25.0028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CtYQR3q+Tn9MxXFNe4y8uvR3eXgZrOIPk+2KCzmA9ydDP3S30Ep4fvnxUPVsc8Z/ClZHwShwtYH2QnbUtbOZUyhw5yWbzdBLmW1CXPPP/0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8042
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

T24gVGh1LCAyMDI1LTAxLTA5IGF0IDE1OjM5ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIFdlZCwgMjAyNS0wMS0wOCBhdCAyMzozOCArMDAwMCwgQ2F2aXR0LCBKb25hdGhhbiB3
cm90ZToNCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IGlndC1kZXYg
PGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+
IFN0dWFydCBTdW1tZXJzDQo+ID4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDgsIDIwMjUgMjo1
NCBQTQ0KPiA+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU3VtbWVycywgU3R1
YXJ0DQo+ID4gPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0gg
aS1nLXRdIHRlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQ6IEFkZCBhIHZtX3VuYmluZA0KPiA+IGFm
dGVyIHRoZSBzdHJlc3MgdGVzdCBjb21wbGV0ZXMNCj4gPiA+IA0KPiA+ID4gVGhlIHRlc3QgaXMg
c3VibWl0dGluZyB3b3JrbG9hZHMgaW4gYSB0aWdodCBsb29wIGFuZCB0aGVuDQo+ID4gPiBkZXN0
cm95aW5nIHRoZSBleGVjIHF1ZXVlIGZvciBlYWNoIG9mIHRoZXNlLiBUaGVyZSBpcyBhDQo+ID4g
PiBwb3RlbnRpYWwgdGhhdCB0aGUgR3VDIElEcyBjb3VsZCBnZXQgdXNlZCB1cCBkdXJpbmcgdGhl
c2UNCj4gPiA+IHN1Ym1pc3Npb25zIGFuZCBiZWZvcmUgYSBHVCByZXNldCBnb2VzIHRocm91Z2gu
IElmIHRoYXQNCj4gPiA+IGhhcHBlbnMsIHRoZSBzdWJzZXF1ZW50IHN1Ym1pc3Npb25zIHdpbGwg
ZXNzZW50aWFsbHkgYmUNCj4gPiA+ICJsb3N0IiBpbiB0aGF0IHRoZXkgYXJlbid0IHN1Ym1pdHRl
ZCB0byBHdUMgYW5kIGp1c3Qgd2FpdA0KPiA+ID4gZm9yIGEgc3VibWlzc2lvbiB0aW1lb3V0IHRv
IGhhcHBlbiwgYXQgd2hpY2ggcG9pbnQgd2UgZG8NCj4gPiA+IGEgcmVzZXRfYXN5bmMgaW4gdGhl
IGRyaXZlci4gV2hhdCBzZWVtcyB0byBiZSBoYXBwZW5pbmcNCj4gPiA+IGhvd2V2ZXIgaXMgdGhl
c2Ugd29ya2xvYWRzIGFyZSBsaW5nZXJpbmcgYmV5b25kIHRoZQ0KPiA+ID4gY29tcGxldGlvbiBv
ZiB0aGUgeGVfZXhlY19yZXNldCB0ZXN0LiBUaGVuIHdoZW4gdGhlDQo+ID4gPiByZXNldF9hc3lu
YyBldmVudHVhbGx5IGdvZXMgdGhyb3VnaCwgdGhlIHN1Ym1pc3Npb25zDQo+ID4gPiBmcm9tIGEg
bmV4dCB0ZXN0IGNhbiBhbHNvIGhhbmcgKG9yIHBvc3NpYmx5IGJlY2F1c2UNCj4gPiA+IHRoZXkg
dG9vIHJhbiBpbnRvIHRoZSBndWNfaWQgZXhoYXVzdGlvbiBjYXNlKS4NCj4gPiA+IA0KPiA+ID4g
QWRkIGFuIGV4cGxpY2l0IHZtX3VuYmluZCBiZWZvcmUgZGVzdHJveWluZyB0aGUgVk0NCj4gPiA+
IHRvIGdpdmUgdGltZSBmb3IgdGhvc2Ugc3VibWlzc2lvbnMgdG8gY29tcGxldGUNCj4gPiA+IGJl
Zm9yZSB0aGUgdGVzdCBlbmRzLg0KPiA+ID4gDQo+ID4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL3hlL2tlcm5lbC9pc3N1ZXMvNDAxNQ0KPiA+IA0KPiA+IEkgdGhpbmsgdGhp
cyBuZWVkcyB0byBiZToNCj4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0veGUva2VybmVsL2lzc3Vlcy80MDE1DQo+IA0KPiBPayBJJ2xsIHVwZGF0ZS4gDQo+IA0K
PiA+IEJ1dCBvdGhlcndpc2U6DQo+ID4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9u
YXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gDQo+IFRoYW5rcyENCj4gDQo+ID4gV2VsbCwgYXNz
dW1pbmcgdGhpcyB3b3JrcywgYXQgbGVhc3QuwqAgSSBtaWdodCBiZSByZWFkaW5nIGEgYml0IHRv
bw0KPiA+IGZhciBpbnRvIHRoZQ0KPiA+IGNvbW1pdCBtZXNzYWdlIGFuZCBrZXJuZWwgaXNzdWUg
Y29tbWVudCwgYnV0IGl0IHNlZW1zIHlvdSBhcmVuJ3QNCj4gPiB0b28NCj4gPiBjZXJ0YWluIHRo
aXMgd2lsbCB3b3JrPw0KPiANCj4gWWVhaCBiZWZvcmUgbWVyZ2luZyBJIG5lZWQgdG8gbWFrZSBz
dXJlIHRoaXMgZnVsbHkgZml4ZXMgdGhlIGlzc3VlIDopDQo+IFRoaXMgcGFydGljdWxhciB0ZXN0
IHdhcyBhbHJlYWR5IHBhc3Npbmcgc28ganVzdCBuZWVkIHRvIHJldmlldyB0aGUNCj4gbG9ncyBh
bmQgbWFrZSBzdXJlIHRoZSBjbGVhbnVwIGlzIGNvbnNpc3RlbnRseSBoYXBwZW5pbmcuIEknbGwg
cmVwb3J0DQo+IGJhY2sgaGVyZSB3aXRoIHRoZSBkZXRhaWxzLi4uDQoNCk9rIEkndmUgZG9uZSBx
dWl0ZSBhIGJpdCBvZiB0ZXN0aW5nIGhlcmUgb3ZlciB0aGUgcGFzdCBjb3VwbGUgb2YgZGF5cw0K
YW5kIEkgY2FuJ3QgcmVwcm9kdWNlIHRoaXMgYmVoYXZpb3Igb24gdGhlIGxhdGVzdCB3aXRob3V0
IHRoZSBJR1QNCmNoYW5nZSBJIGhhdmUgaGVyZS4gTGV0J3MgZHJvcCB0aGlzIGNoYW5nZSBmb3Ig
bm93LiBJZiB0aGlzIHBvcHMgYmFjaw0KdXAgd2UgY2FuIHJldmlzaXQuIFRoYW5rcyBmb3IgdGhl
IGxvb2sgaGVyZSBKb25hdGhhbiENCg0KLVN0dWFydA0KDQo+IA0KPiBUaGFua3MsDQo+IFN0dWFy
dA0KPiANCj4gPiAtSm9uYXRoYW4gQ2F2aXR0DQo+ID4gDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gPiAt
LS0NCj4gPiA+IMKgdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5jIHwgMiArKw0KPiA+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQg
YS90ZXN0cy9pbnRlbC94ZV9leGVjX3Jlc2V0LmMNCj4gPiA+IGIvdGVzdHMvaW50ZWwveGVfZXhl
Y19yZXNldC5jDQo+ID4gPiBpbmRleCBhM2VhZjhiYmYuLmNhNTU2NmQxMSAxMDA2NDQNCj4gPiA+
IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYw0KPiA+ID4gKysrIGIvdGVzdHMvaW50
ZWwveGVfZXhlY19yZXNldC5jDQo+ID4gPiBAQCAtNjQ1LDYgKzY0NSw4IEBAIHN0YXRpYyB2b2lk
IHN1Ym1pdF9qb2JzKHN0cnVjdCBndF90aHJlYWRfZGF0YQ0KPiA+ID4gKnQpDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgZXhl
Yy5leGVjX3F1ZXVlX2lkKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiDCoA0KPiA+
ID4gK8KgwqDCoMKgwqDCoMKgeGVfdm1fdW5iaW5kX3N5bmMoZmQsIHZtLCAwLCBhZGRyLCBib19z
aXplKTsNCj4gPiA+ICsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBtdW5tYXAoZGF0YSwgYm9fc2l6
ZSk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgZ2VtX2Nsb3NlKGZkLCBibyk7DQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiA+ID4gLS0gDQo+ID4gPiAyLjM0
LjENCj4gPiA+IA0KPiA+ID4gDQo+IA0KDQo=

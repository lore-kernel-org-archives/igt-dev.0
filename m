Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDCBCF2583
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 06:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAFA10E57C;
	Wed, 19 Nov 2025 06:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IK43fwra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2078110E572;
 Wed, 19 Nov 2025 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763532952; x=1795068952;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=b3m/uMehe0Z/ds8Ip7iaewWC4aTur2Zfa1zXQtrQWxg=;
 b=IK43fwra4GSCpTUnJK1bhrqbRCfcfMr6nhV/GURxzQmDrkScJvL+nzap
 SwHtEdgZSZ5sda9iIbtGX+xVJE15GfyCjXjfBimfOm6aYRvshEexzIxg2
 K3bWsrIxBQ2jOq3pPpWZllWepIfF7y8uPh2yA07+mx77MT5sGuB+PqFCB
 NnMAIHybOcsnTQdUlfVH7Top47AH5xs+wa4/bkSFAfpQmK5tuTFDAIvPZ
 V1AtUtyFsXoj1WiKidN3Ae6u6V4hTe09nlmcs3NoA0ycw+k81RNUKp+IW
 0ipxaOS992dxOO36xMHSb8k/VcxAs3I1/X/ZX3her56QTHh/wy91ZYlNJ A==;
X-CSE-ConnectionGUID: J4JczthQQticmA15GsPDEg==
X-CSE-MsgGUID: To5jjbS3Q9SLUMAo5jv8Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="82957150"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208,217";a="82957150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 22:15:52 -0800
X-CSE-ConnectionGUID: R91NccvGQmmATgdmg2/QOA==
X-CSE-MsgGUID: OqtCanz6T8Op/cXfkbLKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
 d="scan'208,217";a="221607727"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 22:15:51 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 22:15:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 22:15:51 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 22:15:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3KppoceiBQoaKaZvqZuLTi8QozxDdsKlbjWc4UcuRjfkfdVG5nJRJeYCEEJIc3rwBSh9PnXtnrdUXzciWc7fIxckEOe/8FrAMhzhu+qOKlUgARPGuhBMrzx11W84QueODyIgbBeQeewYhQrmnRBVP8tp/UrCRUATJumbaDNoIyAQIDv0l8o3yjetFqz2yGSOj6N1D0ClhsbWEWn3CnqXeu3IBKcQzQKZTprAZAM3q+S0zDtnMdU2slXlzmNhGlFIptL0bvxiju9nal2SJgHhuHNV97B0RPbMRwuMWFBjZ1D9sA9fBUH/UNAK27b6aoEBxHRpRk/MSVccYT5WiNbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3m/uMehe0Z/ds8Ip7iaewWC4aTur2Zfa1zXQtrQWxg=;
 b=KhPc8w7x59nLi4sokNqWAp4uLckIApWUHQGU8JUCqLsbHmG1RAF7Vrm6CX3spoavEj92GyD9w5fBLQQp/rTF6o2ty1PbzPukOu6GnRgvZyBAy5vNP49QtWE6U448r4gMB50SvQ70fB9NDCEzs40sEaP01CgoRk9ie5ypOLo6ZWgTnh5wHLINcrdVKMArEVPtrSD8HOGlRv4NpVOqI9IDGzag5jEWItDLQE00jzE6il3G9nSF3pgvkwfjm57cDTg6cmC+EZKGPFWCidbTDab/Pv2B2jLcCHKMzN30W8ssMRSdsrC5YVdR6sHqABJo7o18Ub4WxwG8QkMDxSSWK/fGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by PH0PR11MB7469.namprd11.prod.outlook.com (2603:10b6:510:286::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 06:15:44 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:15:38 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIFJGQzogdG9vbHMv?=
 =?utf-8?B?Z3B1dG9wOiBBZGQgR1BVIGZyZXF1ZW5jaWVzIHRvIHRoZSBjbGllbnQgaGVh?=
 =?utf-8?Q?ders_(rev4)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgUkZDOiB0b29scy9ncHV0?=
 =?utf-8?B?b3A6IEFkZCBHUFUgZnJlcXVlbmNpZXMgdG8gdGhlIGNsaWVudCBoZWFkZXJz?=
 =?utf-8?Q?_(rev4)?=
Thread-Index: AQHcWPKFbGBSgHtKpEyELX6d7x7SDrT5hTIs
Date: Wed, 19 Nov 2025 06:15:38 +0000
Message-ID: <CH0PR11MB54279833265018FEF9A357C298D7A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20251118055043.660759-1-s.sebinraj@intel.com>
 <176351513271.6923.11528683968667382853@a3b018990fe9>
In-Reply-To: <176351513271.6923.11528683968667382853@a3b018990fe9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|PH0PR11MB7469:EE_
x-ms-office365-filtering-correlation-id: deff2983-e25a-44b2-d139-08de27330f54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: =?utf-8?B?WXdiUFhDR01OdUxzSTJxQ3VXTVpGZk9VVFA0OC9lRXg0VjY2b3M2WitvMnNF?=
 =?utf-8?B?K3F0QU8venAzekMwc3hCODJodVNoZjhabC81NExvNFdXWmp2cUhxVEp2ak8v?=
 =?utf-8?B?a2ZOTmVhY2QyaVlDblhvNy9qS2xXWnRUQTZjODE4cUtDUTJPakVicVJVKzNE?=
 =?utf-8?B?RXZsNmYwWlBmZEhOUVdjeU9xYWVMV0lhSVNSSXppc0N5OW0vRjVMZHZweXYw?=
 =?utf-8?B?ekZ3VHUzS0hpOHVxMUdCUDJKc0lnNy9OdmdLVlFPUXZJb1F6MW5uNVRienV5?=
 =?utf-8?B?ZVRaZnlhdTV3aGorUzZKc21JVUpBbWlYNGtFQ211UVIvTEhwRmxBbU9sZ0xy?=
 =?utf-8?B?Ykl6M2g5NWVFOUtaNzhvMmc0R3NZTUgwRWVNQlpqN3V3QUlWQnh5Zk1Rd0p6?=
 =?utf-8?B?SVNDalZPQ3dMamlDRzZkZm5FZjl2allWaGFiaG1zOGhxWWRtQS9ZeitPRWVm?=
 =?utf-8?B?Z0ZEK1RzYjNsNldlUE42K2NhR1V1U0hSWFNLRWJJTDlrODBDMFNlZmZiL08y?=
 =?utf-8?B?eW5qMFNIRzRkZmYyalBxNkhGVG1tV2d1bHdtUVk2bWx3QzlDVHE5WGNzUThX?=
 =?utf-8?B?NXkwY21UR0Z4NVlNOEVzb1RQeEtvZlVQZTV6U1JTckkyOU0wVU1nOHFkdWpi?=
 =?utf-8?B?UlVUL1lyODFjWHBITng4N2txckx6b1IzVW9SMU9idFhib0dYRkJvTS9NWDkz?=
 =?utf-8?B?akdkMVFTUStXWGg5QUl3S1hOd1lSNmlUdFp6d052TVo3NjNQNkxsUjhlR0k1?=
 =?utf-8?B?NmhIbTVmUHMwRFBuc2NyUEppMTJ6WFhuQTFrWHhlWDl0VE5nNXJQdkFPMEFj?=
 =?utf-8?B?VjViWU5CcVB0Nk9FbmNhTk1zS2xVejlra01qR3JRakdnUDh0aktxQWxkZVQ0?=
 =?utf-8?B?NkNJVlZDL1ZEZmtwZWczOXRCNzg5bGRWa29LSytzWm13eE9oNEhNc1NlVHFP?=
 =?utf-8?B?OHpyc05pVVIxSnE0aHZoWXlQaFlxcWhOSyt0NW5uNWY2QjNaekE5OWJKZ25E?=
 =?utf-8?B?Zk9QaDh1MmVVa1pIcHhwMmtxU1RBdTRRRm5ZbHdDTkNBc2RBcjBrbFArNnVF?=
 =?utf-8?B?UVJUUGFZWGpCR0F0ZDk4N3F4YVR4RDNMK2lKdm16LzRqRlJKekhiMEhHaUxK?=
 =?utf-8?B?bmZxalU1WUxCeWI5ajQ2eXRaUDZDZXZaZWZ5QWJmNFVibmZIdnY1NStCYmJN?=
 =?utf-8?B?czB5VzFQOTFEWHVFZGJWN3FvTjk5VGhTQUhYeUR1UGxhK0N3Y2RHdnFFREha?=
 =?utf-8?B?RmZhSnc0NXVLV29qbkM5VXdFNkE0Tko3OVcrbjNMRHhoekxPZWRGQzYxSXpW?=
 =?utf-8?B?em91eXdteG9pQjE0OG5lNlNQZFNDcnlSNENsTzc1MUljd04va1pib0dhSDJZ?=
 =?utf-8?B?M2RCd3dNZTBBU3QrSlMxeDBMYjVveUNBNjVFSXp3aGpRNDdLa1BKWUVCdkxZ?=
 =?utf-8?B?ejRkMEQ0alJZaFlxbEJESHgrY0RPenRvMUYzT01pWG5haXRURkcxdktZdy9N?=
 =?utf-8?B?ZVFlT25yam42SFZVTEFQeXZ4YjgwZ1FHdCsraHkySE5OQ0RDNThOdFlDSUVS?=
 =?utf-8?B?bmVSS2ZpNm5UcW82R3RzV2VtbHkyVmhZOVBTNDNWNkdSSEVCZVdTV1l6cXQ3?=
 =?utf-8?B?VFBTSjh0OC8zU1hjRkVFZFRCSGlHZE9KMnprNzB3a3pWUDd1Q2Z0LytEbksw?=
 =?utf-8?B?TG8xQU50emh5QmxVNkF4UWtxSmw3WTdtNEVrNllEa21tN204N3Y1QURZMDIv?=
 =?utf-8?B?RlAvL1VVZE1lYXFKa1JlcTdEOW4vNlJyM0RoU2ZYM3F2UW5lekErcGhPeXRi?=
 =?utf-8?B?L2k1ZVZzWm50Y0JGTWlMUENyV3JUaE8xVWZEL1V6Q1d1eUxzOW9nQ3R6Q3B4?=
 =?utf-8?B?ZHVEemtaODFOYnBOUkcwTVlMdGdSS1pXZmhCUTVuUHpLaEt3MSt1MUxpQThj?=
 =?utf-8?B?aGhpSkl0Ynp2dmtDVGRZQmdhNmZ6Q1hERDZteXhnRllGOW9WUnhweTZGSEhl?=
 =?utf-8?B?M3FsNlFhQ2FBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0VPMTVqTUZCNlJ5LzNlRHVoTkVVSFBFaDF2ODBReWx6dHJMOWRoc0pkdnkx?=
 =?utf-8?B?MmxyZXE3UEszSGxORUhPZ2lEdUtLYUQrSGp4cWZBaGlwdmVXK2hxbXlxQlBj?=
 =?utf-8?B?ampLWGtSMW9ySXlVYVFMTlhKQjNyVU5xVlNVTkh1T2xPZ2h1cC9jQkVDaEtm?=
 =?utf-8?B?eWNTNE9pNTZha2x0UCtIdll5UlA1OTkrRGRNSDdLK1l2RHRKK1U5ZXlQNkIr?=
 =?utf-8?B?NDUyb1dDTkZCU3JpS3RDU09jcEdMNzQyRUxBc3AyZGt6U2tjYWN0VTB5TjNN?=
 =?utf-8?B?RzM3a0JkSW1jK2RrM3RPRU84U3p6YVVOY1dzYm9tc3FEd0tjdFRpUlVUUnBy?=
 =?utf-8?B?ZWZ2R1dIR1JtTEkxQ2pTWndDODVPNktmZWRkNHhXYlBRT21XQUhCNnRvVW1j?=
 =?utf-8?B?MytDcnowOUNJRUg0ckE2eUdrbmgvd0JUaVF4ZGJLRm1KbHdsdVVTTWNCZWhZ?=
 =?utf-8?B?MHd1Z3hRR1lnQ1BjUm9raklqWGtmb0FwKzVRbnYwaFJST1gwK2tBRWR0Y2Rl?=
 =?utf-8?B?RDJObHZLTWNNQ1hIVjhQZzcvQklvZEQ2cjFjTllKdmllbXg2bmlnclRhaDdj?=
 =?utf-8?B?SUk2UWgzamJIdm13a3NoK05ReCtuVXN0RHRkQTRxTHlXSFdjR0dXQnBVbXVk?=
 =?utf-8?B?dnVXOXA5Z2QremNHcXJuTG10MkU3NVhLTUlUdEtTWjl1RXU5YlhURXdCZmds?=
 =?utf-8?B?d25wdVc3bjhiaytJcTVLNC9BWkpON3h6Rk5WTWNlaU9TUTV0TGYvMHBPbmhp?=
 =?utf-8?B?akVqMW9uM0s1VTdkUHN4bCsxZWt5R05PMVVxWktRdXhEYVpQTE9TN0NKa1dP?=
 =?utf-8?B?NkZuSFNIYmpUT09WZDBIOXFFUEFPRFBPeWhTSEVHRHJIY0p6MUlvQXVTRzNE?=
 =?utf-8?B?SlpFay9RZ1ZKaUI4S0tVMlE2SkhkNjByYSs0L0VaUVJYVlpyV0dab0xraWNo?=
 =?utf-8?B?QVAxM1VyTTVIV3JOcUVjVUJ5d3B0a2w3a21ZZzkrRWRwWEI1MFFuWkxvdkdH?=
 =?utf-8?B?d2FNcnpPWGZ2ZXU2V3ZoWmhvYWhpSnF0anF1ekcrdE9kdld4dDliSUFzZCtl?=
 =?utf-8?B?bExSaHAzRll6Wm55RnVwY3B4Z2R0ZVNoS1hEMlhwT0U1RDFEeWw0b2F5R0RN?=
 =?utf-8?B?eS9hakJJUjlpVGlaekoxZkw1QnBHVGNSS0E1MVJmSzJnVjZTdk42NC9od2Fz?=
 =?utf-8?B?Q09MVXlhRExLZFM4SzdobjhTZThLTXJBcDRpaFhFTUZST2RSamN3T0M4MElD?=
 =?utf-8?B?cm95emRnMVl6OGVlOUdkNGRSVEhCelBoV2JUTUdZazkzTHNlaXpqRnZoRHFG?=
 =?utf-8?B?a1hVWWU1blJiWFlhejc4TmpyTURqcG01QkxNZWFmQy90Yzhob0ZyY2Ixa0to?=
 =?utf-8?B?Uks3bjlSK0JpM0RFMml3NWRXdW5pb0w1UndkWHROcmxENGxXR2R4Z0JjTkc3?=
 =?utf-8?B?TU1SaVkyQk9VRy9ieVAxSVRjYTlrLzFnYS8rREVIOGJQMExJaXlZNmtlYnV0?=
 =?utf-8?B?ckI4aEhpUlpLZkhnVmxNaGdaUm5xT0NVTW1sNDRrdVgxanBKdDZSS2JqaWJs?=
 =?utf-8?B?czV6NStEYkNkcjRlV21rbE5mTk9VL0k5eUhoQ3lqdUdycG9vNGZoa2R0dS9k?=
 =?utf-8?B?ZWIzamhsTmxJNmJSWTl3SGtXRWV3L0xsZVk5aG5vamh5Q043RDNHb0pQaGNz?=
 =?utf-8?B?VVpZYzQ1OUQ4cTRic1Q5YnJ3TlVLM21HaW1GUFdyVjZQa0ZpUk9xd05Ybm1Q?=
 =?utf-8?B?eXJacEdFcUFmalFkK2c1L0M2bFBWaTBDTFVNWS85MHRxRmlLRU9rNEo0dkpH?=
 =?utf-8?B?WE1EeDBITFdqanc5bFlHZzJ5eXhKQXZJUXV3UlR6ZW5CNVRlMzlGV2FYZklj?=
 =?utf-8?B?am5tUHI2ejAwdEs0TVdNZ3hpWWlrUkVKV1Y5am1hajB6QnVIU1J5bHdLeVUz?=
 =?utf-8?B?VjhHMHZTYzc2aXJDc3MrYWtLNzdPNzBYclFGN3R5a2ZYdlVCYWMyT3NXejh3?=
 =?utf-8?B?MTBsZ1lEcUtLcFo1NElXcEk0R3FlVU8xTDFZWmIybEVmTWxERkN4enJYbURx?=
 =?utf-8?B?MG5HVjNKU1NRSDh1VUtnNTVlZkpleWFydDg3OThZRzZBMDJtcE9xLzJha002?=
 =?utf-8?Q?DBdNGBL0lGZGZalvYK7VHZX51?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB54279833265018FEF9A357C298D7ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deff2983-e25a-44b2-d139-08de27330f54
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 06:15:38.6869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3K98/YeBQu19KB3v4qMD12sO/29bpa396UVYnbS4IN7wRC+CKf+8jyRa3aIEnLSQXhiVF/+5LWF+fi+LEIyQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7469
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

--_000_CH0PR11MB54279833265018FEF9A357C298D7ACH0PR11MB5427namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IFBhdGNod29yayA8
cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmc+DQpTZW50OiBXZWRuZXNkYXksIE5vdmVt
YmVyIDE5LCAyMDI1IDY6NDggQU0NClRvOiBTZWJpbnJhaiwgUyA8cy5zZWJpbnJhakBpbnRlbC5j
b20+DQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPg0KU3ViamVjdDog4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgUkZD
OiB0b29scy9ncHV0b3A6IEFkZCBHUFUgZnJlcXVlbmNpZXMgdG8gdGhlIGNsaWVudCBoZWFkZXJz
IChyZXY0KQ0KDQpQYXRjaCBEZXRhaWxzDQpTZXJpZXM6DQpSRkM6IHRvb2xzL2dwdXRvcDogQWRk
IEdQVSBmcmVxdWVuY2llcyB0byB0aGUgY2xpZW50IGhlYWRlcnMgKHJldjQpDQpVUkw6DQpodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1NjYwMi8NClN0YXRlOg0KZmFp
bHVyZQ0KRGV0YWlsczoNCmh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTQwNzYvaW5kZXguaHRtbA0KQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBJR1RfODYz
Ml9mdWxsIC0+IElHVFBXXzE0MDc2X2Z1bGwNClN1bW1hcnkNCg0KRkFJTFVSRQ0KDQpTZXJpb3Vz
IHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xNDA3Nl9mdWxsIGFic29sdXRlbHkg
bmVlZCB0byBiZQ0KdmVyaWZpZWQgbWFudWFsbHkuDQoNCklmIHlvdSB0aGluayB0aGUgcmVwb3J0
ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KaW50cm9kdWNl
ZCBpbiBJR1RQV18xNDA3Nl9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUt
Y2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQp0byBkb2N1bWVu
dCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZl
cyBpbiBDSS4NCg0KRXh0ZXJuYWwgVVJMOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVFBXXzE0MDc2L2luZGV4Lmh0bWwNCg0KUGFydGljaXBhdGluZyBob3N0cyAo
MTAgLT4gMTApDQoNCk5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0cw0KDQpQb3NzaWJs
ZSBuZXcgaXNzdWVzDQoNCkhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2
ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTQwNzZfZnVsbDoNCg0KSUdUIGNoYW5nZXMNClBv
c3NpYmxlIHJlZ3Jlc3Npb25zDQoNCiAgKiAgIGlndEBrbXNfYXRvbWljX3RyYW5zaXRpb25AcGxh
bmUtYWxsLW1vZGVzZXQtdHJhbnNpdGlvbkBwaXBlLWEtaGRtaS1hLTE6DQoNCiAgICAgKiAgIHNo
YXJkLXRnbHU6IFBBU1M8aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9J
R1RfODYzMi9zaGFyZC10Z2x1LTkvaWd0QGttc19hdG9taWNfdHJhbnNpdGlvbkBwbGFuZS1hbGwt
bW9kZXNldC10cmFuc2l0aW9uQHBpcGUtYS1oZG1pLWEtMS5odG1sPiAtPiBGQUlMPGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQwNzYvc2hhcmQtdGdsdS01
L2lndEBrbXNfYXRvbWljX3RyYW5zaXRpb25AcGxhbmUtYWxsLW1vZGVzZXQtdHJhbnNpdGlvbkBw
aXBlLWEtaGRtaS1hLTEuaHRtbD4gKzEgb3RoZXIgdGVzdCBmYWlsDQogICogICBpZ3RAa21zX2Zs
aXBAd2ZfdmJsYW5rLXRzLWNoZWNrQGEtaGRtaS1hMzoNCg0KICAgICAqDQpzaGFyZC1kZzE6IE5P
VFJVTiAtPiBGQUlMPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTQwNzYvc2hhcmQtZGcxLTEzL2lndEBrbXNfZmxpcEB3Zl92YmxhbmstdHMtY2hlY2tAYS1o
ZG1pLWEzLmh0bWw+DQoNCg0KSGksIFRoaXMgZmFpbHVyZSBoZXJlIHNlZW1zIHRvIGhhcHBlbiB0
byBIRE1JIGRpc2Nvbm5lY3Rpb24sIGFsc28gdGhlIHBhdGNoIGRvZXNuJ3QgcGxheSBhbnkgcm9s
ZSBpbiB0aGVzZSB0d28gdGVzdHMuIFNvIEkgYmVsaWV2ZSAgdGhpcyBpcyBhIGZhbHNlIHBvc2l0
aXZlLg0KDQo=

--_000_CH0PR11MB54279833265018FEF9A357C298D7ACH0PR11MB5427namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+DQo8YnI+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9k
aXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+
DQo8L2Rpdj4NCjxociBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyB3aWR0aDogOTglOyI+
DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8Yj5Gcm9t
OjwvYj4mbmJzcDtQYXRjaHdvcmsgJmx0O3BhdGNod29ya0BlbWVyaWwuZnJlZWRlc2t0b3Aub3Jn
Jmd0Ozxicj4NCjxiPlNlbnQ6PC9iPiZuYnNwO1dlZG5lc2RheSwgTm92ZW1iZXIgMTksIDIwMjUg
Njo0OCBBTTxicj4NCjxiPlRvOjwvYj4mbmJzcDtTZWJpbnJhaiwgUyAmbHQ7cy5zZWJpbnJhakBp
bnRlbC5jb20mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiZuYnNwO2lndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnICZsdDtpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyZndDs8YnI+DQo8Yj5TdWJq
ZWN0OjwvYj4mbmJzcDvinJcgaTkxNS5DSS5GdWxsOiBmYWlsdXJlIGZvciBSRkM6IHRvb2xzL2dw
dXRvcDogQWRkIEdQVSBmcmVxdWVuY2llcyB0byB0aGUgY2xpZW50IGhlYWRlcnMgKHJldjQpDQo8
L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxi
cj4NCjwvZGl2Pg0KPGRpdj48Yj5QYXRjaCBEZXRhaWxzPC9iPjwvZGl2Pg0KPHRhYmxlPg0KPHRi
b2R5Pg0KPHRyPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+PGI+U2VyaWVzOjwv
Yj48L2Rpdj4NCjwvdGQ+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0KPGRpdj5SRkM6IHRv
b2xzL2dwdXRvcDogQWRkIEdQVSBmcmVxdWVuY2llcyB0byB0aGUgY2xpZW50IGhlYWRlcnMgKHJl
djQpPC9kaXY+DQo8L3RkPg0KPC90cj4NCjx0cj4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+
DQo8ZGl2PjxiPlVSTDo8L2I+PC9kaXY+DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7
Ij4NCjxkaXY+PGEgZGF0YS1hdXRoPSJOb3RBcHBsaWNhYmxlIiBjbGFzcz0iT1dBQXV0b0xpbmsi
IGlkPSJPV0ExZGVhYTM1ZC04YjQ1LTA4ZjktMmE4ZS0yOTdhYmQ4YmU4NjciIGhyZWY9Imh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU2NjAyLyI+aHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTY2MDIvPC9hPjwvZGl2Pg0KPC90ZD4NCjwv
dHI+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0KPGRpdj48Yj5TdGF0ZTo8L2I+
PC9kaXY+DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+ZmFpbHVyZTwv
ZGl2Pg0KPC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0KPGRp
dj48Yj5EZXRhaWxzOjwvYj48L2Rpdj4NCjwvdGQ+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsi
Pg0KPGRpdj48YSBkYXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiIGNsYXNzPSJPV0FBdXRvTGluayIg
aWQ9Ik9XQWE3ZTZiMThmLTRkNzAtMDVlZi05NGVjLTA5NDYzZmM0YTdhNyIgaHJlZj0iaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDA3Ni9pbmRleC5odG1s
Ij5odHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0MDc2L2lu
ZGV4Lmh0bWw8L2E+PC9kaXY+DQo8L3RkPg0KPC90cj4NCjwvdGJvZHk+DQo8L3RhYmxlPg0KPGgx
PkNJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gSUdUXzg2MzJfZnVsbCAtJmd0OyBJR1RQV18xNDA3
Nl9mdWxsPC9oMT4NCjxoMj5TdW1tYXJ5PC9oMj4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAxZW07
IG1hcmdpbi1ib3R0b206IDFlbTsiPjxiPkZBSUxVUkU8L2I+PC9wPg0KPHAgc3R5bGU9Im1hcmdp
bi10b3A6IDFlbTsgbWFyZ2luLWJvdHRvbTogMWVtOyI+U2VyaW91cyB1bmtub3duIGNoYW5nZXMg
Y29taW5nIHdpdGggSUdUUFdfMTQwNzZfZnVsbCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmU8YnI+DQp2
ZXJpZmllZCBtYW51YWxseS48L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDogMWVtOyBtYXJnaW4t
Ym90dG9tOiAxZW07Ij5JZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3Ro
aW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXM8YnI+DQppbnRyb2R1Y2VkIGluIElHVFBXXzE0MDc2
X2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW08YnI+DQp0byBkb2N1bWVudCB0aGlzIG5ldyBm
YWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS48L3A+
DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07Ij5FeHRlcm5h
bCBVUkw6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQw
NzYvaW5kZXguaHRtbDwvcD4NCjxoMj5QYXJ0aWNpcGF0aW5nIGhvc3RzICgxMCAtJmd0OyAxMCk8
L2gyPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6IDFlbTsgbWFyZ2luLWJvdHRvbTogMWVtOyI+Tm8g
Y2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzPC9wPg0KPGgyPlBvc3NpYmxlIG5ldyBpc3N1
ZXM8L2gyPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6IDFlbTsgbWFyZ2luLWJvdHRvbTogMWVtOyI+
SGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNl
ZCBpbiBJR1RQV18xNDA3Nl9mdWxsOjwvcD4NCjxoMz5JR1QgY2hhbmdlczwvaDM+DQo8aDQ+UG9z
c2libGUgcmVncmVzc2lvbnM8L2g0Pg0KPHVsPg0KPGxpPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6
IDFlbTsgbWFyZ2luLWJvdHRvbTogMWVtOyIgcm9sZT0icHJlc2VudGF0aW9uIiBjbGFzcz0iZWxl
bWVudFRvUHJvb2YiPg0KaWd0QGttc19hdG9taWNfdHJhbnNpdGlvbkBwbGFuZS1hbGwtbW9kZXNl
dC10cmFuc2l0aW9uQHBpcGUtYS1oZG1pLWEtMTo8L3A+DQo8L2xpPjx1bD4NCjxsaT5zaGFyZC10
Z2x1OiA8YSBkYXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiIGNsYXNzPSJPV0FBdXRvTGluayIgaWQ9
Ik9XQWNiOTViMjBlLTAxYTUtZTcwMi04NmY1LTQ4MmIxZjBjNmIzYSIgaHJlZj0iaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODYzMi9zaGFyZC10Z2x1LTkvaWd0
QGttc19hdG9taWNfdHJhbnNpdGlvbkBwbGFuZS1hbGwtbW9kZXNldC10cmFuc2l0aW9uQHBpcGUt
YS1oZG1pLWEtMS5odG1sIj4NClBBU1M8L2E+Jm5ic3A7LSZndDsgPGEgZGF0YS1hdXRoPSJOb3RB
cHBsaWNhYmxlIiBjbGFzcz0iT1dBQXV0b0xpbmsiIGlkPSJPV0FkOTMyMGQwYS1jZTY3LWExOWMt
NGQ1OC0zNDg2YWI0OTAwZmEiIGhyZWY9Imh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTQwNzYvc2hhcmQtdGdsdS01L2lndEBrbXNfYXRvbWljX3RyYW5zaXRp
b25AcGxhbmUtYWxsLW1vZGVzZXQtdHJhbnNpdGlvbkBwaXBlLWEtaGRtaS1hLTEuaHRtbCI+DQpG
QUlMPC9hPiZuYnNwOysxIG90aGVyIHRlc3QgZmFpbDwvbGk+PC91bD4NCjxsaT4NCjxwIHN0eWxl
PSJtYXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0b206IDFlbTsiIHJvbGU9InByZXNlbnRhdGlv
biI+aWd0QGttc19mbGlwQHdmX3ZibGFuay10cy1jaGVja0BhLWhkbWktYTM6PC9wPg0KPC9saT48
dWw+DQo8bGk+DQo8ZGl2IHJvbGU9InByZXNlbnRhdGlvbiI+c2hhcmQtZGcxOiBOT1RSVU4gLSZn
dDsgPGEgZGF0YS1hdXRoPSJOb3RBcHBsaWNhYmxlIiBjbGFzcz0iT1dBQXV0b0xpbmsiIGlkPSJP
V0FjZDM0NDA5Mi0zMDYyLTI1YTEtMzAxZi0wN2E5ZjBmOTkxYzEiIGhyZWY9Imh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQwNzYvc2hhcmQtZGcxLTEzL2ln
dEBrbXNfZmxpcEB3Zl92YmxhbmstdHMtY2hlY2tAYS1oZG1pLWEzLmh0bWwiPg0KRkFJTDwvYT48
L2Rpdj4NCjxkaXYgc3R5bGU9IiI+DQo8ZGl2IHJvbGU9InByZXNlbnRhdGlvbiIgY2xhc3M9ImVs
ZW1lbnRUb1Byb29mIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJl
ZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+PC9zcGFuPjxicj4N
CjwvZGl2Pg0KPC9kaXY+DQo8L2xpPjwvdWw+DQo8L3VsPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6
IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyIgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj48c3BhbiBz
dHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsiPkhpLCBUaGlzIGZhaWx1cmUgaGVyZSBzZWVtcyB0
byBoYXBwZW4gdG8gSERNSSBkaXNjb25uZWN0aW9uLCBhbHNvIHRoZSBwYXRjaCBkb2Vzbid0IHBs
YXkgYW55IHJvbGUgaW4gdGhlc2UgdHdvIHRlc3RzLiBTbyBJIGJlbGlldmUmbmJzcDsgdGhpcyBp
cyBhIGZhbHNlIHBvc2l0aXZlLjwvc3Bhbj48L3A+DQo8ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAs
IDAsIDApOyIgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj48YnI+DQo8L2Rpdj4NCjwvYm9keT4NCjwv
aHRtbD4NCg==

--_000_CH0PR11MB54279833265018FEF9A357C298D7ACH0PR11MB5427namp_--

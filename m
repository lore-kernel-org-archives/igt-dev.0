Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40505C3ABBF
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 13:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B6610E6A1;
	Tue,  6 May 2025 13:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSHQcsnS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407EB10E6A1
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746538663; x=1778074663;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XhzIHdyhY9eFXBX2E7nfsGxNT/HSm1vJKJOoTz4nNQM=;
 b=SSHQcsnSc0oVcyJGLmXVNIjbF9BQtVBZWnKddtfBzlLQpzUZzfhsPa00
 d1zVXfp9cuoiHQ+CdK8xCR7yiqRAqx90fuWlIrPHYwvX47aPdBSMvA0sq
 OFTlRzDIfQriIEKLpfEzoF5rG52LNCnTXbd0yEOT7BQf7mUVtzWr4RYAF
 OIy0SGQiUPbGprNfWfSGClzpWy9IIbgMu4oOWupRdqGAyOR1TwX9gZWyf
 99xipKvVG4ixZsoweKzUhwGwekJkOig0QkSGuF+r4mJzzMWxSeQGzwlr3
 EsXvE37sO1FbOwTmB/WLJuNj1kkw1tfiStinJbwSwVrNpNXGgDNbRxqYU g==;
X-CSE-ConnectionGUID: YJQHbkjjQgGUgnR23CgewQ==
X-CSE-MsgGUID: SvV3iY/zR2arpv526Od0Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59196050"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="59196050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:37:42 -0700
X-CSE-ConnectionGUID: qzAbN2UkQFOHc6rf6j/V0w==
X-CSE-MsgGUID: XTgokA0TTcOFZhJPqqOXZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="158886055"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:37:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 06:37:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 06:37:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 06:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwkL2rtVwL1Eqyz4la9Ib2HASvoM/hF12xdOp7Sq1zt4B9hcYm/13n/bsb9cWxEaQ4/Lsn2Or1n4LjaWrk83Xk8TM2W2VzkHYGBXyOXBIwZeJSeFehSl2cCSa/PRizjME+Hl8E+BXiVYMZdAsnMxLuaBZr2+6fWR/JmU8Qv0YT2emNSGjiYhvZyFJ4ILV9E3t2XW3Tfk4VLT1qDvR3SS8tbHdnfPAJ/rEHa21oCmTYAdo7r6yFAD82Cj4qHavb2SC9BLjk8ql/90M9OBXrT6sUyESXhJTtdT5HXYdQCdQHXG4Q5a8Cng7b5JPkFkBxJDSbPl37aADVDfqG4s9XqMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhzIHdyhY9eFXBX2E7nfsGxNT/HSm1vJKJOoTz4nNQM=;
 b=HMWZXa0winvOITLA3jXErLuFCfIwf2vvLBdlrKFiQN+5oQqNoHCgTJqrEciHj0RHNN9FSxkFxbs72pk+YenTgWFaf3cUKAb8DZ82wNVlRMzID3u2qwnImLeQy9XCLh1ciceK6vI+ZZU5cIEyvn5ku6Ztt7D37kRlrGTj2Iwmuv4+APPri0MsNZhHeWQRYMiiGZ/YSkoZiBK5jdZ0ZBk6LXICOP8EG6K83D3ZlEbjyLSE/U7c8QLHC+/IYFRp3vESf0iNhB5uHdDH9gSjitWjfP9eWZarugq3BJdyBwMqhEbj3fIUF0hhSbpKkHJxEFuGE0sAullGrTj4g6Pwn1wyqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 13:37:33 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 13:37:33 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_pmu: Unprovision VFs on cleanup
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_pmu: Unprovision VFs on cleanup
Thread-Index: AQHbvm/tZmZR87iNo0SxmpP93CRQELPFje3QgAAEXgCAAAiqUA==
Date: Tue, 6 May 2025 13:37:33 +0000
Message-ID: <LV3PR11MB8695B5BF96E37D062A9EC549F989A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
 <20250506101554.629218-2-marcin.bernatowicz@linux.intel.com>
 <LV3PR11MB86959312120282B055C39F93F989A@LV3PR11MB8695.namprd11.prod.outlook.com>
 <19df39b5-933f-4dac-9240-daa44194faf0@linux.intel.com>
In-Reply-To: <19df39b5-933f-4dac-9240-daa44194faf0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CO1PR11MB4913:EE_
x-ms-office365-filtering-correlation-id: 04df136b-b4e9-4577-9853-08dd8ca32815
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZUNhNGx6YnVoZnZwb2RnZE1teE1ZVEREOTExN25FL0ZMcW5FRVRZMG1KV2s3?=
 =?utf-8?B?MVp2eGdza0RtY1lLYXl3ZFU0YUNqSjFwZ2dkVllLWEQ4QnIzeVRDQU5BQ3JI?=
 =?utf-8?B?NE9tYVFMZVUyQ1NBSm4wbmY2TWsvUXFXQS9pQ21JdTE0aWV6NFl4bHJPWEJS?=
 =?utf-8?B?U3VvYUh4TzJ4QmFsbUt5aTJMQ01MQlYzTGRaTzZuZFZJZnBZTUhKbHhLWjVo?=
 =?utf-8?B?Sk9sVU9KUHlRQU50aFAyeTRDWnBzRittdisvT3RMN2lqc0JJNlJ1dFBLQzZK?=
 =?utf-8?B?YmcydGl1SXhkR2tybGJSLzN1MkQweGRTeDRla1g3RzMyK3dmK3VkREdaMkRN?=
 =?utf-8?B?R0tyNXI0a0ZNTTBSOXZ2S1J0WVlzQnRZSS9VVG5PVC93bXBRQlJuLzVoaVhX?=
 =?utf-8?B?OFptTlJMWDNvbkJWS3B5VDFLOFhEOXBXYWpuNVJsV3NETXQrMkNwVTMwWW0r?=
 =?utf-8?B?bklRTVZma1NST1F2QjRFRTBROThUdGhqTHAzMUxyRHV5aWZuQThXblJBeEZI?=
 =?utf-8?B?aEo1S2U0cFVOK0lRR0tLWHA0R3lZV1ZMejQ0N2RKbnpmN1JrMzNrU0xxVnZn?=
 =?utf-8?B?YWYzZkVTWlh5NEg2NHg2N2pZNHFnWVJFdWZpbVZGbUxOaFNOL3dQWkEvTWVy?=
 =?utf-8?B?MURLSENzL0cxN2lWN0x5SE9rRFhKcVRXSHUvZE9kVE9nNk1wcDdBWFlwQ2xj?=
 =?utf-8?B?bCtaQ0tQNTNGbXBaWCtVRHlaZlErQitYZTRQQjNtanZrV0xQdXZISlEyM2sw?=
 =?utf-8?B?VUViTGZNWUgxRk1Qem05SUY3bEozMWZpa2k2ZVYyWmZHSG5LME0xY1piVDJq?=
 =?utf-8?B?WjVhbkhuUlVXRHpUR3FpdlhBNG83MGZGSHluZXRSTUIzRWpxU1dIZHI2L0JS?=
 =?utf-8?B?aXNJTkVuSUpONm5EL0hiSlF5UnhSYVhPamhyWEhMWjlMODdUYW04bU1OU3VU?=
 =?utf-8?B?SGFLQTJBYlRLcWsrdWpRVmtsM3p2ckNQU1Q2aE5idGNwZDMrc2Qzb0p4ZVlm?=
 =?utf-8?B?cit2aVgyUGNiYUVINEViMFhwTURTTGNENndlZU5QSUJFSkdCVERnUU56cXRK?=
 =?utf-8?B?eGowQ041a2lXUS9oVEdLYW9vR3pUaklycTlCUlB6QnI2VDhaTHRiWW9xTnVu?=
 =?utf-8?B?SGNhSm92SlJ3RUs0T1JVRE04eW1jR1dPNmVDOEYwZ3BDUldZS091dmx3QVpa?=
 =?utf-8?B?cmJOb3FBaFFUaDk0Vlc0R0xQOUZzZlYzMmdDOHI3V1AvcXJRTCtBUnZvTjlO?=
 =?utf-8?B?ZDc4WEt5RFJVZGxTMUZJSDZManNNa2orZ0xkbm5JOExucVhMSmUxS3J6Vk5j?=
 =?utf-8?B?cWVuWm9xeUs3eWxweVBMbkpOMktBdmcrU25tTXcxUXBoQVpyWE9qYW8zU2hy?=
 =?utf-8?B?bWdtdEduS1VJdFZ1K2VhaENWOGJmN1J5TG01V1lvYlloMnZCV3BSMUtVcWZR?=
 =?utf-8?B?U3N0emhiZkxsc3VXcFNiYURmUnVYNDYyQVhHTk9nOURzRk9GZTg0ZzU2cm1m?=
 =?utf-8?B?L1V0TGZ5M3hlODZTLzE5em9mUzlLaUlGVng5NXF3N1NnbExLZlRiVHlHemZ1?=
 =?utf-8?B?VUJ4VDFyVnFxR0t6NDNudW95aTBWZ3V0OGNiVGhpc250QjJkY2pNOHIvdjlQ?=
 =?utf-8?B?ZVNJbzk1bkpPeGYvS3hnbkQ2cnYrOWt4ZytzUldieTRDZjF3ZTg3OE5DaXpV?=
 =?utf-8?B?aGg2QThFSjF1YkQ3eXcyTWd6ZU1MNTViWUxOY1M1cUUzWUlWWHRpYlRTb1hq?=
 =?utf-8?B?Y1dFRXp3b3htTjBCM2NVRVNMc3RRbUphZlFHdVJsVkdNK3V2V3ZrR2k3ZDdu?=
 =?utf-8?B?b0Q3Ykc2c0FXdFhkQmg3RHZNQzMra0NGZVB2Z0tmbHlEKzlHbFZ5Y1BKZkR3?=
 =?utf-8?B?cDFUZzBTVGw2V0dkT0NkV2x5QkpHVzVvUTZ6WDRCM3R0TGJ2dVlQNFlYMkEx?=
 =?utf-8?B?c0pvM08raXhPRzRmcTVxUVkyNHNzTGtwVWVsTzJrZnRkcXIyMDRObS9wcWJE?=
 =?utf-8?Q?Xq/JCpAyVqdv0hSpQE5uJppzcT8FyE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGVNQXBjQ0RpekgrOUEyWDMxdDNRMWVmZXdLRGhoVmlHemJMUURweiszV3lh?=
 =?utf-8?B?blErVFVBMVUxdXA3SnNYc0EvSmRLVkRUMUE5WGREVUZQak8weEZVdXlVam1X?=
 =?utf-8?B?UUltQmZ6UjV6V2ZnU0tLZXhCaVlFZUU3dVpzUEpBQXJoemlFNWk3RnNnZDVS?=
 =?utf-8?B?OEh5SWhjL3NkTmJXQ0VNSFN4aHBBK0dsL3BLOURNUHlVL1BjcC8wMmczbSsw?=
 =?utf-8?B?WXE1bzNIbHppUFRjNVRPME1Xai84UUg5NUJIQVdpb1IxZlF0UjJjTlVWSits?=
 =?utf-8?B?bU13Yzkrdzl1RzdKWWRlNytwVW1yQ3FwS1dwalVEeDEvdEsxbGhEWk5zUHNN?=
 =?utf-8?B?OWVySmdNZlZnUVpDYzF1NVVTTVdhM2Z4R3g3TjQvUVJPcmhzMkFNQjU4Vk5H?=
 =?utf-8?B?MXJDRVZTMUY3WDFoUkNtQytnNWgrdTIwUXJmYUJCQk1HalJ6aEF2cGhxSlgv?=
 =?utf-8?B?WDcxci9aZW1hZTJEVDdrSzlaa0tnY0lUQ1RLZS92QU9tOUFlb0ZyZDA1WHlK?=
 =?utf-8?B?ZjhVRlJHRTFrVU9uN2VWOEJyT0pJUTl2b1l3NDdCMDlBenV0dm1FWHI3eWRS?=
 =?utf-8?B?bmpoZkF0YWxDdUJteGpETnplZlpiYm1sUjQrYzR3N1ZUa1RndGRvMzJ0c0g2?=
 =?utf-8?B?T3p2MGlvbkZqMm5obklVaUhjcDVQaFgzRGt4WlBJOUg3V09mamxMelpWd3ZK?=
 =?utf-8?B?UllPY2VrTW14RXpIL1ZpbGRzclhjZmJoWmdBelhDaDk5T1drWlFXcnZyY0Vx?=
 =?utf-8?B?MUFac2tyR1NwazB6emdvNVVpUUpvdEh4ckhySDhUQUlzOXN3dXJNYW1OVnlT?=
 =?utf-8?B?OHYvbEpHSXNzZnJGUGNnNHV3blNEQnNoZW5nNjI5NWZMb2U1VzJDMTNrenR4?=
 =?utf-8?B?Y2Q0WWxaYWRRc0dGSWgwZEJEOThTNXRaL2tQbE9vNWJoWnp6Wis1UW5yeXVi?=
 =?utf-8?B?dWhDWE5YbkQ3L1F6bklhYytDd2M0Mlg0S1hiMW11TEdLcmNTbWFxYnpMUFVM?=
 =?utf-8?B?WURIUVVyNFpQeDRqemNETFVZQW9tVHl1czJ6Vm9OTGNGUWFWVGFta3hzNkxX?=
 =?utf-8?B?M1BXK1JtQkdERkNNRXk3MHprNFk2MWdWcHVISTdqY1ZGYVI0WkllaDNmakVs?=
 =?utf-8?B?bHJkQzhCdVpnd3h1RTZsNjVyR1MvbC80Qzl4VDVqYVViZThmSm1vSjlKRXVy?=
 =?utf-8?B?Z3ZaL08wbVZCdzh4MDV3cHk2Q1ZuR29aMExDZDNnaGxKZGdFdEEyODdXYnM5?=
 =?utf-8?B?RzNaNmdZNTd4UTF5TlgvZnNHcStZR0NIU1p2QkJ3NlFKUDdFRHRDdGpHTnFr?=
 =?utf-8?B?Q01ReW1RRzBDNnJ3bVJ2YklWbUMvVjc5VDAyZWUwN2JZV3BwdGdIWHU3V01R?=
 =?utf-8?B?WUxJdS9iU3NhOUtoUDVBcDlxOUFBMzZoM1JkUEE0ODZ2bVJJR1gvV2Z4QmVM?=
 =?utf-8?B?bS9DRVlycWlGcTVBV1A1U1dFVk1NeGtIKzRjMEI1V0RnaXVxZTNQWmV4N3l1?=
 =?utf-8?B?bktITitNRWVJU1cxVURiWnI0bEY3V05FNGZ3dHh1dVB0VlZuR256K0lXNS9v?=
 =?utf-8?B?UzJRMzhZT1VYZ083eUdQWDhxMjgzYWoxZ2NaMHN0RStRdmMwOVpIVVprOGps?=
 =?utf-8?B?TVdGS3kwTy85TER0RHpKWTc1d20zYjNTRmpxZkFTS2FreTBJd1Vpb3JkQXFG?=
 =?utf-8?B?eC9pOTlKUlQ0aGY2blpMWDEyRWpZdjFNdHZpSTczTWowVjYwUStRaFpYYjFo?=
 =?utf-8?B?YkhtTzJuMzB6aVZHbUp1NFgvY3dHN1V2eHR5SGh3R2pLMTRhV1pFMmI5Z3Bo?=
 =?utf-8?B?K0Q3czlWOFdCSHBGMU5CYkxjTzUydU9EYU5GeEVQdlBZWURyZ3A0WmZlYWlT?=
 =?utf-8?B?UGorK2Q5OWZXdHhVRzlaV0pWOTdvMkN2bTE5bGE1aFNuYWs5RUdKWUxOODVw?=
 =?utf-8?B?ZjY3ZmFLRWt1bHBRL3IrZ2xSdys3S0pxZ3dITCt3M2c4czhaV2MwbEJzZWhn?=
 =?utf-8?B?QlhRazVWYzVpQTBTTVNvVFNPNmpHSXlDSmFYejlPUEh0aUlma3VscWRDNHI1?=
 =?utf-8?B?RjJoMnptaENDeWJzTXZhcHErQ1I3YlZsUUQxQlNURlJ1WDMxejN4cHBYS2tI?=
 =?utf-8?B?OTd1RTVyWjVPdHAva1FJWUp2SEJxQUNTMUpzeEVrZ3JKaGJmb1R0KzJxU3Bt?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04df136b-b4e9-4577-9853-08dd8ca32815
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 13:37:33.5985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /MLuVkG098Fbvr2B6T54q9giIqALrfto8b1rP3KP6qA30p8i/HsHg24dcD5CBhg7BqHOTMqLv2FwCifeILYu8UzCZQZdmwmKFCszaWm4W8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCZXJuYXRvd2ljeiwgTWFyY2lu
IDxtYXJjaW4uYmVybmF0b3dpY3pAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBN
YXkgNiwgMjAyNSA2OjM2IFBNDQo+IFRvOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8c2F0eWFuYXJh
eWFuYS5rLnYucEBpbnRlbC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IEtvbGFrb3dza2ksIEpha3ViMSA8amFrdWIxLmtvbGFrb3dza2lAaW50ZWwuY29tPjsg
VGF1cm8sIFJpYW5hDQo+IDxyaWFuYS50YXVyb0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggaS1nLXQgMS8yXSB0ZXN0cy9pbnRlbC94ZV9wbXU6IFVucHJvdmlzaW9uIFZGcyBvbiBj
bGVhbnVwDQo+IA0KPiANCj4gDQo+IE9uIDUvNi8yMDI1IDI6NTEgUE0sIEsgViBQLCBTYXR5YW5h
cmF5YW5hIHdyb3RlOg0KPiA+IEhpLg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBNYXJjaW4gQmVybmF0b3dpY3ogPG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5p
bnRlbC5jb20+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIE1heSA2LCAyMDI1IDM6NDYgUE0NCj4gPj4g
VG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBNYXJjaW4gQmVybmF0
b3dpY3ogPG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+Ow0KPiBLb2xha293c2tp
LA0KPiA+PiBKYWt1YjEgPGpha3ViMS5rb2xha293c2tpQGludGVsLmNvbT47IFRhdXJvLCBSaWFu
YQ0KPiA+PiA8cmlhbmEudGF1cm9AaW50ZWwuY29tPjsgSyBWIFAsIFNhdHlhbmFyYXlhbmENCj4g
Pj4gPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0gg
aS1nLXQgMS8yXSB0ZXN0cy9pbnRlbC94ZV9wbXU6IFVucHJvdmlzaW9uIFZGcyBvbiBjbGVhbnVw
DQo+ID4+DQo+ID4+IFVucHJvdmlzaW9uIFZGcyB0byBlbnN1cmUgYSBjbGVhbiBzdGF0ZSBmb3Ig
c3Vic2VxdWVudCB0ZXN0cy4NCj4gPj4gUmVuYW1lIGRpc2FibGVfdmZzKCkgdG8gdW5wcm92aXNp
b25fYW5kX2Rpc2FibGVfdmZzKCkgdG8gcmVmbGVjdCB0aGUNCj4gPj4gYWRkaXRpb25hbCBjbGVh
bnVwIHN0ZXBzLg0KPiA+Pg0KPiA+PiBDYzogSmFrdWIgS29sYWtvd3NraSA8amFrdWIxLmtvbGFr
b3dza2lAaW50ZWwuY29tPg0KPiA+PiBDYzogUmlhbmEgVGF1cm8gPHJpYW5hLnRhdXJvQGludGVs
LmNvbT4NCj4gPj4gQ2M6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBA
aW50ZWwuY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYXJjaW4gQmVybmF0b3dpY3ogPG1hcmNp
bi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIHRlc3RzL2lu
dGVsL3hlX3BtdS5jIHwgMTEgKysrKysrKy0tLS0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwveGVfcG11LmMgYi90ZXN0cy9pbnRlbC94ZV9wbXUuYw0KPiA+PiBpbmRleCAwOTRk
YzBjNmMuLjhjYmJmNjkxNiAxMDA2NDQNCj4gPj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfcG11LmMN
Cj4gPj4gKysrIGIvdGVzdHMvaW50ZWwveGVfcG11LmMNCj4gPj4gQEAgLTQ5NywxMiArNDk3LDE1
IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQNCj4gZW5hYmxlX2FuZF9wcm92aXNpb25fdmZzKGludA0K
PiA+PiBmZCkNCj4gPj4gICAJcmV0dXJuIG51bV92ZnM7DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiAt
c3RhdGljIHZvaWQgZGlzYWJsZV92ZnMoaW50IGZkKQ0KPiA+PiArc3RhdGljIHZvaWQgdW5wcm92
aXNpb25fYW5kX2Rpc2FibGVfdmZzKGludCBmZCkNCj4gPj4gICB7DQo+ID4+IC0JdW5zaWduZWQg
aW50IGd0Ow0KPiA+PiArCXVuc2lnbmVkIGludCBndCwgbnVtX3ZmcyA9IGlndF9zcmlvdl9nZXRf
ZW5hYmxlZF92ZnMoZmQpOw0KPiA+Pg0KPiA+PiAtCXhlX2Zvcl9lYWNoX2d0KGZkLCBndCkNCj4g
Pj4gKwl4ZV9mb3JfZWFjaF9ndChmZCwgZ3QpIHsNCj4gPj4gICAJCXhlX3NyaW92X3NldF9zY2hl
ZF9pZl9pZGxlKGZkLCBndCwgMCk7DQo+ID4+ICsJCWZvciAoaW50IGZuID0gMDsgZm4gPD0gbnVt
X3ZmczsgZm4rKykNCj4gPj4gKwkJCXhlX3NyaW92X3NldF9leGVjX3F1YW50dW1fbXMoZmQsIGZu
LCBndCwgMCk7DQo+ID4+ICsJfQ0KPiA+Pg0KPiA+IERvIHdlIG5lZWQgdG8gc2V0IGV4ZWMgcXVh
bnR1bSBmb3IgVkZzLCB3aGVuIHVuLXByb3Zpc2lvbmluZyBhbmQNCj4gZGlzYWJsaW5nIFZGcz8N
Cj4gPiBBbnkgc3BlY2lmaWMgcmVhc29uIGZvciBkb2luZyB0aGlzPw0KPiA+IC1TYXR5YS4NCj4g
DQo+IFRoZSBzZXR0aW5ncyBzdG9yZWQgYnkgUEYgcGVyc2lzdCBhY3Jvc3MgVkYgZW5hYmxlL2Rp
c2FibGUgY3ljbGVzLg0KPiAtLQ0KPiBtYXJjaW4NCj4gDQpMR1RNLg0KUmV2aWV3ZWQtYnk6IFNh
dHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiA+PiAg
IAlpZ3Rfc3Jpb3ZfZGlzYWJsZV92ZnMoZmQpOw0KPiA+PiAgIAkvKiBhYm9ydCB0byBhdm9pZCBl
eGVjdXRpb24gb2YgbmV4dCB0ZXN0cyB3aXRoIGVuYWJsZWQgVkZzICovDQo+ID4+IEBAIC01OTYs
NyArNTk5LDcgQEAgaWd0X21haW4NCj4gPj4gICAJCX0NCj4gPj4NCj4gPj4gICAJCWlndF9maXh0
dXJlDQo+ID4+IC0JCQlkaXNhYmxlX3ZmcyhmZCk7DQo+ID4+ICsJCQl1bnByb3Zpc2lvbl9hbmRf
ZGlzYWJsZV92ZnMoZmQpOw0KPiA+PiAgIAl9DQo+ID4+DQo+ID4+ICAgCWlndF9zdWJ0ZXN0X2dy
b3VwIHsNCj4gPj4gLS0NCj4gPj4gMi4zMS4xDQo+ID4NCg0K

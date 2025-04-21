Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27A3C369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 07:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF8610E033;
	Mon, 21 Apr 2025 07:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kF6Mevri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350DA10E033
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 07:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745220730; x=1776756730;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tmsYAharRSMz3hoCV5WzLj9fhpw7z6slM5bRLySoTCs=;
 b=kF6MevriTE6blCljQbWIWEm82Xm/vIukTYW9kHvM7ML8WwiBGHnpWcOv
 +XwORPTqTrBXyxl7odBrUbi8DRM/OTIG7k/bG5K12GXBolwD+BIAQF4VA
 H5e6kZQBNIlBRGEB0rs6g4i2DmrJEOyf5nFpuTjSfsqwz8SSrnfE4c9kd
 m3GgMYnbGWO0PkGAhiXbHAZOyhoxoTakM1kXjPuQamZ9aYZKTf+W6PrYZ
 tGie6tCB/EVW080+9ajqDPLnqCJy2XSseqTWMsCfEdhE3P8AU69bgEOqq
 J2vdaEqvx04qgUwNoJS1TukhWu8Ur8Lr0+QnShxXkxCFM6TYj3eVC5dHY A==;
X-CSE-ConnectionGUID: Lx9PkUGqSx+RM65X0pdLRQ==
X-CSE-MsgGUID: Ydbb19OtSoeSCt+pOnLbqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="50411880"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="50411880"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 00:32:09 -0700
X-CSE-ConnectionGUID: okSUQStmQaKiqMxL/L2/1g==
X-CSE-MsgGUID: QK9Ul+3wTKC+Pt6nawv/Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="136510075"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 00:32:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 00:32:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 00:32:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 00:32:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guy7RzmcEXdWMgi3MDf/BH88qwBRbrWHQnz8l1euyM6rNLV4Xq/TAC1Zt3QiD4nyc7ReKaGm8R4cdgthViV4VQBdTcix7tTTN62gwyYhPIDpPno5Rc5KB8AnZ0TmJxedC8wa5mtlcZCQWSwIMRqPdDAYsr8T56cV1jQd/eAneavyAZKLKOIoePYVLMjusOE5N63D86a6smwFARhfRHtnC21M5zDod1KMN6xtRg++/k4T41M/YWfB4Fic7hO70NL9gjs5Wgp0TyXnrxaIoGfpIZaZv9sbod0a8Os8ayv65QY7p/glEc8hQSBMQspUwk4k2g7+qHXzHN7MxNglE7QUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmsYAharRSMz3hoCV5WzLj9fhpw7z6slM5bRLySoTCs=;
 b=j6qA4ZKYw4/7ql+JoevC5lG54b9LqypTlF5y3j/bWwjb2YWX2nzNtRsHFYN4oQoLetXD52iXvoJdLCQikOIgIATJwuZ7NygJ6I5Iw76tnjV3uEQ319mTRrtWvcgvuW/aeGn00MmlSFGly7TAqkXkdIP6EI5NuVWIhRwHYCf/K7f2z2wx2VtOqxIizQSWbL4+HObv93zwXMpFbuIS51op1JYuzpux5VV8/bnfIbRMOeGLftKWVjZCz2TPFw6gnkudZcQGved6o9b92/gD7/nf7pQ43C53M8QMFWfqcQ1a+ET1MTP5A4JuoQ24vmOMc1xit7HKj6pdvcd8K8nGOD951Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 07:31:53 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 07:31:53 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v6 3/3] tests/intel/xe_fault_injection: Do not
 assert for probe_guc_fail_* functions.
Thread-Topic: [PATCH i-g-t v6 3/3] tests/intel/xe_fault_injection: Do not
 assert for probe_guc_fail_* functions.
Thread-Index: AQHbrd4Ia5h1P0oWDkuLdzv7L+W+LLOnw0CAgAX/o4A=
Date: Mon, 21 Apr 2025 07:31:52 +0000
Message-ID: <LV3PR11MB86952CB1B30D2C10EC7919D8F9B82@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
 <20250415082711.4831-4-satyanarayana.k.v.p@intel.com>
 <2ce06211-6cbd-421b-8f1c-26a12ddd9742@linux.intel.com>
In-Reply-To: <2ce06211-6cbd-421b-8f1c-26a12ddd9742@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|IA1PR11MB8245:EE_
x-ms-office365-filtering-correlation-id: 0be1b1c7-3f82-48cf-a920-08dd80a69636
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TXFpVXpiS0RVck5xR2YzczFiQUpOVEhsa05ybStOcGxKSzYwV3JBeENOQU5p?=
 =?utf-8?B?ZHVJTVBQcXhUZnZnSkgwM3BoQ1d3Kys5YzdLYkRJVUNwU3FsQVRWT2t2V1Jm?=
 =?utf-8?B?YmhYaHdSK1FFMDBON2NHSkxOekJGZEFXVVVud0lYamppWlRVeE5CcDkxcjJK?=
 =?utf-8?B?SWwvQ0ZSbWFGK21KSjM0RGhjUzdGODJuN1VUSEQxbUU4ekY4WHlRTDMxb1hV?=
 =?utf-8?B?S1ZPRlFEbEJ3YXlTUlBOUFhCNktocWtTNWNqNCs1WU50Tnk0ZmEyZHg3UDlF?=
 =?utf-8?B?Q050QmNDbVEwZGxCWlFFcFNUelVKeGZFMjk2THZHZGVveFZBRmlKTVpra1cz?=
 =?utf-8?B?MUN5Z2NoOExCMkZmSXFwK2pBK210NnNOVUVUV1BvbGQwajFSeUJQOWFueWRI?=
 =?utf-8?B?RFpiTTdlRHRaSzQ3V2NHSGo2N1N4VGhRa2FpM2ZtWEljVXNkMVBzRk9ncldK?=
 =?utf-8?B?Y25FdDlHTzJuQ1RKVHZEUCs1ZDkxa2RKNnZ5U1kwVVdQZGdzdXVBcGFMQ1VZ?=
 =?utf-8?B?MUxwRHVienZmbllkQlhjN0RQUzRMdEFZUlZ6aitsYmtId3hkZlZBM1l4R2ln?=
 =?utf-8?B?MXVhbmh2UzQ1M1FLNlMzbTltblI3djVmMzcvN3VnL1ltN3pKOG9WRGMxVmhG?=
 =?utf-8?B?RkxUME82RmMycXhmdmh6UGt0Qm9tZzVOb3lzMDQ5QlFReEE1MmtPc29oSFFo?=
 =?utf-8?B?RHU3TGtKM0pTOS9GMEUrc1hlRzRycWg2R3RuOFUzd2VFQVdGQWUybndjdTVs?=
 =?utf-8?B?aGlrRm5WZFhlMm8wZTdDQS9vclI4bmYvV2g5Zk5kcWNhWU5XTUJjRVJodlR0?=
 =?utf-8?B?SEowSWc0QkVDLzNQVHBTeVJUWERhUHZaWTRHZFNWYnJjVEJlYlZKaEJjVzMr?=
 =?utf-8?B?T1EzQWM2VG9CZ3ZCbmpBaFFSSVkrTGVmYmJpeloxOC9xSEJyUGZTTXFKQzVI?=
 =?utf-8?B?RXkrVllRbm5FS0d1ZDNxZVFCb1hFMFlEUFY2MnVjR3A5NS80MytxT093Y3Bv?=
 =?utf-8?B?bFJoQXFlNGdwQlRsbS9kYlJhNnBjVjRaYnQ4SkRXTHdwbXEyTHVobXRaZkdJ?=
 =?utf-8?B?ZDVoQ2FqSFAyUFRQSEZpR2VRREVVUERUWnAvajcrb0tTODN5a3V1RnAvcXFy?=
 =?utf-8?B?VGZUODdrOWhlREJJeUE5OFY5aE1HRmpoNW1CTzJYdkUwSzFSa1owY3RjSHN2?=
 =?utf-8?B?bkZUemFjcmJHTm5pbVcvM0J1dTZoTmMxYTZnMWJuak9CbTFnRExheWFmVGlZ?=
 =?utf-8?B?QzdYUXRoWjYzWGptbnVkWGpiOHZOQXJ2dmVHREI5bk1TT1h0YllyNFAvVE9P?=
 =?utf-8?B?c0RpYU5sU0oraXZmUWwvcFhYMnRPcktXZkJ0UnFFWVVNd2Jyd3ZtekJtOUxj?=
 =?utf-8?B?UUROZXVuYTkxdjZvUXA4UHEvbmV1RExlVkJwQVdpMXVWU2dCQkJScWZPSTkz?=
 =?utf-8?B?dER3Ny9qd2c0dGRpYS9qT2UyUkVUblRXWXFOYW9yKytSSExGdlBwVzFkd1Yw?=
 =?utf-8?B?YlE2S3NzTytvZk1rU2czRUxpbCtFNEQ4ajNDUlphZzhVczFzOHVuM09FQUs5?=
 =?utf-8?B?aEF4YXh0aU0rN2FvUy8zN0dlaXFTWXlTTjY3SVBua3VlNE5ldHZVaEtkcFlw?=
 =?utf-8?B?L1gveUZ0NUhZamNPZWFEVzRkSkRkemxtNVlRZHdEVTJraFdjWHY4NXJHTDk3?=
 =?utf-8?B?cG82NXlRbk9VT0dNeEZjK3NwL3dOSW9iM2NoaStsbzM1TDdCeldPcTIwR0xU?=
 =?utf-8?B?SnFkMlJ5WTNkUGM0bG1WdVN6YjBwcnBGWHZMOEh1b1NzbVNsY3RXOEdxV0Jm?=
 =?utf-8?B?OEhSWW91YTZKS3kvaE9OSnJKTGdSWEhhTzEzYWRMeVRsUXBmSWRlNGRlMWVM?=
 =?utf-8?B?OUVtS1V5bGg1S0ZreXFZZStFSzBVbzgwZVQ0K1VtOUUvdjh4dE96Slhnd1Vl?=
 =?utf-8?B?Nmo0REc0T3BqQjBFam95SkMxOWYvazF4emV3YmhsR2ROQ1NGQ21ibXB1RDdR?=
 =?utf-8?B?QkdOTmsrWnVnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFpKcWxhcVcxbEUxNXVGY2tObTdPZGZTb2xoaXBZK2pnRkNseGZlajkzTXYy?=
 =?utf-8?B?U2NMMng2bG9PSHkyYjBWQnRCaGtmTU43cG9ZcGliaU5hTVFIYk5WTEE5NWZR?=
 =?utf-8?B?eFkyR0o4NkFuRWN1OXhVMmJyNkYrVnZERjFnMHZSWXRwVFVDOXJGcmphVVNO?=
 =?utf-8?B?NzEyaUw3blI1MEdDRndwaWE0bWtpbzczVkMrK1cxQk9seHZOVy9BcEc4RjhY?=
 =?utf-8?B?QlFmNE4yQjZhMmdSYnEyOWt1ZWFaQlRmVy9FMi9FUVI2a0JVZjVsWFFhRTdi?=
 =?utf-8?B?MmVOSVRIWTZEOFp4REkyME5IM3FXcHFFMEFIRFFPeTA2OGpLWlgyWjR4YVMz?=
 =?utf-8?B?cUtUNHFrVytHYU1mMmtmMzBVU0M3L0VQemtXQU8vWE90R3RrWmhlZDArZ2N6?=
 =?utf-8?B?ODE0dlBmSFhQL1p1WmZpd3dxVG9zaFhCSGxWRGRPT0IwbVF5MnEzOXI4bEU2?=
 =?utf-8?B?WWZSM1NIWXZtWUhyOGVaOUxOK2R3OUd5MTlNTFlZUnpuZDUxaENTc2dnRmVD?=
 =?utf-8?B?MDE5aC9DVnVNWG5yODUxTll2R3EzTUVJaysreTdWeXdvTlN4U0lYSFRXaTB6?=
 =?utf-8?B?ekpSdnMvTzJjUkdWbGkxYmhVYlk2Ry9jL25WOHJJVnYzU0JISExNQzdwTWN4?=
 =?utf-8?B?OVAxTHcxaFdvVFM5cDdqS3RXcVQzQ0FubGxkeWljeHQ3N0NDK0pHdjR1Ti9p?=
 =?utf-8?B?RUNoYXU0U2hKK1IxUHFOL2JhbVJibUNPMkZiZG5lUTRxcDRvRzFWUTRPdlJq?=
 =?utf-8?B?QU9LNGZMQTNzbGpwUGlEMXNxM20wQ0xBMlJGOGVtazJ6M0VWQmRwSU5HT0ZM?=
 =?utf-8?B?b1psM3htbDhlQzVVVy8rYm9iL01aUFdIOG5DVDVDTG13czUwOFVMZ1pkY3E0?=
 =?utf-8?B?NWxnN1BwU04zYTJRK1RwbjcwUnpHRWhFV29McXRBc01TR0NoQkNEYWN2RVND?=
 =?utf-8?B?UmVIbW5XN2NPejd3dldIRnZnak5wc21tZFN3akROQ0JWYXFBZHd0dnlhdlIv?=
 =?utf-8?B?RGJKbyt2TVVOd3QzUGZsTDhxK00vb0NpZmZEWm5NTSsyTForTnd6akUxZGRB?=
 =?utf-8?B?VTU2bXBqaGhOQmpDdncrOW0wUmRWaXpma3ByS09zc3lPYUtxNFlFMENnbFZD?=
 =?utf-8?B?emIyUDlzYks5ZzUyUm9GUm9FblRHT1NrbWhCNDhEZjZQTmduZ2xZT2srSG1j?=
 =?utf-8?B?WXM5N0Y2RDdvb3dMbUhlMXVuUTA5dStOejJmVVdIS0VHZDI0cWhCZFB1K0Ew?=
 =?utf-8?B?MmhXeUdWdnVWbld3VmNnaGZESVFwK1hkZnF6Q2RoSjVuQWtzOHkyQ3RxV0JY?=
 =?utf-8?B?WjZmQnZnUG85R05EWGhXcTY0TFVuTFZlOFp4NUpEdFlRNjhURUJEbzdQSVd3?=
 =?utf-8?B?dzdnL3RBTlVKbjZwUmZyOFV0Nm0vNitINGtPUTBNR2xmTDJXdG9yenNHS2Vs?=
 =?utf-8?B?KzhwdG1neXZ1aTM2QXY1blNZRXJkRlhLY2JRSWw0TVpLeDhJR3NYcGMzQ0JR?=
 =?utf-8?B?eTMvcTNiRmNCSSthYUtaVVd5UngxQVREcHJXS2pXeUZwUVRBeUFhNFVFQXdX?=
 =?utf-8?B?eXlWSmVwbHRYRTluWG00anozQldjeVNTT2tOUlhKZTU0enB3cUNLUUhMSHdS?=
 =?utf-8?B?K1B3d3JReVBqTkdtLzBJdEN5ZVlIYXpUMVQ0L1lGcFJkbjNHNmlsbzhhU3V0?=
 =?utf-8?B?QU9QSnYva0ZZZWJ6WXpudzJkak51Ky9KSHE5U0h5SDM0ekhIbEFWU2RJRlp1?=
 =?utf-8?B?bVdEM1ZrSlJieUc1cVQ4cmp0UWIzSDI5UmpSaWVHZXRJNVNETS9Vc0graHpy?=
 =?utf-8?B?N21wODhEb1JpQzBrNSswdXp5RE9LRG41R2NGaGpxMDBDTFhqRXdOSWpUUTlt?=
 =?utf-8?B?N0gwdWFxdzlVZjNUUFN3WFE0Wk1EU0dndVNMYUtsZlFEUkg1THVuUit4bmM0?=
 =?utf-8?B?WGZYSXpQZGlTeTUyK093cVNtSnpiZWk2U2JzV21XQ205bVR2M3AraURpMmJO?=
 =?utf-8?B?ZmNxY0RZdHh0N3VKa0dVWjlMTEl4WlNFUHY5Mk13amRLNzJBNGxvS082NEYr?=
 =?utf-8?B?RThtb1BzREtDaWNIRDN0V1Q3eEN3SVVZeGR5bGpCWTlwalZ5WTVmYzRzS0U0?=
 =?utf-8?B?cm0zSyt6RHh3Q2EzQksrYWtsdlkwekpEdStzZndRaE5UZnpxUG95cGwrRk5k?=
 =?utf-8?B?UlZkdDRWN05iR21aekRvR3lWZjl6a05vNmVPdExCTWVJaXdCRFA5ZlRkTWlm?=
 =?utf-8?B?TzM3dDZCK3pDZFVSZXhtK0s0ZGN3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be1b1c7-3f82-48cf-a920-08dd80a69636
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 07:31:52.9110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDM2ihuTO5fcqixQ5Hv5kocryXkqZaUaBMRw6cIpwikzCsMklic7QlclrGze/XGBhxUYTwlwTdehgfxfdgmo6CbOGQNkJRI7A0Zd60iFn+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
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

SGkuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJlcm5hdG93aWN6LCBN
YXJjaW4gPG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBBcHJpbCAxNywgMjAyNSA1OjI1IFBNDQo+IFRvOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8
c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwuV2FqZGVjemtvQGludGVs
LmNvbT47IER1Z2FzdCwgRnJhbmNvaXMNCj4gPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgdjYgMy8zXSB0ZXN0cy9pbnRlbC94ZV9mYXVsdF9p
bmplY3Rpb246IERvIG5vdCBhc3NlcnQNCj4gZm9yIHByb2JlX2d1Y19mYWlsXyogZnVuY3Rpb25z
Lg0KPiANCj4gSGksDQo+IA0KPiBPbiA0LzE1LzIwMjUgMTA6MjcgQU0sIFNhdHlhbmFyYXlhbmEg
SyBWIFAgd3JvdGU6DQo+ID4gSW4gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHRlc3QgYXNz
ZXJ0cyBpZiB0aGUgY2FwdHVyZWQgZXJyb3IgaXMgbm90IHNhbWUNCj4gYXMNCj4gPiBpbmplY3Rl
ZCBlcnJvci4gSXQgaXMgcG9zc2libGUgdGhhdCB0aGUgZXJyb3IgcmVjZWl2ZWQgaXMgdHJhbnNs
YXRlZCB0byBvdGhlcg0KPiA+IGVycm9yIHdoaWNoIGNhbiBiZSByZXR1cm5lZCB0byBhcHBsaWNh
dGlvbiBhbmQgaW4gc29tZSBzY2VuYXJpb3MgZHJpdmVyDQo+IHJldHJpZXMNCj4gPiBpbiBjYXNl
IG9mIGZhaWx1cmUgYW5kIHNvLCBubyBlcnJvciBtaWdodCBiZSBjYXB0dXJlZC4NCj4gPg0KPiA+
IENvbnNpZGVyaW5nIGFib3ZlIGNhc2VzLCBhZGRlZCBmbGFncyB0byBjb250cm9sIHRoZSBhc3Nl
cnRpb24gYWZ0ZXIgaW5qZWN0aW5nDQo+ID4gZXJyb3IuIFRlc3QgZG9lcyBub3QgYXNzZXJ0IGZv
ciBwcm9iZV9ndWNfZmFpbF8qIGZ1bmN0aW9ucyBhcyBkcml2ZXIgc29tZQ0KPiB0aW1lcw0KPiA+
IHJldHJpZXMgaW4gY2FzZSBvZiBmYWlsdXJlLiBUaGUgbWFpbiBpZGVhIG9mIGluamVjdGluZyBl
cnJvcnMgZm9yIHRoZXNlIGd1Yw0KPiA+IGZ1bmN0aW9ucyBpcyB0byBjaGVjayB0aGUgcm9idXN0
bmVzcyBvZiB0aGUgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2F0eWFuYXJheWFu
YSBLIFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+ID4gQ2M6IE1pY2hhxYIg
V2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gPiBDYzogRnJhbmNvaXMg
RHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBGcmFu
Y29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICB0
ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYyB8IDE0ICsrKysrKysrKystLS0tDQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYyBiL3Rlc3Rz
L2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+ID4gaW5kZXggMjUyMjA5MzA4Li4zYzM4OWEy
NjggMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4g
PiArKysgYi90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+IEBAIC0yOCw2ICsy
OCwxMSBAQA0KPiA+ICAgI2RlZmluZSBCT19TSVpFCQkoMTAyNCoxMDI0KQ0KPiA+ICAgI2RlZmlu
ZSBJTkpFQ1RfSVRFUkFUSU9OUwkxMDANCj4gPg0KPiA+ICtlbnVtIGFzc2VydF9mbGFncyB7DQo+
ID4gKwlJTkpFQ1RfQVNTRVJUX09OX0ZBSUwsDQo+ID4gKwlJTkpFQ1RfTk9BU1NFUlRfT05fRkFJ
TCwNCj4gPiArfTsNCj4gPiArDQo+ID4gICBpbnQzMl90IGluamVjdF9pdGVyc19yYXc7DQo+ID4g
ICBzdHJ1Y3QgZmF1bHRfaW5qZWN0aW9uX3BhcmFtcyB7DQo+ID4gICAJLyogQHByb2JhYmlsaXR5
OiBMaWtlbGlob29kIG9mIGZhaWx1cmUgaW5qZWN0aW9uLCBpbiBwZXJjZW50LiAqLw0KPiA+IEBA
IC0yMjMsNyArMjI4LDcgQEAgc3RhdGljIHZvaWQgc2V0X3JldHZhbChjb25zdCBjaGFyIGZ1bmN0
aW9uX25hbWVbXSwNCj4gbG9uZyBsb25nIHJldHZhbCkNCj4gPiAgICAqIEB4ZV93b3BjbV9pbml0
OgkJCXhlX3dvcGNtX2luaXQNCj4gPiAgICAqLw0KPiA+ICAgc3RhdGljIHZvaWQNCj4gPiAtaW5q
ZWN0X2ZhdWx0X3Byb2JlKGludCBmZCwgY2hhciBwY2lfc2xvdFtdLCBjb25zdCBjaGFyIGZ1bmN0
aW9uX25hbWVbXSkNCj4gPiAraW5qZWN0X2ZhdWx0X3Byb2JlKGludCBmZCwgaW50IGZsYWdzLCBj
aGFyIHBjaV9zbG90W10sIGNvbnN0IGNoYXINCj4gZnVuY3Rpb25fbmFtZVtdKQ0KPiA+ICAgew0K
PiA+ICAgCWlndF9pbmZvKCJJbmplY3RpbmcgZXJyb3IgXCIlc1wiICglZCkgaW4gZnVuY3Rpb24g
XCIlc1wiXG4iLA0KPiA+ICAgCQkgc3RyZXJyb3IoLUlOSkVDVF9FUlJOTyksIElOSkVDVF9FUlJO
TywgZnVuY3Rpb25fbmFtZSk7DQo+ID4gQEAgLTIzMiw3ICsyMzcsOCBAQCBpbmplY3RfZmF1bHRf
cHJvYmUoaW50IGZkLCBjaGFyIHBjaV9zbG90W10sIGNvbnN0IGNoYXINCj4gZnVuY3Rpb25fbmFt
ZVtdKQ0KPiA+ICAgCWluamVjdGlvbl9saXN0X2FkZChmdW5jdGlvbl9uYW1lKTsNCj4gPiAgIAlz
ZXRfcmV0dmFsKGZ1bmN0aW9uX25hbWUsIElOSkVDVF9FUlJOTyk7DQo+ID4gICAJeGVfc3lzZnNf
ZHJpdmVyX2RvKGZkLCBwY2lfc2xvdCwgWEVfU1lTRlNfRFJJVkVSX1RSWV9CSU5EKTsNCj4gPiAt
CWlndF9hc3NlcnRfZXEoLWVycm5vLCBJTkpFQ1RfRVJSTk8pOw0KPiA+ICsJaWYgKGZsYWdzICYg
SU5KRUNUX0FTU0VSVF9PTl9GQUlMKQ0KPiA+ICsJCWlndF9hc3NlcnRfZXEoLWVycm5vLCBJTkpF
Q1RfRVJSTk8pOw0KPiA+ICAgCWluamVjdGlvbl9saXN0X3JlbW92ZShmdW5jdGlvbl9uYW1lKTsN
Cj4gPiAgIH0NCj4gDQo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gcmV0dXJuIHRoZSBwcm9iZSBy
ZXN1bHQgZnJvbQ0KPiBpbmplY3RfZmF1bHRfcHJvYmUoLi4uKSBhbmQgZGVjaWRlIHRvIGFzc2Vy
dC9ub3QgYXNzZXJ0IG91dHNpZGU/DQo+IA0KRml4ZWQgYW5kIHNlbnQgbmV3IHZlcnNpb24gZm9y
IHJldmlldy4NCi1TYXR5YS4NCj4gPg0KPiA+IEBAIC0yNjMsNyArMjY5LDcgQEAgc3RhdGljIHZv
aWQgcHJvYmVfZmFpbF9ndWMoaW50IGZkLCBjaGFyIHBjaV9zbG90W10sDQo+IGNvbnN0IGNoYXIg
ZnVuY3Rpb25fbmFtZVtdLA0KPiA+ICAgCWZvciAoaW50IGkgPSBpdGVyX3N0YXJ0OyBpIDwgaXRl
cl9lbmQ7IGkrKykgew0KPiA+ICAgCQlmYXVsdF9wYXJhbXMtPnNwYWNlID0gaTsNCj4gPiAgIAkJ
c2V0dXBfaW5qZWN0aW9uX2ZhdWx0KGZhdWx0X3BhcmFtcyk7DQo+ID4gLQkJaW5qZWN0X2ZhdWx0
X3Byb2JlKGZkLCBwY2lfc2xvdCwgZnVuY3Rpb25fbmFtZSk7DQo+ID4gKwkJaW5qZWN0X2ZhdWx0
X3Byb2JlKGZkLCBJTkpFQ1RfTk9BU1NFUlRfT05fRkFJTCwgcGNpX3Nsb3QsDQo+IGZ1bmN0aW9u
X25hbWUpOw0KPiANCj4gCQlpbmplY3RfZmF1bHRfcHJvYmUoZmQsIHBjaV9zbG90LCBmdW5jdGlv
bl9uYW1lKTsNCj4gDQo+ID4gICAJCWlndF9rbW9kX3VuYmluZCgieGUiLCBwY2lfc2xvdCk7DQo+
ID4gICAJfQ0KPiA+ICAgfQ0KPiA+IEBAIC01NzUsNyArNTgxLDcgQEAgaWd0X21haW5fYXJncygi
SToiLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsDQo+IE5VTEwpDQo+ID4NCj4gPiAgIAlm
b3IgKGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzID0gcHJvYmVfZmFpbF9mdW5jdGlvbnM7IHMtPm5h
bWU7IHMrKykNCj4gPiAgIAkJaWd0X3N1YnRlc3RfZigiaW5qZWN0LWZhdWx0LXByb2JlLWZ1bmN0
aW9uLSVzIiwgcy0+bmFtZSkNCj4gPiAtCQkJaW5qZWN0X2ZhdWx0X3Byb2JlKGZkLCBwY2lfc2xv
dCwgcy0+bmFtZSk7DQo+ID4gKwkJCWluamVjdF9mYXVsdF9wcm9iZShmZCwgSU5KRUNUX0FTU0VS
VF9PTl9GQUlMLA0KPiBwY2lfc2xvdCwJcy0+bmFtZSk7DQo+IA0KPiAJaWd0X2Fzc2VydF9lcShJ
TkpFQ1RfRVJSTk8sIGluamVjdF9mYXVsdF9wcm9iZShmZCwgcGNpX3Nsb3QsDQo+IGZ1bmN0aW9u
X25hbWUpKTsNCj4gDQo+ID4NCj4gPiAgIAlmb3IgKGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzID0g
Z3VjX2ZhaWxfZnVuY3Rpb25zOyBzLT5uYW1lOyBzKyspDQo+ID4gICAJCWlndF9zdWJ0ZXN0X2Yo
InByb2JlLWZhaWwtZ3VjLSVzIiwgcy0+bmFtZSkgew0KDQo=

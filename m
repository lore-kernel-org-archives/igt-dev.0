Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5EAEE4995
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 11:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA9110E181;
	Wed, 11 Sep 2024 11:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hes5jvnD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191F110E181
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726054461; x=1757590461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3CGHbiEim9+UcB9IY+e/VUY6xIq8nONdsgdV8HMX7No=;
 b=hes5jvnDEKeHT0Y2AYA0GAilIs7SBBtxOS32XvLrRTdbX2iQTue+8qUJ
 919X2lby3WS2l7dbtGCoNJqQ3TtobAtI3YORO9DVSAhCbHwEOwokvz1tN
 EGvJ2BZnTWaNE+VOYrS08ofsIe2bv3g//tV4pzwg/kEvwaMSrspiikuA2
 cMSYTxYhe1D0t4DFYQfKJhYMtp+62p8z7zDgN60dimXlMPzb5ZsYL775C
 sz23fhqlygotxgoiZOk6HxgAr6kFsC20tsLwNkq6JSX5BQEAMv6VUQhpj
 99IuENrwPYWJr9NMtPdwxWiOyzMUvDectgjpXrBkyQTXFSb7c6lxO2596 Q==;
X-CSE-ConnectionGUID: N/ZotG8pRB+sq8H3juWMjg==
X-CSE-MsgGUID: rxHYPfieQgSVF55fNTS41w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50261703"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="50261703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 04:34:20 -0700
X-CSE-ConnectionGUID: vNKIxVwtSQy7XksrccyIig==
X-CSE-MsgGUID: nJuSzSkgTAOcQrHrAWDCDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="71715567"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 04:34:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 04:34:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 04:34:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 04:34:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 04:34:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLMfRCIL8CstUy90YCEenBGZRZOnxWLLQZdlG7tfl8Ou31E3zyTeJU6SrTJBomV64eai90BXCJrnx18TCo7lwNRXw/UMk4ZoZ2Yws+0WeGg/WvwkT/7uyMbhdlK+kYKIIaE1OfjzxNCsTdFwPqabWVu8pXvKp5H9ZNbRsTwOgvQjkbZ3Rwlz0NVPoWhwQFoYH8NUk458fkmmi7IfYeUIWz8MfbUTVV1qZUO2hj3Z/xI0ontaZWxcqjayF/DBProwRvA7noJ27wTdaKy7q/qtFDrS4oFxcl2dOsB6IZzKIfoLVE50slP1O0d6CxbDUNL6AjlwJlqG6Rsv2ATIbG5r0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CGHbiEim9+UcB9IY+e/VUY6xIq8nONdsgdV8HMX7No=;
 b=NE/gpXTtRTQI3g1jQx1jANzcfnDgcNvaXuCJR7VTWAu82Mizr+9M5JGZaJ28Myc9MgWxCyxzYqW1tWCRjieT5QKzGjVuKQ6dY5PKcI+OMyuciyVhthUH1Ta6Xgk1P7LdZGC1qqUWlLzNAN7ODk78423uxNdhz/SToBL1P7GclWD6HXuO89oXdNpUp2RYyc5DrF7OI86JZZcgzATcHS0nTYlY5XESYk1pfTopwPEqBpgZ1FtphYgzOv9B69DhFy/4Z5qIgnuad//qkVq3ER0gGq8a+UkrCEjYVw3Dtqth7Q1z3i/hXVV/cmR+tf5w52vUgjwYaIdg8VMCMx49rV8cgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by PH7PR11MB8504.namprd11.prod.outlook.com (2603:10b6:510:2fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 11:34:17 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 11:34:17 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t v2 3/5] tests/intel/kms_fbt: Add
 psr_sink_error_check to PSR tests
Thread-Topic: [PATCH i-g-t v2 3/5] tests/intel/kms_fbt: Add
 psr_sink_error_check to PSR tests
Thread-Index: AQHbBA6hh3uvxNq7hUu5Rhs7jrLXhbJSWKPw
Date: Wed, 11 Sep 2024 11:34:16 +0000
Message-ID: <PH0PR11MB48064231B6CDF992D641FB3EE49B2@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240911054958.1023925-1-jouni.hogander@intel.com>
 <20240911054958.1023925-4-jouni.hogander@intel.com>
In-Reply-To: <20240911054958.1023925-4-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|PH7PR11MB8504:EE_
x-ms-office365-filtering-correlation-id: c9f3c053-4d57-4df2-f94e-08dcd255ab79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UjR3bjRhR3ovNVZYbUtncHFqYkNzang5SVYreklyQ3BIL3lmeHhsYjhWV0hS?=
 =?utf-8?B?b2hYeUJhSDJCcFIwV3d6RWFBbVFjVDNMTVRBdndRRWdnV1FjdXB2Wlc1ZDQ1?=
 =?utf-8?B?aHEvZHBwS01ES0g5blJwYlY5eUtybkpPV0xzaDhNK3dZUktYZGNYVzVweitP?=
 =?utf-8?B?M2NhRFM3T1h4T05aR0hvZEZybHU1Y0pVYUJBSms0WXNTalAwUDNZa1lFc3pl?=
 =?utf-8?B?Vk8rNWl2OFRSdGg0dURRdjRYOCswUFhTaGdNU055UjVRZEE0cVVmRUxBN0Vn?=
 =?utf-8?B?d0JmZEdqeGhFRm91d2tibHllYjlUUTFFWlp4aXVxTzJKNlUzMTFrZURxSzFv?=
 =?utf-8?B?ZFJZNSt1dld1VzR0SE5WRFd2YXdpcll1YXdqK3pPNmNBWEZwZmFQYk5PWjI3?=
 =?utf-8?B?Ti9YdlpqdlZ1WExNYUxFeGljTTBWTC9pS1B5TytKblZpZ05iem9uTk1PdFJs?=
 =?utf-8?B?dS9ZVUY5bExmaUxnUkUzMDI5aUVKblp0TFBhNlp3M3Y2NkNnMkFib1hSOUF0?=
 =?utf-8?B?Mmg3SU8zalI1VEJqQVQ4d1FDWU5tOTM3UWV5aUVEY2NYZ1UrVWVRV0hUWmJK?=
 =?utf-8?B?aFFPS3Q1cXE2VTR1UlMwcFRsT0lScEFMMDJJVEdkdExES3d6c2tRdEVSTU1Q?=
 =?utf-8?B?eWhRcW5pRVpFMnJmWkkya2h1VnYvTFFaMXgvdTI3L0pKeTJrUXRPaDBJcFJ1?=
 =?utf-8?B?ZkNzSnUyQTZzZS9YWU1lak43MmQweGtoS0g4QjhEVDI2d3VlZnBpdHpZV1VS?=
 =?utf-8?B?WnZhWGcvelEwZkF4QkhRdWNnek1NYXNqYlFnaDJyZE05Q08vSEg0MUE0YVZn?=
 =?utf-8?B?U3M2ZTRkTEVmdVBHWDBrUTNsaThHanh6OTFOclF4TE5qZEx6d3ZYN28rVmp0?=
 =?utf-8?B?V2V5NUdxVnkycW5DZDJ5WHVoTTBDSmxtWUhVU3ZXbDl6R0FSOGYrSVpjMlJT?=
 =?utf-8?B?citEblBKQW5PdmxrNjI1SVFIRUJZcUsyeTBsazJFY1BEUk5LWEhvRHhha2JB?=
 =?utf-8?B?N0RwSE9SRlVyd2JvUElWYjFURHRHMnkrbGloV2xVTlZHc2VXVmt4VkdUSFY4?=
 =?utf-8?B?eDRNM2dUT2FmZVZaRDNVREczZ3E1U0tOVFhKT1JicUdHRWxISDJFaGtpcEFV?=
 =?utf-8?B?ckNHYUF3cW5ZRnJSbWE0N1o3bHN4NTZlTXlZUkdsSFZQZnFOZzNZK0F5SnVa?=
 =?utf-8?B?bmQvMmo2NnoyMkFxMkFyV3pLeEFtMWpNbk0yc25GUlR6SjgwMVlGaFI1WklE?=
 =?utf-8?B?UkRGTTdzVlM5ZE9uREI0WXFJdXlkdmZKTmtWS0RuS01QQ0Q1eHp1dXg1UjJQ?=
 =?utf-8?B?cUtNRDFiNVVEN2dIcGhza0cvSnBoekp2dDdPbW51Z0hXK2xJT2tUaWVPSnlu?=
 =?utf-8?B?aXo0WmJCOFcvNjR3MFk4WUtyK3FiVXQrbnN4RnJYeE9tL2lFRDZlbUhUdndT?=
 =?utf-8?B?QkFZYTdMa29vWEpEVkFrbU5aZkxWQ0NHc1V5VzEralVMM1AxR25lNjA1RC9I?=
 =?utf-8?B?YURMaS9SaXl6MTkxN2lBd3QrSElLa2poTnFpQmk3VlRiSThyTDFrRW9pRHp4?=
 =?utf-8?B?NU1iLzh1dWZRSEZJclhUb1VUUmpkQWxvWHlQQkVLZTBOSVZTWXA4WHM2SVBO?=
 =?utf-8?B?QnFOOEdSbWxRY1U0VHJES3lxbEVIclloME5JRUUwK3RwQWdqSTVUWWpVemxq?=
 =?utf-8?B?VlJwMTVFMGwyWUQxck9KU3lPNU9kTXhKcEVQeFRFUmp6TUljVkJESUVPRDdI?=
 =?utf-8?B?c2tJMlc2RVFDeWtnN2dPY2xwZ3FTNmE5QjZzaGZnR0cydmYzakozME16cWJw?=
 =?utf-8?B?M2U2YnBvbnVaVmpMUkxMdWd2OVZhNE5QQTBEcy9UREpIMGI4dkVpdDZEaFgy?=
 =?utf-8?B?SjRJVi9SaUs5LzF1c2tjQUI0aFgwNWh2N1RlbU8wSUo1dFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTg3OEhFWVpZcXBuMjVCM0EyT1JqK0tnMFRzc0pCcWJRTThmYXluTnZldVNo?=
 =?utf-8?B?N21TNnpNMXVFdWhETW1xUzN3ZUVCVWlCK3FLNWtxTldzVnlnMXlyN0xqVno2?=
 =?utf-8?B?ci8wMHkzUVlwTjNqSy9hRkYzN2lWcU5nbENpNC81VTYzT0NRMm92QW50bnMr?=
 =?utf-8?B?NmdrNmI2ZUsrZmgwRG1hektjUGNRZWQzbFBiM3VvbkRuL2JUZW5WaEJPK0Ex?=
 =?utf-8?B?Q2NBRkdyaHNyS2toVlZLZXBXbmNsbXhZTXBMRVBkZVRuOUhWUFB5OWt4RVN4?=
 =?utf-8?B?WExQeEkzeVJqd1J0VWpiQkt1SVNBd1NzRktjenFwRGVqU0czSXBzZGdHb2xW?=
 =?utf-8?B?WWR4WkdsOEQ0c2tPbldTRlo2M1ZpQllxT3hVR2JSektOR2VsU0lXQTR2VndP?=
 =?utf-8?B?bkF1S2dWc2ErNy9zZXNhaVBmL3JjYkU0RkNvRm9IRldVbW8vbTJpeG5DK3FG?=
 =?utf-8?B?M1lkdE9LSlhoaDhPYnArQmNoSE82YVlBK2NENm84Y3RnOVZFc3pOMUhOYnhK?=
 =?utf-8?B?ZW53RXNRbmV5Tmh4Vkd2WjZJZVhLVWM5UktFRmdQM0JpeEg4QjMvV3NtZ2tj?=
 =?utf-8?B?bU9rNDlOMVhydExwOUlkcDdMSU9GL2tEZkg1djA2UUVPNUlkTjJBT3UvTzF3?=
 =?utf-8?B?aS9PcEhLNnlFQVp0QlNWeWEvWmJVQjhCRTRLazU5Umd3UDRPTGpuTXYzeElt?=
 =?utf-8?B?ZmcyTzFiejEvb3htVGZFaUtPWmZXeG1rQWhlMlIwUlZtWGx6eWRsSlUvODRn?=
 =?utf-8?B?T00zd29FVzEyNm1ieTcxNmFvMGdwSlhOQkVEMlBBK3VUQ3FIZnFkdkJYNm9Z?=
 =?utf-8?B?ZnBPa3U0b1djaGhWWUVmOHBXYmkxcDBzRnFMbURtRW5lakNaQXFXZmJDMUg1?=
 =?utf-8?B?eksxT1VRQjQwQzYySDloekptbHh4YU5KNzFyc3ZkU3NCem85SjRqR0NKamVU?=
 =?utf-8?B?bGJmMUpNcmtZZHVzL3BNZ3U5b0tHMmR0YmtLNTlyaWRPSUZYTnpEc3pTN3hN?=
 =?utf-8?B?SXRZRzBpK0FxMkJLTk1RRnVuVjcySjBQMTBhcTQ0akVyNDV6SkF3YWQ2OHVR?=
 =?utf-8?B?S3pJUmFraUtOUExPcEFNT25HRjFnd2tSVTRQeVdxM2JBU1I4dHlIS1d3L2Vl?=
 =?utf-8?B?ZmRsQkRQSFZ6MmRoTFYwVlFiaWVVNXJOM3NaRW13em51WFRRN2FoMDZQenBu?=
 =?utf-8?B?dDI1S2xIY2RwaVV3bjNEbzZqRTNyWWkwaGF6c2haN05MMHJyUE9rUW8rTStF?=
 =?utf-8?B?Q3l6bmxNd2lxUGZGZVlUbFZ5ZlZya2NLSkhaWDFWTVdVVzR6c1U0QVl6YnRK?=
 =?utf-8?B?SEZUeFlzQlpIK3h1S3kwT01DVSt0TjJKL3o1cWRmVWxKS2I2ci9WY01Mb3hZ?=
 =?utf-8?B?VEtEZFFFSUpwZXFxam8weEY3U3E4K1FlYUJRTG9ZeGt4NjN0T3AwcmROVE85?=
 =?utf-8?B?dXp1MkptWU11OXJ3d0ZtS0c5RE1pWTl2K0tlOGlTWDRUeDA0eHlFc25Tb1g3?=
 =?utf-8?B?S1V5ZzIzbXZYUWR5WUVhVWI0bjZndXNOWVcwRDVETWdIUWRReFh2Yk9nK0NP?=
 =?utf-8?B?eFdhb2NNbi9SeU56RThCTnR1cTBZWTAyMGxWK1NXdUZvUDduYnFscDk3SWZu?=
 =?utf-8?B?OG5OQjN2dnRNbEx6OHIyYitjdnRTUVZobVNlRkE3dXp5b3lMY2JzaGNjS3Rl?=
 =?utf-8?B?a2k1bXF2NWhubnhMRFlRemZqdm1kR3FSVHJOdi9ZV0JIYVo2dWJQUnhucEZQ?=
 =?utf-8?B?ZVhYQUhmZ1NFamkxcXpOaDJnOEhzMzBOTHFJckQ2Y0N4QUM1MUpocVRUMGor?=
 =?utf-8?B?cDF5dTl0WGRvaEhyZHZUd29CZ2pxeWJybzczazkwK2VlNGl3WEpUU0E5UllW?=
 =?utf-8?B?V0ZBUUtzNjYvUWllZXhXZEczOU5NQ2VwVkQ3Y1ppNW1HQll3Wk5OUnd4TDZG?=
 =?utf-8?B?MkJDQVZuWmU1WUM0dGZRUVEyYnJNY1Y0K2VSaHBFQU9CZlh6b3RYQkZUM3Uv?=
 =?utf-8?B?SG5tdDlDdFhQb0lodjZscDhUR1ptZ1kvd0Q5dC9tTjY0S0ZBTHdCcS9kVUVa?=
 =?utf-8?B?ZzQxMWhCdGMyUGNrNHhUWDNwZGtUdHI2ZHVaZDZRWnhQc3I0cW9mMXdmemlo?=
 =?utf-8?B?ZmFQeE9MbURoWjlvbFAranM5bS9NckxDZDJiVmI5SDJJTW5sTzRSZ0NMcVBN?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f3c053-4d57-4df2-f94e-08dcd255ab79
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 11:34:17.0242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NNuNax4hxhpzpSUiYAPGoyVqNj053IlRBi/OTdfa6Z3SPwgCuqmWD3TatjtoRUOltJJePc5BY8c0kEkXYM9LSM+vF3pgIy0LWEvsYyMPprg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8504
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSm91bmkgSMO2Z2FuZGVy
DQpTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxMSwgMjAyNCAxMToyMCBBTQ0KVG86IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTmFsYWRhbGEsIFJhbWFuYWlkdSA8cmFtYW5h
aWR1Lm5hbGFkYWxhQGludGVsLmNvbT47IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIGktZy10IHYyIDMvNV0gdGVzdHMvaW50ZWwva21z
X2ZidDogQWRkIHBzcl9zaW5rX2Vycm9yX2NoZWNrIHRvIFBTUiB0ZXN0cw0KDQpDdXJyZW50bHkg
d2UgYXJlIGlnbm9yaW5nIHBvc3NpYmxlIGVycm9ycyBkZXRlY3RlZCBieSB0aGUgc2luayBpbiBv
dXIgdGVzdGNhc2VzIHVzaW5nIFBTUi4gRml4IHRoaXMgYnkgYWRkIHBzcl9zaW5rX2Vycm9yX2No
ZWNrIHRvIGVhY2ggb2YgdGhlbS4NCg0KU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxq
b3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQoNCkxHVE06DQpSZXZpZXdlZC1ieTogTW9oYW1tZWQg
VGhhc2xlZW0gPG1vaGFtbWVkLnRoYXNsZWVtQGludGVsLmNvbT4NCi0tLQ0KIHRlc3RzL2ludGVs
L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgNSArKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90ZXN0cy9pbnRl
bC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBiL3Rlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZl
cl90cmFja2luZy5jDQppbmRleCBlNDVkMTdkZDYuLjkxM2M3YjIzNCAxMDA2NDQNCi0tLSBhL3Rl
c3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jDQorKysgYi90ZXN0cy9pbnRlbC9r
bXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KQEAgLTI3MjIsMTAgKzI3MjIsMTEgQEAgc3RhdGlj
IHZvaWQgZG9fc3RhdHVzX2Fzc2VydGlvbnMoaW50IGZsYWdzKQ0KIAkJCQkJCSAgIHByaW1fbW9k
ZV9wYXJhbXMucGlwZSkpOw0KIAl9DQogDQotCWlmIChmbGFncyAmIEFTU0VSVF9QU1JfRU5BQkxF
RCkNCisJaWYgKGZsYWdzICYgQVNTRVJUX1BTUl9FTkFCTEVEKSB7DQogCQlpZ3RfYXNzZXJ0X2Yo
cHNyX3dhaXRfZW50cnkoZHJtLmRlYnVnZnMsIFBTUl9NT0RFXzEsIE5VTEwpLA0KIAkJCSAgICAg
IlBTUiBzdGlsbCBkaXNhYmxlZFxuIik7DQotCWVsc2UgaWYgKGZsYWdzICYgQVNTRVJUX1BTUl9E
SVNBQkxFRCkNCisJCXBzcl9zaW5rX2Vycm9yX2NoZWNrKGRybS5kZWJ1Z2ZzLCBQU1JfTU9ERV8x
LCBwcmltX21vZGVfcGFyYW1zLm91dHB1dCk7DQorCX0gZWxzZSBpZiAoZmxhZ3MgJiBBU1NFUlRf
UFNSX0RJU0FCTEVEKQ0KIAkJaWd0X2Fzc2VydF9mKHBzcl93YWl0X3VwZGF0ZShkcm0uZGVidWdm
cywgUFNSX01PREVfMSwgTlVMTCksDQogCQkJICAgICAiUFNSIHN0aWxsIGVuYWJsZWRcbiIpOw0K
IH0NCi0tDQoyLjM0LjENCg0K

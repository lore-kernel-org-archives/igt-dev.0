Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90ACC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7225410EC34;
	Fri, 14 Feb 2025 10:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rq1UVGkJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210B410EC36
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739528519; x=1771064519;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0/h91EvWLgZi0SkTm0YJY2C1xlXIrVr/DBpYCT6RpZU=;
 b=Rq1UVGkJtVQcT06TBtKXMxRQ803wt6ftmr4O+IKZCzOVSFXTEmaZDunN
 DEQm0fyhyMtAK+hAUXoWUJh/MzmuzPpFHVJGKmG1aUdqZGpSpgqVQCm65
 Z411Y6aaA90SKFhYjlKq0OBixNtXoCjQIr5IHXMXjeXzeK7VvZFIUVgNn
 qJeHijjIFtKFQgVDIYJlwq4Peo7uG+k6GCwVwXPsm9SHTdDO01Gw1zKCr
 yEAjYYnwU0C9hw0T2qTbdQ3+0LCivjIYkBHJbnGLEmdnr3hMHE6PboyI4
 9Y2MDxZYmr1OS5jzuwaaGBSeAKXNlPfFDWWXY6HH4UkyGlNVlpwuipRKV w==;
X-CSE-ConnectionGUID: /8imvE5ZSQ26Tglx6I8Epg==
X-CSE-MsgGUID: PP4Z0EWuSlSZVd+cyxLdFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40305380"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40305380"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:21:59 -0800
X-CSE-ConnectionGUID: b0BYB9CUTYyXdAGOfMSrww==
X-CSE-MsgGUID: HOXYuV1uRTuH4dFI0pAIOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144353588"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:21:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 02:21:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 02:21:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 02:21:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxIOqdyw9K9beT99hMwvOEUwkfJjXyqQQg4MJKOAyak0oFWwBiaKMb+FX3W2M6mFtvHzn92eFf/IfbAeNi07Pc6LHaB8SeA8sFOLqUjp+sgj/YVK4vL5cnI5ImPlW9IBaXS18VyM61HNI4rFaL90QvUJ6+/qMeY2pJJMmooQIoQSL4HQKqOe+IEQcPuz6nkR4F46vd7kTDQfh9ozilGBOFqJ1dQCJFGFw/9aBYl3MfLnQcrngFJb2KahSuSkAFNKVTDPSdih20HztlQnUknTF7mtJrYTL3eUj9/hHyUDq3bQy5l4UgRzpRrtZLBgBzmpKL7GIVWaNnhbUxQXxpzSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/h91EvWLgZi0SkTm0YJY2C1xlXIrVr/DBpYCT6RpZU=;
 b=loT+D3bGjF8zQjvnm8iuV5ToR14KxVZbpwfKUjTdXeV9uj0dTAS6So8SuKW0he6F0lvBxjN107RsEVw1U7NY8hYA6I2As2C+tv0rA9mEqfLS1QelylCtyjypGoXrDvMfNtTw/KViw37rZlIUTRd1fvyV36kNGGdVyfdqqJ8T8Wj/zmrx9TVvTPszHmjb2zZia1sfk0Fv5dxNkok76BPyyNc4KtNBvB9O+O26xRzd5vOXYY3VGIOdxM3NWs0NpORNUd38U4x5FgYea3buA8rWNzYGNqBeXFOpCqTuue81jfXWLPQa96TFy6v4zHj02HF9iNjwoq3n28WrZfvw4Xc10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DM4PR11MB5264.namprd11.prod.outlook.com (2603:10b6:5:38b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 10:21:35 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%6]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 10:21:34 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 1/3] tests/intel/i915_pipe_stress: Add XE support
Thread-Topic: [PATCH i-g-t 1/3] tests/intel/i915_pipe_stress: Add XE support
Thread-Index: AQHbfH+tZGjIOWNLSkKpIp9tMIEGirNGm0xg
Date: Fri, 14 Feb 2025 10:21:34 +0000
Message-ID: <IA1PR11MB6097D194D46CBF162EDC4DF886FE2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250211122743.329838-1-swati2.sharma@intel.com>
 <20250211122743.329838-2-swati2.sharma@intel.com>
In-Reply-To: <20250211122743.329838-2-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DM4PR11MB5264:EE_
x-ms-office365-filtering-correlation-id: 22b6c0a1-8552-4940-11fc-08dd4ce15bc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?OFBCZTBCOVVjcWpiczdRZFhJM045MXJzaTBnRHkzcFh2QlpocTlsREw2SCsr?=
 =?utf-8?B?MVJDUlZubWNtU1pZV2UxODRSS3lPSlhKTHpKSUh1dzQ3ZzByOHd5eDJZYzVh?=
 =?utf-8?B?OU1Qb09ITVIzWVM5dnZRRUNITjlqYk1idEdQY240RTFSTGhPZThhc0lKNGtD?=
 =?utf-8?B?QjJLOW1IK2hZYTVxbG5nbkc0UFhYbFVjVnFYZVpzQ1FYNlJ5MzYvcU05Qjgz?=
 =?utf-8?B?WjFGR3NqRDg0MXR1NmVHTFBlODhUZElPQjhTNlhQMGZZMXhnRzJzYnhXOE1T?=
 =?utf-8?B?WnpDcnJtWUJLeGxHMUhKNWZMUEhva2xQWWQ2ak5iN3RZdldLcHBiTDliSnFw?=
 =?utf-8?B?Y3FMNmVvayswbXNQRTJwem9rc3JXY2xKbGdGK2NJRU93dUJjZTF4eCtUNysw?=
 =?utf-8?B?TThkUEFBY1JzTXdBUG10ZnIvOXYrZG9JUnRRT1JOeFpMSkNvSFNmOHhRWUd4?=
 =?utf-8?B?WjVSUWxQajZLb2pLTkxxQ2E1VjhxVWdGV0N6WFFZZkhhY0hoNWVNeVltZ3I0?=
 =?utf-8?B?c2tOb1Y1cEJOeTJrUkJldERMTmJKalZwMDhseWNESVZLbkZWek9MemRtcldH?=
 =?utf-8?B?RlMrcUZuaS9weFNLRUJMUmErcnUyZjdxbUh2VEN6N1d4Si9KdGRreCtoeHVV?=
 =?utf-8?B?b01vQVdDTTVYTHhibGRWWWl2MmZwaEFpdkdzUUlyL1JBZ2dRbGdybXgxMDJi?=
 =?utf-8?B?V0hWZjdWeUN2T3dLMnFLazcvRzRqU0VwNXlQcHNONklkWFVzTVJkN2R5ZVpu?=
 =?utf-8?B?dkJ6QU10UGRCejNoUDRuOUhtMFg3dHM0cUlpWU92bDZwcEdBS1VEZFJGT05y?=
 =?utf-8?B?eUNRakJwODNhMnQ3bi85eDc3YVpTZ21HVjFTMFY4b3MxTnR1WDhOMXBITjB3?=
 =?utf-8?B?eHBGaTBramhBam1NdzVralRiY0dSbWtFRm5jRmNHdWcrK1VlQytMd0ZxSGM5?=
 =?utf-8?B?VDdlajRURHMyTEIrb2swcVNSWllFVldnMGJWZElFMXJ1V3BiV2JNTzAwR1BX?=
 =?utf-8?B?c0piSDBPU1JkQVhpT2ZQYjNaY2R0UGJFUjFmOFo5MTJqVzU4Y0xhVjZHdTFm?=
 =?utf-8?B?alpXcTFVeThraDRtNEo2a3hnZkMwZUlSSU1idlNxYjJGWUhSOHJkVGIyc25R?=
 =?utf-8?B?V0NZbVQxUVJqK0Z3M3pCRGdrakY0ODBYT2pNT1RYMUxuQ3dpeFo0UytCcjd3?=
 =?utf-8?B?cDJVMXhnS25SOXNsVWRLSENvclV4OEVSMnNOQU5jeFNEQ01GUDJsa0NqZTUr?=
 =?utf-8?B?KzQ5ZVl2MlM3Vjl1eVpqL0lUaGo3T2JCVUJ1aFBxZGpGeUNsVE5lU3orb3dJ?=
 =?utf-8?B?czF3amliR1N6WXZkYjF4dFZuc0VKTlZHWWgwb1NXZzZiK1RYbW04UVJ0dEg2?=
 =?utf-8?B?THBtS2o1N3pMd3FvUGNZdzB5bUtRRHJlZTd1T0c3R2ZoaG1NMWFzOE9wL2Zi?=
 =?utf-8?B?YWp1NnUwdkIzdU1BZ0h1bjg3R05Fb1M4cU85bjVuWktaVHd5eXJaTGZlMFVi?=
 =?utf-8?B?aUxYNUp2WnZTU29hTHUraS95YzN4TEY1WU5qR3FCZkVMSExFMG1HbjFHRGlO?=
 =?utf-8?B?OHdSb0NHUXFtZGZ6TGpVRStYUXZRTUtTWjdzZ1RlWEx1djZicUlMYjBNb293?=
 =?utf-8?B?dWFnWkFTNlNIcisrZEdVaENEbnJ1OEQvbzBWbG9STGVpeHhIQzN4N0RtWlo4?=
 =?utf-8?B?ZnRXMkFxLzVlaU1WOS9RYW05aDZ2bFBSdzFoaUNraGswZ2cyOVlMQ29xQVRu?=
 =?utf-8?B?QjJKL04vdkF3bmpaU2hDWVNYVHIzTEwrdzVrUThhR2hXMnBzNFU3OExnYXpi?=
 =?utf-8?B?Q3ZRVlU3TGJ1eG9UbmtBeHY0M3Zya2svV0EydDZhbDR1WUc4VUtpY0dHVnI3?=
 =?utf-8?B?RVQvQ3lNVENUY01uNG5hTFBJNFNINzdxbGU5WDJDYUxRcXd4dzZ0bks0YlJJ?=
 =?utf-8?Q?95dqf6dnOJ27+r2So2FJV8j9nnUWg6jj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXdYbWpJMEZSWGJuQTRwMGhqN09rNURFVXUzYW9JZktVTXJOSHJ2OStOL1Z6?=
 =?utf-8?B?aXduSWo5M2ZMbFFkMXo5NzZvbUVCNzg4U2I5YkZEOUp2RkF1QXFtZnlIbVNE?=
 =?utf-8?B?NUh5VXBEKzV0OVVqQzY4cWozTmxmZzNuOU9VTU1Zem04UU5VSURvRHVoVDVs?=
 =?utf-8?B?TWl4RmJKSlZGU0pQelh2U0lhMDV1WlJVcjlEaEtaZDg1SlAzWk5aek5oQ083?=
 =?utf-8?B?UG91RWxENlVIb1FtZUxTRG50bkNTVDZ0TnRlOVliQVRLeDJBT2U0TDBaYXNQ?=
 =?utf-8?B?Y2lkcnBaUXo4TEN2TndKU24wT0hYZjNhaDZnM25rTTJBMzZVaEhqS0hISi9k?=
 =?utf-8?B?VXl5aGl3UFdEMC9VSHIwbWF1NUQyaFdEYnI2Z25ZVzhNc2xYb0FMSExpWjFa?=
 =?utf-8?B?RFNvekU0emNYQkhnTUo2bWh0clRycVFuMG53M1lEcVIwd1huVEFYZVd5YkVK?=
 =?utf-8?B?WEtTVmpzblF5ZGpqYzJpdGMwVWVtRm9ha0pWem5CMVMzZHpxMkJIOE9MQk5w?=
 =?utf-8?B?Vzh2cFFZdVFlMlJsQUQ5ZWNVYTlXSm1ndXNTbm9hUXhFZ1MxLzZzMWN5TVhE?=
 =?utf-8?B?L1Z2ajR6c3RicVFjVFdCSXRDbytvamhURENFYzB5bndNTEM4K25EQ0JJeHBt?=
 =?utf-8?B?S3FEakd0cVExMG9mVUxZZ3Zsdk1aeU9YZ0VPL01xRW1ublh1bWNhK2JpK0NS?=
 =?utf-8?B?T1FobW1Hd2lxelNFQWczT0xxbG9MeXF1bW81bXZ1bjgwcVIrVlozSFB3eXNs?=
 =?utf-8?B?cEJGY2hzUUdveDBMblRvOVM3T0tFRHR4Qko4YTV1WGd3SG9BUWJMOXFoRExM?=
 =?utf-8?B?eW01cU5OY29xNGhGeWRzSEJHbG05Q0hjNEZNTFZSYkJWUjdocVlVOW42TE5T?=
 =?utf-8?B?UVJrSDdodk9CU3lLUHA0ZXlwWHB0aEVNYkJUQUlmblVjRXlad0V1aUtFSnVD?=
 =?utf-8?B?ZTdNM0tjYlAxZkZJeFhtc1hkZ2NueUQ2OXBmSk9lSG5vSWgwbW9FSHlKajFT?=
 =?utf-8?B?TThYZE05MW8zemhrUWptc2tKaStkM2J2RXd0SHovTytnWDZLenJXdEJoVEhK?=
 =?utf-8?B?WUYxTklxYXVqbUdUaWJPaCs2by9OMmhCdFh2a0ZkNmJtcVlobFJNeUNCN1k4?=
 =?utf-8?B?VGNpbTlaL3Z0cGVNSXpDRFlYamNZcEFJTkRlWXZqRGlsWmVUWUFFYlBOUXZ5?=
 =?utf-8?B?c2ZVTE5XZEN3cWNadEZvWDFTb3o2c2NwUUhNQURtSDNGZThYVTZieWVHZlJD?=
 =?utf-8?B?bjQ1amRzZitaRk5yUGQxK0V4S250T0p6MkdKOGp2bkRGL04xY0pya29lU0dm?=
 =?utf-8?B?aVFNNGpOQXc5b2xEZVNISWdDMDVhS1pOc2xzT2lBdDhOcGJmNHFVaXpXQ05K?=
 =?utf-8?B?aFNTamVqZVRrOWdmMDRSdTVHakRXU1NwLzgxMSswSWFLb0FKSFlDYVltdlFP?=
 =?utf-8?B?WVM0VlhEbm5yNEFSYk1PamtqRUZOV1FjYWgxVU00L3U1bWtrZEhpelpSMGpa?=
 =?utf-8?B?U1VwMmlkZnN0SGZlWXc4UXEralFLNGIvSUpkd0FnOG5EVEJtQktGWHBmdmZx?=
 =?utf-8?B?cVNLVmYvQ0tNUEkyUFhBeTJpQ2E3N0lrK2tPZDhCVEljUVIyaGI1S3NjUlA2?=
 =?utf-8?B?WHc2cnMxUlNLRDkrNXJxblBYSTI0YzB4UVZXTEJqMWwzTUxUUEs5VDRicjdI?=
 =?utf-8?B?WkRDNTdaUkVuY2szSnVNYkxuaUluQlZ1WnlvbXNEQnFDbjM5RDR4RDRWWmlD?=
 =?utf-8?B?WnYxc3gxQy9ESUVXb0Rjblh3T0Z0Q2FIaHJyYTZNeTlUOWhXc0xnM1VnZS9K?=
 =?utf-8?B?aGRpbjNqMUZ4N3NYL0pNUHZVVDFBb01FN3l1Y0RJNTl3VS9Xc1JTZTkxWTVY?=
 =?utf-8?B?dWJ2cUlWUmpYZ0F3bGxIZ08wbTEyZXpJaTZyOVJjT29OZ2RhSFZjTm1OSGJT?=
 =?utf-8?B?YUVjbUVjSUNCcHEyaWdkUzUxOGQvZ2lweFgvNDRMTEJicGh3ZHlJNU53Zlhk?=
 =?utf-8?B?OWU4UnhYWkc3Y1cwcEttM3U2N29yWFIzYlZDZDZoQ3BWWXVpaUhCR3dHdVdT?=
 =?utf-8?B?dW5aSzEyN3gxNCtOMXlFWUpmV016Z0VUQUhmS2RUQUpMYlRjTW9HMmlGUTgw?=
 =?utf-8?B?T1NOVmNBdUp5Z1hyZkx6c3hIa1hIRmR2QzNYVzhncXJGdERuN2JuNUlEUFl4?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b6c0a1-8552-4940-11fc-08dd4ce15bc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:21:34.6987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oD6TNs2npRdvkdDLgA7DND3KR6rGsChRLPD+zWVE24gGxKO+u8eekvoxFZFFHpnFYtknYMOPYOxIJqHakm3LAGwTqXZmcujkZjUm/3sEgVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5264
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
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgU3dhdGkgU2hhcm1hDQpT
ZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMSwgMjAyNSAxOjI4IFBNDQpUbzogaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRl
bC5jb20+OyBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVs
LmNvbT4NClN1YmplY3Q6IFtQQVRDSCBpLWctdCAxLzNdIHRlc3RzL2ludGVsL2k5MTVfcGlwZV9z
dHJlc3M6IEFkZCBYRSBzdXBwb3J0DQoNCkFkZCBYRSBkcml2ZXIgc3VwcG9ydCBmb3Iga21zIHRl
c3RzLiBUaGlzIHBhdGNoIHdpbGwgYWRkIGEgc3VwcG9ydCB0byBjYWxsIHRoZSBjb3JyZXNwb25k
aW5nIGFwaXMgYmFzZWQgb24gdGhlIGRyaXZlciAoaTkxNS94ZSkNCg0KU2lnbmVkLW9mZi1ieTog
U3dhdGkgU2hhcm1hIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4NClNpZ25lZC1vZmYtYnk6IFpi
aWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KLS0t
DQogdGVzdHMvaW50ZWwvaTkxNV9waXBlX3N0cmVzcy5jIHwgMTUgKysrKysrKysrKystLS0tDQog
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC9pOTE1X3BpcGVfc3RyZXNzLmMgYi90ZXN0cy9pbnRlbC9pOTE1
X3BpcGVfc3RyZXNzLmMgaW5kZXggMjAzZWI0NmEzLi43OGNmZmU3MDcgMTAwNjQ0DQotLS0gYS90
ZXN0cy9pbnRlbC9pOTE1X3BpcGVfc3RyZXNzLmMNCisrKyBiL3Rlc3RzL2ludGVsL2k5MTVfcGlw
ZV9zdHJlc3MuYw0KQEAgLTE4LDYgKzE4LDcgQEANCiAjaW5jbHVkZSA8cHRocmVhZC5oPg0KICNp
bmNsdWRlIDxzZW1hcGhvcmUuaD4NCiAjaW5jbHVkZSAiaTkxNS9nZW0uaCINCisjaW5jbHVkZSAi
eGUveGVfcXVlcnkuaCINCiAvKioNCiAgKiBURVNUOiBpOTE1IHBpcGUgc3RyZXNzDQogICogRGVz
Y3JpcHRpb246IFN0cmVzcyB0ZXN0IGhvdyBncHUgYW5kIGNwdSBiZWhhdmVzIGlmIG1heGltdW0g
YW1vdW50IG9mIEBAIC0yNDUsNiArMjQ2LDcgQEAgc3RhdGljIHZvaWQgKmdwdV9sb2FkKHZvaWQg
KnB0cikNCiAJaW50IGZyYW1lID0gMDsNCiAJaW50IHJlY3QgPSAwLCB0b3RhbF9yZWN0cyA9IDA7
DQogCWludCBwaXhlbHMgPSAwOw0KKwl1aW50MzJfdCByZWdpb247DQogDQogCW1vZGUgPSBkYXRh
LT5oaWdoZXN0X21vZGVbcGlwZV07DQogCWlmICghbW9kZSkNCkBAIC0yNTUsOSArMjU3LDEzIEBA
IHN0YXRpYyB2b2lkICpncHVfbG9hZCh2b2lkICpwdHIpDQogDQogCWlndF9pbmZvKCJHUFUgdGhy
ZWFkIHBpcGUgJWQgc3RhcnRcbiIsIHBpcGUpOw0KIA0KKwlpZiAoaXNfaTkxNV9kZXZpY2UoZGF0
YS0+ZHJtX2ZkKSkNCisJCXJlZ2lvbiA9IElOVEVMX01FTU9SWV9SRUdJT05fSUQoSTkxNV9TWVNU
RU1fTUVNT1JZLCAwKTsNCisJZWxzZQ0KKwkJcmVnaW9uID0gdnJhbV9pZl9wb3NzaWJsZShkYXRh
LT5kcm1fZmQsIDApOw0KKw0KIAljb250ZXh0LT5idWYgPSBjcmVhdGVfYnVmKGRhdGEsIGRhdGEt
PmhpZ2hlc3RfbW9kZVtwaXBlXS0+aGRpc3BsYXksDQotCQkJCSAgZGF0YS0+aGlnaGVzdF9tb2Rl
W3BpcGVdLT52ZGlzcGxheSwNCi0JCQkJICBJTlRFTF9NRU1PUllfUkVHSU9OX0lEKEk5MTVfU1lT
VEVNX01FTU9SWSwgMCkpOw0KKwkJCQkgIGRhdGEtPmhpZ2hlc3RfbW9kZVtwaXBlXS0+dmRpc3Bs
YXksIHJlZ2lvbik7DQogDQogCXdoaWxlIChkYXRhLT5ncHVfdGhyZWFkX3N0YXRlW3BpcGVdICE9
IFNUT1BQRUQpIHsNCiANCkBAIC04NDYsNyArODUyLDcgQEAgaWd0X21haW4gew0KIAl1aW50OF90
IGZvcm1hdF9pZHggPSAwLCB0aWxpbmdfaWR4ID0gMDsNCiANCiAJaWd0X2ZpeHR1cmUgew0KLQkJ
ZGF0YS5kcm1fZmQgPSBkYXRhLmRpc3BsYXkuZHJtX2ZkID0gZHJtX29wZW5fZHJpdmVyX21hc3Rl
cihEUklWRVJfSU5URUwpOw0KKwkJZGF0YS5kcm1fZmQgPSBkYXRhLmRpc3BsYXkuZHJtX2ZkID0g
DQorZHJtX29wZW5fZHJpdmVyX21hc3RlcihEUklWRVJfSU5URUwgfCBEUklWRVJfWEUpOw0KIA0K
IAkJa21zdGVzdF9zZXRfdnRfZ3JhcGhpY3NfbW9kZSgpOw0KIA0KQEAgLTg1NCw3ICs4NjAsOCBA
QCBpZ3RfbWFpbiB7DQogCQlpZ3RfcmVxdWlyZShkYXRhLmRpc3BsYXkuaXNfYXRvbWljKTsNCiAJ
CWlndF9kaXNwbGF5X3JlcXVpcmVfb3V0cHV0KCZkYXRhLmRpc3BsYXkpOw0KIAkJZGF0YS5kZXZp
ZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS5kcm1fZmQpOw0KLQkJaWd0X3JlcXVpcmVfZ2Vt
KGRhdGEuZHJtX2ZkKTsNCisJCWlmIChpc19pOTE1X2RldmljZShkYXRhLmRybV9mZCkpDQorCQkJ
aWd0X3JlcXVpcmVfZ2VtKGRhdGEuZHJtX2ZkKTsNCiAJfQ0KIA0KIAlmb3IgKGZvcm1hdF9pZHgg
PSAwOyBmb3JtYXRfaWR4IDwgTl9GT1JNQVRTOyBmb3JtYXRfaWR4KyspIHsNCg0KTEdUTSDwn5iK
DQpSZXZpZXdlZC1ieTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5waWVjaWVsc2th
QGludGVsLmNvbT4NCg0KLS0NCjIuMjUuMQ0KDQo=

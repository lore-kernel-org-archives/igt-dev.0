Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED4AC021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 06:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FDA10E30F;
	Mon, 17 Feb 2025 06:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RjFqFihy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17F510E30F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 06:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739772430; x=1771308430;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QnQsrI7+T22nEq8N0DzopWHhE210pS4JECk5JxF/rpU=;
 b=RjFqFihy9Ish31/FUQsVuhjdGc+ZDDchz5+oY4tR17GQP73m3KIVGL10
 i3eb4a1d5027LxMWTqMq3EBzaF29RPXznO7MSSfMAopiDWQkye1SNUNpC
 JeV37YjDY4GaEqcm+lbxKYr4/oogYnUzQNVUtBaki2ics2Mwm+Whr3Ktq
 4GkrycgzysqPBBeaeMi8M6zzlourvTkxgbA59RLRJEvla/n67EpJFDSDa
 w3/TddFV/BhDYXVEWom+ymyj8s5N44jx1oEzxN1rbCcZp9+jkeQ5t8jEu
 Pnfy2lkGTASr8120VzQfX3t/+O4AKVCtiD1/XvxjH5ZNU/E+5oKEJKZKg Q==;
X-CSE-ConnectionGUID: y1GcHZttRlO1gIZFfudamw==
X-CSE-MsgGUID: C4V65GDXT6uYRxBripM8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="43274485"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="43274485"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 22:07:09 -0800
X-CSE-ConnectionGUID: 5pWycM0nQTmVNZH0O1rzPQ==
X-CSE-MsgGUID: uup5ZLgnTTGlJpVbaXS9sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114512795"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2025 22:07:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 16 Feb 2025 22:06:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 22:06:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 22:06:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6nmP8bXEqaue1UD52plDD0ZYP3E8BRQG6BghM4U3J4n85HPyQr3UWDXUSSfbswnYz4eSIBFv4n+m4Eu2v8WpWQ5vmWkLG98LfUIF83qPTvtHSmH4jSLT9gGViqhchfhk+waKYzhrZu/aKWp/YGUuvz9rlOgYIHibc+Vp7HMurEySziKxxZrrhc/8UrCjNoIx9+wmUb20GzcIyqlN3mCdTVx7xEhLCJ+t7xqmxLLJruo5uOr9jNq/zn33G+sQW22+y2+/oM0s6hJByv7lIlghskDClEnmrN2pCEYmtYrL1qJe0TLxMOKeI8/KjJcuupiooN5K9MXN+6K73TtfnQ7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnQsrI7+T22nEq8N0DzopWHhE210pS4JECk5JxF/rpU=;
 b=VpzpkRNszw2P089CSF6b3AdkjmQ/U3f2e62mmkCvshKY+pGGNauWUeDjwSly0DLcUmu7jA0iWRq7A5iKabSRMzXahLDCXStYsBhNIQuIX5eFG2mqTtuUC1GfptyBuoIJr6xSlbCcd8sx2CIvoaoJ/XUE4NQouA37ODDXE3A/546jDznsbcKklh0AkaIRNKt1h0GvQMaboa9WLE4F9hx7VkHqaCIllYBgGP2/aVj0vYB8iLU6Rboq9M0gbDo8EhkDxEFnoK/rOcCEN09BMYwgdHPSsqXDnMlQAM0Tn+AqiJ/V2FW5g4Yax2hof2OQxc1GXU2js6jtzNvLoTggA9CzgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Mon, 17 Feb
 2025 06:06:53 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 06:06:53 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_exec_capture: Enhance test to check
 with DUMPABLE flag
Thread-Topic: [PATCH v3] tests/intel/xe_exec_capture: Enhance test to check
 with DUMPABLE flag
Thread-Index: AQHbfWYmh8VlRrGaTUqMaWEqJeaPjbNEM34AgAbUH2A=
Date: Mon, 17 Feb 2025 06:06:53 +0000
Message-ID: <BL1PR11MB5525AE999D5CBF1B4F0CE94E84FB2@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250212153252.790029-1-pravalika.gurram@intel.com>
 <09631161-7956-48ea-8936-f10def51d0ed@intel.com>
In-Reply-To: <09631161-7956-48ea-8936-f10def51d0ed@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-Mentions: zhanjun.dong@intel.com,Michal.Wajdeczko@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA2PR11MB4826:EE_
x-ms-office365-filtering-correlation-id: 88c7001f-574a-4612-d7ce-08dd4f1946ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dDRrZGMyWU5LVThzaUN1clBmK0ZGSmpqRWdselVycUFKYVdSZ0Q0RXlad3FD?=
 =?utf-8?B?VmZrT2YvQ25adWxxejhoMVJWWnVoWXhjRzVEZUJVNTFBamZkTzNaOHE3eUNu?=
 =?utf-8?B?Y3pjVkI0TkVoTDE3UStLNXpHbjVIcDZGTTJyTXBuT2wrOGprQTZvVDRUUWE0?=
 =?utf-8?B?S0JpamRlSG1aRk1LTERVSnZwT3BBZ1BSUG42R0lIR21LWjJPMkxRcVR0Z0dr?=
 =?utf-8?B?R3JrSlZuRktoYVI4aEpVM3BXbDJIcWY3Mmt6ZVIvOS9KZ0Y2dzVoNW9rYnZx?=
 =?utf-8?B?WHFMczdYUG9YUkxSQTd5WGhUeUxMTFBWcGdScy9BTGM0cFYrTWlNVTRRWGJY?=
 =?utf-8?B?TmdEZHR1citETEQ3clU1Q2R5UGNiOEV6YjBUUGVScUFqaDNEbEdJV2o5c0k4?=
 =?utf-8?B?clZUdzJmbTNJWFcrT1E0bXFnNUY0dnRWcGY5WlFJQnlQNTFoS0ZCKzVPcVVC?=
 =?utf-8?B?azhHYnJ6Q2xUcUZUcy9USUxZVmZtellwK3ZSejB5aUQ2R3BnR1FqZWFLbndi?=
 =?utf-8?B?dDBGUktlOUZ2OERUYWpMMlZKUUFId1JoT3h2VDBzWDhSTVE2OWFWRFE4VFIw?=
 =?utf-8?B?ektEZno1TXlhMVRMOGEvYWY2NzBXbm1uZVZXNUpMTlNsdDREVmdzb2JHdVND?=
 =?utf-8?B?QU1pWEhjek9lNEw2S0MvU2E1STF3OThMUGNCMkwrWTRHOEM3WWRkcXJIWkxa?=
 =?utf-8?B?dkorNEZEeHZhZzRFQWw3Wkc4QzVLM0VFZEFLK09KTnVGR1I0aG1mMkV3aExJ?=
 =?utf-8?B?Yk1mNlBVUjZaY1hYN2VDeGRHemFzYVJEV3ZRYXBTZzVWUDl5OFpEdjVuSm9m?=
 =?utf-8?B?bEtmRkh1bC9qclp0eFVjUmtYNjBvMmV4bGtiRStpSWpqaThLMnhrK3hBSFpS?=
 =?utf-8?B?VGpqeDB1UER3QVZwVDBSbWlyeUhsVjFpazFSQWNITDV2K2o4VVhUNi96cUNR?=
 =?utf-8?B?eVJSSE9rMXY3V01LZ2IxS2xhYnpUQ296Q0VCVGY0djA0UzVPV0kvUWkvMzBI?=
 =?utf-8?B?cEVTUU9ORnlGbkpJcGtKaUhvVGVSYUN4UEx1MTdNMlIzaEZFamMvbnVMenRS?=
 =?utf-8?B?Q1Y1MzdVRGJzdm9jcEl0UnAva2gzWmJjQnVnVSt6QXE5ZHY3QVpyNThFamFz?=
 =?utf-8?B?cDRlVVFRZGJSamxmUmlLQWo2TUV2UzB5YTFNMmQ4OTBFbFc0eTAvODFxQ3Bh?=
 =?utf-8?B?L1EvbmVMM2hRS2pUbkFZQitDcmJrRGQvbEs4bXlzSjdRUmJqdDIxL2VhN0pZ?=
 =?utf-8?B?MGhpY3pvVHA4R1V6UjlXbU5LekNtZm1TcjR6RjlJb0dYYkE0N1pZNVh0ZFFt?=
 =?utf-8?B?OW9NUHRFczlGajl6TjlrUUFweHZlcGlBWHRVN0ltU3hnTTJIdTl0V0Z3eWhk?=
 =?utf-8?B?b081eVFwbDRPSzkzQXJtSWVIWUFKaStGNnhycElXTG5KcWNFejUzakcrdXN5?=
 =?utf-8?B?cjB5Wjc3a1dDSjZSVkdtSjNCQ3pGbko3L2g0Y2VnbzhGWjNiTHNFZ2JvOUlK?=
 =?utf-8?B?aHNCWVIzcmNFSklzcnZMSTk5OXNodGoxQ2thUFZRellkWWVUY2FSekszd1lZ?=
 =?utf-8?B?QVRTSHlxWW1rWUgvUnBSRTVqL01LZC9MT2VuN2VGTnpvNDF0ZHFmN1RKZ0xt?=
 =?utf-8?B?U2hNYXZpa25OL0JUdk0vRWEycmQ1Q0owSlZRZ0VIOUxQNUd0cmpYZ01TSVc4?=
 =?utf-8?B?TXhGaHFHNTBldS9JazlvMmowK1VMRWtidFRsMG1FcTJvRHl5Mng2ZkErcTNs?=
 =?utf-8?B?UlNxZ3psU1NTOXBXYlgwTm5UNXlBdkdHQXZReDhWcVdRWDJnTk5JL1VJdjRZ?=
 =?utf-8?B?bzVMKzJmcEV1MFhSWUo1dnhWdndYVWxjelh2K2ZyZG54NXQ2dkhqMlRvaWsz?=
 =?utf-8?B?NEF4M1ZKQWd2cGJlWVJQTkZ3Y2dpK1JKRUZ5MS9Wb29oamZHWHltZXZSOCs4?=
 =?utf-8?Q?40N408AqBuOdiSz2e23Y9Dj8z1nMEn8y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0gyOE5DS0c0ZFpZTi9aSHgvdVcraXN6S1BlYlJwcHNGdWN6L1h0dUU4akxX?=
 =?utf-8?B?bmNyc28yWUwrbmd0UDYwOVFENWRDQWNKQVJvTkdlTkxKOXdkM25mbnBzSTRF?=
 =?utf-8?B?N0hpMW9mL0t5SzVLZ21KemNIZWdERGNmajhXOUUzZ29uNlhlTm5WUmIzSGU1?=
 =?utf-8?B?MUE1d0xDaFVhZ21IZXJOQXVBUm9DbVZoamVST3pTWTh6Nm9NZnNVcDA2VkxO?=
 =?utf-8?B?UlorMlVwZE5pdDBkbE9tUkw3Zmw0d0NVU29PeTJpZFkrWnNoVCtxbUNRdFJI?=
 =?utf-8?B?ZDlwVXRNazl5V01rRElxY1RYU0E0cUt6dXlKMkExazlzeS9GSkkvOXZScC9j?=
 =?utf-8?B?YVk1d2lLejhkWUdhaDBxRkpEYjZralVVb25OZEVveGc4V3dPeWREemp0cUhx?=
 =?utf-8?B?TzJRaERqN28vdEh0OFJwUzAwMVJieVlVM2pYdUxRaW15aFBoM0tzcUViT2po?=
 =?utf-8?B?cG80bzlaRUVXM1BrNDhOMW50VW1zeENTN0xsTU5NbTNrQnc1Tk9JZFdqQ0l1?=
 =?utf-8?B?b2tVU2dSQ1pydHo3RlhGYnJVZE9qNXFJNmZwR2tCMFE3TFR0V1JyemZrMUhZ?=
 =?utf-8?B?eE1DLzdGQU5BbnFCTWZ1S2xPcHRZUVVvS2o0NHdUZ3BBeEtQMlZKaklEYnJT?=
 =?utf-8?B?dnB5V2h0MlFZdDBhMGtodGFyRU0vVnJTcWFhVWN5eUdiaHNmOGQ1UTdPcUhH?=
 =?utf-8?B?aE8yeVpVU0xBSktnRTNqa0FXYThpUy8zOWNBTnYvOWdQZnZoTWN1Z2s2aElP?=
 =?utf-8?B?S1JtQ1J4ZnBsTE1tUzRtTHFCMWR1OGpFQWMvUFVQaGFxV2M4VmdTNG45MU1a?=
 =?utf-8?B?L3Bhd1pCQS9BNnBZN3dwQllqS055bDJUWk9qRFROb3FxQllDUTkyQjFkU3Jz?=
 =?utf-8?B?Z0E2M0RZeFQ2SmZWV0NhcTRlWGc2Sk9paWo1S09tUkJZT0M4Nm1nYTdlS2Zt?=
 =?utf-8?B?emNQTE5qZWhodHZEWjUwZUlMSTBnSlorenhmSW9ibHZZZlhUQXZER1dUSVZN?=
 =?utf-8?B?MmxRSTJ0Uk1tRjJJckFHUnpEdVJMaCs3em1ZSFFicU9uQUVSZzZ6Wk1vRVRl?=
 =?utf-8?B?V05PSWJqNTcrazZqNCs5WVgwLzlnMzhaS2VRYXhsR2ZSUUs3NnFLZGpvWHh6?=
 =?utf-8?B?TjNqUkpkT2pzUGxydE1zOElINmk1bkJWaUNhOXhzSk00UlFaampPenlocklH?=
 =?utf-8?B?L0FpSXBWb0dRUWJWR1dKZWRpR21jSXd1OUJUdGJTS2FMRGEvZytWRmpkYW9m?=
 =?utf-8?B?SWQ5bjVYMTNCVVR3Z1lmMFZOMXF1ZFUrdXlRL05EUUwyNi9GbEMvR1NFU0JC?=
 =?utf-8?B?ZVNNTHhRMG5LeWtOZlFvdjZEeHRLZjlTaUgvc1NLUysyRCtlVlR5V3dib201?=
 =?utf-8?B?bmpLcUhEK29Rb1RPZkRyTkJxelhGR3gzaVhha3hVVkREUHBtZVA4VFg0b0Vw?=
 =?utf-8?B?YWhaK2tFYUNLaVlTNDdPKzNjNU5JU1dDUjNoc09JTkd4Qzc5SDdxY29Fb2JD?=
 =?utf-8?B?V1VxY05ibEgrNDRFdmpDUHk1RDhReXg3SjBFemlxb3BidnY1b040VThyWkt0?=
 =?utf-8?B?RkdEbTBHaGFWK0Ridm9xSTRtUStOM3dqcUt6S1IrWUtvUWlBUys4Z25neWt0?=
 =?utf-8?B?c0RjQmU5VTVQN2lTV3pwN2VwZWJWbXlnbmJZSElPN1FPU0IrSHpaUXp2TWli?=
 =?utf-8?B?c1I3L1dsTUsxUXh6dzJGckczcFROc3BvU0xIQk1JaGZoNFZTYmhnMXZZempt?=
 =?utf-8?B?bkxKdzhyakJWNUdWTjNCNFdnODBUVk5RTUNvTUZ1UXhWVjFNV3BCYlV6TnRN?=
 =?utf-8?B?cWJZRW5UMEVld0kzOExzdmJHeTgva0l1enMzRzkrQnJscmZYTFZWUWJ5ZGVt?=
 =?utf-8?B?L2FMb1R2cUppM29Xem9vMkZiNFhRclZsZ3JEUWVhQmpHWW1lS3YvWEdWcnZY?=
 =?utf-8?B?VEVuaVRzSHpFbmlzWllsRnVaLzZGOHZ3NmNxOE51K0I5dGgxTjB0ODhKWnhz?=
 =?utf-8?B?S1N3RHd1Yk03UE9sQVI3d3l5WnhYUXpuN2ZNRWJDdWlDUi9yQytGRkFWQUp6?=
 =?utf-8?B?TWVuWWpXdjVscmNZZC9wYnJOVGNhMUZLcUNOUndQUXplTjJjRmQrNFpwWEdS?=
 =?utf-8?Q?ud+A6xZxIloX3ckT1wFsHmdcZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c7001f-574a-4612-d7ce-08dd4f1946ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 06:06:53.7142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQ+yoPJVsH5irwbwAU2NVL4myPchkqTIOnH55aWlDqtwv8128mRsfLhBIzVpd5iMZtOpLPX9Yt3BhylHVqkcs/aSCSREhTaB6QRFhEH78Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG9uZywgWmhhbmp1biA8
emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDEzLCAy
MDI1IDM6MTMgQU0NCj4gVG86IEd1cnJhbSwgUHJhdmFsaWthIDxwcmF2YWxpa2EuZ3VycmFtQGlu
dGVsLmNvbT47IGlndC0NCj4gZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYzXSB0ZXN0cy9pbnRlbC94ZV9leGVjX2NhcHR1cmU6IEVuaGFuY2UgdGVzdCB0
byBjaGVjayB3aXRoDQo+IERVTVBBQkxFIGZsYWcNCj4gDQo+IA0KPiANCj4gT24gMjAyNS0wMi0x
MiAxMDozMiBhLm0uLCBwcmF2YWxpa2EgZ3VycmFtIHdyb3RlOg0KPiA+IGNoZWNrIGlmIHRoZSBW
TSBpcyB0aGVyZSB3aGVuIERSTV9YRV9WTV9CSU5EX0ZMQUdfRFVNUEFCTEUgaXMgc2V0IGluDQo+
ID4gdGhlIGdlbmVyYXRlZCBkZXZjb3JlZHVtcC4gY2hlY2sgVk0gYWRkcmVzcyB3aXRoaW4gdGhl
IHJhbmdlLg0KPiA+IFZNIGFkZHJlc3MgaXMgbG9jYXRlZCBhZnRlciBFTkRfVEFHIGFuZCBpcyBh
dCB0aGUgZW5kIG9mIGR1bXAsIHRoYXQncw0KPiA+IHdoeSAic3RvcCBvbiBFTkRfVEFHIiBpcyBy
ZW1vdmVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogcHJhdmFsaWthIGd1cnJhbSA8cHJhdmFs
aWthLmd1cnJhbUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICB0ZXN0cy9pbnRlbC94ZV9leGVj
X2NhcHR1cmUuYyB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19jYXB0dXJlLmMNCj4gPiBiL3Rl
c3RzL2ludGVsL3hlX2V4ZWNfY2FwdHVyZS5jIGluZGV4IDU1ZWMzZDRiZC4uNGNjNTg5MjhlIDEw
MDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfY2FwdHVyZS5jDQo+ID4gKysrIGIv
dGVzdHMvaW50ZWwveGVfZXhlY19jYXB0dXJlLmMNCj4gPiBAQCAtNTMsMTYgKzUzLDE1IEBADQo+
ID4NCj4gPiAgICNkZWZpbmUgRFVNUF9QQVRIDQo+IAkiL3N5cy9jbGFzcy9kcm0vY2FyZCVkL2Rl
dmljZS9kZXZjb3JlZHVtcC9kYXRhIg0KPiA+ICAgI2RlZmluZSBTVEFSVF9UQUcJCQkiKioqKiBK
b2IgKioqKiINCj4gPiAtI2RlZmluZSBFTkRfVEFHCQkJCSIqKioqIFZNIHN0YXRlICoqKioiDQo+
ID4NCj4gPiAgIC8qIE9wdGlvbmFsIFNwYWNlICovDQo+ID4gLSNkZWZpbmUgU1BDX08JCQkJIlsg
XHRdKiINCj4gPiArI2RlZmluZSBTUENfTwkJCQkiWyBcdFxcLl0qIg0KPiA+ICAgLyogUmVxdWly
ZWQgU3BhY2UgKi8NCj4gPiAtI2RlZmluZSBTUEMJCQkJIlsgXHRdKyINCj4gPiArI2RlZmluZSBT
UEMJCQkJIlsgXHRcXC5dKyINCj4gPiAgIC8qIE9wdGlvbmFsIE5vbi1TcGFjZSAqLw0KPiA+IC0j
ZGVmaW5lIE5TUENfTwkJCQkiKFteIFx0XSopIg0KPiA+ICsjZGVmaW5lIE5TUENfTwkJCQkiKFte
IFx0XFwuXSopIg0KPiA+ICAgLyogUmVxdWlyZWQgTm9uLVNwYWNlICovDQo+ID4gLSNkZWZpbmUg
TlNQQwkJCQkiKFteIFx0XSspIg0KPiA+ICsjZGVmaW5lIE5TUEMJCQkJIihbXiBcdFxcLl0rKSIN
Cj4gPiAgICNkZWZpbmUgQkVHCQkJCSJeIiBTUENfTw0KPiA+ICAgI2RlZmluZSBSRVFfRklFTEQJ
CQlOU1BDIFNQQw0KPiA+ICAgI2RlZmluZSBSRVFfRklFTERfTEFTVAkJCU5TUEMgU1BDX08NCj4g
PiBAQCAtNzcsNiArNzYsOCBAQA0KPiA+ICAgI2RlZmluZSBJTkRFWF9FTkdJTkVfUEhZU0lDQUwJ
CTINCj4gPiAgICNkZWZpbmUgSU5ERVhfRU5HSU5FX05BTUUJCTENCj4gPiAgICNkZWZpbmUgSU5E
RVhfRU5HSU5FX0lOU1RBTkNFCQk0DQo+ID4gKyNkZWZpbmUgSU5ERVhfVk1fTEVOR1RICQkJMg0K
PiA+ICsjZGVmaW5lIElOREVYX1ZNX1NJWkUJCQkzDQo+ID4NCj4gPiAgIHN0YXRpYyB1NjQNCj4g
PiAgIHhlX3N5c2ZzX2dldF9qb2JfdGltZW91dF9tcyhpbnQgZmQsIHN0cnVjdA0KPiA+IGRybV94
ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSkgQEAgLTE3Nyw3ICsxNzgsOCBAQA0KPiB0ZXN0
X2xlZ2FjeV9tb2RlKGludCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2Ug
KmVjaSwgaW50DQo+IG5fZXhlY19xdQ0KPiA+ICAgCX07DQo+ID4NCj4gPiAgIAlzeW5jWzBdLmhh
bmRsZSA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKTsNCj4gPiAtCXhlX3ZtX2JpbmRfYXN5bmMoZmQs
IHZtLCAwLCBibywgMCwgYWRkciwgYm9fc2l6ZSwgc3luYywgMSk7DQo+ID4gKwlfX3hlX3ZtX2Jp
bmRfYXNzZXJ0KGZkLCB2bSwgMCwgYm8sIDAsIGFkZHIsIGJvX3NpemUsDQo+ID4gKwkJCQlEUk1f
WEVfVk1fQklORF9PUF9NQVAsIGZsYWdzLCBzeW5jLCAxLCAwLA0KPiAwKTsNCj4gPg0KPiA+ICAg
CWZvciAoaSA9IDA7IGkgPCBuX2V4ZWNzOyBpKyspIHsNCj4gPiAgIAkJdTY0IGJhc2VfYWRkciA9
IGFkZHI7DQo+ID4gQEAgLTI4NywxMCArMjg5LDYgQEAgc3RhdGljIGludCBsb2FkX2FsbChGSUxF
ICpmZCwgY2hhciAqKmxpbmVzLCBjaGFyDQo+ID4gKmJ1ZikNCj4gPg0KPiA+ICAgCQkvKiBPbmx5
IHNhdmUgdXAgdG8gTUFYX0xJTkVfTEVOIHRvIGJ1ZmZlciAqLw0KPiA+ICAgCQlzYWZlX3N0cm5j
cHkobGluZXNbaSsrXSwgYnVmLCBNQVhfTElORV9MRU4pOw0KPiA+IC0NCj4gPiAtCQkvKiBTdG9w
IG9uIEVORF9UQUcgKi8NCj4gPiAtCQlpZiAoIXN0cm5jbXAoRU5EX1RBRywgYnVmLCBzdHJsZW4o
RU5EX1RBRykpKQ0KPiA+IC0JCQlicmVhazsNCj4gPiAgIAl9DQo+ID4gICAJcmV0dXJuIHN0YXJ0
X2xpbmU7DQo+ID4gICB9DQo+ID4gQEAgLTM1MSw3ICszNDksNiBAQCBzdGF0aWMgY2hhcg0KPiA+
ICAgCQkJCXZhbHVlID0gJmxpbmVbbWF0Y2hbdGFyZ2V0X2luZGV4XS5ybV9zb107DQo+ID4gICAJ
CQkJbGluZVttYXRjaFt0YXJnZXRfaW5kZXhdLnJtX2VvXSA9ICdcMCc7DQo+ID4gICAJCQl9DQo+
ID4gLQ0KPiA+ICAgCQkJaWYgKGtleSAmJiB2YWx1ZSAmJiBzdHJjbXAodGFnLCBrZXkpID09IDAp
DQo+ID4gICAJCQkJcmV0dXJuIHZhbHVlOw0KPiA+ICAgCQkJLyogaWYga2V5ICE9IHRhZywgIGtl
ZXAgc2VhcmNoaW5nIGFuZCBsb29wIHRvIG5leHQgbGluZSAqLw0KPiBAQA0KPiA+IC0zNjEsMTYg
KzM1OCw0MyBAQCBzdGF0aWMgY2hhcg0KPiA+ICAgCXJldHVybiBOVUxMOw0KPiA+ICAgfQ0KPiA+
DQo+ID4gKy8qIGV4YW1wbGUgaS9wIDogWzE1ODAwMDFhMDAwMF0ubGVuZ3RoOiAweDEwMDAwICov
DQo+IFRoZSBjb21tZW50IHJpZ2h0IGFib3ZlIGEgZnVuY3Rpb24gaXMgdHlwaWNhbGx5IGZvciBm
dW5jdGlvbiBjb21tZW50cy4NCj4gRm9yIGEgc3RhdGljIGZ1bmN0aW9uLCBmdW5jdGlvbiBjb21t
ZW50IGlzIG9wdGlvbmFsLCBidXQgcHV0IGV4YW1wbGUgaGVyZQ0KPiB3aXRob3V0IGZ1bmN0aW9u
IGNvbW1lbnRzIGlzIG5vdCBhIGdvb2QgcHJhY3RpY2UuDQo+ID4gKw0KPiA+ICtzdGF0aWMgdWlu
dDY0X3QNCj4gPiArY29tcGFyZV9oZXhfdmFsdWUoY29uc3QgY2hhciAqb3V0cHV0KSB7DQo+ID4g
KwljaGFyIHJlc3VsdFs2NF07DQo+ID4gKwl1aW50NjRfdCByZXRfdmFsOw0KPiA+ICsJY2hhciAq
c3JjID0gKGNoYXIgKilvdXRwdXQsICpkc3QgPSByZXN1bHQ7DQo+ID4gKw0KPiBZb3UgbWlnaHQg
cHV0IGl0IGhlcmUuDQo+IA0KPiBXaXRoIHRoZSBjb21tZW50IGNvcnJlY3RlZDoNCj4gUmV2aWV3
ZWQtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gDQo+IEJ1dCBJ
IGhhdmUgcXVlc3Rpb24gYWJvdXQgdGhlIHRleHQgZm9ybWF0LCBmb3I6DQo+ICAgWzE1ODAwMDFh
MDAwMF0ubGVuZ3RoOiAweDEwMDAwDQo+IFF1ZXN0aW9uczoNCj4gMS4gQWJvdXQgWyBdDQo+ICAg
ICBIb3cgbWFueSB2YWx1ZXMgaW5zaWRlIFsgXT8gRnJvbSB5b3VyIGltcGxlbWVudGF0aW9uLCBp
dCBsb29rcyBsaWtlIGEgc2luZ2xlDQo+IHZhbHVlLCB0aGVuIHdoeSBwdXQgdGhlIHNpbmdsZSB2
YWx1ZSBpbnNpZGUgWyBdPw0KPiAyLiBBYm91dCAiLiINCj4gICAgIFJpZ2h0IG5vdywgd2UgZG9u
J3QgaGF2ZSBhbnkgZmxvYXQgdmFsdWVzLCBidXQgaWYgaW4gdGhlIGZ1dHVyZSB3ZSBoYXZlIGl0
LCAiLiIgaXMNCj4gbm8gbG9uZ2VyIGEgZGVsaW1pdGVyLg0KPiANCj4gU28gdGhlIHRleHQgZm9y
bWF0IGNvdWxkIGJlY29tZXM6DQo+IA0KPiBCbG9jayhvciB3aGF0ZXZlciBuYW1lKSBhZGRyZXNz
OiAweDE1ODAwMDFhMDAwMCBsZW5ndGg6IDB4MTAwMDANCj4gDQo+IHdoaWNoIG1pZ2h0IGJlIG1v
cmUgZWFzeSB0byByZWFkLg0KPiANCj4gSSBrbm93IHRoaXMgaXMgb3V0IG9mIHNjb3BlIG9mIHRo
aXMgcmV2aWV3LCBidXQgSSB3YW50IHRvIHJhaXNlIHRoZSBjb25jZXJuIGFuZCBpZg0KPiB3ZSBk
b24ndCBoYXZlIG11Y2ggdG9vbCBpcyBwcm9jZXNzaW5nIHRoaXMsIHdlIGFyZSBhYmxlIHRvIGNo
YW5nZSBpdC4NCj4gDQo+IFJlZ2FyZHMNCj4gWmhhbmp1biBEb25nDQo+IA0KDQpARG9uZywgWmhh
bmp1biBUaGlzIGNhbiBiZSB0YWtlbiBpbiBhIHNlcGFyYXRlIHRhc2sgb25jZSBAV2FqZGVjemtv
LCBNaWNoYWwgYWdyZWUuIFdpbGwgcmFpc2UgYW5vdGhlciBKSVJBDQpJIHdpbGwgZ28gYWhlYWQg
d2l0aCB0aGUgY3VycmVudCBjaGFuZ2UgdG8gY2xvc2UgdGhlIGN1cnJlbnQgSklSQS4NCg0KRllJ
IEBXYWpkZWN6a28sIE1pY2hhbA0KDQpXaGVuIEkgaGF2ZSB0YWtlbiB0aGUgZGV2Y29yZWR1bXAg
dm0gYWRkcmVzcyAgaXMgcHJpbnRlZCBpbiBmb2xsb3dpbmcgZm9ybWF0ICJbMTU4MDAwMWEwMDAw
XS5sZW5ndGg6IDB4MTAwMDAiDQpJcyBpdCBwb3NzaWJsZSB0byBjaGFuZ2UgdGhlIGZvcm1hdCB0
byAiIEJsb2NrKG9yIHdoYXRldmVyIG5hbWUpIGFkZHJlc3M6IDB4MTU4MDAwMWEwMDAwIGxlbmd0
aDogMHgxMDAwMCINCg0Kdm9pZCB4ZV92bV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfdm1fc25h
cHNob3QgKnNuYXAsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCkNCnsNCiAgICAgICAgdW5zaWduZWQg
bG9uZyBpLCBqOw0KIA0KICAgICAgICBpZiAoSVNfRVJSX09SX05VTEwoc25hcCkpIHsNCiAgICAg
ICAgICAgICAgICBkcm1fcHJpbnRmKHAsICJbMF0uZXJyb3I6ICVsaVxuIiwgUFRSX0VSUihzbmFw
KSk7DQogICAgICAgICAgICAgICAgcmV0dXJuOw0KICAgICAgICB9DQogDQogICAgICAgIGZvciAo
aSA9IDA7IGkgPCBzbmFwLT5udW1fc25hcHM7IGkrKykgew0KICAgICAgICAgICAgICAgIGRybV9w
cmludGYocCwgIlslbGx4XS5sZW5ndGg6IDB4JWx4XG4iLCBzbmFwLT5zbmFwW2ldLm9mcywgc25h
cC0+c25hcFtpXS5sZW4pOw0KDQoNCj4gPiArCXdoaWxlICgqc3JjKSB7DQo+ID4gKwkJaWYgKCpz
cmMgPT0gJ1snIHx8ICpzcmMgPT0gJ10nKSB7DQo+ID4gKwkJCXNyYysrOw0KPiA+ICsJCQljb250
aW51ZTsNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICsJCSpkc3QgPSB0b3VwcGVyKCh1bnNpZ25lZCBj
aGFyKSpzcmMpOw0KPiA+ICsJCWRzdCsrOw0KPiA+ICsJCXNyYysrOw0KPiA+ICsJfQ0KPiA+ICsJ
KmRzdCA9ICdcMCc7DQo+ID4gKwlyZXRfdmFsID0gc3RydG91bGwocmVzdWx0LCBOVUxMLCAxNik7
DQo+ID4gKwlyZXR1cm4gcmV0X3ZhbDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyB2b2lk
DQo+ID4gLWNoZWNrX2l0ZW1fdTY0KHJlZ2V4X3QgKnJlZ2V4LCBjaGFyICoqbGluZXMsIGNvbnN0
IGNoYXIgKnRhZywgdTY0DQo+ID4gYWRkcl9sbywgdTY0IGFkZHJfaGkpDQo+ID4gK2NoZWNrX2l0
ZW1fdTY0KHJlZ2V4X3QgKnJlZ2V4LCBjaGFyICoqbGluZXMsIGNvbnN0IGNoYXIgKnRhZywgdTY0
IGFkZHJfbG8sDQo+ID4gKwkgICAgICB1NjQgYWRkcl9oaSwgaW50IHRhZ19pbmRleCwgaW50IHRh
cmdldF9pbmRleCkNCj4gPiAgIHsNCj4gPiAgIAl1NjQgcmVzdWx0Ow0KPiA+ICAgCWNoYXIgKm91
dHB1dDsNCj4gPg0KPiA+IC0JaWd0X2Fzc2VydF9mKChvdXRwdXQgPSBnZXRfY29yZWR1bXBfaXRl
bShyZWdleCwgbGluZXMsIHRhZywNCj4gSU5ERVhfS0VZLCBJTkRFWF9WQUxVRSkpLA0KPiA+ICsJ
aWd0X2Fzc2VydF9mKChvdXRwdXQgPSBnZXRfY29yZWR1bXBfaXRlbShyZWdleCwgbGluZXMsIHRh
ZywNCj4gPiArdGFnX2luZGV4LCB0YXJnZXRfaW5kZXgpKSwNCj4gPiAgIAkJICAgICAiVGFyZ2V0
IG5vdCBmb3VuZDolc1xuIiwgdGFnKTsNCj4gPiAtCXJlc3VsdCA9IHN0cnRvdWwob3V0cHV0LCBO
VUxMLCAxNik7DQo+ID4gLQlpZ3RfZGVidWcoIkNvbXBhcmUgJXMgJXMgdnMgWzB4JWxYLTB4JWxY
XVxuIiwgdGFnLCBvdXRwdXQsIGFkZHJfbG8sDQo+IGFkZHJfaGkpOw0KPiA+ICsNCj4gPiArCXJl
c3VsdCA9IGNvbXBhcmVfaGV4X3ZhbHVlKG91dHB1dCk7DQo+ID4gKwlpZ3RfZGVidWcoIkNvbXBh
cmUgJXMgJXMgdnMgWzB4JWxYLTB4JWxYXSByZXN1bHQgJWxYXG4iLCB0YWcsIG91dHB1dCwNCj4g
PiArCQlhZGRyX2xvLCBhZGRyX2hpLCByZXN1bHQpOw0KPiA+ICAgCWlndF9hc3NlcnRfZigoYWRk
cl9sbyA8PSByZXN1bHQpICYmIChyZXN1bHQgPD0gYWRkcl9oaSksDQo+ID4gICAJCSAgICAgInZh
bHVlICVsWCBvdXQgb2YgcmFuZ2VbMHglbFgtMHglbFhdXG4iLCByZXN1bHQsIGFkZHJfbG8sDQo+
IGFkZHJfaGkpOw0KPiA+ICAgfQ0KPiA+IEBAIC00MzUsNyArNDU5LDcgQEAgc3RhdGljIHZvaWQg
dGVzdF9jYXJkKGludCBmZCkNCj4gPiAgIAkJaWd0X2RlYnVnKCJSdW5uaW5nIG9uIGVuZ2luZSBj
bGFzczogJXggaW5zdGFuY2U6ICV4XG4iLCBod2UtDQo+ID5lbmdpbmVfY2xhc3MsDQo+ID4gICAJ
CQkgIGh3ZS0+ZW5naW5lX2luc3RhbmNlKTsNCj4gPg0KPiA+IC0JCXRlc3RfbGVnYWN5X21vZGUo
ZmQsIGh3ZSwgMSwgMSwgMCwgYWRkcik7DQo+ID4gKwkJdGVzdF9sZWdhY3lfbW9kZShmZCwgaHdl
LCAxLCAxLA0KPiBEUk1fWEVfVk1fQklORF9GTEFHX0RVTVBBQkxFLA0KPiA+ICthZGRyKTsNCj4g
PiAgIAkJLyogV2FpdCAxIHNlYyBmb3IgZGV2Y29yZWR1bXAgY29tcGxldGUgKi8NCj4gPiAgIAkJ
c2xlZXAoMSk7DQo+ID4NCj4gPiBAQCAtNDUxLDEwICs0NzUsMTMgQEAgc3RhdGljIHZvaWQgdGVz
dF9jYXJkKGludCBmZCkNCj4gPg0KPiA+ICAgCQljaGVja19pdGVtX3N0cigmcmVnZXgsIGxpbmVz
LCAiQ2FwdHVyZV9zb3VyY2U6IiwgSU5ERVhfS0VZLA0KPiBJTkRFWF9WQUxVRSwNCj4gPiAgIAkJ
CSAgICAgICAiR3VDIiwgZmFsc2UpOw0KPiA+ICsNCj4gPiAgIAkJY2hlY2tfaXRlbV91NjQoJnJl
Z2V4LCBsaW5lcywgIkFDVEhEOiIsIGFkZHIsDQo+ID4gLQkJCSAgICAgICBhZGRyICsgQkFUQ0hf
RFdfQ09VTlQgKiBzaXplb2YodTMyKSk7DQo+ID4gKwkJCSAgICAgICBhZGRyICsgQkFUQ0hfRFdf
Q09VTlQgKiBzaXplb2YodTMyKSwNCj4gSU5ERVhfS0VZLA0KPiA+ICtJTkRFWF9WQUxVRSk7DQo+
ID4gICAJCWNoZWNrX2l0ZW1fdTY0KCZyZWdleCwgbGluZXMsICJSSU5HX0JCQUREUjoiLCBhZGRy
LA0KPiA+IC0JCQkgICAgICAgYWRkciArIEJBVENIX0RXX0NPVU5UICogc2l6ZW9mKHUzMikpOw0K
PiA+ICsJCQkgICAgICAgYWRkciArIEJBVENIX0RXX0NPVU5UICogc2l6ZW9mKHUzMiksDQo+IElO
REVYX0tFWSwgSU5ERVhfVkFMVUUpOw0KPiA+ICsJCWNoZWNrX2l0ZW1fdTY0KCZyZWdleCwgbGlu
ZXMsICJsZW5ndGg6IiwgYWRkciwNCj4gPiArCQkJICAgICAgIGFkZHIgKyBCQVRDSF9EV19DT1VO
VCAqIHNpemVvZih1MzIpLA0KPiBJTkRFWF9WQUxVRSwNCj4gPiArSU5ERVhfS0VZKTsNCj4gPg0K
PiA+ICAgCQkvKiBjbGVhciBkZXZjb3JlZHVtcCAqLw0KPiA+ICAgCQlybV9kZXZjb3JlZHVtcChw
YXRoKTsNCg0K

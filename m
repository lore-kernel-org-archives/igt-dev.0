Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED4DC35FFF
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 11:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF60710E059;
	Tue, 17 Sep 2024 11:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axVptXdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4048C10E059
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 11:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574350; x=1758110350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BOD/AGygz+avEy0wcYDA2xUYt6AqkVd863QgwAYCKgA=;
 b=axVptXdCHLP4f6/TAJqCuATrV/QUuYZcw1tUbAJkJu6scxlc8nQv9Xpp
 cUVQ4pfMTxhG6mR2JlFYhojlqHEcSNaon99cNzSnAbyYvvLAptu8E7k/8
 d1TVO7Qrvc90JjhxQCB2MfXbRfr44IAJLYKteMPuhkDbNKbmw8DETmKCg
 tbHqd6gMJm5iInXj7oPRB9l9dggLqiiMkcl/wvm9MWHzRWlmA6EkvsioS
 BUp3UXQVYc7dizR+wrqbLgbG5cdflWTvOoO/QYdmHwc5eBiefjvF0Yh7o
 MnoSNZW7wf8GQhUoKjSMEtVdbUELt4cXyQgQkjoDPCjZrCoxYo6i1Pb0n Q==;
X-CSE-ConnectionGUID: lsT+TWSRQIKYUP9uzxY6cg==
X-CSE-MsgGUID: OODCw0yaSv2KX4IrS0RBaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="50836432"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="50836432"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 04:59:09 -0700
X-CSE-ConnectionGUID: 9FpXgUZfQnKLsm3Eb9X6Zg==
X-CSE-MsgGUID: iYB4wWBEQTi4mTv+yziR2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="73925271"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 04:59:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 04:59:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 04:59:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 04:59:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TydFOXurx2IxvsDe/CuyoYFM6bLvX5gyMMa4TY8R0CrIYnnU4HR6GSGnU+oazJMQnpQsx1W49HWRcvO5WV/XBo2MY80jtNosUsNDEM8kiA7RSQl3mOFd4dX2Xy3ijdhG2btU4Q2bgZ8L7hdXzwns7ZbhmwBxqmPyJbY5cL8OrTAUAJAmIjCG4srVdHXf7vPes75A4zYRyBu7CdMSkIuwL8ogPM4p3y/r+DR/iGoOStI2wfO0rjZnw3zKjcrQm0fnvijKk/mNYOv4JS/1k1Pl6+g+kSjslr7C1P+mc6H24Rtjp0UF/wiSZnpPipz1qNH0iPy4YhFYhZxPyRIM5ovE4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOD/AGygz+avEy0wcYDA2xUYt6AqkVd863QgwAYCKgA=;
 b=EZ1LxothkAmYbTUJNXDfE7U6S9iBJluYZb9QaY9KiRqyOBsiA7dRbxAe2xlAwBMEDC9/7voO4isGO2isWZyQYduD7pobvEF7870AYORhli8YOhtCOjabUMRAxQqxAlQVzW95KnhymtdkT6+2VaJcR2nDNhViSsP8hFGhDZU4oarvVuxsl+E+cFHkjAbebQQ02Ndv9Rp3/066e/FfaFVTXs9oxIbS4EB+a9BuhZZRp1cOU5WZWe+f9Ou5dxw/TnbKbK2itNRbmvQHsrEDWfDWEx/tw0ItMVl09KqVxIkZfhkqMHWs4/2wi2tdjuE9EeNJsQ8xhij0ORlc3tbIbBwHeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 11:59:06 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 11:59:06 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v2 0/5] PSR testing improvement by checking sink
 status
Thread-Topic: [PATCH i-g-t v2 0/5] PSR testing improvement by checking sink
 status
Thread-Index: AQHbBA6LDYsxMQoSn0CWGa0YWLSRErJb6d+A
Date: Tue, 17 Sep 2024 11:59:06 +0000
Message-ID: <38979b41ccf6bb8fb24ae7d2fdfca250f2b982a4.camel@intel.com>
References: <20240911054958.1023925-1-jouni.hogander@intel.com>
In-Reply-To: <20240911054958.1023925-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB7002:EE_
x-ms-office365-filtering-correlation-id: f595a579-d915-4a3e-71b3-08dcd71021dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NlgrYjJLeERJK0NqWVA0MEZiaklVejNXK3dJR1VvT1NlcGMvM3BBQ1JXSG9y?=
 =?utf-8?B?d2dVbGxzOTREK1cyTGlqL3E4TlVZa05GWFpoZTNkaUtPbW8yTWZCV2xFaXVC?=
 =?utf-8?B?S1h5MmtmQi9kZlFVa3dJelgzdEw5NG5MYXhhV0hnV1RJOFhJWkVKeXRncVRS?=
 =?utf-8?B?ZDVZN1VlaVF5cEhSdlJ3U2tuaEhQblZGRlV0UHVvVkI5bFF0NU9yQzJNcGpC?=
 =?utf-8?B?SHdVZXBIak1yZHZ2WGlQcUhZSzhYc1NpQWZUMHlwZVdURmdCcGdpUWp4c0Fw?=
 =?utf-8?B?djl1ZmJON2R5VmxuQnlZK2ljbWR3UjhubWQrMFIxOGVybllhdzNMbW1sZWRv?=
 =?utf-8?B?V2w1bUVsR3hERSs1dkZ5UU5UWmdaM3VxK1pya1FPRnJJTloxakJVKzNHMzhP?=
 =?utf-8?B?Mmk5dlJQYmw1dnlDaUxNNENueVVoZU1NNlA0NnN0NXhjbjVxQ05MUXR5YjY2?=
 =?utf-8?B?K2hqNFNTaFExNmlOeUwxR2cvUmVYek5DWHpBZkhLd011SCtmR29wSXNmM1E2?=
 =?utf-8?B?NFFYRHhLdlJKOWM1dm5QVS9wem9mMXEyakNGN0lkd1plbG5qc3dBYno3Um5a?=
 =?utf-8?B?ZGg0TWVCTnl1OHVFcC9nQ2RjTDNyNThUMzNuSS9wZDJTcVl0cFlla25qd29x?=
 =?utf-8?B?cUMvOGtVRnpkVnlqUTQ3dHZydjBVTHN6NWJOeTdpZmRLNGFrUGwreHhmcG45?=
 =?utf-8?B?L2dwQkpsaDhrRWM0MklDRjY4dXdJdG1OVHBGeUN0d3JDQno5OW90RFF2ZkJC?=
 =?utf-8?B?NjRWR3V4L0d4SWdKNHhQa1crTG10dmJqb3hyN29PdVFZZlErVk1tb3FLVTBz?=
 =?utf-8?B?VURNU2hOMWV3RnBLd2c3Y0Fla3lSWHdoYklzS2JCMEEwRzJuOThVd24zbE1x?=
 =?utf-8?B?Q3J1NVp2bnJzZE80V0txWU9uYUJ2dzF0N2lOUnZOaDFaY3dCQUZ3M2hRajdB?=
 =?utf-8?B?ejVxcVFZZVQ1bFNvTzhTNytWMGVVREs3NG1vSmg2YWJrSjFMZ3BQVHF5M0VT?=
 =?utf-8?B?ZVNHcTRDQ3VGM1dsUms1ZmVjb05aUFpETzI4WEpqYmdLRjZvTy9rcWd1UFpo?=
 =?utf-8?B?S1dVc3NudWN2VWpIRVJEWnJ2MHRXaFVmTXdYbHlERmFLb1VXdHZQNnZ3c1FH?=
 =?utf-8?B?MWg4a3ZIR2lpOFM0aG9XeFRSbHJPSHMvYnFGTTlKSVh5SWpnQ0poQnVTRUNs?=
 =?utf-8?B?OWV2cGJRdHlwb3ZVMytmSTVVT1JYbzRXZDBSV0VEMWM1eUhXNk55eGVJMGFG?=
 =?utf-8?B?OXFUcVdsbHpicGRONUNZVDFTRTMrVFJFaVkxaXRZNG0zVFYwd2Z5VmlmbTBk?=
 =?utf-8?B?ZUlXRTBXVVlCQitXRDFWNWU2b1JGdmNkQTduQWZIN2JGdzFISEFmQ1Rybm9l?=
 =?utf-8?B?MmpYc3ZWbTZlQ0lsOHRRdzBOSVZ2Zi9FdytUQWg2cHNJcmRBL1Rmb0lQUzhO?=
 =?utf-8?B?SFRtektkRm42WkpGSEhRRjY1Y1JpQTBSRjUwZjBJZytYT0dUWXBRV1JMR0hp?=
 =?utf-8?B?Ti92clhCTFFRNEhVUWhaT3ZjTWxGL1A4MmorUlV2bk01czcvc1QydjRiTjUz?=
 =?utf-8?B?cllaN090MlMrS0tYRUFxUEFBZjNQZzZ3QTRkQTRMUzdsaGw3cmhmZTVtQ3dP?=
 =?utf-8?B?NkJZRlNOT3IzcU00bTZJYTV1K2V4ZFQzek9yenNKY3BsOGlsSVpDZlIwWHNl?=
 =?utf-8?B?ZWxGdDFBeFNMd1RLbkxuVm9jK25pWThLMEh3MldGWXh6WFlLZDRGUnZNcEp5?=
 =?utf-8?B?eExHZXVLbit1SEQyRXkxSXhVazdZNXRIK0FBQmdkN3NMa2QyR1hRM3dxWHpB?=
 =?utf-8?B?bHJiL0JMVWlPVlBST0ZFcE8zQU1LSkdRL3RIS2ZPenJucmZ4MFJuMlovU2FE?=
 =?utf-8?B?bmlFa0wranp4Unk1dThIV0dCcW93eWRGU1NOTG1qQUw0bUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OW9hVDh0cXFId3VHOFlpODhYMUxMT3FqUzhUa0U1MDFOODBMZDBldnI5cmZI?=
 =?utf-8?B?WWxXS0dtRm92R2NsMXYwWVBQMDFPaG1XMFFpVlpXYk9LcG1PTGp4bGFYc2E0?=
 =?utf-8?B?cXFnemNMVG9CNGtOVmR6SEhDdWNidFBiRnpodnhwYWR5WUNrMWQ2OTdTcDBv?=
 =?utf-8?B?aU8zdHpCOGlrRkpONGcvNURuWDVzYzk1cFBhOUdxR25ZNC9IcHB2TDg5S3I5?=
 =?utf-8?B?cE0zVE0yN25pTjhZZW1MVUtYbnRmUGh0eW9jQU1rY0pucGdwWllTWVM3VVgr?=
 =?utf-8?B?a042S3o2dWRCZUh0enVmdUNvV2t5a3hvTUhQQTFrOEVDb1dHajFyM3BTVUNj?=
 =?utf-8?B?dU1hRXBRL09pTEErbW5IZWx3Qm14WFZ4VzFScFd3MlFiWUhmN0JnakVWS2ZJ?=
 =?utf-8?B?bzRaYXp5dTkxSlhRU2s2NHRjT2V3M2piclljQkpnRDl3UElCc2tkRXlvT1FR?=
 =?utf-8?B?SWJzVHhzaDU1dFU0aSs4TElSV2kraVFFL2UybTArNXNpc05CYmdJM2VCM3Rw?=
 =?utf-8?B?WjlGSGpCUkovYmEwVU0rWFZaaUlUd2d4Y2pDUWFxU1JWY2Z3ZEUvVCtCSlZ6?=
 =?utf-8?B?M0hqRm5vZ1NLbmlITTZQdnp3SjdTdUwvbCs5WndNUW4vbGFKcm9jM2NnZGJ6?=
 =?utf-8?B?SEhoVnRXRTh4Z0syVy8xcXlUcElGUjMzMlI3L25pbFRueEVvcXJzakVaR1o3?=
 =?utf-8?B?MGZ6Vzd2eHFMbzlzMWJac3hLVTg3Y3daeERyVURkWGlxa3RJa2JNYm56Q2Nl?=
 =?utf-8?B?RDVwZUV2QWtNRUE1Rk00ampTVGl2ZjY4UE40ZVhNV2thenh4NEdvYzhvVEVn?=
 =?utf-8?B?TWE0c21rdm5DVjFZckdVSTE3QzJxVmFBTktkenRCUFBLR1hubU1GTEpPK2d0?=
 =?utf-8?B?R1Joc2k0OEFqaXhWUllmUkhDazUxNWczWmg4OGMxN1BTbGdwQVJnN0VESlJo?=
 =?utf-8?B?MU1rRWRCdmpBdTlhaWpUdFpGWHNWeE9sbWNSR042eDBhVVprVWNNY3ZOTzBI?=
 =?utf-8?B?VFVyTE5pRUtRYm5OS3dOKzQ3WElqLzR1MGtPS3Y5bnZJd2lERkU5NC9aUDBx?=
 =?utf-8?B?WjViUkdPQTk1amJBQlZRTzNUc3Fua0xkRTdoT1VTdlFuc0IySWJITjlhV0p0?=
 =?utf-8?B?RVZub3dTdGxQcU9acDVqYXpSZE4zSEIyN21JSkxhUXRFMU1OVWQ0b1BIcUI5?=
 =?utf-8?B?K201cEVwRnlJdlE0K2dNNjFTSFFiQU5FNlczQU1TM3YxMVVTeXQ2WFZMVGxY?=
 =?utf-8?B?RGsvVjRjajBqdE1tNDRLNlNLS0RJRzVhMDFQZmQ1ZFFHYzZXVnVoTDRqT1hv?=
 =?utf-8?B?QmorSEhTVFZkb2Q5Y1BTM0lJblN5L2gzWXliU0huakFUa2IyUWpxb05mL0VI?=
 =?utf-8?B?eWhubWFNdThXOUJBWksvbnh4bHBEV2hBYkFKUmplYVdpWHJJNmFCbTJ0dHlK?=
 =?utf-8?B?SXdScW9iK0c4aXUraTVWNkxETDRhL3U3S25ZV3ZDOHdkK2VqVGN6eVg3UHFk?=
 =?utf-8?B?a0t6b2E5S1JHbEFDRmFrWmFsNnhNVzlQcGVRQnFtNTU5L3JFV29CSzU4WGJp?=
 =?utf-8?B?ZkJtR3QxQzhFczRabUI0SWlxa2w1T1hCUFRPK1NCVHQ3c2gwYXBNSHdRV1Iv?=
 =?utf-8?B?aFpPVHpoMTBucG9ISHR3TUpzRWVuMmJjdk1kNjFpdmdUV000bnFWRTg0UVF4?=
 =?utf-8?B?OEpqTEtXUlZwN0kvWUtIMGh0Y0tuK3JrNTE2Z04waS9teVRRTTZJbTlwWnVO?=
 =?utf-8?B?ajB4a1FPVzdyajVJcEVsVU5YK2xuNmh5VUNNU21XRW9hS0RVVjdJQ0xOeUhi?=
 =?utf-8?B?RjMxUTlRUnhyMk9lV0FKWG5rdmtnUGhWUUR6Z09YdmFYckRISTRjNXlRS0Nu?=
 =?utf-8?B?U2pMZWU5WGVHc3VBZjNQSE1iZlRJWUErakdIYk9UZXBEZ0JPeVhiNU5MVzN0?=
 =?utf-8?B?S1diQ0VBYnIrMWVTUGtKeERXWGw0TVJIK1NHdFFwdXNaN0crN3VNbWVsVTJZ?=
 =?utf-8?B?ZU5jdnZpZkVXZWtCSi83eGtCN2FqVjZYbVE1YzRlWnR0Y0ZqT3Q4elJwb0ts?=
 =?utf-8?B?bTJKaGwyU3BZRGZiRFRaVHl6bEx2cVc5VEZDTUVpenViSlRXcnJ5QVVHaWQz?=
 =?utf-8?B?UHgrUWc2a3l3TWpuT2R4SXlwTDNPbm53cVltUGdpZG5MaFMrb243N2xCVmdt?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0A4095072B087408F89D3A815BAE186@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f595a579-d915-4a3e-71b3-08dcd71021dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 11:59:06.6741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CoY6qRcTvm4E1+5VqHBsXdPGp/Sa+RbxkcaVSeDeX3cNovLTsaxqFCQZhUjWBClWUt/AXfqCEuQwgg56IPPn0wK4cGQ6GZ4jm9uHYnB9CNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
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

T24gV2VkLCAyMDI0LTA5LTExIGF0IDA4OjQ5ICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
Cj4gQ3VycmVudGx5IHdlIGFyZSBub3QgY2hlY2tpbmcgcGFuZWwgc3RhdHVzIGluIG91ciBQU1Ig
dGVzdGNhc2VzLiBUaGlzCj4gbWlnaHQgbGVhZCB0byBzaXR1YXRpb24gd2hlcmUgcGFuZWwgaXMg
bm90IGV2ZW4gYXdhcmUgb2YgUFNSIGJlaW5nCj4gdXNlZC4gQWxzbyBwb3NzaWJsZSBlcnJvcnMg
ZGV0ZWN0ZWQgYnkgYSBzaW5rIGFyZSBpZ25vcmVkIGJ5IG91cgo+IHRlc3RjYXNlLiBUaGlzIHBh
dGNoIHNldCBpcyB0cnlpbmcgdG8gYWRkcmVzcyB0aGlzLgo+IAo+IHYyOiBzcGxpdCBrbXNfZmJ0
IGFuZCBrbXNfcG1fZGMgdG8gc2VwYXJhdGUgcGF0Y2hlcwoKVGhhbmsgeW91IFJhbWFuYWlkdSBh
bmQgVGhhc2xlZW0gZm9yIHlvdXIgcmV2aWV3cy4gVGhlc2UgYXJlIG5vdyBwdXNoZWQKdG8gbWFz
dGVyLgoKQlIsCgpKb3VuaSBIw7ZnYW5kZXIKCj4gCj4gSm91bmkgSMO2Z2FuZGVyICg1KToKPiDC
oCBsaWIvaWd0X3BzcjogQWRkIG1lY2hhbmlzbSB0byBjaGVjayBzaW5rIHN0YXR1cyBhcyB3ZWxs
Cj4gwqAgdGVzdHMvaW50ZWwva21zX3Bzcio6IEFkZCBwc3Jfc2lua19lcnJvcl9jaGVjayB0byBQ
U1IgdGVzdHMKPiDCoCB0ZXN0cy9pbnRlbC9rbXNfZmJ0OiBBZGQgcHNyX3NpbmtfZXJyb3JfY2hl
Y2sgdG8gUFNSIHRlc3RzCj4gwqAgdGVzdC9pbnRlbC9rbXNfcG1fZGM6IEFkZCBwc3Jfc2lua19l
cnJvcl9jaGVjayB0byBQU1IgdGVzdHMKPiDCoCB0ZXN0cy9pbnRlbC9rbXNfZGlydHlmYjogQ2hl
Y2sgZmVhdHVyZXMgYWZ0ZXIgcmVuZGVyaW5nCj4gCj4gwqBsaWIvaWd0X3Bzci5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1Mgo+ICsrKysrKysr
KysrKysrKysrKysrKysrKystCj4gwqBsaWIvaWd0X3Bzci5owqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+IMKgdGVzdHMvaW50ZWwva21z
X2RpcnR5ZmIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzMgKysrKysrKysrKysrKysr
LQo+IMKgdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfMKgIDUgKystCj4g
wqB0ZXN0cy9pbnRlbC9rbXNfcG1fZGMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMiArCj4gwqB0ZXN0cy9pbnRlbC9rbXNfcHNyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAyICsKPiDCoHRlc3RzL2ludGVsL2ttc19wc3IyX3NmLmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArCj4gwqB0ZXN0cy9pbnRlbC9rbXNfcHNyMl9zdS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKwo+IMKgdGVzdHMvaW50ZWwva21zX3Bzcl9z
dHJlc3NfdGVzdC5jwqDCoMKgwqDCoCB8wqAgMSArCj4gwqA5IGZpbGVzIGNoYW5nZWQsIDk1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCgo=

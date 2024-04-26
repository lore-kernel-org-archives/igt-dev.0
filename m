Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D713FC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 10:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EDA112165;
	Fri, 26 Apr 2024 10:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOEXBYkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580FD10F76B;
 Fri, 26 Apr 2024 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714128730; x=1745664730;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UEUOKadtwTXPIW6KUsd4qH6UPQXLnl4r//w9z+Fl3/U=;
 b=FOEXBYkTGrfE9/ZF0ew5myU/LaX7rw1KpA/dhMKCDEflUIYvqWckz6tw
 87fdoc1bbYCyTSuTZb027dYXSjLiKyoKqr013arD7JLjYU/k4qOPL1GJT
 NgtqSep9PqVb6j9yaSo5WjQIiyUg6Qp4b1FMmz7xoONvAefcIy/8BWT6B
 NHlu1Orz4+fZH833+Va9r6cyBAM6PFJSGki2x82A75iWDYwj4YFkcfWiO
 LeiE5BP0crchnXruNcIP12Ga3ZvQmFlyrARVqGqtRZotfJxI1snmVbw+h
 XiPKRYe6erIXHIVje04bxLUa1Wgnzud/Y3oMzeFWncqUJZ9WKuBQhVIkK w==;
X-CSE-ConnectionGUID: JyfKACPgRbmJ7Vsl7KakLQ==
X-CSE-MsgGUID: bEhPg1EHT7y/J8UvvubAxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20472967"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="20472967"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 03:52:09 -0700
X-CSE-ConnectionGUID: dGA7RwL1RPuTQLymJ5q3QA==
X-CSE-MsgGUID: CXSqxsiXTYylDOU/TYbA6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="30028101"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 03:52:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 03:52:09 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 03:52:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 03:52:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 03:52:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLj96dNqWed42girDZ/F2wrUBDsfrIk8jHaaX8Y1crHSCfwXPBm6kYrsUxj2iudEpoCLjI0puvirksHsC1v038fXnln3YXGF4oDKSpnWeHvaB2kRjyXpkjHpFiCYO30FGhMMNTfZ1HNGaYzGhv0CVIC9hLo+YQ+j7DGyhvktKWtkiLGRKeq2Zbw0OusrwSDwJk1+pO0TyP+Ne/lv+iVehaAt3MJi8xmSbUrmp60gyVmfz66ch1d0W1IeNfGv0F8nKzetKF0G193Epj0kp/6tu8u2vI+7yydlI8n9DvW3DNl178J9d9e27+r7DzXfMxYC+AYfSJqVCS0rso5/e9ov7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEUOKadtwTXPIW6KUsd4qH6UPQXLnl4r//w9z+Fl3/U=;
 b=AF/mTYpErhQooaHXzPiRh7x0laXWDCDRijeIQnNzZpQJldRF+E456dxoO5/JErVufcZh3oUGWnOzlE4+UzixLjjuKWtILO8GYdT7fFZ79ejE9TDLbLuOuV1Q3V8eq5Cylmq0u91H0By31R5KSJ9c4bWc3GaOuWb5gtATccMWUYzYoSqR/JzZjagTDZ2hzckqTkPGcEzdDh1hq2SnOP7zZO9r7SE50+eS68aPCrm/UlNYqe8cA06+WrpXyKa4B275bO6YfeA4tmunA2eb+WogMaCo6FFQCZWOQdh2vBmidbjWkawyMJlL4cl/71nIAUZ9ZgQjyrtOPk0uyTxPMqoSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Fri, 26 Apr
 2024 10:52:00 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 10:52:00 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBDSS54ZUZVTEw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsL3hl?=
 =?utf-8?B?X2V4ZWNfcXVldWVfcHJvcGVydHk6IG1vdmUgc2tpcCBpbnRvIHN1YnRlc3Qg?=
 =?utf-8?Q?(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwveGVfZXhl?=
 =?utf-8?B?Y19xdWV1ZV9wcm9wZXJ0eTogbW92ZSBza2lwIGludG8gc3VidGVzdCAocmV2?=
 =?utf-8?Q?2)?=
Thread-Index: AQHal6hwafoAVG1FxUCQA7UwrzZsjbF6MPUAgAAug6A=
Date: Fri, 26 Apr 2024 10:52:00 +0000
Message-ID: <PH8PR11MB675361F57857B1596EBE603EF2162@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240425143946.62074-1-kamil.konieczny@linux.intel.com>
 <171411523255.1668691.8946544338798152234@8e613ede5ea5>
 <20240426080252.nz5jgswsgygjdfi7@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240426080252.nz5jgswsgygjdfi7@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|IA1PR11MB7679:EE_
x-ms-office365-filtering-correlation-id: d3fc7e5b-13c0-427b-5edb-08dc65dee6b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?eStVV2xKZllSdFJTeVBDVUxTYVBQdFRtK0daUWNHMUt1MS9taXVjL1NBVFQz?=
 =?utf-8?B?NElQK05ObWIxb0JBdUZ4YTNXTTEyWVlVRXhKVXQ1YTc4WEhZTURKblgwcktY?=
 =?utf-8?B?UmxCTi9wWlE2dkl6Rmoxbm5RdndZT0k4eUhZSDRabTU1MGduU05jUlpBREZG?=
 =?utf-8?B?U3RIeXRPc3FzbmVSOGt3Sm9BK2VmZCt1MGFhekpnbE1jZE9XbHNUdThqS3lp?=
 =?utf-8?B?RUc5ckdVV0gwbVNTZUtmTGwzWmYwbTYveW9tM1JqY2NNSFlQRXViK3BkU081?=
 =?utf-8?B?SkwxL1VrajRzazlpb0cxdEpjWlFhSTZSRzVHRUlWb1V2Qi8rVE1wZ3JZcnRy?=
 =?utf-8?B?NEFNNkNpZkl5T3JHMGZUVlVHbWwzVDFPNTU1cDcvbWtneS81NW9iekJWOEs3?=
 =?utf-8?B?aWtsblpmK0VPQVd0OUlLZzRHUkR2OC9ydDBpWUo0U3lVSXRxRWhzOEI1YmU2?=
 =?utf-8?B?eUtqK3FzL3Z3cHo3SVFhWnp5WVhHaFZTUE5WZnJPSXlzS1d0Z0tabGVsd2g2?=
 =?utf-8?B?Q2w4RlZuN1lwd2xGbjJjV2hDTFA1Vzc3SjE2c2Q1eFZqTEFsZng0YjR2STY1?=
 =?utf-8?B?bHVleDZQWUZXMWNUaHFYajZvMHU3OGgxMHhFenJqKzNDUXphSUUvMVlhUEdt?=
 =?utf-8?B?Z1QyTlowNkhtOXRxSWJWZmo3OVNwUjlQTytMYWRWT0habmhRZzBYeVVJZjRY?=
 =?utf-8?B?Vlp6MnBjVFU3QkN4cC9FeVgzZ1V3dllxeTJ6SjZJMHl6aFdhV2lldVhIYi93?=
 =?utf-8?B?Z2JqTHVEME5WaXpOeVhXaEJheEVKMHIyb21vTmxObFJTZFovSkxnRk9zRkxq?=
 =?utf-8?B?dXlpcm15RS92VStQQnZHZm9DNlZ6ZFVycjMwRGZnalZZUjBaQVh1b3Nmc044?=
 =?utf-8?B?eGg3SXUwSXlLWGF1UnJmbFVCZXRWQ2Q0OUlFcSsvSEFYdmJoQkJjYTRHek5D?=
 =?utf-8?B?UDIrcUZTNUR5S0hCUERkZFVVVHdSamNUQXFwV0RsODYrTFZVaE82RmZSdU5i?=
 =?utf-8?B?RGpvOHFFcW1XRVdYS3o3YU5jQWMzR1BmMGlwMTFtOGl5cjFoUm9jcUQyNU5K?=
 =?utf-8?B?RWNGZkp5UEpKWVM1T0Yrc01xaGlBeXRrbldtRzcxZGFwRkFwTmpsOTFXa21y?=
 =?utf-8?B?YTliZGoyUnYrcHdRNitrN3FEdVhxd1hCK2p3MkpOcmtzU1dmRDFKNVM2cSsv?=
 =?utf-8?B?c3RBMW1DUUJBdElkbDFYdVY0S0dqVXdMSzJzemRnWGRiZGM3LzRyaEUvaDNW?=
 =?utf-8?B?Mmw2Z2RCVnlZaTVpVjRTQ1luWUpoVWEyTVN5M3RZdW9sT1dPYUFXYU5vTTdY?=
 =?utf-8?B?WmRyQllJSklROGZGNzF0UlBjUWZhak50b1NZT0FpMXU5NWRpanJja3hUQVcv?=
 =?utf-8?B?eWY0VVRtblU2SmZjSzNSVDB2a2doQlhDbmtiMmFIdzd6TWFaYXdCcWFwVyt1?=
 =?utf-8?B?bXZrK3NxR3ZqZCtZWndTWWl5dGtVekMrOTQzZjh6WmpLaSttaEkwY0FqS1F1?=
 =?utf-8?B?U1luazBoU0JLcHVpRHcrMm9qdHQzcXVud2JLZ1lyZzlKa0ZMbFYvYmVFdTZC?=
 =?utf-8?B?dzNXd2I5TFY2Z2JmdFdEempqQ2lyK3d5MUo1ZGg0YXNLbzNYZEF4TEkyRTlP?=
 =?utf-8?B?ZERSNEI4cXJzbDJqVnk2UEJGcVU1YjdwdEJWcnY5Z0NvWFlCRkJiN21LUzdG?=
 =?utf-8?B?NXhrUm5aYlNWd3EvV3dmK2ZFZ05hWEd6ZHdJeFo0UjdOSFpQUHRraXVabUww?=
 =?utf-8?Q?k84oknJ2uhPc91Zy1k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y01QV3R4dFpLaUxiak50czdsNXIwd0xXa1QvN2pCRUhNcXpQbzZxYXVFd0lq?=
 =?utf-8?B?eXhaakxubGp0NUJDY1pnajJFL0Y5dDRwM3NuVE5UdnZiWmtKMWRHbnhCU3I2?=
 =?utf-8?B?UjhYbkFnaXBMbWJSV1ZlRHRXT1IyZm03U1lqSk9SbE1vQVBMSnBkSnpJNjA4?=
 =?utf-8?B?dUhIT3BJNVBEY1F3NklsK1YzMXczcHhjUmVmc1ZrNmg3OXNsMyszblZWVjZW?=
 =?utf-8?B?UFoxdGhrV1ZYM0V4ekg2YmNTdytCc3lsY3VXTG0vTjFtSUYxNTJvL2V3Z1p1?=
 =?utf-8?B?eHVQSTNYVVREMnpNb0dJNHlrdmhEZ0xIYWlESzVUUlRhUStKaXFHaktmSDRP?=
 =?utf-8?B?eEd1WkNGVE8wRURheFNodUxRNEttWG1SaGNXemtJVG5OVmg2b2dJbU5FcHhF?=
 =?utf-8?B?ZlFJU1B6TzkydmhUR3o0cXZoYXZseUYybytpWmpxUno0QTFBRWNZanVJR2FS?=
 =?utf-8?B?bVRlTWZod0x3ZDVab0N0bndrRElBWUg0WXRwRTRCdmpEc01uNGJzTUVFNFB0?=
 =?utf-8?B?S0o4cHpnUXJ5NE1jQ29SazBCNkhnVDA1aUVtekk1RzJsbmplMHhnWjRlT1Bw?=
 =?utf-8?B?Tm8zVG5ZMmtKTFgydzVjaHRzbDFLTmNObGRCLzNybDZJYkF5TG9QWEFQU3Yx?=
 =?utf-8?B?RG9LMXFmVWh3OTBHSi9jR1J3TmFwS040V2FWWTB2djdFdzJPZDVPOXlsRGlt?=
 =?utf-8?B?MmRTN3lZVTdwdmc0U0ZIc0U1a3d0dDQrbU1mVnpka3pGVGNTOU9udk0xWWl5?=
 =?utf-8?B?Qndkdm9HRTd6emExV1JSVVhTVzg2bEpmT0VXY0x0RTBzcnY3YWdNUEE2ZkxG?=
 =?utf-8?B?YWM0N0o2cWJqNWhYRTJCZ1RVOXMzY2c1V1dHUisvV0g3L2kzOGR4YnFhYXRu?=
 =?utf-8?B?WGw1a2xEQ3FNR1Rkc2UvUUVLdEJRT3RBUGtqTnY1bjZHN2FyYWtjdDFJRWc1?=
 =?utf-8?B?Z05sMTBzSytxVFlITWNYVFBNaFNNWnhFck1RaXo4YTNQbExaQkNBWnl2Q0dR?=
 =?utf-8?B?VS9RMWZYT3VuZmw3eG9KNFB4ZzJSYkw0YmN1ZHRKcTkwM3F1NWFlYUZjc0VS?=
 =?utf-8?B?VnR0cm5tVldPajAxTU5oY3NGMkNzTlVvMWkySWRkUjlzRFpSMTFiem84SzRq?=
 =?utf-8?B?UHFhdm5vRHRza3Rpa2tOdjdTL0pFM1FwODFpbFJYaHRGYldHdnZ5MHVMeEJa?=
 =?utf-8?B?bGVGTDNjVkZaYXRaaGcxR2VyMkMwSVhCNW9XSUFyUkxrSkcwc1pxUDQzZnJ4?=
 =?utf-8?B?KzUxOXd3T1Azc0lWVEJqUnlNb1VMNWxrc2lnd0lENktwYnNXMkp3RC9uS0xo?=
 =?utf-8?B?RUJBUXdIQzlYRGVpR0hIYWYzUFY0eVhQSTgxYU5yZGovZjVnV2lRQU1oVDRH?=
 =?utf-8?B?cE9OYWZTa25mWVQ1SFBRUVpYaVBFdFppVUVoNzRYbG1zNkg5SVh6SHdHeEJQ?=
 =?utf-8?B?d1JUcy9iQ1ArQkxVUjl1eEVrdWgvcEFwVEM1QTIrVGxYaXFPSERqRTZWOGVl?=
 =?utf-8?B?bGlhYUZwMjEyVG9QOEQwREdXWWp2L2lQSWFWSW5LaitIbDhCSTdqSzV6eEg0?=
 =?utf-8?B?allpakFpdE8wWVRHcld3OFZwVFFjb0J5bHhhSmhPYlZHK1dPWWZBcGN0MCtr?=
 =?utf-8?B?Y0RDMWRNaWlPK3NoUkc4TW9KNkJZYjBJNkcycUhsQmt4aGJvaHF5bEFOY1pD?=
 =?utf-8?B?eWtKdE9jSzBCTmt0bEhNUlBqbUVMaDIxTXhXaHVwZFcxOGRtWEN1UFFhYzlD?=
 =?utf-8?B?ejlUTkJEckxxcnNBbEtzZURwU1lFcjZ4WmlpZnVaUE1kNnlJdTVOU01LckZ3?=
 =?utf-8?B?KzgwK21HMmM4WWc2S0g2QjllNHdYSVc5WS9JYTNlVmU3SHNZOHM0SDIvLzkx?=
 =?utf-8?B?eEVPNnV6SWlWTDErenhCb2FZWEdGWllrZ2JOWitWQURORHJPWXdPUkt2MnhO?=
 =?utf-8?B?WjErdHd2UmNUczNxWGNYK1QxNE9hYnBuZWtJS3YwbXhzaVRGQ0JVM09MeXhJ?=
 =?utf-8?B?ZXJpanlkZ1J2YnJnT1NCeFg3YlJ2cmlzdmdxS1RySzkwL1pjbEZRbHlMOEVk?=
 =?utf-8?B?bG81OVdrVnZ2SlJrT05tWFJSam9TMDZJaEFudVpicHJUYis3dmNNZFhJNjRT?=
 =?utf-8?B?L3BYbk5qeU5UeGhPZW5sN3JNNVZIWGFhUW1JbmpJaGpsbGxOVzZ5V1I1TFgv?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fc7e5b-13c0-427b-5edb-08dc65dee6b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 10:52:00.7726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TuPAU0YXYeC5V8nc1z1hViyHTnQNqU9CdVpv+iZ1+cAme/v/ctwC65oNitFgzEu+ZCinYZeLZ9Urv5sbkNK1m9HgSpdhSwca4wIDTDcz74g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMyMDQyLyAt
IFJlLXJlcG9ydGVkLg0KDQpDSS54ZUZVTEwgLSBDSS54ZUZVTEwgY2Fubm90IGJlIHJlLXJlcG9y
dGVkLg0KRmkuQ0kuSUdUIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClRlamFzcmVlDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWlu
ZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS2FtaWwgS29u
aWVjem55DQpTZW50OiBGcmlkYXksIEFwcmlsIDI2LCAyMDI0IDE6MzMgUE0NClRvOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPg0KU3Vi
amVjdDogUmU6IOKclyBDSS54ZUZVTEw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsL3hlX2V4ZWNf
cXVldWVfcHJvcGVydHk6IG1vdmUgc2tpcCBpbnRvIHN1YnRlc3QgKHJldjIpDQoNCkhpIGlndC1k
ZXYsDQpPbiAyMDI0LTA0LTI2IGF0IDA3OjA3OjEyIC0wMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+
ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2ludGVsL3hlX2V4ZWNf
cXVldWVfcHJvcGVydHk6IG1vdmUgc2tpcCBpbnRvIHN1YnRlc3QgKHJldjIpDQo+IFVSTCAgIDog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMzIwNDIvDQo+IFN0YXRl
IDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5n
ZXMgZnJvbSBYRUlHVF83ODI0X2Z1bGwgLT4gWEVJR1RQV18xMTA3Ml9mdWxsIA0KPiA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1t
YXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtu
b3duIGNoYW5nZXMgY29taW5nIHdpdGggWEVJR1RQV18xMTA3Ml9mdWxsIGFic29sdXRlbHkgbmVl
ZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0
aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0K
PiAgIGludHJvZHVjZWQgaW4gWEVJR1RQV18xMTA3Ml9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIg
YnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0
aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJl
ZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIA0KPiANCj4gUGFydGljaXBhdGlu
ZyBob3N0cyAoMyAtPiAxKQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+
ICAgRVJST1I6IEl0IGFwcGVhcnMgYXMgaWYgdGhlIGNoYW5nZXMgbWFkZSBpbiBYRUlHVFBXXzEx
MDcyX2Z1bGwgcHJldmVudGVkIHRvbyBtYW55IG1hY2hpbmVzIGZyb20gYm9vdGluZy4NCj4gDQo+
ICAgTWlzc2luZyAgICAoMik6IHNoYXJkLWFkbHAgc2hhcmQtbG5sIA0KDQpPbmUgWGUgc3VidGVz
dCBpcyB2ZXJ5IHVubGlrbHkgdG8gZG8gc28sDQoNClJlZ2FyZHMsDQpLYW1pbA0KDQo+IA0KPiBL
bm93biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSBjaGFuZ2Vz
IGZvdW5kIGluIFhFSUdUUFdfMTEwNzJfZnVsbCB0aGF0IGNvbWUgZnJvbSBrbm93biBpc3N1ZXM6
DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIElzc3VlcyBoaXQgIyMjIw0K
PiANCj4gICAqIGlndEBrbXNfYWRkZmJfYmFzaWNAaW52YWxpZC1nZXQtcHJvcC1hbnk6DQo+ICAg
ICAtIHNoYXJkLWRnMi1zZXQyOiAgICAgTk9UUlVOIC0+IFtTS0lQXVsxXSAoW0ludGVsIFhFIzEy
MDFdIC8gW2k5MTUjNjA3N10pDQo+ICAgIFsxXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzExMDcyL3NoYXJkLWRnMi00MzQvaWcNCj4gdEBrbXNf
YWRkZmJfYmFzaWNAaW52YWxpZC1nZXQtcHJvcC1hbnkuaHRtbA0KDQouLi5jdXQuLi4NCg0KPiAg
IFtJbnRlbCBYRSM5MTBdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tl
cm5lbC9pc3N1ZXMvOTEwDQo+ICAgW0ludGVsIFhFIzkyOV06IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9kcm0veGUva2VybmVsL2lzc3Vlcy85MjkNCj4gICBbaTkxNSM2MDc3XTogDQo+
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMv
NjA3Nw0KPiANCj4gDQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0KPiANCj4gICAq
IElHVDogSUdUXzc4MjQgLT4gSUdUUFdfMTEwNzINCj4gICAqIExpbnV4OiB4ZS0xMTc1LTY3OTg4
YWZkNTk2ZjMwN2I2YjdlODQ5ZTZhMjQ2YmNhOWEyMGU5M2QgLT4gDQo+IHhlLTExNzktZTdmOWQy
ZTYyODcwNmYzNDQ0YmJlOTdjOTE5OGI4MzVhODQxNjY0MQ0KPiANCj4gICBJR1RQV18xMTA3Mjog
MTEwNzINCj4gICBJR1RfNzgyNDogNzgyNA0KPiAgIHhlLTExNzUtNjc5ODhhZmQ1OTZmMzA3YjZi
N2U4NDllNmEyNDZiY2E5YTIwZTkzZDogNjc5ODhhZmQ1OTZmMzA3YjZiN2U4NDllNmEyNDZiY2E5
YTIwZTkzZA0KPiAgIHhlLTExNzktZTdmOWQyZTYyODcwNmYzNDQ0YmJlOTdjOTE5OGI4MzVhODQx
NjY0MTogDQo+IGU3ZjlkMmU2Mjg3MDZmMzQ0NGJiZTk3YzkxOThiODM1YTg0MTY2NDENCj4gDQo+
ID09IExvZ3MgPT0NCj4gDQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtcHctMTMyMDQydjIvaW5kZXguaHRtbA0K

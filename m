Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104B7C54E68
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 11:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B8710F539;
	Wed, 13 Mar 2024 11:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RppFusRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0B210F539
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710327880; x=1741863880;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HOWImO5TiMcwrfFpIKCnj3RiN52Vck/ugvkrZCpNk0c=;
 b=RppFusRj0UYOhtrHy60L0JGq7HR7hOV5S81jRRhzYxo8DqF88yDG/t8D
 DUoNVgx6TbJzO+m99Amz3aDANurewKw0QD2wvI/y5+9oj4lzO6qLg1mog
 T7qM/vSLW8vJDZbL1oVExDuwL/FJsiI+v7TmeXgvWbA9fnYCGKFojClDk
 lB9C0KP+QrmJT1KnuDYAXRDurfYFi/sInj3hRXhpxpvWFoFqdYp06UU4T
 gcB+fydvoJzmfGAqJozVgF95MoRnO7LA4rEwjyH3tnMDJ4IzA0LCX98W4
 jBr0C0LfWmTBhCHf8X0+mFICphmbxOF/+YVgBS7RMBE9adEMKIxHzaZQj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5254960"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5254960"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 04:04:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16458400"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 04:04:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 04:04:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 04:04:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 04:04:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 04:04:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wk+tSmqRdX7uu1AUceDIH3mFXodEFR2Jjo+VmHBLB/NDf5h/A0gpfhgigh3TaQ3AP8NL8nK4580PEGb9JuMD06+TjqLc2ZNA/V8euwPnrx2Dy6oaBXZrCrUpm06RV/grBWJycDZe0zHhEiMqzAPoAqLcaTs4HULjM81z36pA2xvb2cgt8bULZn2HOwqNhOXWA4cLs+ZeTsbZcMDTUIVXkqysUsrArDr3mvBHjKs78vq1xOjz9dMTMTnUSM1yQn+X6VOq1J/vLSuuLYv5h1KAZbz6tRqLtSmZ4DghA/Ah17Y13Vo+doi0wp1ZW8CopU0MLHMQhUlpC6ZEy7ukjTdIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOWImO5TiMcwrfFpIKCnj3RiN52Vck/ugvkrZCpNk0c=;
 b=KLfTwHvf1r14akBZ+M4FP5fTf4k55w0PbBm2ThwK/xC36+yhJTcBME3JnTNVugoDwnIEzkl+ErrXizwcSop4Do/MOBceh3Hg46R/MTATXDIAMDA8dFQNwu0IooGlGyqo+HK+jsZzLTfX305UrQvNUnHK0i+snvWMllY5zZcBLnEl+pzdfte7kqntAqgOC6RM5EidlNwW1eambzdsqxlsJAjbPSWZaIE33iUdFv5umCUNVOwjVSAj5AFZrHXg5sYTm80ZqrPErnHThQKRZp3aB+SVulYoaPzubhnvh5J27YEeicGg/dEP4RHyuPyFpoja+fFD5brcdUjwd3pLepjkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Wed, 13 Mar
 2024 11:04:37 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 11:04:37 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 0/6] Do several cleanups at scripts/xls_to_doc.py
Thread-Topic: [PATCH i-g-t 0/6] Do several cleanups at scripts/xls_to_doc.py
Thread-Index: AQHadRxBE+446DfOPkWwJ+YO1s1JgbE1ghBA
Date: Wed, 13 Mar 2024 11:04:37 +0000
Message-ID: <IA1PR11MB60970AAF7C74EAE8E255758F862A2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240313075813.1114081-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240313075813.1114081-1-mauro.chehab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|MN0PR11MB6012:EE_
x-ms-office365-filtering-correlation-id: 397ede40-c673-4fba-ca2a-08dc434d5f65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4xNUmqEvsfdm4sWazt7BbG6quvIboBUEUcOx4HRrdA6Wp7yaEBJGuHzD2T3s6ocgdhEfftYd8Qa0YiG4+H0+Ic4juJ1ehEg9W7ar5ONKzY49nU/9CzdWIvnC2V34UJmM+HxUA9y6nbcF1EhQ3lqaXj4E0/HxA67s4inXy81/xO4vSASXqQRNIkHEqOtUC1dVmXdr629S6zSskClDukmQdM+QxuAx9MeQ33OU31FNP4ThOOZbP2d17Td5aki5KFarEoXOhAggaoANn38cJM93w62OJdJTIQiNxr5hiJw7IBmw42PonWv2ZcvGSilLPlad7FBvW2SbHlt8Hno2ymZWXrkIHP6hygWg3jY56tzCEeoVWT80VDoHgpspGW70USk6fo235TbhejJz+Z8UX7Owwjy9s1mFu+IPq5IexRxhM5fIQVsPTaq+NDtZVoiZPzQhGhBL/6i1dZKQ7zYaGd2EN2+KrcgDm1pxX7c1upmfK0fdTUKsn+Huh1Pf7qAvCQC9vWaCmsYMRw6Tt0EFTUIRQYChsz3kKVEHASlQkO9Wat5GEaqbOhefZru6ge/CF3zseI3C54OC6Fk55HBv/zD5HD9oV16Pn4L22wxJIzEjEIP5hTisOYSnlEmrRV6D3Hu2fyKmygQ68t9BfX2pbSdMpJ8UbpYoEkOtd182u7AIiO6e5yviHiYT9W7I942X2fh3u0Y1c1l7poJxEjVEZSSeTEkmLk1Yqgr1Zk2OV53MY94=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STJxVUJiWE9qRzRLYitYYWtsTzZHTkhQS0liVGNJVC9CTW5mQXVBcnl6MTBs?=
 =?utf-8?B?ZGhhVWxhbVdHTXBxaEM1MEg1dnd2b2IyWmw5M3IyWWR2b3prRkVXTVZOQ1Ux?=
 =?utf-8?B?QWxtQUhyOTJ5RUdKRWFnUElEbXJUY09DNTBGYTV4NEhmUEphb0lJZGd6VjFk?=
 =?utf-8?B?UXBuQ29xazdaN2hXY3RvQ0cycnhLUHdSeE1ZVmFmYTZRYkRTSjY5MGFlK2V5?=
 =?utf-8?B?V21aVHp0ZS9LUWhzWGJwVnFjNjJmdG5idks2bHdkNTlqZkZyTnprZWpaTVVq?=
 =?utf-8?B?Qkg5MDFPcnY4NE1vWXZ6R3RDVTdIWWpES1BLKzU2VGZPa3NNSFRRR3d4alYx?=
 =?utf-8?B?SkZSOU1Ka3kxZlYvQWRzc1VGN1VVKysybElPZFRTcmwyb29UaU5vaVRXam8y?=
 =?utf-8?B?aUxUc0hGUlNFcXpOTEJaNitNVmRSamh5c2I4a2tDNVU2WElyakJoeWpKbHk4?=
 =?utf-8?B?ZFBBdXJIS0JIV1dvZ0Q2ZzVvWkszTzZiNXVMM2FTVlRkZ0thZk1FdUNBcElC?=
 =?utf-8?B?ZlFkNUpoSmdPcDVoMVZXRHZrV0FPeC93eU42ZWQ1dXh6Nm41UWxEaThWOHVN?=
 =?utf-8?B?T2hnK2xxR2Q2SWNCL0NxUDNveW0vclNFUWQveUd5cUFDSEtETW1nK25Kemhm?=
 =?utf-8?B?ZTBXMEd3NjYvUjlLVGVOd2NjQ1JmSUxEWE5BQVQvWjFwVVRnSmlwYlBrUHh0?=
 =?utf-8?B?MWNNbUZOanhFV1JIemYza3hwVlROOXdoRkR2NXdIU2ZFZnFCcTBsa21kb29p?=
 =?utf-8?B?YmVGeUJKUjM0dW13UkRNVkgwQ1M2dXZ1aWRkSk43cTBDcTRnaDJMZWNGN1V2?=
 =?utf-8?B?Y0ppYWlJSlBzNldCOXZHam00YjdManZwY0Z5a0cxc244ekVpVlNvMUxoamVR?=
 =?utf-8?B?VjIzQVhyR3dEa0tnRnJ6YURaZjd4bjNYeENTbEIzMkplbVF4b0FnNVpRS01S?=
 =?utf-8?B?SjVwbko1bHF1U0NqMUxoUG5LUGFSdTllaGpKSXNpVktQbXJSaXpaV2tJVGFh?=
 =?utf-8?B?RkJJWktNSmFuRk4ydm5ScXhLbkNJY1ZCYm54TVdGWTZLd0d2K1BVYlZnRWdU?=
 =?utf-8?B?SDdudEZLN3Mwek1jZVNEd1MzQVhIYVg3S2p5UU12MWtZdEFZc3hpZjdPVDBl?=
 =?utf-8?B?T3ZtQ3JtQUkwTXI0UTJXYVU4Q1NnOUJpUXlrTW1JUklJdDE0M0NrRmZjaWYx?=
 =?utf-8?B?Z0pSZ0FzMHJFYnFndkdpQkZzYUlNZmk4eTlJVS9TSDFWRVVMcEVLcG9FSUFZ?=
 =?utf-8?B?SmdKVzJlRC9mM3Q0K2UvRXBFQUUxVjllcEJIL2t0cnFPQzUzeklRTlA5SEV2?=
 =?utf-8?B?c0oyeHVMeGtLcUppV0hnUlVRSDVwdU1NakRxTVpId1BodUpiVk8rdFdzM2lO?=
 =?utf-8?B?aEd6YWZqL2lObWRUMHM4d0Y3cDMvOXIwSUE1V0VPZ3pmZTVBZEtlRjFLcHBE?=
 =?utf-8?B?NnlYY2tyczU5dUpsTkNqOFlsT1lUMU5kNGh6YUtYak9LTDU2aTNRVVcra1gw?=
 =?utf-8?B?a0JpMTJQSTJXS05POG8zblVzVXZEVWV3QVRvdXk3VEpMNjRZNG1kdnc5T0p4?=
 =?utf-8?B?anNtMlRpVmFtN3FxQTZLTXRyUzFUNVhLVEZnOW5RN2JVWStDQ3pJT25oK0Mz?=
 =?utf-8?B?eGxHUFBSREUwQ0k3SkVXZ3RoNTFIeDYxYXd2aUFaY05QOGNPRTdjN1VUdDBu?=
 =?utf-8?B?QlpiWmhkWURMSnFtUDRXZnJKK0QraUROUCtHa2NwWTdZQldRbTZ1NXljUGFT?=
 =?utf-8?B?bDRLWTIvY0VnM3ZlNWJOMEFBUGc0UlJrcE9GcGpxNWY5c2ZaK2huL1FpcnRT?=
 =?utf-8?B?TWl2THlTUUlyYVE1UGt6Mit2WUlYRi9YZE95cEd0cnhCb0U3SFFDQWlSSWM2?=
 =?utf-8?B?QTlDQ1J0MTJNOXk5ZlpTcFRaY0c1MUZrcHVNM0RWZXhwaTZKc1o3NGdkMXox?=
 =?utf-8?B?cVJaRzUvcWFBUUdMTytXcGE5NEZFK2RpTUxZMjJRdVJEd3FXVVRKbGltVTdi?=
 =?utf-8?B?QWc0ZmZOay9OclBlS2FwL2psZnlqQXE1RjVCbTVLd3NJQmwyVEtnd0NCUjFL?=
 =?utf-8?B?T3U2R0FSY3Y2MWx2dlQ2akpJbVA1RWV1ZkVCWUxkTlh2NkVsdThRSWZwOTk5?=
 =?utf-8?B?aXVsVkpDRlc5T21FNE5BUFJTSmdCaVZ6dTRRWG9GdXQ1N3NINVFPVllNRlJn?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397ede40-c673-4fba-ca2a-08dc434d5f65
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 11:04:37.1415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ih5uuFtsr+lD5BfXI2tbR6v7Svt8cQcWftNXDOqJeJsfkrSc8Fiezzx6f0gwjPXjsKoofAM8xbtBIvA+asL2h3nudMANKrgUZaXQzcldPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
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

TEdUTSDwn5iKDQpGb3IgYWxsIHBhdGNoZXMgaW4gc2VyaWVzOiBSZXZpZXdlZC1ieTogS2F0YXJ6
eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5waWVjaWVsc2thQGludGVsLmNvbT4NCg0KVGhhbmtz
LA0KS2FzaWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hdXJvIENhcnZh
bGhvIENoZWhhYiA8bWF1cm8uY2hlaGFiQGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNk
YXksIE1hcmNoIDEzLCAyMDI0IDg6NTYgQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KQ2M6IFBpZWNpZWxza2EsIEthdGFyenluYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50
ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIGktZy10IDAvNl0gRG8gc2V2ZXJhbCBjbGVhbnVwcyBh
dCBzY3JpcHRzL3hsc190b19kb2MucHkNCg0KRnJvbTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxt
Y2hlaGFiQGtlcm5lbC5vcmc+DQoNCkNoYW5nZSB0aGUgbG9naWMgdG8gdXNlIGEgbWFpbigpIGZ1
bmN0aW9uLCBoZWxwaW5nIGl0cyBjbGFzcyB0byBiZSBjYWxsZWQgb24gb3RoZXIgbW9kdWxlcy4g
V2hpbGUgaGVyZSwgYWRkcmVzcyBjb2Rpbmcgc3R5bGUgaXNzdWVzLCBkbyBzb21lIHNhbml0eSBj
bGVhbnVwcyBhbmQgcmVkdWNlIGl0cyBkZWZhdWx0IHZlcmJvc2l0eSBsZXZlbC4NCg0KTWFrZSBw
eWxpbnQgaGFwcGllciB3aXRoIGl0Lg0KDQpNYXVybyBDYXJ2YWxobyBDaGVoYWIgKDYpOg0KICBz
Y3JpcHRzL3hsc190b19kb2MucHk6IHVzZSBhIG1haW4oKSBmdW5jdGlvbg0KICBzY3JpcHRzL3hs
c190b19kb2MucHk6IGJlYXV0aWZ5IGl0cyBjb2Rpbmcgc3R5bGUNCiAgc2NyaXB0cy94bHNfdG9f
ZG9jLnB5OiBjbGVhbnVwIGFyZ3BhcnNlIGxvZ2ljDQogIHNjcmlwdHMveGxzX3RvX2RvYy5weTog
Zml4IGlzc3VlcyB3aXRoIHB5dGhvbiA8IDMuNw0KICBzY3JpcHRzL3hsc190b19kb2MucHk6IGRv
Y3VtZW50IGFsbCBmdW5jdGlvbnMNCiAgc2NyaXB0cy94bHNfdG9fZG9jLnB5OiBkb24ndCBiZSB2
ZXJib3NlIGJ5IGRlZmF1bHQNCg0KIHNjcmlwdHMveGxzX3RvX2RvYy5weSB8IDE1NSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTEw
IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQ0KDQotLQ0KMi40My4yDQoNCg==

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283B8CF31A1
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 08:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75B910E6C5;
	Wed,  2 Oct 2024 08:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9TTsQzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1C010E6C5
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727857959; x=1759393959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4tUh0gmtCRt0Am0/GJy8+DTw9wSEY7KOSVRb0cD3eCw=;
 b=T9TTsQzdUgjR/JfBrcchwVOW6IjrleTkBPczadMsPa6uJB81dfHBxXbG
 11/62Hgk03OpSgPazyfHSPNIjn8H80riGpyyb3bixVn8vhkIgnYXtvxHB
 YgUWsJMe/2PoY9DBirvuEzvbKFoFIIM5hCE8vuninVQSz64HiXKifNhac
 5wbbO0TS93tdZ0vJnlyZ6YdmKJ9CPJnyDQ4QSbFMtG4OlCf50Jx2O3Z9b
 5D819jnREPgTccr2k6A63tbd7g9kR0e4lwYKFRm9Im/7ZoedfdmR3jmud
 sRx0OMsi5UXi4xO9pMquMW6/tBjgYU16bSCrT2991AzLikUz6vk3Pxcae A==;
X-CSE-ConnectionGUID: XHlOpaLjTdSk+VacqUKkOA==
X-CSE-MsgGUID: eFPZ2GNnSbWXeEw1pbx0Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38148357"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="38148357"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 01:32:39 -0700
X-CSE-ConnectionGUID: Z8J1IDeyRZeNEZS/F22lhg==
X-CSE-MsgGUID: lDaXe2cRQ7+uf0vnPFo4fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78800164"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 01:32:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 01:32:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 01:32:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 01:32:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1nQ283hGUjyah9/CcJKLzPzDn3B0BKwGhqG7qF0lOiPK+mFCUq+Y4rn7UPeSGUbtgEEslyWZ6a5iK0HKCOxCyUIloGkUMk6278+M/tBoxLOu5o6M18K5zhkT4vg8/LgIL563C9TootDZ6wsdtWrQq2a4niITQBvQjjY/ZPD6mApkShcbOqQIGPc7czNCjGaY0yfTsRvi1s85uFRy6fELikV9WAIFI7YmUqLwF+0lZsLgp62tTvNDLC2gMzEwtBXwtnxkjxIqZIECFmc5PQltKc0EyZrU7IzqAD+daR+RusiqZDet+7BmZ8Gzv5HYRqyUED3D5nCJ8GR6A+vCD5PTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tUh0gmtCRt0Am0/GJy8+DTw9wSEY7KOSVRb0cD3eCw=;
 b=jT3/SHkDheMebC2ujfeIiiAbPGtXKV1pXNsW9W4KCj0sBlAjhOChtqcucxupgsBw33nMbC68lh3IIzYc1PlYBMbu2TEEBjk8QiMvmIAsZUqeJob3cHTxVOY7nWb6BZx+wsxW5JUuNRPwUzUh+VSuCABq8wcarF8rHhg4insHXauuTkHdVa1E02cZMcIBbAsPeqsTHa5yBegJLma/snY5SkEI4N7ReCRM1+u7DtxSvevnFZRDvjQ2dPBR6+5Um+tEFn3f9aVXWyoxohVDru+Uo5OUxskoHRtdy7l5tEOLZcFi1PweOplljtUk6NpJvvApTfbDnThUt5Dtob6zi3p3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Wed, 2 Oct
 2024 08:32:35 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 08:32:35 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/igt_psr: Assert on sink/source state
 mismatch
Thread-Topic: [PATCH i-g-t 2/2] lib/igt_psr: Assert on sink/source state
 mismatch
Thread-Index: AQHbD+KEsvrs37qP3k6q5tDgiyiKs7JxdF+AgAG3HQA=
Date: Wed, 2 Oct 2024 08:32:34 +0000
Message-ID: <9d64d86b864a4c3ded5352b36e567655d485ba71.camel@intel.com>
References: <20240926070517.1326936-1-jouni.hogander@intel.com>
 <20240926070517.1326936-2-jouni.hogander@intel.com>
 <DM4PR11MB63124F8355DDE4CBE3BA612D90772@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63124F8355DDE4CBE3BA612D90772@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA1PR11MB6733:EE_
x-ms-office365-filtering-correlation-id: 7d597ea9-cce5-4769-d68f-08dce2bcc3fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ODRibmlvdEl0T3UzSXhrL0FrSG1ycWcrSzNxWWhndkxUa0U3N1ZSeWR3UURC?=
 =?utf-8?B?Y05wMk1Ob0V0VlJUeGRCUVhXM1NKQjZpVEJEd2dlaEg2Z2JwQTRTTmxQVEZu?=
 =?utf-8?B?K0V5dEJ0N2x0Wi9YNGovYitEVFVLWUZTQ2hnNnp6L0R0d2JDWUsrbEQ0dTNs?=
 =?utf-8?B?QXNoTGhMZHFqWmpaNzRiQzRMaDA3dGdCb3ovNklTZmZRNVFyajVvdVR6TzE3?=
 =?utf-8?B?c3g4OXczY0xwemF0QU95YXZObHJDZnhGRkhNSHBoM0VRZzVucC9rMWtlSEoz?=
 =?utf-8?B?dUU4K1FTM0kvZnFrMzNEYU1ET2g3VjgyWEFpNnZmZTFwUkprekZmVDRUeC95?=
 =?utf-8?B?UXVGTXRCdmJ0NWpHYThzVmZqNjVVSnY1NVdxbDBhQmlpNmMrblNDakxrc3pS?=
 =?utf-8?B?RDdLU3lrMjgzVWNwZFFzWk16WEg0TUpqN3ZIN1pxNzZNbHFKcTdBRkpXS3l4?=
 =?utf-8?B?QUY5QXJ4RUtUNUg4aUFDaWFaUzI5eTJqcUd5SlZSd2hQN29JOUFPeXlzd3hx?=
 =?utf-8?B?d3JLTnJHRFQyZEo2am5HL2FtSlNyV0RmcEhVam1tUE13SUNBMGpBdGd1RDlJ?=
 =?utf-8?B?d2U2bE14L3RYVjBOU085VEIwMWRMWFBXVGwyT2ZMMCs4Q1Q3WXhrb2JPdUZa?=
 =?utf-8?B?VlVXY1JkU3JUQ3pZbW9KQ1BpZ0FqdDJ4K0Z1TVpRK3Bnc3ZneGs3RHN2K1lP?=
 =?utf-8?B?aFd1bzVSWFZwVDdyTkUyZWZFUzVIWDVaaVhMaXUwdnBEdkdWU1VVTWpSWjdJ?=
 =?utf-8?B?T0xNOTVBQUp3OGZ1dnJMUjdJUHNDRTM5bzhhakNDVHJUbG1TblJtd0RGYktH?=
 =?utf-8?B?NFFWSHVTdVpKY1BqWjlnaW5TTTlnQzNPaTVEYU5tV2cxUGlDS2NQSUJ0NDBS?=
 =?utf-8?B?UC9HMC9NUXBkd0pRTlhTRTVLK0Ezb1VueGk2VmlwdktLUUVkbGxkeSsydlc3?=
 =?utf-8?B?OG82OFA0QmFIQS9qVVhOK0hSc1ZQZ0hmeGQrcXA3UXUrZjQ4SDZtNG53RCs1?=
 =?utf-8?B?MFRBTjI5cDdjV2FoSThiTzM3Tmc1OGY0a3dYbzVraEtQb3VrQjU2TXYrdjBs?=
 =?utf-8?B?ZlBGNzFxRDdpYTNxenduMTBNd091eUdtL3dNSVhSK3I4QnhhYjNaK29MOE5B?=
 =?utf-8?B?MVlVakk3RlpLcDh6bFYxRHdWbjUxZUxPd3VPSTI3UlowMk5qdVJqUitURUc4?=
 =?utf-8?B?ZnN5NDhYeW14ZmRmQlppMDlBYVQrUVllaGpmekM4U25GZnN0WE16dTRYMFlZ?=
 =?utf-8?B?NkFqbW96VVNzc1k0bVJTMnRnVTBnYytCeTJ1VU4zQ3ZrbGhTOG9JWHdjL0NW?=
 =?utf-8?B?MEJlUkYzanA2TXVFQ3dlZ3FQQjArL3FRbzZlMFNOOURNbWZ2Y1NVbkhDUEFk?=
 =?utf-8?B?eFM4NlovRVR6UEpDdHFNajdYbVV2UTJCMEZLRTl1T0oxVDdPKzRleGhJWkNO?=
 =?utf-8?B?R1B4REZXWXgzaHNmdDFkTFdicklySFBWUjRVZm5PRHVTcE96TXg3MENLWDl4?=
 =?utf-8?B?OTUwRDdCTnBzRTJONVBNR1hMNFNPSEcvcFhaaXEvcGs5M0hEOVkxN1hCc2lE?=
 =?utf-8?B?WnBrOExUbG9LNFZZU3kxSGFhOGZzcFNIQjAxUW15ckxJY0w5WkxPcFVPdzc0?=
 =?utf-8?B?Skh3VnB5VFVYWkhsNzFPeE9nODVzNU1vS0RXR1hOR2hqMS9PYWdWOUdlejhi?=
 =?utf-8?B?c0JhN056LzhlQlMwSUp4aCsyM1p2cmVjYWlCVnRGUjFndEFPbVdWOG9Kekhk?=
 =?utf-8?B?UmZxb0YxWWVDWktBSXJ4TDJUaVdZMEg1Q1B3NXlrMDJWRFdIYzdQcjF0THNT?=
 =?utf-8?B?YlJSdDByZDB0aEJkUjdBZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTltYTJacVV3MGVaWTMyci9wSHA4aEVFYzlNVDNpbUNJQ3ZBMldLdTVUWXhj?=
 =?utf-8?B?b2FYRzZxdXFsa2t1TjZtYlYzcDZIc1hlVC9lSDNaYVZzS1FpMDNNSkw3cEh0?=
 =?utf-8?B?MFZncTVNSGZ4Y09DWGE3NkppbXNDS3pVT2JpMm9INlBxL2diOVk2QzRQNEhM?=
 =?utf-8?B?alFieXpuWGxxTnNveWpMNlRIaTFabmZEcEtsV1JjdDRpUmpyTFRvU2xOZk54?=
 =?utf-8?B?L0NvN3BlQUNMVFFrK1REa1N4c25RWUltNGh0UFVTeVFKQlBmdHVrcXZvWm9x?=
 =?utf-8?B?RmtaMExEeWsvN0VzbUpKK0YxRUN5cko0VGVRVXZkbFpnZjluZW43Z3F6bCt5?=
 =?utf-8?B?UEM2bkVkOEdHVkRCZVZwaVdYZVpRMFpMTTRVcENpS09BUVp1aFM4QStHV2xa?=
 =?utf-8?B?NXV6VjQ3a0Q5YTlsNXZ4L1hKK1oxVnc0blZTd2ZWQ1ZrRHZBZkEranJ6TzJo?=
 =?utf-8?B?c3c3bGNKWGZxNjhWL014RlMveWRSdk8rYjNNWGJaSGNKUWhhUk56RElwRU9C?=
 =?utf-8?B?WmNnbzZNRWZGMmxwWmw4UkhkWG9xOEdZbXQ5UVhTNzF4UkIwL3c5aEdtU2V6?=
 =?utf-8?B?NEhtMXI2eENOMHRxRkptT0xQM3IvS2dLaVhVdjhpT0ZxazlHS1g1ejFUaGdm?=
 =?utf-8?B?a1FEL21xSGVaTk1IMElXYWt3ZUVWemdaTlNkTnpmVGR5bDJsNWt5eVJ6UmVn?=
 =?utf-8?B?dUFFNU9lcnhHcytCWWc5NDJIcEhGUHkxMzE4SlZCeUdDWHlYVWJOb09iK1px?=
 =?utf-8?B?RlU5WkEyZDhRWVdiYVdxMWZldjhxN2EwTFdlT2dIUEhBdDlBZDJRVnpqTkZF?=
 =?utf-8?B?U1BpTXBDWHAzc3RPaFRhTGpONnpEREQrcWVLY3RqNXNzS0NXeHFZcGUwWmhH?=
 =?utf-8?B?alZUem9BMnYzSFlpbnFRdUluY0grNDdJZURPUzhGaGV6VDVyelJnZCtRTDkv?=
 =?utf-8?B?VDRuUWoyUnZxQXIvNDVRbFd3N1VBcUFyYW94VGdDTTZvSGxZbkl0VVNPME94?=
 =?utf-8?B?QnlUblZnVlhwL0phVUZmMUlqVy9BQm1PdUVtVVBabHcybGk5TEVQeVgyQVIv?=
 =?utf-8?B?b0J1d0gxa3l1aDFHYWZiWkRlWUtVVFFndUtLQ1ZMT1dyeGZ5TDhQUkozeXQx?=
 =?utf-8?B?bXVnZnc5ZjlLLzNvV3BKM0Y5YzZOcWlNSnFlOWUwTnRrOHF5c2hha0xFMlFs?=
 =?utf-8?B?L21WQXMyeFRsNG40L2oyQk83VWNwenBnZmpQZFVhT1pTcDV0RDYzcGJRbWpo?=
 =?utf-8?B?enpWM2l6Z1BabDFYdkE2RWJmbVBwWWkxY2JoaDF6Q2RxZVRXUjcycDFYM2c1?=
 =?utf-8?B?Q0k3cnYxc2IrUnNXU1ExWDBGZlBOOUZoUnZBK0M5RDRBSytFUTU0R2xKUHd2?=
 =?utf-8?B?QTN1KzVJVW0wNEhFS2tHRkFPcTdObUJqSE94L2tvOHBCcGc5a25mbU9uZzBQ?=
 =?utf-8?B?b0RIZk1lUDhGN0dZMFNOR1E5NmtrUlhMMmtJS3MxNkI0VEdzeDdTbHM1Qnd6?=
 =?utf-8?B?aUczcGFsOHBxOW5xZi8wWjdxNHQyN1BFL3BuR3dUN1ZCS1FueDlHV2JieUxm?=
 =?utf-8?B?YkpyRGZibk15NFQxVWFaTlNJeVJZUzUvTGs5MXhMWFc4ayt3elNlWHhqWFpI?=
 =?utf-8?B?WFN3eUdlQ2Q5ZGJCcklxNUszRkl3ZDVDODlnL3VwazJiOS9JSHN3em9FSU14?=
 =?utf-8?B?diswL3U1dE1NaFJYSTlBK1ZnMDgyU05wQnFDNjFod2duYkF6MzhzZDRYeE03?=
 =?utf-8?B?SHlzb2pIeTZha2MzYnlZeXl2N3ZEVlIrdUp3bmJ3aGdKZHhDRzdad1U5cmEz?=
 =?utf-8?B?V2JRcVVnT003UnNJNWZrY2lZMm04b2tIMTRSVVMxMTNlNWs5S3Fsc216dTZx?=
 =?utf-8?B?QVdJSTFZbzJTb2NCS0ZnMmJERDh6Z1Nrdldjd1Q0VWZyWkg2QmtCOVVzUjBE?=
 =?utf-8?B?NjlwbG9DanNMcEVxYkpUb2ZFRDZXMVVXNGxrMFE1eERROXFsZ3VSbCsrOUFq?=
 =?utf-8?B?cTM2cDhXendCN2hDazZnYlpMQkVBdUpSamNaTmFicXIyNXdyM2pFSkptSXQ3?=
 =?utf-8?B?WHZHbzJTWFB4MVJPYVBoQm5QYlZvSDBnZVM1L014a3pyYWJMbjNpTDVHNlBj?=
 =?utf-8?B?RVN1bTRpVkxwRHQyWGhGVjFDbi9BN3JvS0VtbURQSmxRVFl1cGwrRDEwZEts?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BC983341258FD4B93F0D4B9DE9973B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d597ea9-cce5-4769-d68f-08dce2bcc3fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 08:32:34.9012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H8+kVOGk7o6kUWrhkYgyatfmN0nkh5fZig1WKKPHsJZih7IA1ptnoguqRej59zgsddU+NFrBPfulp2CYgPTdloihc9MShkDcTEHXrWasAH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6733
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

T24gVHVlLCAyMDI0LTEwLTAxIGF0IDA2OjIwICswMDAwLCBCLCBKZWV2YW4gd3JvdGU6DQo+IExH
VE0gDQo+IA0KPiBSZXZpZXdlZC1ieTogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4NCg0K
VGhhbmsgeW91IEplZXZhbiBmb3IgeW91ciByZXZpZXcuIFRoZXNlIGFyZSBub3cgcHVzaGVkIHRv
IG1hc3Rlci4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4gSm91bmkNCj4gPiBIw7ZnYW5kZXIN
Cj4gPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI2LCAyMDI0IDEyOjM1IFBNDQo+ID4gVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IE5hbGFkYWxhLCBSYW1hbmFp
ZHUgPHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20+OyBIb2dhbmRlciwNCj4gPiBKb3VuaQ0K
PiA+IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogW1BBVENIIGktZy10
IDIvMl0gbGliL2lndF9wc3I6IEFzc2VydCBvbiBzaW5rL3NvdXJjZSBzdGF0ZQ0KPiA+IG1pc21h
dGNoDQo+ID4gDQo+ID4gQXNzZXJ0IGlmIHNpbmsgc3RhdGUgaXMgbm90IFBTUiBhY3RpdmUgd2hp
bGUgc291cmNlIHN0YXRlIGlzIFBTUg0KPiA+IGFjdGl2ZS4gVGhpcyBtYWtlcyBpdA0KPiA+IGVh
c2llciB0byBpZGVudGlmeSBmYWlsdXJlIGR1ZSB0byBzaW5rL3NvdXJjZSBtaXNtYXRjaC4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGxpYi9pZ3RfcHNyLmMgfCA0ICsrKy0NCj4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMgaW5kZXgNCj4gPiA5NjMz
ODU5NjcuLjBlYjAwMjYzMyAxMDA2NDQNCj4gPiAtLS0gYS9saWIvaWd0X3Bzci5jDQo+ID4gKysr
IGIvbGliL2lndF9wc3IuYw0KPiA+IEBAIC0xMTcsOCArMTE3LDEwIEBAIHN0YXRpYyBib29sIHBz
cl9hY3RpdmVfY2hlY2soaW50IGRlYnVnZnNfZmQsDQo+ID4gZW51bQ0KPiA+IHBzcl9tb2RlIG1v
ZGUsIGlndF9vdXRwdXRfdCAqbw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBhY3RpdmUgPSBzdHJzdHIo
YnVmLCBzdGF0ZSk7DQo+ID4gDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGVudiA9IGdldGVudigiSUdU
X1BBTkVMX1JFUExBWV9JR05PUkVfU0lOS19TVEFUVVMiKTsNCj4gPiAtwqDCoMKgwqDCoMKgwqBp
ZiAoYWN0aXZlICYmIG91dHB1dCAmJiAoIWVudiB8fCAhYXRvaShlbnYpKSkNCj4gPiArwqDCoMKg
wqDCoMKgwqBpZiAoYWN0aXZlICYmIG91dHB1dCAmJiAoIWVudiB8fCAhYXRvaShlbnYpKSkgew0K
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWN0aXZlID0gcHNyX2FjdGl2ZV9z
aW5rX2NoZWNrKGRlYnVnZnNfZmQsIG91dHB1dCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlndF9hc3NlcnRfZihhY3RpdmUsICJQU1Igc2luay9zb3VyY2Ugc3RhdGUNCj4g
PiBtaXNtYXRjaFxuIik7DQo+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+IA0KPiA+IMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gYWN0aXZlOw0KPiA+IMKgfQ0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+IA0K
DQo=

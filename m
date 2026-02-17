Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3231FE909A9
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 14:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E5B10E4D9;
	Tue, 17 Feb 2026 14:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4s/P5W7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF72A10E4D9
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771337188; x=1802873188;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7nfWjFCuiiLUmhp8a9UhPkbFUQEkszlbbp13kQr3jOI=;
 b=c4s/P5W7NEI89IyxGABgJVIkZnWkmNElu5PGf/K/Llq6X7tjhtEeyvOC
 QlHlN3vSuL1EJpyIfhrjTol00lqQK/bUph36xGKv4oFU3piL8oJzk7MH3
 qmHwDOP/pE0EujH5bcszeS3depQU+KRhF9QVAYKLW8riyTF+oCvnk2/5w
 8vrgeBlEF2wnBMXv7rEp7+pZnoHb66RH3PrMFCcKSOCrIdN81TMtt/OBZ
 yWJ9aBvAZxtQ9ru3rxN33khYyXe+5SiJD/XiNrKhyV7l66e74F582kRe2
 yFchHkB7BG7byzppLbMp71xIs0c1VSxhaEv0xxWk9YY8PMG+3AvSOFzLO A==;
X-CSE-ConnectionGUID: J2oFoyEgS92iZKHRX06tGQ==
X-CSE-MsgGUID: rYrvwCi0RpqAVKdY32CPnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89816311"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="89816311"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 06:06:28 -0800
X-CSE-ConnectionGUID: 2+ixLpiIQ1mV1sQluz0B2g==
X-CSE-MsgGUID: ha9OtfUsRGuCQOUtNXQcgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="213130709"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 06:06:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 06:06:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 06:06:26 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 06:06:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFBwfMwkTsENGkU2nuIcUWsuJZl4J1nesJ/uorN0AFGUokVCQ8oqWP0ebJo9f/0JyBSampU88WMTga8ox4c0uWDUozdWwQ0AK/ouIHKzo3rjudNZILbSfyfQjaA0V7nNT9XllpOUV2b4MvjvUQoxHKCHJxG/fsJ+uZh8iaMsmwAC6cjgd5dDTbBSFAYpPZy2RLVm/qTQTfkn4ykdZYh2pBpFCdwlz5AfFN3ZfHct2hzSBbCqamJufOMxGTJe+z5yIHFiFpm0SpcfkC4d/A83sccSAQaZ97hsq+6n+WozMQql7zDUwifRmu0sFH0Fpiccf6Yerl2Ouq0PKKIhvIUmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nfWjFCuiiLUmhp8a9UhPkbFUQEkszlbbp13kQr3jOI=;
 b=M8G5fPZdH4gR3Xxa8i1oehA9P7mf5rd1M18Drj+GqTBLX504QTi0F8iAJ+ub5qtMT8FoTdvbV1ncKmHIP3qFzFVhgiWCTVIgyXIdxqtvIipH1iWOwnF6wkNUTy8YLaBl4/dYq7PGrOPAolo0AiGR3U3iwc7JrCRqfS6Q8QtHEblMxA7fSAe/59Sc0TYdIYVq1MOXtOJ3BQtioOSPqJDKV5mRxYDOvCb7L6xcoGqDbKwlyEaMjdr9Gx1XHfoc8K9uXxkrDXTfS0cj1Fp96B2f5qhn+KXun9pAMH3WtbRSf4Df+p+LfhQO//ylO2CuFIakrmkkiXAjV6IJxsrgpTKP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Tue, 17 Feb 2026 14:06:23 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 14:06:23 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Thomas, 
 Sobin" <sobin.thomas@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: =?utf-8?B?UmU6IFtQQVRDSCBpLWctdCAwLzJdIHRlc3QvaW50ZWwveGVfdm06IEFkZCBv?=
 =?utf-8?B?dmVyY29tbWl0IGFuZCBub+KAkW92ZXJjb21taXQgaGFuZGxpbmcgdGVzdHM=?=
Thread-Topic: =?utf-8?B?W1BBVENIIGktZy10IDAvMl0gdGVzdC9pbnRlbC94ZV92bTogQWRkIG92ZXJj?=
 =?utf-8?B?b21taXQgYW5kIG5v4oCRb3ZlcmNvbW1pdCBoYW5kbGluZyB0ZXN0cw==?=
Thread-Index: AQHcnFJbixPXJ0bQB0SLzSdaNeAjMbWG8fIAgAACmQA=
Date: Tue, 17 Feb 2026 14:06:23 +0000
Message-ID: <9bdf7a77545331f568f81c123b55953cab079da7.camel@intel.com>
References: <20260212190305.804221-1-sobin.thomas@intel.com>
 <8b1689e53c1e3b3ebe9810c86fc248a5040e52d0.camel@intel.com>
In-Reply-To: <8b1689e53c1e3b3ebe9810c86fc248a5040e52d0.camel@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|PH0PR11MB7167:EE_
x-ms-office365-filtering-correlation-id: 201aed0d-7ecd-409e-a4f4-08de6e2dbbd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?T3U1U0ZjZHo3T1lwUURMU2paT2FMQ1JIUFpuRWZpVllvM0FOeVlBUnRaRlJV?=
 =?utf-8?B?NkpvVXJ4cTg1Tm1zQk96ZGhqdzZ6L2pTcFVqRyt3a29wRjUxakttdy9uQVNR?=
 =?utf-8?B?ZUdDUzQvOTVuQU8wWGJaUEtUZTZKdzYyZW55aWNkV29yeXRtamU1a1g1N1VV?=
 =?utf-8?B?aWhhVjJGSmhxcGpMSTRzSmc5T1dreGdHa3lUOVRTdkdvN2lTTExCS01ETm1F?=
 =?utf-8?B?Z2V6VXJVeFV1VHAweHJxUlg3b1dtaW41dUV3VWdUUkUwZExnTU1veHpENXVa?=
 =?utf-8?B?K1MzMWpodFBBdy9TSWE3aXBremF5dTk4L3VMQ0RCREs3V2o3bk54MXZNMWhM?=
 =?utf-8?B?Wk9EbytibUc0RStDZ0t6Ykw0Y0p2UTQzWXpzdnpKM0diQWdwQ3I1eWF6aWlF?=
 =?utf-8?B?MDJhMUtIYUFQdHRWS0dPQThSUlBWS3Y1WjNNb0VwNG5mOTkzL3BlbndtdVpo?=
 =?utf-8?B?WHNaYTZPblhrckZMRXBkY0tsaFdnN1ZsSC9XaU9KS3FYdjBWckRib04wMXpQ?=
 =?utf-8?B?YzhWNUdxRUFRWmNzUk9CcnpNdHlabS9aTzIxQ09mNm1WcDJoL3RtNTd6QjRB?=
 =?utf-8?B?ZTdGWWFaQUluMmZJNmdJaG9QNEJoQitzUi9JU1lGOWxudk4zTXNwd3dTKzA3?=
 =?utf-8?B?S0s2cEVmajJWdUJoZExxNEo4TjA1Zmo2WGhEelJtdlQwOGNWVTFZK0d6SGVZ?=
 =?utf-8?B?WlczT3M4LzNvbElLeW5tSjZKQ0JuWHU4cFZ2YXFiWDhoYzRua01GaU1JV3ZR?=
 =?utf-8?B?K2M3RExkeERvMEFuUTR5OTN5WDZJeWc4UTAwSzdFZUlLeHV0M0FNejhIWE40?=
 =?utf-8?B?ZEgzaEpNQ2ZBQW1PY3NGdHh1WDkxOWduQ1kxNDBPeVYyM0trRCtubXUwS1Jk?=
 =?utf-8?B?U0tDbzNwbVEvWk9wWEdSMFBmZitvSWEwZjhvY3JYNWtUWEZzUENxK0RsM2Z2?=
 =?utf-8?B?MGI0ODN2SllScEZ4REY2cm51MDBoUHdhN0QzUmE0U2F3b1NOSkplelpiNGI1?=
 =?utf-8?B?Nm5KRzlNSGJyTlVSTmFCdVB6OWpEaTV5bFJJWkFHOVhiM1JMSDgzeHA4OTNa?=
 =?utf-8?B?NmRJcDkwdk83clNqdVNXWE5RNGRsZEhtdURXY2VTSXNYY1J6MmpQMFd1cnQr?=
 =?utf-8?B?WWh3MUhiYUN3SGFENDdVdlc0YVEzZ3REdG53T25jVXkwMTlIMzdqd0FVOEl3?=
 =?utf-8?B?RC9ibnh6Z2hjbkdJb2d2RkprbDJTeTRyUnpwTmF5bGhPaExITFJQVmNpbkFP?=
 =?utf-8?B?ZHB1M2MzRFc4bWozdGVxdUpKd1h1ZVhPNHc3R0wzL0ZheWI0TzlmWkVyOGw4?=
 =?utf-8?B?NGZHV05iTVpOZlZMUUZPZjE2M3IxRTNzSUNrVm9vL2oyOFNVUnRuTlhLTUFE?=
 =?utf-8?B?RjdFZSsxNGFEVGtqblZqU09WUTlzRmlvcXFZbmdnQ1NGQ0JheWFtMlVtQXNk?=
 =?utf-8?B?SU1DMnArQTBJTnNKbVJSdm5TN3NBQnNHZmM3STNxeEo2VndpOTg4UmhEUjQ3?=
 =?utf-8?B?NnRTZVBaTkNHL3A1WDI1cTN4clFuOXY4YWZlZ0NISGxFSGxHa0JKcVBQRXNj?=
 =?utf-8?B?TmxOYzFKMHcrajRvbEM3YXJ3LzZ2MytVZkhUeG54dDVzQ050SE5HM2Njc0Vh?=
 =?utf-8?B?MWMwaDVxSWVTWmFlMUREWDMwTi84cGNZNTc4bnM5RUl0cTM5c2NRRDhuRVFR?=
 =?utf-8?B?UFgvdEt1QjFMaFI3blNaOGhkT3BsdEk0YVlUNjlEc1MyY2x3VGl0MkN2bkw1?=
 =?utf-8?B?MnU5ZnhNWTRVWERPcGRnZGg2cndENUFzU2R2REY2a2FRY2pwTW1Tb09mejBt?=
 =?utf-8?B?L2laT2lPcC9hYWF6VE5HeVZIMWZyc0JaY1hSbEc4MSsxNUNJd3IxV09DTXkx?=
 =?utf-8?B?ZjNsaUZ0R3ExV3NLS2FxaU15TzBqNlRtM3FNd3grQlB2VGZ0MTdCZEQwTXNq?=
 =?utf-8?B?ajRvQTlNUDQyVDUxWnd5ZUFhQ1NuSXhpclFtUjlyMjNYUEoxQlpjWWx2VU51?=
 =?utf-8?B?bkkxRjUvRWtJem9MS3MwYURnNy9YcGllY2lyTW95ZUNpUEViWnMrMnpTWWJn?=
 =?utf-8?B?RC9FRUM5RDNNamlLV25ScVVPUVNCN09NNWtRc0grelJDT1czeU5OeklWN1lZ?=
 =?utf-8?B?K2p3YThFUzRFcHJYRncwZnRWTnJVZHg4Ry9MYVlIdEw4Rk5LWjdtektyZkI0?=
 =?utf-8?Q?uodgOHVoXVUw+mcCA8rhGNM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nk5rRXZvTHpwd0R5ZGNFa1JERWRRODdTTlVZOTJGTXdCQmtXSWRKTXk0eWU1?=
 =?utf-8?B?SnIrdkpBeUpoS1JkUW5wL3VkZzNiVXhPQU5aZm95ZVFWK2FKd245ZnhQdk95?=
 =?utf-8?B?ejdPa1JFK0tIZlg5RHBzTVE5SXZoem8vdTZoRDRJSHBWV25NQy9RT2ZoeGlT?=
 =?utf-8?B?cWYrL3pDWWFOZWkzTXAwSjFQR3hRU2xWa1RPNlNHQWxWWlZaQVJkV05kRWc1?=
 =?utf-8?B?ZW5GTTkrSFptbDhlRHdVb3VFYlkzUk5wN0hjc0tPYlNZbXQzSHFoVDhDdGNt?=
 =?utf-8?B?REVqK042am9OaFZiUSt0V2xZMXgzdEpmdkRhclFCMmpwNFRLWVIwNTFMQTJ6?=
 =?utf-8?B?TVJDNkdFd3JMRWY1Y0I0SW1KdVlIS2hBTlhIaGFlZkg3ZHN2N1NTWnF2aWYy?=
 =?utf-8?B?MzAyTFBHZFEwVTRSM3B0S0QwS2NycHhKS0dFSGU5Q3YxYzRFMU9TRzFSUFZ3?=
 =?utf-8?B?NC9NVm5aenZVSFZSdDU3MkUrT3JBblBXTEpsVE8yVUc2bDFCMTdkdnd0a0F6?=
 =?utf-8?B?c2NFK3JOR1pENEpSajFhMVM2b2R0ZHVMU3B1b1QrZmc5eHMvb1JjckJHV1cw?=
 =?utf-8?B?ZFJ4U2dlUThHZWxtMHdJejkrc2thQjZJSlNPaVQ1WFRqZU95dExxbkE3bUFB?=
 =?utf-8?B?eGEyYWFWbjY0ek13aHVWa1oycG9Jdk9xdDNSQ2RMbFlMZDZBNHZISHQ5eU8y?=
 =?utf-8?B?dGdxNk9EajZxR2pNblpLL2lnM1ZOTGthNS8wbWFOVmlNbEN1a1pYRGQ4aVY0?=
 =?utf-8?B?eG5SQjUzVVZkZzNuZFFReTBUVXZJcWViM2FQRlpHVzFyVVJOZ1dkK3pUV1RF?=
 =?utf-8?B?MzRiQzBTOHlNMjdPQVhwdTJyYUpNb1pnOW9GSHMvdDJDbFNRTnROOUNPWkhT?=
 =?utf-8?B?Sk4xendsZ3F6ZzdGcW0ybG5lRDN3OVA3SmFpU3dHSEdBYTB0WGNOY3VLT0lN?=
 =?utf-8?B?YnpVTVc1T0xCYVJCNjJTWTRFZ0hIWXcxYVZqLy81Y09oVThBRHd1K09SVDNG?=
 =?utf-8?B?ZlJMeDNDMUpCM0dhZExpV0VOZnMzZ3F3bm1MZVU4NEF5cXZtcUNTelNyS2Vk?=
 =?utf-8?B?bGtWT1FMMDVrc0lKWlM3bDBEWWtUc05scVNaWDloRDlqbm1NR1RqUHl2MDlN?=
 =?utf-8?B?dTBHemROaTNXTG03WFhkLytLTVl5WGNrTUVzV0JzOEVZT2QrQXlhREp5UWlv?=
 =?utf-8?B?QysxTUNSY3N2MHhSY29ueFFCbk01M1FQSVgxOWhXbUZMckNrUHZGK3lDdUQw?=
 =?utf-8?B?b29BWVFWRWNJaisyN01iVjVlMitUV1dxM05QVmJUOWp1ZTZuaDF0eWEyNUZp?=
 =?utf-8?B?clFacGZUNE5EMFpmNldsUys4UkVhNitSSld2RmVYNVg3TWdyUm1ZWTJiWGFE?=
 =?utf-8?B?c0tnbmQ4VlAzbFJocjVWdVJheVhMcXh2Mi9hcVlsdGYzNUJRbmwxTGVnWjdY?=
 =?utf-8?B?SWZleHB3dis5MzhrRzdQZ3NyRS9NQVZyU200UGMyeStIcWFCaTlqTWxHUER3?=
 =?utf-8?B?RUFWOWg2MkRVbC9XZzVySzBoNFZESmRyd3RWNENXWmdiMTYzYWpBU3JqcEVt?=
 =?utf-8?B?L1BKam1icmZINnArNXVEdForaXg4b2hOeE83NVdSUXBtRUhKTXc0eDFPa2k1?=
 =?utf-8?B?ZE5tNXA4Z1NMMGljNS9rNzQwTDBLSGVhTENNOWticXVBNzF1SGtyUlF2L3E4?=
 =?utf-8?B?ZFRzSWFnT2NVK04rQUpkeUhoeWpZNWpjR2Q1VmIwUDRFZmVFZWNlZS9rT0xY?=
 =?utf-8?B?dFQyOUgxSmNIZE9Rc3RIcDA2S01wQVc3WW1wVU1GMEUya0tRR1Zqa0I3eWxx?=
 =?utf-8?B?eGRvSmJ5dEt3czJaOFltdnM2eDdxVGZRRXF5MGJKYWRLSWxpalg5TWIwQkd0?=
 =?utf-8?B?NDc5dXdocVBwQUFIYXJlSGExb0RRejFWOG5HR2dHK29PUjZDSUo1Ri9QRlpk?=
 =?utf-8?B?UTJ3SHVtTUgwSTRnS3FCV0NObVpiVk1KbWpnMG9jL0V6c21YbnNYSUFZZ1dK?=
 =?utf-8?B?aHZSdFdrSzFwVjVxTHRVSDJ5Y2txVXpSTVg5K2dWNFBWNWtTd25RNUw0cWVv?=
 =?utf-8?B?dmVET2JIOXBoOHY1Q214MUVDN3o4elZRUVhUdUVmaTBpV2owY3owZnhQUTFS?=
 =?utf-8?B?UGZ0QmZtc0R5RGJmeEhRcWxKNzBWem82bitWTHBDZ1VVY2JFMkFlZGdoN1Zy?=
 =?utf-8?B?MlBXSGxQL2V1dENCVmpRY1dYSk1Hd0ZVUVJiVlAyYzdmdER0c1RPRFgrLzJl?=
 =?utf-8?B?R202TzRLdXdMd01IRkJOSCs5UEUxN1NDbnFWd0tGQWtwRUc3bEp0MnJpM3h1?=
 =?utf-8?B?dHkvdWg2NzVhZzA5VUhrRVQ5d05FL0ZrY1NtcUE5eTdLUU9neXNOSFZKU09H?=
 =?utf-8?Q?8CZ1jF0jM6ExoDRaNrubmIawcCpN2y3uqrDq3ocfQjomK?=
x-ms-exchange-antispam-messagedata-1: mSlMnDb8P8YUgw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B250BC4EB63D054CB43140E825D96F05@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201aed0d-7ecd-409e-a4f4-08de6e2dbbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 14:06:23.6744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JsX2pqJwTrgVYGkqa3aU7VLZV4QDTc/84XWpE0KiOgTKpJ5gzMRk/JgzTEpOQCGHZTxoIzPAcnStyQtUtXTqDVya4ynio/PpI/Ecyw67GyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
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

T24gVHVlLCAyMDI2LTAyLTE3IGF0IDE0OjU3ICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gSGksIFRob21hcywNCj4gDQo+IE9uIFRodSwgMjAyNi0wMi0xMiBhdCAxOTowMyArMDAw
MCwgU29iaW4gVGhvbWFzIHdyb3RlOg0KPiA+IFRoaXMgc2VyaWVzIGFkZHMgY292ZXJhZ2UgdG8g
eGVfdm0gdGVzdCBieSBhZGRpbmcgb3ZlciBjb21taXQgdGVzdA0KPiA+IGluDQo+ID4gZmF1bHQg
bW9kZSBhbmQNCj4gPiBub24gZmF1bHQgbW9kZS4NCj4gPiBBbHNvIGFkZGVkIHN1cHBvcnQgdG8g
dGVzdCB0aGUgbm8gb3ZlcmNvbW1pdCBmbGFnDQo+ID4gKERSTV9YRV9WTV9DUkVBVEVfTk9fVk1f
T1ZFUkNPTU1JVCkNCj4gPiANCj4gPiBTb2JpbiBUaG9tYXMgKDIpOg0KPiA+IMKgIHRlc3RzL2lu
dGVsL3hlX3ZtOiBvdmVyY29tbWl0IHRlc3RzIGZvciBmYXVsdC1tb2RlIGFuZCBub24tZmF1bHQt
DQo+ID4gbW9kZQ0KPiA+IMKgwqDCoCBWTXMNCj4gPiDCoCB0ZXN0L2ludGVsL3hlX3ZtOiBUZXN0
IHRvIGNoZWNrIG5vIG92ZXJjb21taXQgZmxhZyBpbiBmYXVsdCBtb2RlDQo+ID4gDQo+ID4gwqBp
bmNsdWRlL2RybS11YXBpL3hlX2RybS5oIHzCoMKgIDEgKw0KPiA+IMKgdGVzdHMvaW50ZWwveGVf
dm0uY8KgwqDCoMKgwqDCoCB8IDYzNA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDYzMCBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQ0KPiANCj4gSSB3b25kZXIsIGlzIGl0IHBvc3NpYmxlIHRvIGNyZWF0ZSBhIHNp
bmdsZSB0ZXN0IGZvciB0aGUgZGlmZmVyZW50DQo+IG1vZGVzIGFuZCBzZWxlY3QgdGhlIGRpZmZl
cmVudCBtb2RlcyB3aXRoIGZsYWdzPyBUaGUgZm9sbG93aW5nIHNob3VsZA0KPiBob2xkIGZvciBi
b3MgaW4gVlJBTToNCj4gDQo+IDEuIERSTV9YRV9WTV9DUkVBVEVfRkxBR19MUl9NT0RFOg0KPiBh
KSBJZiBib3MgYXJlIGNyZWF0ZWQgaW4gVlJBTSBvbmx5IGFuZCBlaXRoZXIgbG9jYWwgdG8gdGhl
IFZNIG9yDQo+IGNyZWF0ZWQgd2l0aCB0aGUgZmxhZyBEUk1fWEVfR0VNX0NSRUFURV9GTEFHX0RF
RkVSX0JBQ0tJTkcsIHRoZW4NCj4gb3ZlcmNvbW1pdCBpcyBub3QgYWxsb3dlZC4gQ29tcHV0ZSBp
cyByZWx5aW5nIG9uIHRoaXMgYW5kIHRoaXMgaXMNCj4gd2hhdA0KPiAidGVzdF9vb20iIHRlc3Rz
Lg0KPiBiKSBJZiBib3MgYXJlIGNyZWF0ZWQgZXh0ZXJuYWwgYW5kIHdpdGhvdXQgdGhlIGZsYWcN
Cj4gRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19ERUZFUl9CQUNLSU5HLCBvdmVyY29tbWl0IGlzIGFs
bG93ZWQgYnV0IHdpbGwNCj4gZXJyb3Igb24gZmlyc3QgZXhlYy4NCj4gDQo+IDIuIERSTV9YRV9W
TV9DUkVBVEVfRkxBR19MUl9NT0RFIHwgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREU6
DQo+IE92ZXJjb21taXQgaXMgYWx3YXlzIGFsbG93ZWQuIFNob3VsZCBub3QgZXJyb3Igb24gZXhl
Yy4NCj4gDQo+IDMuICFEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERToNCj4gT3ZlcmNvbW1p
dCBpcyBhbHdheXMgYWxsb3dlZC4gU2hvdWxkIGVycm9yIG9uIGV4ZWMgaWYgb3ZlcmNvbW1pdGVk
Lg0KPiANCj4gNC4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUgfCBEUk1fWEVfVk1fQ1JF
QVRFX0ZMQUdfRkFVTFRfTU9ERToNCj4gwqDCoCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTk9fVk1f
T1ZFUkNPTU1JVC4NCj4gU2hvdWxkIGJlaGF2ZSBqdXN0IGxpa2UgMS4pDQoNCkV4Y2VwdCBpdCBz
aG91bGQgbm90IGZhaWwgb24gZmlyc3QgZXhlYy4NCg0KPiANCj4gU28gaXQgc2hvdWxkIGJlIHBv
c3NpYmxlIHRvIGNyZWF0ZSBhbiBhcnJheSB3aXRoIFZNIGNyZWF0ZSBmbGFncywgYm8NCj4gY3Jl
YXRlIG1vZGUgYW5kIGV4cGVjdGVkIHJlc3VsdHMgYW5kIHVzZSBhIHNpbmdsZSB0ZXN0Pw0KPiAN
Cj4gRm9yIGJvcyBpbiBzeXN0ZW0gbWVtb3J5IHRoZSBhYm92ZSBzaG91bGQgYWxzbyBob2xkIGJ1
dCB3aXRoIHRoZQ0KPiBhZGRpdGlvbmFsIHByb2JsZW0gdGhhdCBpdCBpcyBsaWtlbHkgdGhhdCB0
aGUgb29tIGtpbGxlciBpcyBoaXQuIEluDQo+IHBhcnRpY3VsYXIgd2l0aCBzeXN0ZW1zIHdpdGhv
dXQgc3dhcC4NCj4gDQo+IFRoYW5rcywNCj4gVGhvbWFzDQo+IA0KPiANCg==

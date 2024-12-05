Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6A9E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2110410E3AA;
	Thu,  5 Dec 2024 10:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4QbALb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182AD10E3AA
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733394158; x=1764930158;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=t+F0kvKqt1ecAe60Obj6mr7bliL1dRvMcyaDwmeHR8g=;
 b=E4QbALb6UhStUsKLIAb2KG79OTj7Ga+pWFag1C2Kp+7EuTggdw38Mudm
 /t2feCW2+AseBfpW8evzpLB8k4NOt0Z4aOcHh8EcXmBxLJQIeSeIwqH5i
 TPVNxi+qJ7TiSMqSEE6fhU45LPvy8DJa1AWTtRZ63M+Bk4w+S7r/M3bHt
 4YP2biEhwai8dcj5gn14TokL0+UR+sNRpVwIGLkruYyHRsMoExRdcot0l
 m7kDLzhq6cjydTQWu309S269euz8hK5R+gAA6+FSmOVrQONy+mHtDC7dS
 I2RJYkylhxcAeI17k6AufX8iPEe2gTXXZKJh11E9yVRzDbrpb65JwRADh g==;
X-CSE-ConnectionGUID: 4EvZKLF2SBKHz4AyNWDzVA==
X-CSE-MsgGUID: nfuAQ4tYREGlSJ4dXdzgCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33031533"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33031533"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:22:38 -0800
X-CSE-ConnectionGUID: AwdTEVtAQe+5BCjX9Widgg==
X-CSE-MsgGUID: N2JkRIMKS3SyyUxmOXqoWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94525688"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 02:22:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 02:22:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 02:22:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 02:22:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlRq3Qk6auTSqNYcPhCBcvRkj6h9qunHwCFGgNaRhWmNtTqcL8DHrSATc8hiJ9jOhbs4lJPaBhZkukLzj4jwUZy9RtH9R9N6WDTTOIQUDf3ThATFs7a9LahTlgsQ2+KPjM2y4GLL2BKYBkzpZia8TV3YMdfxN4mAXF4RfPUqcnJdz8LLcqc8zwobLN9fbp4W37o6RPR7EzRE4Mgehu/vFK1SHvnLKY/8Jc0PiOpdZjoXSYkO43q8efX9brQaoZ6VroAvwM0AWIP/ji++cd6zfruog4c8D0yk3/0Pp9Wo+INTj4WJYrP+LdiYImQGv4ZGTcZOFI2OFcsYOyhIwIpj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+F0kvKqt1ecAe60Obj6mr7bliL1dRvMcyaDwmeHR8g=;
 b=M/ky9f/lcQvTw8afDiLT9A7+Zlyj5G3Yydqrgl1iV76ViZ8f8Ngu7KQFhs7WBqWDEe1VauuH3KdBTn0HkEzoSkxa7H3kJ7/6u52SD9IbWt7aOeLyRJQYwolCL4N6ykciMG58CBrXJSC2ugM6yYHB0SQXE5uGee+K9SKXGefpXxt5zD50t+omHO4gBG1VDC82m/z9l4af8uP3ybebK6x+kTRn+7kE/zi7G65KpZX3T2FMuEyBA8V1xYRj70mlcusrpzIVIyizNtgmbgg4XegOkh9QRX66JOEWfIbY3Bt+d/7hu9/zQI0Pn+1pT7tUqM9PeV39i6gaw0WxDE7suPqYrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CY8PR11MB6892.namprd11.prod.outlook.com (2603:10b6:930:5b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.15; Thu, 5 Dec 2024 10:22:34 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 10:22:34 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online: Fix
 run_online_client memory leak
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online: Fix
 run_online_client memory leak
Thread-Index: AQHbRvwaegTjp1Ntvkqzn73VFnsNjrLXbggAgAAB5uA=
Date: Thu, 5 Dec 2024 10:22:34 +0000
Message-ID: <DS0PR11MB726486F60C77E33AAE4AC8E5D9302@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241205095639.12418-1-dominik.karol.piatkowski@intel.com>
 <20241205095639.12418-2-dominik.karol.piatkowski@intel.com>
 <cf5de2cef6ac4b3ca67cd5a2bc273d2c5abc12a7.camel@intel.com>
In-Reply-To: <cf5de2cef6ac4b3ca67cd5a2bc273d2c5abc12a7.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CY8PR11MB6892:EE_
x-ms-office365-filtering-correlation-id: 4cf30b5b-5c35-41a5-d068-08dd1516bc15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MjlTWi9Vd1ZJcG8wc0thcXQ3MDNKQlByd2ZNZ3AzKzVhR3NnUmcwMjllTWJX?=
 =?utf-8?B?Z3BxSFNIYk1FVVFCKzdRZW4xSDJtUU1VdlpDNGpkQk05VFJEYWx0UTNxblhO?=
 =?utf-8?B?Y2RlU0dBcTd5VUs1MllYWnVwWDh2bzZ3L1J0RUdHUkdpTDNjYWV6NUNVNC9u?=
 =?utf-8?B?cFp2ZEN6NVIwaTlPaTZUMm5zTWVGWkVzTmxpQ0d2UjFKdVQ2RmdRVCsrek5M?=
 =?utf-8?B?NkpZR1FtcWtxWHlNZFdvcVZJWTFaN0FIamwrY2pRWjFYR21aQWI4MVNJR1Iy?=
 =?utf-8?B?QWl6OXlDRklYOHV3NTczSkkrWjJHZ3Y0QjhJNUg3SE8rWGgxdXJYN3l4Y1hp?=
 =?utf-8?B?MFdkTXV4ZUEvcjJYVWExYXFJVGtxQXJPWm9XMkZxUHJjY0xPcWF3cmFUT3Rx?=
 =?utf-8?B?bUE3dGNqMUtSbWt3THpzbHpmV0JRODRnemVPU3N4cGJ2bXk1U1FkTjNEc1R3?=
 =?utf-8?B?ZzFXblhYaVZWRUdOZzZzNmxhRW5DMTBjY29Ud05nUnNwUGNneDlzWGc5a3hU?=
 =?utf-8?B?bkVINDZFTWlZU3l3eU90SGhQWkdScllSVHR1Z0hibzVxYzJvSzBGSGlWVHJj?=
 =?utf-8?B?TGhwcE5MdUNxRkRsRjhYU0xGWUoxdXhvWEtoVnRJNGkvVzZ4VUcxZGQ5QU9w?=
 =?utf-8?B?Z1VhTTNzd1ZxelFEOGwrMllFMEpodjRsWUp1Vlg0bmN5OUdIUTEzUFJHMkl6?=
 =?utf-8?B?QmlIVFQ0czBCejRWQ2krOFR0VERDWVV2cHJROG1Ec2FTWTR6Zkxwa1g0UUZ5?=
 =?utf-8?B?a0V1UnZScmNRQUhmcVZORFhpdDl5SldnRHB3eUVsZnQ4a2hkczRtc3Fzb0lC?=
 =?utf-8?B?VkRCWS9NeGd5SFlIM0cxY0NpRXhjZXRXL1hWSEZ0V09UOWRFSUpNcm9ieTZY?=
 =?utf-8?B?QmZGd1h1cDY3ZjE5UUdPR25CeUhzTHp5Q2MrU0tnd3J4LzFteTVzemVQWVl4?=
 =?utf-8?B?Y2JzT1ZEam8zRi81M21nOUVPM0RsMWVMU0hzSWhBNWtmMDRmdGZ4cHR1bTRu?=
 =?utf-8?B?SlIrUTU2SXRRWjB6ZUhhNHh6TkIrQWdtSE56dXdTMVR0cW5VbGtxMWRiTTMx?=
 =?utf-8?B?cDFYN1VpVTlmaFNvL05vSTd3K2lOUDNsNXV3SE1SOEcxY2tqK3RLWkdvYTRJ?=
 =?utf-8?B?cVN1MCs4Mk5YN1pSL3YwamVZRUlrUFkrclZWUnJmTnRoQUh3ZWhpdGVjYkpE?=
 =?utf-8?B?MDhvaUhLcWdLczliTGZ4YzdjT1IxTldvYjlZME93NkM1ek1hQno5OW53SjNm?=
 =?utf-8?B?UEZMbG9kSXNwSmw3U0VWQTlZMTR0bUU2L2Z4VTUwMTdjSHZ2cUxsNFNndCs2?=
 =?utf-8?B?R2pNZ3RIYlpKUGJya1VOZDRrQ21mdGZWN0FRUmdFeVQvMis4c25aMzFGS3Vm?=
 =?utf-8?B?ajEzMU1LanpHbGRDMlZDeXB1ZE94UDZlYjNMV2d3b3ZoNTNUSjRrUkdJTjYv?=
 =?utf-8?B?VDduMDZxM1BILzBTSytXOG9GL2c3WTFvM1Ztc1VKeU1BaGNqR05lRW1HRXRU?=
 =?utf-8?B?bHViZU43QjcrN2lmeElyVXhpVnZETnVtRUpBc1ZzM2tqaXd6QndrdGxYdTRN?=
 =?utf-8?B?cSt3QW5IMm1zMGo3SEhGQ1FTZmdtckx6eUFUMm83bW1rRVFPNW5kZ3lGL01j?=
 =?utf-8?B?dmx6UFdGTi84b2lrOENJUkZOUDhMTHlYMnBXVG5pN3k1azhvUnAxemtNRWtw?=
 =?utf-8?B?UTF5aEtPdDJ2ck9yWFVNV0t3Q2lVNG4yQWpaTk5mSGJvOGJ2eWdLSGxYL0sw?=
 =?utf-8?B?ZFp1YTBSeGw0WjEvL056dmRzVTFLVDBzT2lmaEJtNkhCR1hkUzZ0MUJQV2ti?=
 =?utf-8?B?MWVYWnlGUi9jQ2lKWVh4RUcrbVAyeFZZYkorbGQ2T0xVS3ltUFdwTENvbGZP?=
 =?utf-8?B?cUh5NEg0Q2pHK0lnRFZJVmI0QlRtZ0FScDZIbHdRWmtrZmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3NUWXZJOGZYYkVEanNXaU1xcllBRnZZL2UrNDh6Q2hDRkl4c1hYUk1qdC9x?=
 =?utf-8?B?WTlPRHlOSERmdEs3WlQzTHJTcHpQMXQ5U2F1MjU4NG5RRFNEUGRaeTNNYVE1?=
 =?utf-8?B?aHVnWHJsRkRNeUM1V3V6bWVma0FUblkxSzh1dGRPL1paazQwNUhKT1dwbTBh?=
 =?utf-8?B?SUhzWXA1YVlsb1BlTFhlQytTbW1adEdzV2wxMEY1YzdneTV4allKbmROVmUy?=
 =?utf-8?B?QkJGYUMyR1hOZ1pUemtpS1RkSXlKZHRxdUJHSnd2OUt5NnQ1WjFtMVRWdjNN?=
 =?utf-8?B?Nkg3UzFPMjF6YUMxdEJDK3Roa1BFMDR4L3MyenlRb3FGckgxTld6OEhMVE5I?=
 =?utf-8?B?eUR1ZmVaSTMrV0NVbytucWx1ZGM3Z0tVSkM2ZEY2UE5FajFNWXhQNEIzTzRG?=
 =?utf-8?B?UUYvaUV4dlZuYjBZNHlad3JtSHN2WVJ1S2JLdy9uaTY1SlIxb1Rlcm0rV1hx?=
 =?utf-8?B?RkI1L2JnRVM3THFlcVJUdTRCZFJ6Vk9uUmVsZEhnMUxsUnJrQjd1QWRGakg0?=
 =?utf-8?B?dUwwTzZNOWdQRVE1VnAzd3RRSVRnVEdUVHNZLzNNQjNldmUweWZaYlBGQTQx?=
 =?utf-8?B?ckhTaDF4V2RxbUdkT2JlUENPVXhUZ05aM1IySVJqU1U5OGQxL0JEY2V4eWxG?=
 =?utf-8?B?cUwrN000alMwYUF2eWFCTjBUSzRzMU95ZmJ5aUJhN055T3F6KzJWdVdKSy91?=
 =?utf-8?B?b3hWbkR2L3NZN0FKRCtENVlSZEZiaWxQSHlNa1BteGtiemNJeEdXTUl2bDlS?=
 =?utf-8?B?K0pNQ3ZNV3BDb0FsekJMaDBpclBDVnVNL0RCWUJSeFVvek5VVUNHeW1BVFk3?=
 =?utf-8?B?MWg2TEFpOXdEbktwWW1RM0c5N0loeVBuNWtFQTRWTGVIUldDRmJjRE4xY0Nu?=
 =?utf-8?B?OFoxdVdoNytQd201cGVMdEdHYXlJZlUxdVZqK0VhNXF1d29EbTZmSjFaZ05t?=
 =?utf-8?B?dUEyUTE5Zk44NkZESVdwb3ZSZU9SQkFjKzE1anJOQ1ptS3NEWFpiaWQxVWhs?=
 =?utf-8?B?c2dsaDRwQy9mQjducEdrcmlURHNUL0NXZnh1NmQ4ajdZN3ovMGQxNUY3ZVNh?=
 =?utf-8?B?cGRuUjRWN3U5UEZvdjVFUUdKVGJnMnc5bXczdGE0TXBOVXdDOTZ4RFQ3a00z?=
 =?utf-8?B?S1R4THVNRTdYRXJMdkJld3lZSlJDMlpDM2t2ZkQwWnl3elJhSTMxK3ZPcG1M?=
 =?utf-8?B?dVBLbnNkMTBrRmU0Uk1hUG5HbDlCYnhXU0t5TU9BK0I1ODlNM1duWkVKWnBG?=
 =?utf-8?B?eGJmb1lMQUpDVUZPVUJkdTU5eXRkV0xsM0RzcVk1QUdHVGw4U1ZKV01wU092?=
 =?utf-8?B?UWpXcWp1VVYwa0gycjAyR0VYUkdDYXErc21qN3BpZnk2YXM2WENxelk4bkQx?=
 =?utf-8?B?U2g2RzBmeUxoNVRMWEI1NisyVERBUGVzbDRoejF1emNUVnRMUURucXg2Q01w?=
 =?utf-8?B?aG9NUEVuNFE1bThENk0zSVJBQVdncWU0SGlyUGJpemsrcUFxdnp4WXI5d094?=
 =?utf-8?B?UWxxcDBFQnpQdmtodC9uWU14Ni9sWlQwN1ArZnZKa0JCQkp4MzdTbTgwcUsx?=
 =?utf-8?B?V0wwbGtDbE8zdVN0cTdSOFhYK3JVLzVuaW56eTZ6NmdEUWNnb0EzMGFxZksr?=
 =?utf-8?B?TnBHck1IWGZOTlFBa0JycS9XQmFQR0pjMDhaWFZLRktHaWUwN2N3Q25xRm5r?=
 =?utf-8?B?WGdZODFTYllSQnl4ZXdwWXBVYVlucmp5WGJZSlprV0Z6SisrL2Q4b0JMbCs0?=
 =?utf-8?B?STdBSWZva20yeXpibTAwdFNLSWd3SWQzTXlSNlI3Yk0yRlpOa2RyOUlPOFBy?=
 =?utf-8?B?TytBWnFoNk14UGtDa3lTd1UrcSsvdDdnbUoyZU4rZElFSnV1WXRaeHFjaURW?=
 =?utf-8?B?c2RPcVlsL0g2Y3BCOXFsMXVWVHJSbHh2OWFxNkppRld0TnVpaGxiZFRhdlJz?=
 =?utf-8?B?Q3gwaEI3UjdXVTNkbFJpMjA0QzI5bDBvNGdNWXVCLyt5cjNpL0RHNklUcFM0?=
 =?utf-8?B?cWE0L2xmTE9GQmhMUEFZUzlsMVFVTk53c0FNbllTeDR1dFRhTjhRdlVFODBF?=
 =?utf-8?B?MlZwRVcrMWJuY0xVRGhVVUs5RmdQYSsxM0hlTHRwcSsrNFF1VjlRL1VkQk1D?=
 =?utf-8?B?NkRocFdxcjAvcS9ReVNnZ0h3T1dDNGkzeVk2VWtrc0JYSWV1LzVVMCtoQWZO?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf30b5b-5c35-41a5-d068-08dd1516bc15
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 10:22:34.4959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QfvpdZlmlCh46xXYHJN9/MSRKde/wdmB8aERv4dT9/La9tqwgIwNqyLYaMp2hG+Az/oN/n+jm6Atb+994fqqS7BGclmwD7IAcXjhx3E6px5S1DpnCnHapZHFy8DDM8dC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6892
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdyemVnb3J6ZWssIERvbWlu
aWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBEZWNl
bWJlciA1LCAyMDI0IDExOjExIEFNDQo+IFRvOiBQaWF0a293c2tpLCBEb21pbmlrIEthcm9sIDxk
b21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgMS8xXSB0ZXN0cy9pbnRl
bC94ZV9ldWRlYnVnX29ubGluZTogRml4DQo+IHJ1bl9vbmxpbmVfY2xpZW50IG1lbW9yeSBsZWFr
DQo+IA0KPiBPbiBUaHUsIDIwMjQtMTItMDUgYXQgMTA6NTYgKzAxMDAsIERvbWluaWsgS2Fyb2wg
UGnEhXRrb3dza2kgd3JvdGU6DQo+ID4gSW4gcnVuX29ubGluZV9jbGllbnQsIGJ1ZiBpcyBjcmVh
dGVkIGJ5IGNyZWF0ZV91Y19idWYsIHRoYXQgY2FsbHMNCj4gPiBpbnRlbF9idWZfY3JlYXRlX2Z1
bGwsIHRoYXQgY2FsbG9jcyBhbmQgaW5pdGlhbGl6ZXMgaXQuIFRoaXMgbWVtb3J5IGlzDQo+ID4g
bmV2ZXIgZnJlZWQuIEZpeCBpdCBieSBhZGRpbmcgbWlzc2luZyBmcmVlKCkuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpDQo+ID4gPGRvbWluaWsua2Fy
b2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX2V1
ZGVidWdfb25saW5lLmMgfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5j
DQo+ID4gYi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jIGluZGV4IDc1MDM1MDU1Ni4u
MWMwZjA5NGFhIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5l
LmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+ID4gQEAgLTEx
MzIsNiArMTEzMiw4IEBAIHN0YXRpYyB2b2lkIHJ1bl9vbmxpbmVfY2xpZW50KHN0cnVjdA0KPiB4
ZV9ldWRlYnVnX2NsaWVudCAqYykNCj4gPg0KPiBEUk1fWEVfREVCVUdfTUVUQURBVEFfUFJPR1JB
TV9NT0RVTEUsDQo+ID4gIAkJCQkJICAgMiAqIHNpemVvZigqbWV0YWRhdGEpKTsNCj4gPg0KPiA+
ICsJZnJlZShidWYpOw0KPiA+ICsNCj4gaW50ZWxfYnVmX2Rlc3Ryb3k/DQo+IA0KPiBSZWdhcmRz
LA0KPiBEb21pbmlrDQoNCmludGVsX2J1Zl9kZXN0cm95IGlzIGV2ZW4gYmV0dGVyLCB0aGFua3Mh
IEkgd2lsbCBzZW5kIHYyIHNvb24uDQoNClRoYW5rcywNCkRvbWluaWsgS2Fyb2wNCg0KPiA+ICAJ
eGVfZXVkZWJ1Z19jbGllbnRfY2xvc2VfZHJpdmVyKGMsIGZkKTsgIH0NCj4gPg0KDQo=

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B308D7877C
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 15:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BD410E98D;
	Thu, 21 Nov 2024 15:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ipgjiq7b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5D110E98D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732201686; x=1763737686;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=63GydAE7PThv8KY2sxyKsHf9EbQ4y7fmWnfAAvNRscc=;
 b=Ipgjiq7bzdRixXdQeBiYGP5yjv5EN1zhB6czeiw9BBZMw6pmt/0j8NAh
 uzqUpa7eApRh0nLPz8b3waGVwhFrQG9dAM3LOXZ6DTWB4hQyh4mozx7eL
 /w4JgqenICJNcWXfj7pgSLBkQam7hwQiW/2rMoIAavxZDoMBzg4UiI6TB
 Yr+mW7dT5HoTF+ouzp6jlvQg/48vBuHfSCfGWLjeW4WiAar/jdRTYcOck
 okwjRAfbuFJRhCVBPuXGfHYRzvqIH1AzXsHcfYVwEaTyP5NDVqwFISZEf
 hlB7CJpY34SQBP8OUcPJlAlXiDyMaCCUMsV77CYDJam8gcW/e2kzlIlKB w==;
X-CSE-ConnectionGUID: e3wgRwqySmSwNm35s9VfGQ==
X-CSE-MsgGUID: QoU/uei/RRKvKvJctlDVDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32066175"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32066175"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 07:08:05 -0800
X-CSE-ConnectionGUID: QKezOlgCQQCkYpsbQhuJcA==
X-CSE-MsgGUID: 9+cyo9xSSEWKZht2hv+IWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90255198"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 07:08:05 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 07:08:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 07:08:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 07:08:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKZGUF63JUTTYC2nTUJIOnTQTdprWjok8PdFGPkoJUYFE+V4t0i11sb0tYyfNbJNK/0muG7gRNnHlcFydspo3fbfBPSGmGEu3jwuvYey6Xv7J3E/hM15uOYsgDeBzMncE1iyiZXR7r+f1xfhqnOLSxGIC3N7FLQNCHPkndPyd6efXZnF9TYgip8j7BktJbT/ivbdMyjJnOXgvRs3bai9qEV5MtqvoZ+WHYVF/hsm68v/TEy2eCphHLc48VLzzmh/26h0heMDj1OXF5VD7l8HnbGdGgx7uslbZGHINazlZFrG1bLtSgJunFM49VIB2Ag5rC44ALBv5mDGcWV8lMw8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63GydAE7PThv8KY2sxyKsHf9EbQ4y7fmWnfAAvNRscc=;
 b=d6Kfz9pDJ6Bf7L8cRy15DvNlCsWjyk+e7dsw2lZQ0kVeN+XR37FESDjIX2HLa7/xWvNMobr+AJbUVsfPNhszvsxmfH1foXetfnUM3+60bPCF8xq70QQKR/39TkTBc+WhtMx0B5AXJ0wyVwZ6Ajp2OtnbChB9fuLy0QNIRL5PCTVTtRf3SKsJptOxZqCeWl4Xms+KEHHMyuj+B5Cho6eyUp7/Dfy7K7qjKMt6NxwdJ+lZfbT3i81ME5CebPZteZCOTWMV1Z+3eZ6MJrAasgy/59kUzU2dyW9EXsWUna7qWnRpuWQyzlHW/M1ljYKyNLup05O5KxeHfPbjPc4UbtEelA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by DS0PR11MB7957.namprd11.prod.outlook.com (2603:10b6:8:f8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.27; Thu, 21 Nov 2024 15:07:54 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 15:07:53 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 4/6] tests/gem_gpgpu_fill: Add command line
 switch to dump the surface
Thread-Topic: [PATCH i-g-t v4 4/6] tests/gem_gpgpu_fill: Add command line
 switch to dump the surface
Thread-Index: AQHbPBGerii5qJrdtEW7NU7qrIhdGLLB1h0A
Date: Thu, 21 Nov 2024 15:07:53 +0000
Message-ID: <44482bb81bd6844d82a35fc3f40a41331b336d7b.camel@intel.com>
References: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
 <20241121123308.98158-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241121123308.98158-5-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|DS0PR11MB7957:EE_
x-ms-office365-filtering-correlation-id: 5935c15a-a02f-45ee-06ec-08dd0a3e4606
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aHdrZjJOM2k0OHQ2a3lWZkJrY0xuMUl4VWRyU1RwUnd1MmE1eGkvME8vakNC?=
 =?utf-8?B?eGI0cW9ZQUxRVExrajc1VHB1Mi9ZYXdlaWlZWXQyQTNyZnhyNVdVTEtFU3ZI?=
 =?utf-8?B?bG9BRXE3RXErQ252bG10Nmp5Y0FGKytYaFhUN2JZNVBBYmhUWEE2U2dUVVB6?=
 =?utf-8?B?eTJWWGxzb0UrZGxnVVM4UXExQ242Wnk0WGRXemg3L1R3NVRvSEFoYnZkUVpu?=
 =?utf-8?B?WUpSTnhCcDNlYW1yY1Z0T25Ha1g0WkhkbUJWeVJ0VklxZjZNVkhWVzFvOCs2?=
 =?utf-8?B?YU5QWkV0SGpTSjRpUmZMNEFIN2o4Z0xZcXNLd0dZTVRVVjdPdE1mZFp3ZGNy?=
 =?utf-8?B?a3JjTXAyd2lnbEN2VkduYzdybng3TWxPT3lqd2NEZzJFK1RTMEIwTXNoamk1?=
 =?utf-8?B?eTdXbkpzY1NXV2ovckRUei9XQVZyL0kzRjlLYTRYSGt2Y0NQZ2VRcWZheGEr?=
 =?utf-8?B?SmwzbzdMR1lsck1GNVNqaTg4bEhDZ2w5SUM3cEhYa1pCY0IwWjRvZFYwQ29z?=
 =?utf-8?B?Y0JxczhqR252QncyUHVLU21FNnJJRWhhNzI5UUhtZmFyRmNJMHB4MXplcStn?=
 =?utf-8?B?QU1JVjZ3WEtNUzRNSEhQM2I3ajIrYXdoRFZHV2JOMThRTmJVcmU0RGFwZFor?=
 =?utf-8?B?T0xnTCt6ckgrWmtiWndUeFNNTzVEWHQwSmUxMTVhcHFYWGllTU90Rzc5Yk1S?=
 =?utf-8?B?UWt6WWNVVUdLeDczWm51eHBuTkFuN0hCM1hSYmF3NldnZmJBQmNpWkRPMjFu?=
 =?utf-8?B?SWR2ekFJZC9Oc2hNVFZJZnVwZDdwNS9acnhEc1BIT0x5TXBmK3pkRDFwM3A5?=
 =?utf-8?B?b3hoUlYwd3doR1BHN25kdnkvQ1JUamFwTnljSjFGWjgyM1JTTTJmaWtOU3NM?=
 =?utf-8?B?Szc2d3d4VHNYbkVNTTVRNTUra201M3dWeFJBOWcraWdCaWZ1L1JubXVONExh?=
 =?utf-8?B?VFQ0VVJPNnRvUEh1dmlZc2FlZ3NqdmZCU1ZibE9YVEgySXlrbzhRd1pycjNj?=
 =?utf-8?B?cCtqQk50elJsRksxT1h0TDhYR1NXcklQTWl2Z2RHendnMlJXamFldUtVSGRS?=
 =?utf-8?B?RUxKcitVSDZySVNoWDlBQUVxZ0srcnJGbnNwUGxPajZ5RGIwaHR6TnY5ZUxq?=
 =?utf-8?B?WkdjOWxWSWpFTytic1pTL3cvY0FNMDk4QnErdytuZjkvZ3Fidi9lR2NpNXZR?=
 =?utf-8?B?a29iaG5SQXVzUU5paSs5ZGpMWWozaHh2UHFsTmczNTQvTEgxc0RDRkZhdDdN?=
 =?utf-8?B?Y013UDNJZjc2MVZWbmhPUDErSjBnVUFlb1ZQalM0MW5Pamx2SThobGxXTWhs?=
 =?utf-8?B?L0U5OC9WbGZJdmxZWnA4MlNXQVdqYWtCeURzdlNsb2FySGVIc2NNQlpGMFRW?=
 =?utf-8?B?cTM5VUdlb0diS2x6LzdTcFpYWE41TjJBdlBYUWJ3Z3FieHN4dGF1d2N4cFow?=
 =?utf-8?B?NEpXWU1SbWEzUW9zd3B5dFN0M3hWV3VmdkhaaENsTDlZcStxVjQzbWF1R0J0?=
 =?utf-8?B?a2ZFcFNpMXFzTkV3M0Q3d3g1azFwbC9JcTBOb0Q1S1Q0clJYeVVUUkpRaTlm?=
 =?utf-8?B?K2Y2bG5UVmh0OVJpY3VrVFczKzR4T2xGbEF2NS9kTVg2dEVOYkw4eTJ3VTJV?=
 =?utf-8?B?ay9zVWlpU2FkMGltT1lUQy9JSkpNa0JOTEJrRHQxTU1uU29MYndBRVEyNEJC?=
 =?utf-8?B?ck5ScVhyVVVmcXdZMk8yR0hBNnhVT1lnMEpyUkJ3SnVuOEJLWjN3REovNUln?=
 =?utf-8?B?VUpoekxrN3pFVjhyM0kyZGdWNnM2YmdTWU5vTUo2WVo5R0llUDdFTldyQ3N1?=
 =?utf-8?Q?ePB9c2+ybWQlywX4AcFeVdfkwGHoYzRnJH3gI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1FFaEtVbFpUajZHbVo2K1dNU1V2ZU8wMlVCckRsWG5Ub1E2bk8zaHBUNW1r?=
 =?utf-8?B?WGRscURaS3FjZFl1elZFR2dNOFJqdnpCR0lqcC8yNXNwbldxMkhUajdJNHlS?=
 =?utf-8?B?S0VURGRzSHJvcGdxejZOeWR0eUtlMlgrVngwY0J4MFc3M2F0ZHlhZkNGR3Q4?=
 =?utf-8?B?L0hLbkRFVVBzand6UndWVnQ5aXRqK25mc3V1dzBOb0tlMzBZZXBCNU5HbEhD?=
 =?utf-8?B?cjdyaHg3OXBleG0yNVdnLzRuZlNScDE1eWtFY2lLSXltYUtXYTJ3bFlVZ1Zr?=
 =?utf-8?B?d0pwTnlxR1pUNzBVS3p1U0tGc0FPeitqTDdsUk5jRVdGazVCaGQ0bzRVRkI0?=
 =?utf-8?B?YkxTb2c0VGhTRlBSQytEcWVlNW5WWVNUcy9WcTZDd1A3cExWM3BBU1Z6N0RO?=
 =?utf-8?B?ME1yUGduVmNVK0QvNzhSRnFPMlpwNC9vRW1wYlZtRUMvRlJDQzhIUGQyWVRO?=
 =?utf-8?B?Sm5tV3hLUklFZWZKU2R0NXhDUy83SU9razFFVzlpMlVzamxSdTRWK0FzaWpn?=
 =?utf-8?B?QkxZVnhnUTIrRDZIa3hkR2krQUpRSFBsaEd4SWFzeXh4aitESHRsY2FKWlVC?=
 =?utf-8?B?RjJQWmlOdEd3S0hteVVoRXdoNEhJVWU5WTJqMEVyQXRvQ0VING5ZWGp3cnBL?=
 =?utf-8?B?bVRKeWlpWXBLTHhTbUY1c2YzS24rNU1DZXFXUElmNXJXSU5tZzhGOUl3bVpw?=
 =?utf-8?B?OEFoVDdjaGpNZXFpOFJrcElwTFNLNlVWaTh1UkRuS1kyaXA5OEdVZU5GdTdE?=
 =?utf-8?B?QmtZaXFwN2VqclRYUkJjT0t3TjdlTDJaUDVVUkxXVHZyOUxwOXhNMTlzZWZ1?=
 =?utf-8?B?SThYUnFrZmRyMEcrRlNMcjgrTnQ1SDYyL0hLWVhpYm5oSHFvUEYzVWlmejdr?=
 =?utf-8?B?VlNKak1FYXZhSTRMdXRqbW84OW9CbHlXU0RhR0FyVk9SVyt4VWNVUFVqcEYx?=
 =?utf-8?B?WHdRK2pEbXZ0eDRZQVJyTW5ZMjY1dHRSV2k5WUYvMVZhUm1SdWRzUEhyMXdN?=
 =?utf-8?B?MVYzdjhtWTd0SFJJMEorQUYwZytmQUx2TVJnYlA4cDQ1RVArRlJEUkhGZCt0?=
 =?utf-8?B?L3dIUjcrcmxHbHEvZzRRUVp4TlpNUGVCc25PbjlKbmJoR25sbUdjazR2bkNh?=
 =?utf-8?B?NitZNHFhamtZRVZhNDQ5ZloyWGtEWVlLdVZrUTh5RGtBNi94aE40RE9Vak92?=
 =?utf-8?B?dDdiZW54MSszN2RUWGRDTFBSa2tXb0FBUEZETnhkb3h5dVMzRXJFU0taM2VD?=
 =?utf-8?B?a3RRdVRLMkxaQTlSWU9QblBmZ3MvNUFGYUR5R2czSHhFWm0rYzVoL0NmK1Nl?=
 =?utf-8?B?cjF5UE1NWmYyci9odiswc3hwU3RUb3M2ZFZzT09mc2VkVURZcGk3OEFBdUhq?=
 =?utf-8?B?NGxpUmRCMDc5SlcrdzdmZzhtSkZkc0MyWE5LdVpwSzBOcWp0Zm4rU3QxUnV3?=
 =?utf-8?B?SS84d1l0OTVxTHZNRno4L2w3UUMyOFIzTWJNUFE4T0FVT0Z3UktoY0g1Q0dQ?=
 =?utf-8?B?K05hNlZPRUV4UGxnNDRZUXZRejRFREpGTnppMFFrbGdtYlZwdHdHdVZPaEF2?=
 =?utf-8?B?WjBDdGkwYTZWWStZREtmR3RDdDdCOGpUaXhGamtaUlJKL0dNc0d0YkZuOUxI?=
 =?utf-8?B?bkE5K3FtbmFvVnpqQTgrTXVuamM5UTVuMUc0bW45TkZJT2libzlqNTBDOFAw?=
 =?utf-8?B?RWVGSFd1V3BwSzZVVC9LenJEUCtGU3BBdkNOeklBU2llMVc2bVpvWWdDMU9Z?=
 =?utf-8?B?SDhhQmwzN3orbk9uc3Y1aFlIbUdiZmZRQUpqcVpUT1RtVFNiMUQ3eGt1VCs1?=
 =?utf-8?B?aHdLNlc5dTI1K0wxV3pUK0pHV1hYOUJQcEdzelJNS3MwcUljZmJtUzFlY1RX?=
 =?utf-8?B?OGRHU3hxYmtraWFKY093RmhXNTVSWUlXWkdWZDhSdXFHdHJOT3VJaVp2WFNC?=
 =?utf-8?B?U3BvM3NsODlBdDJPdGZjS3NJOTE5eUozOVJiSXpHeTZTbnp0aHFCR1hXdXdz?=
 =?utf-8?B?SGdSTHNLSXA0YWRpOGsrRXQyOWxJQzAzbkc4Vktjc1YxUTBmd08zWVZxcVFQ?=
 =?utf-8?B?UUlCdjJHRU1wMXFzOGhoa2I3ZnlmWEJHSElKeG1sbjNHSEhJL0N2Q3lsVFpk?=
 =?utf-8?B?SnNydi9yQll6b1oxcWJlNFkwOE9PdWVyWkVpMTdEblFkVERxMkVCQU9EQkpu?=
 =?utf-8?Q?JMsaUR0+7YBNcubbDipchz0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40423F105CDAB84E90C5FB8D19EA1401@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5935c15a-a02f-45ee-06ec-08dd0a3e4606
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 15:07:53.5084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JO7LSMnf27/+3P1Ks0hEHSG/yYCBHI/QOiCQ4UWbimERYuE+IOracVQGA3pWYFulDfsr1cdwCwEhtEOFYGpWfRPQuilJXtyrAO43lyPTSNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7957
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

T24gVGh1LCAyMDI0LTExLTIxIGF0IDEzOjMzICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IFdoZW4gaW1wbGVtZW50YXRpb24gZm9yIG5ldyBwbGF0Zm9ybSBpcyBhZGRlZCBh
bmQgc2hhZGVyICsgcGlwZWxpbmUNCj4gbmVlZHMgdG8gYmUgYWRvcHRlZCB0aGVyZSdzIHVzZWZ1
bCB0byBkdW1wIHRoZSBzdXJmYWNlIGRhdGEuDQo+IA0KPiAweEM0IHBhdHRlcm4gbWFrZXMgZGlz
dGluY3Rpb24gZnJvbSAweDRDIHdyaXR0ZW4gYnkgdGhlIHNoYWRlciB2ZXJ5DQo+IGhhcmQgc28g
Y2hhbmdlIGl0IHRvIDB4ODggbWFrZXMgZHVtcCBtb3JlIGNsZWFyLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+DQo+IENjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5j
b20+DQoNClNhbWUgYXMgcGF0Y2ggZm9yIHhlX2dwZ3B1X2ZpbGwsIGl0IGlzOg0KUmV2aWV3ZWQt
Ynk6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4NCj4g
LS0tDQo+ICB0ZXN0cy9pbnRlbC9nZW1fZ3BncHVfZmlsbC5jIHwgNDMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9nZW1fZ3Bn
cHVfZmlsbC5jIGIvdGVzdHMvaW50ZWwvZ2VtX2dwZ3B1X2ZpbGwuYw0KPiBpbmRleCBhYTczNWU1
Mzk1Li4zNmM2MGU3NWYwIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9nZW1fZ3BncHVfZmls
bC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2dlbV9ncGdwdV9maWxsLmMNCj4gQEAgLTY0LDkgKzY0
LDExIEBADQo+ICAjZGVmaW5lIEhFSUdIVCA2NA0KPiAgI2RlZmluZSBTVFJJREUgKFdJRFRIKQ0K
PiAgI2RlZmluZSBTSVpFIChIRUlHSFQqU1RSSURFKQ0KPiAtI2RlZmluZSBDT0xPUl9DNAkweGM0
DQo+ICsjZGVmaW5lIENPTE9SXzg4CTB4ODgNCj4gICNkZWZpbmUgQ09MT1JfNEMJMHg0Yw0KPiAg
DQo+ICtzdGF0aWMgYm9vbCBkdW1wX3N1cmZhY2U7DQo+ICsNCj4gIHR5cGVkZWYgc3RydWN0IHsN
Cj4gIAlpbnQgZHJtX2ZkOw0KPiAgCXVpbnQzMl90IGRldmlkOw0KPiBAQCAtMTE3LDI3ICsxMTks
NTggQEAgc3RhdGljIHZvaWQgZ3BncHVfZmlsbChkYXRhX3QgKmRhdGEsIGlndF9maWxsZnVuY190
IGZpbGwsIHVpbnQzMl90IHJlZ2lvbikNCj4gIAl1aW50OF90ICpwdHI7DQo+ICAJaW50IGksIGo7
DQo+ICANCj4gLQlidWYgPSBjcmVhdGVfYnVmKGRhdGEsIFdJRFRILCBIRUlHSFQsIENPTE9SX0M0
LCByZWdpb24pOw0KPiArCWJ1ZiA9IGNyZWF0ZV9idWYoZGF0YSwgV0lEVEgsIEhFSUdIVCwgQ09M
T1JfODgsIHJlZ2lvbik7DQo+ICAJcHRyID0gZ2VtX21tYXBfX2RldmljZV9jb2hlcmVudChkYXRh
LT5kcm1fZmQsIGJ1Zi0+aGFuZGxlLCAwLA0KPiAgCQkJCQlidWYtPnN1cmZhY2VbMF0uc2l6ZSwg
UFJPVF9SRUFEKTsNCj4gIA0KPiAgCWZvciAoaSA9IDA7IGkgPCBXSURUSDsgaSsrKQ0KPiAgCQlm
b3IgKGogPSAwOyBqIDwgSEVJR0hUOyBqKyspDQo+IC0JCQlidWZfY2hlY2socHRyLCBpLCBqLCBD
T0xPUl9DNCk7DQo+ICsJCQlidWZfY2hlY2socHRyLCBpLCBqLCBDT0xPUl84OCk7DQo+ICANCj4g
IAlmaWxsKGRhdGEtPmRybV9mZCwgYnVmLCAwLCAwLCBXSURUSCAvIDIsIEhFSUdIVCAvIDIsIENP
TE9SXzRDKTsNCj4gIA0KPiArCWlmIChkdW1wX3N1cmZhY2UpIHsNCj4gKwkJZm9yIChqID0gMDsg
aiA8IEhFSUdIVDsgaisrKSB7DQo+ICsJCQlpZ3RfaW5mbygiWyUwNHhdICIsIGopOw0KPiArCQkJ
Zm9yIChpID0gMDsgaSA8IFdJRFRIOyBpKyspIHsNCj4gKwkJCQlpZ3RfaW5mbygiJTAyeCIsIHB0
cltqICogSEVJR0hUICsgaV0pOw0KPiArCQkJCWlmIChpICUgNCA9PSAzKQ0KPiArCQkJCQlpZ3Rf
aW5mbygiICIpOw0KPiArCQkJfQ0KPiArCQkJaWd0X2luZm8oIlxuIik7DQo+ICsJCX0NCj4gKwl9
DQo+ICsNCj4gIAlmb3IgKGkgPSAwOyBpIDwgV0lEVEg7IGkrKykNCj4gIAkJZm9yIChqID0gMDsg
aiA8IEhFSUdIVDsgaisrKQ0KPiAgCQkJaWYgKGkgPCBXSURUSCAvIDIgJiYgaiA8IEhFSUdIVCAv
IDIpDQo+ICAJCQkJYnVmX2NoZWNrKHB0ciwgaSwgaiwgQ09MT1JfNEMpOw0KPiAgCQkJZWxzZQ0K
PiAtCQkJCWJ1Zl9jaGVjayhwdHIsIGksIGosIENPTE9SX0M0KTsNCj4gKwkJCQlidWZfY2hlY2so
cHRyLCBpLCBqLCBDT0xPUl84OCk7DQo+ICANCj4gIAltdW5tYXAocHRyLCBidWYtPnN1cmZhY2Vb
MF0uc2l6ZSk7DQo+ICB9DQo+ICANCj4gLWlndF9tYWluDQo+ICtzdGF0aWMgaW50IG9wdF9oYW5k
bGVyKGludCBvcHQsIGludCBvcHRfaW5kZXgsIHZvaWQgKmRhdGEpDQo+ICt7DQo+ICsJc3dpdGNo
IChvcHQpIHsNCj4gKwljYXNlICdkJzoNCj4gKwkJZHVtcF9zdXJmYWNlID0gdHJ1ZTsNCj4gKwkJ
YnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJcmV0dXJuIElHVF9PUFRfSEFORExFUl9FUlJPUjsN
Cj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gSUdUX09QVF9IQU5ETEVSX1NVQ0NFU1M7DQo+ICt9DQo+
ICsNCj4gKw0KPiArY29uc3QgY2hhciAqaGVscF9zdHIgPQ0KPiArCSIgIC1kXHREdW1wIHN1cmZh
Y2VcbiINCj4gKwk7DQo+ICsNCj4gKw0KPiAraWd0X21haW5fYXJncygiZCIsIE5VTEwsIGhlbHBf
c3RyLCBvcHRfaGFuZGxlciwgTlVMTCkNCj4gIHsNCj4gIAlkYXRhX3QgZGF0YSA9IHswLCB9Ow0K
PiAgCWlndF9maWxsZnVuY190IGZpbGxfZm4gPSBOVUxMOw0KDQo=

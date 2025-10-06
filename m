Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9365FCCA471
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 07:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4352510E326;
	Mon,  6 Oct 2025 07:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYQzclCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FBE10E326
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759737465; x=1791273465;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+3bzTqwHXX+t6qaZ/afZ6h9TfQC5/Bd+I20S2wJBw0M=;
 b=UYQzclCzP7fL4xNzWMxsG9rk/dT0JZFGDicGo6NDcftzavytGULP1GGA
 e0eeObIfplEY3/2CtQtsjVSWJyUisKPo9SgtmrRDr+7JzlWyOZqHfF1j4
 4N2BYYyClAHcFWZJNplZABE4sTppjIg+JNjFMnkiXek9siUkM5gR02lN8
 j92jeZGq7ywuP/MrY9tvq9F7UiIQLUQnuLRnhqkt3Qv1oK+COKUrM+6zD
 fe4IhzcG9Y3yeXqIMQWEWTj1m+NcYL6Pbnnxq9nla2H342ilQVBT3Q6lu
 suMsEcl9Wchvfuw4uOVlcNwH+j6qticbAniCg+jIs212WKYUgA1xy2701 w==;
X-CSE-ConnectionGUID: 4pUqB02jRyKaoaepadeUhg==
X-CSE-MsgGUID: kNOC2yjJRPSwAYZlSwuQbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="72159525"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="72159525"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:57:45 -0700
X-CSE-ConnectionGUID: X6rAuu/sRFma4LZKLLCwSw==
X-CSE-MsgGUID: kTLb22vqQBaLLgYU7Bq3BQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:57:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 00:57:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 00:57:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 00:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BukkcXMOLK35Ozsh/sJSe8ZyMi/ImT5CtaM0fgWYaYzOFzxsJPjOrfEjw5LNiWAxAHAK+kqUdN1yU8JPRWHnyrlCct6c+3jYVq2vfET7EuWfZ/MPPiJCVBaksPBzvTHv0pYBs9Ug5qvcHtGRPS9wAf8p/OD0psk/6d1c218yvu9SWyXG/ZTfgeY0jpndZtcAf6Mcdt2cV5n9F9AvfXGi45MEuei5mkFHW8hDzC32SAjZA7paYL70YhfjFwuEl8ksACajL8IC97JAUuKc/J10kMKZ6vOhP5Uc+Z+mFudzXPu1ns3yzNsEs20KUhAPUhpdgkHb+8hqFsRTArLueY+6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3bzTqwHXX+t6qaZ/afZ6h9TfQC5/Bd+I20S2wJBw0M=;
 b=JgI+z5I+TuxwEQRnGenguODW4Vp4U+bi5cdf54adZqA85K3I82KjOdTsncZmfW7ha5miY3UMcuRAiIf5RT4A3NV8yrCZWcRMYcbma22cd0k8e8mo75c8koECEupBZZRg62T17lcrLG878QSGnu20H1RPFUYZCCMtKCn1dnOKqw9gNWblltjzpPLdqfYnmVnev0PL5VC568jDqimPS5e7+tFMlwwQ+oVV2hCsZRR7/4xSGP6z4N1Tn9fFbJ3L9z+879dSo2tmiz4vC+wxk1sEvz+EWo6L7vHhmvv0NtYjw8CUbCAYJM+H5npJUmJT6O5yeHQlkZUnrc/XbYJ9n/Ek2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Mon, 6 Oct 2025 07:57:42 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 07:57:42 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
Subject: RE: [PATCH v4 i-g-t 2/6] benchmarks/intel_latency: Add xe_execqueue
 test
Thread-Topic: [PATCH v4 i-g-t 2/6] benchmarks/intel_latency: Add xe_execqueue
 test
Thread-Index: AQHcJ9R9wK4VPp+Obkeu0a733kAaTbS03bnQ
Date: Mon, 6 Oct 2025 07:57:42 +0000
Message-ID: <CH3PR11MB8434B673D39E70838BD01AF68DE3A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917131003.71762-8-gajendra.uttamchand@intel.com>
 <20250917131003.71762-10-gajendra.uttamchand@intel.com>
In-Reply-To: <20250917131003.71762-10-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7735:EE_
x-ms-office365-filtering-correlation-id: c135a9a4-031a-4d21-3de5-08de04ae0724
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UkYvNWJqVUNERnlHd09TMjJac3ZyN3A4Y2ZCdjY3NDBpSlZoYnhjOEp0dlRM?=
 =?utf-8?B?UVlnaWQwRVdNUll4RFN6ZlFma3RJdTA1d08rb1dub3BoVFI2MFlUSDFNZkND?=
 =?utf-8?B?L0lIbjBCNHp1ZWRhTWlaWVZHZ3h5RHF3Yld1czAxSXU5dElrRWYzd3FLOGRX?=
 =?utf-8?B?anNhV1ZWUHVVTWc1YmkxUlFyN2RlNDBXQWRzZU1xS3pZVkVMWHhaMVJvN3Ja?=
 =?utf-8?B?U1R3RHRJcWVBV3FjRTQ0TkE5OVRUNWptOTBKcjZJSFBqU3M2QTNJb0tVSVhE?=
 =?utf-8?B?N3UwektWQWJjR0JaYmxrYTkzNkRzRTJGNzVHY1JVeFdzdnVZL1ZDRDk2WEYr?=
 =?utf-8?B?ZHZIdlZZU3NPdGFUQkpHYm9waFJGL0JsNm9FUUY0a2N6UlhzcU54Z1RqR0Zm?=
 =?utf-8?B?OE4wenR0TUNxM0ZhSXpDeWZBcmpsZU9zaTV5WStPb3lwK2NSN3h5am96SXJC?=
 =?utf-8?B?VGYzV3BKVk5SR3hsaXBnUUNJWmk0WnZDTmtaNmdyYlNmRCtTM1VDMVlMWG12?=
 =?utf-8?B?SGc0U1dkRFJMZHdsbFgxaFZGZVR0Y0RCazM1MktXNVZ2L2RST0hSVlM2eFJG?=
 =?utf-8?B?OCtGZXZFd3JrUlVGWGhuekFKRXAyNHkzakQ5V25qcEYrdHZ6a0o0YStaNlBj?=
 =?utf-8?B?dlRQclVTSndPL0pWeGE4ZEpydXJMRkUwb1k0all1eHJxQ05RUGV1MkZ3WFN6?=
 =?utf-8?B?QzZCMWRPUjFwYTNwUm5odlRLeHFDcmFadXFHeUNTQWltTVd5Z0I2a0dIUmda?=
 =?utf-8?B?SXpyU3NGZGdrUHRMK1g0eFUyWmtsYmp0aGxHVXAyYUIzQlBmbWRLTWZyd2Ix?=
 =?utf-8?B?K2RZQjZvZWFuQlRIVm1EdTR6S2FRN2Z2VWYyc1FQRlozbThGOTVVS3FYMitn?=
 =?utf-8?B?MWNkUEEwK2lmUnNyUUZ5WExwLzBoT0xnMlF6YStQQWRKcE1XSjF1NzdleDZH?=
 =?utf-8?B?OW81bzFUV2thaTRJRCtaOURVbnJKL0J2Nk1QOHU1TFZZaWtNaDRJUWxtc2Yx?=
 =?utf-8?B?WmNvZHRJOVJvT2VjSnJBbjA0Vk5SRmhKdGRTSzcyTktnZTBoZ3BQMStwNTA5?=
 =?utf-8?B?NkhNTWJiT1dhMHNHRUJPVVJlM0x1a3ArVFhaRVRZR21SSXpEVEpqdEt4dEgv?=
 =?utf-8?B?ZFRGV2JKUmtBcjJGNUdyWDhUcCs1YnJvdElFdzBaZUx3c0dPUnMrRW45Y2NU?=
 =?utf-8?B?WE94SVY3b0pDMVk3S3RMWUhTanlJbkpjZTVSZXJqOXdub0JxSmNnNm5HeUhq?=
 =?utf-8?B?TFRxVnRWcnl1bHJhYmpFRDZkTlRwOUU3dE9PYjROeGRWemIwc0lmcGJRY1Ir?=
 =?utf-8?B?eUFIV1VzTkhtMFcwYXRBbHVYUDFsQkRTVDlpWjhtTVk5YlA5cEMvMUhhT0Zl?=
 =?utf-8?B?ZW9WZ1VrMHU5clBEYUZ2aFZ5dXpiMndwbWs1UkJ6cWJnSEVvWEdRM2xhUHE4?=
 =?utf-8?B?NDV0L1ZmbENEUndEYnFISmwxQ2ZtaWcwQVgyM3MxRnRrS1ZmU1UvVStzQmlJ?=
 =?utf-8?B?aWZEbzYxaWs2bEJycFptTGpVdkRmRVZhRXNxK1lJaFBQcmRwSEdsMk9MVkVV?=
 =?utf-8?B?ejhJUG83czUzMTNWWnUvTDdlTkU5dnhhZzFkcVBXS2I3Q3NiU3hkRWJDTUxL?=
 =?utf-8?B?TEhPeWE3c1liNTZDcnJVNTFTVTJRL2VIRHZIbW4xeWFTa3RrakJpd2R0RFpj?=
 =?utf-8?B?MDMrdmtoTGpzOTZTdnRUZ3luSFliQXp2M0k5R2p5MmtSVEk0cFRqMGc4MVla?=
 =?utf-8?B?Vm1ENG9PZWU5YVVhalc2SmdESm95a0g5UmRhcE93SG5LZTV6Mk1iRWNvbWRT?=
 =?utf-8?B?QnZDZDk2R3BaRHBSYVl2WE1zVDg3VHEwR3JTS2VVNTFhVDh5UXg0YXV4ZGl0?=
 =?utf-8?B?Ym0vNUp2eWJhWkNYRjB6Q2lwc2xLZ0lmQktIcmZxbWwvQU1ncDdLT25WWXVC?=
 =?utf-8?B?NWh0dWtJbGk0WHpJTTlvbFBJdDVSVXJOTXVBL0w0SlU2cmxPNEJKZEtMNWtq?=
 =?utf-8?B?aFMvSEo2V3ZiMExOMmlCNHAwUE10VzBSNTdaa0daMVhpSTFoUkNlRVo3eFQx?=
 =?utf-8?Q?vXtSmE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTNKOE5PUVQyUkhaU0wwd3pVdDlvQTI5V1VoWkp4RDNKamx1dFphV2tXSkxO?=
 =?utf-8?B?WWFjT3JEME9IZHFzS0FTVmN4eXBhWXJSb0N5TmZRUWJUNk5nN3l0M0I5TEhN?=
 =?utf-8?B?S1JpdGhFbXdvVkdXYXRGdXQyK1BkWHJ2Z3hHSVF2QWZRb1YrcEsvSSs3OUdJ?=
 =?utf-8?B?aGJPQmhzQ3ltazRoMWRxcisreE5hQkFPN1N1TE5tU0VQR2I1Tm5GK3RYQkp2?=
 =?utf-8?B?czhBZ0Zra24rQTFrdUdOTHVoV1p5QzdtVzVhMGVSZmNBUVBmVElqRFlaMUM3?=
 =?utf-8?B?cDZlbkpRV0ZoTkVLd3hLanpGNzdUS2pMcmRQS1ZBaDluNEVINDFrbk9meGZr?=
 =?utf-8?B?QVZWKytLY0hkOFN0MXBpU1d5NmkvQ2ZoM3EwVE1KL05hZHZycExaUXFBUmZB?=
 =?utf-8?B?TzJ0R3lOQnp4VWJaWUVSVDM3SlRTbzNZUW5mcmUxUm9hWXhZb2tEVVlDeTQy?=
 =?utf-8?B?eXFxMDlXaTRHZUZkQnF5cDVhdVZVY2xyOE9XTEp2cU4vN2RKVHFBNzZNZFZ6?=
 =?utf-8?B?WjlzYkJaNjhmTmozRXkwYzRGUWJKR1h4YTlqQWRTTlBJQ281WEtZNUl4UkRy?=
 =?utf-8?B?R2Y3dzloekNxU0dGSU9Bak5aNXVPOUtCTnBiaC94VldhV2l4dE1EL1NjRXdx?=
 =?utf-8?B?azRDSnROem1ZbGZYcEZ6eklyN2dIN1dJR3RUK05DbmN5bFlJNlZpbmh0dzN4?=
 =?utf-8?B?Z3FybWo3TnF0WERPa0xUOGEvSFBsVnlCazAySGIxblc3UnN4cVhIL01mbmgz?=
 =?utf-8?B?bFpyeUp0eGphYjVmUm96SkxCbFBGcWhSSC9WKzFRSkMvQnl5YzJLa0VtYnY4?=
 =?utf-8?B?NllHUXYxakpxM3UyUVhGaVdaR0l5S3hxMXQ3WWZ0U0pXdjNvMWQra1hMN2Zs?=
 =?utf-8?B?aHpTaHNCdVVWbHplYklGMFhzMmJDcWJHS1dIdHhoU0xrMVpxVzFZV3F4eVdo?=
 =?utf-8?B?THVRMVB0WXpuR0F5VGhkYTZhTFdMblFLd2p4a2w0NzFjZmRVQitaU04vdm0w?=
 =?utf-8?B?aGt1UWYxdHN2V1JZYWRqVVpiZjBvM1lFemVJZE9PZ0x0NjluRmFINmgveVBu?=
 =?utf-8?B?WmFNZFJFU2R5a3BzMkVid1laVXlQS1JaNTlPOXlvRVpva2dHWGcxWWptd1Y5?=
 =?utf-8?B?RnhkbThTQ1BQU1NEVkQ3SEFHQlZSZjZjZGIyZkRxbU8zN0JtQTExY3Arb1I1?=
 =?utf-8?B?UjFCUGdGTFRVc254ZlV2MG5RR2p0WS9NSHlYRytzTnVxUzVmQVlrMmVJU1Vs?=
 =?utf-8?B?YkdKSFNlakpqWEZEMU9iREtSQUNzTG1mbmp1TGN4WWpOT2FHT21kbmpTR3Vu?=
 =?utf-8?B?K3RScFl1VVlEOGMrMXpxTGhHL0VaeTl6NGtiV1hPcnBZMUlEMWhSbXRPYy9H?=
 =?utf-8?B?TXhPVEM5ME1xc1JUcnBjWjZsTkdiQ3htZUpzczhaeEUxM3lFd3NDWmJYQ3RT?=
 =?utf-8?B?cHhvc1BOWnhlZWJyTUR2TVRKcEZqcHVBVXk1QkxyR2ZkOE5YV080Mk1zQVBo?=
 =?utf-8?B?ZWFldGNSUDV4MExORXhTL2t6NlVzK3U5Z0FleS9MeXROQlFTLzdJbFY3bGw3?=
 =?utf-8?B?MEpvTFMwcHQvNUgwMEZrZEFFVllDaktBdG1RK3RWTkgwWG11WENrVm9BcXM3?=
 =?utf-8?B?MUNBTFQwVnB1U3pySVp4U25EaEh3eVQ4WlpvN0MwcXRsdnc2SnhVZUpEMllr?=
 =?utf-8?B?aURyejU1SFJHcXZkK0w3VjJDRjI5RW1vUkpJMk9Jd2ozRGhzM3ZVek1FY3dp?=
 =?utf-8?B?RGhTeitvOGpNd0xCQUdJZUVscmJDdHdYVnlvaUU4NzRQbkU3VG1SVUlHL01o?=
 =?utf-8?B?NnJwNndTd1I0T1NUTnJPTGJrQlJIdFRkQzFiVlltOXR3QjR6VWd2Kzluay9I?=
 =?utf-8?B?MGlRSkl4Qmgya051b1k4Yk9OSWNzd1RCNitueU41WGFJTTQ0a0xMek9FbW5Z?=
 =?utf-8?B?WUFIbnpYRi81QXpwdDA0S21XTU02NWFQanIvcCt0MmRCYnF5UWgrTVA0ZWFq?=
 =?utf-8?B?aS94Z1dhSGJMOUJUcFUxMnRoRTNUSDNCVkhVbmI0akIvZEdBSmNscnRaeCtM?=
 =?utf-8?B?R21oTWdTcE9GRHUyV1hHS1FEY1FmNkFIYjh4SzhsTXhEM1Y4b2VUQk50M2Q0?=
 =?utf-8?B?WDhtV1hIcjgyUHlaTStwdUR5ZkJSZkQ2c1dCcjNyQlYxN3c3VVkrbkl0Vlhm?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c135a9a4-031a-4d21-3de5-08de04ae0724
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 07:57:42.3542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SEjuJFZZcR8zLeTAlEW05KP8MIMy/4oET3tPOmqe2MYDlteTgxqoLorHZc9IUzxQazqF4Oo5A9MKUkArP3TWTjn0dRxSzGYnTLhXVZ8dHGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEdhamVuZHJhDQo+
IFV0dGFtY2hhbmQNCj4gU2VudDogMTcgU2VwdGVtYmVyIDIwMjUgMDY6NDAgUE0NCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBVdHRhbWNoYW5kLCBHYWplbmRyYSA8
Z2FqZW5kcmEudXR0YW1jaGFuZEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NCBpLWct
dCAyLzZdIGJlbmNobWFya3MvaW50ZWxfbGF0ZW5jeTogQWRkIHhlX2V4ZWNxdWV1ZQ0KPiB0ZXN0
DQo+IA0KPiBBZGQgZXhlY3V0aW9uIHF1ZXVlIG1hbmFnZW1lbnQgbGF0ZW5jeSB0ZXN0IGZvciB0
aGUgWEUgZHJpdmVyLg0KPiBNZWFzdXJlcyBwZXJmb3JtYW5jZSBvZiBjb21tYW5kIHF1ZXVlIG9w
ZXJhdGlvbnMgaW5jbHVkaW5nIHF1ZXVlDQo+IGNyZWF0aW9uIGFuZCBkZXN0cnVjdGlvbi4NCj4g
DQo+IERlZmF1bHRzOiBidWZmZXIgc2l6ZXMgZnJvbSA0S0IgdG8gOE1CLCAxMyByZXBldGl0aW9u
cywgMTAwMCBpdGVyYXRpb25zIHBlcg0KPiByZXBldGl0aW9uLCAyIHNlY29uZHMgcGVyIHNhbXBs
ZSwgc2luZ2xlIENQVS4NCj4gUGFyYWxsZWxpc20gYW5kIGJ1c3kgbW9kZSBhcmUgY29uZmlndXJh
YmxlIHZpYSBjb21tYW5kLWxpbmUgb3B0aW9ucy4NCj4gDQo+IENyaXRpY2FsIGZvciB1bmRlcnN0
YW5kaW5nIGNvbW1hbmQgc3VibWlzc2lvbiBvdmVyaGVhZCBhbmQgb3B0aW1pemluZw0KPiBncmFw
aGljcyB3b3JrbG9hZCBleGVjdXRpb24gcGlwZWxpbmVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
R2FqZW5kcmEgVXR0YW1jaGFuZCA8Z2FqZW5kcmEudXR0YW1jaGFuZEBpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX2V4ZWNxdWV1ZS5jIHwgMTI3DQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyNyBpbnNlcnRpb25z
KCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX2V4
ZWNxdWV1ZS5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hl
X2V4ZWNxdWV1ZS5jDQo+IGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX2V4ZWNxdWV1ZS5j
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uY2I3NDAxZmFhDQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX2V4ZWNx
dWV1ZS5jDQo+IEBAIC0wLDAgKzEsMTI3IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24N
Cj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5bmNv
YmouaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hlX3F1
ZXJ5LmgiDQo+ICsNCj4gKyNkZWZpbmUgT0JKRUNUX1NJWkUgKDEgPDwgMjMpDQo+ICsNCj4gK3N0
YXRpYyBkb3VibGUgZWxhcHNlZChjb25zdCBzdHJ1Y3QgdGltZXNwZWMgKnN0YXJ0LA0KPiArCQkg
ICAgICBjb25zdCBzdHJ1Y3QgdGltZXNwZWMgKmVuZCkNCj4gK3sNCj4gKwlyZXR1cm4gKGVuZC0+
dHZfc2VjIC0gc3RhcnQtPnR2X3NlYykgKyAxZS05ICogKGVuZC0+dHZfbnNlYyAtDQo+ICtzdGFy
dC0+dHZfbnNlYyk7IH0NCj4gKw0KPiArc3RhdGljIHZvaWQgdGVzdF9leGVjKGludCBmZCwgaW50
IGJ1c3ksIGludCBzaXplKSB7DQo+ICsJdWludDMyX3Qgdm07DQo+ICsJaW50IGVycjsNCj4gKw0K
PiArCXZtID0geGVfdm1fY3JlYXRlKGZkLCAwLCAwKTsNCj4gKw0KUmVtb3ZlIHRoZSBidXN5IGNv
bmRpdGlvbiBhcyB0aGUgY29kZSBpbnNpZGUgaXMgbWFuZGF0b3J5LkFsc28gcmVtb3ZlIGFsbCB1
bm5lY2Vzc2FyeSBhcmd1bWVudCBvcHRpb25zLg0KPiArCWlmIChidXN5KSB7DQo+ICsJCXVpbnQz
Ml90IGV4ZWNfcXVldWVfaWQ7DQo+ICsJCWVyciA9IF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQs
IHZtLCAxLCAxLCAmeGVfZW5naW5lKGZkLCAwKS0NCj4gPmluc3RhbmNlLCAwLA0KPiArCQkJCQkg
ICAgICZleGVjX3F1ZXVlX2lkKTsNCj4gKwkJaWd0X2Fzc2VydF9mKCFlcnIsICJGYWlsZWQgdG8g
Y3JlYXRlIGV4ZWMgcXVldWUgKCVkKVxuIiwgZXJyKTsNCj4gKw0KPiArCQl4ZV9leGVjX3F1ZXVl
X2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWVfaWQpOw0KPiArCX0NCj4gKw0KPiArCXhlX3ZtX2Rlc3Ry
b3koZmQsIHZtKTsNCj4gK30NCj4gKw0KPiAraW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2
KQ0KPiArew0KPiArCWludCBmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiArCWlu
dCBzaXplID0gMDsNCj4gKwlpbnQgYnVzeSA9IDA7DQo+ICsJaW50IHJlcHMgPSAxMzsNCj4gKwlp
bnQgbmNwdXMgPSAxOw0KPiArCWludCBjLCBuLCBzOw0KPiArDQo+ICsJd2hpbGUgKChjID0gZ2V0
b3B0KGFyZ2MsIGFyZ3YsICJzOmI6cjpmIikpICE9IC0xKSB7DQo+ICsJCXN3aXRjaCAoYykgew0K
PiArCQljYXNlICdzJzoNCj4gKwkJCXNpemUgPSBhdG9pKG9wdGFyZyk7DQo+ICsJCQlicmVhazsN
Cj4gKw0KPiArCQljYXNlICdyJzoNCj4gKwkJCXJlcHMgPSBhdG9pKG9wdGFyZyk7DQo+ICsJCQlp
ZiAocmVwcyA8IDEpDQo+ICsJCQkJcmVwcyA9IDE7DQo+ICsJCQlicmVhazsNCj4gKw0KPiArCQlj
YXNlICdmJzoNCj4gKwkJCW5jcHVzID0gc3lzY29uZihfU0NfTlBST0NFU1NPUlNfT05MTik7DQo+
ICsJCQlicmVhazsNCj4gKw0KPiArCQljYXNlICdiJzoNCj4gKwkJCWJ1c3kgPSB0cnVlOw0KPiAr
CQkJYnJlYWs7DQo+ICsNCj4gKwkJZGVmYXVsdDoNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICsJ
fQ0KPiArDQo+ICsJaWYgKHNpemUgPT0gMCkgew0KPiArCQlmb3IgKHMgPSA0MDk2OyBzIDw9ICBP
QkpFQ1RfU0laRTsgcyA8PD0gMSkgew0KPiArCQkJaWd0X3N0YXRzX3Qgc3RhdHM7DQo+ICsNCj4g
KwkJCWlndF9zdGF0c19pbml0X3dpdGhfc2l6ZSgmc3RhdHMsIHJlcHMpOw0KPiArCQkJZm9yIChu
ID0gMDsgbiA8IHJlcHM7IG4rKykgew0KPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5k
Ow0KPiArCQkJCXVpbnQ2NF90IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUo
Q0xPQ0tfTU9OT1RPTklDLCAmc3RhcnQpOw0KPiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0g
MDsgYyA8IDEwMDA7IGMrKykNCj4gKwkJCQkJCXRlc3RfZXhlYyhmZCwgYnVzeSwgcyk7DQo+ICsN
Cj4gKwkJCQkJY291bnQgKz0gYzsNCj4gKwkJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9O
SUMsDQo+ICZlbmQpOw0KPiArCQkJCX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9zZWMg
PCAyKTsNCj4gKw0KPiArCQkJCWlndF9zdGF0c19wdXNoX2Zsb2F0KCZzdGF0cywgY291bnQgLw0K
PiBlbGFwc2VkKCZzdGFydCwgJmVuZCkpOw0KPiArCQkJfQ0KPiArCQkJcHJpbnRmKCIlZlxuIiwg
aWd0X3N0YXRzX2dldF90cmltZWFuKCZzdGF0cykpOw0KPiArCQkJaWd0X3N0YXRzX2ZpbmkoJnN0
YXRzKTsNCj4gKwkJfQ0KPiArCX0gZWxzZSB7DQo+ICsJCWRvdWJsZSAqc2hhcmVkOw0KPiArDQo+
ICsJCXNoYXJlZCA9IG1tYXAoMCwgNDA5NiwgUFJPVF9XUklURSwgTUFQX1NIQVJFRCB8DQo+IE1B
UF9BTk9OLCAtMSwgMCk7DQo+ICsJCWZvciAobiA9IDA7IG4gPCByZXBzOyBuKyspIHsNCj4gKwkJ
CW1lbXNldChzaGFyZWQsIDAsIDQwOTYpOw0KPiArDQo+ICsJCQlpZ3RfZm9yayhjaGlsZCwgbmNw
dXMpIHsNCj4gKwkJCQlzdHJ1Y3QgdGltZXNwZWMgc3RhcnQsIGVuZDsNCj4gKwkJCQl1aW50NjRf
dCBjb3VudCA9IDA7DQo+ICsNCj4gKwkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywg
JnN0YXJ0KTsNCj4gKwkJCQlkbyB7DQo+ICsJCQkJCWZvciAoYyA9IDA7IGMgPCAxMDAwOyBjKysp
DQo+ICsJCQkJCQl0ZXN0X2V4ZWMoZmQsIGJ1c3ksIHNpemUpOw0KPiArDQo+ICsJCQkJCWNvdW50
ICs9IGM7DQo+ICsJCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLA0KPiAmZW5kKTsN
Cj4gKwkJCQl9IHdoaWxlIChlbmQudHZfc2VjIC0gc3RhcnQudHZfc2VjIDwgMik7DQo+ICsNCj4g
KwkJCQlzaGFyZWRbY2hpbGRdID0gY291bnQgLyBlbGFwc2VkKCZzdGFydCwgJmVuZCk7DQo+ICsJ
CQl9DQo+ICsJCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+ICsNCj4gKwkJCWZvciAoaW50IGNoaWxk
ID0gMDsgY2hpbGQgPCBuY3B1czsgY2hpbGQrKykNCj4gKwkJCQlzaGFyZWRbbmNwdXNdICs9IHNo
YXJlZFtjaGlsZF07DQo+ICsNCj4gKwkJCXByaW50ZigiJTcuM2ZcbiIsIHNoYXJlZFtuY3B1c10p
Ow0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+IC0tDQo+IDIuNDMu
MA0KDQo=

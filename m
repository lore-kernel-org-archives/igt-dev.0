Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A23CF34A9
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 14:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9073910E862;
	Thu,  3 Oct 2024 14:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQQCIKfV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615FB10E862
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727965673; x=1759501673;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XhREc3YUOrHZWNnAX3HoM8mlusq9c4nd+PsefPLoMWE=;
 b=JQQCIKfVujbjAZeAeuah5s+/pEhVkbwqc55ZViyIVB2FUsdAKaZoccf5
 RfEIGpfRe+AsDGi5Vfi8oWihC/m0k3lLXRdpiScI9e32PZDAJgRoCrAPs
 N3QLQANyMcDcul6fUGT8Dnpzm/HKmpz6KWSueSXksvjMV5D7ivDI0FYmo
 1mwnkejAwVdG7obFBaX40wx17RrS4Pmw15XEgRsnFu6HgeIXPhkOJcoNh
 ao0c2ln6+xGhBL122eQsUiiVIEfHK6/D71B3PgGJY00fxCBnBbSFAM9We
 PD02QGX5mkyPvOXudo6Pp8QOpSArpFLHBaV1AZrRrqSkPHNaXqxmzvDr4 Q==;
X-CSE-ConnectionGUID: J/xd1nhKR56mMD9MpAJreg==
X-CSE-MsgGUID: Xfkq4ZDXT52qE6bFyqIZCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="52568468"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="52568468"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 07:27:52 -0700
X-CSE-ConnectionGUID: EJgGJuwZT+eC+iF30Xd2/w==
X-CSE-MsgGUID: VKCmiCuzSpyr4ZKPB5WsxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74685085"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 07:27:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 07:27:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 07:27:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 07:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5xHgvGMlonS+McgvGeImQtDm72LlQCiIfw5t2YbfHk8Mmb16mqxj+T5DbFUUwDb+ARxWJEKOBPOvOAqbncjrHqgFi3/VujWNPc1c/Uk0a7hqOMm0iFDhojmIGRoi+wls5QEKwKGSXUKdnr+V/M/kOv0esS1t4BkWPud1zlHpfcMZeJGiAmCi2OGNz+YtNyUkDDAYOjKk4lmYZw4UYYiK7DnmBhkV6NbC4uB5LhKpvXzIALu8843mFKnsthwz5TJ1fTTqgZRPXkUL+XvKpmZU+5lB+FDjTXb3/O42mBaUlwie6qu/HllCFRnjcJP+SuiWVZJ43pqq7avakFK544g8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhREc3YUOrHZWNnAX3HoM8mlusq9c4nd+PsefPLoMWE=;
 b=uh1qOnGI7+yqcqctBL6jvf0fxaBEYESPE+syli/u8UM/M/tBPM/U56e1/EyIlS9T9bYLsD4N4AzrWHDJ7ELQC64xyOtM2Q6BZi+N4E2Wjp/uvYIhnPoZtcuWpZOho8hqO7jRGZEpXOMHThEtjOYMLcCtiq0jRRmivhmNyOOAuhBGFf9FduS+N2ATHC+mHyqysilU+QOLktqAbCIQxBryeTz5IKnMFbfwcQjwhgCKtkAtbvJUypdxi4Tjp9deuFOqA1i1EyLotorLl4DURyhu0rDOpsN/ZjJKN0PUpWmBMCkq3dYMnhJVHXSIs7dZxiOSe0FJiswSbITt/0jM0Y3OtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SA1PR11MB8396.namprd11.prod.outlook.com (2603:10b6:806:38d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 14:27:49 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%7]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 14:27:49 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Singh,
 Apoorva" <apoorva.singh@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/xe/xe_trace: Added code related to trace
Thread-Topic: [PATCH i-g-t 1/2] lib/xe/xe_trace: Added code related to trace
Thread-Index: AQHbE07ntXTPg5xzX0S6u07breUvQLJ1Ghvg
Date: Thu, 3 Oct 2024 14:27:48 +0000
Message-ID: <MW3PR11MB47482B9E8DC5ED7E76607C12AE712@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240930153750.1141461-1-priyanka.dandamudi@intel.com>
 <20240930153750.1141461-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20240930153750.1141461-2-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SA1PR11MB8396:EE_
x-ms-office365-filtering-correlation-id: b17b11ad-1265-4311-da37-08dce3b78e8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?empKT2t0Tjdyb2hEL1oybStabk9Sdk8wclQ0RXlHcWNWK0ZZY0pOWGFmbm8w?=
 =?utf-8?B?Ry9pdmFHNzVXZThGL01acXpnSmRaODdiWU1nditaSWZkdUJTZUw1bC9DS0Z1?=
 =?utf-8?B?YldsZ2dJTnlHWHROdGRrSFlqTGdpNDJ3R1hMenZsYVk5QkNYdHhqMDd0Ym1y?=
 =?utf-8?B?L245K3IrMk5JL0tmS1k5UWUxSFU3RnViT3IrYWFsVmw5a3ZXVDFmU2xJYWNu?=
 =?utf-8?B?WUxxSk9VZm9DUFpkQ082akcrejZQWml1b1psS2lvRHk1MldTT0N1RFhoeTZS?=
 =?utf-8?B?cVFUNllrZk5ZNzRVNEhpeXdQcDl2WUxuMFdsLzRuMllnbTlrOU92MTY2MnRX?=
 =?utf-8?B?OGIrajNldVZyWGdkSDRnMEhmYVZaRm42RDJCMnFTMjZLT3RjY0ptQkFmWEox?=
 =?utf-8?B?YUJzWlg4bTdjQVFhUkRTUGExc1VLc0xOS0dxOGJxaUM3YlprTDk2Z0oxakVD?=
 =?utf-8?B?QWV0TExpUEhaVGllRFpsalZrZGNKWWRkOU1JaDF2cW9yTGkrcC9OVnMzRWQx?=
 =?utf-8?B?REUzOHZRMmI0NzJPZDIvRDhvRWd4MXZVL3F5OTAxRzExU0xZTDZMUEpvUkRQ?=
 =?utf-8?B?RWhNNkJPdlFMaDZjQjFMY01td2V2R1YyRmUxUEpYa2JiWmNXT201aEVxekxK?=
 =?utf-8?B?M24vMUlrcEJpLzNXcXYrL0pxQWFQR05hOWJMd2E3V3FDczNkdG1NNGdsUnRW?=
 =?utf-8?B?QXF2ODFkbGlFSGc2Y2FvbmhCVGZFNU52Y3FScFl2SFBieGdKc3JoWWd6eXh6?=
 =?utf-8?B?bm1LcjA5M3RtT0tvbGlycU9tc1g5a3dnV3J5aVhWWkdhd3VpQzlvSU5HRU9B?=
 =?utf-8?B?UW1GSnBNRzlBK1VtNXBIcHBJL0xVTGV3WW12ank1WDZBaGRyeHY4MFByenpL?=
 =?utf-8?B?dzM4YzB1RGZHSXFJRkVmZENhSEEzbXk0R2Z1d3c4UVlZbm1HNnU4cE1XWlZM?=
 =?utf-8?B?WDRydmV5SEhhS3RwT3RvVW5ZbWlyVENVdkh6b0t1MmRMZ3RRdXdCSzdQWGRJ?=
 =?utf-8?B?RWhtbFhVZUdFSGd0a1BuT0dkNGtCNm5QZ1FzaVdTSjJvRTRYa0U5RGkzbC9s?=
 =?utf-8?B?ZUhSUFVpa2JYV0Y3akpwaXBUOHYzYk5RU3FiVnR4V0g3S1BUbStQdC9WV1hM?=
 =?utf-8?B?aHA4Y0ZTZW1pU1BPb2RhOWc3UUNsOE9aOWZ4ejkyakJuUnA4akhnZG5wRVRv?=
 =?utf-8?B?NWNTblJzS0ZjQkVucWk3MkJDTTM3M3g2elg3SmI0NUo1eVAxdFBYbGxnNXJW?=
 =?utf-8?B?Kzl0M1Ewanlncll4YmJHeG53WXlwaDVqTmljdkl3MVphUXlGZXFXMFNEVXBz?=
 =?utf-8?B?Z205SlJJMDhRNE9Edko5bGo4OXA1ODhjZWpXY1NxYzY0anJPdU1aNHhwM1Ew?=
 =?utf-8?B?LzNvZmljaE5UYVU2ZnhaLzRjcUZDTVJPeUdJZENobmJFQXlGZHhvRkR0K1Rm?=
 =?utf-8?B?VUMxQmxWdEZEZjl3QUlld3BJb2ZzbXUvTWJ5VEY2c3QxU2UwNzgybVRDb3BE?=
 =?utf-8?B?b2s3MG9OaW14cnlzRzFWMzlPQytLME16YlVNbUNCa1RCUTArbVU3NTViYm9J?=
 =?utf-8?B?dUtVOGs1OTdXNXhtaEs2MFgxaG1ST3Q4SFFENE5WZDM0SmV6WVJYSDdxeG1M?=
 =?utf-8?B?WEdVSFRKNFJCaFo1YWUzMlVaUjNFdkhueFRVcWkrQ3dKRGNWSUJSekJKOVl0?=
 =?utf-8?B?TVUwVGN5ZmVQUkJTb1RrWGRvQlpMVk9hZnlSeGNwL0d6ZVh2ZEppd0ZPNjda?=
 =?utf-8?B?bTBuZDk1UzNieXpHLzVUMXI1aytxNWtqeWFwVkhLMnhNcXEvL2FwS1UrNFVp?=
 =?utf-8?B?M0pwSXpxVjNvc0NRMjdnQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkJpalJ5MFhxRzNpNlA1Tk1lUE85cnZpTmJJd1BTTjg4SUJkK3JLVVlXbWtl?=
 =?utf-8?B?SmtkRGVFQW1sME5kdjhaZXF2NWNJc2h1UnlsclB5QkM3eDFHNnBKZnBzRUhz?=
 =?utf-8?B?N3JZSzJhNDF6bE54YVNJMUhNeTh3Yzg4WEtCSDlmaG9idlhIamZJY2JqL1RW?=
 =?utf-8?B?NVA4OUhXYUcwcldmaE1neU9rZUlhVnExRER3UEwzN1ZnTSthNFhLYmJEaFdv?=
 =?utf-8?B?Y0N2L05IMkI5em5WK000QmRoN3NUQnVuM3hPdDFRYTd5WGZySVhDV2VRb1Yv?=
 =?utf-8?B?a3BQenVSaVNHdDJNYXA1cFJKOURGQzg5bDZuaDJTWnB5L1lDWGdpR1BLWXla?=
 =?utf-8?B?ejNBc2V2L3BwM3NkQnI2dC9lN1dLbWh5L3V5SGdDK2NNZHg1aUYxOTBsT3lv?=
 =?utf-8?B?MllBL3owakVrWkxXTFNJV0ovRmEvTnl2UGFPa0N1SVZPNGhuV1g3ZGhIVGhY?=
 =?utf-8?B?elVuRDZjdTF2Z1NWSkw2RGxhUmcyRDlRd0l6ZjYyOTduTi9OQVRSUVh1WC9S?=
 =?utf-8?B?NG9qNWxUTWVlTThBOStVYUNyVUgwZXJWSHpiYU9xUEQ0OE9iNTBEYUJzS0ti?=
 =?utf-8?B?TVBlR09hU1hvTVYyOFhMQ2RUZDU3Qk1UWUZ6SGt1ay9abjRSS2hvWmN4S0h4?=
 =?utf-8?B?blZTeVJuOUg2aDlMZ1JEOWJhZE4xVS9rakd4NzRTci9pVFBxNlZiM2dkMVFu?=
 =?utf-8?B?U0J2eHdDTW5sYnJqL3paVjJyK2x6cGMwS1lLa2ZRN0lEOHNDZjM2a3NQUmlw?=
 =?utf-8?B?VG1CeUR6NjVsZWl3STMxcS8rMWlkU3I1eVh0dWUvOWN4V1lZTG1UcG1BK0VP?=
 =?utf-8?B?b1MxcWhaY3FRVys0VkRBKzE2N1RrZkdTbkF1NENBbDJIbDVTSHFQeWQydUZj?=
 =?utf-8?B?ZHVyMFpDcFc0WEhhQm8vNXA0NUtiWFFSSkl0Y01rR3paaXZwQ2NSYnBMOXY2?=
 =?utf-8?B?akhyaVVxUGdSVEJ0VUhpVVdYRk5Ob3JNaVJPb0xGOFV3a1ZabURXQVo2aS9C?=
 =?utf-8?B?ZVdLUVNWekhlYWN3TVM0Vk12ZHorMFU4RjE3UG81ZHBjMTZzMFUyYjFGeGtI?=
 =?utf-8?B?ckNHbzRDRE8vaFM0OWdVK0R6T3ZQWmFBWTZhSy9wWnc2elQvRHE5eUJYRndN?=
 =?utf-8?B?TTBnMUYrc3hoci94dUVNOWV6cSs3a1BNcXVBcFl2S21vVE1lRmQ0dmtyYktP?=
 =?utf-8?B?alkvNHJaRmRYcEFzTWIyWUphT3BCYUxyMUFXL2wvNC9RKzJlSGcyMGFTbDNk?=
 =?utf-8?B?bUxDTWNpMHM3TmhRWGlreDB1TDFoNFE4UUJFV3NhUzIzaEhvTVhXUUNEblkz?=
 =?utf-8?B?QUNZUS9TamdPSDBJNjQ4bG8yNVBLd2F3akQ5dW9yQmNXMEdicE82aG9QKzdt?=
 =?utf-8?B?SE5yczhHUkdWSVJJQVhHbkNMejlYaFZoRUFKK1NQZkxqUHV2bDd4NlpEODVD?=
 =?utf-8?B?UlVSckREZktLYUlsU1BQeVhwWFpnc1JCWDIzTlFlQ0FlVTNiL0VtdnkrV25h?=
 =?utf-8?B?QkpreTBYTmZrY05NVVE4RGtZODNwdlgxMi9WZmhkaDZja1lJdUFIMHZZVk02?=
 =?utf-8?B?Rmw5U3BkYzdXSHhocTNzYVVvekVuYXJFY1hRTG83SmtEb2xzdjl4WTk3SDlm?=
 =?utf-8?B?RGpGbFFraHRSeStQYml4ZVJGUDJRUVlYdHpYZU50MStHVEJKK2lWSWpTdDJW?=
 =?utf-8?B?VUpSTlBsa3dId0k4amxzL0Z5L0tRYnpsTUo3QitsM3poazZ2aGZ3Z0U5U1hU?=
 =?utf-8?B?bWVOTTRRdmNkUFp3Q1kvVVdqQmdqV0d6dkRBQXcrdmhtcmVvZnhxYzhkZFFB?=
 =?utf-8?B?K2lBMUUza1dYcU9HeWhZM3EyZ3dSOGc2R1RWYTNlQVk4WENBdkZqSks5T2RT?=
 =?utf-8?B?aXY2NFd2V0V4TDh1U2NqT1FDeisvanBrclM2QW82UXVLclc1SXdmMjBGeU16?=
 =?utf-8?B?SnEwQ3NaT2JDV2ZxdVZ2cHhKRVgrWk45T3hPTk14dVhPcWhXcjJFV1dkVmxp?=
 =?utf-8?B?d0FoM3JiQ1JndzczYXlOaU1NdXhpYU5CdXQ3OFo2aElVUnlPRUpiK1NyL1kr?=
 =?utf-8?B?RFJvMVpOTkhiTDZydGNXSTBydWhLQ0pXVXZzdU5aSXZUTEx6Y3RaZ3dNRFNT?=
 =?utf-8?Q?F069vml+8OV3wbEluB7uPfi3+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17b11ad-1265-4311-da37-08dce3b78e8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 14:27:48.9510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7jkhKljIGfPJKGHgnQuyl1AWK8PkxLS1TTKJCDxpuK0ZL3fnGRVOxUfKToXGKM4LigXM1Jq8nrb5mezu0+WwU6GBF7YzpJciWMm8yzFCApw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8396
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuZGFtdWRpLCBQcml5
YW5rYSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBTZXB0
ZW1iZXIgMzAsIDIwMjQgOTowOCBQTQ0KPiBUbzogS3VtYXIsIEphbmdhIFJhaHVsIDxqYW5nYS5y
YWh1bC5rdW1hckBpbnRlbC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IFNpbmdoLCBBcG9vcnZhIDxhcG9vcnZhLnNpbmdoQGludGVsLmNvbT47DQo+IERhbmRhbXVkaSwg
UHJpeWFua2EgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCBpLWctdCAxLzJdIGxpYi94ZS94ZV90cmFjZTogQWRkZWQgY29kZSByZWxhdGVkIHRvIHRyYWNl
DQo+IA0KPiBGcm9tOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRl
bC5jb20+DQo+IA0KPiBUcmFjZSByZWxhdGVkIGNvZGUgaGFzIGJlZW4gYWRkZWQgd2hpY2ggd2ls
bCBzdGFydCB0cmFjaW5nLCBzdG9wIHRyYWNpbmcgYW5kDQo+IHZhbGlkYXRlIG1pZ3JhdGlvbi4N
Cj4gDQo+IENjOiBCcmlhbiBXZWx0eSA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPg0KPiBDYzogT2Fr
IFplbmcgPG9hay56ZW5nQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUHJpeWFua2EgRGFu
ZGFtdWRpIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9tZXNv
bi5idWlsZCAgIHwgIDEgKw0KPiAgbGliL3hlL3hlX3RyYWNlLmMgfCA2MQ0KPiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgbGliL3hlL3hlX3RyYWNl
LmggfCAxMiArKysrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIveGUveGVfdHJhY2UuYw0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGxpYi94ZS94ZV90cmFjZS5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL21lc29uLmJ1
aWxkIGIvbGliL21lc29uLmJ1aWxkIGluZGV4IGMzNTU2YTkyMS4uNWRkNDk4NzJiDQo+IDEwMDY0
NA0KPiAtLS0gYS9saWIvbWVzb24uYnVpbGQNCj4gKysrIGIvbGliL21lc29uLmJ1aWxkDQo+IEBA
IC0xMTYsNiArMTE2LDcgQEAgbGliX3NvdXJjZXMgPSBbDQo+ICAJJ3hlL3hlX21taW8uYycsDQo+
ICAJJ3hlL3hlX3F1ZXJ5LmMnLA0KPiAgCSd4ZS94ZV9zcGluLmMnLA0KPiArICAgICAgICAneGUv
eGVfdHJhY2UuYycsDQo+ICAJJ3hlL3hlX3V0aWwuYycsDQo+ICBdDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbGliL3hlL3hlX3RyYWNlLmMgYi9saWIveGUveGVfdHJhY2UuYyBuZXcgZmlsZSBtb2RlIDEw
MDY0NCBpbmRleA0KPiAwMDAwMDAwMDAuLjI5MGFjOTFmYQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL2xpYi94ZS94ZV90cmFjZS5jDQo+IEBAIC0wLDAgKzEsNjEgQEANCj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRl
bCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxlcnJuby5oPg0KPiArI2lu
Y2x1ZGUgPHN0ZGlvLmg+DQo+ICsjaW5jbHVkZSA8c3RyaW5nLmg+DQo+ICsjaW5jbHVkZSA8c3lz
L2lvY3RsLmg+DQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3R5cGVzLmgi
DQo+ICsjaW5jbHVkZSAiaWd0X3N5c2ZzLmgiDQo+ICsjaW5jbHVkZSAieGVfdHJhY2UuaCINCj4g
Kw0KPiArY29uc3QgY2hhciAqeGVfbWlncmF0aW9uX3RyYWNlX3BhdGggPQ0KPiArDQo+IAkiL3N5
cy9rZXJuZWwvdHJhY2luZy9ldmVudHMveGUveGVfYm9fbW92ZS9lbmFibGUiOw0KPiArY29uc3Qg
Y2hhciAqeGVfYWNjX2NvdW50ZXIgPQ0KPiArIi9zeXMva2VybmVsL3RyYWNpbmcvZXZlbnRzL3hl
L3hlX3ZtYV9hY2MvZW5hYmxlIjsNCj4gK2NvbnN0IGNoYXIgKnRyYWNlX29uX3BhdGggPSAiL3N5
cy9rZXJuZWwvdHJhY2luZy90cmFjaW5nX29uIjsgY29uc3QNCj4gK2NoYXIgKnRyYWNlX3BhdGgg
PSAiL3N5cy9rZXJuZWwvdHJhY2luZy90cmFjZSI7DQo+ICsNCj4gK3ZvaWQgeGVfdmFsaWRhdGVf
YWNjX3RyYWNlKGludCB4ZSwgaW50IGZsYWcpIHsNCj4gKwlpZ3RfYXNzZXJ0X2VxKGlndF9kZWJ1
Z2ZzX3NlYXJjaCh4ZSwNCj4gKwkJICAgICAgdHJhY2VfcGF0aCwgIm1pZ3JhdGUgb2JqZWN0Iiks
IGZsYWcpOw0KPiArCWlndF9hc3NlcnRfZXEoaWd0X2RlYnVnZnNfc2VhcmNoKHhlLA0KPiArCQkg
ICAgICB0cmFjZV9wYXRoLCAieGVfdm1hX2FjYyIpLCBmbGFnKTsgfQ0KPiArDQo+ICtib29sIHhl
X3N5c2ZzX3RyYWNlX3dyaXRlKGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGNoYXIgKnZhbHVlKSB7
DQo+ICsJRklMRSAqZnA7DQo+ICsNCj4gKwlmcCA9IGZvcGVuKGZpbGUsICJ3Iik7DQo+ICsJaWYg
KCFmcCkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJaWd0X2Fzc2VydF9mKGZ3cml0ZSh2
YWx1ZSwgMSwgc3RybGVuKHZhbHVlKSwgZnApID09IHN0cmxlbih2YWx1ZSksDQo+ICsJCQkiZmFp
bGVkIHRvIHVwZGF0ZSBzeXNmcyB0cmFjaW5nIG5vZGUgJXNcbiIsIGZpbGUpOw0KPiArCWZjbG9z
ZShmcCk7DQo+ICsJcmV0dXJuIHRydWU7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgeGVfc3RhcnRfdHJh
Y2luZyh2b2lkKQ0KPiArew0KPiArCWJvb2wgc3VjY2VzcyA9IHRydWU7DQo+ICsNCj4gKwlzdWNj
ZXNzICY9IHhlX3N5c2ZzX3RyYWNlX3dyaXRlKHhlX2FjY19jb3VudGVyLCAiMSIpOw0KPiArCXN1
Y2Nlc3MgJj0geGVfc3lzZnNfdHJhY2Vfd3JpdGUoeGVfbWlncmF0aW9uX3RyYWNlX3BhdGgsICIx
Iik7DQo+ICsJc3VjY2VzcyAmPSB4ZV9zeXNmc190cmFjZV93cml0ZSh0cmFjZV9wYXRoLCAiMSIp
Ow0KPiArCXN1Y2Nlc3MgJj0geGVfc3lzZnNfdHJhY2Vfd3JpdGUodHJhY2Vfb25fcGF0aCwgIjEi
KTsNCj4gKw0KPiArCWlndF9hc3NlcnQoc3VjY2Vzcyk7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgeGVf
c3RvcF90cmFjaW5nKHZvaWQpDQo+ICt7DQo+ICsJeGVfc3lzZnNfdHJhY2Vfd3JpdGUoeGVfYWNj
X2NvdW50ZXIsICIwIik7DQo+ICsJeGVfc3lzZnNfdHJhY2Vfd3JpdGUoeGVfbWlncmF0aW9uX3Ry
YWNlX3BhdGgsICIwIik7DQo+ICsJeGVfc3lzZnNfdHJhY2Vfd3JpdGUodHJhY2Vfb25fcGF0aCwg
IjAiKTsNCj4gKwl4ZV9zeXNmc190cmFjZV93cml0ZSh0cmFjZV9wYXRoLCAiMCIpOyB9DQo+IGRp
ZmYgLS1naXQgYS9saWIveGUveGVfdHJhY2UuaCBiL2xpYi94ZS94ZV90cmFjZS5oIG5ldyBmaWxl
IG1vZGUgMTAwNjQ0IGluZGV4DQo+IDAwMDAwMDAwMC4uNDMwNzEwZDY1DQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvbGliL3hlL3hlX3RyYWNlLmgNCj4gQEAgLTAsMCArMSwxMiBAQA0KPiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAy
MDIyIEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKyNpbmNsdWRlIDxzdGRpby5oPg0KPiAr
I2luY2x1ZGUgPHN0cmluZy5oPg0KPiArI2luY2x1ZGUgImlndC5oIg0KPiArDQo+ICt2b2lkIHhl
X3ZhbGlkYXRlX2FjY190cmFjZShpbnQgeGUsIGludCBmbGFnKTsgYm9vbA0KPiAreGVfc3lzZnNf
dHJhY2Vfd3JpdGUoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgY2hhciAqdmFsdWUpOyB2b2lkDQo+
ICt4ZV9zdGFydF90cmFjaW5nKHZvaWQpOyB2b2lkIHhlX3N0b3BfdHJhY2luZyh2b2lkKTsNCj4g
LS0NCj4gMi4zNC4xDQoNCg0KTEdUTQ0KUmV2aWV3ZWQtYnk6IEphbmdhIFJhaHVsIEt1bWFyIDxq
YW5nYS5yYWh1bC5rdW1hckBpbnRlbC5jb20+DQo=

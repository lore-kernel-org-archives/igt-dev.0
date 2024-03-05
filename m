Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473A5C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 17:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3240B10F3C4;
	Tue,  5 Mar 2024 17:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAv7/MAi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE32810E57A;
 Tue,  5 Mar 2024 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709660756; x=1741196756;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8IovmVKHCTeMLoLVlg9yW2kil5jX3YEyeuClBhpgcd4=;
 b=PAv7/MAiyCbTNRSfANrovUqA2rwjHO5fSgvbpSGzQjUWw4L/Iyj7Ljs6
 sxds+Ma6X1z3Lj9MotgZk5ItRTAzob4ja8jPqVu+Gw1lpFxPXMaD5WBu9
 Ce4UFMQBj9QKd2yTmraVgxYz3DVuz77bVVStgmo6YcPBZzoVIBXucAf3z
 iUiacMprQgQU+PixsA3wTGpXhsc1SO3zuG8GWQgk9BIiaGSX1iPLU5tF3
 Iv5TV4bN0GcR4jqnjMzHQBIQj1OS4KYCS622+PuZbjS9sONl+PWSlyDhf
 asGo8R+68SjiIwVxUmBUnBxyqxdIkEQBaz9WM1C1fleHev9uioYfk86S2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="7176938"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="7176938"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9392682"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 09:45:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:45:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 09:45:44 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 09:45:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CILbrk0AEvItUFB1z3bKDipMTAypi8N/NTYB81Q4AtgmBPVUHFdCn62WQXlc/pfmuegRBTBJXFsmouKcDgLjt7RusJzvmB2PTdMHL2Mxx4CUOZ6oA+cEOhyuLogQvp9b9GriCJKDq2MKkVV/hU6QId45Mb7pd/NNHx8QLTH8epuwdCSi8GjkC0b7z5cK0zLqTPwbHRcipxNmqsGbiitX3w0IN8qnRdiQxP0Ue7F5ClabZCjau+6rVkGIeEzElDTOdhtPx0I/4Z2tpMNsV74SAlt8M2yN9h2Qd6j4Jq7dBQsfOBe7e/sfLx9Kss+MjDsNn6N2r6Jzide5DtD/5tS+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IovmVKHCTeMLoLVlg9yW2kil5jX3YEyeuClBhpgcd4=;
 b=Zjzf3w72udqeBkWIkrqPoVkieE/IRXbL1eyRUeXlCn4JtkX3pYHhMSj2+wqxl2LqMldaeZwohArRKjscPih/Paqsl3F5ryAem3NnW4ITvR6mFtbYGnSd7RX0agKaYXxTGTwrEzNZdkbcNSPRJVw8uCtY1CQV+99MI0TFdFfsDHpH9kGx6dEWrQNkR/doZ4a8pQe1VLFe0vuae+g79RnlFN6Klv/2fQTzCW6PtoI6qPuI+80wtuYgTCsk7YVS1r0m+k5ZKpw4jPNKA9Biekc7IkO+Lr/j8v6EJWpW8aHIRrTkKO+VQ8+tXRdyIO4XbmhVdiJWO86QwDJMTq7CrafXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by DS7PR11MB7929.namprd11.prod.outlook.com (2603:10b6:8:e5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.24; Tue, 5 Mar 2024 17:45:41 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 17:45:41 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIGxpYi9pZ3RfZmI6IG9u?=
 =?utf-8?Q?_Xe_device_don't_apply_legacy_blitter_rules?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lndF9mYjogb24gWGUg?=
 =?utf-8?Q?device_don't_apply_legacy_blitter_rules?=
Thread-Index: AQHaauZ5+yF8dW5OYUixWyzR2XVdCLEnYccAgAIRETA=
Date: Tue, 5 Mar 2024 17:45:41 +0000
Message-ID: <PH8PR11MB6753624979C5FC71A92A6426F2222@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240228143904.859714-1-juhapekka.heikkila@gmail.com>
 <170919404440.393540.6971466243711753355@8e613ede5ea5>
 <20240304100740.ztkb5anzva2hghja@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240304100740.ztkb5anzva2hghja@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|DS7PR11MB7929:EE_
x-ms-office365-filtering-correlation-id: e28d5e78-fe93-4cc8-5b25-08dc3d3c137a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3bq1sJizrA2GQfs56mGJQtAfMq27bULbrvKdt2V2jsUjUJkWCECvGWmkPdZ2cJi4T+q7k4SPZsCMLMFJnAyfR4p5qfjeb81OzRH9o5vgvCJZ2nz9Waljxzhq3UFmGgk4OL6czup98Bn2jeBqj9qcWbKI3gEffVAd/FscIMXIxncVqWCz6JOIescyqe37McaCzL5vplq0Ey6W4kuK8YRD+74zVZI0xSTQcTPeka/ziSOX7ZJfQQSIMQvvHf1BJBB+G248az/GpJ4aO0Xq7A4DcK6yXZTW+hIxP1OoxrjIRyANzTP/ZMEODOh2V+loeSD8Mq693NxFyOEKtNT/rz6bnmCYiof5+EdKJZFcd5Vt2tqIbBErmwVa81tN37GsfCiQhVSsZrHBPyJrHke5y+rYggo8CxNNl/heMCS85cuKMnUrKy1rI5WgcvbgVIcYI10bGNtWlAq//0BKzBUK4a+MNzOmpkixAszLyVVQ04HcXfRFFv8D9eZJnBHzPOR5f6MtvxZAPbyooTGMzdLASS5zZK0pMPu8IjSLOg2JMv+DeWOVgd9Re/eX4bBU+Xca2lCtz378lG4DTQfsmTxyIVXPlswd8yIpX1BkjOdHLVErzBpAr7TEyAn9F4oLlweF3qaafzfwQX5sD0B6j4j0kbhrLG94X9XRxeup+XgFvCWWTFQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjdSdE5Pa2pSQVNDdlNaYXpZMUNtN1BEci9GeVR4ZXlpd0Frdnh1b0RCRW9w?=
 =?utf-8?B?b1Z0WjdLeWg1WmR2V0FVVlBKSEljWkQ1TFl2NVR0NUFIcUd2VmltT3RmZkJD?=
 =?utf-8?B?MHFhMmlNQitQSkNEVEhDeHVGWVgreEN5RGxyT1pJT3NwTWxsSDBSbWVKY2k3?=
 =?utf-8?B?YkZiRHVlbjRPeThDUkRNV2J1UHNud211emsrMUZveFJ2MHl3TnZQY0REV0wr?=
 =?utf-8?B?eFNmWVhjSVlGeUx0ZFZIU2hkYU5hY2RRRnE4WUxtenJXdGdsNFdrSU5KamhV?=
 =?utf-8?B?aXFUcmxDWmtsZjhEcDJDd2VqeHFCbjdqT1VLZHdzVmdTeXdrVExQVk5RVVZl?=
 =?utf-8?B?V3MxcEZIU29WMnpySnk4RHFwUWZyUFNoQmdhOEplL0pONEQzamZlZ0l3UmxI?=
 =?utf-8?B?MXdjZjJNczdrbFlZV29YTWpVS2FRMUl5RXAvdjBrRlZtUDJBbVVTSGZwb1F3?=
 =?utf-8?B?R1NCVjhpTVdsL1RISjloV3ZJTHpCTS9tcGUvVUhDSnRTZU8zblU1RWo2ZHc2?=
 =?utf-8?B?QzRXR0JFc1RvQndTbDE5REhCMkJpdGcrVHhUWVprdVN6WEdMNDl3SnVJRE00?=
 =?utf-8?B?YnFIdGcybS9LYXl0Q0lVenpCL01JallJR1E5Z3hUQzlPSkJxalk1NDN4WUVB?=
 =?utf-8?B?YVVxaThyTFNiRDhuV0xNSDZ4cXF4WXpRVUlzVlg0eVlPTWtWTndLY2xwU3lZ?=
 =?utf-8?B?SGREUmk1NFVvWlpHSkExV0hGbWc5cTMvVnpvMDAyeGVaR1pxREo5UktXOTli?=
 =?utf-8?B?ekhEcE1VaFhTRUVjcjZ0VHE0L1ZPUFA0Qm44VVJnTkNaQ0htSFlHSTlGMHNp?=
 =?utf-8?B?V1dyRW5SR3hWb0JXY0J0UnRDSW5OL3pSeWJuVk1jMkI1eWphUG12RkViUmdP?=
 =?utf-8?B?TjhGTHluNXloRllEZmZrZWo2b3BQRkJyNktXbjF4N1lhNkF1akU1VEIvQ012?=
 =?utf-8?B?Q2RsSzdFQXBuQktpV21EUW9WYlhKR2ZjN0lDZXdxOVh1STlJb0tvMHpGZ0lI?=
 =?utf-8?B?S2lWWjF6R2R6R2tDK2xuajZ4dWgvUzVJMU04NXQ4S0RLc3lsUU9icDZFOGpi?=
 =?utf-8?B?Wk1uRFFna2NIcEc0K2RDVmV3Sm1aaUdzMHh3L3hYR2had09mZlRLcnVjaW82?=
 =?utf-8?B?TlVFbHg4dkdEcmxzR2l1eTBFNHQ5QjM0SDEzS3lNcUs5THNDenlUTHdqZHI5?=
 =?utf-8?B?OW1aL1VISjVyenBwQ0NldWYrYUp0VklMZXpZakdDWUZTWXc5R0dNbGh2MlEr?=
 =?utf-8?B?M3JYT3N0M0ZzN29iTlpUaGc1ZStKRjBvZkYvZk15NEpxVTFoMDA4L0xSRmxU?=
 =?utf-8?B?KzV0am5BMFllOFV3MjV3RUJTOGZid0xCZHoyNHA5ZGZyN1kwa3RwTzRtK1JO?=
 =?utf-8?B?c2RzbTRmUlczVmVuek5QbHh6dmZDY01ZakdmVTVVSHdtQlVQK2paeG1Ya2l0?=
 =?utf-8?B?RGhodGtkc2cxSmZwaUVFMFoyTkFUcGEwMXVFY1JFZ1BIam4xaXlpT083MDJo?=
 =?utf-8?B?eGUwMmJJSWk1bnBqdUkvaEpUNGxLQjg1OVJOMTF6Mm5EZW05QnZDallxRnV5?=
 =?utf-8?B?SjZLU3p6dFE0MEdvRzRTM3lTSVEzNzFRQ1g1VFM2RFNmZzdRMlJNVURCSkNX?=
 =?utf-8?B?VmRwQWNkbHBjeFkrOUJ6U1pOem03SmI0R3EyUWJSbHRWSUYwSzFOeVNhRTZ0?=
 =?utf-8?B?QlpJdEh5dDQ2YWhoUmVOTFVIVVJXTDBEYlp2aVFuMFY3dW1lV3hYVkZ3c1o5?=
 =?utf-8?B?eEE0QnlOa3NBZmNlWm9NVkhwT25KalMzbWo1dGlPVjlZZm9IRDZLNEhCOTNM?=
 =?utf-8?B?bG8reXJYM1QzbFJoK1V2cDlSLzlESEtwejN4dHQ3UU10UlQ3bUMzeGQ3eTFD?=
 =?utf-8?B?Z3QwRDduVEFmSW4waWtSMDhLRTJta08wTG5yNDdQd0E2MnFiMXFtb3I1MnZC?=
 =?utf-8?B?aWVCall4TGplRXFkTi9OUmh4dmtmMkF0clFsUEF3UzdKYk82RGtUUHEwSWlN?=
 =?utf-8?B?eVlJbmxERGFnVG9BWXVsSlMxYVZ3SkdlRlV1QUJkOGxoaWFQa014bTNkRlUw?=
 =?utf-8?B?dFpqZTNnT2dSWk0vNG5NSmh0aWVSZTBmT09iQnVmVzF2cmw3SlFMWWFtVzZB?=
 =?utf-8?B?UTcrNlpIOVBBb2dUc0RDRHdoWFJLeFpFK2RiNlUyV3RsSlcwSmZvL3FYTEtF?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28d5e78-fe93-4cc8-5b25-08dc3d3c137a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 17:45:41.3810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4lcD4PD1g09PJsmawai/8iP4MYf3LvAROztfHMJREyaHQl+oE+b4SQ47YMGBv2+x3TUjKIevgL8TMDgToAm9NyD0nxZq7mFYHE3fsaY7JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7929
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

SGksDQoNCkFkZHJlc3NlZCBmYWlsdXJlcyBidXQgcGF0Y2h3b3JrIGNhbm5vdCBiZSByZS1yZXBv
cnRlZCBhcyByZXN1bHRzIHdlcmUgYWxyZWFkeSBkcm9wcGVkIGZyb20gdGhlIHNlcnZlci4gUmVz
dWx0cyBhcmUga2VwdCBmb3IgYSB3ZWVrIG9ubHkuIFBsZWFzZSB0cnkgcmUtdGVzdC4NCg0KVGhh
bmtzLA0KVGVqYXNyZWUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWls
IEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBNb25k
YXksIE1hcmNoIDQsIDIwMjQgMzozOCBQTQ0KVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpDYzogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNv
bT47IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMR0NJIEJ1ZyBGaWxpbmcg
PGxnY2kuYnVnLmZpbGluZ0BpbnRlbC5jb20+OyBJbGxpcGlsbGksIFRlamFzcmVlWCA8dGVqYXNy
ZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTog4pyXIEZpLkNJLklHVDogZmFp
bHVyZSBmb3IgbGliL2lndF9mYjogb24gWGUgZGV2aWNlIGRvbid0IGFwcGx5IGxlZ2FjeSBibGl0
dGVyIHJ1bGVzDQoNCkhpIGlndC1kZXYsDQpPbiAyMDI0LTAyLTI5IGF0IDA4OjA3OjI0IC0wMDAw
LCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6
IGxpYi9pZ3RfZmI6IG9uIFhlIGRldmljZSBkb24ndCBhcHBseSBsZWdhY3kgYmxpdHRlciBydWxl
cw0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMw
NTA0Lw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1
ZyBMb2cgLSBjaGFuZ2VzIGZyb20gQ0lfRFJNXzE0MzU4X2Z1bGwgLT4gSUdUUFdfMTA3NDdfZnVs
bCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAg
IFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEwNzQ3X2Z1bGwgYWJz
b2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYg
eW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRo
ZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMDc0N19mdWxsLCBwbGVhc2Ugbm90
aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0
byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGlj
aCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVS
TDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA3
NDcvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoOCAtPiA3KQ0KPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTWlzc2luZyAgICAoMSk6IHNoYXJk
LWdsay0wIA0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0t
DQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVu
IGludHJvZHVjZWQgaW4gSUdUUFdfMTA3NDdfZnVsbDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAj
IyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBn
ZW1fY2FjaGluZ0ByZWFkLXdyaXRlczoNCj4gICAgIC0gc2hhcmQtZGcxOiAgICAgICAgICBOT1RS
VU4gLT4gW0lOQ09NUExFVEVdWzFdDQo+ICAgIFsxXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA3NDcvc2hhcmQtZGcxLTE4L2lndEANCj4gZ2Vt
X2NhY2hpbmdAcmVhZC13cml0ZXMuaHRtbA0KPiANCj4gICAqIGlndEBrbXNfcHNyQHBzcjItbm8t
ZHJyc0BlZHAtMToNCj4gICAgIC0gc2hhcmQtbXRscDogICAgICAgICBbUEFTU11bMl0gLT4gW0ZB
SUxdWzNdDQo+ICAgIFsyXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9DSV9EUk1fMTQzNTgvc2hhcmQtbXRscC0yL2lndEBrbXNfcHNyQHBzcjItbm8tZHJyc0BlZHAt
MS5odG1sDQo+ICAgIFszXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvSUdUUFdfMTA3NDcvc2hhcmQtbXRscC01L2lndEANCj4ga21zX3BzckBwc3IyLW5vLWRy
cnNAZWRwLTEuaHRtbA0KPiANCg0KVGhlc2UgYXJlIHVucmVsZXRlZCB0byBYZSBwYXRoIGNoYW5n
ZSwgbm8gbmVlZCBmb3IgcmVzcGluLg0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPiAgIA0KPiBLbm93
biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSBjaGFuZ2VzIGZv
dW5kIGluIElHVFBXXzEwNzQ3X2Z1bGwgdGhhdCBjb21lIGZyb20ga25vd24gaXNzdWVzOg0KPiAN
Cj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBJc3N1ZXMgaGl0ICMjIyMNCj4gDQo+
ICAgKiBpZ3RAYXBpX2ludGVsX2JiQGJsaXQtcmVsb2MtcHVyZ2UtY2FjaGU6DQo+ICAgICAtIHNo
YXJkLWRnMjogICAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVs0XSAoW2k5MTUjODQxMV0pDQo+ICAg
IFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdf
MTA3NDcvc2hhcmQtZGcyLTYvaWd0QGENCj4gcGlfaW50ZWxfYmJAYmxpdC1yZWxvYy1wdXJnZS1j
YWNoZS5odG1sDQo+IA0KPiAgICogaWd0QGRybV9mZGluZm9AdmlydHVhbC1idXN5LWlkbGUtYWxs
Og0KPiAgICAgLSBzaGFyZC1kZzI6ICAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bNV0gKFtpOTE1
Izg0MTRdKQ0KPiAgICBbNV06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzEwNzQ3L3NoYXJkLWRnMi01L2lndEBkDQo+IHJtX2ZkaW5mb0B2aXJ0dWFs
LWJ1c3ktaWRsZS1hbGwuaHRtbA0KPiANCj4gICAqIGlndEBkcm1fZmRpbmZvQHZpcnR1YWwtaWRs
ZToNCj4gICAgIC0gc2hhcmQtcmtsOiAgICAgICAgICBbUEFTU11bNl0gLT4gW0ZBSUxdWzddIChb
aTkxNSM3NzQyXSkNCj4gICAgWzZdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0NJX0RSTV8xNDM1OC9zaGFyZC1ya2wtMi9pZ3RAZHJtX2ZkaW5mb0B2aXJ0dWFsLWlk
bGUuaHRtbA0KPiAgICBbN106IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzEwNzQ3L3NoYXJkLXJrbC0xL2lndEBkDQo+IHJtX2ZkaW5mb0B2aXJ0dWFs
LWlkbGUuaHRtbA0KPiANCj4gICAqIGlndEBnZW1fY2NzQGN0cmwtc3VyZi1jb3B5Og0KPiAgICAg
LSBzaGFyZC1kZzE6ICAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bOF0gKFtpOTE1IzM1NTVdIC8g
W2k5MTUjOTMyM10pDQo+ICAgIFs4XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS10aXAvSUdUUFdfMTA3NDcvc2hhcmQtZGcxLTE5L2lndEANCj4gZ2VtX2Njc0BjdHJs
LXN1cmYtY29weS5odG1sDQo+IA0KPiAgICogaWd0QGdlbV9jY3NAc3VzcGVuZC1yZXN1bWU6DQo+
ICAgICAtIHNoYXJkLWRnMTogICAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVs5XSAoW2k5MTUjOTMy
M10pDQo+ICAgIFs5XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10
aXAvSUdUUFdfMTA3NDcvc2hhcmQtZGcxLTE4L2lndEANCj4gZ2VtX2Njc0BzdXNwZW5kLXJlc3Vt
ZS5odG1sDQo+IA0KDQouLi5jdXQuLi4NCg0KPiANCj4gQnVpbGQgY2hhbmdlcw0KPiAtLS0tLS0t
LS0tLS0tDQo+IA0KPiAgICogQ0k6IENJLTIwMTkwNTI5IC0+IE5vbmUNCj4gICAqIElHVDogSUdU
Xzc3MzEgLT4gSUdUUFdfMTA3NDcNCj4gICAqIFBpZ2xpdDogcGlnbGl0XzQ1MDkgLT4gTm9uZQ0K
PiANCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICBDSV9EUk1fMTQzNTg6IDU5MTFhNzFm
MGQ4OTZiZWJiN2FmN2NmNjBkNjBlMGQzNmMzZGRlOTkgQCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNr
dG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBJR1RQV18xMDc0NzogaHR0cHM6Ly9pbnRlbC1nZngt
Y2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDc0Ny9pbmRleC5odG1sDQo+ICAgSUdUXzc3
MzE6IDE3Zjg5N2E4MTg2OGZiMzVjNmE3MDMzYThiMDcyNTY2NTk3NDIyNDggQCBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMuZ2l0DQo+ICAgcGlnbGl0XzQ1
MDk6IGZkYzVhNGNhMTExMjRhYjg0MTNjNzk4ODg5NmVlYzRjOTczMzY2OTQgQCANCj4gZ2l0Oi8v
YW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvcGlnbGl0DQo+IA0KPiA9PSBMb2dzID09DQo+IA0KPiBG
b3IgbW9yZSBkZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTA3NDcvaW5kZXguaHRtbA0K

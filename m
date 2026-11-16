Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD47A606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g+MvBK+R;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ey8TAdzO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA4710E2A4;
	Mon, 16 Nov 2026 08:09:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFD610E26C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 08:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816473; x=1826352473;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TzlY45+4AevU+GPwd4hNLmPu59DzjXtb0tynf5IqF6I=;
 b=g+MvBK+R7jDChvgtdrOyZg+z7+F7yJ7MMn+8npJ/VRNlg7k6EqyUMbTV
 78BwAzG3QctQY/HjW8bJlsRcCYUDNIODCpw3NL29I2OnDzHHQMsN7rjeZ
 zJG0da+7eKEGAAKBsBExuWVAmnbAsdX1jHafIA7W1tQLDTGJj+Xk7KHAr
 GAAnzvKLiaf5NwDI27Gyhjr9sXcePbeLv9vHDSilKfSvEAfysfFooH+dW
 MnAVyvFz1GetYxE8P3kN2d4TEPkffEstpOdi5ONIkGz7njIi0LGZcf81r
 HtBFV4pw7Lm3wWup0iL11kvJeQ6p1E6n31W8nygENTbGElTwlFl8HhdkH g==;
X-CSE-ConnectionGUID: btCEx1+WRTeB5Z8hmObxxg==
X-CSE-MsgGUID: FFZ8wPYpRoGnF9+AFU3fAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3584609"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3584609"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:07:50 -0800
X-CSE-ConnectionGUID: ZwFodK/aQlC63NzYTbl6vg==
X-CSE-MsgGUID: KkD8dlCgRy6P0qemgah+/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9805194"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:07:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:07:50 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 00:07:50 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:07:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVCB1wFuRSqe4X192m3Hy4jaP0h2WZuxBLrj5ZByW3J9gJUE5KSmPUmT4URHHsoA+BScFDPsgNvwwCkN55uVPKNiyYrA2+y3dTSri8Ud2RL7qrqTstrqDiolMr5Wcj5mtmo7QyR2oNRt5gYJGJoGBwLoEOnK1ixmmIDaxvnhA1zJ9EeBg1ocqbZqIlwFULeXHxCaGw+VeecWY4/ygGLZKqrNqPqwcqIukk+tJiN833HIpiRriXjiecPjXCxIbTw8Z1kAWcpQp13KA+PlGMJaMW1vWFIHF7UxHB1R7NHN4SMHtJkf5SqA+bzpUKfvXi3Q1Uj65hVjIQB2/Lvb9vXYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzlY45+4AevU+GPwd4hNLmPu59DzjXtb0tynf5IqF6I=;
 b=ZE2f+c6rt41sa924mUIPdV5iReU1ZvFkUUTKNxl28cpicElEaJfxqTPyqQDZhbAG8lKO9NuwYDf8tu7BbBulM6lOm7ImEtjUCHtXzAlUzREIafkD2kmMnRNbpqwcKQ1uScy/oAbryZTXrUhF01A89At1BRaMPXF+6qnb0L4VvkosU2IePjqXjkNSBNli+QBKMZ4AcAamfesBIr0DD7v7XNyWS3vo83LicmozC/T5YZsVBMqBUTxmjpCz2v3FJBmzoR/PaCnN+/nDkHs/ZqSL8C8GyAcjnfaASi0VttLNESSjY4murEujGP59TgpMW3ndtI4MJdjUvKKoOSrgxGbTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzlY45+4AevU+GPwd4hNLmPu59DzjXtb0tynf5IqF6I=;
 b=Ey8TAdzOzGJv+3rZjv2Vba3gJH4o9TPKDrAbAQ8+s5S5EOJzN/37b1s9yWZozqQpNP26N21wD1czkG4/YtUKkrkXXCRHLNAxR1zcxavFfm7JYuKHAqHYlJz8eLeXoY/Dmy3vdB7DFDcussyB1s3oR97d+pctmHme6jfbyPezjes=
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by IA3PR11MB444632.namprd11.prod.outlook.com (2603:10b6:208:53e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:07:47 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:07:47 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzelak, Michal" <michal.grzelak@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>
Subject: Re: [PATCH i-g-t v3 1/3] tests/intel/xe_fault_injection: Reload audio
 driver on exit
Thread-Topic: [PATCH i-g-t v3 1/3] tests/intel/xe_fault_injection: Reload
 audio driver on exit
Thread-Index: AQHdcdV79vbZ6Iob5kaVBtQ0VJ16jbcwux+A
Date: Mon, 16 Nov 2026 08:07:47 +0000
Message-ID: <BL1PR11MB5413C4F1D55EDF65738F5088E27C2@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: BL1PR11MB5413.namprd11.prod.outlook.com
 (15.21.0615.005)
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Intel.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|IA3PR11MB444632:EE_
x-ms-office365-filtering-correlation-id: fadd6900-4209-41e5-affd-08df43b8b388
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|5023799004|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info: AJhsoa+N2wWruoF0EYlqliNPhkIjBh6mw7uBGJuDvIP+Sak58PfF54y0PIodNYYcICy2T1cqt5ci3hGNCVTCqo2ukia16RBUztHggIWA8qmtN6wyMOUiKjo6IIfmSNwg28OTw3BVBJeU6tXpLRaLwJIZRqmf8h2SOW4xiCk3uoWVomWMZb+/Vb8YNUJc+tuUHE6D/8Gsnc3g8owxm4FxwRgQljHgbanq3D1stkZnXZgO7fCiQeTRIHO7gZBzg9eIup0vWPfq1Yq3Q9/RzSGYpux7c1PVjUndgNsDLKIS8FXbpRXKp+Aua0jRQBLz/qbazCRcQwqm9GSK4DfEQQOUIKEWrGG5ZnJ4WIilo//2wH0K/cGmUan+hE5QAvnqEm+Rup5Pp9O6VWLPyV2i4WgNzgiVtqUscxqUu5CVHm3tGuLWE3BXI9JyhP26jUOmlLUTWMRydPu0Tnz2JC+EtOZOWNKH5afI67aCdUvFJ73wZ5Br3kxEWj2Yt7oJqZupaRI6TkdqdOhtCrbn5kapIIp/4SNZ27VoJdUfuuk9ROb/z6umO659ExHI1vTz1xxaTmXo0O9GHDnFucQHtwdExDyyfOpeIs52iYJJJEOJ27PvIO2UQpN1tsOmPltsGZO4rV/ntjmC4SBFg92dru0zUb2T1e4E5+RdJ/A8pEa8drw5RDQLJqrD4ibTlpJVY/20TPRLXHvf5OBKLXdQ+H+gwqjJd1GYRPb97NNsEliH+wkm3LQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(5023799004)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmtKbGtJU1Z0STZjWGpuWUtyV0dyekg2VlE0enJZS0JrbW05QWo1SGg1bUd5?=
 =?utf-8?B?SEFwcmU5a2Exeks5YW01Wk9GYWhLUDZ6UmZHRGVCUzQxYzZUUjVWRFdJWjcw?=
 =?utf-8?B?anIxdW9NbDZXbFFUbU5QOFQrZVdCM0hyMWtTdXJJWDdPNVcyd2NjNFBOYW9P?=
 =?utf-8?B?UGdkZ2hROGRPWEJ2Q0lXUHNueGMwdXphdUdUNWhyQ1VSdkt1dlVURkdLRVo2?=
 =?utf-8?B?dFF3L29SQ1U5RThabHovZHh2QThlczZBSDRZbVBYMXp1cUp6bkhtNnJBTTNx?=
 =?utf-8?B?WUdoaVdOcjV1eDdoWVpIQjNPU2hqODB0Q2c1L2xxZ2JpVWRSUmEwbFY1M3Vx?=
 =?utf-8?B?bTZTUWhRU1NLWHEvb0xaTk8zd1hNQzJlMHpvSjEzUmNta00weUpOd3o2d0Ji?=
 =?utf-8?B?dEZvN3JqNFFWSVpDNnBQekZlUE93RFlzZEJBWGN2N2JxUDRyekFxYjRYcHRR?=
 =?utf-8?B?dldLakpYOURvZERnL2x4ZXpiTkZ4cVVGcTh3QmJyc2RXMlZRSndtSnZxM1Fo?=
 =?utf-8?B?TlVFUDkxR21RSnJqT0k5VDcvQlBqSUxGMStyOGNZODhLb1d2Q0NkMEZ4YVRY?=
 =?utf-8?B?T3pCbFRWMlcrZkI3MENlRUs2WW9xT29LQzg4eDd4RHZGSlJQRG5teHlDZWp6?=
 =?utf-8?B?bFIvZGswbVUzQmpoSTg3RUI1VU1CajIxNHBJMWc1SWdhS2JYcGt1dDMvcUdL?=
 =?utf-8?B?My9md1BybGlsZHNvZzhtVkQyN2lXeElyR3J2MXpSd1Fqc2pxSDdvRTk0NmZJ?=
 =?utf-8?B?VlRXZTNCVDRaVmFENTBTbnZTV1BMM0pqUUJGQmxHMnBIaVpFZGJzNG0wd1B1?=
 =?utf-8?B?OTRKMklUMkU2WWR1OTg2dmxDV1FudHYzcXlGRFVkSUVyOS82VVY3TGJHZ2ZQ?=
 =?utf-8?B?NXV1cWJNMHdUdWZtOXNGUG9XWkdqck9IdE1NVURDTUpnLzNwWDRsaEJTTTVT?=
 =?utf-8?B?YmNnVkRDNHZLVEJzbTRQVUl4UmRBTnFEb1ZicGxoeXpMeFBoUk9JMENCYzFD?=
 =?utf-8?B?UFlEd2dUeFR6OStrUGZwREV5M0gvTFhJTHpsYzRoQlhUOG9IRStsWmx0U2RI?=
 =?utf-8?B?M3l4T1RGSzg2UkhlYlFYL21WWGlkUHJBaGJSZmFCUk1FdW9xQjNvK1BMRGFU?=
 =?utf-8?B?Z3VaSkYxZ2JJUEEzUWdoMUR2RDlOVGo4cjNkTVErTldLejlJb1kwb3pxWmI1?=
 =?utf-8?B?aFFJcjNMY0hoWTl0VVFaUHJyK2pUelBCQ3FlK0VSSjVYNlBzbW1XSzVnOUVR?=
 =?utf-8?B?Nng0QzB6SDA0MXFCZjRMUXpjUWNCUjJqOVRrMDh4UHBhSmIyNDREWElzL0lF?=
 =?utf-8?B?WFlIc1IzdDNPQS9SR000V3R3bjhGM0EvOC8xQUZnNkFxY003aElZcUtRUS90?=
 =?utf-8?B?cmtqOVhhQUJSV0E4dkxCKzFnMW5KSnYrcVBuK1dXdVg0RnJpd3Jha3VWNFFo?=
 =?utf-8?B?UFFnVW1SMWE2d0JYNlI3NEpVQkhiK21qT3VsQ2NnNVFJenRlLzNGbk1vNkw5?=
 =?utf-8?B?YUtWT2puY3pkMEVhYWJhbldiZ3BzeHczUzRBNXRxT1NMTkRsc1crdDZQSnNO?=
 =?utf-8?B?RVdxa3FWVm0vclRDVFBlcXFHNEswU3ViUGxscS9EdzFJeTBCbFUvdnNKbWdu?=
 =?utf-8?B?eDJvemxuUE13VnhOdHNFVnFFOHNDRmg0NXBBVjJBSE5xYXFDeFRseDRXbHlV?=
 =?utf-8?B?bkFqUzltbTlSZWxoMHdwUVNOYlFnR0VrS2NoSDdwcE9xcS9mMzZWMWxJaFVl?=
 =?utf-8?B?MG4zM29FUDNOeVRhekFGYUdoZVlWMFZyM1c3YXU1dmpPZzVreEwrQ2tmSW1W?=
 =?utf-8?B?MXVxS0loM2hOaHFlRDNOZWRNeWRjL3c2bkRuK3hPUlFhSHlhT0lBODdDOFBR?=
 =?utf-8?B?cEdIcEFNbEJnc0dMMWRlcjFBUkVIRlQwRUZJOGxuU1J3RjFCTHc3Y1BwQ01r?=
 =?utf-8?B?em5Nc0RRTEJyanYvcEMxUndSdmdzSTlLa3hXcis2aGYzK3Q5Uy9jckxDRmZL?=
 =?utf-8?B?Z1I0MFVnZGpQbnQ4aUpPVVhBUzFUVk11N3FrTlhQbDByT2pPOEY5cnF6aDBQ?=
 =?utf-8?B?aHRKa2dpYmtZUXkvN2ZtdjNYeG9RbkhmbGtQZ3I0WktxYVlTT05lVHBSZUtw?=
 =?utf-8?B?SEtiRUVMbkY2TGI4MWFxNi96bFRKVVJtSXdlaUFjQ3VMcWtZS0xkcWF3MjlO?=
 =?utf-8?B?a1p1bzBsaTVFNkhINnBmVkdBdHYvUGgxdXkxODhpSW5Ld0Q2MzFGSnhiSmdu?=
 =?utf-8?B?Y3ZQeUROKzBwcnVSSXNkYzRqdXRWT25FTTdYV3F6U082Zm1LMXBSa1B0VDlF?=
 =?utf-8?B?Tkc3WlAxaHM1SFkrVlZXajlNdXZYdnhMWEpjVTZrVkJkQlE4TkROQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47CDF97E99D45B48B60350D556C8FE5E@intel.onmicrosoft.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gW4TMqj5TyMWvEtAOkUKFFyky4jy8yXaMC2YKFyiVnvwa1yYE6Yncsn8+0e54cAGjK0qwXQ2vgDBoUvtvDGRWWdanma4gCOeqwLIY2hpI9mgiaFmiovs+F4nK84sM4ddfY+k1Sp2R1UeNpbJCU6hByk7oKp5m/RlHhii07iekn3lX3MbEuNrGL8zPQIyPg9f4UYQauEMN1Gkd4vtLt8zUAMJU2tny3qufFnnU3Qbi64VzEgTPFvsdhnJXfozm9yj4Y7LKSVq7sC3z99vFmnhutPZAavYH9/coAy/+xe/lhKWy3U4HHDHspXWOo3hfvkVpGlTSzJtT3HgKkLC7rGTLw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fadd6900-4209-41e5-affd-08df43b8b388
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:07:47.4439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SLgU3g5+63ES528Ebgho2wDnmx0kIh2G0C1vX/HFIkSevJWXzkVZhzV4Fue+KnjIDc6Y+M7Uz9LROENqy7OOuPdsRrUyzUb+W4ugCW2/L9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB444632
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCk9uIDExLU5vdi0yNiA1OjE1IFBNLCBDaGFpdGFueWEgS3VtYXIgQm9yYWggd3JvdGU6DQo+
IENvbW1pdCAxMTdlOWVjYmRkMWQgKCJ4ZS9pZ3Rfa21vZF91bmJpbmQ6IHJlbGVhc2UgYXVkaW8g
YmVmb3JlDQo+IHVuYmluZGluZyB4ZSIpIG1hZGUgaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoKSBi
ZSBjYWxsZWQgYmVmb3JlDQo+IHVuYmluZGluZyB4ZSB0byBhdm9pZCB0aGUgYXVkaW8tY29tcG9u
ZW50IGJpbmQgd2FybmluZ3MvZXJyb3JzIHRoYXQNCj4gaGFwcGVuIGlmIHhlIGlzIHJlbW92ZWQg
d2hpbGUgc25kX2hkYV9pbnRlbCBpcyBzdGlsbCBhdHRhY2hlZC4gVGhlc2UNCj4gY2FsbCBzaXRl
cyBwYXNzZWQgTlVMTCBmb3IgdGhlIHVubG9hZGVkIGRyaXZlciBuYW1lLCBzbyBpdCB3YXMgbmV2
ZXINCj4gdHJhY2tlZCwgYW5kIG5vdGhpbmcgaW4gdGhpcyBmaWxlIGV2ZXIgcmVsb2FkZWQgaXQg
YWZ0ZXJ3YXJkcy4NCj4gDQo+IEFzIGEgcmVzdWx0IHNuZF9oZGFfaW50ZWwvc25kX2hkbWlfbHBl
X2F1ZGlvIGlzIGxlZnQgdW5sb2FkZWQgZm9yIHRoZQ0KPiByZXN0IG9mIHRoZSBib290IGV2ZW4g
d2hlbiBldmVyeSBzdWJ0ZXN0IHBhc3Nlcywgc2luY2UgdGhlIHRlc3QncyBvd24NCj4gdGVhcmRv
d24gb25seSBldmVyIHJlYmluZHMgeGUsIG5ldmVyIHRoZSBhdWRpbyBkcml2ZXIuDQo+IA0KPiBD
YXB0dXJlIHRoZSB1bmxvYWRlZCBkcml2ZXIgbmFtZSBhbmQgcmVsb2FkIGl0IGZyb20gdGhlIGV4
aXQgaGFuZGxlciwNCj4gd2hpY2ggSUdUIGd1YXJhbnRlZXMgcnVucyBvbiBib3RoIG5vcm1hbCBj
b21wbGV0aW9uIGFuZCBhIGZhdGFsIGFib3J0Lg0KPiANCj4gQWRkIGlndF9hdWRpb19kcml2ZXJf
bG9hZCgpLCB0aGUgcmVsb2FkIGNvdW50ZXJwYXJ0IG9mDQo+IGlndF9hdWRpb19kcml2ZXJfdW5s
b2FkKCksIHRvIGxpYi9pZ3Rfa21vZC5jIGluc3RlYWQgb2Ygb3Blbi1jb2RpbmcgdGhlDQo+IHJl
bG9hZCBhdCBlYWNoIGNhbGwgc2l0ZS4NCj4gDQo+IHYyOg0KPiAtIEFkZCBGaXhlcyB0YWcgKFBy
YW5heSkNCj4gLSBNb3ZlIHRoZSBhdWRpbyByZWxvYWQgYWhlYWQgb2YgaW5qZWN0aW9uX2xpc3Rf
Y2xlYXIoKSBpbg0KPiAgICBjbGVhbnVwX2luamVjdGlvbl9mYXVsdCgpIHRvIGF2b2lkIGZhaWx1
cmVzIGxlYWRpbmcgdG8gYXVkaW8NCj4gICAgZHJpdmVyIHJlbWFpbmluZyB1bmxvYWRlZCAoUHJh
bmF5KQ0KPiAtIFdhcm4gdmlhIGlndF93YXJuKCkgaWYgdGhlIHJlbG9hZCBmYWlscyAoUHJhbmF5
KQ0KPiAtIEFkZCBhbmQgdXNlIGlndF9hdWRpb19kcml2ZXJfbG9hZCgpIGluc3RlYWQgb2Ygb3Bl
bi1jb2RpbmcgdGhlDQo+ICAgIHJlbG9hZCBhdCBlYWNoIGNhbGwgc2l0ZSAoRG55YW5lc2h3YXIp
DQo+IA0KPiB2MzoNCj4gLSBSZW1vdmUgZnJlZSgpL05VTEwgZnJvbSBpZ3RfYXVkaW9fZHJpdmVy
X2xvYWQoKSBhbmQgZnJlZQ0KPiAgICBzbmRfZHJpdmVyIGV4cGxpY2l0bHkgYXQgZWFjaCBjYWxs
IHNpdGUgaW5zdGVhZCAoRG55YW5lc2h3YXIpDQo+IA0KPiBDYzogTWljaGHFgiBHcnplbGFrIDxt
aWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IENjOiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwu
Y29tPg0KPiBDYzogU3dhdGkgU2hhcm1hIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4NCj4gQ2M6
IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gQ2M6IFByYW5h
eSBTYW1hbGEgPHByYW5heS5zYW1hbGFAaW50ZWwuY29tPg0KPiBDYzogRG55YW5lc2h3YXIgQmhh
ZGFuZSA8ZG55YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+DQo+IEZpeGVzOiAxMTdlOWVjYmRk
MWQgKCJ4ZS9pZ3Rfa21vZF91bmJpbmQ6IHJlbGVhc2UgYXVkaW8gYmVmb3JlIHVuYmluZGluZyB4
ZSIpDQo+IFNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1
bWFyLmJvcmFoQGludGVsLmNvbT4NCkxHVE0sDQpSZXZpZXdlZC1ieTogRG55YW5lc2h3YXIgQmhh
ZGFuZSA8ZG55YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICAgbGliL2ln
dF9rbW9kLmMgICAgICAgICAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ICAgbGliL2lndF9rbW9kLmggICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ICAgdGVz
dHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMgfCAxMSArKysrKysrKy0tLQ0KPiAgIDMgZmls
ZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9saWIvaWd0X2ttb2QuYyBiL2xpYi9pZ3Rfa21vZC5jDQo+IGluZGV4IDE3NzZiYjQx
NS4uNzY2ODBmY2E1IDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2ttb2QuYw0KPiArKysgYi9saWIv
aWd0X2ttb2QuYw0KPiBAQCAtNTU3LDYgKzU1NywzNCBAQCBpbnQgaWd0X2F1ZGlvX2RyaXZlcl91
bmxvYWQoY2hhciAqKndobykNCj4gICAJcmV0dXJuIGlndF9hbHdheXNfdW5sb2FkX2F1ZGlvX2Ry
aXZlcih3aG8pOw0KPiAgIH0NCj4gICANCj4gKy8qKg0KPiArICogaWd0X2F1ZGlvX2RyaXZlcl9s
b2FkOg0KPiArICogQHdobzogUG9pbnRlciB0byBhIHN0cmluZyB3aXRoIHRoZSBuYW1lIG9mIHRo
ZSBhdWRpbyBkcml2ZXIgdG8gYmUNCj4gKyAqIChyZSlsb2FkZWQsIGFzIHByZXZpb3VzbHkgZmls
bGVkIGluIGJ5IGlndF9hdWRpb19kcml2ZXJfdW5sb2FkKCkuDQo+ICsgKg0KPiArICogUmVsb2Fk
cyB0aGUgYXVkaW8gZHJpdmVyIHByZXZpb3VzbHkgdW5sb2FkZWQgYnkgaWd0X2F1ZGlvX2RyaXZl
cl91bmxvYWQoKSwNCj4gKyAqIGlmIGFueS4gVGhpcyBpcyBhIG5vLW9wIGlmIEB3aG8gaXMgTlVM
TCBvciBwb2ludHMgdG8gTlVMTC4gVGhlIGNhbGxlcg0KPiArICoga2VlcHMgb3duZXJzaGlwIG9m
IEB3aG87IGl0IGlzIGxlZnQgdW50b3VjaGVkIGhlcmUsIHNvIHRoZSBjYWxsZXIgY2FuDQo+ICsg
KiBmcmVlIGl0IChvciBjYWxsIGlndF9hdWRpb19kcml2ZXJfdW5sb2FkKCkgYWdhaW4pIHdoZW5l
dmVyIGl0IHNlZXMgZml0LA0KPiArICogdHlwaWNhbGx5IG9uIHRlc3RjYXNlIGNsZWFudXAuDQo+
ICsgKg0KPiArICogUmV0dXJuczogMCBpbiBjYXNlIG9mIHN1Y2Nlc3Mgb3IgLWVycm5vIGluIGNh
c2UgdGhlIG1vZHVsZSBjb3VsZCBub3QNCj4gKyAqIGJlIGxvYWRlZC4NCj4gKyAqLw0KPiAraW50
IGlndF9hdWRpb19kcml2ZXJfbG9hZChjaGFyICoqd2hvKQ0KPiArew0KPiArCWludCByZXQ7DQo+
ICsNCj4gKwlpZiAoIXdobyB8fCAhKndobykNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gKwlyZXQg
PSBpZ3Rfa21vZF9sb2FkKCp3aG8sIE5VTEwpOw0KPiArCWlmIChyZXQpDQo+ICsJCWlndF93YXJu
KCJDb3VsZCBub3QgbG9hZCBhdWRpbyBkcml2ZXIgJXMgKCVzKVxuIiwgKndobywgc3RyZXJyb3Io
LXJldCkpOw0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiAgIGludCBfX2lndF9p
bnRlbF9kcml2ZXJfdW5sb2FkKGNoYXIgKip3aG8sIGNvbnN0IGNoYXIgKmRyaXZlcikNCj4gICB7
DQo+ICAgCWludCByZXQ7DQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ttb2QuaCBiL2xpYi9pZ3Rf
a21vZC5oDQo+IGluZGV4IGM5NzAwMjQwYy4uZjZjMTdmZjczIDEwMDY0NA0KPiAtLS0gYS9saWIv
aWd0X2ttb2QuaA0KPiArKysgYi9saWIvaWd0X2ttb2QuaA0KPiBAQCAtNTAsNiArNTAsNyBAQCBf
X2F0dHJpYnV0ZV9fKChub25udWxsKSkgaW50IGlndF9rbW9kX3JlYmluZChjb25zdCBjaGFyICpt
b2RfbmFtZSwNCj4gICAJCQkJCSAgICAgY29uc3QgY2hhciAqcGNpX2RldmljZSk7DQo+ICAgDQo+
ICAgaW50IGlndF9hdWRpb19kcml2ZXJfdW5sb2FkKGNoYXIgKip3aG9tKTsNCj4gK2ludCBpZ3Rf
YXVkaW9fZHJpdmVyX2xvYWQoY2hhciAqKndob20pOw0KPiAgIA0KPiAgIGludCBpZ3RfaW50ZWxf
ZHJpdmVyX2xvYWQoY29uc3QgY2hhciAqb3B0cywgY29uc3QgY2hhciAqZHJpdmVyKTsNCj4gICBp
bnQgaWd0X2ludGVsX2RyaXZlcl91bmxvYWQoY29uc3QgY2hhciAqZHJpdmVyKTsNCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jIGIvdGVzdHMvaW50ZWwveGVf
ZmF1bHRfaW5qZWN0aW9uLmMNCj4gaW5kZXggZTBhNDYxODIwLi5mM2M0YWQzYWMgMTAwNjQ0DQo+
IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+ICsrKyBiL3Rlc3RzL2lu
dGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+IEBAIC0zMSw2ICszMSw3IEBADQo+ICAgI2RlZmlu
ZSBNQVhfSU5KRUNUSU9OU19QRVJfSVRFUgkxMDANCj4gICANCj4gICBpbnQzMl90IGluamVjdF9p
dGVyc19yYXc7DQo+ICtzdGF0aWMgY2hhciAqc25kX2RyaXZlcjsNCj4gICBzdHJ1Y3QgZmF1bHRf
aW5qZWN0aW9uX3BhcmFtcyB7DQo+ICAgCS8qIEBwcm9iYWJpbGl0eTogTGlrZWxpaG9vZCBvZiBm
YWlsdXJlIGluamVjdGlvbiwgaW4gcGVyY2VudC4gKi8NCj4gICAJdWludDMyX3QgcHJvYmFiaWxp
dHk7DQo+IEBAIC0xOTUsNiArMTk2LDEwIEBAIHN0YXRpYyB2b2lkIHNldHVwX2luamVjdGlvbl9m
YXVsdChjb25zdCBzdHJ1Y3QgZmF1bHRfaW5qZWN0aW9uX3BhcmFtcyAqZmF1bHRfcGFyDQo+ICAg
DQo+ICAgc3RhdGljIHZvaWQgY2xlYW51cF9pbmplY3Rpb25fZmF1bHQoaW50IHNpZykNCj4gICB7
DQo+ICsJaWd0X2F1ZGlvX2RyaXZlcl9sb2FkKCZzbmRfZHJpdmVyKTsNCj4gKwlmcmVlKHNuZF9k
cml2ZXIpOw0KPiArCXNuZF9kcml2ZXIgPSBOVUxMOw0KPiArDQo+ICAgCWluamVjdGlvbl9saXN0
X2NsZWFyKCk7DQo+ICAgfQ0KPiAgIA0KPiBAQCAtMzExLDcgKzMxNiw3IEBAIHN0YXRpYyB2b2lk
IHByb2JlX2ZhaWxfZ3VjKGNvbnN0IGNoYXIgcGNpX3Nsb3RbXSwgY29uc3QgY2hhciBmdW5jdGlv
bl9uYW1lW10sDQo+ICAgCQlmYXVsdF9wYXJhbXMtPnRpbWVzID0gTUFYX0lOSkVDVElPTlNfUEVS
X0lURVI7DQo+ICAgCQlzZXR1cF9pbmplY3Rpb25fZmF1bHQoZmF1bHRfcGFyYW1zKTsNCj4gICAJ
CWluamVjdF9mYXVsdF9wcm9iZShwY2lfc2xvdCwgZnVuY3Rpb25fbmFtZSk7DQo+IC0JCWlndF9h
dWRpb19kcml2ZXJfdW5sb2FkKE5VTEwpOw0KPiArCQlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZCgm
c25kX2RyaXZlcik7DQo+ICAgCQlpZ3Rfa21vZF91bmJpbmQoInhlIiwgcGNpX3Nsb3QpOw0KPiAg
IA0KPiAgIAkJLyoNCj4gQEAgLTY2Niw3ICs2NzEsNyBAQCBpbnQgaWd0X21haW5fYXJncygiSToi
LCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsIE5VTEwpDQo+ICAgCWlndF9maXh0dXJlKCkg
ew0KPiAgIAkJY2xvc2Uoc3lzZnMpOw0KPiAgIAkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+IC0J
CWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKE5VTEwpOw0KPiArCQlpZ3RfYXVkaW9fZHJpdmVyX3Vu
bG9hZCgmc25kX2RyaXZlcik7DQo+ICAgCQlpZ3Rfa21vZF91bmJpbmQoInhlIiwgcGNpX3Nsb3Qp
Ow0KPiAgIAl9DQo+ICAgDQo+IEBAIC02NzgsNyArNjgzLDcgQEAgaW50IGlndF9tYWluX2FyZ3Mo
Ikk6IiwgTlVMTCwgaGVscF9zdHIsIG9wdF9oYW5kbGVyLCBOVUxMKQ0KPiAgIAkJCWVyciA9IGlu
amVjdF9mYXVsdF9wcm9iZShwY2lfc2xvdCwgcy0+bmFtZSk7DQo+ICAgDQo+ICAgCQkJaWd0X2Fz
c2VydF9lcShzaG91bGRfcGFzcyA/IDAgOiBJTkpFQ1RfRVJSTk8sIGVycik7DQo+IC0JCQlpZ3Rf
YXVkaW9fZHJpdmVyX3VubG9hZChOVUxMKTsNCj4gKwkJCWlndF9hdWRpb19kcml2ZXJfdW5sb2Fk
KCZzbmRfZHJpdmVyKTsNCj4gICAJCQlpZ3Rfa21vZF91bmJpbmQoInhlIiwgcGNpX3Nsb3QpOw0K
PiAgIAkJfQ0KPiAgIA0KDQo=

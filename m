Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6527D6EC0B
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 13:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686A210E1AF;
	Fri, 29 Nov 2024 13:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkxSockS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB68410E1AF;
 Fri, 29 Nov 2024 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732888107; x=1764424107;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LyAMnPeYS7LVETOPD4ltVbbw7N9fB4l0q4e1jsdDYBg=;
 b=EkxSockSSzP8sQ+B46In8+KKuHxmMBL4hUxbI7Bu3LK3xS2ZWFVaLcpH
 w21b55GKkI97MGFRaErjAM3N5bQ8lxWoiwBTw1vTd+E/zBWmHx56XLHNu
 rowuOY/pt6pXoF5YzRLHwTvHB5cXC8vOWZvcXS5ps5Xf85p++lwMMJva2
 NT2NKnKwh7ZxvGoXbcAhVUNGHFMToUTKXc3MDVxXExDbOL57tob6hOyoB
 mUGgOPjSM3IAjSsmKIWrArynS4/0uHFwpihVbziN0DIoqzWGSecHOlWeq
 PJdkZ16PL8HMFU2sAg6CvDGbFkwFcktKhXmVgtaX6zn38CW/0uZHsx7vS g==;
X-CSE-ConnectionGUID: jiJYD/MYQt6NKmDUGvN0uw==
X-CSE-MsgGUID: 0DCIMzqIRAiwzscRfNDdCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32487418"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="32487418"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 05:48:25 -0800
X-CSE-ConnectionGUID: rLI98yyGSZq6pvyPlTzu5A==
X-CSE-MsgGUID: IP9a9tkCTaSIzQAwA4sTMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="97594654"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2024 05:48:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 29 Nov 2024 05:48:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 29 Nov 2024 05:48:24 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 29 Nov 2024 05:48:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qW5wlkFx4Myhzlao1wSet1yGSGU1ouTwaVFUF0NTMqItETs0O9CSgre+Wj0w0XyH9s71q6cIiXQKnH+9g2bz0H2wmtFYBXvXVxFa/NMbt1Skl3Cd+zDJ7D6H626qPgVjE+puMyBBwkb8BQoVUv8c0b+Xfa/bP9f9SURVRkrPdQDz/bkOUxsOZCL64YlqeB1/+IZ4kHPTc1+0/xT95G0H0nMfM8Q4Tp/HctFqeMUguTjrVVrm8arDwSEL/pog3uoYe3g2iEfZ1t0hhO3qXx7krOG/5ZOLLVt/y4HXpwxbZU4sHY7nDc1pXk/ITnoH7CAYqFlTG5lfhraUEurByXsDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyAMnPeYS7LVETOPD4ltVbbw7N9fB4l0q4e1jsdDYBg=;
 b=poxVQaqNfF3ey9FS7CfiA+mBJk+uUi5fymZFq60yyOg500Om3d/L1ab1WCKwTvE+g8HbDJ3ZBXBRJpIKd8mfZXo+n5xlz0q0fEXBOJK+3mUzGw4TkcWwY04Xg3qoKobPe8YDf0X/ycuZ5PpEwGmPp5gjPp8hJlpOvoHGatm/BaC7wEfByTtJIkJcVIeJdUyiprpPjD8V3lU/CFd+i4/ll93Aag/3CStRB6CisY7lJGAYH+PrY7XgxK0YwwdzhRBluc+RDLYA0c+CMSq3epYv7UmpIZNWNe08+TA0O5TFlaHPn/F4ZZL3nKZgynQRo8IajBvhZD3KXLxDH5/meyOItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Fri, 29 Nov
 2024 13:48:17 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714%7]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 13:48:17 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgaWd0LXJ1bm5lciBm?=
 =?utf-8?Q?act_checking_(rev9)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBpZ3QtcnVubmVyIGZhY3Qg?=
 =?utf-8?Q?checking_(rev9)?=
Thread-Index: AQHbQjXJ2bdwh5ugdEmoQz4j25bG/rLN6YIAgABckaA=
Date: Fri, 29 Nov 2024 13:48:17 +0000
Message-ID: <PH8PR11MB67535F5C6A3157F2CDC459C7F22A2@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173286764294.213798.1042774316885389138@b555e5b46a47>
 <2133e8a2-9a00-4aad-b0fa-f30e8ba271ca@linux.intel.com>
In-Reply-To: <2133e8a2-9a00-4aad-b0fa-f30e8ba271ca@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|BN9PR11MB5225:EE_
x-ms-office365-filtering-correlation-id: 250f846a-d5f5-491c-a434-08dd107c7a67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?a21qakRjNXRSQjl2YUxwdFBGSVhIdkozZjdhWG0wR01FQk5tRzlObmhPVjNz?=
 =?utf-8?B?U2VCQ29BZkhkbVpOMldxei9QSmdSd21TdnBsei8xQXU5YWVTbDVUZFZuUlJu?=
 =?utf-8?B?eE9lMitQZEpvVVRsaXFqTHJBVy9ybHU0TFFUS0M5RGdYeWJoNDZjTmJrYnA5?=
 =?utf-8?B?bEdIcm9nMVFESFQyTFl4U083U0VCd1plaGFhYmlqaisyaEZUMVc0RVpMYTZr?=
 =?utf-8?B?K0I5VWd1MzRuWDZOYmhqMzdNZHUxVVB4elR2aFJ1SmV3MEpWZFZCSkdsQXBx?=
 =?utf-8?B?UDdoYytCQzcxNVQ2Yjh4VXFmUk14VFh5N3V3amJQTEJNN2VIUnJYSmpGNUM3?=
 =?utf-8?B?SDNtZCs2RUhPcWRWMVBiMHgrUVpyaFVVcWlWUWZySVNERTNGOHZpakM2b2xT?=
 =?utf-8?B?ZngyaFZhTGdRQ3JRZEMvR1Y5S09vUFRZY29oeW1RdWtGYzBLSERHdTdpdlVi?=
 =?utf-8?B?NlJaSGJkQkp3dHl6Q05hU1pHeVZNTXcwbDM3Nm0zK0VOM240YWZRQ1JIRTE4?=
 =?utf-8?B?UHYxaWpDUUNDejJTWk1MMGdrOWN0OU95WHgvbU95MmlPRklGbVhDcVl4bmpS?=
 =?utf-8?B?dmVRazQxbDVoR2JaQzNPUlZDRUhUdmlpUGZGUHJTOWRIMjREV1kyTFJaUGVJ?=
 =?utf-8?B?a3p3UmVycnVDVndhZXRoUHFTVnhlTkNPWHh1c0FRZmt4eXowZWlCTXpWK1g2?=
 =?utf-8?B?Z3BhVFUxM295TkxuSS9MWHRpRFRvUTZiUE1UT0htOTB2amRyTE55dDdxRlBl?=
 =?utf-8?B?YVhFVUNTbTJtRU9odVV5OWxZaFJPWFEwZDNRaWNBRHhtYTNZSm1uQ2szeTZ6?=
 =?utf-8?B?R1YwNVB4QkpwMmZweXdHajJWTXh3WW5yZkFKeXB2Z0dlNU5RWFNKVEVaNGYv?=
 =?utf-8?B?eTMrNjhPam50OE94UEpJVFRodWlWSEErOVlNc29CN0R6YVl4MHFubDgyelg0?=
 =?utf-8?B?b3VBM1N5TzhDS0FJeXgzbExySElnWWVidmd5V1VIOWtWQlJDSUNNUUlkcWJY?=
 =?utf-8?B?R1A0M3VGZzFKRTVHM1YrNGZlL3Zqb0hNekI5cW15bVphcTk2UTQ3RTZmL1NW?=
 =?utf-8?B?K0N0WjN6NVU0bkxGYUVycTRSdGFWWUlXMGo4WGJkOGp1enFsdlRwbVN1Vk51?=
 =?utf-8?B?eTU5eEZBODFnTUMwQ0J4RnFibDlteXJSNHl4eVNqYUcyWkg2NWxVd29McnQ0?=
 =?utf-8?B?YlZKYVF4TUJGZnRRdTV2bTlZNVM3Wm5GdGYvaFRUazVwbE5iMWNWVnJqNGw0?=
 =?utf-8?B?cFU3VUNGNWRPMXkvOHJuenMyaFc0U2loTkxsN3hDM3NOVUVrUzU5WVRaNXFI?=
 =?utf-8?B?OU5wS1BsWFpjOGdrK3hQYndCcVRISlQ2aVpkNUNYSko2cUdzQ3dkbzNTRDJP?=
 =?utf-8?B?QVU0RDVUSE4wSzFpL21vMnRQRCtMdDNwc0hYcnZNcVByUitOaC96M0RMTmFS?=
 =?utf-8?B?TnJBNzk1QzZoZkZ3TWt0eU5TOGQ5OG1IbTNVL0pnUE5peHpSL2kva3JRRUxU?=
 =?utf-8?B?SWwvb1Z6Q0lXamszMmlUZ203YjVBei9HTC9wU1dpbjJvdUJXMzlkeUVvWGcx?=
 =?utf-8?B?SndxeFNQZ2lGNTRTdTV0M215U203cXE3ZVJQQ2U1Z1FGMXdGT0pwdlJXY0x6?=
 =?utf-8?B?bVJ3Mkl6NnRnTThrR1RRRFFOMnFUekJkR3ZnMVFpUE9rdjVmRy9zemttRkx3?=
 =?utf-8?B?alNYUzA0OVNEQ05tV2xLVXhOamRNSE1aWWFVTmtNS0J1U2tnMDlidlRIeDBq?=
 =?utf-8?B?Y0Z3VWVvMnRhRmJqcW5IQlYyYzg4bTFYcnVPTGxHMUVsWkhQcWg3eE1kOUN0?=
 =?utf-8?Q?yFfX4wvAd0TPb1qBhOGn3yLgNU46yma1v+hKI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anREWTBsdXpia2lOUmY0RXVuOWhUajRqb3cyYXFoVEdDZlgxRFdYSzNiWVNP?=
 =?utf-8?B?RkVmN2loOGpYU0wwcDdTdE8yT2swVDdqcWJEQ2lnc3RUQ1BwRVRsekJNQS85?=
 =?utf-8?B?MDVtNGxqdXZpSU5iNmw3Zm91RlZ5aXlodFhFUzUycVhkTDVoaEdpTVFBbjZw?=
 =?utf-8?B?cFAxczlScmdtemp2clo4WERJNFhIdDJadENGTXJwQkUzOGU3NzJMNmpLVTM4?=
 =?utf-8?B?QkpqZDNmZyttR1FYMU80a1E4Z3ZaREtyOWFyczFnSXhweWh6blpxcGFWODJP?=
 =?utf-8?B?NXJpQnV4NlQ1T0puV2U5Wml5ZDhncDV2eFN4MXBPeWxYMGtnZTFRMjFHZlB6?=
 =?utf-8?B?RjlQQThzSkp3YW5IVTJOT0NTeHRIams0RStPL1JvSmUrM1hQSzVyUmZxbDBB?=
 =?utf-8?B?dHVEZ1FLeHpuT0lZVjhZQU1GY3JIek5BQWlBMTZFZHV4RXRObi9BUllkbjN3?=
 =?utf-8?B?RUZuUFZPWjZzMXJJRmFUWVN5d0RqZnNoVmVXRHFKeVhwU2V1M1g5eXVCOTlq?=
 =?utf-8?B?dFFHMTlNTXBFZDBDaW9jUFMwKzU4UXNTU2FkLy94b1hsTDgzWlFsRjF1am1i?=
 =?utf-8?B?SGo3YUM4WHByNlVZRVR5SVJoWFJLaUpEL2FmVUZPYUtaaEhlcytVaGJWQWlB?=
 =?utf-8?B?ZS9zSkFwV2tjTWM5SVoyem1ZM3VxVm0yekk4OUJGQU9BeitMWWtnKzh2SEps?=
 =?utf-8?B?cmVNYjJRRDg1TjJHelFweTdyYmFjSWQwdVM1N2hpQW1uSGtVSkllYm9tbWNX?=
 =?utf-8?B?K2pqUXk3OFQ4Q29TQkFwZEQvTGZ0YWQrODQ5eGxYT2J3Q0JsZWtsZDBVMjh3?=
 =?utf-8?B?TW1UUFpveGx3VTBwbFQ5bVpySHplRHhhRTB2Rm1vWUM2Y2JsSzFxNEg2MDVy?=
 =?utf-8?B?azJCaXdmSEFTbFBCcFFjSHNPaEZHSFJlZGtUSTJiNTNjampMZTE5SUdxLy9r?=
 =?utf-8?B?eHFvakdONUpmdGFONDVuaTZBMnE0bkpiSnFRZzI0WFlXcGUxZHp3a1UwZy9V?=
 =?utf-8?B?Y3FMRExaTVBmZzZ0bWMzRnRGZUVPWjcxL3A4bmtwK2luUlVEUzBSeHRMN1Fa?=
 =?utf-8?B?VXZoaktIdjZuUWtkdTV3WkdJTHBzVHFyVkxvd3hEVThpQTBoN3NVSXpMNlBL?=
 =?utf-8?B?N0hub05XTU1DaW1VWWpuUnhCQVhpWXh4MTJDTU9xRFF6MHFkeHdodnRHNmRw?=
 =?utf-8?B?RURPdldqWGptbUR5WXBCV1Z3VjcxYjBzbUJ1MjR0L2hPY1RoU1RndGtHa0xQ?=
 =?utf-8?B?dytKejhOWElMcXA3LzlUb0tOK003VDVyQ0l6ZDhkVDhKQm5BL1lmTEg4b2l4?=
 =?utf-8?B?UytnWm5BYlZBaE5NZ3M2eWVnT0ZaZUd3NHNPbUFWbDR5L2h2bWdCNTlIdWJG?=
 =?utf-8?B?ckMxbjdMU1RtdkRCaGhHWlg5ZzQzdytyejRJd3lGTVp2dEdMeVFFNWxNSy84?=
 =?utf-8?B?N3IwSC96UUtBbEV0RU1yTDdldGI1ckhjUHd3OEw3dDN3bWM4TngvelBFNmxO?=
 =?utf-8?B?MEtUY25tcHo5RWVBWG5qTExBWkY2dFI4dUpXSTN1bGFySlpmSUh5a01xZjBE?=
 =?utf-8?B?Mk81UHJ2MmFYV2d3N2o3K2x6Z29ISGRGeXpuN1JLbkxzRVFUOW5OdW5ld2lI?=
 =?utf-8?B?VWlVanU2S3pyT3lDK2ZqYlpBUi9tdStRSm1nWktMdCtjcmowUWFlQzZSMWY5?=
 =?utf-8?B?ZUhLQm1FcjhzTERDMHIzN3F5N0p4SlpqRVZXOG9Odzk5YWdydCtTTEIrNWZt?=
 =?utf-8?B?RkpSL0pBaUp0aHV2TXMyRmZibCtlRUlGZ1loYnNXQjFrTWNNQ2oyaExZWTh6?=
 =?utf-8?B?MmFDSWkxRFpINUFQdFRsOTRDRkhjcWVDbHg4blRDcU82UW52RHNlcERWMG5S?=
 =?utf-8?B?WGI0UTEvSXVkVUhHU0FRV2VCbHVyOUFybzk5V3ZYUU8zQXJobjN4OEM1dlVu?=
 =?utf-8?B?bHVpMnVSdnR5K2E2aXFkcndaQllnWC8ydktxUlJlSS9FT0Z4SWx3QXo0Ykt2?=
 =?utf-8?B?Qm1PLytlajdrMU5haXlaUWc0a1R4OXdXamV6ZnliYlc3WnBRb2xCcVplY001?=
 =?utf-8?B?djQ0bGM4dW5NQVQ2c0pWZmJjeDhoYk1xaVEzWjJ2WDNuMlMyc1RSMDFxcVU4?=
 =?utf-8?B?Mlhtamh0NWtTVHpXb2ZzTzN4YnRSZHhYdTBOZDRXVEZxMDkwTlZsdHZxRGRS?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250f846a-d5f5-491c-a434-08dd107c7a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 13:48:17.1502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUzqCLzRCQnd/EAdElx074dLnUrU0lXOa2QneJyzdh4s93gd9VbMDOttNHO5qY/KfZfyPRshsT/fCDPB/L3tOMj1Fz+SyyCuq6XEP5j9G8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQwODQxLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIgU2VubmEgVHNjaHVkaW4NClNl
bnQ6IEZyaWRheSwgTm92ZW1iZXIgMjksIDIwMjQgMTo0NiBQTQ0KVG86IGlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3Vi
amVjdDogUmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgaWd0LXJ1bm5lciBmYWN0IGNo
ZWNraW5nIChyZXY5KQ0KDQoNCkRlYXIgSTkxNSwNCg0KT24gMjkuMTEuMjAyNCAwOTowNywgUGF0
Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBpZ3Qt
cnVubmVyIGZhY3QgY2hlY2tpbmcgKHJldjkpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDA4NDEvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4g
PT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBJR1RfODEzMCAt
PiBJR1RQV18xMjIxOSANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVS
RSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEy
MjE5IGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0K
PiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8g
d2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTIyMTksIHBsZWFzZSBu
b3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcp
IHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdo
aWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwg
VVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18x
MjIxOS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICg0NSAtPiA0NCkNCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE1pc3NpbmcgICAgKDEpOiBm
aS1zbmItMjUyMG0gDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZl
IGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xMjIxOToNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAj
IyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBp
OTE1X3BtX3JwbUBtb2R1bGUtcmVsb2FkOg0KPiAgICAgLSBmaS1rYmwtZ3VjOiAgICAgICAgIFtQ
QVNTXVsxXSAtPiBbQUJPUlRdWzJdDQo+ICAgIFsxXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RfODEzMC9maS1rYmwtZ3VjL2lndEBpOTE1X3BtX3JwbUBtb2R1
bGUtcmVsb2FkLmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMjIxOS9maS1rYmwtZ3VjL2lndEBpOQ0KPiAxNV9wbV9ycG1A
bW9kdWxlLXJlbG9hZC5odG1sDQo+IA0KPiAgICogaWd0QGttc19mbGlwQGJhc2ljLXBsYWluLWZs
aXBAYi1kcDE6DQo+ICAgICAtIGZpLWNmbC04MTA5dTogICAgICAgW1BBU1NdWzNdIC0+IFtETUVT
Ry1XQVJOXVs0XQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvSUdUXzgxMzAvZmktY2ZsLTgxMDl1L2lndEBrbXNfZmxpcEBiYXNpYy1wbGFpbi1mbGlw
QGItZHAxLmh0bWwNCj4gICAgWzRdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMjIxOS9maS1jZmwtODEwOXUvaWd0QA0KPiBrbXNfZmxpcEBiYXNp
Yy1wbGFpbi1mbGlwQGItZHAxLmh0bWwNCg0KVGhlc2UgYXJlIHVucmVsYXRlZCB0byBteSBjaGFu
Z2UuIFBsZWFzZSBmaXggYW5kIHJlLXJ1bi4NCg0KVGhhbmsgeW91LA0KDQpQZXRlcg0KDQpbLi4u
XQ0K

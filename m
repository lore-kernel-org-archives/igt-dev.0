Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2307D68BF0
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 08:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7066B10E181;
	Thu, 18 Dec 2025 08:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1eOo+FE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A11210E181
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766047164; x=1797583164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ggiTXsKOglk4UlgHBrlIdSynYGdpr17x1cwuAELBfJI=;
 b=Y1eOo+FE+mT6oORDFGa3XeUj8a4vj7TLtmol9jIiqcfEh7LHTOeUCWrp
 t7oV25qlSUqtlyN6k8rz12/FCOgfFhhRDTYowd+ORo/kCvQEf2DFxjk8H
 62E1m0pczllWNKn0ykllIKn6NyRXQ6nGZeXdIONsT0PjY/Lw7C12l8W64
 xZc5FXjcD8TJi6DicRDJCFDK2WP5c7urdEHfcTWg39y6rtyNf2yA6lS23
 6Ls0wtUQLbPu2A6hWMi+AgwJDPCYnWZ94ue4j3zV1DALmCGUdfR+cohrC
 RfDMvAYFU8nmNx6GnBhys81cxHaWiUb95Ikcnaktqt+3fkGZnskt2oKNP w==;
X-CSE-ConnectionGUID: B5aXnQmeThCoQbpc12kpNw==
X-CSE-MsgGUID: /cqYB9n+Rn2Ng1Qnad7Juw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79117978"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79117978"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:39:17 -0800
X-CSE-ConnectionGUID: eGvDG4u+Q5aIhm1rAV/pfA==
X-CSE-MsgGUID: YWfHsL3gQjKoe3/3ZORapA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198423008"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:39:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 00:39:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 00:39:14 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 00:39:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfKwJqCSy84cU53AVNsnzGantBNFURNWywJAGhphfRyp+9eyjn5ZC6k/9znLVPXS6KppSWJcPAzGcdD3rU068vqRrP0TVw6kXiL4SiiSziaKk9SWd9KFmTMDzlgDnfz05zwZOdFh+Z9XlaXyubP0Ab++bbzXd032mVqwWgBttiguSCIqIxx58eV1eJgL95aWXVqPeM4vHktjnSXS0wVerMuGm3vAiB10DOXOWhlY5Hru7G0ZUmlS/PdaBVICY1Mur2euTWZg77dJ1K0FoZo08gzBwLNkdO0iNZ/skM/OoRMbSoTmmAGYotjvx5qaMptvM5qh8sm7UHoanXF1Xx2XTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggiTXsKOglk4UlgHBrlIdSynYGdpr17x1cwuAELBfJI=;
 b=HxTBsqxv0LCTuE49uGLI7Eg4Jn+yEqfLTacaQmEVzNQ8y89PN709SRWLHqjtWEsQnjf4GjdrDz7di3UQd1sGVjTqVKXTLdJo744x5edLAyLLECUwMiZyNQ81RCLSz7tce1iZ5BH6NN8O7wytdrnwaJwG0iQ6LrpH4+fqlY3kczrSYS5vu7xrKYR67RC3lFFEv0kZ8q+LLgGNVTOcIZZKTlwqlL357DLMKg1qJWoZyWG8q3koeH3JNsaG+tJSLTPzFgzy640WItHxTjdb7DHqmSwBBMYzPY4EjCfAju4rRfSHddf95elnxoyX1X2bEiYyDZrztDoYxTsRNUilcj7/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 08:39:12 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 08:39:12 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>
CC: "Samala, Pranay" <pranay.samala@intel.com>
Subject: Re: [PATCH i-g-t 5/7] tests/intel/kms_frontbuffer_tracking: Add FBC
 support to FP16 formats
Thread-Topic: [PATCH i-g-t 5/7] tests/intel/kms_frontbuffer_tracking: Add FBC
 support to FP16 formats
Thread-Index: AQHcbrw2dk4InJyytUyesQ/DshiVSbUnFhYA
Date: Thu, 18 Dec 2025 08:39:12 +0000
Message-ID: <a32203ebee3b4b0dd253ec8035a856662c4ee7c1.camel@intel.com>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
 <20251216185215.1281390-6-swati2.sharma@intel.com>
In-Reply-To: <20251216185215.1281390-6-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SJ2PR11MB8424:EE_
x-ms-office365-filtering-correlation-id: 0a43ae92-f937-45d6-212c-08de3e10eb96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?LzZqRFptNDB4dHBoamNVOEU3dW1objhIR1M3bW1EK3htWUtKRDBib3BWVURx?=
 =?utf-8?B?STFSQWxkTlVRY1BmeHdpdm0wUG5qUFg5RjN6NEk0c2s4eCtjVUNSUG5SNXRO?=
 =?utf-8?B?U25GWGJMSkhBa1RqRVJHWVRJdmJJL1prdXFXZ2ZFQlNGK1ZEUTJEdTVaUENu?=
 =?utf-8?B?Z1M0VXhHUnY2TTFQRy9NcmtmeW55UFpzTmhCSzY3ZUQxMFNDb1dSNUlxR1lS?=
 =?utf-8?B?NDd6UjFtMVlYazM4TWF3QkswM2hEOFlHS0ZneXVLYVJpa0p5c24yQldmMU42?=
 =?utf-8?B?UXNEWjdwZWwvYmg0dVd4dkhCL1FzUmhTZUJFbmRSZHFvYUJsVGhtcERmaW9Q?=
 =?utf-8?B?N2h4Q3J2Z1M1cHJLREUzb2h6d3RmQmF1NWhPQVF0Wk1nMHF0VFRuRlZvYllS?=
 =?utf-8?B?UEN6d0RrR3lWSUduNVoyWFVkd1ZWMmt4VXNkUnJ0cXc5U3RLbStvOEhsSExl?=
 =?utf-8?B?aWZJR3lURTNlbUhKL2tWdEZBVjBSU2xhdlQvb2xHYmQ5TWxqS0RkajVJTXFE?=
 =?utf-8?B?RVBGbUV0ejY5OTdaOGtIWnVKNFNqVHhzRUZFU2JhTXB6c3Njc0pUL1c0bDli?=
 =?utf-8?B?MTRPdGh1V0twdTVrRm5tT0FCK2FDd2VlSDJRNlkwZTdiZ21GNjVoNWZlWXhn?=
 =?utf-8?B?SGlNL2wxa0hyRjN1QlJuSnRwcDhKcG0wUlRmWU16Qm5RVGNqaXBNUjU5VkF4?=
 =?utf-8?B?T0xFU1lWN3ZOUXh1ci9IcVRYb3BFektPaTlSL2ZDd1AraW5CYkJFa2Yzc01o?=
 =?utf-8?B?VjZNK1VYNGVkVXY0SU1OMUIyRytMQXFIRUJxMFRrTmt3a1cyYU1UWkg2eENk?=
 =?utf-8?B?M0RldTdtaE9JRy9uVTNXYnQ0cHRBMDBVY1MzcFZPSzY2VUhNaFFQeTZnWXcv?=
 =?utf-8?B?eUw2YTBEcjdocHoremlnUlc4ZXZybmMxVE9DdXFjeW04THVpNzhpRy9Rc1J1?=
 =?utf-8?B?WXBTN1MxK0xIVUtTWWQrU2R2QTQ4bGhHTmQxb1pjZXV3NjJBT01QbGhraktD?=
 =?utf-8?B?R2FJYkxYb1QvT25udDZGR2lFd3h6TmxBblZVRVZ0aE9DRDN6ZlBzdlVKUmJ3?=
 =?utf-8?B?Q2YyT2FWeVZTZUh5azNRWTlIZmQzY284VHAzMm5YdjdiaGFDSVJGWmpoN0x4?=
 =?utf-8?B?MWZyZTdFRGlHV0RFUVoycFV1akQxTlJ2MzJWSllNcDE3dzZCZTV4MlpwRmpC?=
 =?utf-8?B?ZzB3UFdoSG5KZ0R0eDhQSXJyaFp2RXk3dnU1Mm5WelJVdGE2TG5NbWZudFRS?=
 =?utf-8?B?UjJ3bXZmSTNSUlhGN0w4aGNJS0RQbFFueXc3bjhXUG9JM0R2bmxEV1o4d2h3?=
 =?utf-8?B?Q2dZRHltaHZhVkluc0RaUDRHUWl2TXdaUTliZlpwQUlWQ0lDWjdMcEkzYWNH?=
 =?utf-8?B?YkdSa1BOeGl6UDRIWUR6TTc0Nm9vT0lOa2ttUXRlcW8vMkhMNnhxWmlBM1o3?=
 =?utf-8?B?WlVVQlRZT29wYmVYODNXemNtbTRSYnhMbFpzL1JtM0pxekorNkZyd1o4cHBv?=
 =?utf-8?B?S05nMXZqZFdqM2l5WEhNd2xjSkZkYWFtdTBYSG8wN1I3QWtnTDJGK0g4OUVI?=
 =?utf-8?B?YklqOWJuT3Q5TjhGS3FUR3llakNzZjlBdDQ1SG00eHdkaGNNN2YxRHpNVXgv?=
 =?utf-8?B?UXRXaS94ZzlMN3VVdHJZcU1LbmVEVnFoNENKcTVpcSs0Z0JxUzF5Wk5ueHpN?=
 =?utf-8?B?WE1TQWp4YmxNQ3FkUURrTzJnOG9KWEtuRnRUR1daQlRDSXl2WERYY2dvWXFx?=
 =?utf-8?B?U09xV3FsYWV5Ly9zU3Z2d21OcGZXdlQvQU84SHdVNkhsbkNyTlNOYlpyaGNR?=
 =?utf-8?B?UG9zaWY3eDdHb0lQZEprU1MvV0lIV2I4SkQvS0NCOW9ZcXJQQ2JtOGxUTkdX?=
 =?utf-8?B?OXh0b0xhY0tEbVJpeVlPQStDUlNmZHd0Z3IwcGhoVkNPSjdMeDNKSzJCbjh1?=
 =?utf-8?B?Y0ovOTYyY2xmSGNrOThFTWVVUk9YZHNXWVJnamJ1aHovT1M0SGpMZVA2OUdn?=
 =?utf-8?B?ZmVsd1EwcHk5c0tvdk1nZkNaeWpkVUVML3hNOU0rWmF1Nzk3eFFxZTluTHdq?=
 =?utf-8?Q?1UaYfg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cG9NdXNLVmZDUzBKWmRZUHFkVThlaGY3V29OZ2xhWEV0N2NDUHBGd1pZU2ls?=
 =?utf-8?B?Y3FJdjZUcm51cC82ZjRXOHJTbnUzbzcwMHVjUE9HZjB3WkFrZTFOb0xBLy9k?=
 =?utf-8?B?eWhKbHJoZkNocGoyZmcxeDZoeVM1VXBhU1ZxVVFobTk1MlE4Yi9XQzlzbHhH?=
 =?utf-8?B?TnRFdW9TWllYa1JNL3RtU1VIZzhSUFY0alVJRUJnVHVreHhzTnZoQ25HbCt5?=
 =?utf-8?B?cGhueUdROUppMy9XeXErNUZjQ2F1OU1pQnh2MzROdzllYlZRamU1aVhxVXpz?=
 =?utf-8?B?RWlhY0I0NWVCaC81UC9LUjJRazZJYU5zZkFWRTROUWJCMm1ja2N3cmdZTTVy?=
 =?utf-8?B?YWZENlo5em51aFFtS01QQlFmbHg1Y0tOczhOVDNMM1VrTEJyQ1FwWDJCTm5o?=
 =?utf-8?B?UDJPY2tVK3h5Wms4Y240a3FLMDNHZzJyK3FHWGgzVHg0ZXJKekxUczE5cHhU?=
 =?utf-8?B?YlNuNWZESmZES1NIbzVUY0RkanhzWmhOVUI3VHNVMXNjdkhCanRqUXc0ZmNH?=
 =?utf-8?B?Nm9acnlqUWtIem5iWldTYzluZXNnbkZwUjZERFQ1bmZ0elpqbk9FUkE5cnpH?=
 =?utf-8?B?UVBZdFBtQ2Z2Q0JSVzBvWDBFZHhVM09WU2hPcDdXNE5tckNNUnlWc2F3MS8x?=
 =?utf-8?B?bGl3dWNNV2RTMUdmd3Fjb24ybkh6Q0cvMmZRTFdFaUhCK0h0REFOSzJSU3U0?=
 =?utf-8?B?bmpmaUl1UlJkMktkV1U0UUxlSUJoYXRYN0pPZHZYVnZsSGhwRk9Iek9Ba1J6?=
 =?utf-8?B?RHUzdzFQWTBUeFo1WU5tTkJHM0hKU1V6TTR0K2ZkWEtkWXpzZkY4UE1VM0tU?=
 =?utf-8?B?V0dwNFE5VkVXL3NuOEZYMjdwTk5PblhvVCtJUG9yVFdSc1pYa2FlUEVVUjRZ?=
 =?utf-8?B?OGFKVmdLMUJpQ081NWRJU1RVbzZFNDBVVUJqM095M2djaVZTR2I2U3Bpdks5?=
 =?utf-8?B?N25sQkJPNVozOXVNWE9Fa1pFSkRiN1BPU0hlaDNpRjQ2QkdxcUxQUVEzbXdl?=
 =?utf-8?B?aU5qYlFDNXBsQjNML2ZYZWYyeFFFZDJicW5MZEFjR0lycmV5N3YvTGdlNHB1?=
 =?utf-8?B?VkpWZTJ6WDJnanJPbnlDa1IyankvNUtRRStTOVEwd2UyaWR0QitDendGMEpW?=
 =?utf-8?B?WlluSnZCMnA1NW9wU2pQNW0zbzN2SFpVQTN0RFJJY1BEYmhWd3NPb1hPV3pD?=
 =?utf-8?B?VlZMSWdialhEdmsxRGFQdkxVVUg3YzZVcURTZUNUT0YwZkNRb0U5b1Q1amZP?=
 =?utf-8?B?Y3lIZ1ZJeHVzVXhQWjErK1VtOUZaOERQM0ZXQTJiOWM0RDhIb3NHSGZXNmVl?=
 =?utf-8?B?b0JSRVRPaitBbUl1SWFHY21jRDlWWGcwYjRXVENBUk9URk5ySUV0M3hCa1Zh?=
 =?utf-8?B?ekoxWkdwVHFzZ3RSNjZtZkwwTG1iOUpKNWpSWXhpWksvY3UwSXZnOXk3cFEx?=
 =?utf-8?B?a3Zad29BanFkZWwxNEVwSTVOZk5lUm5qNGhhdkMwRXhndGJXRWF6eFlrTlpX?=
 =?utf-8?B?d0hEOFZ5Tm01SlNDOFZuUlAvYXV0cUViMHpOWUZML1Q2ako5ZElqT3V1V0tw?=
 =?utf-8?B?QWtwanEvcXpUc1c5THYwT0lES2hZZUpXOEpDRkpobjFzT1lFc3UxYVEzNUdI?=
 =?utf-8?B?S09xRkV5VGFGRERLZmp1SGZ6OW5DRW40OVVGNlJ5N0dZMXo3aDdOS1Q1SFU2?=
 =?utf-8?B?MWFJMDVaQVRTOFdidHFOTExvV3h3dmZacFJnbzZNOHJ3cHVNVjExdFNKYjYy?=
 =?utf-8?B?b3hRQlBQbWJwYnhoaWt5dFRzeU9TMHdQT1FzSG5WMmh2d3Z1c2dldU41ZWl5?=
 =?utf-8?B?MTA0KzA0dCtRVWZiWG5oeU92R2J3d28wVzFlOHhGV1piNmlwLzVjQTNGVnRI?=
 =?utf-8?B?emtGMlJQSWtrUEd2bGlJMVBGbWZrTC9PSmlkcTYrUVcrWGRQTTFUazd5cVNN?=
 =?utf-8?B?em54RUZCWjlyY3ZySm92aHJIZlE1Q0hnYk5VUDl6YVJOclJNZ3ZwZmErWVVz?=
 =?utf-8?B?SXFlNmxsQVNBM3VhUVhuRHhYRjNiM2lYTy80b3VRNzRVVVI5THVIRDBHY053?=
 =?utf-8?B?UEc3dGV3T1dKQ0pHeUR2M1dSaCtHTzFycFJpWVpGLzBqL2V0Z3c1VlhhcWFz?=
 =?utf-8?B?ZFlVa2Y3emVJbDhibkMyalh1M2liZlprOEdnWExOUGRqbExsWk4rQ1JDdnZr?=
 =?utf-8?Q?SSZIcMdvQy4MnNlqvF3DfCo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3DFD99130553B4A9848AFF13FF797E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a43ae92-f937-45d6-212c-08de3e10eb96
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 08:39:12.5531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7iP+/bZHTVYvqCbouMm/KiTPudAYp3OURkItWFgpwcXjFTwR+TcCIpiqThiS7TtDpcaOUh9jqjP7NP8XYjnKrsyxyP3SJ896dkXlWcdKWis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8424
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

T24gV2VkLCAyMDI1LTEyLTE3IGF0IDAwOjIyICswNTMwLCBTd2F0aSBTaGFybWEgd3JvdGU6DQo+
IEZyb206IFByYW5heSBTYW1hbGEgPHByYW5heS5zYW1hbGFAaW50ZWwuY29tPg0KPiANCj4gQWRk
IEZCQyBzdXBwb3J0IHRvIEZQMTYgZm9ybWF0cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFByYW5h
eSBTYW1hbGEgPHByYW5heS5zYW1hbGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRl
bC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysr
LQ0KPiAtLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KPiANCg0KUmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmlu
ZGFwaWxsYWlAaW50ZWwuY29tPg0KDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfZnJv
bnRidWZmZXJfdHJhY2tpbmcuYw0KPiBiL3Rlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFj
a2luZy5jDQo+IGluZGV4IGMzMmY5YzU4Mi4uYTI3YWRlZDI4IDEwMDY0NA0KPiAtLS0gYS90ZXN0
cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiArKysgYi90ZXN0cy9pbnRlbC9r
bXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiBAQCAtNDExLDYgKzQxMSw4IEBADQo+IMKgICoN
Cj4gwqAgKiBAcmdiMTAxMDEwOsKgwqDCoMKgwqAgRk9STUFUX1JHQjEwMTAxMA0KPiDCoCAqIEBy
Z2I1NjU6wqDCoMKgwqDCoMKgwqDCoCBGT1JNQVRfUkdCNTY1DQo+ICsgKiBAYXJnYjE2MTYxNmY6
wqDCoMKgIEZPUk1BVF9BUkdCMTYxNjE2Rg0KPiArICogQGFiZ3IxNjE2MTZmOsKgwqDCoCBGT1JN
QVRfQUJHUjE2MTYxNkYNCj4gwqAgKg0KPiDCoCAqIGFyZ1syXToNCj4gwqAgKg0KPiBAQCAtNDQ0
LDYgKzQ0Niw4IEBADQo+IMKgICoNCj4gwqAgKiBAcmdiMTAxMDEwOsKgwqDCoMKgwqAgRk9STUFU
X1JHQjEwMTAxMA0KPiDCoCAqIEByZ2I1NjU6wqDCoMKgwqDCoMKgwqDCoCBGT1JNQVRfUkdCNTY1
DQo+ICsgKiBAYXJnYjE2MTYxNmY6wqDCoMKgIEZPUk1BVF9BUkdCMTYxNjE2Rg0KPiArICogQGFi
Z3IxNjE2MTZmOsKgwqDCoCBGT1JNQVRfQUJHUjE2MTYxNkYNCj4gwqAgKg0KPiDCoCAqIGFyZ1sy
XToNCj4gwqAgKg0KPiBAQCAtODY1LDYgKzg2OSw4IEBAIHN0cnVjdCB0ZXN0X21vZGUgew0KPiDC
oAkJRk9STUFUX1JHQjg4OCA9IDAsDQo+IMKgCQlGT1JNQVRfUkdCNTY1LA0KPiDCoAkJRk9STUFU
X1JHQjEwMTAxMCwNCj4gKwkJRk9STUFUX0FSR0IxNjE2MTZGLA0KPiArCQlGT1JNQVRfQUJHUjE2
MTYxNkYsDQo+IMKgCQlGT1JNQVRfQ09VTlQsDQo+IMKgCQlGT1JNQVRfREVGQVVMVCA9IEZPUk1B
VF9SR0I4ODgsDQo+IMKgCX0gZm9ybWF0Ow0KPiBAQCAtOTA5LDcgKzkxNSw3IEBAIHN0cnVjdCBy
ZWN0IHsNCj4gwqAJaW50IHk7DQo+IMKgCWludCB3Ow0KPiDCoAlpbnQgaDsNCj4gLQl1aW50MzJf
dCBjb2xvcjsNCj4gKwl1aW50NjRfdCBjb2xvcjsNCj4gwqB9Ow0KPiDCoA0KPiDCoHN0cnVjdCB7
DQo+IEBAIC0xMjcyLDYgKzEyNzgsMjIgQEAgc3RhdGljIHZvaWQgY3JlYXRlX2ZiKGVudW0gcGl4
ZWxfZm9ybWF0DQo+IHBmb3JtYXQsIGludCB3aWR0aCwgaW50IGhlaWdodCwNCj4gwqAJCWVsc2UN
Cj4gwqAJCQlmb3JtYXQgPSBEUk1fRk9STUFUX1hSR0I4ODg4Ow0KPiDCoAkJYnJlYWs7DQo+ICsJ
Y2FzZSBGT1JNQVRfQVJHQjE2MTYxNkY6DQo+ICsJCWlmIChwbGFuZSA9PSBQTEFORV9QUkkpDQo+
ICsJCQlmb3JtYXQgPSBEUk1fRk9STUFUX0FSR0IxNjE2MTYxNkY7DQo+ICsJCWVsc2UgaWYgKHBs
YW5lID09IFBMQU5FX0NVUikNCj4gKwkJCWZvcm1hdCA9IERSTV9GT1JNQVRfQVJHQjg4ODg7DQo+
ICsJCWVsc2UNCj4gKwkJCWZvcm1hdCA9IERSTV9GT1JNQVRfQVJHQjE2MTYxNjE2RjsNCj4gKwkJ
YnJlYWs7DQo+ICsJY2FzZSBGT1JNQVRfQUJHUjE2MTYxNkY6DQo+ICsJCWlmIChwbGFuZSA9PSBQ
TEFORV9QUkkpDQo+ICsJCQlmb3JtYXQgPSBEUk1fRk9STUFUX0FCR1IxNjE2MTYxNkY7DQo+ICsJ
CWVsc2UgaWYgKHBsYW5lID09IFBMQU5FX0NVUikNCj4gKwkJCWZvcm1hdCA9IERSTV9GT1JNQVRf
QVJHQjg4ODg7DQo+ICsJCWVsc2UNCj4gKwkJCWZvcm1hdCA9IERSTV9GT1JNQVRfQUJHUjE2MTYx
NjE2RjsNCj4gKwkJYnJlYWs7DQo+IMKgCWRlZmF1bHQ6DQo+IMKgCQlpZ3RfYXNzZXJ0KGZhbHNl
KTsNCj4gwqAJfQ0KPiBAQCAtMTI4Myw5ICsxMzA1LDkgQEAgc3RhdGljIHZvaWQgY3JlYXRlX2Zi
KGVudW0gcGl4ZWxfZm9ybWF0DQo+IHBmb3JtYXQsIGludCB3aWR0aCwgaW50IGhlaWdodCwNCj4g
wqAJaWd0X2NyZWF0ZV9mYihkcm0uZmQsIHdpZHRoLCBoZWlnaHQsIGZvcm1hdCwgbW9kaWZpZXIs
IGZiKTsNCj4gwqB9DQo+IMKgDQo+IC1zdGF0aWMgdWludDMyX3QgcGlja19jb2xvcihzdHJ1Y3Qg
aWd0X2ZiICpmYiwgZW51bSBjb2xvciBlY29sb3IpDQo+ICtzdGF0aWMgdWludDY0X3QgcGlja19j
b2xvcihzdHJ1Y3QgaWd0X2ZiICpmYiwgZW51bSBjb2xvciBlY29sb3IpDQo+IMKgew0KPiAtCXVp
bnQzMl90IGNvbG9yLCByLCBnLCBiLCBiMiwgYTsNCj4gKwl1aW50NjRfdCBjb2xvciwgciwgZywg
YiwgYjIsIGE7DQo+IMKgCWJvb2wgYWxwaGEgPSBmYWxzZTsNCj4gwqANCj4gwqAJc3dpdGNoIChm
Yi0+ZHJtX2Zvcm1hdCkgew0KPiBAQCAtMTMxNCw2ICsxMzM2LDIyIEBAIHN0YXRpYyB1aW50MzJf
dCBwaWNrX2NvbG9yKHN0cnVjdCBpZ3RfZmIgKmZiLA0KPiBlbnVtIGNvbG9yIGVjb2xvcikNCj4g
wqAJCWIgPSAweDNGRjsNCj4gwqAJCWIyID0gMHgyMDA7DQo+IMKgCQlicmVhazsNCj4gKwljYXNl
IERSTV9GT1JNQVRfQVJHQjE2MTYxNjE2RjoNCj4gKwkJYWxwaGEgPSB0cnVlOw0KPiArCQlhID0g
MHgzQzAwVUxMIDw8IDQ4Ow0KPiArCQlyID0gMHgzQzAwVUxMIDw8IDMyOw0KPiArCQlnID0gMHgz
QzAwVUxMIDw8IDE2Ow0KPiArCQliID0gMHgzQzAwVUxMOw0KPiArCQliMiA9IDB4MzgwMFVMTDsN
Cj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBEUk1fRk9STUFUX0FCR1IxNjE2MTYxNkY6DQo+ICsJCWFs
cGhhID0gdHJ1ZTsNCj4gKwkJYSA9IDB4M0MwMFVMTCA8PCA0ODsNCj4gKwkJYiA9IDB4M0MwMFVM
TCA8PCAzMjsNCj4gKwkJZyA9IDB4M0MwMFVMTCA8PCAxNjsNCj4gKwkJciA9IDB4M0MwMFVMTDsN
Cj4gKwkJYjIgPSAweDM4MDBVTEw7DQo+ICsJCWJyZWFrOw0KPiDCoAlkZWZhdWx0Og0KPiDCoAkJ
aWd0X2Fzc2VydChmYWxzZSk7DQo+IMKgCX0NCj4gQEAgLTE4MzIsNyArMTg3MCw3IEBAIHN0YXRp
YyB2b2lkIGZpbGxfZmJfcmVnaW9uKHN0cnVjdCBmYl9yZWdpb24NCj4gKnJlZ2lvbiwNCj4gwqAJ
CQnCoMKgIGVudW0gaWd0X2RyYXdfbWV0aG9kIG1ldGhvZCwNCj4gwqAJCQnCoMKgIGVudW0gY29s
b3IgZWNvbG9yKQ0KPiDCoHsNCj4gLQl1aW50MzJfdCBjb2xvciA9IHBpY2tfY29sb3IocmVnaW9u
LT5mYiwgZWNvbG9yKTsNCj4gKwl1aW50NjRfdCBjb2xvciA9IHBpY2tfY29sb3IocmVnaW9uLT5m
YiwgZWNvbG9yKTsNCj4gwqANCj4gwqAJaWd0X2RyYXdfcmVjdF9mYihkcm0uZmQsIGRybS5ib3Bz
LCAwLCByZWdpb24tPmZiLCBtZXRob2QsDQo+IMKgCQkJIHJlZ2lvbi0+eCwgcmVnaW9uLT55LCBy
ZWdpb24tPncsIHJlZ2lvbi0+aCwNCj4gQEAgLTI0NjQsNyArMjUwMiw3IEBAIHN0YXRpYyB2b2lk
IHNldF9yZWdpb25fZm9yX3Rlc3QoY29uc3Qgc3RydWN0DQo+IHRlc3RfbW9kZSAqdCwNCj4gwqBz
dGF0aWMgdm9pZCBzZXRfcGxhbmVfZm9yX3Rlc3RfZmJjKGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUg
KnQsDQo+IGlndF9wbGFuZV90ICpwbGFuZSkNCj4gwqB7DQo+IMKgCXN0cnVjdCBpZ3RfZmIgZmI7
DQo+IC0JdWludDMyX3QgY29sb3I7DQo+ICsJdWludDY0X3QgY29sb3I7DQo+IMKgDQo+IMKgCWln
dF9pbmZvKCJUZXN0aW5nIGZiYyBvbiBwbGFuZSAlaSVzXG4iLCBwbGFuZS0+aW5kZXggKyAxLA0K
PiBrbXN0ZXN0X3BpcGVfbmFtZShwcmltX21vZGVfcGFyYW1zLnBpcGUpKTsNCj4gwqANCj4gQEAg
LTI5MzksNiArMjk3Nyw5IEBAIHN0YXRpYyBib29sIGZvcm1hdF9pc192YWxpZChpbnQgZmVhdHVy
ZV9mbGFncywNCj4gwqAJCXJldHVybiB0cnVlOw0KPiDCoAljYXNlIEZPUk1BVF9SR0IxMDEwMTA6
DQo+IMKgCQlyZXR1cm4gZmFsc2U7DQo+ICsJY2FzZSBGT1JNQVRfQVJHQjE2MTYxNkY6DQo+ICsJ
Y2FzZSBGT1JNQVRfQUJHUjE2MTYxNkY6DQo+ICsJCXJldHVybiB0cnVlOw0KPiDCoAlkZWZhdWx0
Og0KPiDCoAkJaWd0X2Fzc2VydChmYWxzZSk7DQo+IMKgCX0NCj4gQEAgLTQwMDcsNiArNDA0OCwx
MCBAQCBzdGF0aWMgY29uc3QgY2hhciAqZm9ybWF0X3N0cihlbnVtDQo+IHBpeGVsX2Zvcm1hdCBm
b3JtYXQpDQo+IMKgCQlyZXR1cm4gInJnYjU2NSI7DQo+IMKgCWNhc2UgRk9STUFUX1JHQjEwMTAx
MDoNCj4gwqAJCXJldHVybiAicmdiMTAxMDEwIjsNCj4gKwljYXNlIEZPUk1BVF9BUkdCMTYxNjE2
RjoNCj4gKwkJcmV0dXJuICJhcmdiMTYxNjE2ZiI7DQo+ICsJY2FzZSBGT1JNQVRfQUJHUjE2MTYx
NkY6DQo+ICsJCXJldHVybiAiYWJncjE2MTYxNmYiOw0KPiDCoAlkZWZhdWx0Og0KPiDCoAkJaWd0
X2Fzc2VydChmYWxzZSk7DQo+IMKgCX0NCj4gQEAgLTQzNTMsNiArNDM5OCw5IEBAIGludCBpZ3Rf
bWFpbl9hcmdzKCIiLCBsb25nX29wdGlvbnMsIGhlbHBfc3RyLA0KPiBvcHRfaGFuZGxlciwgTlVM
TCkNCj4gwqAJCQkJwqDCoMKgwqDCoCBmb3JtYXRfc3RyKHQuZm9ybWF0KSwNCj4gwqAJCQkJwqDC
oMKgwqDCoA0KPiBpZ3RfZHJhd19nZXRfbWV0aG9kX25hbWUodC5tZXRob2QpKQ0KPiDCoAkJCXsN
Cj4gKwkJCQlpZiAodC5mb3JtYXQgPT0gRk9STUFUX0FSR0IxNjE2MTZGDQo+IHx8DQo+ICsJCQkJ
wqDCoMKgIHQuZm9ybWF0ID09IEZPUk1BVF9BQkdSMTYxNjE2RikNCj4gKwkJCQkJaWd0X3JlcXVp
cmUoZHJtLmRpc3BsYXlfdmVyDQo+ID49IDM1KTsNCj4gwqAJCQkJaWd0X3JlcXVpcmUoaWd0X2Ry
YXdfc3VwcG9ydHNfbWV0aG9kDQo+IChkcm0uZmQsIHQubWV0aG9kKSk7DQo+IMKgCQkJCWZvcm1h
dF9kcmF3X3N1YnRlc3QoJnQpOw0KPiDCoAkJCX0NCg0K

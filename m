Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F7CE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 08:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551F310EAE9;
	Wed, 18 Dec 2024 08:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Az9P4u+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB53E10E04F;
 Tue, 17 Dec 2024 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734448705; x=1765984705;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kJaz894Nu6LrC0ZUDYW/uM4JaGa63aaXisjqPCd9wpw=;
 b=Az9P4u+AKuzJh8rwSzllHa19sWGiPrC3ASmu/dlc/J2Jz2lNMP3k8x9w
 kOpxSXWIsBqzdSBm+8TyXPdx717YbdQt37/LigtzmE8xNfeHYcnk6dBoL
 MyVZXf5rY0cc1Zh61+pK+Xc0cJB9IcBCiHbm80f0wQhU55bIVQ56bLth6
 3hItAwWzZTXVrBm4Qbs9lOeglnPc/nUgp2RnTkXDYKkvusSPVKPAoMZ8W
 wVuGDa0xjKXw3IZVuN6tr28+fY8b4Ru9PSByYhAP+Y4sB8bGhaPQZ9DJS
 hKBZJpVWeKSh/M0XytQd9xh/M6KjTfAcwRsy3cU8UUkteaZ/AcZcsHu5+ Q==;
X-CSE-ConnectionGUID: TBZgp77aRhqlEvxw6f/gwg==
X-CSE-MsgGUID: mh8G7GYmSxGM2VAwkPKq7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45572485"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="45572485"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 07:18:24 -0800
X-CSE-ConnectionGUID: rY5Z9GdHQ9OrdJnCoxj6Og==
X-CSE-MsgGUID: AsuIRFARSu6JRT33h/Ixng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102648194"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 07:18:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 07:18:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 07:18:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 07:18:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIwtdTuUNQkCT5Wu7Tfi9AYn4C9l3Av2zIQ5kMs66eJZhwOHgICC2y2bBQ5kxipmyO33gq6/+ggrpAMpYq1louwj6B8TbeN4je6kX9dW+db3dBPIZBpBTEw/YfTOiLRvlIOPQLj/fMxDXVNm6mMl9fx/ROcuV5vWo/JvvC/mH/desa8FPs+E/J3PgvmxIJ5FywJwtYhEnuGT+RnkkY+NoeGnLbooubrpq1QFjYY+D4xsaEEiZthx9RAjFl2HqYzuNQP0zY+wK3ZsEPMRgQtqgXQS6fOz3JLahz8IqXqXKlR6+CkUEgGXzOgErc0Mw4jaU/mIFOcSKPAetk4CBWTbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJaz894Nu6LrC0ZUDYW/uM4JaGa63aaXisjqPCd9wpw=;
 b=ckaLm/bXX/Pfig8mCTAFobTpcCzTiqvViXAKS6c/CQgXL6+zP5MsvU0hzwJMN0HulXzZv7UnAKpcZMb/t1wsiNYG6+dACEPL37fePJIouYmTfanniIOc32zIiVy3LHQGB0AePN8DCYULkF8kMLccPtgmFzyqHgA0yKXa/5md49CQVRGbYrtA5NWRBX3mCUEc3LZkgc28dsG7xD4XQz+AWcohOsxz87QhXSJ5V8HLOonQLN7AHzRrGDjwDqeftwDeOIK2XGoxHUl/L+bwPMOUHjnVNcZaRRLmQwwrEuovgtrz9f/ozHx3Zu+DgATMyCY4ZGS3VxlO9wPUxPhEHOJXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by SA1PR11MB5923.namprd11.prod.outlook.com (2603:10b6:806:23a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 15:18:20 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 15:18:19 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wasiak, 
 Mikolaj" <mikolaj.wasiak@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVs?=
 =?utf-8?Q?/i915=5Fhangman:_Fix_spin_engine_hang_(rev4)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvaTkx?=
 =?utf-8?Q?5=5Fhangman:_Fix_spin_engine_hang_(rev4)?=
Thread-Index: AQHbUFvCVPG8BckN7keiK5268SWf5bLqjMBA
Date: Tue, 17 Dec 2024 15:18:19 +0000
Message-ID: <CH0PR11MB5491E8AA6093B719BD4B509AEF042@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
 <173385708911.928132.3781234299776821392@b555e5b46a47>
 <iuspbdmehobv2att75zgefpnexkxcqxc7ctcjfev63i2sbcygs@rcmt725sdosp>
In-Reply-To: <iuspbdmehobv2att75zgefpnexkxcqxc7ctcjfev63i2sbcygs@rcmt725sdosp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|SA1PR11MB5923:EE_
x-ms-office365-filtering-correlation-id: c64fcc2e-ce09-4133-ce52-08dd1eae0a1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?V0JxRkZYb0k0eEVZWG8wOFowTURHU01tNjU4dmFMaE5ObHZtRW9nc3E4L2Va?=
 =?utf-8?B?NmlXYVczOSt6RFhIUW1ucVY4SkppSmp1elI5ak9OMXRtRTh0cXpnV05ab3pT?=
 =?utf-8?B?bjB3V2VjY0NVaFVJUjkvUURwTlh1RjVleDVDNmhuQk1CVytOWjg2MnorYUVz?=
 =?utf-8?B?UWVqbjJvQ2dtRW4zSlkzY3B6Z0ZrQ3lNcXE4NHA3MVRqcFVCaXVJaTZtS3Na?=
 =?utf-8?B?MXAzZi9YQTlKbUlpMXM1QXBBZnNqNHkrMEd4T1FXaHVrbmpDdk5pSitnQkMv?=
 =?utf-8?B?amthSGljaFZHWE9PYUlWeUY4YTZOUmh0TG5CRWVIb3Z0OEI2NG1lV0VUK2NP?=
 =?utf-8?B?cEhHMFlLMDNRRnRpZ25ldUlQejlsdlNSZnlIdVlBcjV3bWU4eUx3VG1HU1hS?=
 =?utf-8?B?RmhjeUQ1ZlhpcDR6Nmp2RWl4eWRpS29UVzRBYzVBL2ZzYU9LajRnOVJmZ2ts?=
 =?utf-8?B?MXdidnVKajNLU0hlS3NYTkNJczNaaXlQUDlJVUxtN1hObyt1QnJETFhIQWZV?=
 =?utf-8?B?VmJBYzlVbE1PTk40R3NSaWwvWXM4M1YrS25rNDRjU0luOGR2NUUrcGMydHdD?=
 =?utf-8?B?VkRuYWVqRzF2RFNuOXd2NXFJVlEzTzNLdVplWkFza1RSSnBsTG53Z2h5dWJm?=
 =?utf-8?B?Y0dsMEFNMHNIbmVFekdGSmhsa3FYN2xKaTMyM3hPRHlCMEttYVAwWVczVWFz?=
 =?utf-8?B?S0N6RmszN2FZUmU0MzNxanVEZGg5alB1bmd1ZGVDWERMQzcwVFpibWtMeWow?=
 =?utf-8?B?b0xBd0tYV2kxd25ZL08yM1ZZTGtlMTVsNnl5TUlFUGFRWVRBSW5qR3pNYzFG?=
 =?utf-8?B?YTZhMkN3NTh5ZVB1UkhYYk1SYjBBQ04rZUdYT2dxWjhDYys2K3dhNXFuN3lH?=
 =?utf-8?B?NXFZZXFBT0c3ekxYNzJRbzFDRzcyYlh4WnlOayt3Q2pQb1A1dnFkT2tMUnFR?=
 =?utf-8?B?WDMwUlVYeE12ZnBpTHBhNkIzeDZjWlhMc0dpemFVTDUzTjRremhxMXJwK2RK?=
 =?utf-8?B?bmtOZWJTNE1SZklzZDNNOCtMc0dTeFdscWdyVnBmZ3dIbG1Qd3NrV045QWM4?=
 =?utf-8?B?N25yNmt4NDFHMmo4UUdKVDg1N1BLUjlPTStXTkJIT2ZZUUF0Vy96bVlNQlZO?=
 =?utf-8?B?bFc3ZnlFUnphY0lXWTFiTFIzcUhaelNmajdJYW5raFk5VmorYk05RzBwWGVt?=
 =?utf-8?B?U0pnWXFsNmtsNlpDbG9GWnhITzA4SHpKMGd5Y3FXVnA3UG1oZC9ya1o3SUlU?=
 =?utf-8?B?YlZYQ1pwcnFCYUFDcit2eTBWSE1xYW1POHZPRmZ6QmNiWGw0eUZXaUE4MGMv?=
 =?utf-8?B?ZlVlMklrV2lKMGo1MnpOVGxwWHpCcW9mR2I2M2FLWHh5YnpwazlsUUhJOXA3?=
 =?utf-8?B?WDA4cEF3NEo3UWtTWGZtcTllSjR3eGlGUmFMdC83eEV0MExBcWlBRUxmcjI2?=
 =?utf-8?B?d2JuZzkrNUNFNU5zQlhrVGhnTXlvQVBxaU42WHM3L08zUFN3QUFGV0ZDN3py?=
 =?utf-8?B?Y2I1Nmp1eThaaUpncVd2OUNBakFhL3JvSXcrY0x1VHdBM1l6SmdIbnlIU0x4?=
 =?utf-8?B?bEsrRDZDbjVZZlVKVnpJdzg0T0FLbkczYzVkM0RIMEt3SzFaREE0SWh4Mnk3?=
 =?utf-8?B?SlJYdm1sbXFsbFBhSGkrVWVZNGNnY2M5d0p1VWZDemV0Ly9oRlgvUC9TZUUv?=
 =?utf-8?B?YnVLZFlRcnN3dlJWeWdBRHZTWE1yUW95MG4wSVpsN21oTVdMU1dGUitXejZi?=
 =?utf-8?B?MlNqbVpQNGliYkVKc0pPRE5pdnJLblRyelB4dWZHMTFqME9KT09zV3cwNXdl?=
 =?utf-8?B?RllWMzRDbnNobWpOaW5NVUs4WEI3RkVQRDMyNDFBaDUwbG5vQm5uS052dUVr?=
 =?utf-8?B?b0xOUyt3UUIzV21hcis3TktmeTYxUTE3NTFMbHlTenJCWHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEhZWkhxVmVlcE9GZGRSQzVDV256ZmJSQVY5bWxFWnIxTUdDRmNzZ1RsanBv?=
 =?utf-8?B?Nk1hRDNBeGdWUzY4aWhQNEdHdm1QTXFCRDlJR1h1MG1HanBOaFZhemRONUR4?=
 =?utf-8?B?UVVEdU5rQTVhcElLOUFOL2NCVXVFWlh5ZDJmaENzOTh6NXMxOE5qSjBNKzlC?=
 =?utf-8?B?bEYvbWF0MnBoL1dQSkZmWUZSZlJCNUNoRjVPNEF6SHpSbzdqUUZUNm1kUGFH?=
 =?utf-8?B?eVJtNld5aGkvakdHUXErMWVjSDFjdnRnR3NKb0piWkFBNzNrcHRlWElWekRi?=
 =?utf-8?B?SS9RRHF2enYyV0dvM2RINURpdXlNZjF1RXppLzg2VmpsUU9MU05KaWp6dEg3?=
 =?utf-8?B?blczRTFLQU9lV2ZkOXl6MDJqMGJ2WTJUTmZ4bU4zcDhDWEQ5MzVGNlBIb3R4?=
 =?utf-8?B?ZFhuV0lsYkhVSmw1N1dyZGZaMllXTlllTE95azM3U1JDcStydDJ0NGJENlkz?=
 =?utf-8?B?L21jWThudnpJdmFvaE1GOHVIKzhrTGZkZlI0WjlqV3NXaXl5VExzbVplQ1Zn?=
 =?utf-8?B?QWpWT1hGOFNrNVVkVDk3SzZXczExUkRIb1V6VTBweUZLUUJRRFVsSHE4d3RY?=
 =?utf-8?B?OTYwL2dIUkY0bTh6Y25hMjM2RjVBdjNIaDdldFprejdsbnFWUlZXN3h2eUNC?=
 =?utf-8?B?ZWFpbkF5Y2JFSzhaTXhMU2xDT2FXbGpINll6c2UxdVZucWFOYmsrdnJOLzhU?=
 =?utf-8?B?cXRiUlk5RHFnQzZKSkYyUDU4bmVPVXAzd0dpRjFsOEV2bWtLS2QvSnJJb1kv?=
 =?utf-8?B?MkVQMXF2Wkp5elo4Y2FWcERncW1wSFh0ZEFDTU1zaWxOamVraHBnZDFzeFpL?=
 =?utf-8?B?U05WMGxselFTVzk0ZnBobjdMbVA0SEFTY2tnUGtXdGpLbURHRGxQbzdic2U4?=
 =?utf-8?B?MWJFZi9ET3kyNVZ5NHBJL1lFdE4zcDVwSVg3K1VVRDlITmFGUFBES3FLVitM?=
 =?utf-8?B?VGN6cWVtVUVHMXc1RmFtRzlLRGxRMTZVMFlvZnozWHRoZU9nT3lIMmwyWkNU?=
 =?utf-8?B?dTcrWjFYTk9KbEpJb0d1WEEwcXNIbUxaZDNGdEhzWENhd1A4N0V5Y09ONmow?=
 =?utf-8?B?WlRFMGQvWmhwMXBtSENiOEhjb09waXpwS0REbUFEbTBRU0xFNjE4RG5oUlFZ?=
 =?utf-8?B?d1FSNXlpRnJURkRaRGtOeDkzVGFsYzhudnBKM1Z6SUhOcjlzRXpWd0gzUlVw?=
 =?utf-8?B?Z3IyczRmTlBnSFowZXg4OFZIVFBFMEcybk1ETXZzKzY0akEyWWFGenVMSnFi?=
 =?utf-8?B?SWpwdUlSc2F3Wno3TjVFOC95QTdwQ0tBWEl5NHZFMlAwUXFialdjNVpDZHIw?=
 =?utf-8?B?NWNNTllMUG1hRWdRYnhSSHFkTkVOT3I2YXdVaEhUTU1lNytML1YrRXdpZmtB?=
 =?utf-8?B?a3cwTFRLRnltdEZzVDFXeVBlVUlCM21QZVhmR2pWdFAzaGdRcjBVUVE1ZGRz?=
 =?utf-8?B?Z2NiOEg2L0RPQXVvS0pycXZscXFzbVRQOHFETTRqQ2U1RWhHV3B4Z3dZVktT?=
 =?utf-8?B?c2dQMnJ1U2d2NFZ1MnNBSkZFRHlXYmd0cnkyQkxNL3hwUW9JNHREQ0pzcU1H?=
 =?utf-8?B?MTkzbUxCYjNJT1VTOFVXU0FKdzVWVVhQeXpFeStqVW9SVWI2L0tkUEpzYWQ4?=
 =?utf-8?B?ZjB1ZVBBS1pkMGMydGFmSk1RaDRsblpkeDdQNW02SmFiWDJWSVZtUC8xUnZB?=
 =?utf-8?B?OU5tREV4NXk4VEZXSUhlbkY2WGFCSjNMcU52NEkrNVF1WGRBL2VHQ2g3R0Nk?=
 =?utf-8?B?MTlnMVpKTDkxYVFFb1c2bWZYcmJTMnhrS3ZEcHA1em1nSFJpa0tZZm1NQWpS?=
 =?utf-8?B?MWFzek45U200NmhyMlZ1ZGw0MVlsSVlJcW84cmt2RmNUb2x1ZkRpWlpwVzl4?=
 =?utf-8?B?V2N1ck9KcUFKZG55b1Z1dmx1dkF1NTQvbit0SVZNWkdXWXNHeTJsUkxsYlBP?=
 =?utf-8?B?Y3dFNG5YejYyeEhYcnlxOUc5ZE5rMGk0NTI0N1VZMEpoY3pObTFsRE5xM1Ey?=
 =?utf-8?B?NWcvdDNaN01WV0UzdXNDNWpwK3hKZzV6RGF1SU84VTRxejVrOFUxa21OS0Fi?=
 =?utf-8?B?d3UvN1l3NDhoQ3JVN2tCYmR4VHVSREdqYTRpYzYveFFIWWQvblNCK0Y4Sk1p?=
 =?utf-8?B?d2dSOGUzdUo2SVplYUtMMGtab3B6bHJrWkJ1VEpPVDZKM2VVUW5Xd2ZEWDBV?=
 =?utf-8?Q?WdJb58706OzLUCHhsEQ7SgjwD9rMPZeVTl82JRDuv6Zx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64fcc2e-ce09-4133-ce52-08dd1eae0a1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 15:18:19.8924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d5k9abw3XW+P95c4bxqbGxE5Nh05QVB9ZDrl66c3zivPB7fizP/WlKKCcZb/FdrnzdM9b0bdj/odHiwrl/MYsrZ8O7mITvIZ/ULtDzN2WNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5923
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 18 Dec 2024 08:28:37 +0000
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

SGksDQogDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MTY5NC8t
IFJlLXJlcG9ydGVkLg0KIA0KWGUuQ0kuRnVsbCAtIEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fu
bm90IGJlIHJlLXJlcG9ydGVkLg0KaTkxNS5DSS5GdWxsIC0gUmUtcmVwb3J0ZWQuDQogDQpUaGFu
a3MsDQpSYXZhbGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2kt
aW5mcmEgPGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBNaWtvbGFqIFdhc2lhaw0KU2VudDogMTYgRGVjZW1iZXIgMjAyNCAxNzoxMA0KVG86
IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IFdhc2lhaywgTWlrb2xhaiA8bWlrb2xhai53YXNpYWtAaW50ZWwuY29t
Pg0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVs
L2k5MTVfaGFuZ21hbjogRml4IHNwaW4gZW5naW5lIGhhbmcgKHJldjQpDQoNCk9uIDIwMjQtMTIt
MTAgYXQgMTg6NTg6MDkgKzAwMDAsIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFp
bHMgPT0NCj4gDQo+IFNlcmllczogdGVzdHMvaW50ZWwvaTkxNV9oYW5nbWFuOiBGaXggc3BpbiBl
bmdpbmUgaGFuZyAocmV2NCkNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzE0MTY5NC8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5
ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF84MTQ3X2Z1bGwgLT4gSUdU
UFdfMTIyODNfZnVsbCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVS
RSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEy
MjgzX2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+
ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0
byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMjI4M19mdWxs
LCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVy
ZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAg
IEV4dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10
aXAvSUdUUFdfMTIyODMvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoMTAg
LT4gMTApDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBObyBjaGFu
Z2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2Vz
IHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzEyMjgzX2Z1bGw6DQo+IA0K
PiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMj
IyMNCj4gDQo+ICAgKiBpZ3RAZ2VtX2Vpb0Bpbi1mbGlnaHQtc3VzcGVuZDoNCj4gICAgIC0gc2hh
cmQtZ2xrOiAgICAgICAgICBOT1RSVU4gLT4gW0lOQ09NUExFVEVdWzFdDQo+ICAgIFsxXTogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIyODMvc2hh
cmQtZ2xrNi9pZ3RAZ2UNCj4gbV9laW9AaW4tZmxpZ2h0LXN1c3BlbmQuaHRtbA0KPiANCj4gICAN
Cg0KSGkgSUdUIGNpIGluZnJhDQoNClRoZSBhYm92ZSByZWdyZXNzaW9uIGlzIHVucmVsYXRlZCwg
dGhlIHBhdGNoIG9ubHkgZm9jdXNlcyBvbiBpOTE1X2hhbmdtYW4gdGVzdC4NClBsZWFzZSB1cGRh
dGUgZmlsdGVycyBhbmQgcmUtcmVwb3J0Lg0KDQpUaGFua3MsDQpNaWtvbGFqDQoNCg==

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67409D1CDD9
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB8510E306;
	Tue, 22 Oct 2024 10:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJJVNjFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4B310E306
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729594114; x=1761130114;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GKUrIQytFARSXM0344ONWQj7dS+TxGpd35fDDVEAJz0=;
 b=FJJVNjFpC4XhPC1ABO5HzQksTtRIz+A99U0Hv8Ezi3lCBltq+bu5EoWg
 wFf6pmaqXTxsM+RbqHtpTFqZ1n8CFXrEJRJWreXrwZ8mxM1w2xkqbK6Gx
 POslB9/qeSvXJRxtGHAlXtOfI0RXCJvcwG1NuQhV/rx/WVrevKkeubwD2
 f7IDEngj4YpmGG2r+U3RqkRCG+X1ZrewOwfimNmFpEp0KIJtJEpz8NV97
 kpT49KKIhgN0jBvpnvEEdOymNZWixFBbFYoJLplDLgtS3f4EIx2MyNc3e
 aeG/aNAlMK1VA65lULtyxNjr+dUXJx2SQoL6XM066z6axBioqeF2UqGDX g==;
X-CSE-ConnectionGUID: 6tbYv8GWQWG6RnL0ICHqeg==
X-CSE-MsgGUID: w6UqgIAJR7SrE0XN2NBokA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39738871"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="39738871"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:48:33 -0700
X-CSE-ConnectionGUID: xLsEDu/XS0aNnKGIyJR+dw==
X-CSE-MsgGUID: 1q8tKTrcRoWPtqMUU8Hofg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="80008433"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 03:48:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 03:48:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 03:48:33 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 03:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZF/tmTIe6GVvfC1fHYSs3n2kayslA/d/EFGNXMW90PtPqRMfuJHwJtevKCAevieijUVfM5ZcrxcB8+q8isgIE/uCCIGHF+/pqOMuUJ4mVC2ZI9CaR9C1KMlm6Db6F3A2X+9901X+pzD1JOMWlx1qAJ/O/rUny/sG5sBXH/zqpjAXFk2spd8cdDKT0hvq0qKxnrg7rkKq9RHgFlcHkcZtHm+MG8CFwJpdT+DA5Gusw+t370L7M6kyKaN7G0NFEKgrBQ/6ZRmPq4NFd0lB6Ts7Dh2xjGJ43j6D5tUatdU5x8gT0pXerZ+18ETj4AcracCio7XX9AkVY7Xcv3y52E5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKUrIQytFARSXM0344ONWQj7dS+TxGpd35fDDVEAJz0=;
 b=jNXhJX0qmrb9aXAf8KeBXgxiGjnIII1IHX3TGjI94+CSDIybDLJI0kd+LJRJEctFsrR7iQKYYRxnNkRVKBS/ACcyorcAR19s8gFZOwY2PFKyGFRF7NxIMc3IeqbnbLpLIm+miyAeqP4J7WK/CspvuHU4ea+1cK6RfpA2GOF57ni2c5sLC9EVZw7m80ou4t8yYTNkrNCmPHXoVyKMxeMReW1lBWwCBFzTeo5BSqAYAISVs0t724A/5jdNlPcpSe1JPG8jCcP9/yAsDq+fnGNPxb2zrys5SlmFjzZo96n/+vUgfwaOpGnPBelmO09oMjliMIusdQOAimMz2VB16XFtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Tue, 22 Oct
 2024 10:48:30 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e%5]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 10:48:30 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 2/3] lib/igt_fb: add igt_xe2_blit_with_dst_pat
 function
Thread-Topic: [PATCH i-g-t v2 2/3] lib/igt_fb: add igt_xe2_blit_with_dst_pat
 function
Thread-Index: AQHbIIc2PXdaYh5BKUuOvzpWqVuzprKSnpdg
Date: Tue, 22 Oct 2024 10:48:30 +0000
Message-ID: <MW4PR11MB7054CA0BA9CB3FB8658C9DD8EF4C2@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20241017112728.3503205-1-juhapekka.heikkila@gmail.com>
 <20241017112728.3503205-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241017112728.3503205-3-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|CH3PR11MB8441:EE_
x-ms-office365-filtering-correlation-id: c2b6c1d6-9398-4bf5-6c70-08dcf2871165
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WTR5T1pSNGdTRWRiemxDdlQ5R2hZdU1aaFFFTGtVazR0SU1VTFVWWlpjOCsw?=
 =?utf-8?B?K3lFaHZ1MXR4dXhNV2V5T1FJTThuc3h4bWRSOVNVV0pKcUtGQ01FYUc1Mjg3?=
 =?utf-8?B?MUdIWTRNR3lMOGxEckJXV2dNUXY3UlQrTUJFdjJaYzJXMU8vNnB1MzdkU2tt?=
 =?utf-8?B?ZXE1Tlk1dHFvNVU5S1V1V1JpRzk1dElOZ01CTWRETWIvckkvQWtKRXdCR0k1?=
 =?utf-8?B?TUhONG1jWHNYdUVDeStoUEw3cGY4RmJYODBpM0hlbS9rRG9SVlNUQVZtL3pC?=
 =?utf-8?B?UWIyalFyNHkwVG1DUTF2VmsvRXlFemdYcUViV21kSW1YUG9PcUV3ZHEzK1FV?=
 =?utf-8?B?WW9xVlVhQzFZYWxGWHZOQkNxa3pPeG1Sc3g2ZThGT3ZZb3pjM2M0dWRISXpC?=
 =?utf-8?B?bllwQkdpcjVORlkzT1dwWDdKZjdJVWY4Q1hVS2Q1MWR5MXh5N0txTDNEbk5j?=
 =?utf-8?B?b0Z4M1JRUTk4Vm5XSkpOM1k0VFJTQ3U2amFQcmNWN3U0MDZQR3llWmxycENv?=
 =?utf-8?B?T2p1VGF6Wm4vbUdnQm1EajU4ZUxkUjZ2VDFQUVVMWlZDL1dDVkVKQjFmRVo4?=
 =?utf-8?B?NXJESXJrc3V2UjdVSEZubVlnUXlweU80ZlV4aUJqeXN4ZW9hRWtaY0FlSnVv?=
 =?utf-8?B?cnlsTXBjWXQ1cmhZUG1Iak1ybWRzcGxTOFhENmQ1YVZ2OTBZR3hDSCtwS1Jy?=
 =?utf-8?B?WEZxZFREZUtYVE9nd0IwaldaNGo2UlErc3RaZDVuOG81M25oOFl0QkxYNXhJ?=
 =?utf-8?B?VlpXc0dVUUVJT0ppZzRrR1QvNEJRSWFadU9aOU5wS0FBZ04wRjFQNk5CL2Vu?=
 =?utf-8?B?OTd3Q1RXS0RweTNJSzBpVHFoNEVoNzUrUnBUSXZzamlpT21LbjRocWxLT0s2?=
 =?utf-8?B?TnpObzVudExiMGVwd3RGYnJRcVpFeVFXZmFVcUVJZGVOVGlBK3dtTzBvTXJH?=
 =?utf-8?B?TUZMa3ZvOElTTFg1bVg2N2FsRmVlVGNUc3p3NUFtQTFDVVlvNkNJSWZyVFhw?=
 =?utf-8?B?VW04Tjc2d2NjUFBDdk9xaUwrK045YmFZU2IzN3BGeXEybTVETGRvUzc2YkhF?=
 =?utf-8?B?NHpUYm5GK1Q1SUJBQlhPOCtMZk5KTHZ4Y1N5M3B4TFpWTWQyYm1Pb2svRngr?=
 =?utf-8?B?cGpBM1dKZmtSeU9DbE5YUURibmZ6Q1Uxc2Ezam50ZjJ4djhtckJtRE1DdnBN?=
 =?utf-8?B?akNWYTU4UzJpazVVVjRhTml5am54ay9PUUFGbHpoN1p4SE8yZGRFV0x1OXlP?=
 =?utf-8?B?SW5WTzI3SDN4SWdXUlhwbzBhWkpSRmlWZ1ZieXZlSklzYTBZaW1wakVwNU5X?=
 =?utf-8?B?dTVZdDZCKzRyY2lmY3JPbEtMSnhwWUs5RTNqc0doNERWZnFFV2xNdHpFWnI4?=
 =?utf-8?B?cDBTWmxRNGt6R2VwQVUxTVl5SVl3aEtHMVNCb056dFdTTXd3SmphSXprZlMw?=
 =?utf-8?B?Vm9jcUU3cXpveVlPZGFSR1VwaDlCYURJeGNaZVpUemdlUVF3UEZ0ZHNaMVor?=
 =?utf-8?B?WTdGc0RWc0E3QlltWko0dDlLTHhHajY3dkdZRWM3MEFrUnJZTi82QXRkSlBV?=
 =?utf-8?B?NWYyK3htaGxQVHRLWXdWUVA4NVkyOWRmTjgwbFZ1MmlMREg5NXZHZ0NqeVRP?=
 =?utf-8?B?b1pXd3FYbEo2MllzWU9UMll5V1BONThNbDNoNnMxQWhWUi9ZeS9YbE5YLytW?=
 =?utf-8?B?VkNHOGx1SUQ0OU9kT2hxY3NiWUZOMDNsQjlXQ0NVNVNmdFlnN2ZISldXOU10?=
 =?utf-8?B?SnNQVkRRekg0ME0zUnRIdTV3T045eXNPc0dvUSt4bi9rck9MUEh2SVpZZmZu?=
 =?utf-8?Q?2Yb82qqbHwOReZyknCgvhZG120aOfdjxO2GyU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHFaSklkYXVuSzlHNHUyL0RGUDZsakI0aHp3L3k0WUVxdG5kS1d2OWlLT3lR?=
 =?utf-8?B?U0FLY1lHdUpxQzd6bUNaeHpXTzc1RXJYNXFnbUU3eEU1VS9KNHR1QnpWTW9X?=
 =?utf-8?B?K2RyR3VhdEgvL1hZV1UyQzVKckJXK1Q4Y2NqWS9HeUNzeGJmQzJLV2o4L3dE?=
 =?utf-8?B?MkpBYWphU0taVExNVFBNMkpIRW96SFV4RVloR1VrdGsyKzJrcjJFUkZEU05O?=
 =?utf-8?B?aUpabEFwckw5TWUvQVRZSVBtN284NXB6VGh3elZWQ083UW1tZzF5R0ZQa3Vj?=
 =?utf-8?B?MUFxTzczK0xSM21SNE5kOXMrMC9uV2lYZnczRGhYRE1UWFlJcXVJekQwMFFO?=
 =?utf-8?B?b24rUEMzRlRMS1ZYa0o5SUdLaGozQnhYdFJQaUJWSjZBVG1qRFFaeE8rMjc2?=
 =?utf-8?B?RHBtbmJ0S0hDa2xndXJ0K1IvdFlwZzV6YVU4WmwrdTZPSnNvYUpwVFRrclJs?=
 =?utf-8?B?cE9uNUZvN3VTTC9nemFhdnZka3NCRytOUmZOZWFkQ253ZHlwVldYVlZNOG9u?=
 =?utf-8?B?VlNHMUFrLythU1RpQm1NYVUzYzd2WGEwekRnWmw2MVUwcG14ZEhUNUNvMjlG?=
 =?utf-8?B?WTlhZ3ZCdmJQL003L3QwN1prbStNRHJMS2FaTzBWVmVJMFZVajEvQlk3NGJh?=
 =?utf-8?B?dXpDd0dibFBPeEFjcFpaT282NExIR2VUQTgwRENma2h6eXFPTVhHdTdROEti?=
 =?utf-8?B?VFppUWxPNHgrTUlPcUNHQXlSYkx4Qk9wYUF2cjBrczRnMmNab3QzZVpBMjJW?=
 =?utf-8?B?NzNwdm1lWVFCVHYveW9USzV3SlZzTE8ySUl3dHUyU2RxOEJSNHluVEluUVhz?=
 =?utf-8?B?MnR3U1NEMExxUjM1SmJVa3BwbWl6TWY1Z0R2Uyt3bEVNN0orWW55UzVMNlNX?=
 =?utf-8?B?dkhOazdySGNyMlMzMml6SzZ2dk1mN1NZOFFFYkxXeElpeHlGdlAyalRWczgy?=
 =?utf-8?B?VDVmcHEzN2pHNnRMMzluUm80SWIvMkZPYk1vZkI2VmpUOWM0N2dNcU1wMUdm?=
 =?utf-8?B?VFNRd01HVjVmM2VSZkNCRnFtU2hMSW9iMEt1UUFNbHc1MFZPMEpJSVI5eXJI?=
 =?utf-8?B?WHJRWUNlbmVPb2U4aFJwNGtOS3RaNlc4aVE1Q1E4QWRzaVUzaFdXdzh2OEZw?=
 =?utf-8?B?SWF5RVExR0FLOWMvamxqTlpoM0g2OUpVQ0FIMkZpV1F0OWlRaXNuRno2eWs5?=
 =?utf-8?B?THFvcSs2TXY3TC93clN6V3FxWVJMWHI3WFFhM3BlbzRVckNWbmFSai8vd1Nm?=
 =?utf-8?B?MXRmMjkvL0FwMUs5MGpNUnNTU2xXanBvd01DWWRhR0dJamgxeUtkbjIzVXha?=
 =?utf-8?B?enEwY0xQa1p3cWRONnNqdk16ei9ZcUZpT2RmZWNiUU5lS0xXNU5aTUtjb0lH?=
 =?utf-8?B?VlMvMW1JZUVXS1VtUjZyK1hYekJPUzR5bE4zRGE4TlVvREttOWhBbDVHU1Ra?=
 =?utf-8?B?UGUyK1Mxc1ZiVlBLdDJ3WTduRWxOZFhQd2tzaDR6cmEvem5yRzhOTWtRUWZj?=
 =?utf-8?B?NjlzK1M3MVpVZzNiRk1WeDA4UDV1cExuUUIyNjBVczBzelUxS3dYQi9rV2Vv?=
 =?utf-8?B?Z1JvdVpNak1kbCtyYW5scnNBR29nM2ozNmE3WjBIbGVwS01FMGpxYnBrOE5U?=
 =?utf-8?B?dU84Z3VhbnFTeXFBUzRBM1k1aHY4Mmh6T0VHeXd1RENDMVdBUlJHTjZ1WE9i?=
 =?utf-8?B?OEQzcDlaZ1N0WkxXN08wNmVVQjNiSkY3VEhQcmpMd1BNSjl2OUxoRmhtdG5V?=
 =?utf-8?B?ZStZZ2xIOWd1SlNWem43TVlDbldlbFNvTTQvQ0hXc0wyKzJ0WjQvaGZvTDJM?=
 =?utf-8?B?SExFNElIeVowTmlpY0VyaWI0azF2eGZRZUx6K29LaDZOem5ocDNrVnE2KzVN?=
 =?utf-8?B?ZmthcFNOUk0vbEY0R1V6aTZ0dXpQUmZWMTdHZDBQY1JSWWJWbkZON1NLYWpT?=
 =?utf-8?B?YmFCUXJnWWk2bHZPa3RVZmh5NTE3bGYwSE9IRVAzRmxWTUw4OW43bG5ITTFF?=
 =?utf-8?B?K090RVVrVGs2cWYvbCtyN2xoWlFkcHcwY2dhdUhnNjNDdHUzTDFhUW0zeGFI?=
 =?utf-8?B?N1J4ZWJKS1RHK0VUdjFwblZxL0taL1NHN1lPOGpXRjU1VXk3YlphMTU5eE8v?=
 =?utf-8?Q?WvR93L8RdZ3fGhmZxMJiAyZ+Z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b6c1d6-9398-4bf5-6c70-08dcf2871165
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 10:48:30.5264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pAy9Xsv5g2nQ1xvFffI3uDzoV9wlWIxpo3i1nQ5LTn0v1dwXX47ORrJ6skUJBdOut1qV2rGEatsfSWU6WrKPDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS1QZWtrYQ0KPiBI
ZWlra2lsYQ0KPiBTZW50OiBUaHVyc2RheSwgMTcgT2N0b2JlciAyMDI0IDE0LjI3DQo+IFRvOiBp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSnVoYS1QZWtrYSBIZWlra2lsYSA8
anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYy
IDIvM10gbGliL2lndF9mYjogYWRkIGlndF94ZTJfYmxpdF93aXRoX2RzdF9wYXQgZnVuY3Rpb24N
Cj4gDQo+IEFkZCBpZ3RfeGUyX2JsaXRfd2l0aF9kc3RfcGF0KCkgZnVuY3Rpb24gd2hpY2ggdXNl
IGJsaXR0ZXIgYmxvY2sgY29weSB0byBjb3B5IHNyYw0KPiBmcmFtZWJ1ZmZlciB0byBkZXN0aW5h
dGlvbiBmcmFtZWJ1ZmZlciBzZXR0aW5nIGRlc3RpbmF0aW9uIHBhdCBpbmRleCB0byB3aGF0IGlz
DQo+IHBhc3NlZCBhcyBwYXJhbWV0ZXIuDQo+IA0KDQpSZXZpZXdlZC1ieTogTWlrYSBLYWhvbGEg
PG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhl
aWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3Rf
ZmIuYyB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0NCj4gIGxpYi9pZ3RfZmIuaCB8ICAzICsrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1OSBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
ZmIuYyBiL2xpYi9pZ3RfZmIuYyBpbmRleCBiOGZmZDdjZmIuLmU4NzgwOWJhMyAxMDA2NDQNCj4g
LS0tIGEvbGliL2lndF9mYi5jDQo+ICsrKyBiL2xpYi9pZ3RfZmIuYw0KPiBAQCAtMjgzMyw3ICsy
ODMzLDggQEAgc3RhdGljIHN0cnVjdCBibHRfY29weV9vYmplY3QNCj4gKmFsbG9jYXRlX2FuZF9p
bml0aWFsaXplX2JsdChjb25zdCBzdHJ1Y3QgaWd0X2ZiICoNCj4gIAkJCQkJCQkgICB1aW50MzJf
dCBoYW5kbGUsDQo+ICAJCQkJCQkJICAgdWludDMyX3QgbWVtcmVnaW9uLA0KPiAgCQkJCQkJCSAg
IGVudW0gYmx0X3RpbGluZ190eXBlDQo+IGJsdF90aWxlLA0KPiAtCQkJCQkJCSAgIHVpbnQzMl90
IHBsYW5lKQ0KPiArCQkJCQkJCSAgIHVpbnQzMl90IHBsYW5lLA0KPiArCQkJCQkJCSAgIHVpbnQ4
X3QgcGF0X2luZGV4KQ0KPiAgew0KPiAgCXVpbnQ2NF90IHN0cmlkZTsNCj4gIAlzdHJ1Y3QgYmx0
X2NvcHlfb2JqZWN0ICpibHQgPSBjYWxsb2MoMSwgc2l6ZW9mKCpibHQpKTsgQEAgLTI4NDUsNyAr
Mjg0Niw3DQo+IEBAIHN0YXRpYyBzdHJ1Y3QgYmx0X2NvcHlfb2JqZWN0ICphbGxvY2F0ZV9hbmRf
aW5pdGlhbGl6ZV9ibHQoY29uc3Qgc3RydWN0IGlndF9mYg0KPiAqDQo+IA0KPiAgCWJsdF9zZXRf
b2JqZWN0KGJsdCwgaGFuZGxlLCBmYi0+c2l6ZSwgbWVtcmVnaW9uLA0KPiAgCQkgICAgICAgaW50
ZWxfZ2V0X3VjX21vY3NfaW5kZXgoZmItPmZkKSwNCj4gLQkJICAgICAgIGludGVsX2dldF9wYXRf
aWR4X3VjKGZiLT5mZCksDQo+ICsJCSAgICAgICBwYXRfaW5kZXgsDQo+ICAJCSAgICAgICBibHRf
dGlsZSwNCj4gIAkJICAgICAgIGlndF9mYl9pc19jY3NfbW9kaWZpZXIoZmItPm1vZGlmaWVyKSA/
DQo+IENPTVBSRVNTSU9OX0VOQUJMRUQgOiBDT01QUkVTU0lPTl9ESVNBQkxFRCwNCj4gIAkJICAg
ICAgIGlndF9mYl9pc19nZW4xMl9tY19jY3NfbW9kaWZpZXIoZmItPm1vZGlmaWVyKSA/DQo+IENP
TVBSRVNTSU9OX1RZUEVfTUVESUEgOiBDT01QUkVTU0lPTl9UWVBFXzNEKTsgQEAgLTI4NjcsNyAr
Mjg2OCw4DQo+IEBAIHN0YXRpYyB2b2lkICptYXBfYnVmZmVyKGludCBmZCwgdWludDMyX3QgaGFu
ZGxlLCBzaXplX3Qgc2l6ZSkgIH0NCj4gDQo+ICBzdGF0aWMgc3RydWN0IGJsdF9jb3B5X29iamVj
dCAqYmx0X2ZiX2luaXQoY29uc3Qgc3RydWN0IGlndF9mYiAqZmIsDQo+IC0JCQkJCSAgIHVpbnQz
Ml90IHBsYW5lLCB1aW50MzJfdCBtZW1yZWdpb24pDQo+ICsJCQkJCSAgIHVpbnQzMl90IHBsYW5l
LCB1aW50MzJfdCBtZW1yZWdpb24sDQo+ICsJCQkJCSAgIHVpbnQ4X3QgcGF0X2luZGV4KQ0KPiAg
ew0KPiAgCXVpbnQzMl90IG5hbWUsIGhhbmRsZTsNCj4gIAllbnVtIGJsdF90aWxpbmdfdHlwZSBi
bHRfdGlsZTsNCj4gQEAgLTI4ODMsNyArMjg4NSw4IEBAIHN0YXRpYyBzdHJ1Y3QgYmx0X2NvcHlf
b2JqZWN0ICpibHRfZmJfaW5pdChjb25zdCBzdHJ1Y3QNCj4gaWd0X2ZiICpmYiwNCj4gIAkJcmV0
dXJuIE5VTEw7DQo+IA0KPiAgCWJsdF90aWxlID0gZmJfdGlsZV90b19ibHRfdGlsZShmYi0+bW9k
aWZpZXIpOw0KPiAtCWJsdCA9IGFsbG9jYXRlX2FuZF9pbml0aWFsaXplX2JsdChmYiwgaGFuZGxl
LCBtZW1yZWdpb24sIGJsdF90aWxlLCBwbGFuZSk7DQo+ICsJYmx0ID0gYWxsb2NhdGVfYW5kX2lu
aXRpYWxpemVfYmx0KGZiLCBoYW5kbGUsIG1lbXJlZ2lvbiwgYmx0X3RpbGUsDQo+ICsJCQkJCSAg
cGxhbmUsIHBhdF9pbmRleCk7DQo+IA0KPiAgCWlmICghYmx0KQ0KPiAgCQlyZXR1cm4gTlVMTDsN
Cj4gQEAgLTMwMjQsMTEgKzMwMjcsMTQgQEAgc3RhdGljIHZvaWQgZG9fYmxvY2tfY29weShjb25z
dCBzdHJ1Y3QgaWd0X2ZiDQo+ICpzcmNfZmIsDQo+ICAJCQkgIHVpbnQzMl90IG1lbV9yZWdpb24s
IHVpbnQzMl90IGksIHVpbnQ2NF90IGFobmQsDQo+ICAJCQkgIHVpbnQzMl90IHhlX2JiLCB1aW50
NjRfdCBiYl9zaXplLA0KPiAgCQkJICBjb25zdCBpbnRlbF9jdHhfdCAqY3R4LA0KPiAtCQkJICBz
dHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUpDQo+ICsJCQkgIHN0cnVjdCBpbnRlbF9l
eGVjdXRpb25fZW5naW5lMiAqZSwNCj4gKwkJCSAgdWludDhfdCBkc3RfcGF0X2luZGV4KQ0KPiAg
ew0KPiAgCXN0cnVjdCBibHRfY29weV9kYXRhIGJsdCA9IHt9Ow0KPiAtCXN0cnVjdCBibHRfY29w
eV9vYmplY3QgKnNyYyA9IGJsdF9mYl9pbml0KHNyY19mYiwgaSwgbWVtX3JlZ2lvbik7DQo+IC0J
c3RydWN0IGJsdF9jb3B5X29iamVjdCAqZHN0ID0gYmx0X2ZiX2luaXQoZHN0X2ZiLCBpLCBtZW1f
cmVnaW9uKTsNCj4gKwlzdHJ1Y3QgYmx0X2NvcHlfb2JqZWN0ICpzcmMgPSBibHRfZmJfaW5pdChz
cmNfZmIsIGksIG1lbV9yZWdpb24sDQo+ICsJCQkJCQkgIGludGVsX2dldF9wYXRfaWR4X3VjKHNy
Y19mYi0NCj4gPmZkKSk7DQo+ICsJc3RydWN0IGJsdF9jb3B5X29iamVjdCAqZHN0ID0gYmx0X2Zi
X2luaXQoZHN0X2ZiLCBpLCBtZW1fcmVnaW9uLA0KPiArCQkJCQkJICBkc3RfcGF0X2luZGV4KTsN
Cj4gIAlzdHJ1Y3QgYmx0X2Jsb2NrX2NvcHlfZGF0YV9leHQgZXh0ID0ge30sICpwZXh0ID0gTlVM
TDsNCj4gDQo+ICAJaWd0X2Fzc2VydChzcmMgJiYgZHN0KTsNCj4gQEAgLTMwOTMsNyArMzA5OSw4
IEBAIHN0YXRpYyB2b2lkIGJsaXRjb3B5KGNvbnN0IHN0cnVjdCBpZ3RfZmIgKmRzdF9mYiwNCj4g
DQo+ICAJCWlmIChpc194ZSkgew0KPiAgCQkJZG9fYmxvY2tfY29weShzcmNfZmIsIGRzdF9mYiwg
bWVtX3JlZ2lvbiwgaSwgYWhuZCwNCj4gLQkJCQkgICAgICBiYiwgYmJfc2l6ZSwgeGVfY3R4LCBO
VUxMKTsNCj4gKwkJCQkgICAgICBiYiwgYmJfc2l6ZSwgeGVfY3R4LCBOVUxMLA0KPiArCQkJCSAg
ICAgIGludGVsX2dldF9wYXRfaWR4X3VjKGRzdF9mYi0+ZmQpKTsNCj4gIAkJfSBlbHNlIGlmIChm
YXN0X2JsaXRfb2soc3JjX2ZiKSAmJiBmYXN0X2JsaXRfb2soZHN0X2ZiKSkgew0KPiAgCQkJaWd0
X2JsaXR0ZXJfZmFzdF9jb3B5X19yYXcoZHN0X2ZiLT5mZCwNCj4gIAkJCQkJCSAgIGFobmQsIGN0
eCwgTlVMTCwNCj4gQEAgLTMxMTYsNyArMzEyMyw4IEBAIHN0YXRpYyB2b2lkIGJsaXRjb3B5KGNv
bnN0IHN0cnVjdCBpZ3RfZmIgKmRzdF9mYiwNCj4gIAkJCWZvcl9lYWNoX2N0eF9lbmdpbmUoc3Jj
X2ZiLT5mZCwgaWN0eCwgZSkgew0KPiAgCQkJCWlmIChnZW1fZW5naW5lX2Nhbl9ibG9ja19jb3B5
KHNyY19mYi0+ZmQsIGUpKSB7DQo+ICAJCQkJCWRvX2Jsb2NrX2NvcHkoc3JjX2ZiLCBkc3RfZmIs
DQo+IG1lbV9yZWdpb24sIGksIGFobmQsDQo+IC0JCQkJCQkgICAgICBiYiwgYmJfc2l6ZSwgaWN0
eCwgZSk7DQo+ICsJCQkJCQkgICAgICBiYiwgYmJfc2l6ZSwgaWN0eCwgZSwNCj4gKw0KPiBpbnRl
bF9nZXRfcGF0X2lkeF91Yyhkc3RfZmItPmZkKSk7DQo+ICAJCQkJCWJyZWFrOw0KPiAgCQkJCX0N
Cj4gIAkJCX0NCj4gQEAgLTMxNDYsNiArMzE1NCw0NSBAQCBzdGF0aWMgdm9pZCBibGl0Y29weShj
b25zdCBzdHJ1Y3QgaWd0X2ZiICpkc3RfZmIsDQo+ICAJCQkgICAgICBzcmNfZmItPmZkLCBpY3R4
KTsNCj4gIH0NCj4gDQo+ICsvKioNCj4gKyAqIGlndF94ZTJfYmxpdF93aXRoX2RzdF9wYXQ6DQo+
ICsgKiBAZHN0X2ZiOiBwb2ludGVyIHRvIGEgZGVzdGluYXRpb24gI2lndF9mYiBzdHJ1Y3R1cmUN
Cj4gKyAqIEBzcmNfZmI6IHBvaW50ZXIgdG8gYSBzb3VyY2UgI2lndF9mYiBzdHJ1Y3R1cmUNCj4g
KyAqIEBkc3RfcGF0X2luZGV4OiB1aW50OF90IHBhdCBpbmRleCB0byBzZXQgZm9yIGRlc3RpbmF0
aW9uIGZyYW1lYnVmZmVyDQo+ICsgKg0KPiArICogQ29weSBtYXRjaGluZyBzaXplIHNyY19mYiB0
byBkc3RfZmIgd2l0aCBzZXR0aW5nIHBhdCBpbmRleCB0bw0KPiArZGVzdGluYXRpb24NCj4gKyAq
IGZyYW1lYnVmZmVyDQo+ICsgKi8NCj4gK3ZvaWQgaWd0X3hlMl9ibGl0X3dpdGhfZHN0X3BhdChj
b25zdCBzdHJ1Y3QgaWd0X2ZiICpkc3RfZmIsDQo+ICsJCQkgICAgICAgY29uc3Qgc3RydWN0IGln
dF9mYiAqc3JjX2ZiLA0KPiArCQkJICAgICAgIHVpbnQ4X3QgZHN0X3BhdF9pbmRleCkNCj4gK3sN
Cj4gKwl1aW50MzJfdCBjdHggPSAwLCBiYiwgbWVtX3JlZ2lvbiwgdm0sIGV4ZWNfcXVldWU7DQo+
ICsJdWludDY0X3QgYWhuZCA9IDAsIGJiX3NpemUgPSA0MDk2Ow0KPiArCWludGVsX2N0eF90ICp4
ZV9jdHggPSBOVUxMOw0KPiArDQo+ICsJaWd0X2Fzc2VydF9lcShkc3RfZmItPmZkLCBzcmNfZmIt
PmZkKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKGRzdF9mYi0+bnVtX3BsYW5lcywgc3JjX2ZiLT5udW1f
cGxhbmVzKTsNCj4gKwlpZ3RfYXNzZXJ0KCFpZ3RfZmJfaXNfZ2VuMTJfcmNfY2NzX2NjX21vZGlm
aWVyKHNyY19mYi0+bW9kaWZpZXIpKTsNCj4gKwlpZ3RfYXNzZXJ0KCFpZ3RfZmJfaXNfZ2VuMTJf
cmNfY2NzX2NjX21vZGlmaWVyKGRzdF9mYi0+bW9kaWZpZXIpKTsNCj4gKw0KPiArCXNldHVwX2Nv
bnRleHRfYW5kX21lbW9yeV9yZWdpb24oZHN0X2ZiLCAmY3R4LCAmYWhuZCwgJm1lbV9yZWdpb24s
DQo+ICsJCQkJCSZ2bSwgJmJiLCAmYmJfc2l6ZSwgTlVMTCwNCj4gKwkJCQkJJmV4ZWNfcXVldWUs
ICZ4ZV9jdHgpOw0KPiArDQo+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBkc3RfZmItPm51bV9wbGFu
ZXM7IGkrKykgew0KPiArCQlpZ3RfYXNzZXJ0X2VxKGRzdF9mYi0+cGxhbmVfYnBwW2ldLCBzcmNf
ZmItPnBsYW5lX2JwcFtpXSk7DQo+ICsJCWlndF9hc3NlcnRfZXEoZHN0X2ZiLT5wbGFuZV93aWR0
aFtpXSwgc3JjX2ZiLT5wbGFuZV93aWR0aFtpXSk7DQo+ICsJCWlndF9hc3NlcnRfZXEoZHN0X2Zi
LT5wbGFuZV9oZWlnaHRbaV0sIHNyY19mYi0+cGxhbmVfaGVpZ2h0W2ldKTsNCj4gKw0KPiArCQlk
b19ibG9ja19jb3B5KHNyY19mYiwgZHN0X2ZiLCBtZW1fcmVnaW9uLCBpLCBhaG5kLCBiYiwgYmJf
c2l6ZSwNCj4gKwkJCSAgICAgIHhlX2N0eCwgTlVMTCwgZHN0X3BhdF9pbmRleCk7DQo+ICsJfQ0K
PiArDQo+ICsJY2xlYW51cF9ibHRfcmVzb3VyY2VzKGN0eCwgYWhuZCwgdHJ1ZSwgYmIsIGV4ZWNf
cXVldWUsIHZtLCB4ZV9jdHgsDQo+ICsJCQkgICAgICBzcmNfZmItPmZkLCBOVUxMKTsNCj4gK30N
Cj4gKw0KPiAgc3RhdGljIHZvaWQgZnJlZV9saW5lYXJfbWFwcGluZyhzdHJ1Y3QgZmJfYmxpdF91
cGxvYWQgKmJsaXQpICB7DQo+ICAJaW50IGZkID0gYmxpdC0+ZmQ7DQo+IGRpZmYgLS1naXQgYS9s
aWIvaWd0X2ZiLmggYi9saWIvaWd0X2ZiLmggaW5kZXggZWI3MDdjYzM0Li5kNWFhMWU4OGEgMTAw
NjQ0DQo+IC0tLSBhL2xpYi9pZ3RfZmIuaA0KPiArKysgYi9saWIvaWd0X2ZiLmgNCj4gQEAgLTE4
Nyw2ICsxODcsOSBAQCBib29sIGlndF9mYl9pc19nZW4xMl9tY19jY3NfbW9kaWZpZXIodWludDY0
X3QNCj4gbW9kaWZpZXIpOyAgYm9vbCBpZ3RfZmJfaXNfY2NzX3BsYW5lKGNvbnN0IHN0cnVjdCBp
Z3RfZmIgKmZiLCBpbnQgcGxhbmUpOyAgYm9vbA0KPiBpZ3RfZmJfaXNfZ2VuMTJfY2NzX2NjX3Bs
YW5lKGNvbnN0IHN0cnVjdCBpZ3RfZmIgKmZiLCBpbnQgcGxhbmUpOyAgaW50DQo+IGlndF9mYl9j
Y3NfdG9fbWFpbl9wbGFuZShjb25zdCBzdHJ1Y3QgaWd0X2ZiICpmYiwgaW50IGNjc19wbGFuZSk7
DQo+ICt2b2lkIGlndF94ZTJfYmxpdF93aXRoX2RzdF9wYXQoY29uc3Qgc3RydWN0IGlndF9mYiAq
ZHN0X2ZiLA0KPiArCQkJICAgICAgIGNvbnN0IHN0cnVjdCBpZ3RfZmIgKnNyY19mYiwNCj4gKwkJ
CSAgICAgICB1aW50OF90IGRzdF9wYXRfaW5kZXgpOw0KPiANCj4gIC8qIGNhaXJvLWJhc2VkIHBh
aW50aW5nICovDQo+ICBjYWlyb19zdXJmYWNlX3QgKmlndF9nZXRfY2Fpcm9fc3VyZmFjZShpbnQg
ZmQsIHN0cnVjdCBpZ3RfZmIgKmZiKTsNCj4gLS0NCj4gMi40NS4yDQoNCg==

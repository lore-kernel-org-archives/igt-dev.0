Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381E8E9D3F5
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 15:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B2A10E071;
	Wed,  4 Feb 2026 15:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ox+yc6t6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0A010E071
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770218289; x=1801754289;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/Vrn6MV+HMD2OKZoa0Ipk8M43RTeOjxotaXcvCEJF54=;
 b=Ox+yc6t6Jp0yHfhtAZ2lXmAClj+rWgUklxVVIq1zUl8Nx5DomAXLzPUq
 8xpPArmvyx3xZeXYm/vBb6TiOg3JzWrEjNsjNuiwQRcWITrcOnDSXubsV
 l6XlUqB5wAIPXOoVgbINrdDAL6fBLRIoeR/wR8zXUB2TppgxKzaPts4Y6
 v5PRcxVxCFtgVXB/INVb9GjOmovlEuFprKah8dSif94NXwHyMYDXh1hJu
 gjf9TodXlaS6WXZE09u1o0pHaTd5a2arl/2NHAzjKBGp60TXiNrqyGnhc
 15bPyH47Q4A2+ioBOlLeeazIPkzB512s7k5A1GzNkDxGoh7iTwrMEPH5l A==;
X-CSE-ConnectionGUID: uFpI2U0ZTt+hNMcNpOYIOw==
X-CSE-MsgGUID: Hx8N/3CBSGGI+cm6Y766dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71303906"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71303906"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 07:18:08 -0800
X-CSE-ConnectionGUID: T2c+UCPxRbGc4LWEOpicmA==
X-CSE-MsgGUID: Q7xpG+tQRNyo2w+EYO1nPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210218915"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 07:18:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 07:18:07 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 07:18:07 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 07:18:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJcmMhwYys3axlNzAfB8jMF+t5bcISTRUFyn697S1GkpWtS9g2C/dfqSH9EeOfVbNTPUja0XWSazu7zt567+p2ZNFl7ODKCNlP4rwqEckLvrjtJvkPY8g+vJKeq7nqtFK48CGcoiMNqQoQzVVZsvb5DczCXk/iA7FXYITTA2BLlcleItH0eV5amv+hH6v+3AYJB9kfeKl8qPbXTAKNLcw4AakxIJ+kCfUuvWoQe6Xfvu+ePpqQShIIOVcAdSP9rjWQKKu6oR2sxckGaFPU/CEyt6n5iN+DoAAGoeaYliYeljPWHVwpQ4sEcOyn2KhPpJ07wTb/I6CdmI48ZBNqCllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Vrn6MV+HMD2OKZoa0Ipk8M43RTeOjxotaXcvCEJF54=;
 b=gvyGIKU3nSzPJ69+DZzGaWoMvgsRpAXlEMYc87w9pME3TDjPzwlmZ+kBLr6vfJLBvlTE9I2G9/JxuQHPbF8TlncPC80eUe4ovBOf1JPHdzX6u9kKwS1F3HkBYyEiv+FsRtr94/u5uHkPdACaiLNTqqNtBfT9n4thH/RaZJu+rFAP+x0LS57oCeFJwXkbocCvcD484cqzX1PWMnch5QUkc96FZXYru7y3h2A5rz5+qXz5Q1LshjsHaTGFlkl8D/6ezTadzpAdZYraKn2rMoZ9CoZWqug8lQXdmWf4DbTCpt2uvdSeF7JJ5ztFxYLVupq8P8A36d/cTv+cLd+Re9/PcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:18:04 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:18:04 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_configfs: Reset configfs attributes after
 subtests
Thread-Topic: [PATCH] tests/intel/xe_configfs: Reset configfs attributes after
 subtests
Thread-Index: AQHclRo3/O3OylHrd0WPNZdHfsY0J7VxIguAgAGAlEA=
Date: Wed, 4 Feb 2026 15:18:04 +0000
Message-ID: <IA3PR11MB898711664AE0B756C8649C3FD098A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20260203150645.401837-2-nitin.r.gote@intel.com>
 <18337fd1-572e-4cce-ab04-8ef92c56d11e@intel.com>
In-Reply-To: <18337fd1-572e-4cce-ab04-8ef92c56d11e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|SJ0PR11MB5166:EE_
x-ms-office365-filtering-correlation-id: 1ef58915-2269-4e2b-279a-08de64009810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?d3I3NTVoVUdiSXJFUmlEaGd3R3QwZ1hJZWJESndCTnJaT0hzNllpT2FxSldu?=
 =?utf-8?B?dXR5TEQ5amZraXJ2eHhteDVXT0U0Q1o3Z1ZMMk9UNXFHYW4zTVUrYmtkNHJJ?=
 =?utf-8?B?UlBBVzIwam5VRngvYjlnREFBUHhNeVN2clA1SUhDR3hoSFRNVUZyYVF4VXFV?=
 =?utf-8?B?MTM0cUlkbGxINkxyVlFLYWM3UzI1eHJqOFFzU3NpVUh0YnE1N1l3WXNHMnhk?=
 =?utf-8?B?bmJqUEhWcWZoMk1FV2YrRmZDakRGY2pVM1Z2L1RCWGNNK2piaXFjblY5NVpQ?=
 =?utf-8?B?TWgwams0VDFmdmlkci9qNUhLazYrZG1RVmNnRFN3S2dkbDBtSDYraVlQR1dO?=
 =?utf-8?B?b3VtaG95SVpNT2VuU1lwY2djL01PRzJSMUhyd3Z2UkRRb05nbzlHSnVGcTZk?=
 =?utf-8?B?SHRYU3NERTBML3RHYWZPQ2V2b2VnTVBiUVBIMnRDZWRLR2s4cFh1akIzaTRU?=
 =?utf-8?B?WkRIcDg1QUhvQU4vQnRBb3hZTVk4YnJ1ZndNOW1HdlFhVEVSVXY2Y3lRZDZ5?=
 =?utf-8?B?L2hVbVhVMGM3Q1B6Ny9BckhWam02UG5sWmFxaHJkOG8wU3M4aDZGbHhGS05j?=
 =?utf-8?B?bk91U3Q1K2RzRE5oeGZEcnRTM2tqMi9BSWtOTmFaV1lkWVlzUjFWaC9iV1Uv?=
 =?utf-8?B?bWJRNDdhbkIxYlBvSVY2ek1hOHd1SFphQ3hUQ2dmQUk1WFFrd3F3czZaR0ZO?=
 =?utf-8?B?bFgyZU8xaDdmeXE0MVAyYUYzWk11UlFNdWhQa3ljU0VQblFsazZOU1pFcytK?=
 =?utf-8?B?R0p6N0tJZjdnMTN1VzJFYkZxTEprdmpZODZSRm9pOUo4QW9tWHMxcVZTRnhi?=
 =?utf-8?B?czl1SXAxY0FIUndSaXhOMHJab0NYa3RQZHF4MnU2YUFNdzFUV2NpdmxIdUhC?=
 =?utf-8?B?dmdadDc1cVRTNll3RGVkRUU4ZlorMjZtcTZMY0tHRDk3WmpsdEdWMDJZaXpW?=
 =?utf-8?B?TUZtbnU2TzJES045ZTcyY21lZlQ2NEk3bmpZWDZmdnRTQUNGcko0c3IyOHBI?=
 =?utf-8?B?VXQ5dlYyNTBxUXpqSStQTTNPRzd6Tmh0VlF1SnFNM3RsazZiaU5RV1h0VCt5?=
 =?utf-8?B?dVVnQjNLdVJTQ0RyNUcrV203S01iWE9LNHJYbzZnM3dONm1Ld3VJUjYrTWJV?=
 =?utf-8?B?dWJmeE5nRFllQ3R0R1ljSGZNWUNZeFVyM3FSalU1bTRJRllrN0paYmpWd2di?=
 =?utf-8?B?Z05ubC9tT2piUEI5T0owdW1jaTRqdjdld3NLT2pVSDJHUmNEbDl3VEJ1Yms5?=
 =?utf-8?B?VFZXcDRYYnRJclVmaE5SVnlheE1EUTNNR3dwMkh2VjdZa3BmUEEyNnhmYWlR?=
 =?utf-8?B?NEUrbHpaUEk1bkR5LzFnMThHU0ZsamlOQk5lbG5STlEwMG1YNmNZMEVROHg4?=
 =?utf-8?B?MUIzbFhod3Vrc29Idk1neFNRVDNZMUZLaEhITUpjclkyWjAwbVdIS041TytG?=
 =?utf-8?B?UUJ3bm1sbkpYNEtOKzVhSGdRQm9FY3UzUGRjeVZOTlVEREF0Y0VoWG1WTW94?=
 =?utf-8?B?WTZlanpwTzlURmhSU1YySzdtcXo4VTBNTStUZWdOay9UbXJkbEQ1aTVsaVJZ?=
 =?utf-8?B?VU52b2xQQS82Rm9KS2tXTFIzRmlRb2F5NjNDa2QwZDRNSGQvOUw3RExPMHZo?=
 =?utf-8?B?dEIwbXRleExob3I3RzMvZWpBamRaN3lXOGVDUlEvM3MyZnljdXJrY2tnWVVI?=
 =?utf-8?B?MStLbWxsL1c2Sk5vb2RBQ2NDbGx0K2d4aWRmd1QwUzFPUi83b2FSMlhsdkNy?=
 =?utf-8?B?eEpFYWMxd1FXay94U2VpL0wxQUhZd2p2T1R3M1JMZ1o1QzU0ZE92QjgzbjJt?=
 =?utf-8?B?UlhLMnFOU1o3MUhPWU5VRWlLREZmRFdyY01PbGJFaDU1emhQbi9wTXJDSEtD?=
 =?utf-8?B?UVlLeHI2TjFzUDA3RXVVeGw1dmQ3dzZqcGRGN0hKcG1EZGM3N1VGcVdIKzgy?=
 =?utf-8?B?TVFtSnFSeTY2Tm5rbVlRb3JIYW5jdWgxUUlBNjNrUWdPeGVzbm5xSGNPVXpT?=
 =?utf-8?B?Tm9RTFpKYjFLZkVGM0VxUXNpTDJaaEowNUptMVRVekRFTTNYM1VENWR1VGZQ?=
 =?utf-8?B?K2NLb0VGdFNZUWtHbmhPaWZJbktsSWkzbXMvZktUWGxCc0xnN0xCRmVuYitK?=
 =?utf-8?B?Um9CdnB0eFJ3WGZOVWZNOGs5Y1VVUG54N1MvSTl5UGVtVEl0YXR2anoxTUxh?=
 =?utf-8?Q?HV7xmadd4cTd2pyVifvDxIE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlpTSFZ1SFg3WmwzVWcvVkJDaWxERlRLcTVkbFExcGRMeENMTzdsWGRtcWlI?=
 =?utf-8?B?cTdic1Y5L1ZoRWhaRHVjQ1BRODh2a2MxY3R2QTlvUER3UW9HOFlHYmdrQU5I?=
 =?utf-8?B?M0VoSzZ0Tm80M1J5Y1hianE5TVVQdWR5R3lVUklHY1AyYkhkczV2VEVYZG5j?=
 =?utf-8?B?c0JOWnZFUXNLV2J0enAwSExTUGFoRGNOeU5sMXd1ZHR2N0JtNnRMS0dYcTkx?=
 =?utf-8?B?WGtnMmtOSmU3cHBMRTJMcDZPbmJPc2phZjNyS2NoaGpSUytobUlLNkEya2lB?=
 =?utf-8?B?dDRiNTBEc1ZJZ3c3dlU3bDhqdUJEcHJHOHU1bC8raWQwVkI5NkZIeEFEb3pa?=
 =?utf-8?B?WlV3L09aVmtlL2VtL2J3UHg0UmRVOVh6VHNhRkQ1VWZTL2JkRXdjemJETVBU?=
 =?utf-8?B?TUlYU3pMaUt1TlJ6SXVsdG9jVWU0aUVZUzI2Z3VaekNjYlVIOWJuWGFDcDB2?=
 =?utf-8?B?cWd4TytkaFlqL1lOeUkwN1pmamVXWDhqaGVnTUNiZ1lCMzRsWEZrNEUvOUp4?=
 =?utf-8?B?MXRaRWI0MHUwV1loY05VaFBBWXQxZHgxZVp4ZmlUeXp1Zy96YzFuenhSbzY3?=
 =?utf-8?B?ZUZ0SUNDOFpLa1Qrd01SSFkraTdpQ21ETnJLSTcvYzZZazF6M2RnemNybWpo?=
 =?utf-8?B?QklpVnhNSEdsNmF4WU5iN3pkanl4VVYwTmplbk9ueG5PMmlxTU9XYmYwSk5m?=
 =?utf-8?B?RW5uN1VHQVNQOVZ5WVlDOHdQQkdxdzV1NGQzYUNYbDJ6RGVQRytlcjBsYWE5?=
 =?utf-8?B?a1hQMWdtQnA5ZmNFT2g1QUVPWklBelo5dkY5M2hYODVScFFrMXBRQW5pcGta?=
 =?utf-8?B?eEhySFpHbXZoV2EyOHJjRkFIdTVUWVVGM2hXUkkvVW5XRi93Tmw0SXJuUERM?=
 =?utf-8?B?b0FMSzdyaDFaYTFabWd1WXpPRFZCMzJlUjFDVFlEWjB3bmw2WTNzTVpGWDhx?=
 =?utf-8?B?MFdjZkMxeTE1dndIdEszOFAzcFIwQnhrWGl3NmdmUlZVZnhTRlBQNStZcm51?=
 =?utf-8?B?WXhSMzkwUkwyRzRBSG5lY0JyNVdYcEM5U0JkaEpCM3prTEQ0VzNsdWg4L2Nk?=
 =?utf-8?B?ZGNDU2kxZFdkc1poTDVIbkYxL25DNDVPTFlJMGpjV1NCVTJnNm5HWHczK0hP?=
 =?utf-8?B?VWxQMVVNRnd1STU0MmsrRGNBRmFneFBzMngvUS8yT3RyL0xVRkUvY0VYQm5h?=
 =?utf-8?B?Y0V1cm45MVBvb0F4aDlDTWQ1RWhnR3E5Q0pJdzRtR3hDNTlKSlZCaktjN2Vn?=
 =?utf-8?B?eW1Kd2J2bXA5NkdKUDNXNFNvNzJVRG1DMFIvSVBvUWYwV1M1ZHBtNmRWcEVF?=
 =?utf-8?B?QnNUQ3VPSDF3V3NyVHM5dVRYTFFYZW96UHJzdzgxa29HMXlGQ3BnaE56REcw?=
 =?utf-8?B?ZW1WMVg5WWNkRVF3QmVnSGFNUHVlbVh6Z3R6blVNZkdWY0NZbmhzbW9lSElj?=
 =?utf-8?B?QXVQR3NaT3pFM3NrN1VCa09vOWpBdXFrY2M0MGVGQzVmdTZiU0tRTzM0ZUo2?=
 =?utf-8?B?ek9ESk9EalNIcXFURHY3bnIySVQ5bVhmcG9lWHcrSnVQM0xLajRoa1lOQjZ0?=
 =?utf-8?B?bnF0RGlCUDdqdHhoczF6bGVLR3FqbGFaVFVxd2dZRkVEUVd4WkRiMklUdUc5?=
 =?utf-8?B?bGMxc3liRmV4ZW9CWmZ2RklXeUlkL25hTXQ4bzU3Vi9VZ0pGemdLWkhBUXBU?=
 =?utf-8?B?MEliUTYxY1YxcmRTbFVWQ01pVkFYbVNYaURGSE1xRkpFTGI0K09UeDZPanBX?=
 =?utf-8?B?cy9BaG1nM25Damt5MitlZGFpTnhNRmtUVEVFOVp4TmRCTlYrZDZBWG5EeDVJ?=
 =?utf-8?B?ZXFpVjFZVzlyRnpJTjBYQW5rUFJPQmxSZUswSnJueU9yeHV6RmZkUmJ2M1Vl?=
 =?utf-8?B?OU04S092NFBJMTFxREc3ZXpXcDRYK2ZtK1QrYkpUem5Wd3EyaE44R1ZGS1BQ?=
 =?utf-8?B?LzE2MnlwQ1hUVE04SlZMcm5rd2Z0VVZPd2E4Wno1eGtIN2hTMVdjeEw3UTJi?=
 =?utf-8?B?MWpIRGNkSkZPM01tNWZWYlNRM2dWbnh1M25CaXBSR3grYU9TVXlKQStzaHBO?=
 =?utf-8?B?VVJaUGhRV0g3dGtRVzI0clpuWEdZZHlQVTRjK2ZvalZwMUxIalNQaUtXdWFp?=
 =?utf-8?B?V3BlVGFTZllhdUZidHR6Y09COFEyMGMrODRwWnFoOE1TelRsMzNjcWZFVG1E?=
 =?utf-8?B?SGZKQ05xMW04RHZMZVZDZlppd1hrczQySUhOUUw3Y1prODNyYjZpdERBQ1Zn?=
 =?utf-8?B?RGk5dHVvMVpUTFZQRFBUUlg5VXJuUzJwR1lsSDJHZ1pJdnU5SWU5VEt0a2JP?=
 =?utf-8?B?ckZ3U25NMmxxMXRBeGhjcVN6b3pJdE1kS011eE9ZNlBiWFFRUWNOZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef58915-2269-4e2b-279a-08de64009810
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 15:18:04.6496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hyg7ykOwGzWHx1XsdwsFNqsErknZ475cv/WtQi4+l/50xnbbfsnTgPME1pFhVv9RFYBgcUKc6WfaOVtO1CxXnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFdhamRlY3prbywgTWljaGFs
IDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkg
MywgMjAyNiA5OjMwIFBNDQo+IFRvOiBHb3RlLCBOaXRpbiBSIDxuaXRpbi5yLmdvdGVAaW50ZWwu
Y29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gdGVzdHMvaW50ZWwveGVfY29uZmlnZnM6IFJlc2V0IGNvbmZpZ2ZzIGF0dHJpYnV0ZXMgYWZ0
ZXINCj4gc3VidGVzdHMNCj4gDQo+IA0KPiANCj4gT24gMi8zLzIwMjYgNDowNiBQTSwgTml0aW4g
R290ZSB3cm90ZToNCj4gPiBUaGUgeGVfY29uZmlnZnMgdGVzdCB1c2VzIGEgc2hhcmVkIGNvbmZp
Z2ZzIGdyb3VwIGFjcm9zcyBhbGwgc3VidGVzdHMuDQo+ID4gV2hlbiBzdWJ0ZXN0cyBtb2RpZnkg
Y29uZmlnZnMgYXR0cmlidXRlcyB3aXRob3V0IHJlc2V0dGluZyB0aGVtLCB0aGUNCj4gPiBtb2Rp
ZmllZCB2YWx1ZXMgcGVyc2lzdCBhbmQgYWZmZWN0IHN1YnNlcXVlbnQgc3VidGVzdHMuIEZvciBl
eGFtcGxlLA0KPiA+IGN0eC1yZXN0b3JlLW1pZC1iYiByZXBvcnRzIHJlZ2lzdGVyIHZhbHVlIG1p
c21hdGNoZXMgZHVlIHRvIHN0YWxlDQo+ID4gYmF0Y2ggYnVmZmVyIGRhdGEgZnJvbSBwcmV2aW91
cyBzdWJ0ZXN0cy4NCj4gPg0KPiA+IEZpeCB0aHJlZSBpc29sYXRpb24gaXNzdWVzOg0KPiA+IC0g
c3Vydml2YWJpbGl0eS1tb2RlOiBEaXNhYmxlIHN1cnZpdmFiaWxpdHlfbW9kZSBhdCBlbmQgdG8g
cHJldmVudCBkcml2ZXINCj4gPiAgIGZyb20gZW50ZXJpbmcgc3Vydml2YWJpbGl0eSBtb2RlIGZv
ciBzdWJzZXF1ZW50IHRlc3RzLg0KPiA+IC0gZW5naW5lcy1hbGxvd2VkOiBSZXNldCBlbmdpbmUg
bWFzayB0byBhbGxvdyBhbGwgZW5naW5lcyBhZnRlciB0ZXN0aW5nDQo+ID4gICByZXN0cmljdGl2
ZSB2YWx1ZXMuDQo+ID4gLSBjdHgtcmVzdG9yZTogQ2xlYXIgYm90aCBiYXRjaCBidWZmZXJzIGJl
Zm9yZSBlYWNoIHRlc3Qgc2luY2UgcG9zdF9iYg0KPiA+ICAgZXhlY3V0ZXMgYWZ0ZXIgbWlkX2Ji
IGR1cmluZyBjb250ZXh0IHJlc3RvcmUsIGFuZCBzdGFsZSBwb3N0X2JiIGRhdGENCj4gPiAgIG92
ZXJ3cml0ZXMgbWlkX2JiIHJlZ2lzdGVyIHZhbHVlcy4NCj4gDQo+IElNTyB5b3Ugc2hvdWxkIHJh
dGhlciByZW1vdmUgZGV2aWNlIGRpcmVjdG9yeSBmcm9tIGNvbmZpZ2ZzIGFmdGVyIGVhY2ggc3Vi
dGVzdA0KPiBhbmQgbGV0IGVhY2ggc3VidGVzdCByZWNyZWF0ZSBpdCBhZ2FpbiB0byBnZXQgZGVm
YXVsdCB2YWx1ZXMgYXMgaGFyZGNvZGVkIGluIHRoZQ0KPiBkcml2ZXINCj4gDQo+IE1pY2hhbA0K
DQpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLiBJ4oCZdmUgdXBkYXRlZCB0aGUgdGVzdCB0byBy
ZW1vdmUgdGhlIGNvbmZpZ2ZzIGRldmljZSBkaXJlY3RvcnkgDQphZnRlciBlYWNoIHN1YnRlc3Qg
YW5kIHJlY3JlYXRlIGl0IHBlciBzdWJ0ZXN0IHNvIGFsbCBhdHRyaWJ1dGVzIHN0YXJ0IGZyb20g
ZHJpdmVyIGRlZmF1bHRzLiANCknigJlsbCBzZW5kIHYyIHNob3J0bHkuDQoNCi0gTml0aW4NCg0K

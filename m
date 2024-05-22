Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB822C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D7A10E0DE;
	Wed, 22 May 2024 16:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8bXPFvJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56AB10E0DE
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716396339; x=1747932339;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rZ3VyuX+vnfArAqayDJvbrX59tGO405z4iQyuCKXGNU=;
 b=j8bXPFvJz1eDRxf7u9vGbc6/m+VEp5zuqtX96qbvQB9kMvUFC3Jwk+IH
 aJ7cqWQjtb/hE6/OYH2OqnfQ5IVlux4A6PB2kPRmPxfRTTgt9dtQN0hgS
 6siNEskV/iik4oc6zc+GV3lAngm3QZ84BPoPxWiT/dk44W8LznUv2DkBi
 AnXmndOxSv4mbeOeJexcZKaDnn6vvvY5Z6SZpHtDOmCDlhuNFcSRXwiUl
 81wmtA6cIaTXGfKod/2PuLj6urkh90lGDUdxiEcJlahpgLAcvL2/ZibIU
 Dw7vJIvZTSLRlat40qnJXUIVvVRq49m1/VnI+JovUZxVBwKihaLjwt+cu A==;
X-CSE-ConnectionGUID: /UZjEsTWQaWUhbMMNkErGQ==
X-CSE-MsgGUID: d+Roxlv3Ro6MnOf94ksszA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12899241"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12899241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:45:36 -0700
X-CSE-ConnectionGUID: j+LM33P8SFiGDsxC/YJNmg==
X-CSE-MsgGUID: TAAi6AkPSMaIk5rpPmHsKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="64191404"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:45:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:45:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:45:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/fnOd7bJ8yo87ELL3XjWQugRKarDvsTCZCcz97K0u2nyZ0mXXzuhsz93I4nbqT1XQ1zlkMIiZYSIrhqpCTm1k8kOpCuCGVI6Tsws3+wShMOtPWlZrhadtAUL95RTSfTJjjtg8sqU8bc6I+wE71LHdO2KdWUfayho5WOPHivCgmexXv5tGyTzbJwU2afhjW6TydRFH9VuP6dBdOKVJkNw2a0fCQnnq3bZFWy6/9HTx1mINxCJa0mDAYDbXcnMiunG4NT21Gp6wUgDbeIh2hYazg3CHEydFZUeJMV081xBr5fgHHRYX/NPqYnIzx0wlKyGpDjz8/D217tAB+RMM38OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZ3VyuX+vnfArAqayDJvbrX59tGO405z4iQyuCKXGNU=;
 b=DE3B6LofiMbjc1hInh67CfwqzhISfVDhx8AHnBK5TSf+JyCyjCoAH0mazzj5AsLGaEOPNHDgygScR+r/ZnqHt1lUlJ9UUAjH1TqGVA2bHYR2r2qlPAuRFJx8ciwEBypx0wJscePCLRu7N7sKVnnhxkVy0h0pLLtfF6If7C0n0hgg1yK9n20vqpJSF6XAGWvOPs5ItrQPE+R+zJpAcpW1mzA9qY56SxG63/HSJxsr2MnmgKblMDyaL7AXSRMFyxbAbeTZNdb3eK8ss0UGCE+hQSIYIF2ULcJiwffZZ1GSHBPRsjSyhGdLCIFn15BjfaKA7UmbFjRJN/SPBVe0td9Yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 16:44:43 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:44:42 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH RFC i-g-t 0/2] helper function
Thread-Topic: [PATCH RFC i-g-t 0/2] helper function
Thread-Index: AQHamywYCEc2IeAo/kSvm/cwXTzvpbGBuHiggAAVlQCAIb9/wA==
Date: Wed, 22 May 2024 16:44:42 +0000
Message-ID: <SA1PR11MB699105600912E2055AADAB1E92EB2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
 <SA1PR11MB6991BA2418A132F04239526792192@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZjHIlgozTn+cph0I@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZjHIlgozTn+cph0I@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: krishnaiah.bommu@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ0PR11MB5920:EE_
x-ms-office365-filtering-correlation-id: 50dd6822-6bbb-4221-ae79-08dc7a7e7b14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?azc5eWhpMkU0OGRNcVBWOFlZNzZOYWVQVWJqUG45UVk3TkRIUDZTaFkxaUlL?=
 =?utf-8?B?RUlkWHBnZG11UlB0Z2R0bllUQlkvZjFMTDdQdGdCSmNsSUo5UEx0YVJKVVAz?=
 =?utf-8?B?dDcya1JjTllyRlloTTFCYk1NeHlHNWVKeVJhL3o2aXlkQ0Y4VGVPNkoraW9h?=
 =?utf-8?B?KzVDVElFaWJZU1hrQzNlb1F5aUV6bGUzSHRvV1hZQThRWnc5UVk5WGZKL1VG?=
 =?utf-8?B?aGxBZTNET1Q0Tll1Z0MyeVFrU2ovQ1c4NWVMdjY0RHBSVmhpUmRhcDlnRTlV?=
 =?utf-8?B?UkthQ05ueEJQajJ5MEhpdG1aeWhuajVPVUZ5Q0t2alFDSDhnWDFoS1R3RmRx?=
 =?utf-8?B?QmR4TkdtQ0MzNTV5MU5GK3hHSTh3MGJyZzRpUG1VUTgxNHJ2cVcyTzBnSEdE?=
 =?utf-8?B?Rk4xY3dYem1kMzlja0RORDdIOHFDWVhKekZBcXlYa2pnOGptZnVzV2JmVG04?=
 =?utf-8?B?b3ZidE5KQnQzSzRIN21YcFExV3NFVFMxNUV3dUhLOFZHOUxSQ2NkYk5jZDdm?=
 =?utf-8?B?RThWN2pGckcwSk53bS8zbWs0UHZGMkNzOVdaRjhBd250OVEvVXlpZnRsWnEx?=
 =?utf-8?B?SEtEa2VObncyRExJUVBLNElJT1g0S2o2Y0xrdzh1Tk1CcEVPMXNHd2RnMkxt?=
 =?utf-8?B?bGVLSXZPUFY4cEtyNGtRN1FrMXR6RnpsYUQza0J3NzR6YWlVQmNQS050OE1D?=
 =?utf-8?B?dmVUcmtZazlJY0wvOHBhZ0xPbnZBcUtJY0gveTdmZU5qeUl6aU1QRUZ2dFpv?=
 =?utf-8?B?dytMdmFMUlJtakVkMHYvaGRGdTJZcEFzQWNiSHlQL0JPUTVKRmd5WlNWOUZ6?=
 =?utf-8?B?dmFZOXJ1bVFmdjNCT1RIR1JnKy9sRGJVOWRCWEkvMy9CVitNSXZrWWlwanNw?=
 =?utf-8?B?Q3RsQks5R1F0NWpuMTVKdW91VTJhQy9JdzE2RG96amN6ekI3NGN0R05WY2pS?=
 =?utf-8?B?U0hZV0JJMGo2N2RUKys5RUpvY1lBQUthbTZlYWp1RmtSRHZQTUErZXJiU2tY?=
 =?utf-8?B?UktWekVlaUpHMTBmcTBOSjdpYm9Fa1NNOFRHVzNQT3IxNFNXWXk1emg3ZVl4?=
 =?utf-8?B?a2ZaM1QxeDNDSFZqTGd2dHpRL3pqSFNidklweStGTnVhZTRZcXhnV0hWc1Jy?=
 =?utf-8?B?NG1henZXcDdoaVlzZElQMGFFU2d6ZU9xblNJU1p0RUJmaDBWNVFlU0wvNlFX?=
 =?utf-8?B?cjgyTUtuSVVWWUU2T24wZkRkWGRxU2JYR0c4ZUwxR05tcTRYMmZ5VzZITE51?=
 =?utf-8?B?d0hQYm5SVFoxUGZiemJZVG1NdkhjaGVsZGZrVHpOYzZrWmczTHZDMUdCdlgr?=
 =?utf-8?B?UTk3Qk1Ycm9wMjFtL2VIVlJNSGpYamRQVFFrcC92QTkrbXZIekpBbXltOUI1?=
 =?utf-8?B?ekVDNC96MFhyQlNqbldQU2RTTXUzS1hMd3ZHbTBiWG5Bd3I1RWlqOEErYkg1?=
 =?utf-8?B?RithUzhuZjVMc0RZWXA1YUhNT2xUakc3ZFRPTU9BRlYwdFpTVFpzZVZvNFNT?=
 =?utf-8?B?UUxHWUltZmVTdE96MEE0endEZ2VhdE1OMVhoYkxrUkpFWVN6YzErQmI5ZDBs?=
 =?utf-8?B?aGRxQzNCTEdmNDNWVkZaSjNybzZOYWdQYXRWZkNiQTFCRHpYU3RhMGxwU25Q?=
 =?utf-8?B?MWRYM2gyZGhZV2pTczc0N1FhbTNmWXpsRlIwSlMyeHRwbG50cjBaYitjTTVU?=
 =?utf-8?B?MC9FVjRVMXVIZTZyNi80MWp4N1FyUm1VYzNINU1JMk1LOE1RQ2R0bmZpQ21Y?=
 =?utf-8?B?UGJ4SSt3enJGT3B6MmdpZVUxQ2tCWnlWc01yQWF2NzlNVytJTXVqdWk3QnUr?=
 =?utf-8?B?UjNId2N1ZGVCQU9WR2tLQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2VQVU11U0lmemdvbFNjUjJHN0pLdUxTZmluZm1hQ2ZEZ0dWRkQwczk4TFV0?=
 =?utf-8?B?Qjl2RE84cWx1aTZra2RpQ2hhdWhwUlJzbU1zVmd1K1l2Zjd0Mjl1TWJWS2du?=
 =?utf-8?B?aS9Dc1hNbXJkaWt6U1VreXc4QlN6L1g1YzlrYkJyemdTU1ZJTGp3Z1VqdGVW?=
 =?utf-8?B?YmF1VEhvRHFvcG5xMGQwRU92YjlHNXhVRUxlanVRbzBrZGxQaU1ldGpVRENp?=
 =?utf-8?B?YWp0Yk1NTnNTKzdKRmtOS0ZTV203L2tONkhTODdhbUpuSEQ3MzFxWk03OEZx?=
 =?utf-8?B?RUplSXYvZlE5VUJsc1BiakhleEI4UVVxeW4xaVc2Mjg2a0ljMVZrQ3pXNGxJ?=
 =?utf-8?B?OWViUncvRXVWaDFvejhGLzkzZTJxQ0lQUWxNRUFIOWlpUE5YSkpRcm1RVU9s?=
 =?utf-8?B?cmtEYytZaWJaVHdOZEdZN0pRNVhKZU5Ka0h3RUVDN0U0Y1NIVk12azhlVkVh?=
 =?utf-8?B?a1ptQWlSM3Z2aUN5S3BsTDBwZ09RMmhFS1F4U0dRUUZhK2JYYU5Kd1ptQng3?=
 =?utf-8?B?WHNlOHVNb24vTzZtMEwxUWtabGlCSjhHdFBvWldyQW1wN2VzbzcwOVlBZGZY?=
 =?utf-8?B?Tjk2NnBjQUphQjJZblJQZXBwMm90Z1hRQjVuZko5dS9ycmZLeGY2dTRjQ3A1?=
 =?utf-8?B?akF0YWNQeXNXc3B0N00waTByNW9aRXUzaStmVkU2a2NmMU5nVkxMUUJGSGtv?=
 =?utf-8?B?SXo1RGg2Y2M1bHNMU0NFVHNtTDJhbnBlM2tmbHIzVXI2YnVIeWh5ZmdZZU91?=
 =?utf-8?B?RFpES2FWQUZWajVneERuREE1ay81a3N5YldWbDN3WTFtRVVqNytCUW03RGYx?=
 =?utf-8?B?eHE2RFluZkdUZ2R6d2RGY05kMzFyNHRaN3pUWnk5aExFRGdBYTFqTlNVdzl3?=
 =?utf-8?B?R3JIN25NUEEzU3ptaVJHTDRici80QS8xUWh6dVd5SWVNVUhsU1BkQmFsQjdH?=
 =?utf-8?B?NlRLM2NBZjZpNGQzdWRCVHNna2QvYUNxR3JhVWNzZHdHcEpSajdMZHJxek5w?=
 =?utf-8?B?cjRMWUx6LzQrazVDSlVoLzdDTFlWd2NJSjVvTFJoNVZXTzFMZmUwL0k4U1lS?=
 =?utf-8?B?SzhadStsOEJMUUdGRkNTS0dhV2xIclFDVGxHMEN3NFdUbC8yM1Z6T240b0Q2?=
 =?utf-8?B?ZUc1Q2hEQWc0QlRtbU0wazF1dHhCKzF4ZWJuaUkzSC9kbmFaQlJhVHRzVVdi?=
 =?utf-8?B?OUNCYWtScXFNUVE5ZUlkOGZNZmw0bVFwazd0S016TVI4ejVWd3NCamk1K0ZM?=
 =?utf-8?B?U3RVMXdiaGR4UlIwTWNZTFFoREgrdldGdjg4V3lOa3BmdjltU2VrOXhpVFk4?=
 =?utf-8?B?UXNsWEQ5b0FXcnpKOGc2WFhJakJ2bmE5OEZQOEw0ZEVrK2VWNUlnQUlkNmpD?=
 =?utf-8?B?cXZiU0lUbHZMcmhDakR0alNTaEt3Y1lrTkdmOVJ4V0VVTVpUcTJLNGlTNjMx?=
 =?utf-8?B?eERRZEhkNitZN0U1S1ZuQ3cyU0c4bHMrVHJOTlhNVDRRUVM1YXh2UWlnT2lu?=
 =?utf-8?B?UnVQVW1yZXU3Y3J1RU9zS1FMTEJob2xWa3dnWlJlKzVmM2dsYWZpci9oVkxS?=
 =?utf-8?B?aS9ON1EraWFJeTVyWSt6UUJUWUV1cW4va0ozUndtMDlZcGFqL2QydG4xVysy?=
 =?utf-8?B?ZFRDSERXclQ1RGg1NGZ4RUhVeCtReHhldE5VTmJRazlhWXhuWG04U3JwV2Y3?=
 =?utf-8?B?SEFPcFE0clpPMHdtVGxSUTRGTWpGWGRmNlpkQUlzSGxRMFhhMmdsY2J3SlhW?=
 =?utf-8?B?ZCsvdDk2TXByYnFYL1ZZQUtpeG1JYjhIc1ZOd1Q1WUd5eUJlejA2QSsrQzNr?=
 =?utf-8?B?MGhzUmcrZCt3bGplQkNMcG90Z0NER2xMb3c0dGNLR0pzNzNBSTB6dy9rZ3Qy?=
 =?utf-8?B?c1hhRDJnVDFzNm5Edk9ITVdiMkFZYWJIQVVVRHBkZGFlUTB5UzJuck5PTnNx?=
 =?utf-8?B?d0tudSszZGNQL3VIYzVLZWVEemZkRDJYMmFsNFhKYkFjeWl1MVN6cGxSaGJr?=
 =?utf-8?B?ZUh6bzRNQ3dicWVwYW9iQjFHcmZ4R0laOE5oMnBGazBNTTNrTmhHNFVhenVr?=
 =?utf-8?B?b01vK1cva0lKNXZPS0NqTmxMd0ZtUXFPQzJ3T01HdGIrYmcvK3ZLelpsSFln?=
 =?utf-8?Q?yTLc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dd6822-6bbb-4221-ae79-08dc7a7e7b14
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 16:44:42.8585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3X/jmqvqXqUnZ002sj4V7FtY4HH5xLJowzhGxIp25qYSvloR9/sBVwSwzptQtWU6L1yOpTzp0zlwfGSrgfcRgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
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

SGkgTWF0dCwNCg0KSSByZXBsaWVkIHRoaXMgYmVmb3JlLiBJIGhhZCBhIGNsb3NlciBsb29rIHRv
IHRoZSBleGFtcGxlLCBzZWUgaW5saW5lDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBTZW50
OiBXZWRuZXNkYXksIE1heSAxLCAyMDI0IDEyOjQ0IEFNDQo+IFRvOiBaZW5nLCBPYWsgPG9hay56
ZW5nQGludGVsLmNvbT4NCj4gQ2M6IEJvbW11LCBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11
QGludGVsLmNvbT47IGlndC0NCj4gZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR2hpbWlyYXks
IEhpbWFsIFByYXNhZA0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCBSRkMgaS1nLXQgMC8yXSBoZWxwZXIgZnVuY3Rpb24NCj4gDQo+IE9u
IFR1ZSwgQXByIDMwLCAyMDI0IGF0IDA5OjM0OjE5UE0gLTA2MDAsIFplbmcsIE9hayB3cm90ZToN
Cj4gPiBAQnJvc3QsIE1hdHRoZXcgVGhpcyBpcyB0aGUgaW1wcm92ZWQgdmVyc2lvbiBvZiB0aGUg
aWd0IGhlbHBlcnMuIEl0IGhhcw0KPiBzb21lIGNsZWFyIGNvbmNlcHRzIG9mIGNyZWF0aW5nIGJ1
ZmZlciBhbmQgY29tbWFuZCBidWZmZXIsIGFuZCBjb21tYW5kDQo+IHN1Ym1pc3Npb24uIFdpdGgg
dGhvc2Ugc2ltcGxlIGNvbmNlcHRzLCB3ZSBhcmUgYWJsZSB0byB3cml0ZSBhbiBpZ3QgdGVzdCBp
bg0KPiA8MjAgTE9DLCBzZWUgcGF0Y2ggMi4NCj4gPg0KPiANCj4gU3VyZSB5b3UgY2FuIHdyaXRl
IGFuIElHVCB3aXRoIDIwIExPQyBidXQgdGhlc2UgaGVscGVycyB1bHRpbWF0ZWx5IHB1dA0KPiBs
aW1pdHMgb24gdGhlIGNvbXBsZXhpdHkgb2YgdGVzdHMgeW91IGNhbiBidWlsZC4gVG8gZ2V0IHRy
dWUgY292ZXJhZ2UsDQo+IHlvdSBhbG1vc3QgYWx3YXlzIGFyZSBnb2luZyB0byBvcGVuIGNvZGUg
c29tZXRoaW5nLiBPciB0aGUgaGVscGVycyBnZXQNCj4gc28gY29tcGxleCBpdCBhY3R1YWxseSBt
YWtlcyB0aGluZ3MgbW9yZSBjb25mdXNpbmcuLi4NCj4gDQo+IFRoZSBvcGVuIGNvZGluZyBhZG1p
dHRlZGx5IGNvdWxkIGJlIGEgbG90IGJldHRlciBpbiB0aGUgY3VycmVudCBJR1QNCj4gc3VpdGUu
IEEgbG90IG9mIHRoZXNlIHRlc3RzIEkganVzdCB3cm90ZSBhcyBxdWlja2x5IGFzIHBvc3NpYmxl
IHdoaWxlDQo+IHdyaXRpbmcgWGUgaW4gYSBQb0Mgc3RhZ2UgYW5kIHRoZW4gdGhleSBnb3QgbWVy
Z2VkLiBJZiBJIGNvdWxkIHJld3JpdGUNCj4gdGhlc2UgdGVzdHMsIHRoZXkgd291bGQgYSBsb29r
IGEgYml0IGRpZmZlcmVudC4NCj4gDQo+IExldCBnaXZlIHNvbWUgZXhhbXBsZXMgb2YgdGhlIGxp
bWl0YXRpb25zIG9mIHRoZSBjdXJyZW50IGhlbHBlcnMgaW4gdGhpcw0KPiBzZXJpZXMuDQo+IA0K
PiB4ZV9jcmVhdGVfYnVmZmVyIC0gVGhpbmdzIEkgY291bGQgY29udmlhYmxlIHdhbnQgaXQgdG8g
ZG8gYmV5b25kIHdoYXQgaXQNCj4gZG9lcyBmb3IgYSBzeXN0ZW0gYWxsb2NhdG9yIHRlc3QuLi4N
Cj4gCS0gSSB3YW50IHRvIHVzZSBtbWFwIHdpdGggbm8gZmlsZSBiYWNraW5nLCB3aXRoDQo+IAkg
IHNldmVyYWwgZGlmZmVyZW50IGZsYWcgY29tYm9zIChNQVBfU0hBUkVELCBNQVBfUFJJVkFURSwN
Cj4gCSAgTUFQX0FOT05ZTU9VUywgZXRjLi4uKQ0KPiAJLSBJIHdhbnQgdG8gdXNlIG1tYXAgd2l0
aCBmaWxlIGJhY2tpbmcNCg0KVGhvc2UgYXJlIGFsbCBvcHRpb25zIGZvciBzeXN0ZW0gYWxsb2Nh
dG9yIGFuZCB1c2VycHRyLiBUaG9zZSBvcHRpb25zIGRvZXNuJ3QgYXBwbHkgdG8gQk8gYmFzZWQg
YnVmZmVyLg0KDQpUaGUgY29uY2VwdCBiZWhpbmQgdGhlIHhlX2NyZWF0ZV9idWZmZXIgaXMsIHdl
IGNvbWJpbmUgdGhlIEJPIGNyZWF0aW9uIGFuZCB2bV9iaW5kL3dhaXQtZm9yLXZtLWJpbmQtY29t
cGxldGUgaW50byBvbmUgZnVuY3Rpb24sIHNvIGl0IGlzIGVhc2llciB0byB1c2UuDQoNCkBCb21t
dSwgS3Jpc2huYWlhaCB3ZSBjYW4gZHJvcCB0aGUgaXNfdXNlcnB0ciBzdXBwb3J0IGluIHhlX2Ny
ZWF0ZV9idWZmZXIuIFJlbmFtaW5nIHhlX2J1ZmZlci94ZV9jcmVhdGVfYnVmZmVyIHRvIHhlX2Jv
X2J1ZmZlci94ZV9jcmVhdGVfYm9fYnVmZmVyLCBvbmx5IGRlYWwgd2l0aCBCTyB0eXBlIGJ1ZmZl
ciBpbiB0aGlzIGZ1bmN0aW9uLiBUaGUgY21kYnVmIGNvbmNlcHQgY2FuIHN0aWxsIGJlIG9uIHRv
cCBvZiB4ZV9ib19idWZmZXIuDQoNCkZvciB1c2VycHRyLCB3ZSBjYW4gY3JlYXRlIHhlLXVzZXJw
dHItYnVmZmVyIGFuZCBpbnRyb2R1Y2UgbW9yZSBwYXJhbWV0ZXJzIHRvIGNvdmVyIHdoYXQgTWF0
dCBzYWlkIGFib3ZlLiBPciB3ZSBjYW4gZGVjaWRlIHRvIG5vdCBoYXZlIGEgd3JhcHBlciBmb3Ig
dXNlcnB0ci4gV2UgZG9uJ3QgdXNlIHRoZSB1c2VycHRyIGluIHN5c3RlbSBhbGxvY2F0b3IgdGVz
dHMuIFdlIGNhbiBsZWF2ZSBpdCBmb3Igbm93LiBUaG9zZSB3aG8gd3JpdGUgdGhlIHVzZXJwdHIg
dGVzdCBjYW4gZGVjaWRlLg0KDQpGb3Igc3lzdGVtIGFsbG9jYXRvciwgb2J2aW91c2x5IHdlIGRv
bid0IG5lZWQgYW55IGhlbHBlciBiZWNhdXNlIHRoZXJlIGlzIG5vIHZtX2JpbmQgZm9yIHN5c3Rl
bSBhbGxvY2F0b3IgKGV4Y2VwdCB0aGUgZ2lnYW50aWMgdm1fYmluZCkuDQoNCj4gCS0gSSB3YW50
IHZhcmlvdXMgcG9zc2libGUgYWxpZ25tZW50cw0KPiAJLSBJIHdhbnQgdmFyaW91cyBwb3NzaWJs
ZSBzaXplcw0KDQpUaGVyZSBpcyBhbHJlYWR5IGEgc2l6ZSBwYXJhbWV0ZXIuIFVzZXIgY2FuIGFs
d2F5cyBwYXNzIGluIGFuIGFsaWduZWQgc2l6ZWQgdG8gYWNoaWV2ZSBhbGlnbm1lbnQuDQoNCg0K
PiAJLSBJIGFscmVhZHkgaGF2ZSBhbiBleGVjIHF1ZXVlDQoNClRvIGJlIG1vcmUgY2xlYXIsIHdl
IGNhbiByZW1vdmUgdGhlIGV4ZWNfcXVldWUgZnJvbSB4ZS1iby1idWZmZXIsIGFuZCBjcmVhdGUg
YSB4ZV9jbWRfYnVmIGNvbmNlcHQ6DQoNClN0cnVjdCB4ZV9jbWRfYnVmDQp7DQoJU3RydWN0IHhl
X2JvX2J1ZmZlcjsNCglCb29sIGFscmVhZHlfaGF2ZV9leGVjX3F1ZXVlOw0KCVVpbnQzMl90IGV4
ZWNfcXVldWU7DQp9Ow0KDQpDcmVhdGUvZGVzdHJveSBleGVjIHF1ZXVlIGNvbmRpdGlvbmFsbHku
DQoNCg0KPiAJLSBJIGRvbid0IHdhbnQgdG8gYmluZCBpdCAoZS5nLiBhbHJlYWR5IGhhdmUgc3lz
dGVtIGFsbG9jYXRvcg0KPiAJICBiaW5kIGZvciBpdCkNCg0KDQpXZSBkb24ndCBwbGFuIHRvIGhh
dmUgYW55IHdyYXBwZXIgZm9yIHN5c3RlbSBhbGxvY2F0b3IuIEJ5IGRlZmluaXRpb24gb2Ygc3lz
dGVtIGFsbG9jYXRvciwgaXQganVzdCByZS11c2UgZXhpc3RpbmcgTGludXggQVBJIHdoaWNoIGlz
IHdlbGwgZGVmaW5lZC4gTm8gbmVlZCB0byB3cmFwIGl0Lg0KDQoNCj4gCS0gSSBkb24ndCB3YW50
IHRvIGFsbG9jIGEgbmV3IHVmZW5jZQ0KDQpTaW1pbGFyIHRvIHRoZSBleGVjX3F1ZXVlIHNvbHV0
aW9uLiBJZiB5b3Ugd2FudCB0byB1c2UgYW4gZXhpc3RpbmcgYmluZF9mZW5jZSBmb3IgeGUtYm8t
YnVmZmVyLCB3ZSBjYW4gZGVmaW5lIGl0Og0KDQpTdHJ1Y3QgeGVfYm9fYnVmZmVyIHsNCglCb29s
IGFscmVhZHlfaGF2ZV9iaW5kX2ZlbmNlOw0KCVVpbnQzMl90ICpiaW5kX2ZlbmNlOw0KLi4uLi4N
Cn07DQoNClRoZW4gY3JlYXRlL2Rlc3Ryb3kgdGhlIGJpbmRfZmVuY2UgY29uZGl0aW9uYWxseS4N
Cg0KPiAJLSBJIG1heSBvciBtYXkgbm90IHdhbnQgdG8gbWVtc2V0IGl0DQoNCkludHJvZHVjZSBh
IGJvb2wgbWVtc2V0IHBhcmFtZXRlciB0byB4ZS1iby1idWZmZXINCg0KPiAJLSBJIHdhbnQgdG8g
bWxvY2sgaXQNCg0KSSB0aGluayBtbG9jayBvbmx5IGFwcGxpZXMgdG8gc3lzdGVtIGFsbG9jYXRv
ciBhbmQgdXNlcnB0ci4gSXQgZG9lc24ndCBhcHBseSB0byBCTyB0eXBlIGJ1ZmZlci4gU28gd2Ug
ZG9uJ3QgbmVlZCB0aGlzIGluIHhlLWJvLWJ1ZmZlciBjb25jZXB0Lg0KDQpTbyBieSBhIGNsb3Nl
IGxvb2sgb2YgeW91ciBleGFtcGxlLCB3ZSBjYW4gYWRkcmVzcyBhbGwgeW91ciBjb25jZXJucyBi
eToNCg0KMSkgbmFycm93IGRvd24gdGhlIHhlLWJ1ZmZlciBjb25jZXB0IHRvIHhlLWJvLWJ1ZmZl
ciB0byBvbmx5IGNvdmVyIEJPIHR5cGUgYnVmZmVyDQoNCjIpIGludHJvZHVjZSBhIGZldyBtb3Jl
IHBhcmFtZXRlcnMgdG8gbWFrZSB0aGUgY3JlYXRpb24gYmVoYXZpb3IgbW9yZSBmbGV4aWJsZS4N
Cg0KDQpUaGUga2V5IHBvaW50IGlzLCBpbnRyb2R1Y2luZyBoZWxwZXIgZnVuY3Rpb25zIGFuZCBj
b25jZXB0IGNhbiBzaW1wbGlmeSB0ZXN0IHdyaXRpbmcuIENvbWJpbmUgYSBCTyBjcmVhdGlvbiBh
bmQgdm1fYmluZC9ib19tYXAgaXMgdmVyeSBuYXR1cmFsOiB5b3UgbmVlZCB0byB0byB2bV9iaW5k
L21hcCBCTyBzb29uZXIgb3IgbGF0ZXIuIFNvIHdoeSBub3QgZG8gaXQgaW4gb25lIGhlbHBlciBm
dW5jdGlvbiB0byBzaW1wbHkgY29kaW5nPw0KDQpTYW1lIHRoaW5nIHdpdGggdGhlIGNvbW1hbmQg
YnVmZmVyIGNvbmNlcHQuIHdpdGggZWFjaCBjb21tYW5kIGJ1ZmZlciAoYmF0Y2ggYnVmZmVyIHNv
bWUgcGVvcGxlIGNhbGwgaXQpLCB5b3Ugd291bGQgbmVlZCBhIGV4ZWMgcXVldWUgZm9yIGxhdGVy
IHN1Ym1pc3Npb247IHlvdSBhbHNvIG5lZWQgdG8gZmlsbCB0aGUgY29tbWFuZCBidWZmZXIgd2l0
aCBHUFUgY29tbWFuZHMuIFdyYXBwaW5nIHRob3NlIGludG8gYSBjb21tYW5kIGJ1ZmZlciBjb25j
ZXB0IHNpbXBseSBjb2Rlcy4NCg0KDQpPYWsNCg0KDQo+IA0KPiBUaGlzIGlzIHF1aWNrbHkgZ290
dGVuIG91dCBvZiBoYW5kIGZvciBhIHNpbmdsZSBoZWxwZXIuIEkgY291bGQgZ28gb24NCj4gd2l0
aCB0aGUgb3RoZXIgaGVscGVycyB0b28uDQo+IA0KPiBJZiB5b3UgcmVhbGx5IHdhbnQgdG8gYnVp
bGQgcG93ZXJmdWwsIGNvbXBsZXggdGVzdHMgaW4gYSBnZW5lcmljIHdheQ0KPiBmcm9tIG15IGV4
cGVyaWVuY2UgeW91IHJlYWxseSBuZWVkIHRvIGJ1aWxkIGFuIGVudGlyZSBmcmFtZXdvcmsuDQo+
IFR5cGNpYWxseSB0aGVzZSBpbnZvbHZlIGJ1aWxkaW5nIG9wZXJhdGlvbnMgbGlzdHMgYW5kIHRo
ZSBwYXNzaW5nIHRoZXNlDQo+IG9mZiB0aGVzZSBvcGVydGFpb25zIHRvIGEgdGVzdCBydW5uZXIg
d2hpY2ggZXhlY3V0ZXMgdGhlbS4gQnVpbGRpbmcNCj4gc29tZXRoaW5nIGxpa2UgdGhhdCB0YWtl
cyBxdWl0ZSBhIGJpdCBvZiBza2lsbCBhbmQgdGltZS4gSSBoYXZlbid0IHNlZW4NCj4gYW55dGhp
bmcgbGlrZSB0aGF0IGluIHRoZSBJR1Qgc3VpdGVzIGFuZCBpcyBsaWtlbHkgb3V0IHNjb3BlIHdp
dGhvdXQgYQ0KPiBzZXJpb3VzIGNvbW1pdG1lbnQgKGxpa2UgYSB5ZWFyIHBsdXMgZGV2IG9uIGp1
c3QgdGhlIGZyYW1ld29yaykuDQo+IA0KPiBXaXRoIGFsbCB0aGlzLCBJJ20gbm90IHNheWluZyBk
b24ndCBkbyB0aGlzIGJ1dCBJJ20gdmVyeSBzY2VwdGljYWwgdGhpcw0KPiBpcyBnb2luZyB0byBi
ZSBhbGwgdGhhdCB1c2VmdWwgYmV5b25kIGZhaXJseSBzaW1wbGUgdGVzdHMuIEkgY291bGQgYmUN
Cj4gd3Jvbmcgb3Igb3RoZXIgbWlnaHQgaGF2ZSBkaWZmZXJlbnQgb3BpbmlvbnMgdGhhbiBtZSB0
b28uDQo+IA0KPiBNYXR0DQo+IA0KPiA+IFdlIG1pZ2h0IHN0aWxsIGZpbmUgdHVuZSB0aG9zZSBo
ZWxwZXJzIGJ1dCByb3VnaGx5IHRoZSBjb25jZXB0IHNob3VsZG4ndA0KPiBjaGFuZ2UgbXVjaC4N
Cj4gPg0KPiA+IERvIHlvdSB0aGluayB3ZSBjYW4gc2ltcGxpZnkgZXhpc3RpbmcgaWd0IHRlc3Rz
IHN1Y2ggYXMgeGUtZXhlYy1mYXVsdC1tb2RlDQo+IHVzaW5nIHRob3NlIGhlbHBlcnM/IERvIHlv
dSBzdWdnZXN0IHVzIHRvIGdpdmUgaXQgYSB0cnk/IElmIG5vdCwgd2Ugd2lsbCBqdXN0IHVzZQ0K
PiB0aG9zZSBoZWxwZXJzIGZvciBzdm0gdGVzdCBvbmx5Lg0KPiA+DQo+ID4gSGkgS3Jpc2huYSwN
Cj4gPg0KPiA+IFNlZSBjb21tZW50cyBpbmxpbmUNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEJvbW11LCBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJv
bW11QGludGVsLmNvbT4NCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDMwLCAyMDI0IDI6Mjgg
UE0NCj4gPiA+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gQ2M6IEJv
bW11LCBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT47IFplbmcsIE9haw0K
PiA+ID4gPG9hay56ZW5nQGludGVsLmNvbT47IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQNCj4gPiA+
IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDogW1BBVENI
IFJGQyBpLWctdCAwLzJdIGhlbHBlciBmdW5jdGlvbg0KPiA+DQo+ID4gVGhlIHN1YmplY3QgY2Fu
IGJlIHNvbWV0aGluZyBsaWtlOiBJbnRyb2R1Y2UgaGVscGVyIGZ1bmN0aW9ucyBmb3IgYnVmZmVy
DQo+IGNyZWF0aW9uIGFuZCBjb21tYW5kIHN1Ym1pc3Npb24gZXRjDQo+ID4NCj4gPiBPYWsNCj4g
Pg0KPiA+ID4NCj4gPiA+IEludHJvZHVjZSBoZWxwZXIgZnVuY3Rpb25zIGZvciBvYmplY3QgY3Jl
YXRpb24sIGJpbmRpbmcsIHN1Ym1pc3Npb24sDQo+ID4gPiBhbmQgZGVzdHJ1Y3Rpb24sIGFwcGxp
Y2FibGUgZm9yIFNWTSBhbmQgb3RoZXIgdGVzdHMNCj4gPiA+DQo+ID4gPiB4ZV9zdm0gdGVzdCBp
cyB2YWxpZGF0aW5nIHRoZSBoZWxwZXIgZnVuY3Rpb24gaW50cm9kdWNlZCBpbiAnbGliL3hlL3hl
X3V0aWw6DQo+ID4gPiBoZWxwZXIgZnVuY3Rpb24nDQo+ID4gPg0KPiA+ID4gSW4gdGhpcyB0ZXN0
IEkgaGF2ZW7igJl0IGluY2x1ZGVkIHRoZSBzdm0gZnVuY3Rpb25hbGl0eSwgbmV4dCBwYXRjaCBJ
IHdpbGwNCj4gaW5jbHVkZQ0KPiA+ID4gc3ZtIGZ1bmN0aW9uYWxpdHkNCj4gPiA+DQo+ID4gPiBU
ZXN0IHJlc3VsdHMNCj4gPiA+IHJvb3RARFVUNzAzMlBWQ01lbGxhOi9ob21lL2d0YS94ZS9uZXcv
aWd0LWdwdS0NCj4gPiA+IHRvb2xzIyAuL2J1aWxkL3Rlc3RzL3hlX3N2bQ0KPiA+ID4gSUdULVZl
cnNpb246IDEuMjgtZzM2NWY4MTY0NiAoeDg2XzY0KSAoTGludXg6IDYuOC4wLXJjNS14ZWRybXRp
cCsgeDg2XzY0KQ0KPiA+ID4gVXNpbmcgSUdUX1NSQU5ET009MTcxNDQ5ODI0NyBmb3IgcmFuZG9t
aXNhdGlvbg0KPiA+ID4gT3BlbmVkIGRldmljZTogL2Rldi9kcmkvY2FyZDENCj4gPiA+IFN0YXJ0
aW5nIHN1YnRlc3Q6IHN2bS1iYXNpYy1tYWxsb2MNCj4gPiA+IFN1YnRlc3Qgc3ZtLWJhc2ljLW1h
bGxvYzogU1VDQ0VTUyAoMC4wMjJzKQ0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJvbW11
IEtyaXNobmFpYWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IE9hayBa
ZW5nIDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+ID4gPiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5
IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiA+ID4NCj4gPiA+IEJvbW11IEty
aXNobmFpYWggKDIpOg0KPiA+ID4gICBsaWIveGUveGVfdXRpbDogaGVscGVyIGZ1bmN0aW9uDQo+
ID4gPiAgIHRlc3RzL2ludGVsL3hlX3N2bTogYmFzaWMgeGVfc3ZtIHRlc3QNCj4gPiA+DQo+ID4g
PiAgbGliL3hlL3hlX3V0aWwuYyAgICAgfCAxMTMNCj4gPiA+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICBsaWIveGUveGVfdXRpbC5oICAgICB8ICAz
MiArKysrKysrKysrKysNCj4gPiA+ICB0ZXN0cy9pbnRlbC94ZV9zdm0uYyB8ICA5OQ0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgdGVzdHMvbWVzb24uYnVp
bGQgICAgfCAgIDEgKw0KPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMjQ1IGluc2VydGlvbnMoKykN
Cj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvaW50ZWwveGVfc3ZtLmMNCj4gPiA+DQo+
ID4gPiAtLQ0KPiA+ID4gMi4yNS4xDQo+ID4NCg==

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21300C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 22:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C740110E00A;
	Mon, 14 Apr 2025 22:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7OZoC7J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2737610E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 22:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744669254; x=1776205254;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NPO9+pJwV6+19e8TWsRxBnYHAI8Y3oOJJYOJd3PygYQ=;
 b=N7OZoC7JWzjJPqyylpYpjmdd6WeeafwaEtdwAEGJzvnYovnIL/p4JYfK
 a6D2Se3LFv0jejUK+3l5M+cwavSGaZb20/aZRY49YER3otB0HuV1gMo3H
 84OmHQmsI23R7UoNP1nW5tJMMfI06zmVkw4S0iuqRV+SZP20FsZyOYJBB
 JJCuvjURkAsdZ6AUXhoU/r5yW1TdATdTGEgBI6bb+8NhBayarpSIzmWm0
 HqZBYtFm0mvJldXpT3QrQOl1FYXQ5Bp2alJRfU1JiVe676LzybHHJQdJ0
 cRmyZBmCNTTLhp1kFrP/UH2AKWBe32Z3aRGqq+cVLTA1Gfk+3SAAzBLXd Q==;
X-CSE-ConnectionGUID: JYAGOeG+R8SulvrboHDQKQ==
X-CSE-MsgGUID: yfSkYcm5Q5u7zuv9Z30XqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46068762"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46068762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:20:53 -0700
X-CSE-ConnectionGUID: dzTHIza3SguvNED5rvatcw==
X-CSE-MsgGUID: CxCuknyOSOaG3AyDGUrBVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135000219"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:20:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 15:20:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 15:20:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 15:20:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFsib8qP3FpVuxklKJlbgoNZ72gM0RHd/Wbmuowh9oBMtgQxHHOku4dkS2lYJZM3PfPUJjCvVhuXmqyNRDGr2UVx2iZACrh7Aq1G7qqn+XF2/iVjPQfH5AZ/1j1AWjFBH4DWw9lo5pmo0IcJF3qQfKfxDiwomj3lW55t3hGwKEwt6nN7h9qhbq/AfJ30WvXIXsB5OTJodipYpNVfV15+IzHAEh6PrMAk4D+IYZKtXJ245XeCEVptz8yZLz5AGplZTqUPPYB96duyV2CATPNERRsyjXMY6D9TA5vctfx9blIIJsial9cmQy7E4XmBR42S5pY16bac7mjl308GhEfh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhD4P9MnuqGYgEJ+GqgkdtyYdZ8QE74MIonRUarQZZQ=;
 b=bJDzJkirfj0JhdsGyrdr28N7XkXxmNf/VCm/fZkh7qT/fKlO1KLi81xPvFJf3Nz7kGKDcjRv9q+MrOwZ/gBL8U1KfVnP2bvYb/l2b+leFOIAL8bVwl5Jc6+f0FxaiVcjbFj0HXjpS2Muci3vQ95zzCzTY/P3jNauspf3eZ/FsS8Yz+n2JpWs3ONjRStaO5va4YJaaIOac/rYZmT+y5SYzXBSLH9Vy16g8CGzBGPGjUmAKcuVkDg+uQBWyRViq13dbPPzAqF3gVrHM1Y9BCdXfWa/QdNf7B/cnudSf4Jfs2oiEsSKK8oL3OGr6uHFPzpFGh21DiMepXqR2dV3xtRrqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 22:20:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 22:20:48 +0000
Date: Mon, 14 Apr 2025 15:20:46 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/6] tests/intel/xe_oa: Rename check_reports to
 mmap_check_reports
Message-ID: <Z_2KPhY73pz979I0@unerlige-desk.amr.corp.intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
 <20250408181210.1052760-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408181210.1052760-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0252.namprd04.prod.outlook.com
 (2603:10b6:303:88::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c109a11-bad5-4c77-0b26-08dd7ba29b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTdkTGZyKzRaOXlBd3JocVFqQkJZTVlSVkIxWjVoa1FOK1ZKclh0SkxETURx?=
 =?utf-8?B?U2dYM2ZGdmdxWUY3cDY5TmdlMjU2MUMra29FdS9rSWhVeU1HM3VUUXp3QmFJ?=
 =?utf-8?B?TjFJajVPL0pSYjR0VE41RWFyQUZDK21keDY0L1ptcFA3blFmeDhzdkpSY0NF?=
 =?utf-8?B?ZVZiUW4yOWhKMTM0N1RGQUc0MzhqWmFKZVp2K244dlVPUnF6aWxySnZaZk5z?=
 =?utf-8?B?ZTNWd0I3QUFUTHptQXU4ZzN4aUNmWEZSYkNEWElpWEh3VitNb0ZhTTFEVGJY?=
 =?utf-8?B?cjIvYXJTazZpUG1kTXprRlFidnhGalROYzJuVDN0eGZiRG1VVFhFanJkSzhr?=
 =?utf-8?B?MWZuQUx1Y2pkbkVUNnNHQW1MQ2RXMS9LOVROTUZ3ZCtRL1JlZXJLTTV1bzhF?=
 =?utf-8?B?K1FFK1pDSmtlcGkwYzA5cGIwQzNFNGUzalkzeThWelJHZ3J6ZUJnTWNJaExQ?=
 =?utf-8?B?YkoyRFRyWk83UUJSSXB3T25Ba3BBSXlrYlZNbjJKY3lTWERwQkdSRWFIMHQ5?=
 =?utf-8?B?OWhsdHlhNG4xVHJ4Rm04NDg2TjJWRWlRUHlZWnhhaHNjZTlVaUt2SWYzQXhH?=
 =?utf-8?B?Nnd3VWRYR3JaVEk3V0k3VFNWN01kRWhlWGtGandrSEthYkdNOVljd0lDQmw3?=
 =?utf-8?B?ZEJRVXJra2VFdkxrVkM0TVFLVlkzcGpjdTRpWmZnMzF6U1lZellpeHRJenIy?=
 =?utf-8?B?WndIeFlPWWZFNXU3bVhsVnQ1Y2tVK1pZTU0wYlU2MmsxUlpqZGcyZ29PTmdO?=
 =?utf-8?B?d2JwajRKQmp0bWRSQmFPK1VWVTN5NmdkN09GM0FtWnBqWVBmZUJhSGZHVnJK?=
 =?utf-8?B?RVR2QmlhcDY5ZnlESGtKeFdHakdBKzRtNllOMDIwNnUvR1pHNE5OdmVyZWRI?=
 =?utf-8?B?emYxaE05eWlSeURHN0NTdkVvQkQ3WEpwdExGd2VXd0hILzkwUWFQTVh5SlRL?=
 =?utf-8?B?TGtqREd5MTBQZ3lnVGtGcDgxTjV3K0Vpdkl1cEp2VGV3ckh0b09UU3NLd29x?=
 =?utf-8?B?QU5pcGxUZjdtL2NOem1zWlRyUmtnaTlaaWJyc0NjZWJST0hQanBQbkNRdmlB?=
 =?utf-8?B?Z1dNRThXdXltTFNVNmhCS3FBY1NOTzdIYk1zVFo2OWVZNDcxczl6ZG96dWp0?=
 =?utf-8?B?aThQYnlzQ0VqVmlJdkVEd0hTaCtiK3M4eWorRlpFbU1HeGpIeGNsOG5LMlg2?=
 =?utf-8?B?S2l3RGs0bmRtdHJmNEdKeXg1Zmk2dkJETXQyakZkSHdSVGZvODA2NEJGVjlx?=
 =?utf-8?B?TG56KzNwT2ZrNk96cGlxckhFdU9uajZ0dVhTTDUveHBLalZLWWlmNW5NTity?=
 =?utf-8?B?cThzY3ZsdmtpWjZlRnlGWkR2cDJZcFFoZmZWVUc2bWtENDdXZWRHa2dKek5X?=
 =?utf-8?B?dHRaV2h0UXFZUXJOU2RFMGJTNEU2NTV5WmhDVkVOUmk3cGduem1VMHhtQ1FX?=
 =?utf-8?B?Z3JYV3VRY1ZhK2pNMGpEK3d3MXYxTGZkOG9aRlVBT3JwMGpYSUlkRlZ4TFJP?=
 =?utf-8?B?MDV1dllFSHJDWGNUZEtoTFh0eW9KZFRNZVZ2QklmeEpUbnFtS043ZG1JUUJZ?=
 =?utf-8?B?djBYREVVU3hrc3FTeksrc2h2dGZmVCt4SzBKc05uMWRmWW9aQ0VPdlcwWTRy?=
 =?utf-8?B?eTk3cVFlalNYV3oyMzJWUnoyU1EzMUlPYTlBVU96MmwvVlFsVHdYeW1hTURK?=
 =?utf-8?B?VFF5NFlJNzZBOVVub0FiREZSdnRtelBwUDhwOHQ0YUJTSDB1REpBaHhGQkFr?=
 =?utf-8?B?T3E2WVQ2TkhoVFN3dGQ0ME1Jb00ycDc4TTFvVTV2K3VINHFYYk9CMTd6a3pT?=
 =?utf-8?B?MjdUYjNaYmFmbmdLMXJNaVQ1SWFxWmk5b0ZSNTlwbGNVRHFHTWhFWS9aR0M2?=
 =?utf-8?B?cFFXTmN1a0pJZXd0OTBsK2VPVEF0R2c2UEd4K1FtMThmb0w1SXJMdGpKaEU4?=
 =?utf-8?Q?4lN/8ZJCbFg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEpjQjBhTWE4OXEvRENRNlMxeEFrUExFYzc0R3lVTktLZDUyQlY3K1krMmFQ?=
 =?utf-8?B?TXZDUjdTUm81MjBadVc0aWgxa2F1bFRLN2FIVDUvcWl5eEVCMkUyQWo2ZlV2?=
 =?utf-8?B?Qk5iT1Y5WktrR2dZL1BuOUR5N2l5YUVwRDZBblFLckFYbE1lQlJHQlJSRHFs?=
 =?utf-8?B?a0N4RExDQnhPVEVXNmNOb2NXYUpsYkM2S1ZXRnZlMVpOb3A5TjUzc2xBNXJj?=
 =?utf-8?B?cEVFVVc2ajhaVXJsL0c4SHB0VXRlL0FFa2JRZUFzUFNNQnlsckFNNVFoMVQx?=
 =?utf-8?B?S1R1REFiT3pUMGtUNWZNZjRrZjU0VGhiQ0swbTJkY3VrUGZVQzUwcE1zQ2lJ?=
 =?utf-8?B?eUMxeDlLVzhETW4wZEU0SmlFMDBRWFhsSVBpNWdjc3drRW9nYXVxK1hwY0Nu?=
 =?utf-8?B?N0J3bnhxUk5JdVE4SityUGQzb3F6TVM2WEhiODZEc2NiTVNUMjcvZERXY1hx?=
 =?utf-8?B?Z29sSlZ5YUU4bStCemVSakNDbmxXdGpJSVdId3ZJbWg1WVNqM2w3eWlsN2pD?=
 =?utf-8?B?bWxiVFNjMmh2S1BOVXFDMThJcjl1bnRTaE5NZVZndmw2MGZNVExNQ09xOHF2?=
 =?utf-8?B?NWdsdDhHNnJGT3M2QTRMLzF1UzRGM3N1K29IbXlQYm10NnZpRmJPRC90eXdm?=
 =?utf-8?B?RnBWTWJlL2JsMkJPdmxvY0ptSTJjMEE5b0NrWnZUTEdocEhTNUVlOWh5U2kr?=
 =?utf-8?B?Z3JnT1VzK3kydHpRRERxZ3M4QW4xN3FQeUR0bU8wa3dBYUxFSDgwZFFISGlN?=
 =?utf-8?B?WjVBLzNTd3krT3l6ZzExaThsVW5XcTJjYlVhNnZhNDFaZUFqVkpxZUk5V1M5?=
 =?utf-8?B?NUpNTnpZaGoxbjNHbVNjL2V3dkRwQW82VVlZeCtiWU4zZ1lUNTI0RXdvay9D?=
 =?utf-8?B?WkpGN1BCZkhPbkwzczRkekIrcEFnamkvU0lWaXJ4Uk1zd2EwYmVNMlMrMTE1?=
 =?utf-8?B?WGh6NS91OThJaklaVDkyQTRad1oxQkpUbnJUVWZLN2xWNGZzMkpTK2xvOVdP?=
 =?utf-8?B?c052ODk0bFBueDJ1emo1YUlySXd2UmNvN1IxSS9BYVBqM1JmU20xaytCVVlD?=
 =?utf-8?B?V0N0WEpiWTN0cnZzN0QwUFM1NmJGQjVKTHFHRUlTWmZUM1BXcEs3OXlBclpr?=
 =?utf-8?B?d3g1Z3kwMGJOclZqSlR0b0tFektPUE5PSkRnQzk4MklsdCtiU0cvbk9Kc3dX?=
 =?utf-8?B?TUcrTVhkc3FmOG54eDlCdkZwY1UvelBYc1pVeUtibVJsSmtGdEZMd0RGME0x?=
 =?utf-8?B?N2hlMnBHenAwNzd6MVhUL2FZRmRlU3BqSHFKQXFWMmhBbW5qYUVNTVA3cXlo?=
 =?utf-8?B?UGlSMlhFQ3Fyd21MZFZiREM3SC9vdndEYjUxLzRkMXlDczJXeHNFZnhiQ2Vo?=
 =?utf-8?B?bENTdERRTDdWUnl6UUVPcm1BVVRiMXhpNUpoaWdjSGc3eWpnRlA5NkR6WS9q?=
 =?utf-8?B?TzB4dXV5VUE2YnZRV3ZINHg0TDgwRmN2UXdZTlVEMkRCd2l5eVcrWTF1UDFn?=
 =?utf-8?B?OXVaUGt1R3VyMDNDK2NuL3FaUitKU0FIRmppaHUxeHZjUXlmd2NLcUtSK2w3?=
 =?utf-8?B?V2w3Q0dHYU9GYnQ0dXdZdXFhQlhFKzBSSzlPRDcvNjBIK010ajdlTThCT1RD?=
 =?utf-8?B?Rm5wS0p1S0p6ZWFwZVdKaVhhSTNZbWMvd1Y5YzNVUnc5aUJ2bEZlTDJWSmhs?=
 =?utf-8?B?ZlN4VDltZUFrSitTS08rSXdjandlOHJhYWpkSFJZdFVkdEhZZVI5dTFFaFpI?=
 =?utf-8?B?S2VLUmdrdmIxTGhFVUZrSkxRdEJaSmphOUFqdFE5YVJTanNLUkduSTBwamdQ?=
 =?utf-8?B?U2pBOUtUU3NpTjd5Tm84RnE4NTAweXozTnJDaXhlcFBUTTExSTROM1R1SVJL?=
 =?utf-8?B?UTIzSXBCb2dZUzQ3WnhvVzRsK3RkRDlERmZJYjJwMk5BTWdNVGpVNW00NzVV?=
 =?utf-8?B?MzhUQW9pdmp2QnRIeks3MG1QWTA2QjdkN1VZM0FCNzl6dkZTNEpVWUIxZnZ0?=
 =?utf-8?B?LzNlOXRKelRicmQyeXlJdzFIcm1iR1FUSm4vaWx5K01uRUpwYjlWWGpVTXkx?=
 =?utf-8?B?bXRKN0o5MkNwVGZwSVEzcGxaVVRTTU45N3p5eXFLSnhtZmY2Qk5yakswTHMz?=
 =?utf-8?B?eHZMd0g0Rnh4b1F1UFFncEtZK2xvTEpHUDhBTEx6WFB5UGs2SWNmUC9sTlZi?=
 =?utf-8?Q?nI7o6xYSyXPMxC4SVhlEGlo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c109a11-bad5-4c77-0b26-08dd7ba29b91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 22:20:48.2762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJ0BW9vvJx+vBA0N8IJtPwvgRiRmXQ88pl51JBptpjPzBrDwDBbU6IDlIPIUzecfaYW5DLuHDfY1uD7hMA1jfCrFW06zYh+pp7TpCyWmqtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
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

On Tue, Apr 08, 2025 at 11:12:05AM -0700, Ashutosh Dixit wrote:
>check_reports() is only used for checking reports for mmap OA buffer use
>case. Rename the function to the more specific name mmap_check_reports() to
>make the purpose of the function clearer and the function easier to find.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 67acc74b32..a20120881a 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4246,8 +4246,8 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
> 	}
> }
>
>-static void check_reports(void *oa_vaddr, uint32_t oa_size,
>-			  const struct drm_xe_engine_class_instance *hwe)
>+static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
>+			       const struct drm_xe_engine_class_instance *hwe)
> {
> 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
> 	uint64_t fmt = test_set->perf_oa_format;
>@@ -4279,7 +4279,7 @@ static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_in
> 	vaddr = map_oa_buffer(&size);
>
> 	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
>-	check_reports(vaddr, size, hwe);
>+	mmap_check_reports(vaddr, size, hwe);
>
> 	munmap(vaddr, size);
> }
>@@ -4308,7 +4308,7 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
> 	vaddr = map_oa_buffer(&size);
>
> 	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
>-	check_reports(vaddr, size, hwe);
>+	mmap_check_reports(vaddr, size, hwe);
>
> 	munmap(vaddr, size);
> 	__perf_close(stream_fd);
>-- 
>2.48.1
>

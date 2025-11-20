Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0A7CF64BA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 05:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6137810E16E;
	Thu, 20 Nov 2025 05:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EThaKqu6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7810E16E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 05:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763615942; x=1795151942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ma79NMbqwK/XRJNknu00StCz7Uc8U5W4kV+5+f1bobU=;
 b=EThaKqu6RMYTTaBaFRo7J77avUb05lpq30DW/34jMPn+S6kZFvLNUsBF
 blxWBe3w1oDFpTHJ3lPTbdEocCdg1ef3/cHDYLkyQvCLWCWuVed4MHxzf
 oLGJCEzmRAJJJrTsRoRcZD4J/CG4Cj4fU+QuEUhvviv3xZ77jIMSRYm27
 XedJRLktab4YngF7CiM52AUWoM5USFaESpuTXUuwwCicFZlkNxl5X7zHe
 c3ctLhTy3BFlJyhpZe7lHeOBdxU7MvWHQogjdrDhrrfcU7UrCgY12qiT5
 IDQUVy5F0gctnhHFW2+dPDBlN12jxDzkpfIJBJO5emSlyMvjCaH7Igdt1 Q==;
X-CSE-ConnectionGUID: p30hWMZRQ1WGlHeGF+0QXg==
X-CSE-MsgGUID: 4ZQkwW6GQqCoL/hn/KcX5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76000889"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="76000889"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 21:19:00 -0800
X-CSE-ConnectionGUID: 5kToUkLWTtG6L3NfjjBIUA==
X-CSE-MsgGUID: 9tLVfsmLQ4CEJt/lfhwXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="196223571"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 21:19:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 21:18:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 21:18:59 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 21:19:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nryDRH6BDjXCzVbL2lN1vaIIy/2egDR9LJ0SOMwc7cmJPC95EZ7FsKR0BQ7ZjTykZENomWuPPiAvTlalGagxDz6H9QfakoMzLM4s3arwYX6ujEuaBg90Lafz5XSYI0VLkXLAIKpmkxdgFxSA4q3c0C/yr414TZeUrwHDw/iReX2LktDdOXR2Owb2kkK1wwGfftmWuACydUkv7ljpX4I/nsBgVfVGZOyOqu+IJEDkFecxu+QX7lIeE+G3OuJPqCXeH9/MEq+ntDZ2l5XnD+OXtyaN3Kjmke3uz9AUZK778XOYzv8DSG9eO7q3YxNGewlSJHicMDMjqFmubDJAml4+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ma79NMbqwK/XRJNknu00StCz7Uc8U5W4kV+5+f1bobU=;
 b=wbx8vMmqIqLt76YTSa4tsnZyGIoTZiHTP+tdAYOL+J1Ujbd89dR51oEHOAcppbADesv/dD3n0tUSgJbDidVcaDJafMeZOOR/YuI+3prjGP0blIzq/aMvL0s6KcrSIJZXETV9FN8tdxqmMgHbT0f8guGp7Ca6ttI7m8bpgaAwNVECRaMjGBydN7dg57HFFR0+y+bPRMat0lBnx2m7TyIXj5QuG2QI3NhdcDh5vCpYW1ApSHNLO/Qem4Q0U+9GbJpRWmpkZS6Ed5elgYlDxcxWj3BIS4lnwCTk1MVZOblAfS8CUV1UsyDJKKj4/5pbTuowE6/RiuNclbxEAfWNX9W0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 05:18:57 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 05:18:56 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 07/18] tests/xe_exec_multi_queue: Add multiple placement
 test
Thread-Topic: [PATCH 07/18] tests/xe_exec_multi_queue: Add multiple placement
 test
Thread-Index: AQHcSpYQuC3ujvWHp02LuICbhOykSbTvZYMAgAu+5vA=
Date: Thu, 20 Nov 2025 05:18:56 +0000
Message-ID: <CH3PR11MB8434710EF04A9B8FECF075BA8DD4A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-8-niranjana.vishwanathapura@intel.com>
 <20251112175408.5v5262kluhmnxbue@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251112175408.5v5262kluhmnxbue@kamilkon-DESK.igk.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MN2PR11MB4551:EE_
x-ms-office365-filtering-correlation-id: e563c3c9-198c-4463-5da4-08de27f44e16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZWY5VkdFam9LTXd3d3Urb0FHcE5qQVlKR1pyaHNpN1YraUNYcjJ5MzAweWRr?=
 =?utf-8?B?QnM0UFV6bWc5dnJZTGlTVWF2OE8wRHEwelUrZ1pXYUhTOEdueHZYcE9LdTdW?=
 =?utf-8?B?cmxNOVZVWm5BYmtsblJYeDVrUmpRZXlISTVHcVA0Z3FYdkgyaTFIeUcwNTl5?=
 =?utf-8?B?aDQzZkJKNGhDNE1BcEwvTzdpR1dFcGhxdGxWMG8vOUVaVW1iUVQ1VlNBR0tG?=
 =?utf-8?B?QXlxQ2tCRHBTQ1Y2c2Y1dVhrZ3l1M0ZmSkRxT280UkxOS1FrVllmWGtmZ1Y2?=
 =?utf-8?B?YnJJQ3FmRW56RzdocTU5VXFhdnVhbEZmRWN4UGw2a1lZWk5teU5wVzE2TFZq?=
 =?utf-8?B?a1FHVEtjNDlmK0lUTEZ6R1VQWEhYNTdyZk8zWDVNVHdkNElqTFU4dmNLb3JC?=
 =?utf-8?B?QnhHTDNieUFIbzlYckJoK1J4VGVJUllQSlp1WDM5VCtiZ0tFR3RYeTY4WDRD?=
 =?utf-8?B?VDZPT1UrNmhXVEhYYXF5dHlVNklUSENqaHFPbXZtU25RRjVHS0NkWFlaTmxM?=
 =?utf-8?B?blRzR1dQVlROYkNuNkwySVcvWFJ3WWNVaThTaE1NTzNmQ3VrSzFZSnkrYzBN?=
 =?utf-8?B?L3Zsa3h2WGxycFJwUVlqV2hWZjlycnF3a3Fqb0RHZE1DZFdJbTNZbHQ0SVJq?=
 =?utf-8?B?MUJkeWlFaWxYV3ZYQUR5UkFDT1VkTU5mejJScmVmNWxXaVpjUmsrYXdhNVd3?=
 =?utf-8?B?VkFkWnRpNjdpeFVsRHhVY0dLSWFsWER6K3NrVmE4ZjE3aG9ZU3BrTHV1c0Fj?=
 =?utf-8?B?VVovNWtkakFwVWZjamZoeU5sSjhERVBBSWVXNGN0K2Q0T3IyZC9QakVYMms5?=
 =?utf-8?B?bCtDRzRCczFzRzhPNXd5ckxwR3NGcldXS2Jrb0FaejRUV2MzaWZ5dnhvNC9s?=
 =?utf-8?B?R0lxZUtCK0NaN2FEbFR4SjUyZ1N3aHE4ZFNnUUM2cDVodlJQbG1odXJnazc5?=
 =?utf-8?B?Y3hUUWszazdNcVpMV3BYMU5ZazEvR09XbXMyWGhGTldMU21JYnVkVkNTUDFE?=
 =?utf-8?B?M2ZtZS9DVWRBY050T2UwNWVXOXE3Y2RBZnVZbWFMeTNnK1E0eE14eU01enJ3?=
 =?utf-8?B?NUg4czBJZ0NSOXhOQ0k2RFVYeEo1b0FLWFloUldSdkVMaFNISzluMGkvb2wy?=
 =?utf-8?B?a3FUZ016K1Y0ZzFHVklBYkV2QWpQMll3RytwZEkvemZMQ0hVc01aWm82KzFI?=
 =?utf-8?B?T2p3TWVhNDYzdFgxQUVWZVBBQUowSEtqZWs4RnJDR3lvRGo2WVI1U1hBVXhS?=
 =?utf-8?B?QlpGM09ZUFIvK1VyMDF0elZyM2JDdVMxR0tSZkc2V3dGeVQzWlBaR2owc05h?=
 =?utf-8?B?VUIvTmR6OVVIamZMd1ZubDN6WDdUS3pXSlZtWXRpTndBanBCOE1JMDUrY0d4?=
 =?utf-8?B?UTN6ZFlMdVpzcnpONDdMZTE4WlhrdWFTYnFjRFdEam1LSjc0SXZTOFEzcVR3?=
 =?utf-8?B?SGV1RE01Q1RobWpMcktXODlTOXd4YVJYYmpqanlkZExaSVc3UmR0TGZWMG5r?=
 =?utf-8?B?ODIyZW9ZTlp5SlczZWh1VkV5RjUyNkUwZlhhK2xvTXovS012Tk5RWGRWL3Bl?=
 =?utf-8?B?djdDelF6R2tjeWxnUVhvemh4dmdxTVlOUlBYc0Zkb25EQ293STJwWlBUT2Vy?=
 =?utf-8?B?ZGFwNTVUR0pzUlovQVZuVXAvTTd4UVVpRWZmbXFrVkdoTXNIcE5ZdGtKaHVn?=
 =?utf-8?B?MEYzWUxMODdNN2xxV3pBSUZDME5JbDNlby9RRjdOY0N0RjhhYjMxSkhwUHRp?=
 =?utf-8?B?amxkaGtEZTRBUUFHVGwrdE9UNzZwVVpNWWNsTzF5Vmw0MjNpSU1yQ2t4aFlS?=
 =?utf-8?B?U1VhWEtmOW8zSDRwa0NIOU5FMXVmUERsNVRSRHZLa0hCTzMyYmR0QVh1VDVm?=
 =?utf-8?B?ZjNndEdoeUxqSDBPNzU2RWhSL2tjWjZBb1RsajdhUHppTENnZDFpWHRTTFhu?=
 =?utf-8?B?QzNqb054UGdqc2l6QWVFS1dEdktBZ0tMSEM1Y1V6RkVZMGxqbmJScnhUMGdK?=
 =?utf-8?B?SWtQTzdnWm1RTlRSZ2hEUHR4bnhIWWNhNmY2ZFp0V2p3ZUQxS1dwRFhaUVdo?=
 =?utf-8?Q?S3DYtY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUsvenRkbWJkV2lBQkNFM3lJY3RwMUlTdEZqcDB2Yml5QklQZE5rOVJzV0pZ?=
 =?utf-8?B?cWd3TmYrYSs2WERxWHFlY2kxR3JuMkJSdGZzdWJxSXgyT3VRaHAyMGhKMUl2?=
 =?utf-8?B?RFNZcHpiZzZsSmd0c011WVNSMFBtWS9wVTJqcElrWEs3ZlRQUkhoMGVxNmlE?=
 =?utf-8?B?aHA5dTVhbXQ1eGMvL3VBK2hzaktsaTNwTTY0d2Rrb05mVDVSeGtQbUFYaHRV?=
 =?utf-8?B?UFhqeCtXZmJ5KzJtbVJBNzlqOVBEOEF6aGltU0F3Nk0vQTBHQURMcjVOOWNS?=
 =?utf-8?B?Qko4SWhMSE13ZHJYelNtQVJJbEZrWWFrb0ROVXFXdk1rRThKNHVObWh6OFFD?=
 =?utf-8?B?TkZvOG4rZU5QeWlMN1dGeGtjNVNDVkxxYWJjMXhlLzRoTXRWUnBYaG1IV1ZY?=
 =?utf-8?B?a1k1aEtyL0xraXFrRkpMZ01DeGd3bzlHbXdqSmY1YzJRNlBhd3NsVnEyc3Rq?=
 =?utf-8?B?ZFQ4YU5OWW9qTkovYldQWkZ1L29PZGlsK2pCZDd6TzFPRXZpNE1mU0FPZkhY?=
 =?utf-8?B?UlM1ZitRdVdtc2QvK3VZVVQyRjFKT3Uyck9XcUQ1aXUwcWtENGpHRmd1K3ls?=
 =?utf-8?B?SEFTaXhjbXFkRWlHRUNQWGFFUWRGMCtHaWREbmxWaUxLa0hReW43UFdCZmZJ?=
 =?utf-8?B?TWNtME1WZVU1U0dDbHZaL2JEVUJhcTBiSk1nL1VtQzNKU2JhSVVzRCttUTIr?=
 =?utf-8?B?cUZPVkVteG1WeVhqanRkd3pPZC9QU21WRHMrb216RlZlS0RjOUFkV25DVFVV?=
 =?utf-8?B?QmpYb1NXbjRvWmhBVDNQQVJwNFEvY3V2WUgxdURuU3czNVlENmdQMTJveGpK?=
 =?utf-8?B?Lzhrbm0vbFd2azZjZXBtNkhXcFBiczhlQ2lOTm9BRFhRUElJellBRWpSTXhp?=
 =?utf-8?B?MmhEc3lkSFVqZGFJZSt2TnJUbEdWYTJ3d084LzZiS25ZZk5NSDN0V1NFRnRH?=
 =?utf-8?B?aGtBWklqSVF0ZkJ3NWNWbVNMelM0a2piUmcxY01vdEV4RElVTFJ4dlV2c0Z0?=
 =?utf-8?B?SWlMeC9ONXJmYWxrT3R6R1ArQW5TdUw2S3FKT0xTblAwMjFFcmJYRXpycWpr?=
 =?utf-8?B?V2U2VmxJbGtJWEJ4Mkd1L3VPUG5oRWZjUlZSMGo3ZjFZUVY2empKL29jZnBE?=
 =?utf-8?B?OGNoNno4dDFELzU1MzlKditwclJKS2d0Wk9PdkRjTU9BT2NaTi9jaUgzaDNI?=
 =?utf-8?B?U2FVZFVWQ1k5b0ZOZFZiSFo3OCt2S3lVUG1EUGFncS9vSnFLTmZsMlBsTGZL?=
 =?utf-8?B?cmUxMFh4TEwwam91cDRDUTV1N0ZSU29uOFlERmZDa3FicWZJTWJ6NVhwTEVE?=
 =?utf-8?B?SkUwMTlDTDBhSVlkUFNmNGEvVzJvOG53OU8vOWowOHpBWGc1NTgveENBc2s3?=
 =?utf-8?B?bzNyekFHL2lCaFkxRGZiaHE2ekpGVXZNa1lkVE03TkpNeTBqbzFUbCsyc2pP?=
 =?utf-8?B?VytIM0dTYnlkRVV1MVVFaTBvVUVQK0txYzliSWRXdDloaldjV2pralJTMlZ4?=
 =?utf-8?B?YUlCZGd2ZmcrOUFMZ29xeWpXQmhxK3FUL3JHQzlza3ByRDlHQk95Mmh3eE5F?=
 =?utf-8?B?ZCt3cUtYbG02RTR1SElLNGtuVzNoYTFER2lQVTgyZGRyV3J5amhRL2Q1eUhP?=
 =?utf-8?B?WGhUSi9kZUQ2akRIWThHUElaTnVNbWhpZnJsUWprdTVUWWNuUHV2U3doVVRz?=
 =?utf-8?B?VncraUxibCs4VEVFU3FXdVNNT0FlT0pzKzltSTNGa011OHJCVHhTSHNyQkcy?=
 =?utf-8?B?Ymg3VzhCVlZFODRoT2ZLTVkydlA2ZjBLdmp6VGY0OXo1Ti9WSUtjYnZGaE9z?=
 =?utf-8?B?QVFXNzRjMGJwbHJqeW9LbmI1VnZDNGROU0dPZ0lkeWtHOHNKNyt6YzVKZnlv?=
 =?utf-8?B?L3BMeVkxakJPR0ZRWUl4ZldxeGJtcWcvbmlMdzI1cmNkQkdUZkNvb1hpbnJE?=
 =?utf-8?B?UHlNZHg4MHo0NXc3YlNTTjdRNzl5SjI4RjFUMDZ6elRuRElZUFowbTQyWEta?=
 =?utf-8?B?c1F3UTVlVlFkaFIyYkJIUytYU3JNMWp1dTdQdTQrVGdQM2c5enFvcWtTWjhi?=
 =?utf-8?B?TERxbFM5R0ZXSHlNcndDRlpld0dENjBaalpKTHg4SCsrSWpQQTdRNDdGOUxJ?=
 =?utf-8?B?ZmVkSGRHMlc3NFhvaTcwNmVBUlQzOTZiY0owSVZZakdkeERKUUJMRmpETkYw?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e563c3c9-198c-4463-5da4-08de27f44e16
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 05:18:56.8525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iouw73wtlpJ67uS24q43BbTiuh3AWWOtLkpSeVpe/rTHCo7iDcZC6siuR5/MQZ4bVkgTgp+env8hI+Ae25xq0Y50tgg2CSyAOS3K8zV/eaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEthbWlsDQo+IEtv
bmllY3pueQ0KPiBTZW50OiAxMiBOb3ZlbWJlciAyMDI1IDExOjI0IFBNDQo+IFRvOiBWaXNod2Fu
YXRoYXB1cmEsIE5pcmFuamFuYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+
DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDA3LzE4XSB0ZXN0cy94ZV9leGVjX211bHRpX3F1ZXVlOiBBZGQgbXVsdGlwbGUNCj4gcGxh
Y2VtZW50IHRlc3QNCj4gDQo+IEhpIE5pcmFuamFuYSwNCj4gT24gMjAyNS0xMC0zMSBhdCAxMToz
NTo0NCAtMDcwMCwgTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToNCj4gPiBWYWxpZGF0
ZSB1c2luZyB2aXJ0dWFsIGV4ZWMgcXVldWVzIHdpdGggbXVsdGlwbGUgcGxhY2VtZW50cy4NCj4g
DQo+IFBsZWFzZSBhZGQgJ2ludGVsLycgcHJlZml4IGFmdGVyICd0ZXN0cy8nLCBzbyBzdWJqZWN0
IHdpbGwgYmU6DQo+IA0KPiBbUEFUQ0ggMDcvMThdIHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlf
cXVldWU6IEFkZCBtdWx0aXBsZSBwbGFjZW1lbnQgdGVzdA0KPiANCj4gQWxzbyBkbyBpdCBpbiBh
bGwgb3RoZXIgJ3Rlc3RzL3hlXy4uLicgcGF0Y2hlcy4NCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWls
DQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYQ0K
PiA+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
dGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jIHwgMzANCj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jDQo+
ID4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMNCj4gPiBpbmRleCBjOWZmMjVm
ZmMuLmViNDBlOTJkMiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRp
X3F1ZXVlLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMNCj4g
PiBAQCAtMzc5LDYgKzM3OSwzMSBAQCB0ZXN0X2V4ZWMoaW50IGZkLCBzdHJ1Y3QNCj4gZHJtX3hl
X2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLCBpbnQgbnVtX3BsYWNlbWVudCwNCj4gPiAgCXRl
c3RfbGVnYWN5X21vZGUoZmQsIGVjaSwgbnVtX3BsYWNlbWVudCwgbl9leGVjX3F1ZXVlcywgbl9l
eGVjcywNCj4gPiBmbGFncyk7ICB9DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIFNVQlRFU1Q6IHZp
cnR1YWwNCj4gPiArICogRGVzY3JpcHRpb246IFZhbGlkYXRlIHZpcnR1YWwgcXVldWVzIHdpdGgg
bXVsdGlwbGUgcGxhY2VtZW50cw0KPiA+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5
IHRlc3QNCj4gPiArICovDQo+ID4gK3N0YXRpYyB2b2lkDQo+ID4gK3Rlc3RfZXhlY192aXJ0dWFs
KGludCBmZCwgaW50IGd0LCBpbnQgY2xhc3MpIHsNCj4gPiArCXN0cnVjdCBkcm1feGVfZW5naW5l
X2NsYXNzX2luc3RhbmNlIGVjaVtNQVhfSU5TVEFOQ0VdOw0KPiA+ICsJc3RydWN0IGRybV94ZV9l
bmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZTsNCj4gPiArCWludCBuID0gMDsNCj4gPiArDQo+ID4g
Kwl4ZV9mb3JfZWFjaF9lbmdpbmUoZmQsIGh3ZSkgew0KPiA+ICsJCWlmIChod2UtPmVuZ2luZV9j
bGFzcyAhPSBjbGFzcyB8fCBod2UtPmd0X2lkICE9IGd0KQ0KPiA+ICsJCQljb250aW51ZTsNCj4g
PiArDQo+ID4gKwkJZWNpW24rK10gPSAqaHdlOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlmIChu
IDwgMikNCj4gPiArCQlyZXR1cm47DQpJZiBuIDwgMiwgdGVzdCB3aWxsIHBhc3Mgc3VjY2Vzc2Z1
bGx5IHdpdGhvdXQgcnVubmluZyBmb3IgdmlydHVhbCBxdWV1ZXMgd2l0aCBtdWx0aXBsZSBwbGFj
ZW1lbnRzDQpXaGljaCBpcyBub3QgZXhwZWN0ZWQsIHdoZW4gY29uZGl0aW9uIGlzIG5vdCBtZXQg
dGVzdCBzaG91bGQgc2tpcCB3aXRoIHJlYXNvbiBzb21ldGhpbmcgbGlrZSBpZ3Rfc2tpcF9vbl9m
KG4gPCAyLCAiU2tpcHBpbmcgdGVzdCBhcyBudW1iZXIgb2YgcXVldWVzIGlzIGxlc3MgdG8gdmFs
aWRhdGUuXG4iKTsNCj4gPiArDQo+ID4gKwl0ZXN0X2V4ZWMoZmQsIGVjaSwgbiwgbiwgbiwgMCk7
DQo+ID4gK30NCj4gPiArDQo+ID4gIGlndF9tYWluDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBkcm1f
eGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2U7IEBAIC00MDQsNiArNDI5LDExIEBADQo+ID4g
aWd0X21haW4NCj4gPiAgCQkJeGVfZm9yX2VhY2hfbXVsdGlfcXVldWVfZW5naW5lX2NsYXNzKGNs
YXNzKQ0KPiA+ICAJCQkJdGVzdF9zYW5pdHkoZmQsIGd0LCBjbGFzcyk7DQo+ID4NCj4gPiArCWln
dF9zdWJ0ZXN0X2YoInZpcnR1YWwiKQ0KPiA+ICsJCXhlX2Zvcl9lYWNoX2d0KGZkLCBndCkNCj4g
PiArCQkJeGVfZm9yX2VhY2hfbXVsdGlfcXVldWVfZW5naW5lX2NsYXNzKGNsYXNzKQ0KPiA+ICsJ
CQkJdGVzdF9leGVjX3ZpcnR1YWwoZmQsIGd0LCBjbGFzcyk7DQo+ID4gKw0KPiA+ICAJZm9yIChj
b25zdCBzdHJ1Y3Qgc2VjdGlvbiAqcyA9IHNlY3Rpb25zOyBzLT5uYW1lOyBzKyspIHsNCj4gPiAg
CQlpZ3Rfc3VidGVzdF9mKCJvbmUtcXVldWUtJXMiLCBzLT5uYW1lKQ0KPiA+ICAJCQl4ZV9mb3Jf
ZWFjaF9tdWx0aV9xdWV1ZV9lbmdpbmUoZmQsIGh3ZSkNCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+
DQo=

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFB4C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 10:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4124B10E083;
	Thu, 22 Jan 2026 10:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FL05fCt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E06410E083
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769077321; x=1800613321;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PE+b0e0SBJYPH8eObDIGzKCH9ENJQzslntIK2Pte7Lg=;
 b=FL05fCt/y42aX6O7vYHwT/SrMDRMdiizQwfmzPRyY+pwgqYaJo9TLzkc
 2X0NLXw3Plmkxn4Xv20Nfe68jzFZLq+Us+y3tVR0juvpZTk68k3NQdFTs
 qoPnFtcEcZtSD6NzMGU16KCa/KgEpqbn8xAhLcMW2grVztYPIT1thwSuF
 cKAi1PAQJXEuu7UBFZSl5DqszCJTyRs0CEZK+/lvwRmvr+H7Y2jVUNQ+z
 bFP7vPxqWxMT0TpKOIXGoGfLg05cy5bASUGlAzssVhBhmtzGfaBt1gZrz
 aH3FHcfZKMxqQQvW5KAJ5SRNE3jM9K6yMMcuhRmWq9Taa2P2YXweVB4sR g==;
X-CSE-ConnectionGUID: 0GojRPnSS3q+nOmNB9sfVw==
X-CSE-MsgGUID: t/uzv61sS+Wp1T33XSXbWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="72908116"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="72908116"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:22:01 -0800
X-CSE-ConnectionGUID: T8rPbltjTjKNff5r3qjQXQ==
X-CSE-MsgGUID: JuKR1bAqQNidoaP2Qs5mkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211143977"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:22:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 02:22:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 02:22:00 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 02:22:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InwJouf1OGZNgGDQ/KnwDoaiTKMYIVSCH1hURVK4Tb6Ys6e6KS1lOfl43viKEUFfNWFHsOAoC+/cV4N2dwp4MDzvKa2DszBy4An1gV2n3RQE9fgKYUPbHusGxz+53g0seuO8rA90Qmn0ar8R/2HJhYUMGBqssbeevopYadUbkMhCPPNyDAFhh/CNWyeaDOlysGc7abZBc5MAFw7hLw/PSQoTdKUbQch98CEYoLU4NFBb4Iye0Ip0iGKImPTb+tDV2ibbSV4KA1skBFM3WZwK2O3UMp5/BMul2FzfNnR/v+lYSY2RprnSRvah0gc7Wsgi6mDWQYwC9w+qKVxcUrclyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE+b0e0SBJYPH8eObDIGzKCH9ENJQzslntIK2Pte7Lg=;
 b=OLZr35dosMmUlxn8wyN+LAS+4hecbQMFihpPmHFaKX8DAdU7c8CbzkKJHvdoq/QckWYGfciykH4M+fEC7LdUMFumb792+ciY0xGbV+S3I8tnLPPsPS8lBfzQyExaHHZXQX9NJP12UpTqps6DO9rOMWQqmmPdkTuMMN3z2HqJ5wGY8K0CBC1hEdSJ2+XhidyTpJPBc1dasucG+PeeS9WecAuk8/cT2d+ONaHQ7BQY+AQkwhAJEkUMDjXOMe0Rc/auX1lNTXwEi3n8zA4dIHbBh6geR3yMswYFLSet+7NGncMxcXXpyi+ShNyY2DVW1xArSEONH9xb0Ql1iqkJW5KsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 10:21:53 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 10:21:52 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_module_load: Add driver unload
 before force-probe
Thread-Topic: [PATCH i-g-t] tests/intel/xe_module_load: Add driver unload
 before force-probe
Thread-Index: AQHcipFykJqhE2PLRke5t+xCVBmxA7Vc/IWAgAD5O2CAAAYr4A==
Date: Thu, 22 Jan 2026 10:21:52 +0000
Message-ID: <MW4PR11MB7151974A53E8CF4A7C8A097FE497A@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20260121045003.116426-1-nishit.sharma@intel.com>
 <74599fd049cb837f788d038123225f5a581eb9f8.camel@intel.com>
 <MW4PR11MB71513157E160F8F55611B3DBE497A@MW4PR11MB7151.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB71513157E160F8F55611B3DBE497A@MW4PR11MB7151.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|MN2PR11MB4711:EE_
x-ms-office365-filtering-correlation-id: 8a9bfbbb-4d3d-4b0d-4691-08de59a00fe5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Z24rT2gvL0FzbUZreTkrbU52RnpibEdBSlVaa3ZjQVdtSW1XYVlpNXd4NXRW?=
 =?utf-8?B?cnBoaDg2T3dROHQ2amNUR3ptZ3lINDhvOG5TTkIyem8xVDZ6dSs3YURzQURZ?=
 =?utf-8?B?Qkt1NVd4Q08zNUt2UkppL1J0eCtCeVJVd3czTkJHRFBGL1luN0xiS2hDOTgv?=
 =?utf-8?B?VHc0OUZjTnlHZWxyRnk1SFpzdW9zQkhwampBR3NOS0c2Tjc0RncxTUJsYWtO?=
 =?utf-8?B?ZmVGN28zU0VEMkRsR1MveENQOVplYzNCMiswVkhPUW5keHJwM0dhcU45SlNh?=
 =?utf-8?B?M215cVVTNmNHZlVTMVJWZ1JaZmlFVURlSGIrb2Y3QldUQUo1dFBLOXZQL2c0?=
 =?utf-8?B?MWFqR2hLZGE3b3RQeXZIQllTMHVmVWRBaStrQkVwbVlpRVRQVTZoaEdmSzRy?=
 =?utf-8?B?QzJWYWFaeUc5RENJYndidzF3cGIxU2NjcnhKSjFyOUttWmRpcTNsZVA0LzU5?=
 =?utf-8?B?bXRrOVBvdWhGU245Ni8weExtbWVxLytyUkRWc3l4QlEwNjgzUWFFcXlmR3Fl?=
 =?utf-8?B?dUFLdzBJcTVCUHhPeFVNUURoVDU2VGVwd1M4QTQ3SkhtdVhoUWVGU3UyLytX?=
 =?utf-8?B?akVvajgxUGFYNDh5S3lNWXh0MTFjK2JkUzkrUFVpa2ZmVmtDTnQ4TVo1ZUZX?=
 =?utf-8?B?UFRpYWE3OFBJTFFxOFFYTmNmemZBZHJ3VWxPcW5DMVFvaGVuSlhPM0xyV0NI?=
 =?utf-8?B?L1NtUHlqZWV4azN2WWMvb1M4U01tZWJZV2F0OGNWTUx1YnVEazl6UDhCaDd1?=
 =?utf-8?B?dDhqcmltc2xVaGpRa3VEa2NBMlRpS2dlQXpIdHAzVVNHQ3BDMnpJWHNxd2tP?=
 =?utf-8?B?WXRhWXltQXhxeEFNM2wrcGRVMDBvcEJPMGNwUG4xd0EycXFTMGt3Zmw3elcw?=
 =?utf-8?B?QzB1UWEzeGVlTEF4WFEvQ3U0ZHdkbmhjR29paXZMaUtWUk5qNGI2SzExbWl2?=
 =?utf-8?B?ZFpSdEl1YmN6SWJXakpVYUdtbVdRUVljSjVLWkRBelpRNndnakVnY0V1OUdh?=
 =?utf-8?B?bXozbDFBN3p5ZU1TemRGbVEyaXliZHBpZkJjUGMvWGZVQmw2Qm5Ra1pTNlNy?=
 =?utf-8?B?cndhVnJpZkZzdmZ2TXRqS2tRTFBnR1QvemdqcHJoc2U1WHd4dGNZM1BsQWZr?=
 =?utf-8?B?bDRUaVlFbkNGQmJ1QkJkeWtUS281OFBydHFUVzRSZ0dEb3l1T2l3c1ZFeEFY?=
 =?utf-8?B?Q1NZN0p3ZmYrT1hqQmt1dEJIVC90QXRVcW40UFpGKzkvNVVHeUJzbzVwRCta?=
 =?utf-8?B?QlpoWW12Qkp5Qy9aNVRDckRCK1V5RTJURjZFSE96L1I4NVlqUjZtUFk0SlVx?=
 =?utf-8?B?UUp5R0VWT1NpdnpIM0VaQ0ltYjNuaU9vYmVYNCtKRnp1YUxMUytHbXhLVk9w?=
 =?utf-8?B?V3VrSHJaSlNRZDg4VjZCMWZtM3czTFhTMzBINkRDRDZVZ1hVeDBJZGM1MmpI?=
 =?utf-8?B?aW5vdXRuenNCRktPb2lnMTluckE5elJ4V0drR1crcC9CTFZsRzhnN2NJTW1X?=
 =?utf-8?B?blRCaFE3NUg5citoTUpRdWtLUlU5K2ZMNXhmeGdNbTRMdjBGWW9FUHM3ZTRZ?=
 =?utf-8?B?M1RUM3JkSllkSHR3RzZyQ0xFYlc5K1ViOWIvdXM2Zzlzc2VWazVoTmNycFcr?=
 =?utf-8?B?cml2c3RzNldiTmpVdC9NR2NSTDU4NUJWMHpCZk5qUmJ6YWtzZDQyZ04vODh4?=
 =?utf-8?B?M0IxNEpLajlYN2txdEg4cWFKZTRLOHRUSlZ4ZllmNnJoeVltcEEwdHpQTHpq?=
 =?utf-8?B?VzYyaktwRTdYZFdRU0FQRzRRbmEvazdLQ2lWYVphV1R6Q1hLa2JmWkwzMmsr?=
 =?utf-8?B?dkt5N0U3RHp5dTFlQjU2UTBsbGwyS2VYVm55YTltL01rdjZIekJQa3B0SEJT?=
 =?utf-8?B?ZjhZWGQrNnFBNGQ1NGo1Y1Ewc09rb0JBTmt0MTJVRnZJQmNCTE5oWExpemV2?=
 =?utf-8?B?OXNKbitaSkZ2YXRyQlFmQnJZQjVUUkdkV1c4cVRzR05VOUhaM2p1ZFF6Y0hm?=
 =?utf-8?B?dkNpQWhKM1l5QjBZR3ZBT0ZPUmFNdHRXY2NhS3N5cjFTajVyZFFXbzNwZ3JY?=
 =?utf-8?B?ampTVllQOGpGM1d6Y1RSQ0ZOMEZ2Tks4dHBjUnZlaFF2QXZBU0xpYUZWYXd2?=
 =?utf-8?B?MWtJdUw1cHNqcXBLd3JkTmdrRUpwVVBtR1JKblVIQW92NjZFd2pTMktiaCtX?=
 =?utf-8?Q?caQ70g0FHwg/ZYJUbwe+sdc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckgrRG83VXViZXlXa2xnTFg5UmpBdTVRcDFCRnVZVGNNU3JBNlZodFJwaExN?=
 =?utf-8?B?ZlJ4RkJ0U1k3Q0E4NzIwUEpnMDJrekk3ZExaTXQxamcxNFJ5eG8zTm1yblRx?=
 =?utf-8?B?MCs3aDRMMHhJRXNWUEJDRkNPM054WW5KL21Jb2hFY1FMeGJjdzBhZ3Iwck4y?=
 =?utf-8?B?Q1pnUDRyRVI0QlJ6c0RKNkhaTVNBRGpvc2RQNVlCQ25xQ0FybnMwbnZFbUFO?=
 =?utf-8?B?QXdiT0VURlRqK2lpWjdnMnZwc250WTg1NndYRXlpU0ZseENCWVFnbDlmejVi?=
 =?utf-8?B?aU1MdkdLdTMzcW9tZmR1bUNzbEZBb1BVQk96VTVnaTJwOVlpZ0tPSHJzdk9E?=
 =?utf-8?B?TmdSeGtnOE5tYnhGSEx6U0JJN29OVHRid2RKdlNNamIrb1pSNzloSnZtQzho?=
 =?utf-8?B?ZG9EQU8rUnJUanl2UHJGalRJZnR0MTFmSmdnU2FTWktXbE5mL28xV21ES05h?=
 =?utf-8?B?d1JDS2FKM3gxejFvQWlMSEJ5YTdRdFlvQnVwM0VnYWI3NGJUekJZWGNXNUpI?=
 =?utf-8?B?eERqQ3RxV3F1QVYyT0JjcEZZWHVvVCtvZjcyNnRTQ3hyRm1aSUJ5Z0pOdVUw?=
 =?utf-8?B?bmpXcjJGenF1R3hhdXAwUktpNkp1SCsva0VXYk1aeFR6TGlZVXl0aVhMeEUy?=
 =?utf-8?B?ejcvYWRkaTN6dTI5dWxVMmxEK3M3aUt3RVNBYmQwR3RDZWg4TFdZa1lhaG1K?=
 =?utf-8?B?RTV0NEk3RWhXKzhheHltMStDQi9xSThuMU0zMUFDN1Y1NnVEUmdVY3hJN25v?=
 =?utf-8?B?OEMzTVZ4QkIza3krZzc4WStoeWgzQUFmWlFXZDFXVHJGeUErc1ZIcVFLb3g0?=
 =?utf-8?B?STJYdGg5Vk9IODdpT1MwTmpaN21pcTNtNCs4a1J2SEo4Y1hzSjBxZG9kM29M?=
 =?utf-8?B?TktIMDFUVGVyNzlpNTA5eEJtUzZKZWZpUTJmMXlkRU5VUERqUTYyVjBNblVt?=
 =?utf-8?B?dm1xRFpTSlp1UWxDVHE2OTQzNkhwMVpIYnlobjExbUhPUlZFaDRnMExtN0c4?=
 =?utf-8?B?QncvSXZzdkJ3R252Z3JjSzJjNm81MmN2Z0IvRlpzQWRmRHQ2ZFJibTlHYjlL?=
 =?utf-8?B?VWlMdHlxZ3Q2S2dRWC9hdWRTQlFNS3l3cC9xOE4zRE1CZ0JEVXBTOW14UjdE?=
 =?utf-8?B?bjEvb1NiQmxJZFl4YStmaUFoZFBvVS9MdWYzSENrdkRFU1haeVo4Qkc4cjNv?=
 =?utf-8?B?cjZqNk85K1pZT21qNWRwMlpBQ3orTlpkVHpFRGFWcWRvcytRZ0pZT3JjL0RT?=
 =?utf-8?B?SWhyWHdjQWdTakdBT3M2b05RUVpoZmhnZW95ZEpXZGRKeE55RHo2K2paWnYr?=
 =?utf-8?B?V2RpaDEyd3g5aFArc1RrZUVXM3R3T213c1FKemEzNkZFMmZrNmdYanZQZzNo?=
 =?utf-8?B?RDVnYktoVWhkZTRUVUtQeUVmQkhNaFA4azcza1IyWU4vU0dvY2o2MDhZODNS?=
 =?utf-8?B?ZS9PcVhwYnJBL1R4alBpdE8vaTEyRVdxZ2xPV2R2SmZtdWF3VHg2aHFMdTdy?=
 =?utf-8?B?ajhRRk1pcXZQdkUxRURJRHRaR0VnNDRyY1NGUDAraDZGSjc1ZFlsY3VLYnBP?=
 =?utf-8?B?S3ZLamx4TFdvOG9LWGFHcGVzMFB5Slpvbld4VjlmdVJPcStlMk9FckdZa3dV?=
 =?utf-8?B?WXphb3l6eUdqQWJZQVN6TGYrOFRSU09oNk5BK2hScnkwY2ltRnpSU1FkN2VV?=
 =?utf-8?B?cjVsYytRbis4RzRCODl3S3VvU2QvRGJIVmVXcXVyWDkzdVY5dG1ZcE1nUHg2?=
 =?utf-8?B?ZWZCOFJLa2lJeURTd0NSWmVDZ3VJNGV5MElpdkdtSjNacGZwcGZHSnBpZXox?=
 =?utf-8?B?dmFOK3Brc3laT0QvaFc4R1pwaEZUVldxenFiUFYzTy9YTEgzVEpvK29TMFZT?=
 =?utf-8?B?dnNVV0lJWGFpQ0NPU1FHQjJRSXdndEU3LysyT2pma0MzWUZ0bk1xbDVVSldQ?=
 =?utf-8?B?dGFCa0hvQWFZam5wNUcyQjhXUHIwMmE4VVpjZnV0NjQ2QlpsYmk3cXNuTkRy?=
 =?utf-8?B?ZGd5c1JWOFpMNDlhdDhMRzZaS0NobG12OHZFWUpJc21SeHVYM0gvRnhMUHc3?=
 =?utf-8?B?Z0srcjR3ZjFOTnRudHZsQ29ieGkvM2ZSN21kYXYxZ1laTkhjU0xIRVZDeE1I?=
 =?utf-8?B?UUQ2VGNiTXB6UlEyVlByZDgzQXpBWkpiVFBLVURMaDA3TDNkMHJjclJnYjVK?=
 =?utf-8?B?d2FnNXg2eTExdTFoYUhkR2dJdStCTmZtcTliT1d0cVNtRjNScW1yU2RqRFJM?=
 =?utf-8?B?bGgvSHNtL25mQVRoUnRSWnoxclFnSDBIMVE1Q1NSa1AxaE5sUkdzT3ZXc1lx?=
 =?utf-8?B?dDJxU0I0WmRlRkkwZC9ZdzZBR3AydHhzZkJaY1hrcVJvNjNSV0Vhdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9bfbbb-4d3d-4b0d-4691-08de59a00fe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 10:21:52.9253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+qr3KThRbXUVsQB+953OXtA3YUPHrPIDA6diZG4NE7XFZobL+6v1uI85TqCOdX891MEmV4qCu9UZ1M7p6X3FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
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

Rm9ybWF0dGVkIGRlc2NyaXB0aW9uOg0KDQpQcmV2aW91c2x5LCB0aGlzIHRlc3QgY291bGQgYmUg
c2tpcHBlZCBpZiBhbm90aGVyIHRlc3QgbG9hZGVkIGENCmNvbmZsaWN0aW5nIGRyaXZlciBmaXJz
dCwgZHVlIHRvIHRoZSBvcmRlciBvZiB0ZXN0IGV4ZWN1dGlvbi4gVGhpcw0KcHJldmVudGVkIHBy
b3BlciB0ZXN0aW5nIG9mIGZvcmNlX3Byb2JlPSouIFdpdGggdGhpcyBjaGFuZ2UsIGluc3RlYWQg
b2YNCnNraXBwaW5nLCB0aGUgdGVzdCBub3cgZXhwbGljaXRseSB1bmxvYWRzIGFueSB1bndhbnRl
ZCBkcml2ZXJzIGJlZm9yZQ0KY2FsbGluZyBmb3JjZV9wcm9iZT0qLiBUaGlzIGVuc3VyZXMgdGhl
IGVudmlyb25tZW50IGlzIGNsZWFuZWQgdXAgYW5kDQp0aGUgWGUgZHJpdmVyIGlzIHJlbGlhYmx5
IGxvYWRlZCBhbmQgdGVzdGVkIGFzIGludGVuZGVkLg0KDQpSZWdhcmRzDQpOaXNoaXQNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFNoYXJtYSwgTmlzaGl0IA0KU2VudDogVGh1
cnNkYXksIEphbnVhcnkgMjIsIDIwMjYgMzozMyBQTQ0KVG86IFN1bW1lcnMsIFN0dWFydCA8c3R1
YXJ0LnN1bW1lcnNAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEtv
bmllY3pueSwgS2FtaWwgPGthbWlsLmtvbmllY3pueUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSRTog
W1BBVENIIGktZy10XSB0ZXN0cy9pbnRlbC94ZV9tb2R1bGVfbG9hZDogQWRkIGRyaXZlciB1bmxv
YWQgYmVmb3JlIGZvcmNlLXByb2JlDQoNCkhpLA0KDQpTdXJlIFN0dWFydCwgbGV0IG1lIGFkZCBk
ZXNjcmlwdGlvbiBoZXJlLg0KDQpQcmV2aW91c2x5LCB0aGlzIHRlc3QgY291bGQgYmUgc2tpcHBl
ZCBpZiBhbm90aGVyIHRlc3QgbG9hZGVkIGEgY29uZmxpY3RpbmcgZHJpdmVyIGZpcnN0LCBkdWUg
dG8gdGhlIG9yZGVyIG9mIHRlc3QgZXhlY3V0aW9uLiANClRoaXMgcHJldmVudGVkIHByb3BlciB0
ZXN0aW5nIG9mIGZvcmNlX3Byb2JlPS4gV2l0aCB0aGlzIGNoYW5nZSwgaW5zdGVhZCBvZiBza2lw
cGluZywgdGhlIHRlc3Qgbm93IGV4cGxpY2l0bHkgdW5sb2FkcyBhbnkgdW53YW50ZWQgZHJpdmVy
cyB1c2luZyBpZ3RfaW50ZWxfZHJpdmVyX3VubG9hZCh1bndhbnRlZF9kcml2ZXJzW2ldKSBiZWZv
cmUgY2FsbGluZyBsb2FkX2FuZF9jaGVja194ZSgiZm9yY2VfcHJvYmU9IikuIA0KVGhpcyBlbnN1
cmVzIHRoZSBlbnZpcm9ubWVudCBpcyBjbGVhbmVkIHVwIGFuZCB0aGUgWGUgZHJpdmVyIGlzIHJl
bGlhYmx5IGxvYWRlZCBhbmQgdGVzdGVkIGFzIGludGVuZGVkLg0KDQpAS29uaWVjem55LCBLYW1p
bCwgQ291bGQgeW91IHBsZWFzZSBoZWxwIGFkZGluZyB0aGlzIGRlc2NyaXB0aW9uPw0KDQpSZWdh
cmRzDQpOaXNoaXQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFN1bW1lcnMs
IFN0dWFydCA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KU2VudDogVGh1cnNkYXksIEphbnVh
cnkgMjIsIDIwMjYgMTI6MzUgQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
U2hhcm1hLCBOaXNoaXQgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQ
QVRDSCBpLWctdF0gdGVzdHMvaW50ZWwveGVfbW9kdWxlX2xvYWQ6IEFkZCBkcml2ZXIgdW5sb2Fk
IGJlZm9yZSBmb3JjZS1wcm9iZQ0KDQpPbiBXZWQsIDIwMjYtMDEtMjEgYXQgMDQ6NTAgKzAwMDAs
IG5pc2hpdC5zaGFybWFAaW50ZWwuY29tIHdyb3RlOg0KPiBGcm9tOiBOaXNoaXQgU2hhcm1hIDxu
aXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gDQo+IFByZXZpb3VzbHksIGEgc2tpcCBjb25kaXRp
b24gcHJldmVudGVkIHRoZSBJR1QgdGVzdCBmcm9tIGV4ZWN1dGluZyBpZiANCj4gY2VydGFpbiBk
cml2ZXJzIHdlcmUgcHJlc2VudC4gVGhpcyBjaGFuZ2UgcmVtb3ZlcyB0aGUgc2tpcCBsb2dpYyBh
bmQNCg0KSSdkIHJld29yZCB0aGlzIHNsaWdodGx5IHRvIHNheSB0aGF0IGluIHRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uLCB0aGlzIHRlc3Qgd2lsbCBza2lwIGJhc2VkIG9uIHRoZSBvcmRlciBv
ZiBleGVjdXRpb24gb2Ygb3RoZXIgdGVzdHMgLSBpZiBhbm90aGVyIHRlc3QgbG9hZHMgdGhlIGRy
aXZlciBmaXJzdCwgdGhpcyB0ZXN0IHdpbGwgc2tpcCwgd2hpY2ggcHJldmVudHMgdGVzdGluZyBv
ZiBmb3JjZV9wcm9iZT0qLg0KDQpPdGhlcndpc2UgSSBhZ3JlZToNClJldmlld2VkLWJ5OiBTdHVh
cnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+IGluc3RlYWQgZXhwbGlj
aXRseSB1bmxvYWRzIGFueSB1bndhbnRlZCBkcml2ZXJzIHVzaW5nDQo+IGlndF9pbnRlbF9kcml2
ZXJfdW5sb2FkKHVud2FudGVkX2RyaXZlcnNbaV0pIGJlZm9yZSBpbnZva2luZyANCj4gbG9hZF9h
bmRfY2hlY2tfeGUoImZvcmNlX3Byb2JlPSoiKS4gVGhpcyBlbnN1cmVzIHRoZSB0ZXN0IHJ1bnMg
DQo+IHJlbGlhYmx5IGJ5IGNsZWFuaW5nIHVwIHRoZSBlbnZpcm9ubWVudCwgYWxsb3dpbmcgdGhl
IFhlIGRyaXZlciB0byBiZSANCj4gbG9hZGVkIGFuZCB0ZXN0ZWQgYXMgaW50ZW5kZWQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4N
Cj4gLS0tDQo+IMKgdGVzdHMvaW50ZWwveGVfbW9kdWxlX2xvYWQuYyB8IDMgKy0tDQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2ludGVsL3hlX21vZHVsZV9sb2FkLmMgDQo+IGIvdGVzdHMvaW50ZWwveGVf
bW9kdWxlX2xvYWQuYyBpbmRleCA2ZmNmNGY4MDYuLjBjNzVjNGViYyAxMDA2NDQNCj4gLS0tIGEv
dGVzdHMvaW50ZWwveGVfbW9kdWxlX2xvYWQuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9tb2R1
bGVfbG9hZC5jDQo+IEBAIC0xMzQsOCArMTM0LDcgQEAgaW50IGlndF9tYWluKCkNCj4gwqANCj4g
wqDCoMKgwqDCoMKgwqDCoGlndF9zdWJ0ZXN0KCJmb3JjZS1sb2FkIikgew0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaW50IGkgPSAwOyB1bndhbnRlZF9kcml2ZXJzW2ld
ICE9IE5VTEw7IGkrKykgew0KPiAtDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZ3Rfc2tpcF9vbl9mKGlndF9rbW9kX2lzX2xvYWRlZCh1bndhbnRlZF9k
cml2ZQ0KPiByc1tpXSksDQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiVzIGlzIGFscmVhZHkgbG9hZGVk
XG4iLCANCj4gdW53YW50ZWRfZHJpdmVyc1tpXSk7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2ludGVsX2RyaXZlcl91bmxvYWQodW53YW50ZWRf
ZHJpdmVyc1tpXSk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxvYWRfYW5kX2NoZWNrX3hlKCJmb3Jj
ZV9wcm9iZT0qIik7DQoNCg==

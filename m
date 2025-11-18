Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4471CEBF92
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 09:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728DF10E45C;
	Tue, 18 Nov 2025 09:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROoBuMul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA5510E45C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763457788; x=1794993788;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=5Oei4+TKATUmDkIUfRVuGZAsACY9/2lNU+9pJ2Qhf2k=;
 b=ROoBuMulIJuxSyATrfwZTiClTl4J6y93a7/ZofQ8UvTqzrCb3SKgu3kA
 3YE81Y3CEbuIks+0xxIUaqzm5aIfxdN7eGy/zE8br77lB6u5b3ooFvWyG
 dzckP/ND5AntTJFRL+phgJaU+Mn0Erlvk/h1np2dIiWBeTZGKh3VSa9Pr
 7XgE5WM4Yh+YVCeyI65Xy6/3nfK6JyyhTS10+ddahrjh0L5XGTZ9n6FZw
 lc6Vegav91Ug+fnRGkBGPAMcXV9UfWxRKDec0iEgXU8ZgdpsAHmvgtNQs
 uio8Pa/R6FvQG4OqL19p4TutszC58INTyZPxQZHwAVMjsGaYd+nzyc5u0 g==;
X-CSE-ConnectionGUID: qfd/vB7cTTSPeUvQgXto9g==
X-CSE-MsgGUID: WVR1ks95Rl+1inICjSZefQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="82864407"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="82864407"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:23:08 -0800
X-CSE-ConnectionGUID: 9INIk8KXSXO3LW9NRacehg==
X-CSE-MsgGUID: NgjNvQRBTiSzUEPVN43uIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="221370917"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:23:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 01:23:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 01:23:07 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 01:23:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKHHJnpJI0c+J9VEFO3zzdhb4W4/eh3054ReHqLdJJKaTbD55gxV4WO1oo8dom2KCEqVLAkbdCggm1StcSbuIcRbSI3gzboCmh8okxeMz05r1yhHQ0+aR3BVfYPt/dDwfWOiOg8Flir9txxJgJaRzrupfy8loI4LI9qJI4dFiVavHP3nJJRMT6vtc//MM7ynR73Xg0dByypNYkhl1z094RDpnGoyuXKW2ErjbhWRdd8bwh7pYtdBgPH9z4C/ceyYOtVAecDBE12ys86EDuZUxHE0tKWU/trVORje+1FmmIeg1jsGJnP2f/2TIU2BhsJZHrpmJ6T8BVnj09aj3r2usA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Oei4+TKATUmDkIUfRVuGZAsACY9/2lNU+9pJ2Qhf2k=;
 b=TpnWqXtklh/msPCEVdUzAfFBLti1HxTgohmuP3stKnfWyYj6xoCa30vGwYFvnW8D8kFDXCGvJjNZ8Wh8ane+ArEjmhxiuy+DzrWFIVysPSCwfSao2Jg0DOQ7TgOYnkgNbX3qfGn6xhLtahg59CnFCQn+BscvEIhucFAF6Xk7eAeqnKSOGd7CSn5Gb5MdHeQYW0QRlrAAn7BRlSOUJMIXfNLN7FHrcq3of3buOpicAFvvU+9Nd0qToNTmMEFwRHqaxspbjTMnln6b5gmDr1LRkRufoaVtdlFyFBr9EMPtYn4JbKiVP/W4iVynYSGnB6FAmkDcr1fqSr0j2u6+fcwWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM3PPF818092190.namprd11.prod.outlook.com (2603:10b6:f:fc00::f34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 09:23:04 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 09:23:03 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise and introduce lr_sync helpers
Thread-Topic: [PATCH i-g-t v7 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise and introduce lr_sync helpers
Thread-Index: AQHcVLs4ysFZmjr0y0KsLpDYH6RXELT205SAgAA0x4CAASgOAA==
Date: Tue, 18 Nov 2025 09:23:03 +0000
Message-ID: <2739b1d96eaf19f3962bd4c265f803269d41aeb7.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-2-nishit.sharma@intel.com>
 <2b0a163b988d0d148f04aa3cb8910c18964d2e6a.camel@intel.com>
 <e2379b51-6f05-4342-9628-d0bb15ef9af4@intel.com>
In-Reply-To: <e2379b51-6f05-4342-9628-d0bb15ef9af4@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM3PPF818092190:EE_
x-ms-office365-filtering-correlation-id: 904426bb-cbc4-4c03-83de-08de26841370
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YVcvalZRSldCTlVLSG5ZcFB3Sld6RC9BaGVYMWtHbkpCTDg5N3pTK3VILzZG?=
 =?utf-8?B?RzdhMnNFb1pjS1NBa2JrMmZ5THY1NGVVaUZVQ3BXU3F4Tk5TaWJQY3hCZTVk?=
 =?utf-8?B?OXllc3RONXhVSE4xYUJkOEduZ3Q4dDVrT3VvU3hqVFZwZkd3V1pWNGdsWnd4?=
 =?utf-8?B?amo0eitoMzV2VVFPR0JRVkZ5YitWL1IrZlViYWY0SnFkZW9oUldWSW0yRUJZ?=
 =?utf-8?B?QTZ0cGxWWFZya05aOVJQdDJYOGwrWmJOWFlGUGhMU05ZTmpQWHlXTDVVR0tU?=
 =?utf-8?B?cWdFaU1zeDJBOUhRemQ3aVQ1N1VlTGU4NlYweThsVi81M1lFdEs4ajdsNUMw?=
 =?utf-8?B?ZTlGcTEyaS9XWlFreU4vWUFUTHR0bnRIM0VLUmN0UnUvTlU1UjJHVXF4OEor?=
 =?utf-8?B?TE8wQTN6dzZNUDZLSndjVlRMYXRaYUpTckdnSWc0d2FzRkdBTG9QTG5oc3ZH?=
 =?utf-8?B?dlVaMkV2Mmx1Um5oMlRGY0I2VFphUTV2RUxnYjFiZTRsZnZZNWVOUGVUWjRL?=
 =?utf-8?B?aVVSQ3BsbklRUjZMY2ZOT21UWDVERTZ1eHdoeTlCSWlwM29RTGJHc05Bb3FC?=
 =?utf-8?B?VzlQV0gxVkswZVpQdkFRYUpkbCtSdWpENUc0ejNPajZ6c2x4U3RmaWFSa3dt?=
 =?utf-8?B?VkFpSlE0bm81VEFxVjdFZ1E2RU9peDhVZ3NwdkFRVEhPUlFSeUI0cFdkTVlS?=
 =?utf-8?B?NWdMUDZDMDJUSTdiN0h0VUp1UGdPWUZLYVhjOUt0WEZxeUtjM3BTNlZQbksw?=
 =?utf-8?B?dEVJL2svcHBEVXFnZUFKNE1LVkpETFYvMlpyVGN1YzZoQ0gzNHVPREc4b2hk?=
 =?utf-8?B?citHdWhreFllNmVCWnpUNkJBWGxDRW9IUXd1cHJkZFpvamRmWTNkM3FOK2dm?=
 =?utf-8?B?Vko0UVhEM3NqNGZqTlRheEFzblUyRVl1UW5Kek8zakk2cDhpK3gzSVVEMlRs?=
 =?utf-8?B?WjNTdFhBRU9kUUNpT3p4K2NHZ1BmV2tMQW14SzJ1ZUpRajdKVjQzcXdLc2ps?=
 =?utf-8?B?RDlTcmwxalcrZ0dQMU5YK2w2OHlnbHZ5ZEtqemwvaDkrc1NKa0lkZzdiNlpL?=
 =?utf-8?B?UTBDaUwvWlQ5NXFRRFhxRmVzcWx3OGljZHNqalhyemYrOXhqcXpmSWJrVERS?=
 =?utf-8?B?OFk2Y1pXSmk3VXp3cTFJOTQvUElIVW5hRzYyNWdxT2FpSy9oZG95MzlzNmZl?=
 =?utf-8?B?SEtCWVRHbkZmNjNzM01maEcvQklYZXRTQ2xna1RIL2JLQkQ1ZjhGQXhpSmdB?=
 =?utf-8?B?VHEwVEFhOFdTT0pJd1pxMCtFRFNJa3lxNk0yRkU3VXBrck5xTjZxWW56bjhZ?=
 =?utf-8?B?QjJpdXJjRGlWNW8yQ0xxL2NlLzUyODhPK2VwOGU2d2x4NC9ETUxGeXgweXdM?=
 =?utf-8?B?MkM0cDNDelByVkRFVVNLVTVGa21HVjdDMWpyQW0xbVMvOU94TGlFUzl2MERR?=
 =?utf-8?B?dVV2eXpGa3J0T1ZtNlJFOGQ5S0VIRENFazhPc0NscHJvbVI0aFZJdzBLaHU0?=
 =?utf-8?B?L2RiZ1FyV0RqdCtsdHVRckk0RnRYSTkwTXMxTXh4Zko2UkMzY0tQR2pvWm9M?=
 =?utf-8?B?L1U2RVRUYW1ueitnSzJHQzN4Zzh3eCtLc0JSb3RjQ2VIdkwzT21hNjNYeDBL?=
 =?utf-8?B?Zmx0a0ZySVVQTldSUi8rU1VhbGRMc1RyTEtKbVhRSUNiQ2YvV3JCd2E3dDUy?=
 =?utf-8?B?UEgyZVpWQ1RDa29iRXg0TU8vQTRNOUpPNDlVaTFNNU42S25jNkk0akFiVzI2?=
 =?utf-8?B?Yk1KY3dZT2JGRDRQd0xEREh6YXEvNXV5aGNlUTlVMzBrUVpOdVZGNzN6QWV1?=
 =?utf-8?B?RUFmOGtSc2RTYjZ0RHlDdkU2NXFuTEtxdkZXNnRTQXR3ZmljdFFNMG5OZUJV?=
 =?utf-8?B?QzRIenBJUXkwL0EycXJrc2JMYml5R0lrTXA2bXp1TFZjeDhBdHYxMlZUdE4y?=
 =?utf-8?B?dUtibU5DWXFGbVpNRHYwRm5Dazl6MTkvOUgvM2cxNk0vSmxZb0tZS0ppSzlh?=
 =?utf-8?B?cXlZcDBtU2twMW1rd3BlbnZ0ZE5iV2RKb2VlUEhOcnhiS0dyTVZ6ckV2RC9I?=
 =?utf-8?Q?icDzat?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnBWNCtGWi9Gb3VWb254bnREZzFTV3BJcHBKdGRtcXZzWURzK014ZFFuTFFC?=
 =?utf-8?B?cnFNL28yTkxmTDZ5L0Y0QjJFZzh4cTJ2MEZCeUpUTUs0SFRHTTM2ZzFKOXZB?=
 =?utf-8?B?dUJXeGJHS3Jqbmk5NUtxUmhJRzZLUXUyaVMzQW1GUTBMbTNVYUVyUGxlTlhT?=
 =?utf-8?B?N1F2QmxkV2l2SUNWVjBnd1l0aDlmZ1FIM0JJVlVkSmI3NGhmSnBlMU5odkhs?=
 =?utf-8?B?SkNVbGNwN3ZRTVNQUzhDdDFaUXRUL1RhdS95K0trRUwrZHVBcVR2NkhXZnBB?=
 =?utf-8?B?akdxVkRMeS9tMHQ3bDZGN1hCUHhaa1Bwa05zdHcxZDIxYitIYWpSeE1TYWpm?=
 =?utf-8?B?VjVhenNKVDVlMVJwRmZJVnZLa2VvZlcrZzhWZnZOcFc1ZmcrVU4vbC9ZREpq?=
 =?utf-8?B?cDBGSW5aV3hxelg5OFJvMGIzcitxNlEycjIrLzZMSEZ2TVdRTEJ0Sk9VVy9x?=
 =?utf-8?B?aWxKWmdZOCtOb05kdWdMQTMzdFA4NHQ0UnVuN1paRFRCaDlMQkdGMVpiVmdv?=
 =?utf-8?B?MnFJeWZzK1huRVVtcGd4NWllRjhIZDFMcmZPUlpJOVNheFhGSkdpV3dWU2Np?=
 =?utf-8?B?MUxSV3BKajNMRlQyd0pDM3NyNVZaKzZ3RHJxRktkTGFmbThvN0FMK2gwL0ZR?=
 =?utf-8?B?dnAvekxXenNDMHgzbEZGN1RZQldJYkphUy9nTUZwb3RiWVgzTVRMN2RVMlZp?=
 =?utf-8?B?N3NWaTdCVTcrb29YZjVRYnhsMzc1WGFYT3VKQ0E1MVl1Skc2M1JrSEkzQjRr?=
 =?utf-8?B?M3RudWpkK3VMcGJWaU1VM2tLWTlmWmY1MWxXS3F3QktLM3VRa3BSd2xPVS8z?=
 =?utf-8?B?Q3M0b3VBVVRWQnBmdkdWZm1Ob3V4SWk3VTRyQU9VZlVlQWRDZVlJNXR5eU40?=
 =?utf-8?B?NDZmNDU4ZnlGWW53VEJydmEwdFBvdkdMelkwRksyMEhnYkYveFQ3SmtBZG9J?=
 =?utf-8?B?SEYwNVo0NHZvek1GYWZWSktHV3FPOGNaTjFBem1ubTJEYlVmMUp6cWljaE9W?=
 =?utf-8?B?d3Fqek5uY2UxZnlNZjFnbVdlZk16M1BvT20vRTAxcWdDcEdTRUhFdFNad2N4?=
 =?utf-8?B?NU1CeFBKb0FrdTFJWERvaXB5UUJqTUNHeFNxMnN5ZHJ1WEsvZXFWdzFldVpo?=
 =?utf-8?B?RmtFb2lmbTNGc3JaQjI5L25ESDBWUGxtK0JLQ0NlVHp3WnR0RXNpVHFHRjZB?=
 =?utf-8?B?UGJ0aTRqMDloZWY3UXNyZ3NENmhlQzV2TGl1dThHVlVJV2JyR1VPNFNOcms2?=
 =?utf-8?B?WlFOSHIzOTFOcjErMW1IdnBzZTMwMlgxV1NYS1VacXZXMnlTak5oS1lUbGN6?=
 =?utf-8?B?dGZESEtCVTNoWmpKaytqbk5vQWJiejBsbEhlQTBTNzdzY09SRlV1blR2WXdI?=
 =?utf-8?B?eGEveHVXZkRsSHNXNVhnV1BzODM1SnRQUE1RMjFuOXBENmJma0IvZUpGaERp?=
 =?utf-8?B?Q0RER0RnN28xYVZwdldVQXhkYnhuVDlEZDZCc09OL3FCK09SZy85cUNxdjk2?=
 =?utf-8?B?OVczMU4xTnV6NjdSZTRLVXdQWUlRNWhzMDA3Z0R3ZWN5N3gzUlF0OG5aUmhE?=
 =?utf-8?B?dGhaYlZsUDR2WUU3MFIyaEV2N0V2cmVJalczODBaeTZnRm9Kc05BYkk3VkJo?=
 =?utf-8?B?ZmkzSEpUZDkvbFllZFlHZ0cwRldEa0FqcUp4bllLU1YrWVMrWkNIMGVJUHJS?=
 =?utf-8?B?dzJtVHpGRy8rS09xd09aZXlOT29tbThnL0FzbjBsYzBSbTVKanNLb2hYS3gv?=
 =?utf-8?B?L2dDTCtCMnJJcXgwWndJVHJ2S01BM1VCUGk1QjdaWFY1YVIyaEFwWG1FYlpM?=
 =?utf-8?B?MjgyN2lud3o3aG9IQVUxdWtNTy9ZZFFMNUxtQis0VUZNeXpEU1FGenNSOWJX?=
 =?utf-8?B?U3hJNGx5K0hJSm5JUFdHK09PTFRDRlh1QjczZmh0aW8wVWlrekx6MVBZejFv?=
 =?utf-8?B?M1VneU8xQ3Q5anB6ZDRKY0pta2RKVkdObjRoVnBxQS9WSnRwb01qSXo5SGJo?=
 =?utf-8?B?d0tZYmdNTEw1NXFreXdxNTVTTFFDc0g2SC9xbjZBNGpmUmNSWmMva1lvYnYr?=
 =?utf-8?B?T0tZTGtRY3VTVzVUSnB0dG9RZ3RHZ0tpQi9DMUVpTE5vY0phdFRjWXJJekdr?=
 =?utf-8?B?dDNFZ0RKVmpQZlJOQlFWRm5WTktmVkVRV011SlR2RjRrUEs1dkYzNXIrTDdp?=
 =?utf-8?Q?clhDWMyxCfaAIXxLwhQVt7a3LGpR99jM7Hae++sgVNVT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEFB453CF519C447A044C2AB71A7DBA6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904426bb-cbc4-4c03-83de-08de26841370
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 09:23:03.6797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6vN/vx7T799qtoVUbWofUIgAj+ZWl2g4sQNEP2l0C6r2jL+vpU5/t8EPj3mQhPOJhyubHhWppzytYD/RX0a1QTfKt6YaUXV2SsU0rhxwJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF818092190
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

T24gTW9uLCAyMDI1LTExLTE3IGF0IDIxOjEzICswNTMwLCBTaGFybWEsIE5pc2hpdCB3cm90ZToN
Cj4gDQo+IE9uIDExLzE3LzIwMjUgNjowNCBQTSwgSGVsbHN0cm9tLCBUaG9tYXMgd3JvdGU6DQo+
ID4gT24gVGh1LCAyMDI1LTExLTEzIGF0IDE2OjMzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVs
LmNvbcKgd3JvdGU6DQo+ID4gPiBGcm9tOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gQWRkIGFuICdpbnN0YW5jZScgcGFyYW1ldGVyIHRvIHhl
X3ZtX21hZHZpc2UgYW5kIF9feGVfdm1fbWFkdmlzZQ0KPiA+ID4gdG8NCj4gPiA+IHN1cHBvcnQg
cGVyLWluc3RhbmNlIG1lbW9yeSBhZHZpY2Ugb3BlcmF0aW9ucy5JbXBsZW1lbnQNCj4gPiA+IHhl
X3ZtX2JpbmRfbHJfc3luYw0KPiA+ID4gYW5kIHhlX3ZtX3VuYmluZF9scl9zeW5jIGhlbHBlcnMg
Zm9yIHN5bmNocm9ub3VzIFZNIGJpbmQvdW5iaW5kDQo+ID4gPiB1c2luZw0KPiA+ID4gdXNlcg0K
PiA+ID4gZmVuY2VzLg0KPiA+ID4gVGhlc2UgY2hhbmdlcyBpbXByb3ZlIG1lbW9yeSBhZHZpY2Ug
YW5kIGJpbmRpbmcgb3BlcmF0aW9ucyBmb3INCj4gPiA+IG11bHRpLQ0KPiA+ID4gR1BVDQo+ID4g
PiBhbmQgbXVsdGktaW5zdGFuY2Ugc2NlbmFyaW9zIGluIElHVCB0ZXN0cy4NCj4gPiBzIG1lbW9y
eSBhZHZpY2UvbWVtb3J5IGFkdmlzZS8gPw0KPiBHaXQgaXQuIFdpbGwgZWRpdCB0aGUgZGVzY3Jp
cHRpb24uDQo+ID4gDQo+ID4gQWxzbyB0aGUgbHJfc3luYyBwYXJ0IGlzIHVucmVsYXRlZCBhbmQg
c2hvdWxkIGJlIHNwbGl0IG91dCB0byBhDQo+ID4gc2VwYXJhdGUgcGF0Y2guDQo+IA0KPiBTdXJl
IHdpbGwgY3JlYXRlIHNlcGFyYXRlIHBhdGNoIGZvciBscl9zeW5jIHBhcnQuIEFsc28gdGhlIA0K
PiB4ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IoKSBjaGFuZ2VzIGF2YWlsYWJsZSBpbiBQYXRjaCBb
Mi8xMF0gc2hvdWxkDQo+IGJlIA0KPiBtZXJnZWQgYWxvbmcgbWFkdmlzZSBjaGFuZ2VzIHdpdGhp
bg0KPiANCj4gUGF0Y2ggWzEvMTBdPw0KDQpZZXMsIElJUkMgSSBub3RlZCB0aGF0IGluIHRoYXQg
cmV2aWV3Lg0KDQpXZSBuZWVkIHRvIGVuc3VyZSB0aGF0IHRoZSBjb2RlIGNvbXBpbGVzIGFmdGVy
IGVhY2ggcGF0Y2guDQovVGhvbWFzDQoNCg0KDQo+IA0KPiANCj4gPiANCj4gPiBUaGFua3MsDQo+
ID4gVGhvbWFzDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaXNoaXQg
U2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqDCoGlu
Y2x1ZGUvZHJtLXVhcGkveGVfZHJtLmggfMKgIDQgKy0tDQo+ID4gPiDCoMKgbGliL3hlL3hlX2lv
Y3RsLmPCoMKgwqDCoMKgwqDCoMKgIHwgNTMNCj4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0NCj4gPiA+IC0tDQo+ID4gPiDCoMKgbGliL3hlL3hlX2lvY3RsLmjCoMKg
wqDCoMKgwqDCoMKgIHwgMTEgKysrKystLS0NCj4gPiA+IMKgwqAzIGZpbGVzIGNoYW5nZWQsIDU4
IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCBiL2luY2x1ZGUvZHJtLQ0KPiA+ID4gdWFwaS94
ZV9kcm0uaA0KPiA+ID4gaW5kZXggODlhYjU0OTM1Li4zNDcyZWZhNTggMTAwNjQ0DQo+ID4gPiAt
LS0gYS9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oDQo+ID4gPiArKysgYi9pbmNsdWRlL2RybS11
YXBpL3hlX2RybS5oDQo+ID4gPiBAQCAtMjA2MCw4ICsyMDYwLDggQEAgc3RydWN0IGRybV94ZV9t
YWR2aXNlIHsNCj4gPiA+IMKgwqAJCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jLm1pZ3JhdGlvbl9w
b2xpY3k6DQo+ID4gPiBQYWdlIG1pZ3JhdGlvbiBwb2xpY3kgKi8NCj4gPiA+IMKgwqAJCQlfX3Ux
NiBtaWdyYXRpb25fcG9saWN5Ow0KPiA+ID4gwqAgDQo+ID4gPiAtCQkJLyoqIEBwcmVmZXJyZWRf
bWVtX2xvYy5wYWQgOiBNQlogKi8NCj4gPiA+IC0JCQlfX3UxNiBwYWQ7DQo+ID4gPiArCQkJLyoq
IEBwcmVmZXJyZWRfbWVtX2xvYy5yZWdpb25faW5zdGFuY2U6DQo+ID4gPiBSZWdpb24gaW5zdGFu
Y2UgKi8NCj4gPiA+ICsJCQlfX3UxNiByZWdpb25faW5zdGFuY2U7DQo+ID4gPiDCoCANCj4gPiA+
IMKgwqAJCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jLnJlc2VydmVkIDoNCj4gPiA+IFJlc2VydmVk
DQo+ID4gPiAqLw0KPiA+ID4gwqDCoAkJCV9fdTY0IHJlc2VydmVkOw0KPiA+ID4gZGlmZiAtLWdp
dCBhL2xpYi94ZS94ZV9pb2N0bC5jIGIvbGliL3hlL3hlX2lvY3RsLmMNCj4gPiA+IGluZGV4IDM5
YzQ2NjdhMS4uMDZjZThhMzM5IDEwMDY0NA0KPiA+ID4gLS0tIGEvbGliL3hlL3hlX2lvY3RsLmMN
Cj4gPiA+ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5jDQo+ID4gPiBAQCAtNjg3LDcgKzY4Nyw4IEBA
IGludDY0X3QgeGVfd2FpdF91ZmVuY2UoaW50IGZkLCB1aW50NjRfdA0KPiA+ID4gKmFkZHIsDQo+
ID4gPiB1aW50NjRfdCB2YWx1ZSwNCj4gPiA+IMKgwqB9DQo+ID4gPiDCoCANCj4gPiA+IMKgwqBp
bnQgX194ZV92bV9tYWR2aXNlKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IGFkZHIsDQo+
ID4gPiB1aW50NjRfdA0KPiA+ID4gcmFuZ2UsDQo+ID4gPiAtCQnCoMKgwqAgdWludDY0X3QgZXh0
LCB1aW50MzJfdCB0eXBlLCB1aW50MzJfdA0KPiA+ID4gb3BfdmFsLA0KPiA+ID4gdWludDE2X3Qg
cG9saWN5KQ0KPiA+ID4gKwkJwqDCoMKgIHVpbnQ2NF90IGV4dCwgdWludDMyX3QgdHlwZSwgdWlu
dDMyX3QNCj4gPiA+IG9wX3ZhbCwNCj4gPiA+IHVpbnQxNl90IHBvbGljeSwNCj4gPiA+ICsJCcKg
wqDCoCB1aW50MTZfdCBpbnN0YW5jZSkNCj4gPiA+IMKgwqB7DQo+ID4gPiDCoMKgCXN0cnVjdCBk
cm1feGVfbWFkdmlzZSBtYWR2aXNlID0gew0KPiA+ID4gwqDCoAkJLnR5cGUgPSB0eXBlLA0KPiA+
ID4gQEAgLTcwNCw2ICs3MDUsNyBAQCBpbnQgX194ZV92bV9tYWR2aXNlKGludCBmZCwgdWludDMy
X3Qgdm0sDQo+ID4gPiB1aW50NjRfdA0KPiA+ID4gYWRkciwgdWludDY0X3QgcmFuZ2UsDQo+ID4g
PiDCoMKgCWNhc2UgRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BSRUZFUlJFRF9MT0M6DQo+ID4gPiDC
oMKgCQltYWR2aXNlLnByZWZlcnJlZF9tZW1fbG9jLmRldm1lbV9mZCA9IG9wX3ZhbDsNCj4gPiA+
IMKgwqAJCW1hZHZpc2UucHJlZmVycmVkX21lbV9sb2MubWlncmF0aW9uX3BvbGljeSA9DQo+ID4g
PiBwb2xpY3k7DQo+ID4gPiArCQltYWR2aXNlLnByZWZlcnJlZF9tZW1fbG9jLnJlZ2lvbl9pbnN0
YW5jZSA9DQo+ID4gPiBpbnN0YW5jZTsNCj4gPiA+IMKgwqAJCWlndF9kZWJ1ZygibWFkdmlzZS5w
cmVmZXJyZWRfbWVtX2xvYy5kZXZtZW1fZmQgPQ0KPiA+ID4gJWRcbiIsDQo+ID4gPiDCoMKgCQkJ
wqAgbWFkdmlzZS5wcmVmZXJyZWRfbWVtX2xvYy5kZXZtZW1fZmQpOw0KPiA+ID4gwqDCoAkJYnJl
YWs7DQo+ID4gPiBAQCAtNzMxLDE0ICs3MzMsNTUgQEAgaW50IF9feGVfdm1fbWFkdmlzZShpbnQg
ZmQsIHVpbnQzMl90IHZtLA0KPiA+ID4gdWludDY0X3QgYWRkciwgdWludDY0X3QgcmFuZ2UsDQo+
ID4gPiDCoMKgICogQHR5cGU6IHR5cGUgb2YgYXR0cmlidXRlDQo+ID4gPiDCoMKgICogQG9wX3Zh
bDogZmQvYXRvbWljIHZhbHVlL3BhdCBpbmRleCwgZGVwZW5kaW5nIHVwb24gdHlwZSBvZg0KPiA+
ID4gb3BlcmF0aW9uDQo+ID4gPiDCoMKgICogQHBvbGljeTogUGFnZSBtaWdyYXRpb24gcG9saWN5
DQo+ID4gPiArICogQGluc3RhbmNlOiB2cmFtIGluc3RhbmNlDQo+ID4gPiDCoMKgICoNCj4gPiA+
IMKgwqAgKiBGdW5jdGlvbiBpbml0aWFsaXplcyBkaWZmZXJlbnQgbWVtYmVycyBvZiBzdHJ1Y3QN
Cj4gPiA+IGRybV94ZV9tYWR2aXNlDQo+ID4gPiBhbmQgY2FsbHMNCj4gPiA+IMKgwqAgKiBNQURW
SVNFIElPQ1RMIC4NCj4gPiA+IMKgwqAgKg0KPiA+ID4gLSAqIEFzc2VydHMgaW4gY2FzZSBvZiBl
cnJvciByZXR1cm5lZCBieSBEUk1fSU9DVExfWEVfTUFEVklTRS4NCj4gPiA+ICsgKiBSZXR1cm5z
IGVycm9yIG51bWJlciBpbiBmYWlsdXJlIGFuZCAwIGlmIHBhc3MuDQo+ID4gPiDCoMKgICovDQo+
ID4gPiAtdm9pZCB4ZV92bV9tYWR2aXNlKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IGFk
ZHIsIHVpbnQ2NF90DQo+ID4gPiByYW5nZSwNCj4gPiA+IC0JCcKgwqAgdWludDY0X3QgZXh0LCB1
aW50MzJfdCB0eXBlLCB1aW50MzJfdCBvcF92YWwsDQo+ID4gPiB1aW50MTZfdCBwb2xpY3kpDQo+
ID4gPiAraW50IHhlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3QgYWRk
ciwgdWludDY0X3QNCj4gPiA+IHJhbmdlLA0KPiA+ID4gKwkJwqDCoCB1aW50NjRfdCBleHQsIHVp
bnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwNCj4gPiA+IHVpbnQxNl90IHBvbGljeSwNCj4g
PiA+ICsJCcKgwqAgdWludDE2X3QgaW5zdGFuY2UpDQo+ID4gPiDCoMKgew0KPiA+ID4gLQlpZ3Rf
YXNzZXJ0X2VxKF9feGVfdm1fbWFkdmlzZShmZCwgdm0sIGFkZHIsIHJhbmdlLCBleHQsDQo+ID4g
PiB0eXBlLCBvcF92YWwsIHBvbGljeSksIDApOw0KPiA+ID4gKwlyZXR1cm4gX194ZV92bV9tYWR2
aXNlKGZkLCB2bSwgYWRkciwgcmFuZ2UsIGV4dCwgdHlwZSwNCj4gPiA+IG9wX3ZhbCwgcG9saWN5
LCBpbnN0YW5jZSk7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gKyNkZWZpbmXCoMKgwqDCoMKg
wqDCoCBCSU5EX1NZTkNfVkFMwqDCoCAweDY4Njg2OA0KPiA+ID4gK3ZvaWQgeGVfdm1fYmluZF9s
cl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQzMl90IGJvLA0KPiA+ID4gdWludDY0X3QN
Cj4gPiA+IG9mZnNldCwNCj4gPiA+ICsJCQl1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplLCB1
aW50MzJfdA0KPiA+ID4gZmxhZ3MpDQo+ID4gPiArew0KPiA+ID4gKwl2b2xhdGlsZSB1aW50NjRf
dCAqc3luY19hZGRyID0NCj4gPiA+IG1hbGxvYyhzaXplb2YoKnN5bmNfYWRkcikpOw0KPiA+ID4g
KwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3luYyA9IHsNCj4gPiA+ICsJCS5mbGFncyA9IERSTV9YRV9T
WU5DX0ZMQUdfU0lHTkFMLA0KPiA+ID4gKwkJLnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1VTRVJf
RkVOQ0UsDQo+ID4gPiArCQkuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigodWludDY0X3QgKilzeW5j
X2FkZHIpLA0KPiA+ID4gKwkJLnRpbWVsaW5lX3ZhbHVlID0gQklORF9TWU5DX1ZBTCwNCj4gPiA+
ICsJfTsNCj4gPiA+ICsNCj4gPiA+ICsJaWd0X2Fzc2VydCghIXN5bmNfYWRkcik7DQo+ID4gPiAr
CXhlX3ZtX2JpbmRfYXN5bmNfZmxhZ3MoZmQsIHZtLCAwLCBibywgMCwgYWRkciwgc2l6ZSwNCj4g
PiA+ICZzeW5jLA0KPiA+ID4gMSwgZmxhZ3MpOw0KPiA+ID4gKwlpZiAoKnN5bmNfYWRkciAhPSBC
SU5EX1NZTkNfVkFMKQ0KPiA+ID4gKwkJeGVfd2FpdF91ZmVuY2UoZmQsICh1aW50NjRfdCAqKXN5
bmNfYWRkciwNCj4gPiA+IEJJTkRfU1lOQ19WQUwsIDAsIE5TRUNfUEVSX1NFQyAqIDEwKTsNCj4g
PiA+ICsJLyogT25seSBmcmVlIGlmIHRoZSB3YWl0IHN1Y2NlZWRzICovDQo+ID4gPiArCWZyZWUo
KHZvaWQgKilzeW5jX2FkZHIpOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICt2b2lkIHhlX3Zt
X3VuYmluZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IG9mZnNldCwNCj4g
PiA+ICsJCQnCoCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplKQ0KPiA+ID4gK3sNCj4gPiA+
ICsJdm9sYXRpbGUgdWludDY0X3QgKnN5bmNfYWRkciA9DQo+ID4gPiBtYWxsb2Moc2l6ZW9mKCpz
eW5jX2FkZHIpKTsNCj4gPiA+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmMgPSB7DQo+ID4gPiAr
CQkuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwNCj4gPiA+ICsJCS50eXBlID0gRFJN
X1hFX1NZTkNfVFlQRV9VU0VSX0ZFTkNFLA0KPiA+ID4gKwkJLmFkZHIgPSB0b191c2VyX3BvaW50
ZXIoKHVpbnQ2NF90ICopc3luY19hZGRyKSwNCj4gPiA+ICsJCS50aW1lbGluZV92YWx1ZSA9IEJJ
TkRfU1lOQ19WQUwsDQo+ID4gPiArCX07DQo+ID4gPiArDQo+ID4gPiArCWlndF9hc3NlcnQoISFz
eW5jX2FkZHIpOw0KPiA+ID4gKwkqc3luY19hZGRyID0gMDsNCj4gPiA+ICsJeGVfdm1fdW5iaW5k
X2FzeW5jKGZkLCB2bSwgMCwgMCwgYWRkciwgc2l6ZSwgJnN5bmMsIDEpOw0KPiA+ID4gKwlpZiAo
KnN5bmNfYWRkciAhPSBCSU5EX1NZTkNfVkFMKQ0KPiA+ID4gKwkJeGVfd2FpdF91ZmVuY2UoZmQs
ICh1aW50NjRfdCAqKXN5bmNfYWRkciwNCj4gPiA+IEJJTkRfU1lOQ19WQUwsIDAsIE5TRUNfUEVS
X1NFQyAqIDEwKTsNCj4gPiA+ICsJZnJlZSgodm9pZCAqKXN5bmNfYWRkcik7DQo+ID4gPiDCoMKg
fQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9pb2N0bC5oIGIvbGliL3hlL3hlX2lvY3Rs
LmgNCj4gPiA+IGluZGV4IGFlOGEyM2E1NC4uMWFlMzgwMjlkIDEwMDY0NA0KPiA+ID4gLS0tIGEv
bGliL3hlL3hlX2lvY3RsLmgNCj4gPiA+ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5oDQo+ID4gPiBA
QCAtMTAwLDEzICsxMDAsMTggQEAgaW50IF9feGVfd2FpdF91ZmVuY2UoaW50IGZkLCB1aW50NjRf
dA0KPiA+ID4gKmFkZHIsDQo+ID4gPiB1aW50NjRfdCB2YWx1ZSwNCj4gPiA+IMKgwqBpbnQ2NF90
IHhlX3dhaXRfdWZlbmNlKGludCBmZCwgdWludDY0X3QgKmFkZHIsIHVpbnQ2NF90IHZhbHVlLA0K
PiA+ID4gwqDCoAkJwqDCoMKgwqDCoMKgIHVpbnQzMl90IGV4ZWNfcXVldWUsIGludDY0X3QgdGlt
ZW91dCk7DQo+ID4gPiDCoMKgaW50IF9feGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZt
LCB1aW50NjRfdCBhZGRyLA0KPiA+ID4gdWludDY0X3QNCj4gPiA+IHJhbmdlLCB1aW50NjRfdCBl
eHQsDQo+ID4gPiAtCQnCoMKgwqAgdWludDMyX3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLCB1aW50
MTZfdA0KPiA+ID4gcG9saWN5KTsNCj4gPiA+IC12b2lkIHhlX3ZtX21hZHZpc2UoaW50IGZkLCB1
aW50MzJfdCB2bSwgdWludDY0X3QgYWRkciwgdWludDY0X3QNCj4gPiA+IHJhbmdlLCB1aW50NjRf
dCBleHQsDQo+ID4gPiAtCQnCoMKgIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwgdWlu
dDE2X3QNCj4gPiA+IHBvbGljeSk7DQo+ID4gPiArCQnCoMKgwqAgdWludDMyX3QgdHlwZSwgdWlu
dDMyX3Qgb3BfdmFsLCB1aW50MTZfdA0KPiA+ID4gcG9saWN5LA0KPiA+ID4gdWludDE2X3QgaW5z
dGFuY2UpOw0KPiA+ID4gK2ludCB4ZV92bV9tYWR2aXNlKGludCBmZCwgdWludDMyX3Qgdm0sIHVp
bnQ2NF90IGFkZHIsIHVpbnQ2NF90DQo+ID4gPiByYW5nZSwgdWludDY0X3QgZXh0LA0KPiA+ID4g
KwkJwqAgdWludDMyX3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLCB1aW50MTZfdA0KPiA+ID4gcG9s
aWN5LA0KPiA+ID4gdWludDE2X3QgaW5zdGFuY2UpOw0KPiA+ID4gwqDCoGludCB4ZV92bV9udW1i
ZXJfdm1hc19pbl9yYW5nZShpbnQgZmQsIHN0cnVjdA0KPiA+ID4gZHJtX3hlX3ZtX3F1ZXJ5X21l
bV9yYW5nZV9hdHRyICp2bWFzX2F0dHIpOw0KPiA+ID4gwqDCoGludCB4ZV92bV92bWFfYXR0cnMo
aW50IGZkLCBzdHJ1Y3QNCj4gPiA+IGRybV94ZV92bV9xdWVyeV9tZW1fcmFuZ2VfYXR0cg0KPiA+
ID4gKnZtYXNfYXR0ciwNCj4gPiA+IMKgwqAJCcKgwqDCoCBzdHJ1Y3QgZHJtX3hlX21lbV9yYW5n
ZV9hdHRyICptZW1fYXR0cik7DQo+ID4gPiDCoMKgc3RydWN0IGRybV94ZV9tZW1fcmFuZ2VfYXR0
cg0KPiA+ID4gwqDCoCp4ZV92bV9nZXRfbWVtX2F0dHJfdmFsdWVzX2luX3JhbmdlKGludCBmZCwg
dWludDMyX3Qgdm0sDQo+ID4gPiB1aW50NjRfdA0KPiA+ID4gc3RhcnQsDQo+ID4gPiDCoMKgCQkJ
CcKgwqDCoCB1aW50NjRfdCByYW5nZSwgdWludDMyX3QNCj4gPiA+ICpudW1fcmFuZ2VzKTsNCj4g
PiA+ICt2b2lkIHhlX3ZtX2JpbmRfbHJfc3luYyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50MzJf
dCBibywNCj4gPiA+ICsJCQl1aW50NjRfdCBvZmZzZXQsIHVpbnQ2NF90IGFkZHIsDQo+ID4gPiAr
CQkJdWludDY0X3Qgc2l6ZSwgdWludDMyX3QgZmxhZ3MpOw0KPiA+ID4gK3ZvaWQgeGVfdm1fdW5i
aW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3Qgb2Zmc2V0LA0KPiA+ID4g
KwkJCcKgIHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHNpemUpOw0KPiA+ID4gwqDCoCNlbmRpZiAv
KiBYRV9JT0NUTF9IICovDQoNCg==

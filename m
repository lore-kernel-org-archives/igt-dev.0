Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB25CFA745
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 06:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FC310E1FA;
	Fri,  4 Oct 2024 06:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWmwaLwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B01110E1FA
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 06:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728021683; x=1759557683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AJvx9gqhdF9eBXkDGv1BQL7VQXl8S54IMG3hiQdZpho=;
 b=CWmwaLwudQO2zVurxiojLi8ATft7/EocFCQbeS2v4nMWcQzWFbWK0DZE
 wEDB0/pdUCBcAn33Q3/dU51fE0CYgJOFo+CRdE9lz27Uffwa3iSz6kEzC
 tbNb5baQgZThQK8mLzwtKt2wa4CXdh+OU2R4+BOiM4JYHvbsLxsbsAmez
 G/+Nqq4YRbKROF5kGWLC2on5KvHT3kq157SKO6wiiu0cWTUMb9hBXsxsW
 iLO63kFZHf4tjAHr/UCED/KZJofoOMBbdJHtxkc5I8ttmJ2KPF+OAObPp
 4FTL+aoYTeFv7BPyx46Oi1cDEfm4i6AKWFSlgUGTpd2gnscdMZMUs8san g==;
X-CSE-ConnectionGUID: vGJzYgXtSceBXtuEnzpstA==
X-CSE-MsgGUID: zB1edIJJSra7A+b/lHfNDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27405941"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="27405941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 23:01:23 -0700
X-CSE-ConnectionGUID: pwXsAuwbQDa09Ja+5SbT2A==
X-CSE-MsgGUID: FagWUAGsTaqhhsvSUNqWKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="105346741"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 23:01:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 23:01:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 23:01:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 23:01:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 23:01:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+tkxVmanzo8LPJDFWtMV7B6ORRd93sn3z4nzJcRGJpnLHsD8K0QIISmS5rxVcUH6E9pWsOYwHdnzhPoC9WgNRwDiSJ7EJU45lyzSjLgCAu8wDnbdkC/o8d4ovjSEB8I88hAcNLgtMOYSZ0TBk9cq7lRfQ1vGr8FW8tb0pf4QVAxdo2P8V3k9z++id/2EqHypXfloTgR/WU5vpzCpL6o2Ckvpgqg+2/T0fSHcGHGVvGfvxUshWJibBp75b3DmOZ0cN+xqrmFhzzwQ76p5Uq2zBJzWZ1fHjk91zWqFJFRLJqQwGuBe3R9JjQD/8C2DIUKGdKrrewqVKRhZnkZZD1l0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJvx9gqhdF9eBXkDGv1BQL7VQXl8S54IMG3hiQdZpho=;
 b=Kk68i3VuWNT+HBn3klAH6GD2L4Q9o9+SNWbUuRBqw/yd4whqq/bv7eDujc4fhX5qcHpGx3OJ9HV3xYtXuASPk1oQghBGxd4Cy/cFfGQn34o6HIx9UZiECpEYpok9kZIpsgNLSXQxMWF0O7HrGMpuEA9B9SyHuQH47ChBLx2OuK+XdDUkFLuHP5jdFUyBRgx8PsVkVWDNf+Hs1+eKdV9uYvL71oFHA0bRWz3MKJ4s47HNBHUDKUayVmcpbOQRoN/WAlHa9Mj4V3mXbiNaRoHQ5YWhwLK77DMb4ty162mFLBgaWSQKDXyEkN/1ZqSOlNPqHJtNrQFsJbPYwwRnaotazg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SA1PR11MB6616.namprd11.prod.outlook.com (2603:10b6:806:257::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Fri, 4 Oct
 2024 06:01:14 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 06:01:14 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 i-g-t 2/2] tests/xe_eudebug_online: Adjust
 interrupt-other test
Thread-Topic: [PATCH v2 i-g-t 2/2] tests/xe_eudebug_online: Adjust
 interrupt-other test
Thread-Index: AQHbFL5kHtlfDKq+Ok6QnohMb+wQ6rJ1DKOAgAEOOCA=
Date: Fri, 4 Oct 2024 06:01:14 +0000
Message-ID: <DS0PR11MB7264BE5FFFD6A39B495903E2D9722@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
 <20241002112914.5556-3-dominik.karol.piatkowski@intel.com>
 <cc11d8b61760737467dc16e79de686616cf85ff5.camel@intel.com>
In-Reply-To: <cc11d8b61760737467dc16e79de686616cf85ff5.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SA1PR11MB6616:EE_
x-ms-office365-filtering-correlation-id: 6b4e89c3-4121-4c58-5e3b-08dce439f470
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YTljbGhESmZOWUplZUlkVThUeTd4M2lDOWRzcCs3ZmJ3bnA0QUNoMkp0YVY0?=
 =?utf-8?B?a09Zem9jNW5xMHZEMDZ5T0lCU3h2L3RRRFk0WmlqSnN1LzBSS1hsNkdrMWRC?=
 =?utf-8?B?a1NXaDQ5RjZITnVxV25tc2FFanRzazJqNTVUb2ZsZkI4bWJZMTQ3Z1dENWRY?=
 =?utf-8?B?b3ZxWWdjRFFwZjl3UnhZTmVVckt6QVNITzlCUWpxY0swdnUzSlVyRFdUaWFv?=
 =?utf-8?B?L0xHRkVqRENucldwYzlzMmh1bUdTZ0NPeFg0UXdSNGhRSHg0SXllbGgwZEZz?=
 =?utf-8?B?bGt1bVhCY2l1dmxYOWRJRWhoOTF2MS92b2U1SHdKeFRCK29SVFlpM1EzbFlp?=
 =?utf-8?B?MjAyK0tYSWZsSkRmdlE1Qzc2bi9ObFFvUFdzSjgyTC90V0phbEo4SzJkS1Mr?=
 =?utf-8?B?aFppc3cwK2xBMFVSak1rWWtET21CaWxDL2JSVDhUYnhBRFFyNy9LN2dNUnUw?=
 =?utf-8?B?NVUyZWdQZ0lMZUNqRGgwN0pJYklDOHBrWjlwUExtOVNFaG84UmpDWDZqQVdJ?=
 =?utf-8?B?UDZ2YlpKYmhlck4vcmpaUFFpNnJ3aEpYUnV2NENpYTE3bnVwOHEvRWxuaGd4?=
 =?utf-8?B?SCtMcjhoYjdLbEV5OWVTckp1ekdqK0lUaUtTdm84dFBEUGkvelYwdzNZT0s5?=
 =?utf-8?B?eTkxY0QzN0hmbUgzclI5WSs1NnBTS1ZINnZxNzVyKzcxeG1ZRUZTOWtkRlVh?=
 =?utf-8?B?aS9yb09oenZCbS9lWGRBeExIdy9Pc0JMcEoxTEJTbk1nZlduUU9ZZjBqMHJ4?=
 =?utf-8?B?VGtGK1V3bjZUdVdKNEZxdCtyc0lib0ZXVmkwUHdrZUc5eUJHWWtlb25lZ0R1?=
 =?utf-8?B?ZVc4YS9xRDF2OTd5S3VqbWtyRjlrMStOQTQ2K1lMaGhiYTVyNjVYSTVRc1Vl?=
 =?utf-8?B?NTdERG1KbG5zTFZXVWV3U2puK2QyMVB4RTFZS0o4U3hCOUloNzBNL2lad3dx?=
 =?utf-8?B?NGpWRUdvNFdYemtvaDVENEpRUWU1amxRK1ZrSWRrVkNIRHdDRmlhVldFSHIx?=
 =?utf-8?B?bHNvN3ZBdmhpT3BOdlpvcGxlVDNsRndmeGNmUi82ZjFEMzhGVE9COFVmYzhS?=
 =?utf-8?B?L0Vlc1JjWGxOMDdGMU1lL2hRWXl2MXZKT3BtUUhsVFoxVHNRUHpJcTlvRnh1?=
 =?utf-8?B?SEJwdW8wNXNqMC82a0krci8reHdhUGFTVHJScTBnb1NZMzl2R0MvVS9aNG14?=
 =?utf-8?B?TC91K0dwdEk5Ly9rcE1QZGtHSnZHQmlZSGpuN2xzbkpYVklhNnNyeE52Z3Nh?=
 =?utf-8?B?SjdhNVFSUXRQRXJqZEFaVTJiTWEza1p1LzBnaDIzWldsNzl3QVV1T3BJalVS?=
 =?utf-8?B?eUIxY1MveDF4d0FicGROd0M1bE1iWUFMMk96amlBcklzOEZxRkNNOElxUU9G?=
 =?utf-8?B?MW1VM3hBYm1TN2ZwQW1RREVLZmZzaVVXNFVJay9URVV3OTJud0hKcGMyQUJm?=
 =?utf-8?B?RkxPMEV3V2t3R2xRZDNHZE5UWEF1cHllWGhyZ25DVTYyVGRPYTh3dU5PMkRX?=
 =?utf-8?B?YzRoaWVXQmlGQlArVEc2ZjVXSkRkWmJVZ1dLRWdtYW5Yb3Yyd3lieGlLbGtw?=
 =?utf-8?B?RWFHcit1SW5LT3VVZkdRaS9RSmJKS1BVMC9zQXVCWTlscHQ3ZG92R3RWTkdN?=
 =?utf-8?B?UDVDY29LZFoxZXE3a0JVV3pLU2EvOGtvNVVlNGdQRkh6UnEydUZzRjlnRnY1?=
 =?utf-8?B?eWdxbHFsMXR0TzR0UDJiZzgrRGQ5YWhnN010aFFRYVBpczhZbTREd1NpUXdz?=
 =?utf-8?B?THNxZWYwNVkxSDQ0SjM5cStBR1JVQUJvOHc5REJxRDA2MUkzQjNkUXV6VlNl?=
 =?utf-8?B?OVNvdWlSd3hrUmNtN0Q3UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U01lbHJYZCtWbnd6L2grSlJNcEVkTUlnTFdOSTBXUXQ2S1NuV2ptMzh5UmRn?=
 =?utf-8?B?azJyVEVCOEx1cjFWR3JYTUJERmZSOWVTRDg5QWJYWDQveitldGtzVkdUN0l1?=
 =?utf-8?B?cEV6ajd2MFdXL2RiR0pHMUlaV1J3dkRuY29oYnZMTTlNeFozWFFlUHhtVXIy?=
 =?utf-8?B?SmxjanNVUlJDYnlESFhrUUdBQzlCWDBmeVNRY2VuOXlwdFhjdmIvelBJVUsv?=
 =?utf-8?B?U0d5WVk0d1BBTFNLYnlvSDNRbGpLY1YwUHVBMmVMTS9rNnE2UTRmd0llU1NG?=
 =?utf-8?B?QWxwODc1NjRrb0VieGZoNk8yQmNXQnRza3E1RFVzY1J4RVVFM0Yray9tcW00?=
 =?utf-8?B?NDA2ZGRmNjVzRVVQaFdQRkV6MFNyWlRvSngrWmptNVRFNHpqaGlwcDRLK3RV?=
 =?utf-8?B?TXlWTUQvMjRKcHlIeWNQUExBZzRHb0NYK3JTNmR4aVVxNHcvaFV4ak9XSGRh?=
 =?utf-8?B?d0w2OEhrZXRzR09kSFErbHBKcVJnaGdaMVlLNEVTUDZRWDNIZXZwWTJBS3Jj?=
 =?utf-8?B?UDBSY3lkVFJDbUVrY3hqME1NT2hKNXQ2Z3plUUx4ZTRoY3hJcEpLdXdIeDU1?=
 =?utf-8?B?TUFWWnpaNklZcUhkb043MHZ2WnB2d2U0aEdyaitoVjBJYkh0UlJ1ejc3SFBu?=
 =?utf-8?B?YjYwNlUxUXpoY2xZZU5aMnBnZlBHa0laNEFWSmdXNEtITWdTSDRqQWxiakZk?=
 =?utf-8?B?RFczTUhpYVJMazc4b095R3JyZ2ovNlFkdkYxNnVBeGdEeVV2cXBXQ3Z1U3I1?=
 =?utf-8?B?bkcvdVFJQjRKL0VieDdza0VzcVZjNXdOais2aHIwbDQxbFN6TlpSL1BUbllU?=
 =?utf-8?B?cWJISUtuWWtrZkhMV1hLSFFHV0VmL0JVdVI3b0dzR0U2NW9BZzAvem9VVG9w?=
 =?utf-8?B?WkloejFuSWg0SUVkaTRNSHcxb0VVc3FRelhUbFNnV0duR1JDTG94SlRieElx?=
 =?utf-8?B?U3l3Y0xsbVgwMUxEck44NzBhWGZid2xZTEl6cjhXQ09pN3B6eHlZR3J0ZlBD?=
 =?utf-8?B?ejhSaDUzSkI4RXVTSFRRZC9BdWlrVDZRb01HN29xQmExOU5mSEpYOGZjN0RQ?=
 =?utf-8?B?NzFCSmlnekVOd3o2RHg4Q3FvOGdDaWN5UlBCQ0M1SERCNzBadTJaUnR4Y09I?=
 =?utf-8?B?ZUl1dWV2SU5zdmUxMHRMWFdkdUFNMmNmZlg0K1JJMXZsVTBWQzNNODJwa0FR?=
 =?utf-8?B?U3VHMUxOQzRkUkFHNk5LRUFiSTAwMnoyRmtlcjdLQ0o0Z1R6ak9nWG9QR2Jt?=
 =?utf-8?B?dlVHd2tkSnFQQ3lxelNNNVVLbVJoaWthK0orVVhTWWZ6WnZ5YTRMRnZLWnBP?=
 =?utf-8?B?V2pHZ3VoMGlSWDQvazN4NnNIdDB3NHVtWEpCZEN2UVhHWFgveFk2a3pXK29D?=
 =?utf-8?B?dVR3T1k5aXFVTU5oRU5VcXI0LzhhYzdmU2NNRjFyVUJDUm92WTBvMUY2QzBU?=
 =?utf-8?B?WDh2NytxNDhobUN3R0pBQ1p0V1FmNFJ6RDRkaXFDaWdQN25EN3p6MzZ3YVkw?=
 =?utf-8?B?YkR4VTN0ancwN0pESk9vKzVWb0M3L0xISXFiYWJRQmt6OGE3ZGNoTk10ajFy?=
 =?utf-8?B?M1YwaDByNWxPMzFXVFZRbVRPaWxUQUkrYlRUSGZXTFJQSDN5YTJ5R09rblcy?=
 =?utf-8?B?bDQrZThjOU1qRkJnR2xyT1JKL0JTTDZnWnlVNk1SbHNDU3BQSThJZGRiTlVa?=
 =?utf-8?B?OUlycURteEVSeU0wdDRjU1BUa2xkRXBLTmRkbEJrV01QODJZck5GNDRKQ2xV?=
 =?utf-8?B?TG03TnplRW1sNzNqd2k1NmFDbFkxYVRiUFk0MWUzdmlhL1ZZaDkwdE5oL210?=
 =?utf-8?B?ZlN4TDVFK0NSK21CV1B4ZzNONnVPN2IyUTdKVGJqRzNsNkFkU3M0SU9iOFJE?=
 =?utf-8?B?TG5uVkxCUlY1a3NYbTBTYkxKM2gyNHBtdDZYSitUSEFPdWFUSmFuNzFDbDdp?=
 =?utf-8?B?dSs1Q3Y0alZFWDFSRmZVL3RWSll4R1VIaTAvTzJkVkVjZjUyampjRmRTbmM3?=
 =?utf-8?B?N0lLeUZURzZSbTdrS2RlQXRibVdWY3NaRGFkd2haV2RidjJqL0kvd1dORVg2?=
 =?utf-8?B?aHNsWG5Mc3R6MElIanBWdVQ1WjBibDVrcnl4LzhubEdHMWtHOGNWQ3V1Y3Fv?=
 =?utf-8?B?WWJsaUtVOEZzWWM2VFJmajViQ2M4eVdzWE9ka2lmdVJWNlRkYmVwek1pZzJJ?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4e89c3-4121-4c58-5e3b-08dce439f470
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 06:01:14.4713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: INYmsg6xdfVo1ZxmUqTHetoc9+EyKQR3+Z38FFN9YXk3Tj2doWa/5qdYoR3vs30s2IlJc86gxO2VO8eQuLz+3T6wRzXFLi17eg7QHUXs+NvQiWofctsTVJrRN2SfKVBl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6616
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

SGkgRG9taW5paywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcnpl
Z29yemVrLCBEb21pbmlrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgT2N0b2JlciAzLCAyMDI0IDM6NDkgUE0NCj4gVG86IFBpYXRrb3dza2ksIERvbWlu
aWsgS2Fyb2wgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+OyBpZ3QtDQo+IGRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJp
Z25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgU2lrb3JhLCBQYXdlbA0KPiA8cGF3ZWwuc2lr
b3JhQGludGVsLmNvbT47IE1hbnN6ZXdza2ksIENocmlzdG9waA0KPiA8Y2hyaXN0b3BoLm1hbnN6
ZXdza2lAaW50ZWwuY29tPjsgQ2F2aXR0LCBKb25hdGhhbg0KPiA8am9uYXRoYW4uY2F2aXR0QGlu
dGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiBpLWctdCAyLzJdIHRlc3RzL3hlX2V1
ZGVidWdfb25saW5lOiBBZGp1c3QgaW50ZXJydXB0LQ0KPiBvdGhlciB0ZXN0DQo+IA0KPiBIaSBE
b21pbmlrIQ0KPiANCj4gT24gV2VkLCAyMDI0LTEwLTAyIGF0IDEzOjI5ICswMjAwLCBEb21pbmlr
IEthcm9sIFBpxIV0a293c2tpIHdyb3RlOg0KPiA+IFRoaXMgdGVzdCBmYWlscyBkdWUgdG8gcHJl
ZW1wdGlvbiBpbnRlcmZlcmluZyB3aXRoIGl0Lg0KPiA+DQo+ID4gSW4gb3JkZXIgdG8gZml4IGl0
LCBzZXQgdGhlIHByZWVtcHRfdGltZW91dF91cyBmb3IgZW5naW5lX2NsYXNzIHVzZWQNCj4gPiBp
biB0aGlzIHRlc3QgdG8gbWF4aW11bSBmb3IgdGhlIGR1cmF0aW9uIG9mIHRoZSB0ZXN0Lg0KPiA+
DQo+ID4gSXQgaXMgc2V0IHRvIG1heGltdW0gaW5zaWRlIHRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1
dGUuIElmIHNldCBiZWZvcmUsDQo+ID4gd2Ugd291bGQgbGFjayBlbmdpbmVfY2xhc3MgaW5mby4g
SWYgc2V0IGluc2lkZSB0aGUgdGVzdCBmdW5jdGlvbiwgd2UNCj4gPiB3b3VsZCBuZWVkIHRvIHBh
c3Mgb3JpZ2luYWwgcHJlZW1wdF90aW1lb3V0X3VzIHZhbHVlIGZyb20gdGhlcmUsDQo+ID4gdW5u
ZWNlc3NhcmlseSBjb21wbGljYXRpbmcgdGhlIGRlY2xhcmF0aW9uIG9mIHRlc3QgZnVuY3Rpb24u
DQo+ID4NCj4gPiBJdCBpcyByZXN0b3JlZCBpbiBzdWJzZXF1ZW50IGlndF9maXh0dXJlLiBUaGlz
IHdheSwgYSBwcm9wZXIgY2xlYW51cA0KPiA+IGNhbiBiZSBhc3N1cmVkLiBJZiByZXN0b3JlZCBp
bnNpZGUgdGhlIHRlc3QgZnVuY3Rpb24gb3IgZXZlbg0KPiA+IHRlc3RfZ3RfcmVuZGVyX29yX2Nv
bXB1dGUgc2VjdGlvbiwgYW55IGZhaWxlZCBhc3NlcnQgcHJlY2VkaW5nIGNsZWFudXANCj4gPiBp
bnNpZGUgdGVzdCBmdW5jdGlvbiB3b3VsZCBwcmV2ZW50IGNsZWFudXAgZnJvbSBoYXBwZW5pbmcu
IFdlIGNhbm5vdA0KPiA+IGFsbG93IHRoYXQuDQo+ID4NCj4gPiBJbiBvcmRlciB0byB1bmRlcmxp
bmUgdGhhdCB0aGUgc3Vic2VxdWVudCBpZ3RfZml4dHVyZSBpcyByZWxhdGVkIHRvDQo+ID4gdGhp
cyB0ZXN0LCBib3RoIHRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1dGUgYW5kIGlndF9maXh0dXJlIHNl
Y3Rpb25zDQo+ID4gd2VyZSBwdXQgaW5zaWRlIGlndF9zdWJ0ZXN0X2dyb3VwLCBob3BlZnVsbHkg
aW5jcmVhc2luZyByZWFkYWJpbGl0eS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbWluaWsg
S2Fyb2wgUGnEhXRrb3dza2kNCj4gPiA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNv
bT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYyB8IDQ1DQo+
ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA0MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gPiBiL3Rlc3RzL2ludGVsL3hlX2V1
ZGVidWdfb25saW5lLmMgaW5kZXggNjhkMWI3ODZmLi44NDczNjE5MmYgMTAwNjQ0DQo+ID4gLS0t
IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVs
L3hlX2V1ZGVidWdfb25saW5lLmMNCj4gPiBAQCAtMTYsNiArMTYsNyBAQA0KPiA+ICAjaW5jbHVk
ZSAieGUveGVfaW9jdGwuaCINCj4gPiAgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ID4gICNp
bmNsdWRlICJpZ3QuaCINCj4gPiArI2luY2x1ZGUgImlndF9zeXNmcy5oIg0KPiA+ICAjaW5jbHVk
ZSAiaW50ZWxfcGF0LmgiDQo+ID4gICNpbmNsdWRlICJpbnRlbF9tb2NzLmgiDQo+ID4gICNpbmNs
dWRlICJncGdwdV9zaGFkZXIuaCINCj4gPiBAQCAtMjIwMSw2ICsyMjAyLDMwIEBAIHN0YXRpYyBz
dHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZQ0KPiAqcGlja19jb21wdXRlKGludCBm
ZCwgaW50IGd0KQ0KPiA+ICAJcmV0dXJuIE5VTEw7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMg
Ym9vbCBzZXRfcHJlZW1wdF90aW1lb3V0X3RvX21heChpbnQgZmQsIHVpbnQxNl90IGVuZ2luZV9j
bGFzcywNCj4gPiArdWludDMyX3QgKnByZWVtcHRfdGltZW91dCkgew0KPiA+ICsJdWludDMyX3Qg
cHJlZW1wdF90aW1lb3V0X21heDsNCj4gPiArDQo+ID4gKwlpZiAoIXhlX3N5c2ZzX2VuZ2luZV9j
bGFzc19nZXRfcHJvcGVydHkoZmQsIDAsIGVuZ2luZV9jbGFzcywNCj4gInByZWVtcHRfdGltZW91
dF9tYXgiLA0KPiA+ICsJCQkJCQkmcHJlZW1wdF90aW1lb3V0X21heCkpDQo+ID4gKwkJcmV0dXJu
IGZhbHNlOw0KPiA+ICsNCj4gPiArCWlmICgheGVfc3lzZnNfZW5naW5lX2NsYXNzX3NldF9wcm9w
ZXJ0eShmZCwgMCwgZW5naW5lX2NsYXNzLA0KPiAicHJlZW1wdF90aW1lb3V0X3VzIiwNCj4gPiAr
CQkJCQkJcHJlZW1wdF90aW1lb3V0X21heCwNCj4gcHJlZW1wdF90aW1lb3V0KSkNCj4gPiArCQly
ZXR1cm4gZmFsc2U7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHRydWU7DQo+IE1pbm9yIG5pdCwgeW91
IGNvdWxkIG9tbWl0IHNlY29uZCBpZjoNCj4gCXJldHVybiB4ZV9zeXNmc19lbmdpbmVfY2xhc3Nf
c2V0X3Byb3BlcnR5KGZkLCAwLCBlbmdpbmVfY2xhc3MsDQo+ICJwcmVlbXB0X3RpbWVvdXRfdXMi
LA0KPiArCQkJCQkJcHJlZW1wdF90aW1lb3V0X21heCwNCj4gcHJlZW1wdF90aW1lb3V0KSkNCg0K
TmljZSBjYXRjaCENCg0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgYm9vbCByZXN0b3JlX3By
ZWVtcHRfdGltZW91dChpbnQgZmQsIHVpbnQxNl90IGVuZ2luZV9jbGFzcywNCj4gPiArdWludDMy
X3QgcHJlZW1wdF90aW1lb3V0KSB7DQo+ID4gKwlpZiAoIXhlX3N5c2ZzX2VuZ2luZV9jbGFzc19z
ZXRfcHJvcGVydHkoZmQsIDAsIGVuZ2luZV9jbGFzcywNCj4gInByZWVtcHRfdGltZW91dF91cyIs
DQo+ID4gKwkJCQkJCXByZWVtcHRfdGltZW91dCwgTlVMTCkpDQo+ID4gKwkJcmV0dXJuIGZhbHNl
Ow0KPiA+ICsNCj4gPiArCXJldHVybiB0cnVlOw0KPiBzYW1lIGFzIGFib3ZlLg0KDQpUaGFua3Mh
DQoNCj4gPiArfQ0KPiA+ICsNCj4gPiAgI2RlZmluZSB0ZXN0X2d0X3JlbmRlcl9vcl9jb21wdXRl
KHQsIGZkLCBfX2h3ZSkgXA0KPiA+ICAJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljKHQpIFwNCj4g
PiAgCQlmb3IgKGludCBndCA9IDA7IChfX2h3ZSA9IHBpY2tfY29tcHV0ZShmZCwgZ3QpKTsgZ3Qr
KykgXCBAQCAtDQo+IDIyMTIsNg0KPiA+ICsyMjM3LDggQEAgaWd0X21haW4NCj4gPiAgCXN0cnVj
dCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2U7DQo+ID4gIAlib29sIHdhc19lbmFi
bGVkOw0KPiA+ICAJaW50IGZkOw0KPiA+ICsJdWludDE2X3QgZW5naW5lX2NsYXNzID0gMHhGRkZG
Ow0KPiA+ICsJdWludDMyX3QgcHJlZW1wdF90aW1lb3V0ID0gMHhGRkZGRkZGRjsNCj4gPg0KPiA+
ICAJaWd0X2ZpeHR1cmUgew0KPiA+ICAJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7
DQo+ID4gQEAgLTIyNDcsOCArMjI3NCwyMiBAQCBpZ3RfbWFpbg0KPiA+ICAJdGVzdF9ndF9yZW5k
ZXJfb3JfY29tcHV0ZSgiaW50ZXJydXB0LW90aGVyLWRlYnVnZ2FibGUiLCBmZCwgaHdlKQ0KPiA+
ICAJCXRlc3RfaW50ZXJydXB0X290aGVyKGZkLCBod2UsIFNIQURFUl9MT09QKTsNCj4gPg0KPiA+
IC0JdGVzdF9ndF9yZW5kZXJfb3JfY29tcHV0ZSgiaW50ZXJydXB0LW90aGVyIiwgZmQsIGh3ZSkN
Cj4gPiAtCQl0ZXN0X2ludGVycnVwdF9vdGhlcihmZCwgaHdlLCBTSEFERVJfTE9PUCB8DQo+IERJ
U0FCTEVfREVCVUdfTU9ERSk7DQo+ID4gKwlpZ3Rfc3VidGVzdF9ncm91cCB7DQo+ID4gKwkJdGVz
dF9ndF9yZW5kZXJfb3JfY29tcHV0ZSgiaW50ZXJydXB0LW90aGVyIiwgZmQsIGh3ZSkgew0KPiA+
ICsJCQllbmdpbmVfY2xhc3MgPSBod2UtPmVuZ2luZV9jbGFzczsNCj4gPiArDQo+ID4gKwkJCWln
dF9za2lwX29uKCFzZXRfcHJlZW1wdF90aW1lb3V0X3RvX21heChmZCwNCj4gZW5naW5lX2NsYXNz
LA0KPiA+ICsNCj4gCSZwcmVlbXB0X3RpbWVvdXQpKTsNCj4gPiArDQo+ID4gKwkJCXRlc3RfaW50
ZXJydXB0X290aGVyKGZkLCBod2UsIFNIQURFUl9MT09QIHwNCj4gRElTQUJMRV9ERUJVR19NT0RF
KTsNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICsJCWlndF9maXh0dXJlIHsNCj4gPiArCQkJaWYgKCh1
aW50MTZfdCl+ZW5naW5lX2NsYXNzICYmIH5wcmVlbXB0X3RpbWVvdXQpDQo+IE1heWJlIEknbSBu
b3Qgc2VlaW5nIHN0aCBidXQgd2h5IGRvIHdlIG5lZWQgdG8gY2FzdCBpdCB0byB1aW50MTYsIGlz
bid0IGl0DQo+IGFscmVhZHkgdGhhdCB0eXBlPw0KDQpDb25zaWRlcmluZyB0aGUgY2FzZSBvZiBl
bmdpbmVfY2xhc3MgPSAweEZGRkYsIHdoZW4gd2UgZG86DQoNCmlmICh+ZW5naW5lX2NsYXNzKSAu
Li4NCg0KaXQgZXZhbHVhdGVzIHRvOg0KDQppZiAoMHhGRkZGMDAwMCkgLi4uDQoNCmhlbmNlIHRo
ZSBjYXN0IDopDQoNClRoYW5rcywNCkRvbWluaWsgS2Fyb2wNCg0KPiANCj4gT3RoZXIgdGhhbiB0
aGF0IGl0IGlzOg0KPiBSZXZpZXdlZC1ieTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdy
emVnb3J6ZWtAaW50ZWwuY29tPg0KPiA+ICsJCQkJaWYgKCFyZXN0b3JlX3ByZWVtcHRfdGltZW91
dChmZCwNCj4gZW5naW5lX2NsYXNzLCBwcmVlbXB0X3RpbWVvdXQpKQ0KPiA+ICsJCQkJCWlndF93
YXJuKCJDbGVhbnVwIG9mDQo+IHByZWVtcHRfdGltZW91dCBmYWlsZWQhXG4iKTsNCj4gPiArCQl9
DQo+ID4gKwl9DQo+ID4NCj4gPiAgCXRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1dGUoImludGVycnVw
dC1hbGwtc2V0LWJyZWFrcG9pbnQiLCBmZCwgaHdlKQ0KPiA+ICAJCXRlc3RfaW50ZXJydXB0X2Fs
bChmZCwgaHdlLCBTSEFERVJfTE9PUCB8DQo+IFRSSUdHRVJfUkVTVU1FX1NFVF9CUCk7DQoNCg==

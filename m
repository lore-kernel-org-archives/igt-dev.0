Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D0BE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 09:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90CC10E037;
	Wed, 11 Dec 2024 09:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJelhsTJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A43E10E037
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733909091; x=1765445091;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=NFsW6CXW4gWqdQZYbWkfT71+7R3WpsdPmc85Up8J/Zg=;
 b=EJelhsTJRfNuKf3q98hvXxXpVOj5LJvvWgo0vcjhkdH+1myTsf9YIhjf
 fBp+GmyQY7kvx5S/U9JrDpk8p+kz49Tj/Uyi57QFxN6RmhjVj5OxV9XAt
 TccwM6r/gWWCv/7YKUEat6ZOxyCr/77CPINMkGSM4tyWnnptyWM1TLjM1
 E0rt+v34g/pr2ZnfY2HVpV0WWqlNbEah4iY+fE2u6X4bBZ+lW+hoOpHie
 ou0xhbmvPujs7fgQxYysO+1Gn3gyEKWax03ly5WjeYYBs4T1hLEjW/urX
 HMnYUWqSS7hM6huIFklSZqfO29B4ptbcPYrdnPPM58QEMrKy2FC8wlWO6 w==;
X-CSE-ConnectionGUID: A1ZQXSipSeKWY3vFOcizCg==
X-CSE-MsgGUID: 5y/DrchPTI6RR2WDid1UJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="21865676"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="21865676"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:24:51 -0800
X-CSE-ConnectionGUID: coPiQb9aQcO99/JQmSN01w==
X-CSE-MsgGUID: D/pcQbGFRuCsP1rAuwK7Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99818917"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 01:24:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 01:24:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 01:24:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 01:24:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbpHgn4+DtZuJhxfXa18/cd2opwv/esq/wQu2JynU5oY+guauV0Nk2kPQT/QtmWCc/6YVZPt257AaVoCvuurvbNBtdWfeW8DfIIdrDfqM+k91ngGqGBhM6KThIVs9zRpGxVT5u7FMBHe56nnvvZ1okRhctDRTGVoe0UC+a7HxwOiYCTjzzt5aFhqxPW2QtWZZ8i2P3FhcoNcVbgsjIi7299987qnCkVRqa58Q70lu2Lox+bwP/7aufZQA8gjIyIpye+w4ZHBW9EX2G/Waxbt/8pV3T2UWhpij0Ld3SPQA+hmbSZvCMA5SD/JZOHpdm7kRdqjOvdZQD/6EYuZkDEu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFsW6CXW4gWqdQZYbWkfT71+7R3WpsdPmc85Up8J/Zg=;
 b=kaqMZpsBDpEx7vjdMqpFtqcWkv6smup6I2LCYqsSLVq30HUm4xxs7Q1NUHUEV29q+vImIwPDa287KkR0bTmvkdq07ZuD/ciaRsFmVSgtQSW/omh/zFsAiyafI98GxeeTIL9ijGGWWeL7cUmrffE2ekkXySUN8O6Nf6Q/WMkHA0x9rgl8N21z17ChNcwgrgzSSyDlU1hQ0Ue8mL7F4HD8J0tDjis+5fCTRGnofBKMYSz28J972G6KWbPxROQiAJ/AVuVV9qUJI9HRsHMGW8A2r+i66FYnagsajdc4qtS0i1TCdwci0TfqOYE3vRHA4A5WTWT+ib6VFJLm2U15crd91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SA1PR11MB6613.namprd11.prod.outlook.com (2603:10b6:806:254::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 09:24:20 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 09:24:20 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ludGVsX2J1?=
 =?utf-8?B?Zm9wczogU2V0IE5FRURTX1ZJU0lCTEVfVlJBTSBmb3IgZWFjaCBidWYgYnkg?=
 =?utf-8?Q?default_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIvaW50ZWxfYnVmb3Bz?=
 =?utf-8?B?OiBTZXQgTkVFRFNfVklTSUJMRV9WUkFNIGZvciBlYWNoIGJ1ZiBieSBkZWZh?=
 =?utf-8?Q?ult_(rev2)?=
Thread-Index: AQHbSzCvoOWxHzpEfUak+RY8ORHgdrLgxoYA
Date: Wed, 11 Dec 2024 09:24:20 +0000
Message-ID: <ade14d433f7c2188637f1977fc8e93ad69db9acc.camel@intel.com>
References: <20241205104134.22790-1-dominik.grzegorzek@intel.com>
 <173385503160.905409.3185653503143061949@b555e5b46a47>
In-Reply-To: <173385503160.905409.3185653503143061949@b555e5b46a47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SA1PR11MB6613:EE_
x-ms-office365-filtering-correlation-id: 818e5255-b293-4123-a47e-08dd19c597b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Kzg5V3k2dmNmcnBDRmp4czBadGYwR296Zng1MzVQM09SdlpIeFdnV3U1WVAr?=
 =?utf-8?B?aEtZK1BqQU5ZZmp0OTdqVFViUmpGeTdBSEJHZDdQbDR2bUJnN1BGYzhYOWdh?=
 =?utf-8?B?alhGN1BnSk41dFBpUzl5M1RpM0FzM3JtaG9XVnNVdmVmNytYVXZrdXV5ZzZs?=
 =?utf-8?B?cnVPZVVIZzZVTDhYR0hxK3FraGZxend1U0xGZ0FJclBsQ3V2bWlqVVRZUXZP?=
 =?utf-8?B?MWM5bFdOclhsOFlPaTRoU0FQMGZqTGpKSEEvMjl5ZENuc1hDS3lCVnJ3YUpO?=
 =?utf-8?B?MjdwcHYxanUyRzRNSXhXUUVZcHMrak15Y1I5Z3BZUEp0SlZhTFd4SWQ3azAy?=
 =?utf-8?B?ZWZ2MFljVWVvbEdoUmRjZmY2am9IUVJpUW8zWG9yNHdYYmtVRjVDbEZ5VXhx?=
 =?utf-8?B?U1RHOEQxUEFQektjQTc0VklJTWZIa0IxRXc3VnMwSk11OGVhQVQyK0tSTFZn?=
 =?utf-8?B?aHlQeWVZUll4RlVhc3pwT1BJcjJJRVpXRy91UHdZdnJMbTZlMkdHQlJEMitM?=
 =?utf-8?B?NTNqRG5xbEszd214V1pxU2VJWkhnTUZtbUFqcHJrSEFDNDAwUVBKbXhHZ1Ro?=
 =?utf-8?B?eklsUUpwS0kxenliMm5VVHBMRjdmRlo5K0xkeHorRlh3djZJYVdnanBIOTkw?=
 =?utf-8?B?VTkxU1QrYjJWeDhtYW13WjIrKzY3WWJERmJmYVRQSktKOTBEK2pSUUNteVZp?=
 =?utf-8?B?c0sxa1JmV3czZ2pYZ2d6ZEc3TlVzc2Rmb0hSS0pBM3BKb2RTanlNazBlNUZa?=
 =?utf-8?B?NEFVM2VwZ01zWkhyamhaa1RnM3didEY3NzZuV0RrbXZ4NVVjb1ZMUG0wOEdF?=
 =?utf-8?B?Ym4yZ1E3K3hMcmhqK2l1VkRIb0c1dzMzNWhVN09WV1VPdXd0RkNLd3IvL3Vx?=
 =?utf-8?B?TnFZeWdIM2JCY2F5UmQzNzZlZ21YSldUM1pjdGxmZnNCMTBNbkVPd0IyUkRC?=
 =?utf-8?B?VWwvbW1FZTFuVkhFNmlyeDEwbkhaOEVjcUNBUVRjdzhraUdWV0FXWVl6Ry9I?=
 =?utf-8?B?MFdiMm80ZWJWeHgvdlNjU1c1VVg2SmlkaEJIRVBHNk5abENmMTJxazlDa0N5?=
 =?utf-8?B?bXMvSVpvZHZCZVZ2ZVNGZzQ1NEI5dHNITGY1NzJ3bWFNWEtKZUhKNnVJVnVo?=
 =?utf-8?B?dWd2MnFTV3grN2JpOFFJQks0MmhIMmVXUHh4UWdNZUZvaWN3M3VLak43RERM?=
 =?utf-8?B?c2UwMU11ZURZbEFPdFE2UnFnd2RkRWNjbjZ2Und1NFdVRldCNkJxdVhSdGRR?=
 =?utf-8?B?WmpVUUd1dCtoaGEvYzA5VGM1djBOa0FCV3BScHZWK3Q3TEpYN2RMUUQxaGZW?=
 =?utf-8?B?czQxUkx6YWJaeU8vUFljNyszaWZZMS8yeU9EN3E5MmJUcXlieVpFclc2NHZK?=
 =?utf-8?B?L3gxb3ZFMFVCVytSSTlSa2FRTU44b05aK0ttWWdhb3VQRkdwdlh4Q1J5L3BU?=
 =?utf-8?B?Mm1pV3lJTU9lTElvdWkxcnJ0Snl0ZDFLbXdqTFNxVzhmN0tsYXdCUlhPNlNz?=
 =?utf-8?B?ZFFLQkt3RE9lOFlUeFpsYmV5SnJtTHZiTGNYbWlPS2cxSXQ3NU1EZFc3V3hD?=
 =?utf-8?B?ZVdPMjY3MlZvVWdseVp6WkZHYXFDTjdoNUw0Zk95ZW5uRlFsbER0NkRqRWZL?=
 =?utf-8?B?WHZ6Um04VkUxY2ZVek1QaVlubU4yQkl3TnlDSnNDYUd6VDY4aENqV1BhK3Fs?=
 =?utf-8?B?TCtqeXVKTHh2TVZ3SThaY2IyMVZiS0RBSkE0TUZlQ3ZyVFZRVFBpQStxOFdC?=
 =?utf-8?B?bU1JT1J0UFZVRDZROG83L2dpTUVseDYxc0FwTEtDRlZocmdKRHg3V0ZxS3B5?=
 =?utf-8?Q?wsLvar7jb/pj+x8ahdywCZ+ZXhI1SzOs24YuM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm9ycnpHZzJYdWlSL0RiZHlDd1Qxa0NGcXc4QkVZVmJock03VVBzY2lyVjkz?=
 =?utf-8?B?SmZhelJDcGc0Tk0zeUVWaVFjY1RuU294TXJBWE1GZE04bGhzdHkyZi9CaFRV?=
 =?utf-8?B?QjVlby95dHVDNloyS2laNzE1S3JCUHFGczZMVXFoUTNXcFZmMzkramFaUEVY?=
 =?utf-8?B?Zzd0bC80b1JyWms1VjZhU0d6a0JxWmVZS04rdEtCRGVGdGlIaWNNVTFwNDZL?=
 =?utf-8?B?YWtzVXJlWTh3a05pSnlEWFBmRWlGNXFFejhPejNlZExCc05rMy9WbFMxYUhL?=
 =?utf-8?B?cGVKRWtYT2NxZFBqdmlIVGdlQ1lZUHExZHRvZ2xpN2R4UlpGd2J2YVVzbGNH?=
 =?utf-8?B?aEI0eGlzNFNNQTV5cmY0QjMvclVHMERKTHVFdUNJZHZkdlNyM0xpYkIvM2xh?=
 =?utf-8?B?QTllNmZ2L0VHajVVL3RORnBpcFV3RDdDdVExS28rK01QR0UxT1JDRWtDYnVE?=
 =?utf-8?B?bmVvenJWaVFCdjQrMDNaWEY5T2FmV01Tdk5NNVJGSXpyVCswcmc4dGZnbDNj?=
 =?utf-8?B?cG95SGoxUEo5c1o2SmRGazBMQit6UmFidmY3TFlCTnM3cml4eTNKVWFtQ09Y?=
 =?utf-8?B?MFhNZWJvK0hYdStCUk5BODRRa3hSOWFzejZSUExzR3ZXbFB0Z0ZKM1lBV2hL?=
 =?utf-8?B?eExiMUlGaGhzcFBQeFBHL1JzVzJuVm05elZLWkZ5MUxwaXRTdWUxZCtySnhn?=
 =?utf-8?B?dkpNbHJBYkJRaytueHhPM3NNWFk0TFhOVmJuR01ZSk9WTTVqOHJ4eVhKRnpw?=
 =?utf-8?B?Vm5oZCtncHVrTGdTSlIwTkxCZTBQUWJsVkVFdmNzRUFsRDZSZHlnV3NYRVVq?=
 =?utf-8?B?Qm11ZUsrc0UyODRJeW1DbDYwZUxsUGVYVDhJbDlTK2JQTjFBeWRoV09qbnRq?=
 =?utf-8?B?dDhjeEhCNUZYQ0VQMWlaM2FKTUFqL1hSc0kxRXE2SWhNRXdiWWM2T3c1RnV0?=
 =?utf-8?B?T0xJL0d6RlRNZlI3SFlyWUdFZWtuODA5VnVPUk1neU93UXhESDNLK0MyOHR0?=
 =?utf-8?B?MnhCZGtZQTVuL1g2MFVOSlZPZ01YbVU5OE5tMjhhQ096SGhWSVU4S3R2cWVm?=
 =?utf-8?B?MGxFSS9zYno4WE5jeU1aaE1sMHhHRUUwR3FkV3NlVHNlQ1NVb0hxYlQ3dkVh?=
 =?utf-8?B?KzlmU1ZrWk1JY2RXYnUvbFJtbFUwNERTV0RUblBGVC81RE1CWGwwMWwyMGY2?=
 =?utf-8?B?eGNZRnNxYjQzSFM4WDZwdE5XYXBBc0REOWM4TlBmU2d1WXhtdVdPcU55SGlZ?=
 =?utf-8?B?NmVGTjZ3WUFQVmt6RzF3QmNJN3MzVjI2VWdOQWh5K1VQRFJUamRoaVE4b2VY?=
 =?utf-8?B?eTRHZGdQblRWSFBHaEVIQUVURldES292dXpuUzBmU00ySGJlT282TGRva0Fi?=
 =?utf-8?B?R0k1TVFWTFNFK3dlMHF2elh0ZGIzdUQvbTdoYzZtb3JlcWYrbGZNR0EzalVy?=
 =?utf-8?B?Mmg1YytJd01INzZPbjBxcnF6czdyUFd0NXpyTFU5WHFsY0lDTTJyWFNoVzJ6?=
 =?utf-8?B?SmtVamQ5ODlvaVdrczJnRUg5T29hQWN5N3dRbnZyS0JwSFMxam5kcHoyNjZY?=
 =?utf-8?B?VGJtRnp4SEpWVHJEeHBWekh0UEFtSVNpNWNDclFwNmVEa1Exais4ektrR2l6?=
 =?utf-8?B?ZGpzY0VlYXFvMjNCaG11OFZvSGlzdnk5UmFXYzVkWWhBMnhPWmJnNHhZUzNq?=
 =?utf-8?B?NTdWdXhtUG4raUZYOSsrQVhtVHFjc0pZbElZZWM1SC9IbE9mS3NGYnF1UlJ5?=
 =?utf-8?B?ZHZQVzV6M2tsYTJxTG9abE9MZmV0UEY0UUJlMzhLL2RBZlVDcm9RM01MWnBP?=
 =?utf-8?B?YVNyWFFudmVZdzZpSWVUQXNyVTRvaTFMdy92WGZ2TnhPazhoRUZWNGNUOGJT?=
 =?utf-8?B?eUNsTzYwVStMOU9FYU1TdlF3enNiRElkWEVIdDRuM1ZDQS9uVEx4bmZJemRB?=
 =?utf-8?B?ckQzcEE0R2dUVGFnaHoyM3JSZWRBMVR1NzlZVVA1RnpJQlVBK3N5QTlLQU02?=
 =?utf-8?B?eG1vQnd4RVlEbmUvVGlqQ09La1YwNTdvSUlBTVB5TnJkcFBLK3ErcWYwNnlo?=
 =?utf-8?B?eVdGbXRVbVlURSswejRZNU9jVXhZNTJiNmFGZ0RQMzlsdGJIb0IvM0FXOHMx?=
 =?utf-8?B?UzFVYk56WWVoanZvcjU1d2V3blBIaXNCeFVWWWZzcFhDNS9DbVR3MGFzQzFC?=
 =?utf-8?Q?wf30i4TR/ulsT01hA4AJXI0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE959C9B7739C24AA861E72257743F35@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818e5255-b293-4123-a47e-08dd19c597b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 09:24:20.0497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R58dGPypwyd+CCqvu6+MPFp/wwKxGKdr4yxsiwY5A31xL9qz46GObUb4aceFCVLqIk3HvhmVZepIv0ohTCsRH6cY093U/GZ41UcHJJDxOiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6613
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

T24gVHVlLCAyMDI0LTEyLTEwIGF0IDE4OjIzICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09
IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IGxpYi9pbnRlbF9idWZvcHM6IFNldCBO
RUVEU19WSVNJQkxFX1ZSQU0gZm9yIGVhY2ggYnVmIGJ5IGRlZmF1bHQgKHJldjIpDQo+IFVSTCAg
IDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDIxNjcvDQo+IFN0
YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNo
YW5nZXMgZnJvbSBJR1RfODE0NyAtPiBJR1RQV18xMjI4NQ0KPiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0t
LS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMg
Y29taW5nIHdpdGggSUdUUFdfMTIyODUgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZp
ZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2Vz
IGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJ
R1RQV18xMjI4NSwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMg
bmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJ
Lg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTIyODUvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0
cyAoNDUgLT4gNDQpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBN
aXNzaW5nICAgICgxKTogZmktc25iLTI1MjBtIA0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5n
ZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTIyODU6DQo+IA0KPiAj
IyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMN
Cj4gDQo+ICAgKiBpZ3RAa21zX2ZsaXBAYmFzaWMtZmxpcC12cy13Zl92YmxhbmtAYi1kcDE6DQo+
ICAgICAtIGZpLWtibC03NTY3dTogICAgICAgW1BBU1NdWzFdIC0+IFtETUVTRy1XQVJOXVsyXSAr
MSBvdGhlciB0ZXN0IGRtZXNnLXdhcm4NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MTQ3L2ZpLWtibC03NTY3dS9pZ3RAa21zX2ZsaXBAYmFz
aWMtZmxpcC12cy13Zl92YmxhbmtAYi1kcDEuaHRtbA0KPiAgICBbMl06IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIyODUvZmkta2JsLTc1Njd1L2lndEBr
bXNfZmxpcEBiYXNpYy1mbGlwLXZzLXdmX3ZibGFua0BiLWRwMS5odG1sDQo+IA0KPiAgIA0KDQpO
b3QgcmVsYXRlZCwgY2hhbmdlcyBvbmx5IGluIFhlIHBhdGguDQoNClJlZ2FyZHMsDQpEb21pbmlr
DQo+IEtub3duIGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIGNo
YW5nZXMgZm91bmQgaW4gSUdUUFdfMTIyODUgdGhhdCBjb21lIGZyb20ga25vd24gaXNzdWVzOg0K
PiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBJc3N1ZXMgaGl0ICMjIyMNCj4g
DQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlOg0KPiAgICAgLSBiYXQtbXRscC04OiAgICAg
ICAgIFtQQVNTXVszXSAtPiBbQUJPUlRdWzRdIChbaTkxNSMxMjA2MV0pICsxIG90aGVyIHRlc3Qg
YWJvcnQNCj4gICAgWzNdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVF84MTQ3L2JhdC1tdGxwLTgvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZS5odG1sDQo+ICAgIFs0
XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjI4NS9i
YXQtbXRscC04L2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmUuaHRtbA0KPiANCj4gICAqIGlndEBrbXNf
ZmxpcEBiYXNpYy1mbGlwLXZzLW1vZGVzZXQ6DQo+ICAgICAtIGZpLWtibC03NTY3dTogICAgICAg
W1BBU1NdWzVdIC0+IFtETUVTRy1XQVJOXVs2XSAoW2k5MTUjMTI5MjZdKQ0KPiAgICBbNV06IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgxNDcvZmkta2JsLTc1
Njd1L2lndEBrbXNfZmxpcEBiYXNpYy1mbGlwLXZzLW1vZGVzZXQuaHRtbA0KPiAgICBbNl06IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIyODUvZmkta2Js
LTc1Njd1L2lndEBrbXNfZmxpcEBiYXNpYy1mbGlwLXZzLW1vZGVzZXQuaHRtbA0KPiANCj4gICAq
IGlndEBrbXNfZmxpcEBiYXNpYy1mbGlwLXZzLXdmX3ZibGFuazoNCj4gICAgIC0gZmkta2JsLTc1
Njd1OiAgICAgICBbUEFTU11bN10gLT4gW0RNRVNHLVdBUk5dWzhdIChbaTkxNSMxMjkyMF0pDQo+
ICAgIFs3XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODE0
Ny9maS1rYmwtNzU2N3UvaWd0QGttc19mbGlwQGJhc2ljLWZsaXAtdnMtd2ZfdmJsYW5rLmh0bWwN
Cj4gICAgWzhdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBX
XzEyMjg1L2ZpLWtibC03NTY3dS9pZ3RAa21zX2ZsaXBAYmFzaWMtZmxpcC12cy13Zl92Ymxhbmsu
aHRtbA0KPiANCj4gICANCj4gIyMjIyBQb3NzaWJsZSBmaXhlcyAjIyMjDQo+IA0KPiAgICogaWd0
QGk5MTVfc2VsZnRlc3RAbGl2ZToNCj4gICAgIC0gYmF0LXR3bC0xOiAgICAgICAgICBbQUJPUlRd
WzldIChbaTkxNSMxMjQzNV0gLyBbaTkxNSMxMjkxOV0pIC0+IFtQQVNTXVsxMF0NCj4gICAgWzld
OiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MTQ3L2JhdC10
d2wtMS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4gICAgWzEwXTogaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjI4NS9iYXQtdHdsLTEvaWd0QGk5
MTVfc2VsZnRlc3RAbGl2ZS5odG1sDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBy
ZXF1ZXN0czoNCj4gICAgIC0gYmF0LXR3bC0xOiAgICAgICAgICBbQUJPUlRdWzExXSAoW2k5MTUj
MTI5MTldKSAtPiBbUEFTU11bMTJdDQo+ICAgIFsxMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS10aXAvSUdUXzgxNDcvYmF0LXR3bC0xL2lndEBpOTE1X3NlbGZ0ZXN0QGxp
dmVAcmVxdWVzdHMuaHRtbA0KPiAgICBbMTJdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzEyMjg1L2JhdC10d2wtMS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZl
QHJlcXVlc3RzLmh0bWwNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91
bmRzOg0KPiAgICAgLSBiYXQtYXJsaC0zOiAgICAgICAgIFtBQk9SVF1bMTNdIChbaTkxNSMxMjA2
MV0pIC0+IFtQQVNTXVsxNF0gKzEgb3RoZXIgdGVzdCBwYXNzDQo+ICAgIFsxM106IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgxNDcvYmF0LWFybGgtMy9pZ3RA
aTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzLmh0bWwNCj4gICAgWzE0XTogaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjI4NS9iYXQtYXJsaC0zL2ln
dEBpOTE1X3NlbGZ0ZXN0QGxpdmVAd29ya2Fyb3VuZHMuaHRtbA0KPiANCj4gICAqIGlndEBrbXNf
Y2hhbWVsaXVtX2VkaWRAZHAtZWRpZC1yZWFkOg0KPiAgICAgLSBiYXQtZGcyLTEzOiAgICAgICAg
IFtGQUlMXVsxNV0gKFtpOTE1IzEyNTA1XSkgLT4gW1BBU1NdWzE2XQ0KPiAgICBbMTVdOiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MTQ3L2JhdC1kZzItMTMv
aWd0QGttc19jaGFtZWxpdW1fZWRpZEBkcC1lZGlkLXJlYWQuaHRtbA0KPiAgICBbMTZdOiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyMjg1L2JhdC1kZzIt
MTMvaWd0QGttc19jaGFtZWxpdW1fZWRpZEBkcC1lZGlkLXJlYWQuaHRtbA0KPiANCj4gICANCj4g
IyMjIyBXYXJuaW5ncyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfbW9kdWxlX2xvYWRAcmVsb2Fk
Og0KPiAgICAgLSBmaS1jZmwtODEwOXU6ICAgICAgIFtETUVTRy1XQVJOXVsxN10gKFtpOTE1IzEx
NjIxXSAvIFtpOTE1IzE5ODJdKSAtPiBbRE1FU0ctV0FSTl1bMThdIChbaTkxNSMxMTYyMV0pDQo+
ICAgIFsxN106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgx
NDcvZmktY2ZsLTgxMDl1L2lndEBpOTE1X21vZHVsZV9sb2FkQHJlbG9hZC5odG1sDQo+ICAgIFsx
OF06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIyODUv
ZmktY2ZsLTgxMDl1L2lndEBpOTE1X21vZHVsZV9sb2FkQHJlbG9hZC5odG1sDQo+IA0KPiAgIA0K
PiAgIFtpOTE1IzExNjIxXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1
L2tlcm5lbC8tL2lzc3Vlcy8xMTYyMQ0KPiAgIFtpOTE1IzEyMDYxXTogaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMjA2MQ0KPiAgIFtpOTE1
IzEyNDM1XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8t
L2lzc3Vlcy8xMjQzNQ0KPiAgIFtpOTE1IzEyNTA1XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMjUwNQ0KPiAgIFtpOTE1IzEyOTE5XTog
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8x
MjkxOQ0KPiAgIFtpOTE1IzEyOTIwXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMjkyMA0KPiAgIFtpOTE1IzEyOTI2XTogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMjkyNg0KPiAg
IFtpOTE1IzE5ODJdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2Vy
bmVsLy0vaXNzdWVzLzE5ODINCj4gDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+IC0tLS0tLS0tLS0t
LS0NCj4gDQo+ICAgKiBDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiAgICogSUdUOiBJR1RfODE0
NyAtPiBJR1RQV18xMjI4NQ0KPiANCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICBDSV9E
Uk1fMTU4MTQ6IDY5NjZhNTJjYjU1MzFiZjZjYzc4NWZhZGJhMTYwYTcxY2QzMWU3YWEgQCBnaXQ6
Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBJR1RQV18xMjI4NTog
ODdkZjE0N2E2NmM2YjMyNjc0Zjk3YTAwOGE2MjM4OTE1YTdiMDg0OSBAIGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gICBJR1RfODE0NzogZGY2
NWI2MWY4MWE1Y2M5MTljMTBmZjljNWVkNTE2YjQ1MzY0MTM1YyBAIGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gDQo+ID09IExvZ3MgPT0NCj4g
DQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVFBXXzEyMjg1L2luZGV4Lmh0bWwNCg0K

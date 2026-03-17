Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA3BF33809
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 07:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BEB10E34D;
	Tue, 17 Mar 2026 07:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlvuhMQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E90810E34D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773733943; x=1805269943;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=iKaThIdYw+/cTiUmgAHl3i5pXBSfsdCyn7J3LZ8gdzw=;
 b=ZlvuhMQi0LiOWG1kxuPHP6rF0jcmlMLmST5mKWuKqG1S3MsuxWFnqMkq
 5Zgt7brDDZAcw6FPQ6X0BuRGW+MosWzh3mQGiOu5ZUee2x6ST7F5lug4Y
 sRxpTyEK+kjE3qDd7feJ7/xWCTgMzOCK9mOjNyBW0CnTaDD5d6GR1pEez
 +8V/AlaERQ3IDzeD44F2BibttBmXYlQOm4lP8Er7n8AdejHFMwAu8fmor
 OdkaUPPs1t8JCHwbMvgDeDexB6vT8s5xfpa+c/eYRzz2w1Zg1Zf/k/upw
 GQFjsdty0NmLQtpmXhk9CMs6n0pUb1ek++q1iQKP5jYupVLlM4qR4nl05 w==;
X-CSE-ConnectionGUID: ANJYaFfbTKyCQtND5GJJCw==
X-CSE-MsgGUID: xj43fm0qQwiVPo4ZjF7CIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73776438"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="73776438"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 00:52:23 -0700
X-CSE-ConnectionGUID: w74J0bslSBOcr2ZRozMjAQ==
X-CSE-MsgGUID: uRSMpCCuRtyQV1doTTpzpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221423239"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 00:52:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 00:52:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 00:52:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 00:52:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y12yC7VfTh+Kv68dwnoRGv0srul6NmQUZJg5x7cunV/qs6aiwOOafeFJM4OPXspA/QdW777+VzDHg93t2g5djqPm0c2PLmZ8NYk8r4HHPxV/eCmsSFmtN24jkgEQm+wiJcfYQcgTGrRJ429MIA2wxx+1Iza87qqXXUX5xDiwDZLkt8/r5il/rtyIKppuelR1SBug4g4uN+fzLRr8XvR+hsQPiUYz9X+DDzHC7lBgpKYu7Vp/VBKEPHPm68PzlCE8xvG9rJRps154ZAVjWOzP/t/djgdfBTLLJObgDQ29BDwBVok+oikvENXEU9iiRCXELlFginw+rQ9vFH898Os58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKaThIdYw+/cTiUmgAHl3i5pXBSfsdCyn7J3LZ8gdzw=;
 b=Pn/q/QjP4IG6EdXSqkkMlPkqaZI1CMSm4cb6gGPpDAywOb03r2IED2h01F8e6BuTpGhuNmfMwoth9ucJ6nAuo913mrZO+dMF0uXgtHk/ivxgvF+BEXAZ7FDXsrkrBCUg8gJ4Dx0r3p05pO48frYIV5e2yKM9Njdy3qST4BZi/fxrxHa7oOuZB/eAql68iLYsPrOqB2esnvPt2lk6G0bQqljFE996zFS6UDVpkj0ofLMc3ebyxAeIJyjd+TOTDEqGPaCmmIbOwvz+nygMh/25refiH3sYClduOUm7TQ1dq3ihr7bwD4FVCJdCInKj4eantpqVGZSO9VOKeXnHgLBddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA0PR11MB8380.namprd11.prod.outlook.com (2603:10b6:208:485::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Tue, 17 Mar
 2026 07:52:15 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.20.9723.013; Tue, 17 Mar 2026
 07:52:15 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Skip output which doesn't
 support PSR
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Skip output which doesn't
 support PSR
Thread-Index: AQHctc/VgtzOduE430WBjGrTLj05IrWyOnYAgAAf2IA=
Date: Tue, 17 Mar 2026 07:52:14 +0000
Message-ID: <cbd6ea5ebaaa79af5f5465c1071a7fdcfe2239d4.camel@intel.com>
References: <20260317053132.61166-1-jeevan.b@intel.com>
 <LV2PR11MB604595209F1B21D2B75BFEC78141A@LV2PR11MB6045.namprd11.prod.outlook.com>
In-Reply-To: <LV2PR11MB604595209F1B21D2B75BFEC78141A@LV2PR11MB6045.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA0PR11MB8380:EE_
x-ms-office365-filtering-correlation-id: ab731842-f70a-42dd-5d61-08de83fa1ae6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|7053199007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: JasqzF6nfp9ApfcTuZvm1GFe2fCCZ3tFeP+v0ZZ1h1qZsIB6afY/IpnAv+TmIRBS2QQ1qvQi0EZK/bVJx8sVUmr64GoLloqswcHWATfNRPDhNeQONcsZJwjmF2Khwr76mRZOaaiamNiNCVSKIVUssBbmQY+CEpniEOusRgQivbYXBUcp0E5XFIVjuJ5upOof0uLCrQ+xGMCTM30f7xgXBed9uOqY8uZYhVDYy4x71ZHAjSzLaQDGWbWpAv4NHrtvm5D9idjg82ka5PiZYLDtmxOGGkswd5J7J2JbsuJYD0EuUkvEJhfWkCO1sXF/VtAduzL99OfmGzgvizxBTOX8iDq+lG240T2RUoFJHJmT6qa1cHD4gg+MwZ0Orb3SUBypoN84H+V7lkvJh5wc3moln3KIv51r8wALbvXR9D1BWMre9JgWDnj7Rr+oqL1luRLJ3QuZh+RNnzSaI98bw+Hmz0etxobdfQenVwOespjEVVyV/0JgKXLPZu8CVQG2b0CsVSmA06Zo5yG/GYz2/knOoNw8JerDdLfZ5ldxiNrRFWjM2mYfv0zMo0rxmufzw/YBdqRYFlti+bQZhU5vAnTthbhh4eg4Jbkd2VCoKOV7LNWpJNn8/keUjDUIHGKoMWEDGFUsyqvay/nVH6Vim+BKrYz3PmB0dSe/ribNTH2GLNPTSLnkJqIoc+q4FeLUuOjACUGwKyJjmkdhs7gaFpMQYZvI8FBpUsmxpWXZQovIirw3fdBSo027vIdT0shDgKq0OvgC42daxSbuZXx8ag2kPaNW0GHYSazHMV/8BktsV30=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnNtY3hIWVROdGVzY29CZjhSWnhBZzd0MldUM3ZmYXFUKzkxd0FKQmpFdG8z?=
 =?utf-8?B?SG1nV08wZXhpdGN6bDRZSmhBSHUxa210MWtZTmlHTm92OE4xR0VwSm14c1Bk?=
 =?utf-8?B?TUpUcEk4RTVjZ3lxcUNzNU9mRGNjYWxuc3hDdUFiTkpmTDZjUXRCK2NsR2Z6?=
 =?utf-8?B?OURCZzg2bGRhNGtpVVFXMzJFem12TDBOS1NEQ0U4am9zSXZUdXNDZ2Q0WWN1?=
 =?utf-8?B?NUorbjQvbndYYUFhd2tNU0g5RS9pcDZtUXBYN0RjYk9UQVB5VUlTL0dZVmV1?=
 =?utf-8?B?VU9kOU54Z001TmFGSmtSNHZKNVgzazA2amdkekJ0dzJMVWFobGkwTkZDdHVy?=
 =?utf-8?B?dzh5SWdFQlNKcEltQTF5MzYzZnJTOUNKN2JNWExXdkpOZG5UWHdoSVFFdzcv?=
 =?utf-8?B?T0Q4U255Y3dHd2lGWFVIVnhUaFhXcG5PdXVwVkZhUEhEUVlUNjVEQXp0Rngr?=
 =?utf-8?B?Wmw2aS9QRmQ2d1B1UEc5SDkvYVYzWHFFQy93bW9JRjJwaTQrbWJPenRSMlpi?=
 =?utf-8?B?SWR5eGlCZDFUWlFLR3hNWnFsMFY0UjltMzVPV1NBVHM3ZGVNRFlPSUhMakxD?=
 =?utf-8?B?WGw3Z2c5ZE5WOWUxUHRRZXZhT1hkVHRvanRlSWZadEFZcTJ2U3RtKzVoVW91?=
 =?utf-8?B?SXp4dkRWTGI5VStqVk8rZVJwMmE2aFRxVHRJN3JnMkJkajFyWEFXVUNpZWdY?=
 =?utf-8?B?Y3MzajhYa0JJTENQVWRxeERVZ3FFYll6TitGU1ZoMnB6V1JXSlpHN2hLWkRW?=
 =?utf-8?B?OXlIeDVWdDhBdlQ2NnJHbGhkU3g2RjJLcThyMG5IY1U5RU9wVm5NR0tCVGd2?=
 =?utf-8?B?a0pVN2pMcFRoQ3BheXZQSXNGWWR6cVhPTm1GNlpnNnEvWWRjQUFEV2NrSUUr?=
 =?utf-8?B?WUp6WU90Skp2d0dGd3BJZkU0MmFzcGthZk5YWStQNituZGtJNUdEY0JXcDRG?=
 =?utf-8?B?anpqOFZHT0JZbit6Q2pQYXBMTFlqa3hGdEJXN0FCSEpXYkpiZzNENDh4Mmg3?=
 =?utf-8?B?ZHN1RTBPSTBsSDAxdWFSSnR1K2s1WjdWaVV5Zlc2UGsyd0duZ094TzQ5bkZN?=
 =?utf-8?B?R1VvQkdWN29KS0Z6UzFzZFlDN1RBOG1xQ0FYUUFSTWpTUzBsTkF1M0NVcEhV?=
 =?utf-8?B?aEJSS3FTKzZ1VFF6OW1zMTBPMzJMWW9nNGdlY3RDaXNqdlRZVGNLYWdSYlJ4?=
 =?utf-8?B?MkJDb2JmNEhvdndsZE9QNTNrSms2dkxLSmowRDcwMTcwaG9Qb2dWdlQxcUZE?=
 =?utf-8?B?bXpOOGdkZEJ3enFvZWt4VUFGVEVuWVh1TUx4SkhZZDIzYmw5c1NwSHI5Qm1x?=
 =?utf-8?B?V216clhWS29lMTM5ZDRQajgyeExDN3lXVVMydEdZZU5qNWJuTE9YNnhGdUV5?=
 =?utf-8?B?YmtxQ2Z3NEFLNWJBajVNOG1rcEZpUWYyVlVBZlA5emNGTlU0REtsc01tZHJD?=
 =?utf-8?B?RXFwNGdzQXdETHNPT2FiVlRhMFZ2RDhLdFdwMnNXWGloSEZHakZucS9yUVll?=
 =?utf-8?B?UW4vWENqcWFqTGZOb1V5QzZyRnJMbUQweVpUSGtsSDBaeTAxL0QyUmxrOGc3?=
 =?utf-8?B?QVNYc05Ecjd1Z0RiY0gzSnU3SzllRHZHaUgvbHhpbUxyNGJlNEpsUk9EaFZw?=
 =?utf-8?B?TUZlNDVXLyt3Q0F5NFhDUS9VZjVHWlUzRXM3SUlaUlJIRkJuVzQxd1dVeWg4?=
 =?utf-8?B?R0RYMEtuUXBjOG9XQ1d4cXBXOHVSWDZDZmFTdWZEdXNHN25aYk1YbzdQV0xF?=
 =?utf-8?B?ZmlqaUQwVWhSb09aZGRnbUZmQzBqUTNwK21kRngvN2lGbDRMZFU0YkUxTGlN?=
 =?utf-8?B?Z1EvQXJJay9LSFAvK05nbGJWQWRTUHZyenhnN2J1VTdpdTdYWjVXZGJsUjJ0?=
 =?utf-8?B?OU1rdmd4WVYzOGczVDVMNDJQWm1haFNzVkE2NlBZZmIwdS9zQTBPTktnbk9t?=
 =?utf-8?B?QzRrZHRlcWNVNE13dmJ6WUNzYk1hZkZLeXJPT0ZtUk9oRVFPTGVTaDUvSkRn?=
 =?utf-8?B?ZWdUNTJPa0l2RnN2WVRIOVpteHZmNzlId2RrZ2liNzJlVERqUVowSVVlYlBp?=
 =?utf-8?B?bjFId05XNCt6bXZCMTczekd5cTJWNGJ0Smluc1pyWkZ5NjRHRWc5VzAycDJ5?=
 =?utf-8?B?Y3hWTGVCWHh1akFhWWdST0xvYmI3dHpsTjUvaVo5WjVCMEpBa1hJb3ZNek9o?=
 =?utf-8?B?VERjYnY4d0pCeTZkakFQMTFJU1lUWDBpOVJtWjN1aXNQUGFXS25HSFRsV3FS?=
 =?utf-8?B?UmNOVzVJcXlrbTV2c3hpQUZQMFBFTmpvL01OL1JmaHEwOTV6b1VsTEU0Ui9M?=
 =?utf-8?B?MVUwNm5FenVJNjluVEFGdW5WQkNZYWFLSTNvU09RZjlkY2NvMjhWS0ozZEZO?=
 =?utf-8?Q?khBGegNX0vMeAMeCQjiK1OIGDaU5C4tMRMnTTt2S36zUH?=
x-ms-exchange-antispam-messagedata-1: Zx9A6eP61KqZoBoqHTlqMAujSFdX+ku6e7U=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B18B6466EAF184987D98875BF81BE5D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZYZticN+MV0aCs4oJ8I4xtL1KpboXfNY3umIiqhSFMCOOCoRbdHJXONww0hrCYhT9nDVddYL1NM29NbJ42qNXBCmgO/ys4ifUynj9buS4pKykfb6Ojgbyk+Hl1Me7WIAlJ+HFGiExAR1EEJsxbTBks3V9fzJIkhvZtVFD9MG465AXulXNAey6MTGYXNMwfF6/mAABe7x3Y4wJ7XOjg3QcD7q98gTVoWAqZyUBD8vIWZgs2q+ULKf1KZZaXWl939V7PjF+ieJBBuAstN6yabPfPInz+VLvOowkSLiISiSEYluON9tu5aMkA8hkd8Bp9ws8ihxSTCIs7mPGQJr01sFJQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab731842-f70a-42dd-5d61-08de83fa1ae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 07:52:14.9261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1GzKFhHgY8JbLHDUOS++VggFNQCLZxrqFHJx9WTWW5507Z0nlL9nEmmc6nTY9of3CYFFdg0DKi/BUrkXHzwpJbWMMVPfhC5FzoKsEcD1lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8380
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

T24gVHVlLCAyMDI2LTAzLTE3IGF0IDA1OjU4ICswMDAwLCBCaWxhbCwgTW9oYW1tZWQgd3JvdGU6
DQo+IEhpIEplZXZhbiAsDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
RnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mDQo+ID4gSmVldmFuIEINCj4gPiBTZW50OiAxNyBNYXJjaCAyMDI2IDExOjAyDQo+
ID4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEhvZ2FuZGVyLCBK
b3VuaSA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPjsgQiwgSmVldmFuDQo+ID4gPGplZXZhbi5i
QGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ludGVsL2ttc19k
aXJ0eWZiOiBTa2lwIG91dHB1dCB3aGljaA0KPiA+IGRvZXNuJ3Qgc3VwcG9ydA0KPiA+IFBTUg0K
PiA+IA0KPiA+IFBhc3MgdGhlIGFjdHVhbCBvdXRwdXQgdG8gcHNyX3Npbmtfc3VwcG9ydCgpIGlu
c3RlYWQgb2YgTlVMTCBzbw0KPiA+IHRoYXQgUFNSIHNpbmsNCj4gPiBzdXBwb3J0IGlzIGNoZWNr
ZWQgcGVyLW91dHB1dCByYXRoZXIgdGhhbiBnZW5lcmljYWxseS4NCg0KSSB0aGluayB5b3Ugc2hv
dWxkIGdvIHRocm91Z2ggYWxsIGlndF9wc3IgY2FsbHMgaW4ga21zX2RpcnR5ZmIuDQoNCkJSLA0K
Sm91bmkgSMO2Z2FuZGVyDQoNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKZWV2YW4gQiA8amVl
dmFuLmJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgdGVzdHMvaW50ZWwva21zX2RpcnR5ZmIu
YyB8IDQgKystLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2RpcnR5ZmIu
YyBiL3Rlc3RzL2ludGVsL2ttc19kaXJ0eWZiLmMNCj4gPiBpbmRleA0KPiA+IGI4NWUwOTM0Ni4u
MzZlZWUyOWRiIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19kaXJ0eWZiLmMNCj4g
PiArKysgYi90ZXN0cy9pbnRlbC9rbXNfZGlydHlmYi5jDQo+ID4gQEAgLTEyMCw4ICsxMjAsOCBA
QCBzdGF0aWMgYm9vbCBjaGVja19zdXBwb3J0KGRhdGFfdCAqZGF0YSkNCj4gPiDCoAkJCXJldHVy
biBmYWxzZTsNCj4gPiDCoAkJfQ0KPiA+IMKgCQlpZiAoIXBzcl9zaW5rX3N1cHBvcnQoZGF0YS0+
ZHJtX2ZkLCBkYXRhLQ0KPiA+ID5kZWJ1Z2ZzX2ZkLA0KPiA+IC0JCQkJwqDCoMKgwqDCoCBQU1Jf
TU9ERV8xLCBOVUxMKSkgew0KPiA+IC0JCQlpZ3RfaW5mbygiT3V0cHV0IGRvZXNuJ3Qgc3VwcG9y
dCBQU1JcbiIpOw0KPiA+ICsJCQkJwqDCoMKgwqDCoCBQU1JfTU9ERV8xLCBkYXRhLT5vdXRwdXQp
KSB7DQo+ID4gKwkJCWlndF9pbmZvKCJPdXRwdXQgJXMgZG9lc24ndCBzdXBwb3J0DQo+ID4gUFNS
XG4iLA0KPiA+ICtpZ3Rfb3V0cHV0X25hbWUoZGF0YS0+b3V0cHV0KSk7DQo+ID4gwqAJCQlyZXR1
cm4gZmFsc2U7DQo+ID4gwqAJCX0NCj4gPiDCoAkJcmV0dXJuIHRydWU7DQo+ID4gLS0NCj4gPiAy
LjQzLjANCj4gDQo+IExHVE0uDQo+IA0KPiBSZXZpZXdlZC1ieTogTW9oYW1tZWQgQmlsYWwgPG1v
aGFtbWVkLmJpbGFsQGludGVsLmNvbT4NCj4gDQoNCg==

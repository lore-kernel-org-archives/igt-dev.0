Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E6FD743C8
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 19:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AAB10E0AE;
	Wed, 20 Nov 2024 19:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaTfng4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1B810E0AE
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 19:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732130892; x=1763666892;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZEvFm/VYojfkPkcCPC5fY9VMzmPtRpbSHceTUskaMG4=;
 b=BaTfng4SfAj/raTo83lWPvTIlmTycFgUF5GxEBwcfN6cAwqsZkQW6ut1
 ZSqoTU5axpYoBIgSODyVnP1X+vi33EtMRJgkceJ5JCd17LWgnwrn5yeJT
 VAZ7iLX+QC/T027YyhC4IMTPU+iHaULkCi9TS73hsHTo+oKqsQLgm+giV
 1apZkMhLwqOI892hMEVe61dEkIbzW4yIwR+nTiZVzH/oV1yO5tTerjImI
 Y5LFl9dd1N5pNV1Ajee77aavAUgKAN+PHwh94/We02nAz/h0X8F7fg7ED
 6yr+ekS/JViFW6UIuwH1goDfEsUJBhDuHECxlO127VBBGBxg09cGAqP3A Q==;
X-CSE-ConnectionGUID: 1+KQMqTXRXedTnt/8elhPQ==
X-CSE-MsgGUID: qor5C65dQcm0/PyjGhESeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35071447"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="35071447"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 11:28:12 -0800
X-CSE-ConnectionGUID: 8d92rfc7SaCAH90i+k6Hsg==
X-CSE-MsgGUID: rq27WoFMRcOcxh0MdQ919Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="95083063"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 11:28:11 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 11:28:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 11:28:11 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 11:28:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h95kGU8MCcvWcK4k1Dxvi6Dx4BcLIxSKVQELybmiYAydYGtIUerPSHQPxidtkiXca1ZObMIkZm1e6vAoia3JJ2JPOWU+pPtDto0/1aeOZbJU+kKtIiphjLApK4Hdq/r2zUOYYNpKM/ep4DstS7Nbc/NXXIE8lXug/UOYWzTJizfEqCeZzktnuR52c6okTR18t8tZ12Q7OoQPoFresyVFYGv/qCCe7CS1EgSSh5EqD2ZJgQfOpAi2pccTL/qNUqnITK+oBSK81ansLOFqRiGSbK0yM7eOhBj5jf0hvFAWwT8E53i0mgS7rZZC5kMp4MY82RpkunmQzZ8bx4cw5MVx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEvFm/VYojfkPkcCPC5fY9VMzmPtRpbSHceTUskaMG4=;
 b=UwUnc1wwECPUWfcq9mmJkFUmZNYxzduEtXRZkdkir/rQfnZvi9cytLm/VGRzt3hn4It+LGORJwOm68CX0YlOCN1JyZe5qtd4o2dah543m8s/Xdlw3VWtVnNszzsiOcdTI5Hqoi1mgX00n8jpdX38WGD5DAlbNtAHmWbY703tZJwCH0FcUOR5tU70oBGXEQPAGOWhLokMY9dkCQMIV/jvfWJIj31QkPiGwFfyCJ1wxqXjI102fvVBjDdhNomntfS4mMSLaMJVqZGbu4lfF+BNRaGXxIMj2Y9ts7UefHfRolfnxvjAGz4Jds/ckNC7KrQYAKC6vSnj0rg9/rD3aJ7j+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 19:28:02 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 19:28:02 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Ignore expected errors
Thread-Topic: [PATCH v3] tests/intel/xe_fault_injection: Ignore expected errors
Thread-Index: AQHbOs0qrfgSZW14tEKCdlKbkh84b7LAhISAgAAIuXA=
Date: Wed, 20 Nov 2024 19:28:02 +0000
Message-ID: <CH0PR11MB54444E53D67B10FD12567352E5212@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241119215027.109598-1-jonathan.cavitt@intel.com>
 <20241120185025.dxhnwlw7z3z36gmh@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241120185025.dxhnwlw7z3z36gmh@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB5825:EE_
x-ms-office365-filtering-correlation-id: 302e6d09-e7ea-4f0f-cdad-08dd09997334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bjFWYjhLcVNIT3dIb0VmaE9DdzNvbGNrbUhNN1laZXFTSDV0OUt0Y1dJK0xj?=
 =?utf-8?B?K3lDaWdxYklqVk1FNWttcmhNZEM3U2U1b1g5Z3pMeW9YTUpPQkpKVnRXZnJC?=
 =?utf-8?B?UVlMT1Fhd0l6RTErTzNBUXdZOFV0WTdsdWUxcHV6UkN1QkdWS2VFSm53bXBU?=
 =?utf-8?B?c1B5WjBpeHF4d2RpWEJEVWtBOCtmam9oVXFiMXJpSXdTNTZUamIzMU43cXho?=
 =?utf-8?B?RGlhRGw4YlJoYmpNM2hzNGdUcUtEc1RncHRFejgwRmFrcFNFQVpjQlRseVhB?=
 =?utf-8?B?OFJMaW5qdm5lQ3Y0R0hZekJ3R1VsTEY4bkR2akY1enpLOTZ3Q0ZqMXFWZmN5?=
 =?utf-8?B?OHRQcVBYVkdzNk5vZGM3SVJZQUhSTStOWHFqZ0hhbFNRd2FUVThHbzI5Wnc0?=
 =?utf-8?B?ZG4zbk15QVlsT1BueldaV1RUM3dkMHlXMGpDdnhpdGc2M01UOGwzRXlPWlla?=
 =?utf-8?B?Zm5YQUt2TDZpYkpJTHdaRmVWMTJYU1h6N0tKMHV6a0prQ0VsOWxoRFJJNHVU?=
 =?utf-8?B?NE9RdWkyRXJ1dUlPK3RsY3JvSXhyc3lyNU1ndTNrVSs0T2cxZEtJL2JBR01J?=
 =?utf-8?B?YkJHUEdQSkFJa1ZjeXVjZ29GUGlGbERreVU4aVgzRVhjYk5uUEVqWXZoS29J?=
 =?utf-8?B?MTNLMmdHS1pOamh1eXdCODNIWW9jYk55RmhuT2tCWlVUSk1mNVZ5bkMzSk1a?=
 =?utf-8?B?OGdrV1JrQ3VBMVp1bkhwZnZvY2xaMi9QZ0N2WERyNktjRjlnblBMWHhpU1Ur?=
 =?utf-8?B?amt4TDBWNFJJR0xkdk9nU1ZiUjFRdEpJNU9CeEN5b0FvYXJMdVp4KzhZZm53?=
 =?utf-8?B?WlZEOHRWaklVOHU4RlNGUTlsU3E4NnRkQ0RoaGdpNTlYMDBlLzNHTVNINEJG?=
 =?utf-8?B?Q09udXFGbkxZUm44M0FCd2J2Rm5jbGV2YjVBZkxjOTFDWVFlTzU1QklmOS9a?=
 =?utf-8?B?bEQzS0xVeWlMTXVkRFo5eVdPcExhM3ZUZGRqRVlIYktOSklHWjNPZ29keGpG?=
 =?utf-8?B?UEphWHh6WDNFTkZFOVhOeTg4b0RBNGNaTXN4Z3ZYeWNCMHowalZwSzB3bk8v?=
 =?utf-8?B?b2Jac2FDNjZNWEgxUXJOK0dyYkIzMU53Ym5xU3AwSjdtQnk1QlZyU0kzK1k0?=
 =?utf-8?B?dHc1U28wdlZnL0VtbTVSWHIrcU1BMVNQeUZjbmFMMGZJVmpxUUMvU2tNQXRF?=
 =?utf-8?B?TVhMZlJraWNKZUhRcVdxaDBiVlNhWmZUd25PK04vQWptWDBNUlh3ZzdTTTRV?=
 =?utf-8?B?SUp1QkVOdmdlcUtaK01welFld09RdGxmdjNIQmpFVVo3UWh6a2I4MEtaVVZK?=
 =?utf-8?B?bC8xRHMvU2hPN0c4MGovbmI2b0ZxbkpWSmNVZkd6RFRPQ0pUZnllTzE0bkdi?=
 =?utf-8?B?VmNPZjd5dmFMTC9MK0UvaE4xbTZBTEdVL1V1bjlLMGJkVWN5RkZtUWlzbkdQ?=
 =?utf-8?B?bHo0WWdXdVBhZEt2TjBCM3RLNHArVXFOTm5tNS9pT1lCN2JZeHFxanhVei82?=
 =?utf-8?B?Z1lEeXlBdnRHVE5rMEU3cWM4V29ibVQraVlUcHpyWVM2Mzdjejc4TzhJNFRR?=
 =?utf-8?B?SUI4SE80RWpBdjZCR1dVM0I2U3k5U0Z0d3VFWmQ5QWxnam9oclpDQVh2VzBB?=
 =?utf-8?B?YmgxTjByRVNjRTQ4YkJJUCtHVGxKSm9JSDBTaisvdDc1Y254bmhFTGwxYmRC?=
 =?utf-8?B?b24vS1kzWEZTR0Rjb2tWa2ZiVzBJZjM0c05xaVgrYmJCbXB5WXNwaHdFdGo0?=
 =?utf-8?Q?nAaJxpf3TpehpAy4vhiNIyTz52SyB83AMHftSji?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlhtRlRKSFFoakI4L09QUlUySkJNUnFYdldWcmg1NC9hR3JmOC95UXlseU5r?=
 =?utf-8?B?NDVxZGV4NEFkRVZyRWt4RjFhdXdVMnVlbEQrQ25GUUk5MUQ1blB3ZGZkTVZo?=
 =?utf-8?B?VFlyK284clBhRGVlYTZiaTVnQmRuMTdHZ0M5QW1jSzNRdmpMK1MwWmFwRXlj?=
 =?utf-8?B?MTh5ajh2SldZVnlQYTd1N1RHb3ZuSXIvTWQ0NnZwcjB3QndrdXI3QjJtRHEr?=
 =?utf-8?B?NDhlTU5Bd2ZjYTVubTE0bWdtdTJUNzZmbDRkdXJSY1U0cWFkcjFQbFZ5WlV6?=
 =?utf-8?B?MFRRT25NN2tTVGRLdGNQNVh5Q3R5OUYzeG9kK28yU1UwUXF1cEdVblFESy84?=
 =?utf-8?B?dzFreTVnL2hBc0RyUnJGdngwZmQzTHVsSHlocnQrSHdaNjRnUVhCNEd0c1BR?=
 =?utf-8?B?cDUxWktOZzVYV3dPY0wrY3RwZnZSSG9aS3VJbnVzWnBjUWs3WVQrTzJGN0pM?=
 =?utf-8?B?dW1hVzJpOE44cGFzT3dIQ1dNby8yUm1hcU1OMi9kU0xMOVgwa240MjVKb09W?=
 =?utf-8?B?SWtVcnFpU0lLUURWVWZxejU1NXlaVnFSK0JkYmlDcFQ1dDYzalQ0VzVHQUk0?=
 =?utf-8?B?blBadWEwbVI0S3lWaEgxMWZRTHFxUk5FYjVpVU1sOEpHeEdZVVNzQlVxTVFs?=
 =?utf-8?B?Zjhhd3BwTlI2MDZCNnJDdXFtbWJYQ1lBZlkwUk9lSzAwRzJxVFY2YitMTzJp?=
 =?utf-8?B?KzM2VGs0QkpGZG9KNmZjdGJVTkhtaTB6bDQvY2lsWmRYckh0dzM1ZHREQ1h3?=
 =?utf-8?B?ZmRnelNGVmkxNDU3L0MweEpDSnFKWXRVVmQxeEh1dExFSEgyS2h3dmJMVTEv?=
 =?utf-8?B?aFJpcFlEcFpma2FmcDFOUVRnRndiME4zTTkyR2k4TEp6blNnbDJHQmVFSFJo?=
 =?utf-8?B?WENKV25TZldIcUlqWFN3ejIrMTJGbjhZY08zUkVKRjBBL2xkbzBSZ2poSGtl?=
 =?utf-8?B?eVBqbi9lRFg4YnZVK2tZSlFKUmliWWMwenpHNnpPWDRrWHArN3pjdFVVNTJi?=
 =?utf-8?B?Wm5iV1VYWlJwcUVPWFJLOXZVRXFuL3RUN3c0bWxqWEw5VHhpTzd6MXRzMWd3?=
 =?utf-8?B?eURBYlh3OFkreDdOOWtJclZGKzhYNUpyQU1KeVBMeVRwV1BNUC96eG5BZFJm?=
 =?utf-8?B?aDRSWVpvN1F0aTFrS0RJQlR2Mk5QWG1nWkNKUEkxVzRVdW5zUWVhWGZlaDlT?=
 =?utf-8?B?d09zTVRVeUJWS1JGaTRXNVJGSFMxQWZJWVJmOHQ0MnMwelI2eFFITlFtamxY?=
 =?utf-8?B?dlkzQk5COHZjWkdWOVQxMXlMNVlHd1JXZWc1WjB4QkIrR2NJMkMvZ242Y1Uw?=
 =?utf-8?B?dTRwWm1wdTcxSG45NVA4RERWdHk2c3JEVzVjZEZCV0orQVlDQnBrdUQvYWdZ?=
 =?utf-8?B?YktPMzRNYk9lM2IzMTh2akE0M3IzOU41OVlNZ2M5azZ0K25FZExsZEZkRDNt?=
 =?utf-8?B?WGJ5Wkw0RUcyRGVoZDRDalhJYVRlanVZMjRvdmNYeDREZDdiYmFzQnZOb1NK?=
 =?utf-8?B?Z0dFUC8zeU5GcEtFY1NVUGx1VG1jZTVJRklSeWdWUW5icld5TS9VcEVOSFBr?=
 =?utf-8?B?SHpyalBKWVBpbkhrZzBJc0RBTzdUMGhMRFNlZkx6QUM0ckd3WUZVWGZGYzJ6?=
 =?utf-8?B?TUxqK0lCRzk5QWhoYWxGeElDSHpUSWJKSVlhVTVwUDB5T3hYb2kzdkUzL2RK?=
 =?utf-8?B?OHlvMnlhdXRVcEZQc3V6LzM4KzdFM3UvZnFqYUJJU0RDMy8yWWNQQkd2Y2pW?=
 =?utf-8?B?aHFjTXdzbTAzRUdGV1JsV3JDOG1BYjU4Kzc3Ynl1eFpCNFozZXM4ei9qUm1V?=
 =?utf-8?B?Y3R0NUN0L29MVC96aWhKVUY4M3hYYkxWa0xSWGVGalByTGJJb1ZHVmNSckJP?=
 =?utf-8?B?VGQxa1NrU1pESzBNcVBFeW5NTlV6WWFYVHdJeWk1M3pxdkxVY0xKbHFMSElw?=
 =?utf-8?B?ZWxEaDFXVEw0dUttSVZaaDR4NTUwZ3Zkci82UVlwVjl0K0xVeDVjYnEvRHI2?=
 =?utf-8?B?bHNHQi9FV3dQS2U2UkpzS3c1SjhIWUl4ZkFZdXFiUmwrbU9JQTJ6WHpNYm0y?=
 =?utf-8?B?VWppUWJXRUxISDdpejNjakVtejZnS011dmh2Y1NoTGQ1UXVxN2JrUFQyRUxZ?=
 =?utf-8?Q?Mqe7oWeEgCcAoJD/PFuQkQs4w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 302e6d09-e7ea-4f0f-cdad-08dd09997334
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 19:28:02.3818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQ0VxlgbCmzRXB1YCYwo3xxCoVGsLbAwq/MxVmJ+OEJwLaukA6z4sdCQuy82U+ldHlavM0H1tVBVjJDV/cFdaYzSfZQ1fVOEFacHcHE51QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDIw
LCAyMDI0IDEwOjUwIEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBD
YXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgR3VwdGEsIHNhdXJh
YmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVs
LmNvbT47IER1Z2FzdCwgRnJhbmNvaXMgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+OyBEZSBN
YXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBCcm9zdCwgTWF0dGhldyA8
bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPjsgV2FqZGVjemtvLCBNaWNoYWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPg0K
U3ViamVjdDogUmU6IFtQQVRDSCB2M10gdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uOiBJ
Z25vcmUgZXhwZWN0ZWQgZXJyb3JzDQo+IA0KPiBIaSBKb25hdGhhbiwNCj4gT24gMjAyNC0xMS0x
OSBhdCAyMTo1MDoyNyArMDAwMCwgSm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+IFRoZSBmb2xs
b3dpbmcgZXJyb3JzIGNhbiBiZSBvYnNlcnZlZCB3aGVuIHJ1bm5pbmcgdGhlIHhlX2ZhdWx0X2lu
amVjdGlvbg0KPiA+IHN1YnRlc3RzOg0KPiA+IA0KPiA+IFtkcm1dICpFUlJPUiogR1QwOiBHdUMg
aW5pdCBmYWlsZWQgd2l0aCAtRU5PTUVNDQo+ID4gW2RybV0gKkVSUk9SKiBHVDA6IEZhaWxlZCB0
byBpbml0aWFsaXplIHVDICgtRU5PTUVNKQ0KPiA+IHByb2JlIHdpdGggZHJpdmVyIHhlIGZhaWxl
ZCB3aXRoIGVycm9yIC0xMg0KPiA+IA0KPiA+IEFkZCB0aGVzZSBtZXNzYWdlcyB0byB0aGUgZG1l
c2cgaWdub3JlIHJlZ2V4IHRvIHRoZSBhcHBsaWNhYmxlIHRlc3RzDQo+ID4gKHNwZWNpZmljYWxs
eSwgYWxsIHRlc3RzIGZvciB0aGUgbGFzdCBlcnJvciwgYW5kIGFsbCB0ZXN0cyB0aGF0IHRhcmdl
dA0KPiA+IEd1QyBzdWJzeXN0ZW1zIGZvciB0aGUgZmlyc3QgdHdvIGVycm9ycykuDQo+ID4gDQo+
ID4gdjI6DQo+ID4gLSBGaXggYW5kIG1lcmdlIHJlZ2V4IChLYW1pbCkNCj4gPiANCj4gPiB2MzoN
Cj4gPiAtIFJlYmFzZSBjaGFuZ2UgdG8gYmUgY29tcGF0aWJsZSB3aXRoIGxhdGVzdCByZXZpc2lv
biAoS2FtaWwpDQo+ID4gDQo+ID4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvZHJtL3hlL2tlcm5lbC9pc3N1ZXMvMzM0Mw0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFu
IENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPiBDQzogRnJhbmNvaXMgRHVn
YXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiA+IENDOiBMdWNhcyBEZSBNYXJjaGkg
PGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiBDQzogTWF0dGhldyBCcm9zdCA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+DQo+ID4gQ0M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4NCj4gPiBDQzogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRl
bC5jb20+DQo+ID4gQ0M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gDQo+IE15IHItYiBob2xkcyBzbw0KPiBSZXZpZXdlZC1ieTogS2FtaWwgS29u
aWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiANCj4gUGxlYXNlIHJl
c3BvbmQgdG8gQ0kgZmFpbHMgYW5kIGFsc28gbG9vayBpbnRvIGZhaWxzDQo+IHJlbGF0ZWQgdG8g
dGhlc2UgdGVzdHMsIEkgY2hlY2tlZCBmZXcgYW5kIHRoZXkgc2VlbSB1bnJlbGF0ZWQuDQoNClRo
ZSBmYWlsdXJlcyBzZWVuIGluIENJLlhFQkFUIGFuZCBGSS5DSS5CQVQgYXJlIGFsbCB1bnJlbGF0
ZWQ6IHRoaXMgY2hhbmdlIG9ubHkNCmFkZHMgZXJyb3IgbWVzc2FnZSBpZ25vcmUgbGlzdHMgdG8g
dGVzdHMgaW4gdGhlIHhlX2ZhdWx0X2luamVjdGlvbiB0ZXN0IHN1aXRlLA0Kd2hpY2ggc2hvdWxk
IG5vdCBoYXZlIGFueSBlZmZlY3QgaW4gb3RoZXIgdGVzdHMgd2hlcmUgbm92ZWwgZXJyb3JzIGFy
ZSBvY2N1cnJpbmcuDQoNClRoZSBmYWlsdXJlcyBpbiBYRS5DSS5GVUxMIGFyZSBub3QgZnVsbHkg
cmVwb3J0ZWQgeWV0LCBzbyBJIGNhbm5vdCByZXNwb25kIHRvDQp0aGVtIGRpcmVjdGx5IGFzIG9m
IG5vdy4gIEhvd2V2ZXIsIHRoZSBsb2dzIGRvIG5vdCBzaG93IGFueSBpbmRpY2F0aW9uIG9mIHRo
ZQ0KcHJpb3Igb2JzZXJ2ZWQgZXJyb3IsIGFuZCBpbnN0ZWFkIGFsbCBsb2dzIEkndmUgc2VlbiBy
ZXBvcnQgdGhlIGZvbGxvd2luZyBlcnJvcg0KbWVzc2FnZToNCg0KPDM+IFszNzcuNDc4NzE5XSB4
ZSAwMDAwOjAzOjAwLjA6IFtkcm1dICpFUlJPUiogYXVkaW8gcG93ZXIgcmVmY291bnQgMSBhZnRl
ciB1bmJpbmQNCg0KSG93ZXZlciwgdGhpcyBlcnJvciBtZXNzYWdlIHdhcyBhbHNvIHByZXNlbnQg
aW4gcHJpb3IgcmV2aXNpb25zIG9mIHRoZSB0ZXN0LCBzbw0KdGhpcyBlcnJvciBtZXNzYWdlIGlz
IG5vdCBub3ZlbCBhbmQgaXMgdmVyeSBsaWtlbHkgdW5yZWxhdGVkIHRvIHRoZSBjaGFuZ2UgaGVy
ZS4NCg0KSSdsbCBhdCBsZWFzdCByZXNwb25kIGRpcmVjdGx5IHRvIHRoZSBDSSBlcnJvcnMgSSBo
YXZlIGFjY2VzcyB0by4NCg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBL
YW1pbA0KPiANCj4gPiAtLS0NCj4gPiAgdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMg
fCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI3
IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZmF1
bHRfaW5qZWN0aW9uLmMgYi90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+IGlu
ZGV4IDFiMjkwNDE3NDUuLjdkNmM5MDI3NjEgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwv
eGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmpl
Y3Rpb24uYw0KPiA+IEBAIC01MCw2ICs1MCwzMCBAQCBzdGF0aWMgaW50IGZhaWxfZnVuY3Rpb25f
b3Blbih2b2lkKQ0KPiA+ICAJcmV0dXJuIGRlYnVnZnNfZmFpbF9mdW5jdGlvbl9kaXJfZmQ7DQo+
ID4gIH0NCj4gPiAgDQo+ID4gK3N0YXRpYyBib29sIGZ1bmN0aW9uX2lzX3BhcnRfb2ZfZ3VjKGNv
bnN0IGNoYXIgZnVuY3Rpb25fbmFtZVtdKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gc3Ryc3RyKGZ1
bmN0aW9uX25hbWUsICJfZ3VjXyIpICE9IE5VTEwgfHwNCj4gPiArCSAgICAgICBzdHJzdHIoZnVu
Y3Rpb25fbmFtZSwgIl91Y18iKSAhPSBOVUxMIHx8DQo+ID4gKwkgICAgICAgc3Ryc3RyKGZ1bmN0
aW9uX25hbWUsICJfd29wY21fIikgIT0gTlVMTDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGlj
IHZvaWQgaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhjb25zdCBjaGFyIGZ1bmN0aW9uX25hbWVbXSkN
Cj4gPiArew0KPiA+ICsJLyogRHJpdmVyIHByb2JlIGlzIGV4cGVjdGVkIHRvIGZhaWwgaW4gYWxs
IGNhc2VzLCBzbyBpZ25vcmUgaW4gaWd0X3J1bm5lciAqLw0KPiA+ICsJY2hhciByZWdleFsxMDI0
XSA9ICJwcm9iZSB3aXRoIGRyaXZlciB4ZSBmYWlsZWQgd2l0aCBlcnJvciAtMTIiOw0KPiA+ICsN
Cj4gPiArCS8qDQo+ID4gKwkgKiBJZiBHdUMgbW9kdWxlIGZhdWx0IGlzIGluamVjdGVkLCBHdUMg
aXMgZXhwZWN0ZWQgdG8gZmFpbCwNCj4gPiArCSAqIHNvIGFsc28gaWdub3JlIEd1QyBpbml0IGZh
aWx1cmVzIGluIGlndF9ydW5uZXIuDQo+ID4gKwkgKi8NCj4gPiArCWlmIChmdW5jdGlvbl9pc19w
YXJ0X29mX2d1YyhmdW5jdGlvbl9uYW1lKSkgew0KPiA+ICsJCXN0cmNhdChyZWdleCwgInxHVFsw
LTlhLWZBLUZdKjogR3VDIGluaXQgZmFpbGVkIHdpdGggLUVOT01FTSIpOw0KPiA+ICsJCXN0cmNh
dChyZWdleCwgInxHVFswLTlhLWZBLUZdKjogRmFpbGVkIHRvIGluaXRpYWxpemUgdUMgLi1FTk9N
RU0iKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZ3RfZW1pdF9pZ25vcmVfZG1lc2dfcmVnZXgo
cmVnZXgpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAvKg0KPiA+ICAgKiBUaGUgaW5qZWN0YWJsZSBm
aWxlIHJlcXVpcmVzIENPTkZJR19GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT04gaW4ga2VybmVsLg0K
PiA+ICAgKi8NCj4gPiBAQCAtMTUyLDYgKzE3Niw3IEBAIGluamVjdF9mYXVsdF9wcm9iZShpbnQg
ZmQsIGNoYXIgcGNpX3Nsb3RbXSwgY29uc3QgY2hhciBmdW5jdGlvbl9uYW1lW10pDQo+ID4gIAlp
Z3RfaW5mbygiSW5qZWN0aW5nIGVycm9yIFwiJXNcIiAoJWQpIGluIGZ1bmN0aW9uIFwiJXNcIlxu
IiwNCj4gPiAgCQkgc3RyZXJyb3IoLUlOSkVDVF9FUlJOTyksIElOSkVDVF9FUlJOTywgZnVuY3Rp
b25fbmFtZSk7DQo+ID4gIA0KPiA+ICsJaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmdW5jdGlvbl9u
YW1lKTsNCj4gPiAgCWluamVjdGlvbl9saXN0X2RvKElOSkVDVElPTl9MSVNUX0FERCwgZnVuY3Rp
b25fbmFtZSk7DQo+ID4gIAlzZXRfcmV0dmFsKGZ1bmN0aW9uX25hbWUsIElOSkVDVF9FUlJOTyk7
DQo+ID4gIAl4ZV9zeXNmc19kcml2ZXJfZG8oZmQsIHBjaV9zbG90LCBYRV9TWVNGU19EUklWRVJf
VFJZX0JJTkQpOw0KPiA+IEBAIC0xODQsNiArMjA5LDcgQEAgdm1fY3JlYXRlX2ZhaWwoaW50IGZk
LCBjb25zdCBjaGFyIGZ1bmN0aW9uX25hbWVbXSwgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiA+ICB7
DQo+ID4gIAlpZ3RfYXNzZXJ0X2VxKHNpbXBsZV92bV9jcmVhdGUoZmQsIGZsYWdzKSwgMCk7DQo+
ID4gIA0KPiA+ICsJaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmdW5jdGlvbl9uYW1lKTsNCj4gPiAg
CWluamVjdGlvbl9saXN0X2RvKElOSkVDVElPTl9MSVNUX0FERCwgZnVuY3Rpb25fbmFtZSk7DQo+
ID4gIAlzZXRfcmV0dmFsKGZ1bmN0aW9uX25hbWUsIElOSkVDVF9FUlJOTyk7DQo+ID4gIAlpZ3Rf
YXNzZXJ0KHNpbXBsZV92bV9jcmVhdGUoZmQsIGZsYWdzKSAhPSAwKTsNCj4gPiBAQCAtMjQzLDYg
KzI2OSw3IEBAIHZtX2JpbmRfZmFpbChpbnQgZmQsIGNvbnN0IGNoYXIgZnVuY3Rpb25fbmFtZVtd
KQ0KPiA+ICANCj4gPiAgCWlndF9hc3NlcnRfZXEoc2ltcGxlX3ZtX2JpbmQoZmQsIHZtKSwgMCk7
DQo+ID4gIA0KPiA+ICsJaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmdW5jdGlvbl9uYW1lKTsNCj4g
PiAgCWluamVjdGlvbl9saXN0X2RvKElOSkVDVElPTl9MSVNUX0FERCwgZnVuY3Rpb25fbmFtZSk7
DQo+ID4gIAlzZXRfcmV0dmFsKGZ1bmN0aW9uX25hbWUsIElOSkVDVF9FUlJOTyk7DQo+ID4gIAlp
Z3RfYXNzZXJ0KHNpbXBsZV92bV9iaW5kKGZkLCB2bSkgIT0gMCk7DQo+ID4gLS0gDQo+ID4gMi40
My4wDQo+ID4gDQo+IA0K

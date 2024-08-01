Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FDCC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 07:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3147910E8A4;
	Thu,  1 Aug 2024 07:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ej+Vx1+K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC7610E8A4
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722497027; x=1754033027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dikhun8RwPpuuA6lJ292Rrs4Ijy+sbGoMjGKDKPFccg=;
 b=Ej+Vx1+KVZi28WVCMNvaJPWTlqnxWmI1dZBTOAtcEnZHoqZfy9tJqigr
 xVN/BXsGht9OdrsSVITL+TANYqWxCe0SEhVXZfNTRVBNQ4qofQtnga2nn
 h1QQWLmVkmlhOzcqhBK30uHcEe8f2ZCvc4KeM5e1whk7dhgEvQom4lVyP
 qQ0Z3OZFhC6MaUKaG/z9wejX7/S9DgCrQEViM/8pQjUYihg1VAPdCSjwL
 UR0IjpSTynZT5g+TYSBjPFM1igySPT2fgGNo31AyG4Mn/7GzGSMhlEHGO
 B8D6WJpefUE5Bgwrmc+SfkpCRxflZI/9fJklN2lKXWpKNMq0e0z8DFGJH w==;
X-CSE-ConnectionGUID: a9MvxBbsTmySpNSz/hQ7vg==
X-CSE-MsgGUID: uY1k3Z+GRsOFUIiiwiRUvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24195041"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="24195041"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 00:23:46 -0700
X-CSE-ConnectionGUID: 4WHTzuMORv21i1PYOjJGjg==
X-CSE-MsgGUID: yhbe5i3nQ/GIMVSqGAevZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="59264963"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 00:23:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 00:23:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 00:23:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 00:23:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvz7uBKlWubQFfTr/cllK5+qjOSvmWIFTdyaMRogB32yALM8A1U570Jqxxftzwa/7WFvKeZczuA3dWIcDrgq0hzQc6g8I9vFFh2gzCIMmXk10LNlJZWtevB1xgOYkYTu2/hHJ0lfcI6lNKQ094CNJ/g/Hc4S4T922Rr/8aWzrHn0ZTskPh6aolO+J5dlSggQN+L4gWegtUyXtTuQzBcKzT5eMshqNHCJ3t3V0hTxqcJv47f1BrkfaXZsJjJLz4HYuFbUFv6n2R+W20bhS29XqWCLU6fCSn4IqSzlcPfJDpsqiqOxIMU+NGxZaXve2IELQXPrHqGu/uk7wHHiZzVSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dikhun8RwPpuuA6lJ292Rrs4Ijy+sbGoMjGKDKPFccg=;
 b=YlhMGRD6fFwoPfVPo2faBxP4DPYw17VlnJnOFMMThUXEBZXOHRPA8Ntzt46pQ+nS+KcNrABfipHPsIAkm76YyHILv1HehfNXYZ/VgorIemsZB8CmYRUblUlIzFVKWfgXSP9cEmjrH5SnPZerN+I44qqQm0XKaAMT1da1sjH/9HYCdRN334/wcSkSOgvH2TVyRXd8WhZxmv3nkfGrJQVERaDoaRGL+8hhg5075Uz+5me2ssrg29nUnkrOyVAzpHrp6OO7f+D7WM1lV8avM6aBU3qItEiVB4eqxN8pSe5RP3LOXenO5dBkoab3ihUlzeNd4DdNboF9YLgNiU/y2FxNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH8PR11MB6754.namprd11.prod.outlook.com (2603:10b6:510:1c9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.27; Thu, 1 Aug 2024 07:23:43 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 07:23:43 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 45/66] tests/xe_exec_sip: Add nodebug test cases
Thread-Topic: [PATCH i-g-t v2 45/66] tests/xe_exec_sip: Add nodebug test cases
Thread-Index: AQHa4nZ8RkkFXnv4g06XgrjLW2RYcbISAnoA
Date: Thu, 1 Aug 2024 07:23:43 +0000
Message-ID: <DS0PR11MB7264632DEB43EA97C575B0C8D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-46-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-46-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH8PR11MB6754:EE_
x-ms-office365-filtering-correlation-id: 1920dcf7-6ad5-486c-699c-08dcb1fadfdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b1d1cFRYbWpLYlZud2NIdzdhZnlJZFFvL3NUMUxSQUYrVU9GWjIxNVdJN3Vj?=
 =?utf-8?B?ZlRDeFRiUmh0d25FMCtTMUtaam9FSC9WdmZkSWJmdGYrYmlnZW56TWdwUkZi?=
 =?utf-8?B?UWgzQm1XN2FJSzZyU2IxQ1Z0N1B4Znh4UmtjUHkzTUhZTVE5di9Yb3RQVjJ6?=
 =?utf-8?B?SExjeEpzdzlxdml2VFJQVE43ZCtXa21ERTh1MVF1K3pNSVVyY1Q3RW5hcGo3?=
 =?utf-8?B?QzRBTHFnTnBkMFlNRmtzVkJ3bUVqUVlLSnd2TmRkOFRqdC9icTFYUWQ0TlNm?=
 =?utf-8?B?SzNENXl3ODNQanlZakIrK0pRMVljTFNSSEtKa3VKS2ZpVWtxamZnK1ZhRWFZ?=
 =?utf-8?B?eWNZOTFUQ2pINmhxejdob2ZsNGtHRXlPd1JvNGFwYnNMbUdobkxQR3VvVGVE?=
 =?utf-8?B?emM0MkJzSUV2ZnY0Yjk1Ym52NnkydjhHN21pTklONERUU0N6eFhuekNnZFhB?=
 =?utf-8?B?L0lMZnErWlZPT0FqYjNTbDBvNGp0WVJ3L0FOWS85cFJPOGRpVEZPdVE3eDZB?=
 =?utf-8?B?UFlPZU9sL0hCMkxVYlJoODVEQ0oya1dsWjRaSGVpVGxNOFZqVlZSL3dFYWsy?=
 =?utf-8?B?K1lvQjVuamdVV3ZldkJ5Y2RsYUd0L3Y2bXhSMVlBdWdkWW16aHNpUW4zbHRI?=
 =?utf-8?B?VFNmSDNySzUrRDdwcTRTd1VkUjUvQW9udUV0UzAxYXdQaXJua0ZacHFnZjBB?=
 =?utf-8?B?bkF1bnRCVEdxRkNwcXBvaUY5ckpJRWpFZmNqUThheTVBdUkvYlRJL2pFZW9T?=
 =?utf-8?B?dkp0U3B6UTN2d1pDbXU1YlJjTzVidUNjM2VSWDl6ODFZQmhZU20yM1J0VTlk?=
 =?utf-8?B?QnBoRWh4eVlXR05FTzZyRTQxQU1tbXNtMytJSWJ2QzEySXRUb1NEbWpHWTlz?=
 =?utf-8?B?MzJBSURVdUFVMjVxTWl1NkRpbWdsTUx1ZGpTS0JwUk92ODhydGliMXk3R1du?=
 =?utf-8?B?MjZPL05ZRDUwdUp4L3dYa0djM1VBVXJNb0p4ODYwVnBGdGtWTEw1RWw0Qk1K?=
 =?utf-8?B?ZTM0bjJGZkUwT2lubW9IckVaWjhUbUxYSDR2aU56bE45QW50NDFqMlpqTnpP?=
 =?utf-8?B?NTZkdWJERnBjeFVsZDlFdERWOXZuTTJHODIvWXZqNWFKV0NKdTB6OXM2MHQ2?=
 =?utf-8?B?SG1PMTJ2M1IyaUcydXpYQzgvcmZnQUk5WnlNOWh3dHFTZTVUclBxSnVwYlRJ?=
 =?utf-8?B?RWdwS0pWU256aFNhOFh2YVN5MEZ0UDJHOEdmMzQyaTJaRHUxZTlWMml5eVJG?=
 =?utf-8?B?NDJYNHBNWDUwZklwejFScjZrNlVOYWM0bEVWM1RDRTBVTnZVV3pmUlQ0TTY5?=
 =?utf-8?B?a2t4N29nS2N6OXdTK1hSQ2xUenk4R0pIYmp6akNISlJCdzhqY2tCd29JWksw?=
 =?utf-8?B?NjN4a0YzY1RsN2hGKzBsYWl6cjllNVRLcDB0dzgzQ3ZHbXR3aXZCOXpkZDJO?=
 =?utf-8?B?K0VQWkwra1NvSnZOcU51Nm8rSGdKMHRDWmZwM1djUGNROHJuN01tVDhJREFN?=
 =?utf-8?B?N3lxVWhqY3ZmdTBxd0FjZUhpNERPZ3A2UkwyRU9aWnhONHQzUjlhay82R2Z0?=
 =?utf-8?B?RWJrYzIzVFRNdS9jQlpER1VBLzNBdi9ZYlNUMWNHcmFMam1tT1lCbm9jNTFp?=
 =?utf-8?B?bWJtLy81emtNZmsrS3FFa1hkeUxaa3NubUJEVHlpS1BjaHhOMjFTaW9YbWJD?=
 =?utf-8?B?R0ZLS25YTkxnK2c3dXBoVDhsaTdoRkJLdFNIeXdxdFdDVy9wdVpTcVhaS3Q5?=
 =?utf-8?B?SCsyUGFwWGRlcDFyNUN2bW9MbjhRTkMrRmZGaCtLQ1ZDK2lid2ZuZklBeE5o?=
 =?utf-8?B?UytaMW1TRjAwY055UXpqbDhLd0xkQlQ3K0NKOXdwKzhOaDgvb2liNWhxZlZE?=
 =?utf-8?B?aGlITHczS2ZDdm1sZTZ5b0xJSEt0UWRUTzg1NS9Ram9oSmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1NYTUljQWluOGRxaUZFYkxVZzZpMzJ2c0liZ3VvVXJaTFR5clhUbHdJeEhC?=
 =?utf-8?B?WXMwUCtjaDBaT1JYN1l3OVhRM2RXeThDSTFsMVRJNDFseUtEQ2UrbFFYQ2E0?=
 =?utf-8?B?SjNWN0JpNkFBQ1M3Q09ORjBoR3YrbVl0THlYSmxQVkFRSXVJeTNmdmZsMERt?=
 =?utf-8?B?aVNyWktWeDYyNmdkL3BIZkV0SGVMdEl2Z1dZUmlidVJaQUIwUFhZY240MTNQ?=
 =?utf-8?B?SGFQelpEYnpEYWl0WmFSeTgvbmpLYVdOUWVlclA2THVtb2dRcmxmSFA3dHBn?=
 =?utf-8?B?U0FUby9kZmt3ZzdaZVA1c3hCRFMwNHI2bWJUelc4Snh4YVNweXZ1L0VuZlly?=
 =?utf-8?B?WXhveXQybThOS0dQUFBJUm94NEMvV3JQWEVhUUpKWTcxMUNEcUZCVS9uMG5Y?=
 =?utf-8?B?RzNwSS8rQ0xxSGlTZ3NnWU9BRkV1MHd3NklUVittbG5DS1ZDcHZCYmhveFRa?=
 =?utf-8?B?M1IxbVJLaDVuNWJ4WjBnV3JNSnoyYTdqODVTcUlDVm5ETllZOWlXUmNjWEwr?=
 =?utf-8?B?YlpuZXZRL3pUZHpyeHRtZW9tQytGbTlTdU5vazVhendFOGdYclVubnRqUzMv?=
 =?utf-8?B?N0g3cy91dEIrU1BOVGhJWEYvU2M0QUZ5ZU4rekdUOENSRVZYdTNzN2VJSThV?=
 =?utf-8?B?Y3A3VVVpYlJpSFdaNGQvWTI4S3dsQzRTZ2llQ1YyUmIvWVZ3a0hvdUJEdG1y?=
 =?utf-8?B?SU1iWjZNaHZLZWpLeDdKNmZsVktqQnRCbHZudFNHUWN0K1lsaldWMFRvZERY?=
 =?utf-8?B?anUxK3VsOTE0bmMxekk1N2J2UlhUREtES1VZeTNaM1FiM0VheXRHdUZjLy9q?=
 =?utf-8?B?SGJ6OFgxa29XNGYxWk9vQWhnUGtablJLV1ZoV05PRzVGdXNIOTlhT1J3Sm1y?=
 =?utf-8?B?MHVFa0ZkVWNIZUtFUWFBRzU1WnovNUVTaTJOajljT2IwSmhXcVpNRHFpQlBx?=
 =?utf-8?B?RTB1cjl2WDFFaW9sTWJCRnBMVlozNkJnUWdtQjNyaHVFczN1MHZONU1nMURO?=
 =?utf-8?B?S21HazlwVjFSSjlhQUVNZzZQYyt3cW04YXBxam1rRjZZRWlBeURvNUF2VU1V?=
 =?utf-8?B?YVl5WlpJaGZIaGQ0Z3h4NXVKdjRpajNzbVJQeDNOTWpaZzBINUpWTUh0RGJj?=
 =?utf-8?B?MDFWcXpNRnRmVmhMKzgxMzh3VDY1SGlKYmllVWV3ek9KZGNrcXZtc2NwQ21Z?=
 =?utf-8?B?NkNZbTRLK3plZTNoUlNGcHFIZG9id1dibjlNaTk2ZzN3L3pqc2lxanNqOFJX?=
 =?utf-8?B?eU4rNDNYNDJ5ZzcxMU5IRkZDWFdWcUtYWTQrRnN3WDJIMVc0QmlxQ3Q1dnVm?=
 =?utf-8?B?STBuRFc5RktuMTdiNWxsdWIvMHVhM0x2U3hlL3Y3ZWY3Y0tlY1NaRitGeWhp?=
 =?utf-8?B?WmRONitNNTBML0VRaGhEVHZXOTF1enhQSUVjWWxkWCt4U3RRdlZqRW9ZVWlQ?=
 =?utf-8?B?OUZIdytmNlhaT3A0UGdETkFUR1dRNW9oU1lvY2VPQ0M5MjNnVjdxR09sYWwx?=
 =?utf-8?B?My90KzlsYTZ4Sm85YXhjN1J1ek40dkxXSmM0c1FhT0FKdGM2aXh3Z1k0anRR?=
 =?utf-8?B?NUg1dmdvd3k4RW9ORi9Lb2hoV3kvU2NNdE55QVplaTJUNU1lY2RKdTdkczdL?=
 =?utf-8?B?NTJobHNUZk9Zb0hkd2RRSUk0ay95eXV5a0ZXRE9sVVpXbVpDQkVGeWw3M01G?=
 =?utf-8?B?cit2a201Z3lXbFRvZ051K3oxVU5XVEZCWHFhYk9QUjRtZjJXS3hqYmN1TXY1?=
 =?utf-8?B?ejV2TzlQOEUzeWdpdDlZdnhKS1c3ZEFjYVA0c3pmbVZTc0xzZVRIOTdHWTZm?=
 =?utf-8?B?NVUwaDBNTFd1RTNoTGRDQUhRaHJPdEwvV2tzdjNuUXBRWXBqSGtkUHBueEw1?=
 =?utf-8?B?UlZ4d1N1b2QrTnkyWVR1QStrUEJieklUTVp4Z2EzWG1SdnFKZ1hVRG5LZklv?=
 =?utf-8?B?Vks2Q25uT3htYXlEcUpjMTRjNFE2cFBvcjlwUDNFeENiWFczcEFFSTQ4ZUVG?=
 =?utf-8?B?T3AwRW84ZXA1enVZT3UwUDk3bkRlNnV5a2E4bUpRSHpsd1dQQTRvNm9qMWM2?=
 =?utf-8?B?SWVJUEQ2elNFMmdtd0JuYlhIcGpScnZ2WnF6b21TenpVeGQ0L1lkQWM2R2xu?=
 =?utf-8?B?dG1sYmZwUEZhV2dFNHRKVGFMQVJzZ1M5TFRBek1zWjdHeHRDTW5jb0pnMjh4?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1920dcf7-6ad5-486c-699c-08dcb1fadfdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 07:23:43.5286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbrhA4X23N2pHl4NHwInF406stQyv+HRf0LiewAley/Mnugvubc0gMyKhPMwG/ihpuQjIKMeGt4eRgU5mu1EAT5Hc5gET51ypSlzfZJ3bmcTxKIE4cQNKfWf3NDpt38e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6754
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+
DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMzAsIDIwMjQgMTo0NSBQTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgS2FtaWwNCj4gS29uaWVjem55IDxrYW1pbC5rb25p
ZWN6bnlAbGludXguaW50ZWwuY29tPjsgR3J6ZWdvcnplaywgRG9taW5paw0KPiA8ZG9taW5pay5n
cnplZ29yemVrQGludGVsLmNvbT47IFBhdGVsY3p5aywgTWFjaWVqDQo+IDxtYWNpZWoucGF0ZWxj
enlrQGludGVsLmNvbT47IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wNCj4gPGRvbWluaWsua2Fy
b2wucGlhdGtvd3NraUBpbnRlbC5jb20+OyBTaWtvcmEsIFBhd2VsDQo+IDxwYXdlbC5zaWtvcmFA
aW50ZWwuY29tPjsgSGFqZGEsIEFuZHJ6ZWogPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsNCj4g
S29sYW51cGFrYSBOYXZlZW5hIDxrb2xhbnVwYWthLm5hdmVlbmFAaW50ZWwuY29tPjsgS3VvcHBh
bGEsIE1pa2ENCj4gPG1pa2Eua3VvcHBhbGFAaW50ZWwuY29tPjsgTXVuLCBHd2FuLWd5ZW9uZyA8
Z3dhbi0NCj4gZ3llb25nLm11bkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2
MiA0NS82Nl0gdGVzdHMveGVfZXhlY19zaXA6IEFkZCBub2RlYnVnIHRlc3QgY2FzZXMNCj4gDQo+
IEZyb206IEthcm9saW5hIFN0b2xhcmVrIDxrYXJvbGluYS5zdG9sYXJla0BpbnRlbC5jb20+DQo+
IA0KPiBJbnRyb2R1Y2UgdGVzdHMgdGhhdCBtYWtlIHN1cmUgd2UgZG9uJ3QgZW50ZXIgU0lQIHdo
ZW4gZGVidWdnaW5nIGlzIGRpc2FibGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2Fyb2xpbmEg
U3RvbGFyZWsgPGthcm9saW5hLnN0b2xhcmVrQGludGVsLmNvbT4NCj4gQ2M6IERvbWluaWsgS2Fy
b2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgdGVzdHMvaW50ZWwveGVfZXhlY19zaXAuYyB8IDcgKysrKysrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hl
X2V4ZWNfc2lwLmMgYi90ZXN0cy9pbnRlbC94ZV9leGVjX3NpcC5jIGluZGV4DQo+IGEyN2QzY2Jh
Ni4uMzVkNjViY2M0IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX3NpcC5jDQo+
ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc2lwLmMNCj4gQEAgLTI4NSw2ICsyODUsMTAgQEAg
eGVfc3lzZnNfZ2V0X2pvYl90aW1lb3V0X21zKGludCBmZCwgc3RydWN0DQo+IGRybV94ZV9lbmdp
bmVfY2xhc3NfaW5zdGFuY2UgKmVjaSkNCj4gICAqIFNVQlRFU1Q6IHdhaXQtd3JpdGVzaXAtbm9k
ZWJ1Zw0KPiAgICogRGVzY3JpcHRpb246IHZlcmlmeSB0aGF0IHdlIGRvbid0IGVudGVyIFNJUCBh
ZnRlciB3YWl0IHdpdGggZGVidWdnaW5nDQo+IGRpc2FibGVkLg0KPiAgICoNCj4gKyAqIFNVQlRF
U1Q6IGJyZWFrcG9pbnQtd3JpdGVzaXAtbm9kZWJ1Zw0KPiArICogRGVzY3JpcHRpb246IHZlcmlm
eSB0aGF0IHdlIGRvbid0IGVudGVyIFNJUCBhZnRlciBoaXR0aW5nIGJyZWFrcG9pbnQgaW4gc2hh
ZGVyDQo+ICsgKgkJd2hlbiBkZWJ1Z2dpbmcgaXMgZGlzYWJsZWQuDQo+ICsgKg0KPiAgICogU1VC
VEVTVDogYnJlYWtwb2ludC13cml0ZXNpcA0KPiAgICogRGVzY3JpcHRpb246IFRlc3QgdGhhdCB3
ZSBlbnRlciBTSVAgYWZ0ZXIgaGl0dGluZyBicmVha3BvaW50IGluIHNoYWRlci4NCj4gICAqDQo+
IEBAIC0zOTIsNiArMzk2LDkgQEAgaWd0X21haW4NCj4gIAkJdGVzdF9yZW5kZXJfYW5kX2NvbXB1
dGUoIndhaXQtd3JpdGVzaXAtbm9kZWJ1ZyIsIGZkLCBlY2kpDQo+ICAJCQl0ZXN0X3NpcChTSEFE
RVJfV0FJVCwgU0lQX1dSSVRFLCBlY2ksIDApOw0KPiANCj4gKwkJdGVzdF9yZW5kZXJfYW5kX2Nv
bXB1dGUoImJyZWFrcG9pbnQtd3JpdGVzaXAtbm9kZWJ1ZyIsDQo+IGZkLCBlY2kpDQo+ICsJCQl0
ZXN0X3NpcChTSEFERVJfQlJFQUtQT0lOVCwgU0lQX1dSSVRFLCBlY2ksIDApOw0KPiArDQo+ICAJ
CWlndF9maXh0dXJlDQo+ICAJCQl4ZV9ldWRlYnVnX2VuYWJsZShmZCwgd2FzX2VuYWJsZWQpOw0K
PiAgCX0NCj4gLS0NCj4gMi4zNC4xDQoNCg==

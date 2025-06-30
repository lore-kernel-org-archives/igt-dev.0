Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A166BC8302B
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 15:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A4810E447;
	Mon, 30 Jun 2025 15:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhSOFx3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E9610E447
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751296544; x=1782832544;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sgFnPxDPwbjGWWZhRzJ5MBt+HSUbAK8uDC6lmV8JwM8=;
 b=MhSOFx3WCoETgZJfcysamdMpTbvijowMLrxYFlMgKFOzBiqTfHjycmsF
 haurxxeJsB5XMPjt7GHVN03Shgaxf8DktBz45d4qkBWd5na9XH6gguGrg
 jGljfpinaHNixNN3PPe4P4TuMZmLOfXUz1ozpz6ztN+6yUkcTkFwz31c+
 23esJfujuci7BeiAfXvJMccSzQn9lfaqDOsP+dQ6X8S8OR2UT7JMaDIZY
 UfMHKoVrffVi9y0qAOeZt6r+aYjbcb421/6Xo1+U0zxn+bDM4ejY1aGC/
 5Izp0c+W+Icule5JDg/DIsfNUrXe7GLvi6/IotaSFF3KTWCupd7ZSEcz7 A==;
X-CSE-ConnectionGUID: 4a+cJWTIR06fDHBupGkX+g==
X-CSE-MsgGUID: rQ2pd6rTQq+lwFCG961reQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="56147705"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="56147705"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 08:15:44 -0700
X-CSE-ConnectionGUID: qQixPPHiT6CM2Nb+YL4SaQ==
X-CSE-MsgGUID: lkuv5cJ3Q12OvWkKHodWVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="152966233"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 08:15:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 08:15:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 08:15:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.69)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 08:15:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOq9EiSq2+TAjWtwzLrGf+EgahdHdes0QaXSHKsHoax1AX8kkIDhO4EN5XiQy3kCWzWcJz2ab1DSs/PDvL3cUmwxbn4DvmnXOyTXAE6ygujY4eQ8UfER/8SGMcbn2anbKOWfCABRhCiATpghldwzhwxMWGbmjjyzS5N9HdVOrNhgKeFLcJYvzZdVKlUqZ2R1MJmLSCP69rg0GhEJwVSL048Meaygz3FtIEOcYYmY+JAUO0DaXgxD5lsufuzpTP13sAerocoM62onBR1AyhsV6gnNa2jiADSM4BqV64nRnEYlu5DZ4pfxgQBvyJAOU8Q/AkpALMMhTIIpi1mhqy5vpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgFnPxDPwbjGWWZhRzJ5MBt+HSUbAK8uDC6lmV8JwM8=;
 b=SxnFCxl9j6wI3tNtWVLyNbWoRoXMAowuk5SIkMfogjMelHGOx7KJz4JzRw3Td/ljID0YCau6fSUpaEBC6lIvQ1MQRt6/ppt2rlWQQav3KWPtSr5iQcX//MARKcqjRostBSkzu3S0l0O1sahVCSKpcA0nREH0PtKLWqZvzh7D6A6bzzExB9Z2CJDOakQC/k9h2WpzeTvFDWrLH0BJiWISdJg7hy8kHduWM2yYUf7y2PNBGc+8KtefoAX+J6Oxa6/qFeph6z3Uq7aQo4Nef3CaMRTAd8TdvJ7DKjAVaou+tS6CM0vZBQO9qFf+Y+AKqoL5rU6jnKqgGdXYdgkVYEiZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB8572.namprd11.prod.outlook.com (2603:10b6:510:30a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 15:15:40 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 15:15:39 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "david.e.box@linux.intel.com"
 <david.e.box@linux.intel.com>
Subject: RE: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
Thread-Topic: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
Thread-Index: AQHb56T5+ptjFnBidU6gEj+vu5M6obQbpgQAgAAuIvA=
Date: Mon, 30 Jun 2025 15:15:39 +0000
Message-ID: <IA1PR11MB6418FF5F0C05F6C4F4178F9DC146A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250627204846.521691-1-michael.j.ruhl@intel.com>
 <20250630122942.n3u5vsttysdknkxp@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250630122942.n3u5vsttysdknkxp@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB8572:EE_
x-ms-office365-filtering-correlation-id: b4e7598b-fe0b-49dd-1e36-08ddb7e8f94c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZjJhbWQ2SDh3ZXk3NE1hSk5EY0p3azZGdEpnM0tDWW9rSDZ3VkxQNDQ3YVI1?=
 =?utf-8?B?WGdzTWthemUwbC95VG1FeXFGb3dSQkRYRGh3Q0ZDQUdDc2dMWjI4NFNMdWNS?=
 =?utf-8?B?VURJeSszbXl4VU1xbTFiMlB1Yi9FUzNKWGhVUmc4UEpPb2kxWFc0ZFEvOExS?=
 =?utf-8?B?K1BwdFhnaXFLUzFBRW1xU045TGVrZ1NScWdNc3dLL1EwUGpmMU9NRXR5WEJ6?=
 =?utf-8?B?Q05zRmZUbkFQbWhJTXBrQy8rcEgrRGZYMzdzZzBZYTdxRGU2cThobXI1aCs0?=
 =?utf-8?B?TnhsdzY1aVFVeExnSytKZDVDeTl4U2Zhbkkvb2l2bzBDSXBsRzZFK2JBOHdW?=
 =?utf-8?B?Ulo5dnhSamo2TjdidmdRRC9Bc2cxNi9wTWFvZVdtbnRoYVRmRmoweXJJZzI1?=
 =?utf-8?B?VTJkUXRTTUdqM1dLNUZnWHBSWGdPOGVIdk5Tek5EWGNYK1RTRmtGSDFaRnNk?=
 =?utf-8?B?M3ZWaEx4ckpKU1l0YmxsWVZiTzZwbk1PV3BBbVpBMjBHampCRCtzNEhmblhG?=
 =?utf-8?B?blVuRE9xQ0dYR1RDZklWL1VXeU5MWDNscTlOckgySlc2SCtEL0pReHhrTm1I?=
 =?utf-8?B?c2V4SkVSUFZMbWVtZHNSOFF5YXZ3WXJPYjBOVlVBYzE4S0tpeUkvM1ZGUGE4?=
 =?utf-8?B?TVhmMWpqc3VFbWx1TGZDbCsycGs5SUQ3R1VxRk5YUHhibkdNYkJHVC9IQ1hV?=
 =?utf-8?B?VlNzYkd2Z0xWazh3aXJ2blNTM1JQTzV1bEkxYTRtblJLRG1FQ1JydVRFZitl?=
 =?utf-8?B?d3JNblpOQTJtcnNEWElEOWQwa1pRZU1uaWVqWW1lY0dCbFd2bVJpU0daWVpO?=
 =?utf-8?B?bzBuZGd1NjQ4cHZmbTNaclBkS09jbC9weURwOTRBT0NxdkVHSHZFSHdRZ1RC?=
 =?utf-8?B?NjhsdWluVFY3UW1XeG9YelVOSTNzTmxFNUZjZWkvbUZCTTdnVk5uT0NvQ0NN?=
 =?utf-8?B?WGhialY4cnR0NS9SenErM0dVdzJ4NGVETFNQSDh4QUJKK00zdEpUUUwwbXRP?=
 =?utf-8?B?cUFsS1VnWkVQR3Vpb1JQc0NiYkhRbitiRnJwVUxVcTBIWDhsUGVITlB4b24w?=
 =?utf-8?B?cGVwUVA5cStJT2tRbHJocS9ZOVVmdk5LeVI1K3BxU1BLbmxDS1JXa2dFcmJa?=
 =?utf-8?B?WjdaSGhiTkFyVmN6d3AvdGl2V3Q2MHQ2aGtxZEpJOElVUmJ2S2k4cFRkdGIw?=
 =?utf-8?B?NDFxSXN0cHQvU0pnckdVMkdBV3FhM093MTBmajhxUDFweW9oTkxCSnVwUVZR?=
 =?utf-8?B?eXRkdzZkYncxMzl6ZkEydlIxRnhaV1RUbXBVYmo1bHNtcmdDOVB1NUo2TXBN?=
 =?utf-8?B?VjNSMWM4bWR4UktZSy91YnZ3Q0ZIU1lUUGo0TW5BOVo0VldhZkxEZ1htajNL?=
 =?utf-8?B?a1paSzNoTXNJbGY0U01EZmNYU0hQanlJT0VtOU9CS0FaUk9vQjhuVlpTVjgr?=
 =?utf-8?B?Zis4MTdtYUFrUnVkQUFCdjVtT0ZVMWNOU0t5ZGNRenM2N29wRGRTb0NEOWFu?=
 =?utf-8?B?WUZWWE9Kb1JXYzc0SmpyQzJnakNzK3IwYTZTSHllRHhUelYxaG5abHhqMUps?=
 =?utf-8?B?Q0t5azllU0hXdnkxTHZiYzFOeGY2N3U5RXNJdTNYcm1abTU5QzdnSTkwaS9I?=
 =?utf-8?B?UGV1enhGSitjbHNFOThiRkwvMWdGcitTeXZhVFFOb29IT3JVdFNqb2tKY1JF?=
 =?utf-8?B?cW1UeTYwcy9iZ1RDejlLZE81V1dIdzZyTVBzSG4zcVIvOWZVT1NrSlRtR29C?=
 =?utf-8?B?a2ZVaW1TbTZzTndiRlc5YjJicngrdWdBazl3WGYxdUx1enNmSkFXb2pCMU9U?=
 =?utf-8?B?VGpOVGUremJiOFRtWG9CVGV2c0lxdU1QazhDNWFOTlBLbkJUTmlObnRYb050?=
 =?utf-8?B?c1RNRlZuN3pwTnlRd01MbU5WVVdBVURydW12QnZ6SmUrOXpST2F0V3BzYkVo?=
 =?utf-8?B?Wmx5TG1OSXAvUmhabk4zdE5mNzVqSDV3TjJRR0x4NFJ3SGlNRXpuaklnZmhS?=
 =?utf-8?B?MUswNHo2VS9BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWdiYkhjTGZsTWdtRVVsc2wyelJNeUMvbTV5Q3FJaGNaMXBjVzRZYk9XVjNB?=
 =?utf-8?B?RGZ5M3pGZnRJOFVCNyt6cjhtZVNBbjQxb01WUE53Yks0bGtXTWNPSjQyU2tC?=
 =?utf-8?B?bkZqdnkyUCtKQnZOUzB5eExtS1BpNk96V3o4SGpNNFVtQ1BiZkFtTzUraDli?=
 =?utf-8?B?MXRVK0lCVE9Kb2hsdWkwZVRpZ0JpQ3Z4SW81MWEzSnhBWWZGUzI1UWM0K2pr?=
 =?utf-8?B?elZIOER6a1RwanFZVTBGbXhOZS9zSjBkVGZvYUVzRmdJeEhqRGRkR3BIRXVw?=
 =?utf-8?B?QmNQMWpzOFdFcm1DUDhnTWRKNnlaRGRIUWt4eUsxNmpnNnlVRFE2TTNod2RR?=
 =?utf-8?B?ZllRd0h4SWZ4L25ESWV1eDFBYy94bnNCNEVjSnV6RHNLREs1bVlVd1hZVEhG?=
 =?utf-8?B?WDlwY3Z0UlBHK1VHaVVjUml5MjQrbGZudVlKb1lqdnRqVUFHQ3RFd0ZqZTY4?=
 =?utf-8?B?aThnamRKVnhLMEladjNYUWFxdHlxVktwTGFDcE5jL3poMGN5OEFNb0xIZFJD?=
 =?utf-8?B?eHJxK3MvRkxMY2JENllCVUI1N0ZUWW5CTU5yem5IMGEzNGRlaWc4eC9XN2w0?=
 =?utf-8?B?bGtHb09GelpvWWV3VVFOZW14dkF0Tmp4d0ZJR1E5Z2JYdXh0YXk0Rk1LSTVo?=
 =?utf-8?B?YjF0SmFpNGgzTytSMFFtSzRRWFZ4eVdXNEFpZGZyYzV1NU9TK0dWWkJKNndN?=
 =?utf-8?B?U25GRVJ4d2k4Wi9wNFkyQk8xVndQbnhrcmM3RFAxbVNYTGxkdWpJZERTdC9K?=
 =?utf-8?B?b2w3cVZKZ0hna1NzWUlCYzhFUGU0bDhZWjRUY0tETVFnZlAyUjJWWjh6WHN6?=
 =?utf-8?B?WjZla1NBM1REVlN6NnJsZ202dkhrbGxZT1FRRnl0NTNEMXFWZmx6VUVtWitL?=
 =?utf-8?B?RFJYa05KUGFvU3lZdGRmKzBublhpOVdFWG9ZVjVENnVxUGhWYVFsS1Q3dmU0?=
 =?utf-8?B?WVlwemZjZHFHbGQvM2NXOHBZOTRiSkRMb0QzemRXL0E4N01kckZRMDdYbVEy?=
 =?utf-8?B?WGFEK2FCOXUrQXQrQ0hsdkw1UkVNekEvMlVKbTNLWVpBbUNjbE1DYnFhZE5s?=
 =?utf-8?B?a2EzcDJuaWhXOFovS25NYm9XMSsrSmVmd0IvQ0lxNEV4SFZVUWRQaDZRNHpS?=
 =?utf-8?B?bkJEVGYrNk9LemdqYjFKSCtyY0YzaXJ6bUFQcU5reVBxNndtbWdkRVA1ejdq?=
 =?utf-8?B?bXVLa0FubENySThrbHR2aVRxUTdjb291UXZiREhJL1VWOUIvcWxqYVVCV1Ju?=
 =?utf-8?B?NlFuc1JlWHFIZDhJVHZGUHZRb1JRSVpEQzBVTk0xZGpwTG0xdUlaalJtVmdi?=
 =?utf-8?B?cGs4NDdsd3BHenpJYW5VTkZYM3p6NnFURFhhNk94WnErLzFKVTAwRXVHRnFa?=
 =?utf-8?B?cEt0MkR4V0Z1bnVHRDh3emhOcENnSFRRMkxqa0xscEFwVDQ5ZTg4L3Y0cW1W?=
 =?utf-8?B?T25GbTJ5aE1oSkxtd1FYcGVIMmNyUXRQZGZiY3FsbHl1S3kxUmV0dTVNaUNp?=
 =?utf-8?B?Y0lxNkVlT1d6Z0tsWW1FWUNudWZoUE03Qko3cEpDdEtJVWUyby9NWmhsaFRy?=
 =?utf-8?B?Nm9ybHNSQVNmVFRCM0JqTDRTc1ZUS3UzdnlIYTV0WURGcjNSVmFRQ1BXeUpt?=
 =?utf-8?B?SVpiNW9pQ0JIOEhTVWdlWlBFNFE1SlYza3hFY0J5MkFyUlhrS21xVGw2MkFY?=
 =?utf-8?B?NGtUSllDYkdUNWZKMU41QXZCRUtNZG0yRkU5VHBWbjVYSVIxNzhZQUY0Y0Vh?=
 =?utf-8?B?NmwrM2JXaUVEVEFoQWw2UzhBdmxvTThxZUtBY1ppSnJXbWZSK1Y4MnJtZGtJ?=
 =?utf-8?B?djZ6cDdDR0dvU293TFk1NFZtMnIvMCtZbGU5SFRHRDRkR25BSXZyRzVZNzdt?=
 =?utf-8?B?cW1IeHZvWWM0QmFjNnlqTEpmWVNqQ1NBWEhDd1paUm4zTHpUMmZLZXM3SDBC?=
 =?utf-8?B?NSsxeEFJcUpoYytOekFWeTFKaDZReHJsbjdIQi9jMzQrNnZJL3B3SExYQ2Nw?=
 =?utf-8?B?MUJsb2N4cUtLOGdGVHVyTklOc3JMWG9ISUxURkF5a1Z5NFFQajFheHNtTGZZ?=
 =?utf-8?B?SjMvaGwrYm5xcmhDclVjOGJjYmFVYzFINFU4R0J5RXNRaUd3b1gxemFOa0JW?=
 =?utf-8?Q?rmY3BAAM3rf3wOejazmWDURW/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e7598b-fe0b-49dd-1e36-08ddb7e8f94c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 15:15:39.9213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANvCiIRwAyJYaMsKoTEjtQQz5em2Hj3C/dSgqChmya2fGpdK6p7g2Gh9vPev8Jj+VfRMIk2nyM2GeOnFZhBQKElwhLlHVVhF8Zaj//9zCvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8572
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1p
bC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPlNlbnQ6IE1vbmRheSwgSnVuZSAzMCwgMjAy
NSA4OjMwIEFNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29t
Pg0KPkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGUgTWFyY2hpLCBMdWNhcw0K
PjxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPjsNCj5kYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb20NCj5TdWJqZWN0OiBSZTog
W1BBVENIXSB0ZXN0L2ludGVsL3hlX3BtdDogQWRkIHRlc3RpbmcgZm9yIEJNRyBjcmFzaGxvZw0K
Pg0KPkhpIE1pY2hhZWwsDQo+T24gMjAyNS0wNi0yNyBhdCAxNjo0ODo0MiAtMDQwMCwgTWljaGFl
bCBKLiBSdWhsIHdyb3RlOg0KPj4gVGhlIEJNRyBkZXZpY2VzIGhhcyB0aGUgUE1UIGNyYXNobG9n
IGZlYXR1cmUuIElmIHRoZSBkZXZpY2VzIHByZXNlbnQNCj4+IGlzIGEgQk1HLCB0ZXN0IFBNVCBh
cGkuDQo+Pg0KPj4gTk9URTogdGhlIHRlc3Rpbmcgb3JkZXIgaXMgbm90IGZsZXhpYmxlIGFuZCBt
dXN0IGJlIGRvbmUgaW4NCj4+IHRoZSBjdXJyZW50bHkgc3BlY2lmaWVkIG9yZGVyLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29t
Pg0KPj4gLS0tDQo+PiAgdGVzdHMvaW50ZWwveGVfcG10LmMgfCA1NjENCj4rKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgdGVzdHMvbWVzb24uYnVpbGQgICAg
fCAgIDEgKw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgNTYyIGluc2VydGlvbnMoKykNCj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgdGVzdHMvaW50ZWwveGVfcG10LmMNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
dGVzdHMvaW50ZWwveGVfcG10LmMgYi90ZXN0cy9pbnRlbC94ZV9wbXQuYw0KPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMC4uMjFhMmU3NGU3DQo+PiAtLS0gL2Rldi9u
dWxsDQo+PiArKysgYi90ZXN0cy9pbnRlbC94ZV9wbXQuYw0KPj4gQEAgLTAsMCArMSw1NjEgQEAN
Cj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+PiArLyoNCj4+ICsgKiBDb3B5
cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4gKyAqLw0KPj4gKw0KPj4gKy8qKg0K
Pj4gKyAqIFRFU1Q6IFZlcmlmeSBCTUcgUE1UIGZpbGVzIG9wZXJhdGlvbnMNCj4NCj5JcyBpdCBQ
TVQgPT0gUGxhdGZvcm0gTW9uaXRvcmluZyBUZWNobm9sb2d5DQo+Pw0KDQpZZXMsIHRoaXMgaXMg
Y29ycmVjdC4gIEkgd2lsbCBtYWtlIHN1cmUgdG8gZXhwYW5kIHRvIHRoaXMgZm9yIHRoZSBuZXh0
IHZlcnNpb24uDQoNClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cyENCg0KTQ0KDQo+UmVnYXJk
cywNCj5LYW1pbA0KPg0KPi4uLmN1dC4uLg0K

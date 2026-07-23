Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033DCC531D4
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 14:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722BB10E5B7;
	Thu, 23 Jul 2026 14:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLjuALdk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E54110E331
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784817692; x=1816353692;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gEXyUjYNRhJw1KUl2n2Re18Vg7rt2crdKtyTAMTYWQs=;
 b=DLjuALdkVlcyJoqUQmjWjG/daf/02EKN0uXUROsdHzHoH5IOb6Nq1Weu
 yvEYiAJc06oQBM5RLHxFgdKrnYYu/j9bORs5tK+5pQty76xpBbmoAACAj
 NpXd0w+mruMRQoLJeXACZb3rguGM3QdYvdgKcfxogXwMDVlfRP2njfc6d
 6qChS0jRnwAaHh9zRbHomLotSX4e7z70iM3Fyi1Pp9Jups7M2ua5XFVeE
 1cZpsP23nGCTCEbL4eSKGVHQ2EB+pfJHPgpUc42yeA2OQhmzB6VSf/iMm
 T/xHkAARzlY/6AQ8gPSASFkNkGAEwU7TDAtmNWuwjCA7HzyLSozJzeg5m A==;
X-CSE-ConnectionGUID: 4NNBl8NIQiW12tMyJ/LmsQ==
X-CSE-MsgGUID: 58T1mUt+T7q4N2UUfrRNvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85564905"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85564905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:41:31 -0700
X-CSE-ConnectionGUID: we66MZ7tR7CEZmf/RFmO6w==
X-CSE-MsgGUID: wvgF5CJ1SdWQ0S81CLA9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="258500412"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:41:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 07:41:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 07:41:30 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 07:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCbs0lwIPYd5k1V3Ecr2CdOpFzcQFgacmvFG+c/Ab1NSkFtkZnY99MNgyLK7Zal0+LirgK/p6wiHfg/AnoXZLFXBROEpcfVY9eGg1q8os9NW8p6AMdCt1f9pwv0q2eWN6W4BfekZgXJJksmvBEmT2JcD+fJT9/KXjZ1hKcDfIruazb1wXvjcdxHo0knUWOgP6dkT3ugmqrb9ZMNQFp+RofAaCuogjLcgcbqfhcSJuriYdsJSwBcgabn3MWhLPpev7CRH6xS4eyQL5unQpTMdw/iqrbFWFvjuedZGfBLtzVRynC6vpWeYEGBS3kJ9mBg8xwzwbvukAviWb/sqSUhTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEXyUjYNRhJw1KUl2n2Re18Vg7rt2crdKtyTAMTYWQs=;
 b=mc+spQ/xL4+lf45k37aYd4WfZqW3V7nIubH1TOcUSX80Kp2e7VhFiSYkbKlnVtZdimmRooN9hgy5tcnf6FaT9ne3ARnuPwv+lBwbIyiJrHOYgSxX5kKigLfv09cdytiwGaO15VbDsmScbVvOBnnoD1+BbP20Vj5JrBJLhfT2myd5v6hfvuhOaXNuzFvyMoKO4eFICUOWjADUpZeA/G5noVx//ZXPnMjNU5aSo6N8uObsUgBdvRkIf9/PutNzrnabAKk7ZAJD+XjrJTdg4/A6vrBkNSSkZ2HaUEIA6kx5zpoRfjRhfdwkVF+71OLzkdJVFQO6xm9ksSyAzv5wT6F6CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by DM3PPFB266726CF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f46)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 14:41:29 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%7]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 14:41:28 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_threads: ignore expected hang
 timeout
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_threads: ignore expected hang
 timeout
Thread-Index: AQHdGku0XiK46bd4m0qEIovAQXi677Z7KakAgAACqsA=
Date: Thu, 23 Jul 2026 14:41:28 +0000
Message-ID: <CH0PR11MB556412533FD9663DA67D1C7B98C02@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260723023251.4522-1-himanshu.girotra@intel.com>
 <20260723142536.tygckacog3jdhqex@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260723142536.tygckacog3jdhqex@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|DM3PPFB266726CF:EE_
x-ms-office365-filtering-correlation-id: 3fedac6a-244e-4514-b958-08dee8c87b16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|4143699003|10067099003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 5ISGtCYcEvAZ3AaQ2lGRryajQ4nUWzGzsU8uhc8wbZFkSFNRM6Wbs4sM/D+nxDg8yrl9ds3eY97mOZ5W5SuRIlFU212+cy9YgPVJzgv8M/3PiVfZNZXLKPT1sRvqeZk0WqMKYZtzZXehp8a4Dw4jPCg+IhZDmoF9VzHyjgMMJBTnl8KKXLfq1VXETWLetuCZMc3OBOiIUcwdeRBzAFB8I/7QjvcKISKLgOOkzEw8NCazVGqv6RCzUSnjHbNv1H9jZEFl4F3AQM9dvulKp5rzwOk2ZjbsDMwqGaBFiBjJAzRCWWSoFixC3Yy1CtD1hzECJYc7JqEqfMRsnMon2sikEcXwQFkwWKvZ/lN5gMJ47qNrf1xGjNbhv8cnA0qXKvhWr4naElgTm7q5g5GuoJyilGgBbFNZrzJbP94RsJjnhzkgaS2ofOLsopYt2jf3mFbz/WxEPRVAWHXGj5YQwgxGAfDZfW4L2EncbKDlJIK55ewcvk2QtRPPhhJnrGa3nlFguVd5BHJKlZArYYW5RkxXWAloMrU7UfOzOjKBsvCAJ7iQcuUwHn0ud1RAwSBXyegQ0bdzNhHRpyVdhpegRt/l+7IpbKBwuTPhTsQa5StHwCT4jRa3r/rxbgl3LA1LSnYDv/lRC5eAC6mLPAlHYgPJSb/uESdxXo9E7JtkyEoY7m5GpJsBZkPw+uJ/5E1sX131zJa8SaIK81bOtyxAs9EukaMmYvmyTKuw3SbjCsV5yDs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnpZbE5uS0pqOXhLeU4zR3l0ZW02Vjg3aVYxYm56cnIzdm9QL1RuOXBXQWFF?=
 =?utf-8?B?am9MV0R6OFNxZy9YeFV3NU96WnBSSEhZYVJnUnhiblhEU2xEaVNYaXQ4UHpR?=
 =?utf-8?B?YzlLaithOE82ci9Ra25nbE5hd3Brb2dUckI0TmZseVUxelVyZ1NDdUpCbEFi?=
 =?utf-8?B?NmFUOFdkajI1UHYrcmVSOXpLdHF5RmUxaC9mT2hyTXNzQ1FhQlF1a0RPZG1l?=
 =?utf-8?B?RWpQNksydFphaW5tZW9JZXBxWitjNTBmTEFqODM3L3A5SXdwdnBvbU5La0JU?=
 =?utf-8?B?cGRXQ1VKenNZbDFzNmx6WXhoV0w2VkUwTkdLWEx6Z0tjcnhhODcyVU91L3Jh?=
 =?utf-8?B?aEVZZ1oxSlBZbHowYlVDUlRIRENNSjl0UE80aE0xRkZ0TVhzUkhmQlhsb0d3?=
 =?utf-8?B?T21MWHlsZ1BZaVY1c2FWd0hVWThBaGg0SmhKaWVXc1M3NFI4bzYwNlRVSDl3?=
 =?utf-8?B?NER3Q1dKSnpUMzdRNWNqbHV2b29Gdksxb0E3cldkenFoWGtnY2dtZzExb3h6?=
 =?utf-8?B?YWtSTm9CdG5reDNjQ3FuUkc3ck05UFM3d0tWMkg2aE5OazByaHF6Tlc1VkI1?=
 =?utf-8?B?UHp1MHhIK0MyQWpNWEdGUHh2UFYwUGhja25aajdzSjJtRkdNZFJ0a3lQOGwv?=
 =?utf-8?B?cEt1QkdoOEkrVmFqSjlMYjNwV3NnWkZINElnN0hJRTBldzllMWNlbE85cWdK?=
 =?utf-8?B?bVpBSzg3UkorTVYzbXphWXkwYmZ5N3VYanVDcmdKWk54Qm1GcmZxNHlqVHFi?=
 =?utf-8?B?UGcyVlUyVHRFU3RZT056a1IwMGh5a0dOVHJLbnZ2RTBlWGdzNHYrS2F1TEs5?=
 =?utf-8?B?eXBGUHlBWXdqajNFeDdiOWtmaEdYbG9rMGQyMXFQVHdVekFYMXh6cjA1SlVL?=
 =?utf-8?B?eXBzazB6MnR6WWV0LzB4VXFOd2ZPR3FjS3UvSkpWUlM0V0xRaXBuaU9xWm5o?=
 =?utf-8?B?c1dRWmppa1RTc3RoMWcyT2ZjeEFRMTVOeE9JcDFGMURIeVM5RkZNK1JWVmh6?=
 =?utf-8?B?VDZsV3Jmd1dvNnBmQWVCRkd1VlNhZnl3YmwyTGdJS2FtUWxyVTl3RkF2eTlT?=
 =?utf-8?B?bnBCQytzczJnYXRyc3c0cmt4MmViR2JJSDFFSUhXWElQeUdQRjI0S1FUVk16?=
 =?utf-8?B?WmwvRGZJMzdqUFJkbm4xRkM2YXllQ3gxVXNCYTk4UG9HSHhkdzdJYWRDSkFB?=
 =?utf-8?B?dnBxL1o3UEtOYmlYc0FRQk9qNFQzNHVlRWRKMmlSMzltQWQwMnY3d3BxbEhx?=
 =?utf-8?B?cTltWk1BVXpVQkQ5VERJV3VNNUNmQ1lLd2dvcjBCZ3VZVHFnR1RtclYzd0xC?=
 =?utf-8?B?eng1elMwNm4vSlpSWmM0dkVOM3hiSTlCcGlibGc2dFpIK3BQajE2VWs0NGx4?=
 =?utf-8?B?WkplSlVKWjhZMXZhWDJsZ3U4NEYxY3BBeDdCMlhzUjc2cDdrNnVqK3hMdVNn?=
 =?utf-8?B?RVVqQ1BKZ0NFb1hoNnhvZG15MElvZzJKUXhBOU0yTG4rd2JBdGtrTWZnUndz?=
 =?utf-8?B?dmN5U3RQMnJncThRNXZ1dnFiQVc5YUxqREc1cmYzWmNISTdjSlpONThyRGRK?=
 =?utf-8?B?a3pCaXhoRkltU3phMFBwaXBFa1AwR3pDNk5jTTJnODgrcG1tOFozNW9NQ09U?=
 =?utf-8?B?ZERlTE54REtDcmllYm9OZjNYWW5VS3BUd2ROOGpicEV0N216YWVpaHZFbUo3?=
 =?utf-8?B?WTdPWFVlZTBaQkNsMmlRcy9zWWxkYUl2Z1F1K1pEdVB0THRrZk9YZ0F5STJi?=
 =?utf-8?B?Y2VJYWpGeUZDRityaFArdHlrMjQyUmk1eTJEc1JabVQ3dHFoVWY3M3FFeXpu?=
 =?utf-8?B?V2RsNWFiOUM4R3hQL2RrUWNHSjhZbTAwNEx3bXMwUEZNb3p0Q1oyYmNPTFJB?=
 =?utf-8?B?NTVmWFpNbXV4djJEa3F0bWNaZVU3WW5aUExVcjY4VVJXaUFXUWZGekNMeDAx?=
 =?utf-8?B?TU9VcFZUejFUY0V5VUJHN2xGaUQzMklQb0ExbUZRWDNreWdleDZqMVh2VmVG?=
 =?utf-8?B?aGx0T3ZHdTlWY0F2amt6SGw5aDBUM20raDNvdjVVL29hOGV6RmN5MCtTeTda?=
 =?utf-8?B?WU9PN3ZmK3dZMUNRNC9INWVtNnhmeVhxbTR0OWFiMGVZUExPVmhVcG4zS0to?=
 =?utf-8?B?RmIrbFpVbWZKUUZLaW9PMCtzcWhUYTE5ajBiN0xoNmVMMUVDQnY1RnpxZ1FT?=
 =?utf-8?B?LzMvQUlmc0Q5eWs3Skl0UEVmYWtWSkE3azZTa2V4M2crM09tVVg0OFBqOExh?=
 =?utf-8?B?OWVLOTRDTlVVNm1CSSttd2NJbWxxS1RNdmZrQXdIbTJnSTlpNXlyaDk4YW80?=
 =?utf-8?B?eE1NeGRjQnBDb3BzaSsyQUhLL2UxcU9wbWY1elpoZThXZXlIK3plZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: efwESYS9rYni1vjnqGfmhd0MTuCWS/J9ZM7PpM2au8eXl/b3BkyffreGfGIZINew+aBjlfG1Ef3YYfec0xymLLyoz2DQ67a7w6OkgcN3aprCnQCDAcx3bbPg3om6K1KhdBrW4ahejKQ8obrdOMxbE02gvX9RsGj0u3gG9kB9JzOOAs/PU5HXbbw3j6RUFPZ8um28KFS29DW7Y3d0uLRbKUPDH+EvwU2oUnnpE5ddmZV5BuZlo/28AF64DJ0o4Ks42QVd8eeHt1bp2OlkNA7zhOTIYnAcWF+DYT0zMgomXixet0umwYnXscMk1BCKnPlVXDOrQvXlJYHawyLHCprvdQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fedac6a-244e-4514-b958-08dee8c87b16
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 14:41:28.9227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMtA54piUQN2DsZz/wRYmi2GSJ99HCW+QnwO41edRKykknsvWiWSIgxgCJJflPFgAfFx63rkhxfqHj1WA287RSlZsstvFroAa1B+8gBMwAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB266726CF
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAyMyBKdWx5IDIwMjYg
MTk6NTYNCj4gVG86IEdpcm90cmEsIEhpbWFuc2h1IDxoaW1hbnNodS5naXJvdHJhQGludGVsLmNv
bT4NCj4gQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBHYW5kaSwgUmFtYWRldmkN
Cj4gPHJhbWFkZXZpLmdhbmRpQGludGVsLmNvbT47IERhbmRhbXVkaSwgUHJpeWFua2ENCj4gPHBy
aXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+OyBLb25pZWN6bnksIEthbWlsDQo+IDxrYW1pbC5r
b25pZWN6bnlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSB0ZXN0cy9p
bnRlbC94ZV9leGVjX3RocmVhZHM6IGlnbm9yZSBleHBlY3RlZCBoYW5nDQo+IHRpbWVvdXQNCj4g
DQpIaSBLYW1pbCwNCg0KPiBIaSBIaW1hbnNodSwNCj4gT24gMjAyNi0wNy0yMyBhdCAwODowMjo1
MSArMDUzMCwgaGltYW5zaHUuZ2lyb3RyYUBpbnRlbC5jb20gd3JvdGU6DQo+ID4gRnJvbTogSGlt
YW5zaHUgR2lyb3RyYSA8aGltYW5zaHUuZ2lyb3RyYUBpbnRlbC5jb20+DQo+ID4NCj4gPiBUaGUg
aGFuZyBzdWJ0ZXN0cyBoYW5nIGEgcXVldWUgYW5kIHJlc2V0IHRvIHJlY292ZXIuIEpvYnMgdGhh
dCB3ZXJlDQo+ID4gcXVldWVkIGJ1dCBuZXZlciBzdGFydGVkIGFyZSBsb2dnZWQgYnkgdGhlIEtN
RCBhdCB3YXJuIGxldmVsIGFzICJDaGVjaw0KPiA+IGpvYiB0aW1lb3V0OiAuLi4gbm90IHN0YXJ0
ZWQiLg0KPiA+DQo+ID4gVGhpcyB3YXJuIGlzIGV4cGVjdGVkLCBidXQgQ0kgZmxhZ3Mgd2Fybi1s
ZXZlbCBkbWVzZyBsaW5lcyBhbmQgZmFpbHMNCj4gPiB0aGUgc3VidGVzdCBldmVuIHRob3VnaCBp
dCBwYXNzZXMuIFdoaXRlbGlzdCBpdCBmb3IgdGhlIGhhbmcgc3VidGVzdHMuDQo+IA0KPiBzL1do
aXRlbGlzdC9JZ25vcmUvDQo+IA0KPiA+DQo+ID4gdjI6IFJld29yayBkZXNjcmlwdGlvbiBhbmQg
Y29tbWVudCB0byBiZSBnZW5lcmljIChQcml5YW5rYSxLYW1pbCkNCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEhpbWFuc2h1IEdpcm90cmEgPGhpbWFuc2h1Lmdpcm90cmFAaW50ZWwuY29tPg0KPiA+
IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC94ZV9leGVjX3RocmVhZHMuYyB8IDEzICsrKysrKysrKysr
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV9leGVjX3RocmVhZHMuYw0KPiA+IGIvdGVzdHMvaW50ZWwv
eGVfZXhlY190aHJlYWRzLmMgaW5kZXggMDQ4MGRmNzc5Li4yOTc0ZmMzMTIgMTAwNjQ0DQo+ID4g
LS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPiArKysgYi90ZXN0cy9pbnRl
bC94ZV9leGVjX3RocmVhZHMuYw0KPiA+IEBAIC0xNDY4LDYgKzE0NjgsMTYgQEAgc3RhdGljIHZv
aWQgdGhyZWFkcyhpbnQgZmQsIGludCBmbGFncykNCj4gPiAgCXB0aHJlYWRfYmFycmllcl9kZXN0
cm95KCZiYXJyaWVyKTsNCj4gPiAgfQ0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIEhhbmcgc3VidGVz
dHMgcmVzZXQgdGhlIEdQVSB0byByZWNvdmVyLCBzbyBqb2JzIHRoYXQgbmV2ZXIgc3RhcnRlZA0K
PiA+ICthcmUNCj4gPiArICogbG9nZ2VkIGFzICJDaGVjayBqb2IgdGltZW91dDogLi4uIG5vdCBz
dGFydGVkIi4gVGhpcyB3YXJuIGlzDQo+ID4gK2V4cGVjdGVkOw0KPiA+ICsgKiB3aGl0ZWxpc3Qg
aXQgdG8gYXZvaWQgc3B1cmlvdXMgZG1lc2ctd2FybiBmYWlsdXJlcyBpbiBDSS4NCj4gDQo+IHMv
d2hpdGVsaXN0L2lnbm9yZS8NCj4gDQoNCndpbGwgY2hhbmdlIHdoaXRlbGlzdCB0byBpZ25vcmUN
Cj4gPiArICovDQo+ID4gK3N0YXRpYyB2b2lkIGlnbm9yZV9tdWx0aV9xdWV1ZV9oYW5nX3dhcm5p
bmdzX2luX2RtZXNnKHZvaWQpDQo+ID4gK3sNCj4gPiArCWlndF9lbWl0X2lnbm9yZV9kbWVzZ19y
ZWdleCgiQ2hlY2sgam9iIHRpbWVvdXQ6IC4qbm90IHN0YXJ0ZWQiKTsgfQ0KPiA+ICsNCj4gPiAg
aW50IGlndF9tYWluKCkNCj4gPiAgew0KPiA+ICAJY29uc3Qgc3RydWN0IHNlY3Rpb24gew0KPiA+
IEBAIC0xNzM1LDYgKzE3NDUsOSBAQCBpbnQgaWd0X21haW4oKQ0KPiA+ICAJCQkJaWd0X2Fzc2Vy
dCghKHMtPmZsYWdzICYgQkFMQU5DRVIpKTsNCj4gPiAgCQkJfQ0KPiA+DQo+ID4gKwkJCWlmICgo
cy0+ZmxhZ3MgJiBNVUxUSV9RVUVVRSkgJiYgKHMtPmZsYWdzICYgSEFORykpDQo+IA0KPiBXaHkg
bm90IHNpbXBsZXI6DQo+IAkJCWlmIChzLT5mbGFncyAmIChNVUxUSV9RVUVVRSB8IEhBTkcpKQ0K
DQpUaGUgcmVnZXggd2UncmUgc3VwcHJlc3NpbmcgaXMgb25seSBzZWVuIG9uIG11bHRpLXF1ZXVl
IGhhbmcgc3VidGVzdHMsIHdoZXJlYXMgcy0+ZmxhZ3MgJiAoTVVMVElfUVVFVUUgfCBIQU5HKSBp
cyBhbiBPUiDigJQgaXQgd291bGQgc2V0IGl0IHVwIGZvciBldmVyeSBtdWx0aS1xdWV1ZSBzdWJ0
ZXN0IGFuZCBldmVyeSBoYW5nIHN1YnRlc3QuIFdlIG5lZWQgYm90aCBmbGFncyB0b2dldGhlciwg
aGVuY2UgJiYuDQo+IA0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+ICsNCj4g
CWlnbm9yZV9tdWx0aV9xdWV1ZV9oYW5nX3dhcm5pbmdzX2luX2RtZXNnKCk7DQo+ID4gKw0KPiA+
ICAJCQl0aHJlYWRzKGZkLCBzLT5mbGFncyk7DQo+ID4gIAkJfQ0KPiA+ICAJfQ0KPiA+IC0tDQo+
ID4gMi41MC4xDQo+ID4NCg==

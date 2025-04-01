Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16BAC36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 10:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAA310E267;
	Tue,  1 Apr 2025 10:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqMldUUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5937510E267;
 Tue,  1 Apr 2025 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743503225; x=1775039225;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pj2xXnayxoIU27WPC26CbmKVDNov4o6XlR71tHIWKxU=;
 b=LqMldUUjkOzTGYGFJqv0Is3rDU1EioY4JtyeeTpoWy6KZTLwwu2WgR6i
 OFN3g8QNa8nIO0DpvkXGC4GJJ86LvNT6TBClpOzP4eB7ymajXUcaIt7yw
 jDraoy847wnoCDf0zTMyVYI+IHDVfQlXaqitQnP6Q0LhJWAW0vfWDoff4
 aASIAQAtbQLX6Ts/xQKsGtFGJV10thXMatG8Ekz4i65/HuHBcLIdKerxB
 oM4uaecBKcT5gaJDn2IQJMeY1fKp9DKm9lxeV988P4aepQNkQQ3jpxeoa
 j2xS4CvTNaYCs2c4VmZrhczYqv3tXHyh9U1Z4M10KL6go78xQPyoDK9ZI w==;
X-CSE-ConnectionGUID: OWMK0qP1TbSQSgHQLRJiBA==
X-CSE-MsgGUID: tTtr1GWpTdOG7FsVXeTivw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44711452"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44711452"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:27:04 -0700
X-CSE-ConnectionGUID: seGNux6NQ7y1oQv0jrwlfQ==
X-CSE-MsgGUID: kaF56JO+TkCOUGs9CaekKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131206111"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:27:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 03:27:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 03:27:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 03:27:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQVJFPvYye4kQoMSP9vG3HoXnMMlN9EBVS50ElMk5iKMsjm3+Q0g9TlWVh5ND89uAmlaVEtdUo+t+NhxgNi/eTOGdGB7jWdRrecth6r0EX3oULmM42Sv+mnLM+MF3aswaVPPsQtAsLGsrDBYAP7WYhww93sipAj+G4NTqD7nWqRbYmNCnBXtzF6pp8CUZoet9yT0ijU4AbLSPwKRIAZIFwsOSysxrvnBkRp5Uj2nXV929D5nS/oNPPILNldq2rFZfRFPE5xrUCbOuX1gzj1FcycYuIViYZrcCP+sL8wz5rChdhhOc/yG2rTBk7UCoDcnt68TfZe033DiViR5AIWXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj2xXnayxoIU27WPC26CbmKVDNov4o6XlR71tHIWKxU=;
 b=sSMafQNLlMoTozLi9X+8AqQSV26axJuOKWTm2legWEzymfjiIvkdJ3JZqXF7UvBtdSNxUj69PARZiuOXvNoQ3DXH3aGH7VZnngYloS6YOj0/fNp5gf4vi0dwJK2W4W6aDD764wevrP62iP/zEcqW00HbJ5j37ZntWI216xKAn5TfEqB/6c3QvIUNWb2NYk9Or8W5eHKXGLaA9vgRx9X7AIvdKITbIsge5Go9Zi/BtDkCuAW0XhBfuSpMycKZdOhlLUMgXRMLo1oPmXWSwFV6MY++gclq6YKFrJF4dcZYXrrpTVxBtrBkeaqLFvVK8aGmKq02ST/t1TJVzNSgZqOKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 10:26:20 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%3]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 10:26:20 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIG1hbi9sc2dwdTog?=
 =?utf-8?Q?Add_man_page_for_lsgpu_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgbWFuL2xzZ3B1OiBBZGQg?=
 =?utf-8?Q?man_page_for_lsgpu_(rev2)?=
Thread-Index: AQHbohk0jjkmXgsE7Ee4C3BA839wabOOnT5A
Date: Tue, 1 Apr 2025 10:26:20 +0000
Message-ID: <CH0PR11MB5491247F07307A4BD3974DF7EFAC2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250329143607.33723-1-peter.senna@linux.intel.com>
 <174326815482.18044.1216601178469823757@e6b6f09ec485>
 <42222756-d960-45ac-8378-e2129e09c668@linux.intel.com>
In-Reply-To: <42222756-d960-45ac-8378-e2129e09c668@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|IA0PR11MB8399:EE_
x-ms-office365-filtering-correlation-id: 4dcf9897-3470-44a7-6926-08dd7107a4ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|13003099007|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?TGdrZFo3d1gxWE9RditMQ0pMdHRHQjRmYjFwdlFlUkdkM1ZFandHb0FuVUtz?=
 =?utf-8?B?dXk2MXR3Z3owOTVVYU43dWtMYzY4SVZvWklRdGlOSU1XSFdNYWtpWm5yUHlw?=
 =?utf-8?B?MzZ2U0RJcEpyNVNOUEVsb2EvZkg2UFNBSkw2TGZTZ3NBTmhZaVJaM2Jtdk9P?=
 =?utf-8?B?bXZkdWh1bVlEaC9BL0VtVzUwV2ljQzJlWVU1YnJiandsUWMzQkltc0U5Nmtu?=
 =?utf-8?B?M3diQldLZzR6TFVSTUxWckEranBtWGgvaDJlcTd1MkQ2QTkrbzVVSjVVL053?=
 =?utf-8?B?dmlyOFJtbU1SL1pnb1RRZ1Nyb1daRW5uazdOM0txd25vbmdMSHJuZ1cyWTZ3?=
 =?utf-8?B?Yzl0OGY3SUszLzRMNE4vMDdpVlhqWmRSU0RHRjNUOUhoVk82TFFYOTRLdXox?=
 =?utf-8?B?aEc4RHRiU0NpTTNjTm9Qbkt6SEorYzc1RzdQUzA3UmVBVFplVExyS0x1alJC?=
 =?utf-8?B?MW10c3loSlBmTThiQXZkN1djTlA5MHdQSk1ZRjdqS0N2aXM5OERJemRsK2Ez?=
 =?utf-8?B?bDFtbU5ENFozMEhodkh1NmxsRkE5Q0JSV3lpdFJKUVZWeEZ4Qk9GUlFDV2NE?=
 =?utf-8?B?SE9scWh1ZVNuSWxwUVd6USsvZzYzd25jOUJEeVRTOTdqYjJzV2QrN2xYNS83?=
 =?utf-8?B?elUzcnU2QjNyQjBpTk92S2FFQlZYdDZsYUtUSURiSFJLamloaVlGbEhjTlJk?=
 =?utf-8?B?WDJMOGVqTi9waWVJMHB6bFlQRmtYVnFZS2ltYzFuL3hnVldXMzcxNmgxaEsx?=
 =?utf-8?B?RDZJQzQzZGd0T1U1Qm9RL2E4LzQ4SWszYTJnN1Y5Smh6TWowc09zQ3E3djgv?=
 =?utf-8?B?WW5KM3Q2Ri9CN1FQN29CZlNaM0xNYmQ5V3VWZkMvOGpiTDRkZTcvTTc3OTda?=
 =?utf-8?B?M0lxSWF2aGRwY0p6cXZPQ1grSzR3Zmx5V1o3SHU0UzdZRGRYN3NzdmgwdytB?=
 =?utf-8?B?MkNua0dXdWpZbGN1MVF0MUN3Vk8xbk9ZMG5tOVVjRkoxQ0hRZlNkYTIreGx0?=
 =?utf-8?B?WEdEMTVKOGE2RjB2Zmh1REZ3bTB5STZPMkNYVFFhaHZIRDc2ZWZjc1hYb1pQ?=
 =?utf-8?B?NVl4QnM0aU1zd1RVbVExMnRqTlgrNEFQb1hRdlIxQzJ3ZURhRFh4WEVmeHRr?=
 =?utf-8?B?RDRBNVBiZWwwNVlvN2RNYXlWUmtIQm8zWXhtd0tkUktFeFMyeS9YMmt2OVhk?=
 =?utf-8?B?Skl3T3QxMzFTZlJXc0ZydlpYS2ZOMG5yVDM2YVFraS8yMzJZSy9qVmRGc0ow?=
 =?utf-8?B?QUZQaERXUGhMRnJDZ0F3cCt3WWpnZ1NPVXdSb2JZUmV4aFM0TG9XUzYxeGdl?=
 =?utf-8?B?QXlkUmJLOXJFNG5NOWt5UlluM05hOFZwdHcxb2k0c1lQU0VGbjhDRWJUMHJV?=
 =?utf-8?B?T1hnOUxkeEUyZG5BMVNXYXJ2cktFbW0zZTJHVExwV3l0ZzdtSjg5R0J4WDZi?=
 =?utf-8?B?Z1FxMngycUVyUXFleFZzSHJCL1JIWFQ5QzhxZzNXejdraDBvdFNOODBvUU5a?=
 =?utf-8?B?NjUzNmE4YVc3RVdZNkRtbUtJQXN2djBZMFF0OUQzTWhhbVBzYldGckF3YytW?=
 =?utf-8?B?OG9jczZtdkhPY3J2V2RXVERyL3FpcWViSEgwalVGcjE0T0FZaVNTbzk2aFkr?=
 =?utf-8?B?Z1Y2aUt2Ti95S1JkaFlINUNrVzVRQmd4Z3ZXZ3BIdkUwMUR0MDFZNXErZzVQ?=
 =?utf-8?B?MnVQS3o2ZVBXWjJDV290WXdhNzZUcnNXSnlpU2d1Mjc2UktiV3A3L3NCRGhy?=
 =?utf-8?B?RnBuRisyYVRQbEpqM1p3RjdZWjk2eGg5MTNCcXdtTGZ6YmhQQ3BOdWhKeGl6?=
 =?utf-8?B?akVjU3VONWpUQXRmK1Z1Vnh5c0VzTjNhczNxUDFPWXFUay9qZSs0TXFJNmtn?=
 =?utf-8?B?Ykw5aVF2UktzTHBNam1NYjRTNWN4UG8va1U4OVlMcVE0RGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZS9pd3RIa1AvTktQcGlZZlMwWDF1WVEvZXFFNEZ6bmNXVFhiSnk5S1gvMVBU?=
 =?utf-8?B?Q2UvRXc4aGR3cERDR0dQdmpGZzBBMEtFSzRKQlpMNHdBRTJodkJGNUFpeG5F?=
 =?utf-8?B?aFZ5emdTb2MzZ1FtRFkyQnArQm9YdHI4YTVBMTBHLzdPM05HN1RiY3FzekFH?=
 =?utf-8?B?WXYzZkJUbW9jeTdoMW1MYmpZRnNtcjJaNE5ja2VtMGZadTZzTjNYd2ZId3I1?=
 =?utf-8?B?VHBreXRqS3lobkRaVHVoVWdzdE14SktRWEw1empSM01LVDdmK2pMK203M3ZK?=
 =?utf-8?B?RWdobTJBVW5lanhGVGowMjVXTlczUjVxMWY4OE5CVFdiYldKbGpGZ2xIUnd4?=
 =?utf-8?B?MzN5eXlkZG9BOEgxQXorZEtOcWRKMlM4bkZqdSt0WkkrZCszRWlyaU5MZnRi?=
 =?utf-8?B?RENmcHJLR1hranRzVWJWT0xielJobURGVi9jRjlHZUFtc0o0blM2T1BrTXVM?=
 =?utf-8?B?STY5NFRMZFVXbmpwbTJtTHMwMG5ObVNBdjRFNlBqdjZWSkxNN2pXSEJlZnN6?=
 =?utf-8?B?ME5odC9RRTIwd3lTYzdYQjZIaEhGSGNuUFpuYmYyUlVhMHY5UzBJMTNrTS9C?=
 =?utf-8?B?bklsaUU5M1RCTWJOSFdWUnpVVjV4MXYxK0FoemNOUGY0S2k0M3FrSGpiNFNa?=
 =?utf-8?B?cXhQaXpPOTFoY3dlWVE4OGdRUnErcWtrT1ltLzF2a2hnS0dXMEdsUXRDWS9i?=
 =?utf-8?B?NUNrWlM1ZkVKdWpFZUJYV2psZFRpWlE2dWlub09JTlhSam5uczRkV2dCUDJO?=
 =?utf-8?B?RDhuc0JsQXFJNnZMcFlLa2p6RFRSOXZsbzN5cW1DeXFjWGRMMWJWQmxIWlp4?=
 =?utf-8?B?Z21HTG9DZm1zZlBuOHdwWVg4RTVNbUk5cjhTQnpZQjREM0FkcHhweUpMYzhj?=
 =?utf-8?B?MllWSTQvdDkzd3RidzJpTzNDQVdXVE9hdDdvdFRqcVhmbFJadGtZN0kxd0VZ?=
 =?utf-8?B?ZEZOeXBiTStQTFFvY3czVGNtazEyZWp1b0hWWTBySk5ySmIra0dKeUJVdVJh?=
 =?utf-8?B?R1pGUFRqdXB1YnBYSldqVGNsRzRzTlZNZUtOeFpQa3JJNG0yRCtrRjRYNjJZ?=
 =?utf-8?B?K0ErNWVzY2FSbDBTM0ZZNDBpcTR0enh4SE1Rc0Z3cHBLVEd0UU8yRXRobUx4?=
 =?utf-8?B?VzlGam44Q0lJUEczMGtnVG82WWsxd1N0ZlZFZzVjeWROcjkySExuUGs3bzR2?=
 =?utf-8?B?Rjd1MnVPQ3NMVTlRSENmNWRGRmxQTGk2K0N0emRVMGtTZ01PMVZmaUFEbm92?=
 =?utf-8?B?a1FaK2RGN2ljazQrUEYyQktQNlMzc3FYZmduYTBLSXFPRWk1akFDZkd2d3Ax?=
 =?utf-8?B?dDJRV1pTeEhYN1NoY3FNK1ZEQ0ZjRGl3T200NFhXNWhCUERPRlpqa1AvTE1j?=
 =?utf-8?B?NHBFUzhQc0lCMHZQWjRGcVlIak0xb2U2UkdLakVnS3pNV1NxdmhMajlSL3d6?=
 =?utf-8?B?bzhLcnVLUWRYS2FnYW8xbXh4TFV0bE1WVkdMNmdYek1wNUFoVXVJdGJ0L093?=
 =?utf-8?B?TTA1WUhSMzNpZW5nL2VIOFVSZ2NZOW96aUZlN21hKzhDMUdndXlWdzhWVkJJ?=
 =?utf-8?B?Qi8weEpZU0pXT1p3TU42TkdXQ2lOaURLbVhkbituZi9jSURWcFZUcnovMXdi?=
 =?utf-8?B?TGdYa3hNQ0xzeVZoWDhaYmNJWDdhU0NJcy94aWxKaVlETG8xS29iRmtlWG8w?=
 =?utf-8?B?Z292dWFEcG5oU095UGlqTnpScUtlWjJKTFF4NlluTEk0R1laRWhUcktwWlE0?=
 =?utf-8?B?Y1JsWFlVU29vN1ZxT3BnS0xIeWlBR3lMdEdSYkJPNGhQSmwrY1dVTGp6MnJ2?=
 =?utf-8?B?NHRBY0VGd3hUTjhuZlI2YjNRZDVaV0M3cFl5MGNYZldybkRIS0lBaEZvdWM1?=
 =?utf-8?B?cU1MeHIwUlBnczFyR0h4S3ppNkxUNVYrclNTR3NjM0g3ekxWNG0vWnpQdldR?=
 =?utf-8?B?dFlnTWhBTkovNFY4UUdvRWM4V3NWckdBa0NGSi83VTBxL3JwNWZYb2MxNjNn?=
 =?utf-8?B?UDQvZ0JodmU3L2p2MDF1aktXOWVJU09EMTB0WWFZR0RSMXhCUTdKZlZhN0Vz?=
 =?utf-8?B?T2w5RlFGSE5qWEZ4bGxYS3prOUk4QjBHSk5GSUk5YWtDNnQ1OSs3a2ViZXRS?=
 =?utf-8?Q?dt25yg9D+vYA83uf4Vtd6Xkti?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcf9897-3470-44a7-6926-08dd7107a4ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 10:26:20.1783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SXd7zcwBJcLuTVuNlSUaDP7KwpbaUw/y4Wi9CgQdSzVuPo309Z4gziapEzrGOhQSjUgaVNbMPooUdBEXi+xBUM5Y+MAvvZP3uIYVHkE2Zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ2ODYwLyAt
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5GVUxMIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClJh
dmFsaS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEg
PGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
ZiBQZXRlciBTZW5uYSBUc2NodWRpbg0KU2VudDogMzEgTWFyY2ggMjAyNSAxNDoxNQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIG1hbi9s
c2dwdTogQWRkIG1hbiBwYWdlIGZvciBsc2dwdSAocmV2MikNCg0KRGVhciBJOTE1LA0KDQpPbiAz
LzI5LzIwMjUgNjowOSBQTSwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9
PQ0KPiANCj4gU2VyaWVzOiBtYW4vbHNncHU6IEFkZCBtYW4gcGFnZSBmb3IgbHNncHUgKHJldjIp
DQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDY4
NjAvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVn
IExvZyAtIGNoYW5nZXMgZnJvbSBDSV9EUk1fMTYzNDNfZnVsbCAtPiBJR1RQV18xMjg4NV9mdWxs
IA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAg
U2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTI4ODVfZnVsbCBhYnNv
bHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5
b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhl
IGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzEyODg1X2Z1bGwsIHBsZWFzZSBub3Rp
ZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRv
IGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNo
IHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJM
OiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjg4
NS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICgxMCAtPiAxMCkNCj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE5vIGNoYW5nZXMgaW4gcGFydGlj
aXBhdGluZyBob3N0cw0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2
ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTI4ODVfZnVsbDoNCj4gDQo+ICMjIyBJR1QgY2hh
bmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAq
IGlndEBpOTE1X3BtX3JwbUBzeXN0ZW0tc3VzcGVuZC1leGVjYnVmOg0KPiAgICAgLSBzaGFyZC1y
a2w6ICAgICAgICAgIE5PVFJVTiAtPiBbSU5DT01QTEVURV1bMV0NCj4gICAgWzFdOiANCj4gaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjg4NS9zaGFyZC1y
a2wtMy9pZ3RAaQ0KPiA5MTVfcG1fcnBtQHN5c3RlbS1zdXNwZW5kLWV4ZWNidWYuaHRtbA0KPiAN
Cj4gICAqIGlndEBwZXJmX3BtdUBpbnRlcnJ1cHRzOg0KPiAgICAgLSBzaGFyZC1ya2w6ICAgICAg
ICAgIE5PVFJVTiAtPiBbRkFJTF1bMl0NCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngt
Y2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjg4NS9zaGFyZC1ya2wtNy9pZ3RAcA0KPiBl
cmZfcG11QGludGVycnVwdHMuaHRtbA0KPiANCj4gICANCg0KVGhlc2UgYXJlIHVucmVsYXRlZCB0
byBteSBjaGFuZ2UuIFBsZWFzZSBmaXggYW5kIHJlLXJ1bi4NCg0KVGhhbmsgeW91LA0KDQpQZXRl
cg0K

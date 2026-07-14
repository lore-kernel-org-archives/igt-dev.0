Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B345C43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 10:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EAC10E048;
	Tue, 14 Jul 2026 10:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsR3mWVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6929110E048
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784023542; x=1815559542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vG1+ryEFJR3BuFIBZ8M0vm4e5e7xMcTUYfDDI7xWaio=;
 b=SsR3mWVG2ruDG2VPKXkJbc6zFv1dD1a1mazqVcAvzrFHI1bIApnbLQGG
 3faoHfr9jH+KMW69ryVyQlD0FKFaRJme+ufmu/OEs7x7kcFwALNhdYVIW
 Ly6NO+MRN+tAw4okLd2T01fprH2qaBhIeE9xK5T0mdZTuAy1l4rBBr9m4
 1PGYnmrjeDtvROyCDQZjWOfpJQt2YrR1udoBE+QqQL/Kp0r6Ugr6t7fOU
 DjJ9WQed67asGkbwC9b3+dC7/CwtwNpFpg7wpW+IvTQjTaUOo3NvHh/Tg
 yimjGulnMpOu79qK+dZNTX5dXx2fsHDWvYh+oWeI0EtShupkbZesr7Mff g==;
X-CSE-ConnectionGUID: 7kwoANBFSIO40GA8Dw2hdg==
X-CSE-MsgGUID: GJ7TSLT4TJWhLV/Ihcj4gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84421447"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="84421447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:05:40 -0700
X-CSE-ConnectionGUID: 035AMt9KSVSlRjIjCgIuBQ==
X-CSE-MsgGUID: m4ETPRSVS1yEj1kxyAQFUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="285891183"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:05:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 03:05:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 03:05:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 03:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Di+Vvm+P5FDllWrZfXX1bxYp+JEq9Rb3x/tVtVaSyLbK4CR8X5r5aXUE6HjvT3OvLOOzBZ+8Tsg8MFZOCndX1rgAJzmEtEs6HR/qMIWU3yYRUW8+fOD27SLoa0up4I3Q9u80Y23MXIPbEENxuZYTlDJt9ceDb/HioSRvVv6YigNFi/M4X0gBHlu1Hq600D3mF8Rw89OPI/gSOjsZipngQU0bKTZTPVrOvE710hC+4QgL9wkfZKOAb5NhJQmJLcsWQ1P6uQM7w2xT+fYzdHypzxVHFDODKU8iCES+OKsUgSJRtLLhUmLSpJ5uGQ06nUogTAHb7x4AVApdMVHJ689VZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vG1+ryEFJR3BuFIBZ8M0vm4e5e7xMcTUYfDDI7xWaio=;
 b=YksvIZE9HeV1XeLX5bqGQAE4HRX9SyYIRG6Y2At2GRO7TDUgU7pKp4b4j9q7Etie50dVWAKwI/f2oSsGHbr30zz4NaCjF7y4tNYacsDuBc2ChPrAJiXrfeppegv0pMtro8ujeAY61fxFEo985Uouhl5qwJ0crf0N4mJlG/YKG064Dz1JWnIL0zk6f2imJ2+WA4zePyyDWSDgGdMu0VCJTG1Ato6/XGxy3IyzSY7jtfAfz/Kbmbmg9IvPmcFBJyh+frBYhGO8GNCUpgeCro/iowZ5i3aMbjM4dVynDoqXFpDLUvLN6SS/pIxRlJO9SXj5FgE6PuGqGBvGK3UXFRy9AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by BY1PR11MB8053.namprd11.prod.outlook.com (2603:10b6:a03:525::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 10:05:37 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 10:05:37 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v1 11/16] tests/kms_sharpness_filter: fix typo
Thread-Topic: [PATCH i-g-t v1 11/16] tests/kms_sharpness_filter: fix typo
Thread-Index: AQHdEqXkrA+X/nY16UOeXuQWBCLEbrZsygaQ
Date: Tue, 14 Jul 2026 10:05:36 +0000
Message-ID: <IA1PR11MB64676CB561B2B43592CF229BE3F92@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-12-michal.grzelak@intel.com>
In-Reply-To: <20260713085515.463575-12-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|BY1PR11MB8053:EE_
x-ms-office365-filtering-correlation-id: fff9f37d-03af-4d05-0fe5-08dee18f73a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|4143699003|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 8b9aTlrLi8NoaC+Ene7/bgBDggDIkGA556O6ip6bCG03puRVyGUxhEd6/bemxrQpqDfbl1gMzEd3N9+6Jw+ulkAPKHIZzSUFx/bRDJBxhEPZ4tQYi472SsxNqA3Cr0ZqhUpvnU6TUs6m1ir9aNktHsvwW3IjpTCO9CNnz4HFtIZP6y0ly926qq7VKkOq03CsTk1uD1wtNuHa6sC8uFeXNwPHjiO2LK1cj/zArx7POkSEwXb+KGrR9hKoFTmsTxL4JogNnF0wzVJer3vFsCZliMdcFY3fmYzo1otNbWnsHlMLEA4eEBGUFxmX3kayENLXJiJSHFBhxEmoqOglPbCcf21aDV3eK8SP8A25O0/wFIGB0Up+Vr8utYGJEb6XujVe+w3VoEerJ2FLhuPwDkXLZiM2lTxMG29eX0F7/8fdEY4pWedroKR0n+w4BcOkYZz9cw+o9wC1EuQ/j4zQ/Ngk6EuxYEsac2idp7LNDZTrKZmmUKVf6OoZZSC1byPmLknhviBZPUjFNN7chmmeo2TKszviSFl2Fnjsj1dtQAgfLbfmUGqV2cFIJ6PLFUtpN3r2h0AGNREMHO+OJt9npAsMQsmgnlqRVJF0aTIpNHG5WysF7Ux+rkYaoGD/Y6ArS71Z1z8ZI4CiE48TmHt9skXATxGzjxkEnlUsjV2BziqsGZ6dfzreZpXDnO8H2OjoM8bpA/6h6rt121GpwacQKoRBB29d8fy8zqDNIJe5AES0864=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0NFOHQyUGVFSDNoQ2Zsb3FWWjBoMXo1QkFDRk93OG9SSHZUN0U3enNrcVRE?=
 =?utf-8?B?Q1JDWTZkcjdoa1pxOFlYTXQ2VEpYR2RFSERpaUU3SEFJKzhVNEZHZ05KbXpK?=
 =?utf-8?B?RDRZblpTWTQrSFl5eFlmNjFpWk9VTHNOQWN1NHhrRlRDdmxZMy9jQy9adyt5?=
 =?utf-8?B?NHQ2Z2kvZ1RMNnNuOSt3S3VsWlF1d0RJOWlZODVjbDBEd052OGR0UHFycXpn?=
 =?utf-8?B?S25WQ2UzWlZRRnJwWC9pOUsvTlJEeUdrUEZweUZHT2IrQy9vNlpvckxWS2ZQ?=
 =?utf-8?B?SEU2cEpHdm95dWlGYmMxQW90czh0MlVyUHhxRitwL1dHenlXYW9MelZuUS82?=
 =?utf-8?B?ZlFJU2QzaXlwNndxVUx0WnJLTXRpSENzekxiT20xQXlKdTJiaU5sdGZaWllE?=
 =?utf-8?B?YXlQQUNuYy9uRHVkRm84ZGlQQ2x4em81WHJaVytJQWRQSFZJVXp4aGFBZ2pL?=
 =?utf-8?B?a3VqMlA2dEl1bE1EQjNoNFp3LzVPSGZqRTBlMDdWRGs1czUxdnFBLzBPcjJT?=
 =?utf-8?B?U0tJK0dVc1NWVktHMTJ4Vm9zTkFLd3RUMXZlWnp3SXo2QUtlbDJzeHJFZHUr?=
 =?utf-8?B?K0w5LzJZdFJUUUlvdk9EVkIwaEhpTHp5RittcmlzWWd5NENCc0FkSTV6NUIv?=
 =?utf-8?B?ODZ5bkplemVlT0Q1eVJ2L2FMMyt6MzdQOGFPUGlGMTh4LzMrOWlzbHY5MzFJ?=
 =?utf-8?B?ZHliNFJrUWJEa1pxWjRWb3hOMzEwejFTWTBuRG1wclJwTUpJVXhZczlTVUdV?=
 =?utf-8?B?QUlNVEhsZVhMdlNwbjF5eFJyRHFCVlJUd0hUVUNKZDg4S1pBUGdOS2QwRXQv?=
 =?utf-8?B?N3RnZ0p1RExFQVJObWo2TnV0ZXk3aVREb0NCU0VHOVV6OEFSMDRNSXB6RzV0?=
 =?utf-8?B?dHc1bENuT3FWdTdVV0lXOHRGOVdnL1E5a2tsd2d5aituZFRYUUZXMTZpUVVo?=
 =?utf-8?B?TTVNR2tnYm14cjRyS2szQytCUkxRNTFHQXNMZmNVeW9LY1laaTNUQWR1aW9h?=
 =?utf-8?B?cnlrRGREVmtTN25wKzJQcG5vMVdVMjN6czZLa1FBTmxFQWl0SEEyc0lzK3Zu?=
 =?utf-8?B?dzN6SExDcU0reFFKWkp5YmVQenh4YmlRaVA3OVJZQVJOM2Z2eUQrR2tYMGJO?=
 =?utf-8?B?M25OM0ZTUzQ0bWNQc213dkZyY0szeHJuS3dDL1pEWHh1WFFRMGhRWk5Tcnpo?=
 =?utf-8?B?UjRqSnVidlhLY0tERmx0Ny9wYjZnZUtxb0NHNERGMjhFTzFIbGZwWTBlN1o2?=
 =?utf-8?B?bHdjNTJlcThlL3F3OXpoQXdyVTVkdkRKZEhsTzJ1Y1ExM2NqMG5wVWdnWmgz?=
 =?utf-8?B?Z2dmUWtSNVVRVnE0VTlKemJmN0xYcitCaHRGRm5XQ204OHZyY1psM0YwNytL?=
 =?utf-8?B?ckRqSklpZXd0U1hsMFl6RmZjWUZUMVNzcjY5bE0vQnk1S2dlZUFMYmhpSGY1?=
 =?utf-8?B?RytuYW5Pd2VNTXVlZGJNeGNnQnR5ZU1renpTVlJMVTViWDhtYmRlZE1NZmRn?=
 =?utf-8?B?TzZRS1JmVXcvcURGbFQ0Qm1JcFVqdFU2d0FGeUpTVWlxc0dCWGJkZSs4SzVi?=
 =?utf-8?B?ZjhIWHFmc3dFRitlSENlK0xwcFlKNWo4WkhMdWVqdjZiU2xPMHpmaTk1WSt0?=
 =?utf-8?B?elYrbDBuUDhvSU02KzBKeWtNOUlDeWIxejQ4OGNBck1NbWNxZmV0NEdoQ3Qr?=
 =?utf-8?B?aWNRNlF0UEJrUUlWdUJyMDVXRlBIRGlKengrK0JKSzhxcmc4cHFMQW5XM0Zy?=
 =?utf-8?B?bTRxS1Q4MFJKVVpMWkR5WFVJWjVzTXpjRm1IN0d2bGdnZXBReTFYZ2JFR3VU?=
 =?utf-8?B?ZTlQWmZ5RWFNdW9objRqZFJrNU45T3UwTGQ5MW9CcmxDMEhJa0ZUdFZhUVBh?=
 =?utf-8?B?YlZ2ODcyOXRoc3Zsa2IyeHEzYStQOUZaS3V3cWVYeDlkeHN1bkhrei9jaUpa?=
 =?utf-8?B?bm9UZno2WlExZFVGMEtESkY1TWhUbGwxdUduQmYzMVNKYnlQT1oxU3ltUUFI?=
 =?utf-8?B?b3JvQmxDbmIyRmRJSXlwUmlGaWI1bDIvMHVaR2trQnlnSWF2NzBFSkR2eXZn?=
 =?utf-8?B?UHZ3c0EyckNvLzU0Q242VDBSY1NhR2R5T2M2QkFveUVJazViZmVVcUgyVzRK?=
 =?utf-8?B?dEJlQ1BTNWRiM1Ftc1hYVysrSExhS1BxMWx3bHlLWjZQOCtkYURIeFg5aThZ?=
 =?utf-8?B?Q29pOHd3aXJvUEoxNWp6eWJJMEszR1AvTUlYS3VVUWpHS1pBdE5MMU0yQXpR?=
 =?utf-8?B?Q0IxSVY3cVlIWlhLQnRPYk1YL0V2aFZsbytib0RBTzhzbDBlZWROSHZzYkdS?=
 =?utf-8?B?eWxxK3E2ZGJSZ24zL3BDdHhYcGhHRmlpTlJFZlpLbDU2TStyWURJdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ccQj75nHTPv1Be1ouR/NS2fvuA6O8ZrCqNXhTeG+5F49Gccowm6qngPEX57uhOT0kn12tN/qgqvRv+3N7BwWHvLFhk1WYUtyc/8iM4UB3Cp+88YDMoYQz4/C+8nZpFX8IraER1VgPRWBhBWOyhtbkcYBQa3AB0P3j8imxkUgdiE7w/zRC7Ja2dz4GJnoQ55lcpHPQD5Df2UzmVKHJ4yOjuRVA9q7okGcMq7FW7ohCO6I5G5JzOYuAlrgWpc8+I/p51r3ZkRzKfKMJl8bWkwGp/zx62em5/gExH8K7QZF7AlVn6pLO/G4Pws9mhR6oroKW5Ua/mR3O9Zs38Z1KVskOQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff9f37d-03af-4d05-0fe5-08dee18f73a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 10:05:36.9537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1b3omsyOLdCR8nCYtbDmfDigiUTOx+9oIyr6xNjt3FcSIsekx81IjNtmRJljGRSY12ZXqvEfn7IUHMQ9SpdoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8053
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1pY2hhxYINCj4g
R3J6ZWxhaw0KPiBTZW50OiBNb25kYXksIEp1bHkgMTMsIDIwMjYgMjoyNSBQTQ0KPiBUbzogaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFRoYXNsZWVtLCBNb2hhbW1lZCA8bW9o
YW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPjsgR3J6ZWxhaywNCj4gTWljaGFsIDxtaWNoYWwuZ3J6
ZWxha0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MSAxMS8xNl0gdGVzdHMv
a21zX3NoYXJwbmVzc19maWx0ZXI6IGZpeCB0eXBvDQo+IA0KPiBSZWZlciB0byB0aGUgY29ubmVj
dG9yIGlmIGNvbm5lY3RvciBkb2VzIG5vdCBoYXZlIGFueSBzY2FsaW5nIG1vZGUuDQo+DQpIaSBN
aWNoYWwsDQpQbGVhc2UgY2hhbmdlIHRoZSBjb21taXQgbWVzc2FnZSBhcyBpdCBkb2VzbuKAmXQg
YWxpZ24gd2l0aCBoZWFkZXIuDQoNCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnplbGFrIDxt
aWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwva21zX3NoYXJw
bmVzc19maWx0ZXIuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19zaGFycG5l
c3NfZmlsdGVyLmMNCj4gYi90ZXN0cy9pbnRlbC9rbXNfc2hhcnBuZXNzX2ZpbHRlci5jDQo+IGlu
ZGV4IDhjNjA3MzY2OTEuLmYyZTNmYzk0OTQgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2tt
c19zaGFycG5lc3NfZmlsdGVyLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwva21zX3NoYXJwbmVzc19m
aWx0ZXIuYw0KPiBAQCAtNDU2LDcgKzQ1Niw3IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc2hhcnBuZXNz
X2ZpbHRlcihkYXRhX3QgKmRhdGEsIGVudW0NCj4gdGVzdF90eXBlIHR5cGUpDQo+ICAJaWd0X3Bs
YW5lX3NldF9mYihkYXRhLT5wbGFuZVswXSwgJmRhdGEtPmZiWzBdKTsNCj4gDQo+ICAJaWYgKHR5
cGUgPT0gVEVTVF9JTlZBTElEX0ZJTFRFUl9XSVRIX1NDQUxJTkdfTU9ERSkNCj4gLQkJaWd0X3Jl
cXVpcmVfZihoYXNfc2NhbGluZ19tb2RlKG91dHB1dCksICJObyBjb25uZWN0ZXINCj4gc2NhbGlu
ZyBtb2RlIGZvdW5kIG9uICVzXG4iLCBvdXRwdXQtPm5hbWUpOw0KPiArCQlpZ3RfcmVxdWlyZV9m
KGhhc19zY2FsaW5nX21vZGUob3V0cHV0KSwgIk5vIGNvbm5lY3Rvcg0KPiBzY2FsaW5nIG1vZGUg
Zm91bmQgb24gJXNcbiIsIG91dHB1dC0+bmFtZSk7DQo+IA0KPiAgCWlmICh0eXBlID09IFRFU1Rf
SU5WQUxJRF9GSUxURVJfV0lUSF9ORUFSRVNUX05FSUdIQk9SKQ0KPiAgCQlpZ3RfcmVxdWlyZV9m
KGlndF9jcnRjX2hhc19wcm9wKGRhdGEtPmNydGMsDQo+IElHVF9DUlRDX1NDQUxJTkdfRklMVEVS
KSwNCj4gLS0NCj4gMi40NS4yDQoNCg==

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71563C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 06:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E107B112F49;
	Wed,  6 Mar 2024 06:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E0rjdHsp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5935E112F45;
 Wed,  6 Mar 2024 06:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709706924; x=1741242924;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4gf2OAwTOFbOJfMd/QeL9q8yROrreypJZNQgi2xTTWo=;
 b=E0rjdHspu7+Ph/n0ooORII4Y9HHrtmfD9h9kvcVai0qeJx5tBQIleL/q
 3t+7ycMkT1UoxzzUPGWidXOXkMqfvJ91sNmgnKvCVsVxPaAXAPwC7TMWU
 X9XqmrORIQ5DWEabsAYUKuVAlHCiLPYNxyNYX0a8RxGa911CtKagUq/L+
 T/551HF/vnmf991m3OM2CIOdgPV9lzNhTZg7reu1ZHdmUHoHnesKSnWOR
 Hp4i8ONaIpUGuG3ogex6ds9wTF6Gv4wssVP6w4RIX4vxB2ZGNKcQ0YgKG
 wUPXhAEEvF24LuICR6Nss4BK5KaXiqiGeJK8MziEDfSu6kGcQS529j79M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4476141"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4476141"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 22:35:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9733974"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 22:35:23 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 22:35:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 22:35:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 22:35:22 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 22:35:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcOSW6g9tKQ58sfyufjin9biE/wWiziBsD57tge5CcCkmQQmzMHfhJQDPHY1xzV0bGERHoIF3wLZd7Cc9yS1MUMeQ4nmmSkC6WNNUZDUpQ89nSu9fpDaOujUgpOC4t34iJ/BA4aRD7LRtIqNJ9iIcTEhSr270aj+a0h01zJLOK26K4xy6eAosF5djHtuXMC+CL80dxEnwp/7KlYbdH2FSIGw8ER1BcHoLezHzm8p+RSKegFEwDFoxuXtibkbyJk10POj49r8JijH7zctgJyd3bnwQNK43X5pYCk6BYPzzFZ0W78O6T5cDv/yUKw7PaRado17s2v5mC2+jGzQgYAtpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gf2OAwTOFbOJfMd/QeL9q8yROrreypJZNQgi2xTTWo=;
 b=MH6ZJtAUIx/LtjUCwyskpyn8/wBIS2FaCvtIKEIWItZp4YRNRG6tVSq6mEOWqqh40n5aif+3LiK6pgR473vhkfUqTFGvmFqdOuzRuyUvKPZsjBGQO4W4FRyUOjFhplcu4rrNoo0/fegpkeSbk99EGJoXEjH1NkgrlGqOAIP+tqGRrGQ9GMc7gBzmVS8wjI9CCRbW3+oJKiHPYY6MScpgjmLQ5EQRJq0Nj7vs+DqxuzJiCLuzfeGsRJGRMXYMA0c0G+YgEMafbBSdtUPfcyEy1fPdPn67ZxdeetXZm/c1jUPpF3HEEblT79yY4MffKQMtv/XW4JmLcVsn2trJplEt8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 by SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 06:35:11 +0000
Received: from PH7PR11MB7073.namprd11.prod.outlook.com
 ([fe80::6424:214a:9ed9:864a]) by PH7PR11MB7073.namprd11.prod.outlook.com
 ([fe80::6424:214a:9ed9:864a%3]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 06:35:10 +0000
From: "Musial, Ewelina" <ewelina.musial@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>, LGCI Bug Filing
 <lgci.bug.filing@intel.com>, "Illipilli, TejasreeX"
 <tejasreex.illipilli@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsL2dl?=
 =?utf-8?B?bV9leGVjX2NhcHR1cmU6IENoZWNrIGZvciBwYXJ0aWFsIHJlZ2lzdGVyIGNh?=
 =?utf-8?Q?ptures_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2VtX2V4?=
 =?utf-8?B?ZWNfY2FwdHVyZTogQ2hlY2sgZm9yIHBhcnRpYWwgcmVnaXN0ZXIgY2FwdHVy?=
 =?utf-8?Q?es_(rev2)?=
Thread-Index: AQHabC17ZYO6pYW7sUSCHbL2ZOdZBrEpctMAgAAEwYCAANBZAA==
Date: Wed, 6 Mar 2024 06:35:10 +0000
Message-ID: <PH7PR11MB7073F81E83BDBC349214CF3893212@PH7PR11MB7073.namprd11.prod.outlook.com>
References: <20240229195522.2942946-1-John.C.Harrison@Intel.com>
 <170933449068.453612.2245101994274581916@8e613ede5ea5>
 <20240305175020.owfzmpn4frw2n7yy@kamilkon-desk.igk.intel.com>
 <52567ff5-e174-4842-bfda-304ef3f8066b@intel.com>
In-Reply-To: <52567ff5-e174-4842-bfda-304ef3f8066b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7073:EE_|SJ2PR11MB8401:EE_
x-ms-office365-filtering-correlation-id: 3d37ad20-09c2-47d7-d4a3-08dc3da7929b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o80XOKxDruj1hRLCjOZkZcgNMhircVZvyPgqPBcRSTBRrAQkahFVi8L3gkNO+UWOCnfh9+OHj87gk/KtUFKYdIBbgYHAbS/Dk0xJjgHuKJgsM2kZekU/SecKmE9uPcLP6TxafE+Me0Or2Bkq8qfKGzPxGCYdkATVG1CNfdqMsTNv1Nsnb05aLOV0LUPMPnKlqVFeVf/YNOjVNKx3ybK0M6W/WhOu4TSloRDZEhRmOXzRJVY7tPUJmsmlDef7z55qX6xxEE7YOMAWVioVYLzZmkr5SaoqR5EgL3duC9CVHbiB1vEOVYeYe1mpKhrYCCiuS45NTCVQKs+6SliGE+GH2Fx45pG3gcwyWmoInAHy5BN9ErJ7TFr4SWV2Pg033puims5dlxotaZUZn0Eq0XnFU1QCEQNEvbYd5ksFrU3O32UMmDfARFkvlwwhURANNvkCHvmr8IU5ZL0n5GAzWf+UlA3QWgKyfS5XcFknzi2jYjGsMRnFxoP1LsicqC8tuc1DUE1r9QNDSIN6n46RxitcwwaACGzpin67GoeyAq9OaToaqUH9TctbudDaQl2IBjDIt2eQo53NQN8UM00BFLCYHj9JK5IUTPvouSjg2pul+e31DyyEx5lzx+AvlYbOUewbYfhrAtaWAzcMdKMlMKSREeR2cLGYGm8nnnsIyGo1PIs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjBXVC9mVzZSVDFCMDF2cFJyK3d0YUtoMStoY0VUSld6UzV3eUVTOGtZV2dZ?=
 =?utf-8?B?TlhsaCtCbm5MNjg0TkFHa21rRHVrbXc3VzJ6YXpLZ3Z3TWRhNE5BVWpWWm1H?=
 =?utf-8?B?TFFqOFFlZC82QVp4SzU5ZS83bXNKS3RLVXBGNlpRMUwyaTF6Y2pJNHQrVG1x?=
 =?utf-8?B?dmc1S2JVNHppVS9hNm50NWFSaDFmYTZEKzQzUHowYnpQZlFmd0h6UjJHaDZv?=
 =?utf-8?B?WFppSlF5aUtUaWo5M3RnQmdudE14YVRVSm9IWGIxYXFkT0pJaWIwMFhyV0Vq?=
 =?utf-8?B?S1dCUmJEbEdaQ2tYdG9FVGRLSSsybEFsdjkrdlp4dThZb3BLVjFOQ0xQK0lp?=
 =?utf-8?B?MytabHMyUFpaMDFyL3VJUVBKZFZzK1lqY0tzb1Urc3I2K0l4N29KK2htbjhm?=
 =?utf-8?B?RnhOSmRKQTB0YUd1T0ovUFVyNWdDcVQ0NkY2eVhRRVhTZVZJMkJ3b3pNbGMv?=
 =?utf-8?B?MDUxcTVCdGZ5dXhVMndCZzYxNHBZNTZsV0FZVytpVGdERU52b3QvSDhkR1RG?=
 =?utf-8?B?cmswSzNVUXF2bDNTN2M1Tnk3RTA2ZG5aQzE1QU9rcFpwUS9JTlVKK2d3NXlL?=
 =?utf-8?B?U2xQb0FYbmxEL3EwWFNLZUY5cnBzYUhhamk4ZHpVZ0k4M3pKRjhHOVpFa0lU?=
 =?utf-8?B?K3BuVFJJQy9lbk9DS21lMSszTFptai8xUk9HaC9PYnIvVEx3Vkt5OXpxT2xF?=
 =?utf-8?B?bERSeVA1OVNIV3M3ZHhPcEhYNTZHdVVhOXlGb1phT1RLdW9vSzhyRE9WeXFB?=
 =?utf-8?B?MHJDdmhjUVRCNWpUR0Z0eDI4U1AvRmJhVVRPZWo2djBQOCtVL1J4cjNSSllW?=
 =?utf-8?B?UTBHS3l3VUZjMmd5QW9NdjFiY2ttazB3ektCb2VxQTJWWXpoNUs5Y29hNUJM?=
 =?utf-8?B?VnV3V3RLTEpmQy9KOXFMQWZpL3krTC8rck5kSG1uZkJaRys2c09qVE95OGRt?=
 =?utf-8?B?bXZiMkxXQVl5bEhOR09WQ280L2hmYXR2UmI4VS9YZDg4ejdDTm9VMzJHcGVV?=
 =?utf-8?B?UmxzNER2NXBVcE9XNE1tSWZ4azV1aEY5NXNGOGxqei8welYzeWNSUEthZ2Rx?=
 =?utf-8?B?aDU4MlV5Um0waWNsa1h2aFprb2JJbWE3azhmSVhIZjJONm95ZDc1MVkyZ0NE?=
 =?utf-8?B?aU1YQlAzTHVJbkdFbWtIVXA1TzF3Q0kzQjg4Rk04Ni9OSFB1WUVUV2J0enFk?=
 =?utf-8?B?Mmc4V2ZHa1VIb2FUKzl4a2g2Q3lqN1ZiYWl6YnJQTkF4QW96M1oxa3dMZXE1?=
 =?utf-8?B?SUx6RmtoaGJEMVpCcXQvS0JTSnFDTlp3SElObHNYTzB0TWJueXFyUkJDR2hw?=
 =?utf-8?B?K2RMcmhNUEE4NmdTZXpVT0ZiVXJHOUE0NUUvVDZFU1FoOVcwRUtQZEJod3Az?=
 =?utf-8?B?V3dYeHdxeG8vRW1hL1VscXFKUlY1TS9RcjEyUXE1Y1oxOHVlaWh4KytHODgw?=
 =?utf-8?B?WnQ0YVBjczBUU2J4b2JOMjlwV01LY25MQVBPWlBnY2hvRlZtd3pkZkhHUWxa?=
 =?utf-8?B?Z0VPdncybC9jUzM1Z0VIY0cvWjUwczBWR2RJb3ptSzFzYjR5WGFyeXhjTmhW?=
 =?utf-8?B?b1JBUnhkTGJxaEp2NUppai9HQVFTL3dUamxodGFmNXlBSTFtbkl2NkRIN0RR?=
 =?utf-8?B?d1pnMUQvQ1NiOG1kTjNrMk0rTmhiblpiMWdYUStrSmRJMzZ3NjA0QUYzMmlS?=
 =?utf-8?B?UXVGY0JoWWc3YmVGaUVZd2ZORStRc0ZNamhUUDQrczYrQkdpNkhjam8zeGs4?=
 =?utf-8?B?cTM5Ty9Ec0FOSDQvR0FaaVJvNnZaRjdiNzU0bVdHS2FiQ0o1Y2RVN05JcWhx?=
 =?utf-8?B?bERsZmNSYWc5V2NxbEIybElCYVlTSXJKelZYQlR0UHFTVFZ1cHdyWUk5cGJj?=
 =?utf-8?B?WlpiV3V5SEJEV0JvUTFFaERxQ1E1UzQ0b0FVaGlWdkoxdjlLRi9UbEUrdkM5?=
 =?utf-8?B?Z3RBazUrTExPOHo2YXFQeXVtSEZTRU85RWJrZDdtbFFEbS9oY0NRc3NoWGtH?=
 =?utf-8?B?eDNtN1VCZXlHQlZXdTFtRG9PWXJSbkt6bjZzY2M2Qy96WnRWVWh0RDI3TmNL?=
 =?utf-8?B?b2g1WEpDV2F2ditUUkgwcFljbkZzbjdGSEF3cS9NeWRYTmFXemY2SHgwRnpz?=
 =?utf-8?Q?bEzvmI8bej4LA8Ar3NIiPU+ET?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d37ad20-09c2-47d7-d4a3-08dc3da7929b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 06:35:10.7688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dtEH8yyQtl6Yi+wtrHS9rjCXLSwm2Una1OtReyil/yjCEQA66wtDklNpYmesZ/ajbUAXXnl3Eif68iCNvy+hdMMRn9sltQ7dS3uLGouuFmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
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

PiBIb3cgZG9lcyBvbmUga25vdyB3aGF0IGJ1aWxkIG9mIHRoZSBrZXJuZWwgdGhlIHRlc3Qgd2Fz
IHJ1biBhZ2FpbnN0Pw0KDQpBdCB0aGUgZW5kIG9mIHByZW1lcmdlIHJlcG9ydCB5b3UgZG8gaGF2
ZSAiQnVpbGQgY2hhbmdlcyIgc2VjdGlvbiB3aGVyZSB5b3UgaGF2ZSBpbmZvIGFib3V0IGNvbXBv
bmVudHMgbGlrZSBJR1QgYW5kIGtlcm5lbCwgZWcNCkJ1aWxkIGNoYW5nZXMNCklHVDogSUdUXzc3
MzggLT4gSUdUUFdfMTA3NjANCkxpbnV4OiB4ZS04NzYtMTJkYjEyNGI4Y2VmOWMzMmI3YmM2OWE1
YWJiYWZmMDE2OTY1Y2Y5OSAtPiB4ZS04ODAtYzFhMGY2Y2FmMGZmYTgxZTc3ZTc0ZTA0ZDkzNzYw
NWEyZTI5Mzc3NA0KDQpJdCBtZWFucyB0aGF0IElHVFBXXzEwNzYwIHdhcyB0ZXN0ZWQgb24geGUt
ODgwLWMxYTBmNmNhZjBmZmE4MWU3N2U3NGUwNGQ5Mzc2MDVhMmUyOTM3NzQga2VybmVsLg0KDQpS
ZWdhcmRzLA0KRXdlbGluYQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSGFy
cmlzb24sIEpvaG4gQyA8am9obi5jLmhhcnJpc29uQGludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5
LCBNYXJjaCA1LCAyMDI0IDc6MDcgUE0NClRvOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmll
Y3pueUBsaW51eC5pbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkx
NS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExHQ0kgQnVnIEZpbGluZyA8bGdjaS5i
dWcuZmlsaW5nQGludGVsLmNvbT47IElsbGlwaWxsaSwgVGVqYXNyZWVYIDx0ZWphc3JlZXguaWxs
aXBpbGxpQGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiDinJcgRmkuQ0kuSUdUOiBmYWlsdXJlIGZv
ciB0ZXN0cy9pbnRlbC9nZW1fZXhlY19jYXB0dXJlOiBDaGVjayBmb3IgcGFydGlhbCByZWdpc3Rl
ciBjYXB0dXJlcyAocmV2MikNCg0KT24gMy81LzIwMjQgMDk6NTAsIEthbWlsIEtvbmllY3pueSB3
cm90ZToNCj4gSGkgaWd0LWRldiwNCj4gT24gMjAyNC0wMy0wMSBhdCAyMzowODoxMCAtMDAwMCwg
UGF0Y2h3b3JrIHdyb3RlOg0KPj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4+DQo+PiBTZXJpZXM6
IHRlc3RzL2ludGVsL2dlbV9leGVjX2NhcHR1cmU6IENoZWNrIGZvciBwYXJ0aWFsIHJlZ2lzdGVy
IGNhcHR1cmVzIChyZXYyKQ0KPj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzEzMDMzMi8NCj4+IFN0YXRlIDogZmFpbHVyZQ0KPj4NCj4+ID09IFN1bW1h
cnkgPT0NCj4+DQo+PiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIENJX0RSTV8xNDM3MF9mdWxs
IC0+IElHVFBXXzEwNzYwX2Z1bGwgDQo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo+Pg0KPj4gU3VtbWFyeQ0KPj4gLS0tLS0tLQ0KPj4NCj4+
ICAgICoqRkFJTFVSRSoqDQo+Pg0KPj4gICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5n
IHdpdGggSUdUUFdfMTA3NjBfZnVsbCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4+ICAgIHZlcmlm
aWVkIG1hbnVhbGx5Lg0KPj4gICAgDQo+PiAgICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNo
YW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4+ICAgIGludHJvZHVj
ZWQgaW4gSUdUUFdfMTA3NjBfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1
LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPj4gICAgdG8g
ZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBw
b3NpdGl2ZXMgaW4gQ0kuDQo+Pg0KPj4gICAgRXh0ZXJuYWwgVVJMOiANCj4+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA3NjAvaW5kZXguaHRtbA0KPj4N
Cj4+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDggLT4gOCkNCj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPj4NCj4+ICAgIE5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0cw0K
Pj4NCj4+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+DQo+
PiAgICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRy
b2R1Y2VkIGluIElHVFBXXzEwNzYwX2Z1bGw6DQo+Pg0KPj4gIyMjIElHVCBjaGFuZ2VzICMjIw0K
Pj4NCj4+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPj4NCj4+ICAgICogaWd0QGdl
bV9leGVjX2NhcHR1cmVAY2FwdHVyZUBjY3MzLXNtZW06DQo+PiAgICAgIC0gc2hhcmQtZGcyOiAg
ICAgICAgICBbUEFTU11bMV0gLT4gW0ZBSUxdWzJdICsxMyBvdGhlciB0ZXN0cyBmYWlsDQo+PiAg
ICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8x
NDM3MC9zaGFyZC1kZzItMTAvaWd0QGdlbV9leGVjX2NhcHR1cmVAY2FwdHVyZUBjY3MzLXNtZW0u
aHRtbA0KPj4gICAgIFsyXTogDQo+PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzEwNzYwL3NoYXJkLWRnMi02L2lndEANCj4+IGdlbV9leGVjX2NhcHR1cmVA
Y2FwdHVyZUBjY3MzLXNtZW0uaHRtbA0KPj4NCj4+ICAgICogaWd0QGdlbV9leGVjX2NhcHR1cmVA
Y2FwdHVyZUByY3MwLXNtZW06DQo+PiAgICAgIC0gc2hhcmQtbXRscDogICAgICAgICBbUEFTU11b
M10gLT4gW0ZBSUxdWzRdICszIG90aGVyIHRlc3RzIGZhaWwNCj4+ICAgICBbM106IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE0MzcwL3NoYXJkLW10bHAt
OC9pZ3RAZ2VtX2V4ZWNfY2FwdHVyZUBjYXB0dXJlQHJjczAtc21lbS5odG1sDQo+PiAgICAgWzRd
OiANCj4+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA3
NjAvc2hhcmQtbXRscC02L2lndA0KPj4gQGdlbV9leGVjX2NhcHR1cmVAY2FwdHVyZUByY3MwLXNt
ZW0uaHRtbA0KPj4NCj4+ICAgICogaWd0QGdlbV9leGVjX2NhcHR1cmVAY2FwdHVyZUB2ZWNzMC1s
bWVtMDoNCj4+ICAgICAgLSBzaGFyZC1kZzE6ICAgICAgICAgIFtQQVNTXVs1XSAtPiBbRkFJTF1b
Nl0gKzMgb3RoZXIgdGVzdHMgZmFpbA0KPj4gICAgIFs1XTogaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fMTQzNzAvc2hhcmQtZGcxLTEzL2lndEBnZW1fZXhl
Y19jYXB0dXJlQGNhcHR1cmVAdmVjczAtbG1lbTAuaHRtbA0KPj4gICAgIFs2XTogDQo+PiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEwNzYwL3NoYXJkLWRn
MS0xOS9pZ3QNCj4+IEBnZW1fZXhlY19jYXB0dXJlQGNhcHR1cmVAdmVjczAtbG1lbTAuaHRtbA0K
Pj4NCj4+ICAgICogaWd0QGdlbV9leGVjX2NhcHR1cmVAdXNlcnB0cjoNCj4+ICAgICAgLSBzaGFy
ZC1kZzE6ICAgICAgICAgIE5PVFJVTiAtPiBbRkFJTF1bN10NCj4+ICAgICBbN106IA0KPj4gaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDc2MC9zaGFyZC1k
ZzEtMTgvaWd0DQo+PiBAZ2VtX2V4ZWNfY2FwdHVyZUB1c2VycHRyLmh0bWwNCj4+DQo+IEFib3Zl
IGFyZSBidWdzIHdoaWNoIHdlcmUgc3BvdHRlZCBieSBhIGNoYW5nZSBpbiB0ZXN0Lg0KQ29ycmVj
dCwgdGhpcyBpcyB0aGUgdGVzdCBzYXlpbmcgdGhhdCB0aGUga2VybmVsIGlzIGJyb2tlbi4NCg0K
SG93IGRvZXMgb25lIGtub3cgd2hhdCBidWlsZCBvZiB0aGUga2VybmVsIHRoZSB0ZXN0IHdhcyBy
dW4gYWdhaW5zdD8gDQpTcGVjaWZpY2FsbHksIGRvZXMgaXQgY29udGFpbiB0aGlzIHBhdGNoOg0K
ZTQ1YWZiZWI1OTM0NyBkcm0vaTkxNS9ndWM6IENvcnJlY3QgY2FwdHVyZSBvZiBFSVIgcmVnaXN0
ZXIgb24gaGFuZw0KDQpJZiBub3QsIHRoZW4gdGhlIHRlc3QgaXMgZXhwZWN0ZWQgdG8gZmFpbC4N
Cg0KSm9obi4NCg0KDQo+DQo+PiAgICAqIGlndEBpOTE1X3BtX3JwbUBnZW0tZXhlY2J1Zi1zdHJl
c3NAZXh0cmEtd2FpdC1sbWVtMDoNCj4+ICAgICAgLSBzaGFyZC1kZzE6ICAgICAgICAgIFtQQVNT
XVs4XSAtPiBbQUJPUlRdWzldICsxIG90aGVyIHRlc3QgYWJvcnQNCj4+ICAgICBbOF06IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE0MzcwL3NoYXJkLWRn
MS0xNS9pZ3RAaTkxNV9wbV9ycG1AZ2VtLWV4ZWNidWYtc3RyZXNzQGV4dHJhLXdhaXQtbG1lbTAu
aHRtbA0KPj4gICAgIFs5XTogDQo+PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzEwNzYwL3NoYXJkLWRnMS0xNi9pZ3QNCj4+IEBpOTE1X3BtX3JwbUBnZW0t
ZXhlY2J1Zi1zdHJlc3NAZXh0cmEtd2FpdC1sbWVtMC5odG1sDQo+Pg0KPj4gICAgKiBpZ3RAaTkx
NV9wbV9ycG1AZ2VtLWV4ZWNidWYtc3RyZXNzQGxtZW0wOg0KPj4gICAgICAtIHNoYXJkLWRnMjog
ICAgICAgICAgW1BBU1NdWzEwXSAtPiBbQUJPUlRdWzExXSArMSBvdGhlciB0ZXN0IGFib3J0DQo+
PiAgICAgWzEwXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9DSV9E
Uk1fMTQzNzAvc2hhcmQtZGcyLTcvaWd0QGk5MTVfcG1fcnBtQGdlbS1leGVjYnVmLXN0cmVzc0Bs
bWVtMC5odG1sDQo+PiAgICAgWzExXTogDQo+PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzEwNzYwL3NoYXJkLWRnMi0xMS9pZ3QNCj4+IEBpOTE1X3BtX3Jw
bUBnZW0tZXhlY2J1Zi1zdHJlc3NAbG1lbTAuaHRtbA0KPj4NCj4+ICAgICogaWd0QHZnZW1fYmFz
aWNAdW5sb2FkOg0KPj4gICAgICAtIHNoYXJkLWdsazogICAgICAgICAgW1BBU1NdWzEyXSAtPiBb
SU5DT01QTEVURV1bMTNdDQo+PiAgICAgWzEyXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9DSV9EUk1fMTQzNzAvc2hhcmQtZ2xrOC9pZ3RAdmdlbV9iYXNpY0B1bmxv
YWQuaHRtbA0KPj4gICAgIFsxM106IA0KPj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMDc2MC9zaGFyZC1nbGs3L2lndEB2DQo+PiBnZW1fYmFzaWNAdW5s
b2FkLmh0bWwNCj4+DQo+IFRoZXNlIGFyZSB1bnJlbGF0ZWQuDQo+DQo+IFJlZ2FyZHMsDQo+IEth
bWlsDQo+DQo+PiAgICANCj4+IE5ldyB0ZXN0cw0KPj4gLS0tLS0tLS0tDQo+Pg0KPj4gICAgTmV3
IHRlc3RzIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGJldHdlZW4gQ0lfRFJNXzE0MzcwX2Z1bGwgYW5k
IElHVFBXXzEwNzYwX2Z1bGw6DQo+Pg0KPj4gIyMjIE5ldyBJR1QgdGVzdHMgKDQpICMjIw0KPj4N
Cj4+ICAgICogaWd0QGttc19jdXJzb3JfZWRnZV93YWxrQDEyOHgxMjgtdG9wLWJvdHRvbUBwaXBl
LWEtZHAtNDoNCj4+ICAgICAgLSBTdGF0dXNlcyA6IDEgcGFzcyhzKQ0KPj4gICAgICAtIEV4ZWMg
dGltZTogWzMuNTJdIHMNCj4+DQo+PiAgICAqIGlndEBrbXNfY3Vyc29yX2VkZ2Vfd2Fsa0AxMjh4
MTI4LXRvcC1ib3R0b21AcGlwZS1kLWRwLTQ6DQo+PiAgICAgIC0gU3RhdHVzZXMgOiAxIHBhc3Mo
cykNCj4+ICAgICAgLSBFeGVjIHRpbWU6IFszLjMxXSBzDQo+Pg0KPj4gICAgKiBpZ3RAa21zX2N1
cnNvcl9lZGdlX3dhbGtAMjU2eDI1Ni1yaWdodC1lZGdlQHBpcGUtYS1kcC00Og0KPj4gICAgICAt
IFN0YXR1c2VzIDogMSBwYXNzKHMpDQo+PiAgICAgIC0gRXhlYyB0aW1lOiBbMy40Nl0gcw0KPj4N
Cj4+ICAgICogaWd0QGttc19jdXJzb3JfZWRnZV93YWxrQDI1NngyNTYtcmlnaHQtZWRnZUBwaXBl
LWQtZHAtNDoNCj4+ICAgICAgLSBTdGF0dXNlcyA6IDEgcGFzcyhzKQ0KPj4gICAgICAtIEV4ZWMg
dGltZTogWzMuMzFdIHMNCj4+DQo+PiAgICANCj4+DQo+PiBLbm93biBpc3N1ZXMNCj4+IC0tLS0t
LS0tLS0tLQ0KPj4NCj4+ICAgIEhlcmUgYXJlIHRoZSBjaGFuZ2VzIGZvdW5kIGluIElHVFBXXzEw
NzYwX2Z1bGwgdGhhdCBjb21lIGZyb20ga25vd24gaXNzdWVzOg0KPj4NCj4+ICMjIyBJR1QgY2hh
bmdlcyAjIyMNCj4+DQo+PiAjIyMjIElzc3VlcyBoaXQgIyMjIw0KPj4NCj4gLi4uY3V0Li4uDQo+
DQo+PiA9PSBMb2dzID09DQo+Pg0KPj4gRm9yIG1vcmUgZGV0YWlscyBzZWU6IA0KPj4gaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDc2MC9pbmRleC5odG1s
DQoNCg==

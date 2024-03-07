Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22F1C48BF6
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 14:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F90110F83B;
	Thu,  7 Mar 2024 14:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIk62SHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B489A10F83B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709821369; x=1741357369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7UQe4wiQcQG9ceJ4zRNuJFsOpqK2o37/bwfCUCNJqSg=;
 b=MIk62SHCyxmzS6NhQjEohXX6i1L6+sinvrGkTaqjCJ+FzOeqKuub6IOv
 XBMFI8qrhKBxRm9cgimlwhgsOH227ariLbmEomGxG4lCPRYWj6P0Yt8Io
 bTluIlhLMXH9PR7CRoOl+lszJUXsOk0O4pNvKxkdVBG4w/0tP5dpHgARY
 PrNBB22Fyf2KCR3amr0JcffEaIeVBjW9JNzgZBIWoc+SPqEyRNcc1BRoE
 KYZvFiIWkaoFGcFfKtAbhqZ3nFJGk+/zvY/idb+HbENE0OVAQfrxMxrjI
 /y/UyGbgZLal0rW9StaKZ4JCYBnVYjrxHE4PxMG3MfBELUWtKeh3caHw+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15212129"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="15212129"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 06:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="41098703"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 06:22:48 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 06:22:47 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 06:22:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 06:22:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+spG1eVLsFWHz4X8stA32pxZy5uNJHo2U+5KxOuLRfMgJnl621WWZgu50b7/V7Uhj8zrT1gwCNsD7nuoSBpnPtsPvfW2C5oir8oftgZ2tgHn+7zMxU7o5XxKT2r9wx+/KKgYb3nZcpydTUQgrvC2eNgaUn2pYJM0f+3X8VwJVXweERNZ+7nK5ZWZPV17orkxAge9mhKF9Sltn4AR/16xjxJmQvGBtSNDelWUoyCFlxd3K8Ba6eSEn9tXztydkuN3tggd093oJU0ppbH9s6uk9fvshwpj1BWycJ0eln95cG/046I1IKHsXKIK13/40JJlvwDfjsUhVuS6EchH4pHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UQe4wiQcQG9ceJ4zRNuJFsOpqK2o37/bwfCUCNJqSg=;
 b=V/P83RZMLqiFBzrCLWbSEFsZA4NQB24yczCSoiPv3Hc4H3BY/6jg6l/jPgGSeaqaKmqFAmuy4O21+D8/zwXWSiwm5NrM/SZBTp/U1geu20HaxsU1j2Dy45kyd8QqynMFpaCWLD7+6WtHYySHnOTBS3PmrUrudLUI0VNIVT5J/+LBDe4yy3HzDROz0xMfJux2YexSrUh4z5X+SbgRyH13oyB6gOoLKN8JYD2H9Uq5bwe3sPlMoDLB+DE6wNr5OL7cJjjpoMPfYdz1oOwO8lxDXT/ZmMYOP5AVLmGe7SwAs/gUM1PGWgL19yprN3Sn/BgssyVcyJwP+fYFMOfcxR0pdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Thu, 7 Mar
 2024 14:22:44 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 14:22:44 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Laguna, 
 Lukasz" <lukasz.laguna@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t 23/24] tests: Add missing documentation fields for
 SRIOV and Display
Thread-Topic: [PATCH i-g-t 23/24] tests: Add missing documentation fields for
 SRIOV and Display
Thread-Index: AQHabiX9ac1ZTVlE4U+mOD/3Y6EgqLEntB0AgASlPlA=
Date: Thu, 7 Mar 2024 14:22:44 +0000
Message-ID: <IA1PR11MB6097408C3C2756131430161186202@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-24-katarzyna.piecielska@intel.com>
 <20240304162536.0cf930bc@maurocar-mobl2>
In-Reply-To: <20240304162536.0cf930bc@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|IA0PR11MB8354:EE_
x-ms-office365-filtering-correlation-id: f876f639-f2f8-4565-05a5-08dc3eb20e76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UNBLRB8DDGPmo8ELZg6jPLUeExVrAlIjD7WTwX0967ufhqYzxCsyCC4KtRN4mUoR4NpQF3aVZDwJAIfYXDy3UKvPH4saqzwO0t21HvilMzPZxADcflSSSJ9U8qxJJWFIKCUNkn+LBNErsOt0o42R3/vV4uJx+YeNFt0AngxZw1tLcFKZxV0uzJ5h+YJI/RiYHznMrp/pE950Zh2MBudNwAyO6jGdnkOtAMKRxBoMVj5bPZqhv05nIj1TRFlxtJEyjplWejo+kd9kuGkTWk/TBmuLRc0qZTSGfSfahz3gTeZAcVsQiSMS295gqFFfdj7Wcu3Ylm4FzfzrEvRe/QX2h4PnH6LjljtZN4Asr9LkVJcCPwwPtV05aF7kaHMoAB1b4FdAyjAx/s93Kp5Ak8D+04/NPgYJOOP9j8WaPdVgdUtfwC0TDEEDt+i27EOiNxFzuJmw82IU7SbIJTCG5xvJ3184EPXHO0VlDyLEkpCTzSLitimo+324+nyd2I3R+SHlsECB2UZAd2DD5k5lMqERf3zx0LMrB0QOzHHGKyQm21EYxU8QWylNJzFbVkBGIh8AkmSAn42CThGHzXNeFjcugmUI54UTx9Ii/ppCWLIyO2DJhUv2uT4UyVZdMdbJcdG0NTAeKk0m9VSj+NiQ7sOAlDfjadil0cc68Ak2I7d9Y4tiZTBGtflNmFiIL/FoGhk2PmienU+h2FFcShs778UM+7TQUU3zSkLs9quKtk8UXfc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFpTb0FvMkFXUm5GMVk2LzdyWW9oR0k3WXJTYzVNVWcxSU5HZ0ZONHhEMktU?=
 =?utf-8?B?MmFQTWUzUXJNZTQ2dWdzeVFWL2F6MXRPMHBSQ2dEMWNSallaZmdoOC9Dcy9O?=
 =?utf-8?B?WlpxZVU4NjJEcUtQV1pVMEZRTDdwT2srdUpSM0dIVXBEaVQ2cHI5cXNKcUxR?=
 =?utf-8?B?dWNXYnBwTWRqd2J4ckZBdXgxUzZnZEptY2FpZzNtSEZmSjdXUmlnc1gwbHBO?=
 =?utf-8?B?OTNYR1pkSUJSSkhqRWFvNzFRNXY2cjV0R2ZObWhBSlppWWNBSDF4UGpXYjR2?=
 =?utf-8?B?elRKWnhmQTc2WXVxYTBIZmlNRkRsdFMzanVaK294ODQ5MC9UanV5SHB5VFdF?=
 =?utf-8?B?MlRQK3NhQ1U1aGNkeEEvaXFDMU9vaWs2eXloLzZFN3QrM2daaU1zRE14K3JN?=
 =?utf-8?B?VWtKMlo1OGw4dDRyRHAvcllLNDVhSEwzMWVsbXFpYndlcmlJL3l0R3VSUGZT?=
 =?utf-8?B?RjR6S3kwUTcwMmR4eDNuKzdYamR6ZS9haWFodFhBVnB3WituTnlaT0dOUlBD?=
 =?utf-8?B?MVFkRWs0K1FBeE9VaVM0cy9pN1VlakgrQzdzRW9yN1lDZUFXelNtTEZjWTBx?=
 =?utf-8?B?WVB1QlpGWFF0ekxTMkREYURRQXVwaDE2Wjcyc0RGTmlHcHM5bVRwTHZrcUt3?=
 =?utf-8?B?MzJVN1dzM1o4Y2R6TWNWWVBCREw3QSt4NFVTWGI2dnozenRqbWZ5Ym1KQkw4?=
 =?utf-8?B?bjNtQ0V1RW1ZcHRDU1pXRTNsZXdSNng1Nk1EdXlJVzI2Z0lPUzJMNVZBQnZs?=
 =?utf-8?B?NU95MWp6WmlGLy9oZzJ5NGhNR0RkZ055clR1THltdUtlSno5cHJPR3NlaU02?=
 =?utf-8?B?Rm11czhDU2F2S2V0Y2pHajIzNWJLc1VzeXJydzc2R2hsTUFMQWcyczJZaDlW?=
 =?utf-8?B?bTNlZ0VZc1BzVEJsRzZPa2kxWnpVMGo2aGxlcDJLVGJRSitSQWFrSGFoOE5h?=
 =?utf-8?B?ODZ5ZVVIdTl0S0NsZDkxRGprZ2xVazVsN1ZsYWF5Q2xVbm9QaVhzS1pZQ1NK?=
 =?utf-8?B?dlVZZVpkbHVxYk5idUk0NUhZcnZoMmM3K0swQ1JVSEJXSnhrU1M1WHlZTUNV?=
 =?utf-8?B?WTYyRTRmZTZYZzB2eDVUMFpiSDM1WGw0WDRNV0xnaTI0bFRITVlpN2JUNVIx?=
 =?utf-8?B?S1A2OGhIeXdZSEU5VVh5S1JMLzJRUEs1LzAzMFN5eVAxcTB3eWhKd3RET3FV?=
 =?utf-8?B?VWhlODVlN3hvdVU4SkhJenB0dm1iR1ZyZ0RYOXh6eStGenZCWFMwOEpXdlNR?=
 =?utf-8?B?SWMrUlRqbGU3UWVHSHJsREZrS3BGcGp6SWJ0SndxU0RsbDNmTGhKQXFRREVJ?=
 =?utf-8?B?N2s1U1pBdDRQNzQwalc3MVhtWmViNGlVSUQ4cUxvbFIvaU5zclNGaldxSDRH?=
 =?utf-8?B?QTM4YUJFV3hDbkVaQWptVUtGVURFTFF6OG84V2VYUnBSOGNhVnpRS0lrMFNl?=
 =?utf-8?B?YktqVy80U1FKWjNvcW9ycUF6czhDRURYYkhBdzcrUWsyWUg0Z0xuaEI1aUJv?=
 =?utf-8?B?ZklwdWZGT1JQSGtNK1NCbnlTMHc4QlpheUQ1ZUIvcTU2a1hHNjVrUE5mdStj?=
 =?utf-8?B?djgvd0poenYwSmpycUlPWUN3by94MTdiSkszVGt5TlJzbFJocDJkSSsrWFFP?=
 =?utf-8?B?WWZFbzNJQU9Sbkl3RW91eWFWYzdiNzNWSGxUU3pNR1htUHhicUd5SUF0a0hw?=
 =?utf-8?B?OXBFdVBSa2p2RDUvTTJQUnVpNjZ6SUw0MW5XQWVPc2lLcFQrb1lYblM5N2g1?=
 =?utf-8?B?TDh2dUh3NlNQL1FlMEhxNWFGSk83TTNTbkdIQ2xFaDJiR3FFQ2xMZGU4YitX?=
 =?utf-8?B?cnpMZVg4dDFXUDY4ZnI3V0laTG5XOENHcGhDbS9zU1ZuRzhPSStRMlhqZzJm?=
 =?utf-8?B?RDVmUnBMK2J5Y1ViaTIvbE9Rcm04VnZEUmo5SmR2K251RnE3QkVMZDhYYTly?=
 =?utf-8?B?R1dNS0ZldVdORnpSNTJhd3REa2N0QjJmQmRZcVJ0WmFiRmYzOURObHl1Qi9D?=
 =?utf-8?B?amdHUDdzbHpYM0FiRlpVNWJKZndnTzRPdnNTVkxqUnBwSFZWWmJVL1IxSlE3?=
 =?utf-8?B?SmwvMnZxZUt4UkM0aU82d2k5K0sxenI5S0xtVTE0SnhZQVByell5V3ZrQXU3?=
 =?utf-8?B?VDNpTG9tWm02SVRWZktMYTh6blJNcitRcjBWUCtNMUtkMUdRTlNpSzUyS0lT?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f876f639-f2f8-4565-05a5-08dc3eb20e76
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 14:22:44.7088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i9fPDNpsNRjmK1ktb6K2k4pSJx2mo6OGxqQfD5hwzhx25MHftzEOfqdY9mb+tuRzBJNZAj4x/q/91DFK1jcsVK0umcXvCUds802Ko28vCHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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

PiBBZGQgbWlzc2luZyBkb2N1bWVudGF0aW9uIGZpZWxkcyBmb3I6DQo+IA0KPiAgdGVzdHMvaW50
ZWwvaTkxNV9waXBlX3N0cmVzcy5jIC0gYWRkIENhdGVnb3J5LCBTdWItY2F0ZWdvcnksIA0KPiBG
dW5jdGlvbmFsaXR5IHRvIEtNUyB0ZXN0ICB0ZXN0cy9zcmlvdl9iYXNpYy5jIC0gYWRkIG1pc3Np
bmcgDQo+IGZ1bmN0aW9uYWxpdHkNCg0KDQpMR1RNLCBidXQgYmV0dGVyIHRvIGhhdmUgc29tZW9u
ZSBmcm9tIGttcyB0ZWFtIHRvIGxvb2sgaW50byBpdC4NCg0KQWNrZWQtYnk6IE1hdXJvIENhcnZh
bGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPg0KW0thdGFyenluYV0gQ29udGVudCB3YXMg
c3VnZ2VzdGVkIGJ5IEpQIPCfmIogSSB0aGluayB5b3VyIEFDSyBpcyBlbm91Z2guDQpLYXNpYQ0K
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLYXRhcnp5bmEgUGllY2llbHNrYSA8a2F0YXJ6eW5hLnBp
ZWNpZWxza2FAaW50ZWwuY29tPg0KPiBDYzogTHVrYXN6IExhZ3VuYSA8bHVrYXN6LmxhZ3VuYUBp
bnRlbC5jb20+DQo+IENjOiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFA
Z21haWwuY29tPg0KPiBDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtYXVyby5jaGVoYWJAbGlu
dXguaW50ZWwuY29tPg0KPiBDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGlu
dXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL2k5MTVfcGlwZV9zdHJlc3MuYyB8
IDExICsrKysrKysrLS0tDQo+ICB0ZXN0cy9zcmlvdl9iYXNpYy5jICAgICAgICAgICAgfCAgMSAr
DQo+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9pOTE1X3BpcGVfc3RyZXNzLmMgDQo+IGIvdGVz
dHMvaW50ZWwvaTkxNV9waXBlX3N0cmVzcy5jIGluZGV4IDc5ZjgzZDI2Ni4uYTQ4N2Y3MGRlIDEw
MDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9pOTE1X3BpcGVfc3RyZXNzLmMNCj4gKysrIGIvdGVz
dHMvaW50ZWwvaTkxNV9waXBlX3N0cmVzcy5jDQo+IEBAIC0yMCw5ICsyMCwxNCBAQA0KPiAgI2lu
Y2x1ZGUgImk5MTUvZ2VtLmgiDQo+ICAvKioNCj4gICAqIFRFU1Q6IGk5MTUgcGlwZSBzdHJlc3MN
Cj4gLSAqIERlc2NyaXB0aW9uOg0KPiAtICogICBTdHJlc3MgdGVzdCBob3cgZ3B1IGFuZCBjcHUg
YmVoYXZlcyBpZiBtYXhpbXVtIGFtb3VudCBvZiBwbGFuZXMsIGNwdSBhbmQgZ3B1IHV0aWxpemF0
aW9uIGlzDQo+IC0gKiAgIGFjaGlldmVkIGluIG9yZGVyIHRvIHJldmVhbCBwb3NzaWJsZSBiYW5k
d2lkdGgvd2F0ZXJtYXJrIGFuZCBzaW1pbGFyIHByb2JsZW1zLg0KPiArICogQ2F0ZWdvcnk6IERp
c3BsYXkNCj4gKyAqIERlc2NyaXB0aW9uOiBTdHJlc3MgdGVzdCBob3cgZ3B1IGFuZCBjcHUgYmVo
YXZlcyBpZiBtYXhpbXVtIGFtb3VudCBvZg0KPiArICogICAgICAgICAgICAgIHBsYW5lcywgY3B1
IGFuZCBncHUgdXRpbGl6YXRpb24gaXMgYWNoaWV2ZWQgaW4gb3JkZXIgdG8gcmV2ZWFsDQo+ICsg
KiAgICAgICAgICAgICAgcG9zc2libGUgYmFuZHdpZHRoL3dhdGVybWFyayBhbmQgc2ltaWxhciBw
cm9ibGVtcy4NCj4gKyAqIEZ1bmN0aW9uYWxpdHk6IGttc19jb3JlDQo+ICsgKiBNZWdhIGZlYXR1
cmU6IEdlbmVyYWwgRGlzcGxheSBGZWF0dXJlcw0KPiArICogU3ViLWNhdGVnb3J5OiBEaXNwbGF5
DQo+ICsgKiBUZXN0IGNhdGVnb3J5OiBzdHJlc3MgdGVzdA0KPiAgICogUnVuIHR5cGU6IEZVTEwN
Cj4gICAqDQo+ICAgKiBTVUJURVNUOiBzdHJlc3MteHJnYjg4ODgtdW50aWxlZA0KPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvc3Jpb3ZfYmFzaWMuYyBiL3Rlc3RzL3NyaW92X2Jhc2ljLmMgaW5kZXggDQo+
IGJjN2MwOWUxYy4uYjJiNjNjNzAyIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9zcmlvdl9iYXNpYy5j
DQo+ICsrKyBiL3Rlc3RzL3NyaW92X2Jhc2ljLmMNCj4gQEAgLTE0LDYgKzE0LDcgQEAgSUdUX1RF
U1RfREVTQ1JJUFRJT04oIkJhc2ljIHRlc3RzIGZvciBlbmFibGluZyBTUi1JT1YgVmlydHVhbCBG
dW5jdGlvbnMiKTsNCj4gICAqIENhdGVnb3J5OiBTb2Z0d2FyZSBidWlsZGluZyBibG9jaw0KPiAg
ICogTWVnYSBmZWF0dXJlOiBTUi1JT1YNCj4gICAqIFN1Yi1jYXRlZ29yeTogVkZzIGVuYWJsaW5n
DQo+ICsgKiBGdW5jdGlvbmFsaXR5OiBjb25maWd1cmUgLyBlbmFibGUgVkZzDQo+ICAgKiBEZXNj
cmlwdGlvbjogVmFsaWRhdGUgU1ItSU9WIFZGcyBlbmFibGluZw0KPiAgICovDQo+ICANCg==

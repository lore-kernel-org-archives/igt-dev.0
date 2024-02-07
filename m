Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBCEC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 20:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE0910E5AF;
	Wed,  7 Feb 2024 20:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wz4z1IHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5975C10E58A
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 20:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707339149; x=1738875149;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pxySlk7tgZ8vehP7W1ORZDJq1YhquTpqBNQBmA4z9hw=;
 b=Wz4z1IHtaQlELcB60RB1s/l8VTr+KTuqW01NUcVmH25zAKUotripSM70
 X2ftj7TV+wIYpb+iiHH/Tnoi2Tf/oJGDS8d7mswiDmgP08OOV9evMqYVB
 GKeFUkJbI65+iZCdJqGs4e9w7/yp4xM1d/+u9mI1NMuiiKSYYTkn4pCqG
 mpzEJKotGFICpipnQSpQyIfow+ox80C4FJwHTNNVTRign05SxHXbMygvj
 J5bZmhPS6eD5vT3gqBL+8agNZSOoJ+w3YjUhGc19dlmjfkcWO8BesxGJJ
 iLzTHZOnuAmFzQgsBIbDLCCLwuqSGIQlsQMspXL+4jCGlin3HcOzprX/J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="23557191"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="23557191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 12:52:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="910105216"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="910105216"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 12:52:27 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 12:52:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 12:52:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 12:52:26 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 12:52:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcL4xBiZVG83VCrWaFO5iLuHhcAagPpZhGj6vbhQsS7/OmXwUl5lMHJ3oZxTxkWsBZFPptDmuzdf+llxGpnd69FBmkeCI+sfNGfaEuMvyhUveUvnQO6+euiXeVSAMrTnKihyPfTQxYYbPZwFfBg/BOEFSN/c6x76OXQDGTfgLS2NKYYRiyeQbfqZiLa+54maCKnZugQjFhlNNCwK+bs7UrGBo6c/BLI6tMXd5O0jsvFL5R0MUmAoGKtpP/feWppb6ebpsngDhwhpvr/U1BAuuF4fnFHj3kBSGgFdrPjhsU9SXBNdtg4QmPJbCUlxtXXEP+nrn2jd3nq72MLTgEebFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxySlk7tgZ8vehP7W1ORZDJq1YhquTpqBNQBmA4z9hw=;
 b=oA5Xdy+wl2/fJsgYZ9LlfXIaY6TLybOyU3FDCI2XxIZKBjTptIkTba5qP342DbpSL8ELFtdmYJa5nraFQIqBmg1XSmot1xgVwOMpZ4DoYg1WoHvcGEivEcitBrahtAFowQssXbuTfXx75ZSO1WA4ChpvnLZY72pzQoIKODdbSqa4s+Ko3dRLPyjGkTYBExBbbhuMNZklG3QOGN8D+K542V3Rrlx2cTohWOm/xXIQ0ythhDRCUgGbYd54fiC8qmA8rWM1FBj2HbgMQPTXPKY0HAfpqDthWvHrXCgIHwN0tv7K7tnelrrgBEHosU1gf66ttIvrx+Luwr8ztjPykojtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV8PR11MB8510.namprd11.prod.outlook.com (2603:10b6:408:1e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Wed, 7 Feb
 2024 20:52:24 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630%7]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 20:52:23 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast, 
 Francois" <francois.dugast@intel.com>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 2/2] drm-uapi/xe: Add test to query HuC firmware
 version
Thread-Topic: [PATCH i-g-t 2/2] drm-uapi/xe: Add test to query HuC firmware
 version
Thread-Index: AQHaWgbdo3sH4eOokkejqJq4cMHJN7D/WwiA
Date: Wed, 7 Feb 2024 20:52:23 +0000
Message-ID: <2fd36fc0e7bdaa70a1065a043bc88b072f90cb3b.camel@intel.com>
References: <20240207204659.7-1-francois.dugast@intel.com>
 <20240207204659.7-3-francois.dugast@intel.com>
In-Reply-To: <20240207204659.7-3-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV8PR11MB8510:EE_
x-ms-office365-filtering-correlation-id: 5296aea0-1232-4721-ea2f-08dc281eaf8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EoHwjun8IaZgpUtr+Qh8fKRVu2VIb7lxWjRMUYa88xjibzriGL8rIDwuXkfWI44Ry30hudyAwGIZ14nUSgrqyPQ+lZPx9KNsJw3hG20AnwzRiXyLE6aaadynobS3G12m7eEh8XLuyyAWWjLpJHqBExr8/8O9O0rmnPFsGz4v7GTqmVF9rmpeeduxU/8myk9Q7g1/uduzLsFBRD+rSZCO3yPnGzLvgrqCcb3P9gqeiazE/n/ayREKD7Id0rKJvQYRrHTcsL+OviacTuMomv/NWigUZJNQCB6ysTzL53V5yTgws+ux7xQPod4JgTiF1gF1MInWWpeEhxZVrYit/8mkd3x9ekXY/tUgBLW95MBAdCkx82BNMutXAgSM751GGpyyrM4ozkP9kQLzzPf2isHW+7WbHPCo4z02NEPE5M+jXE01DulubVsAz5JkENL95kws/Ppcej5Ew9fOkLYYG+JrD3THVJyockySObbYOgeMML5XRDSJLPP73ShgOHo+ah/V9A2I0FIzY/hvJyLlqdJO3xW7G3En8KY7LmCV2o9Kx9wL9h9z9jh58NNhbPmCGeAscy10A7Ep04FmNkBaJhyTgkO6vsZyy8zaSKHsRRdwukh414Ry8ZdpwZ2tgqZ61N8K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38100700002)(122000001)(6636002)(8936002)(82960400001)(4326008)(8676002)(66946007)(66556008)(66446008)(64756008)(54906003)(66476007)(110136005)(76116006)(316002)(5660300002)(2906002)(2616005)(6512007)(26005)(107886003)(6486002)(71200400001)(6506007)(478600001)(38070700009)(86362001)(36756003)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEE3YXpjQ0VXRndoWU5PeXlFZWVFVTlLTWM2T3ZhSGtJT0VYK0kvOXArcXhy?=
 =?utf-8?B?RzJyMjdkNzZ2Kzc5cHZXbUNzeXc3MkdFWlpVMFc0SVROTzJVMW1DaTAyeTU1?=
 =?utf-8?B?bmg0WjF6TGRMLzNLN3gzYzlYRjNyME4vQXRPSnVPS0xzU3hJZFIzeWxpN2lC?=
 =?utf-8?B?cDRlWG9NVzlaY2FiOGpYa21EcTdVQXBVMUdvcTlwdmlWeGFzSnBHS3pHd05h?=
 =?utf-8?B?ZkhnTGM5QzZUM1JxUzEwckZMM1ZGb3d5RUNlL2hrajVGcnB1MEJvQnRQMFAw?=
 =?utf-8?B?a0pEdzFIeTZKWVl1K3dUeElJeWVwdXRabmY3dmI1Q0RXNlVJYy8wSk5UK3ZJ?=
 =?utf-8?B?SVh1UkQyS0JJSWVDRlVpMzZOaVMydVA4Z0hhRTVLSFp6eHIvSndRd2o5ems1?=
 =?utf-8?B?QVBpUmp2MG1sbFFGQ2xiSmRzZElwT2hqdTdlVW1qcXFXdUlUb2pRMkJjcVNV?=
 =?utf-8?B?dko1QkpuZmdONEVhdzNWV1V1SjhvVlVtVzlUaUpyRlZmZjJKMzh3a0ZGRzkx?=
 =?utf-8?B?MTdJMVdvajVxdUdqa2RXSHBNN0JkMWJHaTdpRFVuRlpOeEh3cXcvcE0wcU5k?=
 =?utf-8?B?WnUydnRsVXF6cVZaQktKR3gwVmRjUDNVMllXcGdhekRlR1dZWnN0KzF3SGtz?=
 =?utf-8?B?eS93blI5VFhwYlRWQ1E1M1lyclEvbDdNN2Y4TnVNeHQ3cE40QWJUbEwvRk1Z?=
 =?utf-8?B?d2FrR1pwUVNmUDV6bTN2SlF0dWJRU0ZlL0VqUVhNcVJFRmQrRGY5OS81VDdn?=
 =?utf-8?B?T2QwUE5HNkVEOXBpZFA2Uk1Cb2tmSVlhdHNQYXQ4YU8vbEtiSVJEcTJlaE11?=
 =?utf-8?B?MmYxYzZsMVQrUWFyMk8zSTVpTkJmM1VXS0NHTTcyYXFzaGV1ajVlTWIwSEVR?=
 =?utf-8?B?NUlNUW5ybUU4R3dONWRNTlRaNjFyZE1COUo5ZjhYVE03Zy9LL09RQUN2bXkr?=
 =?utf-8?B?ODlEdHFLeGhRMmh1N3NTTHM3cGdqdjEwY2dlSjFiSmZMZ0ZQYUlZVzh5ZWsv?=
 =?utf-8?B?WWJ5Sm9mUkhYc0RVS0ljcnRaSmF1YTlIQmxkajRKSDFtcSs2Q3ROYkphYUNn?=
 =?utf-8?B?RndTdlFYUzIremR4WHBJMUpWcFVTR3ZLckg1eVJ4TEVaRVlNYkFxaXYzKzF6?=
 =?utf-8?B?bFBoYzdOcDhaOHB1eXd3allFMGRveUN3VGhSRzI2NHVvdWo5Z2UySHd6L1lD?=
 =?utf-8?B?WkRtZW9pc2crQU1sUXBnVVE2elhHcUFaK2NscWZyaUZXY3FEWlpMWnlodmpa?=
 =?utf-8?B?OE1XWHljMzlHOXR4VVQxRXFtbjFsaXIwK3JrQmMySW5CeHUvcHdlL0ZaT3Y4?=
 =?utf-8?B?NkI0Z1FjYTc0amZnL2Z2S1lNWmt1YklkYnB3VzczbXVRMjA1bU9qYStSOVAy?=
 =?utf-8?B?TDd3b3JsQnRCSzFPcUEvSENxMFhwWExSNE1VL0ZGWlBKeGQyakF2U2svRkQ4?=
 =?utf-8?B?RERJeXJvOEVlL3RRS04zenN4WVU1eFlXWTlRdlZEY0NKc1BlRU9ieURML1I0?=
 =?utf-8?B?YkRtTHY2SmNGSG1aR0JIYjNwdHVQQzVvKzdjMFdWRmliTEVPNUsrOWNCQVdk?=
 =?utf-8?B?RWZLbzZJN2hYbE9BUkNqVW5GVFlXczNEbmRkbUwrTDhXR1ZRV2prR1ZtSVdK?=
 =?utf-8?B?ZHR3T01CMVFzWnBiVTl2amlYTnNvaGp4SFJNUDN2NVJOWVE5Zk9QdmM1bm5m?=
 =?utf-8?B?U3NRSWhYYUI5WmFkYU5LZVpFMGRPSiswdWhiUWdDVHQyNFpBSVZCMkpDT3d2?=
 =?utf-8?B?cXVGT2RHMHdoOGludWkzWmxMMitxZlNEZGYxc0dLSy82dEJWejJMZWtBOVlj?=
 =?utf-8?B?ai91elBpRllqSkU3OUdkd2UyKzBlNGtPcGpQMU1SMC9KbzlaVjkrTjhabklz?=
 =?utf-8?B?Q0dIdmFBN2Z1MS9rUzh1eFhOclQ1ODhXejI3SWJSd20rZHBVN29naHVrUDVK?=
 =?utf-8?B?N0FUdll2YWpQWGt5WjZ1RjNBU09uT1RCWG92ZW1IeThGVUdkUDNPdXF5NGNp?=
 =?utf-8?B?MVlrKzFJSjhKZUx4aTJoRjhUMlhSRXJqalVVVTcxYkUya0VvdGI2OGxyMi9w?=
 =?utf-8?B?RUxqWWJEQU9QK0RlUE53dnRKVnovQTZWVHVFczF3ZGhoUEtMNWlnV05qN1VW?=
 =?utf-8?B?RGM2YVZ0VEptcXowMEs0c3BlWTFWQklqR0EyWkhqR0lHdUpMQnlYVEFtVXZQ?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <648B24B9FD68624DB60C5FF6FD740DDD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5296aea0-1232-4721-ea2f-08dc281eaf8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2024 20:52:23.8486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZM5WDjgbAdSAAdSayrPa5RG44HDxTH5a/6C71fuOUtAZ2wvn4frRSnvQConqtdXkaQFaaP82oUqbnzG8IjsgxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
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

T24gV2VkLCAyMDI0LTAyLTA3IGF0IDIwOjQ2ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoaXMgYWxpZ25zIHdpdGgga2VybmVsIGNvbW1pdCAoImRybS94ZTogRXh0ZW5kIHVBUEkg
dG8gcXVlcnkgSHVDDQo+IG1pY3JvLWNvbnRyb2xlciBmaXJtd2FyZSB2ZXJzaW9uIikuDQo+IA0K
PiBDYzogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gQ2M6IEpv
c8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBDYzogTHVjYXMg
RGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEZy
YW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbmNs
dWRlL2RybS11YXBpL3hlX2RybS5oIHwgIDEgKw0KPiAgdGVzdHMvaW50ZWwveGVfcXVlcnkuYyAg
ICB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0tdWFwaS94ZV9kcm0uaCBiL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgNCj4gaW5kZXggM2Jk
Nzk1ZjI3Li5jZTRhY2Y5ZDQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJt
LmgNCj4gKysrIGIvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaA0KPiBAQCAtNTgzLDYgKzU4Myw3
IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZW5naW5lX2N5Y2xlcyB7DQo+ICBzdHJ1Y3QgZHJtX3hl
X3F1ZXJ5X3VjX2Z3X3ZlcnNpb24gew0KPiAgCS8qKiBAdWM6IFRoZSBtaWNyby1jb250cm9sbGVy
IHR5cGUgdG8gcXVlcnkgZmlybXdhcmUgdmVyc2lvbiAqLw0KPiAgI2RlZmluZSBYRV9RVUVSWV9V
Q19UWVBFX0dVQ19TVUJNSVNTSU9OIDANCj4gKyNkZWZpbmUgWEVfUVVFUllfVUNfVFlQRV9IVUMg
MQ0KPiAgCV9fdTE2IHVjX3R5cGU7DQo+ICANCj4gIAkvKiogQHBhZDogTUJaICovDQo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV9xdWVyeS5jIGIvdGVzdHMvaW50ZWwveGVfcXVlcnkuYw0K
PiBpbmRleCBkNTFlNzNlYTUuLmMyZWViZTgwMSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwv
eGVfcXVlcnkuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9xdWVyeS5jDQo+IEBAIC04MjUsNiAr
ODI1LDUxIEBAIHRlc3RfcXVlcnlfdWNfZndfdmVyc2lvbl9pbnZhbGlkX21ieihpbnQgZmQpDQo+
ICAJZnJlZSh1Y19md192ZXJzaW9uKTsNCj4gIH0NCj4gIA0KPiArLyoqDQo+ICsgKiBTVUJURVNU
OiBxdWVyeS11Yy1mdy12ZXJzaW9uLWh1Yw0KPiArICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25h
bGl0eSB0ZXN0DQo+ICsgKiBEZXNjcmlwdGlvbjogRGlzcGxheSB0aGUgSHVDIGZpcm13YXJlIHZl
cnNpb24NCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBtdWx0aWdwdS1xdWVyeS11Yy1mdy12ZXJzaW9u
LWh1Yw0KPiArICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+ICsgKiBTdWIt
Y2F0ZWdvcnk6IE11bHRpR1BVDQo+ICsgKiBEZXNjcmlwdGlvbjogRGlzcGxheSBIdUMgZmlybXdh
cmUgdmVyc2lvbiBmb3IgYWxsIFhlIGRldmljZXMuDQo+ICsgKi8NCj4gK3N0YXRpYyB2b2lkDQo+
ICt0ZXN0X3F1ZXJ5X3VjX2Z3X3ZlcnNpb25faHVjKGludCBmZCkNCj4gK3sNCj4gKwlzdHJ1Y3Qg
ZHJtX3hlX3F1ZXJ5X3VjX2Z3X3ZlcnNpb24gKnVjX2Z3X3ZlcnNpb247DQo+ICsJc3RydWN0IGRy
bV94ZV9kZXZpY2VfcXVlcnkgcXVlcnkgPSB7DQo+ICsJCS5leHRlbnNpb25zID0gMCwNCj4gKwkJ
LnF1ZXJ5ID0gRFJNX1hFX0RFVklDRV9RVUVSWV9VQ19GV19WRVJTSU9OLA0KPiArCQkuc2l6ZSA9
IDAsDQo+ICsJCS5kYXRhID0gMCwNCj4gKwl9Ow0KPiArDQo+ICsJaWd0X2Fzc2VydF9lcShpZ3Rf
aW9jdGwoZmQsIERSTV9JT0NUTF9YRV9ERVZJQ0VfUVVFUlksICZxdWVyeSksIDApOw0KPiArDQo+
ICsJdWNfZndfdmVyc2lvbiA9IG1hbGxvYyhxdWVyeS5zaXplKTsNCj4gKwlpZ3RfYXNzZXJ0KHVj
X2Z3X3ZlcnNpb24pOw0KPiArDQo+ICsJdWNfZndfdmVyc2lvbi0+dWNfdHlwZSA9IFhFX1FVRVJZ
X1VDX1RZUEVfSFVDOw0KPiArCXVjX2Z3X3ZlcnNpb24tPnBhZCA9IDA7DQo+ICsJdWNfZndfdmVy
c2lvbi0+cGFkMiA9IDA7DQo+ICsJdWNfZndfdmVyc2lvbi0+cmVzZXJ2ZWQgPSAwOw0KPiArCXF1
ZXJ5LmRhdGEgPSB0b191c2VyX3BvaW50ZXIodWNfZndfdmVyc2lvbik7DQo+ICsNCj4gKwlpZiAo
aWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZLCAmcXVlcnkpID09IDApIHsN
Cg0KVGhlIG9ubHkgZXJyb3IgaXQgc2hvdWxkIGFjY2VwdCBpcyAtRU5PREVWKG5vIG1lZGlhIElQ
IG9yIGxhY2sgb2YgSHVDIGZpcm13YXJlKSBhbGwgb3RoZXIgZXJyb3JzIHNob3VsZCBmYWlsIHRo
ZSB0ZXN0Lg0KDQo+ICsJCWlndF9hc3NlcnQodWNfZndfdmVyc2lvbi0+bWFqb3JfdmVyID4gMCk7
DQo+ICsNCj4gKwkJaWd0X2luZm8oIlhFX1FVRVJZX1VDX1RZUEVfSFVDICV1LiV1LiV1XG4iLA0K
PiArCQkJIHVjX2Z3X3ZlcnNpb24tPm1ham9yX3ZlciwNCj4gKwkJCSB1Y19md192ZXJzaW9uLT5t
aW5vcl92ZXIsDQo+ICsJCQkgdWNfZndfdmVyc2lvbi0+cGF0Y2hfdmVyLA0KPiArCQkJIHVjX2Z3
X3ZlcnNpb24tPmJyYW5jaF92ZXIpOw0KPiArCX0NCj4gKw0KPiArCWZyZWUodWNfZndfdmVyc2lv
bik7DQo+ICt9DQo+ICsNCj4gIGlndF9tYWluDQo+ICB7DQo+ICAJY29uc3Qgc3RydWN0IHsNCj4g
QEAgLTgzOSw2ICs4ODQsNyBAQCBpZ3RfbWFpbg0KPiAgCQl7ICJxdWVyeS10b3BvbG9neSIsIHRl
c3RfcXVlcnlfZ3RfdG9wb2xvZ3kgfSwNCj4gIAkJeyAicXVlcnktY3MtY3ljbGVzIiwgdGVzdF9x
dWVyeV9lbmdpbmVfY3ljbGVzIH0sDQo+ICAJCXsgInF1ZXJ5LXVjLWZ3LXZlcnNpb24tZ3VjIiwg
dGVzdF9xdWVyeV91Y19md192ZXJzaW9uX2d1YyB9LA0KPiArCQl7ICJxdWVyeS11Yy1mdy12ZXJz
aW9uLWh1YyIsIHRlc3RfcXVlcnlfdWNfZndfdmVyc2lvbl9odWMgfSwNCj4gIAkJeyAicXVlcnkt
aW52YWxpZC1jcy1jeWNsZXMiLCB0ZXN0X2VuZ2luZV9jeWNsZXNfaW52YWxpZCB9LA0KPiAgCQl7
ICJxdWVyeS1pbnZhbGlkLXF1ZXJ5IiwgdGVzdF9xdWVyeV9pbnZhbGlkX3F1ZXJ5IH0sDQo+ICAJ
CXsgInF1ZXJ5LWludmFsaWQtc2l6ZSIsIHRlc3RfcXVlcnlfaW52YWxpZF9zaXplIH0sDQoNCg==

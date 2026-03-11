Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CA71125869
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 18:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E50510E148;
	Wed, 11 Mar 2026 18:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1QCKypo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CC210E148
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 18:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773255276; x=1804791276;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=46qiAp3N6RIJHCt09hLhNv8XhQcaZicgTW75zYDNSdg=;
 b=V1QCKypolt45pEfuN9JZyix3vZMLuFLx29Ro3IlM4rbeXz+E9Y4sABvh
 kpa6yfRjEgTlbc5XFry7MZNvKuJRHYqDtw6z9Kzubyc9l7OClNGPJVcpj
 U0zt814kcCbwEyqTER5GkXRANrBVz7CBujA1msBnsRkDwhkOOamEzMLvy
 Y6J8nTbbk940hkF72EHU6FxC4FWoeREREKxi4+FGQ8g8CIcMMxU5V0g7Q
 G5YNfF0s8IHHGhafu7HYlfww84k72uBds9eckia4miONTsXohUl0KgUFo
 w+4GMgBWQExUxOB8uC4oUmAio75QD0x1q7m5vwUpVqhwjavFui9JbKmOi g==;
X-CSE-ConnectionGUID: ahZi8OXNQ/SnhKGL2rmw3Q==
X-CSE-MsgGUID: LJ7j3LZcR0KhgyNxXMQ3Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74374913"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74374913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:54:36 -0700
X-CSE-ConnectionGUID: Qs4L9ygtQWSxkyQabNzQVQ==
X-CSE-MsgGUID: c4+JekTLSG2XBp6AUCD+8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="225269148"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:54:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:54:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 11:54:34 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:54:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsHQJO3TeQCh9QTcmtm2+8q2UZwEbRm+940tUbTPOqu13nWuCCx0WjP6iKBu0N47xDPhV40mK3goRKUFyMW7mzoTns2rH13DZH5uEdBaeQcwymv/mzj15KSGYxkIc+ftSunPkg1XF0Ms/cR5U+7t1K0tEihV0QMyl48DDIHShUqQVKiupJoEjAB7zwKKa07XRv8dZeMFMkW1t48KgwMMpb0/VkxhFi0NYgvTz5FF6MdJf7YBuhczfnWq3hge/g7W2VYx7rAZDNxpIFqW85Khb01I5yazEy6py5ENS6Sto9BR5SqRrq+gxX793aUjnAcaHJVQ0PR5T8jrSfXGWou/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46qiAp3N6RIJHCt09hLhNv8XhQcaZicgTW75zYDNSdg=;
 b=K4PXzSLRAe/QZwWQzZlZjPLbt8kIggaVhlwbg+rDy+moBisWeyJvbM/7CArq2ZUqGmcYr0IfMFAnh4ldtDLZcjauFM7rDo/Iy6VSEAazLP3ocHj9D+7YJovJ4BFns3RneenfS9gIa0V3WVVY6bQF3TFL2bjj3yq77Rzqr0/wsHtO9h212WT6zRTbcefNxdVTrLaqxrQs9XjYwm3no73GycA2GemPyhGVfXNNobWyoGNq9FzqlCQY9v+ruAf91BrQTeOSCO3P4Xqh102B7mfpl3xq4zA6l+KDAqkI6dDd3I94KOQDtzmGMtn/wSiP/qVNw25iEliY7JhTBE/vnzR60Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 IA3PR11MB8920.namprd11.prod.outlook.com (2603:10b6:208:578::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 18:54:33 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:54:32 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_svm_usrptr_madvise: Unify batch
 buffer alignment
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_svm_usrptr_madvise: Unify batch
 buffer alignment
Thread-Index: AQHcsXkbdQAlPFyCfUCOIunC7w3mCLWprgqA
Date: Wed, 11 Mar 2026 18:54:32 +0000
Message-ID: <bc802debb759f521815c448ef67bfafdf941d9cb.camel@intel.com>
References: <20260311170354.475828-1-nishit.sharma@intel.com>
 <20260311170354.475828-3-nishit.sharma@intel.com>
In-Reply-To: <20260311170354.475828-3-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|IA3PR11MB8920:EE_
x-ms-office365-filtering-correlation-id: 002c029f-4aa6-46bc-6b6e-08de7f9fa211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: PgHTAfzV+2CDAtRRq+BchVUtX4OtCfGS5nU6nIYmKgggZKKOn15l8KT4+cXY9G60jyOhbsV9jCDE3qRUVUOvYVZ176bCqQNVSAp7BFxfAUrrTtp/D4f60prfLvxek5+QmoKgFODS/6Zf+o2aJnLuqkdVBzxQBh5/VQfLek/80jMhOMyL80lRpDJ2zejtlKDCMayWCf9TbQ8t0QAJagaJ7ARSree4lmiLJb2dRL8vSrMwAxwLdRDFfjXv36lZh0SLfc3U09Rl2jNMuQo9kOkhwLsFDNJvrxwhpCCnTEx2VZBWue9KUUnpgg8zILPxrB7rNT8gn1IkJ39xMDfGNGYPp9RSJQljjIe5Ezq097lOCOuKx9XjIFTDxZhwuYUGz4QEOjL/X0ZyzB+id0a3U8laIeT9cajWn+SY+xq39xZJTujmC9+5YNDv59pS7QrNaaTDtieTZfZbQbjO4Asp19Hf1qHPnPs477xhSkKOrob/4B+gnhtdKmxmjWyfbzVg/ewKRnINoZMIrZYb3MaWctAndWicDKztBa8srNxMAPUlhKmEpK4vVf4A2bKUHGnS4ZFTn6KMDb7Vf90cR4vXLlLesykhfesMd0CSSVw6pdqiCOwYBTxd51FtZWXWHj4O5klHj31JkJCy0eLBsRjLXq2HW9LGJ7j+w12ktFq53M1O+E2efTsl+NSn6kc65dcEY6J9eD23J29ZsJWustQKzKGm2X+KA81PYLpHp5X0pKRgn7TtA5BsxJtILNzOeH/rg0RFmdj8duY98xZu+J43EkMPxw4V4lCM7pLs03+H3xxP9Gw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG9YSFZudkI4eHlLdGsxZGt3QmtLaGM0VC9oSUhtV1NkN2JGRWdxMldwWEdj?=
 =?utf-8?B?d0NtY2EwMXNzYWppd0pINVhEanQvT1huejZvVFVla00yKzNXeXJXOFhBd0NP?=
 =?utf-8?B?VEYwMGRKSUlrcFltWGEwVlQwb3dQdXZCSW9WMDBPbDIzQkFCZ21WbCtCUE01?=
 =?utf-8?B?VVBLZVFmY3RyTG1sWG5pemJwRlJzMTlUVEJsdmwxa2xSMVZpM0FNVXlBcmtE?=
 =?utf-8?B?R2ZVckZzcStyQldSd01HalJadUp4M2tCYXlRaWQ4ekpJRjliN2NIT2hDb3NB?=
 =?utf-8?B?b05SRGFvNjdIMGs3MDQ5eGF2RGVlR1B0RlV1enI4UzFtS1hQTTZPZHh1YkhR?=
 =?utf-8?B?cHJDdWlaSjIwQU9lSWNyOElzVzFxcGlwUjVNblZEM3FRK2NFemI3ZnlmaHMz?=
 =?utf-8?B?L3czY0hlUHZhVmU1R0RMTU4xZlFUMG41TzVuMlJLUDdGaWZRZW9pUVRuTEts?=
 =?utf-8?B?dDdHQkZweDNLWkFXYk14SVo5TVdNWHJzazBlMDIyTngxdlJ5cHlqTTg0U2hs?=
 =?utf-8?B?dXJlMkttK3Z0WFpOMERxeC8zU1FLNTArRVpJL3hBUmYrRE5OSmhOVVk4SWx6?=
 =?utf-8?B?UjhTOENFOXE1ZmlsWmt1TlN1SnJVcStxcVR6dVg2aHhZdVBveW4wZFo4MFJi?=
 =?utf-8?B?eEprMHlFN2tPU3I2aWswdDlNalRqNnFNMGZqY2tBUWVEaTJGblowTk9NQzFn?=
 =?utf-8?B?c1JxOGdzd3FLbms4d1V3dmhQYnY3a3kxVmthL3NpaGRtVnh4UDJRbWd5YTBP?=
 =?utf-8?B?VUNrb2pmWmRMK3Y4ZTVvcTVHajE0YUZRTXdnaWc4ZnZyVXF4SHhmNUdMRWll?=
 =?utf-8?B?Mm5TcVZqTHFsWmFPbWhtbHdRY2c5NmtNTjY1NTVLTzM4elNtZCtWNDBXL2hv?=
 =?utf-8?B?a1F6Qk5wVFo1ZkI5Y2NoSENVTGhrc1hYOHZVV0FCZDZESThHbENSVXd6U1F1?=
 =?utf-8?B?Z29UcElKbEJGSzgremhoYzYrV1hXRXllQytNcy9uVTI1dHNhMXFCaGorNXhZ?=
 =?utf-8?B?WkNJNm1ucFhjak1kZHgzeklaM0dLL1p6Y2hybTB4LzgyYWlZbUFOeDNHcTlP?=
 =?utf-8?B?Skc4bGgwc0Y3YkpFcXNmQno4cVBLY0dpaEp4d2NtQk8wR1o4b3dzamRJY08y?=
 =?utf-8?B?V3RWeVdDRHBJWkI4a0Fua3pxdFRObkZydUxJVmJCNUJKVnEzQW9sbTQ5MDZr?=
 =?utf-8?B?dmwwdU1lZlkwVVJKT1JKVmtPRlc2MkdHM1FQdkJneU12Ui9HZFg3ZVZCQUQy?=
 =?utf-8?B?NGxPY1FNdGQzYWJ4blJNSmpjSnZIb2dkK3MxNkRRYm1pQms3bkkzSVMxbG10?=
 =?utf-8?B?NjhzdmdmNWs3RWlUaEI4V3F5WVFNblY4WWNMUkFVYVZVWnBIa1pWSVFYRENF?=
 =?utf-8?B?LytTc0dHbVpRRytsVzhRem5kd2NqL043UHh4Z0EvWHN2TWZXWmkrUnV1WVRr?=
 =?utf-8?B?REFWZC9iclc3WEFod3VoQjBMb2o4QUlSczg3MklXT0hjb1dxVHpacHBkOGF3?=
 =?utf-8?B?bzdaSmFaS2I2aTNERkgrOVFxM0xKVFRLdi9MTTJnbEljSjVUZGFMZXlxa21O?=
 =?utf-8?B?MFhldzg4dmQ3RitWWFRXOEFVUGJZbzYyalhvRzJOUkRiczJvY3RVbXdtMzVh?=
 =?utf-8?B?di84ZXo0ejJxeVd4RERJbDJUcE9nVkcraXIzUUppSDhTUFhUaHRDUGtkVk5m?=
 =?utf-8?B?ZnFvMjB1bXVuVUlzZHY3Q0YzVEFDaFdCMGo1TFFkQ1ZqcUIvTU5CdU1SS2JX?=
 =?utf-8?B?RnYyR2JXeFRzaGtBR0dKeWdMak5YeWdlbUJXOWt5ZGJBWjNDRUNQNXQ1cVg0?=
 =?utf-8?B?aDRrenlKL0xacUNOWC8zOHZCaWJ4Sy9nVTJtbEZPbXJSYWhSMndGRjdSaHB1?=
 =?utf-8?B?VGVVM2QvT0krbjR1d1N2b2xqUDFaeUVCOFY5bTdSMjBIYVlFUVdUSHh3NnU0?=
 =?utf-8?B?YUxyZWZVTGlOQ01rcE9DcWkvaDNzdncwRjVwVm9hcWs1c2JOYnRSV1puOEoy?=
 =?utf-8?B?SDNyMVRpT0JHUm9JWTBSZ0NlNzNnRU1IS1BmYmpuU0M5NnNKSjI5d2Q0TEJw?=
 =?utf-8?B?WXh3WUZmYmdxWk9pYThWVEVUcjRrUzRUMXRiWVpCOWxjNmNhUk5CL3JYeDlE?=
 =?utf-8?B?NHdCR2h4N1dyZmpxSWc5ZEJXZVdTc0NRWGlaZDJlM21MR3VVQTZjMHNIU3dj?=
 =?utf-8?B?V05DZHN3QitpZkNYYkpBay9wYzBjVFpFMjBXdUs1cGcxZnVpK0NmVUFDZXpY?=
 =?utf-8?B?ditPblRveXhHQW43b0hTTTdUd0J4ZmJnRFJndytick8wUUdqeXN4QXZvS1ZQ?=
 =?utf-8?B?SG1FVUFNZWhkSFh1OGFReHJ3MVRqM2ZkVk5HZUxrNlZkTGRub2hqcXZHS0Vs?=
 =?utf-8?Q?VQBqJwwZd0dxb++RhZ4a5OgtdWMBwz9qwHsYwNa6m+YpR?=
x-ms-exchange-antispam-messagedata-1: vU1iolP3ikHjfQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <43360715572B41429DEA08063FCAE20C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EWoR2aImwDPOQLpd0PNoDbUqou81isBi2G0tvWSxH8YKPhb2UGdv6ox1OROHAWIIXteRf+RYYNV0yUPp3ijdKHXB4ALajrKX74XfleDi0A95YlP5Vl+P2qy1+FcapgCfYuNlUd4vL07VawE6hbF+l2C76SLAXp5E6ugSjpeH3y2L0brWxF0nDMuRYDByVY/s9qYaP9rCFmssVh7lgfgxBlhJZUsOFcAEEz4yPYYU5LWtPKFaxgoIpVS0+lr2rQuAT99bi3r4HUbilHYSlW1fp+yM0YWtXAEZ+mINiKr4FNRbi2Kt7mHNKxg0geR401M+t4Y91JloALulVTZdYeTFeQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002c029f-4aa6-46bc-6b6e-08de7f9fa211
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 18:54:32.7537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OWCUFZ9VxA9AYenq9+hChmvJNNRi7eUMzN+DbNf1AoaPXN8dOvpMyavZ0s1o5F0FMMYorFEUJhYAYlBmGjxNWdEO6Yx+LQ4tJQly5kfuySA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8920
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

T24gV2VkLCAyMDI2LTAzLTExIGF0IDE3OjAzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHBhdGNoIHJlZmFjdG9ycyB0aGUgU1ZNIHVzZXJwdHIgY29weSB0ZXN0IGFu
ZCBiYXRjaCBidWZmZXIgc2V0dXANCj4gdG8gdXNlIGFsaWduZWQgYnVmZmVyIG1hcHBpbmcgZm9y
IGJhdGNoIGJ1ZmZlcnMsIGVuc3VyaW5nDQo+IGNvbXBhdGliaWxpdHkNCj4gYWNyb3NzIGJvdGgg
UG9udGUgVmVjY2hpbyAoUFZDKSBhbmQgQk1HIHBsYXRmb3Jtcy4NCj4gQmF0Y2ggYnVmZmVyIG1h
cHBpbmcgbm93IHVzZXMgcGxhdGZvcm0tcmVxdWlyZWQgYWxpZ25tZW50LA0KPiBlbGltaW5hdGlu
Zw0KPiB0aGUgbmVlZCBmb3IgcGxhdGZvcm0tc3BlY2lmaWMgYWRkcmVzcyBhc3NpZ25tZW50IGFu
ZCBjb25kaXRpb25hbA0KPiBjb2RlDQo+IHBhdGhzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlz
aGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoHRlc3RzL2lu
dGVsL3hlX3N2bV91c3JwdHJfbWFkdmlzZS5jIHwgMTEgKysrKysrLS0tLS0NCj4gwqAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2ludGVsL3hlX3N2bV91c3JwdHJfbWFkdmlzZS5jDQo+IGIvdGVzdHMvaW50ZWwv
eGVfc3ZtX3VzcnB0cl9tYWR2aXNlLmMNCj4gaW5kZXggYmZhNTg2NGU0Li5kYjdiOWVlMzUgMTAw
NjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3N2bV91c3JwdHJfbWFkdmlzZS5jDQo+ICsrKyBi
L3Rlc3RzL2ludGVsL3hlX3N2bV91c3JwdHJfbWFkdmlzZS5jDQo+IEBAIC05OCw3ICs5OCw4IEBA
IGdwdV9iYXRjaF9pbml0KGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90DQo+IHNyY19hZGRy
LA0KPiDCoHsNCj4gwqAJdWludDMyX3Qgd2lkdGggPSBjb3B5X3NpemUgLyAyNTY7DQo+IMKgCXVp
bnQzMl90IGhlaWdodCA9IDE7DQo+IC0JdWludDMyX3QgYmF0Y2hfYm9fc2l6ZSA9IEJBVENIX1NJ
WkUoZmQpOw0KPiArCXVpbnQ2NF90IGFsaWdubWVudCA9IHhlX2dldF9kZWZhdWx0X2FsaWdubWVu
dChmZCk7DQo+ICsJdWludDMyX3QgYmF0Y2hfYm9fc2l6ZSA9IEFMSUdOKEJBVENIX1NJWkUoZmQp
LCBhbGlnbm1lbnQpOw0KPiDCoAl1aW50MzJfdCBiYXRjaF9ibzsNCj4gwqAJdWludDY0X3QgYmF0
Y2hfYWRkcjsNCj4gwqAJdm9pZCAqYmF0Y2g7DQo+IEBAIC0xMDgsNyArMTA5LDcgQEAgZ3B1X2Jh
dGNoX2luaXQoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3QNCj4gc3JjX2FkZHIsDQo+IMKg
CWludCBpID0gMDsNCj4gwqANCj4gwqAJYmF0Y2hfYm8gPSB4ZV9ib19jcmVhdGUoZmQsIHZtLCBi
YXRjaF9ib19zaXplLA0KPiB2cmFtX2lmX3Bvc3NpYmxlKGZkLCAwKSwgMCk7DQo+IC0JYmF0Y2gg
PSB4ZV9ib19tYXAoZmQsIGJhdGNoX2JvLCBiYXRjaF9ib19zaXplKTsNCj4gKwliYXRjaCA9IHhl
X2JvX21hcF9hbGlnbmVkKGZkLCBiYXRjaF9ibywgYmF0Y2hfYm9fc2l6ZSwNCj4gYWxpZ25tZW50
KTsNCj4gwqAJY21kID0gKHVpbnQzMl90ICopYmF0Y2g7DQo+IMKgCWNtZFtpKytdID0gTUVNX0NP
UFlfQ01EIHwgKDEgPDwgMTkpOw0KPiDCoAljbWRbaSsrXSA9IHdpZHRoIC0gMTsNCj4gQEAgLTE0
MCw3ICsxNDEsNyBAQCBncHVfY29weV9iYXRjaF9jcmVhdGUoaW50IGZkLCB1aW50MzJfdCB2bSwN
Cj4gdWludDMyX3QgZXhlY19xdWV1ZSwNCj4gwqAJCcKgwqDCoMKgwqAgdWludDY0X3Qgc3JjX2Fk
ZHIsIHVpbnQ2NF90IGRzdF9hZGRyLA0KPiDCoAkJwqDCoMKgwqDCoCB1aW50MzJfdCAqYmF0Y2hf
Ym8sIHVpbnQ2NF90ICpiYXRjaF9hZGRyKQ0KPiDCoHsNCj4gLQlncHVfYmF0Y2hfaW5pdChmZCwg
dm0sIHNyY19hZGRyLCBkc3RfYWRkciwgU1pfNEssIGJhdGNoX2JvLA0KPiBiYXRjaF9hZGRyKTsN
Cj4gKwlncHVfYmF0Y2hfaW5pdChmZCwgdm0sIHNyY19hZGRyLCBkc3RfYWRkciwgU1pfMTZLLCBi
YXRjaF9ibywNCj4gYmF0Y2hfYWRkcik7DQo+IMKgfQ0KPiDCoA0KPiDCoHN0YXRpYyB2b2lkDQo+
IEBAIC0yMDksMTAgKzIxMCwxMCBAQCBzdGF0aWMgdm9pZCB0ZXN0X3N2bV91c2VycHRyX2NvcHko
aW50IGZkKQ0KPiDCoAkJCcKgwqDCoMKgwqAgJmJhdGNoX2JvLCAmYmF0Y2hfYWRkcik7DQo+IMKg
CWdwdV9leGVjX3N5bmMoZmQsIHZtLCBleGVjX3F1ZXVlLCAmYmF0Y2hfYWRkcik7DQo+IMKgDQo+
IC0JaWd0X2Fzc2VydChtZW1jbXAoc3ZtX3B0ciwgdXNlcnB0cl9wdHIsIFNaXzRLKSA9PSAwKTsN
Cj4gKwlpZ3RfYXNzZXJ0KG1lbWNtcChzdm1fcHRyLCB1c2VycHRyX3B0ciwgNjQpID09IDApOw0K
PiDCoA0KPiDCoAlib19tYXAgPSB4ZV9ib19tYXAoZmQsIGJvLCBzaXplKTsNCj4gLQlpZ3RfYXNz
ZXJ0KG1lbWNtcChib19tYXAsIHN2bV9wdHIsIFNaXzRLKSA9PSAwKTsNCj4gKwlpZ3RfYXNzZXJ0
KG1lbWNtcChib19tYXAsIHN2bV9wdHIsIDY0KSA9PSAwKTsNCj4gwqANCj4gwqAJeGVfdm1fYmlu
ZF9scl9zeW5jKGZkLCB2bSwgMCwgMCwgYmF0Y2hfYWRkciwgQkFUQ0hfU0laRShmZCksDQo+IMKg
CQkJwqDCoCBEUk1fWEVfVk1fQklORF9GTEFHX0NQVV9BRERSX01JUlJPUik7DQoNClJldmlld2Vk
LWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+
DQo=

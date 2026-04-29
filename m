Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A131AFF8875
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 19:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C5510E400;
	Wed, 29 Apr 2026 19:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYcRKFdW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3708B10E400
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 19:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777490676; x=1809026676;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=rvpPT+zrWmihY+U5SzmpMQjdZMj7d9+xtnjHaUnygmE=;
 b=eYcRKFdWzwytw8nPOtAII1RvbQoZ5M+0WPYpa3QDjkhbvZ55eMo/rriC
 0DmCw5NRHrVoD2UV5t+rR035cjT+iJXUTsjp58L0q1rIT6SK3RZwsdmW0
 N6WgZj/szCaoIliNf52/bxKBQBKVJbpIxA5PrH9QuhMtkG/QkTOwGGpjv
 Nh8OVc5Ij3q+hwVsf793DWsdxRdgbjYZVTADQ4125PPbRZhpf3fu9VK7/
 4pRjtoiblAw3BjABpnW3920K6ZJSzmXy2tZhDCd0XIhRQDJlfWE2XNCEH
 aypNfJHKJdYLdiulRqpibgxCm8Uf8yFhWM6ORhBjR3hVJuJosuSqo1dC3 A==;
X-CSE-ConnectionGUID: 0WjsMqGCQ1O0f76pJksKOQ==
X-CSE-MsgGUID: fwJRpclCT/erk95K4tKFig==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77457922"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="77457922"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:24:35 -0700
X-CSE-ConnectionGUID: gR8fW5zGR4yTRO+nHMpPrQ==
X-CSE-MsgGUID: mLEFFIsMSCe2UXs+1HaRug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="234629696"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:24:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:24:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 12:24:35 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:24:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbPensPIzotOXlaxzA0yl95vJtFTEITDjQ+uJoN2hSFtiV+OgKqRCQAutWQ+oNQuSnONA5IuK7BhiVqNY0yQI/0FOUO+6uzcHL4svNTOSkf5JTKNuOlccxS8+fr5xytW+Ay1W80xNJMV4SFIkmXlvP4/LNyQ+i/gPIKxiqpof2s9/Gi+Q2jRl/brXlxp26AIIevIjKbOm2z/kDqAZKHCW6IUuOFwPIIlC9QO8+1g69AgrV1qnaPC41I84scO4VsWdyWNbybjx71cFCd5ol8Z5wEsFjzpqVzKGrYWFvltCsc35/ZEWwmSsfW4I33mob9eAZqZpTW6+a97FAETillh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvpPT+zrWmihY+U5SzmpMQjdZMj7d9+xtnjHaUnygmE=;
 b=hB3XAno00Aqvy/Jc4IgzA4b+t3nB73sS+miC9O2Qr9Twi+zOrV07U+XzYHFblmm0Tw2J5NPxzE5dhElCBysCMrIW4HkO5M+IkJ2v4zi9eLYct+KyneyiUK53PdVilIQLJIfmwzTx9qpsNRiRMz10GBUAQV23vc4NVcewN08pujTJr24f/IpzTbYsbggOg7jPmzS5NOIW2qbiCJrZ82sMPnsaCnrKLHAVoCVX0Ley2yiU7v6d7tVnvYsCrOsgeI6vN8tCZBezqj67uwQ0iIveYiuhW73Qfc4m403uQjhwWWxyAkZ0p9ve3t5b/YLiB4JBUsk2PUL8Fo0it2C+qQ+dPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.15; Wed, 29 Apr 2026 19:24:31 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 19:24:31 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Thread-Topic: [PATCH 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Thread-Index: AQHc1309VGUC2aXNLUaRDf8fVMyJPLX2auyAgAABsoA=
Date: Wed, 29 Apr 2026 19:24:31 +0000
Message-ID: <892f9f15894a881e8cf98fc9c12d2cc061314919.camel@intel.com>
References: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
 <20260429020856.1857656-5-niranjana.vishwanathapura@intel.com>
 <ac12c5478231abf50662c7e1f4451e58c8742330.camel@intel.com>
In-Reply-To: <ac12c5478231abf50662c7e1f4451e58c8742330.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7169:EE_
x-ms-office365-filtering-correlation-id: 09d5376b-2048-4f32-3a5d-08dea624f047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: cClJFOkysL3lA4OKliLYvd5UohDmOwCnRnqOqlekvnYf+hl/VQQ8kNWc2ue+aDbcOq+JrQyXh2I1/HhUur+9YxIExqIU4oSlE2ynhNImdoYAGDRgp+1HvGZLelCXvh6p8f/kae7Blw6PUSlsVKM9KJOSXWbeLPGxuTpGYqgf0W7Ww6daz/BncxgS57MOqVG1j7PzBPeo7cKueYDrC50v5SJ5uVVjRYnTVBD4fECk7sNcbxjOQ80hPZP8lLY+FiKNrvboZbuC1WDqUIc0cNRrSlWgXLt4WwDnqdkqlt/G31xmCaBbsD80ExvhISuZooqXAIu6y4lNyfiqQWWYs55eJR7oEVI9Gx3ecpDbMU85un1XH5kY6cV4iZy+SGutQKO2y1PkTrvD1QSDosXLi4qdg0jDBYYT0vCFy8rfIRgfp1+1xsfhbdIEA3MrFf7wfy9MyYVdqzX8VPMVuFMhvjXw4YPPK2bI3XPj4D3MMsg2tcFxcBS9lGD4B8PBFBIt4zUU5lU+/Vg6M67nnev2/RZwhPTVLhPObFFyte/wuSUN1OvIcpB/ZOvZv9qmMUg7lF9TUc2W4dVik4QcAAczScZjbisNrN8zKfFq52/29+dDEksj8Id+riFq8PUKpooCbWC2skHMCxG3UqWxHCXj50QmmoVkNotWPYKXvJzaqo1PGQWrBgYfotYCjucqc5h395O4jX+MjCw0LwfQMpCbG/GIw6NPviH18cr1dEYwwp1AVHyVFOQrQAy3/LNQyOFJ34nK5mAOFnSFUHVBLsa3VGnsy/43whXFaHhJGoH7ewNCLHM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU43QjUvZDlqbTg0enk3QURSNjJvNVdUekpCWjlOTG9TWFBaczF1Tys0bHk3?=
 =?utf-8?B?ZGdOR0JOemNkUWZVYmd3bXgwWDJjaGpBRExYWW94WHNtckFJR2VFdDRBT1Nk?=
 =?utf-8?B?TVc3QTdldU5saEVQZDBiSzgxOTdZb0RpeGFtYS9yckRmcWVWQ1E2ZUZnU216?=
 =?utf-8?B?UG1DbEpZVDllV1FkWGtOb3hHRTcyOXhpb1o4dzRsOSsrZFFlSjI2MEFLbG9V?=
 =?utf-8?B?T1N5d3h0b0taOGo2WEdjTXExZnhFbUlOcGtMOGVqeGIyMFFuaGxScXljSHNl?=
 =?utf-8?B?RHBWeGFGejlPaWxlOVlMT3UyZDgyQmw2QTBmYUVFNy9oOW1GSCtubDZqMUdo?=
 =?utf-8?B?d1lHRlNyVk16YmZGc0xLUUtic1VCaGVHQi81MmVTYWxaaEVKUHdMRTRZQUVv?=
 =?utf-8?B?QnF1bEg0U0twb3Y2SEN1WWpXdGRYTXRrbzJtdWU0bXNHSEJYMlZPV1FraWJX?=
 =?utf-8?B?T01uN3pFRU5xK1ZreXRZbndhbHBOTEFTT0dwQ1dKOHUvaWtpMldpUUR4U0da?=
 =?utf-8?B?eDcwUHluN1VRcXJ1a0hqSjQ4MlE4aU9pYjVCSUluN0tOakpNakhNeTJaMm9a?=
 =?utf-8?B?aHY5MUh3a1p2NDVGSy9CaUhZR1R3S3ZRN1R0SWQrcmpUem95bGpnNWRIZG9E?=
 =?utf-8?B?MUdHY05pQlJrb1o3aGlTOENENC9xTzA5aU5sZE5HSDZYbWFoRGdEOG9CQTFl?=
 =?utf-8?B?SUNMTlYrNW01T3dPSzkrVmMxM3lOUC95ZE45RFhwWTd2QUl3TlJ2b3oycVl0?=
 =?utf-8?B?UHNNYTl3SDhLNFNHNTliMUFCcWZxU2tLbkxhQlBUK0JvdmNlb1RpTThnM2JV?=
 =?utf-8?B?SEY5OXMvclhudzJ5ZjBqUWtZcnZBRzVGTEF5MVZhbnRjbkxaMkpTUDhOMGlt?=
 =?utf-8?B?VTI5eEhjd29tL2EvcGt3OUljUUhWZ29aeGZJYXZZQTlUZ1AwSjU5dGJlTU9D?=
 =?utf-8?B?aWZuY1pUMDFhektadUYzYlhYUU85bGVZYjVpQVZoNjlLZklTeHFBMlowdmU2?=
 =?utf-8?B?dUp5ODIyM3pBczNzVlF5OFRQajBoNTN6UjFqZTVQYlJHelAyZFkrelZlUHN3?=
 =?utf-8?B?U1FPaW85a3owRWtEYm85OHF5MjJickFpNDdEMXgyRWI2NW0yakN6MStMZkRt?=
 =?utf-8?B?empiZzdyQWJhc2M0aGxET3EwZ0tNWVgrNGNKWW9laUpIQXZQcWtxa3NmRlUr?=
 =?utf-8?B?eFphdDFRenZ0RWVqWGlqTHpIU1lYWGltQWNWL2FkMERDcWhZSlNVaE8wOVhY?=
 =?utf-8?B?RnpQZVFlYjdkVjRsUFNySENKOWtmdHRLbGNhU1VLWU1ZeXl4TFBlS1Q1c0I3?=
 =?utf-8?B?dDRURCttbHBQQzdsZXlQSTBKYzBacGorMzNtSmZ3Q2dGaytiV3d6RWhtVUl6?=
 =?utf-8?B?Yml5YUNwK2xlQS9IMWozVHZuYXhaYWdzTG9kVDY3WmdwNWRXR1dxYlF0ZHJX?=
 =?utf-8?B?SnlXZzZGc0Qvb28xQStadjZHajd3S24wbjJqK1FqYVNqR1lTUWc2OEdlL05W?=
 =?utf-8?B?NzEyRUhzUHRrbHNqKzB3Qk0yNEVrR2dENEM4M01vRzU0dDZLbW5oN1YzQWE4?=
 =?utf-8?B?aitkTTdZRm9ydXJsZEk3dEJLYVRGNG10eGpSRG9qK2lQSEw4ME15aUlRNXEr?=
 =?utf-8?B?ajVXUjNqVU1NcVlzZjZFZGNLbmJ2OVA0ekVPOTVld2xMS2x4UjRjOXliTDdp?=
 =?utf-8?B?TTc0RHdxeGV1c3lVUXl6MDdVSG1PdXRDUWpCZURTQUpxaFVMWk9KM3ZqdW5O?=
 =?utf-8?B?WG94UXJNU2xRSjEvSk1BUlNLbjBrNm9ESkpBaHRybW5SQnlLMXFCV3FqRU9L?=
 =?utf-8?B?YUJqTFdnVXRncjVtVkNtS1JWNHB1eVJ0eG4vcHlmRzZpaGVnRkR1NjY4WE1G?=
 =?utf-8?B?cDNYbE5QaTRuQ3JzQXlqUys3TUIyUThEZTJnZ3o3Q2t5aERTQzBYOTJrZm4y?=
 =?utf-8?B?ZDdJMndiNzZKTE5xeDA0YTlCZ1d4anFtczl4Ri9MV3l1UXN4WUxPTldOeEZS?=
 =?utf-8?B?dCs3SDNwLy9KZmdiWHMycWQ4V2VSaUhGdUxIVWJJY0E1UjNwZTJtODFqNFUv?=
 =?utf-8?B?Ync5YkgzK3JHM2lTRGlQWFZ1K0NmNGh4ZU1xdEh6MEp6RlhRendFK0NNejBN?=
 =?utf-8?B?TmliRDhsVGZVS1V6aFdseEdtcGFhUlV6dllkN0RIZG5rQjlzQy8rSHRjOGV5?=
 =?utf-8?B?UnJaV1RLQjBLUlNkT2ZsamU1NEYwSWlyUjBidDhhZ2xES21ra3FnMkJWRlFJ?=
 =?utf-8?B?V3lSSzBKZVAwcy9WLzl2U1phNlNlOU5ZUzJsNGdabFJaR203bU1adEl5Wktj?=
 =?utf-8?B?Qm95dzFoQTcyWit0c09mb1JtRUNldDA0ODRxUzVhUkNsSU5JSGhOL1NxMVRx?=
 =?utf-8?Q?jA5us3rtPVnhcfVw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE15527ABC54A64E997D783024DE35C1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RLzkGoAV6Y6LPj7fhaXdpbKoej0xjdG/L242AAM+bA3lrivV+4zfRfo+yjwu1DrHjU8kgYIN6QtuTAWmfaqAZ6GkWEGUbleDWscpwrRPmcThyIEIZeVCnamJDaVxeS8J7nkewMRCeEFwAgCwORNUBZTVINHeAta917I/y/OEqQED4XQ/d1xuSmfi+EZfd7sgpHU4RlO0MFs93L728JCfa8iaRHAI0bxJ2unsbpItlPDnrlLM1RV+2ufW65hc9VWAZAlrwlrqrZXNm4EGD3L8bhqa8Jf9ryWRoQXrWcGbSFSYlmyrvjwoGSV214Nl1Yu0f67jgRpGkQjKUTfTnYfRTw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d5376b-2048-4f32-3a5d-08dea624f047
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 19:24:31.3174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y3iTMmZ9jg24Omk76Gb2n4ZcPEzF7U8vgwtF4GDqvd1ciJRaLjtowfuVIGa+IafjtzBZzsMggbKkcqoCEQjrgtL1HWbGy00mV5RuiEH5ojE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
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

T24gV2VkLCAyMDI2LTA0LTI5IGF0IDE5OjE4ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
Cj4gT24gVHVlLCAyMDI2LTA0LTI4IGF0IDE5OjA4IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0
aGFwdXJhIHdyb3RlOgo+ID4gSW4gX190ZXN0X3ByaW9yaXR5KCksIGVuYWJsZSB3cml0ZV90aW1l
c3RhbXAgaW4geGVfc3Bpbl9pbml0X29wdHMoKQo+ID4gYW5kIHVzZSB0aW1lc3RhbXAgdmFsdWUg
dG8gZGV0ZXJtaW5lIHRoZSBxdWV1ZSBzd2l0Y2ggb3JkZXIuIFRoaXMKPiA+IHJlcGxhY2VzIHRo
ZSBpbmRldGVybWluYXRlIHNsZWVwKCkgd2l0aCBhIG1vcmUgZGV0ZXJtaW5pc3RpYyB3YWl0Cj4g
PiBiYXNlZCBvbiB0aGUgR1BVIHRpbWVzdGFtcC4KPiA+IAo+ID4gUHJlLXNldCBhbGwgc3Bpbm5l
cnMgdG8gcHJlZW1wdC13YWl0IGJlZm9yZSBzdWJtaXNzaW9uIHNvIGVhY2gKPiA+IHF1ZXVlLCBv
bmNlIHNjaGVkdWxlZCBieSBIVywgYmxvY2tzIGF0IHRoZSBzZW1hcGhvcmUuIFRoaXMgZW5zdXJl
cwo+ID4gYWxsIHF1ZXVlcyBhcmUgcnVubmluZyBvbiBIVyBiZWZvcmUgdGVzdGluZyBwcmlvcml0
eS1iYXNlZAo+ID4gc2NoZWR1bGluZy4KPiA+IAo+ID4gQXNzaXN0ZWQtYnk6IEdpdEh1YiBDb3Bp
bG90OmNsYXVkZS1zb25uZXQtNC42Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdh
bmF0aGFwdXJhCj4gPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+Cj4gPiAt
LS0KPiA+IMKgdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jIHwgNTEgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tCj4gPiAtLQo+ID4gLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDM3
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gPiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNf
bXVsdGlfcXVldWUuYwo+ID4gaW5kZXggY2E5NjA5OWQzNi4uMzgyNzA1ZDA2NSAxMDA2NDQKPiA+
IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+ID4gKysrIGIvdGVzdHMv
aW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gPiBAQCAtNDU0LDI1ICs0NTQsMjQgQEAgX190
ZXN0X3ByaW9yaXR5KGludCBmZCwgc3RydWN0Cj4gPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3Rh
bmNlICplY2ksCj4gPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IG51bV9xdWV1ZXM7
IGkrKykgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1aW50NjRfdCBzcGlu
X2FkZHIgPSBhZGRyICsgaSAqIHNpemVvZihzdHJ1Y3QKPiA+IHhlX3NwaW4pOwo+ID4gwqAKPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zcGluX2luaXRfb3B0cyhzcGluW2ld
LCAuYWRkciA9IHNwaW5fYWRkciwKPiA+IC5tdWx0aV9xdWV1ZV9zd2l0Y2ggPSB0cnVlKTsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zcGluX2luaXRfb3B0cyhzcGluW2ld
LCAuYWRkciA9IHNwaW5fYWRkciwKPiA+IC5tdWx0aV9xdWV1ZV9zd2l0Y2ggPSB0cnVlLAo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLndyaXRlX3RpbWVzdGFtcCA9IHRydWUpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoC8qCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogUHJl
LXNldCBhbGwgc3Bpbm5lcnMgdG8gcHJlZW1wdC13YWl0IHNvIGVhY2gKPiA+IHF1ZXVlLCBvbmNl
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogc2NoZWR1bGVkLCBpbW1lZGlh
dGVseSBibG9ja3MgYXQgdGhlCj4gPiBRVUVVRV9TV0lUQ0hfTU9ERSBzZW1hcGhvcmUKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBhZnRlciB3cml0aW5nIGl0cyB0aW1lc3Rh
bXAuIFRoZSBIVyBzd2l0Y2hlcwo+ID4gYmV0d2VlbiBxdWV1ZXMgYXQKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0aGlzIHBvaW50LCBhbGxvd2luZyBhbGwgb2YgdGhlbSB0
byBzY2hlZHVsZQo+ID4gZGV0ZXJtaW5pc3RpY2FsbHkuCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc3Bp
bl9wcmVlbXB0X3dhaXQoc3BpbltpXSk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHN5bmMuYWRkciA9IHNwaW5fYWRkciArIChjaGFyICopJnNwaW5baV0tPmV4ZWNfc3luYwo+
ID4gLQo+ID4gKGNoYXIgKilzcGluW2ldOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBleGVjLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1ZXVlc1tpXTsKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZXhlYy5hZGRyZXNzID0gc3Bpbl9hZGRyOwo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9leGVjKGZkLCAmZXhlYyk7Cj4gPiAtCj4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogV2FpdCBmb3Igam9iIG9uIFEwIHRvIHN0
YXJ0LCBvdGhlciBxdWV1ZXMgYmxvY2sKPiA+IGJlaGluZCBRMCAqLwo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmICghaSkKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc3Bpbl93YWl0X3N0YXJ0ZWQoc3BpbltpXSk7Cj4gPiDC
oMKgwqDCoMKgwqDCoMKgfQo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoHNsZWVwKHNsZWVwX2R1
cmF0aW9uKTsKPiA+IC0KPiA+IC3CoMKgwqDCoMKgwqDCoC8qCj4gPiAtwqDCoMKgwqDCoMKgwqAg
KiBFeHBlY3QgdGhlIGpvYiBvbiBvdGhlciBxdWV1ZSB0byBub3QgZ2V0IHNjaGVkdWxlZCB3aGls
ZQo+ID4gdGhlIHNwaW5uZXIKPiA+IC3CoMKgwqDCoMKgwqDCoCAqIG9uIHEwIGlzIG5vdCB3YWl0
aW5nIG9uIHByZWVtcHQgY29uZGl0aW9uLgo+ID4gLcKgwqDCoMKgwqDCoMKgICovCj4gPiAtwqDC
oMKgwqDCoMKgwqBmb3IgKGkgPSAxOyBpIDwgbnVtX3F1ZXVlczsgaSsrKQo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnQoIXhlX3NwaW5fc3RhcnRlZChzcGluW2ld
KSk7Cj4gPiArwqDCoMKgwqDCoMKgwqAvKiBXYWl0IGZvciBhbGwgcXVldWVzIHRvIHN0YXJ0ICov
Cj4gPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgbnVtX3F1ZXVlczsgaSsrKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NwaW5fd2FpdF9zdGFydGVkKHNwaW5b
aV0pOwo+IAo+IFNvIEkgc2VlIGluIHRoZSBzcGlubmVyIGJhdGNoIHRoYXQgdGhlIGMwZmZlZSB2
YWx1ZSBpcyB3cml0dGVuIGJlZm9yZQo+IHRoZSB0aW1lc3RhbXAuLi4gc2hvdWxkIHdlIGNoYW5n
ZSB0aGF0IG9yZGVyIGluIHRoZSBiYXRjaCB0byBhY2NvdW50Cj4gZm9yIHRoaXMgc2NlbmFyaW8/
IEFuZCBzaG91bGQgd2UgaGF2ZSBhIGNoZWNrIGJlZm9yZSB3ZSBnbyBpbnRvIHRoZQo+IGZvcgo+
IGxvb3AgdG8gY2xlYXIgdGhlIHRpbWVzdGFtcCBiZWxvdyB0aGF0IGFsbCBvZiB0aGUgdGltZXN0
YW1wcyBhcmUgbm9uLQo+IHplcm8gZmlyc3Q/Cj4gCj4gSSdtIHdvbmRlcmluZyBpZiB3ZSBjYW4g
aGl0IHNvbWUgcmFjZSBjb25kaXRpb24gd2hlcmUgd2UgbWFyawo+IGV2ZXJ5dGhpbmcgYXMgc3Rh
cnRlZCwgYnV0IHNvbWUgb2YgdGhlIHF1ZXVlcyAod2VsbC4uIGF0IGxlYXN0IG9uZSBvZgo+IGh0
ZSBxdWV1ZXMpIGhhc24ndCBhY3R1YWxseSBoaXQgdGhlIHNlbWFwaG9yZSB3YWl0IHlldC4KPiAK
PiBUaGF0J3MgdGhlIG9ubHkgaXNzdWUgSSBzZWUgaGVyZSByZWFsbHksIGV2ZXJ5dGhpbmcgZWxz
ZSBsb29rcyBvayB0bwo+IG1lLiBBbmQgbWF5YmUgSSdtIGp1c3QgYmVpbmcgcGFyYW5vaWQgYWJv
dXQgdGhlIGNhc2UgYWJvdmUsIGp1c3QKPiB0cnlpbmcKPiB0byBzZWUgd2hlcmUgd2UgY291bGQg
aGF2ZSBzb21lIGhvbGUgaGVyZSBpZiB0aGluZ3MgYXJlIHJ1bm5pbmcKPiBzdWZmaWNpZW50bHkg
c2xvdyBmb3Igc29tZSByZWFzb24uCgpBbmQgaXQgY291bGQgYWxzbyBiZSwgb2YgY291cnNlLCB0
aGF0IHRoZSB0aW1lc3RhbXAgZ2V0cyB3cml0dGVuIGJ1dAp0aGUgc2VtYXBob3JlIHdhaXQgaGFz
bid0IGJlZW4gc2VlbiB5ZXQuLi4gc28gbWF5YmUgaW4gYWRkaXRpb24gdG8gdGhlCm5vbi16ZXJv
IGNoZWNrLCB3ZSBzaG91bGQgbWFrZSBzdXJlIGl0IGluY3JlbWVudHMgYXQgbGVhc3Qgb25jZQpz
b21laG93PwoKLVN0dWFydAoKPiAKPiBUaGFua3MsCj4gU3R1YXJ0Cj4gCj4gPiDCoAo+ID4gwqDC
oMKgwqDCoMKgwqDCoGlmIChmbGFncyAmIERZTl9QUklPUklUWSkgewo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBBc3NpZ24gaW5jcmVhc2luZyBvcmRlciBvZiBwcmlvcml0
eSBmb3IKPiA+IHNlY29uZGFyeQo+ID4gcXVldWVzICovCj4gPiBAQCAtNDg1LDYgKzQ4NCwzMCBA
QCBfX3Rlc3RfcHJpb3JpdHkoaW50IGZkLCBzdHJ1Y3QKPiA+IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UgKmVjaSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2xlZXAo
c2xlZXBfZHVyYXRpb24pOwo+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgCj4gPiArwqDCoMKg
wqDCoMKgwqAvKgo+ID4gK8KgwqDCoMKgwqDCoMKgICogQ2xlYXIgdGltZXN0YW1wcyBhbmQgcmVs
ZWFzZSBhbGwgcXVldWVzIGZyb20gdGhlCj4gPiBzZW1hcGhvcmUKPiA+IHdhaXQuCj4gPiArwqDC
oMKgwqDCoMKgwqAgKiBUaGUgb3JkZXIgaW4gd2hpY2ggdGhleSBuZXh0IHdyaXRlIGEgdGltZXN0
YW1wIHJldmVhbHMKPiA+IHRoZQo+ID4gK8KgwqDCoMKgwqDCoMKgICogcHJpb3JpdHktYmFzZWQg
c2NoZWR1bGluZyBvcmRlci4KPiA+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ID4gK8KgwqDCoMKgwqDC
oMKgZm9yIChpID0gMDsgaSA8IG51bV9xdWV1ZXM7IGkrKykgewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoFdSSVRFX09OQ0Uoc3BpbltpXS0+dGltZXN0YW1wLCAwKTsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zcGluX3ByZWVtcHRfbm93YWl0KHNwaW5b
aV0pOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogRm9yIFEwLCB3YWl0IHVudGlsIGl0IGlzIHJ1
bm5pbmcgYWdhaW4gdG8gZW5zdXJlCj4gPiBpdCBob2xkcyB0aGUgZW5naW5lCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogd2hlbiBwcmlvcml0eSBhcmJpdHJhdGlvbiBpcyB0
cmlnZ2VyZWQuCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFpKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3aGlsZSAoIVJFQURfT05DRShzcGluW2ldLT50
aW1lc3RhbXApKTsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oC8qCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBWZXJpZnkgdGhhdCBzZWNvbmRhcnkgcXVldWVzIGhh
dmUgbm90IGJlZW4gc2NoZWR1bGVkCj4gPiB3aGlsZQo+ID4gUTAKPiA+ICvCoMKgwqDCoMKgwqDC
oCAqIGhvbGRzIHRoZSBlbmdpbmUuCj4gPiArwqDCoMKgwqDCoMKgwqAgKi8KPiA+ICvCoMKgwqDC
oMKgwqDCoGZvciAoaSA9IDE7IGkgPCBudW1fcXVldWVzOyBpKyspCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydCghUkVBRF9PTkNFKHNwaW5baV0tPnRpbWVzdGFt
cCkpOwo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoC8qCj4gPiDCoMKgwqDCoMKgwqDCoMKgICog
VHJpZ2dlciBhIHF1ZXVlIHN3aXRjaCBieSBtYWtpbmcgdGhlIHNwaW5uZXIgb24gcTAgdG8KPiA+
IHdhaXQKPiA+IG9uIHByZWVtcHQKPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBjb25kaXRpb24sIGFs
bG93aW5nIGpvYiBvbiBxMSB0byBnZXQgc2NoZWR1bGVkIGFuZAo+ID4gZmluaXNoLgo+ID4gV2hl
biB3ZSBlbmQKPiA+IEBAIC01MDEsNyArNTI0LDcgQEAgX190ZXN0X3ByaW9yaXR5KGludCBmZCwg
c3RydWN0Cj4gPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksCj4gPiDCoMKgwqDC
oMKgwqDCoMKgaSA9IDE7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgd2hpbGUgKGkgPCBudW1fcXVldWVz
KSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaiA9IDE7IGogPCBu
dW1fcXVldWVzOyBqKyspIHsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKHhlX3NwaW5fc3RhcnRlZChzcGluW2pdKSAmJgo+ID4gKChhbHJlYWR5
X2luX29yZGVyICYgKDEgPDwgaikpID09IDApKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChSRUFEX09OQ0Uoc3BpbltqXS0+dGltZXN0YW1w
KSAmJgo+ID4gKChhbHJlYWR5X2luX29yZGVyICYgKDEgPDwgaikpID09IDApKSB7Cj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgc3RhcnRfb3JkZXJbaV0gPSBqOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NwaW5fZW5kKHNwaW5bal0pOwo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHhlX3dhaXRfdWZlbmNlKGZkLCAmc3BpbltqXS0KPiA+ID4gZXhlY19zeW5jLCBV
U0VSX0ZFTkNFX1ZBTFVFLAo+IAoK

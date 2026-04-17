Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7994F43680
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7353A10E992;
	Fri, 17 Apr 2026 08:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hs3ZbLfi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F4410E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776415785; x=1807951785;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jFZLVobZ3YvmQzs04f/sRFnQu3aMaGnWKhYPsShcp5g=;
 b=hs3ZbLfio0gyCxnLarSTz4VhdzppkIBYjwsPIPIGwZFHkur6brHSrWBF
 uA9RNGCK6AJX3c3FgYQYpnasMQ4YAHWDNZMypMKu/4ImRez+RTWNww7Nh
 PamUOajQMeDf24+zh3XK9/1Wq11i8138DEV3KW175/BtrAhN9dvB0/ymT
 7vADX0ytHDKcdB/AGGBg6308cndpIUBIJm0+a/SWSPSGkH1Nj9tyiKB8w
 6rjl+HvUxCIFrHMgU6NTDsVX72T9h4ZoHOLoP3oiNhsCz3WQVLhbG3vjZ
 K8PHlGHtPL7egcNIFvEX/tdBAr65Pd0SAKHmQ3JkKTfcME9bgMdqS9U5U Q==;
X-CSE-ConnectionGUID: DzMq/c2LSoafrQL33qMU8g==
X-CSE-MsgGUID: Xpv37cukTTOhW8UG1X8mrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88882235"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88882235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:49:44 -0700
X-CSE-ConnectionGUID: CurgXbBeRASaRRT0rqyCPw==
X-CSE-MsgGUID: RYgbRS3oQMOcF3vkPG1Biw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="230862471"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:49:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 01:49:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 01:49:44 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 01:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSnetTtwtepnddBCWmALWIB/KqMCbce9DsIFVg4VINQ6VX729x3jQ/OjWd9l1VfpwBECZK7lk/HlrONOuWHcMiABozMhLWpvulRtKSn6v2ZP33E9JOZx3HIdzi4Ur5EriqfbAdxse7KF/8vqzcofGtEDDb3VswwmhvgllvpaJpqj4dFDYmFDBtE/RDcxzV/w8FarPYwSxhoxaCYyRQgXvBgYD4ZwkRxF/r5JA2zj1rzalDW+8ZvE0PK45+3km7FqYHScC9Vx4YTqrU+bEUekg9YCsEkszrR0GI7PP/G1Ag87VbXoptPaTDw/Pc6Gh/etGAbt3V44YoHWsBjfOzp/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFZLVobZ3YvmQzs04f/sRFnQu3aMaGnWKhYPsShcp5g=;
 b=MZao2PqxdI7OqYbX9YpRS2CA7lTzYg4HGlqPhlNEjrFuxOHC5c+8pvj6XKiKH4++j+zQAypyTPO8NPYMiwGxv5lmBLf3fP3YPP98ioVwEXg5FY3HjE4J299tgS0/Xx8jBybHBwdN9OWZq+lG9dBJ2OhEFlRDa3AUcibNaBwixMhWhvbZYtxb5yJSV/vxZFPhJOgoctpV5kaqbuDy+VlYX3RcGCCdoeqUbcNz+10OYxit1zFWQFFJ9Uww7YoPEG2u4z1/1s5VWlkESg40yrbKp6WpMSrqy+Jwd/u3mGMHS7lRUkxM+Mo4zO+PTKQUE78YSvHi5qCCg2c4ogMEkje73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:49:41 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:49:40 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on
 platforms without RCS
Thread-Topic: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on
 platforms without RCS
Thread-Index: AQHczXZ9UDvVtHhLBE+kPv0JMnittrXi2pcAgAAUI6A=
Date: Fri, 17 Apr 2026 08:49:40 +0000
Message-ID: <SA3PR11MB811812B8261107AC95263D3CD0202@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260416083004.2723418-2-nitin.r.gote@intel.com>
 <17bda989-1bc2-43c6-b1db-bc301b85d0af@linux.intel.com>
In-Reply-To: <17bda989-1bc2-43c6-b1db-bc301b85d0af@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|MW4PR11MB8290:EE_
x-ms-office365-filtering-correlation-id: f61a6499-aa12-42f9-e805-08de9c5e43a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: c/tX8Xp1I15y0WYWdiKfINuU6sNp32MioGa68aHxZwvXAii5dw7V2P5q1rI902Vxzd9f6SLaxGPeVTRTGlN+RDsGCsABnlqXp+jA8XsSB6gEqKPKw5BmuMT0G2XXTL04vukmQV7stGcfebvm1OW0ULTfTKHmq+KgnHu4/3KkkXkqTmxv2TCbInWuiP6vvClZUQ3aHvx6xSDxIDCZJzhIdc5eos+Iw85ovaIWJcnhrwMKHyGVrGMIF39F/bPKPXAMSuoIxv620Z8WakxprUaahcDkmFMwyXRUOAPh3ws5Zv7VgarfM6GbBVY6ov2tXR71SS4DYNSdJGUIHZ2dSeCfgiICkX6LwcGWz+PmGO98OyDI/goSvQdoUwQLFqUc+7ypCjitHzgGxxNxdYjFIp+IHNztRzFQizmtlNL64UtmapxzUctulCsIFGipBJQ6dCqPEFoheXRQql2+x7Mzt0+Xb1sW7ocaSlH0iWdy7Vz2tA+rXaJM5vsLxUNPfyFU57iwWxkUeF6bFNZW0Y19NW2Y+KJmcipQ6+m1MmjSfGIdOCF9IeySpgbWE4Kld+UkRp9nIlfphklycS4N6HDVQu2SpPMb0MXlpc4A2nhuq+AzbPijjfHUBHi+ix8xOL9450084MLrCc+ufFKRQhh9vGvIYktM8KG1zIagsqT3AViCM0vrg3uj0sVh9T76tw/WvOs9H8bEHdqGXUd34t1GUS/kPKM330RE+yRN62xIOLcdwf7fP+xumkybIryfW1EpcZ8HW4i/0iDw9tL3+Y0UHCrPnsg294fqZZ6tWaLB4dCFJYc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2JJcTliV0lUaGoyNjV6eDcrQkFCMFBDUWtlMUZpQjVsVFFHeEJTWExtMnJp?=
 =?utf-8?B?YnUwRGs3SEdGN0ZMdSswRUZZMjJPb3FMTWpTUFk4dUFJdGtGMk5JRFk4bEJB?=
 =?utf-8?B?U2hESXp1amZLb3I2bHN3R3lKWGZiOTF5RFd5TDE3dkZVdHJGVWtKY1ErdFJz?=
 =?utf-8?B?SE1vRCtGbmhSZWNIb1lrRi9jeTBUN2xtUDNRYWxjeFlMaXhLM1Z6aFlvSFZk?=
 =?utf-8?B?NzlHZDlyYW9KVHlHL2hpL0dTUE5zdGRPcjd6OGlFRXB6M2hGdEpUYUFNaHUw?=
 =?utf-8?B?R0JCYkZjNXhiTFgwK0srMHZzVnBvTkJlTG1TTWNWNkVVTmExMVp0UDFSUlpP?=
 =?utf-8?B?MG9IV3IxSzN0d25VbDlIRkQ1UFR4VllHS3ltdC9iK2hCZytLMFY3cXpvaFNB?=
 =?utf-8?B?aDB0Z1BJYVYrZ2trNlIrUUZhMWlTdkNIbDN4V2FBa2dkVHYzQ3VmUEZaZE5E?=
 =?utf-8?B?b3ZhRG42Q0Qxc0FaUGs0aHRMbSt6dDJIVktXNzIrTE83M2NBK29tMDdKck9B?=
 =?utf-8?B?UUJPM0NWUmhlRW9aWTVpU000WE8rbEo2TEcvU2twamtJc1BqNDZyNnNMek4y?=
 =?utf-8?B?Y1JsUE5GbE14UDc2SWNxS3NNTVZJNk84eVNKbmVrWVh1UmhVYkhMOS9PbWNP?=
 =?utf-8?B?VVFVVm16elVaaVd2cE52RUFWT1cybGZsRnZEdldpblZBZEZtUEtMczlCV3l5?=
 =?utf-8?B?Y0lFU2FldjF6T1VKemVIbGFlNHFDZE5zNVRwc3F2YTEzbHJUQ3UrZkxURG01?=
 =?utf-8?B?YWh3Q2JSNG1jcUJuWm1Bbkh4V2RQblgxYXpLdkFJNlhUQzFBaFBPNlZVV2xq?=
 =?utf-8?B?TlppSThsUjgwSGY2VDB3Zlo1OGI5OTFKRERDY1dOYWlONG9CT1NwdmVLMDU5?=
 =?utf-8?B?VXFNSUFBNng4dHFlaG85RDRXOWtWcmNyNHYwbEptcEhZeXFCdVA1dnFZMjRK?=
 =?utf-8?B?eGF5RnVaVk54UmR4eEdUMTV2VzVLWEtrcC9vL0xZWkFWMFF1dGh4N1dnSUtj?=
 =?utf-8?B?bjBCS2F1RUJlUGg1M3B0eEoraVZmU3U4bEdTNW5XZjZOUEZVS2ZvU0JOOUl0?=
 =?utf-8?B?L0wxR0luTjRXMGFYRjYvT3phTjNQRExxaENRSHFDU01mTG1VQ2FSSnlORkRo?=
 =?utf-8?B?dWlCd2MvUlVTSEpPNGw2ZGdpckl0bEJvZHhoRTJuK2NyTk84VldaRzE2bzdU?=
 =?utf-8?B?ay81UC9iWHB4YWMrRUtidjI4amV5VTM4MFNNRXB0cmt4ZUZKSGFQTXMzUU9G?=
 =?utf-8?B?em54OXdsaXE0cWYxRnpXeGtjZEJtbEdQcXNhMExlMXBEZlUyWERWWXJ5ajFD?=
 =?utf-8?B?dUpMaUJhUjNMY3dSeHoyT1pXeFZWS05PZm9FYVFpZmwzMGRobVVKVllycTFK?=
 =?utf-8?B?QlhxaVFYdzl4YStyeTFMMzQvYUlZbEVPdDlKVU9FY3JwQlhycERVRDRqVG5K?=
 =?utf-8?B?aC9Bd1RFMzBscHBjaVZHcHJjcmoxSXN3czdyVDBMcHhJRm9wWi9idjhsZG5j?=
 =?utf-8?B?bDlrWURSTWprUVlaVGtjUm1kQWJDbzVaZEVMaHJxSXpVOXoyUWRjaEdOdUZL?=
 =?utf-8?B?NWp0Y0dKaW96TUFsWk9jQmp6YzVBNWtlMDcwNXN1N085RjdwREY1TWpGczgr?=
 =?utf-8?B?NHVyT29JM2luYlpNYlo2V3dqdUh2azU5WFJ0WWFRSWRCUHh3MTVRd2hKSUVn?=
 =?utf-8?B?Y3BGaDBUeVVOa09zdEVzMmZuU1NuTzJUa2tFOEl0S1MyWDA4aWk5SDdXVjVj?=
 =?utf-8?B?dFQzWlVReUxqVzdSemxHOHVWamJObnNORnFRUWYrZUlaQitqQzE1bmxiRDFi?=
 =?utf-8?B?K0JYMHFxRzdCRzRVelllMG1rNFhVTUd6ejFmYjdjM0dmbDhwL05DRFpZSzUy?=
 =?utf-8?B?S21LRDR0c3hxQ1ZWRktrQU14NVludm9qQklGS3VwUUVjOGtEbGtxQTFMbnow?=
 =?utf-8?B?akpLcGk0QjJlL0dyelB4QnM4Z2NDc0hMZW5WelZHVjdmUklZT0JXdEhPQ2hP?=
 =?utf-8?B?ZnhWQkFoL0daNjY4S1BPNnN5ZW14TGZ3ZjlLNFlGUHRGbkI3OFgwVzNRMmtX?=
 =?utf-8?B?Z0Fab2RiZG9ZdlNLV1JycFB5VjIrOVNOaVlZUmJLSzNianQvOHJqd0w0L0NJ?=
 =?utf-8?B?bE5KZEJKeFRyQmJVZGQzS0JseWZwZ1p3Rno1eUNrbXQveXBOekEvSW5acXZx?=
 =?utf-8?B?RWx3cWhkRitpZXFUWjFWSys3S2psV3lybnU5RUZ3VkQ5ZnFCQlBCTGNRM3pR?=
 =?utf-8?B?d244RkNWQjNzZURwNzl3TndUWjZMeklDTHBsaUlWYlllRFlmRnZDZjkwQnRw?=
 =?utf-8?B?ZUg4TC9qbmtEMDFZTnRhTmxwWThwWTRXTk1Zc2pZdmF3dmUwWFhuUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pDjGK07lkBfifE0dW4inRWDP7eipkh1q1M7ce09mZWIE1OKZ0nooomA/+H2+Dsc6/ZDECtTDpht95PoqnupmXURXK9PO3H14lz1zMo53QqlB9gjgPZO0VI+Nsy1oa4Yp63B4aODE1Cq8uCCfT6SHozeRRaUzNWSueTVxnNIHIKsipZlQ1hFTXvv4aJ+GjpSdpkJGt0mqebzu9iIwRhnI7uV1G+B2fP1/U6HO6xC4qOFeGTc6O5cDKKa3/OBkKHchci5d5r+zulXUzLTwEercyu+hTyweO1wqEyMyNGcnByyOfuLrxm+njFAof07r9RNhep58o34LmkdoVbfXa/8Jxg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61a6499-aa12-42f9-e805-08de9c5e43a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 08:49:40.8462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ARavw6Tj4KBlvQBuoqT7XqYp6B9STsCMKuiuhRiqD2IsxTjZHjaInRvi9JOrskHwlLx/09WHa8WFwj4+g3SAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVybmF0b3dpY3osIE1h
cmNpbiA8bWFyY2luLmJlcm5hdG93aWN6QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5
LCBBcHJpbCAxNywgMjAyNiAxMjo1MSBQTQ0KPiBUbzogR290ZSwgTml0aW4gUiA8bml0aW4uci5n
b3RlQGludGVsLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBrYW1p
bC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRlc3Rz
L2ludGVsL3hlX2NvbmZpZ2ZzOiBTa2lwIGN0eC1yZXN0b3JlIHN1YnRlc3RzIG9uDQo+IHBsYXRm
b3JtcyB3aXRob3V0IFJDUw0KPiANCj4gDQo+IE9uIDQvMTYvMjAyNiAxMDozMCBBTSwgTml0aW4g
R290ZSB3cm90ZToNCj4gPiBUaGUgY3R4LXJlc3RvcmUtcG9zdC1iYiBhbmQgY3R4LXJlc3RvcmUt
bWlkLWJiIHN1YnRlc3RzIGluamVjdCBhIGJhdGNoDQo+ID4gYnVmZmVyIHZpYSBjb25maWdmcyB1
c2luZyB0aGUgInJjcyIgKHJlbmRlcikgZW5naW5lIGNsYXNzLiBIb3dldmVyLA0KPiA+IHBsYXRm
b3JtcyBsaWtlIENSSSwgUFZDIGRvbid0IGhhdmUgcmVuZGVyLiBUaGUgQkIgaXMgc3RvcmVkIHZp
YQ0KPiA+IGNvbmZpZ2ZzIGJ1dCBuZXZlciBpbmplY3RlZCBpbnRvIGFueSBlbmdpbmUncyBMUkMs
IGNhdXNpbmcgdGhlDQo+ID4gc3Vic2VxdWVudCByZWdpc3RlciByZWFkYmFjayB0byBmYWlsLg0K
PiA+DQo+ID4gRml4IGJ5IGFkZGluZyBydW50aW1lIGRldGVjdGlvbiBvZiB0aGUgcmVuZGVyIGVu
Z2luZSB1c2luZw0KPiA+IHhlX2Zvcl9lYWNoX2VuZ2luZSgpIGFuZCBza2lwIHRoZSBjdHgtcmVz
dG9yZSBzdWJ0ZXN0cyB3aXRoDQo+ID4gaWd0X3JlcXVpcmVfZihoYXNfcmNzKSBvbiBwbGF0Zm9y
bXMgd2l0aG91dCBhIHJlbmRlciBlbmdpbmUgaW5zdGVhZCBvZg0KPiA+IGZhaWxpbmcgc2lsZW50
bHkuDQo+ID4NCj4gPiBDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXgu
aW50ZWwuY29tPg0KPiA+IEZpeGVzOiBiNmFiZGMyNmUwMWIgKCJ0ZXN0cy9pbnRlbC94ZV9jb25m
aWdmczogQ2hlY2sNCj4gPiBjdHhfcmVzdG9yZV9wb3N0X2JiIikNCj4gPiBTaWduZWQtb2ZmLWJ5
OiBOaXRpbiBHb3RlIDxuaXRpbi5yLmdvdGVAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVz
dHMvaW50ZWwveGVfY29uZmlnZnMuYyB8IDEyICsrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRl
bC94ZV9jb25maWdmcy5jIGIvdGVzdHMvaW50ZWwveGVfY29uZmlnZnMuYw0KPiA+IGluZGV4IDc1
NTUyNGU3Yy4uNDQ1ZjM1NDMxIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2NvbmZp
Z2ZzLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9jb25maWdmcy5jDQo+ID4gQEAgLTM2NCwx
MiArMzY0LDIyIEBAIGludCBpZ3RfbWFpbigpDQo+ID4gICAJaW50IGZkLCBjb25maWdmc19mZCwg
Y29uZmlnZnNfZGV2aWNlX2ZkOw0KPiA+ICAgCXVpbnQzMl90IGRldmlkOw0KPiA+ICAgCWJvb2wg
aXNfdmZfZGV2aWNlOw0KPiA+ICsJYm9vbCBoYXNfcmNzID0gZmFsc2U7DQo+ID4NCj4gPiAgIAlp
Z3RfZml4dHVyZSgpIHsNCj4gPiArCQlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZSAqaHdlOw0KPiA+ICsNCj4gPiAgIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsN
Cj4gPiAgIAkJZGV2aWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGZkKTsNCj4gPiAgIAkJaXNfdmZf
ZGV2aWNlID0gaW50ZWxfaXNfdmZfZGV2aWNlKGZkKTsNCj4gPiAgIAkJc2V0X2J1c19hZGRyKGZk
KTsNCj4gPiArDQo+ID4gKwkJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBod2UpDQo+ID4gKwkJCWlm
IChod2UtPmVuZ2luZV9jbGFzcyA9PQ0KPiBEUk1fWEVfRU5HSU5FX0NMQVNTX1JFTkRFUikgew0K
PiA+ICsJCQkJaGFzX3JjcyA9IHRydWU7DQo+ID4gKwkJCQlicmVhazsNCj4gPiArCQkJfQ0KPiA+
ICsNCj4gRG9lcyBpdCBtZWFuIHRoZSBmZWF0dXJlIGlzIGRlc2lnbmVkIGFuZCB1c2VkIGZvciBS
Q1Mgb25seSA/DQoNCk5vLCB0aGUgZmVhdHVyZSBpcyBub3QgUkNTIG9ubHk7IHRoZSBrZXJuZWwg
Y29uZmlnZnMgaW50ZXJmYWNlIHN1cHBvcnRzIGFueSBlbmdpbmUgY2xhc3MgKHJjcywgY2NzLCBi
Y3MpLiANCkluaXRpYWxseSwgSSB0aG91Z2h0IGl0IHdhcyBlbmdpbmUtc3BlY2lmaWMgc2luY2Ug
InJjcyIgaXMgaGFyZGNvZGVkIGluIHRoZSB0ZXN0LCBidXQgdGhlIHJlZ2lzdGVycyB1c2VkICgw
eDRGMTAwLzB4NEYxMDQpIGFyZSBnbG9iYWwgR1Qgc2NyYXRjaCBhY2Nlc3NpYmxlIGZyb20gYW55
IGVuZ2luZS4gDQpJIHdpbGwgc2VuZCB2MiB0aGF0IGR5bmFtaWNhbGx5IHNlbGVjdHMgYW4gYXZh
aWxhYmxlIGVuZ2luZSBzbyBpdCB3b3JrcyBvbiBhbGwgcGxhdGZvcm1zLg0KDQpUaGFua3MsDQot
IE5pdGluDQoNCj4gPiAgIAkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+ID4NCj4gPiAgIAkJY29u
ZmlnZnNfZmQgPSBpZ3RfY29uZmlnZnNfb3BlbigieGUiKTsgQEAgLTQxOCw2ICs0MjgsNyBAQCBp
bnQNCj4gPiBpZ3RfbWFpbigpDQo+ID4gICAJaWd0X2Rlc2NyaWJlKCJWYWxpZGF0ZSBjdHhfcmVz
dG9yZV9wb3N0X2JiIik7DQo+ID4gICAJaWd0X3N1YnRlc3QoImN0eC1yZXN0b3JlLXBvc3QtYmIi
KSB7DQo+ID4gICAJCWlndF9za2lwX29uX2YoaXNfdmZfZGV2aWNlLCAiTU1JTyByZWdpc3RlciBy
ZWFkYmFjayBub3QNCj4gcG9zc2libGUNCj4gPiBvbiBWRlxuIik7DQo+ID4gKwkJaWd0X3JlcXVp
cmVfZihoYXNfcmNzLCAiUGxhdGZvcm0gaGFzIG5vIHJlbmRlciBlbmdpbmVcbiIpOw0KPiA+ICAg
CQljb25maWdmc19kZXZpY2VfZmQgPSBjcmVhdGVfZGV2aWNlX2NvbmZpZ2ZzX2dyb3VwKGNvbmZp
Z2ZzX2ZkKTsNCj4gPiAgIAkJdGVzdF9jdHhfcmVzdG9yZShjb25maWdmc19kZXZpY2VfZmQsICJw
b3N0Iik7DQo+ID4gICAJCWNsb3NlX2NvbmZpZ2ZzX2dyb3VwKGNvbmZpZ2ZzX2ZkLCBjb25maWdm
c19kZXZpY2VfZmQpOyBAQCAtDQo+IDQzNCw2DQo+ID4gKzQ0NSw3IEBAIGludCBpZ3RfbWFpbigp
DQo+ID4gICAJaWd0X2Rlc2NyaWJlKCJWYWxpZGF0ZSBjdHhfcmVzdG9yZV9taWRfYmIiKTsNCj4g
PiAgIAlpZ3Rfc3VidGVzdCgiY3R4LXJlc3RvcmUtbWlkLWJiIikgew0KPiA+ICAgCQlpZ3Rfc2tp
cF9vbl9mKGlzX3ZmX2RldmljZSwgIk1NSU8gcmVnaXN0ZXIgcmVhZGJhY2sgbm90DQo+IHBvc3Np
YmxlDQo+ID4gb24gVkZcbiIpOw0KPiA+ICsJCWlndF9yZXF1aXJlX2YoaGFzX3JjcywgIlBsYXRm
b3JtIGhhcyBubyByZW5kZXIgZW5naW5lXG4iKTsNCj4gPiAgIAkJY29uZmlnZnNfZGV2aWNlX2Zk
ID0gY3JlYXRlX2RldmljZV9jb25maWdmc19ncm91cChjb25maWdmc19mZCk7DQo+ID4gICAJCXRl
c3RfY3R4X3Jlc3RvcmUoY29uZmlnZnNfZGV2aWNlX2ZkLCAibWlkIik7DQo+ID4gICAJCWNsb3Nl
X2NvbmZpZ2ZzX2dyb3VwKGNvbmZpZ2ZzX2ZkLCBjb25maWdmc19kZXZpY2VfZmQpOw0K
